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
#line 305 "type.ec"
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
#line 346 "type.ec"

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
#define YYFINAL  104
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9564

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  149
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  124
/* YYNRULES -- Number of rules.  */
#define YYNRULES  511
/* YYNRULES -- Number of states.  */
#define YYNSTATES  871

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
       2,     2,     2,   138,     2,     2,   130,   140,   135,     2,
     127,   128,   124,   136,   134,   137,   131,   139,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   144,   146,
     125,   145,   126,   143,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   132,     2,   133,   141,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   147,   142,   148,   129,     2,     2,     2,
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
     696,   698,   700,   702,   707,   712,   717,   719,   721,   723,
     725,   727,   729,   731,   733,   735,   737,   739,   741,   743,
     745,   747,   749,   751,   753,   755,   757,   759,   761,   763,
     765,   770,   775,   780,   782,   788,   793,   798,   802,   808,
     815,   821,   827,   832,   839,   842,   845,   849,   853,   855,
     858,   860,   863,   865,   867,   869,   873,   877,   881,   885,
     887,   891,   893,   895,   897,   900,   904,   906,   910,   920,
     930,   938,   946,   952,   963,   974,   983,   992,   999,  1008,
    1017,  1024,  1031,  1036,  1046,  1056,  1064,  1072,  1078,  1082,
    1085,  1088,  1091,  1093,  1096,  1098,  1100,  1102,  1106,  1108,
    1111,  1114,  1118,  1124,  1127,  1130,  1135,  1141,  1149,  1157,
    1163,  1165,  1169,  1171,  1175,  1178,  1183,  1187,  1190,  1194,
    1198,  1202,  1207,  1212,  1215,  1219,  1223,  1228,  1232,  1235,
    1239,  1243,  1248,  1250,  1252,  1255,  1258,  1261,  1265,  1267,
    1269,  1272,  1275,  1278,  1282,  1284,  1287,  1291,  1294,  1296,
    1300,  1305,  1309,  1314,  1316,  1319,  1322,  1326,  1330,  1333,
    1337,  1341,  1344,  1346,  1348,  1351,  1354,  1356,  1359,  1362,
    1366,  1370,  1372,  1375,  1377,  1380,  1383,  1387,  1389,  1393,
    1395,  1399,  1402,  1405,  1408,  1412,  1414,  1416,  1418,  1422,
    1424,  1427,  1429,  1432,  1434,  1438,  1443,  1445,  1447,  1449,
    1453,  1455,  1457,  1459,  1461,  1463,  1465,  1469,  1474,  1478,
    1480,  1483,  1485,  1488,  1491,  1493,  1495,  1498,  1500,  1503,
    1507,  1509,  1512,  1518,  1526,  1532,  1538,  1546,  1553,  1561,
    1566,  1572,  1577,  1581,  1584,  1587,  1590,  1594,  1596,  1602,
    1607,  1613,  1618,  1623,  1627,  1632,  1636,  1640,  1643,  1646,
    1649,  1652,  1655,  1658,  1661,  1664,  1667,  1671,  1673,  1675,
    1679,  1682,  1684,  1686,  1689,  1692,  1694,  1697,  1699,  1701,
    1704,  1706
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     272,     0,    -1,   159,   124,    -1,   159,   125,    -1,   159,
       1,    -1,   154,    -1,   159,   159,    -1,    28,    -1,   153,
      -1,   153,   125,   213,   126,    -1,   153,   125,   213,    11,
      -1,   189,   232,    -1,   232,    -1,   189,   127,   128,    -1,
     129,   189,   127,   128,    -1,    80,   189,   232,    -1,    80,
     232,    -1,     3,    -1,   161,    -1,   127,   183,   128,    -1,
     159,    -1,   262,    -1,     4,    -1,   120,    -1,   259,    -1,
     130,   259,    -1,   130,   259,   131,   259,    -1,   127,   128,
      -1,    73,   189,   229,   132,   184,   133,    -1,    73,   189,
     132,   184,   133,    -1,   104,   189,   229,   132,   184,   133,
      -1,   104,   189,   132,   184,   133,    -1,    74,   184,   192,
     229,   132,   184,   133,    -1,    74,   184,   192,   132,   184,
     133,    -1,   105,   184,   192,   229,   132,   184,   133,    -1,
     105,   184,   192,   132,   184,   133,    -1,     1,    -1,   160,
      -1,   162,   132,   183,   133,    -1,   162,   127,   128,    -1,
     162,   127,   164,   128,    -1,   162,   131,   159,    -1,   162,
     159,    -1,   162,     7,   159,    -1,   162,     8,    -1,   162,
       9,    -1,   263,    -1,   181,    -1,   163,    -1,   164,   134,
     181,    -1,   164,   134,   163,    -1,     8,   166,    -1,     9,
     166,    -1,   167,   168,    -1,     6,   166,    -1,     6,   127,
     244,   128,    -1,   111,   166,    -1,   111,   127,   244,   128,
      -1,   165,    -1,   162,    -1,   135,    -1,   124,    -1,   136,
      -1,   137,    -1,   129,    -1,   138,    -1,    75,    -1,   166,
      -1,   127,   243,   128,   168,    -1,   168,    -1,   169,   124,
     168,    -1,   169,   139,   168,    -1,   169,   140,   168,    -1,
     169,    -1,   170,   136,   169,    -1,   170,   137,   169,    -1,
     170,    -1,   171,    10,   170,    -1,   171,    11,   170,    -1,
     173,   125,    -1,   171,    -1,   172,   171,    -1,   173,   126,
     171,    -1,   173,    12,   171,    -1,   173,    13,   171,    -1,
     173,    -1,   174,    14,   173,    -1,   174,    15,   173,    -1,
     174,    -1,   175,   135,   174,    -1,   175,    -1,   176,   141,
     175,    -1,   176,    -1,   177,   142,   176,    -1,   177,    -1,
     178,    16,   177,    -1,   178,    -1,   179,    17,   178,    -1,
     179,    -1,   179,   143,   183,   144,   180,    -1,   180,    -1,
     166,   182,   181,    -1,   166,   182,   163,    -1,   145,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     181,    -1,   183,   134,   181,    -1,   180,    -1,   188,   146,
      -1,   188,   193,   146,    -1,   260,   146,    -1,    79,   159,
     145,   184,   146,    -1,   204,    -1,   186,   204,    -1,   205,
      -1,   186,   205,    -1,   223,    -1,   186,   223,    -1,   207,
      -1,   186,   207,    -1,   204,    -1,   187,   204,    -1,   205,
      -1,   187,   205,    -1,   150,    -1,   187,   150,    -1,   223,
      -1,   187,   223,    -1,   207,    -1,   187,   207,    -1,   195,
      -1,   188,   195,    -1,   204,    -1,   188,   204,    -1,   205,
      -1,   188,   205,    -1,   223,    -1,   188,   223,    -1,   207,
      -1,   188,   207,    -1,   195,    -1,   189,   195,    -1,   204,
      -1,   189,   204,    -1,   205,    -1,   189,   205,    -1,   150,
      -1,   189,   150,    -1,   207,    -1,   189,   207,    -1,   223,
      -1,   189,   223,    -1,   189,    -1,   151,    -1,   195,    -1,
     191,   195,    -1,   204,    -1,   191,   204,    -1,   206,    -1,
     191,   206,    -1,   159,    -1,   191,   159,    -1,   159,   125,
     213,   126,    -1,   191,   159,   125,   213,   126,    -1,   195,
      -1,   192,   195,    -1,   204,    -1,   192,   204,    -1,   206,
      -1,   192,   206,    -1,   207,    -1,   192,   207,    -1,   223,
      -1,   192,   223,    -1,   159,    -1,   192,   159,    -1,   159,
     125,   213,   126,    -1,   192,   159,   125,   213,   126,    -1,
     194,    -1,   193,   134,   194,    -1,   230,    -1,   230,   145,
     245,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   119,    -1,    76,    -1,    77,    -1,   202,    -1,
     198,    -1,    81,    -1,   112,    -1,   113,    -1,   202,    -1,
     198,   202,    -1,     3,    -1,    28,    -1,    77,    -1,    76,
      -1,    47,    -1,   199,    -1,   199,   127,   183,   128,    -1,
     200,    -1,   201,   200,    -1,   201,   134,   200,    -1,   197,
     127,   127,   201,   128,   128,    -1,   197,   127,   127,   128,
     128,    -1,   196,    -1,    47,    -1,    48,    -1,   203,    -1,
      49,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,    41,    -1,    50,    -1,
      42,    -1,    45,    -1,    46,    -1,    43,    -1,    44,    -1,
      87,    -1,   115,    -1,   114,    -1,   208,    -1,   222,    -1,
     152,    -1,    89,   127,   181,   128,    -1,   102,   127,   152,
     128,    -1,   102,   127,   159,   128,    -1,    69,    -1,    84,
      -1,    85,    -1,    49,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    39,    -1,    40,    -1,    41,
      -1,    50,    -1,    42,    -1,    45,    -1,    46,    -1,    43,
      -1,    44,    -1,    87,    -1,   115,    -1,   114,    -1,   208,
      -1,   222,    -1,   154,    -1,    89,   127,   181,   128,    -1,
     102,   127,   152,   128,    -1,   102,   127,   159,   128,    -1,
      69,    -1,   214,   159,   147,   215,   148,    -1,   214,   147,
     215,   148,    -1,   214,   159,   147,   148,    -1,   214,   147,
     148,    -1,   214,   153,   147,   215,   148,    -1,   214,   196,
     159,   147,   215,   148,    -1,   214,   196,   147,   215,   148,
      -1,   214,   196,   159,   147,   148,    -1,   214,   196,   147,
     148,    -1,   214,   196,   154,   147,   215,   148,    -1,   214,
     159,    -1,   214,   154,    -1,   214,   196,   159,    -1,   214,
     196,   154,    -1,   189,    -1,   189,   228,    -1,   189,    -1,
     189,   228,    -1,   171,    -1,   211,    -1,   210,    -1,   159,
     145,   211,    -1,   159,   145,   210,    -1,   209,   145,   211,
      -1,   209,   145,   210,    -1,   212,    -1,   213,   134,   212,
      -1,    51,    -1,    52,    -1,   219,    -1,   215,   219,    -1,
     162,   145,   246,    -1,   216,    -1,   217,   134,   216,    -1,
      70,   191,   159,   147,    71,   254,    72,   254,   148,    -1,
      70,   191,   159,   147,    72,   254,    71,   254,   148,    -1,
      70,   191,   159,   147,    71,   254,   148,    -1,    70,   191,
     159,   147,    72,   254,   148,    -1,    70,   191,   159,   147,
     148,    -1,    70,   191,   228,   159,   147,    71,   254,    72,
     254,   148,    -1,    70,   191,   228,   159,   147,    72,   254,
      71,   254,   148,    -1,    70,   191,   228,   159,   147,    71,
     254,   148,    -1,    70,   191,   228,   159,   147,    72,   254,
     148,    -1,    70,   191,   228,   159,   147,   148,    -1,    70,
     191,   147,    71,   254,    72,   254,   148,    -1,    70,   191,
     147,    72,   254,    71,   254,   148,    -1,    70,   191,   147,
      71,   254,   148,    -1,    70,   191,   147,    72,   254,   148,
      -1,    70,   191,   147,   148,    -1,    70,   191,   228,   147,
      71,   254,    72,   254,   148,    -1,    70,   191,   228,   147,
      72,   254,    71,   254,   148,    -1,    70,   191,   228,   147,
      71,   254,   148,    -1,    70,   191,   228,   147,    72,   254,
     148,    -1,    70,   191,   228,   147,   148,    -1,   189,   220,
     146,    -1,   189,   146,    -1,   262,   146,    -1,   261,   146,
      -1,   264,    -1,   217,   146,    -1,   218,    -1,   146,    -1,
     221,    -1,   220,   134,   221,    -1,   236,    -1,   236,   202,
      -1,   144,   184,    -1,   236,   144,   184,    -1,   236,   144,
     184,   144,   184,    -1,    53,   159,    -1,    53,   154,    -1,
      53,   147,   224,   148,    -1,    53,   159,   147,   224,   148,
      -1,    53,   159,   147,   224,   146,   215,   148,    -1,    53,
     154,   147,   224,   146,   215,   148,    -1,    53,   154,   147,
     224,   148,    -1,   225,    -1,   224,   134,   225,    -1,   159,
      -1,   159,   145,   184,    -1,   159,   198,    -1,   159,   198,
     145,   184,    -1,   127,   228,   128,    -1,   132,   133,    -1,
     132,   184,   133,    -1,   132,   152,   133,    -1,   226,   132,
     133,    -1,   226,   132,   184,   133,    -1,   226,   132,   152,
     133,    -1,   127,   128,    -1,   127,   239,   128,    -1,   226,
     127,   128,    -1,   226,   127,   239,   128,    -1,   127,   229,
     128,    -1,   127,   128,    -1,   127,   239,   128,    -1,   227,
     127,   128,    -1,   227,   127,   239,   128,    -1,   238,    -1,
     226,    -1,   238,   226,    -1,   196,   238,    -1,   196,   226,
      -1,   196,   238,   226,    -1,   238,    -1,   227,    -1,   238,
     227,    -1,   196,   238,    -1,   196,   227,    -1,   196,   238,
     227,    -1,   235,    -1,   238,   235,    -1,   196,   238,   235,
      -1,   230,   196,    -1,   159,    -1,   127,   230,   128,    -1,
     231,   132,   184,   133,    -1,   231,   132,   133,    -1,   231,
     132,   152,   133,    -1,   234,    -1,   238,   234,    -1,   196,
     234,    -1,   196,   238,   234,    -1,   238,   196,   234,    -1,
     231,   127,    -1,   233,   239,   128,    -1,   233,   242,   128,
      -1,   233,   128,    -1,   234,    -1,   231,    -1,   196,   234,
      -1,   196,   231,    -1,   231,    -1,   238,   231,    -1,   196,
     231,    -1,   196,   238,   231,    -1,   238,   196,   231,    -1,
     204,    -1,   237,   204,    -1,   124,    -1,   124,   237,    -1,
     124,   238,    -1,   124,   237,   238,    -1,   240,    -1,   240,
     134,    54,    -1,   241,    -1,   240,   134,   241,    -1,   189,
     230,    -1,   189,   228,    -1,   189,   135,    -1,   189,   135,
     230,    -1,   190,    -1,    68,    -1,   159,    -1,   242,   134,
     159,    -1,   186,    -1,   186,   228,    -1,   187,    -1,   187,
     228,    -1,   181,    -1,   147,   247,   148,    -1,   147,   247,
     134,   148,    -1,   180,    -1,   163,    -1,   245,    -1,   247,
     134,   245,    -1,   249,    -1,   254,    -1,   255,    -1,   256,
      -1,   257,    -1,   258,    -1,   159,   144,   248,    -1,    55,
     184,   144,   248,    -1,    56,   144,   248,    -1,   185,    -1,
     250,   185,    -1,   248,    -1,   251,   248,    -1,   251,   185,
      -1,   251,    -1,   250,    -1,   250,   251,    -1,   147,    -1,
     147,   148,    -1,   253,   252,   148,    -1,   146,    -1,   183,
     146,    -1,    57,   127,   183,   128,   248,    -1,    57,   127,
     183,   128,   248,    67,   248,    -1,    58,   127,   183,   128,
     248,    -1,    59,   127,   183,   128,   248,    -1,    60,   248,
      59,   127,   183,   128,   146,    -1,    61,   127,   255,   255,
     128,   248,    -1,    61,   127,   255,   255,   183,   128,   248,
      -1,    59,   127,   128,   248,    -1,    61,   127,   255,   128,
     248,    -1,    61,   127,   128,   248,    -1,    62,   159,   146,
      -1,    63,   146,    -1,    64,   146,    -1,    65,   146,    -1,
      65,   183,   146,    -1,     5,    -1,   188,   159,   147,   271,
     148,    -1,   188,   159,   147,   148,    -1,   189,   159,   147,
     271,   148,    -1,   189,   159,   147,   148,    -1,   152,   147,
     271,   148,    -1,   152,   147,   148,    -1,   159,   147,   271,
     148,    -1,   159,   147,   148,    -1,   147,   271,   148,    -1,
     147,   148,    -1,   155,   254,    -1,   158,   254,    -1,   158,
     146,    -1,   156,   254,    -1,   157,   254,    -1,   188,   232,
      -1,   188,   236,    -1,   265,   254,    -1,   162,   145,   246,
      -1,   246,    -1,   267,    -1,   268,   134,   267,    -1,   268,
     146,    -1,   269,    -1,   266,    -1,   270,   269,    -1,   270,
     266,    -1,   146,    -1,   270,   146,    -1,   270,    -1,   268,
      -1,   270,   268,    -1,   241,    -1,   241,   144,   184,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   234,   234,   252,   276,   316,   317,   344,   348,   349,
     350,   367,   369,   374,   379,   384,   386,   391,   396,   397,
     402,   404,   406,   408,   409,   411,   412,   413,   416,   417,
     418,   419,   420,   421,   422,   423,   424,   428,   429,   430,
     431,   432,   433,   446,   447,   448,   452,   481,   482,   483,
     484,   488,   489,   490,   492,   493,   495,   496,   500,   501,
     510,   511,   512,   513,   514,   515,   516,   520,   521,   525,
     526,   527,   528,   532,   533,   534,   538,   539,   540,   544,
     552,   553,   554,   555,   556,   560,   561,   562,   566,   567,
     571,   572,   576,   577,   581,   582,   586,   587,   591,   592,
     596,   597,   598,   602,   603,   604,   605,   606,   607,   608,
     609,   610,   611,   612,   616,   617,   621,   625,   626,   627,
     628,   632,   633,   634,   635,   636,   637,   638,   639,   643,
     644,   645,   646,   647,   648,   649,   650,   651,   652,   656,
     657,   658,   659,   660,   661,   662,   663,   664,   665,   669,
     670,   671,   672,   673,   674,   675,   676,   677,   678,   679,
     680,   684,   685,   689,   690,   691,   692,   693,   694,   695,
     696,   697,   705,   714,   715,   716,   717,   718,   719,   720,
     721,   722,   723,   724,   725,   726,   734,   743,   744,   748,
     749,   753,   754,   755,   756,   757,   758,   762,   763,   764,
     765,   769,   770,   771,   775,   776,   779,   780,   781,   782,
     783,   787,   788,   792,   793,   794,   798,   799,   803,   807,
     808,   809,   814,   815,   816,   817,   818,   819,   820,   821,
     822,   823,   824,   825,   826,   827,   828,   829,   830,   831,
     832,   833,   834,   835,   836,   837,   838,   839,   840,   844,
     845,   846,   847,   848,   849,   850,   851,   852,   853,   854,
     855,   856,   857,   858,   859,   860,   861,   862,   863,   864,
     865,   866,   867,   868,   873,   874,   875,   876,   877,   880,
     881,   882,   883,   884,   889,   890,   893,   895,   900,   901,
     906,   907,   918,   922,   924,   925,   927,   928,   954,   971,
     972,   976,   977,   981,   982,   986,   990,   991,   995,   997,
     999,  1001,  1003,  1006,  1008,  1010,  1012,  1014,  1017,  1019,
    1021,  1023,  1025,  1028,  1030,  1032,  1034,  1036,  1041,  1042,
    1043,  1044,  1045,  1046,  1047,  1048,  1052,  1054,  1059,  1061,
    1063,  1065,  1067,  1072,  1073,  1077,  1079,  1080,  1081,  1082,
    1086,  1088,  1093,  1095,  1097,  1098,  1102,  1104,  1106,  1108,
    1110,  1112,  1114,  1116,  1118,  1120,  1122,  1127,  1129,  1131,
    1133,  1135,  1140,  1141,  1142,  1143,  1144,  1145,  1149,  1150,
    1151,  1152,  1153,  1154,  1200,  1201,  1203,  1205,  1210,  1212,
    1214,  1216,  1218,  1223,  1224,  1227,  1229,  1231,  1237,  1241,
    1243,  1245,  1250,  1251,  1252,  1254,  1259,  1260,  1261,  1262,
    1263,  1267,  1268,  1272,  1273,  1274,  1275,  1279,  1280,  1284,
    1285,  1289,  1290,  1291,  1292,  1293,  1304,  1329,  1330,  1334,
    1335,  1339,  1340,  1344,  1346,  1348,  1364,  1366,  1388,  1390,
    1395,  1396,  1397,  1398,  1399,  1400,  1404,  1406,  1408,  1413,
    1414,  1418,  1419,  1422,  1426,  1427,  1428,  1432,  1436,  1444,
    1449,  1450,  1454,  1455,  1456,  1460,  1461,  1462,  1463,  1465,
    1466,  1467,  1471,  1472,  1473,  1474,  1475,  1479,  1483,  1485,
    1490,  1492,  1517,  1519,  1521,  1523,  1528,  1530,  1534,  1536,
    1538,  1540,  1542,  1548,  1550,  1555,  1560,  1561,  1565,  1567,
    1572,  1577,  1578,  1579,  1580,  1581,  1582,  1586,  1587,  1588,
    1592,  1593
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
  "PRAGMA", "STATIC_ASSERT", "'*'", "'<'", "'>'", "'('", "')'", "'~'",
  "'$'", "'.'", "'['", "']'", "','", "'&'", "'+'", "'-'", "'!'", "'/'",
  "'%'", "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'", "'}'", "$accept",
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
     375,   376,   377,   378,    42,    60,    62,    40,    41,   126,
      36,    46,    91,    93,    44,    38,    43,    45,    33,    47,
      37,    94,   124,    63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   149,   150,   150,   151,   152,   152,   153,   154,   154,
     154,   155,   155,   156,   157,   158,   158,   159,   160,   160,
     161,   161,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   161,   161,   161,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   163,   164,   164,   164,
     164,   165,   165,   165,   165,   165,   165,   165,   166,   166,
     167,   167,   167,   167,   167,   167,   167,   168,   168,   169,
     169,   169,   169,   170,   170,   170,   171,   171,   171,   172,
     173,   173,   173,   173,   173,   174,   174,   174,   175,   175,
     176,   176,   177,   177,   178,   178,   179,   179,   180,   180,
     181,   181,   181,   182,   182,   182,   182,   182,   182,   182,
     182,   182,   182,   182,   183,   183,   184,   185,   185,   185,
     185,   186,   186,   186,   186,   186,   186,   186,   186,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   190,   190,   191,   191,   191,   191,   191,   191,   191,
     191,   191,   191,   192,   192,   192,   192,   192,   192,   192,
     192,   192,   192,   192,   192,   192,   192,   193,   193,   194,
     194,   195,   195,   195,   195,   195,   195,   196,   196,   196,
     196,   197,   197,   197,   198,   198,   199,   199,   199,   199,
     199,   200,   200,   201,   201,   201,   202,   202,   203,   204,
     204,   204,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   208,   208,   208,   208,   209,   209,
     210,   210,   211,   212,   212,   212,   212,   212,   212,   213,
     213,   214,   214,   215,   215,   216,   217,   217,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   219,   219,
     219,   219,   219,   219,   219,   219,   220,   220,   221,   221,
     221,   221,   221,   222,   222,   223,   223,   223,   223,   223,
     224,   224,   225,   225,   225,   225,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   227,   227,   227,
     227,   227,   228,   228,   228,   228,   228,   228,   229,   229,
     229,   229,   229,   229,   230,   230,   230,   230,   231,   231,
     231,   231,   231,   232,   232,   232,   232,   232,   233,   234,
     234,   234,   235,   235,   235,   235,   236,   236,   236,   236,
     236,   237,   237,   238,   238,   238,   238,   239,   239,   240,
     240,   241,   241,   241,   241,   241,   241,   242,   242,   243,
     243,   244,   244,   245,   245,   245,   246,   246,   247,   247,
     248,   248,   248,   248,   248,   248,   249,   249,   249,   250,
     250,   251,   251,   251,   252,   252,   252,   253,   254,   254,
     255,   255,   256,   256,   256,   257,   257,   257,   257,   257,
     257,   257,   258,   258,   258,   258,   258,   259,   260,   260,
     261,   261,   262,   262,   262,   262,   263,   263,   264,   264,
     264,   264,   264,   265,   265,   266,   267,   267,   268,   268,
     269,   270,   270,   270,   270,   270,   270,   271,   271,   271,
     272,   272
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
       1,     1,     1,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     4,     4,     1,     5,     4,     4,     3,     5,     6,
       5,     5,     4,     6,     2,     2,     3,     3,     1,     2,
       1,     2,     1,     1,     1,     3,     3,     3,     3,     1,
       3,     1,     1,     1,     2,     3,     1,     3,     9,     9,
       7,     7,     5,    10,    10,     8,     8,     6,     8,     8,
       6,     6,     4,     9,     9,     7,     7,     5,     3,     2,
       2,     2,     1,     2,     1,     1,     1,     3,     1,     2,
       2,     3,     5,     2,     2,     4,     5,     7,     7,     5,
       1,     3,     1,     3,     2,     4,     3,     2,     3,     3,
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

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   191,   192,   193,   194,   195,   223,   224,
     225,   226,   227,   228,   229,   230,   232,   235,   236,   233,
     234,   219,   220,   222,   231,   301,   302,     0,   426,   246,
     197,   198,   201,   247,   248,   237,     0,     0,   202,   203,
     239,   238,   196,   155,   162,   242,     8,     5,     0,   161,
     425,   149,   218,     0,   200,   199,   221,   151,   153,   157,
     240,     0,   241,   159,   510,     0,     0,   344,   343,     0,
       0,     0,     4,     2,     3,     6,   413,     0,     0,   423,
     156,   388,   150,   218,   152,   154,   158,   160,   373,   422,
     421,   403,     0,   402,   384,   372,     0,   205,     0,     8,
     285,   284,     0,     0,     1,   352,     0,   350,     0,     0,
      36,    22,   477,     0,     0,     0,     0,     0,    66,     0,
       0,     0,    23,    61,     0,    64,     0,    60,    62,    63,
      65,     0,    20,    37,    18,    59,    58,    67,     0,    69,
      73,    76,    80,     0,    85,    88,    90,    92,    94,    96,
      98,   100,     0,    24,    21,     0,     0,   242,    20,    67,
     292,   290,     0,   294,   293,   299,     0,   411,   414,   415,
     363,     0,     0,     0,     0,   417,   419,   357,     0,   116,
       0,     0,   388,     0,   424,     0,   376,   405,   404,   375,
       0,     0,   387,   398,     0,   401,     0,     0,     0,     0,
     374,   385,     0,     0,     0,     0,     0,   335,   277,     0,
       0,     0,     0,    20,     0,     0,   218,     0,   306,     0,
     334,   303,     0,    12,   393,     0,     0,    21,   332,     0,
       0,     0,   287,   286,   511,     0,   354,   204,     0,   345,
       0,     0,     0,    54,     0,    51,    52,     0,     0,     0,
       0,     0,     0,    56,    27,   114,     0,   429,   121,   123,
     127,   125,     0,    25,     0,     0,     0,    44,    45,     0,
       0,     0,    42,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   103,     0,    53,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   243,   244,   245,     0,
       0,   218,   291,   372,     0,    10,     9,     0,   412,   416,
     356,   389,   364,     0,   359,   358,     0,   377,   386,   365,
       0,   360,     0,     0,   391,     0,     0,   399,   400,     0,
     206,   207,   210,   209,   208,     0,   211,   213,     0,   250,
     251,   252,   253,   254,   255,   256,   257,   259,   262,   263,
     260,   261,   249,   258,     0,   273,   264,     0,     0,   266,
     265,   269,   169,     0,   163,   165,   167,   267,     0,   268,
       0,    16,    61,     0,    20,     0,   457,     0,   488,   491,
     492,   490,   489,     0,     0,     0,   329,   388,   218,     0,
     336,   406,    11,   338,     0,   395,     0,   275,   304,     0,
     333,     0,   394,   331,   330,     0,   276,     0,   282,     0,
       0,     0,   353,     0,   351,     0,   349,     0,   346,   133,
      20,   431,   129,   131,   137,   135,     0,     0,     0,   218,
     379,     0,   378,   183,     0,   173,   175,   177,   179,   181,
       0,     0,     0,     0,    19,     0,     0,   122,   124,   128,
     126,   430,     0,     0,   505,     0,   483,    59,   437,   436,
       0,   139,   141,   143,   147,   145,   497,    46,     0,   502,
     498,   508,   501,     0,     0,   485,     0,    43,    39,    48,
       0,    47,    41,     0,   102,   101,    70,    71,    72,    74,
      75,    77,    78,    83,    84,    82,    86,    87,    89,    91,
      93,    95,    97,     0,   290,   296,   295,   375,   298,   297,
     300,   418,   420,   366,   362,   361,   392,   390,   428,   217,
       0,     0,     0,   214,   344,   343,     0,     0,     0,     0,
     170,   164,   166,   168,     0,   284,     0,    15,   218,     0,
     458,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   460,    20,     0,   449,     0,   451,   440,
       0,     0,     0,   441,   442,   443,   444,   445,     0,   305,
      13,   340,     0,   408,     0,     0,   328,     0,   339,     0,
     407,   396,   307,   397,   278,   274,   280,     0,   281,     0,
     355,     0,     0,   134,   130,   132,   138,   136,   432,    55,
     368,     0,     0,     0,   382,   381,     0,     0,   380,     0,
       0,   184,   174,   176,   178,   180,   182,     0,     0,     0,
       0,     0,    57,   115,    68,    26,   487,     0,     0,   388,
     140,   142,   144,   148,   146,   493,   494,   495,     0,   500,
     506,   504,   509,   503,   482,   484,    40,     0,    38,     0,
     291,     0,   216,   215,     0,     0,     0,     0,     0,     0,
     322,     0,     0,     0,     0,   287,   286,    14,     0,     0,
       0,     0,     0,     0,     0,     0,   473,   474,   475,     0,
       0,     0,   461,   117,   388,     0,   187,   189,   450,     0,
     453,   452,   459,   119,   481,     0,   409,     0,   337,   406,
       0,   341,   410,   283,   279,   348,   347,   367,   369,    29,
     383,   370,     0,     0,     0,     0,     0,     0,    31,     0,
       0,     0,   486,   496,   499,    50,    49,    99,   212,   270,
     271,   272,   171,     0,     0,     0,     0,     0,   312,     0,
       0,   327,     0,     0,   448,     0,     0,     0,     0,     0,
       0,     0,   472,   476,     0,   446,     0,     0,   118,     0,
     480,   408,     0,     0,   407,     0,   371,    28,   185,    33,
       0,     0,    30,    35,     0,     0,   320,     0,   321,   172,
       0,     0,     0,     0,     0,     0,   317,   447,     0,     0,
     469,     0,     0,   471,     0,     0,     0,   479,     0,   188,
       0,   433,   190,   409,   410,   342,   186,    32,    34,     0,
       0,     0,   310,     0,   311,     0,   325,     0,   326,     0,
       0,   462,   464,   465,     0,   470,     0,     0,   120,   478,
     438,     0,   318,   319,     0,     0,     0,     0,     0,   315,
       0,   316,     0,     0,   467,     0,     0,   434,   308,   309,
     323,   324,     0,     0,   463,   466,   468,   435,   439,   313,
     314
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    43,    44,   131,    46,    47,   209,   210,   211,   212,
     132,   133,   134,   135,   468,   490,   136,   159,   138,   139,
     140,   141,   142,   143,   144,   145,   146,   147,   148,   149,
     150,   151,   255,   284,   565,   180,   700,   257,   431,   470,
     215,    50,   373,   444,   695,   696,    51,    52,    53,    54,
     346,   347,   348,    55,    56,    57,    58,   447,    59,    60,
     162,   163,   164,   165,   166,    61,   217,   218,   219,   220,
     221,   399,   400,    62,    63,   106,   107,    88,   440,   172,
     441,   173,   222,   223,    92,   224,    94,   403,   168,   225,
     174,   175,   176,   198,   262,   436,   812,   476,   841,   568,
     569,   570,   571,   572,   387,   573,   574,   575,   576,   577,
     153,   578,   226,   154,   477,   228,   478,   479,   480,   481,
     482,   483,   484,    65
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -756
static const yytype_int16 yypact[] =
{
    9169,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    -756,  -756,  -756,  -756,  -756,  -756,  -756,    31,  -756,  -756,
    -756,  -756,  -756,  -756,  -756,  -756,  -104,   -39,  -756,  -756,
    -756,  -756,  -756,  -756,  -756,  -756,     2,  -756,   119,  7530,
    -756,  -756,  -756,   -10,    -8,  -756,  -756,  -756,  -756,  -756,
    -756,   429,  -756,  -756,    10,   195,   220,   106,   164,  7235,
      87,  6452,  -756,  -756,  -756,  -756,   601,  7638,  6875,   981,
    -756,    41,  -756,   334,  -756,  -756,  -756,  -756,   206,  -756,
     599,   380,  8574,  -756,  -756,   560,   193,  -756,  3718,   -58,
    -756,   213,    35,  7235,  -756,   423,    85,  -756,   220,   220,
    -756,  -756,  -756,  7256,  7394,  7394,  9261,  7235,  -756,  9261,
    7235,  7415,  -756,  -756,  6590,  -756,   282,  -756,  -756,  -756,
    -756,   232,    33,  -756,  -756,   617,  -756,  1136,  7235,  -756,
     216,   148,   543,  7235,   339,   614,   207,   264,   286,   430,
      12,  -756,   320,  -756,  -756,   364,    44,   232,   468,  -756,
     543,  6327,   314,  -756,  -756,  -756,   138,  -756,   601,  -756,
    -756,   936,   366,   731,   388,   374,  -756,  -756,   146,  -756,
     400,   981,  -756,    16,   599,   658,   206,   380,  -756,   560,
    8675,  6896,  -756,  -756,  7034,  -756,   238,   392,   179,    83,
     206,  -756,   100,  9353,  8877,  6817,  9261,  -756,  -756,   398,
     398,   398,   496,   121,   624,  6089,    16,  3848,  -756,   -74,
    -756,  -756,   380,  -756,  -756,   658,   409,   411,  -756,  5642,
    3978,  4108,   418,   422,  -756,  7235,   437,  -756,   220,  -756,
      78,   129,  6590,  -756,  7055,  -756,  -756,    41,  7848,  9445,
    7953,  9445,  6590,  -756,  -756,  -756,   225,  8368,  -756,  -756,
    -756,  -756,   445,   444,  2840,  2988,   220,  -756,  -756,  2185,
     220,  7235,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    -756,  -756,  -756,  -756,  5446,  -756,  7235,  7235,  7235,  7235,
    7235,  7235,  7235,   543,  7235,  7235,  -756,  7235,  7235,  7235,
    7235,  7235,  7235,  7235,  7235,  7235,  -756,  -756,  -756,  6452,
    7743,   302,   432,   473,  6452,  -756,  -756,  6452,  -756,  -756,
    -756,  -756,  -756,  9077,  -756,  -756,   658,   206,  -756,  -756,
     451,  -756,   189,   448,  -756,   235,   455,  -756,  -756,   220,
    -756,  -756,  -756,  -756,  -756,   462,   467,  -756,    17,  -756,
    -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    -756,  -756,  -756,  -756,    87,  -756,  -756,   469,   471,  -756,
    -756,  -756,   481,  5969,  -756,  -756,  -756,  -756,   811,  -756,
    8877,  -756,   601,  6728,   510,  8977,   461,  5278,  -756,  -756,
    -756,  -756,  -756,  5446,  1067,  7235,  -756,   298,    16,   140,
    -756,   380,  -756,   -38,   658,  -756,    83,  -756,  -756,   977,
    -756,    83,  -756,  -756,  -756,  4238,  -756,  4368,  -756,  4498,
    5642,  4628,  -756,  7235,  -756,  5642,  -756,  5642,  -756,  -756,
     121,  8368,  -756,  -756,  -756,  -756,   484,  8473,  7235,   407,
     487,   486,   494,   505,  8163,  -756,  -756,  -756,  -756,  -756,
    7235,   502,  8268,   512,  -756,  7235,   220,  -756,  -756,  -756,
    -756,  -756,  7235,   282,  -756,  3136,  -756,   771,  -756,  -756,
    8877,  -756,  -756,  -756,  -756,  -756,  -756,  -756,   398,  -756,
    -756,   157,  -756,  3284,   490,  -756,   499,  -756,  -756,  -756,
     284,  -756,  -756,   517,  -756,  -756,  -756,  -756,  -756,   216,
     216,   148,   148,   543,   543,   543,   339,   339,   614,   207,
     264,   286,   430,   -66,  8058,  -756,  -756,   473,  -756,  -756,
    -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    7235,   516,   452,  -756,  -756,  -756,  7235,    87,  6452,   227,
     -13,  -756,  -756,  -756,    47,  -756,    87,  -756,    16,   526,
    -756,  7235,   520,   529,   547,   556,  5425,   566,   220,   549,
     552,  5850,   220,  -756,    23,   224,  -756,  6208,  -756,  -756,
    2396,  2544,   554,  -756,  -756,  -756,  -756,  -756,   558,  -756,
    -756,  -756,  3432,   380,    83,   788,  -756,  7235,  -756,    83,
     380,  -756,  -756,  -756,  -756,  -756,  -756,  4758,  -756,  4888,
    -756,  5018,  5148,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    -756,   572,   580,   576,   487,   494,  8776,  7235,   487,  6452,
    7235,   591,  -756,  -756,  -756,  -756,  -756,   585,   587,  7235,
    7235,   586,  -756,  -756,  -756,  -756,  -756,   581,  5446,   220,
    -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  5446,  -756,
    -756,  -756,   157,  -756,  -756,  -756,  -756,  5446,  -756,  7235,
    -756,   313,  -756,  -756,   596,   600,    79,    -1,   398,   398,
    -756,  6452,   247,   259,   589,  -756,  -756,  -756,   593,  5425,
    7235,  7235,  7076,   679,  5700,   595,  -756,  -756,  -756,   242,
     597,  5425,  -756,  -756,    50,   243,  -756,   620,  -756,  2692,
    -756,  -756,  -756,  -756,  -756,   598,   380,    16,  -756,   611,
     658,   606,   380,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
     487,  -756,   631,   633,   290,   635,  6452,  7235,  -756,   653,
     654,  7235,  -756,  -756,  -756,  -756,  -756,  -756,  -756,  -756,
    -756,  -756,  -756,   -35,   -19,   316,   398,   398,  -756,   398,
     398,  -756,   331,  5425,  -756,   354,   367,  5425,   369,   637,
    5425,  5775,  -756,  -756,  7235,  -756,  3580,   981,  -756,  5504,
    -756,   611,    83,    83,   611,  7235,  -756,  -756,  -756,  -756,
     342,   655,  -756,  -756,   657,   398,  -756,   398,  -756,  -756,
     -18,    -9,    -7,     5,   398,   398,  -756,  -756,  5425,  5425,
    -756,  5425,  7235,  -756,  5425,  7214,   646,  -756,   645,  -756,
    5504,  -756,  -756,   611,   611,  -756,  -756,  -756,  -756,   647,
     648,   398,  -756,   398,  -756,   398,  -756,   398,  -756,   168,
       9,   727,  -756,  -756,   387,  -756,  5425,   438,  -756,  -756,
    -756,   266,  -756,  -756,   652,   662,   663,   665,   398,  -756,
     398,  -756,  5425,   656,  -756,  5425,  2028,  -756,  -756,  -756,
    -756,  -756,   667,   668,  -756,  -756,  -756,  -756,  -756,  -756,
    -756
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -756,    93,  -756,   705,   744,    99,  -756,  -756,  -756,  -756,
       0,  -756,  -756,  1644,  -256,  -756,  -756,   191,  -756,  -113,
     363,   378,   -36,  -756,   390,   506,   518,   524,   515,   523,
    -756,  1647,   -47,  -756,  -121,   714,  -370,  -756,  -756,  -378,
     294,  -756,  -756,   569,  -756,    63,  1630,  1023,  -756,   728,
    -756,  -334,  -756,   -49,  -756,  1261,   275,  -162,  1301,  -164,
    -756,  -218,   160,   521,  -508,  -171,   -93,   426,  -756,  -756,
    -148,  -756,   252,  -152,  1537,   577,   602,   -79,  -424,     8,
    -217,   -48,   884,  -194,  -756,   -37,   -71,   371,  -756,  1291,
     -90,  -756,     6,  -756,  -756,   604,  -755,  -382,  -756,    24,
    -756,  -756,   277,  -756,  -756,   181,  -525,  -756,  -756,  -756,
    -119,  -756,  -756,    66,  -756,  -756,  -756,   368,   205,   375,
     379,  -756,  -257,  -756
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -508
static const yytype_int16 yytable[] =
{
      48,    90,   197,   256,   186,    97,    64,   263,   486,   567,
     381,   579,    93,   489,   533,   614,   200,   566,   618,     1,
     340,   402,   152,    69,   201,   285,     1,    68,   494,   304,
     667,   184,   378,   451,     1,   160,     1,   785,     1,   377,
      93,   376,    93,    32,     1,   341,   188,     1,    75,    81,
       1,   379,   787,     1,   821,   840,   237,    89,    93,     2,
     409,   101,   823,     2,   342,   825,   105,    71,   455,   408,
     156,   158,   410,    32,    38,    39,   827,   171,   659,   182,
     850,    75,     1,   182,   256,   377,     1,   377,    70,   229,
       1,   515,   196,   343,   344,   182,   518,   379,   213,   379,
     330,   868,   233,   340,    38,    39,   587,   293,   105,   105,
     327,   724,   671,   786,   201,     2,   247,    96,   328,   247,
      72,   256,     1,   256,     1,   742,    67,    71,   341,   788,
     822,   256,    75,   317,   672,   272,   415,   417,   419,   824,
      76,   826,    80,   181,    93,   531,   188,   342,    93,   315,
     493,   532,    93,   828,   103,   305,    75,   851,    75,   761,
     100,   247,   188,   745,   227,    73,    74,   691,    93,   312,
     265,    75,   308,   496,   497,   498,   343,   344,    66,   405,
     265,   182,   231,   182,   513,   182,   547,    97,   412,   182,
      48,   720,   567,   567,   673,   104,    75,   766,   663,   182,
     698,   232,   378,   372,    81,   384,   247,   741,   637,   377,
     181,   543,   238,    75,   272,   397,   182,   213,   780,   238,
     611,   379,   491,     1,   425,   182,   426,   627,   345,   213,
     213,   213,   186,   239,   200,   631,   805,   495,   105,    72,
     848,     1,   430,    73,    74,    73,    74,    75,   247,   443,
     247,   443,   430,   108,    80,   328,   733,   456,   503,   504,
     137,   505,   256,   238,   316,   461,   487,   408,   265,   408,
     492,   408,   317,   160,   585,   427,   645,   428,   160,   324,
     377,   160,   624,   227,   289,   290,   586,   112,   377,    93,
     624,   648,   379,   264,    49,   227,   227,   227,   668,   669,
     379,     1,   371,   649,   243,   245,   246,   338,    80,   430,
      48,   109,   253,   339,   430,   137,   849,   158,   746,   747,
     202,   567,   524,    48,    85,   705,   182,   597,   599,   522,
     749,   750,   601,   190,   602,   429,   264,     1,   191,   528,
     286,    80,   300,    80,   635,   429,    93,   612,   371,   634,
     371,   294,   295,   454,   588,   287,   288,    93,   455,   455,
     230,   405,    73,    74,   535,   161,  -427,   412,   526,   591,
     692,    49,  -427,   540,   593,   670,   455,   767,   545,   264,
      81,   544,   264,   384,    75,   247,    49,   564,   763,   768,
     388,   389,   390,   392,   182,   748,   137,    75,   182,   259,
     856,   735,   794,   795,   182,   301,   182,   751,   633,   661,
     248,   182,   656,   250,   857,   213,   778,   213,   657,   213,
     213,   213,    73,    74,   317,   213,    76,   213,   302,   310,
      75,   247,     1,   137,    78,   137,    85,    48,   327,   608,
     689,   738,   789,   137,   621,   582,   303,   455,   306,   408,
     317,   408,   621,   408,   408,   340,    75,     2,    76,   314,
     137,    77,   137,   534,   296,   297,    78,   272,   816,   516,
     639,     1,   371,    80,   519,   137,   317,   100,    80,   796,
     341,   227,   798,   227,    49,   227,   227,   227,   455,   664,
      85,   227,   307,   227,   320,   799,   137,   801,   380,   342,
     385,   455,   160,   455,    32,    30,    31,   193,   323,   808,
      32,   188,   194,     1,   247,   853,   322,   433,    32,   697,
     337,   455,   660,    85,   603,    85,   722,   433,   343,   344,
      93,    76,   458,   325,   437,    38,    39,   666,   158,   473,
     473,    38,    39,   371,   674,   386,   676,   591,   182,    38,
      39,   371,   593,   291,   292,   413,   564,   414,   685,   755,
     756,   758,   690,     1,    75,   420,   855,   694,   235,   421,
     564,   564,   455,   462,   137,   463,    98,  -289,   137,   523,
     683,   525,   423,   160,   182,   182,  -388,  -388,   527,   182,
     529,  -388,    73,    74,   530,   701,   536,   213,   537,   213,
     310,   213,   213,   514,    49,    78,   538,    80,   514,   550,
     736,   161,   609,   309,   616,   265,    48,    49,   617,   158,
       1,   437,  -388,  -388,   266,   267,   268,     1,   298,   299,
     619,   266,   267,   268,   629,   160,    30,    31,   654,    75,
     632,    32,   391,   386,   662,   675,   137,   655,    21,    22,
     658,   455,   499,   500,   677,    85,   680,   265,   259,   647,
      85,     1,   473,   227,   679,   227,    75,   227,   227,   501,
     502,   158,    38,    39,   681,    30,    31,    30,    31,   564,
      32,   834,    32,   682,   837,   240,   241,    77,   506,   507,
     160,   564,    78,   684,    75,   686,    30,    31,   687,   564,
     717,    32,   702,   754,   703,    45,   605,   182,   718,   719,
     182,    38,    39,    38,    39,   765,   726,   727,   731,   697,
     728,   137,   811,   701,   739,    76,   158,   137,   740,   732,
      93,    49,    38,    39,    30,    31,   752,   753,   759,    32,
     473,   762,   764,   194,   269,   642,   770,   137,   270,   271,
     775,   269,   137,   564,    45,   270,   271,   564,   473,   776,
     564,   137,   137,   811,   802,   769,   777,   182,   779,   393,
      38,    39,   182,   182,     1,   155,   157,   797,   266,   267,
     268,   800,    45,   178,   803,   181,   782,   783,   817,    85,
     818,     1,   838,   839,   852,   842,   843,    45,   564,   564,
     858,   564,   865,   157,   564,    99,   508,    30,    31,   811,
     859,   860,    32,   861,     1,   869,   870,   234,   511,   509,
     452,    45,   831,   832,    45,   833,   510,   512,   835,   157,
     809,   249,   161,   236,   251,   592,   564,   708,   520,     2,
     424,   646,   642,    38,    39,   473,   473,   699,   137,   743,
     744,   651,   564,   734,     0,   564,   453,   473,   652,   321,
     854,     0,   653,     0,    30,    31,    45,     0,     0,    32,
     137,   137,   137,   137,     0,   137,   864,     0,     0,   866,
       0,     0,   137,     0,     0,     0,     0,    30,    31,     0,
     137,     0,    32,     0,     0,    45,   332,     0,   269,   335,
      38,    39,   270,   271,     0,   333,     0,     0,   336,    45,
      49,    45,    76,   161,     0,   181,   638,     0,     0,     0,
      45,     0,   157,    38,    39,     0,     0,   790,   791,     0,
     792,   793,   395,    91,   157,   157,   157,    72,     0,     1,
       0,     0,     0,     0,   137,     0,     0,   157,   137,   422,
       0,   137,   137,    45,     0,    45,     0,   157,     0,     0,
     137,    91,    45,    91,     0,   161,   819,   187,   820,   157,
     157,     0,     0,     0,   473,   829,   830,     0,   110,    91,
       1,   111,   112,     0,     1,     0,     0,     0,     0,   137,
     137,     0,   137,   137,     0,   137,   137,     0,     0,     0,
       0,   137,   844,     0,   845,     2,   846,     0,   847,     0,
       0,     0,  -388,  -388,   157,    45,     0,  -388,     0,   157,
     161,     0,   157,     0,     0,     0,     0,   137,    45,   862,
       0,   863,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   473,     0,   137,     0,     0,   137,   137,  -388,  -388,
     116,   117,     0,     0,     0,     0,     0,    30,    31,     0,
      73,    74,    32,  -388,  -388,    91,     0,   187,  -388,    91,
       1,     0,    83,    91,     0,     0,     0,     0,     0,     0,
       0,   119,   120,   187,   102,    45,     0,     0,   157,    91,
      45,     0,   157,    38,    39,     0,     0,   122,     0,   401,
      83,     0,   183,     0,   244,    76,     0,   126,   181,   581,
       0,     0,     0,   192,     0,     0,     0,     0,   199,     0,
     157,   216,   157,     0,   157,   157,   157,     0,     0,     0,
     157,     0,   157,     0,     0,     0,    45,   600,     0,     0,
       0,     0,    45,    30,    31,     0,     0,     0,    32,     0,
       0,     0,   613,     0,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   628,     0,     0,     0,     0,     0,
     157,     0,     0,     0,     0,    45,     0,     0,     0,    38,
      39,     0,     0,     0,   311,     0,     0,     0,   157,     0,
       0,    76,     0,     0,   181,   580,   192,     0,     0,     0,
       0,     0,     0,     0,   183,     0,     0,   192,   199,     0,
      91,     0,   199,     0,     0,     0,     0,     0,     0,    45,
       0,     0,     0,     0,     0,     0,     0,   216,   183,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   398,     0,
     216,     0,   665,   157,     0,     0,     0,     0,   411,     0,
       0,     0,   216,   216,   216,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   678,     0,    91,     0,     0,
       0,   439,    45,   439,     0,   157,   157,     0,    91,     0,
     311,   283,   583,     0,     0,     0,     0,   157,   590,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   711,   157,     0,   157,     0,   157,   157,     0,     0,
      84,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    45,     0,     0,   157,     0,     0,     0,     0,     0,
       0,   723,     0,   311,   725,     0,     0,   167,     0,     0,
      95,     0,     0,   729,   730,     0,     0,     0,     0,   199,
      86,     0,     0,     0,   401,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   169,    95,     0,
     185,     0,     0,     0,   189,     0,   157,     0,     0,     0,
       0,     0,     0,     0,     0,   258,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   311,     0,     0,     0,
       0,   546,     0,   216,   157,     0,   548,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   183,     0,     0,
       0,     0,    84,     0,     0,   260,     0,   589,     0,   318,
       0,   157,   187,     0,     0,     0,     0,     0,   216,     0,
     216,   781,   216,   216,   216,   784,     0,     0,   216,     0,
     216,    91,   313,     0,   311,     0,     0,     0,     0,   319,
     439,     0,    86,     0,   375,     0,     0,   439,   706,   709,
       0,   157,   185,   712,   326,   439,    84,     0,   806,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   815,
       0,     0,     0,   398,     0,     0,   185,     0,     0,     0,
       0,     0,     0,   432,     0,     0,   404,   406,     0,    84,
     446,    84,   446,   432,     0,     0,    86,     0,   457,     0,
       0,     0,     0,     0,     0,   472,   472,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   311,     0,   442,
       0,   442,     0,   434,     0,     0,     0,     0,   313,    86,
     448,    86,   448,   434,     0,     0,     0,     0,   459,     0,
       0,     0,     0,     0,     0,   474,   474,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    87,     0,     0,     0,
     548,   771,     0,     0,   774,     0,     0,     0,     0,     0,
       0,   313,   517,     0,     0,     0,     0,     0,   707,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,   216,     0,   216,   216,     0,     0,     0,     0,
       0,     0,     0,     0,   542,     0,     0,     0,     0,     0,
       0,    84,     0,   167,   258,     0,    84,     0,   472,     0,
       0,    91,     0,     0,     0,     0,   813,   814,     0,     0,
       0,   261,     0,     0,   313,     0,     0,     0,     0,     0,
       0,     0,     0,   169,   185,     0,     0,     0,     0,    82,
       0,    86,     0,     0,   260,   185,    86,     0,   474,   584,
       0,     0,   604,     0,     0,     0,     0,     0,    87,     0,
       0,     0,     0,     0,     0,   623,     0,     0,     0,     0,
       0,     0,     0,   623,     0,     0,     0,     0,     0,     0,
     192,     0,   313,     0,     0,   179,   472,     0,   442,     0,
     615,   641,   606,   773,     0,   442,     0,     0,     0,     0,
       0,     0,   214,   442,   472,   625,     0,     0,     0,     0,
     179,     0,    87,   625,     0,     0,     0,     0,     0,     0,
       0,   404,     0,     0,   179,     0,   474,   179,     0,     0,
       0,   643,     0,     0,     0,    84,     0,     0,     0,   435,
       0,     0,     0,     0,   474,    87,   449,    87,   449,   435,
     183,    82,     0,     0,   460,     0,     0,     0,     0,     0,
       0,   475,   475,     0,     0,   313,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    86,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   641,     0,
       0,   472,   472,   374,     0,     0,     0,     0,   179,   326,
       0,   179,     0,   472,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   185,     0,
       0,   214,     0,     0,     0,     0,     0,     0,   643,     0,
       0,   474,   474,   214,   214,   214,   710,     0,    82,   445,
      82,   445,   179,   474,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   471,   471,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   467,   467,
       0,   469,   469,     0,     0,     0,     0,    87,     0,     0,
     261,     0,    87,     0,   475,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     472,     0,     0,     0,     0,     0,     0,     0,   607,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   626,     0,     0,     0,     0,     0,     0,     0,   626,
       0,     0,     0,     0,     0,     0,     0,     0,   772,     0,
     474,     0,   475,   541,     0,     0,     0,   644,     0,     0,
      82,     0,     0,     0,     0,    82,     0,   471,     0,     0,
     475,     0,     0,     0,     0,     0,     0,   472,     0,   110,
       0,     1,   111,   112,   113,     0,   114,   115,     0,     0,
     469,     0,   179,     0,     0,     0,     0,     0,     0,     0,
       0,    87,     0,   214,     0,     0,     2,     0,   185,   214,
       0,   214,     0,   214,   214,   214,     0,   474,     0,   214,
     179,   214,     0,     0,   622,     0,     0,     0,     0,     0,
       0,     0,   622,     0,     0,   179,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   471,     0,   179,     0,     0,
     640,   116,   117,   118,   644,     0,     0,   475,   475,   467,
       0,     0,   469,   471,     0,     0,     0,     0,     0,   475,
       0,     0,     0,     0,     0,     0,     0,   467,     0,     0,
     469,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,     0,     0,    82,     0,     0,     0,   122,     0,
       0,     0,   123,     0,     0,   124,     0,   125,   126,     0,
       0,     0,     0,   127,   128,   129,   130,     0,     0,     0,
       0,     0,     0,     0,     0,   810,   867,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     1,   111,
     112,   113,     0,   114,   115,     0,     0,   640,   179,     0,
     471,   471,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   471,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   467,     0,     0,   469,
       0,     0,     0,     0,   179,     0,   475,     0,     0,     0,
       0,   214,     0,   214,     0,   214,   214,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   116,   117,
     118,     0,     0,     0,   179,     0,     0,   179,     0,     0,
       0,     0,     0,     0,     0,     0,   179,   179,     0,     0,
       0,     0,     0,     0,     0,   469,     0,     0,     0,   119,
     120,     0,   467,     0,     0,   469,   121,     0,     0,     0,
       0,     0,     0,   475,     0,   122,   737,     0,     0,   123,
       0,     0,   124,   488,   125,   126,     0,     0,     0,     0,
     127,   128,   129,   130,     0,     0,     0,     0,     0,   471,
       0,     0,   465,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   179,     0,     0,     0,   179,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   471,   110,     0,     1,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
     467,   179,     0,   469,     0,     0,     0,     0,     0,     0,
       0,     0,   179,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
       0,   551,   552,   553,   554,   555,   556,   557,   558,   559,
     560,   561,     0,     0,     0,    29,     0,     0,     0,   116,
     117,   118,    30,    31,     0,   562,     0,    32,     0,     0,
      33,    34,     0,    35,     0,    36,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    37,     0,
     119,   120,     0,     0,     0,     0,     0,   121,    38,    39,
      40,    41,     0,     0,     0,    42,   122,     0,     0,     0,
     123,     0,     0,   124,     0,   125,   126,     0,     0,     0,
       0,   127,   128,   129,   130,     0,     0,     0,     0,     0,
       0,     0,   563,   386,  -455,   110,     0,     1,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,     0,   551,
     552,   553,   554,   555,   556,   557,   558,   559,   560,   561,
       0,     0,     0,    29,     0,     0,     0,   116,   117,   118,
      30,    31,     0,   562,     0,    32,     0,     0,    33,    34,
       0,    35,     0,    36,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    37,     0,   119,   120,
       0,     0,     0,     0,     0,   121,    38,    39,    40,    41,
       0,     0,     0,    42,   122,     0,     0,     0,   123,     0,
       0,   124,     0,   125,   126,     0,     0,     0,     0,   127,
     128,   129,   130,     0,     0,     0,     0,     0,     0,     0,
     563,   386,  -454,   110,     0,     1,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,     0,   551,   552,   553,
     554,   555,   556,   557,   558,   559,   560,   561,     0,     0,
       0,    29,     0,     0,     0,   116,   117,   118,    30,    31,
       0,   562,     0,    32,     0,     0,    33,    34,     0,    35,
       0,    36,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    37,     0,   119,   120,     0,     0,
       0,     0,     0,   121,    38,    39,    40,    41,     0,     0,
       0,    42,   122,     0,     0,     0,   123,     0,     0,   124,
       0,   125,   126,     0,     0,     0,     0,   127,   128,   129,
     130,     0,     0,     0,     0,     0,     0,     0,   563,   386,
    -456,   110,     0,     1,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    29,
       0,     0,     0,   116,   117,   118,    30,    31,     0,     0,
       0,    32,     0,     0,    33,    34,     0,    35,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,     0,   119,   120,     0,     0,     0,     0,
       0,   121,    38,    39,    40,    41,     0,     0,     0,    42,
     122,     0,     0,     0,   123,     0,     0,   124,     0,   125,
     126,     0,     0,     0,     0,   127,   128,   129,   130,     0,
       0,     0,     0,     0,     0,     0,   464,   465,   466,   110,
       0,     1,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,     0,     0,
       0,   116,   117,   118,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,   121,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,   123,     0,     0,   124,     0,   125,   126,     0,
       0,     0,     0,   127,   128,   129,   130,     0,     0,     0,
       0,     0,     0,     0,   464,   465,   485,   110,     0,     1,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    29,     0,     0,     0,   116,
     117,   118,    30,    31,     0,     0,     0,    32,     0,     0,
      33,    34,     0,    35,     0,    36,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    37,     0,
     119,   120,     0,     0,     0,     0,     0,   121,    38,    39,
      40,    41,     0,     0,     0,    42,   122,     0,     0,     0,
     123,     0,     0,   124,     0,   125,   126,     0,     0,     0,
       0,   127,   128,   129,   130,     0,     0,     0,     0,     0,
       0,     0,   464,   465,   636,   110,     0,     1,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    29,     0,     0,     0,   116,   117,   118,
      30,    31,     0,     0,     0,    32,     0,     0,    33,    34,
       0,    35,     0,    36,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    37,     0,   119,   120,
       0,     0,     0,     0,     0,   121,    38,    39,    40,    41,
       0,     0,     0,    42,   122,     0,     0,     0,   123,     0,
       0,   124,     0,   125,   126,     0,     0,     0,     0,   127,
     128,   129,   130,     0,     0,     0,     0,     0,     0,     0,
     650,   465,  -507,   110,     0,     1,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    29,     0,     0,     0,   116,   117,   118,    30,    31,
       0,     0,     0,    32,     0,     0,    33,    34,     0,    35,
       0,    36,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    37,     0,   119,   120,     0,     0,
       0,     0,     0,   121,    38,    39,    40,    41,     0,     0,
       0,    42,   122,     0,     0,     0,   123,     0,     0,   124,
       0,   125,   126,     0,     0,     0,     0,   127,   128,   129,
     130,     0,     0,     0,     0,     0,     0,     0,   464,   465,
     704,   110,     0,     1,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    29,
       0,     0,     0,   116,   117,   118,    30,    31,     0,     0,
       0,    32,     0,     0,    33,    34,     0,    35,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,     0,   119,   120,     0,     0,     0,     0,
       0,   121,    38,    39,    40,    41,     0,     0,     0,    42,
     122,     0,     0,     0,   123,     0,     0,   124,     0,   125,
     126,     0,     0,     0,     0,   127,   128,   129,   130,   110,
       0,     1,   111,   112,     0,     0,   464,   465,   807,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   208,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   407,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   416,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   418,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   594,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   595,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   596,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   598,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   713,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   714,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   207,     0,   715,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,   203,     0,
       0,   116,   117,     0,    30,    31,     0,     0,   204,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,    76,     0,     0,   205,     0,   206,   126,   110,
       0,     1,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,   207,     0,   716,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,   551,   552,   553,   554,   555,   556,   557,
     558,   559,   560,   561,     0,     0,     0,    29,     0,     0,
       0,   116,   117,   118,    30,    31,     0,   562,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,   121,
      38,    39,    40,    41,     0,     0,     0,    42,   122,     0,
       0,     0,   123,     0,     0,   124,     0,   125,   126,     0,
       0,     0,     0,   127,   128,   129,   130,     0,     0,     0,
       0,     0,     0,     0,   563,   386,   110,     0,     1,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   110,     0,     1,
     111,   112,   113,     2,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
     551,   552,   553,   554,   555,   556,   557,   558,   559,   560,
     561,     0,     0,     0,     0,     0,     0,     0,   116,   117,
     118,     0,     0,     0,     0,   110,     0,     1,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,   116,
     117,   118,     0,     0,     0,     0,     0,     0,     0,   119,
     120,     0,     2,     0,     0,     0,   121,     0,     0,     0,
       0,     0,     0,     0,     0,   122,     0,     0,     0,   123,
     119,   120,   124,     0,   125,   126,     0,   121,     0,     0,
     127,   128,   129,   130,     0,     0,   122,     0,     0,     0,
     123,   563,   386,   124,     0,   125,   126,   116,   117,   118,
       0,   127,   128,   129,   130,     0,     0,     0,     0,     0,
       0,     0,     0,   465,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,     0,     0,
       0,     0,     0,     0,   122,     0,     0,     0,   123,     0,
       0,   124,     0,   125,   126,     0,     0,     0,     0,   127,
     128,   129,   130,   110,     0,     1,   111,   112,     0,     0,
       0,   810,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,     0,     0,     0,     0,
       0,   110,     0,     1,   111,   112,   113,     0,   114,   115,
       0,    29,   203,     0,     0,   116,   117,     0,    30,    31,
       0,     0,   204,    32,     0,     0,    33,    34,     2,    35,
       0,    36,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    37,     0,   119,   120,     0,     0,
       0,     0,     0,     0,    38,    39,    40,    41,     0,     0,
       0,    42,   122,     0,     0,     0,    76,     0,     0,   205,
       0,   206,   126,   116,   117,   118,   110,     0,     1,   111,
     112,   113,     0,   114,   115,     0,     0,     0,   207,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     0,     0,     0,     0,     0,     0,     0,
     122,     0,     0,     0,   123,     0,     0,   124,   760,   125,
     126,     0,     0,     0,     0,   127,   128,   129,   130,     0,
       0,     0,     0,     0,     0,     0,   563,     0,   116,   117,
     118,   110,     0,     1,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   119,
     120,     0,     0,     0,     0,     0,   121,     0,     0,     0,
       0,     0,     0,     0,     0,   122,     0,     0,     0,   123,
       0,     0,   124,   804,   125,   126,     0,     0,     0,     0,
     127,   128,   129,   130,     0,     0,     0,     0,     0,     0,
       0,   563,     0,   116,   117,   118,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     0,     0,     0,     0,     0,     0,     0,
     122,     0,     1,     0,   123,     0,     0,   124,     0,   125,
     126,     0,     0,     0,     0,   127,   128,   129,   130,     0,
       0,     0,     0,     0,     0,     0,   688,     2,     3,     4,
       5,     6,     7,   349,   350,   351,   352,   353,   354,   355,
     356,   357,   358,   359,   360,   361,    21,    22,   362,   363,
      25,    26,   364,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   365,     0,
       0,     0,     0,     0,     0,    30,    31,     0,     0,     0,
      32,     0,     0,     0,     0,     0,   366,     0,   367,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   368,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,    39,   369,   370,     0,     0,     0,    42,     0,
       0,     0,     1,    76,     0,     0,   310,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   539,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    29,     0,
       0,     0,     0,     0,     0,    30,    31,     0,     0,     0,
      32,     0,     0,    33,    34,     0,    35,     0,    36,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    37,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,    39,    40,    41,     0,     0,     0,    42,     0,
       0,     1,     0,    76,     0,     0,   394,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   395,     0,   396,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,     0,     0,
       0,     0,     0,     0,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,     0,     0,
       1,     0,    76,     0,     0,   181,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   693,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    29,     0,     0,     0,
       0,     0,     0,    30,    31,     0,     0,     0,    32,     0,
       0,    33,    34,     0,    35,     0,    36,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    38,
      39,    40,    41,     0,     0,     0,    42,     0,     0,     0,
       0,    76,     0,   110,   310,     1,   111,   112,   113,    78,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  -288,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    29,     0,     0,     0,   116,   117,   118,    30,    31,
       0,     0,     0,    32,     0,     0,    33,    34,     0,    35,
       0,    36,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    37,     0,   119,   120,     0,     0,
       0,     0,     0,   121,    38,    39,    40,    41,     0,     0,
       0,    42,   122,     0,     0,     0,   123,     0,     0,   124,
       0,   125,   126,     0,     0,     0,     0,   127,   128,   129,
     130,   110,     0,     1,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    29,
       0,     0,     0,   116,   117,   118,    30,    31,     0,     0,
       0,    32,     0,     0,    33,    34,     0,    35,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,     0,   119,   120,     0,     0,     0,     0,
       0,   121,    38,    39,    40,    41,     0,     0,     0,     0,
     122,     0,     0,     0,   123,     0,     0,   124,   254,   125,
     126,     0,     0,     0,     0,   127,   128,   129,   130,   110,
       0,     1,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,     0,     0,
       0,   116,   117,   118,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,   110,     0,
       1,   111,   112,   113,     0,   114,   115,     0,     0,     0,
      37,     0,   119,   120,     0,     0,     0,     0,     0,   121,
      38,    39,    40,    41,     0,     2,     0,     0,   122,     0,
       0,     0,   382,     0,     0,   383,   254,   125,   126,     0,
       0,     0,     0,   127,   128,   129,   130,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     1,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
     116,   117,   118,    30,    31,     0,     0,   110,    32,     1,
     111,   112,   113,     2,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   119,   120,     0,     2,     0,     0,     0,   121,    38,
      39,     0,     0,     0,     0,     0,     0,   122,     0,     0,
       0,   382,     0,     0,   383,   254,   125,   126,   116,   117,
     118,     0,   127,   128,   129,   130,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   116,
     117,   118,     0,     0,     0,     0,     0,     0,     0,   119,
     120,     0,     0,     0,     0,     0,   121,     0,     0,     0,
       0,     0,     0,     0,     0,   122,     0,     0,     0,   123,
     119,   120,   124,     0,   125,   126,     0,   121,   177,     0,
     127,   128,   129,   130,     0,     0,   122,     0,     0,     0,
     123,     0,     0,   124,     0,   125,   126,     0,     0,   331,
       0,   127,   128,   129,   130,   110,     0,     1,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     1,   111,
     112,   113,     2,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   110,     0,     1,
     111,   112,   113,     2,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,   116,   117,   118,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,     0,   116,
     117,   118,     0,     0,   122,     0,     0,     0,   123,   119,
     120,   124,     0,   125,   126,     0,   121,   334,     0,   127,
     128,   129,   130,     0,     0,   122,     0,     0,     0,   123,
     119,   120,   124,   254,   125,   126,     0,   121,     0,     0,
     127,   128,   129,   130,     0,     0,   122,     0,     0,     0,
     123,     0,     0,   124,   757,   125,   126,     0,     0,     0,
       0,   127,   128,   129,   130,   110,     0,     1,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     1,   111,
     112,   113,     2,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   110,     0,     1,
     111,   112,   113,     2,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,   116,   117,   118,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,     0,   116,
     117,   118,     0,     0,   122,     0,     0,     0,   123,   119,
     120,   124,   836,   125,   126,     0,   121,     0,     0,   127,
     128,   129,   130,     0,     0,   122,     0,     0,     0,   123,
     119,   120,   124,     0,   125,   126,     0,   121,     0,     0,
     127,   128,   129,   130,     0,     0,   122,     0,     0,     0,
     123,     0,     0,   242,     0,   125,   126,     0,     0,     0,
       0,   127,   128,   129,   130,   110,     0,     1,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     1,   111,
     112,   113,     2,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   116,   117,   118,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,     0,     0,
       0,     0,     0,     0,   122,     0,     0,     0,   123,   119,
     120,   244,     0,   125,   126,     0,   121,     0,     0,   127,
     128,   129,   130,     1,     0,   122,     0,     0,     0,   123,
       0,     0,   252,     0,   125,   126,     0,     0,     0,     0,
     127,   128,   129,   130,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    29,
       0,     0,     0,     0,     0,     0,    30,    31,     0,     0,
       0,    32,     0,     0,    33,    34,     0,    35,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,     0,     0,     0,     0,     0,     0,     0,
       0,     1,    38,    39,    40,    41,     0,     0,     0,    42,
       0,     0,     0,     0,    76,     0,     0,    77,     0,     0,
       0,     0,    78,     0,     0,    79,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,     0,     0,     0,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,     0,     0,     0,     0,     1,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,     0,     0,
       0,     0,    76,     0,     0,    77,   170,     0,     0,     0,
      78,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,     0,     0,     0,    30,
      31,     0,     0,     0,    32,     0,     0,    33,    34,     0,
      35,     0,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    37,     0,     0,     0,     0,
       0,     1,     0,     0,     0,    38,    39,    40,    41,     0,
       0,     0,    42,     0,     0,     0,     0,    76,     0,     0,
     310,   170,     0,     0,     0,    78,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,     0,     0,
       0,     0,     0,     0,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,     0,     0,     0,     0,     1,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,     0,     0,
       0,     0,    76,     0,     0,   437,     0,     0,     0,     0,
     438,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    29,     0,     0,     0,     0,     0,     0,    30,
      31,     0,     0,     0,    32,     0,     0,    33,    34,     0,
      35,     0,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    37,     0,     0,     0,     0,
       0,     1,     0,     0,     0,    38,    39,    40,    41,     0,
       0,     0,    42,     0,     0,     0,     0,    76,     0,     0,
     437,     0,     0,     0,     0,   450,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,     0,     0,
       0,     0,     0,     0,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,     0,     0,     0,     0,     1,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,    42,     0,     0,
       0,     0,    76,     0,     0,   310,     0,     0,     0,     0,
      78,     2,     3,     4,     5,     6,     7,   349,   350,   351,
     352,   353,   354,   355,   356,   357,   358,   359,   360,   361,
      21,    22,   362,   363,    25,    26,    27,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   365,     0,     0,     0,     0,     0,     0,    30,
      31,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     366,     0,   367,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   368,     0,     0,     0,     0,
       0,     1,     0,     0,     0,    38,    39,   369,   370,     0,
       0,     0,    42,     0,     0,     0,     0,    76,     0,     0,
     437,     0,     0,     0,     0,   620,     2,     3,     4,     5,
       6,     7,   349,   350,   351,   352,   353,   354,   355,   356,
     357,   358,   359,   360,   361,    21,    22,   362,   363,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   365,     0,     0,
       0,     0,     0,     0,    30,    31,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   366,     0,   367,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     368,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      38,    39,   369,   370,     0,     0,     0,    42,     0,     0,
       0,     0,    76,     0,     0,   437,     2,     0,     0,     0,
     630,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    29,     0,     0,
       0,     0,     0,     0,    30,    31,     0,     0,     0,    32,
       0,     0,    33,    34,     0,    35,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,     0,     0,     0,     0,     0,     1,     0,     0,     0,
      38,    39,    40,    41,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,   310,     0,     0,     0,     0,
      78,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,     0,     0,     0,    30,
      31,     0,     0,     0,    32,     0,     0,    33,    34,     0,
      35,     0,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    37,     0,     1,     0,     0,
       0,     0,     0,     0,     0,    38,    39,    40,    41,     0,
       0,     0,    42,     0,     0,     0,     0,    76,     0,     0,
     437,   610,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,     0,     0,     0,
      30,    31,     0,     0,     0,    32,     0,     0,    33,    34,
       0,    35,     0,    36,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    37,     0,     1,     0,
       0,     0,     0,     0,     0,     0,    38,    39,    40,    41,
       0,     0,     0,    42,     0,     0,     0,     0,     0,     0,
       0,     0,   195,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,     0,     0,
       0,    30,    31,     0,     0,     0,    32,     0,     0,    33,
      34,     0,    35,     0,    36,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    37,     0,     1,
       0,     0,     0,     0,     0,     0,     0,    38,    39,    40,
      41,     0,     0,     0,    42,     0,     0,     0,     0,     0,
       0,     0,     0,   329,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,     0,
       0,     0,    30,    31,     0,     0,     0,    32,     0,     0,
      33,    34,     0,    35,     0,    36,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    37,     0,
       1,     0,     0,     0,     0,     0,     0,     0,    38,    39,
      40,    41,     0,     0,     0,    42,     0,     0,     0,     0,
       0,     0,     0,     0,   721,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    29,     0,     0,     0,
       0,     0,     0,    30,    31,     0,     0,     0,    32,     0,
       0,    33,    34,     0,    35,     0,    36,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    38,
      39,    40,    41,     0,     0,     0,    42,     0,     0,     0,
       0,    76,     0,     0,   181,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    29,     0,     0,     0,
       0,     0,     0,    30,    31,     0,     0,     0,    32,     0,
       0,    33,    34,     0,    35,     0,    36,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    38,
      39,    40,    41,     0,     0,     0,    42,     0,     0,     0,
       0,     0,     0,     0,   549,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   521,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
       0,     0,     0,    30,    31,     0,     0,     0,    32,     0,
       0,    33,    34,     0,    35,     0,    36,     0,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    38,
      39,    40,    41,     0,     0,     0,    42,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,     0,     0,     0,    30,    31,     0,     0,     0,
      32,     0,     0,    33,    34,     0,    35,     0,    36,     0,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    37,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,    39,    40,    41,     0,     0,     0,    42,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      29,     0,     0,     0,     0,     0,     0,    30,    31,     0,
       0,     0,    32,     0,     0,    33,    34,     0,    35,     0,
      36,     0,     0,     0,     0,     0,     1,     0,     0,     0,
       0,     0,     0,    37,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    38,    39,    40,    41,     0,     0,     0,
      42,     2,     3,     4,     5,     6,     7,   349,   350,   351,
     352,   353,   354,   355,   356,   357,   358,   359,   360,   361,
      21,    22,   362,   363,    25,    26,   364,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   365,     0,     0,     0,     0,     0,     0,    30,
      31,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     366,     0,   367,     0,     0,     0,     0,     0,     1,     0,
       0,     0,     0,     0,     0,   368,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    38,    39,   369,   370,     0,
       0,     0,    42,     2,     3,     4,     5,     6,     7,   349,
     350,   351,   352,   353,   354,   355,   356,   357,   358,   359,
     360,   361,    21,    22,   362,   363,    25,    26,    27,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   365,     0,     0,     0,     0,     0,
       0,    30,    31,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   366,     0,   367,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   368,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,    39,   369,
     370,     0,     0,     0,    42
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-756)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,    49,    92,   124,    83,    54,     0,   126,   265,   387,
     204,   393,    49,   269,   348,   439,    95,   387,   442,     3,
       3,   215,    69,   127,    95,   138,     3,    27,   284,    17,
     538,    79,   203,   250,     3,    71,     3,    72,     3,   203,
      77,   203,    79,    81,     3,    28,    83,     3,    48,    49,
       3,   203,    71,     3,    72,   810,   105,    49,    95,    28,
     134,    61,    71,    28,    47,    72,    66,   125,   134,   217,
      70,    71,   146,    81,   112,   113,    71,    77,   144,    79,
      71,    81,     3,    83,   205,   249,     3,   251,   127,   147,
       3,   309,    92,    76,    77,    95,   314,   249,    98,   251,
     190,   856,   102,     3,   112,   113,   144,   143,   108,   109,
     189,   619,   125,   148,   185,    28,   116,   127,   189,   119,
       1,   242,     3,   244,     3,   126,    27,   125,    28,   148,
     148,   252,   132,   134,   147,   135,   229,   230,   231,   148,
     124,   148,    49,   127,   181,   128,   183,    47,   185,    11,
     271,   134,   189,   148,   144,   143,   156,   148,   158,   684,
      61,   161,   199,   671,    98,   124,   125,   144,   205,   161,
     147,   171,   128,   286,   287,   288,    76,    77,   147,   216,
     147,   181,   147,   183,   305,   185,   380,   236,   225,   189,
     190,   615,   570,   571,   147,     0,   196,   147,   532,   199,
     570,   102,   373,   203,   204,   205,   206,   128,   465,   373,
     127,   373,   134,   213,   214,   215,   216,   217,   726,   134,
     437,   373,   269,     3,   146,   225,   148,   444,   128,   229,
     230,   231,   311,   148,   313,   452,   761,   284,   238,     1,
      72,     3,   242,   124,   125,   124,   125,   247,   248,   249,
     250,   251,   252,   147,   161,   326,   638,   257,   294,   295,
      69,   297,   383,   134,   126,   257,   266,   415,   147,   417,
     270,   419,   134,   309,   134,   146,   470,   148,   314,   133,
     444,   317,   444,   217,   136,   137,   146,     5,   452,   326,
     452,   134,   444,   147,     0,   229,   230,   231,    71,    72,
     452,     3,   203,   146,   113,   114,   115,   128,   215,   309,
     310,   147,   121,   134,   314,   124,   148,   317,    71,    72,
     127,   699,   133,   323,    49,   582,   326,   420,   421,   323,
      71,    72,   425,   127,   427,   242,   147,     3,   132,   339,
     124,   248,   135,   250,   463,   252,   383,   437,   249,   462,
     251,    12,    13,   128,   403,   139,   140,   394,   134,   134,
     147,   398,   124,   125,   364,    71,   128,   404,   133,   406,
     146,    77,   134,   373,   411,   148,   134,   134,   378,   147,
     380,   373,   147,   383,   384,   385,    92,   387,   146,   146,
     209,   210,   211,   212,   394,   148,   205,   397,   398,   124,
     134,   657,    71,    72,   404,   141,   406,   148,   455,   530,
     116,   411,   128,   119,   148,   415,   126,   417,   134,   419,
     420,   421,   124,   125,   134,   425,   124,   427,   142,   127,
     430,   431,     3,   242,   132,   244,   161,   437,   517,   431,
     561,   128,   126,   252,   444,   147,    16,   134,   128,   597,
     134,   599,   452,   601,   602,     3,   456,    28,   124,   145,
     269,   127,   271,   364,   125,   126,   132,   467,   126,   309,
     470,     3,   373,   380,   314,   284,   134,   378,   385,   148,
      28,   415,   128,   417,   190,   419,   420,   421,   134,   536,
     215,   425,   128,   427,   128,   128,   305,   128,   204,    47,
     206,   134,   538,   134,    81,    76,    77,   127,   134,   766,
      81,   548,   132,     3,   514,   128,   128,   242,    81,   567,
     128,   134,   514,   248,   431,   250,   616,   252,    76,    77,
     567,   124,   257,   133,   127,   112,   113,   537,   538,   264,
     265,   112,   113,   444,   544,   147,   546,   584,   548,   112,
     113,   452,   589,    10,    11,   146,   556,   146,   558,   680,
     681,   682,   562,     3,   564,   147,   128,   567,   145,   147,
     570,   571,   134,   128,   383,   131,   147,   145,   387,   128,
     556,   133,   145,   619,   584,   585,    76,    77,   133,   589,
     128,    81,   124,   125,   127,   571,   127,   597,   127,   599,
     127,   601,   602,   309,   310,   132,   125,   514,   314,   148,
     657,   317,   128,   145,   127,   147,   616,   323,   132,   619,
       3,   127,   112,   113,     7,     8,     9,     3,    14,    15,
     125,     7,     8,     9,   132,   671,    76,    77,   148,   639,
     128,    81,   146,   147,   128,   546,   455,   148,    47,    48,
     133,   134,   289,   290,   128,   380,   127,   147,   383,   478,
     385,     3,   387,   597,   144,   599,   666,   601,   602,   291,
     292,   671,   112,   113,   127,    76,    77,    76,    77,   679,
      81,   802,    81,   127,   805,   108,   109,   127,   298,   299,
     726,   691,   132,   127,   694,   146,    76,    77,   146,   699,
     128,    81,   148,   679,   146,     0,   431,   707,   128,   133,
     710,   112,   113,   112,   113,   691,   125,   132,   132,   767,
     133,   530,   769,   699,   128,   124,   726,   536,   128,   148,
     767,   437,   112,   113,    76,    77,   147,   144,    59,    81,
     465,   146,   145,   132,   127,   470,   148,   556,   131,   132,
     144,   127,   561,   753,    49,   131,   132,   757,   483,   128,
     760,   570,   571,   810,   127,   145,   133,   767,   133,   145,
     112,   113,   772,   773,     3,    70,    71,   753,     7,     8,
       9,   757,    77,    78,   760,   127,   133,   133,   133,   514,
     133,     3,   146,   148,    67,   148,   148,    92,   798,   799,
     148,   801,   146,    98,   804,    61,   300,    76,    77,   856,
     148,   148,    81,   148,     3,   148,   148,   103,   303,   301,
     251,   116,   798,   799,   119,   801,   302,   304,   804,   124,
     767,   117,   538,   105,   120,   409,   836,   585,   317,    28,
     238,   470,   567,   112,   113,   570,   571,   570,   657,   668,
     669,   483,   852,   648,    -1,   855,   252,   582,   483,   128,
     836,    -1,   483,    -1,    76,    77,   161,    -1,    -1,    81,
     679,   680,   681,   682,    -1,   684,   852,    -1,    -1,   855,
      -1,    -1,   691,    -1,    -1,    -1,    -1,    76,    77,    -1,
     699,    -1,    81,    -1,    -1,   190,   191,    -1,   127,   194,
     112,   113,   131,   132,    -1,   191,    -1,    -1,   194,   204,
     616,   206,   124,   619,    -1,   127,   145,    -1,    -1,    -1,
     215,    -1,   217,   112,   113,    -1,    -1,   746,   747,    -1,
     749,   750,   144,    49,   229,   230,   231,     1,    -1,     3,
      -1,    -1,    -1,    -1,   753,    -1,    -1,   242,   757,   235,
      -1,   760,   761,   248,    -1,   250,    -1,   252,    -1,    -1,
     769,    77,   257,    79,    -1,   671,   785,    83,   787,   264,
     265,    -1,    -1,    -1,   699,   794,   795,    -1,     1,    95,
       3,     4,     5,    -1,     3,    -1,    -1,    -1,    -1,   798,
     799,    -1,   801,   802,    -1,   804,   805,    -1,    -1,    -1,
      -1,   810,   821,    -1,   823,    28,   825,    -1,   827,    -1,
      -1,    -1,    76,    77,   309,   310,    -1,    81,    -1,   314,
     726,    -1,   317,    -1,    -1,    -1,    -1,   836,   323,   848,
      -1,   850,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   766,    -1,   852,    -1,    -1,   855,   856,   112,   113,
      73,    74,    -1,    -1,    -1,    -1,    -1,    76,    77,    -1,
     124,   125,    81,   127,   128,   181,    -1,   183,   132,   185,
       3,    -1,    49,   189,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,   199,    61,   380,    -1,    -1,   383,   205,
     385,    -1,   387,   112,   113,    -1,    -1,   120,    -1,   215,
      77,    -1,    79,    -1,   127,   124,    -1,   130,   127,   395,
      -1,    -1,    -1,    90,    -1,    -1,    -1,    -1,    95,    -1,
     415,    98,   417,    -1,   419,   420,   421,    -1,    -1,    -1,
     425,    -1,   427,    -1,    -1,    -1,   431,   423,    -1,    -1,
      -1,    -1,   437,    76,    77,    -1,    -1,    -1,    81,    -1,
      -1,    -1,   438,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   450,    -1,    -1,    -1,    -1,    -1,
     465,    -1,    -1,    -1,    -1,   470,    -1,    -1,    -1,   112,
     113,    -1,    -1,    -1,   161,    -1,    -1,    -1,   483,    -1,
      -1,   124,    -1,    -1,   127,   128,   173,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   181,    -1,    -1,   184,   185,    -1,
     326,    -1,   189,    -1,    -1,    -1,    -1,    -1,    -1,   514,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   204,   205,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   215,    -1,
     217,    -1,   537,   538,    -1,    -1,    -1,    -1,   225,    -1,
      -1,    -1,   229,   230,   231,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   551,    -1,   383,    -1,    -1,
      -1,   248,   567,   250,    -1,   570,   571,    -1,   394,    -1,
     257,   145,   398,    -1,    -1,    -1,    -1,   582,   404,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   587,   597,    -1,   599,    -1,   601,   602,    -1,    -1,
      49,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   616,    -1,    -1,   619,    -1,    -1,    -1,    -1,    -1,
      -1,   617,    -1,   310,   620,    -1,    -1,    76,    -1,    -1,
      49,    -1,    -1,   629,   630,    -1,    -1,    -1,    -1,   326,
      49,    -1,    -1,    -1,   470,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,    77,    -1,
      79,    -1,    -1,    -1,    83,    -1,   671,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   124,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   373,    -1,    -1,    -1,
      -1,   378,    -1,   380,   699,    -1,   383,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   394,    -1,    -1,
      -1,    -1,   161,    -1,    -1,   124,    -1,   404,    -1,   168,
      -1,   726,   548,    -1,    -1,    -1,    -1,    -1,   415,    -1,
     417,   727,   419,   420,   421,   731,    -1,    -1,   425,    -1,
     427,   567,   161,    -1,   431,    -1,    -1,    -1,    -1,   168,
     437,    -1,   161,    -1,   203,    -1,    -1,   444,   584,   585,
      -1,   766,   181,   589,   183,   452,   215,    -1,   764,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   775,
      -1,    -1,    -1,   470,    -1,    -1,   205,    -1,    -1,    -1,
      -1,    -1,    -1,   242,    -1,    -1,   215,   216,    -1,   248,
     249,   250,   251,   252,    -1,    -1,   215,    -1,   257,    -1,
      -1,    -1,    -1,    -1,    -1,   264,   265,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   514,    -1,   248,
      -1,   250,    -1,   242,    -1,    -1,    -1,    -1,   257,   248,
     249,   250,   251,   252,    -1,    -1,    -1,    -1,   257,    -1,
      -1,    -1,    -1,    -1,    -1,   264,   265,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    49,    -1,    -1,    -1,
     567,   707,    -1,    -1,   710,    -1,    -1,    -1,    -1,    -1,
      -1,   310,   311,    -1,    -1,    -1,    -1,    -1,   585,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     597,    -1,   599,    -1,   601,   602,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   373,    -1,    -1,    -1,    -1,    -1,
      -1,   380,    -1,   382,   383,    -1,   385,    -1,   387,    -1,
      -1,   767,    -1,    -1,    -1,    -1,   772,   773,    -1,    -1,
      -1,   124,    -1,    -1,   373,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   382,   383,    -1,    -1,    -1,    -1,    49,
      -1,   380,    -1,    -1,   383,   394,   385,    -1,   387,   398,
      -1,    -1,   431,    -1,    -1,    -1,    -1,    -1,   161,    -1,
      -1,    -1,    -1,    -1,    -1,   444,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   452,    -1,    -1,    -1,    -1,    -1,    -1,
     697,    -1,   431,    -1,    -1,    78,   465,    -1,   437,    -1,
     439,   470,   431,   710,    -1,   444,    -1,    -1,    -1,    -1,
      -1,    -1,    98,   452,   483,   444,    -1,    -1,    -1,    -1,
     103,    -1,   215,   452,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   470,    -1,    -1,   117,    -1,   465,   120,    -1,    -1,
      -1,   470,    -1,    -1,    -1,   514,    -1,    -1,    -1,   242,
      -1,    -1,    -1,    -1,   483,   248,   249,   250,   251,   252,
     767,   161,    -1,    -1,   257,    -1,    -1,    -1,    -1,    -1,
      -1,   264,   265,    -1,    -1,   514,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   514,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   567,    -1,
      -1,   570,   571,   203,    -1,    -1,    -1,    -1,   191,   548,
      -1,   194,    -1,   582,    -1,   215,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   567,    -1,
      -1,   217,    -1,    -1,    -1,    -1,    -1,    -1,   567,    -1,
      -1,   570,   571,   229,   230,   231,   585,    -1,   248,   249,
     250,   251,   235,   582,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   264,   265,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   264,   265,
      -1,   264,   265,    -1,    -1,    -1,    -1,   380,    -1,    -1,
     383,    -1,   385,    -1,   387,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     699,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   431,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   444,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   452,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   707,    -1,
     699,    -1,   465,   373,    -1,    -1,    -1,   470,    -1,    -1,
     380,    -1,    -1,    -1,    -1,   385,    -1,   387,    -1,    -1,
     483,    -1,    -1,    -1,    -1,    -1,    -1,   766,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
     393,    -1,   395,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   514,    -1,   409,    -1,    -1,    28,    -1,   767,   415,
      -1,   417,    -1,   419,   420,   421,    -1,   766,    -1,   425,
     423,   427,    -1,    -1,   444,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   452,    -1,    -1,   438,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   465,    -1,   450,    -1,    -1,
     470,    73,    74,    75,   567,    -1,    -1,   570,   571,   465,
      -1,    -1,   465,   483,    -1,    -1,    -1,    -1,    -1,   582,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   483,    -1,    -1,
     483,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,
      -1,    -1,    -1,    -1,   514,    -1,    -1,    -1,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,    -1,
      -1,    -1,    -1,   135,   136,   137,   138,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,   567,   551,    -1,
     570,   571,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   582,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   582,    -1,    -1,   582,
      -1,    -1,    -1,    -1,   587,    -1,   699,    -1,    -1,    -1,
      -1,   597,    -1,   599,    -1,   601,   602,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,
      75,    -1,    -1,    -1,   617,    -1,    -1,   620,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   629,   630,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   638,    -1,    -1,    -1,   104,
     105,    -1,   648,    -1,    -1,   648,   111,    -1,    -1,    -1,
      -1,    -1,    -1,   766,    -1,   120,   659,    -1,    -1,   124,
      -1,    -1,   127,   128,   129,   130,    -1,    -1,    -1,    -1,
     135,   136,   137,   138,    -1,    -1,    -1,    -1,    -1,   699,
      -1,    -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   727,    -1,    -1,    -1,   731,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   766,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
     766,   764,    -1,   766,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   775,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      -1,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    -1,    -1,    -1,    69,    -1,    -1,    -1,    73,
      74,    75,    76,    77,    -1,    79,    -1,    81,    -1,    -1,
      84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,
     104,   105,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,   115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,
     124,    -1,    -1,   127,    -1,   129,   130,    -1,    -1,    -1,
      -1,   135,   136,   137,   138,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   146,   147,   148,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    -1,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      -1,    -1,    -1,    69,    -1,    -1,    -1,    73,    74,    75,
      76,    77,    -1,    79,    -1,    81,    -1,    -1,    84,    85,
      -1,    87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,   115,
      -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,    -1,
      -1,   127,    -1,   129,   130,    -1,    -1,    -1,    -1,   135,
     136,   137,   138,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     146,   147,   148,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    -1,    -1,
      -1,    69,    -1,    -1,    -1,    73,    74,    75,    76,    77,
      -1,    79,    -1,    81,    -1,    -1,    84,    85,    -1,    87,
      -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,   115,    -1,    -1,
      -1,   119,   120,    -1,    -1,    -1,   124,    -1,    -1,   127,
      -1,   129,   130,    -1,    -1,    -1,    -1,   135,   136,   137,
     138,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,   147,
     148,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    73,    74,    75,    76,    77,    -1,    -1,
      -1,    81,    -1,    -1,    84,    85,    -1,    87,    -1,    89,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,   115,    -1,    -1,    -1,   119,
     120,    -1,    -1,    -1,   124,    -1,    -1,   127,    -1,   129,
     130,    -1,    -1,    -1,    -1,   135,   136,   137,   138,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   146,   147,   148,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    73,    74,    75,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,    -1,
      -1,    -1,    -1,   135,   136,   137,   138,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,   147,   148,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    73,
      74,    75,    76,    77,    -1,    -1,    -1,    81,    -1,    -1,
      84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,
     104,   105,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,   115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,
     124,    -1,    -1,   127,    -1,   129,   130,    -1,    -1,    -1,
      -1,   135,   136,   137,   138,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   146,   147,   148,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    69,    -1,    -1,    -1,    73,    74,    75,
      76,    77,    -1,    -1,    -1,    81,    -1,    -1,    84,    85,
      -1,    87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,   115,
      -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,    -1,
      -1,   127,    -1,   129,   130,    -1,    -1,    -1,    -1,   135,
     136,   137,   138,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     146,   147,   148,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    -1,    -1,    -1,    73,    74,    75,    76,    77,
      -1,    -1,    -1,    81,    -1,    -1,    84,    85,    -1,    87,
      -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,   115,    -1,    -1,
      -1,   119,   120,    -1,    -1,    -1,   124,    -1,    -1,   127,
      -1,   129,   130,    -1,    -1,    -1,    -1,   135,   136,   137,
     138,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,   147,
     148,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    73,    74,    75,    76,    77,    -1,    -1,
      -1,    81,    -1,    -1,    84,    85,    -1,    87,    -1,    89,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,   115,    -1,    -1,    -1,   119,
     120,    -1,    -1,    -1,   124,    -1,    -1,   127,    -1,   129,
     130,    -1,    -1,    -1,    -1,   135,   136,   137,   138,     1,
      -1,     3,     4,     5,    -1,    -1,   146,   147,   148,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    73,    74,    75,    76,    77,    -1,    79,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   129,   130,    -1,
      -1,    -1,    -1,   135,   136,   137,   138,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,   147,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,
      75,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    73,
      74,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,
     105,    -1,    28,    -1,    -1,    -1,   111,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,   124,
     104,   105,   127,    -1,   129,   130,    -1,   111,    -1,    -1,
     135,   136,   137,   138,    -1,    -1,   120,    -1,    -1,    -1,
     124,   146,   147,   127,    -1,   129,   130,    73,    74,    75,
      -1,   135,   136,   137,   138,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,   124,    -1,
      -1,   127,    -1,   129,   130,    -1,    -1,    -1,    -1,   135,
     136,   137,   138,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    69,    70,    -1,    -1,    73,    74,    -1,    76,    77,
      -1,    -1,    80,    81,    -1,    -1,    84,    85,    28,    87,
      -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,    -1,
      -1,   119,   120,    -1,    -1,    -1,   124,    -1,    -1,   127,
      -1,   129,   130,    73,    74,    75,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,   146,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   104,   105,    -1,    -1,    -1,    -1,
      -1,   111,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     120,    -1,    -1,    -1,   124,    -1,    -1,   127,   128,   129,
     130,    -1,    -1,    -1,    -1,   135,   136,   137,   138,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   146,    -1,    73,    74,
      75,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   104,
     105,    -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,   124,
      -1,    -1,   127,   128,   129,   130,    -1,    -1,    -1,    -1,
     135,   136,   137,   138,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   146,    -1,    73,    74,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   104,   105,    -1,    -1,    -1,    -1,
      -1,   111,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     120,    -1,     3,    -1,   124,    -1,    -1,   127,    -1,   129,
     130,    -1,    -1,    -1,    -1,   135,   136,   137,   138,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   146,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,
      -1,    -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,
      81,    -1,    -1,    -1,    -1,    -1,    87,    -1,    89,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,
      -1,    -1,     3,   124,    -1,    -1,   127,    -1,    -1,    -1,
      -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   147,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,
      -1,    -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,
      81,    -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,
      -1,     3,    -1,   124,    -1,    -1,   127,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   144,    -1,   146,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
       3,    -1,   124,    -1,    -1,   127,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   146,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,    -1,
      -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,   124,    -1,     1,   127,     3,     4,     5,     6,   132,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    -1,    -1,    -1,    73,    74,    75,    76,    77,
      -1,    -1,    -1,    81,    -1,    -1,    84,    85,    -1,    87,
      -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,   115,    -1,    -1,
      -1,   119,   120,    -1,    -1,    -1,   124,    -1,    -1,   127,
      -1,   129,   130,    -1,    -1,    -1,    -1,   135,   136,   137,
     138,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    73,    74,    75,    76,    77,    -1,    -1,
      -1,    81,    -1,    -1,    84,    85,    -1,    87,    -1,    89,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,   115,    -1,    -1,    -1,    -1,
     120,    -1,    -1,    -1,   124,    -1,    -1,   127,   128,   129,
     130,    -1,    -1,    -1,    -1,   135,   136,   137,   138,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    73,    74,    75,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,   115,    -1,    28,    -1,    -1,   120,    -1,
      -1,    -1,   124,    -1,    -1,   127,   128,   129,   130,    -1,
      -1,    -1,    -1,   135,   136,   137,   138,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      73,    74,    75,    76,    77,    -1,    -1,     1,    81,     3,
       4,     5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,    -1,    28,    -1,    -1,    -1,   111,   112,
     113,    -1,    -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,
      -1,   124,    -1,    -1,   127,   128,   129,   130,    73,    74,
      75,    -1,   135,   136,   137,   138,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,
      74,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,
     105,    -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,   124,
     104,   105,   127,    -1,   129,   130,    -1,   111,   133,    -1,
     135,   136,   137,   138,    -1,    -1,   120,    -1,    -1,    -1,
     124,    -1,    -1,   127,    -1,   129,   130,    -1,    -1,   133,
      -1,   135,   136,   137,   138,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    73,    74,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    73,
      74,    75,    -1,    -1,   120,    -1,    -1,    -1,   124,   104,
     105,   127,    -1,   129,   130,    -1,   111,   133,    -1,   135,
     136,   137,   138,    -1,    -1,   120,    -1,    -1,    -1,   124,
     104,   105,   127,   128,   129,   130,    -1,   111,    -1,    -1,
     135,   136,   137,   138,    -1,    -1,   120,    -1,    -1,    -1,
     124,    -1,    -1,   127,   128,   129,   130,    -1,    -1,    -1,
      -1,   135,   136,   137,   138,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    73,    74,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    73,
      74,    75,    -1,    -1,   120,    -1,    -1,    -1,   124,   104,
     105,   127,   128,   129,   130,    -1,   111,    -1,    -1,   135,
     136,   137,   138,    -1,    -1,   120,    -1,    -1,    -1,   124,
     104,   105,   127,    -1,   129,   130,    -1,   111,    -1,    -1,
     135,   136,   137,   138,    -1,    -1,   120,    -1,    -1,    -1,
     124,    -1,    -1,   127,    -1,   129,   130,    -1,    -1,    -1,
      -1,   135,   136,   137,   138,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,   124,   104,
     105,   127,    -1,   129,   130,    -1,   111,    -1,    -1,   135,
     136,   137,   138,     3,    -1,   120,    -1,    -1,    -1,   124,
      -1,    -1,   127,    -1,   129,   130,    -1,    -1,    -1,    -1,
     135,   136,   137,   138,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    -1,    -1,    -1,    76,    77,    -1,    -1,
      -1,    81,    -1,    -1,    84,    85,    -1,    87,    -1,    89,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   112,   113,   114,   115,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,   124,    -1,    -1,   127,    -1,    -1,
      -1,    -1,   132,    -1,    -1,   135,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,   128,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    84,    85,    -1,
      87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,    -1,    -1,
     127,   128,    -1,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    84,    85,    -1,
      87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,    -1,    -1,
     127,    -1,    -1,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,    -1,    -1,
     127,    -1,    -1,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    -1,    -1,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,    28,    -1,    -1,    -1,
     132,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    84,    85,    -1,
      87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,    -1,    -1,
     127,   128,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    -1,    -1,    -1,    -1,
      76,    77,    -1,    -1,    -1,    81,    -1,    -1,    84,    85,
      -1,    87,    -1,    89,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,
      -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   128,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    77,    -1,    -1,    -1,    81,    -1,    -1,    84,
      85,    -1,    87,    -1,    89,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   128,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    -1,    -1,
      -1,    -1,    76,    77,    -1,    -1,    -1,    81,    -1,    -1,
      84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,
     114,   115,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   128,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,    -1,
      -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,   124,    -1,    -1,   127,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,    -1,
      -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   127,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,    -1,
      -1,    84,    85,    -1,    87,    -1,    89,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,   119,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,
      -1,    -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,
      81,    -1,    -1,    84,    85,    -1,    87,    -1,    89,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    -1,    -1,    -1,    -1,    -1,    -1,    76,    77,    -1,
      -1,    -1,    81,    -1,    -1,    84,    85,    -1,    87,    -1,
      89,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,
     119,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    89,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    77,    -1,    -1,    -1,    81,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    89,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,   119
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    68,    69,
      76,    77,    81,    84,    85,    87,    89,   102,   112,   113,
     114,   115,   119,   150,   151,   152,   153,   154,   159,   189,
     190,   195,   196,   197,   198,   202,   203,   204,   205,   207,
     208,   214,   222,   223,   241,   272,   147,   154,   159,   127,
     127,   125,     1,   124,   125,   159,   124,   127,   132,   135,
     150,   159,   195,   196,   204,   205,   207,   223,   226,   228,
     230,   231,   233,   234,   235,   238,   127,   202,   147,   153,
     154,   159,   196,   144,     0,   159,   224,   225,   147,   147,
       1,     4,     5,     6,     8,     9,    73,    74,    75,   104,
     105,   111,   120,   124,   127,   129,   130,   135,   136,   137,
     138,   152,   159,   160,   161,   162,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   177,   178,
     179,   180,   181,   259,   262,   152,   159,   152,   159,   166,
     171,   189,   209,   210,   211,   212,   213,   204,   237,   238,
     128,   159,   228,   230,   239,   240,   241,   133,   152,   180,
     184,   127,   159,   196,   230,   238,   226,   231,   234,   238,
     127,   132,   196,   127,   132,   128,   159,   239,   242,   196,
     226,   235,   127,    70,    80,   127,   129,   146,   148,   155,
     156,   157,   158,   159,   162,   189,   196,   215,   216,   217,
     218,   219,   231,   232,   234,   238,   261,   262,   264,   147,
     147,   147,   154,   159,   184,   145,   198,   202,   134,   148,
     224,   224,   127,   166,   127,   166,   166,   159,   189,   184,
     189,   184,   127,   166,   128,   181,   183,   186,   204,   205,
     207,   223,   243,   259,   147,   147,     7,     8,     9,   127,
     131,   132,   159,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,   145,   182,   168,   124,   139,   140,   136,
     137,    10,    11,   171,    12,    13,   125,   126,    14,    15,
     135,   141,   142,    16,    17,   143,   128,   128,   128,   145,
     127,   196,   228,   238,   145,    11,   126,   134,   204,   238,
     128,   128,   128,   134,   133,   133,   238,   226,   235,   128,
     239,   133,   152,   184,   133,   152,   184,   128,   128,   134,
       3,    28,    47,    76,    77,   128,   199,   200,   201,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    49,    50,    53,    69,    87,    89,   102,   114,
     115,   154,   159,   191,   195,   204,   206,   208,   214,   222,
     189,   232,   124,   127,   159,   189,   147,   253,   254,   254,
     254,   146,   254,   145,   127,   144,   146,   159,   196,   220,
     221,   231,   232,   236,   238,   234,   238,   148,   219,   134,
     146,   196,   234,   146,   146,   215,   148,   215,   148,   215,
     147,   147,   184,   145,   225,   146,   148,   146,   148,   150,
     159,   187,   204,   205,   207,   223,   244,   127,   132,   196,
     227,   229,   238,   159,   192,   195,   204,   206,   207,   223,
     132,   229,   192,   244,   128,   134,   159,   204,   205,   207,
     223,   228,   128,   131,   146,   147,   148,   162,   163,   180,
     188,   195,   204,   205,   207,   223,   246,   263,   265,   266,
     267,   268,   269,   270,   271,   148,   271,   159,   128,   163,
     164,   181,   159,   183,   163,   181,   168,   168,   168,   169,
     169,   170,   170,   171,   171,   171,   173,   173,   174,   175,
     176,   177,   178,   183,   189,   210,   211,   238,   210,   211,
     212,    54,   241,   128,   133,   133,   133,   133,   159,   128,
     127,   128,   134,   200,   154,   159,   127,   127,   125,   147,
     159,   195,   204,   206,   228,   159,   196,   232,   196,   127,
     148,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    79,   146,   159,   183,   185,   188,   248,   249,
     250,   251,   252,   254,   255,   256,   257,   258,   260,   246,
     128,   184,   147,   231,   238,   134,   146,   144,   202,   196,
     231,   234,   216,   234,   148,   148,   148,   215,   148,   215,
     184,   215,   215,   150,   204,   205,   207,   223,   228,   128,
     128,   229,   239,   184,   227,   238,   127,   132,   227,   125,
     132,   159,   195,   204,   206,   207,   223,   229,   184,   132,
     132,   229,   128,   181,   168,   259,   148,   271,   145,   159,
     195,   204,   205,   207,   223,   232,   236,   254,   134,   146,
     146,   266,   268,   269,   148,   148,   128,   134,   133,   144,
     228,   183,   128,   200,   181,   152,   159,   213,    71,    72,
     148,   125,   147,   147,   159,   154,   159,   128,   184,   144,
     127,   127,   127,   248,   127,   159,   146,   146,   146,   183,
     159,   144,   146,   146,   159,   193,   194,   230,   185,   251,
     185,   248,   148,   146,   148,   271,   231,   196,   221,   231,
     238,   184,   231,   148,   148,   148,   148,   128,   128,   133,
     227,   128,   239,   184,   213,   184,   125,   132,   133,   184,
     184,   132,   148,   246,   267,   163,   181,   180,   128,   128,
     128,   128,   126,   254,   254,   213,    71,    72,   148,    71,
      72,   148,   147,   144,   248,   183,   183,   128,   183,    59,
     128,   255,   146,   146,   145,   248,   147,   134,   146,   145,
     148,   231,   238,   196,   231,   144,   128,   133,   126,   133,
     213,   184,   133,   133,   184,    72,   148,    71,   148,   126,
     254,   254,   254,   254,    71,    72,   148,   248,   128,   128,
     248,   128,   127,   248,   128,   255,   184,   148,   271,   194,
     147,   181,   245,   231,   231,   184,   126,   133,   133,   254,
     254,    72,   148,    71,   148,    72,   148,    71,   148,   254,
     254,   248,   248,   248,   183,   248,   128,   183,   146,   148,
     245,   247,   148,   148,   254,   254,   254,   254,    72,   148,
      71,   148,    67,   128,   248,   128,   134,   148,   148,   148,
     148,   148,   254,   254,   248,   146,   248,   148,   245,   148,
     148
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
      case 150: /* guess_type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3995 "type.ec"
        break;
      case 152: /* type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4002 "type.ec"
        break;
      case 153: /* base_strict_type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4009 "type.ec"
        break;
      case 154: /* strict_type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4016 "type.ec"
        break;
      case 155: /* class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4023 "type.ec"
        break;
      case 156: /* constructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4030 "type.ec"
        break;
      case 157: /* destructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4037 "type.ec"
        break;
      case 158: /* virtual_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4044 "type.ec"
        break;
      case 159: /* identifier */
/* Line 1393 of yacc.c  */
#line 170 "type.y"
        { FreeIdentifier(((*yyvaluep).id)); };
/* Line 1393 of yacc.c  */
#line 4051 "type.ec"
        break;
      case 160: /* primary_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4058 "type.ec"
        break;
      case 162: /* postfix_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4065 "type.ec"
        break;
      case 164: /* argument_expression_list */
/* Line 1393 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 4072 "type.ec"
        break;
      case 166: /* unary_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4079 "type.ec"
        break;
      case 168: /* cast_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4086 "type.ec"
        break;
      case 169: /* multiplicative_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4093 "type.ec"
        break;
      case 170: /* additive_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4100 "type.ec"
        break;
      case 171: /* shift_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4107 "type.ec"
        break;
      case 173: /* relational_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4114 "type.ec"
        break;
      case 174: /* equality_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4121 "type.ec"
        break;
      case 175: /* and_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4128 "type.ec"
        break;
      case 176: /* exclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4135 "type.ec"
        break;
      case 177: /* inclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4142 "type.ec"
        break;
      case 178: /* logical_and_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4149 "type.ec"
        break;
      case 179: /* logical_or_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4156 "type.ec"
        break;
      case 180: /* conditional_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4163 "type.ec"
        break;
      case 181: /* assignment_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4170 "type.ec"
        break;
      case 183: /* expression */
/* Line 1393 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 4177 "type.ec"
        break;
      case 184: /* constant_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4184 "type.ec"
        break;
      case 185: /* declaration */
/* Line 1393 of yacc.c  */
#line 193 "type.y"
        { FreeDeclaration(((*yyvaluep).declaration)); };
/* Line 1393 of yacc.c  */
#line 4191 "type.ec"
        break;
      case 186: /* specifier_qualifier_list */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4198 "type.ec"
        break;
      case 187: /* guess_specifier_qualifier_list */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4205 "type.ec"
        break;
      case 188: /* declaration_specifiers */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4212 "type.ec"
        break;
      case 189: /* guess_declaration_specifiers */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4219 "type.ec"
        break;
      case 193: /* init_declarator_list */
/* Line 1393 of yacc.c  */
#line 214 "type.y"
        { FreeList(((*yyvaluep).list), FreeInitDeclarator); };
/* Line 1393 of yacc.c  */
#line 4226 "type.ec"
        break;
      case 194: /* init_declarator */
/* Line 1393 of yacc.c  */
#line 188 "type.y"
        { FreeInitDeclarator(((*yyvaluep).initDeclarator)); };
/* Line 1393 of yacc.c  */
#line 4233 "type.ec"
        break;
      case 195: /* storage_class_specifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4240 "type.ec"
        break;
      case 196: /* ext_decl */
/* Line 1393 of yacc.c  */
#line 224 "type.y"
        { FreeExtDecl(((*yyvaluep).extDecl)); };
/* Line 1393 of yacc.c  */
#line 4247 "type.ec"
        break;
      case 198: /* multi_attrib */
/* Line 1393 of yacc.c  */
#line 227 "type.y"
        { FreeList(((*yyvaluep).list), FreeAttrib); };
/* Line 1393 of yacc.c  */
#line 4254 "type.ec"
        break;
      case 199: /* attribute_word */
/* Line 1393 of yacc.c  */
#line 204 "type.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 4261 "type.ec"
        break;
      case 200: /* attribute */
/* Line 1393 of yacc.c  */
#line 225 "type.y"
        { FreeAttribute(((*yyvaluep).attribute)); };
/* Line 1393 of yacc.c  */
#line 4268 "type.ec"
        break;
      case 201: /* attribs_list */
/* Line 1393 of yacc.c  */
#line 226 "type.y"
        { FreeList(((*yyvaluep).list), FreeAttribute); };
/* Line 1393 of yacc.c  */
#line 4275 "type.ec"
        break;
      case 202: /* attrib */
/* Line 1393 of yacc.c  */
#line 223 "type.y"
        { FreeAttrib(((*yyvaluep).attrib)); };
/* Line 1393 of yacc.c  */
#line 4282 "type.ec"
        break;
      case 203: /* ext_storage */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4289 "type.ec"
        break;
      case 204: /* type_qualifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4296 "type.ec"
        break;
      case 205: /* type_specifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4303 "type.ec"
        break;
      case 206: /* strict_type_specifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4310 "type.ec"
        break;
      case 207: /* struct_or_union_specifier_compound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4317 "type.ec"
        break;
      case 208: /* struct_or_union_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4324 "type.ec"
        break;
      case 209: /* template_datatype */
/* Line 1393 of yacc.c  */
#line 222 "type.y"
        { FreeTemplateDataType(((*yyvaluep).templateDatatype)); };
/* Line 1393 of yacc.c  */
#line 4331 "type.ec"
        break;
      case 210: /* template_type_argument */
/* Line 1393 of yacc.c  */
#line 221 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1393 of yacc.c  */
#line 4338 "type.ec"
        break;
      case 211: /* template_expression_argument */
/* Line 1393 of yacc.c  */
#line 221 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1393 of yacc.c  */
#line 4345 "type.ec"
        break;
      case 212: /* template_argument */
/* Line 1393 of yacc.c  */
#line 221 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1393 of yacc.c  */
#line 4352 "type.ec"
        break;
      case 215: /* struct_declaration_list */
/* Line 1393 of yacc.c  */
#line 217 "type.y"
        { FreeList(((*yyvaluep).list), FreeClassDef); };
/* Line 1393 of yacc.c  */
#line 4359 "type.ec"
        break;
      case 216: /* default_property */
/* Line 1393 of yacc.c  */
#line 197 "type.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 4366 "type.ec"
        break;
      case 217: /* default_property_list */
/* Line 1393 of yacc.c  */
#line 218 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4373 "type.ec"
        break;
      case 218: /* property */
/* Line 1393 of yacc.c  */
#line 205 "type.y"
        { FreeProperty(((*yyvaluep).prop)); };
/* Line 1393 of yacc.c  */
#line 4380 "type.ec"
        break;
      case 219: /* struct_declaration */
/* Line 1393 of yacc.c  */
#line 203 "type.y"
        { FreeClassDef(((*yyvaluep).classDef)); };
/* Line 1393 of yacc.c  */
#line 4387 "type.ec"
        break;
      case 220: /* struct_declarator_list */
/* Line 1393 of yacc.c  */
#line 211 "type.y"
        { FreeList(((*yyvaluep).list), FreeDeclarator); };
/* Line 1393 of yacc.c  */
#line 4394 "type.ec"
        break;
      case 221: /* struct_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4401 "type.ec"
        break;
      case 222: /* enum_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4408 "type.ec"
        break;
      case 223: /* enum_specifier_compound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4415 "type.ec"
        break;
      case 224: /* enumerator_list */
/* Line 1393 of yacc.c  */
#line 208 "type.y"
        { FreeList(((*yyvaluep).list), FreeEnumerator); };
/* Line 1393 of yacc.c  */
#line 4422 "type.ec"
        break;
      case 225: /* enumerator */
/* Line 1393 of yacc.c  */
#line 181 "type.y"
        { FreeEnumerator(((*yyvaluep).enumerator)); };
/* Line 1393 of yacc.c  */
#line 4429 "type.ec"
        break;
      case 226: /* direct_abstract_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4436 "type.ec"
        break;
      case 227: /* direct_abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4443 "type.ec"
        break;
      case 228: /* abstract_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4450 "type.ec"
        break;
      case 229: /* abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4457 "type.ec"
        break;
      case 230: /* declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4464 "type.ec"
        break;
      case 231: /* direct_declarator_nofunction */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4471 "type.ec"
        break;
      case 232: /* declarator_function */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4478 "type.ec"
        break;
      case 233: /* direct_declarator_function_start */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4485 "type.ec"
        break;
      case 234: /* direct_declarator_function */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4492 "type.ec"
        break;
      case 235: /* direct_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4499 "type.ec"
        break;
      case 236: /* declarator_nofunction */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4506 "type.ec"
        break;
      case 237: /* type_qualifier_list */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4513 "type.ec"
        break;
      case 238: /* pointer */
/* Line 1393 of yacc.c  */
#line 171 "type.y"
        { FreePointer(((*yyvaluep).pointer)); };
/* Line 1393 of yacc.c  */
#line 4520 "type.ec"
        break;
      case 239: /* parameter_type_list */
/* Line 1393 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4527 "type.ec"
        break;
      case 240: /* parameter_list */
/* Line 1393 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4534 "type.ec"
        break;
      case 241: /* parameter_declaration */
/* Line 1393 of yacc.c  */
#line 189 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4541 "type.ec"
        break;
      case 242: /* identifier_list */
/* Line 1393 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4548 "type.ec"
        break;
      case 243: /* type_name */
/* Line 1393 of yacc.c  */
#line 189 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4555 "type.ec"
        break;
      case 244: /* guess_type_name */
/* Line 1393 of yacc.c  */
#line 189 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4562 "type.ec"
        break;
      case 245: /* initializer */
/* Line 1393 of yacc.c  */
#line 187 "type.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4569 "type.ec"
        break;
      case 246: /* initializer_condition */
/* Line 1393 of yacc.c  */
#line 187 "type.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4576 "type.ec"
        break;
      case 247: /* initializer_list */
/* Line 1393 of yacc.c  */
#line 213 "type.y"
        { FreeList(((*yyvaluep).list), FreeInitializer); };
/* Line 1393 of yacc.c  */
#line 4583 "type.ec"
        break;
      case 248: /* statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4590 "type.ec"
        break;
      case 249: /* labeled_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4597 "type.ec"
        break;
      case 250: /* declaration_list */
/* Line 1393 of yacc.c  */
#line 212 "type.y"
        { FreeList(((*yyvaluep).list), FreeDeclaration); };
/* Line 1393 of yacc.c  */
#line 4604 "type.ec"
        break;
      case 251: /* statement_list */
/* Line 1393 of yacc.c  */
#line 216 "type.y"
        { FreeList(((*yyvaluep).list), FreeStatement); };
/* Line 1393 of yacc.c  */
#line 4611 "type.ec"
        break;
      case 252: /* compound_inside */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4618 "type.ec"
        break;
      case 253: /* compound_start */
/* Line 1393 of yacc.c  */
#line 220 "type.y"
        { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); };
