/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
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
#define YYBISON_VERSION "2.7"

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


/* Line 371 of yacc.c  */
#line 105 "type.ec"

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
/* Line 387 of yacc.c  */
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


/* Line 387 of yacc.c  */
#line 302 "type.ec"
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
#line 343 "type.ec"

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
#define YYFINAL  103
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9270

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  146
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  124
/* YYNRULES -- Number of rules.  */
#define YYNRULES  509
/* YYNRULES -- Number of states.  */
#define YYNSTATES  869

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
       2,     2,     2,   135,     2,     2,   127,   137,   132,     2,
     124,   125,   121,   133,   131,   134,   128,   136,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   141,   143,
     122,   142,   123,   140,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   129,     2,   130,   138,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   144,   139,   145,   126,     2,     2,     2,
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
     600,   602,   604,   606,   608,   610,   613,   615,   617,   619,
     621,   623,   625,   630,   632,   635,   639,   646,   652,   654,
     656,   658,   660,   662,   664,   666,   668,   670,   672,   674,
     676,   678,   680,   682,   684,   686,   688,   690,   692,   694,
     696,   698,   700,   705,   710,   715,   717,   719,   721,   723,
     725,   727,   729,   731,   733,   735,   737,   739,   741,   743,
     745,   747,   749,   751,   753,   755,   757,   759,   761,   766,
     771,   776,   778,   784,   789,   794,   798,   804,   811,   817,
     823,   828,   835,   838,   841,   845,   849,   851,   854,   856,
     859,   861,   863,   865,   869,   873,   877,   881,   883,   887,
     889,   891,   893,   896,   900,   902,   906,   916,   926,   934,
     942,   948,   959,   970,   979,   988,   995,  1004,  1013,  1020,
    1027,  1032,  1042,  1052,  1060,  1068,  1074,  1078,  1081,  1084,
    1087,  1089,  1092,  1094,  1096,  1098,  1102,  1104,  1107,  1110,
    1114,  1120,  1123,  1126,  1131,  1137,  1145,  1153,  1159,  1161,
    1165,  1167,  1171,  1174,  1179,  1183,  1186,  1190,  1194,  1198,
    1203,  1208,  1211,  1215,  1219,  1224,  1228,  1231,  1235,  1239,
    1244,  1246,  1248,  1251,  1254,  1257,  1261,  1263,  1265,  1268,
    1271,  1274,  1278,  1280,  1283,  1287,  1290,  1292,  1296,  1301,
    1305,  1310,  1312,  1315,  1318,  1322,  1326,  1329,  1333,  1337,
    1340,  1342,  1344,  1347,  1350,  1352,  1355,  1358,  1362,  1366,
    1368,  1371,  1373,  1376,  1379,  1383,  1385,  1389,  1391,  1395,
    1398,  1401,  1404,  1408,  1410,  1412,  1414,  1418,  1420,  1423,
    1425,  1428,  1430,  1434,  1439,  1441,  1443,  1445,  1449,  1451,
    1453,  1455,  1457,  1459,  1461,  1465,  1470,  1474,  1476,  1479,
    1481,  1484,  1487,  1489,  1491,  1494,  1496,  1499,  1503,  1505,
    1508,  1514,  1522,  1528,  1534,  1542,  1549,  1557,  1562,  1568,
    1573,  1577,  1580,  1583,  1586,  1590,  1592,  1598,  1603,  1609,
    1614,  1619,  1623,  1628,  1632,  1636,  1639,  1642,  1645,  1648,
    1651,  1654,  1657,  1660,  1663,  1667,  1669,  1671,  1675,  1678,
    1680,  1682,  1685,  1688,  1690,  1693,  1695,  1697,  1700,  1702
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     269,     0,    -1,   156,   121,    -1,   156,   122,    -1,   156,
       1,    -1,   151,    -1,   156,   156,    -1,    28,    -1,   150,
      -1,   150,   122,   210,   123,    -1,   150,   122,   210,    11,
      -1,   186,   229,    -1,   229,    -1,   186,   124,   125,    -1,
     126,   186,   124,   125,    -1,    79,   186,   229,    -1,    79,
     229,    -1,     3,    -1,   158,    -1,   124,   180,   125,    -1,
     156,    -1,   259,    -1,     4,    -1,   119,    -1,   256,    -1,
     127,   256,    -1,   127,   256,   128,   256,    -1,   124,   125,
      -1,    72,   186,   226,   129,   181,   130,    -1,    72,   186,
     129,   181,   130,    -1,   103,   186,   226,   129,   181,   130,
      -1,   103,   186,   129,   181,   130,    -1,    73,   181,   189,
     226,   129,   181,   130,    -1,    73,   181,   189,   129,   181,
     130,    -1,   104,   181,   189,   226,   129,   181,   130,    -1,
     104,   181,   189,   129,   181,   130,    -1,     1,    -1,   157,
      -1,   159,   129,   180,   130,    -1,   159,   124,   125,    -1,
     159,   124,   161,   125,    -1,   159,   128,   156,    -1,   159,
     156,    -1,   159,     7,   156,    -1,   159,     8,    -1,   159,
       9,    -1,   260,    -1,   178,    -1,   160,    -1,   161,   131,
     178,    -1,   161,   131,   160,    -1,     8,   163,    -1,     9,
     163,    -1,   164,   165,    -1,     6,   163,    -1,     6,   124,
     241,   125,    -1,   110,   163,    -1,   110,   124,   241,   125,
      -1,   162,    -1,   159,    -1,   132,    -1,   121,    -1,   133,
      -1,   134,    -1,   126,    -1,   135,    -1,    74,    -1,   163,
      -1,   124,   240,   125,   165,    -1,   165,    -1,   166,   121,
     165,    -1,   166,   136,   165,    -1,   166,   137,   165,    -1,
     166,    -1,   167,   133,   166,    -1,   167,   134,   166,    -1,
     167,    -1,   168,    10,   167,    -1,   168,    11,   167,    -1,
     170,   122,    -1,   168,    -1,   169,   168,    -1,   170,   123,
     168,    -1,   170,    12,   168,    -1,   170,    13,   168,    -1,
     170,    -1,   171,    14,   170,    -1,   171,    15,   170,    -1,
     171,    -1,   172,   132,   171,    -1,   172,    -1,   173,   138,
     172,    -1,   173,    -1,   174,   139,   173,    -1,   174,    -1,
     175,    16,   174,    -1,   175,    -1,   176,    17,   175,    -1,
     176,    -1,   176,   140,   180,   141,   177,    -1,   177,    -1,
     163,   179,   178,    -1,   163,   179,   160,    -1,   142,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     178,    -1,   180,   131,   178,    -1,   177,    -1,   185,   143,
      -1,   185,   190,   143,    -1,   257,   143,    -1,    78,   156,
     142,   181,   143,    -1,   201,    -1,   183,   201,    -1,   202,
      -1,   183,   202,    -1,   220,    -1,   183,   220,    -1,   204,
      -1,   183,   204,    -1,   201,    -1,   184,   201,    -1,   202,
      -1,   184,   202,    -1,   147,    -1,   184,   147,    -1,   220,
      -1,   184,   220,    -1,   204,    -1,   184,   204,    -1,   192,
      -1,   185,   192,    -1,   201,    -1,   185,   201,    -1,   202,
      -1,   185,   202,    -1,   220,    -1,   185,   220,    -1,   204,
      -1,   185,   204,    -1,   192,    -1,   186,   192,    -1,   201,
      -1,   186,   201,    -1,   202,    -1,   186,   202,    -1,   147,
      -1,   186,   147,    -1,   204,    -1,   186,   204,    -1,   220,
      -1,   186,   220,    -1,   186,    -1,   148,    -1,   192,    -1,
     188,   192,    -1,   201,    -1,   188,   201,    -1,   203,    -1,
     188,   203,    -1,   156,    -1,   188,   156,    -1,   156,   122,
     210,   123,    -1,   188,   156,   122,   210,   123,    -1,   192,
      -1,   189,   192,    -1,   201,    -1,   189,   201,    -1,   203,
      -1,   189,   203,    -1,   204,    -1,   189,   204,    -1,   220,
      -1,   189,   220,    -1,   156,    -1,   189,   156,    -1,   156,
     122,   210,   123,    -1,   189,   156,   122,   210,   123,    -1,
     191,    -1,   190,   131,   191,    -1,   227,    -1,   227,   142,
     242,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   118,    -1,    75,    -1,    76,    -1,   199,    -1,
     195,    -1,    80,    -1,   111,    -1,   112,    -1,   199,    -1,
     195,   199,    -1,     3,    -1,    28,    -1,    76,    -1,    75,
      -1,    46,    -1,   196,    -1,   196,   124,   180,   125,    -1,
     197,    -1,   198,   197,    -1,   198,   131,   197,    -1,   194,
     124,   124,   198,   125,   125,    -1,   194,   124,   124,   125,
     125,    -1,   193,    -1,    46,    -1,    47,    -1,   200,    -1,
      48,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,    49,    -1,    41,    -1,
      44,    -1,    45,    -1,    42,    -1,    43,    -1,    86,    -1,
     114,    -1,   113,    -1,   205,    -1,   219,    -1,   149,    -1,
      88,   124,   178,   125,    -1,   101,   124,   149,   125,    -1,
     101,   124,   156,   125,    -1,    68,    -1,    83,    -1,    84,
      -1,    48,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    39,    -1,    40,    -1,    49,    -1,    41,
      -1,    44,    -1,    45,    -1,    42,    -1,    43,    -1,    86,
      -1,   114,    -1,   113,    -1,   205,    -1,   219,    -1,   151,
      -1,    88,   124,   178,   125,    -1,   101,   124,   149,   125,
      -1,   101,   124,   156,   125,    -1,    68,    -1,   211,   156,
     144,   212,   145,    -1,   211,   144,   212,   145,    -1,   211,
     156,   144,   145,    -1,   211,   144,   145,    -1,   211,   150,
     144,   212,   145,    -1,   211,   193,   156,   144,   212,   145,
      -1,   211,   193,   144,   212,   145,    -1,   211,   193,   156,
     144,   145,    -1,   211,   193,   144,   145,    -1,   211,   193,
     151,   144,   212,   145,    -1,   211,   156,    -1,   211,   151,
      -1,   211,   193,   156,    -1,   211,   193,   151,    -1,   186,
      -1,   186,   225,    -1,   186,    -1,   186,   225,    -1,   168,
      -1,   208,    -1,   207,    -1,   156,   142,   208,    -1,   156,
     142,   207,    -1,   206,   142,   208,    -1,   206,   142,   207,
      -1,   209,    -1,   210,   131,   209,    -1,    50,    -1,    51,
      -1,   216,    -1,   212,   216,    -1,   159,   142,   243,    -1,
     213,    -1,   214,   131,   213,    -1,    69,   188,   156,   144,
      70,   251,    71,   251,   145,    -1,    69,   188,   156,   144,
      71,   251,    70,   251,   145,    -1,    69,   188,   156,   144,
      70,   251,   145,    -1,    69,   188,   156,   144,    71,   251,
     145,    -1,    69,   188,   156,   144,   145,    -1,    69,   188,
     225,   156,   144,    70,   251,    71,   251,   145,    -1,    69,
     188,   225,   156,   144,    71,   251,    70,   251,   145,    -1,
      69,   188,   225,   156,   144,    70,   251,   145,    -1,    69,
     188,   225,   156,   144,    71,   251,   145,    -1,    69,   188,
     225,   156,   144,   145,    -1,    69,   188,   144,    70,   251,
      71,   251,   145,    -1,    69,   188,   144,    71,   251,    70,
     251,   145,    -1,    69,   188,   144,    70,   251,   145,    -1,
      69,   188,   144,    71,   251,   145,    -1,    69,   188,   144,
     145,    -1,    69,   188,   225,   144,    70,   251,    71,   251,
     145,    -1,    69,   188,   225,   144,    71,   251,    70,   251,
     145,    -1,    69,   188,   225,   144,    70,   251,   145,    -1,
      69,   188,   225,   144,    71,   251,   145,    -1,    69,   188,
     225,   144,   145,    -1,   186,   217,   143,    -1,   186,   143,
      -1,   259,   143,    -1,   258,   143,    -1,   261,    -1,   214,
     143,    -1,   215,    -1,   143,    -1,   218,    -1,   217,   131,
     218,    -1,   233,    -1,   233,   199,    -1,   141,   181,    -1,
     233,   141,   181,    -1,   233,   141,   181,   141,   181,    -1,
      52,   156,    -1,    52,   151,    -1,    52,   144,   221,   145,
      -1,    52,   156,   144,   221,   145,    -1,    52,   156,   144,
     221,   143,   212,   145,    -1,    52,   151,   144,   221,   143,
     212,   145,    -1,    52,   151,   144,   221,   145,    -1,   222,
      -1,   221,   131,   222,    -1,   156,    -1,   156,   142,   181,
      -1,   156,   195,    -1,   156,   195,   142,   181,    -1,   124,
     225,   125,    -1,   129,   130,    -1,   129,   181,   130,    -1,
     129,   149,   130,    -1,   223,   129,   130,    -1,   223,   129,
     181,   130,    -1,   223,   129,   149,   130,    -1,   124,   125,
      -1,   124,   236,   125,    -1,   223,   124,   125,    -1,   223,
     124,   236,   125,    -1,   124,   226,   125,    -1,   124,   125,
      -1,   124,   236,   125,    -1,   224,   124,   125,    -1,   224,
     124,   236,   125,    -1,   235,    -1,   223,    -1,   235,   223,
      -1,   193,   235,    -1,   193,   223,    -1,   193,   235,   223,
      -1,   235,    -1,   224,    -1,   235,   224,    -1,   193,   235,
      -1,   193,   224,    -1,   193,   235,   224,    -1,   232,    -1,
     235,   232,    -1,   193,   235,   232,    -1,   227,   193,    -1,
     156,    -1,   124,   227,   125,    -1,   228,   129,   181,   130,
      -1,   228,   129,   130,    -1,   228,   129,   149,   130,    -1,
     231,    -1,   235,   231,    -1,   193,   231,    -1,   193,   235,
     231,    -1,   235,   193,   231,    -1,   228,   124,    -1,   230,
     236,   125,    -1,   230,   239,   125,    -1,   230,   125,    -1,
     231,    -1,   228,    -1,   193,   231,    -1,   193,   228,    -1,
     228,    -1,   235,   228,    -1,   193,   228,    -1,   193,   235,
     228,    -1,   235,   193,   228,    -1,   201,    -1,   234,   201,
      -1,   121,    -1,   121,   234,    -1,   121,   235,    -1,   121,
     234,   235,    -1,   237,    -1,   237,   131,    53,    -1,   238,
      -1,   237,   131,   238,    -1,   186,   227,    -1,   186,   225,
      -1,   186,   132,    -1,   186,   132,   227,    -1,   187,    -1,
      67,    -1,   156,    -1,   239,   131,   156,    -1,   183,    -1,
     183,   225,    -1,   184,    -1,   184,   225,    -1,   178,    -1,
     144,   244,   145,    -1,   144,   244,   131,   145,    -1,   177,
      -1,   160,    -1,   242,    -1,   244,   131,   242,    -1,   246,
      -1,   251,    -1,   252,    -1,   253,    -1,   254,    -1,   255,
      -1,   156,   141,   245,    -1,    54,   181,   141,   245,    -1,
      55,   141,   245,    -1,   182,    -1,   247,   182,    -1,   245,
      -1,   248,   245,    -1,   248,   182,    -1,   248,    -1,   247,
      -1,   247,   248,    -1,   144,    -1,   144,   145,    -1,   250,
     249,   145,    -1,   143,    -1,   180,   143,    -1,    56,   124,
     180,   125,   245,    -1,    56,   124,   180,   125,   245,    66,
     245,    -1,    57,   124,   180,   125,   245,    -1,    58,   124,
     180,   125,   245,    -1,    59,   245,    58,   124,   180,   125,
     143,    -1,    60,   124,   252,   252,   125,   245,    -1,    60,
     124,   252,   252,   180,   125,   245,    -1,    58,   124,   125,
     245,    -1,    60,   124,   252,   125,   245,    -1,    60,   124,
     125,   245,    -1,    61,   156,   143,    -1,    62,   143,    -1,
      63,   143,    -1,    64,   143,    -1,    64,   180,   143,    -1,
       5,    -1,   185,   156,   144,   268,   145,    -1,   185,   156,
     144,   145,    -1,   186,   156,   144,   268,   145,    -1,   186,
     156,   144,   145,    -1,   149,   144,   268,   145,    -1,   149,
     144,   145,    -1,   156,   144,   268,   145,    -1,   156,   144,
     145,    -1,   144,   268,   145,    -1,   144,   145,    -1,   152,
     251,    -1,   155,   251,    -1,   155,   143,    -1,   153,   251,
      -1,   154,   251,    -1,   185,   229,    -1,   185,   233,    -1,
     262,   251,    -1,   159,   142,   243,    -1,   243,    -1,   264,
      -1,   265,   131,   264,    -1,   265,   143,    -1,   266,    -1,
     263,    -1,   267,   266,    -1,   267,   263,    -1,   143,    -1,
     267,   143,    -1,   267,    -1,   265,    -1,   267,   265,    -1,
     238,    -1,   238,   141,   181,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   232,   232,   250,   274,   314,   315,   342,   346,   347,
     348,   365,   367,   372,   377,   382,   384,   389,   394,   395,
     400,   402,   404,   406,   407,   409,   410,   411,   414,   415,
     416,   417,   418,   419,   420,   421,   422,   426,   427,   428,
     429,   430,   431,   444,   445,   446,   450,   479,   480,   481,
     482,   486,   487,   488,   490,   491,   493,   494,   498,   499,
     508,   509,   510,   511,   512,   513,   514,   518,   519,   523,
     524,   525,   526,   530,   531,   532,   536,   537,   538,   542,
     550,   551,   552,   553,   554,   558,   559,   560,   564,   565,
     569,   570,   574,   575,   579,   580,   584,   585,   589,   590,
     594,   595,   596,   600,   601,   602,   603,   604,   605,   606,
     607,   608,   609,   610,   614,   615,   619,   623,   624,   625,
     626,   630,   631,   632,   633,   634,   635,   636,   637,   641,
     642,   643,   644,   645,   646,   647,   648,   649,   650,   654,
     655,   656,   657,   658,   659,   660,   661,   662,   663,   667,
     668,   669,   670,   671,   672,   673,   674,   675,   676,   677,
     678,   682,   683,   687,   688,   689,   690,   691,   692,   693,
     694,   695,   703,   712,   713,   714,   715,   716,   717,   718,
     719,   720,   721,   722,   723,   724,   732,   741,   742,   746,
     747,   751,   752,   753,   754,   755,   756,   760,   761,   762,
     763,   767,   768,   769,   773,   774,   777,   778,   779,   780,
     781,   785,   786,   790,   791,   792,   796,   797,   801,   805,
     806,   807,   812,   813,   814,   815,   816,   817,   818,   819,
     820,   821,   822,   823,   824,   825,   826,   827,   828,   829,
     830,   831,   832,   833,   834,   835,   836,   837,   841,   842,
     843,   844,   845,   846,   847,   848,   849,   850,   851,   852,
     853,   854,   855,   856,   857,   858,   859,   860,   861,   862,
     863,   864,   869,   870,   871,   872,   873,   876,   877,   878,
     879,   880,   885,   886,   889,   891,   896,   897,   902,   903,
     914,   918,   920,   921,   923,   924,   950,   967,   968,   972,
     973,   977,   978,   982,   986,   987,   991,   993,   995,   997,
     999,  1002,  1004,  1006,  1008,  1010,  1013,  1015,  1017,  1019,
    1021,  1024,  1026,  1028,  1030,  1032,  1037,  1038,  1039,  1040,
    1041,  1042,  1043,  1044,  1048,  1050,  1055,  1057,  1059,  1061,
    1063,  1068,  1069,  1073,  1075,  1076,  1077,  1078,  1082,  1084,
    1089,  1091,  1093,  1094,  1098,  1100,  1102,  1104,  1106,  1108,
    1110,  1112,  1114,  1116,  1118,  1123,  1125,  1127,  1129,  1131,
    1136,  1137,  1138,  1139,  1140,  1141,  1145,  1146,  1147,  1148,
    1149,  1150,  1196,  1197,  1199,  1201,  1206,  1208,  1210,  1212,
    1214,  1219,  1220,  1223,  1225,  1227,  1233,  1237,  1239,  1241,
    1246,  1247,  1248,  1250,  1255,  1256,  1257,  1258,  1259,  1263,
    1264,  1268,  1269,  1270,  1271,  1275,  1276,  1280,  1281,  1285,
    1286,  1287,  1288,  1289,  1300,  1325,  1326,  1330,  1331,  1335,
    1336,  1340,  1342,  1344,  1360,  1362,  1384,  1386,  1391,  1392,
    1393,  1394,  1395,  1396,  1400,  1402,  1404,  1409,  1410,  1414,
    1415,  1418,  1422,  1423,  1424,  1428,  1432,  1440,  1445,  1446,
    1450,  1451,  1452,  1456,  1457,  1458,  1459,  1461,  1462,  1463,
    1467,  1468,  1469,  1470,  1471,  1475,  1479,  1481,  1486,  1488,
    1513,  1515,  1517,  1519,  1524,  1526,  1530,  1532,  1534,  1536,
    1538,  1544,  1546,  1551,  1556,  1557,  1561,  1563,  1568,  1573,
    1574,  1575,  1576,  1577,  1578,  1582,  1583,  1584,  1588,  1589
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
  "storage_class_specifier", "ext_decl", "_attrib", "multi_attrib",
  "attribute_word", "attribute", "attribs_list", "attrib", "ext_storage",
  "type_qualifier", "type_specifier", "strict_type_specifier",
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
  "type_unit", YY_NULL
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
     375,    42,    60,    62,    40,    41,   126,    36,    46,    91,
      93,    44,    38,    43,    45,    33,    47,    37,    94,   124,
      63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   146,   147,   147,   148,   149,   149,   150,   151,   151,
     151,   152,   152,   153,   154,   155,   155,   156,   157,   157,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   159,   159,   159,
     159,   159,   159,   159,   159,   159,   160,   161,   161,   161,
     161,   162,   162,   162,   162,   162,   162,   162,   163,   163,
     164,   164,   164,   164,   164,   164,   164,   165,   165,   166,
     166,   166,   166,   167,   167,   167,   168,   168,   168,   169,
     170,   170,   170,   170,   170,   171,   171,   171,   172,   172,
     173,   173,   174,   174,   175,   175,   176,   176,   177,   177,
     178,   178,   178,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   180,   180,   181,   182,   182,   182,
     182,   183,   183,   183,   183,   183,   183,   183,   183,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   185,
     185,   185,   185,   185,   185,   185,   185,   185,   185,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   187,   187,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   189,   189,   190,   190,   191,
     191,   192,   192,   192,   192,   192,   192,   193,   193,   193,
     193,   194,   194,   194,   195,   195,   196,   196,   196,   196,
     196,   197,   197,   198,   198,   198,   199,   199,   200,   201,
     201,   201,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   205,   205,   205,   205,   206,   206,   207,   207,
     208,   209,   209,   209,   209,   209,   209,   210,   210,   211,
     211,   212,   212,   213,   214,   214,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   216,   216,   216,   216,
     216,   216,   216,   216,   217,   217,   218,   218,   218,   218,
     218,   219,   219,   220,   220,   220,   220,   220,   221,   221,
     222,   222,   222,   222,   223,   223,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   224,   224,   224,   224,   224,
     225,   225,   225,   225,   225,   225,   226,   226,   226,   226,
     226,   226,   227,   227,   227,   227,   228,   228,   228,   228,
     228,   229,   229,   229,   229,   229,   230,   231,   231,   231,
     232,   232,   232,   232,   233,   233,   233,   233,   233,   234,
     234,   235,   235,   235,   235,   236,   236,   237,   237,   238,
     238,   238,   238,   238,   238,   239,   239,   240,   240,   241,
     241,   242,   242,   242,   243,   243,   244,   244,   245,   245,
     245,   245,   245,   245,   246,   246,   246,   247,   247,   248,
     248,   248,   249,   249,   249,   250,   251,   251,   252,   252,
     253,   253,   253,   254,   254,   254,   254,   254,   254,   254,
     255,   255,   255,   255,   255,   256,   257,   257,   258,   258,
     259,   259,   259,   259,   260,   260,   261,   261,   261,   261,
     261,   262,   262,   263,   264,   264,   265,   265,   266,   267,
     267,   267,   267,   267,   267,   268,   268,   268,   269,   269
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
       1,     1,     1,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     4,     1,     2,     3,     6,     5,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     1,     5,     4,     4,     3,     5,     6,     5,     5,
       4,     6,     2,     2,     3,     3,     1,     2,     1,     2,
       1,     1,     1,     3,     3,     3,     3,     1,     3,     1,
       1,     1,     2,     3,     1,     3,     9,     9,     7,     7,
       5,    10,    10,     8,     8,     6,     8,     8,     6,     6,
       4,     9,     9,     7,     7,     5,     3,     2,     2,     2,
       1,     2,     1,     1,     1,     3,     1,     2,     2,     3,
       5,     2,     2,     4,     5,     7,     7,     5,     1,     3,
       1,     3,     2,     4,     3,     2,     3,     3,     3,     4,
       4,     2,     3,     3,     4,     3,     2,     3,     3,     4,
       1,     1,     2,     2,     2,     3,     1,     1,     2,     2,
       2,     3,     1,     2,     3,     2,     1,     3,     4,     3,
       4,     1,     2,     2,     3,     3,     2,     3,     3,     2,
       1,     1,     2,     2,     1,     2,     2,     3,     3,     1,
       2,     1,     2,     2,     3,     1,     3,     1,     3,     2,
       2,     2,     3,     1,     1,     1,     3,     1,     2,     1,
       2,     1,     3,     4,     1,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     3,     4,     3,     1,     2,     1,
       2,     2,     1,     1,     2,     1,     2,     3,     1,     2,
       5,     7,     5,     5,     7,     6,     7,     4,     5,     4,
       3,     2,     2,     2,     3,     1,     5,     4,     5,     4,
       4,     3,     4,     3,     3,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     3,     1,     1,     3,     2,     1,
       1,     2,     2,     1,     2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   191,   192,   193,   194,   195,   223,   224,
     225,   226,   227,   228,   229,   231,   234,   235,   232,   233,
     219,   220,   222,   230,   299,   300,     0,   424,   245,   197,
     198,   201,   246,   247,   236,     0,     0,   202,   203,   238,
     237,   196,   155,   162,   241,     8,     5,     0,   161,   423,
     149,   218,     0,   200,   199,   221,   151,   153,   157,   239,
       0,   240,   159,   508,     0,     0,   342,   341,     0,     0,
       0,     4,     2,     3,     6,   411,     0,     0,   421,   156,
     386,   150,   218,   152,   154,   158,   160,   371,   420,   419,
     401,     0,   400,   382,   370,     0,   205,     0,     8,   283,
     282,     0,     0,     1,   350,     0,   348,     0,     0,    36,
      22,   475,     0,     0,     0,     0,     0,    66,     0,     0,
       0,    23,    61,     0,    64,     0,    60,    62,    63,    65,
       0,    20,    37,    18,    59,    58,    67,     0,    69,    73,
      76,    80,     0,    85,    88,    90,    92,    94,    96,    98,
     100,     0,    24,    21,     0,     0,   241,    20,    67,   290,
     288,     0,   292,   291,   297,     0,   409,   412,   413,   361,
       0,     0,     0,     0,   415,   417,   355,     0,   116,     0,
       0,   386,     0,   422,     0,   374,   403,   402,   373,     0,
       0,   385,   396,     0,   399,     0,     0,     0,     0,   372,
     383,     0,     0,     0,     0,     0,   333,   275,     0,     0,
       0,     0,    20,     0,     0,   218,     0,   304,     0,   332,
     301,     0,    12,   391,     0,     0,    21,   330,     0,     0,
       0,   285,   284,   509,     0,   352,   204,     0,   343,     0,
       0,     0,    54,     0,    51,    52,     0,     0,     0,     0,
       0,     0,    56,    27,   114,     0,   427,   121,   123,   127,
     125,     0,    25,     0,     0,     0,    44,    45,     0,     0,
       0,    42,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   103,     0,    53,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   242,   243,   244,     0,     0,
     218,   289,   370,     0,    10,     9,     0,   410,   414,   354,
     387,   362,     0,   357,   356,     0,   375,   384,   363,     0,
     358,     0,     0,   389,     0,     0,   397,   398,     0,   206,
     207,   210,   209,   208,     0,   211,   213,     0,   249,   250,
     251,   252,   253,   254,   255,   257,   260,   261,   258,   259,
     248,   256,     0,   271,   262,     0,     0,   264,   263,   267,
     169,     0,   163,   165,   167,   265,     0,   266,     0,    16,
      61,     0,    20,     0,   455,     0,   486,   489,   490,   488,
     487,     0,     0,     0,   327,   386,   218,     0,   334,   404,
      11,   336,     0,   393,     0,   273,   302,     0,   331,     0,
     392,   329,   328,     0,   274,     0,   280,     0,     0,     0,
     351,     0,   349,     0,   347,     0,   344,   133,    20,   429,
     129,   131,   137,   135,     0,     0,     0,   218,   377,     0,
     376,   183,     0,   173,   175,   177,   179,   181,     0,     0,
       0,     0,    19,     0,     0,   122,   124,   128,   126,   428,
       0,     0,   503,     0,   481,    59,   435,   434,     0,   139,
     141,   143,   147,   145,   495,    46,     0,   500,   496,   506,
     499,     0,     0,   483,     0,    43,    39,    48,     0,    47,
      41,     0,   102,   101,    70,    71,    72,    74,    75,    77,
      78,    83,    84,    82,    86,    87,    89,    91,    93,    95,
      97,     0,   288,   294,   293,   373,   296,   295,   298,   416,
     418,   364,   360,   359,   390,   388,   426,   217,     0,     0,
       0,   214,   342,   341,     0,     0,     0,     0,   170,   164,
     166,   168,     0,   282,     0,    15,   218,     0,   456,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   458,    20,     0,   447,     0,   449,   438,     0,     0,
       0,   439,   440,   441,   442,   443,     0,   303,    13,   338,
       0,   406,     0,     0,   326,     0,   337,     0,   405,   394,
     305,   395,   276,   272,   278,     0,   279,     0,   353,     0,
       0,   134,   130,   132,   138,   136,   430,    55,   366,     0,
       0,     0,   380,   379,     0,     0,   378,     0,     0,   184,
     174,   176,   178,   180,   182,     0,     0,     0,     0,     0,
      57,   115,    68,    26,   485,     0,     0,   386,   140,   142,
     144,   148,   146,   491,   492,   493,     0,   498,   504,   502,
     507,   501,   480,   482,    40,     0,    38,     0,   289,     0,
     216,   215,     0,     0,     0,     0,     0,     0,   320,     0,
       0,     0,     0,   285,   284,    14,     0,     0,     0,     0,
       0,     0,     0,     0,   471,   472,   473,     0,     0,     0,
     459,   117,   386,     0,   187,   189,   448,     0,   451,   450,
     457,   119,   479,     0,   407,     0,   335,   404,     0,   339,
     408,   281,   277,   346,   345,   365,   367,    29,   381,   368,
       0,     0,     0,     0,     0,     0,    31,     0,     0,     0,
     484,   494,   497,    50,    49,    99,   212,   268,   269,   270,
     171,     0,     0,     0,     0,     0,   310,     0,     0,   325,
       0,     0,   446,     0,     0,     0,     0,     0,     0,     0,
     470,   474,     0,   444,     0,     0,   118,     0,   478,   406,
       0,     0,   405,     0,   369,    28,   185,    33,     0,     0,
      30,    35,     0,     0,   318,     0,   319,   172,     0,     0,
       0,     0,     0,     0,   315,   445,     0,     0,   467,     0,
       0,   469,     0,     0,     0,   477,     0,   188,     0,   431,
     190,   407,   408,   340,   186,    32,    34,     0,     0,     0,
     308,     0,   309,     0,   323,     0,   324,     0,     0,   460,
     462,   463,     0,   468,     0,     0,   120,   476,   436,     0,
     316,   317,     0,     0,     0,     0,     0,   313,     0,   314,
       0,     0,   465,     0,     0,   432,   306,   307,   321,   322,
       0,     0,   461,   464,   466,   433,   437,   311,   312
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    42,    43,   130,    45,    46,   208,   209,   210,   211,
     131,   132,   133,   134,   466,   488,   135,   158,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149,   150,   254,   283,   563,   179,   698,   256,   429,   468,
     214,    49,   371,   442,   693,   694,    50,    51,    52,    53,
     345,   346,   347,    54,    55,    56,    57,   445,    58,    59,
     161,   162,   163,   164,   165,    60,   216,   217,   218,   219,
     220,   397,   398,    61,    62,   105,   106,    87,   438,   171,
     439,   172,   221,   222,    91,   223,    93,   401,   167,   224,
     173,   174,   175,   197,   261,   434,   810,   474,   839,   566,
     567,   568,   569,   570,   385,   571,   572,   573,   574,   575,
     152,   576,   225,   153,   475,   227,   476,   477,   478,   479,
     480,   481,   482,    64
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -767
static const yytype_int16 yypact[] =
{
    8879,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,  -767,    29,  -767,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,   -78,   -41,  -767,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,   -11,  -767,   265,  7282,  -767,
    -767,  -767,    -1,   212,  -767,  -767,  -767,  -767,  -767,  -767,
     409,  -767,  -767,   -28,   132,   141,    -9,   108,  6992,    82,
    6222,  -767,  -767,  -767,  -767,   572,  7387,  6636,   570,  -767,
     133,  -767,   155,  -767,  -767,  -767,  -767,   206,  -767,   421,
     410,  8297,  -767,  -767,   865,   121,  -767,  3666,   -30,  -767,
     126,    33,  6992,  -767,   257,    80,  -767,   141,   141,  -767,
    -767,  -767,  7033,  7141,  7141,  8970,  6992,  -767,  8970,  6992,
    7174,  -767,  -767,  6357,  -767,   148,  -767,  -767,  -767,  -767,
     146,    35,  -767,  -767,   423,  -767,   867,  6992,  -767,   170,
     372,   505,  6992,   645,   578,   185,   183,   225,   364,    12,
    -767,   259,  -767,  -767,   263,    49,   146,    65,  -767,   505,
    6100,   249,  -767,  -767,  -767,    19,  -767,   572,  -767,  -767,
     802,   273,   715,   275,   280,  -767,  -767,   -46,  -767,   297,
     570,  -767,   118,   421,   706,   206,   410,  -767,   865,  8396,
    6669,  -767,  -767,  6777,  -767,   348,   323,   189,    51,   206,
    -767,   491,  9061,  8594,  6580,  8970,  -767,  -767,   294,   294,
     294,   465,    50,   571,  5868,   118,  3793,  -767,   101,  -767,
    -767,   410,  -767,  -767,   706,   312,   314,  -767,  5469,  3920,
    4047,   315,   351,  -767,  6992,   310,  -767,   141,  -767,   154,
     230,  6357,  -767,  6810,  -767,  -767,   133,  7591,  9152,  7693,
    9152,  6357,  -767,  -767,  -767,   214,  8096,  -767,  -767,  -767,
    -767,   353,   365,  2806,  2951,   141,  -767,  -767,  2051,   141,
    6992,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,
    -767,  -767,  -767,  5278,  -767,  6992,  6992,  6992,  6992,  6992,
    6992,  6992,   505,  6992,  6992,  -767,  6992,  6992,  6992,  6992,
    6992,  6992,  6992,  6992,  6992,  -767,  -767,  -767,  6222,  7489,
     343,   366,   416,  6222,  -767,  -767,  6222,  -767,  -767,  -767,
    -767,  -767,  8788,  -767,  -767,   706,   206,  -767,  -767,   406,
    -767,   134,   411,  -767,   157,   419,  -767,  -767,   141,  -767,
    -767,  -767,  -767,  -767,   433,   437,  -767,    92,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,
    -767,  -767,    82,  -767,  -767,   447,   452,  -767,  -767,  -767,
     464,  5751,  -767,  -767,  -767,  -767,   804,  -767,  8594,  -767,
     572,  6492,   235,  8691,   443,  5190,  -767,  -767,  -767,  -767,
    -767,  5278,   610,  6992,  -767,   161,   118,   131,  -767,   410,
    -767,   334,   706,  -767,    51,  -767,  -767,  1250,  -767,    51,
    -767,  -767,  -767,  4174,  -767,  4301,  -767,  4428,  5469,  4555,
    -767,  6992,  -767,  5469,  -767,  5469,  -767,  -767,    50,  8096,
    -767,  -767,  -767,  -767,   473,  8198,  6992,   -31,   478,   475,
     487,   493,  7897,  -767,  -767,  -767,  -767,  -767,  6992,   495,
    7999,   507,  -767,  6992,   141,  -767,  -767,  -767,  -767,  -767,
    6992,   148,  -767,  3096,  -767,   633,  -767,  -767,  8594,  -767,
    -767,  -767,  -767,  -767,  -767,  -767,   294,  -767,  -767,   224,
    -767,  3241,   489,  -767,   494,  -767,  -767,  -767,   219,  -767,
    -767,   492,  -767,  -767,  -767,  -767,  -767,   170,   170,   372,
     372,   505,   505,   505,   645,   645,   578,   185,   183,   225,
     364,   -45,  7795,  -767,  -767,   416,  -767,  -767,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  6992,   519,
     603,  -767,  -767,  -767,  6992,    82,  6222,   -26,   -22,  -767,
    -767,  -767,    64,  -767,    82,  -767,   118,   531,  -767,  6992,
     479,   543,   547,   548,  2159,   551,   141,   533,   544,  5634,
     141,  -767,    25,   246,  -767,  5984,  -767,  -767,  2371,  2516,
     557,  -767,  -767,  -767,  -767,  -767,   555,  -767,  -767,  -767,
    3386,   410,    51,   514,  -767,  6992,  -767,    51,   410,  -767,
    -767,  -767,  -767,  -767,  -767,  4682,  -767,  4809,  -767,  4936,
    5063,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,   581,
     582,   566,   478,   487,  8495,  6992,   478,  6222,  6992,   590,
    -767,  -767,  -767,  -767,  -767,   585,   587,  6992,  6992,   596,
    -767,  -767,  -767,  -767,  -767,   583,  5278,   141,  -767,  -767,
    -767,  -767,  -767,  -767,  -767,  -767,  5278,  -767,  -767,  -767,
     224,  -767,  -767,  -767,  -767,  5278,  -767,  6992,  -767,   309,
    -767,  -767,   602,   605,    53,   172,   294,   294,  -767,  6222,
     -21,   -12,   588,  -767,  -767,  -767,   592,  2159,  6992,  6992,
    6851,   678,  5526,   595,  -767,  -767,  -767,   277,   598,  2159,
    -767,  -767,    74,   313,  -767,   697,  -767,  2661,  -767,  -767,
    -767,  -767,  -767,   597,   410,   118,  -767,   618,   706,   608,
     410,  -767,  -767,  -767,  -767,  -767,  -767,  -767,   478,  -767,
     625,   622,   181,   623,  6222,  6992,  -767,   626,   629,  6992,
    -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,  -767,
    -767,   -20,    -6,   243,   294,   294,  -767,   294,   294,  -767,
       1,  2159,  -767,   322,   349,  2159,   356,   639,  2159,  5600,
    -767,  -767,  6992,  -767,  3531,   570,  -767,  5334,  -767,   618,
      51,    51,   618,  6992,  -767,  -767,  -767,  -767,   270,   646,
    -767,  -767,   648,   294,  -767,   294,  -767,  -767,    -8,     9,
      -5,    11,   294,   294,  -767,  -767,  2159,  2159,  -767,  2159,
    6992,  -767,  2159,  6959,   637,  -767,   624,  -767,  5334,  -767,
    -767,   618,   618,  -767,  -767,  -767,  -767,   638,   640,   294,
    -767,   294,  -767,   294,  -767,   294,  -767,     3,   151,   718,
    -767,  -767,   379,  -767,  2159,   398,  -767,  -767,  -767,    91,
    -767,  -767,   649,   653,   655,   656,   294,  -767,   294,  -767,
    2159,   650,  -767,  2159,  1869,  -767,  -767,  -767,  -767,  -767,
     659,   665,  -767,  -767,  -767,  -767,  -767,  -767,  -767
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -767,   192,  -767,   744,   751,   201,  -767,  -767,  -767,  -767,
       0,  -767,  -767,   690,  -258,  -767,  -767,   220,  -767,  -124,
     339,   363,   -36,  -767,   332,   513,   516,   518,   520,   522,
    -767,  1625,   -48,  -767,   287,  1301,  -369,  -767,  -767,  -378,
     407,  -767,  -767,   573,  -767,    63,  1395,  1017,  -767,   725,
    -767,  -330,  -767,   -42,  -767,  1223,  1570,  -179,  1255,  -175,
    -767,   242,   251,   515,  -518,  -190,  -125,   426,  -767,  -767,
     -86,  -767,   253,  -161,  1300,   553,   600,   -79,  -416,   -13,
    -216,   -47,   278,  -195,  -767,   -39,   -72,   370,  -767,  1117,
     -87,  -767,     6,  -767,  -767,   593,  -766,  -377,  -767,   341,
    -767,  -767,   279,  -767,  -767,   -82,  -642,  -767,  -767,  -767,
    -120,  -767,  -767,   811,  -767,  -767,  -767,   367,   199,   368,
     371,  -767,  -262,  -767
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -506
static const yytype_int16 yytable[] =
{
      47,    89,   484,   185,   196,   262,    63,   565,   379,    92,
     487,    96,   376,   284,   577,   199,   564,   531,   665,   400,
     151,   612,   200,   374,   616,   492,    67,   375,     1,   303,
     314,   183,     1,   449,   159,    88,     1,    92,     1,    92,
     759,   377,   838,   187,   666,   667,    68,    74,    80,   744,
     745,   783,     1,     1,     1,    92,     1,     2,   747,   748,
     100,     2,   236,   819,   785,   104,   823,     1,     1,   155,
     157,   792,   793,   375,   846,   375,   170,     1,   181,   821,
      74,   825,   181,    69,   323,     1,   453,   377,   866,   377,
      75,   195,    70,   435,   181,   339,   657,   212,   263,   722,
     669,   232,   329,   413,   415,   417,   292,   104,   104,   326,
       2,    70,   200,   102,   228,   246,   327,   803,   246,   668,
     340,     1,   670,    95,   746,   784,   386,   387,   388,   390,
     406,    74,   103,   749,   271,   107,     1,   820,   341,   786,
     824,    92,   315,   187,     1,    92,   794,   311,   847,    92,
     316,   743,   304,   111,   822,    74,   826,    74,     1,   187,
     246,   494,   495,   496,     1,    92,   689,   342,   343,   264,
      74,    72,    73,    65,   307,   180,   403,   230,   739,   264,
     181,   376,   181,   545,   181,   410,    72,    73,   181,    47,
     565,   565,   541,    96,   264,    74,   375,   718,   181,   696,
     661,   635,   370,    80,   382,   246,   778,   308,   671,   264,
     377,   237,    74,   271,   395,   181,   212,   529,   764,   609,
     489,   848,   854,   530,   181,   238,   625,    66,   212,   212,
     212,   185,   407,   199,   629,   493,   855,   104,     1,    75,
      79,   428,   180,   459,   408,   201,    74,   246,   441,   246,
     441,   428,   108,   327,    72,    73,   454,   501,   502,   731,
     503,    99,   583,   622,   522,   485,    71,   375,     1,   490,
     229,   622,   159,   643,   584,   375,    75,   159,   263,    76,
     159,   377,    72,    73,    77,   237,    92,   524,   136,   377,
     263,   285,    31,   595,   597,   740,   849,   423,   599,   424,
     600,   263,   231,   316,   776,   580,   286,   287,   428,    47,
    -386,  -386,   316,   428,   337,  -386,   157,   299,   703,   565,
     338,   300,    47,    37,    38,   181,    90,   406,   520,   406,
     189,   406,   242,   244,   245,   190,   632,    31,   526,   452,
     252,   633,    92,   136,   654,   453,  -386,  -386,   610,    71,
     655,     1,    79,    92,    90,   646,    90,   403,   542,   586,
     186,   237,   533,   410,   301,   589,   787,   647,    37,    38,
     591,   538,    90,   425,   316,   426,   543,   453,    80,   264,
     302,   382,    74,   246,   305,   562,    72,    73,   306,   690,
      31,   313,   181,   814,   645,    74,   181,   733,   319,   234,
     321,   316,   181,   369,   181,   631,    79,    48,   453,   181,
     255,   322,     1,   212,    31,   212,   606,   212,   212,   212,
     761,    37,    38,   212,   136,   212,     1,   324,    74,   246,
     265,   266,   267,   427,   736,    47,   326,     2,   384,    79,
     453,    79,   619,   427,   765,    37,    38,   796,   336,   369,
     619,   369,   421,   453,    74,   411,   766,   412,    90,   418,
     186,   136,    90,   136,    75,   271,    90,   309,   637,    72,
      73,   136,    77,  -425,   797,   585,   186,   160,   460,  -425,
     453,   799,    90,    48,    29,    30,   662,   453,   136,    31,
     136,   255,   399,   461,   339,   419,    29,    30,    48,   658,
     159,    31,   806,   136,   851,   288,   289,   187,  -287,   406,
     453,   406,   246,   406,   406,   290,   291,     1,   695,   340,
      37,    38,   247,   853,   136,   249,    92,   720,   255,   453,
     255,   521,    37,    38,   192,   664,   157,   341,   255,   193,
     309,   523,   672,   589,   674,    77,   181,   268,   591,   525,
     513,   269,   270,    97,   562,   516,   683,   491,   527,   514,
     688,   528,    74,   532,   517,   692,   342,   343,   562,   562,
      79,   534,   369,     1,     1,    79,   535,    99,   265,   266,
     267,   159,   181,   181,   741,   742,   536,   181,   548,    29,
      30,   511,   297,   298,    31,   212,    48,   212,   607,   212,
     212,   136,   614,    90,   615,   136,   339,   734,   389,   384,
     378,   435,   383,     1,    47,   617,   344,   157,    20,    21,
     677,   601,   656,   453,   627,    37,    38,   497,   498,   504,
     505,   340,   630,   159,   652,    75,     1,    74,   180,   653,
     265,   266,   267,   369,   660,    29,    30,    29,    30,   341,
      31,   369,    31,   499,   500,   393,   675,   293,   294,    90,
     239,   240,   788,   789,    74,   790,   791,   678,   255,   157,
      90,   679,   680,   136,   581,   682,   684,   562,   342,   343,
     588,    37,    38,    37,    38,    29,    30,   685,   159,   562,
      31,    75,    74,    75,   180,   268,   717,   562,   701,   269,
     270,   817,   700,   818,    79,   181,   715,   716,   181,     1,
     827,   828,   724,   391,   725,   512,    48,   726,   695,   809,
     512,    37,    38,   160,   157,   729,    92,   737,   730,    48,
     738,    75,   750,   751,   180,   578,   757,   842,   760,   843,
     762,   844,   768,   845,    44,   673,   399,   193,   136,   773,
     774,   562,   775,   777,   136,   562,   780,   268,   562,   781,
     809,   269,   270,   800,   860,   181,   861,   295,   296,   837,
     181,   181,    29,    30,   136,   636,   815,    31,   816,   136,
     836,    29,    30,   840,   850,   841,    31,   213,   136,   136,
      29,    30,    44,   863,   856,    31,   562,   562,   857,   562,
     858,   859,   562,    71,   867,     1,   809,     1,    37,    38,
     868,    98,   506,   154,   156,   659,   507,    37,    38,   508,
      44,   177,   509,   450,   186,   510,    37,    38,   807,   235,
     180,   518,     2,   590,   562,    44,   706,   422,   644,   767,
     320,   156,    48,    90,   451,   732,   687,   697,   649,   650,
     562,     0,   651,   562,     0,     0,     0,     0,     0,    44,
     704,   707,    44,     0,     0,   710,     0,   156,     1,     0,
       0,     0,     0,     0,     0,   136,     0,  -386,  -386,    29,
      30,     0,  -386,     0,    31,   272,   273,   274,   275,   276,
     277,   278,   279,   280,   281,   681,     0,   136,   136,   136,
     136,     0,   136,     0,    44,     0,   213,     0,   226,   136,
     699,     0,     0,  -386,  -386,    37,    38,   136,   213,   213,
     213,     0,     0,    72,    73,     0,  -386,  -386,     0,     0,
       0,  -386,     0,    44,   331,     0,     0,   334,     0,     0,
      29,    30,     0,   160,     0,    31,     0,    44,     0,    44,
       0,     0,     0,   465,   465,     0,     0,     0,    44,     0,
     156,     0,     0,     0,     0,   753,   754,   756,     0,     0,
       0,   136,   156,   156,   156,   136,    37,    38,   136,   136,
       0,     0,     0,   769,     0,   156,   772,   136,     0,    76,
       0,    44,     0,    44,    77,   156,     0,     0,     0,     0,
      44,     0,     0,     0,     0,     0,     0,   156,   156,   282,
       0,     0,     0,     0,     0,     0,   136,   136,   752,   136,
     136,    48,   136,   136,   160,     0,     0,   226,   136,     0,
     763,     0,     0,     0,     0,     0,     0,     0,   699,   226,
     226,   226,     0,    90,     0,     0,     0,     0,   811,   812,
       0,     0,   156,    44,   136,     0,     0,   156,     0,     0,
     156,     0,     0,     0,     0,    82,    44,     0,     0,     0,
     136,     0,     0,   136,   136,     0,   160,   101,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   832,     0,     0,
     835,     0,   795,    82,     0,   182,   798,   213,     0,   801,
       0,     0,     0,   213,     0,   213,   191,   213,   213,   213,
       0,   198,     0,   213,   215,   213,     0,     0,     0,     0,
       0,     0,    44,     0,     0,   156,     0,    44,     0,   156,
       0,   160,     0,     0,     0,     0,     0,   829,   830,     0,
     831,     0,     0,   833,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   465,     0,     0,     0,   156,     0,   156,
       0,   156,   156,   156,     0,    94,     0,   156,     0,   156,
       0,   465,     0,    44,     0,   852,     0,   310,     0,    44,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   191,
       0,   862,   168,    94,   864,   184,     0,   182,     0,   188,
     191,   198,     0,     0,     0,   198,     0,   156,     0,     0,
       0,     0,    44,     0,     0,     0,     0,     0,     0,     0,
     215,   182,     0,     0,   226,   156,   226,     0,   226,   226,
     226,   396,     0,   215,   226,     0,   226,     0,     0,     0,
       0,   409,     0,     0,     0,   215,   215,   215,     0,     0,
       0,   109,     0,     1,   110,   111,    44,     0,     0,     0,
       0,     0,     0,     0,   437,     0,   437,     0,     0,     0,
     465,    83,     0,   310,     0,     0,     0,   312,     2,   663,
     156,     0,     0,     0,   318,   213,     0,   213,     0,   213,
     213,     0,     0,     0,     0,     0,     0,   184,   166,   325,
       0,     0,     0,    85,     0,     0,     0,     0,     0,    44,
       0,     0,   156,   156,     0,     0,     0,     0,     0,     0,
       0,   184,   115,   116,   156,     0,   310,     0,     0,     0,
       0,   402,   404,     0,     0,     0,   465,     0,     0,   156,
       0,   156,   198,   156,   156,     0,   257,     0,    86,     0,
       0,     0,     0,   118,   119,     0,     0,     0,    44,     0,
       0,   156,     0,     0,   440,     0,   440,     0,     0,   121,
       0,     0,     0,   312,   243,     0,     0,   125,   259,     0,
       0,     0,     0,    83,     0,     0,     0,     0,   310,     0,
     317,     0,     0,   544,     0,   215,     0,     0,   546,     0,
       0,     0,     0,   233,     0,     0,   226,     0,   226,   182,
     226,   226,     0,   156,     0,    85,     0,   248,     0,   587,
     250,     0,     0,   260,     0,   373,   312,   515,     0,     0,
     215,     0,   215,     0,   215,   215,   215,    83,     0,     0,
     215,   156,   215,    81,     0,     0,   310,     0,     0,     0,
       0,     0,   437,     0,   465,     0,     0,     0,     0,   437,
      86,     0,     0,     0,   430,     0,     0,   437,   156,    85,
      83,   444,    83,   444,   430,     0,     0,     0,     0,   455,
       0,     0,     0,     0,     0,   396,   470,   470,   312,     0,
       0,   332,     0,     0,   335,     0,   432,   168,   184,     0,
       0,     0,    85,   446,    85,   446,   432,     0,   156,   184,
       0,   457,     0,   582,    86,     0,     0,     0,   472,   472,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   310,
       0,     0,     0,     0,     0,   420,     0,     0,     0,     0,
       0,   433,     0,     0,     0,     0,   312,    86,   447,    86,
     447,   433,   440,     0,   613,    81,   458,     0,     0,   440,
       0,     0,     0,   473,   473,     0,     0,   440,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   546,     0,     0,   402,     0,     0,     0,     0,
       0,     0,     0,     0,   540,     0,     0,   372,     0,     0,
     705,    83,     0,   166,   257,     0,    83,     0,   470,    81,
       0,     0,   215,     0,   215,     0,   215,   215,    84,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   312,
       0,     0,     0,    85,     0,     0,   259,     0,    85,     0,
     472,     0,    81,   443,    81,   443,     0,     0,     0,     0,
       0,     0,   602,     0,     0,     0,     0,     0,   469,   469,
       0,     0,     0,   325,     0,   621,     0,     0,     0,     0,
       0,     0,     0,   621,     0,     0,     0,     0,    86,     0,
       0,   260,   184,    86,   604,   473,   470,     0,     0,     0,
       0,   639,     0,   258,   579,     0,     0,   623,     0,     0,
     708,     0,   178,     0,   470,   623,     0,     0,     0,     0,
       0,     0,   191,     0,     0,     0,     0,     0,   472,     0,
       0,     0,   598,   641,     0,   771,     0,   178,     0,   605,
      84,     0,     0,     0,     0,    83,   472,   611,     0,     0,
       0,   178,   624,     0,   178,     0,     0,     0,     0,   626,
     624,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   473,     0,     0,   539,    85,   642,     0,
       0,     0,     0,    81,     0,     0,     0,     0,    81,     0,
     469,   473,   182,     0,    84,     0,     0,     0,   639,     0,
       0,   470,   470,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   470,     0,     0,     0,     0,     0,     0,
       0,   431,    86,     0,     0,   178,     0,    84,   178,    84,
     641,   431,   770,   472,   472,     0,   456,     0,     0,     0,
       0,     0,     0,   471,   471,   472,     0,   620,     0,     0,
       0,     0,     0,     0,     0,   620,     0,     0,     0,     0,
     676,     0,     0,     0,     0,     0,     0,     0,   469,   178,
       0,     0,     0,   638,     0,   642,     0,     0,   473,   473,
     109,     0,     1,   110,   111,   112,   469,   113,   114,     0,
     473,     0,   184,     0,     0,     0,   709,     0,   467,   467,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,   721,     0,     0,   723,
     470,     0,     0,     0,     0,     0,     0,     0,   727,   728,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   115,   116,   117,     0,     0,     0,     0,    84,     0,
       0,   258,   472,    84,     0,   471,     0,     0,     0,     0,
     638,     0,     0,   469,   469,     0,     0,     0,     0,     0,
       0,     0,   118,   119,     0,   469,     0,     0,     0,   120,
       0,     0,     0,     0,     0,     0,     0,   470,   121,     0,
     122,     0,     0,   123,     0,   124,   125,   473,     0,   603,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,     0,   808,   865,     0,   467,     0,   178,   472,
       0,     0,     0,     0,     0,     0,   779,     0,     0,     0,
     782,     0,     0,   471,     0,     0,     0,     0,   640,     0,
       0,     0,     0,     0,     0,     0,   178,     0,     0,     0,
       0,   471,   109,     0,     1,   110,   111,   112,     0,   113,
     114,   178,     0,   804,   473,     0,     0,     0,     0,     0,
       0,     0,     0,   178,   813,     0,     0,     0,     0,     2,
       0,     0,    84,     0,     0,     0,     0,     0,   467,     0,
       0,     0,   469,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   467,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   115,   116,   117,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   640,     0,     0,   471,   471,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     471,     0,     0,     0,   118,   119,     0,     0,     0,   469,
     109,   120,     1,   110,   111,   112,     0,   113,   114,     0,
     121,     0,   122,     0,   178,   123,   486,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     2,     0,     0,
       0,     0,     0,     0,     0,   463,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   467,     0,     0,     0,     0,
     178,     0,     0,   549,   550,   551,   552,   553,   554,   555,
     556,   557,   558,   559,     0,     0,     0,     0,     0,     0,
       0,   115,   116,   117,     0,     0,     0,     0,     0,     0,
     178,     0,     0,   178,     0,     0,     0,     0,     0,     0,
       0,     0,   178,   178,     0,     0,     0,     0,     0,     0,
       0,   467,   118,   119,     0,     0,     0,   471,     0,   120,
       0,   467,     0,     0,     0,     0,     0,     0,   121,     0,
     122,     0,   735,   123,     0,   124,   125,     0,     0,     0,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,   561,   384,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   471,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     178,     0,     0,     0,   178,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,   178,     0,   467,
       0,     0,     0,     0,     0,     0,     0,     0,   178,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,   549,   550,   551,   552,   553,
     554,   555,   556,   557,   558,   559,     0,     0,     0,    28,
       0,     0,     0,   115,   116,   117,    29,    30,     0,   560,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,   120,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,   122,     0,     0,   123,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   561,   384,  -453,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
     549,   550,   551,   552,   553,   554,   555,   556,   557,   558,
     559,     0,     0,     0,    28,     0,     0,     0,   115,   116,
     117,    29,    30,     0,   560,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,   120,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,   122,     0,     0,
     123,     0,   124,   125,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   561,
     384,  -452,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,   549,   550,   551,   552,   553,
     554,   555,   556,   557,   558,   559,     0,     0,     0,    28,
       0,     0,     0,   115,   116,   117,    29,    30,     0,   560,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,   120,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,   122,     0,     0,   123,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   561,   384,  -454,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   115,   116,
     117,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,   120,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,   122,     0,     0,
     123,     0,   124,   125,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   462,
     463,   464,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,   115,   116,   117,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,   120,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,   122,     0,     0,   123,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   462,   463,   483,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   115,   116,
     117,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,   120,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,   122,     0,     0,
     123,     0,   124,   125,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   462,
     463,   634,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,   115,   116,   117,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,   120,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,   122,     0,     0,   123,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   648,   463,  -505,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   115,   116,
     117,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,   120,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,   122,     0,     0,
     123,     0,   124,   125,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   462,
     463,   702,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,   115,   116,   117,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,   120,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,   122,     0,     0,   123,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,   109,     0,     1,
     110,   111,     0,     0,   462,   463,   805,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,   202,     0,     0,   115,   116,
       0,    29,    30,     0,     0,   203,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,    75,     0,     0,
     204,     0,   205,   125,   109,     0,     1,   110,   111,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   206,
       0,   207,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,   202,     0,     0,   115,   116,     0,    29,    30,
       0,     0,   203,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   118,   119,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,   121,     0,    75,     0,     0,   204,     0,   205,
     125,   109,     0,     1,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   206,     0,   405,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,   202,
       0,     0,   115,   116,     0,    29,    30,     0,     0,   203,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,   118,   119,     0,     0,     0,     0,     0,
       0,    37,    38,    39,    40,     0,     0,     0,    41,   121,
       0,    75,     0,     0,   204,     0,   205,   125,   109,     0,
       1,   110,   111,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   206,     0,   414,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,   202,     0,     0,   115,
     116,     0,    29,    30,     0,     0,   203,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
     118,   119,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,   121,     0,    75,     0,
       0,   204,     0,   205,   125,   109,     0,     1,   110,   111,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     206,     0,   416,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,   202,     0,     0,   115,   116,     0,    29,
      30,     0,     0,   203,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,   118,   119,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,   121,     0,    75,     0,     0,   204,     0,
     205,   125,   109,     0,     1,   110,   111,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   206,     0,   592,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
     202,     0,     0,   115,   116,     0,    29,    30,     0,     0,
     203,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,    75,     0,     0,   204,     0,   205,   125,   109,
       0,     1,   110,   111,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   206,     0,   593,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,   202,     0,     0,
     115,   116,     0,    29,    30,     0,     0,   203,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,   118,   119,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,   121,     0,    75,
       0,     0,   204,     0,   205,   125,   109,     0,     1,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   206,     0,   594,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,   202,     0,     0,   115,   116,     0,
      29,    30,     0,     0,   203,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,   118,   119,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,   121,     0,    75,     0,     0,   204,
       0,   205,   125,   109,     0,     1,   110,   111,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   206,     0,
     596,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,   202,     0,     0,   115,   116,     0,    29,    30,     0,
       0,   203,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,   118,   119,     0,     0,     0,
       0,     0,     0,    37,    38,    39,    40,     0,     0,     0,
      41,   121,     0,    75,     0,     0,   204,     0,   205,   125,
     109,     0,     1,   110,   111,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   206,     0,   711,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,   202,     0,
       0,   115,   116,     0,    29,    30,     0,     0,   203,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,   118,   119,     0,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,   121,     0,
      75,     0,     0,   204,     0,   205,   125,   109,     0,     1,
     110,   111,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   206,     0,   712,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,   202,     0,     0,   115,   116,
       0,    29,    30,     0,     0,   203,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,    75,     0,     0,
     204,     0,   205,   125,   109,     0,     1,   110,   111,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   206,
       0,   713,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,   202,     0,     0,   115,   116,     0,    29,    30,
       0,     0,   203,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   118,   119,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,   121,     0,    75,     0,     0,   204,     0,   205,
     125,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,     0,     0,     0,     0,   206,     0,   714,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,   549,   550,   551,   552,   553,   554,
     555,   556,   557,   558,   559,     0,     0,     0,    28,     0,
       0,     0,   115,   116,   117,    29,    30,     0,   560,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,   109,
       0,     1,   110,   111,   112,     0,   113,   114,     0,     0,
       0,    36,     0,   118,   119,     0,     0,     0,     0,     0,
     120,    37,    38,    39,    40,     0,     2,     0,    41,   121,
       0,   122,     0,     0,   123,     0,   124,   125,     0,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,   561,   384,   109,     0,     1,   110,   111,
     112,     0,   113,   114,     0,     0,     0,     0,     0,     0,
     115,   116,   117,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   118,   119,     0,     0,     0,     0,     0,   120,     0,
       0,     0,     0,     0,     0,     0,     0,   121,     0,   122,
       0,     0,   123,     0,   124,   125,   115,   116,   117,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,     0,   463,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   118,   119,     0,
       0,     0,     0,     0,   120,     0,     0,     0,     0,     0,
       0,     0,     0,   121,     0,   122,     0,     0,   123,     0,
     124,   125,     0,     0,     0,     0,   126,   127,   128,   129,
     109,     0,     1,   110,   111,     0,     0,     0,   808,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,    28,   202,     0,
       0,   115,   116,     0,    29,    30,     0,     0,   203,    31,
       0,     0,    32,    33,     2,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,   118,   119,     0,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,   121,     0,
      75,     0,     0,   204,     0,   205,   125,     0,   115,   116,
     117,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,   206,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   118,
     119,     0,     0,     0,     0,   109,   120,     1,   110,   111,
     112,     0,   113,   114,     0,   121,     0,   122,     0,     0,
     123,   758,   124,   125,     0,     0,     0,     0,   126,   127,
     128,   129,     2,     0,     0,     0,     0,     0,     0,   561,
       0,     0,   115,   116,   117,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   118,   119,     0,   115,   116,   117,     0,
     120,     0,     0,     0,     0,     0,     0,     0,     0,   121,
       0,   122,     0,     0,   123,   802,   124,   125,     0,     0,
       0,     0,   126,   127,   128,   129,     0,   118,   119,     0,
       0,     0,     0,   561,   120,     0,     0,     0,     0,     0,
       0,     0,     0,   121,     1,   122,     0,     0,   123,     0,
     124,   125,     0,     0,     0,     0,   126,   127,   128,   129,
       0,     0,     0,     0,     0,     0,     0,   686,     0,     2,
       3,     4,     5,     6,     7,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   359,    20,    21,   360,
     361,    24,    25,   362,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   363,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,     0,     0,     0,   364,     0,   365,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   366,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    38,   367,   368,     0,     0,     0,    41,
       0,     1,    75,     0,     0,   309,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   537,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     1,     0,    75,
       0,     0,   392,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   393,
       0,   394,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,     1,     0,    75,     0,     0,   180,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   691,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,     0,
       0,     0,     0,     0,     0,    29,    30,     0,     0,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    37,    38,    39,    40,     0,     0,     0,    41,     0,
       0,    75,     0,   109,   309,     1,   110,   111,   112,    77,
     113,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  -286,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,     0,     0,     0,   115,   116,   117,    29,    30,     0,
       0,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,   118,   119,     0,     0,     0,
       0,     0,   120,    37,    38,    39,    40,     0,     0,     0,
      41,   121,     0,   122,     0,     0,   123,     0,   124,   125,
       0,     0,     0,     0,   126,   127,   128,   129,   109,     0,
       1,   110,   111,   112,     0,   113,   114,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,   115,
     116,   117,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
     118,   119,     0,     0,     0,     0,     0,   120,    37,    38,
      39,    40,     0,     0,     0,     0,   121,     0,   122,     0,
       0,   123,   253,   124,   125,     0,     0,     0,     0,   126,
     127,   128,   129,   109,     0,     1,   110,   111,   112,     0,
     113,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,     0,     0,     0,   115,   116,   117,    29,    30,     0,
       0,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,     0,    36,     0,   118,   119,     0,     0,     0,
       0,     0,   120,    37,    38,    39,    40,     0,     2,     0,
       0,   121,     0,   380,     0,     0,   381,   253,   124,   125,
       0,     0,     0,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,   115,   116,   117,    29,    30,     0,     0,     0,
      31,     0,     0,     0,     2,     0,     0,     0,     0,     0,
     109,     0,     1,   110,   111,   112,     0,   113,   114,     0,
       0,     0,     0,   118,   119,     0,     0,     0,     0,     0,
     120,    37,    38,     0,     0,     0,     0,     2,     0,   121,
       0,   380,     0,     0,   381,   253,   124,   125,   115,   116,
     117,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   118,
     119,   115,   116,   117,     0,     0,   120,     0,     0,     0,
       0,     0,     0,     0,     0,   121,     0,   122,     0,     0,
     123,     0,   124,   125,     0,     0,   176,     0,   126,   127,
     128,   129,   118,   119,     0,     0,     0,     0,   109,   120,
       1,   110,   111,   112,     0,   113,   114,     0,   121,     0,
     122,     0,     0,   123,     0,   124,   125,     0,     0,   330,
       0,   126,   127,   128,   129,     2,     0,     0,     0,     0,
       0,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   115,
     116,   117,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     118,   119,   115,   116,   117,     0,     0,   120,     0,     0,
       0,     0,     0,     0,     0,     0,   121,     0,   122,     0,
       0,   123,     0,   124,   125,     0,     0,   333,     0,   126,
     127,   128,   129,   118,   119,     0,     0,     0,     0,     0,
     120,     0,     0,   115,   116,   117,     0,     0,     0,   121,
       0,   122,     0,     0,   123,   253,   124,   125,     0,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,     0,   118,   119,     0,     0,     0,     0,
     109,   120,     1,   110,   111,   112,     0,   113,   114,     0,
     121,     0,   122,     0,     0,   123,   755,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     2,     0,     0,
       0,     0,     0,   109,     0,     1,   110,   111,   112,     0,
     113,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   115,   116,   117,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   118,   119,   115,   116,   117,     0,     0,   120,
       0,     0,     0,     0,     0,     0,     0,     0,   121,     0,
     122,     0,     0,   123,   834,   124,   125,     0,     0,     0,
       0,   126,   127,   128,   129,   118,   119,     0,     0,     0,
       0,     0,   120,     0,     0,   115,   116,   117,     0,     0,
       0,   121,     0,   122,     0,     0,   123,     0,   124,   125,
       0,     0,     0,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,     0,   118,   119,     0,     0,
       0,     0,   109,   120,     1,   110,   111,   112,     0,   113,
     114,     0,   121,     0,   122,     0,     0,   241,     0,   124,
     125,     0,     0,     0,     0,   126,   127,   128,   129,     2,
       0,     0,     0,     0,     0,   109,     0,     1,   110,   111,
     112,     0,   113,   114,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   115,   116,   117,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   118,   119,   115,   116,   117,     0,
       0,   120,     0,     0,     0,     0,     0,     0,     0,     0,
     121,     0,   122,     0,     0,   243,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,   118,   119,     0,
       0,     0,     0,     0,   120,     1,     0,     0,     0,     0,
       0,     0,     0,   121,     0,   122,     0,     0,   251,     0,
     124,   125,     0,     0,     0,     0,   126,   127,   128,   129,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,     0,     0,     0,     0,     0,     0,    29,    30,     0,
       0,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,     0,     0,     0,     0,     0,
       1,     0,     0,    37,    38,    39,    40,     0,     0,     0,
      41,     0,     0,    75,     0,     0,    76,     0,     0,     0,
       0,    77,     0,     0,    78,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
       0,     0,     1,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     0,     0,    75,     0,
       0,    76,   169,     0,     0,     0,    77,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,     0,     0,     1,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,     0,     0,
      75,     0,     0,   309,   169,     0,     0,     0,    77,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,     0,     0,     1,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
       0,     0,    75,     0,     0,   435,     0,     0,     0,     0,
     436,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,     0,     0,     1,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,     0,     0,    75,     0,     0,   435,     0,     0,
       0,     0,   448,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,     0,     0,
       1,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,     0,     0,    75,     0,     0,   309,
       0,     0,     0,     0,    77,     2,     3,     4,     5,     6,
       7,   348,   349,   350,   351,   352,   353,   354,   355,   356,
     357,   358,   359,    20,    21,   360,   361,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   363,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
       0,     0,     0,   364,     0,   365,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   366,     0,
       0,     0,     1,     0,     0,     0,     0,     0,    37,    38,
     367,   368,     0,     0,     0,    41,     0,     0,    75,     0,
       0,   435,     0,     0,     0,     0,   618,     2,     3,     4,
       5,     6,     7,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,    20,    21,   360,   361,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   363,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,     0,     0,     0,   364,     0,   365,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
     366,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,    38,   367,   368,     0,     0,     0,    41,     0,     0,
      75,     0,     0,   435,     2,     0,     0,     0,   628,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,     0,
       0,     1,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,     0,     0,     0,    75,     0,     0,
     309,     0,     0,     0,     0,    77,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,    75,
       0,     0,   435,   608,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     0,     0,     0,     0,
       0,     0,   194,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     1,     0,
       0,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,     0,     0,     0,     0,     0,
       0,   328,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,     0,     0,     0,     0,     0,     0,
     719,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,    36,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,     0,     0,    75,     0,     0,   180,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
       0,     0,     0,     0,     0,   547,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,   519,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
      36,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,     0,
       0,     0,     0,     0,     0,    29,    30,     0,     0,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    36,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    37,    38,    39,    40,     0,     0,     0,    41,     2,
       3,     4,     5,     6,     7,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   359,    20,    21,   360,
     361,    24,    25,   362,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   363,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,     0,     0,     0,   364,     0,   365,
       0,     0,     0,     0,     0,     1,     0,     0,     0,     0,
       0,     0,   366,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    38,   367,   368,     0,     0,     0,    41,
       2,     3,     4,     5,     6,     7,   348,   349,   350,   351,
     352,   353,   354,   355,   356,   357,   358,   359,    20,    21,
     360,   361,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     363,     0,     0,     0,     0,     0,     0,    29,    30,     0,
       0,     0,    31,     0,     0,     0,     0,     0,   364,     0,
     365,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   366,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    37,    38,   367,   368,     0,     0,     0,
      41
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-767)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,    48,   264,    82,    91,   125,     0,   385,   203,    48,
     268,    53,   202,   137,   391,    94,   385,   347,   536,   214,
      68,   437,    94,   202,   440,   283,    26,   202,     3,    17,
      11,    78,     3,   249,    70,    48,     3,    76,     3,    78,
     682,   202,   808,    82,    70,    71,   124,    47,    48,    70,
      71,    71,     3,     3,     3,    94,     3,    28,    70,    71,
      60,    28,   104,    71,    70,    65,    71,     3,     3,    69,
      70,    70,    71,   248,    71,   250,    76,     3,    78,    70,
      80,    70,    82,   124,   130,     3,   131,   248,   854,   250,
     121,    91,   122,   124,    94,     3,   141,    97,   144,   617,
     122,   101,   189,   228,   229,   230,   142,   107,   108,   188,
      28,   122,   184,   141,   144,   115,   188,   759,   118,   145,
      28,     3,   144,   124,   145,   145,   208,   209,   210,   211,
     216,   131,     0,   145,   134,   144,     3,   145,    46,   145,
     145,   180,   123,   182,     3,   184,   145,   160,   145,   188,
     131,   669,   140,     5,   145,   155,   145,   157,     3,   198,
     160,   285,   286,   287,     3,   204,   141,    75,    76,   144,
     170,   121,   122,   144,   125,   124,   215,   144,   125,   144,
     180,   371,   182,   378,   184,   224,   121,   122,   188,   189,
     568,   569,   371,   235,   144,   195,   371,   613,   198,   568,
     530,   463,   202,   203,   204,   205,   724,   142,   144,   144,
     371,   131,   212,   213,   214,   215,   216,   125,   144,   435,
     268,    70,   131,   131,   224,   145,   442,    26,   228,   229,
     230,   310,   131,   312,   450,   283,   145,   237,     3,   121,
      48,   241,   124,   256,   143,   124,   246,   247,   248,   249,
     250,   251,   144,   325,   121,   122,   256,   293,   294,   636,
     296,    60,   131,   442,   130,   265,     1,   442,     3,   269,
     144,   450,   308,   468,   143,   450,   121,   313,   144,   124,
     316,   442,   121,   122,   129,   131,   325,   130,    68,   450,
     144,   121,    80,   418,   419,   123,   145,   143,   423,   145,
     425,   144,   101,   131,   123,   144,   136,   137,   308,   309,
      75,    76,   131,   313,   125,    80,   316,   132,   580,   697,
     131,   138,   322,   111,   112,   325,    48,   413,   322,   415,
     124,   417,   112,   113,   114,   129,   460,    80,   338,   125,
     120,   461,   381,   123,   125,   131,   111,   112,   435,     1,
     131,     3,   160,   392,    76,   131,    78,   396,   371,   401,
      82,   131,   362,   402,   139,   404,   123,   143,   111,   112,
     409,   371,    94,   143,   131,   145,   376,   131,   378,   144,
      16,   381,   382,   383,   125,   385,   121,   122,   125,   143,
      80,   142,   392,   123,   476,   395,   396,   655,   125,   142,
     125,   131,   402,   202,   404,   453,   214,     0,   131,   409,
     123,   131,     3,   413,    80,   415,   429,   417,   418,   419,
     143,   111,   112,   423,   204,   425,     3,   130,   428,   429,
       7,     8,     9,   241,   125,   435,   515,    28,   144,   247,
     131,   249,   442,   251,   131,   111,   112,   125,   125,   248,
     450,   250,   142,   131,   454,   143,   143,   143,   180,   144,
     182,   241,   184,   243,   121,   465,   188,   124,   468,   121,
     122,   251,   129,   125,   125,   141,   198,    70,   125,   131,
     131,   125,   204,    76,    75,    76,   534,   131,   268,    80,
     270,   204,   214,   128,     3,   144,    75,    76,    91,   512,
     536,    80,   764,   283,   125,   133,   134,   546,   142,   595,
     131,   597,   512,   599,   600,    10,    11,     3,   565,    28,
     111,   112,   115,   125,   304,   118,   565,   614,   241,   131,
     243,   125,   111,   112,   124,   535,   536,    46,   251,   129,
     124,   130,   542,   582,   544,   129,   546,   124,   587,   130,
     308,   128,   129,   144,   554,   313,   556,   270,   125,   308,
     560,   124,   562,   362,   313,   565,    75,    76,   568,   569,
     378,   124,   371,     3,     3,   383,   124,   376,     7,     8,
       9,   617,   582,   583,   666,   667,   122,   587,   145,    75,
      76,   304,    14,    15,    80,   595,   189,   597,   125,   599,
     600,   381,   124,   325,   129,   385,     3,   655,   143,   144,
     203,   124,   205,     3,   614,   122,   125,   617,    46,    47,
     141,   429,   130,   131,   129,   111,   112,   288,   289,   297,
     298,    28,   125,   669,   145,   121,     3,   637,   124,   145,
       7,     8,     9,   442,   125,    75,    76,    75,    76,    46,
      80,   450,    80,   290,   291,   141,   125,    12,    13,   381,
     107,   108,   744,   745,   664,   747,   748,   124,   381,   669,
     392,   124,   124,   453,   396,   124,   143,   677,    75,    76,
     402,   111,   112,   111,   112,    75,    76,   143,   724,   689,
      80,   121,   692,   121,   124,   124,   130,   697,   143,   128,
     129,   783,   145,   785,   512,   705,   125,   125,   708,     3,
     792,   793,   122,   142,   129,   308,   309,   130,   765,   767,
     313,   111,   112,   316,   724,   129,   765,   125,   145,   322,
     125,   121,   144,   141,   124,   125,    58,   819,   143,   821,
     142,   823,   145,   825,     0,   544,   468,   129,   528,   141,
     125,   751,   130,   130,   534,   755,   130,   124,   758,   130,
     808,   128,   129,   124,   846,   765,   848,   122,   123,   145,
     770,   771,    75,    76,   554,   142,   130,    80,   130,   559,
     143,    75,    76,   145,    66,   145,    80,    97,   568,   569,
      75,    76,    48,   143,   145,    80,   796,   797,   145,   799,
     145,   145,   802,     1,   145,     3,   854,     3,   111,   112,
     145,    60,   299,    69,    70,   528,   300,   111,   112,   301,
      76,    77,   302,   250,   546,   303,   111,   112,   765,   104,
     124,   316,    28,   407,   834,    91,   583,   237,   468,   142,
     125,    97,   435,   565,   251,   646,   559,   568,   481,   481,
     850,    -1,   481,   853,    -1,    -1,    -1,    -1,    -1,   115,
     582,   583,   118,    -1,    -1,   587,    -1,   123,     3,    -1,
      -1,    -1,    -1,    -1,    -1,   655,    -1,    75,    76,    75,
      76,    -1,    80,    -1,    80,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,   554,    -1,   677,   678,   679,
     680,    -1,   682,    -1,   160,    -1,   216,    -1,    97,   689,
     569,    -1,    -1,   111,   112,   111,   112,   697,   228,   229,
     230,    -1,    -1,   121,   122,    -1,   124,   125,    -1,    -1,
      -1,   129,    -1,   189,   190,    -1,    -1,   193,    -1,    -1,
      75,    76,    -1,   536,    -1,    80,    -1,   203,    -1,   205,
      -1,    -1,    -1,   263,   264,    -1,    -1,    -1,   214,    -1,
     216,    -1,    -1,    -1,    -1,   678,   679,   680,    -1,    -1,
      -1,   751,   228,   229,   230,   755,   111,   112,   758,   759,
      -1,    -1,    -1,   705,    -1,   241,   708,   767,    -1,   124,
      -1,   247,    -1,   249,   129,   251,    -1,    -1,    -1,    -1,
     256,    -1,    -1,    -1,    -1,    -1,    -1,   263,   264,   142,
      -1,    -1,    -1,    -1,    -1,    -1,   796,   797,   677,   799,
     800,   614,   802,   803,   617,    -1,    -1,   216,   808,    -1,
     689,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   697,   228,
     229,   230,    -1,   765,    -1,    -1,    -1,    -1,   770,   771,
      -1,    -1,   308,   309,   834,    -1,    -1,   313,    -1,    -1,
     316,    -1,    -1,    -1,    -1,    48,   322,    -1,    -1,    -1,
     850,    -1,    -1,   853,   854,    -1,   669,    60,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   800,    -1,    -1,
     803,    -1,   751,    76,    -1,    78,   755,   407,    -1,   758,
      -1,    -1,    -1,   413,    -1,   415,    89,   417,   418,   419,
      -1,    94,    -1,   423,    97,   425,    -1,    -1,    -1,    -1,
      -1,    -1,   378,    -1,    -1,   381,    -1,   383,    -1,   385,
      -1,   724,    -1,    -1,    -1,    -1,    -1,   796,   797,    -1,
     799,    -1,    -1,   802,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   463,    -1,    -1,    -1,   413,    -1,   415,
      -1,   417,   418,   419,    -1,    48,    -1,   423,    -1,   425,
      -1,   481,    -1,   429,    -1,   834,    -1,   160,    -1,   435,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   172,
      -1,   850,    75,    76,   853,    78,    -1,   180,    -1,    82,
     183,   184,    -1,    -1,    -1,   188,    -1,   463,    -1,    -1,
      -1,    -1,   468,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     203,   204,    -1,    -1,   413,   481,   415,    -1,   417,   418,
     419,   214,    -1,   216,   423,    -1,   425,    -1,    -1,    -1,
      -1,   224,    -1,    -1,    -1,   228,   229,   230,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,   512,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   247,    -1,   249,    -1,    -1,    -1,
     580,    48,    -1,   256,    -1,    -1,    -1,   160,    28,   535,
     536,    -1,    -1,    -1,   167,   595,    -1,   597,    -1,   599,
     600,    -1,    -1,    -1,    -1,    -1,    -1,   180,    75,   182,
      -1,    -1,    -1,    48,    -1,    -1,    -1,    -1,    -1,   565,
      -1,    -1,   568,   569,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   204,    72,    73,   580,    -1,   309,    -1,    -1,    -1,
      -1,   214,   215,    -1,    -1,    -1,   646,    -1,    -1,   595,
      -1,   597,   325,   599,   600,    -1,   123,    -1,    48,    -1,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,   614,    -1,
      -1,   617,    -1,    -1,   247,    -1,   249,    -1,    -1,   119,
      -1,    -1,    -1,   256,   124,    -1,    -1,   127,   123,    -1,
      -1,    -1,    -1,   160,    -1,    -1,    -1,    -1,   371,    -1,
     167,    -1,    -1,   376,    -1,   378,    -1,    -1,   381,    -1,
      -1,    -1,    -1,   102,    -1,    -1,   595,    -1,   597,   392,
     599,   600,    -1,   669,    -1,   160,    -1,   116,    -1,   402,
     119,    -1,    -1,   123,    -1,   202,   309,   310,    -1,    -1,
     413,    -1,   415,    -1,   417,   418,   419,   214,    -1,    -1,
     423,   697,   425,    48,    -1,    -1,   429,    -1,    -1,    -1,
      -1,    -1,   435,    -1,   764,    -1,    -1,    -1,    -1,   442,
     160,    -1,    -1,    -1,   241,    -1,    -1,   450,   724,   214,
     247,   248,   249,   250,   251,    -1,    -1,    -1,    -1,   256,
      -1,    -1,    -1,    -1,    -1,   468,   263,   264,   371,    -1,
      -1,   190,    -1,    -1,   193,    -1,   241,   380,   381,    -1,
      -1,    -1,   247,   248,   249,   250,   251,    -1,   764,   392,
      -1,   256,    -1,   396,   214,    -1,    -1,    -1,   263,   264,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   512,
      -1,    -1,    -1,    -1,    -1,   234,    -1,    -1,    -1,    -1,
      -1,   241,    -1,    -1,    -1,    -1,   429,   247,   248,   249,
     250,   251,   435,    -1,   437,   160,   256,    -1,    -1,   442,
      -1,    -1,    -1,   263,   264,    -1,    -1,   450,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   565,    -1,    -1,   468,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   371,    -1,    -1,   202,    -1,    -1,
     583,   378,    -1,   380,   381,    -1,   383,    -1,   385,   214,
      -1,    -1,   595,    -1,   597,    -1,   599,   600,    48,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   512,
      -1,    -1,    -1,   378,    -1,    -1,   381,    -1,   383,    -1,
     385,    -1,   247,   248,   249,   250,    -1,    -1,    -1,    -1,
      -1,    -1,   429,    -1,    -1,    -1,    -1,    -1,   263,   264,
      -1,    -1,    -1,   546,    -1,   442,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   450,    -1,    -1,    -1,    -1,   378,    -1,
      -1,   381,   565,   383,   429,   385,   463,    -1,    -1,    -1,
      -1,   468,    -1,   123,   393,    -1,    -1,   442,    -1,    -1,
     583,    -1,    77,    -1,   481,   450,    -1,    -1,    -1,    -1,
      -1,    -1,   695,    -1,    -1,    -1,    -1,    -1,   463,    -1,
      -1,    -1,   421,   468,    -1,   708,    -1,   102,    -1,   429,
     160,    -1,    -1,    -1,    -1,   512,   481,   436,    -1,    -1,
      -1,   116,   442,    -1,   119,    -1,    -1,    -1,    -1,   448,
     450,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   463,    -1,    -1,   371,   512,   468,    -1,
      -1,    -1,    -1,   378,    -1,    -1,    -1,    -1,   383,    -1,
     385,   481,   765,    -1,   214,    -1,    -1,    -1,   565,    -1,
      -1,   568,   569,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   580,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   241,   512,    -1,    -1,   190,    -1,   247,   193,   249,
     565,   251,   705,   568,   569,    -1,   256,    -1,    -1,    -1,
      -1,    -1,    -1,   263,   264,   580,    -1,   442,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   450,    -1,    -1,    -1,    -1,
     549,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   463,   234,
      -1,    -1,    -1,   468,    -1,   565,    -1,    -1,   568,   569,
       1,    -1,     3,     4,     5,     6,   481,     8,     9,    -1,
     580,    -1,   765,    -1,    -1,    -1,   585,    -1,   263,   264,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   512,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   615,    -1,    -1,   618,
     697,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   627,   628,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,    -1,    -1,    -1,    -1,   378,    -1,
      -1,   381,   697,   383,    -1,   385,    -1,    -1,    -1,    -1,
     565,    -1,    -1,   568,   569,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,   104,    -1,   580,    -1,    -1,    -1,   110,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   764,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,   697,    -1,   429,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   144,   145,    -1,   391,    -1,   393,   764,
      -1,    -1,    -1,    -1,    -1,    -1,   725,    -1,    -1,    -1,
     729,    -1,    -1,   463,    -1,    -1,    -1,    -1,   468,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   421,    -1,    -1,    -1,
      -1,   481,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   436,    -1,   762,   764,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   448,   773,    -1,    -1,    -1,    -1,    28,
      -1,    -1,   512,    -1,    -1,    -1,    -1,    -1,   463,    -1,
      -1,    -1,   697,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   481,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   565,    -1,    -1,   568,   569,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     580,    -1,    -1,    -1,   103,   104,    -1,    -1,    -1,   764,
       1,   110,     3,     4,     5,     6,    -1,     8,     9,    -1,
     119,    -1,   121,    -1,   549,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   144,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   580,    -1,    -1,    -1,    -1,
     585,    -1,    -1,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,
     615,    -1,    -1,   618,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   627,   628,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   636,   103,   104,    -1,    -1,    -1,   697,    -1,   110,
      -1,   646,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
     121,    -1,   657,   124,    -1,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,   144,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   764,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     725,    -1,    -1,    -1,   729,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,   762,    -1,   764,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   773,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    78,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    78,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    78,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,     1,    -1,     3,
       4,     5,    -1,    -1,   143,   144,   145,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,   124,    -1,   126,   127,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,
      -1,   124,    -1,   126,   127,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,
     126,   127,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,
      79,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   143,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,   124,
      -1,   126,   127,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,
     145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    72,    73,    74,    75,    76,    -1,    78,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,   114,    -1,    28,    -1,   118,   119,
      -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   143,   144,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      72,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,    72,    73,    74,    -1,
     132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,   110,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,
     126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,   144,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    68,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    83,    84,    28,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,    -1,    72,    73,
      74,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,   143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   103,
     104,    -1,    -1,    -1,    -1,     1,   110,     3,     4,     5,
       6,    -1,     8,     9,    -1,   119,    -1,   121,    -1,    -1,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    28,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    -1,    72,    73,    74,    -1,
     110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      -1,   121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,    -1,   103,   104,    -1,
      -1,    -1,    -1,   143,   110,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   119,     3,   121,    -1,    -1,   124,    -1,
     126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,     3,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   144,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,     3,    -1,   121,
      -1,    -1,   124,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,
      -1,   143,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,     3,    -1,   121,    -1,    -1,   124,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,    -1,     1,   124,     3,     4,     5,     6,   129,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,   114,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,
      -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,   132,
     133,   134,   135,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,   114,    -1,    28,    -1,
      -1,   119,    -1,   121,    -1,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,    -1,    -1,    28,    -1,   119,
      -1,   121,    -1,    -1,   124,   125,   126,   127,    72,    73,
      74,    -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
     104,    72,    73,    74,    -1,    -1,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,   130,    -1,   132,   133,
     134,   135,   103,   104,    -1,    -1,    -1,    -1,     1,   110,
       3,     4,     5,     6,    -1,     8,     9,    -1,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,   130,
      -1,   132,   133,   134,   135,    28,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,
      73,    74,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     103,   104,    72,    73,    74,    -1,    -1,   110,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,
      -1,   124,    -1,   126,   127,    -1,    -1,   130,    -1,   132,
     133,   134,   135,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,    -1,    -1,    72,    73,    74,    -1,    -1,    -1,   119,
      -1,   121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,
       1,   110,     3,     4,     5,     6,    -1,     8,     9,    -1,
     119,    -1,   121,    -1,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    28,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   103,   104,    72,    73,    74,    -1,    -1,   110,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
     121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,    72,    73,    74,    -1,    -1,
      -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,     1,   110,     3,     4,     5,     6,    -1,     8,
       9,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,    28,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,   104,    72,    73,    74,    -1,
      -1,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,   103,   104,    -1,
      -1,    -1,    -1,    -1,   110,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,
     126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,    -1,
      -1,   129,    -1,    -1,   132,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,
      -1,   124,   125,    -1,    -1,    -1,   129,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,    -1,   124,   125,    -1,    -1,    -1,   129,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,
     129,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,
      -1,    -1,   129,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,   121,    -1,    -1,   124,
      -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,
      -1,   124,    -1,    -1,    -1,    -1,   129,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,    -1,   124,    28,    -1,    -1,    -1,   129,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,
     124,    -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,   124,   125,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,
      -1,    -1,   125,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,    -1,
      -1,   125,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,    -1,    -1,
     125,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,    -1,   124,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,    -1,    -1,    -1,   124,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    67,    68,    75,
      76,    80,    83,    84,    86,    88,   101,   111,   112,   113,
     114,   118,   147,   148,   149,   150,   151,   156,   186,   187,
     192,   193,   194,   195,   199,   200,   201,   202,   204,   205,
     211,   219,   220,   238,   269,   144,   151,   156,   124,   124,
     122,     1,   121,   122,   156,   121,   124,   129,   132,   147,
     156,   192,   193,   201,   202,   204,   220,   223,   225,   227,
     228,   230,   231,   232,   235,   124,   199,   144,   150,   151,
     156,   193,   141,     0,   156,   221,   222,   144,   144,     1,
       4,     5,     6,     8,     9,    72,    73,    74,   103,   104,
     110,   119,   121,   124,   126,   127,   132,   133,   134,   135,
     149,   156,   157,   158,   159,   162,   163,   164,   165,   166,
     167,   168,   169,   170,   171,   172,   173,   174,   175,   176,
     177,   178,   256,   259,   149,   156,   149,   156,   163,   168,
     186,   206,   207,   208,   209,   210,   201,   234,   235,   125,
     156,   225,   227,   236,   237,   238,   130,   149,   177,   181,
     124,   156,   193,   227,   235,   223,   228,   231,   235,   124,
     129,   193,   124,   129,   125,   156,   236,   239,   193,   223,
     232,   124,    69,    79,   124,   126,   143,   145,   152,   153,
     154,   155,   156,   159,   186,   193,   212,   213,   214,   215,
     216,   228,   229,   231,   235,   258,   259,   261,   144,   144,
     144,   151,   156,   181,   142,   195,   199,   131,   145,   221,
     221,   124,   163,   124,   163,   163,   156,   186,   181,   186,
     181,   124,   163,   125,   178,   180,   183,   201,   202,   204,
     220,   240,   256,   144,   144,     7,     8,     9,   124,   128,
     129,   156,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,   142,   179,   165,   121,   136,   137,   133,   134,
      10,    11,   168,    12,    13,   122,   123,    14,    15,   132,
     138,   139,    16,    17,   140,   125,   125,   125,   142,   124,
     193,   225,   235,   142,    11,   123,   131,   201,   235,   125,
     125,   125,   131,   130,   130,   235,   223,   232,   125,   236,
     130,   149,   181,   130,   149,   181,   125,   125,   131,     3,
      28,    46,    75,    76,   125,   196,   197,   198,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      48,    49,    52,    68,    86,    88,   101,   113,   114,   151,
     156,   188,   192,   201,   203,   205,   211,   219,   186,   229,
     121,   124,   156,   186,   144,   250,   251,   251,   251,   143,
     251,   142,   124,   141,   143,   156,   193,   217,   218,   228,
     229,   233,   235,   231,   235,   145,   216,   131,   143,   193,
     231,   143,   143,   212,   145,   212,   145,   212,   144,   144,
     181,   142,   222,   143,   145,   143,   145,   147,   156,   184,
     201,   202,   204,   220,   241,   124,   129,   193,   224,   226,
     235,   156,   189,   192,   201,   203,   204,   220,   129,   226,
     189,   241,   125,   131,   156,   201,   202,   204,   220,   225,
     125,   128,   143,   144,   145,   159,   160,   177,   185,   192,
     201,   202,   204,   220,   243,   260,   262,   263,   264,   265,
     266,   267,   268,   145,   268,   156,   125,   160,   161,   178,
     156,   180,   160,   178,   165,   165,   165,   166,   166,   167,
     167,   168,   168,   168,   170,   170,   171,   172,   173,   174,
     175,   180,   186,   207,   208,   235,   207,   208,   209,    53,
     238,   125,   130,   130,   130,   130,   156,   125,   124,   125,
     131,   197,   151,   156,   124,   124,   122,   144,   156,   192,
     201,   203,   225,   156,   193,   229,   193,   124,   145,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      78,   143,   156,   180,   182,   185,   245,   246,   247,   248,
     249,   251,   252,   253,   254,   255,   257,   243,   125,   181,
     144,   228,   235,   131,   143,   141,   199,   193,   228,   231,
     213,   231,   145,   145,   145,   212,   145,   212,   181,   212,
     212,   147,   201,   202,   204,   220,   225,   125,   125,   226,
     236,   181,   224,   235,   124,   129,   224,   122,   129,   156,
     192,   201,   203,   204,   220,   226,   181,   129,   129,   226,
     125,   178,   165,   256,   145,   268,   142,   156,   192,   201,
     202,   204,   220,   229,   233,   251,   131,   143,   143,   263,
     265,   266,   145,   145,   125,   131,   130,   141,   225,   180,
     125,   197,   178,   149,   156,   210,    70,    71,   145,   122,
     144,   144,   156,   151,   156,   125,   181,   141,   124,   124,
     124,   245,   124,   156,   143,   143,   143,   180,   156,   141,
     143,   143,   156,   190,   191,   227,   182,   248,   182,   245,
     145,   143,   145,   268,   228,   193,   218,   228,   235,   181,
     228,   145,   145,   145,   145,   125,   125,   130,   224,   125,
     236,   181,   210,   181,   122,   129,   130,   181,   181,   129,
     145,   243,   264,   160,   178,   177,   125,   125,   125,   125,
     123,   251,   251,   210,    70,    71,   145,    70,    71,   145,
     144,   141,   245,   180,   180,   125,   180,    58,   125,   252,
     143,   143,   142,   245,   144,   131,   143,   142,   145,   228,
     235,   193,   228,   141,   125,   130,   123,   130,   210,   181,
     130,   130,   181,    71,   145,    70,   145,   123,   251,   251,
     251,   251,    70,    71,   145,   245,   125,   125,   245,   125,
     124,   245,   125,   252,   181,   145,   268,   191,   144,   178,
     242,   228,   228,   181,   123,   130,   130,   251,   251,    71,
     145,    70,   145,    71,   145,    70,   145,   251,   251,   245,
     245,   245,   180,   245,   125,   180,   143,   145,   242,   244,
     145,   145,   251,   251,   251,   251,    71,   145,    70,   145,
      66,   125,   245,   125,   131,   145,   145,   145,   145,   145,
     251,   251,   245,   143,   245,   145,   242,   145,   145
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
      case 147: /* guess_type */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 3921 "type.ec"
        break;
      case 149: /* type */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 3928 "type.ec"
        break;
      case 150: /* base_strict_type */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 3935 "type.ec"
        break;
      case 151: /* strict_type */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 3942 "type.ec"
        break;
      case 152: /* class_function_definition_start */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 3949 "type.ec"
        break;
      case 153: /* constructor_function_definition_start */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 3956 "type.ec"
        break;
      case 154: /* destructor_function_definition_start */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 3963 "type.ec"
        break;
      case 155: /* virtual_class_function_definition_start */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 3970 "type.ec"
        break;
      case 156: /* identifier */
/* Line 1398 of yacc.c  */
#line 168 "type.y"
        { FreeIdentifier(((*yyvaluep).id)); };
/* Line 1398 of yacc.c  */
#line 3977 "type.ec"
        break;
      case 157: /* primary_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 3984 "type.ec"
        break;
      case 159: /* postfix_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 3991 "type.ec"
        break;
      case 161: /* argument_expression_list */
/* Line 1398 of yacc.c  */
#line 205 "type.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1398 of yacc.c  */
#line 3998 "type.ec"
        break;
      case 163: /* unary_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4005 "type.ec"
        break;
      case 165: /* cast_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4012 "type.ec"
        break;
      case 166: /* multiplicative_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4019 "type.ec"
        break;
      case 167: /* additive_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4026 "type.ec"
        break;
      case 168: /* shift_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4033 "type.ec"
        break;
      case 170: /* relational_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4040 "type.ec"
        break;
      case 171: /* equality_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4047 "type.ec"
        break;
      case 172: /* and_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4054 "type.ec"
        break;
      case 173: /* exclusive_or_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4061 "type.ec"
        break;
      case 174: /* inclusive_or_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4068 "type.ec"
        break;
      case 175: /* logical_and_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4075 "type.ec"
        break;
      case 176: /* logical_or_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4082 "type.ec"
        break;
      case 177: /* conditional_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4089 "type.ec"
        break;
      case 178: /* assignment_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4096 "type.ec"
        break;
      case 180: /* expression */
/* Line 1398 of yacc.c  */
#line 205 "type.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1398 of yacc.c  */
#line 4103 "type.ec"
        break;
      case 181: /* constant_expression */
/* Line 1398 of yacc.c  */
#line 170 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1398 of yacc.c  */
#line 4110 "type.ec"
        break;
      case 182: /* declaration */
/* Line 1398 of yacc.c  */
#line 191 "type.y"
        { FreeDeclaration(((*yyvaluep).declaration)); };
/* Line 1398 of yacc.c  */
#line 4117 "type.ec"
        break;
      case 183: /* specifier_qualifier_list */
/* Line 1398 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1398 of yacc.c  */
#line 4124 "type.ec"
        break;
      case 184: /* guess_specifier_qualifier_list */
/* Line 1398 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1398 of yacc.c  */
#line 4131 "type.ec"
        break;
      case 185: /* declaration_specifiers */
/* Line 1398 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1398 of yacc.c  */
#line 4138 "type.ec"
        break;
      case 186: /* guess_declaration_specifiers */
/* Line 1398 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1398 of yacc.c  */
#line 4145 "type.ec"
        break;
      case 190: /* init_declarator_list */
/* Line 1398 of yacc.c  */
#line 212 "type.y"
        { FreeList(((*yyvaluep).list), FreeInitDeclarator); };
/* Line 1398 of yacc.c  */
#line 4152 "type.ec"
        break;
      case 191: /* init_declarator */
/* Line 1398 of yacc.c  */
#line 186 "type.y"
        { FreeInitDeclarator(((*yyvaluep).initDeclarator)); };
/* Line 1398 of yacc.c  */
#line 4159 "type.ec"
        break;
      case 192: /* storage_class_specifier */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4166 "type.ec"
        break;
      case 193: /* ext_decl */
/* Line 1398 of yacc.c  */
#line 222 "type.y"
        { FreeExtDecl(((*yyvaluep).extDecl)); };
/* Line 1398 of yacc.c  */
#line 4173 "type.ec"
        break;
      case 195: /* multi_attrib */
/* Line 1398 of yacc.c  */
#line 225 "type.y"
        { FreeList(((*yyvaluep).list), FreeAttrib); };
/* Line 1398 of yacc.c  */
#line 4180 "type.ec"
        break;
      case 196: /* attribute_word */
/* Line 1398 of yacc.c  */
#line 202 "type.y"
        { delete ((*yyvaluep).string); };
/* Line 1398 of yacc.c  */
#line 4187 "type.ec"
        break;
      case 197: /* attribute */
/* Line 1398 of yacc.c  */
#line 223 "type.y"
        { FreeAttribute(((*yyvaluep).attribute)); };
/* Line 1398 of yacc.c  */
#line 4194 "type.ec"
        break;
      case 198: /* attribs_list */
/* Line 1398 of yacc.c  */
#line 224 "type.y"
        { FreeList(((*yyvaluep).list), FreeAttribute); };
/* Line 1398 of yacc.c  */
#line 4201 "type.ec"
        break;
      case 199: /* attrib */
/* Line 1398 of yacc.c  */
#line 221 "type.y"
        { FreeAttrib(((*yyvaluep).attrib)); };
/* Line 1398 of yacc.c  */
#line 4208 "type.ec"
        break;
      case 200: /* ext_storage */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4215 "type.ec"
        break;
      case 201: /* type_qualifier */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4222 "type.ec"
        break;
      case 202: /* type_specifier */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4229 "type.ec"
        break;
      case 203: /* strict_type_specifier */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4236 "type.ec"
        break;
      case 204: /* struct_or_union_specifier_compound */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4243 "type.ec"
        break;
      case 205: /* struct_or_union_specifier_nocompound */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4250 "type.ec"
        break;
      case 206: /* template_datatype */
/* Line 1398 of yacc.c  */
#line 220 "type.y"
        { FreeTemplateDataType(((*yyvaluep).templateDatatype)); };
/* Line 1398 of yacc.c  */
#line 4257 "type.ec"
        break;
      case 207: /* template_type_argument */
/* Line 1398 of yacc.c  */
#line 219 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1398 of yacc.c  */
#line 4264 "type.ec"
        break;
      case 208: /* template_expression_argument */
/* Line 1398 of yacc.c  */
#line 219 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1398 of yacc.c  */
#line 4271 "type.ec"
        break;
      case 209: /* template_argument */
/* Line 1398 of yacc.c  */
#line 219 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1398 of yacc.c  */
#line 4278 "type.ec"
        break;
      case 212: /* struct_declaration_list */
/* Line 1398 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeClassDef); };
/* Line 1398 of yacc.c  */
#line 4285 "type.ec"
        break;
      case 213: /* default_property */
/* Line 1398 of yacc.c  */
#line 195 "type.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1398 of yacc.c  */
#line 4292 "type.ec"
        break;
      case 214: /* default_property_list */
/* Line 1398 of yacc.c  */
#line 216 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1398 of yacc.c  */
#line 4299 "type.ec"
        break;
      case 215: /* property */
/* Line 1398 of yacc.c  */
#line 203 "type.y"
        { FreeProperty(((*yyvaluep).prop)); };
/* Line 1398 of yacc.c  */
#line 4306 "type.ec"
        break;
      case 216: /* struct_declaration */
/* Line 1398 of yacc.c  */
#line 201 "type.y"
        { FreeClassDef(((*yyvaluep).classDef)); };
/* Line 1398 of yacc.c  */
#line 4313 "type.ec"
        break;
      case 217: /* struct_declarator_list */
/* Line 1398 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeDeclarator); };
/* Line 1398 of yacc.c  */
#line 4320 "type.ec"
        break;
      case 218: /* struct_declarator */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4327 "type.ec"
        break;
      case 219: /* enum_specifier_nocompound */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4334 "type.ec"
        break;
      case 220: /* enum_specifier_compound */
/* Line 1398 of yacc.c  */
#line 176 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1398 of yacc.c  */
#line 4341 "type.ec"
        break;
      case 221: /* enumerator_list */
/* Line 1398 of yacc.c  */
#line 206 "type.y"
        { FreeList(((*yyvaluep).list), FreeEnumerator); };
/* Line 1398 of yacc.c  */
#line 4348 "type.ec"
        break;
      case 222: /* enumerator */
/* Line 1398 of yacc.c  */
#line 179 "type.y"
        { FreeEnumerator(((*yyvaluep).enumerator)); };
/* Line 1398 of yacc.c  */
#line 4355 "type.ec"
        break;
      case 223: /* direct_abstract_declarator */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4362 "type.ec"
        break;
      case 224: /* direct_abstract_declarator_noarray */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4369 "type.ec"
        break;
      case 225: /* abstract_declarator */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4376 "type.ec"
        break;
      case 226: /* abstract_declarator_noarray */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4383 "type.ec"
        break;
      case 227: /* declarator */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4390 "type.ec"
        break;
      case 228: /* direct_declarator_nofunction */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4397 "type.ec"
        break;
      case 229: /* declarator_function */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4404 "type.ec"
        break;
      case 230: /* direct_declarator_function_start */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4411 "type.ec"
        break;
      case 231: /* direct_declarator_function */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4418 "type.ec"
        break;
      case 232: /* direct_declarator */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4425 "type.ec"
        break;
      case 233: /* declarator_nofunction */
/* Line 1398 of yacc.c  */
#line 180 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1398 of yacc.c  */
#line 4432 "type.ec"
        break;
      case 234: /* type_qualifier_list */
/* Line 1398 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1398 of yacc.c  */
#line 4439 "type.ec"
        break;
      case 235: /* pointer */
/* Line 1398 of yacc.c  */
#line 169 "type.y"
        { FreePointer(((*yyvaluep).pointer)); };
/* Line 1398 of yacc.c  */
#line 4446 "type.ec"
        break;
      case 236: /* parameter_type_list */
/* Line 1398 of yacc.c  */
#line 213 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1398 of yacc.c  */
#line 4453 "type.ec"
        break;
      case 237: /* parameter_list */
/* Line 1398 of yacc.c  */
#line 213 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1398 of yacc.c  */
#line 4460 "type.ec"
        break;
      case 238: /* parameter_declaration */
/* Line 1398 of yacc.c  */
#line 187 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1398 of yacc.c  */
#line 4467 "type.ec"
        break;
      case 239: /* identifier_list */
/* Line 1398 of yacc.c  */
#line 213 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1398 of yacc.c  */
#line 4474 "type.ec"
        break;
      case 240: /* type_name */
/* Line 1398 of yacc.c  */
#line 187 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1398 of yacc.c  */
#line 4481 "type.ec"
        break;
      case 241: /* guess_type_name */
/* Line 1398 of yacc.c  */
#line 187 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1398 of yacc.c  */
#line 4488 "type.ec"
        break;
      case 242: /* initializer */
/* Line 1398 of yacc.c  */
#line 185 "type.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1398 of yacc.c  */
#line 4495 "type.ec"
        break;
      case 243: /* initializer_condition */
/* Line 1398 of yacc.c  */
#line 185 "type.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1398 of yacc.c  */
#line 4502 "type.ec"
        break;
      case 244: /* initializer_list */
/* Line 1398 of yacc.c  */
#line 211 "type.y"
        { FreeList(((*yyvaluep).list), FreeInitializer); };
/* Line 1398 of yacc.c  */
#line 4509 "type.ec"
        break;
      case 245: /* statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4516 "type.ec"
        break;
      case 246: /* labeled_statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4523 "type.ec"
        break;
      case 247: /* declaration_list */
/* Line 1398 of yacc.c  */
#line 210 "type.y"
        { FreeList(((*yyvaluep).list), FreeDeclaration); };
/* Line 1398 of yacc.c  */
#line 4530 "type.ec"
        break;
      case 248: /* statement_list */
/* Line 1398 of yacc.c  */
#line 214 "type.y"
        { FreeList(((*yyvaluep).list), FreeStatement); };
/* Line 1398 of yacc.c  */
#line 4537 "type.ec"
        break;
      case 249: /* compound_inside */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4544 "type.ec"
        break;
      case 250: /* compound_start */
/* Line 1398 of yacc.c  */
#line 218 "type.y"
        { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); };
