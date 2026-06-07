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
#line 306 "type.ec"
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
#line 347 "type.ec"

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
#define YYFINAL  105
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9611

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  150
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  124
/* YYNRULES -- Number of rules.  */
#define YYNRULES  513
/* YYNRULES -- Number of states.  */
#define YYNSTATES  873

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
       2,     2,     2,   139,     2,     2,   131,   141,   136,     2,
     128,   129,   125,   137,   135,   138,   132,   140,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   145,   147,
     126,   146,   127,   144,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   133,     2,   134,   142,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   148,   143,   149,   130,     2,     2,     2,
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
     696,   698,   700,   702,   704,   709,   714,   719,   721,   723,
     725,   727,   729,   731,   733,   735,   737,   739,   741,   743,
     745,   747,   749,   751,   753,   755,   757,   759,   761,   763,
     765,   767,   769,   774,   779,   784,   786,   792,   797,   802,
     806,   812,   819,   825,   831,   836,   843,   846,   849,   853,
     857,   859,   862,   864,   867,   869,   871,   873,   877,   881,
     885,   889,   891,   895,   897,   899,   901,   904,   908,   910,
     914,   924,   934,   942,   950,   956,   967,   978,   987,   996,
    1003,  1012,  1021,  1028,  1035,  1040,  1050,  1060,  1068,  1076,
    1082,  1086,  1089,  1092,  1095,  1097,  1100,  1102,  1104,  1106,
    1110,  1112,  1115,  1118,  1122,  1128,  1131,  1134,  1139,  1145,
    1153,  1161,  1167,  1169,  1173,  1175,  1179,  1182,  1187,  1191,
    1194,  1198,  1202,  1206,  1211,  1216,  1219,  1223,  1227,  1232,
    1236,  1239,  1243,  1247,  1252,  1254,  1256,  1259,  1262,  1265,
    1269,  1271,  1273,  1276,  1279,  1282,  1286,  1288,  1291,  1295,
    1298,  1300,  1304,  1309,  1313,  1318,  1320,  1323,  1326,  1330,
    1334,  1337,  1341,  1345,  1348,  1350,  1352,  1355,  1358,  1360,
    1363,  1366,  1370,  1374,  1376,  1379,  1381,  1384,  1387,  1391,
    1393,  1397,  1399,  1403,  1406,  1409,  1412,  1416,  1418,  1420,
    1422,  1426,  1428,  1431,  1433,  1436,  1438,  1442,  1447,  1449,
    1451,  1453,  1457,  1459,  1461,  1463,  1465,  1467,  1469,  1473,
    1478,  1482,  1484,  1487,  1489,  1492,  1495,  1497,  1499,  1502,
    1504,  1507,  1511,  1513,  1516,  1522,  1530,  1536,  1542,  1550,
    1557,  1565,  1570,  1576,  1581,  1585,  1588,  1591,  1594,  1598,
    1600,  1606,  1611,  1617,  1622,  1627,  1631,  1636,  1640,  1644,
    1647,  1650,  1653,  1656,  1659,  1662,  1665,  1668,  1671,  1675,
    1677,  1679,  1683,  1686,  1688,  1690,  1693,  1696,  1698,  1701,
    1703,  1705,  1708,  1710
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     273,     0,    -1,   160,   125,    -1,   160,   126,    -1,   160,
       1,    -1,   155,    -1,   160,   160,    -1,    28,    -1,   154,
      -1,   154,   126,   214,   127,    -1,   154,   126,   214,    11,
      -1,   190,   233,    -1,   233,    -1,   190,   128,   129,    -1,
     130,   190,   128,   129,    -1,    81,   190,   233,    -1,    81,
     233,    -1,     3,    -1,   162,    -1,   128,   184,   129,    -1,
     160,    -1,   263,    -1,     4,    -1,   121,    -1,   260,    -1,
     131,   260,    -1,   131,   260,   132,   260,    -1,   128,   129,
      -1,    74,   190,   230,   133,   185,   134,    -1,    74,   190,
     133,   185,   134,    -1,   105,   190,   230,   133,   185,   134,
      -1,   105,   190,   133,   185,   134,    -1,    75,   185,   193,
     230,   133,   185,   134,    -1,    75,   185,   193,   133,   185,
     134,    -1,   106,   185,   193,   230,   133,   185,   134,    -1,
     106,   185,   193,   133,   185,   134,    -1,     1,    -1,   161,
      -1,   163,   133,   184,   134,    -1,   163,   128,   129,    -1,
     163,   128,   165,   129,    -1,   163,   132,   160,    -1,   163,
     160,    -1,   163,     7,   160,    -1,   163,     8,    -1,   163,
       9,    -1,   264,    -1,   182,    -1,   164,    -1,   165,   135,
     182,    -1,   165,   135,   164,    -1,     8,   167,    -1,     9,
     167,    -1,   168,   169,    -1,     6,   167,    -1,     6,   128,
     245,   129,    -1,   112,   167,    -1,   112,   128,   245,   129,
      -1,   166,    -1,   163,    -1,   136,    -1,   125,    -1,   137,
      -1,   138,    -1,   130,    -1,   139,    -1,    76,    -1,   167,
      -1,   128,   244,   129,   169,    -1,   169,    -1,   170,   125,
     169,    -1,   170,   140,   169,    -1,   170,   141,   169,    -1,
     170,    -1,   171,   137,   170,    -1,   171,   138,   170,    -1,
     171,    -1,   172,    10,   171,    -1,   172,    11,   171,    -1,
     174,   126,    -1,   172,    -1,   173,   172,    -1,   174,   127,
     172,    -1,   174,    12,   172,    -1,   174,    13,   172,    -1,
     174,    -1,   175,    14,   174,    -1,   175,    15,   174,    -1,
     175,    -1,   176,   136,   175,    -1,   176,    -1,   177,   142,
     176,    -1,   177,    -1,   178,   143,   177,    -1,   178,    -1,
     179,    16,   178,    -1,   179,    -1,   180,    17,   179,    -1,
     180,    -1,   180,   144,   184,   145,   181,    -1,   181,    -1,
     167,   183,   182,    -1,   167,   183,   164,    -1,   146,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     182,    -1,   184,   135,   182,    -1,   181,    -1,   189,   147,
      -1,   189,   194,   147,    -1,   261,   147,    -1,    80,   160,
     146,   185,   147,    -1,   205,    -1,   187,   205,    -1,   206,
      -1,   187,   206,    -1,   224,    -1,   187,   224,    -1,   208,
      -1,   187,   208,    -1,   205,    -1,   188,   205,    -1,   206,
      -1,   188,   206,    -1,   151,    -1,   188,   151,    -1,   224,
      -1,   188,   224,    -1,   208,    -1,   188,   208,    -1,   196,
      -1,   189,   196,    -1,   205,    -1,   189,   205,    -1,   206,
      -1,   189,   206,    -1,   224,    -1,   189,   224,    -1,   208,
      -1,   189,   208,    -1,   196,    -1,   190,   196,    -1,   205,
      -1,   190,   205,    -1,   206,    -1,   190,   206,    -1,   151,
      -1,   190,   151,    -1,   208,    -1,   190,   208,    -1,   224,
      -1,   190,   224,    -1,   190,    -1,   152,    -1,   196,    -1,
     192,   196,    -1,   205,    -1,   192,   205,    -1,   207,    -1,
     192,   207,    -1,   160,    -1,   192,   160,    -1,   160,   126,
     214,   127,    -1,   192,   160,   126,   214,   127,    -1,   196,
      -1,   193,   196,    -1,   205,    -1,   193,   205,    -1,   207,
      -1,   193,   207,    -1,   208,    -1,   193,   208,    -1,   224,
      -1,   193,   224,    -1,   160,    -1,   193,   160,    -1,   160,
     126,   214,   127,    -1,   193,   160,   126,   214,   127,    -1,
     195,    -1,   194,   135,   195,    -1,   231,    -1,   231,   146,
     246,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   120,    -1,    77,    -1,    78,    -1,   203,    -1,
     199,    -1,    82,    -1,   113,    -1,   114,    -1,   203,    -1,
     199,   203,    -1,     3,    -1,    28,    -1,    78,    -1,    77,
      -1,    48,    -1,   200,    -1,   200,   128,   184,   129,    -1,
     201,    -1,   202,   201,    -1,   202,   135,   201,    -1,   198,
     128,   128,   202,   129,   129,    -1,   198,   128,   128,   129,
     129,    -1,   197,    -1,    48,    -1,    49,    -1,   204,    -1,
      50,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,    41,    -1,    42,    -1,
      51,    -1,    43,    -1,    46,    -1,    47,    -1,    44,    -1,
      45,    -1,    88,    -1,   116,    -1,   115,    -1,   209,    -1,
     223,    -1,   153,    -1,    90,   128,   182,   129,    -1,   103,
     128,   153,   129,    -1,   103,   128,   160,   129,    -1,    70,
      -1,    85,    -1,    86,    -1,    50,    -1,    34,    -1,    35,
      -1,    36,    -1,    37,    -1,    38,    -1,    39,    -1,    40,
      -1,    41,    -1,    42,    -1,    51,    -1,    43,    -1,    46,
      -1,    47,    -1,    44,    -1,    45,    -1,    88,    -1,   116,
      -1,   115,    -1,   209,    -1,   223,    -1,   155,    -1,    90,
     128,   182,   129,    -1,   103,   128,   153,   129,    -1,   103,
     128,   160,   129,    -1,    70,    -1,   215,   160,   148,   216,
     149,    -1,   215,   148,   216,   149,    -1,   215,   160,   148,
     149,    -1,   215,   148,   149,    -1,   215,   154,   148,   216,
     149,    -1,   215,   197,   160,   148,   216,   149,    -1,   215,
     197,   148,   216,   149,    -1,   215,   197,   160,   148,   149,
      -1,   215,   197,   148,   149,    -1,   215,   197,   155,   148,
     216,   149,    -1,   215,   160,    -1,   215,   155,    -1,   215,
     197,   160,    -1,   215,   197,   155,    -1,   190,    -1,   190,
     229,    -1,   190,    -1,   190,   229,    -1,   172,    -1,   212,
      -1,   211,    -1,   160,   146,   212,    -1,   160,   146,   211,
      -1,   210,   146,   212,    -1,   210,   146,   211,    -1,   213,
      -1,   214,   135,   213,    -1,    52,    -1,    53,    -1,   220,
      -1,   216,   220,    -1,   163,   146,   247,    -1,   217,    -1,
     218,   135,   217,    -1,    71,   192,   160,   148,    72,   255,
      73,   255,   149,    -1,    71,   192,   160,   148,    73,   255,
      72,   255,   149,    -1,    71,   192,   160,   148,    72,   255,
     149,    -1,    71,   192,   160,   148,    73,   255,   149,    -1,
      71,   192,   160,   148,   149,    -1,    71,   192,   229,   160,
     148,    72,   255,    73,   255,   149,    -1,    71,   192,   229,
     160,   148,    73,   255,    72,   255,   149,    -1,    71,   192,
     229,   160,   148,    72,   255,   149,    -1,    71,   192,   229,
     160,   148,    73,   255,   149,    -1,    71,   192,   229,   160,
     148,   149,    -1,    71,   192,   148,    72,   255,    73,   255,
     149,    -1,    71,   192,   148,    73,   255,    72,   255,   149,
      -1,    71,   192,   148,    72,   255,   149,    -1,    71,   192,
     148,    73,   255,   149,    -1,    71,   192,   148,   149,    -1,
      71,   192,   229,   148,    72,   255,    73,   255,   149,    -1,
      71,   192,   229,   148,    73,   255,    72,   255,   149,    -1,
      71,   192,   229,   148,    72,   255,   149,    -1,    71,   192,
     229,   148,    73,   255,   149,    -1,    71,   192,   229,   148,
     149,    -1,   190,   221,   147,    -1,   190,   147,    -1,   263,
     147,    -1,   262,   147,    -1,   265,    -1,   218,   147,    -1,
     219,    -1,   147,    -1,   222,    -1,   221,   135,   222,    -1,
     237,    -1,   237,   203,    -1,   145,   185,    -1,   237,   145,
     185,    -1,   237,   145,   185,   145,   185,    -1,    54,   160,
      -1,    54,   155,    -1,    54,   148,   225,   149,    -1,    54,
     160,   148,   225,   149,    -1,    54,   160,   148,   225,   147,
     216,   149,    -1,    54,   155,   148,   225,   147,   216,   149,
      -1,    54,   155,   148,   225,   149,    -1,   226,    -1,   225,
     135,   226,    -1,   160,    -1,   160,   146,   185,    -1,   160,
     199,    -1,   160,   199,   146,   185,    -1,   128,   229,   129,
      -1,   133,   134,    -1,   133,   185,   134,    -1,   133,   153,
     134,    -1,   227,   133,   134,    -1,   227,   133,   185,   134,
      -1,   227,   133,   153,   134,    -1,   128,   129,    -1,   128,
     240,   129,    -1,   227,   128,   129,    -1,   227,   128,   240,
     129,    -1,   128,   230,   129,    -1,   128,   129,    -1,   128,
     240,   129,    -1,   228,   128,   129,    -1,   228,   128,   240,
     129,    -1,   239,    -1,   227,    -1,   239,   227,    -1,   197,
     239,    -1,   197,   227,    -1,   197,   239,   227,    -1,   239,
      -1,   228,    -1,   239,   228,    -1,   197,   239,    -1,   197,
     228,    -1,   197,   239,   228,    -1,   236,    -1,   239,   236,
      -1,   197,   239,   236,    -1,   231,   197,    -1,   160,    -1,
     128,   231,   129,    -1,   232,   133,   185,   134,    -1,   232,
     133,   134,    -1,   232,   133,   153,   134,    -1,   235,    -1,
     239,   235,    -1,   197,   235,    -1,   197,   239,   235,    -1,
     239,   197,   235,    -1,   232,   128,    -1,   234,   240,   129,
      -1,   234,   243,   129,    -1,   234,   129,    -1,   235,    -1,
     232,    -1,   197,   235,    -1,   197,   232,    -1,   232,    -1,
     239,   232,    -1,   197,   232,    -1,   197,   239,   232,    -1,
     239,   197,   232,    -1,   205,    -1,   238,   205,    -1,   125,
      -1,   125,   238,    -1,   125,   239,    -1,   125,   238,   239,
      -1,   241,    -1,   241,   135,    55,    -1,   242,    -1,   241,
     135,   242,    -1,   190,   231,    -1,   190,   229,    -1,   190,
     136,    -1,   190,   136,   231,    -1,   191,    -1,    69,    -1,
     160,    -1,   243,   135,   160,    -1,   187,    -1,   187,   229,
      -1,   188,    -1,   188,   229,    -1,   182,    -1,   148,   248,
     149,    -1,   148,   248,   135,   149,    -1,   181,    -1,   164,
      -1,   246,    -1,   248,   135,   246,    -1,   250,    -1,   255,
      -1,   256,    -1,   257,    -1,   258,    -1,   259,    -1,   160,
     145,   249,    -1,    56,   185,   145,   249,    -1,    57,   145,
     249,    -1,   186,    -1,   251,   186,    -1,   249,    -1,   252,
     249,    -1,   252,   186,    -1,   252,    -1,   251,    -1,   251,
     252,    -1,   148,    -1,   148,   149,    -1,   254,   253,   149,
      -1,   147,    -1,   184,   147,    -1,    58,   128,   184,   129,
     249,    -1,    58,   128,   184,   129,   249,    68,   249,    -1,
      59,   128,   184,   129,   249,    -1,    60,   128,   184,   129,
     249,    -1,    61,   249,    60,   128,   184,   129,   147,    -1,
      62,   128,   256,   256,   129,   249,    -1,    62,   128,   256,
     256,   184,   129,   249,    -1,    60,   128,   129,   249,    -1,
      62,   128,   256,   129,   249,    -1,    62,   128,   129,   249,
      -1,    63,   160,   147,    -1,    64,   147,    -1,    65,   147,
      -1,    66,   147,    -1,    66,   184,   147,    -1,     5,    -1,
     189,   160,   148,   272,   149,    -1,   189,   160,   148,   149,
      -1,   190,   160,   148,   272,   149,    -1,   190,   160,   148,
     149,    -1,   153,   148,   272,   149,    -1,   153,   148,   149,
      -1,   160,   148,   272,   149,    -1,   160,   148,   149,    -1,
     148,   272,   149,    -1,   148,   149,    -1,   156,   255,    -1,
     159,   255,    -1,   159,   147,    -1,   157,   255,    -1,   158,
     255,    -1,   189,   233,    -1,   189,   237,    -1,   266,   255,
      -1,   163,   146,   247,    -1,   247,    -1,   268,    -1,   269,
     135,   268,    -1,   269,   147,    -1,   270,    -1,   267,    -1,
     271,   270,    -1,   271,   267,    -1,   147,    -1,   271,   147,
      -1,   271,    -1,   269,    -1,   271,   269,    -1,   242,    -1,
     242,   145,   185,    -1
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
     832,   833,   834,   835,   836,   837,   838,   839,   840,   841,
     845,   846,   847,   848,   849,   850,   851,   852,   853,   854,
     855,   856,   857,   858,   859,   860,   861,   862,   863,   864,
     865,   866,   867,   868,   869,   870,   875,   876,   877,   878,
     879,   882,   883,   884,   885,   886,   891,   892,   895,   897,
     902,   903,   908,   909,   920,   924,   926,   927,   929,   930,
     956,   973,   974,   978,   979,   983,   984,   988,   992,   993,
     997,   999,  1001,  1003,  1005,  1008,  1010,  1012,  1014,  1016,
    1019,  1021,  1023,  1025,  1027,  1030,  1032,  1034,  1036,  1038,
    1043,  1044,  1045,  1046,  1047,  1048,  1049,  1050,  1054,  1056,
    1061,  1063,  1065,  1067,  1069,  1074,  1075,  1079,  1081,  1082,
    1083,  1084,  1088,  1090,  1095,  1097,  1099,  1100,  1104,  1106,
    1108,  1110,  1112,  1114,  1116,  1118,  1120,  1122,  1124,  1129,
    1131,  1133,  1135,  1137,  1142,  1143,  1144,  1145,  1146,  1147,
    1151,  1152,  1153,  1154,  1155,  1156,  1202,  1203,  1205,  1207,
    1212,  1214,  1216,  1218,  1220,  1225,  1226,  1229,  1231,  1233,
    1239,  1243,  1245,  1247,  1252,  1253,  1254,  1256,  1261,  1262,
    1263,  1264,  1265,  1269,  1270,  1274,  1275,  1276,  1277,  1281,
    1282,  1286,  1287,  1291,  1292,  1293,  1294,  1295,  1306,  1331,
    1332,  1336,  1337,  1341,  1342,  1346,  1348,  1350,  1366,  1368,
    1390,  1392,  1397,  1398,  1399,  1400,  1401,  1402,  1406,  1408,
    1410,  1415,  1416,  1420,  1421,  1424,  1428,  1429,  1430,  1434,
    1438,  1446,  1451,  1452,  1456,  1457,  1458,  1462,  1463,  1464,
    1465,  1467,  1468,  1469,  1473,  1474,  1475,  1476,  1477,  1481,
    1485,  1487,  1492,  1494,  1519,  1521,  1523,  1525,  1530,  1532,
    1536,  1538,  1540,  1542,  1544,  1550,  1552,  1557,  1562,  1563,
    1567,  1569,  1574,  1579,  1580,  1581,  1582,  1583,  1584,  1588,
    1589,  1590,  1594,  1595
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
     375,   376,   377,   378,   379,    42,    60,    62,    40,    41,
     126,    36,    46,    91,    93,    44,    38,    43,    45,    33,
      47,    37,    94,   124,    63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   150,   151,   151,   152,   153,   153,   154,   155,   155,
     155,   156,   156,   157,   158,   159,   159,   160,   161,   161,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   164,   165,   165,   165,
     165,   166,   166,   166,   166,   166,   166,   166,   167,   167,
     168,   168,   168,   168,   168,   168,   168,   169,   169,   170,
     170,   170,   170,   171,   171,   171,   172,   172,   172,   173,
     174,   174,   174,   174,   174,   175,   175,   175,   176,   176,
     177,   177,   178,   178,   179,   179,   180,   180,   181,   181,
     182,   182,   182,   183,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   183,   184,   184,   185,   186,   186,   186,
     186,   187,   187,   187,   187,   187,   187,   187,   187,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   191,   191,   192,   192,   192,   192,   192,   192,   192,
     192,   192,   192,   193,   193,   193,   193,   193,   193,   193,
     193,   193,   193,   193,   193,   193,   193,   194,   194,   195,
     195,   196,   196,   196,   196,   196,   196,   197,   197,   197,
     197,   198,   198,   198,   199,   199,   200,   200,   200,   200,
     200,   201,   201,   202,   202,   202,   203,   203,   204,   205,
     205,   205,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   209,   209,   209,   209,
     210,   210,   211,   211,   212,   213,   213,   213,   213,   213,
     213,   214,   214,   215,   215,   216,   216,   217,   218,   218,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     220,   220,   220,   220,   220,   220,   220,   220,   221,   221,
     222,   222,   222,   222,   222,   223,   223,   224,   224,   224,
     224,   224,   225,   225,   226,   226,   226,   226,   227,   227,
     227,   227,   227,   227,   227,   227,   227,   227,   227,   228,
     228,   228,   228,   228,   229,   229,   229,   229,   229,   229,
     230,   230,   230,   230,   230,   230,   231,   231,   231,   231,
     232,   232,   232,   232,   232,   233,   233,   233,   233,   233,
     234,   235,   235,   235,   236,   236,   236,   236,   237,   237,
     237,   237,   237,   238,   238,   239,   239,   239,   239,   240,
     240,   241,   241,   242,   242,   242,   242,   242,   242,   243,
     243,   244,   244,   245,   245,   246,   246,   246,   247,   247,
     248,   248,   249,   249,   249,   249,   249,   249,   250,   250,
     250,   251,   251,   252,   252,   252,   253,   253,   253,   254,
     255,   255,   256,   256,   257,   257,   257,   258,   258,   258,
     258,   258,   258,   258,   259,   259,   259,   259,   259,   260,
     261,   261,   262,   262,   263,   263,   263,   263,   264,   264,
     265,   265,   265,   265,   265,   266,   266,   267,   268,   268,
     269,   269,   270,   271,   271,   271,   271,   271,   271,   272,
     272,   272,   273,   273
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
       1,     1,     1,     1,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     4,     4,     1,     5,     4,     4,     3,
       5,     6,     5,     5,     4,     6,     2,     2,     3,     3,
       1,     2,     1,     2,     1,     1,     1,     3,     3,     3,
       3,     1,     3,     1,     1,     1,     2,     3,     1,     3,
       9,     9,     7,     7,     5,    10,    10,     8,     8,     6,
       8,     8,     6,     6,     4,     9,     9,     7,     7,     5,
       3,     2,     2,     2,     1,     2,     1,     1,     1,     3,
       1,     2,     2,     3,     5,     2,     2,     4,     5,     7,
       7,     5,     1,     3,     1,     3,     2,     4,     3,     2,
       3,     3,     3,     4,     4,     2,     3,     3,     4,     3,
       2,     3,     3,     4,     1,     1,     2,     2,     2,     3,
       1,     1,     2,     2,     2,     3,     1,     2,     3,     2,
       1,     3,     4,     3,     4,     1,     2,     2,     3,     3,
       2,     3,     3,     2,     1,     1,     2,     2,     1,     2,
       2,     3,     3,     1,     2,     1,     2,     2,     3,     1,
       3,     1,     3,     2,     2,     2,     3,     1,     1,     1,
       3,     1,     2,     1,     2,     1,     3,     4,     1,     1,
       1,     3,     1,     1,     1,     1,     1,     1,     3,     4,
       3,     1,     2,     1,     2,     2,     1,     1,     2,     1,
       2,     3,     1,     2,     5,     7,     5,     5,     7,     6,
       7,     4,     5,     4,     3,     2,     2,     2,     3,     1,
       5,     4,     5,     4,     4,     3,     4,     3,     3,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     3,     1,
       1,     3,     2,     1,     1,     2,     2,     1,     2,     1,
       1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   191,   192,   193,   194,   195,   223,   224,
     225,   226,   227,   228,   229,   230,   231,   233,   236,   237,
     234,   235,   219,   220,   222,   232,   303,   304,     0,   428,
     247,   197,   198,   201,   248,   249,   238,     0,     0,   202,
     203,   240,   239,   196,   155,   162,   243,     8,     5,     0,
     161,   427,   149,   218,     0,   200,   199,   221,   151,   153,
     157,   241,     0,   242,   159,   512,     0,     0,   346,   345,
       0,     0,     0,     4,     2,     3,     6,   415,     0,     0,
     425,   156,   390,   150,   218,   152,   154,   158,   160,   375,
     424,   423,   405,     0,   404,   386,   374,     0,   205,     0,
       8,   287,   286,     0,     0,     1,   354,     0,   352,     0,
       0,    36,    22,   479,     0,     0,     0,     0,     0,    66,
       0,     0,     0,    23,    61,     0,    64,     0,    60,    62,
      63,    65,     0,    20,    37,    18,    59,    58,    67,     0,
      69,    73,    76,    80,     0,    85,    88,    90,    92,    94,
      96,    98,   100,     0,    24,    21,     0,     0,   243,    20,
      67,   294,   292,     0,   296,   295,   301,     0,   413,   416,
     417,   365,     0,     0,     0,     0,   419,   421,   359,     0,
     116,     0,     0,   390,     0,   426,     0,   378,   407,   406,
     377,     0,     0,   389,   400,     0,   403,     0,     0,     0,
       0,   376,   387,     0,     0,     0,     0,     0,   337,   279,
       0,     0,     0,     0,    20,     0,     0,   218,     0,   308,
       0,   336,   305,     0,    12,   395,     0,     0,    21,   334,
       0,     0,     0,   289,   288,   513,     0,   356,   204,     0,
     347,     0,     0,     0,    54,     0,    51,    52,     0,     0,
       0,     0,     0,     0,    56,    27,   114,     0,   431,   121,
     123,   127,   125,     0,    25,     0,     0,     0,    44,    45,
       0,     0,     0,    42,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   103,     0,    53,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   244,   245,   246,
       0,     0,   218,   293,   374,     0,    10,     9,     0,   414,
     418,   358,   391,   366,     0,   361,   360,     0,   379,   388,
     367,     0,   362,     0,     0,   393,     0,     0,   401,   402,
       0,   206,   207,   210,   209,   208,     0,   211,   213,     0,
     251,   252,   253,   254,   255,   256,   257,   258,   259,   261,
     264,   265,   262,   263,   250,   260,     0,   275,   266,     0,
       0,   268,   267,   271,   169,     0,   163,   165,   167,   269,
       0,   270,     0,    16,    61,     0,    20,     0,   459,     0,
     490,   493,   494,   492,   491,     0,     0,     0,   331,   390,
     218,     0,   338,   408,    11,   340,     0,   397,     0,   277,
     306,     0,   335,     0,   396,   333,   332,     0,   278,     0,
     284,     0,     0,     0,   355,     0,   353,     0,   351,     0,
     348,   133,    20,   433,   129,   131,   137,   135,     0,     0,
       0,   218,   381,     0,   380,   183,     0,   173,   175,   177,
     179,   181,     0,     0,     0,     0,    19,     0,     0,   122,
     124,   128,   126,   432,     0,     0,   507,     0,   485,    59,
     439,   438,     0,   139,   141,   143,   147,   145,   499,    46,
       0,   504,   500,   510,   503,     0,     0,   487,     0,    43,
      39,    48,     0,    47,    41,     0,   102,   101,    70,    71,
      72,    74,    75,    77,    78,    83,    84,    82,    86,    87,
      89,    91,    93,    95,    97,     0,   292,   298,   297,   377,
     300,   299,   302,   420,   422,   368,   364,   363,   394,   392,
     430,   217,     0,     0,     0,   214,   346,   345,     0,     0,
       0,     0,   170,   164,   166,   168,     0,   286,     0,    15,
     218,     0,   460,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   462,    20,     0,   451,     0,
     453,   442,     0,     0,     0,   443,   444,   445,   446,   447,
       0,   307,    13,   342,     0,   410,     0,     0,   330,     0,
     341,     0,   409,   398,   309,   399,   280,   276,   282,     0,
     283,     0,   357,     0,     0,   134,   130,   132,   138,   136,
     434,    55,   370,     0,     0,     0,   384,   383,     0,     0,
     382,     0,     0,   184,   174,   176,   178,   180,   182,     0,
       0,     0,     0,     0,    57,   115,    68,    26,   489,     0,
       0,   390,   140,   142,   144,   148,   146,   495,   496,   497,
       0,   502,   508,   506,   511,   505,   484,   486,    40,     0,
      38,     0,   293,     0,   216,   215,     0,     0,     0,     0,
       0,     0,   324,     0,     0,     0,     0,   289,   288,    14,
       0,     0,     0,     0,     0,     0,     0,     0,   475,   476,
     477,     0,     0,     0,   463,   117,   390,     0,   187,   189,
     452,     0,   455,   454,   461,   119,   483,     0,   411,     0,
     339,   408,     0,   343,   412,   285,   281,   350,   349,   369,
     371,    29,   385,   372,     0,     0,     0,     0,     0,     0,
      31,     0,     0,     0,   488,   498,   501,    50,    49,    99,
     212,   272,   273,   274,   171,     0,     0,     0,     0,     0,
     314,     0,     0,   329,     0,     0,   450,     0,     0,     0,
       0,     0,     0,     0,   474,   478,     0,   448,     0,     0,
     118,     0,   482,   410,     0,     0,   409,     0,   373,    28,
     185,    33,     0,     0,    30,    35,     0,     0,   322,     0,
     323,   172,     0,     0,     0,     0,     0,     0,   319,   449,
       0,     0,   471,     0,     0,   473,     0,     0,     0,   481,
       0,   188,     0,   435,   190,   411,   412,   344,   186,    32,
      34,     0,     0,     0,   312,     0,   313,     0,   327,     0,
     328,     0,     0,   464,   466,   467,     0,   472,     0,     0,
     120,   480,   440,     0,   320,   321,     0,     0,     0,     0,
       0,   317,     0,   318,     0,     0,   469,     0,     0,   436,
     310,   311,   325,   326,     0,     0,   465,   468,   470,   437,
     441,   315,   316
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    44,    45,   132,    47,    48,   210,   211,   212,   213,
     133,   134,   135,   136,   470,   492,   137,   160,   139,   140,
     141,   142,   143,   144,   145,   146,   147,   148,   149,   150,
     151,   152,   256,   285,   567,   181,   702,   258,   433,   472,
     216,    51,   375,   446,   697,   698,    52,    53,    54,    55,
     347,   348,   349,    56,    57,    58,    59,   449,    60,    61,
     163,   164,   165,   166,   167,    62,   218,   219,   220,   221,
     222,   401,   402,    63,    64,   107,   108,    89,   442,   173,
     443,   174,   223,   224,    93,   225,    95,   405,   169,   226,
     175,   176,   177,   199,   263,   438,   814,   478,   843,   570,
     571,   572,   573,   574,   389,   575,   576,   577,   578,   579,
     154,   580,   227,   155,   479,   229,   480,   481,   482,   483,
     484,   485,   486,    66
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -768
static const yytype_int16 yypact[] =
{
    9212,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,    31,  -768,
    -768,  -768,  -768,  -768,  -768,  -768,  -768,   -65,   -45,  -768,
    -768,  -768,  -768,  -768,  -768,  -768,  -768,   -13,  -768,   160,
    7557,  -768,  -768,  -768,   -28,   265,  -768,  -768,  -768,  -768,
    -768,  -768,   374,  -768,  -768,   -16,   135,   146,    39,    74,
    7217,    61,  6330,  -768,  -768,  -768,  -768,  1105,  7666,  6756,
     739,  -768,   299,  -768,    45,  -768,  -768,  -768,  -768,    -2,
    -768,   290,   211,  8611,  -768,  -768,   594,   114,  -768,  3643,
     -79,  -768,   139,    40,  7217,  -768,   371,   106,  -768,   146,
     146,  -768,  -768,  -768,  7293,  7369,  7369,  9305,  7217,  -768,
    9305,  7217,  7445,  -768,  -768,  6469,  -768,   316,  -768,  -768,
    -768,  -768,   156,    12,  -768,  -768,   737,  -768,  1521,  7217,
    -768,   -35,   417,   158,  7217,   517,   529,   212,   213,   245,
     343,     4,  -768,   276,  -768,  -768,   283,    16,   156,   153,
    -768,   158,  6204,   246,  -768,  -768,  -768,   110,  -768,  1105,
    -768,  -768,   730,   287,   705,   321,   291,  -768,  -768,   -23,
    -768,   294,   739,  -768,   140,   290,   891,    -2,   211,  -768,
     594,  8713,  6837,  -768,  -768,  6913,  -768,   370,   335,   -48,
     105,    -2,  -768,   353,  9398,  8917,  6698,  9305,  -768,  -768,
     323,   323,   323,   409,    51,   625,  5964,   140,  3774,  -768,
     100,  -768,  -768,   211,  -768,  -768,   891,   334,   347,  -768,
    5664,  3905,  4036,   331,   356,  -768,  7217,   424,  -768,   146,
    -768,   -33,   165,  6469,  -768,  6989,  -768,  -768,   299,  7878,
    9491,  7984,  9491,  6469,  -768,  -768,  -768,   -31,  8403,  -768,
    -768,  -768,  -768,   378,   379,  2759,  2908,   146,  -768,  -768,
    5384,   146,  7217,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  -768,  -768,  -768,  5442,  -768,  7217,  7217,  7217,
    7217,  7217,  7217,  7217,   158,  7217,  7217,  -768,  7217,  7217,
    7217,  7217,  7217,  7217,  7217,  7217,  7217,  -768,  -768,  -768,
    6330,  7772,   237,   377,   399,  6330,  -768,  -768,  6330,  -768,
    -768,  -768,  -768,  -768,  9119,  -768,  -768,   891,    -2,  -768,
    -768,   402,  -768,   125,   447,  -768,   149,   458,  -768,  -768,
     146,  -768,  -768,  -768,  -768,  -768,   465,   468,  -768,   390,
    -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  -768,  -768,  -768,  -768,    61,  -768,  -768,   470,
     472,  -768,  -768,  -768,   476,  5843,  -768,  -768,  -768,  -768,
     888,  -768,  8917,  -768,  1105,  6608,   497,  9018,   471,  5215,
    -768,  -768,  -768,  -768,  -768,  5442,  1128,  7217,  -768,   155,
     140,   128,  -768,   211,  -768,   439,   891,  -768,   105,  -768,
    -768,  1037,  -768,   105,  -768,  -768,  -768,  4167,  -768,  4298,
    -768,  4429,  5664,  4560,  -768,  7217,  -768,  5664,  -768,  5664,
    -768,  -768,    51,  8403,  -768,  -768,  -768,  -768,   485,  8509,
    7217,   332,   495,   492,   499,   503,  8196,  -768,  -768,  -768,
    -768,  -768,  7217,   504,  8302,   509,  -768,  7217,   146,  -768,
    -768,  -768,  -768,  -768,  7217,   316,  -768,  3057,  -768,   682,
    -768,  -768,  8917,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
     323,  -768,  -768,   182,  -768,  3206,   490,  -768,   493,  -768,
    -768,  -768,   314,  -768,  -768,   433,  -768,  -768,  -768,  -768,
    -768,   -35,   -35,   417,   417,   158,   158,   158,   517,   517,
     529,   212,   213,   245,   343,   216,  8090,  -768,  -768,   399,
    -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  7217,   520,   306,  -768,  -768,  -768,  7217,    61,
    6330,   -21,   -71,  -768,  -768,  -768,    32,  -768,    61,  -768,
     140,   521,  -768,  7217,   506,   527,   530,   531,  5363,   533,
     146,   507,   518,  5723,   146,  -768,    76,   188,  -768,  6084,
    -768,  -768,  2312,  2461,   515,  -768,  -768,  -768,  -768,  -768,
     522,  -768,  -768,  -768,  3355,   211,   105,   585,  -768,  7217,
    -768,   105,   211,  -768,  -768,  -768,  -768,  -768,  -768,  4691,
    -768,  4822,  -768,  4953,  5084,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  -768,   541,   545,   544,   495,   499,  8815,  7217,
     495,  6330,  7217,   549,  -768,  -768,  -768,  -768,  -768,   546,
     548,  7217,  7217,   547,  -768,  -768,  -768,  -768,  -768,   538,
    5442,   146,  -768,  -768,  -768,  -768,  -768,  -768,  -768,  -768,
    5442,  -768,  -768,  -768,   182,  -768,  -768,  -768,  -768,  5442,
    -768,  7217,  -768,   351,  -768,  -768,   555,   559,    38,   161,
     323,   323,  -768,  6330,     1,     3,   552,  -768,  -768,  -768,
     550,  5363,  7217,  7217,  7065,   632,  1280,   556,  -768,  -768,
    -768,   190,   551,  5363,  -768,  -768,    41,   260,  -768,   388,
    -768,  2610,  -768,  -768,  -768,  -768,  -768,   562,   211,   140,
    -768,   561,   891,   560,   211,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,   495,  -768,   575,   580,   263,   581,  6330,  7217,
    -768,   582,   584,  7217,  -768,  -768,  -768,  -768,  -768,  -768,
    -768,  -768,  -768,  -768,  -768,   -12,   -42,   310,   323,   323,
    -768,   323,   323,  -768,   204,  5363,  -768,   354,   380,  5363,
     406,   592,  5363,  1740,  -768,  -768,  7217,  -768,  3504,   739,
    -768,  5525,  -768,   561,   105,   105,   561,  7217,  -768,  -768,
    -768,  -768,   320,   598,  -768,  -768,   600,   323,  -768,   323,
    -768,  -768,    -7,   -34,    22,   -19,   323,   323,  -768,  -768,
    5363,  5363,  -768,  5363,  7217,  -768,  5363,  7141,   589,  -768,
     588,  -768,  5525,  -768,  -768,   561,   561,  -768,  -768,  -768,
    -768,   590,   599,   323,  -768,   323,  -768,   323,  -768,   323,
    -768,   108,   -15,   670,  -768,  -768,   416,  -768,  5363,   436,
    -768,  -768,  -768,   159,  -768,  -768,   601,   602,   611,   617,
     323,  -768,   323,  -768,  5363,   596,  -768,  5363,  2151,  -768,
    -768,  -768,  -768,  -768,   619,   621,  -768,  -768,  -768,  -768,
    -768,  -768,  -768
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -768,   -24,  -768,   706,   685,    -6,  -768,  -768,  -768,  -768,
       0,  -768,  -768,   -91,  -268,  -768,  -768,   191,  -768,  -123,
     318,   297,   -26,  -768,   317,   475,   477,   469,   482,   483,
    -768,  1562,   -47,  -768,  -121,  1366,  -369,  -768,  -768,  -379,
     342,  -768,  -768,   528,  -768,    20,  1421,  1018,  -768,   667,
    -768,  -322,  -768,   -41,  -768,  1251,  1449,  -180,  1210,  -192,
    -768,   267,   268,   473,  -527,  -165,   -77,   382,  -768,  -768,
    -126,  -768,   203,  -164,  1270,   526,   574,   -78,  -408,   -18,
    -226,   -43,   440,  -174,  -768,   535,   -67,   348,  -768,   982,
     -90,  -768,     9,  -768,  -768,   542,  -767,  -384,  -768,   251,
    -768,  -768,   250,  -768,  -768,  1378,  -616,  -768,  -768,  -768,
    -122,  -768,  -768,   375,  -768,  -768,  -768,   344,   177,   345,
     350,  -768,  -265,  -768
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -510
static const yytype_int16 yytable[] =
{
      49,   488,   491,   198,   257,   264,   187,    91,   215,    65,
     569,   581,   379,   669,    98,     1,   286,   496,   201,     1,
     568,   305,    68,   153,   378,   453,    81,   535,    69,   202,
     789,   383,    90,   616,     1,     1,   620,   185,   825,   380,
     381,     1,   404,     1,     1,   842,   161,    72,     1,    76,
      82,   670,   671,   829,     1,   673,   101,   852,   379,     2,
     379,   787,   102,    70,     1,   238,   823,   106,     2,   230,
     763,   157,   159,   748,   749,   751,   752,   674,   172,     1,
     183,   339,    76,    71,   183,   257,   381,   340,   381,     2,
     287,   870,   410,   197,   726,   827,   183,   233,   456,   214,
      97,   331,   239,   234,   457,   288,   289,   790,     1,   106,
     106,   325,   328,    72,   427,   826,   428,   248,   294,   202,
     248,   316,   257,   329,   257,   265,   191,   215,   672,   104,
     830,   192,   257,    76,   853,   105,   273,   788,    81,   215,
     215,   215,   824,     1,   313,   309,   747,   807,   306,     1,
     750,   495,   753,   417,   419,   421,     1,    76,     1,    76,
     266,    73,   248,     1,   498,   499,   500,   743,   292,   293,
      77,   828,    76,    78,   469,   469,    74,    75,    79,    67,
     675,   850,   183,   379,   183,   515,   183,   109,   232,   768,
     183,    49,    81,   569,   569,   545,    98,    76,   373,   266,
     183,   782,   639,   700,   374,    82,   386,   248,   549,   722,
     380,   381,   665,   613,    76,   273,   399,   183,   214,   431,
     629,   693,   110,   493,   266,    81,   183,    81,   633,   431,
     214,   214,   214,   182,   187,   411,   201,   317,   497,   106,
     463,   239,   203,   432,   373,   318,   373,   412,    76,   248,
     445,   248,   445,   432,   379,   240,   735,   851,   458,   526,
     329,   138,   379,   587,   257,    77,   626,   489,   182,   505,
     506,   494,   507,   265,   626,   588,   796,   797,    74,    75,
      74,    75,   381,   528,   161,    74,    75,   231,   744,   161,
     381,   410,   161,   410,   858,   410,   318,   265,   647,   310,
     239,   266,     1,   584,   265,   244,   246,   247,   859,   341,
     432,    49,   429,   254,   430,   432,   138,   650,   159,   707,
     215,   113,   569,   457,    49,   457,   215,   183,   215,   651,
     215,   215,   215,   524,   342,   694,   215,   765,   215,   194,
     530,   636,    50,   637,   195,   599,   601,    33,   301,   614,
     603,   457,   604,   798,   343,   302,   341,   546,    81,   304,
     536,   661,    77,    81,   590,   311,   537,    31,    32,   373,
      79,    73,    33,     1,   101,   542,   469,     1,    39,    40,
     547,   342,    82,   344,   345,   386,    76,   248,   303,   566,
     780,   737,   315,   341,   469,   769,   183,   138,   318,    76,
     183,   343,     2,    39,    40,   307,   183,   770,   183,   605,
     635,   663,   308,   183,   162,   610,   321,   214,   342,   214,
      50,   214,   214,   214,    74,    75,   324,   214,   326,   214,
     344,   345,    76,   248,   138,    50,   138,   791,   343,    49,
     373,   328,   691,   658,   138,   318,   623,   818,   373,   659,
     323,    31,    32,    33,   623,   318,    33,    77,    76,   249,
     439,   138,   251,   138,   338,    31,    32,   344,   345,   273,
      33,   388,   641,   410,   228,   410,   138,   410,   410,   422,
     740,   415,   346,   800,    39,    40,   457,    39,    40,   457,
      92,   666,    81,   469,   416,    74,    75,   138,   662,  -429,
       1,    39,    40,   810,   423,  -429,    33,   464,   215,   801,
     215,   465,   215,   215,   161,   457,   248,   236,    92,   533,
      92,    33,    99,  -291,   188,   534,   699,   311,   724,   295,
     296,   525,    79,    50,   771,   803,    92,    39,    40,   668,
     159,   457,   677,   299,   300,   855,   676,   382,   678,   387,
     183,   457,    39,    40,   290,   291,   393,   388,   566,   469,
     687,   757,   758,   760,   692,   857,    76,   660,   457,   696,
     425,   457,   566,   566,  -390,  -390,   138,   517,   518,  -390,
     138,   527,   520,   521,   589,    94,   183,   183,     1,   503,
     504,   183,   529,   228,   531,   161,   532,     1,   538,   214,
     539,   214,   540,   214,   214,   228,   228,   228,   501,   502,
    -390,  -390,   738,    94,   611,    94,   508,   509,    49,   189,
     552,   159,    92,   618,   188,   619,    92,   439,     1,   621,
      92,    94,   267,   268,   269,   241,   242,   631,   634,   656,
     188,    76,   657,   297,   298,   266,    92,   161,   138,   664,
     679,   681,   516,    50,   688,   682,   403,   516,   683,   684,
     162,   686,    31,    32,   704,   689,    50,    33,    76,   705,
     719,    31,    32,   159,   720,   728,    33,   469,   721,   729,
     733,   566,   730,   836,   741,     1,   839,   734,   742,   267,
     268,   269,   761,   566,   195,   755,    76,   766,    39,    40,
     754,   566,   161,   764,   778,   777,    46,    39,    40,   183,
      77,   772,   183,   182,   779,   781,   784,    94,   785,   189,
     804,    94,    78,   138,   813,    94,   699,    79,   159,   138,
     397,    73,   819,     1,   820,   189,   840,   841,   854,   844,
       1,    94,     1,   867,   267,   268,   269,   100,   845,   138,
     860,   861,   407,   270,   138,   566,    46,   271,   272,   566,
     862,   414,   566,   138,   138,   813,   863,    92,   871,   183,
     872,   395,   512,   237,   183,   183,   510,   156,   158,   511,
     454,    50,    31,    32,    46,   179,   513,    33,   514,   811,
     710,   522,   228,   594,   228,   455,   228,   228,   228,    46,
     566,   566,   228,   566,   228,   158,   566,  -390,  -390,   685,
     270,   813,  -390,   426,   271,   272,    31,    32,    39,    40,
     648,    33,   701,    46,   703,    92,    46,   736,   640,   653,
     654,   158,     0,     0,   322,   655,    92,     0,   566,     0,
     585,     0,     0,  -390,  -390,     0,   592,     0,     0,     0,
     138,     0,    39,    40,   566,    74,    75,   566,  -390,  -390,
       0,     0,    94,  -390,    77,   270,     0,   182,    46,   271,
     272,     0,   138,   138,   138,   138,     0,   138,     0,     0,
       0,     0,   162,     0,   138,     0,     0,     0,     0,     0,
       0,     1,   138,     0,     1,     0,     0,    46,   333,     0,
       0,   336,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    46,   403,    46,     0,     0,     2,     0,     0,     0,
      94,     0,    46,     0,   158,     0,     0,     0,     0,     0,
       0,    94,   756,     0,     0,   407,   158,   158,   158,     0,
       0,   414,     0,   593,   767,     0,   138,     0,   595,   158,
     138,     0,   703,   138,   138,    46,     0,    46,     0,   158,
      50,     0,   138,   162,    46,    31,    32,     0,    31,    32,
      33,   158,   158,    33,   228,     0,   228,     0,   228,   228,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     188,   138,   138,     0,   138,   138,     0,   138,   138,     0,
       0,    39,    40,   138,    39,    40,   799,     0,     0,    92,
     802,     0,     0,   805,     0,   162,   158,    46,     0,   182,
       0,   158,     0,     0,   158,     0,   708,   711,     0,   138,
      46,   714,    96,     0,     0,     0,     0,     0,   111,     0,
       1,   112,   113,     0,     0,   138,     0,     0,   138,   138,
       0,   833,   834,     0,   835,     0,     0,   837,     0,   170,
      96,     0,   186,     0,     0,     2,   190,     0,    84,     0,
     162,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     103,     0,     0,     0,     0,   189,     0,     0,    46,   856,
       0,   158,     0,    46,     0,   158,    84,     0,   184,     0,
       0,     0,     0,     0,    94,   866,     0,     0,   868,   193,
       0,   117,   118,     0,   200,     0,     0,   217,     0,     0,
       0,   593,     0,   158,     0,   158,   595,   158,   158,   158,
       0,     1,     0,   158,     0,   158,     0,     0,     0,    46,
       0,     0,   120,   121,   314,    46,     0,     0,     0,   773,
       0,   320,   776,    22,    23,     0,     0,     0,   123,     0,
       0,     0,     0,     0,   186,   245,   327,     0,   127,     0,
       0,     0,     0,   158,     0,     0,     0,     0,    46,     0,
     312,     0,    31,    32,     0,     0,     0,    33,   186,     0,
       0,   158,   193,     0,     0,     0,     0,     0,   406,   408,
     184,     0,     0,   193,   200,    31,    32,     0,   200,    92,
      33,     0,     0,     0,   815,   816,     0,     0,    39,    40,
       0,     0,    46,   217,   184,     0,     0,     0,     0,     0,
      77,   444,     0,   444,   400,     0,   217,     0,     0,     0,
     314,    39,    40,     0,   413,   667,   158,     0,   217,   217,
     217,     0,     0,    77,     0,     0,   182,   582,     0,     0,
      87,     0,     0,     0,     0,     0,     0,   441,     0,   441,
       0,     0,     0,     0,     0,    46,   312,     0,   158,   158,
       0,   111,     0,     1,   112,   113,   114,     0,   115,   116,
     158,     0,     0,   314,   519,     0,     0,     0,     0,     0,
       0,    85,     0,     0,    94,   158,     0,   158,     2,   158,
     158,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      88,     0,     0,     0,    46,     0,     0,   158,   168,   312,
       0,     0,     0,     0,     0,   261,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   200,     0,     0,     0,     0,
       0,     0,     0,     0,   117,   118,   119,   314,     0,     0,
       0,     0,     0,     0,     0,     0,   170,   186,     0,     0,
       0,     0,    87,     0,     0,     0,   259,     0,   186,   158,
       0,     0,   586,     0,     0,   120,   121,     0,     0,     0,
       0,     0,   122,   312,     0,   262,     0,     0,   548,     0,
     217,   123,     0,   550,     0,   124,     0,   158,   125,   762,
     126,   127,     0,    85,   184,   314,   128,   129,   130,   131,
     319,   444,     0,   617,   591,     0,    87,   565,   444,     0,
       0,     0,    88,     0,   158,   217,   444,   217,     0,   217,
     217,   217,     0,     0,     0,   217,     0,   217,     0,     0,
       0,   312,     0,   436,   406,   377,     0,   441,     0,    87,
     450,    87,   450,   436,   441,     0,     0,    85,   461,     0,
     235,    83,   441,     0,   158,   476,   476,     0,     0,     0,
       0,     0,     0,     0,   250,     0,    88,   252,     0,     0,
     400,     0,     0,     0,   434,     0,     0,     0,   314,    86,
      85,   448,    85,   448,   434,     0,     0,     0,     0,   459,
       0,     0,     0,   437,     0,     0,   474,   474,     0,    88,
     451,    88,   451,   437,     0,     0,     0,     0,   462,     0,
       0,     0,   327,     0,   312,   477,   477,     0,     0,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,     0,
       0,   186,     0,     0,     0,     0,     0,     0,   334,     0,
       0,   337,     0,     0,     0,     0,     0,     0,     0,   712,
       0,     0,     0,     0,   260,     0,     0,     0,     0,     0,
       0,     0,     0,    83,     0,     0,     0,   550,   390,   391,
     392,   394,    87,     0,     0,   261,     0,    87,     0,   476,
       0,     0,   424,     0,     0,   709,     0,     0,     0,     0,
       0,    86,     0,     0,     0,     0,     0,   217,     0,   217,
       0,   217,   217,     0,     0,   376,   544,     0,     0,     0,
       0,     0,     0,    85,     0,   168,   259,    83,    85,     0,
     474,   180,     0,   608,     0,     0,     0,     0,     0,     0,
       0,     0,    88,     0,     0,   262,   627,    88,     0,   477,
       0,     0,     0,     0,   627,    86,   180,   284,     0,     0,
      83,   447,    83,   447,     0,     0,     0,   476,     0,     0,
     180,     0,   645,   180,   606,     0,   473,   473,     0,     0,
       0,   774,   435,     0,     0,   476,     0,   625,    86,     0,
      86,     0,   435,   609,     0,   625,     0,   460,     0,     0,
       0,     0,     0,     0,   475,   475,   628,   193,   474,     0,
       0,     0,     0,   643,   628,     0,    87,     0,     0,     0,
     775,     0,     0,     0,     0,     0,   474,   477,     0,     0,
       0,   111,   646,     1,   112,   113,   114,     0,   115,   116,
       0,   186,     0,     0,   180,   477,     0,   180,     0,     0,
       0,     0,     0,   583,     0,     0,     0,    85,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   645,
       0,     0,   476,   476,     0,     0,    88,   184,     0,     0,
       0,   602,     0,     0,   476,     0,   543,     0,   180,     0,
       0,     0,     0,    83,     0,     0,   615,     0,    83,     0,
     473,     0,     0,     0,   117,   118,   119,     0,   630,     0,
     643,     0,     0,   474,   474,     0,     0,   471,   471,     0,
       0,    86,     0,     0,   260,   474,    86,     0,   475,   646,
       0,     0,   477,   477,     0,   120,   121,     0,     0,     0,
       0,     0,   122,     0,   477,     0,     0,     0,   649,     0,
       0,   123,     0,     0,     0,   124,     0,   624,   125,   806,
     126,   127,     0,     0,     0,   624,   128,   129,   130,   131,
       0,     0,   607,     0,     0,     0,     0,   565,   473,     0,
       0,     0,     0,   642,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   473,     0,     0,     0,
       0,   476,     0,     0,     0,     0,   475,     0,     0,   680,
       0,   644,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   475,     0,     0,    83,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   474,     0,     0,   713,     0,   471,     0,   180,
       0,     0,     0,     0,     0,    86,     0,     0,     0,     0,
       0,   477,     0,     0,     0,     0,     0,     0,   476,     0,
       0,     0,     0,     0,     0,   725,     0,   180,   727,     0,
     642,     0,     0,   473,   473,     0,     0,   731,   732,     0,
       0,     0,   180,     0,     0,   473,     0,     0,     0,     0,
       0,     0,     0,     0,   180,     0,     0,     0,   644,   474,
       0,   475,   475,     0,     0,     0,     0,     0,     0,   471,
       0,     0,     0,   475,     0,     0,     0,     0,   477,     0,
       0,     0,     0,     0,     0,     0,     0,   471,   745,   746,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   783,     0,     0,     0,   786,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   180,     0,     0,     0,     0,
       0,     0,   473,     0,     0,     0,   792,   793,     0,   794,
     795,     0,   808,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   817,     0,     0,   471,     0,     0,     0,
     475,   180,   111,     0,     1,   112,   113,   114,     0,   115,
     116,     0,     0,     0,     0,   821,     0,   822,     0,     0,
       0,     0,     0,     0,   831,   832,     0,     0,     0,     2,
       0,   180,     0,     0,   180,     0,     0,     0,     0,   473,
       0,     0,     0,   180,   180,     0,     0,     0,     0,     0,
       0,   846,   471,   847,     0,   848,     0,   849,     0,     0,
       0,     0,   471,     0,     0,     0,     0,   475,     0,     0,
       0,     0,     0,   739,     0,   117,   118,   119,   864,     0,
     865,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   120,   121,     0,     0,
       0,     0,     0,   122,     0,     0,     0,     0,     0,     0,
       0,     0,   123,     0,     0,     0,   124,     0,     0,   125,
       0,   126,   127,     0,     0,     0,     0,   128,   129,   130,
     131,   180,     0,     0,     0,   180,     0,     0,     0,   812,
     869,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   111,     0,     1,   112,   113,   114,     0,
     115,   116,     0,     0,     0,     0,     0,     0,   180,     0,
     471,     0,     0,     0,     0,     0,     0,     0,     0,   180,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,     0,   553,   554,
     555,   556,   557,   558,   559,   560,   561,   562,   563,     0,
       0,     0,    30,     0,     0,     0,   117,   118,   119,    31,
      32,     0,   564,     0,    33,     0,     0,    34,    35,     0,
      36,     0,    37,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    38,     0,   120,   121,     0,
       0,     0,     0,     0,   122,    39,    40,    41,    42,     0,
       0,     0,    43,   123,     0,     0,     0,   124,     0,     0,
     125,     0,   126,   127,     0,     0,     0,     0,   128,   129,
     130,   131,     0,     0,     0,     0,     0,     0,     0,   565,
     388,  -457,   111,     0,     1,   112,   113,   114,     0,   115,
     116,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,     0,   553,   554,   555,
     556,   557,   558,   559,   560,   561,   562,   563,     0,     0,
       0,    30,     0,     0,     0,   117,   118,   119,    31,    32,
       0,   564,     0,    33,     0,     0,    34,    35,     0,    36,
       0,    37,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    38,     0,   120,   121,     0,     0,
       0,     0,     0,   122,    39,    40,    41,    42,     0,     0,
       0,    43,   123,     0,     0,     0,   124,     0,     0,   125,
       0,   126,   127,     0,     0,     0,     0,   128,   129,   130,
     131,     0,     0,     0,     0,     0,     0,     0,   565,   388,
    -456,   111,     0,     1,   112,   113,   114,     0,   115,   116,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,     0,   553,   554,   555,   556,
     557,   558,   559,   560,   561,   562,   563,     0,     0,     0,
      30,     0,     0,     0,   117,   118,   119,    31,    32,     0,
     564,     0,    33,     0,     0,    34,    35,     0,    36,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    38,     0,   120,   121,     0,     0,     0,
       0,     0,   122,    39,    40,    41,    42,     0,     0,     0,
      43,   123,     0,     0,     0,   124,     0,     0,   125,     0,
     126,   127,     0,     0,     0,     0,   128,   129,   130,   131,
       0,     0,     0,     0,     0,     0,     0,   565,   388,  -458,
     111,     0,     1,   112,   113,   114,     0,   115,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    30,
       0,     0,     0,   117,   118,   119,    31,    32,     0,     0,
       0,    33,     0,     0,    34,    35,     0,    36,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    38,     0,   120,   121,     0,     0,     0,     0,
       0,   122,    39,    40,    41,    42,     0,     0,     0,    43,
     123,     0,     0,     0,   124,     0,     0,   125,     0,   126,
     127,     0,     0,     0,     0,   128,   129,   130,   131,     0,
       0,     0,     0,     0,     0,     0,   466,   467,   468,   111,
       0,     1,   112,   113,   114,     0,   115,   116,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    30,     0,
       0,     0,   117,   118,   119,    31,    32,     0,     0,     0,
      33,     0,     0,    34,    35,     0,    36,     0,    37,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,     0,   120,   121,     0,     0,     0,     0,     0,
     122,    39,    40,    41,    42,     0,     0,     0,    43,   123,
       0,     0,     0,   124,     0,     0,   125,     0,   126,   127,
       0,     0,     0,     0,   128,   129,   130,   131,     0,     0,
       0,     0,     0,     0,     0,   466,   467,   487,   111,     0,
       1,   112,   113,   114,     0,   115,   116,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    30,     0,     0,
       0,   117,   118,   119,    31,    32,     0,     0,     0,    33,
       0,     0,    34,    35,     0,    36,     0,    37,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      38,     0,   120,   121,     0,     0,     0,     0,     0,   122,
      39,    40,    41,    42,     0,     0,     0,    43,   123,     0,
       0,     0,   124,     0,     0,   125,     0,   126,   127,     0,
       0,     0,     0,   128,   129,   130,   131,     0,     0,     0,
       0,     0,     0,     0,   466,   467,   638,   111,     0,     1,
     112,   113,   114,     0,   115,   116,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    30,     0,     0,     0,
     117,   118,   119,    31,    32,     0,     0,     0,    33,     0,
       0,    34,    35,     0,    36,     0,    37,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    38,
       0,   120,   121,     0,     0,     0,     0,     0,   122,    39,
      40,    41,    42,     0,     0,     0,    43,   123,     0,     0,
       0,   124,     0,     0,   125,     0,   126,   127,     0,     0,
       0,     0,   128,   129,   130,   131,     0,     0,     0,     0,
       0,     0,     0,   652,   467,  -509,   111,     0,     1,   112,
     113,   114,     0,   115,   116,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    30,     0,     0,     0,   117,
     118,   119,    31,    32,     0,     0,     0,    33,     0,     0,
      34,    35,     0,    36,     0,    37,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    38,     0,
     120,   121,     0,     0,     0,     0,     0,   122,    39,    40,
      41,    42,     0,     0,     0,    43,   123,     0,     0,     0,
     124,     0,     0,   125,     0,   126,   127,     0,     0,     0,
       0,   128,   129,   130,   131,     0,     0,     0,     0,     0,
       0,     0,   466,   467,   706,   111,     0,     1,   112,   113,
     114,     0,   115,   116,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,     0,     0,     0,   117,   118,
     119,    31,    32,     0,     0,     0,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,   120,
     121,     0,     0,     0,     0,     0,   122,    39,    40,    41,
      42,     0,     0,     0,    43,   123,     0,     0,     0,   124,
       0,     0,   125,     0,   126,   127,     0,     0,     0,     0,
     128,   129,   130,   131,   111,     0,     1,   112,   113,     0,
       0,   466,   467,   809,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    30,   204,     0,     0,   117,   118,     0,
      31,    32,     0,     0,   205,    33,     0,     0,    34,    35,
       0,    36,     0,    37,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    38,     0,   120,   121,
       0,     0,     0,     0,     0,     0,    39,    40,    41,    42,
       0,     0,     0,    43,   123,     0,     0,     0,    77,     0,
       0,   206,     0,   207,   127,   111,     0,     1,   112,   113,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     208,     0,   209,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,   204,     0,     0,   117,   118,
       0,    31,    32,     0,     0,   205,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,   120,
     121,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,   123,     0,     0,     0,    77,
       0,     0,   206,     0,   207,   127,   111,     0,     1,   112,
     113,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   208,     0,   409,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    30,   204,     0,     0,   117,
     118,     0,    31,    32,     0,     0,   205,    33,     0,     0,
      34,    35,     0,    36,     0,    37,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    38,     0,
     120,   121,     0,     0,     0,     0,     0,     0,    39,    40,
      41,    42,     0,     0,     0,    43,   123,     0,     0,     0,
      77,     0,     0,   206,     0,   207,   127,   111,     0,     1,
     112,   113,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   208,     0,   418,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    30,   204,     0,     0,
     117,   118,     0,    31,    32,     0,     0,   205,    33,     0,
       0,    34,    35,     0,    36,     0,    37,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    38,
       0,   120,   121,     0,     0,     0,     0,     0,     0,    39,
      40,    41,    42,     0,     0,     0,    43,   123,     0,     0,
       0,    77,     0,     0,   206,     0,   207,   127,   111,     0,
       1,   112,   113,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   208,     0,   420,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    30,   204,     0,
       0,   117,   118,     0,    31,    32,     0,     0,   205,    33,
       0,     0,    34,    35,     0,    36,     0,    37,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      38,     0,   120,   121,     0,     0,     0,     0,     0,     0,
      39,    40,    41,    42,     0,     0,     0,    43,   123,     0,
       0,     0,    77,     0,     0,   206,     0,   207,   127,   111,
       0,     1,   112,   113,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   208,     0,   596,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    30,   204,
       0,     0,   117,   118,     0,    31,    32,     0,     0,   205,
      33,     0,     0,    34,    35,     0,    36,     0,    37,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,     0,   120,   121,     0,     0,     0,     0,     0,
       0,    39,    40,    41,    42,     0,     0,     0,    43,   123,
       0,     0,     0,    77,     0,     0,   206,     0,   207,   127,
     111,     0,     1,   112,   113,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   208,     0,   597,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    30,
     204,     0,     0,   117,   118,     0,    31,    32,     0,     0,
     205,    33,     0,     0,    34,    35,     0,    36,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    38,     0,   120,   121,     0,     0,     0,     0,
       0,     0,    39,    40,    41,    42,     0,     0,     0,    43,
     123,     0,     0,     0,    77,     0,     0,   206,     0,   207,
     127,   111,     0,     1,   112,   113,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   208,     0,   598,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      30,   204,     0,     0,   117,   118,     0,    31,    32,     0,
       0,   205,    33,     0,     0,    34,    35,     0,    36,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    38,     0,   120,   121,     0,     0,     0,
       0,     0,     0,    39,    40,    41,    42,     0,     0,     0,
      43,   123,     0,     0,     0,    77,     0,     0,   206,     0,
     207,   127,   111,     0,     1,   112,   113,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   208,     0,   600,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    30,   204,     0,     0,   117,   118,     0,    31,    32,
       0,     0,   205,    33,     0,     0,    34,    35,     0,    36,
       0,    37,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    38,     0,   120,   121,     0,     0,
       0,     0,     0,     0,    39,    40,    41,    42,     0,     0,
       0,    43,   123,     0,     0,     0,    77,     0,     0,   206,
       0,   207,   127,   111,     0,     1,   112,   113,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   208,     0,
     715,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    30,   204,     0,     0,   117,   118,     0,    31,
      32,     0,     0,   205,    33,     0,     0,    34,    35,     0,
      36,     0,    37,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    38,     0,   120,   121,     0,
       0,     0,     0,     0,     0,    39,    40,    41,    42,     0,
       0,     0,    43,   123,     0,     0,     0,    77,     0,     0,
     206,     0,   207,   127,   111,     0,     1,   112,   113,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   208,
       0,   716,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    30,   204,     0,     0,   117,   118,     0,
      31,    32,     0,     0,   205,    33,     0,     0,    34,    35,
       0,    36,     0,    37,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    38,     0,   120,   121,
       0,     0,     0,     0,     0,     0,    39,    40,    41,    42,
       0,     0,     0,    43,   123,     0,     0,     0,    77,     0,
       0,   206,     0,   207,   127,   111,     0,     1,   112,   113,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     208,     0,   717,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,   204,     0,     0,   117,   118,
       0,    31,    32,     0,     0,   205,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,   120,
     121,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,   123,     0,     0,     0,    77,
       0,     0,   206,     0,   207,   127,   111,     0,     1,   112,
     113,   114,     0,   115,   116,     0,     0,     0,     0,     0,
       0,   208,     0,   718,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
       0,   553,   554,   555,   556,   557,   558,   559,   560,   561,
     562,   563,     0,     0,     0,    30,     0,     0,     0,   117,
     118,   119,    31,    32,     0,   564,     0,    33,     0,     0,
      34,    35,     0,    36,     0,    37,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    38,     0,
     120,   121,     0,     0,     0,     0,     0,   122,    39,    40,
      41,    42,     0,     0,     0,    43,   123,     0,     0,     0,
     124,     0,     0,   125,     0,   126,   127,     0,     0,     0,
       0,   128,   129,   130,   131,     0,     0,     0,     0,     0,
       0,     0,   565,   388,   111,     0,     1,   112,   113,   114,
       0,   115,   116,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   111,     0,     1,   112,   113,
     114,     2,   115,   116,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,   553,
     554,   555,   556,   557,   558,   559,   560,   561,   562,   563,
       0,     0,     0,     0,     0,     0,     0,   117,   118,   119,
       0,     0,     0,   111,     0,     1,   112,   113,   114,     0,
     115,   116,     0,     0,     0,     0,     0,     0,   117,   118,
     119,     0,     0,     0,     0,     0,     0,     0,   120,   121,
       2,     0,     0,     0,     0,   122,     0,     0,     0,     0,
       0,     0,     0,     0,   123,     0,     0,     0,   124,   120,
     121,   125,     0,   126,   127,     0,   122,     0,     0,   128,
     129,   130,   131,     0,     0,   123,     0,     0,     0,   124,
     565,   388,   125,   490,   126,   127,   117,   118,   119,     0,
     128,   129,   130,   131,     0,     0,   111,     0,     1,   112,
     113,   114,   467,   115,   116,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   120,   121,     0,
       0,     0,     0,     2,   122,     0,     0,     0,     0,     0,
       0,     0,     0,   123,     0,     0,     0,   124,     0,     0,
     125,     0,   126,   127,     0,     0,     0,     0,   128,   129,
     130,   131,     0,     0,     0,     0,     0,     0,     0,     0,
     467,     0,     0,     0,     0,     0,     0,     0,     0,   117,
     118,   119,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     120,   121,     0,     0,     0,     0,     0,   122,     0,     0,
       0,     0,     0,     0,     0,     0,   123,     0,     0,     0,
     124,     0,     0,   125,     0,   126,   127,     0,     0,     0,
       0,   128,   129,   130,   131,   111,     0,     1,   112,   113,
       0,     0,     0,   812,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,   111,     0,     1,   112,   113,   114,
       0,   115,   116,     0,    30,   204,     0,     0,   117,   118,
       0,    31,    32,     0,     0,   205,    33,     0,     0,    34,
      35,     2,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,   120,
     121,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,   123,     0,     0,     0,    77,
       0,     0,   206,     0,   207,   127,     0,   117,   118,   119,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   208,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   120,   121,
       0,     0,     0,     0,     0,   122,     0,     0,     0,     0,
       0,     0,     0,     0,   123,     0,     1,     0,   124,     0,
       0,   125,     0,   126,   127,     0,     0,     0,     0,   128,
     129,   130,   131,     0,     0,     0,     0,     0,     0,     0,
     690,     2,     3,     4,     5,     6,     7,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   359,   360,   361,   362,
     363,    22,    23,   364,   365,    26,    27,   366,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   367,     0,     0,     0,     0,     0,     0,
      31,    32,     0,     0,     0,    33,     0,     0,     0,     0,
       0,   368,     0,   369,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   370,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    39,    40,   371,   372,
       0,     0,     0,    43,     0,     0,     0,     1,    77,     0,
       0,   311,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   541,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,     0,     0,     0,     0,     0,
       0,    31,    32,     0,     0,     0,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,     0,     0,     1,     0,    77,
       0,     0,   396,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   397,
       0,   398,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,     0,     0,     0,     0,     0,
       0,    31,    32,     0,     0,     0,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,     0,     0,     1,     0,    77,
       0,     0,   182,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   695,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,     0,     0,     0,     0,     0,
       0,    31,    32,     0,     0,     0,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,     0,     0,     0,     0,    77,
       0,   111,   311,     1,   112,   113,   114,    79,   115,   116,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -290,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      30,     0,     0,     0,   117,   118,   119,    31,    32,     0,
       0,     0,    33,     0,     0,    34,    35,     0,    36,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    38,     0,   120,   121,     0,     0,     0,
       0,     0,   122,    39,    40,    41,    42,     0,     0,     0,
      43,   123,     0,     0,     0,   124,     0,     0,   125,     0,
     126,   127,     0,     0,     0,     0,   128,   129,   130,   131,
     111,     0,     1,   112,   113,   114,     0,   115,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    30,
       0,     0,     0,   117,   118,   119,    31,    32,     0,     0,
       0,    33,     0,     0,    34,    35,     0,    36,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    38,     0,   120,   121,     0,     0,     0,     0,
       0,   122,    39,    40,    41,    42,     0,     0,     0,     0,
     123,     0,     0,     0,   124,     0,     0,   125,   255,   126,
     127,     0,     0,     0,     0,   128,   129,   130,   131,   111,
       0,     1,   112,   113,   114,     0,   115,   116,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    30,     0,
       0,     0,   117,   118,   119,    31,    32,     0,     0,     0,
      33,     0,     0,    34,    35,     0,    36,     0,    37,   111,
       0,     1,   112,   113,   114,     0,   115,   116,     0,     0,
       0,    38,     0,   120,   121,     0,     0,     0,     0,     0,
     122,    39,    40,    41,    42,     0,     2,     0,     0,   123,
       0,     0,     0,   384,     0,     0,   385,   255,   126,   127,
       0,     0,     0,     0,   128,   129,   130,   131,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   111,     0,     1,
     112,   113,   114,     0,   115,   116,     0,     0,     0,     0,
       0,     0,   117,   118,   119,    31,    32,     0,     0,     0,
      33,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   120,   121,     0,     0,     0,     0,     0,
     122,    39,    40,     0,     0,     0,     0,     0,     0,   123,
       0,     0,     0,   384,     0,     0,   385,   255,   126,   127,
     117,   118,   119,     0,   128,   129,   130,   131,   111,     0,
       1,   112,   113,   114,     0,   115,   116,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   120,   121,     0,     0,     2,     0,     0,   122,     0,
       0,     0,     0,     0,     0,     0,     0,   123,     0,     0,
       0,   124,     0,     0,   125,     0,   126,   127,     0,     0,
     178,     0,   128,   129,   130,   131,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   117,   118,   119,   111,     0,     1,   112,   113,   114,
       0,   115,   116,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   120,   121,     0,     0,     0,     0,     0,   122,
       0,     0,     0,     0,     0,     0,     0,     0,   123,     0,
       0,     0,   124,     0,     0,   125,     0,   126,   127,     0,
       0,   332,     0,   128,   129,   130,   131,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   117,   118,   119,
     111,     0,     1,   112,   113,   114,     0,   115,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   120,   121,
       0,     0,     0,     0,     0,   122,     0,     0,     0,     0,
       0,     0,     0,     0,   123,     0,     0,     0,   124,     0,
       0,   125,     0,   126,   127,     0,     0,   335,     0,   128,
     129,   130,   131,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   117,   118,   119,   111,     0,     1,   112,
     113,   114,     0,   115,   116,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   120,   121,     0,     0,     0,     0,
       0,   122,     0,     0,     0,     0,     0,     0,     0,     0,
     123,     0,     0,     0,   124,     0,     0,   125,   255,   126,
     127,     0,     0,     0,     0,   128,   129,   130,   131,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   117,
     118,   119,   111,     0,     1,   112,   113,   114,     0,   115,
     116,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     120,   121,     0,     0,     0,     0,     0,   122,     0,     0,
       0,     0,     0,     0,     0,     0,   123,     0,     0,     0,
     124,     0,     0,   125,   759,   126,   127,     0,     0,     0,
       0,   128,   129,   130,   131,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   117,   118,   119,   111,     0,
       1,   112,   113,   114,     0,   115,   116,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   120,   121,     0,     0,
       0,     0,     0,   122,     0,     0,     0,     0,     0,     0,
       0,     0,   123,     0,     0,     0,   124,     0,     0,   125,
     838,   126,   127,     0,     0,     0,     0,   128,   129,   130,
     131,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   117,   118,   119,   111,     0,     1,   112,   113,   114,
       0,   115,   116,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   120,   121,     0,     0,     0,     0,     0,   122,
       0,     0,     0,     0,     0,     0,     0,     0,   123,     0,
       0,     0,   124,     0,     0,   125,     0,   126,   127,     0,
       0,     0,     0,   128,   129,   130,   131,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   117,   118,   119,
     111,     0,     1,   112,   113,   114,     0,   115,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   120,   121,
       0,     0,     0,     0,     0,   122,     0,     0,     0,     0,
       0,     0,     0,     0,   123,     0,     0,     0,   124,     0,
       0,   243,     0,   126,   127,     0,     0,     0,     0,   128,
     129,   130,   131,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   117,   118,   119,   111,     0,     1,   112,
     113,   114,     0,   115,   116,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   120,   121,     0,     0,     0,     0,
       0,   122,     0,     0,     0,     0,     0,     0,     0,     0,
     123,     0,     0,     0,   124,     0,     0,   245,     0,   126,
     127,     0,     0,     0,     0,   128,   129,   130,   131,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   117,
     118,   119,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     120,   121,     0,     0,     0,     0,     0,   122,     0,     0,
       1,     0,     0,     0,     0,     0,   123,     0,     0,     0,
     124,     0,     0,   253,     0,   126,   127,     0,     0,     0,
       0,   128,   129,   130,   131,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    30,     0,     0,
       0,     0,     0,     0,    31,    32,     0,     0,     0,    33,
       0,     0,    34,    35,     0,    36,     0,    37,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      38,     0,     0,     0,     0,     0,     0,     0,     0,     1,
      39,    40,    41,    42,     0,     0,     0,    43,     0,     0,
       0,     0,    77,     0,     0,    78,     0,     0,     0,     0,
      79,     0,     0,    80,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    29,    30,     0,     0,     0,
       0,     0,     0,    31,    32,     0,     0,     0,    33,     0,
       0,    34,    35,     0,    36,     0,    37,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    38,
       0,     0,     0,     0,     0,     1,     0,     0,     0,    39,
      40,    41,    42,     0,     0,     0,    43,     0,     0,     0,
       0,    77,     0,     0,    78,   171,     0,     0,     0,    79,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,     0,     0,     0,    31,
      32,     0,     0,     0,    33,     0,     0,    34,    35,     0,
      36,     0,    37,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    38,     0,     0,     0,     0,
       0,     1,     0,     0,     0,    39,    40,    41,    42,     0,
       0,     0,    43,     0,     0,     0,     0,    77,     0,     0,
     311,   171,     0,     0,     0,    79,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    30,     0,
       0,     0,     0,     0,     0,    31,    32,     0,     0,     0,
      33,     0,     0,    34,    35,     0,    36,     0,    37,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,     0,     0,     0,     0,     0,     1,     0,     0,
       0,    39,    40,    41,    42,     0,     0,     0,    43,     0,
       0,     0,     0,    77,     0,     0,   439,     0,     0,     0,
       0,   440,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    30,     0,     0,     0,     0,     0,
       0,    31,    32,     0,     0,     0,    33,     0,     0,    34,
      35,     0,    36,     0,    37,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    38,     0,     0,
       0,     0,     0,     1,     0,     0,     0,    39,    40,    41,
      42,     0,     0,     0,    43,     0,     0,     0,     0,    77,
       0,     0,   439,     0,     0,     0,     0,   452,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      30,     0,     0,     0,     0,     0,     0,    31,    32,     0,
       0,     0,    33,     0,     0,    34,    35,     0,    36,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    38,     0,     0,     0,     0,     0,     1,
       0,     0,     0,    39,    40,    41,    42,     0,     0,     0,
      43,     0,     0,     0,     0,    77,     0,     0,   311,     0,
       0,     0,     0,    79,     2,     3,     4,     5,     6,     7,
     350,   351,   352,   353,   354,   355,   356,   357,   358,   359,
     360,   361,   362,   363,    22,    23,   364,   365,    26,    27,
      28,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   367,     0,     0,     0,
       0,     0,     0,    31,    32,     0,     0,     0,    33,     0,
       0,     0,     0,     0,   368,     0,   369,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   370,
       0,     0,     0,     0,     0,     1,     0,     0,     0,    39,
      40,   371,   372,     0,     0,     0,    43,     0,     0,     0,
       0,    77,     0,     0,   439,     0,     0,     0,     0,   622,
       2,     3,     4,     5,     6,     7,   350,   351,   352,   353,
     354,   355,   356,   357,   358,   359,   360,   361,   362,   363,
      22,    23,   364,   365,    26,    27,    28,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   367,     0,     0,     0,     0,     0,     0,    31,
      32,     0,     0,     0,    33,     0,     0,     0,     0,     0,
     368,     0,   369,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   370,     1,     0,     0,     0,
       0,     0,     0,     0,     0,    39,    40,   371,   372,     0,
       0,     0,    43,     0,     0,     0,     0,    77,     0,     0,
     439,     2,     0,     0,     0,   632,     0,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    30,     0,     0,     0,     0,     0,     0,
      31,    32,     0,     0,     0,    33,     0,     0,    34,    35,
       0,    36,     0,    37,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    38,     0,     0,     0,
       0,     0,     1,     0,     0,     0,    39,    40,    41,    42,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,   311,     0,     0,     0,     0,    79,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,     0,     0,     0,    31,    32,     0,     0,
       0,    33,     0,     0,    34,    35,     0,    36,     0,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    38,     0,     1,     0,     0,     0,     0,     0,
       0,     0,    39,    40,    41,    42,     0,     0,     0,    43,
       0,     0,     0,     0,    77,     0,     0,   439,   612,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,     0,     0,     0,    31,    32,
       0,     0,     0,    33,     0,     0,    34,    35,     0,    36,
       0,    37,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    38,     0,     1,     0,     0,     0,
       0,     0,     0,     0,    39,    40,    41,    42,     0,     0,
       0,    43,     0,     0,     0,     0,     0,     0,     0,     0,
     196,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,     0,     0,     0,
      31,    32,     0,     0,     0,    33,     0,     0,    34,    35,
       0,    36,     0,    37,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    38,     0,     1,     0,
       0,     0,     0,     0,     0,     0,    39,    40,    41,    42,
       0,     0,     0,    43,     0,     0,     0,     0,     0,     0,
       0,     0,   330,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,     0,
       0,     0,    31,    32,     0,     0,     0,    33,     0,     0,
      34,    35,     0,    36,     0,    37,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    38,     0,
       1,     0,     0,     0,     0,     0,     0,     0,    39,    40,
      41,    42,     0,     0,     0,    43,     0,     0,     0,     0,
       0,     0,     0,     0,   723,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    30,     0,     0,
       0,     0,     0,     0,    31,    32,     0,     0,     0,    33,
       0,     0,    34,    35,     0,    36,     0,    37,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      38,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      39,    40,    41,    42,     0,     0,     0,    43,     0,     0,
       0,     0,    77,     0,     0,   182,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    30,     0,
       0,     0,     0,     0,     0,    31,    32,     0,     0,     0,
      33,     0,     0,    34,    35,     0,    36,     0,    37,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    38,     1,     0,     0,     0,     0,     0,     0,     0,
       0,    39,    40,    41,    42,     0,     0,     0,    43,     0,
       0,     0,     0,     0,     0,     0,   551,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,   523,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,     0,     0,     0,    31,    32,     0,     0,
       0,    33,     0,     0,    34,    35,     0,    36,     0,    37,
       0,     0,     0,     0,     0,     1,     0,     0,     0,     0,
       0,     0,    38,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    39,    40,    41,    42,     0,     0,     0,    43,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,     0,     0,     0,    31,
      32,     0,     0,     0,    33,     0,     0,    34,    35,     0,
      36,     0,    37,     0,     0,     0,     0,     0,     1,     0,
       0,     0,     0,     0,     0,    38,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    39,    40,    41,    42,     0,
       0,     0,    43,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    30,     0,     0,     0,     0,
       0,     0,    31,    32,     0,     0,     0,    33,     0,     0,
      34,    35,     0,    36,     0,    37,     0,     0,     0,     0,
       0,     1,     0,     0,     0,     0,     0,     0,    38,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    39,    40,
      41,    42,     0,     0,     0,    43,     2,     3,     4,     5,
       6,     7,   350,   351,   352,   353,   354,   355,   356,   357,
     358,   359,   360,   361,   362,   363,    22,    23,   364,   365,
      26,    27,   366,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   367,     0,
       0,     0,     0,     0,     0,    31,    32,     0,     0,     0,
      33,     0,     0,     0,     0,     0,   368,     0,   369,     0,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,   370,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    39,    40,   371,   372,     0,     0,     0,    43,     2,
       3,     4,     5,     6,     7,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,    22,
      23,   364,   365,    26,    27,    28,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   367,     0,     0,     0,     0,     0,     0,    31,    32,
       0,     0,     0,    33,     0,     0,     0,     0,     0,   368,
       0,   369,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   370,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    39,    40,   371,   372,     0,     0,
       0,    43
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-768)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,   266,   270,    93,   125,   127,    84,    50,    99,     0,
     389,   395,   204,   540,    55,     3,   139,   285,    96,     3,
     389,    17,    28,    70,   204,   251,    50,   349,    28,    96,
      72,   205,    50,   441,     3,     3,   444,    80,    72,   204,
     204,     3,   216,     3,     3,   812,    72,   126,     3,    49,
      50,    72,    73,    72,     3,   126,    62,    72,   250,    28,
     252,    73,    62,   128,     3,   106,    73,    67,    28,   148,
     686,    71,    72,    72,    73,    72,    73,   148,    78,     3,
      80,   129,    82,   128,    84,   206,   250,   135,   252,    28,
     125,   858,   218,    93,   621,    73,    96,   103,   129,    99,
     128,   191,   135,   103,   135,   140,   141,   149,     3,   109,
     110,   134,   190,   126,   147,   149,   149,   117,   144,   186,
     120,    11,   243,   190,   245,   148,   128,   218,   149,   145,
     149,   133,   253,   133,   149,     0,   136,   149,   162,   230,
     231,   232,   149,     3,   162,   129,   673,   763,   144,     3,
     149,   272,   149,   230,   231,   232,     3,   157,     3,   159,
     148,     1,   162,     3,   287,   288,   289,   129,    10,    11,
     125,   149,   172,   128,   265,   266,   125,   126,   133,   148,
     148,    73,   182,   375,   184,   306,   186,   148,   148,   148,
     190,   191,   216,   572,   573,   375,   237,   197,   204,   148,
     200,   728,   467,   572,   204,   205,   206,   207,   382,   617,
     375,   375,   534,   439,   214,   215,   216,   217,   218,   243,
     446,   145,   148,   270,   148,   249,   226,   251,   454,   253,
     230,   231,   232,   128,   312,   135,   314,   127,   285,   239,
     258,   135,   128,   243,   250,   135,   252,   147,   248,   249,
     250,   251,   252,   253,   446,   149,   640,   149,   258,   134,
     327,    70,   454,   135,   385,   125,   446,   267,   128,   295,
     296,   271,   298,   148,   454,   147,    72,    73,   125,   126,
     125,   126,   446,   134,   310,   125,   126,   148,   127,   315,
     454,   417,   318,   419,   135,   421,   135,   148,   472,   146,
     135,   148,     3,   148,   148,   114,   115,   116,   149,     3,
     310,   311,   147,   122,   149,   315,   125,   135,   318,   584,
     411,     5,   701,   135,   324,   135,   417,   327,   419,   147,
     421,   422,   423,   324,    28,   147,   427,   147,   429,   128,
     340,   464,     0,   465,   133,   422,   423,    82,   136,   439,
     427,   135,   429,   149,    48,   142,     3,   375,   382,    16,
     366,   145,   125,   387,   405,   128,   366,    77,    78,   375,
     133,     1,    82,     3,   380,   375,   467,     3,   113,   114,
     380,    28,   382,    77,    78,   385,   386,   387,   143,   389,
     127,   659,   146,     3,   485,   135,   396,   206,   135,   399,
     400,    48,    28,   113,   114,   129,   406,   147,   408,   433,
     457,   532,   129,   413,    72,   433,   129,   417,    28,   419,
      78,   421,   422,   423,   125,   126,   135,   427,   134,   429,
      77,    78,   432,   433,   243,    93,   245,   127,    48,   439,
     446,   519,   563,   129,   253,   135,   446,   127,   454,   135,
     129,    77,    78,    82,   454,   135,    82,   125,   458,   117,
     128,   270,   120,   272,   129,    77,    78,    77,    78,   469,
      82,   148,   472,   599,    99,   601,   285,   603,   604,   148,
     129,   147,   129,   129,   113,   114,   135,   113,   114,   135,
      50,   538,   516,   584,   147,   125,   126,   306,   516,   129,
       3,   113,   114,   768,   148,   135,    82,   129,   599,   129,
     601,   132,   603,   604,   540,   135,   516,   146,    78,   129,
      80,    82,   148,   146,    84,   135,   569,   128,   618,    12,
      13,   129,   133,   191,   146,   129,    96,   113,   114,   539,
     540,   135,   548,    14,    15,   129,   546,   205,   548,   207,
     550,   135,   113,   114,   137,   138,   147,   148,   558,   650,
     560,   682,   683,   684,   564,   129,   566,   134,   135,   569,
     146,   135,   572,   573,    77,    78,   385,   310,   310,    82,
     389,   134,   315,   315,   145,    50,   586,   587,     3,   292,
     293,   591,   134,   218,   129,   621,   128,     3,   128,   599,
     128,   601,   126,   603,   604,   230,   231,   232,   290,   291,
     113,   114,   659,    78,   129,    80,   299,   300,   618,    84,
     149,   621,   182,   128,   184,   133,   186,   128,     3,   126,
     190,    96,     7,     8,     9,   109,   110,   133,   129,   149,
     200,   641,   149,   126,   127,   148,   206,   673,   457,   129,
     129,   145,   310,   311,   147,   128,   216,   315,   128,   128,
     318,   128,    77,    78,   149,   147,   324,    82,   668,   147,
     129,    77,    78,   673,   129,   126,    82,   768,   134,   133,
     133,   681,   134,   804,   129,     3,   807,   149,   129,     7,
       8,     9,    60,   693,   133,   145,   696,   146,   113,   114,
     148,   701,   728,   147,   129,   145,     0,   113,   114,   709,
     125,   149,   712,   128,   134,   134,   134,   182,   134,   184,
     128,   186,   128,   532,   771,   190,   769,   133,   728,   538,
     145,     1,   134,     3,   134,   200,   147,   149,    68,   149,
       3,   206,     3,   147,     7,     8,     9,    62,   149,   558,
     149,   149,   217,   128,   563,   755,    50,   132,   133,   759,
     149,   226,   762,   572,   573,   812,   149,   327,   149,   769,
     149,   146,   303,   106,   774,   775,   301,    71,    72,   302,
     252,   439,    77,    78,    78,    79,   304,    82,   305,   769,
     587,   318,   417,   411,   419,   253,   421,   422,   423,    93,
     800,   801,   427,   803,   429,    99,   806,    77,    78,   558,
     128,   858,    82,   239,   132,   133,    77,    78,   113,   114,
     472,    82,   572,   117,   573,   385,   120,   650,   146,   485,
     485,   125,    -1,    -1,   129,   485,   396,    -1,   838,    -1,
     400,    -1,    -1,   113,   114,    -1,   406,    -1,    -1,    -1,
     659,    -1,   113,   114,   854,   125,   126,   857,   128,   129,
      -1,    -1,   327,   133,   125,   128,    -1,   128,   162,   132,
     133,    -1,   681,   682,   683,   684,    -1,   686,    -1,    -1,
      -1,    -1,   540,    -1,   693,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   701,    -1,     3,    -1,    -1,   191,   192,    -1,
      -1,   195,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   205,   472,   207,    -1,    -1,    28,    -1,    -1,    -1,
     385,    -1,   216,    -1,   218,    -1,    -1,    -1,    -1,    -1,
      -1,   396,   681,    -1,    -1,   400,   230,   231,   232,    -1,
      -1,   406,    -1,   408,   693,    -1,   755,    -1,   413,   243,
     759,    -1,   701,   762,   763,   249,    -1,   251,    -1,   253,
     618,    -1,   771,   621,   258,    77,    78,    -1,    77,    78,
      82,   265,   266,    82,   599,    -1,   601,    -1,   603,   604,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     550,   800,   801,    -1,   803,   804,    -1,   806,   807,    -1,
      -1,   113,   114,   812,   113,   114,   755,    -1,    -1,   569,
     759,    -1,    -1,   762,    -1,   673,   310,   311,    -1,   128,
      -1,   315,    -1,    -1,   318,    -1,   586,   587,    -1,   838,
     324,   591,    50,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,    -1,    -1,   854,    -1,    -1,   857,   858,
      -1,   800,   801,    -1,   803,    -1,    -1,   806,    -1,    77,
      78,    -1,    80,    -1,    -1,    28,    84,    -1,    50,    -1,
     728,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      62,    -1,    -1,    -1,    -1,   550,    -1,    -1,   382,   838,
      -1,   385,    -1,   387,    -1,   389,    78,    -1,    80,    -1,
      -1,    -1,    -1,    -1,   569,   854,    -1,    -1,   857,    91,
      -1,    74,    75,    -1,    96,    -1,    -1,    99,    -1,    -1,
      -1,   586,    -1,   417,    -1,   419,   591,   421,   422,   423,
      -1,     3,    -1,   427,    -1,   429,    -1,    -1,    -1,   433,
      -1,    -1,   105,   106,   162,   439,    -1,    -1,    -1,   709,
      -1,   169,   712,    48,    49,    -1,    -1,    -1,   121,    -1,
      -1,    -1,    -1,    -1,   182,   128,   184,    -1,   131,    -1,
      -1,    -1,    -1,   467,    -1,    -1,    -1,    -1,   472,    -1,
     162,    -1,    77,    78,    -1,    -1,    -1,    82,   206,    -1,
      -1,   485,   174,    -1,    -1,    -1,    -1,    -1,   216,   217,
     182,    -1,    -1,   185,   186,    77,    78,    -1,   190,   769,
      82,    -1,    -1,    -1,   774,   775,    -1,    -1,   113,   114,
      -1,    -1,   516,   205,   206,    -1,    -1,    -1,    -1,    -1,
     125,   249,    -1,   251,   216,    -1,   218,    -1,    -1,    -1,
     258,   113,   114,    -1,   226,   539,   540,    -1,   230,   231,
     232,    -1,    -1,   125,    -1,    -1,   128,   129,    -1,    -1,
      50,    -1,    -1,    -1,    -1,    -1,    -1,   249,    -1,   251,
      -1,    -1,    -1,    -1,    -1,   569,   258,    -1,   572,   573,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     584,    -1,    -1,   311,   312,    -1,    -1,    -1,    -1,    -1,
      -1,    50,    -1,    -1,   769,   599,    -1,   601,    28,   603,
     604,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      50,    -1,    -1,    -1,   618,    -1,    -1,   621,    77,   311,
      -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   327,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    76,   375,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   384,   385,    -1,    -1,
      -1,    -1,   162,    -1,    -1,    -1,   125,    -1,   396,   673,
      -1,    -1,   400,    -1,    -1,   105,   106,    -1,    -1,    -1,
      -1,    -1,   112,   375,    -1,   125,    -1,    -1,   380,    -1,
     382,   121,    -1,   385,    -1,   125,    -1,   701,   128,   129,
     130,   131,    -1,   162,   396,   433,   136,   137,   138,   139,
     169,   439,    -1,   441,   406,    -1,   216,   147,   446,    -1,
      -1,    -1,   162,    -1,   728,   417,   454,   419,    -1,   421,
     422,   423,    -1,    -1,    -1,   427,    -1,   429,    -1,    -1,
      -1,   433,    -1,   243,   472,   204,    -1,   439,    -1,   249,
     250,   251,   252,   253,   446,    -1,    -1,   216,   258,    -1,
     104,    50,   454,    -1,   768,   265,   266,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    -1,   216,   121,    -1,    -1,
     472,    -1,    -1,    -1,   243,    -1,    -1,    -1,   516,    50,
     249,   250,   251,   252,   253,    -1,    -1,    -1,    -1,   258,
      -1,    -1,    -1,   243,    -1,    -1,   265,   266,    -1,   249,
     250,   251,   252,   253,    -1,    -1,    -1,    -1,   258,    -1,
      -1,    -1,   550,    -1,   516,   265,   266,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    -1,
      -1,   569,    -1,    -1,    -1,    -1,    -1,    -1,   192,    -1,
      -1,   195,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   587,
      -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   162,    -1,    -1,    -1,   569,   210,   211,
     212,   213,   382,    -1,    -1,   385,    -1,   387,    -1,   389,
      -1,    -1,   236,    -1,    -1,   587,    -1,    -1,    -1,    -1,
      -1,   162,    -1,    -1,    -1,    -1,    -1,   599,    -1,   601,
      -1,   603,   604,    -1,    -1,   204,   375,    -1,    -1,    -1,
      -1,    -1,    -1,   382,    -1,   384,   385,   216,   387,    -1,
     389,    79,    -1,   433,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   382,    -1,    -1,   385,   446,   387,    -1,   389,
      -1,    -1,    -1,    -1,   454,   216,   104,   146,    -1,    -1,
     249,   250,   251,   252,    -1,    -1,    -1,   467,    -1,    -1,
     118,    -1,   472,   121,   433,    -1,   265,   266,    -1,    -1,
      -1,   709,   243,    -1,    -1,   485,    -1,   446,   249,    -1,
     251,    -1,   253,   433,    -1,   454,    -1,   258,    -1,    -1,
      -1,    -1,    -1,    -1,   265,   266,   446,   699,   467,    -1,
      -1,    -1,    -1,   472,   454,    -1,   516,    -1,    -1,    -1,
     712,    -1,    -1,    -1,    -1,    -1,   485,   467,    -1,    -1,
      -1,     1,   472,     3,     4,     5,     6,    -1,     8,     9,
      -1,   769,    -1,    -1,   192,   485,    -1,   195,    -1,    -1,
      -1,    -1,    -1,   397,    -1,    -1,    -1,   516,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   569,
      -1,    -1,   572,   573,    -1,    -1,   516,   769,    -1,    -1,
      -1,   425,    -1,    -1,   584,    -1,   375,    -1,   236,    -1,
      -1,    -1,    -1,   382,    -1,    -1,   440,    -1,   387,    -1,
     389,    -1,    -1,    -1,    74,    75,    76,    -1,   452,    -1,
     569,    -1,    -1,   572,   573,    -1,    -1,   265,   266,    -1,
      -1,   382,    -1,    -1,   385,   584,   387,    -1,   389,   569,
      -1,    -1,   572,   573,    -1,   105,   106,    -1,    -1,    -1,
      -1,    -1,   112,    -1,   584,    -1,    -1,    -1,   480,    -1,
      -1,   121,    -1,    -1,    -1,   125,    -1,   446,   128,   129,
     130,   131,    -1,    -1,    -1,   454,   136,   137,   138,   139,
      -1,    -1,   433,    -1,    -1,    -1,    -1,   147,   467,    -1,
      -1,    -1,    -1,   472,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   485,    -1,    -1,    -1,
      -1,   701,    -1,    -1,    -1,    -1,   467,    -1,    -1,   553,
      -1,   472,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   485,    -1,    -1,   516,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   701,    -1,    -1,   589,    -1,   395,    -1,   397,
      -1,    -1,    -1,    -1,    -1,   516,    -1,    -1,    -1,    -1,
      -1,   701,    -1,    -1,    -1,    -1,    -1,    -1,   768,    -1,
      -1,    -1,    -1,    -1,    -1,   619,    -1,   425,   622,    -1,
     569,    -1,    -1,   572,   573,    -1,    -1,   631,   632,    -1,
      -1,    -1,   440,    -1,    -1,   584,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   452,    -1,    -1,    -1,   569,   768,
      -1,   572,   573,    -1,    -1,    -1,    -1,    -1,    -1,   467,
      -1,    -1,    -1,   584,    -1,    -1,    -1,    -1,   768,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   485,   670,   671,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   729,    -1,    -1,    -1,   733,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   553,    -1,    -1,    -1,    -1,
      -1,    -1,   701,    -1,    -1,    -1,   748,   749,    -1,   751,
     752,    -1,   766,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   777,    -1,    -1,   584,    -1,    -1,    -1,
     701,   589,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,   787,    -1,   789,    -1,    -1,
      -1,    -1,    -1,    -1,   796,   797,    -1,    -1,    -1,    28,
      -1,   619,    -1,    -1,   622,    -1,    -1,    -1,    -1,   768,
      -1,    -1,    -1,   631,   632,    -1,    -1,    -1,    -1,    -1,
      -1,   823,   640,   825,    -1,   827,    -1,   829,    -1,    -1,
      -1,    -1,   650,    -1,    -1,    -1,    -1,   768,    -1,    -1,
      -1,    -1,    -1,   661,    -1,    74,    75,    76,   850,    -1,
     852,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   105,   106,    -1,    -1,
      -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,
      -1,   130,   131,    -1,    -1,    -1,    -1,   136,   137,   138,
     139,   729,    -1,    -1,    -1,   733,    -1,    -1,    -1,   148,
     149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   766,    -1,
     768,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   777,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    -1,
      -1,    -1,    70,    -1,    -1,    -1,    74,    75,    76,    77,
      78,    -1,    80,    -1,    82,    -1,    -1,    85,    86,    -1,
      88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,
      -1,    -1,    -1,    -1,   112,   113,   114,   115,   116,    -1,
      -1,    -1,   120,   121,    -1,    -1,    -1,   125,    -1,    -1,
     128,    -1,   130,   131,    -1,    -1,    -1,    -1,   136,   137,
     138,   139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   147,
     148,   149,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    74,    75,    76,    77,    78,
      -1,    80,    -1,    82,    -1,    -1,    85,    86,    -1,    88,
      -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,    -1,
      -1,    -1,    -1,   112,   113,   114,   115,   116,    -1,    -1,
      -1,   120,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,
      -1,   130,   131,    -1,    -1,    -1,    -1,   136,   137,   138,
     139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   147,   148,
     149,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    -1,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    -1,    -1,    -1,
      70,    -1,    -1,    -1,    74,    75,    76,    77,    78,    -1,
      80,    -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,
      90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,
      -1,    -1,   112,   113,   114,   115,   116,    -1,    -1,    -1,
     120,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,
     130,   131,    -1,    -1,    -1,    -1,   136,   137,   138,   139,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   147,   148,   149,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      -1,    -1,    -1,    74,    75,    76,    77,    78,    -1,    -1,
      -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,   116,    -1,    -1,    -1,   120,
     121,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,   130,
     131,    -1,    -1,    -1,    -1,   136,   137,   138,   139,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   147,   148,   149,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    74,    75,    76,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,    -1,    -1,   128,    -1,   130,   131,
      -1,    -1,    -1,    -1,   136,   137,   138,   139,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,   148,   149,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,
      -1,    74,    75,    76,    77,    78,    -1,    -1,    -1,    82,
      -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,   116,    -1,    -1,    -1,   120,   121,    -1,
      -1,    -1,   125,    -1,    -1,   128,    -1,   130,   131,    -1,
      -1,    -1,    -1,   136,   137,   138,   139,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   147,   148,   149,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,
      74,    75,    76,    77,    78,    -1,    -1,    -1,    82,    -1,
      -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,   113,
     114,   115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,
      -1,   125,    -1,    -1,   128,    -1,   130,   131,    -1,    -1,
      -1,    -1,   136,   137,   138,   139,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   147,   148,   149,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    74,
      75,    76,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,
      85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,
     125,    -1,    -1,   128,    -1,   130,   131,    -1,    -1,    -1,
      -1,   136,   137,   138,   139,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   147,   148,   149,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    74,    75,
      76,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,
     106,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,
     116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,
      -1,    -1,   128,    -1,   130,   131,    -1,    -1,    -1,    -1,
     136,   137,   138,   139,     1,    -1,     3,     4,     5,    -1,
      -1,   147,   148,   149,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    85,    86,
      -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,    -1,
      -1,   128,    -1,   130,   131,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,
      -1,    77,    78,    -1,    -1,    81,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,
     106,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,
      -1,    -1,   128,    -1,   130,   131,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    -1,   149,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    70,    71,    -1,    -1,    74,
      75,    -1,    77,    78,    -1,    -1,    81,    82,    -1,    -1,
      85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
     115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,
     125,    -1,    -1,   128,    -1,   130,   131,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   147,    -1,   149,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    71,    -1,    -1,
      74,    75,    -1,    77,    78,    -1,    -1,    81,    82,    -1,
      -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,   105,   106,    -1,    -1,    -1,    -1,    -1,    -1,   113,
     114,   115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,
      -1,   125,    -1,    -1,   128,    -1,   130,   131,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   147,    -1,   149,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,    -1,
      -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,    82,
      -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,    -1,
     113,   114,   115,   116,    -1,    -1,    -1,   120,   121,    -1,
      -1,    -1,   125,    -1,    -1,   128,    -1,   130,   131,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,    -1,    -1,   128,    -1,   130,   131,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      71,    -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,
      81,    82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,
      -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,
     121,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,   130,
     131,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      70,    71,    -1,    -1,    74,    75,    -1,    77,    78,    -1,
      -1,    81,    82,    -1,    -1,    85,    86,    -1,    88,    -1,
      90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,
      -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,
     120,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,
     130,   131,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   147,    -1,   149,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    70,    71,    -1,    -1,    74,    75,    -1,    77,    78,
      -1,    -1,    81,    82,    -1,    -1,    85,    86,    -1,    88,
      -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,    -1,
      -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,
      -1,   120,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,
      -1,   130,   131,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   147,    -1,
     149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,    77,
      78,    -1,    -1,    81,    82,    -1,    -1,    85,    86,    -1,
      88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,
      -1,    -1,   120,   121,    -1,    -1,    -1,   125,    -1,    -1,
     128,    -1,   130,   131,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   147,
      -1,   149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    85,    86,
      -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,    -1,
      -1,   128,    -1,   130,   131,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,
      -1,    77,    78,    -1,    -1,    81,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,
     106,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,
      -1,    -1,   128,    -1,   130,   131,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    -1,   149,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    -1,    -1,    -1,    70,    -1,    -1,    -1,    74,
      75,    76,    77,    78,    -1,    80,    -1,    82,    -1,    -1,
      85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,
     125,    -1,    -1,   128,    -1,   130,   131,    -1,    -1,    -1,
      -1,   136,   137,   138,   139,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   147,   148,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    28,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,
      28,    -1,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,   105,
     106,   128,    -1,   130,   131,    -1,   112,    -1,    -1,   136,
     137,   138,   139,    -1,    -1,   121,    -1,    -1,    -1,   125,
     147,   148,   128,   129,   130,   131,    74,    75,    76,    -1,
     136,   137,   138,   139,    -1,    -1,     1,    -1,     3,     4,
       5,     6,   148,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,    -1,
      -1,    -1,    -1,    28,   112,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,
     128,    -1,   130,   131,    -1,    -1,    -1,    -1,   136,   137,
     138,   139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     148,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,
     125,    -1,    -1,   128,    -1,   130,   131,    -1,    -1,    -1,
      -1,   136,   137,   138,   139,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,   148,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    70,    71,    -1,    -1,    74,    75,
      -1,    77,    78,    -1,    -1,    81,    82,    -1,    -1,    85,
      86,    28,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,
     106,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,
      -1,    -1,   128,    -1,   130,   131,    -1,    74,    75,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,     3,    -1,   125,    -1,
      -1,   128,    -1,   130,   131,    -1,    -1,    -1,    -1,   136,
     137,   138,   139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,
      77,    78,    -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,    -1,    -1,    -1,     3,   125,    -1,
      -1,   128,    -1,    -1,    -1,    -1,   133,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   148,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,    -1,    -1,     3,    -1,   125,
      -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,
      -1,   147,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,    -1,    -1,     3,    -1,   125,
      -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,
      -1,     1,   128,     3,     4,     5,     6,   133,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     146,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      70,    -1,    -1,    -1,    74,    75,    76,    77,    78,    -1,
      -1,    -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,
      90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,
      -1,    -1,   112,   113,   114,   115,   116,    -1,    -1,    -1,
     120,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,
     130,   131,    -1,    -1,    -1,    -1,   136,   137,   138,   139,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      -1,    -1,    -1,    74,    75,    76,    77,    78,    -1,    -1,
      -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,   116,    -1,    -1,    -1,    -1,
     121,    -1,    -1,    -1,   125,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,   136,   137,   138,   139,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    74,    75,    76,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,   116,    -1,    28,    -1,    -1,   121,
      -1,    -1,    -1,   125,    -1,    -1,   128,   129,   130,   131,
      -1,    -1,    -1,    -1,   136,   137,   138,   139,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    76,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,   121,
      -1,    -1,    -1,   125,    -1,    -1,   128,   129,   130,   131,
      74,    75,    76,    -1,   136,   137,   138,   139,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   105,   106,    -1,    -1,    28,    -1,    -1,   112,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,
      -1,   125,    -1,    -1,   128,    -1,   130,   131,    -1,    -1,
     134,    -1,   136,   137,   138,   139,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    76,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,
      -1,    -1,   125,    -1,    -1,   128,    -1,   130,   131,    -1,
      -1,   134,    -1,   136,   137,   138,   139,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   105,   106,
      -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    -1,
      -1,   128,    -1,   130,   131,    -1,    -1,   134,    -1,   136,
     137,   138,   139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    76,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     121,    -1,    -1,    -1,   125,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,   136,   137,   138,   139,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    76,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,
     125,    -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,
      -1,   136,   137,   138,   139,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    76,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,   105,   106,    -1,    -1,
      -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,   128,
     129,   130,   131,    -1,    -1,    -1,    -1,   136,   137,   138,
     139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    76,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,
      -1,    -1,   125,    -1,    -1,   128,    -1,   130,   131,    -1,
      -1,    -1,    -1,   136,   137,   138,   139,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   105,   106,
      -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    -1,
      -1,   128,    -1,   130,   131,    -1,    -1,    -1,    -1,   136,
     137,   138,   139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    76,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     121,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,   130,
     131,    -1,    -1,    -1,    -1,   136,   137,   138,   139,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,
     125,    -1,    -1,   128,    -1,   130,   131,    -1,    -1,    -1,
      -1,   136,   137,   138,   139,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,
      -1,    -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,
      -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
     113,   114,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,
      -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,
     133,    -1,    -1,   136,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    69,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,
      -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   113,
     114,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,   125,    -1,    -1,   128,   129,    -1,    -1,    -1,   133,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,
      78,    -1,    -1,    -1,    82,    -1,    -1,    85,    86,    -1,
      88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   113,   114,   115,   116,    -1,
      -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    -1,    -1,
     128,   129,    -1,    -1,    -1,   133,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,    -1,
      -1,    -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,
      -1,   133,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,
      86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,
      -1,    -1,   128,    -1,    -1,    -1,    -1,   133,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      70,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    -1,
      -1,    -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,
      90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,
     120,    -1,    -1,    -1,    -1,   125,    -1,    -1,   128,    -1,
      -1,    -1,    -1,   133,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,
      -1,    -1,    -1,    -1,    88,    -1,    90,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   113,
     114,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,   133,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,
      78,    -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,    -1,
      88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,
      -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    -1,    -1,
     128,    28,    -1,    -1,    -1,   133,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,
      77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,    86,
      -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   125,    -1,
      -1,   128,    -1,    -1,    -1,    -1,   133,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,
      -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,
      -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,
      -1,    -1,    -1,    -1,   125,    -1,    -1,   128,   129,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,
      -1,    -1,    -1,    82,    -1,    -1,    85,    86,    -1,    88,
      -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,
      -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     129,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    70,    -1,    -1,    -1,    -1,    -1,    -1,
      77,    78,    -1,    -1,    -1,    82,    -1,    -1,    85,    86,
      -1,    88,    -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   129,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    70,    -1,    -1,    -1,    -1,
      -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,
      85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
     115,   116,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,
      -1,    -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,
      -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     113,   114,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,
      -1,    -1,   125,    -1,    -1,   128,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   128,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,
      -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,
      -1,    82,    -1,    -1,    85,    86,    -1,    88,    -1,    90,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,
      78,    -1,    -1,    -1,    82,    -1,    -1,    85,    86,    -1,
      88,    -1,    90,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,
      -1,    -1,   120,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,
      -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,
      85,    86,    -1,    88,    -1,    90,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
     115,   116,    -1,    -1,    -1,   120,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    90,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,
      -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,    -1,    88,
      -1,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,
      -1,   120
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    69,
      70,    77,    78,    82,    85,    86,    88,    90,   103,   113,
     114,   115,   116,   120,   151,   152,   153,   154,   155,   160,
     190,   191,   196,   197,   198,   199,   203,   204,   205,   206,
     208,   209,   215,   223,   224,   242,   273,   148,   155,   160,
     128,   128,   126,     1,   125,   126,   160,   125,   128,   133,
     136,   151,   160,   196,   197,   205,   206,   208,   224,   227,
     229,   231,   232,   234,   235,   236,   239,   128,   203,   148,
     154,   155,   160,   197,   145,     0,   160,   225,   226,   148,
     148,     1,     4,     5,     6,     8,     9,    74,    75,    76,
     105,   106,   112,   121,   125,   128,   130,   131,   136,   137,
     138,   139,   153,   160,   161,   162,   163,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   177,   178,
     179,   180,   181,   182,   260,   263,   153,   160,   153,   160,
     167,   172,   190,   210,   211,   212,   213,   214,   205,   238,
     239,   129,   160,   229,   231,   240,   241,   242,   134,   153,
     181,   185,   128,   160,   197,   231,   239,   227,   232,   235,
     239,   128,   133,   197,   128,   133,   129,   160,   240,   243,
     197,   227,   236,   128,    71,    81,   128,   130,   147,   149,
     156,   157,   158,   159,   160,   163,   190,   197,   216,   217,
     218,   219,   220,   232,   233,   235,   239,   262,   263,   265,
     148,   148,   148,   155,   160,   185,   146,   199,   203,   135,
     149,   225,   225,   128,   167,   128,   167,   167,   160,   190,
     185,   190,   185,   128,   167,   129,   182,   184,   187,   205,
     206,   208,   224,   244,   260,   148,   148,     7,     8,     9,
     128,   132,   133,   160,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   146,   183,   169,   125,   140,   141,
     137,   138,    10,    11,   172,    12,    13,   126,   127,    14,
      15,   136,   142,   143,    16,    17,   144,   129,   129,   129,
     146,   128,   197,   229,   239,   146,    11,   127,   135,   205,
     239,   129,   129,   129,   135,   134,   134,   239,   227,   236,
     129,   240,   134,   153,   185,   134,   153,   185,   129,   129,
     135,     3,    28,    48,    77,    78,   129,   200,   201,   202,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    50,    51,    54,    70,    88,    90,
     103,   115,   116,   155,   160,   192,   196,   205,   207,   209,
     215,   223,   190,   233,   125,   128,   160,   190,   148,   254,
     255,   255,   255,   147,   255,   146,   128,   145,   147,   160,
     197,   221,   222,   232,   233,   237,   239,   235,   239,   149,
     220,   135,   147,   197,   235,   147,   147,   216,   149,   216,
     149,   216,   148,   148,   185,   146,   226,   147,   149,   147,
     149,   151,   160,   188,   205,   206,   208,   224,   245,   128,
     133,   197,   228,   230,   239,   160,   193,   196,   205,   207,
     208,   224,   133,   230,   193,   245,   129,   135,   160,   205,
     206,   208,   224,   229,   129,   132,   147,   148,   149,   163,
     164,   181,   189,   196,   205,   206,   208,   224,   247,   264,
     266,   267,   268,   269,   270,   271,   272,   149,   272,   160,
     129,   164,   165,   182,   160,   184,   164,   182,   169,   169,
     169,   170,   170,   171,   171,   172,   172,   172,   174,   174,
     175,   176,   177,   178,   179,   184,   190,   211,   212,   239,
     211,   212,   213,    55,   242,   129,   134,   134,   134,   134,
     160,   129,   128,   129,   135,   201,   155,   160,   128,   128,
     126,   148,   160,   196,   205,   207,   229,   160,   197,   233,
     197,   128,   149,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    80,   147,   160,   184,   186,   189,
     249,   250,   251,   252,   253,   255,   256,   257,   258,   259,
     261,   247,   129,   185,   148,   232,   239,   135,   147,   145,
     203,   197,   232,   235,   217,   235,   149,   149,   149,   216,
     149,   216,   185,   216,   216,   151,   205,   206,   208,   224,
     229,   129,   129,   230,   240,   185,   228,   239,   128,   133,
     228,   126,   133,   160,   196,   205,   207,   208,   224,   230,
     185,   133,   133,   230,   129,   182,   169,   260,   149,   272,
     146,   160,   196,   205,   206,   208,   224,   233,   237,   255,
     135,   147,   147,   267,   269,   270,   149,   149,   129,   135,
     134,   145,   229,   184,   129,   201,   182,   153,   160,   214,
      72,    73,   149,   126,   148,   148,   160,   155,   160,   129,
     185,   145,   128,   128,   128,   249,   128,   160,   147,   147,
     147,   184,   160,   145,   147,   147,   160,   194,   195,   231,
     186,   252,   186,   249,   149,   147,   149,   272,   232,   197,
     222,   232,   239,   185,   232,   149,   149,   149,   149,   129,
     129,   134,   228,   129,   240,   185,   214,   185,   126,   133,
     134,   185,   185,   133,   149,   247,   268,   164,   182,   181,
     129,   129,   129,   129,   127,   255,   255,   214,    72,    73,
     149,    72,    73,   149,   148,   145,   249,   184,   184,   129,
     184,    60,   129,   256,   147,   147,   146,   249,   148,   135,
     147,   146,   149,   232,   239,   197,   232,   145,   129,   134,
     127,   134,   214,   185,   134,   134,   185,    73,   149,    72,
     149,   127,   255,   255,   255,   255,    72,    73,   149,   249,
     129,   129,   249,   129,   128,   249,   129,   256,   185,   149,
     272,   195,   148,   182,   246,   232,   232,   185,   127,   134,
     134,   255,   255,    73,   149,    72,   149,    73,   149,    72,
     149,   255,   255,   249,   249,   249,   184,   249,   129,   184,
     147,   149,   246,   248,   149,   149,   255,   255,   255,   255,
      73,   149,    72,   149,    68,   129,   249,   129,   135,   149,
     149,   149,   149,   149,   255,   255,   249,   147,   249,   149,
     246,   149,   149
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
      case 151: /* guess_type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4007 "type.ec"
        break;
      case 153: /* type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4014 "type.ec"
        break;
      case 154: /* base_strict_type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4021 "type.ec"
        break;
      case 155: /* strict_type */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4028 "type.ec"
        break;
      case 156: /* class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4035 "type.ec"
        break;
      case 157: /* constructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4042 "type.ec"
        break;
      case 158: /* destructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4049 "type.ec"
        break;
      case 159: /* virtual_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4056 "type.ec"
        break;
      case 160: /* identifier */
/* Line 1393 of yacc.c  */
#line 170 "type.y"
        { FreeIdentifier(((*yyvaluep).id)); };
/* Line 1393 of yacc.c  */
#line 4063 "type.ec"
        break;
      case 161: /* primary_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4070 "type.ec"
        break;
      case 163: /* postfix_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4077 "type.ec"
        break;
      case 165: /* argument_expression_list */
/* Line 1393 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 4084 "type.ec"
        break;
      case 167: /* unary_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4091 "type.ec"
        break;
      case 169: /* cast_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4098 "type.ec"
        break;
      case 170: /* multiplicative_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4105 "type.ec"
        break;
      case 171: /* additive_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4112 "type.ec"
        break;
      case 172: /* shift_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4119 "type.ec"
        break;
      case 174: /* relational_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4126 "type.ec"
        break;
      case 175: /* equality_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4133 "type.ec"
        break;
      case 176: /* and_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4140 "type.ec"
        break;
      case 177: /* exclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4147 "type.ec"
        break;
      case 178: /* inclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4154 "type.ec"
        break;
      case 179: /* logical_and_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4161 "type.ec"
        break;
      case 180: /* logical_or_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4168 "type.ec"
        break;
      case 181: /* conditional_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4175 "type.ec"
        break;
      case 182: /* assignment_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4182 "type.ec"
        break;
      case 184: /* expression */
/* Line 1393 of yacc.c  */
#line 207 "type.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 4189 "type.ec"
        break;
      case 185: /* constant_expression */
/* Line 1393 of yacc.c  */
#line 172 "type.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 4196 "type.ec"
        break;
      case 186: /* declaration */
/* Line 1393 of yacc.c  */
#line 193 "type.y"
        { FreeDeclaration(((*yyvaluep).declaration)); };
/* Line 1393 of yacc.c  */
#line 4203 "type.ec"
        break;
      case 187: /* specifier_qualifier_list */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4210 "type.ec"
        break;
      case 188: /* guess_specifier_qualifier_list */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4217 "type.ec"
        break;
      case 189: /* declaration_specifiers */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4224 "type.ec"
        break;
      case 190: /* guess_declaration_specifiers */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4231 "type.ec"
        break;
      case 194: /* init_declarator_list */
/* Line 1393 of yacc.c  */
#line 214 "type.y"
        { FreeList(((*yyvaluep).list), FreeInitDeclarator); };
/* Line 1393 of yacc.c  */
#line 4238 "type.ec"
        break;
      case 195: /* init_declarator */
/* Line 1393 of yacc.c  */
#line 188 "type.y"
        { FreeInitDeclarator(((*yyvaluep).initDeclarator)); };
/* Line 1393 of yacc.c  */
#line 4245 "type.ec"
        break;
      case 196: /* storage_class_specifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4252 "type.ec"
        break;
      case 197: /* ext_decl */
/* Line 1393 of yacc.c  */
#line 224 "type.y"
        { FreeExtDecl(((*yyvaluep).extDecl)); };
/* Line 1393 of yacc.c  */
#line 4259 "type.ec"
        break;
      case 199: /* multi_attrib */
/* Line 1393 of yacc.c  */
#line 227 "type.y"
        { FreeList(((*yyvaluep).list), FreeAttrib); };
/* Line 1393 of yacc.c  */
#line 4266 "type.ec"
        break;
      case 200: /* attribute_word */
/* Line 1393 of yacc.c  */
#line 204 "type.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 4273 "type.ec"
        break;
      case 201: /* attribute */
/* Line 1393 of yacc.c  */
#line 225 "type.y"
        { FreeAttribute(((*yyvaluep).attribute)); };
/* Line 1393 of yacc.c  */
#line 4280 "type.ec"
        break;
      case 202: /* attribs_list */
/* Line 1393 of yacc.c  */
#line 226 "type.y"
        { FreeList(((*yyvaluep).list), FreeAttribute); };
/* Line 1393 of yacc.c  */
#line 4287 "type.ec"
        break;
      case 203: /* attrib */
/* Line 1393 of yacc.c  */
#line 223 "type.y"
        { FreeAttrib(((*yyvaluep).attrib)); };
/* Line 1393 of yacc.c  */
#line 4294 "type.ec"
        break;
      case 204: /* ext_storage */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4301 "type.ec"
        break;
      case 205: /* type_qualifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4308 "type.ec"
        break;
      case 206: /* type_specifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4315 "type.ec"
        break;
      case 207: /* strict_type_specifier */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4322 "type.ec"
        break;
      case 208: /* struct_or_union_specifier_compound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4329 "type.ec"
        break;
      case 209: /* struct_or_union_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4336 "type.ec"
        break;
      case 210: /* template_datatype */
/* Line 1393 of yacc.c  */
#line 222 "type.y"
        { FreeTemplateDataType(((*yyvaluep).templateDatatype)); };
/* Line 1393 of yacc.c  */
#line 4343 "type.ec"
        break;
      case 211: /* template_type_argument */
/* Line 1393 of yacc.c  */
#line 221 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1393 of yacc.c  */
#line 4350 "type.ec"
        break;
      case 212: /* template_expression_argument */
/* Line 1393 of yacc.c  */
#line 221 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1393 of yacc.c  */
#line 4357 "type.ec"
        break;
      case 213: /* template_argument */
/* Line 1393 of yacc.c  */
#line 221 "type.y"
        { FreeTemplateArgument(((*yyvaluep).templateArgument)); };
/* Line 1393 of yacc.c  */
#line 4364 "type.ec"
        break;
      case 216: /* struct_declaration_list */
/* Line 1393 of yacc.c  */
#line 217 "type.y"
        { FreeList(((*yyvaluep).list), FreeClassDef); };
/* Line 1393 of yacc.c  */
#line 4371 "type.ec"
        break;
      case 217: /* default_property */
/* Line 1393 of yacc.c  */
#line 197 "type.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 4378 "type.ec"
        break;
      case 218: /* default_property_list */
/* Line 1393 of yacc.c  */
#line 218 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4385 "type.ec"
        break;
      case 219: /* property */
/* Line 1393 of yacc.c  */
#line 205 "type.y"
        { FreeProperty(((*yyvaluep).prop)); };
/* Line 1393 of yacc.c  */
#line 4392 "type.ec"
        break;
      case 220: /* struct_declaration */
/* Line 1393 of yacc.c  */
#line 203 "type.y"
        { FreeClassDef(((*yyvaluep).classDef)); };
/* Line 1393 of yacc.c  */
#line 4399 "type.ec"
        break;
      case 221: /* struct_declarator_list */
/* Line 1393 of yacc.c  */
#line 211 "type.y"
        { FreeList(((*yyvaluep).list), FreeDeclarator); };
/* Line 1393 of yacc.c  */
#line 4406 "type.ec"
        break;
      case 222: /* struct_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4413 "type.ec"
        break;
      case 223: /* enum_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4420 "type.ec"
        break;
      case 224: /* enum_specifier_compound */
/* Line 1393 of yacc.c  */
#line 178 "type.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 4427 "type.ec"
        break;
      case 225: /* enumerator_list */
/* Line 1393 of yacc.c  */
#line 208 "type.y"
        { FreeList(((*yyvaluep).list), FreeEnumerator); };
/* Line 1393 of yacc.c  */
#line 4434 "type.ec"
        break;
      case 226: /* enumerator */
/* Line 1393 of yacc.c  */
#line 181 "type.y"
        { FreeEnumerator(((*yyvaluep).enumerator)); };
/* Line 1393 of yacc.c  */
#line 4441 "type.ec"
        break;
      case 227: /* direct_abstract_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4448 "type.ec"
        break;
      case 228: /* direct_abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4455 "type.ec"
        break;
      case 229: /* abstract_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4462 "type.ec"
        break;
      case 230: /* abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4469 "type.ec"
        break;
      case 231: /* declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4476 "type.ec"
        break;
      case 232: /* direct_declarator_nofunction */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4483 "type.ec"
        break;
      case 233: /* declarator_function */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4490 "type.ec"
        break;
      case 234: /* direct_declarator_function_start */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4497 "type.ec"
        break;
      case 235: /* direct_declarator_function */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4504 "type.ec"
        break;
      case 236: /* direct_declarator */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4511 "type.ec"
        break;
      case 237: /* declarator_nofunction */
/* Line 1393 of yacc.c  */
#line 182 "type.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 4518 "type.ec"
        break;
      case 238: /* type_qualifier_list */
/* Line 1393 of yacc.c  */
#line 209 "type.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 4525 "type.ec"
        break;
      case 239: /* pointer */
/* Line 1393 of yacc.c  */
#line 171 "type.y"
        { FreePointer(((*yyvaluep).pointer)); };
/* Line 1393 of yacc.c  */
#line 4532 "type.ec"
        break;
      case 240: /* parameter_type_list */
/* Line 1393 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4539 "type.ec"
        break;
      case 241: /* parameter_list */
/* Line 1393 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4546 "type.ec"
        break;
      case 242: /* parameter_declaration */
/* Line 1393 of yacc.c  */
#line 189 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4553 "type.ec"
        break;
      case 243: /* identifier_list */
/* Line 1393 of yacc.c  */
#line 215 "type.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4560 "type.ec"
        break;
      case 244: /* type_name */
/* Line 1393 of yacc.c  */
#line 189 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4567 "type.ec"
        break;
      case 245: /* guess_type_name */
/* Line 1393 of yacc.c  */
#line 189 "type.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4574 "type.ec"
        break;
      case 246: /* initializer */
/* Line 1393 of yacc.c  */
#line 187 "type.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4581 "type.ec"
        break;
      case 247: /* initializer_condition */
/* Line 1393 of yacc.c  */
#line 187 "type.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4588 "type.ec"
        break;
      case 248: /* initializer_list */
/* Line 1393 of yacc.c  */
#line 213 "type.y"
        { FreeList(((*yyvaluep).list), FreeInitializer); };
/* Line 1393 of yacc.c  */
#line 4595 "type.ec"
        break;
      case 249: /* statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4602 "type.ec"
        break;
      case 250: /* labeled_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4609 "type.ec"
        break;
      case 251: /* declaration_list */
/* Line 1393 of yacc.c  */
#line 212 "type.y"
        { FreeList(((*yyvaluep).list), FreeDeclaration); };
/* Line 1393 of yacc.c  */
#line 4616 "type.ec"
        break;
      case 252: /* statement_list */
/* Line 1393 of yacc.c  */
#line 216 "type.y"
        { FreeList(((*yyvaluep).list), FreeStatement); };
/* Line 1393 of yacc.c  */
#line 4623 "type.ec"
        break;
      case 253: /* compound_inside */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4630 "type.ec"
        break;
      case 254: /* compound_start */
/* Line 1393 of yacc.c  */
#line 220 "type.y"
        { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); };