/* Line 1393 of yacc.c  */
#line 4625 "type.ec"
        break;
      case 254: /* compound_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4632 "type.ec"
        break;
      case 255: /* expression_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4639 "type.ec"
        break;
      case 256: /* selection_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4646 "type.ec"
        break;
      case 257: /* iteration_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4653 "type.ec"
        break;
      case 258: /* jump_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4660 "type.ec"
        break;
      case 259: /* string_literal */
/* Line 1393 of yacc.c  */
#line 204 "type.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 4667 "type.ec"
        break;
      case 260: /* instantiation_named */
/* Line 1393 of yacc.c  */
#line 195 "type.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4674 "type.ec"
        break;
      case 262: /* instantiation_unnamed */
/* Line 1393 of yacc.c  */
#line 195 "type.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4681 "type.ec"
        break;
      case 264: /* class_function_definition */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4688 "type.ec"
        break;
      case 265: /* instance_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4695 "type.ec"
        break;
      case 266: /* instance_class_function_definition */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4702 "type.ec"
        break;
      case 267: /* data_member_initialization */
/* Line 1393 of yacc.c  */
#line 197 "type.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 4709 "type.ec"
        break;
      case 268: /* data_member_initialization_list */
/* Line 1393 of yacc.c  */
#line 218 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4716 "type.ec"
        break;
      case 269: /* data_member_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 218 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4723 "type.ec"
        break;
      case 270: /* members_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 219 "type.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4730 "type.ec"
        break;
      case 271: /* members_initialization_list */