/* Line 1398 of yacc.c  */
#line 4551 "type.ec"
        break;
      case 251: /* compound_statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4558 "type.ec"
        break;
      case 252: /* expression_statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4565 "type.ec"
        break;
      case 253: /* selection_statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4572 "type.ec"
        break;
      case 254: /* iteration_statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4579 "type.ec"
        break;
      case 255: /* jump_statement */
/* Line 1398 of yacc.c  */
#line 188 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1398 of yacc.c  */
#line 4586 "type.ec"
        break;
      case 256: /* string_literal */
/* Line 1398 of yacc.c  */
#line 202 "type.y"
        { delete ((*yyvaluep).string); };
/* Line 1398 of yacc.c  */
#line 4593 "type.ec"
        break;
      case 257: /* instantiation_named */
/* Line 1398 of yacc.c  */
#line 193 "type.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1398 of yacc.c  */
#line 4600 "type.ec"
        break;
      case 259: /* instantiation_unnamed */
/* Line 1398 of yacc.c  */
#line 193 "type.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1398 of yacc.c  */
#line 4607 "type.ec"
        break;
      case 261: /* class_function_definition */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 4614 "type.ec"
        break;
      case 262: /* instance_class_function_definition_start */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 4621 "type.ec"
        break;
      case 263: /* instance_class_function_definition */