/* Line 1393 of yacc.c  */
#line 4637 "type.ec"
        break;
      case 255: /* compound_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4644 "type.ec"
        break;
      case 256: /* expression_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4651 "type.ec"
        break;
      case 257: /* selection_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4658 "type.ec"
        break;
      case 258: /* iteration_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4665 "type.ec"
        break;
      case 259: /* jump_statement */
/* Line 1393 of yacc.c  */
#line 190 "type.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4672 "type.ec"
        break;
      case 260: /* string_literal */
/* Line 1393 of yacc.c  */
#line 204 "type.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 4679 "type.ec"
        break;
      case 261: /* instantiation_named */
/* Line 1393 of yacc.c  */
#line 195 "type.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4686 "type.ec"
        break;
      case 263: /* instantiation_unnamed */
/* Line 1393 of yacc.c  */
#line 195 "type.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4693 "type.ec"
        break;
      case 265: /* class_function_definition */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4700 "type.ec"
        break;
      case 266: /* instance_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4707 "type.ec"
        break;
      case 267: /* instance_class_function_definition */
/* Line 1393 of yacc.c  */
#line 199 "type.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4714 "type.ec"
        break;
      case 268: /* data_member_initialization */
/* Line 1393 of yacc.c  */
#line 197 "type.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 4721 "type.ec"
        break;
      case 269: /* data_member_initialization_list */