/* Line 1393 of yacc.c  */
#line 219 "type.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4737 "type.ec"
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
#line 235 "type.y"
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
/* Line 1787 of yacc.c  */
#line 253 "type.y"
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
/* Line 1787 of yacc.c  */
#line 277 "type.y"
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
/* Line 1787 of yacc.c  */
#line 316 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); }
    break;

  case 6:
/* Line 1787 of yacc.c  */
#line 318 "type.y"
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
/* Line 1787 of yacc.c  */
#line 344 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); }
    break;

  case 9:
/* Line 1787 of yacc.c  */
#line 349 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); }
    break;

  case 10:
/* Line 1787 of yacc.c  */
#line 351 "type.y"
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
/* Line 1787 of yacc.c  */
#line 368 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 12:
/* Line 1787 of yacc.c  */
#line 370 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 13:
/* Line 1787 of yacc.c  */
#line 375 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); }
    break;

  case 14:
/* Line 1787 of yacc.c  */
#line 380 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); }
    break;

  case 15:
/* Line 1787 of yacc.c  */
#line 385 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 16:
/* Line 1787 of yacc.c  */
#line 387 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 17:
/* Line 1787 of yacc.c  */
#line 392 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); }
    break;

  case 19:
/* Line 1787 of yacc.c  */
#line 398 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); }
    break;

  case 20:
/* Line 1787 of yacc.c  */
#line 403 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 21:
/* Line 1787 of yacc.c  */
#line 405 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); }
    break;

  case 22:
/* Line 1787 of yacc.c  */
#line 407 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); }
    break;

  case 23:
/* Line 1787 of yacc.c  */
#line 408 "type.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); }
    break;

  case 24:
/* Line 1787 of yacc.c  */
#line 410 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 25:
/* Line 1787 of yacc.c  */
#line 411 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 26:
/* Line 1787 of yacc.c  */
#line 412 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 27:
/* Line 1787 of yacc.c  */
#line 414 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); }
    break;

  case 28:
/* Line 1787 of yacc.c  */
#line 416 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 29:
/* Line 1787 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 30:
/* Line 1787 of yacc.c  */
#line 418 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 31:
/* Line 1787 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 32:
/* Line 1787 of yacc.c  */
#line 420 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 33:
/* Line 1787 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 34:
/* Line 1787 of yacc.c  */
#line 422 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 35:
/* Line 1787 of yacc.c  */
#line 423 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 36:
/* Line 1787 of yacc.c  */
#line 424 "type.y"
    { (yyval.exp) = MkExpDummy(); }
    break;

  case 38:
/* Line 1787 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); }
    break;

  case 39:
/* Line 1787 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); }
    break;

  case 40:
/* Line 1787 of yacc.c  */
#line 431 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); }
    break;

  case 41:
/* Line 1787 of yacc.c  */
#line 432 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 42:
/* Line 1787 of yacc.c  */
#line 434 "type.y"
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
/* Line 1787 of yacc.c  */
#line 446 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 44:
/* Line 1787 of yacc.c  */
#line 447 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); }
    break;

  case 45:
/* Line 1787 of yacc.c  */
#line 448 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); }
    break;

  case 46:
/* Line 1787 of yacc.c  */
#line 452 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); }
    break;

  case 47:
/* Line 1787 of yacc.c  */
#line 481 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 48:
/* Line 1787 of yacc.c  */
#line 482 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 49:
/* Line 1787 of yacc.c  */
#line 483 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  }
    break;

  case 50:
/* Line 1787 of yacc.c  */
#line 484 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  }
    break;

  case 51:
/* Line 1787 of yacc.c  */
#line 488 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 52:
/* Line 1787 of yacc.c  */
#line 489 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 53:
/* Line 1787 of yacc.c  */
#line 490 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 54:
/* Line 1787 of yacc.c  */
#line 492 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 55:
/* Line 1787 of yacc.c  */
#line 493 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); }
    break;

  case 56:
/* Line 1787 of yacc.c  */
#line 495 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 57:
/* Line 1787 of yacc.c  */
#line 496 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); }
    break;

  case 60:
/* Line 1787 of yacc.c  */
#line 510 "type.y"
    { (yyval.i) = '&'; }
    break;

  case 61:
/* Line 1787 of yacc.c  */
#line 511 "type.y"
    { (yyval.i) = '*'; }
    break;

  case 62:
/* Line 1787 of yacc.c  */
#line 512 "type.y"
    { (yyval.i) = '+'; }
    break;

  case 63:
/* Line 1787 of yacc.c  */
#line 513 "type.y"
    { (yyval.i) = '-'; }
    break;

  case 64:
/* Line 1787 of yacc.c  */
#line 514 "type.y"
    { (yyval.i) = '~'; }
    break;

  case 65:
/* Line 1787 of yacc.c  */
#line 515 "type.y"
    { (yyval.i) = '!'; }
    break;

  case 66:
/* Line 1787 of yacc.c  */
#line 516 "type.y"
    { (yyval.i) = DELETE; }
    break;

  case 68:
/* Line 1787 of yacc.c  */
#line 521 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 70:
/* Line 1787 of yacc.c  */
#line 526 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 71:
/* Line 1787 of yacc.c  */
#line 527 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 72:
/* Line 1787 of yacc.c  */
#line 528 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 74:
/* Line 1787 of yacc.c  */
#line 533 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 75:
/* Line 1787 of yacc.c  */
#line 534 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 77:
/* Line 1787 of yacc.c  */
#line 539 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 78:
/* Line 1787 of yacc.c  */
#line 540 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 79:
/* Line 1787 of yacc.c  */
#line 545 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   }
    break;

  case 81:
/* Line 1787 of yacc.c  */
#line 553 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); }
    break;

  case 82:
/* Line 1787 of yacc.c  */
#line 554 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 83:
/* Line 1787 of yacc.c  */
#line 555 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 84:
/* Line 1787 of yacc.c  */
#line 556 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 86:
/* Line 1787 of yacc.c  */
#line 561 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 87:
/* Line 1787 of yacc.c  */
#line 562 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 89:
/* Line 1787 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 91:
/* Line 1787 of yacc.c  */
#line 572 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 93:
/* Line 1787 of yacc.c  */
#line 577 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 95:
/* Line 1787 of yacc.c  */
#line 582 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 97:
/* Line 1787 of yacc.c  */
#line 587 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 99:
/* Line 1787 of yacc.c  */
#line 592 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 101:
/* Line 1787 of yacc.c  */
#line 597 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 102:
/* Line 1787 of yacc.c  */
#line 598 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 103:
/* Line 1787 of yacc.c  */
#line 602 "type.y"
    { (yyval.i) = '='; }
    break;

  case 104:
/* Line 1787 of yacc.c  */
#line 603 "type.y"
    { (yyval.i) = MUL_ASSIGN; }
    break;

  case 105:
/* Line 1787 of yacc.c  */
#line 604 "type.y"
    { (yyval.i) = DIV_ASSIGN; }
    break;

  case 106:
/* Line 1787 of yacc.c  */
#line 605 "type.y"
    { (yyval.i) = MOD_ASSIGN; }
    break;

  case 107:
/* Line 1787 of yacc.c  */
#line 606 "type.y"
    { (yyval.i) = ADD_ASSIGN; }
    break;

  case 108:
/* Line 1787 of yacc.c  */
#line 607 "type.y"
    { (yyval.i) = SUB_ASSIGN; }
    break;

  case 109:
/* Line 1787 of yacc.c  */
#line 608 "type.y"
    { (yyval.i) = LEFT_ASSIGN; }
    break;

  case 110:
/* Line 1787 of yacc.c  */
#line 609 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; }
    break;

  case 111:
/* Line 1787 of yacc.c  */
#line 610 "type.y"
    { (yyval.i) = AND_ASSIGN; }
    break;

  case 112:
/* Line 1787 of yacc.c  */
#line 611 "type.y"
    { (yyval.i) = XOR_ASSIGN; }
    break;

  case 113:
/* Line 1787 of yacc.c  */
#line 612 "type.y"
    { (yyval.i) = OR_ASSIGN; }
    break;

  case 114:
/* Line 1787 of yacc.c  */
#line 616 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 115:
/* Line 1787 of yacc.c  */
#line 617 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); }
    break;

  case 117:
/* Line 1787 of yacc.c  */
#line 625 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); }
    break;

  case 118:
/* Line 1787 of yacc.c  */
#line 626 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); }
    break;

  case 119:
/* Line 1787 of yacc.c  */
#line 627 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); }
    break;

  case 120:
/* Line 1787 of yacc.c  */
#line 628 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); }
    break;

  case 121:
/* Line 1787 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 122:
/* Line 1787 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 123:
/* Line 1787 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 124:
/* Line 1787 of yacc.c  */
#line 635 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 125:
/* Line 1787 of yacc.c  */
#line 636 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 126:
/* Line 1787 of yacc.c  */
#line 637 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 127:
/* Line 1787 of yacc.c  */
#line 638 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 128:
/* Line 1787 of yacc.c  */
#line 639 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 129:
/* Line 1787 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 130:
/* Line 1787 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 131:
/* Line 1787 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 132:
/* Line 1787 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 133:
/* Line 1787 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 134:
/* Line 1787 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 135:
/* Line 1787 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 136:
/* Line 1787 of yacc.c  */
#line 650 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 137:
/* Line 1787 of yacc.c  */
#line 651 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 138:
/* Line 1787 of yacc.c  */
#line 652 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 139:
/* Line 1787 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 140:
/* Line 1787 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 141:
/* Line 1787 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 142:
/* Line 1787 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 143:
/* Line 1787 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 144:
/* Line 1787 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 145:
/* Line 1787 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 146:
/* Line 1787 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 147:
/* Line 1787 of yacc.c  */
#line 664 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 148:
/* Line 1787 of yacc.c  */
#line 665 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 149:
/* Line 1787 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 150:
/* Line 1787 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 151:
/* Line 1787 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 152:
/* Line 1787 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 153:
/* Line 1787 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 154:
/* Line 1787 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 155:
/* Line 1787 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 156:
/* Line 1787 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 157:
/* Line 1787 of yacc.c  */
#line 677 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 158:
/* Line 1787 of yacc.c  */
#line 678 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 159:
/* Line 1787 of yacc.c  */
#line 679 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 160:
/* Line 1787 of yacc.c  */
#line 680 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 161:
/* Line 1787 of yacc.c  */
#line 684 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); }
    break;

  case 162:
/* Line 1787 of yacc.c  */
#line 685 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 163:
/* Line 1787 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 164:
/* Line 1787 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 165:
/* Line 1787 of yacc.c  */
#line 691 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 166:
/* Line 1787 of yacc.c  */
#line 692 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 167:
/* Line 1787 of yacc.c  */
#line 693 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 168:
/* Line 1787 of yacc.c  */
#line 694 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 169:
/* Line 1787 of yacc.c  */
#line 695 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 170:
/* Line 1787 of yacc.c  */
#line 696 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); }
    break;

  case 171:
/* Line 1787 of yacc.c  */
#line 698 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      }
    break;

  case 172:
/* Line 1787 of yacc.c  */
#line 706 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      }
    break;

  case 173:
/* Line 1787 of yacc.c  */
#line 714 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 174:
/* Line 1787 of yacc.c  */
#line 715 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 175:
/* Line 1787 of yacc.c  */
#line 716 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 176:
/* Line 1787 of yacc.c  */
#line 717 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 177:
/* Line 1787 of yacc.c  */
#line 718 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 178:
/* Line 1787 of yacc.c  */
#line 719 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 179:
/* Line 1787 of yacc.c  */
#line 720 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 180:
/* Line 1787 of yacc.c  */
#line 721 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 181:
/* Line 1787 of yacc.c  */
#line 722 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 182:
/* Line 1787 of yacc.c  */
#line 723 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 183:
/* Line 1787 of yacc.c  */
#line 724 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 184:
/* Line 1787 of yacc.c  */
#line 725 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); }
    break;

  case 185:
/* Line 1787 of yacc.c  */
#line 727 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      }
    break;

  case 186:
/* Line 1787 of yacc.c  */
#line 735 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      }
    break;

  case 187:
/* Line 1787 of yacc.c  */
#line 743 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); }
    break;

  case 188:
/* Line 1787 of yacc.c  */
#line 744 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); }
    break;

  case 189:
/* Line 1787 of yacc.c  */
#line 748 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); }
    break;

  case 190:
/* Line 1787 of yacc.c  */
#line 749 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; }
    break;

  case 191:
/* Line 1787 of yacc.c  */
#line 753 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); }
    break;

  case 192:
/* Line 1787 of yacc.c  */
#line 754 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); }
    break;

  case 193:
/* Line 1787 of yacc.c  */
#line 755 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); }
    break;

  case 194:
/* Line 1787 of yacc.c  */
#line 756 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); }
    break;

  case 195:
/* Line 1787 of yacc.c  */
#line 757 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); }
    break;

  case 196:
/* Line 1787 of yacc.c  */
#line 758 "type.y"
    { (yyval.specifier) = MkSpecifier(THREAD); }
    break;

  case 197:
/* Line 1787 of yacc.c  */
#line 762 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
    break;

  case 198:
/* Line 1787 of yacc.c  */
#line 763 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
    break;

  case 199:
/* Line 1787 of yacc.c  */
#line 764 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); }
    break;

  case 200:
/* Line 1787 of yacc.c  */
#line 765 "type.y"
    { (yyval.extDecl) = MkExtDeclMultiAttrib((yyvsp[(1) - (1)].list)); }
    break;

  case 201:
/* Line 1787 of yacc.c  */
#line 769 "type.y"
    { (yyval.i) = ATTRIB; }
    break;

  case 202:
/* Line 1787 of yacc.c  */
#line 770 "type.y"
    { (yyval.i) = ATTRIB_DEP; }
    break;

  case 203:
/* Line 1787 of yacc.c  */
#line 771 "type.y"
    { (yyval.i) = __ATTRIB; }
    break;

  case 204:
/* Line 1787 of yacc.c  */
#line 775 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attrib)); }
    break;

  case 205:
/* Line 1787 of yacc.c  */
#line 776 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attrib)); }
    break;

  case 206:
/* Line 1787 of yacc.c  */
#line 779 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 207:
/* Line 1787 of yacc.c  */
#line 780 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 208:
/* Line 1787 of yacc.c  */
#line 781 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 209:
/* Line 1787 of yacc.c  */
#line 782 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 210:
/* Line 1787 of yacc.c  */
#line 783 "type.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 211:
/* Line 1787 of yacc.c  */
#line 787 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); }
    break;

  case 212:
/* Line 1787 of yacc.c  */
#line 788 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); }
    break;

  case 213:
/* Line 1787 of yacc.c  */
#line 792 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); }
    break;

  case 214:
/* Line 1787 of yacc.c  */
#line 793 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 215:
/* Line 1787 of yacc.c  */
#line 794 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 216:
/* Line 1787 of yacc.c  */
#line 798 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); }
    break;

  case 217:
/* Line 1787 of yacc.c  */
#line 799 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); }
    break;

  case 218:
/* Line 1787 of yacc.c  */
#line 803 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); }
    break;

  case 219:
/* Line 1787 of yacc.c  */
#line 807 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); }
    break;

  case 220:
/* Line 1787 of yacc.c  */
#line 808 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); }
    break;

  case 221:
/* Line 1787 of yacc.c  */
#line 809 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); }
    break;

  case 222:
/* Line 1787 of yacc.c  */
#line 814 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 223:
/* Line 1787 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 224:
/* Line 1787 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 225:
/* Line 1787 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 226:
/* Line 1787 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 227:
/* Line 1787 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 228:
/* Line 1787 of yacc.c  */
#line 820 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 229:
/* Line 1787 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 230:
/* Line 1787 of yacc.c  */
#line 822 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT16); }
    break;

  case 231:
/* Line 1787 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 232:
/* Line 1787 of yacc.c  */
#line 824 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 233:
/* Line 1787 of yacc.c  */
#line 825 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 234:
/* Line 1787 of yacc.c  */
#line 826 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 235:
/* Line 1787 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 236:
/* Line 1787 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 237:
/* Line 1787 of yacc.c  */
#line 829 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 238:
/* Line 1787 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 239:
/* Line 1787 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 243:
/* Line 1787 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); }
    break;

  case 244:
/* Line 1787 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 245:
/* Line 1787 of yacc.c  */
#line 837 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); }
    break;

  case 246:
/* Line 1787 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 247:
/* Line 1787 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); }
    break;

  case 248:
/* Line 1787 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); }
    break;

  case 249:
/* Line 1787 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 250:
/* Line 1787 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 251:
/* Line 1787 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 252:
/* Line 1787 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 253:
/* Line 1787 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 254:
/* Line 1787 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 255:
/* Line 1787 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 256:
/* Line 1787 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 257:
/* Line 1787 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT16); }
    break;

  case 258:
/* Line 1787 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 259:
/* Line 1787 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 260:
/* Line 1787 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 261:
/* Line 1787 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 262:
/* Line 1787 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 263:
/* Line 1787 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 264:
/* Line 1787 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 265:
/* Line 1787 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 266:
/* Line 1787 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 270:
/* Line 1787 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); }
    break;

  case 271:
/* Line 1787 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 272:
/* Line 1787 of yacc.c  */
#line 867 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); }
    break;

  case 273:
/* Line 1787 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 274:
/* Line 1787 of yacc.c  */
#line 873 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 275:
/* Line 1787 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); }
    break;

  case 276:
/* Line 1787 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); }
    break;

  case 277:
/* Line 1787 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); }
    break;

  case 278:
/* Line 1787 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 279:
/* Line 1787 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); }
    break;

  case 280:
/* Line 1787 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); }
    break;

  case 281:
/* Line 1787 of yacc.c  */
#line 882 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); }
    break;

  case 282:
/* Line 1787 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); }
    break;

  case 283:
/* Line 1787 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); }
    break;

  case 284:
/* Line 1787 of yacc.c  */
#line 889 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 285:
/* Line 1787 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 286:
/* Line 1787 of yacc.c  */
#line 894 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); }
    break;

  case 287:
/* Line 1787 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); }
    break;

  case 288:
/* Line 1787 of yacc.c  */
#line 900 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); }
    break;

  case 289:
/* Line 1787 of yacc.c  */
#line 901 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 290:
/* Line 1787 of yacc.c  */
#line 906 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); }
    break;

  case 291:
/* Line 1787 of yacc.c  */
#line 907 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); }
    break;

  case 292:
/* Line 1787 of yacc.c  */
#line 918 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); }
    break;

  case 295:
/* Line 1787 of yacc.c  */
#line 925 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); }
    break;

  case 296:
/* Line 1787 of yacc.c  */
#line 927 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); }
    break;

  case 297:
/* Line 1787 of yacc.c  */
#line 929 "type.y"
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

  case 298:
/* Line 1787 of yacc.c  */
#line 955 "type.y"
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

  case 299:
/* Line 1787 of yacc.c  */
#line 971 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); }
    break;

  case 300:
/* Line 1787 of yacc.c  */
#line 972 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); }
    break;

  case 301:
/* Line 1787 of yacc.c  */
#line 976 "type.y"
    { (yyval.specifierType) = structSpecifier; }
    break;

  case 302:
/* Line 1787 of yacc.c  */
#line 977 "type.y"
    { (yyval.specifierType) = unionSpecifier; }
    break;

  case 303:
/* Line 1787 of yacc.c  */
#line 981 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); }
    break;

  case 304:
/* Line 1787 of yacc.c  */
#line 982 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); }
    break;

  case 305:
/* Line 1787 of yacc.c  */
#line 986 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); }
    break;

  case 306:
/* Line 1787 of yacc.c  */
#line 990 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
    break;

  case 307:
/* Line 1787 of yacc.c  */
#line 991 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 308:
/* Line 1787 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 309:
/* Line 1787 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 310:
/* Line 1787 of yacc.c  */
#line 1000 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 311:
/* Line 1787 of yacc.c  */
#line 1002 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 312:
/* Line 1787 of yacc.c  */
#line 1004 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 313:
/* Line 1787 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 314:
/* Line 1787 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 315:
/* Line 1787 of yacc.c  */
#line 1011 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 316:
/* Line 1787 of yacc.c  */
#line 1013 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 317:
/* Line 1787 of yacc.c  */
#line 1015 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 318:
/* Line 1787 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 319:
/* Line 1787 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 320:
/* Line 1787 of yacc.c  */
#line 1022 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 321:
/* Line 1787 of yacc.c  */
#line 1024 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 322:
/* Line 1787 of yacc.c  */
#line 1026 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 323:
/* Line 1787 of yacc.c  */
#line 1029 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 324:
/* Line 1787 of yacc.c  */
#line 1031 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 325:
/* Line 1787 of yacc.c  */
#line 1033 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 326:
/* Line 1787 of yacc.c  */
#line 1035 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 327:
/* Line 1787 of yacc.c  */
#line 1037 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 328:
/* Line 1787 of yacc.c  */
#line 1041 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 329:
/* Line 1787 of yacc.c  */
#line 1042 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 330:
/* Line 1787 of yacc.c  */
#line 1043 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 331:
/* Line 1787 of yacc.c  */
#line 1044 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 332:
/* Line 1787 of yacc.c  */
#line 1045 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); }
    break;

  case 333:
/* Line 1787 of yacc.c  */
#line 1046 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); }
    break;

  case 334:
/* Line 1787 of yacc.c  */
#line 1047 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); }
    break;

  case 335:
/* Line 1787 of yacc.c  */
#line 1048 "type.y"
    { (yyval.classDef) = null; }
    break;

  case 336:
/* Line 1787 of yacc.c  */
#line 1053 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); }
    break;

  case 337:
/* Line 1787 of yacc.c  */
#line 1055 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); }
    break;

  case 338:
/* Line 1787 of yacc.c  */
#line 1060 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); }
    break;

  case 339:
/* Line 1787 of yacc.c  */
#line 1062 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); }
    break;

  case 340:
/* Line 1787 of yacc.c  */
#line 1064 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 341:
/* Line 1787 of yacc.c  */
#line 1066 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 342:
/* Line 1787 of yacc.c  */
#line 1068 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); }
    break;

  case 343:
/* Line 1787 of yacc.c  */
#line 1072 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 344:
/* Line 1787 of yacc.c  */
#line 1073 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 345:
/* Line 1787 of yacc.c  */
#line 1078 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); }
    break;

  case 346:
/* Line 1787 of yacc.c  */
#line 1079 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 347:
/* Line 1787 of yacc.c  */
#line 1080 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); }
    break;

  case 348:
/* Line 1787 of yacc.c  */
#line 1081 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); }
    break;

  case 349:
/* Line 1787 of yacc.c  */
#line 1082 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 350:
/* Line 1787 of yacc.c  */
#line 1087 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); }
    break;

  case 351:
/* Line 1787 of yacc.c  */
#line 1089 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); }
    break;

  case 352:
/* Line 1787 of yacc.c  */
#line 1094 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null, null); }
    break;

  case 353:
/* Line 1787 of yacc.c  */
#line 1096 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp), null); }
    break;

  case 354:
/* Line 1787 of yacc.c  */
#line 1097 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (2)].id), null, (yyvsp[(2) - (2)].list)); }
    break;

  case 355:
/* Line 1787 of yacc.c  */
#line 1098 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (4)].id), (yyvsp[(4) - (4)].exp), (yyvsp[(2) - (4)].list)); }
    break;

  case 356:
/* Line 1787 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 357:
/* Line 1787 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
    break;

  case 358:
/* Line 1787 of yacc.c  */
#line 1107 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); }
    break;

  case 359:
/* Line 1787 of yacc.c  */
#line 1109 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); }
    break;

  case 360:
/* Line 1787 of yacc.c  */
#line 1111 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 361:
/* Line 1787 of yacc.c  */
#line 1113 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 362:
/* Line 1787 of yacc.c  */
#line 1115 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 363:
/* Line 1787 of yacc.c  */
#line 1117 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 364:
/* Line 1787 of yacc.c  */
#line 1119 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 365:
/* Line 1787 of yacc.c  */
#line 1121 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 366:
/* Line 1787 of yacc.c  */
#line 1123 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 367:
/* Line 1787 of yacc.c  */
#line 1128 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 368:
/* Line 1787 of yacc.c  */
#line 1130 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 369:
/* Line 1787 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 370:
/* Line 1787 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 371:
/* Line 1787 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 372:
/* Line 1787 of yacc.c  */
#line 1140 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 374:
/* Line 1787 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 375:
/* Line 1787 of yacc.c  */
#line 1143 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 376:
/* Line 1787 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 377:
/* Line 1787 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 378:
/* Line 1787 of yacc.c  */
#line 1149 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 380:
/* Line 1787 of yacc.c  */
#line 1151 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 381:
/* Line 1787 of yacc.c  */
#line 1152 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 382:
/* Line 1787 of yacc.c  */
#line 1153 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 383:
/* Line 1787 of yacc.c  */
#line 1154 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 385:
/* Line 1787 of yacc.c  */
#line 1202 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 386:
/* Line 1787 of yacc.c  */
#line 1204 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 387:
/* Line 1787 of yacc.c  */
#line 1206 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); }
    break;

  case 388:
/* Line 1787 of yacc.c  */
#line 1211 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 389:
/* Line 1787 of yacc.c  */
#line 1213 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 390:
/* Line 1787 of yacc.c  */
#line 1215 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 391:
/* Line 1787 of yacc.c  */
#line 1217 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 392:
/* Line 1787 of yacc.c  */
#line 1219 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 394:
/* Line 1787 of yacc.c  */
#line 1225 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 395:
/* Line 1787 of yacc.c  */
#line 1228 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 396:
/* Line 1787 of yacc.c  */
#line 1230 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 397:
/* Line 1787 of yacc.c  */
#line 1232 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 399:
/* Line 1787 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 400:
/* Line 1787 of yacc.c  */
#line 1244 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 401:
/* Line 1787 of yacc.c  */
#line 1246 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); }
    break;

  case 404:
/* Line 1787 of yacc.c  */
#line 1253 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 405:
/* Line 1787 of yacc.c  */
#line 1255 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 407:
/* Line 1787 of yacc.c  */
#line 1260 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 408:
/* Line 1787 of yacc.c  */
#line 1261 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 409:
/* Line 1787 of yacc.c  */
#line 1262 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 410:
/* Line 1787 of yacc.c  */
#line 1263 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 411:
/* Line 1787 of yacc.c  */
#line 1267 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 412:
/* Line 1787 of yacc.c  */
#line 1268 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  }
    break;

  case 413:
/* Line 1787 of yacc.c  */
#line 1272 "type.y"
    { (yyval.pointer) = MkPointer(null, null); }
    break;

  case 414:
/* Line 1787 of yacc.c  */
#line 1273 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); }
    break;

  case 415:
/* Line 1787 of yacc.c  */
#line 1274 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); }
    break;

  case 416:
/* Line 1787 of yacc.c  */
#line 1275 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); }
    break;

  case 418:
/* Line 1787 of yacc.c  */
#line 1280 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); }
    break;

  case 419:
/* Line 1787 of yacc.c  */
#line 1284 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); }
    break;

  case 420:
/* Line 1787 of yacc.c  */
#line 1285 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); }
    break;

  case 421:
/* Line 1787 of yacc.c  */
#line 1289 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 422:
/* Line 1787 of yacc.c  */
#line 1290 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 423:
/* Line 1787 of yacc.c  */
#line 1291 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); }
    break;

  case 424:
/* Line 1787 of yacc.c  */
#line 1292 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 425:
/* Line 1787 of yacc.c  */
#line 1293 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 426:
/* Line 1787 of yacc.c  */
#line 1305 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); }
    break;

  case 427:
/* Line 1787 of yacc.c  */
#line 1329 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); }
    break;

  case 428:
/* Line 1787 of yacc.c  */
#line 1330 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); }
    break;

  case 429:
/* Line 1787 of yacc.c  */
#line 1334 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 430:
/* Line 1787 of yacc.c  */
#line 1335 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 431:
/* Line 1787 of yacc.c  */
#line 1339 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 432:
/* Line 1787 of yacc.c  */
#line 1340 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 433:
/* Line 1787 of yacc.c  */
#line 1345 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 434:
/* Line 1787 of yacc.c  */
#line 1347 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); }
    break;

  case 435:
/* Line 1787 of yacc.c  */
#line 1349 "type.y"
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

  case 436:
/* Line 1787 of yacc.c  */
#line 1365 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 437:
/* Line 1787 of yacc.c  */
#line 1367 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 438:
/* Line 1787 of yacc.c  */
#line 1389 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); }
    break;

  case 439:
/* Line 1787 of yacc.c  */
#line 1391 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); }
    break;

  case 446:
/* Line 1787 of yacc.c  */
#line 1405 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 447:
/* Line 1787 of yacc.c  */
#line 1407 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; }
    break;

  case 448:
/* Line 1787 of yacc.c  */
#line 1409 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 449:
/* Line 1787 of yacc.c  */
#line 1413 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); }
    break;

  case 450:
/* Line 1787 of yacc.c  */
#line 1414 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); }
    break;

  case 451:
/* Line 1787 of yacc.c  */
#line 1418 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); }
    break;

  case 452:
/* Line 1787 of yacc.c  */
#line 1419 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); }
    break;

  case 453:
/* Line 1787 of yacc.c  */
#line 1422 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 454:
/* Line 1787 of yacc.c  */
#line 1426 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); }
    break;

  case 455:
/* Line 1787 of yacc.c  */
#line 1427 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); }
    break;

  case 456:
/* Line 1787 of yacc.c  */
#line 1428 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); }
    break;

  case 457:
/* Line 1787 of yacc.c  */
#line 1432 "type.y"
    { (yyval.context) = PushContext(); }
    break;

  case 458:
/* Line 1787 of yacc.c  */
#line 1437 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
    break;

  case 459:
/* Line 1787 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); }
    break;

  case 460:
/* Line 1787 of yacc.c  */
#line 1449 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
    break;

  case 461:
/* Line 1787 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 462:
/* Line 1787 of yacc.c  */
#line 1454 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); }
    break;

  case 463:
/* Line 1787 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 464:
/* Line 1787 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 465:
/* Line 1787 of yacc.c  */
#line 1460 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 466:
/* Line 1787 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 467:
/* Line 1787 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 468:
/* Line 1787 of yacc.c  */
#line 1463 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 469:
/* Line 1787 of yacc.c  */
#line 1465 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 470:
/* Line 1787 of yacc.c  */
#line 1466 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 471:
/* Line 1787 of yacc.c  */
#line 1467 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 472:
/* Line 1787 of yacc.c  */
#line 1471 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); }
    break;

  case 473:
/* Line 1787 of yacc.c  */
#line 1472 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 474:
/* Line 1787 of yacc.c  */
#line 1473 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 475:
/* Line 1787 of yacc.c  */
#line 1474 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); }
    break;

  case 476:
/* Line 1787 of yacc.c  */
#line 1475 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 477:
/* Line 1787 of yacc.c  */
#line 1479 "type.y"
    { (yyval.string) = CopyString(yytext); }
    break;

  case 478:
/* Line 1787 of yacc.c  */
#line 1484 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 479:
/* Line 1787 of yacc.c  */
#line 1486 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 480:
/* Line 1787 of yacc.c  */
#line 1491 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 481:
/* Line 1787 of yacc.c  */
#line 1493 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 482:
/* Line 1787 of yacc.c  */
#line 1518 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; }
    break;

  case 483:
/* Line 1787 of yacc.c  */
#line 1520 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;}
    break;

  case 484:
/* Line 1787 of yacc.c  */
#line 1522 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); }
    break;

  case 485:
/* Line 1787 of yacc.c  */
#line 1524 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); }
    break;

  case 486:
/* Line 1787 of yacc.c  */
#line 1529 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; }
    break;

  case 487:
/* Line 1787 of yacc.c  */
#line 1531 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;}
    break;

  case 488:
/* Line 1787 of yacc.c  */
#line 1535 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 489:
/* Line 1787 of yacc.c  */
#line 1537 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 490:
/* Line 1787 of yacc.c  */
#line 1539 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 491:
/* Line 1787 of yacc.c  */
#line 1541 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 492:
/* Line 1787 of yacc.c  */
#line 1543 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 493:
/* Line 1787 of yacc.c  */
#line 1549 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 494:
/* Line 1787 of yacc.c  */
#line 1551 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 495:
/* Line 1787 of yacc.c  */
#line 1556 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 496:
/* Line 1787 of yacc.c  */
#line 1560 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;}
    break;

  case 497:
/* Line 1787 of yacc.c  */
#line 1561 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
    break;

  case 498:
/* Line 1787 of yacc.c  */
#line 1566 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); }
    break;

  case 499:
/* Line 1787 of yacc.c  */
#line 1568 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 500:
/* Line 1787 of yacc.c  */
#line 1573 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 501:
/* Line 1787 of yacc.c  */
#line 1577 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); }
    break;

  case 502:
/* Line 1787 of yacc.c  */
#line 1578 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 503:
/* Line 1787 of yacc.c  */
#line 1579 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  }
    break;

  case 504:
/* Line 1787 of yacc.c  */
#line 1580 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  }
    break;

  case 505:
/* Line 1787 of yacc.c  */
#line 1581 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  }
    break;

  case 506:
/* Line 1787 of yacc.c  */
#line 1582 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 508:
/* Line 1787 of yacc.c  */
#line 1587 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 509:
/* Line 1787 of yacc.c  */
#line 1588 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); }
    break;

  case 510:
/* Line 1787 of yacc.c  */
#line 1592 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); }
    break;

  case 511:
/* Line 1787 of yacc.c  */
#line 1593 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); }
    break;


/* Line 1787 of yacc.c  */
#line 8010 "type.ec"
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
#line 1596 "type.y"