/* Line 1398 of yacc.c  */
#line 197 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1398 of yacc.c  */
#line 4628 "type.ec"
        break;
      case 264: /* data_member_initialization */
/* Line 1398 of yacc.c  */
#line 195 "type.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1398 of yacc.c  */
#line 4635 "type.ec"
        break;
      case 265: /* data_member_initialization_list */
/* Line 1398 of yacc.c  */
#line 216 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1398 of yacc.c  */
#line 4642 "type.ec"
        break;
      case 266: /* data_member_initialization_list_coloned */
/* Line 1398 of yacc.c  */
#line 216 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1398 of yacc.c  */
#line 4649 "type.ec"
        break;
      case 267: /* members_initialization_list_coloned */
/* Line 1398 of yacc.c  */
#line 217 "type.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1398 of yacc.c  */
#line 4656 "type.ec"
        break;
      case 268: /* members_initialization_list */
/* Line 1398 of yacc.c  */
#line 217 "type.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1398 of yacc.c  */
#line 4663 "type.ec"
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
/* Line 1792 of yacc.c  */
#line 233 "type.y"
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
   }
    break;

  case 3:
/* Line 1792 of yacc.c  */
#line 251 "type.y"
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
   }
    break;

  case 4:
/* Line 1792 of yacc.c  */
#line 275 "type.y"
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
   }
    break;

  case 5:
/* Line 1792 of yacc.c  */
#line 314 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); }
    break;

  case 6:
/* Line 1792 of yacc.c  */
#line 316 "type.y"
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
   }
    break;

  case 7:
/* Line 1792 of yacc.c  */
#line 342 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); }
    break;

  case 9:
/* Line 1792 of yacc.c  */
#line 347 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); }
    break;

  case 10:
/* Line 1792 of yacc.c  */
#line 349 "type.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (4)].specifier);
      SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list));
      (yyval.specifier).loc = (yyloc);

      (yylsp[(4) - (4)]).end.pos--;
      fileInput.Seek((yylsp[(4) - (4)]).end.pos, start);
      resetScannerPos(&(yylsp[(4) - (4)]).end);
      yyclearin;
    }
    break;

  case 11:
/* Line 1792 of yacc.c  */
#line 366 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 12:
/* Line 1792 of yacc.c  */
#line 368 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 13:
/* Line 1792 of yacc.c  */
#line 373 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); }
    break;

  case 14:
/* Line 1792 of yacc.c  */
#line 378 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); }
    break;

  case 15:
/* Line 1792 of yacc.c  */
#line 383 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 16:
/* Line 1792 of yacc.c  */
#line 385 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 17:
/* Line 1792 of yacc.c  */
#line 390 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); }
    break;

  case 19:
/* Line 1792 of yacc.c  */
#line 396 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); }
    break;

  case 20:
/* Line 1792 of yacc.c  */
#line 401 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 21:
/* Line 1792 of yacc.c  */
#line 403 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); }
    break;

  case 22:
/* Line 1792 of yacc.c  */
#line 405 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); }
    break;

  case 23:
/* Line 1792 of yacc.c  */
#line 406 "type.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); }
    break;

  case 24:
/* Line 1792 of yacc.c  */
#line 408 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 25:
/* Line 1792 of yacc.c  */
#line 409 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 26:
/* Line 1792 of yacc.c  */
#line 410 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 27:
/* Line 1792 of yacc.c  */
#line 412 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); }
    break;

  case 28:
/* Line 1792 of yacc.c  */
#line 414 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 29:
/* Line 1792 of yacc.c  */
#line 415 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 30:
/* Line 1792 of yacc.c  */
#line 416 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 31:
/* Line 1792 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 32:
/* Line 1792 of yacc.c  */
#line 418 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 33:
/* Line 1792 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 34:
/* Line 1792 of yacc.c  */
#line 420 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 35:
/* Line 1792 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 36:
/* Line 1792 of yacc.c  */
#line 422 "type.y"
    { (yyval.exp) = MkExpDummy(); }
    break;

  case 38:
/* Line 1792 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); }
    break;

  case 39:
/* Line 1792 of yacc.c  */
#line 428 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); }
    break;

  case 40:
/* Line 1792 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); }
    break;

  case 41:
/* Line 1792 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 42:
/* Line 1792 of yacc.c  */
#line 432 "type.y"
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

  case 43:
/* Line 1792 of yacc.c  */
#line 444 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 44:
/* Line 1792 of yacc.c  */
#line 445 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); }
    break;

  case 45:
/* Line 1792 of yacc.c  */
#line 446 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); }
    break;

  case 46:
/* Line 1792 of yacc.c  */
#line 450 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); }
    break;

  case 47:
/* Line 1792 of yacc.c  */
#line 479 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 48:
/* Line 1792 of yacc.c  */
#line 480 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 49:
/* Line 1792 of yacc.c  */
#line 481 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  }
    break;

  case 50:
/* Line 1792 of yacc.c  */
#line 482 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  }
    break;

  case 51:
/* Line 1792 of yacc.c  */
#line 486 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 52:
/* Line 1792 of yacc.c  */
#line 487 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 53:
/* Line 1792 of yacc.c  */
#line 488 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 54:
/* Line 1792 of yacc.c  */
#line 490 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 55:
/* Line 1792 of yacc.c  */
#line 491 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); }
    break;

  case 56:
/* Line 1792 of yacc.c  */
#line 493 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 57:
/* Line 1792 of yacc.c  */
#line 494 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); }
    break;

  case 60:
/* Line 1792 of yacc.c  */
#line 508 "type.y"
    { (yyval.i) = '&'; }
    break;

  case 61:
/* Line 1792 of yacc.c  */
#line 509 "type.y"
    { (yyval.i) = '*'; }
    break;

  case 62:
/* Line 1792 of yacc.c  */
#line 510 "type.y"
    { (yyval.i) = '+'; }
    break;

  case 63:
/* Line 1792 of yacc.c  */
#line 511 "type.y"
    { (yyval.i) = '-'; }
    break;

  case 64:
/* Line 1792 of yacc.c  */
#line 512 "type.y"
    { (yyval.i) = '~'; }
    break;

  case 65:
/* Line 1792 of yacc.c  */
#line 513 "type.y"
    { (yyval.i) = '!'; }
    break;

  case 66:
/* Line 1792 of yacc.c  */
#line 514 "type.y"
    { (yyval.i) = DELETE; }
    break;

  case 68:
/* Line 1792 of yacc.c  */
#line 519 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 70:
/* Line 1792 of yacc.c  */
#line 524 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 71:
/* Line 1792 of yacc.c  */
#line 525 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 72:
/* Line 1792 of yacc.c  */
#line 526 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 74:
/* Line 1792 of yacc.c  */
#line 531 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 75:
/* Line 1792 of yacc.c  */
#line 532 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 77:
/* Line 1792 of yacc.c  */
#line 537 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 78:
/* Line 1792 of yacc.c  */
#line 538 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 79:
/* Line 1792 of yacc.c  */
#line 543 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   }
    break;

  case 81:
/* Line 1792 of yacc.c  */
#line 551 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); }
    break;

  case 82:
/* Line 1792 of yacc.c  */
#line 552 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 83:
/* Line 1792 of yacc.c  */
#line 553 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 84:
/* Line 1792 of yacc.c  */
#line 554 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 86:
/* Line 1792 of yacc.c  */
#line 559 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 87:
/* Line 1792 of yacc.c  */
#line 560 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 89:
/* Line 1792 of yacc.c  */
#line 565 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 91:
/* Line 1792 of yacc.c  */
#line 570 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 93:
/* Line 1792 of yacc.c  */
#line 575 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 95:
/* Line 1792 of yacc.c  */
#line 580 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 97:
/* Line 1792 of yacc.c  */
#line 585 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 99:
/* Line 1792 of yacc.c  */
#line 590 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 101:
/* Line 1792 of yacc.c  */
#line 595 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 102:
/* Line 1792 of yacc.c  */
#line 596 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 103:
/* Line 1792 of yacc.c  */
#line 600 "type.y"
    { (yyval.i) = '='; }
    break;

  case 104:
/* Line 1792 of yacc.c  */
#line 601 "type.y"
    { (yyval.i) = MUL_ASSIGN; }
    break;

  case 105:
/* Line 1792 of yacc.c  */
#line 602 "type.y"
    { (yyval.i) = DIV_ASSIGN; }
    break;

  case 106:
/* Line 1792 of yacc.c  */
#line 603 "type.y"
    { (yyval.i) = MOD_ASSIGN; }
    break;

  case 107:
/* Line 1792 of yacc.c  */
#line 604 "type.y"
    { (yyval.i) = ADD_ASSIGN; }
    break;

  case 108:
/* Line 1792 of yacc.c  */
#line 605 "type.y"
    { (yyval.i) = SUB_ASSIGN; }
    break;

  case 109:
/* Line 1792 of yacc.c  */
#line 606 "type.y"
    { (yyval.i) = LEFT_ASSIGN; }
    break;

  case 110:
/* Line 1792 of yacc.c  */
#line 607 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; }
    break;

  case 111:
/* Line 1792 of yacc.c  */
#line 608 "type.y"
    { (yyval.i) = AND_ASSIGN; }
    break;

  case 112:
/* Line 1792 of yacc.c  */
#line 609 "type.y"
    { (yyval.i) = XOR_ASSIGN; }
    break;

  case 113:
/* Line 1792 of yacc.c  */
#line 610 "type.y"
    { (yyval.i) = OR_ASSIGN; }
    break;

  case 114:
/* Line 1792 of yacc.c  */
#line 614 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 115:
/* Line 1792 of yacc.c  */
#line 615 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); }
    break;

  case 117:
/* Line 1792 of yacc.c  */
#line 623 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); }
    break;

  case 118:
/* Line 1792 of yacc.c  */
#line 624 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); }
    break;

  case 119:
/* Line 1792 of yacc.c  */
#line 625 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); }
    break;

  case 120:
/* Line 1792 of yacc.c  */
#line 626 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); }
    break;

  case 121:
/* Line 1792 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 122:
/* Line 1792 of yacc.c  */
#line 631 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 123:
/* Line 1792 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 124:
/* Line 1792 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 125:
/* Line 1792 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 126:
/* Line 1792 of yacc.c  */
#line 635 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 127:
/* Line 1792 of yacc.c  */
#line 636 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 128:
/* Line 1792 of yacc.c  */
#line 637 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 129:
/* Line 1792 of yacc.c  */
#line 641 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 130:
/* Line 1792 of yacc.c  */
#line 642 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 131:
/* Line 1792 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 132:
/* Line 1792 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 133:
/* Line 1792 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 134:
/* Line 1792 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 135:
/* Line 1792 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 136:
/* Line 1792 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 137:
/* Line 1792 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 138:
/* Line 1792 of yacc.c  */
#line 650 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 139:
/* Line 1792 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 140:
/* Line 1792 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 141:
/* Line 1792 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 142:
/* Line 1792 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 143:
/* Line 1792 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 144:
/* Line 1792 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 145:
/* Line 1792 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 146:
/* Line 1792 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 147:
/* Line 1792 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 148:
/* Line 1792 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 149:
/* Line 1792 of yacc.c  */
#line 667 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 150:
/* Line 1792 of yacc.c  */
#line 668 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 151:
/* Line 1792 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 152:
/* Line 1792 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 153:
/* Line 1792 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 154:
/* Line 1792 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 155:
/* Line 1792 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 156:
/* Line 1792 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 157:
/* Line 1792 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 158:
/* Line 1792 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 159:
/* Line 1792 of yacc.c  */
#line 677 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 160:
/* Line 1792 of yacc.c  */
#line 678 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 161:
/* Line 1792 of yacc.c  */
#line 682 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); }
    break;

  case 162:
/* Line 1792 of yacc.c  */
#line 683 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 163:
/* Line 1792 of yacc.c  */
#line 687 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 164:
/* Line 1792 of yacc.c  */
#line 688 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 165:
/* Line 1792 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 166:
/* Line 1792 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 167:
/* Line 1792 of yacc.c  */
#line 691 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 168:
/* Line 1792 of yacc.c  */
#line 692 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 169:
/* Line 1792 of yacc.c  */
#line 693 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 170:
/* Line 1792 of yacc.c  */
#line 694 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); }
    break;

  case 171:
/* Line 1792 of yacc.c  */
#line 696 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      }
    break;

  case 172:
/* Line 1792 of yacc.c  */
#line 704 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      }
    break;

  case 173:
/* Line 1792 of yacc.c  */
#line 712 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 174:
/* Line 1792 of yacc.c  */
#line 713 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 175:
/* Line 1792 of yacc.c  */
#line 714 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 176:
/* Line 1792 of yacc.c  */
#line 715 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 177:
/* Line 1792 of yacc.c  */
#line 716 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 178:
/* Line 1792 of yacc.c  */
#line 717 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 179:
/* Line 1792 of yacc.c  */
#line 718 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 180:
/* Line 1792 of yacc.c  */
#line 719 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 181:
/* Line 1792 of yacc.c  */
#line 720 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 182:
/* Line 1792 of yacc.c  */
#line 721 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 183:
/* Line 1792 of yacc.c  */
#line 722 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 184:
/* Line 1792 of yacc.c  */
#line 723 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); }
    break;

  case 185:
/* Line 1792 of yacc.c  */
#line 725 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      }
    break;

  case 186:
/* Line 1792 of yacc.c  */
#line 733 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      }
    break;

  case 187:
/* Line 1792 of yacc.c  */
#line 741 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); }
    break;

  case 188:
/* Line 1792 of yacc.c  */
#line 742 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); }
    break;

  case 189:
/* Line 1792 of yacc.c  */
#line 746 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); }
    break;

  case 190:
/* Line 1792 of yacc.c  */
#line 747 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; }
    break;

  case 191:
/* Line 1792 of yacc.c  */
#line 751 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); }
    break;

  case 192:
/* Line 1792 of yacc.c  */
#line 752 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); }
    break;

  case 193:
/* Line 1792 of yacc.c  */
#line 753 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); }
    break;

  case 194:
/* Line 1792 of yacc.c  */
#line 754 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); }
    break;

  case 195:
/* Line 1792 of yacc.c  */
#line 755 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); }
    break;

  case 196:
/* Line 1792 of yacc.c  */
#line 756 "type.y"
    { (yyval.specifier) = MkSpecifier(THREAD); }
    break;

  case 197:
/* Line 1792 of yacc.c  */
#line 760 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
    break;

  case 198:
/* Line 1792 of yacc.c  */
#line 761 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
    break;

  case 199:
/* Line 1792 of yacc.c  */
#line 762 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); }
    break;

  case 200:
/* Line 1792 of yacc.c  */
#line 763 "type.y"
    { (yyval.extDecl) = MkExtDeclMultiAttrib((yyvsp[(1) - (1)].list)); }
    break;

  case 201:
/* Line 1792 of yacc.c  */
#line 767 "type.y"
    { (yyval.i) = ATTRIB; }
    break;

  case 202:
/* Line 1792 of yacc.c  */
#line 768 "type.y"
    { (yyval.i) = ATTRIB_DEP; }
    break;

  case 203:
/* Line 1792 of yacc.c  */
#line 769 "type.y"
    { (yyval.i) = __ATTRIB; }
    break;

  case 204:
/* Line 1792 of yacc.c  */
#line 773 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attrib)); }
    break;

  case 205:
/* Line 1792 of yacc.c  */
#line 774 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attrib)); }
    break;

  case 206:
/* Line 1792 of yacc.c  */
#line 777 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 207:
/* Line 1792 of yacc.c  */
#line 778 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 208:
/* Line 1792 of yacc.c  */
#line 779 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 209:
/* Line 1792 of yacc.c  */
#line 780 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 210:
/* Line 1792 of yacc.c  */
#line 781 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 211:
/* Line 1792 of yacc.c  */
#line 785 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); }
    break;

  case 212:
/* Line 1792 of yacc.c  */
#line 786 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); }
    break;

  case 213:
/* Line 1792 of yacc.c  */
#line 790 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); }
    break;

  case 214:
/* Line 1792 of yacc.c  */
#line 791 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 215:
/* Line 1792 of yacc.c  */
#line 792 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 216:
/* Line 1792 of yacc.c  */
#line 796 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); }
    break;

  case 217:
/* Line 1792 of yacc.c  */
#line 797 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); }
    break;

  case 218:
/* Line 1792 of yacc.c  */
#line 801 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); }
    break;

  case 219:
/* Line 1792 of yacc.c  */
#line 805 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); }
    break;

  case 220:
/* Line 1792 of yacc.c  */
#line 806 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); }
    break;

  case 221:
/* Line 1792 of yacc.c  */
#line 807 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); }
    break;

  case 222:
/* Line 1792 of yacc.c  */
#line 812 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 223:
/* Line 1792 of yacc.c  */
#line 813 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 224:
/* Line 1792 of yacc.c  */
#line 814 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 225:
/* Line 1792 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 226:
/* Line 1792 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 227:
/* Line 1792 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 228:
/* Line 1792 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 229:
/* Line 1792 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 230:
/* Line 1792 of yacc.c  */
#line 820 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 231:
/* Line 1792 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 232:
/* Line 1792 of yacc.c  */
#line 822 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 233:
/* Line 1792 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 234:
/* Line 1792 of yacc.c  */
#line 824 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 235:
/* Line 1792 of yacc.c  */
#line 825 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 236:
/* Line 1792 of yacc.c  */
#line 826 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 237:
/* Line 1792 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 238:
/* Line 1792 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 242:
/* Line 1792 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); }
    break;

  case 243:
/* Line 1792 of yacc.c  */
#line 833 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 244:
/* Line 1792 of yacc.c  */
#line 834 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); }
    break;

  case 245:
/* Line 1792 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 246:
/* Line 1792 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); }
    break;

  case 247:
/* Line 1792 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); }
    break;

  case 248:
/* Line 1792 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 249:
/* Line 1792 of yacc.c  */
#line 842 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 250:
/* Line 1792 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 251:
/* Line 1792 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 252:
/* Line 1792 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 253:
/* Line 1792 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 254:
/* Line 1792 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 255:
/* Line 1792 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 256:
/* Line 1792 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 257:
/* Line 1792 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 258:
/* Line 1792 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 259:
/* Line 1792 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 260:
/* Line 1792 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 261:
/* Line 1792 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 262:
/* Line 1792 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 263:
/* Line 1792 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 264:
/* Line 1792 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 268:
/* Line 1792 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); }
    break;

  case 269:
/* Line 1792 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 270:
/* Line 1792 of yacc.c  */
#line 863 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); }
    break;

  case 271:
/* Line 1792 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 272:
/* Line 1792 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 273:
/* Line 1792 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); }
    break;

  case 274:
/* Line 1792 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); }
    break;

  case 275:
/* Line 1792 of yacc.c  */
#line 872 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); }
    break;

  case 276:
/* Line 1792 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 277:
/* Line 1792 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); }
    break;

  case 278:
/* Line 1792 of yacc.c  */
#line 877 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); }
    break;

  case 279:
/* Line 1792 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); }
    break;

  case 280:
/* Line 1792 of yacc.c  */
#line 879 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); }
    break;

  case 281:
/* Line 1792 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); }
    break;

  case 282:
/* Line 1792 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 283:
/* Line 1792 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 284:
/* Line 1792 of yacc.c  */
#line 890 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); }
    break;

  case 285:
/* Line 1792 of yacc.c  */
#line 892 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); }
    break;

  case 286:
/* Line 1792 of yacc.c  */
#line 896 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); }
    break;

  case 287:
/* Line 1792 of yacc.c  */
#line 897 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 288:
/* Line 1792 of yacc.c  */
#line 902 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); }
    break;

  case 289:
/* Line 1792 of yacc.c  */
#line 903 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); }
    break;

  case 290:
/* Line 1792 of yacc.c  */
#line 914 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); }
    break;

  case 293:
/* Line 1792 of yacc.c  */
#line 921 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); }
    break;

  case 294:
/* Line 1792 of yacc.c  */
#line 923 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); }
    break;

  case 295:
/* Line 1792 of yacc.c  */
#line 925 "type.y"
    {
      (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument);
      if((yyvsp[(1) - (3)].templateDatatype).specifiers && (yyvsp[(1) - (3)].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[(1) - (3)].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType((yyvsp[(1) - (3)].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   }
    break;

  case 296:
/* Line 1792 of yacc.c  */
#line 951 "type.y"
    {
      (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument);
      if((yyvsp[(1) - (3)].templateDatatype).specifiers && (yyvsp[(1) - (3)].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[(1) - (3)].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType((yyvsp[(1) - (3)].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   }
    break;

  case 297:
/* Line 1792 of yacc.c  */
#line 967 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); }
    break;

  case 298:
/* Line 1792 of yacc.c  */
#line 968 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); }
    break;

  case 299:
/* Line 1792 of yacc.c  */
#line 972 "type.y"
    { (yyval.specifierType) = structSpecifier; }
    break;

  case 300:
/* Line 1792 of yacc.c  */
#line 973 "type.y"
    { (yyval.specifierType) = unionSpecifier; }
    break;

  case 301:
/* Line 1792 of yacc.c  */
#line 977 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); }
    break;

  case 302:
/* Line 1792 of yacc.c  */
#line 978 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); }
    break;

  case 303:
/* Line 1792 of yacc.c  */
#line 982 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); }
    break;

  case 304:
/* Line 1792 of yacc.c  */
#line 986 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
    break;

  case 305:
/* Line 1792 of yacc.c  */
#line 987 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 306:
/* Line 1792 of yacc.c  */
#line 992 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 307:
/* Line 1792 of yacc.c  */
#line 994 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 308:
/* Line 1792 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 309:
/* Line 1792 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 310:
/* Line 1792 of yacc.c  */
#line 1000 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 311:
/* Line 1792 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 312:
/* Line 1792 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 313:
/* Line 1792 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 314:
/* Line 1792 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 315:
/* Line 1792 of yacc.c  */
#line 1011 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 316:
/* Line 1792 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 317:
/* Line 1792 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 318:
/* Line 1792 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 319:
/* Line 1792 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 320:
/* Line 1792 of yacc.c  */
#line 1022 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 321:
/* Line 1792 of yacc.c  */
#line 1025 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 322:
/* Line 1792 of yacc.c  */
#line 1027 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 323:
/* Line 1792 of yacc.c  */
#line 1029 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 324:
/* Line 1792 of yacc.c  */
#line 1031 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 325:
/* Line 1792 of yacc.c  */
#line 1033 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 326:
/* Line 1792 of yacc.c  */
#line 1037 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 327:
/* Line 1792 of yacc.c  */
#line 1038 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 328:
/* Line 1792 of yacc.c  */
#line 1039 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 329:
/* Line 1792 of yacc.c  */
#line 1040 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 330:
/* Line 1792 of yacc.c  */
#line 1041 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); }
    break;

  case 331:
/* Line 1792 of yacc.c  */
#line 1042 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); }
    break;

  case 332:
/* Line 1792 of yacc.c  */
#line 1043 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); }
    break;

  case 333:
/* Line 1792 of yacc.c  */
#line 1044 "type.y"
    { (yyval.classDef) = null; }
    break;

  case 334:
/* Line 1792 of yacc.c  */
#line 1049 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); }
    break;

  case 335:
/* Line 1792 of yacc.c  */
#line 1051 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); }
    break;

  case 336:
/* Line 1792 of yacc.c  */
#line 1056 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); }
    break;

  case 337:
/* Line 1792 of yacc.c  */
#line 1058 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); }
    break;

  case 338:
/* Line 1792 of yacc.c  */
#line 1060 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 339:
/* Line 1792 of yacc.c  */
#line 1062 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 340:
/* Line 1792 of yacc.c  */
#line 1064 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); }
    break;

  case 341:
/* Line 1792 of yacc.c  */
#line 1068 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 342:
/* Line 1792 of yacc.c  */
#line 1069 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 343:
/* Line 1792 of yacc.c  */
#line 1074 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); }
    break;

  case 344:
/* Line 1792 of yacc.c  */
#line 1075 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 345:
/* Line 1792 of yacc.c  */
#line 1076 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); }
    break;

  case 346:
/* Line 1792 of yacc.c  */
#line 1077 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); }
    break;

  case 347:
/* Line 1792 of yacc.c  */
#line 1078 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 348:
/* Line 1792 of yacc.c  */
#line 1083 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); }
    break;

  case 349:
/* Line 1792 of yacc.c  */
#line 1085 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); }
    break;

  case 350:
/* Line 1792 of yacc.c  */
#line 1090 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null, null); }
    break;

  case 351:
/* Line 1792 of yacc.c  */
#line 1092 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp), null); }
    break;

  case 352:
/* Line 1792 of yacc.c  */
#line 1093 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (2)].id), null, (yyvsp[(2) - (2)].list)); }
    break;

  case 353:
/* Line 1792 of yacc.c  */
#line 1094 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (4)].id), (yyvsp[(4) - (4)].exp), (yyvsp[(2) - (4)].list)); }
    break;

  case 354:
/* Line 1792 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 355:
/* Line 1792 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
    break;

  case 356:
/* Line 1792 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); }
    break;

  case 357:
/* Line 1792 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); }
    break;

  case 358:
/* Line 1792 of yacc.c  */
#line 1107 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 359:
/* Line 1792 of yacc.c  */
#line 1109 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 360:
/* Line 1792 of yacc.c  */
#line 1111 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 361:
/* Line 1792 of yacc.c  */
#line 1113 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 362:
/* Line 1792 of yacc.c  */
#line 1115 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 363:
/* Line 1792 of yacc.c  */
#line 1117 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 364:
/* Line 1792 of yacc.c  */
#line 1119 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 365:
/* Line 1792 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 366:
/* Line 1792 of yacc.c  */
#line 1126 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 367:
/* Line 1792 of yacc.c  */
#line 1128 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 368:
/* Line 1792 of yacc.c  */
#line 1130 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 369:
/* Line 1792 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 370:
/* Line 1792 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 372:
/* Line 1792 of yacc.c  */
#line 1138 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 373:
/* Line 1792 of yacc.c  */
#line 1139 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 374:
/* Line 1792 of yacc.c  */
#line 1140 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 375:
/* Line 1792 of yacc.c  */
#line 1141 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 376:
/* Line 1792 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 378:
/* Line 1792 of yacc.c  */
#line 1147 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 379:
/* Line 1792 of yacc.c  */
#line 1148 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 380:
/* Line 1792 of yacc.c  */
#line 1149 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 381:
/* Line 1792 of yacc.c  */
#line 1150 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 383:
/* Line 1792 of yacc.c  */
#line 1198 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 384:
/* Line 1792 of yacc.c  */
#line 1200 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 385:
/* Line 1792 of yacc.c  */
#line 1202 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); }
    break;

  case 386:
/* Line 1792 of yacc.c  */
#line 1207 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 387:
/* Line 1792 of yacc.c  */
#line 1209 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 388:
/* Line 1792 of yacc.c  */
#line 1211 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 389:
/* Line 1792 of yacc.c  */
#line 1213 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 390:
/* Line 1792 of yacc.c  */
#line 1215 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 392:
/* Line 1792 of yacc.c  */
#line 1221 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 393:
/* Line 1792 of yacc.c  */
#line 1224 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 394:
/* Line 1792 of yacc.c  */
#line 1226 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 395:
/* Line 1792 of yacc.c  */
#line 1228 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 397:
/* Line 1792 of yacc.c  */
#line 1238 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 398:
/* Line 1792 of yacc.c  */
#line 1240 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 399:
/* Line 1792 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); }
    break;

  case 402:
/* Line 1792 of yacc.c  */
#line 1249 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 403:
/* Line 1792 of yacc.c  */
#line 1251 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 405:
/* Line 1792 of yacc.c  */
#line 1256 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 406:
/* Line 1792 of yacc.c  */
#line 1257 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 407:
/* Line 1792 of yacc.c  */
#line 1258 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 408:
/* Line 1792 of yacc.c  */
#line 1259 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 409:
/* Line 1792 of yacc.c  */
#line 1263 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 410:
/* Line 1792 of yacc.c  */
#line 1264 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  }
    break;

  case 411:
/* Line 1792 of yacc.c  */
#line 1268 "type.y"
    { (yyval.pointer) = MkPointer(null, null); }
    break;

  case 412:
/* Line 1792 of yacc.c  */
#line 1269 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); }
    break;

  case 413:
/* Line 1792 of yacc.c  */
#line 1270 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); }
    break;

  case 414:
/* Line 1792 of yacc.c  */
#line 1271 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); }
    break;

  case 416:
/* Line 1792 of yacc.c  */
#line 1276 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); }
    break;

  case 417:
/* Line 1792 of yacc.c  */
#line 1280 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); }
    break;

  case 418:
/* Line 1792 of yacc.c  */
#line 1281 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); }
    break;

  case 419:
/* Line 1792 of yacc.c  */
#line 1285 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 420:
/* Line 1792 of yacc.c  */
#line 1286 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 421:
/* Line 1792 of yacc.c  */
#line 1287 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); }
    break;

  case 422:
/* Line 1792 of yacc.c  */
#line 1288 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 423:
/* Line 1792 of yacc.c  */
#line 1289 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 424:
/* Line 1792 of yacc.c  */
#line 1301 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); }
    break;

  case 425:
/* Line 1792 of yacc.c  */
#line 1325 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); }
    break;

  case 426:
/* Line 1792 of yacc.c  */
#line 1326 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); }
    break;

  case 427:
/* Line 1792 of yacc.c  */
#line 1330 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 428:
/* Line 1792 of yacc.c  */
#line 1331 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 429:
/* Line 1792 of yacc.c  */
#line 1335 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 430:
/* Line 1792 of yacc.c  */
#line 1336 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 431:
/* Line 1792 of yacc.c  */
#line 1341 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 432:
/* Line 1792 of yacc.c  */
#line 1343 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); }
    break;

  case 433:
/* Line 1792 of yacc.c  */
#line 1345 "type.y"
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

  case 434:
/* Line 1792 of yacc.c  */
#line 1361 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 435:
/* Line 1792 of yacc.c  */
#line 1363 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 436:
/* Line 1792 of yacc.c  */
#line 1385 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); }
    break;

  case 437:
/* Line 1792 of yacc.c  */
#line 1387 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); }
    break;

  case 444:
/* Line 1792 of yacc.c  */
#line 1401 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 445:
/* Line 1792 of yacc.c  */
#line 1403 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; }
    break;

  case 446:
/* Line 1792 of yacc.c  */
#line 1405 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 447:
/* Line 1792 of yacc.c  */
#line 1409 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); }
    break;

  case 448:
/* Line 1792 of yacc.c  */
#line 1410 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); }
    break;

  case 449:
/* Line 1792 of yacc.c  */
#line 1414 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); }
    break;

  case 450:
/* Line 1792 of yacc.c  */
#line 1415 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); }
    break;

  case 451:
/* Line 1792 of yacc.c  */
#line 1418 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 452:
/* Line 1792 of yacc.c  */
#line 1422 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); }
    break;

  case 453:
/* Line 1792 of yacc.c  */
#line 1423 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); }
    break;

  case 454:
/* Line 1792 of yacc.c  */
#line 1424 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); }
    break;

  case 455:
/* Line 1792 of yacc.c  */
#line 1428 "type.y"
    { (yyval.context) = PushContext(); }
    break;

  case 456:
/* Line 1792 of yacc.c  */
#line 1433 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
    break;

  case 457:
/* Line 1792 of yacc.c  */
#line 1441 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); }
    break;

  case 458:
/* Line 1792 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
    break;

  case 459:
/* Line 1792 of yacc.c  */
#line 1446 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 460:
/* Line 1792 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); }
    break;

  case 461:
/* Line 1792 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 462:
/* Line 1792 of yacc.c  */
#line 1452 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 463:
/* Line 1792 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 464:
/* Line 1792 of yacc.c  */
#line 1457 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 465:
/* Line 1792 of yacc.c  */
#line 1458 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 466:
/* Line 1792 of yacc.c  */
#line 1459 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 467:
/* Line 1792 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 468:
/* Line 1792 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 469:
/* Line 1792 of yacc.c  */
#line 1463 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 470:
/* Line 1792 of yacc.c  */
#line 1467 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); }
    break;

  case 471:
/* Line 1792 of yacc.c  */
#line 1468 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 472:
/* Line 1792 of yacc.c  */
#line 1469 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 473:
/* Line 1792 of yacc.c  */
#line 1470 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); }
    break;

  case 474:
/* Line 1792 of yacc.c  */
#line 1471 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 475:
/* Line 1792 of yacc.c  */
#line 1475 "type.y"
    { (yyval.string) = CopyString(yytext); }
    break;

  case 476:
/* Line 1792 of yacc.c  */
#line 1480 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 477:
/* Line 1792 of yacc.c  */
#line 1482 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 478:
/* Line 1792 of yacc.c  */
#line 1487 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 479:
/* Line 1792 of yacc.c  */
#line 1489 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 480:
/* Line 1792 of yacc.c  */
#line 1514 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; }
    break;

  case 481:
/* Line 1792 of yacc.c  */
#line 1516 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;}
    break;

  case 482:
/* Line 1792 of yacc.c  */
#line 1518 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); }
    break;

  case 483:
/* Line 1792 of yacc.c  */
#line 1520 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); }
    break;

  case 484:
/* Line 1792 of yacc.c  */
#line 1525 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; }
    break;

  case 485:
/* Line 1792 of yacc.c  */
#line 1527 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;}
    break;

  case 486:
/* Line 1792 of yacc.c  */
#line 1531 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 487:
/* Line 1792 of yacc.c  */
#line 1533 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 488:
/* Line 1792 of yacc.c  */
#line 1535 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 489:
/* Line 1792 of yacc.c  */
#line 1537 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 490:
/* Line 1792 of yacc.c  */
#line 1539 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 491:
/* Line 1792 of yacc.c  */
#line 1545 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 492:
/* Line 1792 of yacc.c  */
#line 1547 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 493:
/* Line 1792 of yacc.c  */
#line 1552 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 494:
/* Line 1792 of yacc.c  */
#line 1556 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;}
    break;

  case 495:
/* Line 1792 of yacc.c  */
#line 1557 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
    break;

  case 496:
/* Line 1792 of yacc.c  */
#line 1562 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); }
    break;

  case 497:
/* Line 1792 of yacc.c  */
#line 1564 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 498:
/* Line 1792 of yacc.c  */
#line 1569 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 499:
/* Line 1792 of yacc.c  */
#line 1573 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); }
    break;

  case 500:
/* Line 1792 of yacc.c  */
#line 1574 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 501:
/* Line 1792 of yacc.c  */
#line 1575 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  }
    break;

  case 502:
/* Line 1792 of yacc.c  */
#line 1576 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  }
    break;

  case 503:
/* Line 1792 of yacc.c  */
#line 1577 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  }
    break;

  case 504:
/* Line 1792 of yacc.c  */
#line 1578 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 506:
/* Line 1792 of yacc.c  */
#line 1583 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 507:
/* Line 1792 of yacc.c  */
#line 1584 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); }
    break;

  case 508:
/* Line 1792 of yacc.c  */
#line 1588 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); }
    break;

  case 509:
/* Line 1792 of yacc.c  */
#line 1589 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); }
    break;


/* Line 1792 of yacc.c  */
#line 7924 "type.ec"
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


/* Line 2055 of yacc.c  */
#line 1592 "type.y"