/* Line 1393 of yacc.c  */
#line 218 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4728 "type.ec"
        break;
      case 270: /* data_member_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 218 "type.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4735 "type.ec"
        break;
      case 271: /* members_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 219 "type.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4742 "type.ec"
        break;
      case 272: /* members_initialization_list */
/* Line 1393 of yacc.c  */
#line 219 "type.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4749 "type.ec"
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
    { (yyval.specifier) = MkSpecifier(BF16); }
    break;

  case 232:
/* Line 1787 of yacc.c  */
#line 824 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 233:
/* Line 1787 of yacc.c  */
#line 825 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 234:
/* Line 1787 of yacc.c  */
#line 826 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 235:
/* Line 1787 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 236:
/* Line 1787 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 237:
/* Line 1787 of yacc.c  */
#line 829 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 238:
/* Line 1787 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 239:
/* Line 1787 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 240:
/* Line 1787 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 244:
/* Line 1787 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); }
    break;

  case 245:
/* Line 1787 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 246:
/* Line 1787 of yacc.c  */
#line 838 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); }
    break;

  case 247:
/* Line 1787 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 248:
/* Line 1787 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); }
    break;

  case 249:
/* Line 1787 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); }
    break;

  case 250:
/* Line 1787 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 251:
/* Line 1787 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 252:
/* Line 1787 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 253:
/* Line 1787 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 254:
/* Line 1787 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 255:
/* Line 1787 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 256:
/* Line 1787 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 257:
/* Line 1787 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 258:
/* Line 1787 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT16); }
    break;

  case 259:
/* Line 1787 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifier(BF16); }
    break;

  case 260:
/* Line 1787 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 261:
/* Line 1787 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 262:
/* Line 1787 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 263:
/* Line 1787 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 264:
/* Line 1787 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 265:
/* Line 1787 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 266:
/* Line 1787 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 267:
/* Line 1787 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 268:
/* Line 1787 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 272:
/* Line 1787 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); }
    break;

  case 273:
/* Line 1787 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 274:
/* Line 1787 of yacc.c  */
#line 869 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); }
    break;

  case 275:
/* Line 1787 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 276:
/* Line 1787 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 277:
/* Line 1787 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); }
    break;

  case 278:
/* Line 1787 of yacc.c  */
#line 877 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); }
    break;

  case 279:
/* Line 1787 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); }
    break;

  case 280:
/* Line 1787 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 281:
/* Line 1787 of yacc.c  */
#line 882 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); }
    break;

  case 282:
/* Line 1787 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); }
    break;

  case 283:
/* Line 1787 of yacc.c  */
#line 884 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); }
    break;

  case 284:
/* Line 1787 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); }
    break;

  case 285:
/* Line 1787 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); }
    break;

  case 286:
/* Line 1787 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 287:
/* Line 1787 of yacc.c  */
#line 893 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 288:
/* Line 1787 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); }
    break;

  case 289:
/* Line 1787 of yacc.c  */
#line 898 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); }
    break;

  case 290:
/* Line 1787 of yacc.c  */
#line 902 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); }
    break;

  case 291:
/* Line 1787 of yacc.c  */
#line 903 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 292:
/* Line 1787 of yacc.c  */
#line 908 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); }
    break;

  case 293:
/* Line 1787 of yacc.c  */
#line 909 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); }
    break;

  case 294:
/* Line 1787 of yacc.c  */
#line 920 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); }
    break;

  case 297:
/* Line 1787 of yacc.c  */
#line 927 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); }
    break;

  case 298:
/* Line 1787 of yacc.c  */
#line 929 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); }
    break;

  case 299:
/* Line 1787 of yacc.c  */
#line 931 "type.y"
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

  case 300:
/* Line 1787 of yacc.c  */
#line 957 "type.y"
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

  case 301:
/* Line 1787 of yacc.c  */
#line 973 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); }
    break;

  case 302:
/* Line 1787 of yacc.c  */
#line 974 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); }
    break;

  case 303:
/* Line 1787 of yacc.c  */
#line 978 "type.y"
    { (yyval.specifierType) = structSpecifier; }
    break;

  case 304:
/* Line 1787 of yacc.c  */
#line 979 "type.y"
    { (yyval.specifierType) = unionSpecifier; }
    break;

  case 305:
/* Line 1787 of yacc.c  */
#line 983 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); }
    break;

  case 306:
/* Line 1787 of yacc.c  */
#line 984 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); }
    break;

  case 307:
/* Line 1787 of yacc.c  */
#line 988 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); }
    break;

  case 308:
/* Line 1787 of yacc.c  */
#line 992 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
    break;

  case 309:
/* Line 1787 of yacc.c  */
#line 993 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 310:
/* Line 1787 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 311:
/* Line 1787 of yacc.c  */
#line 1000 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 312:
/* Line 1787 of yacc.c  */
#line 1002 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 313:
/* Line 1787 of yacc.c  */
#line 1004 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 314:
/* Line 1787 of yacc.c  */
#line 1006 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 315:
/* Line 1787 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 316:
/* Line 1787 of yacc.c  */
#line 1011 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 317:
/* Line 1787 of yacc.c  */
#line 1013 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 318:
/* Line 1787 of yacc.c  */
#line 1015 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 319:
/* Line 1787 of yacc.c  */
#line 1017 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 320:
/* Line 1787 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 321:
/* Line 1787 of yacc.c  */
#line 1022 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 322:
/* Line 1787 of yacc.c  */
#line 1024 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 323:
/* Line 1787 of yacc.c  */
#line 1026 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 324:
/* Line 1787 of yacc.c  */
#line 1028 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 325:
/* Line 1787 of yacc.c  */
#line 1031 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 326:
/* Line 1787 of yacc.c  */
#line 1033 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 327:
/* Line 1787 of yacc.c  */
#line 1035 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 328:
/* Line 1787 of yacc.c  */
#line 1037 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 329:
/* Line 1787 of yacc.c  */
#line 1039 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 330:
/* Line 1787 of yacc.c  */
#line 1043 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 331:
/* Line 1787 of yacc.c  */
#line 1044 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 332:
/* Line 1787 of yacc.c  */
#line 1045 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 333:
/* Line 1787 of yacc.c  */
#line 1046 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 334:
/* Line 1787 of yacc.c  */
#line 1047 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); }
    break;

  case 335:
/* Line 1787 of yacc.c  */
#line 1048 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); }
    break;

  case 336:
/* Line 1787 of yacc.c  */
#line 1049 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); }
    break;

  case 337:
/* Line 1787 of yacc.c  */
#line 1050 "type.y"
    { (yyval.classDef) = null; }
    break;

  case 338:
/* Line 1787 of yacc.c  */
#line 1055 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); }
    break;

  case 339:
/* Line 1787 of yacc.c  */
#line 1057 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); }
    break;

  case 340:
/* Line 1787 of yacc.c  */
#line 1062 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); }
    break;

  case 341:
/* Line 1787 of yacc.c  */
#line 1064 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); }
    break;

  case 342:
/* Line 1787 of yacc.c  */
#line 1066 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 343:
/* Line 1787 of yacc.c  */
#line 1068 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 344:
/* Line 1787 of yacc.c  */
#line 1070 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); }
    break;

  case 345:
/* Line 1787 of yacc.c  */
#line 1074 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 346:
/* Line 1787 of yacc.c  */
#line 1075 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 347:
/* Line 1787 of yacc.c  */
#line 1080 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); }
    break;

  case 348:
/* Line 1787 of yacc.c  */
#line 1081 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 349:
/* Line 1787 of yacc.c  */
#line 1082 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); }
    break;

  case 350:
/* Line 1787 of yacc.c  */
#line 1083 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); }
    break;

  case 351:
/* Line 1787 of yacc.c  */
#line 1084 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 352:
/* Line 1787 of yacc.c  */
#line 1089 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); }
    break;

  case 353:
/* Line 1787 of yacc.c  */
#line 1091 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); }
    break;

  case 354:
/* Line 1787 of yacc.c  */
#line 1096 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null, null); }
    break;

  case 355:
/* Line 1787 of yacc.c  */
#line 1098 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp), null); }
    break;

  case 356:
/* Line 1787 of yacc.c  */
#line 1099 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (2)].id), null, (yyvsp[(2) - (2)].list)); }
    break;

  case 357:
/* Line 1787 of yacc.c  */
#line 1100 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (4)].id), (yyvsp[(4) - (4)].exp), (yyvsp[(2) - (4)].list)); }
    break;

  case 358:
/* Line 1787 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 359:
/* Line 1787 of yacc.c  */
#line 1107 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
    break;

  case 360:
/* Line 1787 of yacc.c  */
#line 1109 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); }
    break;

  case 361:
/* Line 1787 of yacc.c  */
#line 1111 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); }
    break;

  case 362:
/* Line 1787 of yacc.c  */
#line 1113 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 363:
/* Line 1787 of yacc.c  */
#line 1115 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 364:
/* Line 1787 of yacc.c  */
#line 1117 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 365:
/* Line 1787 of yacc.c  */
#line 1119 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 366:
/* Line 1787 of yacc.c  */
#line 1121 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 367:
/* Line 1787 of yacc.c  */
#line 1123 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 368:
/* Line 1787 of yacc.c  */
#line 1125 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 369:
/* Line 1787 of yacc.c  */
#line 1130 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 370:
/* Line 1787 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 371:
/* Line 1787 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 372:
/* Line 1787 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 373:
/* Line 1787 of yacc.c  */
#line 1138 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 374:
/* Line 1787 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 376:
/* Line 1787 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 377:
/* Line 1787 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 378:
/* Line 1787 of yacc.c  */
#line 1146 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 379:
/* Line 1787 of yacc.c  */
#line 1147 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 380:
/* Line 1787 of yacc.c  */
#line 1151 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 382:
/* Line 1787 of yacc.c  */
#line 1153 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 383:
/* Line 1787 of yacc.c  */
#line 1154 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 384:
/* Line 1787 of yacc.c  */
#line 1155 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 385:
/* Line 1787 of yacc.c  */
#line 1156 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 387:
/* Line 1787 of yacc.c  */
#line 1204 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 388:
/* Line 1787 of yacc.c  */
#line 1206 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 389:
/* Line 1787 of yacc.c  */
#line 1208 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); }
    break;

  case 390:
/* Line 1787 of yacc.c  */
#line 1213 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 391:
/* Line 1787 of yacc.c  */
#line 1215 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 392:
/* Line 1787 of yacc.c  */
#line 1217 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 393:
/* Line 1787 of yacc.c  */
#line 1219 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 394:
/* Line 1787 of yacc.c  */
#line 1221 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 396:
/* Line 1787 of yacc.c  */
#line 1227 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 397:
/* Line 1787 of yacc.c  */
#line 1230 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 398:
/* Line 1787 of yacc.c  */
#line 1232 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 399:
/* Line 1787 of yacc.c  */
#line 1234 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 401:
/* Line 1787 of yacc.c  */
#line 1244 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 402:
/* Line 1787 of yacc.c  */
#line 1246 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 403:
/* Line 1787 of yacc.c  */
#line 1248 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); }
    break;

  case 406:
/* Line 1787 of yacc.c  */
#line 1255 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 407:
/* Line 1787 of yacc.c  */
#line 1257 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 409:
/* Line 1787 of yacc.c  */
#line 1262 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 410:
/* Line 1787 of yacc.c  */
#line 1263 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 411:
/* Line 1787 of yacc.c  */
#line 1264 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 412:
/* Line 1787 of yacc.c  */
#line 1265 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 413:
/* Line 1787 of yacc.c  */
#line 1269 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 414:
/* Line 1787 of yacc.c  */
#line 1270 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  }
    break;

  case 415:
/* Line 1787 of yacc.c  */
#line 1274 "type.y"
    { (yyval.pointer) = MkPointer(null, null); }
    break;

  case 416:
/* Line 1787 of yacc.c  */
#line 1275 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); }
    break;

  case 417:
/* Line 1787 of yacc.c  */
#line 1276 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); }
    break;

  case 418:
/* Line 1787 of yacc.c  */
#line 1277 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); }
    break;

  case 420:
/* Line 1787 of yacc.c  */
#line 1282 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); }
    break;

  case 421:
/* Line 1787 of yacc.c  */
#line 1286 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); }
    break;

  case 422:
/* Line 1787 of yacc.c  */
#line 1287 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); }
    break;

  case 423:
/* Line 1787 of yacc.c  */
#line 1291 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 424:
/* Line 1787 of yacc.c  */
#line 1292 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 425:
/* Line 1787 of yacc.c  */
#line 1293 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); }
    break;

  case 426:
/* Line 1787 of yacc.c  */
#line 1294 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 427:
/* Line 1787 of yacc.c  */
#line 1295 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 428:
/* Line 1787 of yacc.c  */
#line 1307 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); }
    break;

  case 429:
/* Line 1787 of yacc.c  */
#line 1331 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); }
    break;

  case 430:
/* Line 1787 of yacc.c  */
#line 1332 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); }
    break;

  case 431:
/* Line 1787 of yacc.c  */
#line 1336 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 432:
/* Line 1787 of yacc.c  */
#line 1337 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 433:
/* Line 1787 of yacc.c  */
#line 1341 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 434:
/* Line 1787 of yacc.c  */
#line 1342 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 435:
/* Line 1787 of yacc.c  */
#line 1347 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 436:
/* Line 1787 of yacc.c  */
#line 1349 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); }
    break;

  case 437:
/* Line 1787 of yacc.c  */
#line 1351 "type.y"
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

  case 438:
/* Line 1787 of yacc.c  */
#line 1367 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 439:
/* Line 1787 of yacc.c  */
#line 1369 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 440:
/* Line 1787 of yacc.c  */
#line 1391 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); }
    break;

  case 441:
/* Line 1787 of yacc.c  */
#line 1393 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); }
    break;

  case 448:
/* Line 1787 of yacc.c  */
#line 1407 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 449:
/* Line 1787 of yacc.c  */
#line 1409 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; }
    break;

  case 450:
/* Line 1787 of yacc.c  */
#line 1411 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 451:
/* Line 1787 of yacc.c  */
#line 1415 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); }
    break;

  case 452:
/* Line 1787 of yacc.c  */
#line 1416 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); }
    break;

  case 453:
/* Line 1787 of yacc.c  */
#line 1420 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); }
    break;

  case 454:
/* Line 1787 of yacc.c  */
#line 1421 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); }
    break;

  case 455:
/* Line 1787 of yacc.c  */
#line 1424 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 456:
/* Line 1787 of yacc.c  */
#line 1428 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); }
    break;

  case 457:
/* Line 1787 of yacc.c  */
#line 1429 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); }
    break;

  case 458:
/* Line 1787 of yacc.c  */
#line 1430 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); }
    break;

  case 459:
/* Line 1787 of yacc.c  */
#line 1434 "type.y"
    { (yyval.context) = PushContext(); }
    break;

  case 460:
/* Line 1787 of yacc.c  */
#line 1439 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
    break;

  case 461:
/* Line 1787 of yacc.c  */
#line 1447 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); }
    break;

  case 462:
/* Line 1787 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
    break;

  case 463:
/* Line 1787 of yacc.c  */
#line 1452 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 464:
/* Line 1787 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); }
    break;

  case 465:
/* Line 1787 of yacc.c  */
#line 1457 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 466:
/* Line 1787 of yacc.c  */
#line 1458 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 467:
/* Line 1787 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 468:
/* Line 1787 of yacc.c  */
#line 1463 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 469:
/* Line 1787 of yacc.c  */
#line 1464 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 470:
/* Line 1787 of yacc.c  */
#line 1465 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 471:
/* Line 1787 of yacc.c  */
#line 1467 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 472:
/* Line 1787 of yacc.c  */
#line 1468 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 473:
/* Line 1787 of yacc.c  */
#line 1469 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 474:
/* Line 1787 of yacc.c  */
#line 1473 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); }
    break;

  case 475:
/* Line 1787 of yacc.c  */
#line 1474 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 476:
/* Line 1787 of yacc.c  */
#line 1475 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 477:
/* Line 1787 of yacc.c  */
#line 1476 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); }
    break;

  case 478:
/* Line 1787 of yacc.c  */
#line 1477 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 479:
/* Line 1787 of yacc.c  */
#line 1481 "type.y"
    { (yyval.string) = CopyString(yytext); }
    break;

  case 480:
/* Line 1787 of yacc.c  */
#line 1486 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 481:
/* Line 1787 of yacc.c  */
#line 1488 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 482:
/* Line 1787 of yacc.c  */
#line 1493 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 483:
/* Line 1787 of yacc.c  */
#line 1495 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 484:
/* Line 1787 of yacc.c  */
#line 1520 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; }
    break;

  case 485:
/* Line 1787 of yacc.c  */
#line 1522 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;}
    break;

  case 486:
/* Line 1787 of yacc.c  */
#line 1524 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); }
    break;

  case 487:
/* Line 1787 of yacc.c  */
#line 1526 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); }
    break;

  case 488:
/* Line 1787 of yacc.c  */
#line 1531 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; }
    break;

  case 489:
/* Line 1787 of yacc.c  */
#line 1533 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;}
    break;

  case 490:
/* Line 1787 of yacc.c  */
#line 1537 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 491:
/* Line 1787 of yacc.c  */
#line 1539 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 492:
/* Line 1787 of yacc.c  */
#line 1541 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 493:
/* Line 1787 of yacc.c  */
#line 1543 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 494:
/* Line 1787 of yacc.c  */
#line 1545 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 495:
/* Line 1787 of yacc.c  */
#line 1551 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 496:
/* Line 1787 of yacc.c  */
#line 1553 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 497:
/* Line 1787 of yacc.c  */
#line 1558 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 498:
/* Line 1787 of yacc.c  */
#line 1562 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;}
    break;

  case 499:
/* Line 1787 of yacc.c  */
#line 1563 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
    break;

  case 500:
/* Line 1787 of yacc.c  */
#line 1568 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); }
    break;

  case 501:
/* Line 1787 of yacc.c  */
#line 1570 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 502:
/* Line 1787 of yacc.c  */
#line 1575 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 503:
/* Line 1787 of yacc.c  */
#line 1579 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); }
    break;

  case 504:
/* Line 1787 of yacc.c  */
#line 1580 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 505:
/* Line 1787 of yacc.c  */
#line 1581 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  }
    break;

  case 506:
/* Line 1787 of yacc.c  */
#line 1582 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  }
    break;

  case 507:
/* Line 1787 of yacc.c  */
#line 1583 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  }
    break;

  case 508:
/* Line 1787 of yacc.c  */
#line 1584 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 510:
/* Line 1787 of yacc.c  */
#line 1589 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 511:
/* Line 1787 of yacc.c  */
#line 1590 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); }
    break;

  case 512:
/* Line 1787 of yacc.c  */
#line 1594 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); }
    break;

  case 513:
/* Line 1787 of yacc.c  */
#line 1595 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); }
    break;


/* Line 1787 of yacc.c  */
#line 8034 "type.ec"
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
#line 1598 "type.y"

