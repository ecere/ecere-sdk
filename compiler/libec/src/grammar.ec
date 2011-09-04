/* A Bison parser, made by GNU Bison 2.0.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* Written by Richard Stallman by simplifying the original so called
   ``semantic'' parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 1



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
     EXT_ATTRIB = 334,
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
     DATABASE_OPEN = 363
   };
#endif
#define IDENTIFIER 258
#define CONSTANT 259
#define STRING_LITERAL 260
#define SIZEOF 261
#define PTR_OP 262
#define INC_OP 263
#define DEC_OP 264
#define LEFT_OP 265
#define RIGHT_OP 266
#define LE_OP 267
#define GE_OP 268
#define EQ_OP 269
#define NE_OP 270
#define AND_OP 271
#define OR_OP 272
#define MUL_ASSIGN 273
#define DIV_ASSIGN 274
#define MOD_ASSIGN 275
#define ADD_ASSIGN 276
#define SUB_ASSIGN 277
#define LEFT_ASSIGN 278
#define RIGHT_ASSIGN 279
#define AND_ASSIGN 280
#define XOR_ASSIGN 281
#define OR_ASSIGN 282
#define TYPE_NAME 283
#define TYPEDEF 284
#define EXTERN 285
#define STATIC 286
#define AUTO 287
#define REGISTER 288
#define CHAR 289
#define SHORT 290
#define INT 291
#define UINT 292
#define INT64 293
#define LONG 294
#define SIGNED 295
#define UNSIGNED 296
#define FLOAT 297
#define DOUBLE 298
#define CONST 299
#define VOLATILE 300
#define VOID 301
#define VALIST 302
#define STRUCT 303
#define UNION 304
#define ENUM 305
#define ELLIPSIS 306
#define CASE 307
#define DEFAULT 308
#define IF 309
#define SWITCH 310
#define WHILE 311
#define DO 312
#define FOR 313
#define GOTO 314
#define CONTINUE 315
#define BREAK 316
#define RETURN 317
#define IFX 318
#define ELSE 319
#define CLASS 320
#define THISCLASS 321
#define CLASS_NAME 322
#define PROPERTY 323
#define SETPROP 324
#define GETPROP 325
#define NEWOP 326
#define RENEW 327
#define DELETE 328
#define EXT_DECL 329
#define EXT_STORAGE 330
#define IMPORT 331
#define DEFINE 332
#define VIRTUAL 333
#define EXT_ATTRIB 334
#define PUBLIC 335
#define PRIVATE 336
#define TYPED_OBJECT 337
#define ANY_OBJECT 338
#define _INCREF 339
#define EXTENSION 340
#define ASM 341
#define TYPEOF 342
#define WATCH 343
#define STOPWATCHING 344
#define FIREWATCHERS 345
#define WATCHABLE 346
#define CLASS_DESIGNER 347
#define CLASS_NO_EXPANSION 348
#define CLASS_FIXED 349
#define ISPROPSET 350
#define CLASS_DEFAULT_PROPERTY 351
#define PROPERTY_CATEGORY 352
#define CLASS_DATA 353
#define CLASS_PROPERTY 354
#define SUBCLASS 355
#define NAMESPACE 356
#define NEW0OP 357
#define RENEW0 358
#define VAARG 359
#define DBTABLE 360
#define DBFIELD 361
#define DBINDEX 362
#define DATABASE_OPEN 363




/* Copy the first part of user declarations.  */
#line 1 "grammar.y"

import "ecdefs"

#define YYLTYPE Location

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  (Current).start = (Rhs)[1].start;      \
  (Current).end = (Rhs)[N].end;
#endif

#define PRECOMPILER
extern File fileInput;
extern char * yytext;
OldList * ast;
int yylex();
int yyerror();
bool guess;
bool deleteWatchable = false;

#define MAX_STRUCT_LEVELS     256
AccessMode memberAccessStack[MAX_STRUCT_LEVELS];
int defaultMemberAccess = -1;

#define POP_DEFAULT_ACCESS    if(defaultMemberAccess > -1) defaultMemberAccess--;

#define uint _uint
default:



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

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 34 "grammar.y"
typedef union YYSTYPE {
   SpecifierType specifierType;
   int i;
   AccessMode declMode;
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
   AsmField asmField;

   Instantiation instance;
   MembersInit membersInit;
   MemberInit memberInit;
   ClassFunction classFunction;
   ClassDefinition _class;
   ClassDef classDef;
   PropertyDef prop;
   char * string;
   Symbol symbol;
   PropertyWatch propertyWatch;
   TemplateParameter templateParameter;
   TemplateArgument templateArgument;
   TemplateDatatype templateDatatype;
   
   DBTableEntry dbtableEntry;
   DBIndexItem dbindexItem;
   DBTableDef dbtableDef;
} YYSTYPE;
/* Line 190 of yacc.c.  */
#line 363 "grammar.ec"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

#if ! defined (YYLTYPE) && ! defined (YYLTYPE_IS_DECLARED)
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


/* Line 213 of yacc.c.  */
#line 387 "grammar.ec"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

# ifndef YYFREE
#  define YYFREE free
# endif
# ifndef YYMALLOC
#  define YYMALLOC malloc
# endif

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   else
#    define YYSTACK_ALLOC alloca
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (defined (YYLTYPE_IS_TRIVIAL) && YYLTYPE_IS_TRIVIAL \
             && defined (YYSTYPE_IS_TRIVIAL) && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short int yyss;
  YYSTYPE yyvs;
    YYLTYPE yyls;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short int) + sizeof (YYSTYPE) + sizeof (YYLTYPE))	\
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined (__GNUC__) && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (0)
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (0)

#endif

#if defined (__STDC__) || defined (__cplusplus)
   typedef signed char yysigned_char;
#else
   typedef short int yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  261
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   36810

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  247
/* YYNRULES -- Number of rules. */
#define YYNRULES  1270
/* YYNRULES -- Number of states. */
#define YYNSTATES  2058

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   363

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   128,     2,     2,   122,   130,   125,     2,
     112,   113,   109,   126,   117,   127,   120,   129,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   121,   115,
     110,   116,   111,   133,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,   131,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   119,   132,   118,   114,     2,     2,     2,
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
     105,   106,   107,   108
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     6,     9,    11,    14,    16,    18,    20,
      25,    30,    33,    35,    39,    44,    48,    51,    54,    56,
      60,    63,    66,    69,    72,    75,    78,    81,    84,    86,
      89,    91,    94,    97,   100,   103,   106,   109,   111,   113,
     117,   119,   123,   127,   129,   131,   135,   139,   141,   145,
     149,   153,   157,   159,   162,   165,   167,   169,   172,   175,
     178,   181,   183,   186,   189,   191,   193,   196,   199,   201,
     204,   207,   210,   213,   215,   218,   221,   225,   230,   236,
     241,   245,   250,   253,   257,   262,   268,   273,   277,   282,
     288,   294,   299,   302,   306,   310,   314,   318,   321,   326,
     330,   334,   337,   342,   346,   349,   353,   356,   360,   363,
     365,   368,   372,   376,   380,   383,   385,   389,   393,   395,
     399,   403,   406,   411,   417,   421,   426,   430,   432,   436,
     440,   444,   447,   451,   454,   459,   465,   469,   474,   478,
     480,   484,   488,   491,   493,   496,   499,   502,   504,   507,
     513,   521,   531,   538,   547,   552,   559,   561,   564,   568,
     573,   577,   580,   583,   586,   588,   590,   595,   599,   603,
     607,   610,   613,   616,   621,   623,   626,   628,   632,   636,
     638,   640,   644,   652,   654,   657,   662,   664,   667,   670,
     672,   674,   677,   681,   685,   688,   691,   693,   695,   698,
     701,   703,   706,   709,   712,   715,   717,   720,   722,   724,
     727,   732,   737,   744,   747,   752,   757,   764,   766,   768,
     772,   774,   777,   782,   784,   786,   788,   790,   794,   796,
     798,   800,   804,   808,   812,   816,   820,   824,   826,   830,
     832,   835,   838,   842,   846,   852,   858,   865,   872,   875,
     878,   882,   886,   890,   894,   898,   902,   906,   910,   914,
     918,   922,   924,   926,   930,   932,   934,   939,   944,   950,
     959,   961,   963,   966,   969,   976,   983,   989,   995,  1002,
    1009,  1015,  1021,  1029,  1037,  1044,  1051,  1059,  1067,  1074,
    1081,  1086,  1092,  1097,  1104,  1109,  1111,  1113,  1115,  1117,
    1121,  1123,  1126,  1129,  1132,  1134,  1139,  1144,  1148,  1153,
    1158,  1162,  1166,  1169,  1172,  1177,  1182,  1186,  1191,  1195,
    1199,  1202,  1205,  1207,  1212,  1217,  1221,  1226,  1231,  1235,
    1239,  1242,  1245,  1250,  1255,  1259,  1264,  1268,  1272,  1275,
    1278,  1280,  1282,  1286,  1290,  1292,  1294,  1298,  1302,  1305,
    1308,  1311,  1314,  1317,  1322,  1325,  1330,  1336,  1342,  1344,
    1346,  1348,  1350,  1352,  1354,  1356,  1358,  1360,  1362,  1364,
    1366,  1368,  1373,  1375,  1379,  1383,  1387,  1391,  1395,  1399,
    1401,  1405,  1409,  1413,  1417,  1419,  1423,  1427,  1431,  1435,
    1438,  1440,  1443,  1447,  1451,  1455,  1459,  1463,  1467,  1471,
    1473,  1477,  1481,  1485,  1489,  1493,  1497,  1501,  1505,  1507,
    1511,  1515,  1519,  1523,  1525,  1529,  1533,  1537,  1541,  1543,
    1547,  1551,  1555,  1559,  1561,  1565,  1569,  1571,  1575,  1579,
    1581,  1587,  1593,  1599,  1605,  1611,  1617,  1623,  1629,  1635,
    1641,  1647,  1653,  1659,  1665,  1671,  1677,  1679,  1683,  1687,
    1691,  1695,  1699,  1703,  1707,  1711,  1713,  1715,  1717,  1719,
    1721,  1723,  1725,  1727,  1729,  1731,  1733,  1735,  1739,  1743,
    1746,  1748,  1752,  1756,  1758,  1760,  1763,  1766,  1770,  1774,
    1778,  1782,  1788,  1792,  1796,  1800,  1806,  1810,  1814,  1816,
    1819,  1822,  1826,  1830,  1834,  1838,  1844,  1848,  1852,  1856,
    1862,  1866,  1870,  1873,  1876,  1879,  1882,  1886,  1889,  1895,
    1902,  1909,  1911,  1913,  1915,  1917,  1919,  1924,  1926,  1930,
    1934,  1938,  1942,  1946,  1950,  1952,  1956,  1960,  1964,  1968,
    1972,  1976,  1980,  1984,  1986,  1990,  1994,  1998,  2002,  2004,
    2007,  2011,  2015,  2019,  2023,  2027,  2031,  2035,  2037,  2041,
    2045,  2049,  2053,  2057,  2061,  2065,  2069,  2073,  2077,  2081,
    2085,  2087,  2091,  2095,  2099,  2103,  2105,  2109,  2113,  2117,
    2121,  2123,  2127,  2131,  2135,  2139,  2141,  2145,  2149,  2151,
    2155,  2159,  2161,  2167,  2173,  2179,  2185,  2190,  2195,  2200,
    2205,  2211,  2217,  2223,  2229,  2234,  2239,  2244,  2249,  2255,
    2261,  2267,  2273,  2279,  2285,  2291,  2297,  2301,  2305,  2308,
    2311,  2313,  2317,  2321,  2325,  2329,  2333,  2337,  2339,  2342,
    2346,  2350,  2354,  2358,  2361,  2364,  2367,  2370,  2372,  2375,
    2379,  2383,  2385,  2387,  2389,  2391,  2393,  2395,  2397,  2399,
    2401,  2403,  2405,  2407,  2409,  2413,  2417,  2419,  2423,  2426,
    2428,  2431,  2434,  2437,  2442,  2447,  2451,  2455,  2460,  2466,
    2471,  2478,  2485,  2490,  2496,  2501,  2508,  2515,  2518,  2521,
    2524,  2530,  2534,  2540,  2547,  2553,  2561,  2569,  2578,  2587,
    2595,  2603,  2607,  2611,  2615,  2620,  2624,  2630,  2636,  2638,
    2640,  2642,  2644,  2646,  2648,  2650,  2652,  2654,  2656,  2659,
    2661,  2663,  2665,  2667,  2669,  2671,  2673,  2675,  2677,  2679,
    2681,  2683,  2685,  2687,  2689,  2691,  2696,  2701,  2706,  2708,
    2710,  2712,  2714,  2716,  2718,  2720,  2722,  2724,  2726,  2728,
    2730,  2732,  2734,  2736,  2738,  2740,  2742,  2744,  2749,  2754,
    2759,  2761,  2763,  2766,  2769,  2773,  2779,  2782,  2786,  2792,
    2798,  2804,  2806,  2810,  2813,  2816,  2819,  2823,  2827,  2831,
    2835,  2839,  2843,  2847,  2851,  2853,  2855,  2860,  2864,  2867,
    2871,  2875,  2879,  2883,  2887,  2891,  2895,  2899,  2903,  2907,
    2911,  2915,  2917,  2919,  2921,  2924,  2926,  2929,  2931,  2934,
    2936,  2939,  2941,  2944,  2946,  2949,  2951,  2954,  2956,  2959,
    2961,  2964,  2966,  2969,  2971,  2974,  2976,  2979,  2981,  2984,
    2986,  2989,  2991,  2994,  2996,  2999,  3001,  3004,  3006,  3009,
    3011,  3014,  3016,  3019,  3021,  3024,  3026,  3029,  3031,  3034,
    3036,  3039,  3041,  3044,  3046,  3049,  3051,  3053,  3055,  3058,
    3060,  3063,  3065,  3068,  3070,  3073,  3078,  3084,  3086,  3088,
    3090,  3093,  3095,  3098,  3100,  3103,  3105,  3108,  3113,  3119,
    3121,  3124,  3126,  3129,  3131,  3134,  3136,  3139,  3141,  3144,
    3146,  3149,  3154,  3160,  3162,  3165,  3167,  3170,  3172,  3175,
    3177,  3180,  3182,  3185,  3187,  3190,  3195,  3201,  3205,  3209,
    3211,  3215,  3219,  3223,  3227,  3229,  3233,  3238,  3243,  3248,
    3252,  3255,  3259,  3263,  3267,  3271,  3274,  3277,  3280,  3284,
    3289,  3291,  3293,  3296,  3299,  3301,  3303,  3308,  3310,  3314,
    3317,  3321,  3325,  3329,  3333,  3338,  3343,  3348,  3351,  3355,
    3359,  3363,  3368,  3373,  3377,  3380,  3384,  3388,  3392,  3397,
    3402,  3404,  3407,  3410,  3414,  3416,  3418,  3421,  3424,  3427,
    3431,  3433,  3435,  3438,  3441,  3444,  3448,  3450,  3453,  3457,
    3460,  3462,  3465,  3468,  3472,  3476,  3478,  3481,  3484,  3488,
    3492,  3494,  3497,  3500,  3504,  3508,  3510,  3514,  3519,  3521,
    3526,  3529,  3535,  3539,  3541,  3543,  3545,  3547,  3549,  3551,
    3555,  3559,  3562,  3565,  3567,  3571,  3574,  3578,  3582,  3584,
    3588,  3592,  3594,  3597,  3601,  3605,  3607,  3610,  3612,  3615,
    3618,  3621,  3624,  3628,  3630,  3632,  3636,  3640,  3642,  3646,
    3651,  3655,  3660,  3664,  3668,  3673,  3677,  3682,  3684,  3688,
    3692,  3697,  3701,  3705,  3709,  3714,  3716,  3720,  3724,  3728,
    3732,  3736,  3738,  3742,  3745,  3747,  3749,  3751,  3753,  3755,
    3758,  3760,  3762,  3764,  3766,  3769,  3772,  3775,  3777,  3779,
    3781,  3783,  3785,  3788,  3790,  3792,  3797,  3799,  3803,  3804,
    3811,  3820,  3831,  3844,  3853,  3864,  3875,  3881,  3889,  3899,
    3911,  3919,  3929,  3939,  3943,  3948,  3953,  3957,  3961,  3965,
    3970,  3975,  3979,  3982,  3986,  3989,  3991,  3993,  3995,  3997,
    3999,  4002,  4006,  4009,  4012,  4015,  4019,  4023,  4026,  4032,
    4039,  4042,  4045,  4048,  4051,  4054,  4057,  4059,  4062,  4065,
    4069,  4071,  4074,  4076,  4079,  4082,  4084,  4087,  4090,  4093,
    4096,  4099,  4102,  4104,  4106,  4109,  4112,  4114,  4116,  4119,
    4122,  4124,  4127,  4130,  4132,  4135,  4137,  4140,  4143,  4149,
    4155,  4163,  4171,  4177,  4183,  4187,  4190,  4196,  4201,  4206,
    4214,  4221,  4228,  4234,  4242,  4249,  4254,  4262,  4272,  4276,
    4281,  4286,  4292,  4298,  4304,  4311,  4319,  4326,  4333,  4339,
    4345,  4350,  4354,  4357,  4359,  4362,  4366,  4371,  4375,  4380,
    4386,  4391,  4395,  4398,  4401,  4404,  4408,  4412,  4416,  4420,
    4423,  4426,  4428,  4430,  4435,  4439,  4443,  4446,  4451,  4455,
    4459,  4462,  4464,  4467,  4469,  4471,  4474,  4476,  4479,  4483,
    4487,  4489,  4492,  4495,  4498,  4502,  4507,  4512,  4515,  4518,
    4521,  4524,  4526,  4529,  4531,  4534,  4536,  4539,  4542,  4544,
    4547,  4549,  4552,  4555,  4558,  4561,  4563,  4566,  4569,  4573,
    4575,  4577,  4578,  4585,  4592,  4598,  4603,  4605,  4608,  4611,
    4613,  4617,  4621,  4626,  4628,  4630,  4633,  4636,  4643,  4650,
    4657
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     370,     0,    -1,   206,   109,    -1,   206,   110,    -1,   139,
      -1,   206,   206,    -1,    28,    -1,    28,    -1,   137,    -1,
     137,   110,   200,   111,    -1,   137,   110,   200,    11,    -1,
     291,   314,    -1,   314,    -1,   291,   112,   113,    -1,   114,
     291,   112,   113,    -1,    78,   291,   314,    -1,    78,   314,
      -1,   291,   315,    -1,   315,    -1,    78,   291,   315,    -1,
      78,   315,    -1,   140,   354,    -1,   143,   354,    -1,   143,
     115,    -1,   141,   354,    -1,   142,   354,    -1,   140,   115,
      -1,   140,   355,    -1,   144,    -1,   143,   355,    -1,   145,
      -1,   145,   115,    -1,   290,   314,    -1,   290,   316,    -1,
     290,   315,    -1,   148,   354,    -1,   148,   355,    -1,   149,
      -1,   148,    -1,   212,   116,   319,    -1,   319,    -1,   212,
     116,   320,    -1,   212,   116,     1,    -1,   320,    -1,   152,
      -1,   154,   117,   152,    -1,   155,   117,   152,    -1,   153,
      -1,   154,   117,   153,    -1,   155,   117,   153,    -1,   154,
     117,     1,    -1,   155,   117,     1,    -1,   117,    -1,   154,
     115,    -1,   155,   115,    -1,   156,    -1,   150,    -1,   159,
     156,    -1,   159,   150,    -1,   157,   156,    -1,   157,   150,
      -1,   115,    -1,   159,   115,    -1,   157,   115,    -1,   157,
      -1,   154,    -1,   157,   154,    -1,   159,   154,    -1,   151,
      -1,   158,   151,    -1,   159,   151,    -1,   157,   151,    -1,
     157,   155,    -1,   155,    -1,   154,     1,    -1,   161,   118,
      -1,   161,     1,   118,    -1,   290,   206,   119,   159,    -1,
     290,   206,   119,   158,     1,    -1,   290,   206,   119,   158,
      -1,   290,   206,   119,    -1,   290,   206,   119,     1,    -1,
     163,   118,    -1,   163,     1,   118,    -1,   291,   206,   119,
     159,    -1,   291,   206,   119,   158,     1,    -1,   291,   206,
     119,   158,    -1,   291,   206,   119,    -1,   291,   206,   119,
       1,    -1,   292,   206,   119,   158,   118,    -1,   292,   206,
     119,   159,   118,    -1,   292,   206,   119,   118,    -1,   166,
     118,    -1,   166,     1,   118,    -1,   139,   119,   158,    -1,
     206,   119,   158,    -1,   139,   119,   159,    -1,   139,   119,
      -1,   139,   119,   158,     1,    -1,   139,   119,     1,    -1,
     206,   119,   159,    -1,   206,   119,    -1,   206,   119,   158,
       1,    -1,   206,   119,     1,    -1,   168,   118,    -1,   168,
       1,   118,    -1,   119,   159,    -1,   119,   158,     1,    -1,
     119,     1,    -1,   119,    -1,   119,   158,    -1,   212,   116,
     319,    -1,   212,   116,   320,    -1,   212,   116,     1,    -1,
     212,     1,    -1,   169,    -1,   171,   117,   169,    -1,   172,
     117,   169,    -1,   170,    -1,   171,   117,   170,    -1,   172,
     117,   170,    -1,   171,     1,    -1,    68,   296,   206,   119,
      -1,    68,   296,   311,   206,   119,    -1,    68,   296,   119,
      -1,    68,   296,   311,   119,    -1,    68,     1,   119,    -1,
     173,    -1,   174,    69,   354,    -1,   174,    70,   354,    -1,
     174,    95,   354,    -1,   174,    91,    -1,   174,    97,   365,
      -1,   174,   118,    -1,    99,   296,   206,   119,    -1,    99,
     296,   311,   206,   119,    -1,    99,   296,   119,    -1,    99,
     296,   311,   119,    -1,    99,     1,   119,    -1,   176,    -1,
     177,    69,   354,    -1,   177,    70,   354,    -1,   177,   118,
      -1,   206,    -1,   179,   206,    -1,   179,   354,    -1,    73,
     354,    -1,   180,    -1,   181,   180,    -1,    88,   112,   179,
     113,   354,    -1,    88,   112,   233,   113,   119,   181,   118,
      -1,   233,   120,    88,   112,   233,   113,   119,   181,   118,
      -1,    89,   112,   233,   117,   179,   113,    -1,   233,   120,
      89,   112,   233,   117,   179,   113,    -1,    89,   112,   233,
     113,    -1,   233,   120,    89,   112,   233,   113,    -1,    90,
      -1,    90,   179,    -1,   212,   120,    90,    -1,   233,   120,
      90,   179,    -1,   291,   278,   115,    -1,   291,   115,    -1,
     165,   115,    -1,   162,   115,    -1,   146,    -1,   175,    -1,
     342,   291,   278,   115,    -1,   342,   291,   115,    -1,   342,
     165,   115,    -1,   342,   162,   115,    -1,   342,   146,    -1,
     342,   175,    -1,   171,   115,    -1,    98,   291,   278,   115,
      -1,   178,    -1,   182,   115,    -1,    91,    -1,    92,   206,
     115,    -1,    92,   139,   115,    -1,    93,    -1,    94,    -1,
      96,   206,   115,    -1,    99,   112,   206,   113,   116,   319,
     115,    -1,   115,    -1,   342,   121,    -1,   342,   112,   206,
     113,    -1,   147,    -1,   163,     1,    -1,   166,     1,    -1,
     162,    -1,   165,    -1,   342,   147,    -1,   342,   163,     1,
      -1,   342,   166,     1,    -1,   342,   162,    -1,   342,   165,
      -1,   172,    -1,   186,    -1,   188,   186,    -1,   189,   186,
      -1,   187,    -1,   188,     1,    -1,   189,     1,    -1,   188,
     187,    -1,   189,   187,    -1,   290,    -1,   290,   311,    -1,
     206,    -1,   190,    -1,    65,   206,    -1,    65,   206,   116,
     191,    -1,    65,   206,   121,   190,    -1,    65,   206,   121,
     190,   116,   191,    -1,    65,   138,    -1,    65,   138,   116,
     191,    -1,    65,   138,   121,   190,    -1,    65,   138,   121,
     190,   116,   191,    -1,   206,    -1,   206,    -1,   206,   116,
     193,    -1,   257,    -1,   190,   206,    -1,   190,   206,   116,
     195,    -1,   192,    -1,   194,    -1,   196,    -1,   197,    -1,
     198,   117,   197,    -1,   195,    -1,   193,    -1,   191,    -1,
     206,   116,   195,    -1,   206,   116,   193,    -1,   206,   116,
     191,    -1,   190,   116,   195,    -1,   190,   116,   193,    -1,
     190,   116,   191,    -1,   199,    -1,   200,   117,   199,    -1,
      65,    -1,   201,   206,    -1,   201,   137,    -1,   206,   201,
     206,    -1,   206,   201,   137,    -1,   201,   206,   110,   198,
     111,    -1,   201,   137,   110,   198,   111,    -1,   206,   201,
     206,   110,   198,   111,    -1,   206,   201,   137,   110,   198,
     111,    -1,   205,   118,    -1,   204,   115,    -1,   202,   119,
     118,    -1,   204,   119,   118,    -1,   201,   206,   115,    -1,
     201,   136,   115,    -1,   202,   121,   295,    -1,   202,   119,
     189,    -1,   204,   119,   189,    -1,   202,   119,   188,    -1,
     204,   119,   188,    -1,   202,   119,     1,    -1,   204,   119,
       1,    -1,     3,    -1,   208,    -1,   112,   235,   113,    -1,
     206,    -1,   165,    -1,    85,   112,   354,   113,    -1,    85,
     112,   235,   113,    -1,    85,   112,   326,   113,   317,    -1,
      85,   112,   326,   113,   112,   326,   113,   317,    -1,     4,
      -1,   365,    -1,   122,   365,    -1,   112,   113,    -1,    71,
     298,   312,   123,   257,   124,    -1,    71,   298,   312,   123,
     258,   124,    -1,    71,   298,   123,   257,   124,    -1,    71,
     298,   123,   258,   124,    -1,   102,   298,   312,   123,   257,
     124,    -1,   102,   298,   312,   123,   258,   124,    -1,   102,
     298,   123,   257,   124,    -1,   102,   298,   123,   258,   124,
      -1,    72,   257,   297,   312,   123,   257,   124,    -1,    72,
     257,   297,   312,   123,   258,   124,    -1,    72,   257,   297,
     123,   257,   124,    -1,    72,   257,   297,   123,   258,   124,
      -1,   103,   257,   297,   312,   123,   257,   124,    -1,   103,
     257,   297,   312,   123,   258,   124,    -1,   103,   257,   297,
     123,   257,   124,    -1,   103,   257,   297,   123,   258,   124,
      -1,    65,   112,   290,   113,    -1,    65,   112,   290,   311,
     113,    -1,    65,   112,   206,   113,    -1,   104,   112,   233,
     117,   326,   113,    -1,    98,   112,   206,   113,    -1,   377,
      -1,   378,    -1,   379,    -1,   380,    -1,   123,   214,   124,
      -1,   167,    -1,   168,     1,    -1,   112,   235,    -1,   112,
     255,    -1,   207,    -1,   212,   123,   235,   124,    -1,   212,
     123,   255,   124,    -1,   212,   112,   113,    -1,   212,   112,
     214,   113,    -1,   212,   112,   215,   113,    -1,   212,   120,
     206,    -1,   212,     7,   206,    -1,   212,     8,    -1,   212,
       9,    -1,   237,   123,   235,   124,    -1,   237,   123,   255,
     124,    -1,   237,   112,   113,    -1,   237,   112,   214,   113,
      -1,   237,   120,   206,    -1,   237,     7,   206,    -1,   237,
       8,    -1,   237,     9,    -1,   208,    -1,   213,   123,   235,
     124,    -1,   213,   123,   255,   124,    -1,   213,   112,   113,
      -1,   213,   112,   214,   113,    -1,   213,   112,   215,   113,
      -1,   213,   120,   206,    -1,   213,     7,   206,    -1,   213,
       8,    -1,   213,     9,    -1,   238,   123,   235,   124,    -1,
     238,   123,   255,   124,    -1,   238,   112,   113,    -1,   238,
     112,   214,   113,    -1,   238,   120,   206,    -1,   238,     7,
     206,    -1,   238,     8,    -1,   238,     9,    -1,   233,    -1,
     209,    -1,   214,   117,   233,    -1,   214,   117,   209,    -1,
     254,    -1,   210,    -1,   214,   117,   254,    -1,   214,   117,
     210,    -1,   214,   117,    -1,     8,   217,    -1,     9,   217,
      -1,   219,   220,    -1,   219,   209,    -1,     6,   112,   217,
     113,    -1,     6,   218,    -1,     6,   112,   327,   113,    -1,
       6,   112,    65,   136,   113,    -1,     6,   112,    65,   135,
     113,    -1,   216,    -1,   212,    -1,   216,    -1,   213,    -1,
     125,    -1,   109,    -1,   126,    -1,   127,    -1,   114,    -1,
     128,    -1,    73,    -1,    84,    -1,   217,    -1,   112,   326,
     113,   220,    -1,   220,    -1,   221,   109,   220,    -1,   221,
     129,   220,    -1,   221,   130,   220,    -1,   243,   109,   220,
      -1,   243,   129,   220,    -1,   243,   130,   220,    -1,   221,
      -1,   222,   126,   221,    -1,   222,   127,   221,    -1,   244,
     126,   221,    -1,   244,   127,   221,    -1,   222,    -1,   223,
      10,   222,    -1,   223,    11,   222,    -1,   245,    10,   222,
      -1,   245,    11,   222,    -1,   225,   110,    -1,   223,    -1,
     224,   223,    -1,   225,   111,   223,    -1,   225,    12,   223,
      -1,   225,    13,   223,    -1,   246,   110,   223,    -1,   246,
     111,   223,    -1,   246,    12,   223,    -1,   246,    13,   223,
      -1,   225,    -1,   226,    14,   225,    -1,   226,    15,   225,
      -1,   247,    14,   225,    -1,   247,    15,   225,    -1,   226,
      14,   209,    -1,   226,    15,   209,    -1,   247,    14,   209,
      -1,   247,    15,   209,    -1,   226,    -1,   227,   125,   226,
      -1,   248,   125,   226,    -1,   227,   125,   209,    -1,   248,
     125,   209,    -1,   227,    -1,   228,   131,   227,    -1,   249,
     131,   227,    -1,   228,   131,   209,    -1,   249,   131,   209,
      -1,   228,    -1,   229,   132,   228,    -1,   250,   132,   228,
      -1,   229,   132,   209,    -1,   250,   132,   209,    -1,   229,
      -1,   230,    16,   229,    -1,   251,    16,   229,    -1,   230,
      -1,   231,    17,   230,    -1,   252,    17,   230,    -1,   231,
      -1,   231,   133,   235,   121,   232,    -1,   231,   133,   255,
     121,   232,    -1,   252,   133,   235,   121,   232,    -1,   252,
     133,   255,   121,   232,    -1,   231,   133,   236,   121,   232,
      -1,   231,   133,   256,   121,   232,    -1,   252,   133,   236,
     121,   232,    -1,   252,   133,   256,   121,   232,    -1,   231,
     133,   235,   121,   209,    -1,   231,   133,   255,   121,   209,
      -1,   252,   133,   235,   121,   209,    -1,   252,   133,   255,
     121,   209,    -1,   231,   133,   236,   121,   209,    -1,   231,
     133,   256,   121,   209,    -1,   252,   133,   236,   121,   209,
      -1,   252,   133,   256,   121,   209,    -1,   232,    -1,   217,
     234,   233,    -1,   240,   234,   233,    -1,   232,   234,   233,
      -1,   253,   234,   233,    -1,   217,   234,   209,    -1,   240,
     234,   209,    -1,   232,   234,   209,    -1,   253,   234,   209,
      -1,   116,    -1,    18,    -1,    19,    -1,    20,    -1,    21,
      -1,    22,    -1,    23,    -1,    24,    -1,    25,    -1,    26,
      -1,    27,    -1,   233,    -1,   235,   117,   233,    -1,   255,
     117,   233,    -1,   255,   113,    -1,   209,    -1,   235,   117,
     209,    -1,   255,   117,   209,    -1,   211,    -1,     1,    -1,
     212,     1,    -1,   166,     1,    -1,   212,     7,     1,    -1,
     237,     7,     1,    -1,   212,   112,   214,    -1,   212,   112,
     215,    -1,   212,   112,   214,   117,     1,    -1,   212,   112,
       1,    -1,   212,   120,     1,    -1,   237,   112,   215,    -1,
     237,   112,   214,   117,     1,    -1,   237,   112,     1,    -1,
     237,   120,     1,    -1,     1,    -1,   213,     1,    -1,   166,
       1,    -1,   213,     7,     1,    -1,   238,     7,     1,    -1,
     213,   112,   214,    -1,   213,   112,   215,    -1,   213,   112,
     214,   117,     1,    -1,   213,   112,     1,    -1,   213,   120,
       1,    -1,   238,   112,   215,    -1,   238,   112,   214,   117,
       1,    -1,   238,   112,     1,    -1,   238,   120,     1,    -1,
       8,   240,    -1,     9,   240,    -1,   219,   242,    -1,   219,
     210,    -1,     6,   112,   240,    -1,     6,   241,    -1,     6,
     112,   327,   113,     1,    -1,     6,   112,    65,   136,   113,
       1,    -1,     6,   112,    65,   135,   113,     1,    -1,   239,
      -1,   237,    -1,   239,    -1,   238,    -1,   240,    -1,   112,
     326,   113,   242,    -1,   242,    -1,   221,   109,   242,    -1,
     221,   129,   242,    -1,   221,   130,   242,    -1,   243,   109,
     242,    -1,   243,   129,   242,    -1,   243,   130,   242,    -1,
     243,    -1,   222,   126,   243,    -1,   222,   126,     1,    -1,
     222,   127,   243,    -1,   222,   127,     1,    -1,   244,   126,
     243,    -1,   244,   126,     1,    -1,   244,   127,   243,    -1,
     244,   127,     1,    -1,   244,    -1,   223,    10,   244,    -1,
     223,    11,   244,    -1,   245,    10,   244,    -1,   245,    11,
     244,    -1,   245,    -1,   224,   245,    -1,   225,   111,   245,
      -1,   225,    12,   245,    -1,   225,    13,   245,    -1,   246,
     110,   245,    -1,   246,   111,   245,    -1,   246,    12,   245,
      -1,   246,    13,   245,    -1,   246,    -1,   226,    14,   246,
      -1,   226,    15,   246,    -1,   247,    14,   246,    -1,   247,
      15,   246,    -1,   226,    14,     1,    -1,   226,    15,     1,
      -1,   247,    14,     1,    -1,   247,    15,     1,    -1,   226,
      14,   210,    -1,   226,    15,   210,    -1,   247,    14,   210,
      -1,   247,    15,   210,    -1,   247,    -1,   227,   125,   247,
      -1,   248,   125,   247,    -1,   227,   125,   210,    -1,   248,
     125,   210,    -1,   248,    -1,   228,   131,   248,    -1,   249,
     131,   248,    -1,   228,   131,   210,    -1,   249,   131,   210,
      -1,   249,    -1,   229,   132,   249,    -1,   250,   132,   249,
      -1,   229,   132,   210,    -1,   250,   132,   210,    -1,   250,
      -1,   230,    16,   250,    -1,   251,    16,   250,    -1,   251,
      -1,   231,    17,   251,    -1,   252,    17,   251,    -1,   252,
      -1,   231,   133,   235,   121,   252,    -1,   231,   133,   255,
     121,   252,    -1,   252,   133,   235,   121,   252,    -1,   252,
     133,   255,   121,   252,    -1,   231,   133,   235,   121,    -1,
     231,   133,   255,   121,    -1,   252,   133,   235,   121,    -1,
     252,   133,   255,   121,    -1,   231,   133,   236,   121,   252,
      -1,   231,   133,   256,   121,   252,    -1,   252,   133,   236,
     121,   252,    -1,   252,   133,   256,   121,   252,    -1,   231,
     133,   236,   121,    -1,   231,   133,   256,   121,    -1,   252,
     133,   236,   121,    -1,   252,   133,   256,   121,    -1,   231,
     133,   235,   121,   210,    -1,   231,   133,   255,   121,   210,
      -1,   252,   133,   235,   121,   210,    -1,   252,   133,   255,
     121,   210,    -1,   231,   133,   236,   121,   210,    -1,   231,
     133,   256,   121,   210,    -1,   252,   133,   236,   121,   210,
      -1,   252,   133,   256,   121,   210,    -1,   231,   133,   121,
      -1,   252,   133,   121,    -1,   231,   133,    -1,   252,   133,
      -1,   253,    -1,   217,   234,   254,    -1,   217,   234,     1,
      -1,   240,   234,   254,    -1,   240,   234,     1,    -1,   217,
     234,   210,    -1,   240,   234,   210,    -1,   254,    -1,   233,
       1,    -1,   235,   117,   254,    -1,   255,   117,   254,    -1,
     235,   117,     1,    -1,   255,   117,     1,    -1,   235,     1,
      -1,   235,   235,    -1,   255,   235,    -1,   235,   255,    -1,
     210,    -1,   209,     1,    -1,   235,   117,   210,    -1,   255,
     117,   210,    -1,   232,    -1,   253,    -1,    29,    -1,    30,
      -1,    31,    -1,    32,    -1,    33,    -1,    29,    -1,    30,
      -1,    31,    -1,    32,    -1,    33,    -1,   206,    -1,   206,
     116,   257,    -1,   206,   116,   258,    -1,   261,    -1,   262,
     117,   261,    -1,   262,   117,    -1,    50,    -1,   263,   206,
      -1,   263,   139,    -1,   266,   118,    -1,   263,   206,   119,
     118,    -1,   263,   139,   119,   118,    -1,   263,   119,   262,
      -1,   263,   119,     1,    -1,   263,   206,   119,   262,    -1,
     263,   206,   119,   262,     1,    -1,   263,   206,   119,     1,
      -1,   263,   206,   119,   262,   115,   188,    -1,   263,   206,
     119,   262,   115,   189,    -1,   263,   139,   119,   262,    -1,
     263,   139,   119,   262,     1,    -1,   263,   139,   119,     1,
      -1,   263,   139,   119,   262,   115,   188,    -1,   263,   139,
     119,   262,   115,   189,    -1,   263,   206,    -1,   263,   139,
      -1,   269,   118,    -1,   267,   121,   295,   119,   118,    -1,
     267,   119,   118,    -1,   267,   121,   295,   119,   262,    -1,
     267,   121,   295,   119,   262,     1,    -1,   267,   121,   295,
     119,     1,    -1,   267,   121,   295,   119,   262,   115,   188,
      -1,   267,   121,   295,   119,   262,   115,   189,    -1,   267,
     121,   295,   119,   262,     1,   115,   188,    -1,   267,   121,
     295,   119,   262,     1,   115,   189,    -1,   267,   121,   295,
     119,     1,   115,   188,    -1,   267,   121,   295,   119,     1,
     115,   189,    -1,   263,   119,   262,    -1,   263,   119,     1,
      -1,   267,   119,   262,    -1,   267,   119,   262,     1,    -1,
     267,   119,     1,    -1,   267,   119,   262,   115,   188,    -1,
     267,   119,   262,   115,   189,    -1,   268,    -1,   285,    -1,
     269,    -1,   286,    -1,    75,    -1,   306,    -1,    44,    -1,
      45,    -1,   272,    -1,   273,    -1,   274,   273,    -1,    46,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,
      -1,    41,    -1,    85,    -1,   282,    -1,   264,    -1,   136,
      -1,    87,   112,   233,   113,    -1,   100,   112,   136,   113,
      -1,   100,   112,   206,   113,    -1,    66,    -1,    82,    -1,
      83,    -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,
      43,    -1,    40,    -1,    41,    -1,    85,    -1,   282,    -1,
     264,    -1,   139,    -1,    87,   112,   233,   113,    -1,   100,
     112,   136,   113,    -1,   100,   112,   206,   113,    -1,    66,
      -1,   316,    -1,   316,   307,    -1,   121,   257,    -1,   316,
     121,   257,    -1,   316,   121,   257,   121,   257,    -1,   121,
     258,    -1,   316,   121,   258,    -1,   316,   121,   257,   121,
     258,    -1,   316,   121,   258,   121,   258,    -1,   316,   121,
     258,   121,   257,    -1,   277,    -1,   278,   117,   277,    -1,
     287,   206,    -1,   287,   137,    -1,   281,   118,    -1,   279,
     119,   118,    -1,   287,   119,   118,    -1,   279,   119,   188,
      -1,   279,   119,   189,    -1,   279,   119,     1,    -1,   287,
     119,   188,    -1,   287,   119,   189,    -1,   287,   119,     1,
      -1,   279,    -1,   279,    -1,   279,   110,   198,   111,    -1,
     283,   121,   295,    -1,   286,   118,    -1,   284,   119,   118,
      -1,   283,   119,   118,    -1,   287,   119,   118,    -1,   284,
     119,   188,    -1,   284,   119,   189,    -1,   284,   119,     1,
      -1,   283,   119,   188,    -1,   283,   119,   189,    -1,   283,
     119,     1,    -1,   287,   119,   188,    -1,   287,   119,   189,
      -1,   287,   119,     1,    -1,    48,    -1,    49,    -1,   273,
      -1,   288,   273,    -1,   275,    -1,   288,   275,    -1,   265,
      -1,   288,   265,    -1,   280,    -1,   288,   280,    -1,   273,
      -1,   289,   273,    -1,   275,    -1,   289,   275,    -1,   135,
      -1,   289,   135,    -1,   265,    -1,   289,   265,    -1,   280,
      -1,   289,   280,    -1,   259,    -1,   290,   259,    -1,   273,
      -1,   290,   273,    -1,   276,    -1,   290,   276,    -1,   265,
      -1,   290,   265,    -1,   280,    -1,   290,   280,    -1,   259,
      -1,   291,   259,    -1,   273,    -1,   291,   273,    -1,   275,
      -1,   291,   275,    -1,   135,    -1,   291,   135,    -1,   280,
      -1,   291,   280,    -1,   265,    -1,   291,   265,    -1,   260,
      -1,   292,   260,    -1,   273,    -1,   292,   273,    -1,   275,
      -1,   292,   275,    -1,   135,    -1,   292,   135,    -1,   270,
      -1,   292,   270,    -1,   271,    -1,   292,   271,    -1,    81,
      -1,    80,    -1,   259,    -1,   294,   259,    -1,   273,    -1,
     294,   273,    -1,   276,    -1,   294,   276,    -1,   206,    -1,
     294,   206,    -1,   206,   110,   200,   111,    -1,   294,   206,
     110,   200,   111,    -1,   294,    -1,   287,    -1,   259,    -1,
     296,   259,    -1,   273,    -1,   296,   273,    -1,   276,    -1,
     296,   276,    -1,   206,    -1,   296,   206,    -1,   206,   110,
     200,   111,    -1,   296,   206,   110,   200,   111,    -1,   259,
      -1,   297,   259,    -1,   273,    -1,   297,   273,    -1,   276,
      -1,   297,   276,    -1,   280,    -1,   297,   280,    -1,   265,
      -1,   297,   265,    -1,   206,    -1,   297,   206,    -1,   206,
     110,   200,   111,    -1,   297,   206,   110,   200,   111,    -1,
     259,    -1,   298,   259,    -1,   273,    -1,   298,   273,    -1,
     276,    -1,   298,   276,    -1,   280,    -1,   298,   280,    -1,
     265,    -1,   298,   265,    -1,   206,    -1,   298,   206,    -1,
     206,   110,   200,   111,    -1,   298,   206,   110,   200,   111,
      -1,   300,   117,     1,    -1,   299,   117,     1,    -1,   206,
      -1,   300,   117,   206,    -1,   299,   117,   206,    -1,   330,
     117,   206,    -1,   331,   117,   206,    -1,   206,    -1,   112,
     313,   113,    -1,   301,   123,   257,   124,    -1,   301,   123,
     258,   124,    -1,   301,   123,   136,   124,    -1,   301,   123,
     124,    -1,   301,   112,    -1,   302,   332,   113,    -1,   302,
     333,   113,    -1,   302,   300,   113,    -1,   302,   299,   113,
      -1,   302,   113,    -1,   302,   299,    -1,   302,     1,    -1,
     302,   330,   112,    -1,   302,   291,   206,   112,    -1,   303,
      -1,   301,    -1,   306,   303,    -1,   306,   301,    -1,    74,
      -1,   307,    -1,    86,   112,   365,   113,    -1,    79,    -1,
     112,   311,   113,    -1,   123,   124,    -1,   123,   257,   124,
      -1,   123,   258,   124,    -1,   123,   136,   124,    -1,   308,
     123,   124,    -1,   308,   123,   257,   124,    -1,   308,   123,
     136,   124,    -1,   308,   123,   258,   124,    -1,   112,   113,
      -1,   112,   332,   113,    -1,   112,   333,   113,    -1,   308,
     112,   113,    -1,   308,   112,   332,   113,    -1,   308,   112,
     333,   113,    -1,   112,   312,   113,    -1,   112,   113,    -1,
     112,   332,   113,    -1,   112,   333,   113,    -1,   309,   112,
     113,    -1,   309,   112,   332,   113,    -1,   309,   112,   333,
     113,    -1,   109,    -1,   109,   274,    -1,   109,   310,    -1,
     109,   274,   310,    -1,   310,    -1,   308,    -1,   310,   308,
      -1,   306,   310,    -1,   306,   308,    -1,   306,   310,   308,
      -1,   310,    -1,   309,    -1,   310,   309,    -1,   306,   310,
      -1,   306,   309,    -1,   306,   310,   309,    -1,   305,    -1,
     310,   305,    -1,   306,   310,   305,    -1,   313,   306,    -1,
     303,    -1,   310,   303,    -1,   306,   303,    -1,   306,   310,
     303,    -1,   310,   306,   303,    -1,   304,    -1,   310,   304,
      -1,   306,   304,    -1,   306,   310,   304,    -1,   310,   306,
     304,    -1,   301,    -1,   310,   301,    -1,   306,   301,    -1,
     306,   310,   301,    -1,   310,   306,   301,    -1,   233,    -1,
     119,   321,   118,    -1,   119,   321,   117,   118,    -1,   254,
      -1,   119,   321,   118,     1,    -1,   119,   321,    -1,   119,
     321,   117,   118,     1,    -1,   119,   321,   117,    -1,   232,
      -1,   209,    -1,   253,    -1,   210,    -1,   317,    -1,   318,
      -1,   321,   117,   317,    -1,   321,   117,   318,    -1,   321,
     317,    -1,   321,   318,    -1,   313,    -1,   313,   116,   317,
      -1,   313,     1,    -1,   313,   116,     1,    -1,   313,   116,
     318,    -1,   322,    -1,   324,   117,   322,    -1,   325,   117,
     322,    -1,   323,    -1,   322,     1,    -1,   324,   117,   323,
      -1,   325,   117,   323,    -1,   288,    -1,   288,   311,    -1,
     289,    -1,   289,   311,    -1,   291,   313,    -1,   291,   311,
      -1,   291,   125,    -1,   291,   125,   313,    -1,   291,    -1,
      65,    -1,   291,   313,     1,    -1,   291,   311,     1,    -1,
     328,    -1,   330,   117,   328,    -1,   330,     1,   117,   328,
      -1,   331,   117,   328,    -1,   331,     1,   117,   328,    -1,
       1,   117,   328,    -1,   300,   117,   328,    -1,   300,     1,
     117,   328,    -1,   299,   117,   328,    -1,   299,     1,   117,
     328,    -1,   329,    -1,   330,   117,   329,    -1,   331,   117,
     329,    -1,   331,     1,   117,   329,    -1,     1,   117,   329,
      -1,   300,   117,   329,    -1,   299,   117,   329,    -1,   299,
       1,   117,   329,    -1,   330,    -1,   330,   117,    51,    -1,
     331,   117,    51,    -1,   300,   117,    51,    -1,   299,   117,
      51,    -1,     1,   117,    51,    -1,   331,    -1,   330,   117,
       1,    -1,   331,     1,    -1,   339,    -1,    79,    -1,   354,
      -1,   115,    -1,   121,    -1,   235,   115,    -1,   357,    -1,
     359,    -1,   361,    -1,   338,    -1,   185,   115,    -1,   184,
     115,    -1,   183,   115,    -1,   340,    -1,   360,    -1,   355,
      -1,   358,    -1,   362,    -1,   361,     1,    -1,   255,    -1,
     365,    -1,   365,   112,   233,   113,    -1,   336,    -1,   337,
     117,   336,    -1,    -1,    86,   273,   112,   365,   113,   115,
      -1,    86,   273,   112,   365,   121,   337,   113,   115,    -1,
      86,   273,   112,   365,   121,   337,   121,   337,   113,   115,
      -1,    86,   273,   112,   365,   121,   337,   121,   337,   121,
     337,   113,   115,    -1,    86,   273,   112,   365,     3,   337,
     113,   115,    -1,    86,   273,   112,   365,     3,   337,   121,
     337,   113,   115,    -1,    86,   273,   112,   365,   121,   337,
       3,   337,   113,   115,    -1,    86,   112,   365,   113,   115,
      -1,    86,   112,   365,   121,   337,   113,   115,    -1,    86,
     112,   365,   121,   337,   121,   337,   113,   115,    -1,    86,
     112,   365,   121,   337,   121,   337,   121,   337,   113,   115,
      -1,    86,   112,   365,     3,   337,   113,   115,    -1,    86,
     112,   365,     3,   337,   121,   337,   113,   115,    -1,    86,
     112,   365,   121,   337,     3,   337,   113,   115,    -1,   206,
     121,   334,    -1,    52,   257,   121,   334,    -1,    52,   258,
     121,   334,    -1,    52,   121,   334,    -1,    53,   121,   334,
      -1,   206,   121,   335,    -1,    52,   257,   121,   335,    -1,
      52,   258,   121,   335,    -1,    52,   121,   335,    -1,    52,
     121,    -1,    53,   121,   335,    -1,    53,   121,    -1,    80,
      -1,    81,    -1,    53,    -1,    80,    -1,    81,    -1,   290,
     115,    -1,   290,   324,   115,    -1,   160,   115,    -1,   346,
     115,    -1,   292,   115,    -1,   292,   324,   115,    -1,   293,
     324,   115,    -1,   164,   115,    -1,    77,   206,   116,   232,
     115,    -1,    31,    77,   206,   116,   232,   115,    -1,   292,
       1,    -1,   290,     1,    -1,   346,     1,    -1,   161,     1,
      -1,   160,     1,    -1,   290,   325,    -1,   343,    -1,   347,
     343,    -1,   348,   343,    -1,   347,     1,   115,    -1,   346,
      -1,   347,   346,    -1,   334,    -1,   349,   334,    -1,   350,
     334,    -1,   335,    -1,   349,   335,    -1,   350,   335,    -1,
     349,   343,    -1,   350,   343,    -1,   349,   346,    -1,   350,
     346,    -1,   349,    -1,   347,    -1,   347,   349,    -1,   348,
     349,    -1,   350,    -1,   348,    -1,   347,   350,    -1,   348,
     350,    -1,   119,    -1,   355,   118,    -1,   353,   352,    -1,
     353,    -1,   353,   351,    -1,   115,    -1,   235,   115,    -1,
     255,   115,    -1,    54,   112,   235,   113,   334,    -1,    54,
     112,   255,   113,   334,    -1,    54,   112,   235,   113,   334,
      64,   334,    -1,    54,   112,   255,   113,   334,    64,   334,
      -1,    55,   112,   235,   113,   334,    -1,    55,   112,   255,
     113,   334,    -1,    54,   112,   255,    -1,   357,     1,    -1,
      56,   112,   235,   113,   334,    -1,    56,   112,   255,   334,
      -1,    56,   112,   113,   334,    -1,    57,   334,    56,   112,
     235,   113,   115,    -1,    57,   334,    56,   112,   255,   115,
      -1,    58,   112,   356,   356,   113,   334,    -1,    58,   112,
     356,   113,   334,    -1,    58,   112,   356,   356,   235,   113,
     334,    -1,    58,   112,   356,   356,   255,   334,    -1,    58,
     112,   113,   334,    -1,    58,   112,   206,   121,   235,   113,
     334,    -1,    58,   112,   206,   121,   235,   115,   235,   113,
     334,    -1,    58,   112,     1,    -1,    58,   112,   255,     1,
      -1,    58,   112,   356,     1,    -1,    58,   112,   356,   255,
       1,    -1,    58,   112,   356,   356,     1,    -1,    58,   112,
     356,   356,   255,    -1,    58,   112,   356,   356,   113,   335,
      -1,    58,   112,   356,   356,   235,   113,   335,    -1,    58,
     112,   356,   356,   255,   335,    -1,    57,   334,    56,   112,
     235,   113,    -1,    57,   334,    56,   112,   235,    -1,    57,
     334,    56,   112,   255,    -1,    57,   334,    56,   112,    -1,
      57,   334,    56,    -1,    57,   334,    -1,    57,    -1,    56,
       1,    -1,    56,   112,     1,    -1,    56,   112,   113,     1,
      -1,    56,   112,   255,    -1,    56,   112,   255,     1,    -1,
      56,   112,   235,   113,   335,    -1,    56,   112,   255,   335,
      -1,    59,   206,   115,    -1,    60,   115,    -1,    61,   115,
      -1,    62,   115,    -1,    62,   235,   115,    -1,    62,   255,
     115,    -1,    62,   209,   115,    -1,    62,   210,   115,    -1,
      62,   255,    -1,    62,   210,    -1,    62,    -1,    59,    -1,
     292,   314,   347,   354,    -1,   292,   314,   354,    -1,   314,
     347,   354,    -1,   314,   354,    -1,   292,   314,   347,   355,
      -1,   292,   314,   355,    -1,   314,   347,   355,    -1,   314,
     355,    -1,     5,    -1,   365,     5,    -1,   363,    -1,   203,
      -1,   292,   203,    -1,   344,    -1,    76,   365,    -1,    76,
      31,   365,    -1,    76,   206,   365,    -1,   115,    -1,   341,
     363,    -1,   341,   203,    -1,   341,   344,    -1,   341,    76,
     365,    -1,   341,    76,    31,   365,    -1,   341,    76,   206,
     365,    -1,   341,   121,    -1,    31,   121,    -1,   101,   206,
      -1,   101,   139,    -1,   371,    -1,   341,   371,    -1,   205,
      -1,   292,   205,    -1,   364,    -1,   341,   205,    -1,   341,
     364,    -1,   345,    -1,   341,   345,    -1,   367,    -1,   369,
     367,    -1,   368,   367,    -1,   369,     1,    -1,   368,     1,
      -1,   366,    -1,   369,   366,    -1,   368,   203,    -1,   368,
     341,   203,    -1,   369,    -1,   368,    -1,    -1,   105,   365,
     206,   119,   376,   118,    -1,   105,   365,   139,   119,   376,
     118,    -1,   105,   365,   119,   376,   118,    -1,   291,   206,
     365,   115,    -1,   206,    -1,   111,   206,    -1,   110,   206,
      -1,   373,    -1,   374,   117,   373,    -1,   107,   374,   115,
      -1,   107,   374,   206,   115,    -1,   372,    -1,   375,    -1,
     376,   372,    -1,   376,   375,    -1,   108,   112,   233,   117,
     233,   113,    -1,   106,   112,   365,   117,   206,   113,    -1,
     107,   112,   365,   117,   206,   113,    -1,   105,   112,   365,
     113,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   254,   254,   282,   340,   341,   441,   445,   448,   449,
     450,   499,   501,   506,   511,   516,   518,   523,   525,   530,
     532,   537,   539,   541,   543,   545,   549,   554,   556,   558,
     560,   562,   568,   570,   575,   580,   585,   587,   589,   594,
     595,   599,   600,   611,   615,   616,   618,   623,   624,   626,
     629,   640,   650,   669,   671,   676,   677,   678,   679,   680,
     681,   682,   683,   684,   688,   689,   690,   691,   695,   696,
     697,   698,   699,   700,   701,   705,   707,   712,   714,   716,
     718,   720,   750,   752,   757,   759,   761,   763,   765,   794,
     796,   798,   803,   805,   810,   812,   816,   818,   820,   822,
     827,   830,   833,   836,   901,   903,   908,   910,   912,   914,
     916,   947,   951,   952,   953,   957,   958,   959,   963,   964,
     965,   966,   970,   973,   976,   979,   982,   987,   988,   990,
     992,   994,   996,  1001,  1005,  1008,  1011,  1014,  1017,  1022,
    1023,  1025,  1030,  1034,  1036,  1041,  1043,  1048,  1050,  1055,
    1060,  1062,  1067,  1069,  1071,  1073,  1078,  1080,  1082,  1084,
    1089,  1090,  1091,  1092,  1093,  1094,  1096,  1097,  1098,  1099,
    1100,  1101,  1103,  1104,  1105,  1106,  1107,  1108,  1109,  1110,
    1111,  1112,  1113,  1115,  1116,  1118,  1122,  1123,  1124,  1125,
    1126,  1128,  1129,  1130,  1131,  1132,  1134,  1138,  1139,  1140,
    1144,  1145,  1146,  1147,  1148,  1152,  1153,  1154,  1158,  1162,
    1163,  1164,  1165,  1166,  1167,  1168,  1169,  1173,  1177,  1178,
    1182,  1186,  1187,  1191,  1192,  1193,  1197,  1198,  1202,  1203,
    1204,  1205,  1206,  1207,  1208,  1220,  1232,  1247,  1248,  1252,
    1258,  1259,  1267,  1268,  1270,  1271,  1280,  1281,  1285,  1291,
    1298,  1304,  1311,  1317,  1326,  1333,  1339,  1345,  1351,  1357,
    1363,  1374,  1379,  1380,  1385,  1386,  1387,  1388,  1389,  1390,
    1391,  1392,  1393,  1394,  1395,  1396,  1397,  1398,  1399,  1400,
    1401,  1402,  1403,  1404,  1405,  1406,  1407,  1408,  1409,  1410,
    1411,  1412,  1413,  1414,  1416,  1417,  1418,  1419,  1420,  1422,
    1426,  1430,  1434,  1435,  1439,  1441,  1442,  1443,  1444,  1445,
    1446,  1447,  1448,  1449,  1451,  1452,  1453,  1454,  1455,  1456,
    1457,  1458,  1462,  1464,  1465,  1466,  1467,  1468,  1469,  1470,
    1471,  1472,  1474,  1475,  1476,  1477,  1478,  1479,  1480,  1481,
    1485,  1486,  1487,  1488,  1492,  1493,  1494,  1495,  1496,  1500,
    1501,  1502,  1503,  1504,  1505,  1506,  1507,  1508,  1512,  1513,
    1517,  1518,  1522,  1523,  1524,  1525,  1526,  1527,  1528,  1529,
    1533,  1534,  1538,  1539,  1540,  1541,  1542,  1543,  1544,  1548,
    1549,  1550,  1551,  1552,  1556,  1557,  1558,  1559,  1560,  1564,
    1572,  1573,  1574,  1575,  1576,  1577,  1578,  1579,  1580,  1584,
    1585,  1586,  1587,  1588,  1590,  1591,  1592,  1593,  1597,  1598,
    1599,  1601,  1602,  1606,  1607,  1608,  1610,  1611,  1615,  1616,
    1617,  1619,  1620,  1624,  1625,  1626,  1630,  1631,  1632,  1636,
    1637,  1638,  1639,  1640,  1642,  1643,  1644,  1645,  1647,  1648,
    1649,  1650,  1652,  1653,  1654,  1655,  1659,  1660,  1661,  1662,
    1663,  1665,  1666,  1667,  1668,  1672,  1673,  1674,  1675,  1676,
    1677,  1678,  1679,  1680,  1681,  1682,  1686,  1687,  1688,  1689,
    1693,  1694,  1695,  1699,  1700,  1701,  1702,  1704,  1705,  1707,
    1708,  1709,  1710,  1711,  1713,  1714,  1715,  1716,  1720,  1721,
    1722,  1724,  1725,  1727,  1728,  1729,  1730,  1731,  1733,  1734,
    1735,  1736,  1740,  1741,  1742,  1743,  1744,  1745,  1746,  1747,
    1748,  1752,  1753,  1757,  1758,  1763,  1764,  1768,  1769,  1770,
    1771,  1772,  1773,  1774,  1778,  1779,  1780,  1781,  1782,  1783,
    1784,  1785,  1786,  1790,  1791,  1792,  1793,  1794,  1798,  1799,
    1849,  1850,  1851,  1852,  1853,  1854,  1855,  1859,  1860,  1861,
    1862,  1863,  1865,  1866,  1867,  1868,  1870,  1871,  1872,  1873,
    1877,  1878,  1879,  1881,  1882,  1886,  1887,  1888,  1890,  1891,
    1895,  1896,  1897,  1899,  1900,  1904,  1905,  1906,  1910,  1911,
    1912,  1916,  1917,  1918,  1919,  1920,  1921,  1922,  1923,  1924,
    1926,  1927,  1928,  1929,  1930,  1931,  1932,  1933,  1935,  1936,
    1937,  1938,  1940,  1941,  1942,  1943,  1945,  1952,  1956,  1960,
    1967,  1968,  1969,  1970,  1971,  1973,  1974,  1978,  1979,  1980,
    1981,  1982,  1983,  1984,  1985,  1986,  1987,  1991,  1992,  1993,
    1994,  1998,  2000,  2004,  2005,  2006,  2007,  2008,  2012,  2013,
    2014,  2015,  2016,  2020,  2021,  2022,  2026,  2027,  2028,  2032,
    2036,  2037,  2041,  2042,  2043,  2047,  2048,  2050,  2051,  2052,
    2053,  2054,  2056,  2057,  2058,  2059,  2060,  2064,  2065,  2069,
    2070,  2071,  2075,  2076,  2077,  2078,  2079,  2080,  2081,  2082,
    2083,  2085,  2086,  2088,  2089,  2090,  2091,  2092,  2096,  2097,
    2101,  2102,  2106,  2107,  2111,  2112,  2113,  2118,  2119,  2123,
    2124,  2125,  2126,  2127,  2128,  2129,  2130,  2131,  2132,  2133,
    2134,  2135,  2136,  2137,  2138,  2139,  2140,  2141,  2142,  2143,
    2144,  2148,  2149,  2150,  2151,  2152,  2153,  2154,  2155,  2156,
    2157,  2158,  2159,  2160,  2161,  2162,  2163,  2164,  2165,  2166,
    2167,  2173,  2175,  2177,  2179,  2181,  2183,  2185,  2187,  2189,
    2191,  2196,  2197,  2201,  2207,  2216,  2217,  2218,  2222,  2223,
    2224,  2226,  2227,  2228,  2232,  2236,  2244,  2253,  2262,  2263,
    2265,  2266,  2270,  2277,  2284,  2287,  2300,  2314,  2317,  2319,
    2321,  2326,  2327,  2331,  2332,  2333,  2334,  2335,  2336,  2337,
    2338,  2342,  2343,  2344,  2345,  2346,  2347,  2348,  2349,  2350,
    2351,  2355,  2356,  2357,  2358,  2359,  2360,  2361,  2362,  2363,
    2364,  2368,  2369,  2370,  2371,  2372,  2373,  2374,  2375,  2376,
    2377,  2378,  2379,  2383,  2384,  2385,  2386,  2387,  2388,  2389,
    2390,  2391,  2392,  2396,  2397,  2401,  2402,  2403,  2404,  2405,
    2406,  2407,  2408,  2409,  2411,  2413,  2431,  2448,  2449,  2453,
    2454,  2455,  2456,  2457,  2458,  2459,  2460,  2461,  2479,  2496,
    2497,  2498,  2499,  2500,  2501,  2502,  2503,  2504,  2505,  2506,
    2507,  2508,  2526,  2543,  2544,  2545,  2546,  2547,  2548,  2549,
    2550,  2551,  2552,  2553,  2554,  2555,  2573,  2590,  2591,  2595,
    2596,  2597,  2598,  2599,  2603,  2604,  2605,  2606,  2607,  2608,
    2612,  2616,  2617,  2618,  2619,  2620,  2625,  2634,  2643,  2652,
    2665,  2666,  2667,  2669,  2714,  2715,  2716,  2728,  2733,  2735,
    2737,  2739,  2741,  2743,  2745,  2747,  2749,  2751,  2753,  2755,
    2757,  2759,  2761,  2766,  2768,  2770,  2772,  2774,  2776,  2778,
    2783,  2784,  2785,  2786,  2790,  2791,  2792,  2793,  2794,  2795,
    2799,  2800,  2801,  2802,  2803,  2804,  2808,  2809,  2811,  2813,
    2818,  2819,  2820,  2821,  2822,  2826,  2827,  2828,  2829,  2830,
    2834,  2835,  2836,  2837,  2838,  2842,  2843,  2844,  2860,  2861,
    2862,  2863,  2876,  2892,  2893,  2898,  2899,  2903,  2904,  2905,
    2906,  2909,  2910,  2914,  2915,  2919,  2920,  2921,  2925,  2926,
    2927,  2931,  2932,  2933,  2934,  2938,  2939,  2943,  2944,  2949,
    2950,  2951,  2952,  2953,  2954,  2973,  2974,  2978,  2979,  2980,
    2981,  2982,  2983,  2985,  2986,  2987,  2988,  2992,  2993,  2994,
    2995,  2996,  2998,  2999,  3000,  3004,  3005,  3006,  3007,  3008,
    3009,  3013,  3014,  3015,  3020,  3021,  3022,  3023,  3024,  3025,
    3026,  3027,  3028,  3029,  3031,  3032,  3033,  3037,  3038,  3039,
    3040,  3041,  3042,  3043,  3047,  3048,  3052,  3053,  3054,  3058,
    3059,  3060,  3061,  3063,  3064,  3065,  3067,  3068,  3069,  3070,
    3072,  3073,  3074,  3078,  3079,  3080,  3081,  3082,  3086,  3087,
    3088,  3089,  3090,  3091,  3092,  3096,  3097,  3098,  3102,  3103,
    3107,  3108,  3109,  3110,  3114,  3115,  3116,  3118,  3119,  3120,
    3124,  3128,  3129,  3131,  3132,  3133,  3137,  3138,  3139,  3140,
    3144,  3145,  3149,  3150,  3151,  3155,  3156,  3157,  3158,  3159,
    3160,  3161,  3165,  3166,  3167,  3168,  3172,  3173,  3174,  3175,
    3179,  3183,  3187,  3189,  3192,  3198,  3199,  3200,  3204,  3205,
    3206,  3207,  3208,  3209,  3213,  3214,  3218,  3219,  3220,  3222,
    3223,  3225,  3226,  3227,  3228,  3229,  3231,  3232,  3236,  3237,
    3238,  3239,  3240,  3241,  3242,  3243,  3244,  3246,  3247,  3248,
    3249,  3250,  3251,  3252,  3255,  3256,  3257,  3258,  3259,  3260,
    3261,  3265,  3266,  3267,  3268,  3269,  3270,  3271,  3272,  3276,
    3277,  3278,  3279,  3285,  3286,  3289,  3290,  3293,  3294,  3295,
    3296,  3300,  3301,  3313,  3314,  3317,  3320,  3322,  3323,  3324,
    3326,  3328,  3329,  3331,  3332,  3333,  3334,  3335,  3336,  3337,
    3338,  3339,  3340,  3344,  3345,  3346,  3348,  3349,  3351,  3353,
    3357,  3358,  3359,  3360,  3361,  3365,  3366,  3367,  3369,  3374,
    3375,  3376,  3380,  3381,  3382,  3386,  3390,  3391,  3392,  3396,
    3397,  3401,  3402,  3406,  3407,  3408,  3409,  3413,  3417,  3421,
    3425
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
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
  "VIRTUAL", "EXT_ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT",
  "ANY_OBJECT", "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH",
  "STOPWATCHING", "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER",
  "CLASS_NO_EXPANSION", "CLASS_FIXED", "ISPROPSET",
  "CLASS_DEFAULT_PROPERTY", "PROPERTY_CATEGORY", "CLASS_DATA",
  "CLASS_PROPERTY", "SUBCLASS", "NAMESPACE", "NEW0OP", "RENEW0", "VAARG",
  "DBTABLE", "DBFIELD", "DBINDEX", "DATABASE_OPEN", "'*'", "'<'", "'>'",
  "'('", "')'", "'~'", "';'", "'='", "','", "'}'", "'{'", "'.'", "':'",
  "'$'", "'['", "']'", "'&'", "'+'", "'-'", "'!'", "'/'", "'%'", "'^'",
  "'|'", "'?'", "$accept", "guess_type", "type", "base_strict_type",
  "base_strict_type_name", "strict_type",
  "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start",
  "class_function_definition_start_error",
  "virtual_class_function_definition_start_error",
  "class_function_definition", "class_function_definition_error",
  "instance_class_function_definition_start",
  "instance_class_function_definition_start_error",
  "instance_class_function_definition",
  "instance_class_function_definition_error", "data_member_initialization",
  "data_member_initialization_error", "data_member_initialization_list",
  "data_member_initialization_list_error",
  "data_member_initialization_list_coloned",
  "members_initialization_list_coloned", "members_initialization_list",
  "members_initialization_list_error", "instantiation_named",
  "instantiation_named_error", "guess_instantiation_named",
  "guess_instantiation_named_error", "external_guess_instantiation_named",
  "instantiation_unnamed", "instantiation_unnamed_error",
  "instantiation_anon", "instantiation_anon_error", "default_property",
  "default_property_error", "default_property_list",
  "default_property_list_error", "property_start", "property_body",
  "property", "class_property_start", "class_property_body",
  "class_property", "watch_property_list", "property_watch",
  "property_watch_list", "self_watch_definition", "watch_definition",
  "stopwatching", "firewatchers", "struct_declaration",
  "struct_declaration_error", "struct_declaration_list",
  "struct_declaration_list_error", "template_datatype",
  "template_type_argument", "template_type_parameter",
  "template_identifier_argument", "template_identifier_parameter",
  "template_expression_argument", "template_expression_parameter",
  "template_parameter", "template_parameters_list", "template_argument",
  "template_arguments_list", "class_entry", "class_decl", "class",
  "class_head", "class_error", "identifier", "primary_expression",
  "simple_primary_expression", "anon_instantiation_expression",
  "anon_instantiation_expression_error", "primary_expression_error",
  "postfix_expression", "simple_postfix_expression",
  "argument_expression_list", "argument_expression_list_error",
  "common_unary_expression", "unary_expression", "simple_unary_expression",
  "unary_operator", "cast_expression", "multiplicative_expression",
  "additive_expression", "shift_expression",
  "relational_expression_smaller_than", "relational_expression",
  "equality_expression", "and_expression", "exclusive_or_expression",
  "inclusive_or_expression", "logical_and_expression",
  "logical_or_expression", "conditional_expression",
  "assignment_expression", "assignment_operator", "expression",
  "expression_anon_inst", "postfix_expression_error",
  "simple_postfix_expression_error", "common_unary_expression_error",
  "unary_expression_error", "simple_unary_expression_error",
  "cast_expression_error", "multiplicative_expression_error",
  "additive_expression_error", "shift_expression_error",
  "relational_expression_error", "equality_expression_error",
  "and_expression_error", "exclusive_or_expression_error",
  "inclusive_or_expression_error", "logical_and_expression_error",
  "logical_or_expression_error", "conditional_expression_error",
  "assignment_expression_error", "expression_error",
  "expression_anon_inst_error", "constant_expression",
  "constant_expression_error", "storage_class_specifier",
  "external_storage_class_specifier", "enumerator", "enumerator_list",
  "enum_specifier", "enum_specifier_nocompound", "enum_specifier_compound",
  "enum_specifier_compound_error", "enum_decl", "enum_class",
  "enum_class_error", "class_specifier", "class_specifier_error",
  "ext_storage", "type_qualifier", "type_qualifier_list", "type_specifier",
  "strict_type_specifier", "struct_declarator", "struct_declarator_list",
  "struct_entry", "struct_or_union_specifier_compound",
  "struct_or_union_specifier_compound_error",
  "struct_or_union_specifier_nocompound", "struct_decl", "struct_head",
  "struct_class", "struct_class_error", "struct_or_union",
  "specifier_qualifier_list", "guess_specifier_qualifier_list",
  "declaration_specifiers", "guess_declaration_specifiers",
  "external_guess_declaration_specifiers",
  "external_guess_declaration_specifiers_error", "_inheritance_specifiers",
  "inheritance_specifiers", "property_specifiers", "renew_specifiers",
  "new_specifiers", "identifier_list_error", "identifier_list",
  "direct_declarator_nofunction", "direct_declarator_function_start",
  "direct_declarator_function", "direct_declarator_function_error",
  "direct_declarator", "ext_decl", "ext_attrib",
  "direct_abstract_declarator", "direct_abstract_declarator_noarray",
  "pointer", "abstract_declarator", "abstract_declarator_noarray",
  "declarator", "declarator_function", "declarator_function_error",
  "declarator_nofunction", "initializer", "initializer_error",
  "initializer_condition", "initializer_condition_error",
  "initializer_list", "init_declarator", "init_declarator_error",
  "init_declarator_list", "init_declarator_list_error", "type_name",
  "guess_type_name", "parameter_declaration",
  "parameter_declaration_error", "parameter_list", "parameter_list_error",
  "parameter_type_list", "parameter_type_list_error", "statement",
  "statement_error", "asm_field", "asm_field_list", "asm_statement",
  "labeled_statement", "labeled_statement_error", "declaration_mode",
  "member_access", "declaration", "external_guess_declaration",
  "external_guess_declaration_error", "declaration_error",
  "declaration_list", "declaration_list_error", "statement_list",
  "statement_list_error", "compound_inside", "compound_inside_error",
  "compound_start", "compound_statement", "compound_statement_error",
  "expression_statement", "selection_statement",
  "selection_statement_error", "iteration_statement",
  "iteration_statement_error", "jump_statement", "jump_statement_error",
  "function_definition", "function_definition_error", "string_literal",
  "external_declaration", "external_declaration_error",
  "translation_unit_error", "translation_unit", "thefile",
  "dbtable_definition", "dbfield_entry", "dbindex_item",
  "dbindex_item_list", "dbindex_entry", "dbfield_definition_list",
  "database_open", "dbfield", "dbindex", "dbtable", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short int yytoknum[] =
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
     355,   356,   357,   358,   359,   360,   361,   362,   363,    42,
      60,    62,    40,    41,   126,    59,    61,    44,   125,   123,
      46,    58,    36,    91,    93,    38,    43,    45,    33,    47,
      37,    94,   124,    63
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned short int yyr1[] =
{
       0,   134,   135,   135,   136,   136,   137,   138,   139,   139,
     139,   140,   140,   141,   142,   143,   143,   144,   144,   145,
     145,   146,   146,   146,   146,   146,   146,   147,   147,   147,
     147,   147,   148,   148,   149,   150,   151,   151,   151,   152,
     152,   153,   153,   153,   154,   154,   154,   155,   155,   155,
     155,   155,   155,   156,   156,   157,   157,   157,   157,   157,
     157,   157,   157,   157,   158,   158,   158,   158,   159,   159,
     159,   159,   159,   159,   159,   160,   160,   161,   161,   161,
     161,   161,   162,   162,   163,   163,   163,   163,   163,   164,
     164,   164,   165,   165,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   167,   167,   168,   168,   168,   168,
     168,   169,   170,   170,   170,   171,   171,   171,   172,   172,
     172,   172,   173,   173,   173,   173,   173,   174,   174,   174,
     174,   174,   174,   175,   176,   176,   176,   176,   176,   177,
     177,   177,   178,   179,   179,   180,   180,   181,   181,   182,
     183,   183,   184,   184,   184,   184,   185,   185,   185,   185,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   188,   188,   188,
     189,   189,   189,   189,   189,   190,   190,   190,   191,   192,
     192,   192,   192,   192,   192,   192,   192,   193,   194,   194,
     195,   196,   196,   197,   197,   197,   198,   198,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   200,   200,   201,
     202,   202,   202,   202,   202,   202,   202,   202,   203,   203,
     203,   203,   203,   203,   204,   205,   205,   205,   205,   205,
     205,   206,   207,   207,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     209,   210,   211,   211,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     214,   214,   214,   214,   215,   215,   215,   215,   215,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   217,   217,
     218,   218,   219,   219,   219,   219,   219,   219,   219,   219,
     220,   220,   221,   221,   221,   221,   221,   221,   221,   222,
     222,   222,   222,   222,   223,   223,   223,   223,   223,   224,
     225,   225,   225,   225,   225,   225,   225,   225,   225,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   227,   227,
     227,   227,   227,   228,   228,   228,   228,   228,   229,   229,
     229,   229,   229,   230,   230,   230,   231,   231,   231,   232,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   234,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   235,   235,   235,   235,
     236,   236,   236,   237,   237,   237,   237,   237,   237,   237,
     237,   237,   237,   237,   237,   237,   237,   237,   238,   238,
     238,   238,   238,   238,   238,   238,   238,   238,   238,   238,
     238,   238,   239,   239,   239,   239,   239,   239,   239,   239,
     239,   240,   240,   241,   241,   242,   242,   243,   243,   243,
     243,   243,   243,   243,   244,   244,   244,   244,   244,   244,
     244,   244,   244,   245,   245,   245,   245,   245,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   247,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   247,   247,   247,
     248,   248,   248,   248,   248,   249,   249,   249,   249,   249,
     250,   250,   250,   250,   250,   251,   251,   251,   252,   252,
     252,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     254,   254,   254,   254,   254,   254,   254,   255,   255,   255,
     255,   255,   255,   255,   255,   255,   255,   256,   256,   256,
     256,   257,   258,   259,   259,   259,   259,   259,   260,   260,
     260,   260,   260,   261,   261,   261,   262,   262,   262,   263,
     264,   264,   265,   265,   265,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   267,   267,   268,
     268,   268,   269,   269,   269,   269,   269,   269,   269,   269,
     269,   269,   269,   269,   269,   269,   269,   269,   270,   270,
     271,   271,   272,   272,   273,   273,   273,   274,   274,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   277,   277,   277,   277,   277,   277,   277,   277,   277,
     277,   278,   278,   279,   279,   280,   280,   280,   281,   281,
     281,   281,   281,   281,   282,   283,   283,   284,   285,   285,
     285,   285,   286,   286,   286,   286,   286,   286,   286,   286,
     286,   287,   287,   288,   288,   288,   288,   288,   288,   288,
     288,   289,   289,   289,   289,   289,   289,   289,   289,   289,
     289,   290,   290,   290,   290,   290,   290,   290,   290,   290,
     290,   291,   291,   291,   291,   291,   291,   291,   291,   291,
     291,   291,   291,   292,   292,   292,   292,   292,   292,   292,
     292,   292,   292,   293,   293,   294,   294,   294,   294,   294,
     294,   294,   294,   294,   294,   294,   294,   295,   295,   296,
     296,   296,   296,   296,   296,   296,   296,   296,   296,   297,
     297,   297,   297,   297,   297,   297,   297,   297,   297,   297,
     297,   297,   297,   298,   298,   298,   298,   298,   298,   298,
     298,   298,   298,   298,   298,   298,   298,   299,   299,   300,
     300,   300,   300,   300,   301,   301,   301,   301,   301,   301,
     302,   303,   303,   303,   303,   303,   304,   304,   304,   304,
     305,   305,   305,   305,   306,   306,   306,   307,   308,   308,
     308,   308,   308,   308,   308,   308,   308,   308,   308,   308,
     308,   308,   308,   309,   309,   309,   309,   309,   309,   309,
     310,   310,   310,   310,   311,   311,   311,   311,   311,   311,
     312,   312,   312,   312,   312,   312,   313,   313,   313,   313,
     314,   314,   314,   314,   314,   315,   315,   315,   315,   315,
     316,   316,   316,   316,   316,   317,   317,   317,   318,   318,
     318,   318,   318,   319,   319,   320,   320,   321,   321,   321,
     321,   321,   321,   322,   322,   323,   323,   323,   324,   324,
     324,   325,   325,   325,   325,   326,   326,   327,   327,   328,
     328,   328,   328,   328,   328,   329,   329,   330,   330,   330,
     330,   330,   330,   330,   330,   330,   330,   331,   331,   331,
     331,   331,   331,   331,   331,   332,   332,   332,   332,   332,
     332,   333,   333,   333,   334,   334,   334,   334,   334,   334,
     334,   334,   334,   334,   334,   334,   334,   335,   335,   335,
     335,   335,   335,   335,   336,   336,   337,   337,   337,   338,
     338,   338,   338,   338,   338,   338,   338,   338,   338,   338,
     338,   338,   338,   339,   339,   339,   339,   339,   340,   340,
     340,   340,   340,   340,   340,   341,   341,   341,   342,   342,
     343,   343,   343,   343,   344,   344,   344,   344,   344,   344,
     345,   346,   346,   346,   346,   346,   347,   347,   347,   347,
     348,   348,   349,   349,   349,   350,   350,   350,   350,   350,
     350,   350,   351,   351,   351,   351,   352,   352,   352,   352,
     353,   354,   355,   355,   355,   356,   356,   356,   357,   357,
     357,   357,   357,   357,   358,   358,   359,   359,   359,   359,
     359,   359,   359,   359,   359,   359,   359,   359,   360,   360,
     360,   360,   360,   360,   360,   360,   360,   360,   360,   360,
     360,   360,   360,   360,   360,   360,   360,   360,   360,   360,
     360,   361,   361,   361,   361,   361,   361,   361,   361,   362,
     362,   362,   362,   363,   363,   363,   363,   364,   364,   364,
     364,   365,   365,   366,   366,   366,   366,   366,   366,   366,
     366,   366,   366,   366,   366,   366,   366,   366,   366,   366,
     366,   366,   366,   367,   367,   367,   367,   367,   367,   367,
     368,   368,   368,   368,   368,   369,   369,   369,   369,   370,
     370,   370,   371,   371,   371,   372,   373,   373,   373,   374,
     374,   375,   375,   376,   376,   376,   376,   377,   378,   379,
     380
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     2,     2,     1,     2,     1,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     2,     1,     3,
       2,     2,     2,     2,     2,     2,     2,     2,     1,     2,
       1,     2,     2,     2,     2,     2,     2,     1,     1,     3,
       1,     3,     3,     1,     1,     3,     3,     1,     3,     3,
       3,     3,     1,     2,     2,     1,     1,     2,     2,     2,
       2,     1,     2,     2,     1,     1,     2,     2,     1,     2,
       2,     2,     2,     1,     2,     2,     3,     4,     5,     4,
       3,     4,     2,     3,     4,     5,     4,     3,     4,     5,
       5,     4,     2,     3,     3,     3,     3,     2,     4,     3,
       3,     2,     4,     3,     2,     3,     2,     3,     2,     1,
       2,     3,     3,     3,     2,     1,     3,     3,     1,     3,
       3,     2,     4,     5,     3,     4,     3,     1,     3,     3,
       3,     2,     3,     2,     4,     5,     3,     4,     3,     1,
       3,     3,     2,     1,     2,     2,     2,     1,     2,     5,
       7,     9,     6,     8,     4,     6,     1,     2,     3,     4,
       3,     2,     2,     2,     1,     1,     4,     3,     3,     3,
       2,     2,     2,     4,     1,     2,     1,     3,     3,     1,
       1,     3,     7,     1,     2,     4,     1,     2,     2,     1,
       1,     2,     3,     3,     2,     2,     1,     1,     2,     2,
       1,     2,     2,     2,     2,     1,     2,     1,     1,     2,
       4,     4,     6,     2,     4,     4,     6,     1,     1,     3,
       1,     2,     4,     1,     1,     1,     1,     3,     1,     1,
       1,     3,     3,     3,     3,     3,     3,     1,     3,     1,
       2,     2,     3,     3,     5,     5,     6,     6,     2,     2,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     1,     3,     1,     1,     4,     4,     5,     8,
       1,     1,     2,     2,     6,     6,     5,     5,     6,     6,
       5,     5,     7,     7,     6,     6,     7,     7,     6,     6,
       4,     5,     4,     6,     4,     1,     1,     1,     1,     3,
       1,     2,     2,     2,     1,     4,     4,     3,     4,     4,
       3,     3,     2,     2,     4,     4,     3,     4,     3,     3,
       2,     2,     1,     4,     4,     3,     4,     4,     3,     3,
       2,     2,     4,     4,     3,     4,     3,     3,     2,     2,
       1,     1,     3,     3,     1,     1,     3,     3,     2,     2,
       2,     2,     2,     4,     2,     4,     5,     5,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     3,     3,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     3,     3,     2,
       1,     2,     3,     3,     3,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     3,     3,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     1,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     1,     3,     3,     3,
       3,     3,     3,     3,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     3,     2,
       1,     3,     3,     1,     1,     2,     2,     3,     3,     3,
       3,     5,     3,     3,     3,     5,     3,     3,     1,     2,
       2,     3,     3,     3,     3,     5,     3,     3,     3,     5,
       3,     3,     2,     2,     2,     2,     3,     2,     5,     6,
       6,     1,     1,     1,     1,     1,     4,     1,     3,     3,
       3,     3,     3,     3,     1,     3,     3,     3,     3,     3,
       3,     3,     3,     1,     3,     3,     3,     3,     1,     2,
       3,     3,     3,     3,     3,     3,     3,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     1,     5,     5,     5,     5,     4,     4,     4,     4,
       5,     5,     5,     5,     4,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     3,     3,     2,     2,
       1,     3,     3,     3,     3,     3,     3,     1,     2,     3,
       3,     3,     3,     2,     2,     2,     2,     1,     2,     3,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     3,     3,     1,     3,     2,     1,
       2,     2,     2,     4,     4,     3,     3,     4,     5,     4,
       6,     6,     4,     5,     4,     6,     6,     2,     2,     2,
       5,     3,     5,     6,     5,     7,     7,     8,     8,     7,
       7,     3,     3,     3,     4,     3,     5,     5,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     4,     4,
       1,     1,     2,     2,     3,     5,     2,     3,     5,     5,
       5,     1,     3,     2,     2,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     4,     3,     2,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     1,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     1,     1,     2,     1,
       2,     1,     2,     1,     2,     4,     5,     1,     1,     1,
       2,     1,     2,     1,     2,     1,     2,     4,     5,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     4,     5,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     4,     5,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     4,     4,     4,     3,
       2,     3,     3,     3,     3,     2,     2,     2,     3,     4,
       1,     1,     2,     2,     1,     1,     4,     1,     3,     2,
       3,     3,     3,     3,     4,     4,     4,     2,     3,     3,
       3,     4,     4,     3,     2,     3,     3,     3,     4,     4,
       1,     2,     2,     3,     1,     1,     2,     2,     2,     3,
       1,     1,     2,     2,     2,     3,     1,     2,     3,     2,
       1,     2,     2,     3,     3,     1,     2,     2,     3,     3,
       1,     2,     2,     3,     3,     1,     3,     4,     1,     4,
       2,     5,     3,     1,     1,     1,     1,     1,     1,     3,
       3,     2,     2,     1,     3,     2,     3,     3,     1,     3,
       3,     1,     2,     3,     3,     1,     2,     1,     2,     2,
       2,     2,     3,     1,     1,     3,     3,     1,     3,     4,
       3,     4,     3,     3,     4,     3,     4,     1,     3,     3,
       4,     3,     3,     3,     4,     1,     3,     3,     3,     3,
       3,     1,     3,     2,     1,     1,     1,     1,     1,     2,
       1,     1,     1,     1,     2,     2,     2,     1,     1,     1,
       1,     1,     2,     1,     1,     4,     1,     3,     0,     6,
       8,    10,    12,     8,    10,    10,     5,     7,     9,    11,
       7,     9,     9,     3,     4,     4,     3,     3,     3,     4,
       4,     3,     2,     3,     2,     1,     1,     1,     1,     1,
       2,     3,     2,     2,     2,     3,     3,     2,     5,     6,
       2,     2,     2,     2,     2,     2,     1,     2,     2,     3,
       1,     2,     1,     2,     2,     1,     2,     2,     2,     2,
       2,     2,     1,     1,     2,     2,     1,     1,     2,     2,
       1,     2,     2,     1,     2,     1,     2,     2,     5,     5,
       7,     7,     5,     5,     3,     2,     5,     4,     4,     7,
       6,     6,     5,     7,     6,     4,     7,     9,     3,     4,
       4,     5,     5,     5,     6,     7,     6,     6,     5,     5,
       4,     3,     2,     1,     2,     3,     4,     3,     4,     5,
       4,     3,     2,     2,     2,     3,     3,     3,     3,     2,
       2,     1,     1,     4,     3,     3,     2,     4,     3,     3,
       2,     1,     2,     1,     1,     2,     1,     2,     3,     3,
       1,     2,     2,     2,     3,     4,     4,     2,     2,     2,
       2,     1,     2,     1,     2,     1,     2,     2,     1,     2,
       1,     2,     2,     2,     2,     1,     2,     2,     3,     1,
       1,     0,     6,     6,     5,     4,     1,     2,     2,     1,
       3,     3,     4,     1,     1,     2,     2,     6,     6,     6,
       4
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
    1251,   261,     6,   638,   639,   640,   641,   642,   700,   701,
     702,   703,   704,   706,   709,   710,   707,   708,   694,   695,
     699,   705,   781,   782,   649,  1097,   239,   718,   914,   692,
       0,     0,   917,  1095,  1096,   719,   720,   711,     0,     0,
       0,     0,     0,   940,     0,  1220,   829,   714,     8,     4,
       0,     0,     0,  1214,     0,  1233,   894,   823,     0,   713,
       0,   688,   690,   831,   833,   696,   825,   827,   764,   712,
       0,     0,   689,   691,     0,     0,     0,     0,     0,   960,
     693,   915,     0,     0,     0,  1216,  1238,  1213,  1235,  1245,
    1240,     0,     0,     0,  1231,     0,  1228,  1211,     0,     0,
    1217,     0,     0,     0,     0,  1230,  1229,     0,   697,   941,
     693,   942,   894,   911,   910,   956,     0,     0,     0,     0,
    1107,     0,   241,   240,     0,     0,   249,     0,   248,     2,
       3,     0,     5,     0,   651,   650,     0,     0,   669,     0,
       0,     0,     0,   768,     0,   754,   753,  1110,   640,  1104,
     830,  1215,  1234,   894,   824,   832,   834,   826,   828,   960,
     693,     0,     0,     0,     0,  1001,     0,     0,     0,   900,
       0,     0,   633,   634,   635,   636,   637,  1014,   905,   817,
     889,   811,     0,   821,     0,   813,   815,   764,   819,     0,
       0,  1013,     0,     0,  1017,  1027,     0,     0,     0,     0,
     962,     0,   961,     0,   722,   723,   724,   725,   726,   728,
     731,   732,   729,   730,   721,   727,   740,   733,     0,     0,
    1140,   736,     0,     0,   801,   735,   807,   803,   805,   809,
     734,     0,  1116,     0,     0,     0,     0,  1206,  1210,   640,
       0,  1227,  1222,  1236,     0,  1223,  1239,  1221,  1237,  1232,
    1244,  1247,     0,     0,     0,     0,     0,  1242,  1243,  1246,
    1241,     1,     0,  1218,  1219,  1212,     0,     0,   474,   270,
       0,     0,     0,     0,     0,     0,   368,   369,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   363,     0,   366,
       0,     0,   362,   364,   365,   367,     0,   265,     0,   264,
     304,   262,   473,     0,   358,   370,     0,   372,   379,   384,
     390,     0,   399,   408,   413,   418,   423,   426,   429,   446,
       0,   512,   511,   515,   517,   524,   533,   538,   547,   560,
     565,   570,   575,   578,   581,     0,   271,   295,   296,   297,
     298,     0,     0,     0,     0,     0,   698,   943,   913,   912,
       0,   957,     0,   895,   959,   733,   736,   208,   230,   229,
     228,   237,     0,   264,   370,   429,   631,   515,     0,   220,
     205,   253,     0,     0,   252,   259,     0,     0,  1098,  1099,
     711,     0,   176,     0,   179,   180,     0,     0,     0,     0,
       0,   183,   250,     4,     0,     0,     0,     0,    28,    30,
     164,   186,   189,     0,   190,     0,   115,   118,     0,   196,
     127,     0,   165,   139,     0,   174,     0,   197,   200,     0,
       0,   264,     0,     0,     0,     0,   965,   693,     0,    12,
      18,     0,   836,   835,   843,   837,     0,   839,   841,   764,
     848,   847,   254,   260,   251,     0,     0,   243,   242,   682,
     643,   646,   681,   685,   671,     0,     0,     0,     0,   223,
     224,   225,   226,     0,   218,   474,   770,     0,     0,   767,
     474,   769,     0,     0,   474,   771,     0,     0,     0,   962,
       0,   961,     0,   995,     0,     0,  1204,  1208,  1002,  1105,
       0,     0,  1106,   899,     0,   264,   632,     0,     0,     0,
       0,   651,   650,   652,     0,   755,     0,     0,     0,  1011,
     818,   894,   812,   822,   814,   816,   820,   693,   945,   944,
       0,     0,     0,   904,     0,     0,   903,     0,     0,     0,
    1043,     0,   901,   902,   963,   964,     0,     0,  1114,  1102,
    1113,    75,  1111,  1100,   894,   802,   808,   804,   806,   810,
     693,     0,  1115,  1112,  1103,     0,  1117,     0,  1205,  1209,
    1118,     0,     0,     0,     0,     0,     0,     0,     0,  1202,
       0,     0,     0,  1045,     0,     0,     0,   156,  1047,  1048,
       0,     0,     0,   264,     0,   370,     0,     0,   515,   610,
     617,     0,  1122,  1125,  1053,  1044,  1057,     0,     0,     0,
       0,  1144,  1142,  1046,  1059,     0,  1060,  1051,  1058,     0,
    1061,  1141,     0,     0,  1224,   894,     0,     0,     0,  1234,
       0,     0,  1210,  1248,     0,     0,     0,   916,   488,     0,
       0,   322,     0,   360,   354,   514,   513,   507,     0,   349,
     502,   350,   503,     0,   883,   873,   881,   875,   877,   879,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,   787,   783,   785,   789,  1005,
       0,   272,     0,   300,     0,   341,     0,   340,     0,   476,
      92,     0,   475,     0,   312,   313,     0,     0,     0,   456,
     457,   458,   459,   460,   461,   462,   463,   464,   465,   455,
       0,     0,   352,   505,   351,   504,     0,     0,     0,     0,
       0,     0,     0,   391,   539,     0,     0,   389,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   715,     0,
     320,   321,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   716,   717,     0,     0,
       0,  1263,  1264,     0,     0,     0,   958,     0,    10,     9,
       0,     0,     0,     0,     0,   693,   944,   206,     0,   208,
       0,   264,     0,     0,   855,   849,   851,   853,     0,     0,
       0,    16,    20,     0,     0,     0,     0,     0,     0,     0,
       0,   363,     0,   264,     0,    26,    21,    27,    24,     0,
      25,    23,    22,    29,    31,   163,   187,    82,   162,   188,
     121,   172,     0,     0,     0,     0,   131,     0,     0,   133,
       0,     0,   142,   175,   201,   198,   203,   202,   199,   204,
     114,     0,     0,   161,     0,   894,   751,     0,   970,   693,
       0,    11,    17,   741,   907,  1013,     0,     0,   967,     0,
     966,     0,     0,   184,   170,   191,   194,     0,   195,     0,
     171,   894,     0,     0,   651,   650,   844,   838,   840,   842,
       0,     0,     0,   648,   684,     0,     0,     7,   213,   209,
     221,   766,     0,     0,    61,    52,    91,    38,    37,    56,
      68,    44,    47,     0,    73,    55,     0,     0,     0,   984,
     986,     0,   983,   985,     0,    40,    43,   963,   964,   474,
       0,   975,   978,   994,   997,  1203,  1207,   999,  1003,  1000,
    1004,   898,   896,   897,  1040,  1022,  1031,   656,   655,     0,
       0,   474,   756,     0,     0,   474,   757,     0,     0,   927,
     894,     0,     0,     0,     0,     0,   919,     0,     0,     0,
    1012,   948,   947,     0,     0,   946,  1016,  1015,     0,   888,
    1039,   891,  1025,  1033,     0,   887,  1038,   890,  1023,  1032,
       0,  1042,  1036,   892,  1018,  1028,     0,  1037,   893,  1020,
    1029,     0,     0,     0,    76,     0,  1101,  1119,     0,     0,
       0,     0,     0,     0,  1184,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1045,     0,   264,     0,  1182,  1050,
    1052,     0,     0,  1192,  1193,  1194,     0,  1200,     0,     0,
       0,     0,     0,     0,   157,   143,  1056,  1055,  1054,     0,
       0,     0,   618,     0,   474,  1049,     0,     0,     0,     0,
     469,     0,     0,   474,     0,     0,     0,     0,  1123,  1126,
    1128,     0,  1124,  1127,  1129,     0,  1155,  1062,  1225,  1226,
     241,   240,     0,     0,     0,  1208,  1209,     0,  1108,     0,
     795,   264,     0,   506,   797,   791,   793,   799,  1007,     0,
     490,   489,     0,   330,   331,     0,     0,     0,     0,   338,
     339,     0,     0,     0,     0,     0,     0,     0,     0,   884,
     874,   882,   876,   878,   880,   693,   951,   950,     0,   869,
     859,   867,   861,   863,   865,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   263,     0,
     788,   784,   786,   790,  1006,     0,   474,     0,     0,     0,
     104,     0,   299,   474,     0,     0,    93,   474,     0,     0,
     477,   311,   474,   307,   345,   479,   480,   344,   483,   310,
       0,     0,   451,   447,   301,   373,   518,   374,   519,   375,
     520,   474,   380,   525,   474,   381,   527,   385,   534,   386,
     535,   393,   541,   394,   542,   392,   540,   474,   404,   556,
     400,   548,   474,   405,   557,   401,   549,   411,   563,   409,
     561,   416,   568,   414,   566,   421,   573,   419,   571,   424,
     576,   427,   579,   606,     0,   627,     0,     0,     0,     0,
     453,   449,   478,   319,   474,   316,     0,   484,   487,   318,
       0,     0,   452,   448,   376,   521,   377,   522,   378,   523,
     474,   382,   529,   474,   383,   531,   387,   536,   388,   537,
     397,   545,   398,   546,   395,   543,   396,   544,   474,   406,
     558,   402,   550,   474,   407,   559,   403,   551,   412,   564,
     410,   562,   417,   569,   415,   567,   422,   574,   420,   572,
     425,   577,   428,   580,   607,     0,     0,     0,     0,   454,
     450,     0,     0,  1256,  1259,     0,     0,  1254,  1265,  1266,
       0,     0,   208,   236,   235,   234,   264,   238,   233,   232,
     231,     0,     0,     0,     0,     0,     0,     0,     0,   947,
     245,     0,   244,   126,     0,   124,   856,   850,   852,   854,
       0,    15,    19,     0,   178,   177,   181,     0,   970,   693,
       0,   138,     0,   136,   856,     0,   264,     0,    83,   116,
     119,   117,   120,   128,   129,   130,   132,   140,   141,   113,
     111,   112,    13,   743,   746,     0,   160,     0,   972,     0,
     971,     0,     0,   742,   894,   908,   968,   969,   894,   169,
     192,   168,   193,   167,     0,     0,     0,     0,     0,   644,
     645,   647,     0,     0,   674,   670,     0,     0,     0,     0,
       0,     0,   227,   219,   217,    35,    36,    74,    53,     0,
      54,     0,    63,    60,    71,    66,    72,    59,    89,    38,
      69,    62,    90,    58,    70,    67,     0,    57,     0,    32,
      34,    33,   987,   988,     0,   664,   654,     0,   659,   653,
       0,   918,   928,   929,   922,   920,   921,   949,   930,     0,
       0,   923,     0,     0,     0,  1026,  1034,  1013,  1024,  1019,
    1021,  1030,   737,   738,   739,   474,     0,     0,  1086,  1091,
       0,     0,  1087,  1093,     0,     0,     0,     0,   474,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1181,   474,     0,  1145,   264,     0,
       0,     0,  1191,  1197,  1198,  1195,  1196,     0,     0,     0,
       0,   144,  1083,  1088,   158,   474,   615,   611,     0,     0,
       0,   474,   467,   619,   474,   616,   613,   474,   468,   620,
       0,  1207,  1109,     0,     0,   353,   796,   798,   792,   794,
     800,  1008,     0,   491,   329,   474,   325,   493,   494,   497,
     328,     0,     0,   492,   337,   474,   334,     0,   498,   501,
     336,     0,     0,   292,   290,     0,     0,   934,     0,     0,
       0,     0,     0,     0,   954,   953,     0,   952,     0,     0,
       0,   870,   860,   868,   862,   864,   866,     0,   267,     0,
     266,   294,     0,     0,     0,     0,     0,     0,  1270,     0,
       0,     0,   371,   516,   107,   105,   343,   342,    98,   102,
     308,     0,   309,   305,   306,   628,     0,     0,     0,     0,
       0,     0,   317,     0,   314,   315,     0,     0,     0,     0,
    1258,  1257,  1261,     0,     0,     0,  1253,  1252,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     0,     0,   122,
     125,     0,     0,   173,   972,     0,   971,     0,     0,   134,
     137,     0,    14,   474,     0,     0,   752,     0,   973,   974,
     744,   747,   909,   185,   166,   845,     0,   247,   246,     0,
     673,     0,   214,   207,   215,   210,   211,   222,    50,    45,
      48,    51,    46,    49,    36,    42,    39,    41,     0,     0,
     991,   992,   663,     0,   658,     0,   931,   932,   925,   924,
     926,  1010,  1009,    78,  1084,  1089,  1085,  1090,     0,     0,
       0,     0,   474,  1158,     0,   474,     0,  1157,  1190,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1165,     0,  1146,   474,  1147,   474,     0,     0,     0,  1068,
     916,  1068,     0,     0,   154,     0,     0,     0,   159,     0,
       0,   508,   326,     0,   327,   323,   324,   335,     0,   332,
     333,   291,   885,   933,   935,   936,   276,   277,     0,   955,
     937,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   268,   280,   281,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   474,   347,   346,   471,   629,   438,
     598,   430,   582,   442,   602,   434,   590,   472,   630,   439,
     599,   431,   583,   443,   603,   435,   591,   474,   440,   600,
     432,   584,   444,   604,   436,   592,   441,   601,   433,   585,
     445,   605,   437,   593,  1260,  1262,  1255,   857,     0,   123,
     149,   973,   974,     0,   135,    85,     0,     0,   846,     0,
       0,     0,     0,     0,     0,     0,     0,   989,   990,   979,
       0,     0,     0,     0,  1148,  1149,  1152,  1153,  1156,  1189,
       0,     0,     0,     0,     0,     0,     0,  1162,   474,   474,
       0,     0,     0,  1066,     0,  1064,  1076,     0,  1068,     0,
    1068,     0,     0,     0,     0,   510,   509,   474,   474,   886,
     938,   939,   274,   275,   871,   284,   285,     0,     0,     0,
       0,     0,   278,   279,   288,   289,     0,     0,   293,  1268,
    1269,  1267,   858,     0,   745,   748,   750,   749,     0,     0,
     216,   212,   981,     0,     0,     0,     0,     0,     0,     0,
    1177,  1160,     0,     0,  1161,  1174,     0,  1164,  1176,     0,
       0,  1068,     0,  1068,     0,  1068,     0,  1069,     0,     0,
       0,   147,     0,   152,     0,   155,     0,   872,   282,   283,
       0,     0,   976,   286,   287,   182,  1150,  1151,     0,     0,
    1159,  1166,     0,  1163,  1175,  1080,  1067,     0,     0,     0,
    1077,     0,     0,  1068,  1068,     0,  1068,   146,   145,   150,
     148,     0,     0,   371,   516,   269,   977,     0,     0,  1065,
       0,     0,  1068,  1073,     0,     0,  1070,     0,     0,   153,
    1167,  1081,  1082,  1078,     0,     0,     0,     0,  1068,   151,
       0,  1074,  1075,  1071,     0,  1079,     0,  1072
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,   179,    47,    48,   888,   296,   394,   395,   396,   397,
     398,   399,   400,   401,   897,   898,   899,   900,   901,   902,
     903,   904,   905,   906,   907,   908,   222,   223,   402,   403,
      50,   297,   298,   673,   701,   406,   407,   408,   409,   410,
     411,   412,   413,   414,   415,  1980,  1981,  1982,   416,   580,
     581,   582,   417,   418,   419,   420,   357,   358,   459,   359,
     460,   360,   461,   462,   780,   361,   362,    51,    52,    53,
      54,    55,   299,   300,   301,   909,   910,   302,   303,   632,
     676,  1166,   304,   585,   634,   306,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   662,
     755,   587,  1227,   321,   635,   322,   588,   637,   324,   325,
     326,   327,   328,   329,   330,   331,   332,   333,   334,   589,
     590,  1017,  1229,   369,   498,   181,    57,   451,   452,   182,
      59,   183,   184,    60,    61,    62,    63,    64,    65,   185,
     109,   186,   228,   846,   847,   187,   188,   189,    69,    70,
      71,    72,    73,   190,   669,  1088,   370,   424,    75,    76,
     441,   442,   789,  1125,   650,   951,   952,    77,   425,    79,
     426,   115,   110,    81,   518,  1116,   428,   520,  1118,   118,
     429,   430,   853,  1442,  1443,   915,   916,  1444,   164,   165,
     166,   167,   670,  1089,   194,   195,   196,   197,   198,   199,
     592,   593,  1903,  1904,   594,   595,   596,    84,   431,   232,
      85,    86,   233,   234,   235,   599,   600,   601,   602,   236,
     603,   809,  1511,  1019,   606,   607,   608,  1020,   610,    87,
      88,   336,    89,    90,    91,    92,    93,    94,   761,  1304,
    1305,   762,   763,   337,   338,   339,   340
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1451
static const int yypact[] =
{
   34324, -1451, -1451, -1451, -1451,   -12, -1451, -1451, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
    1176,    64, -1451, -1451, -1451, -1451, -1451, -1451,   -19,    -2,
      10,   102,   127,  1391,  1214, -1451, -1451, -1451,    41, -1451,
      54,   102,  1048, -1451,   594,   182,  1094, -1451,   401, -1451,
    1161, -1451,   185, -1451, -1451, -1451, -1451, -1451,   990, -1451,
    1340,   204, -1451,   211,   523, 33972,  1214,   445,  9671, -1451,
     708, -1451,  1192,  4715,  3694, -1451, -1451, -1451, -1451, -1451,
   -1451, 34412, 33611,   344, -1451,    64, -1451, -1451,   127,   127,
     342,   281,   127, 27061,   102, -1451, -1451,   406, -1451,  1391,
   -1451, -1451, -1451,   445, -1451, -1451,   708,  1192,   839, 11672,
   -1451,   248,  1028,   576, 28224, 36135, -1451, 28340, -1451, -1451,
   -1451,   102, -1451,  1412,  1399,  1431,   147, 36135, -1451, 36281,
   28456, 36135, 28572, -1451, 28688, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451,   182,   484, -1451, -1451, -1451, -1451, -1451,   774,
     708,  1192,  1181,  4715,   520, -1451,  1406,   309,  1436, -1451,
   25090,   348, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
     928, -1451,   642, -1451,   379, -1451, -1451,   457, -1451,   509,
     677, 31916,   203,   478, -1451, -1451,   547,   656,   475,   546,
   -1451,   371, -1451,   371, -1451, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,   641,   650,
   -1451, -1451,   157,    93, -1451, -1451, -1451, -1451, -1451, -1451,
   -1451, 34148, -1451, 16478,  3184, 36710, 16607, -1451,   605,   699,
    1341, -1451, -1451,   182, 34060, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451,   185,   211, 34847,  4715, 35106, -1451, -1451, -1451,
   -1451, -1451,   676,   342,   342, -1451, 27061,   380, -1451, -1451,
   27134, 27207, 27207,   767, 36354, 27061, -1451, -1451,   812,   845,
   36354, 27061,   866,   890,   920,   941,   962, -1451, 21349, -1451,
     127, 25163, -1451, -1451, -1451, -1451,   783, -1451,   137,   819,
   -1451, -1451, -1451, 11833, -1451,  1339, 25163, -1451,  1056,  1305,
    1430, 27061,  1047,  1470,   910,   953,   963,  1089,   156,  1339,
    1016,   632, -1451,  1339, -1451,  1203,  1458,  1609,  1164,  1616,
     992,  1104,  1137,  1323,   321,  1339,   342, -1451, -1451, -1451,
   -1451,  1190,    61, 35531,  1229,  1252, -1451, -1451,   445, -1451,
    1192, -1451,   371, -1451, -1451,   812,   783,  1260, -1451, -1451,
   -1451, -1451,   858,   909, -1451,   390, -1451, -1451,   545, -1451,
   36523, -1451, 21237, 36281, -1451,   921, 35843, 35191, -1451, -1451,
     812,  1273, -1451,   102, -1451, -1451,    64, 35276, 35021,  5374,
   36208, -1451, -1451,   783,  1210,  1269,  1269,  1259, -1451,  1306,
   -1451, -1451,  1331,   144,  1015,   153, -1451, -1451,   582,  1278,
   -1451,  1250, -1451, -1451,   930, -1451,  1338, -1451, -1451, 27760,
   27876,   672,   205,   632, 32965, 34586, -1451,   708,  1192, -1451,
   -1451, 32871, -1451, -1451,  1346, -1451,   102, -1451, -1451, -1451,
     102, 36354, -1451,   921, -1451, 27992, 28108,  1383,  1395, -1451,
    1439, -1451,  1393, -1451, -1451,   867,  1409,   719,    64, -1451,
   -1451, -1451, -1451,   191,   126,   863, -1451, 28804, 28920, -1451,
     957, -1451, 29036, 29152,  1003, -1451, 29268, 29384, 19573,  1198,
    1192,   774,   371, -1451, 25236,  3184, -1451,   605, -1451, -1451,
    1214,  1214, -1451, -1451,  1413,   579, -1451,  1418,  1423, 35916,
    1553,  1454,  1459, -1451, 29500, -1451, 29616,  8907, 25309,  1214,
   -1451,   928, -1451, -1451, -1451, -1451, -1451,    98,   731,   212,
     228,  1182,  1445, -1451, 35618,  1491, -1451, 35693,  1509, 35768,
    1531, 35989, -1451, -1451, -1451, -1451, 27061,   102, -1451, -1451,
    1478, -1451, -1451, -1451,  1538, -1451, -1451, -1451, -1451, -1451,
     708,  1443,   309, -1451, -1451,  1545, -1451, 16736, -1451,   605,
   -1451,   196, 25382,  1547,  1554,  1558,    88, 16865,  1568,    64,
    1566,  1570, 16994, 34236,  1242,  1578,  1580,    64, -1451, -1451,
    1579,  1581,  1588,  1442, 15183,  1339, 15317, 22754,  1339,  1339,
   -1451, 15446, -1451, -1451, -1451, -1451, -1451, 17123, 17252, 17381,
   17510, -1451, -1451, -1451,   605, 17639, -1451, -1451, -1451, 17768,
   -1451, -1451,   127,   127,   342,   765,   102,  1446,  1564, -1451,
    4715,  3184, -1451, -1451, 34934, 27061,  1589, -1451, -1451, 21477,
     233, -1451, 11967, -1451, -1451,   707, -1451, -1451, 25455, -1451,
   -1451, -1451, -1451, 36354,  1583, -1451, -1451, -1451, -1451, -1451,
   32487, 36354, 21605,    64, 32583, 36354, 27061,   127,   127,   127,
   27061, -1451, 12101, 12235, 12369, -1451, -1451, -1451, -1451,  7728,
    1582,   342, 19701, -1451,   237, -1451,   435, -1451, 19829,  1590,
   -1451, 19957, -1451,  1567, -1451, -1451,  8163,  1571, 27061, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
   25163,   266, -1451, -1451, -1451, -1451, 27061, 27061, 27061, 27280,
   27353, 27061, 27061,  1430,  1609, 27061, 27061, -1451, 27061, 25528,
   25601, 25163, 25163, 25163, 27061, 27061, 12503, 25163, -1451,  1576,
   -1451, -1451, 22827,  1587, 27061, 25163, 27061, 27061, 27061, 27426,
   27499, 27061, 27061, 27061, 27061, 27061, 27061, 25674, 25747, 25163,
   25163, 25163, 27061, 27061, 12637, 25163, -1451, -1451,   907,   928,
   36208, -1451, -1451, 33699, 35531, 35531, -1451, 11672, -1451, -1451,
   11672, 11672, 25163, 25163, 11570,   735,   804, -1451,   660,   319,
     954,   792,  1095,  1586,  1596, -1451, -1451, -1451,   102,  4932,
   35191, -1451, -1451,    64,  1595,  1597,  1604, 33153,  1592,    64,
   10619,  1391, 21717,   638, 35361, -1451, -1451,   605, -1451,   605,
   -1451, -1451, -1451,   605, -1451, -1451,  1600, -1451, -1451,   891,
   -1451, -1451,  2859,  2859,  1269,  1269, -1451,  1269,   127, -1451,
    1269,  1269, -1451, -1451,  1042, -1451, -1451,  1042, -1451, -1451,
    1106, 25820,  1115, -1451, 27061,   826, -1451,  1476,   445,   708,
    1192, -1451, -1451,    36,   348, 31916, 11426,   497, -1451,   371,
   -1451,   371,  1214, -1451, -1451, -1451,  1607,   276,  1611,   300,
   -1451,   672, 33059, 11672, -1451, -1451,  1617, -1451, -1451, -1451,
   36281, 36281, 27061,    64, -1451, 31588,   250, -1451,  1032,  1206,
    1619, -1451, 36281,    64, -1451, -1451, -1451,  1269, -1451, -1451,
   -1451, -1451, -1451,  7846,  1477, -1451, 20085, 36619, 20213, -1451,
   -1451, 10778, -1451, -1451, 35446, -1451, -1451,   774,  1198, -1451,
   25893, -1451, -1451, -1451, -1451, -1451,   605, -1451, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,  1393,   257,
     284,  1614, -1451, 29732, 29848,  1615, -1451, 29964, 30080, -1451,
     429,   621,   622,  1623,  1630,  1632, -1451,  1626,  1627,  1628,
    1256,   731,   212, 34673, 25966,   731, -1451, -1451, 36062, -1451,
   -1451,   928, -1451, -1451, 36062, -1451, -1451,   928, -1451, -1451,
   36062, -1451, -1451,   928, -1451, -1451, 36062, -1451,   928, -1451,
   -1451,  1640,  1641,   331, -1451, 20341, -1451, -1451, 17897,  1634,
    1636, 18026, 27061, 27061, -1451, 26039, 26112,  1637,  1647,  1648,
   21932,  1649,    64, 22900, -1451,  1308,  1479, 22973,  1706, -1451,
   -1451, 23046,  1651, -1451, -1451, -1451,  1655,  1656, 23119, 15575,
     127,  1660, 27061, 27061,    64, -1451, -1451, -1451, -1451, 22060,
    1082, 26185, -1451,   902, -1451, -1451, 27572, 12771, 12905, 26258,
   -1451, 27645, 13039,  1545, 18155, 18284, 18413, 18542, -1451, -1451,
   -1451, 18671, -1451, -1451, -1451, 18800, -1451, -1451,   342,   342,
    1663,  1664, 31703, 31818,  3184, -1451, -1451,  1661, -1451,   854,
   -1451,   672,  1662, -1451, -1451, -1451, -1451, -1451,  7728,  1666,
    1590, -1451,  1594, -1451, -1451, 23192,  1602, 27061,  1603, -1451,
   -1451, 23265,  1610, 27061,  1667, 36427, 11672, 34499, 27061,  1668,
   -1451, -1451, -1451, -1451, -1451,   696,  1669,  1670,  1654,  1673,
   -1451, -1451, -1451, -1451, -1451, 32679, 23338,  1674,  1675,  1676,
   27061,  1679, 32775,  1680,   536,   236,   247,  1682, -1451,    64,
   -1451, -1451, -1451, -1451, -1451, 27061,   330, 10942, 20469,  1685,
   -1451, 25163, -1451,   335, 33247, 20597, -1451,   353, 33338, 20725,
   -1451, -1451, -1451, -1451, -1451,   841,  1691, -1451, -1451, -1451,
   23411,  6036, -1451, -1451,  1685, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451,  1056,  1203, -1451,  1056,  1203,  1305,  1458,  1305,
    1458,  1430,  1609,  1430,  1609,  1430,  1609, -1451, -1451, -1451,
    1047,  1164, -1451, -1451, -1451,  1047,  1164, -1451, -1451,  1470,
    1616, -1451, -1451,   910,   992, -1451, -1451,   953,  1104,   963,
    1137,  1089,  1323, -1451,   107, -1451, 23484,  1671,  6982,  1672,
   -1451, -1451, -1451, -1451, -1451, -1451,  1108, -1451, -1451, -1451,
   23557,  7353, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
   -1451,  1056,  1203, -1451,  1056,  1203,  1305,  1458,  1305,  1458,
    1430,  1609,  1430,  1609,  1430,  1609,  1430,  1609, -1451, -1451,
   -1451,  1047,  1164, -1451, -1451, -1451,  1047,  1164, -1451, -1451,
    1470,  1616, -1451, -1451,   910,   992, -1451, -1451,   953,  1104,
     963,  1137,  1089,  1323, -1451, 23630,  1684,  8742,  1686, -1451,
   -1451,    64,    64, -1451, -1451,   748,   631, -1451, -1451, -1451,
   33790, 33881, -1451, -1451, -1451, -1451,   896, -1451, -1451, -1451,
   -1451, 23703,  1687,  9168,  1688, 23776,  1689,  9849,  1690,   804,
   -1451, 11672, -1451, -1451, 11672, -1451,   611, -1451, -1451, -1451,
     627, -1451, -1451,   419, -1451, -1451, -1451,  1499,  1683,   708,
    1192, -1451,  1699, -1451,   923,   687,   552,  1700, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451,   342, -1451, -1451,  3496,
   -1451, -1451, -1451, -1451, -1451, 20853, -1451,   598,   445,   371,
     445,   371, 27061, -1451,   885, -1451, -1451, -1451,  1701, -1451,
    1600, -1451,  1590, -1451,  1510,  1098, 11672,  1140,  1141, -1451,
   -1451, -1451, 30196, 30312,  1704, -1451,  1075, 36354, 36354, 36354,
   36354, 27061, -1451, -1451, -1451, -1451,   605, -1451, -1451, 26331,
   -1451, 26404, -1451, -1451, -1451,  1519,  1477, -1451, -1451,  1269,
   -1451, -1451, -1451, -1451, -1451,  1519,  1477, -1451, 26477, -1451,
   -1451, -1451, -1451, -1451, 18929, -1451, -1451,   178, -1451, -1451,
     231, -1451, -1451, -1451, -1451, -1451, -1451,   731, -1451,  1702,
    1703, -1451,  1696,  1697,  1705, -1451, -1451, 31916, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451,   360, 33429, 20981, -1451, -1451,
   22060, 22060, -1451, -1451, 23849, 15704, 23922, 23995, -1451, 22188,
   24068, 15833, 21932,  1710,  1711, 21932, 27061, 26550,  1767, 24141,
    1656,  7197,   127, 21932,  1713, 32298, 21932, -1451,  1520, 24214,
   11078, 24287, -1451, -1451, -1451, -1451, -1451,   244,   127,  1720,
    1280, -1451, -1451, -1451, -1451, -1451, -1451, -1451,  1714,  1722,
      64, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
   36281, -1451, -1451,  1723,  1724, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451, 13173, -1451, -1451, -1451, -1451,  1356,  1725, -1451,
   -1451, 24360, 11275, -1451, -1451, -1451, -1451,  1359, -1451, -1451,
   -1451, 24433, 22316, -1451, -1451,  1726,  1148, -1451,  1727,  1728,
    1730,  1721,  1729, 11672,  1669,  1670, 34760,  1669, 27061, 11672,
   27061,  1734, -1451, -1451, -1451, -1451, -1451,  1712, -1451, 26623,
   -1451, -1451,  1731,  1732, 27061, 27061,  1735,  4375, -1451,    64,
      64, 27061, -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,
   -1451, 13307, -1451, -1451, -1451, -1451, 26696, 13441, 13575, 26769,
   13709, 13843, -1451, 13977, -1451, -1451, 14111, 14245, 14379, 14513,
   -1451, -1451, -1451,   907,  1736,   469, -1451, -1451, 25163, 25163,
   25163, 25163, 25163, 25163, 25163, 25163,  1835,  1159, 11672, -1451,
   -1451,  1738,  1269, -1451,  1683,   371,  1683,   371,  1744, -1451,
   -1451,  1742, -1451,   400, 33520, 21109, -1451,   708,   445,   445,
    1733,  1741, -1451, -1451, -1451, -1451,  1207, -1451, -1451, 31588,
    1748, 31588, -1451, -1451,  1749, -1451,  1750, -1451,  2125, -1451,
   -1451,  2125, -1451, -1451, -1451,  2125, -1451, -1451, 19058, 19187,
   -1451, -1451, -1451, 31588, -1451, 31588, -1451, -1451, -1451, -1451,
   -1451, -1451,  1256, -1451, -1451, -1451, -1451, -1451, 21932,  8339,
   21932,  8339, 32013, -1451, 22060, -1451, 15962, -1451, -1451, 21932,
   21932, 24506, 21932, 24579, 21804,  1752, 22389, 24652,   279, 19316,
   -1451, 27061, -1451, 32108, -1451, 32393, 21932, 22462, 26842,   127,
    1753,   127,   334,  1758, -1451,    64, 27061, 27061,    64, 14647,
   14781, -1451, -1451, 14915, -1451, -1451, -1451, -1451, 15049, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451, -1451,  1275,  1669,
   -1451,  1754,  1765,  1763,  1764,  1287,  1770,  1771, 11672, 27061,
   21349, 25893, -1451, -1451, -1451,  1772,  1777,  1779,  1780, 27061,
    1776,  1778,  1793,  1797, -1451, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451,   545, -1451, -1451, -1451,   545, -1451, -1451, -1451,
   -1451, -1451,   545, -1451, -1451, -1451,   545, -1451, -1451, -1451,
   -1451,   545, -1451, -1451, -1451,   545, -1451, -1451, -1451,   545,
   -1451, -1451, -1451,   545, -1451, -1451, -1451, -1451,  1289, -1451,
   -1451,  1683,  1683, 25163, -1451, -1451, 27061, 27061, -1451, 30428,
   30544, 31588, 30660, 30776, 36354, 36354, 19445, -1451, -1451, -1451,
   30892, 31008, 31124, 31240,  1783,  1849, -1451, -1451, -1451, -1451,
   21932, 27061, 26915,  1753, 16091, 16220, 22535, -1451, 32203, -1451,
   22060, 24725, 16349, -1451,  1023,   391, -1451,   245,   127,  1806,
     127,   512,   618,  1809,  1366, -1451, -1451, -1451, -1451, -1451,
   -1451, -1451, -1451, -1451, -1451, -1451, -1451,  1294,  1799,  1800,
    1814, 22608, -1451, -1451, -1451, -1451,  1805,  1807, -1451, -1451,
   -1451, -1451, -1451,  1817, -1451, -1451, -1451, -1451, 31356, 31472,
   -1451, -1451, -1451, 21932, 21932, 24798, 22681, 21932, 24871, 21804,
    1818, -1451, 21932, 27061, -1451, -1451, 22060, -1451, -1451,  1819,
     127,   127, 27061,   127,  1821,   127,  1301, -1451,   278,  1269,
     705, -1451,   260, -1451,  1820, -1451,    64, -1451, -1451, -1451,
   26988, 24944, -1451, -1451, -1451, -1451, -1451, -1451,  1818, 21932,
   -1451, -1451, 25017, -1451, -1451, -1451, -1451,  1394,  1831,  1402,
   -1451,  1361,  1832,   127,   127,  1837,   127, -1451, -1451, -1451,
   -1451,   512,   715, -1451, -1451, -1451, -1451, 21932,  1840, -1451,
    1841,  1843,   127, -1451,  1416,  1421, -1451,  1373,   659, -1451,
   -1451, -1451, -1451, -1451,  1426,  1845,  1848,  1850,   127, -1451,
    1852, -1451, -1451, -1451,  1432, -1451,  1854, -1451
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
   -1451,  1995,   -49,    -3, -1451,  1801, -1451, -1451, -1451, -1451,
   -1451, -1451,  1515,  1539,  -864, -1451,  -891,  -742,   221,   225,
    -849,  -829,  -788, -1451,  -639,  -479, -1451, -1451,  1541,  1543,
   -1451,  1318,   777, -1451,  -225,   827,   829, -1451, -1451, -1451,
   -1451,  1550, -1451, -1451, -1451,  -574,  -993,   -45, -1451, -1451,
   -1451, -1451,   971,  1156,   -54,   -44,    42,  -751, -1451,  -699,
   -1451,  -735, -1451,  1086,   -94,  1215,  -833,    -4,  1737,    71,
    1739,    51,     0, -1451,  1717,  5158,  4316, -1451,  3442, -1451,
    -514,  -662,  1718,  3951, -1451, -1451,  -194,   424,   596,  -126,
   -1451,   491,  -417,    44,  -195,   328,    87,  2009,  9619,  2401,
     -96,  9833,   122,   674, -1451,  1719,  4955, -1451,  -172,   724,
     790,   -50,   499,   337,   438,   447,   481,   477,  2545,  5085,
    1665,  9211,   597,  1004,   593,  6843,   -66,  1101,   -34,    22,
    8770,  7425, -1451, -1451, -1451,   -79,   -46,   -28, -1451,  6261,
   -1451,   912,  1883,   613,  -311,  2921,  8007, -1451,  8955, -1451,
   -1451, -1451,   -70,  3244, -1451, -1451,  1452,  3557,   -31, -1451,
   -1451,  1367,  1606,  1342,  1716,   -55,   -32,  4390,  6174,  7352,
    -365,  -111,  2903,  1149,  -506, -1080,  9269,  -351,  -585,   -48,
    1145,  -339,  1084,  -477,  -474,  -836,  -827,   200,  1163,  1165,
     -42,  1773,  -648, -1451,  -307,  -294,  1591, -1451,  -499,  -482,
    5225,  -354,    33,  -800, -1451, -1451, -1451,  1914, -1451,   235,
    1922,   -30,   643,   -60,  1775,  1066,  1076, -1451, -1451, -1451,
     -82,   470, -1450,  -218, -1451, -1451, -1451,     7, -1451,  1923,
       3,    69,  1917,  1584, -1451, -1451, -1451,  1928,  -739,   370,
   -1451,  -737,   914, -1451, -1451, -1451, -1451
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1251
static const short int yytable[] =
{
      56,   237,   121,  1034,  1127,  1370,   351,   923,   954,   154,
     924,   961,   252,   965,  1371,  1423,  1313,  1433,   605,   777,
    1318,   253,    58,   192,  1308,   955,  1309,   162,   162,   155,
      99,   101,  1315,  1147,   168,  1584,  1320,  1587,   792,  1154,
    1395,   106,  1158,  1429,   112,   463,   193,   156,   122,  1747,
     351,   123,   131,   244,   246,   341,   132,  1425,   135,  1435,
     254,  1758,   858,   860,     1,    95,   674,     1,  1314,  1131,
    1237,   145,  1319,   445,   146,   153,   112,  1426,   180,  1436,
     112,   486,   112,   446,    56,   852,   467,   248,   472,  1004,
     476,    56,    56,   102,   540,   262,   468,    58,   473,   100,
     477,     1,   455,   485,   342,     1,    58,   345,  1625,    96,
     103,   107,   704,    58,    58,    32,   112,   112,  1427,   363,
    1437,   494,   104,   132,   421,   434,   152,   421,   447,  -207,
       2,   448,    97,   450,   705,   243,   450,   434,   679,   464,
     421,   434,   421,   521,   421,   816,   151,   436,   453,   131,
       1,   119,   558,   132,   819,   242,   953,  1382,   538,   436,
     112,   112,   251,   436,  1424,  1430,  1434,   263,   264,   120,
     495,   267,  1165,   725,   757,   252,   597,   252,   154,  1712,
     132,   458,   502,   162,   253,   713,   253,   145,   154,   551,
     146,   511,   935,  1148,  1413,   621,   162,   553,   155,  1155,
    1005,   112,  1159,   112,   522,   936,   840,    43,   155,   700,
     507,   541,   683,   684,   685,     1,   156,   972,  1236,  1343,
     978,   508,   984,   727,   989,   624,   246,   735,  -470,   966,
     973,   544,  1714,   979,  1090,   985,   583,   990,  1149,   766,
     613,   265,   893,   609,   615,  1059,  1063,  1759,  1973,   265,
     616,  1404,   265,     1,    56,   680,    56,  1433,  1445,   248,
       1,   714,   817,     1,  1433,   454,    58,  1174,  1433,   961,
     965,   680,   539,  1576,   644,   954,    58,  1390,    58,   782,
     644,  2014,  1759,  1429,   265,  1448,    28,     1,   495,   726,
    1429,    32,   955,  1713,  1429,   883,  -662,  1892,    38,  1435,
     128,  1392,   891,   138,  1209,   619,  1435,   243,   892,   614,
    1435,   554,   806,   808,   810,   812,   523,   686,  1144,  1436,
     524,   841,     1,   142,   507,   687,  1436,   623,   688,   143,
    1436,  -108,  1280,  1979,     1,   508,   -99,  1908,   753,   265,
   -1010, -1010,   132,   759,   261, -1010,  1715,   265,   883,  -657,
     112,   680,   112,  1609,  -103,  1150,  1476,  1760,  1974,   671,
    1437,   -81,  1970,   371,  1610,  1761,  1975,  1437,  1405,   766,
     856,  1437,   781,   464,     1,  1446,   784,   511,  2019,   605,
     605,   605,   605,   795,  1150,   265,   796,   759,   784,   803,
     759,  2015,  1893,   193,   817,  1970,   265,   266,   436,  2016,
    1761,   -88,  1449,   925,     1,  1430,  1434,   725,   351,     1,
     436,   265,  1430,  1434,   779,   458,  1430,  1434,   680,   421,
     421,   132,     1,   953,   845,   180,   491,   112,   112,     2,
    -889,   871,     1,  1558,     2,   767,   875,   145,  1340,  1568,
     146,   876,   162,   162,  1474,   421,   421,  1909,  -108,  1355,
     943,  1342,   947,   -99,   754,  1910,  1457,   889,   890,   957,
     944,   960,   948,   436,  1459,   499,   938,   421,   421,   556,
     560,  -103,   421,   421,   265,   674,   421,   421,   -81,   525,
     112,  1460,   112,    44,   858,   860,  1347,     1,   992,  1041,
     112,   112,  1049,   627,  1386,   132,  1387,   503,   528,   759,
     450,  1657,   674,  1972,   421,  1789,   421,   950,   495,   112,
     674,   132,  1175,  1177,  1179,     1,  1477,   112,   -88,   112,
     133,   488,  1578,   772,   971,   343,     1,   977,  1217,   983,
     674,   988,  1662,   852,  1176,  1178,  1180,   993,   129,   130,
    1597,   265,  1244,  1246,  1248,   252,  -889,  1606,   528,    26,
     112,     2,  1151,   238,   253,     1,  1288,   169,   154,  1152,
    1074,  1394,   753,  1686,  1245,  1247,  1249,  1016,   170,  1022,
    1128,  1308,  1308,  1309,  1309,  1440,   504,  1035,   155,     1,
    1318,  1557,     1,   820,  1856,  1979,  1433,  1567,   532,  1191,
    1193,   526,  1195,   129,   130,   527,  1320,   583,   583,   583,
     583,     1,  1706,   478,   609,   609,   609,   609,  1579,  1385,
   -1035,  1707,  1429,  1070,   529,   132,  1071,  1260,  1262,  1264,
    1266,     1,   522,   525,   511,  1580,  -894,   505,  1435,  1081,
       1,  -894,  1656,   487,     1,  -998,    97,  -998,  -894,   729,
     730,   731,   144,  1104,  1479,     1,    58,  1483,  1436,  1608,
    1109,  1119,   495,  1129,  1109,  1119,  1692,   530,  1695,   533,
   -1035,  1465,     1,     1,   529,  1192,  1194,  1468,  1196,  1139,
       2,   681,    28,  1469,  1466,     1,  1697,    32,   773,  1470,
       1,  1068,  1069,  1161,    38,  1523,   373,  1169,   887,  1437,
       1,   374,  1471,  1261,  1263,  1265,  1267,   821,   681,   822,
    1059,  1063,  1059,  1063,   559,     2,   604,    43,     1,   126,
      44,     1,  -894,   127,  1098,  1099,  1100,  -894,     1,   844,
     556,  1658,     1,   611,  -894,   622,  1134,  1135,  1136,  1233,
    1659,  1983,  1979,  1239,  1430,  1434,  1674,  1551,   524,   527,
     129,   130,  1363,  1364,   732,  1365,  1660,   887,  1367,  1368,
    1788,     1,   733,   536,  1575,   734,  1795,   681,  1303,   132,
    1306,   500,   537,   759,   759,   759,  1213,  1316,     1, -1041,
     363,  1316,   643,   531,   180,  -910,    95,  2049,   889,   890,
     605,   129,   130,   605,  1433,   145,  1397,  1398,   146,  1336,
     511,   681,   625,  1035,  1284,  -207,   506,   511,   423,  1352,
    1354,   423,  1356,  -207,   759,    43,  1670,   521,  1107,  1312,
    1429,   436,  1221,  1312,   423,  1415,   423,    43,   423,  1101,
      44,   605,   436,  1457,   220,  1858,  1435,  1102,  2039,     1,
    1103,  1402,   556,   560,  1060,  1064,   605,   605,   605,   605,
    1292,  1403,   112,   963,    43,   132,  1436,   774,  -910,   112,
     112,   766,  1406,  -910,   964,  1384,   556,     1,   508,   112,
    -910,   112,  1388,  1642,   807,  1643,  -777,   813,   884,   768,
    -683,   132,   845,   363,   129,   130,  1296,   557,   561,   643,
     464,   464,     2,   450,   478,   421,   450,  1437,     1,  -910,
    -910,  -910,   464,  1414,  1322,  1326,  1675,  1366,  -476,  -476,
    -476,   405,   678,  -207,   405,  1447,  1450,  -207,  1331,  -207,
       1,   681,    67,    28,   112,  1462,   774,   405,    32,   405,
    -207,   405,   458,   458,   652,    38,   674,   508,  -474,  -474,
    -474,     1,  1430,  1434,   458,   129,   130,  -777,   681,   450,
     450,  -683,  -777,   421,   421,  1375,  -683,   421,   421,  -777,
     132,  1612,   353,  -683,  1620,   926,  1768,   653,  1621,  1810,
    -774,  1907,   112,   180,   495,  1927,   643,  1710,   759,   769,
    1711,   132,  -777,  1613,   759,   770,  -683,   132,   656,  -683,
     759,  -777,   885,   132,   883,  -683,   759,   158,   132,  2020,
    1528,  1529,  1530,   132,   129,   130,    67,  1682,   583,   830,
     831,   583,   657,    67,    67,   609,  -780,  -207,   609,  1156,
    1016,  -476,  1022,  -207,  1386,   681,  1387,  1301,  1302,   445,
    -207,  1508,  -265,  -265,  -265,   771,  -207,  1943,   681,   446,
    1544,  -774,   658,  1658,  1521,   721,  -774,   129,   130,   583,
    1169,  -474,  1669,  -774,  -474,  2020,   609,   630,   832,  -474,
    -474,  -474,  1219,   659,   583,   583,   583,   583,  1210,   715,
     716,   609,   609,   609,   609,  1330,  -774,   604,   604,   604,
     604,   892,   421,   421,   660,  -774,  1690,  -780,  -672,   759,
    1290,   132,  -780,  1168,   722,     1,  1281,  1791,   759,  -780,
    1075,  1076,  1554,   423,   423,   723,  1560,     1,  1564,  1517,
     139,   959,  1570,   515,  1792,   724,   363,   180,  1976,  -765,
    1978,  -765,  -780,  -475,  -475,  -475,  1721,   749,     1,   423,
     423,  -780,  1802,  1950,  1951,  1591,  1725,  1727,   557,   728,
     818,  -265,  1591,  1182,  1185,  -265,  1969,  1738,   372,   132,
    1970,   423,   423,    -8,  1971,    83,   423,   423,  1407,  -672,
     423,   423,  1930,  1408,  -672,  1000,   158,   717,   718,    26,
    1214,  -672,  -474,  1251,  1254,   706,   158,   124,    67,   125,
    1218,  2007,  1524,  2009,   497,  2011,   743,   744,   423,     1,
     423,    97,   483,   967,  -672,   707,   708,  -672,  1285,    28,
    1691,  1912,   883,  -672,    32,     1,   405,   405,  1289,  -912,
     667,    38,  1222,   129,   130,  1220,  1332,    98,   869,  1685,
    1200,  1205,   892,  2034,  2035,   770,  2037,     1,  1201,  1206,
     163,  1632,   405,   405,    43,  1633,  -475,    44,  1372,    83,
    1293,  1877,  2044,  1291,  1878,   750,   255,    83,  1271,  1276,
     557,   561,  1061,  1065,   405,   405,  1272,  1277,  2054,   405,
     405,  1687,  1688,   405,   405,    28,    28,   892,   892,  1782,
      32,    32,   605,   605,   557,   770,    28,    38,    38,   751,
    1857,    32,  -912,   605,   745,   746,   770,  -912,    38,   651,
     136,   405,   137,   405,  -912,   655,    18,    19,    28,  1060,
    1064,  1060,  1064,    32, -1009, -1009,  -993,   484,  -993, -1009,
      38,  1640,  1641,   756,    44,  1644,   132,  1187,  1189,   556,
     759,   759,   736,  -912,  -912,  -912,    28,    29,  1868,   824,
     825,    32,  1409,    43,   770,   805,    44,  1410,    38,   220,
      28,  1316,   737,   738,   363,    32,   515,  1256,  1258,   752,
    1661,   826,    38,  1521,     1,   827,    97,   828,   764,   112,
     112,  1298,    18,    19,  1030,  1671,   132,   689,   690,   691,
     692,   693,   694,   695,   696,   697,   698,  1416,   829,  1324,
    1328,   765,   612,  1312,   811,  1645,   767,   112,   220,   112,
    1889,   112,    28,    29,   132,   793,  1919,    32,   220,   163,
     835,   838,   770,  1764,    38,   823,   363,  1765,  1924,   620,
    1942,   255,   421,   421,   770,  1987,   770,  1693,  1693,  1693,
    1693,   770,  2022,   449,  2012,     1,   835,   838,  1970,  1722,
    1502,   814,  2013,   674,   674,   674,   674,   674,   674,   674,
     674,   709,   710,  1183,  1186,    18,    19,  1374,   835,   838,
     711,   712,   404,   835,   838,   404,   815,   835,   838,  1312,
    1694,  1312,  1696,   833,  1710,   699,   873,  1711,   404,   140,
     404,   141,   404,  1252,  1255,    28,    29,   511,   604,  1772,
      32,   604,  1777,  1773,  2031,  1400,  1778,    38,  1970,  1985,
     583,   583,  2032,  1986,   719,   720,  2047,   609,   609,  1016,
    1970,   583,  1016,   880,  2048,  1016,   423,   423,   609,  1508,
      43,  1188,  1190,  1016,   456,   881,  1016,  2028,   469,   604,
     883,  1970,   958,  2025,  1877,  2030,   605,  1878,  -668,  1970,
    -668,   489,   791,   490,   604,   604,   604,   604,   886,  2045,
    1035,  1257,  1259,  1970,  2046,   231,   158,   931,  1970,  2050,
     464,  1086,   932,  1970,  1541,  2056,  1965,   933,  1968,  1970,
    -667,   492,  -667,   490,   937,   882,     1,  1464,   996,   423,
     490,   681,   968,  1039,   667,  1072,   999,   125,  1160,   851,
       1,  1748,  1168,   939,     1,   836,   839,  1232,   940,     1,
    1860,  1142,   458,   363,   739,   740,   180,  1762,  1238,   363,
       1,  1376,  1420,  1377,  1421,  1553,   994,     1,   681,  1494,
    1503,   836,   839,  1559,  1563,     1,     1,  1139,   974,  1811,
    1812,  1569,  2004,     1,  1663,   231,  1377,   423,   423,   741,
     742,   423,   423,   836,   839,  1684,   980,  1377,   836,   839,
     747,   748,   836,   839,  1418,  1869,  1419,  1872,   674,   681,
    1699,  1751,  1702,  1303,  1700,  1870,  1703,  1873,   986,  1359,
    1361,  1360,  1362,   927,   929,   928,   930,   995,   363,  1880,
     997,  1882,   405,  1054,  1056,   112,  1002,   112,  1001,  1881,
    1003,  1883,   515,  1055,  1057,   257,   260,   112,  1310,  1311,
    1021,  1023,   605,  1073,   605,  1024,   231,   231,   231,   421,
    1032,   421,  1033,  1106,  1036,  1145,  1037,  1061,  1065,  1061,
    1065,  1582,   515,  1038,  1078,  1333,  1334,   231,  1156,   515,
    1344,  1351,  1345,   421,   667,   421,   515,   557,  1358,  1346,
     405,   405,  1389,  1603,   405,   405,  1391,  1396,  1016,  1016,
    1016,  1016,  -760,  -763,   583,  1411,  1451,   404,   404,  1016,
    1016,   609,  1016,  1452,  1016,  1453,   423,   423,   605,   868,
    1454,  1455,  1456,  1472,  1473,  1480,  1016,  1481,  1495,  1496,
    1497,  1499,  1504,   404,   404,  1035,  1512,   515,  1521,   620,
    1513,  1514,  1518,  1540,   373,  1545,  1542,  1588,  1583,  1552,
    1573,  1586,  1107,  1589,   515,   404,   404,  1599,  1600,  1601,
     404,   404,  1628,  1631,   404,   404,  2023,  1607,   363,  1611,
     495,    49,  1604,  1615,  1622,  1637,   170,  1639,  1649,  1651,
    1653,  1655,  1668,  1672,  1683,  1716,  1717,  1948,  2024,  1689,
    1718,  1719,   404,  1745,   404,  1749,  1766,  1949,  1905,  1720,
    1905,  1739,  1740,  1763,  1767,  1799,  1769,  1770,  1774,  1781,
    1783,  1784,   105,  1785,  1798,  1786,  -232,  1953,  1373,   405,
     405,  1855,    49,  1787,  1866,  1803,  1804,  1859,  1809,   134,
    1863,  1864,  1867,  1871,  1891,  1874,  1875,  1920,  1906,   421,
     421,   421,   421,   421,  1693,  1693,    49,  1911,  1921,    49,
     421,   421,   421,   421,   221,    49,  1399,  1922,  1923,  1938,
    1016,  1939,    49,    49,  1925,  1926,  1932,  2017,  2018,  1704,
     583,  1933,   583,  1934,  1935,    49,  1940,   609,   344,   609,
    1941,  1035,  1521,  1954,   835,   838,  1312,  1312,   835,   838,
     356,  1977,  1984,  1988,  1989,   393,   221,  1990,   393,  1993,
     914,  1994,  1995,  2000,  2005,  1341,  2010,   231,   221,  2021,
     221,   393,   221,   393,  2029,   393,   864,  2033,   421,   421,
     604,   604,  2036,  1016,  1016,  2041,  2042,  1016,  2043,  1016,
    2051,   604,  1016,  2052,   221,  2053,   583,  2055,  1463,  2057,
     865,   393,   866,   609,   867,  1681,  2038,  1905,  1412,  1905,
    1521,   870,  1035,   501,  1401,  1317,  1035,   631,   633,   636,
    1676,   617,    49,   618,   800,    46,   654,  1132,  1441,  1016,
    1549,  1931,  1383,  2006,   552,   256,   245,   247,   438,   259,
    1493,   598,   249,  1854,     0,     0,   857,   851,     0,     0,
     438,  1035,  1521,     0,   438,     0,     0,  1016,     0,     0,
       0,     0,   221,     0,     0,   221,   221,   356,  1035,  1905,
    1905,     0,  1905,     0,  1905,    49,     0,     0,     0,   231,
     231,   231,   231,     0,     0,    49,   221,    49,     0,  1439,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     150,     0,   231,   231,     0,   221,   423,   423,     0,    46,
       0,   221,  1905,  1905,     0,  1905,    46,    46,     0,   393,
       0,     0,     0,     0,     0,  1105,     0,     0,     0,   836,
     839,  1905,     0,   836,   839,     0,     0,     0,     0,     0,
       0,     0,  1581,     0,   548,     0,     0,  1905,     0,     0,
       0,     0,     0,     0,   914,     0,     0,     0,   365,     0,
     914,     0,  -474,   914,  1602,  -474,  -474,  -474,  -474,  -474,
    -474,  -474,  -474,     0,    49,     0,     0,     0,     0,   922,
       0,     0,     0,     0,     0,     0,     0,   648,     0,     0,
       0,     0,     0,   648,     0,     0,     0,     0,     0,     0,
       0,   221,     0,   356,   221,     0,     0,   221,    49,   405,
     405,  1794,     0,  1797,   794,     0,   510,     0,    49,   221,
       0,    49,     0,     0,     0,     0,     0,  1806,  1808,     0,
       0,     0,     0,   404,   604,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     393,   393,     0,     0,     0,    49,    49,     0,     0,     0,
       0,     0,   393,     0,     0,  -474,  -474,   874,     0,   150,
       0,     0,   221,     0,     0,  -474,   393,   393,     0,   150,
       0,    46,     0,   548,  -474,  -474,  -474,  -474,  -474,   787,
       0,   404,   404,     0,     0,   404,   404,     0,   393,   393,
       0,   787,     0,   393,   393,   365,     0,   393,   393,   356,
       0,     0,     0,     0,   365,     0,   221,     0,     0,     0,
     365,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      49,     0,     0,     0,     0,   393,     0,   393,    49,   393,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   879,    49,     0,     0,    49,     0,
      49,     0,    49,     0,     0,     0,     0,     0,    49,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1167,     0,     0,     0,     0,     0,     0,   914,   914,
     914,     0,     0,   423,     0,   423,     0,     0,     0,     0,
     604,     0,   604,   835,   838,     0,     0,     0,     0,   515,
       0,   365,     0,     0,     0,     0,  1680,   423,     0,   423,
     404,   404,  1929,     0,     0,     0,     0,  1167,   356,   356,
     356,   356,  1937,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   510,
       0,   221,   221,     0,     0,    49,     0,     0,     0,     0,
     393,     0,     0,     0,     0,     0,   604,     0,     0,     0,
       0,     0,     0,     0,   221,     0,     0,   914,     0,     0,
       0,   221,   221,   393,     0,   221,   221,     0,     0,  1945,
    1947,     0,     0,     0,     0,     0,   405,     0,   405,     0,
      49,     0,     0,   356,     0,     0,     0,     0,     0,   356,
       0,     0,   356,     0,     0,     0,     0,     0,     0,     0,
     405,     0,   405,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   320,     0,   231,   231,   231,   231,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   667,
       0,     0,     0,     0,     0,     0,   231,     0,     0,     0,
       0,     0,     0,  1113,  1123,     0,     0,  1113,  1123,     0,
       0,     0,     0,   423,   423,   423,   423,   423,     0,     0,
       0,     0,     0,     0,   423,   423,   423,   423,   836,   839,
       0,    49,     0,     0,    49,    49,    49,     0,   356,     0,
       0,   356,   356,     0,     0,    49,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   922,     0,     0,     0,     0,
     221,    49,  1793,     0,  1796,     0,     0,     0,    49,   914,
     914,   221,     0,   393,     0,    49,   914,   914,  1805,  1807,
     914,   914,     0,     0,     0,     0,     0,     0,     0,   150,
       0,     0,   423,   423,  1080,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   365,     0,     0,   586,     0,     0,
       0,     0,     0,     0,     0,     0,   405,   405,   405,   405,
     405,     0,     0,     0,     0,     0,    49,   405,   405,   405,
     405,     0,     0,     0,   368,     0,     0,     0,     0,     0,
       0,     0,  1339,    49,   356,     0,     0,     0,     0,     0,
       0,   221,   221,  1339,     0,     0,   393,     0,     0,     0,
       0,     0,   677,   221,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1527,   356,   221,   356,
       0,  1533,   667,     0,  1536,   221,  1539,     0,     0,     0,
     404,   404,     0,     0,     0,   405,   405,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   393,   393,     0,     0,   393,   393,
       0,     0,     0,     0,     0,   510,     0,     0,     0,     0,
    1167,     0,     0,     0,    49,   393,  1167,     0,     0,    49,
       0,     0,     0,     0,     0,    49,   365,     0,     0,   365,
     365,    49,     0,     0,     0,   510,     0,    49,     0,     0,
       0,     0,   510,     0,     0,     0,   356,   548,     0,   510,
       0,     0,     0,  1928,     0,     0,     0,     0,     0,     0,
       0,   368,     0,  1936,     0,     0,     0,     0,     0,     0,
     368,     0,     0,     0,     0,     0,   368,   914,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     835,   838,     0,   835,   838,     0,     0,     0,     0,     0,
     510,   835,   838,   835,   838,   356,   356,   356,   356,     0,
     268,     0,     1,   269,    97,     0,     0,   510,     0,     0,
    1944,  1946,     0,   393,   393,   221,     0,     0,     0,     0,
      49,     0,   365,     0,     0,   921,     0,     2,     0,    49,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,   221,   356,    49,     0,
       0,     0,     0,     0,     0,     0,     0,   368,     0,   835,
     838,    68,     0,     0,   273,     0,   221,     0,   914,   914,
     274,   275,     0,   221,     0,     0,     0,   991,     0,     0,
       0,     0,     0,     0,   278,     0,     0,   116,   221,   356,
       0,     0,     0,     0,     0,   221,   356,   279,     0,   221,
     356,   280,   281,   282,   283,   284,   285,   286,   586,     0,
       0,   638,     0,     0,     0,     0,     0,     0,   160,   116,
       0,   290,   291,     0,     0,   203,     0,    80,   548,     0,
       0,     0,     0,     0,    80,    80,    68,     0,   586,   586,
     586,   586,     0,     0,     0,    68,     0,   404,  1595,   404,
       0,     0,    68,    68,     0,  1595,     0,     0,     0,     0,
     352,   354,     0,     0,     0,   836,   839,   427,   836,   839,
     427,   404,     0,   404,     0,     0,   836,   839,   836,   839,
       0,     0,     0,   427,     0,   427,   439,   427,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1133,   439,     0,
       0,  1137,   439,     0,   482,   354,     0,     0,     0,     0,
       0,     0,     0,     0,  1543,     0,     0,     0,     0,     0,
       0,     0,     0,  1546,     0,     0,     0,   677,     0,     0,
       0,     0,     0,     0,   517,     0,     0,     0,     0,     0,
       0,  1173,     0,     0,   836,   839,     0,     0,     0,   922,
       0,    49,    49,     0,     0,   365,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   914,   914,  1231,     0,
       0,     0,   356,   677,   550,   356,  1243,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   160,     0,     0,
       0,     0,     0,     0,     0,     0,  1300,    80,     0,    80,
       0,     0,     0,     0,     0,    68,     0,     0,     0,     0,
     368,     0,     0,     0,     0,    68,   356,    68,     0,     0,
       0,     0,     0,     0,     0,   555,     0,   404,   404,   404,
     404,   404,     0,     0,     0,     0,     0,   356,   404,   404,
     404,   404,     0,   393,   393,     0,     0,     0,   221,   221,
     221,   221,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    74,     0,     0,     0,     0,     0,
     216,     0,     0,   352,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,   404,   404,    49,   217,
      38,   218,     0,   775,     0,     0,     0,   221,   356,     0,
     427,     0,     0,     0,   219,     0,  1816,     0,     0,     0,
       0,  1533,   116,     0,  1539,     0,     0,   439,  1816,     0,
       0,     0,     0,   220,     0,     0,     0,     0,     0,   439,
       0,     0,   368,     0,     0,   368,   368,     0,     0,    74,
       0,   921,   427,   427,     0,     0,     0,   849,    74,     0,
       0,   861,     0,     0,   427,    74,    74,     0,     0,     0,
     365,   221,     0,   365,     0,     0,     0,     0,   427,   427,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   439,     0,     0,     0,     0,     0,     0,   440,
     427,   427,     0,   922,     0,   427,   427,     0,     0,   427,
     427,   440,     0,   352,   356,   440,     0,    49,     0,     0,
     356,     0,     0,   116,   116,     0,     0,     0,     0,   586,
       0,     0,   586,     0,     0,   365,     0,   427,    49,   427,
     517,   586,   116,     0,     0,     0,     0,     0,   368,     0,
     365,     0,   352,     0,   354,     0,     0,     0,     0,     0,
       0,     0,     0,  1519,  1520,     0,     0,     0,  1816,     0,
     586,     0,  1173,  1816,     0,     0,     0,  1532,     0,     0,
    1243,     0,  1538,     0,     0,   586,   586,   586,   586,   356,
       0,     0,   510,     0,     0,     0,   922,     0,     0,     0,
       0,     0,     0,     0,     0,   221,   356,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    74,     0,
     393,     0,   393,     0,     0,     0,   677,     0,    74,     0,
      74,     0,   677,  -474,  -474,  -474,  -474,  -474,  -474,  -474,
    -474,  -474,  -474,  -474,   393,     0,   393,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    68,     0,     0,     0,     0,
       0,     0,  1617,  1115,     0,     0,     0,  1115,     0,     0,
       0,     0,     0,     0,     0,     0,   422,     0,     0,   422,
       0,     0,   775,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   422,     0,   422,     0,   422,     0,     0,     0,
       0,     0,   365,     0,     0,     0,   922,     0,   365,   356,
       0,   393,     0,     0,     0,     0,  -474,  -474,     0,     0,
       0,     0,     0,     0,     0,     0,  -474,     0,     0,     0,
     788,  -474,  -474,  -474,     0,  -474,  -474,  -474,  -474,  -474,
       0,     0,   788,     0,     0,   191,   365,   365,     0,   365,
     365,     0,     0,     0,     0,   365,   365,   365,   365,     0,
       0,   368,     0,     0,     0,     0,   922,   365,   365,   365,
     365,   365,   365,   365,   365,     0,     0,   365,     0,     0,
     393,   393,   393,   393,   393,   221,   221,   775,   584,     0,
       0,   393,   393,   393,   393,   788,     0,     0,     0,     0,
       0,     0,   775,   427,     0,     0,     0,     1,     0,     0,
    1349,     0,     0,   775,     0,   550,     0,     0,     0,     0,
     439,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   439,     2,     3,     4,   239,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,   116,     0,     0,     0,   393,
     393,     0,     0,  1381,     0,     0,     0,     0,   517,    26,
      27,     0,     0,     0,     0,   116,     0,     0,    28,    29,
     240,    31,     0,    32,     0,   849,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,   427,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,    42,
       0,     0,     0,    43,     0,     0,    44,   365,     0,     0,
       0,     0,     0,     0,     0,   241,     0,   849,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   921,   427,   427,     0,     0,
     427,   427,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   422,   422,   354,     0,   352,     0,     0,    74,     0,
       0,     0,   365,     0,     0,     0,   368,     0,     0,   368,
       0,   586,   586,     0,     0,     0,     0,   422,   422,     0,
     586,     0,   586,   586,     0,     0,   586,     0,     0,     0,
     760,     0,     0,     0,   586,     0,     0,   586,     0,   422,
     422,     0,     0,     0,   422,   422,     0,     0,   422,   422,
     911,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   790,     0,     0,     0,     0,     0,
       0,   368,     0,     0,   797,     0,   422,   804,   422,     0,
       0,     0,     0,     0,     0,     0,   368,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   427,   427,     0,     0,     0,
       0,     0,   855,     0,     0,     0,     0,     0,   872,     0,
       0,   775,     0,     0,     0,     0,     0,     0,     0,     0,
     921,     0,     0,     0,     0,     0,     0,     0,   775,   584,
    1115,     0,  1813,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1617,     0,     0,     0,     0,  1532,  1115,     0,
    1538,     0,     0,   788,  1617,  1115,     0,     0,     0,   584,
     584,   584,   584,     0,   788,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   305,     0,   191,     0,     0,     0,
       0,     0,     0,     0,   191,     0,     0,     0,     0,     0,
     364,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   191,     0,     0,   191,     0,   191,     0,   191,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   921,
       0,     0,     0,     0,   911,     0,     0,     0,     0,     0,
     911,   364,     0,   911,     0,     0,     0,     0,   368,   586,
     586,   586,   586,     0,   368,   586,     0,     0,     0,     0,
     586,   586,     0,   586,     0,   586,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   586,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1913,  1914,     0,
       0,     0,  1822,  1826,  1617,  1832,  1836,     0,     0,  1617,
       0,  1841,  1845,  1849,  1853,     0,     0,     0,     0,     0,
       0,     0,     0,   368,   368,   368,   368,   368,   368,   368,
     368,     0,   921,   368,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   364,     0,     0,
       0,     0,   639,   641,     0,     0,   364,     0,     0,     0,
       0,     0,   364,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   305,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1667,     0,     0,     0,   364,     0,     0,
       0,     0,   364,     0,   422,   422,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1677,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   586,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   586,     0,   586,     0,   427,   427,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     760,   760,   760,   364,     0,     0,     0,   422,     0,     0,
       0,   191,   921,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   368,     0,     0,     0,     0,   911,     0,
     911,     0,     0,     0,   586,   586,     0,     0,   586,     0,
     586,     0,     0,   586,     0,     0,     0,   586,     0,     0,
     517,     0,     0,  2008,     0,     0,     0,     0,     1,     0,
       0,     0,     0,     0,     0,   422,   422,     0,     0,   422,
     422,   921,   921,     0,     0,     0,     0,     0,     0,     0,
     586,     0,     0,     2,     0,     0,     0,     0,   368,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,   586,   364,
       0,     0,     0,     0,   113,     0,     0,   911,     0,     0,
     584,    27,     0,   584,     0,     0,     0,     0,     0,    28,
      29,     0,   584,     0,    32,     0,     0,    35,    36,   364,
      37,    38,    39,     0,     0,   113,   113,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,   584,     0,     0,     0,     0,     0,   305,     0,     0,
       0,     0,     0,     0,     0,     0,   584,   584,   584,   584,
       0,     0,     0,     0,     0,     0,   348,   113,     0,     0,
       0,     0,     0,   364,   422,   422,     0,     0,     0,     0,
     191,     0,     0,     0,     0,   191,     0,     0,     0,     0,
       0,  1467,     0,     0,     0,     0,     0,  1467,     0,     0,
       0,     0,     0,   191,     0,     0,     0,     0,     0,     0,
     348,   113,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   364,     0,     0,     0,
    1082,   113,     0,     0,     0,     0,     0,     0,     0,     0,
     911,     0,   427,     0,   427,     0,     0,   911,     0,     0,
       0,   911,     0,     0,     0,     0,     0,   305,     0,     0,
       0,   305,     0,     0,     0,     0,   427,     0,   427,     0,
       0,   113,   703,   364,     0,   354,     0,     0,     0,   364,
       0,     0,   364,     0,   113,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   305,     0,     0,     0,     0,     0,   364,   364,   364,
     364,   364,   364,   364,   191,     0,   364,   364,     0,   364,
     364,   364,   364,   364,   364,   364,   364,     0,   305,     0,
       0,     0,     0,     0,     0,     0,   305,   364,   364,   364,
     364,   364,   364,   364,   364,   364,   364,   364,   364,   364,
     364,   364,   364,   364,   364,     0,   305,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   364,     0,
       0,   364,   364,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     113,     0,   348,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,   427,   427,   427,   427,   427,     0,     0,   113,
       0,   216,     0,   427,   427,   427,   427,     0,     0,    28,
      29,     0,   364,     0,    32,   364,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   848,   219,     0,   911,     0,     0,
       0,     0,     0,     0,   364,     0,     0,     0,     0,     0,
       0,     0,     0,   364,   220,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   422,   422,     0,     0,     0,     0,
       0,   427,   427,     0,     0,     0,     0,   364,     0,   364,
       0,   911,     0,   911,     0,     0,     0,   760,   760,     0,
     113,     0,   348,     0,     0,     0,     0,     0,     0,     0,
     113,   113,     0,     0,     0,     0,     0,     0,  1027,     0,
       0,     0,     0,     0,     0,     0,     0,   113,     0,   113,
       0,     0,     0,     0,     0,     0,     0,   348,     0,   113,
       0,     0,     0,     0,     0,   364,     0,     0,     0,   911,
       0,     0,   584,   584,     0,     0,     0,     0,     0,     0,
       0,   584,     0,   584,   584,     1,     0,   584,     0,     0,
     348,     0,     0,     0,     0,   584,   364,     0,   584,     0,
       0,     0,     0,     0,     0,     0,     0,   364,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,   305,   305,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,  1164,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,  1199,  1204,  1208,  1212,  1216,
       0,    43,  1225,     0,   774,     0,     0,     0,  1164,     0,
       0,  1335,     0,     0,     0,   508,     0,   364,   323,   364,
       0,     0,     0,  1270,  1275,  1279,  1283,  1287,     0,     0,
    1225,     0,     0,     0,   367,     0,     0,     0,     0,     0,
       0,   364,     0,     0,     0,     0,     0,     0,  1225,  1225,
       0,     0,     0,     0,     0,     0,   364,     0,     0,   364,
       0,     0,   305,     0,     0,     0,   364,     0,     0,     0,
     364,     0,     0,     0,     0,     0,     0,   911,     0,     0,
       0,     0,     0,     0,     0,   367,     0,     0,     0,     0,
       0,   422,     0,   422,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   191,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   422,     0,   422,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     584,   584,   584,   584,     0,     0,   584,     0,     0,     0,
       0,   584,   584,     0,   584,     0,   584,  1348,   335,     0,
       0,     0,   113,     0,     0,     0,     0,     0,   584,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   367,     0,     0,     0,     0,   640,   642,     0,     0,
     367,     0,   113,     0,     0,     0,   367,     0,     0,  1378,
    1380,     0,     0,     0,     0,   113,   323,     0,     0,     0,
       0,     0,   113,     0,     0,   496,     0,     0,     0,     0,
       0,   367,   848,     0,     0,     0,   367,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   364,     0,     0,   364,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   848,     0,     0,     0,     0,     0,
       0,   422,   422,   422,   422,   422,     0,     0,     0,     0,
       0,     0,   422,   422,   422,   422,   364,   367,     0,  1500,
       0,     0,   584,   364,     0,     0,     0,     0,     0,     0,
       0,     0,   584,     0,   584,     0,     0,   364,     0,     0,
       0,     0,   113,     0,     0,     0,     0,  1526,     0,     0,
       0,     0,   364,     0,     0,  1535,     0,     0,     0,     0,
     364,     0,   364,     0,     0,   268,   335,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,   364,
     422,   422,     0,     0,     0,   584,   584,     0,     0,   584,
       0,   584,     2,     0,   584,     0,     0,     0,   584,     0,
       0,  1164,     0,     0,     0,     0,     0,  1164,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   364,     0,
       0,     0,     0,   367,     0,     0,     0,     0,     0,   273,
       0,   584,     0,     0,     0,   274,   275,   276,    28,   675,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   278,
      38,     0,     0,   367,   702,     0,     0,     0,     0,   584,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   801,     0,     0,   802,   661,   289,     0,
       0,   323,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   367,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   364,     0,     0,     0,     0,   364,
     364,   364,     0,     0,     0,     0,     0,     0,     0,     0,
     305,     0,     0,     0,     0,   364,   364,     0,     0,     0,
       0,     0,   305,   913,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   364,   364,
     367,   364,   364,     0,  1083,     0,     0,   364,   364,   364,
     364,     0,     0,   496,     0,     0,     0,     0,     0,   364,
     364,   364,   364,   364,   364,   364,   364,     0,     0,   364,
       0,   323,     0,     0,     0,   323,     0,     0,     0,     0,
       0,   335,     0,     0,     0,     0,   364,   367,     0,     0,
       0,     0,     0,   367,     0,     0,   367,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   496,     0,     0,
       0,     0,     0,     0,     0,   323,     0,     0,     0,     0,
       0,   367,   367,   367,   367,   367,   367,   367,     0,     0,
     367,   367,     0,   367,   367,   367,   367,   367,   367,   367,
     367,     0,   323,     0,     0,     0,     0,     0,     0,     0,
     323,   367,   367,   367,   367,   367,   367,   367,   367,   367,
     367,   367,   367,   367,   367,   367,   367,   367,   367,     0,
     323,     0,     0,     0,     0,     0,     0,   305,   305,     0,
       0,     0,   367,     0,     0,   367,   367,     0,     0,     0,
    1026,     0,     0,     0,     0,     0,     0,     0,     0,  1664,
    1666,   335,     0,     0,     0,   335,     0,     0,     0,   364,
     364,     0,     0,     0,     0,     0,     0,   913,     0,     0,
     364,     0,     0,   913,     0,     0,   913,  1348,     0,  1678,
       0,  1679,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   335,     0,     0,     0,     0,
       0,     0,  1018,     0,     0,     0,   367,     0,     0,   367,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   335,     0,   364,     0,     0,   364,   364,     0,
     335,     0,     0,     0,  1058,  1062,     0,     0,   367,     0,
       0,     0,     0,     0,     0,     0,     0,   367,     0,     0,
     335,     0,     0,     0,   675,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   113,  1172,     0,
       0,   367,     0,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1198,  1203,  1207,
    1211,  1215,     0,     0,  1224,  1230,     0,     0,     0,     0,
     675,     0,     0,  1242,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1269,  1274,  1278,  1282,  1286,
       0,     0,  1224,  1299,     0,     0,     0,     0,     0,   367,
       0,     0,     0,   305,     0,     0,   913,     0,     0,   496,
    1224,  1224,     0,     0,     0,     0,     0,  1815,     0,     0,
       0,   305,  1818,  1820,  1824,  1828,  1830,  1834,     0,  1815,
     367,     0,  1839,  1843,  1847,  1851,     0,     0,     0,     0,
       0,   367,     0,     0,     0,     0,     0,   496,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   323,   323,     0,
       0,   913,     0,   913,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,   496,
       0,     0,     0,     0,     0,  1861,     0,  1862,     0,     0,
       0,   367,     0,   367,     2,     0,     0,  1664,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     913,     0,     0,     0,     0,   367,     0,     0,     0,  1815,
       0,   496,     0,     0,  1815,     0,     0,     0,     0,     0,
     367,   273,     0,   367,     0,     0,   323,   274,   275,   276,
     367,     0,     0,     0,   367,     0,     0,   335,   335,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1050,
     289,     0,     0,  1051,     0,     0,     0,     0,   290,   291,
    1624,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,  1026,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   496,     0,     0,     0,     0,     0,  1172,
       0,     0,     0,     0,     0,     0,     0,  1242,     0,     0,
       0,     0,     0,     0,     0,   496,     0,     0,    78,     0,
       0,     0,     0,  1478,     0,     0,  1482,     0,     0,     0,
       0,     0,     0,   913,     0,  1498,   335,     0,     0,     0,
     913,     0,     0,     0,   913,     0,     0,     0,     0,    78,
      78,     0,     0,   675,    78,     0,    78,     0,    78,   675,
       0,    66,     0,     0,  1522,    78,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1058,
    1062,  1058,  1062,     0,     0,     0,   367,     0,     0,   367,
      78,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   108,     0,     0,     0,     0,  1616,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     367,     0,     0,     0,    78,    78,   157,   367,     0,     0,
       0,     0,     0,     0,   227,    66,     0,     0,     0,     0,
       0,   367,    66,    66,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,   367,     0,     0,     0,
     346,     0,     0,     0,   367,    78,   367,    78,     0,     0,
     227,     0,     0,     0,     0,     0,   437,     0,     0,     0,
       0,     0,     0,   367,     0,     0,     0,     0,   437,     0,
     227,     0,   437,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,   227,     0,     0,     0,    78,     0,
      78,     0,   367,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   514,     0,     0,     0,     0,     0,     0,     0,
     913,     0,     0,     0,     0,     0,     0,   496,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   547,     0,     0,   227,   227,   227,     0,     0,
       0,     0,     0,     0,   913,   157,   913,     0,     0,     0,
       0,     0,     0,     0,     0,   157,   227,    66,     0,     0,
       0,     0,     0,   913,    78,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,   647,     0,     0,   367,     0,
       0,   647,     0,   367,   367,   367,     0,     0,     0,   666,
       0,     0,     0,     0,   323,     0,     0,     0,     0,   367,
     367,     0,   913,    78,     0,     0,   323,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   367,   367,     0,   367,   367,     0,     0,     0,
       0,   367,   367,   367,   367,     0,     0,     0,     0,     0,
       0,     0,     0,   367,   367,   367,   367,   367,   367,   367,
     367,     0,     0,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     367,   547,     0,   227,   227,     0,     0,   786,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   786,
       0,     0,     0,     0,    78,     0,    78,     0,     0,     0,
       0,     0,     0,     0,    78,    78,     0,     0,     0,     0,
       0,     0,     0,   496,     0,   496,     0,     0,     0,     0,
       0,    78,     0,    78,   335,   514,     0,     0,     0,   496,
     496,    78,     0,    78,     0,     0,   335,     0,     0,     0,
       0,     0,   878,     0,     0,  1724,  1726,     0,     0,     0,
       0,     0,     0,     0,  1733,     0,  1737,  1478,     0,     0,
    1482,   323,   323,     0,    78,     0,     0,     0,  1522,     0,
       0,  1750,     0,     0,     0,     0,     0,     0,     0,   227,
       0,     0,     0,     0,     0,     0,   227,     0,     0,     0,
       0,     0,     0,   367,   367,     0,     0,     0,     0,     0,
     913,     0,     0,     0,   367,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1616,
       0,     0,     0,     0,  1817,  1819,  1823,  1827,  1829,  1833,
       0,  1616,     0,     0,  1838,  1842,  1846,  1850,    78,     0,
       0,     0,     0,     0,     0,     0,  1819,  1823,  1829,  1833,
    1838,  1842,  1846,  1850,     0,     0,     0,     0,   367,     0,
       0,   367,   367,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1031,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   335,   335,     0,     0,     0,     0,     0,   227,   227,
     227,   227,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   227,   227,     0,   496,   157,     0,     0,     0,     0,
    1085,     0,     0,     0,   496,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   227,     0,     0,     0,     0,     0,
       0,  1112,  1122,   666,     0,  1112,  1122,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,   323,     0,     0,
    1141,  1616,     0,   227,     0,     0,  1616,     0,     0,   227,
       0,     0,   227,     0,     0,   323,     0,     0,     0,     0,
       0,   496,   496,  1884,  1885,  1886,  1887,     0,     0,  1888,
       0,     0,   224,     0,  1724,  1726,     0,  1733,   435,  1737,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
     435,  1897,   224,   268,   435,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,     0,     0,     0,
       2,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,   514,     0,     0,     0,     0,     0,     0,   227,    78,
       0,   227,   227,     0,   512,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
    1338,   514,     0,   274,   275,   276,     0,   335,   514,     0,
       0,  1338,   108,   666,     0,   514,   277,   278,     0,     0,
       0,     0,     0,     0,   545,   335,     0,   224,   224,   224,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1050,   289,     0,   224,  1629,
       0,     0,     0,  1630,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,  1888,   514,   645,     0,     0,
       0,     0,     0,   645,     0,  1964,     0,  1967,     0,     0,
       0,     0,     0,   514,   227,     0,    78,     0,     0,     0,
       0,   227,   227,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   227,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   227,   227,   227,
       0,     0,     0,     0,     0,   547,     0,     0,  1996,  1997,
       0,     0,  1964,     0,  1967,     0,     0,  2001,     0,     0,
       0,  2003,     0,     0,     0,     0,     0,     0,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,   545,     0,   224,   224,     0,     0,   785,
       0,     0,     0,     0,  2003,     2,     0,     0,     0,     0,
       0,   785,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  2040,     0,     0,     0,   227,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,   512,   274,   275,
     276,     0,     0,     0,     0,     0,  1031,     0,     0,     0,
       0,   277,   278,     0,   877,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1050,   289,  1516,     0,  1051,   227,   227,   227,   227,   290,
     291,   224,   292,   293,   294,   295,     0,     0,   224,     0,
       0,     0,     0,     0,     0,   227,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1548,
       0,     0,     0,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,   547,   227,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,  1594,     0,     0,     0,
       0,     0,     0,  1594,     0,     0,   114,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   227,   227,
       0,     0,     0,     0,     0,   227,   227,     0,   273,   227,
     227,     0,     0,     0,   274,   275,   276,   159,   114,     0,
       0,     0,   200,     0,   202,     0,     0,   277,   278,     0,
     224,   224,   224,   224,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,   224,   224,   288,  1050,   289,   349,   114,
    1051,     0,     0,     0,     0,   290,   291,  1635,   292,   293,
     294,   295,     0,     0,     0,     0,   224,     0,     0,     0,
       0,     0,     0,  1110,  1120,     0,     0,  1110,  1120,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   226,     0,
       0,     0,   479,   481,     0,   224,     0,     0,     0,     0,
       0,   224,     0,     0,   224,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,   226,     0,     0,     0,     0,     0,
       0,     0,     0,   534,     0,   535,     0,     0,     0,     0,
       0,     0,     0,     0,   226,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,     0,     0,     0,     0,   226,     0,
       0,     0,   227,     0,     0,   227,   159,     0,     0,     0,
       0,     0,     0,   512,     0,     0,     0,     0,     0,     0,
     224,     0,     0,   224,   224,     0,   513,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1337,   512,     0,     0,   227,     0,     0,     0,
     512,    78,     0,  1337,     0,     0,     0,   512,     0,     0,
       0,     0,     0,     0,     0,     0,   546,   227,     0,   226,
     226,   226,     0,     0,     0,     0,     0,     0,   227,   227,
     227,   227,     0,     0,     0,     0,     0,     0,     0,     0,
     226,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   512,   646,
       0,     0,   114,     0,   349,   646,     0,     0,     0,     0,
       0,     0,     0,   665,     0,   512,   224,     0,     0,     0,
       0,     0,     0,   224,   224,     0,     0,     0,   514,     0,
       0,     1,     0,     0,     0,   224,     0,   227,   227,     0,
       0,   114,     0,     0,     0,     0,     0,     0,     0,   224,
     224,   224,     0,     0,     0,     0,     2,   545,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,   200,
     202,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,   546,     0,   226,   226,     0,
       0,   227,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     0,   917,     0,   918,     0,     0,    43,   224,     0,
     774,     0,   114,   114,   227,     0,     0,  1417,     0,   513,
     227,   508,     0,     0,     0,     0,     0,     0,     0,   114,
       0,   114,     0,     0,     0,     0,     0,     0,   666,   349,
       0,   114,     0,     0,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   224,   224,   224,
     224,     0,   349,   226,     0,     0,     0,     0,     0,     0,
     226,     0,   -65,     0,     0,     0,     0,   224,     0,   227,
     -65,   -65,     0,     0,     0,   -65,     0,     0,     0,     0,
       0,   -65,   -65,   -65,     0,   227,   227,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   -65,     0,   545,   224,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1418,     0,  1419,   -65,     0,     0,     0,  1592,     0,
       0,     0,     0,     0,     0,  1592,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     224,   224,     0,     0,     0,     0,     0,   224,   224,     0,
       0,   224,   224,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   226,   226,   226,   226,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   226,     0,     0,     0,
       0,     0,     0,     0,  1084,     0,     0,     0,     0,   227,
       0,   666,     0,     0,     0,     0,     0,     0,   226,     0,
       0,     0,     0,     0,     0,  1111,  1121,   665,     0,  1111,
    1121,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     229,     0,     0,     0,  1140,     0,     0,   226,     0,     0,
       0,     0,     0,   226,     0,     0,   226,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   229,     0,     0,     0,
       0,     0,     0,     0,     0,   227,   227,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   229,     0,     0,     0,
       0,     0,     0,     0,   114,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1162,     0,     1,   269,    97,   270,
     229,   271,   272,     0,   224,     0,     0,   224,     0,     0,
       0,     0,     0,     0,     0,   513,     0,     0,     0,     0,
       0,     2,   226,     0,   114,   226,   226,     0,   516,     0,
       0,   200,   202,     0,     0,     0,     0,   114,     0,     0,
       0,   534,     0,   535,   114,   513,     0,     0,   224,     0,
       0,     0,   513,     0,     0,     0,     0,   665,   273,   513,
       0,     0,     0,     0,   274,   275,   276,     0,   549,   224,
       0,   229,   229,   229,     0,     0,     0,   277,   278,     0,
     224,   224,   224,   224,     0,     0,     0,     0,     0,     0,
       0,   279,   229,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1163,   289,     0,     0,
     513,   649,   672,     0,     0,   290,   291,   649,   292,   293,
     294,   295,     0,     0,     0,   668,     0,   513,   226,     0,
       0,     0,     0,     0,     0,   226,   226,     0,     0,     0,
     512,     0,     0,     0,   114,     0,     0,   226,     0,   224,
     224,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   226,   226,   226,     0,     0,     0,     0,     0,   546,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   549,     0,   229,
     229,     0,     0,   224,     0,     0,     0,     0,     0,     0,
       0,  1006,  1007,  1008,   565,  1009,  1010,  1011,  1012,   570,
     571,  1013,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,     0,  1014,     0,
     226,     0,     0,   277,   278,  1015,   224,   575,   576,   577,
       0,   516,   224,     0,     0,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  -469,   289,   578,     0,  -469,     0,   220,     0,
     579,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   226,
     226,   226,   226,     0,     0,   229,     0,     0,     0,     0,
       0,     0,   229,     0,     0,     0,     0,     0,     0,   226,
       0,   224,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1547,     0,     0,     0,   224,   224,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     546,   226,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1593,     0,     0,     0,     0,     0,     0,  1593,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   226,   226,     0,     0,     0,     0,     0,   226,
     226,     0,     0,   226,   226,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   229,   229,   229,   229,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   229,   229,     0,
       0,     0,     0,     0,     0,     0,  1087,     0,     0,     0,
       0,   224,     0,     0,     0,     0,     0,     0,     0,     0,
     229,     0,     0,     0,     0,     0,     0,  1114,  1124,   668,
       0,  1114,  1124,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1143,     0,     0,   229,
       0,     0,     0,     0,     0,   229,     0,     0,   229,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   224,   224,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   534,     0,   535,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,   226,     0,     0,   226,
       0,     0,     0,     0,     0,     0,     0,   516,     0,     0,
       2,     0,     0,     0,   229,     0,     0,   229,   229,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   516,     0,     0,
     226,     0,     0,     0,   516,     0,     0,   273,     0,   668,
       0,   516,     0,   274,   275,   276,     0,     0,     0,   114,
       0,   226,     0,     0,     0,     0,   277,   278,     0,     0,
       0,     0,   226,   226,   226,   226,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,   225,   288,  1050,   289,     0,     0,  1629,
       0,     0,   516,  1638,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,   516,
     229,     0,     0,     0,     0,     0,     0,   229,   229,   225,
       0,     0,   513,     0,     0,   225,     0,     0,     0,   229,
       0,   226,   226,     0,     0,     0,     0,   225,   171,   225,
       1,   225,     0,   229,   229,   229,     0,     0,     0,     0,
       0,   549,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   225,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,   226,     0,     0,     0,     0,
       0,     0,   177,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,     0,
       0,   225,   229,     0,   225,   225,   225,    40,   226,     0,
       0,     0,     0,     0,   226,     0,    43,     0,     0,   507,
     949,     0,     0,     0,     0,   225,     0,     0,     0,     0,
     508,     0,   665,     0,     0,     0,     0,     0,   230,     0,
       0,     0,     0,     0,   225,     0,     0,     0,     0,     0,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   229,   229,   229,   229,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   230,     0,     0,     0,     0,     0,
     230,   229,     0,   226,     0,     0,     0,     0,     0,     0,
       0,     0,   230,     0,   230,  1550,   230,     0,     0,   226,
     226,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   549,   229,     0,     0,     0,     0,   230,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1596,     0,     0,     0,     0,     0,     0,  1596,
     225,     0,   225,   225,     0,     0,   225,     0,     0,     0,
       0,     0,     0,     0,   229,   229,     0,     0,   225,     0,
       0,   229,   229,     0,     0,   229,   229,     0,     0,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,   230,     0,     0,   230,
     230,   230,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,   225,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   226,     0,   665,     0,     0,     0,   230,
       0,     0,     0,   273,     0,   230,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,     0,   225,     0,
       0,     0,   277,   278,     0,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,    82,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1050,   289,     0,     0,  1629,     0,     0,     0,  1650,
     290,   291,     0,   292,   293,   294,   295,     0,     0,   226,
     226,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   111,   117,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   230,     0,   230,   230,     0,
       0,   230,     0,     0,     0,     0,     0,     0,   229,     0,
       0,   229,     0,   230,   161,   117,     0,     0,     0,   201,
       0,     0,     0,    82,     0,     0,     0,     0,     0,     0,
      82,    82,     0,     0,     0,     0,     0,   225,   225,   225,
     225,     0,     0,     0,     0,     0,     0,     0,   347,     0,
       0,     0,   229,     0,     0,   350,     0,     0,     0,     0,
     225,   225,     0,     0,     0,     0,   230,     0,     0,     0,
       0,     0,     0,   229,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   225,   229,   229,   229,   229,     0,     0,
     225,   225,     0,     0,   225,   225,     0,     0,     0,   480,
       0,     0,     0,   230,     0,     0,     0,     0,     0,     0,
     230,     0,   225,     0,     0,     0,     0,   591,   225,     0,
       0,   225,     0,     0,     0,     0,     0,     0,     0,     0,
     519,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   516,     0,     0,     0,     0,     0,
       0,     0,     0,   229,   229,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   664,
     117,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   161,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   225,     0,     0,
     225,   225,     0,     0,     0,     0,     0,   229,     0,     0,
       0,     0,   230,   230,   230,   230,     0,     0,     0,   225,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,     0,     0,   230,   230,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     229,     0,     0,     0,     0,     0,   229,     0,   230,     0,
     664,     0,     0,     0,     0,   230,   230,     0,     0,   230,
     230,     0,     0,     0,   668,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,   230,     0,     0,   230,     0,     0,   776,
       0,     0,     0,   225,     0,     0,     0,     0,     0,     0,
     225,   225,     0,     0,     0,     0,     0,     0,   117,     0,
       0,     0,   225,     0,     0,   229,     0,     0,     0,     0,
       0,     0,   171,     0,     1,     0,   225,   225,   225,     0,
       0,   229,   229,     0,   225,     0,     0,     0,     0,     0,
       0,     0,     0,   850,     0,     0,   859,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,   230,     0,     0,   230,   230,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   177,    27,   366,     0,
       0,     0,     0,     0,   230,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,   230,    37,    38,    39,   117,
     117,     0,     0,     0,     0,   225,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,   519,     0,   117,     0,
       0,     0,     0,  1029,   178,     0,   962,     0,     0,   366,
       0,     0,     0,     0,     0,     0,     0,     0,  1048,     0,
       0,     0,     0,     0,     0,   229,     0,   668,   591,   591,
     591,   591,     0,     0,     0,     0,     0,     0,     0,   350,
       0,     0,     0,     0,   225,   225,   225,   225,   230,     0,
       0,     0,     0,     0,     0,   230,   230,     0,     0,     0,
       0,     0,     0,     0,   225,     0,     0,   230,     0,   664,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,   230,   230,   230,     0,     0,     0,     0,     0,   230,
       0,     0,     0,     0,  1048,   225,   225,     2,     0,     0,
       0,   229,   229,     0,     0,   626,     0,     0,     0,     0,
       0,     0,     0,    82,   366,   225,     0,     0,     0,  1171,
     366,     0,   225,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,   225,   225,  1117,
     274,   275,   276,  1117,   225,   225,     0,     0,   225,   225,
       0,     0,     0,   277,   278,     0,     0,  1228,   776,     0,
       0,     0,     0,     0,     0,  1241,     0,   279,     0,     0,
     230,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1050,   289,     0,  1297,  1629,     0,     0,     0,
    1654,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,  1323,  1327,     0,     0,     0,     0,     0,
       0,   366,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
     230,   230,   230,   664,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   776,  1329,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   776,     0,
     230,   230,     0,     0,     0,     0,  1350,     0,     0,   776,
     111,   117,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   912,     0,     0,
       0,   225,   230,   230,   225,     0,     0,     0,     0,   230,
     230,   117,     0,   230,   230,     0,     0,     0,  1379,     0,
       0,   663,     0,     0,   519,     0,     0,   366,     0,     0,
       0,   117,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   850,     0,     0,     0,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   225,   225,   225,
     225,   366,     0,   850,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   591,
       0,     0,   591,  1485,  1487,     0,  1491,     0,     0,     0,
       0,     0,   663,     0,  1501,     0,     0,     0,     0,     0,
       0,     0,  1510,     0,     0,     0,     0,     0,     0,  1048,
       0,     0,     0,     0,  1077,     0,   225,   225,     0,     0,
     591,     0,     0,     0,     0,     0,     0,     0,  1048,     0,
       0,     0,     0,  1048,     0,   591,   591,   591,   591,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   230,     0,     0,   230,
       0,   912,     0,     0,     0,     0,     0,   912,     0,     0,
     912,     0,     0,     0,     0,     0,     0,     0,  1562,     0,
     225,     0,     0,     0,  1572,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,     0,  1048,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   230,     0,   225,     0,     0,     0,   776,     0,   225,
       0,     0,   230,   230,   230,   230,     0,     0,     0,     0,
       0,     0,     0,     0,   776,     0,  1117,     0,     0,     0,
       0,  1048,     0,     0,  1585,     0,   366,     0,     0,   366,
     366,     0,     0,     0,  1117,     0,     0,     0,     0,     0,
       0,  1117,     0,     0,     0,  1028,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1047,     0,     0,     0,  1052,     0,     0,     0,   225,     0,
       0,   230,   230,     0,     0,     0,     0,  1048,     0,     0,
       0,     0,     0,     0,   225,   225,     0,     0,     0,     0,
       0,  1048,     0,     0,     0,     0,     0,     0,     0,     0,
     912,     0,     0,   366,     0,     0,     0,     0,     0,     0,
       0,   663,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1126,     0,     0,     0,     0,
       0,     0,   366,     0,     0,   230,  1047,  1052,     0,     0,
       0,   366,     0,     0,     0,     0,  1048,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1170,     0,     0,     0,   912,     0,   912,     0,     0,
       0,     0,  1048,     0,     0,     0,  1048,     0,   230,     0,
       0,     0,     0,     0,   230,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1226,
       0,     0,     0,     0,     0,     0,     0,  1240,   225,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   366,     0,     0,     0,  1295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1321,  1325,     0,     0,     0,
       0,     0,     0,   230,   912,     0,     0,     0,  1665,     0,
       0,     0,     1,     0,     0,   366,     0,     0,     0,   230,
     230,     0,     0,     0,     0,   663,     0,     0,     0,     0,
       0,     0,     0,     0,   225,   225,  1350,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,   591,   591,    28,    29,  1048,     0,  1048,    32,     0,
       0,  1048,   591,     0,   217,    38,   218,  1741,  1744,     0,
    1746,     0,     0,     0,     0,     0,     0,     0,     0,   219,
    1048,     0,  1757,     0,     0,   366,     0,   366,    43,     0,
       0,   774,     0,     0,     0,     0,   519,     0,  1353,     0,
       0,     0,   508,     0,     0,     0,     0,     0,     0,   366,
       0,     0,     0,   230,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   912,     0,     0,
       0,     0,  1048,     0,   912,     0,     0,     0,   912,   682,
       0,     0,  1048,     0,     0,   683,   684,   685,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,   230,
     230,     0,     0,     0,     0,  1484,  1486,     0,  1490,     0,
       0,     0,     0,     0,  -359,     0,  1028,     0,     0,     0,
    1052,     0,  -359,  -359,  1509,     0,     0,  -359,     0,     0,
       0,  1047,  1052,  -359,  -359,  -359,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -359,     0,
    1047,  1052,     0,     0,     0,  1047,     0,  -359,  -359,  -359,
     686,     0,     0,  -359,  1438,  -359,  -359,     0,   687,     0,
       0,   688,     0,  -359,  -359,  -359,     0,  -359,  -359,  -359,
    -359,  -359,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1561,     0,     0,     0,     0,     0,  1571,     0,     0,     0,
       0,     0,     0,  1614,     0,   591,  1665,  1048,     0,     0,
     366,     0,     0,   366,  1048,     0,     0,     0,  1746,  1047,
    1895,     0,     0,     0,     0,     0,     0,     0,     0,  1902,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,   912,     0,     0,     0,     0,     0,
       0,   366,     0,  1047,  1052,     0,     0,     0,   216,     0,
       0,   664,     0,     0,     0,   366,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
     366,     0,     0,     0,     0,     0,     0,     0,   912,     0,
     912,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   912,     0,  1047,
    -110,  1052,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1047,  1052,     0,     0,     0,     0,  1753,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,   912,     0,     0,     0,
       0,     0,  1956,  1959,     0,  1048,     2,  1048,     0,     0,
       0,   591,  1048,   591,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1047,     0,
    1052,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,     0,     0,  1047,     0,  1052,     0,  1047,     0,
    1052,     0,   277,   278,     0,     0,  1048,     0,     0,  1048,
       0,     0,     0,     0,     0,     0,   279,   591,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1050,   289,  1754,     0,  1051,     0,     0,     0,     0,
     290,   291,   366,   292,   293,   294,   295,   366,   366,   366,
       0,     0,     0,  1048,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   366,   366,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1821,  1825,     0,  1831,
    1835,     0,     0,     0,     0,  1840,  1844,  1848,  1852,     0,
       0,     0,     0,     0,     0,     0,     0,  1821,  1825,  1831,
    1835,  1840,  1844,  1848,  1852,     0,   268,   366,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   912,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1047,  1052,  1047,
    1052,     0,     0,  1047,  1736,     0,     0,     0,     0,  1484,
    1743,     0,  1509,     0,  1052,     0,     0,     0,     0,     0,
     273,     0,  1047,  1052,  1509,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1050,   289,
       0,     0,  1051,     0,  1047,  1052,     0,   290,   291,  1776,
     292,   293,   294,   295,  1047,  1052,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   366,   366,     0,
       0,     0,     0,     0,     0,     0,  -906,   522,   366,  -906,
    -906,  -906,  -906,     0,  -906,  -906,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -906,  -906,  -906,  -906,  -906,  -906,
    -906,  -906,  -906,  -906,  -906,  -906,  -906,  -906,  -906,  -906,
    -906,  -906,  -906,  -906,  -906,  -906,  -906,     0,     0,  -906,
       0,     0,   912,     0,     0,   366,   366,     0,     0,     0,
       0,  -906,  -906,     0,  -906,     0,     0,  -906,  -906,  -906,
    -906,  -906,     0,     0,  -906,  -906,  -906,  -906,  -906,  -906,
    -906,  -906,  -906,  -906,  -906,     0,     0,  -906,  -906,  -906,
    -906,     0,  -906,     0,  -906,  -906,  -906,     0,  -906,  -906,
    -906,  -906,  -906,  -906,  -906,  -906,     0,     0,  -906,   523,
    -906,  -906,     0,   524,  -906,  -906,     0,     0,  -906,  -906,
       0,  -906,  -906,  -906,  -906,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1047,
       0,   171,     0,     1,  1052,     0,  1047,  1736,     0,  1052,
    1509,     0,  1894,     0,  1896,     0,     0,     0,     0,     0,
    1052,  1901,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   663,     0,   177,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,   268,     0,     1,   269,    97,   270,    43,
     271,   272,   774,   949,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   508,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,  1955,  1958,     0,  1047,  1052,  1047,
       0,     0,     0,     0,  1047,  1736,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   355,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,  1047,  1052,
       0,  1047,  1736,     0,   290,   291,  2002,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -359,   682,  1047,  -359,  -359,  -359,  -359,
     683,   684,   685,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,     0,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,     0,     0,  -359,  -359,
       0,  -359,     0,     0,  -359,  -359,  -359,  -359,  -359,     0,
       0,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,     0,  -359,
       0,  -359,  -359,  -359,     0,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,   686,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,   687,  -359,  -359,   688,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -361,  1091,     0,
    -361,  -361,  -361,  -361,  1092,  1093,  1094,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,     0,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
       0,     0,  -361,  -361,     0,  -361,     0,     0,  -361,  -361,
    -361,  -361,  -361,     0,     0,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,     0,  -361,     0,  -361,  -361,  -361,     0,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  1095,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  1096,  -361,  -361,
    1097,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -466,  1042,     0,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,     0,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,     0,     0,  -466,  -466,     0,  -466,
       0,     0,  -466,  -466,  -466,  -466,  -466,     0,     0,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,     0,  -466,     0,  -466,
    -466,  -466,     0,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -302,  1044,     0,     1,   269,
      97,   270,  -302,   271,   272,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,     2,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,     0,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,     0,     0,
     273,  -302,     0,  -302,     0,     0,   274,   275,   276,  -302,
    -302,     0,     0,  -302,  -302,  -302,  -302,  -302,  -302,   277,
     278,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
       0,  -302,     0,   279,  -302,  -302,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -302,  -302,   288,  1138,   289,
    -302,  -302,  1046,  -302,  -302,  -302,  -302,   290,   291,  -302,
     292,   293,   294,   295,  -302,  -302,  -302,  -302,  -302,  -303,
     268,     0,     1,   269,    97,   270,  -303,   271,   272,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,     2,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
       0,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,     0,     0,   273,  -303,     0,  -303,     0,     0,
     274,   275,   276,  -303,  -303,     0,     0,  -303,  -303,  -303,
    -303,  -303,  -303,   277,   278,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,     0,  -303,     0,   279,  -303,  -303,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -303,
    -303,   288,  1050,   289,  -303,  -303,  1051,  -303,  -303,  -303,
    -303,   290,   291,  -303,   292,   293,   294,   295,  -303,  -303,
    -303,  -303,  -303,  -608,   268,     0,     1,   269,    97,   270,
    -608,   271,   272,  -608,  -608,  -608,  -608,  -608,  -608,  -608,
    -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,
    -608,     2,  -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,
    -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,
    -608,  -608,  -608,  -608,     0,  -608,  -608,  -608,  -608,  -608,
    -608,  -608,  -608,  -608,  -608,  -608,     0,     0,   273,  -608,
       0,  -608,     0,     0,   274,   275,   276,  -608,  -608,     0,
       0,  -608,  -608,  -608,  -608,  -608,  -608,   277,   278,  -608,
    -608,  -608,  -608,  -608,  -608,  -608,  -608,  -608,     0,  -608,
       0,   279,  -608,  -608,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -608,  -608,   288,  -608,   289,  -608,  -608,
    -608,  -608,   672,  -608,  1223,   290,   291,  -608,   292,   293,
     294,   295,  -608,  -608,  -608,  -608,  -608,  -609,   268,     0,
       1,   269,    97,   270,  -609,   271,   272,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,     2,  -609,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,     0,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
       0,     0,   273,  -609,     0,  -609,     0,     0,   274,   275,
     276,  -609,  -609,     0,     0,  -609,  -609,  -609,  -609,  -609,
    -609,   277,   278,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,     0,  -609,     0,   279,  -609,  -609,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -609,  -609,   288,
    -609,   289,  -609,  -609,  -609,  -609,   672,  -609,  1294,   290,
     291,  -609,   292,   293,   294,   295,  -609,  -609,  -609,  -609,
    -609,  -624,  1044,     0,     1,   269,    97,   270,  -624,   271,
     272,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,     2,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,     0,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,     0,     0,   273,  -624,     0,  -624,
       0,     0,   274,   275,   276,  -624,  -624,     0,     0,  -624,
    -624,  -624,  -624,  -624,  -624,   277,   278,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,     0,  -624,     0,   279,
    -624,  -624,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -624,  -624,   288,  -624,   289,  -624,  -624,  1046,  -624,
    -624,  -624,  -624,   290,   291,  -624,   292,   293,   294,   295,
    -624,  -624,  -624,  -624,  -624,  -626,   268,     0,     1,   269,
      97,   270,  -626,   271,   272,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,     2,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,     0,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,     0,     0,
     273,  -626,     0,  -626,     0,     0,   274,   275,   276,  -626,
    -626,     0,     0,  -626,  -626,  -626,  -626,  -626,  -626,   277,
     278,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
       0,  -626,     0,   279,  -626,  -626,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -626,  -626,   288,  1050,   289,
    -626,  -626,  1051,  -626,  -626,  -626,  -626,   290,   291,  -626,
     292,   293,   294,   295,  -626,  -626,  -626,  -626,  -626,  -625,
    1044,     0,     1,   269,    97,   270,  -625,   271,   272,  -625,
    -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,  -625,  -625,  -625,  -625,  -625,     2,  -625,  -625,
    -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,
       0,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,     0,     0,   273,  -625,     0,  -625,     0,     0,
     274,   275,   276,  -625,  -625,     0,     0,  -625,  -625,  -625,
    -625,  -625,  -625,   277,   278,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,  -625,  -625,     0,  -625,     0,   279,  -625,  -625,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -625,
    -625,   288,  -625,   289,  -625,  -625,  1046,  -625,  -625,  -625,
    -625,   290,   291,  -625,   292,   293,   294,   295,  -625,  -625,
    -625,  -625,  -625,  -355,  1771,     0,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,     0,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,     0,     0,  -355,  -355,
       0,  -355,     0,     0,  -355,  -355,  -355,  -355,  -355,     0,
       0,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,     0,  -355,
       0,  -355,  -355,  -355,     0,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -348,  1814,     0,
       1,   269,    97,   270,  -348,   271,   272,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,     2,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,     0,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
       0,     0,   273,  -348,     0,  -348,     0,     0,   274,   275,
     276,  -348,  -348,     0,     0,  -348,  -348,  -348,  -348,  -348,
    -348,   277,   278,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,     0,  -348,     0,   279,  -348,  -348,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -348,  -348,   288,
    -348,   289,  -348,  -348,  -348,  -348,   672,  -348,  -348,   290,
     291,  -348,   292,   293,   294,   295,  -348,  -348,  -348,  -348,
    -348,  -586,   268,     0,     1,   269,    97,   270,  -586,   271,
     272,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,     2,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,     0,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,     0,     0,   273,  -586,     0,  -586,
       0,     0,   274,   275,   276,  -586,  -586,     0,     0,  -586,
    -586,  -586,  -586,  -586,  -586,   277,   278,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,     0,  -586,     0,   279,
    -586,  -586,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -586,  -586,   288,  -586,   289,  -586,  -586,  -586,  -586,
     672,  -586,  -586,   290,   291,  -586,   292,   293,   294,   295,
    -586,  -586,  -586,  -586,  -586,  -594,   268,     0,     1,   269,
      97,   270,  -594,   271,   272,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,     2,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,     0,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,     0,     0,
     273,  -594,     0,  -594,     0,     0,   274,   275,   276,  -594,
    -594,     0,     0,  -594,  -594,  -594,  -594,  -594,  -594,   277,
     278,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
       0,  -594,     0,   279,  -594,  -594,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -594,  -594,   288,  -594,   289,
    -594,  -594,  -594,  -594,   672,  -594,  -594,   290,   291,  -594,
     292,   293,   294,   295,  -594,  -594,  -594,  -594,  -594,  -587,
     268,     0,     1,   269,    97,   270,  -587,   271,   272,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,     2,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
       0,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,     0,     0,   273,  -587,     0,  -587,     0,     0,
     274,   275,   276,  -587,  -587,     0,     0,  -587,  -587,  -587,
    -587,  -587,  -587,   277,   278,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,     0,  -587,     0,   279,  -587,  -587,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -587,
    -587,   288,  -587,   289,  -587,  -587,  -587,  -587,   672,  -587,
    -587,   290,   291,  -587,   292,   293,   294,   295,  -587,  -587,
    -587,  -587,  -587,  -595,   268,     0,     1,   269,    97,   270,
    -595,   271,   272,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,     2,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,     0,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,     0,     0,   273,  -595,
       0,  -595,     0,     0,   274,   275,   276,  -595,  -595,     0,
       0,  -595,  -595,  -595,  -595,  -595,  -595,   277,   278,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,     0,  -595,
       0,   279,  -595,  -595,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -595,  -595,   288,  -595,   289,  -595,  -595,
    -595,  -595,   672,  -595,  -595,   290,   291,  -595,   292,   293,
     294,   295,  -595,  -595,  -595,  -595,  -595,  -348,  1837,     0,
       1,   269,    97,   270,  -348,   271,   272,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,     2,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,     0,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
       0,     0,   273,  -348,     0,  -348,     0,     0,   274,   275,
     276,  -348,  -348,     0,     0,  -348,  -348,  -348,  -348,  -348,
    -348,   277,   278,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,     0,  -348,     0,   279,  -348,  -348,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -348,  -348,   288,
    -348,   289,  -348,  -348,  -348,  -348,   672,  -348,  -348,   290,
     291,  -348,   292,   293,   294,   295,  -348,  -348,  -348,  -348,
    -348,  -588,   268,     0,     1,   269,    97,   270,  -588,   271,
     272,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,     2,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,     0,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,     0,     0,   273,  -588,     0,  -588,
       0,     0,   274,   275,   276,  -588,  -588,     0,     0,  -588,
    -588,  -588,  -588,  -588,  -588,   277,   278,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,     0,  -588,     0,   279,
    -588,  -588,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -588,  -588,   288,  -588,   289,  -588,  -588,  -588,  -588,
     672,  -588,  -588,   290,   291,  -588,   292,   293,   294,   295,
    -588,  -588,  -588,  -588,  -588,  -596,   268,     0,     1,   269,
      97,   270,  -596,   271,   272,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,     2,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,     0,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,     0,     0,
     273,  -596,     0,  -596,     0,     0,   274,   275,   276,  -596,
    -596,     0,     0,  -596,  -596,  -596,  -596,  -596,  -596,   277,
     278,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
       0,  -596,     0,   279,  -596,  -596,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -596,  -596,   288,  -596,   289,
    -596,  -596,  -596,  -596,   672,  -596,  -596,   290,   291,  -596,
     292,   293,   294,   295,  -596,  -596,  -596,  -596,  -596,  -589,
     268,     0,     1,   269,    97,   270,  -589,   271,   272,  -589,
    -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,
    -589,  -589,  -589,  -589,  -589,  -589,  -589,     2,  -589,  -589,
    -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,
    -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,
       0,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,  -589,
    -589,  -589,     0,     0,   273,  -589,     0,  -589,     0,     0,
     274,   275,   276,  -589,  -589,     0,     0,  -589,  -589,  -589,
    -589,  -589,  -589,   277,   278,  -589,  -589,  -589,  -589,  -589,
    -589,  -589,  -589,  -589,     0,  -589,     0,   279,  -589,  -589,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -589,
    -589,   288,  -589,   289,  -589,  -589,  -589,  -589,   672,  -589,
    -589,   290,   291,  -589,   292,   293,   294,   295,  -589,  -589,
    -589,  -589,  -589,  -597,   268,     0,     1,   269,    97,   270,
    -597,   271,   272,  -597,  -597,  -597,  -597,  -597,  -597,  -597,
    -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,
    -597,     2,  -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,
    -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,
    -597,  -597,  -597,  -597,     0,  -597,  -597,  -597,  -597,  -597,
    -597,  -597,  -597,  -597,  -597,  -597,     0,     0,   273,  -597,
       0,  -597,     0,     0,   274,   275,   276,  -597,  -597,     0,
       0,  -597,  -597,  -597,  -597,  -597,  -597,   277,   278,  -597,
    -597,  -597,  -597,  -597,  -597,  -597,  -597,  -597,     0,  -597,
       0,   279,  -597,  -597,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -597,  -597,   288,  -597,   289,  -597,  -597,
    -597,  -597,   672,  -597,  -597,   290,   291,  -597,   292,   293,
     294,   295,  -597,  -597,  -597,  -597,  -597,  -357,  1915,     0,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,     0,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
       0,     0,  -357,  -357,     0,  -357,     0,     0,  -357,  -357,
    -357,  -357,  -357,     0,     0,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,     0,  -357,     0,  -357,  -357,  -357,     0,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -356,  1916,     0,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,     0,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,     0,     0,  -356,  -356,     0,  -356,
       0,     0,  -356,  -356,  -356,  -356,  -356,     0,     0,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,     0,  -356,     0,  -356,
    -356,  -356,     0,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -348,  1917,     0,     1,   269,
      97,   270,  -348,   271,   272,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,     2,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,     0,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,     0,     0,
     273,  -348,     0,  -348,     0,     0,   274,   275,   276,  -348,
    -348,     0,     0,  -348,  -348,  -348,  -348,  -348,  -348,   277,
     278,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
       0,  -348,     0,   279,  -348,  -348,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -348,  -348,   288,  -348,   289,
    -348,  -348,  -348,  -348,   672,  -348,  -348,   290,   291,  -348,
     292,   293,   294,   295,  -348,  -348,  -348,  -348,  -348,  -348,
    1918,     0,     1,   269,    97,   270,  -348,   271,   272,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,     2,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
       0,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,     0,     0,   273,  -348,     0,  -348,     0,     0,
     274,   275,   276,  -348,  -348,     0,     0,  -348,  -348,  -348,
    -348,  -348,  -348,   277,   278,  -348,  -348,  -348,  -348,  -348,
    -348,  -348,  -348,  -348,     0,  -348,     0,   279,  -348,  -348,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -348,
    -348,   288,  -348,   289,  -348,  -348,  -348,  -348,   672,  -348,
    -348,   290,   291,  -348,   292,   293,   294,   295,  -348,  -348,
    -348,  -348,  -348,  -359,   682,     0,  -359,  -359,  -359,  -359,
     683,   684,   685,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,     0,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,     0,     0,  -359,  -359,
       0,  -359,     0,     0,  -359,  -359,  -359,  -359,  -359,     0,
       0,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,     0,  -359,
       0,  -359,  -359,  -359,     0,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,   686,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  1040,  -359,  -359,   688,     0,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -466,  1042,     0,
    -466,  -466,  -466,  -466,     0,  -466,  -466,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,     0,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
       0,     0,  -466,  -466,     0,  -466,     0,     0,  -466,  -466,
    -466,  -466,  -466,     0,     0,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,  -466,
    -466,  -466,     0,  -466,     0,  -466,  -466,  -466,     0,  -466,
    -466,  -466,  -466,  -466,  -466,  -466,  -466,     0,     0,  -466,
    -466,  -466,  -466,     0,  -466,  -466,  -466,  1043,  -466,  -466,
    -466,     0,  -466,  -466,  -466,  -466, -1063,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2, -1063, -1063, -1063, -1063, -1063,
   -1063, -1063, -1063, -1063, -1063, -1063, -1063, -1063, -1063, -1063,
   -1063, -1063, -1063, -1063, -1063, -1063, -1063,     0, -1063, -1063,
   -1063, -1063, -1063, -1063, -1063, -1063, -1063, -1063, -1063,     0,
       0,   273, -1063,     0, -1063,     0,     0,   274,   275,   276,
   -1063, -1063,     0,     0, -1063, -1063, -1063, -1063, -1063, -1063,
     277,   278, -1063, -1063, -1063, -1063, -1063, -1063, -1063, -1063,
   -1063,     0, -1063,     0,   279, -1063, -1063,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1050,
     289, -1063,     0,  1051, -1063, -1063,     0, -1063,   290,   291,
       0,   292,   293,   294,   295, -1199,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1199, -1199, -1199, -1199, -1199, -1199,
   -1199, -1199, -1199, -1199, -1199, -1199, -1199, -1199, -1199, -1199,
   -1199, -1199, -1199, -1199, -1199, -1199,     0, -1199, -1199, -1199,
   -1199, -1199, -1199, -1199, -1199, -1199, -1199, -1199,     0,     0,
     273, -1199,     0, -1199,     0,     0,   274,   275,   276, -1199,
   -1199,     0,     0, -1199, -1199, -1199, -1199, -1199, -1199,   277,
     278, -1199, -1199, -1199, -1199, -1199, -1199, -1199, -1199, -1199,
       0, -1199,     0,   279, -1199, -1199,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1050,   289,
    1516,     0,  1051, -1199, -1199,     0, -1199,   290,   291,     0,
     292,   293,   294,   295, -1154,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1154, -1154, -1154, -1154, -1154, -1154, -1154,
   -1154, -1154, -1154, -1154, -1154, -1154, -1154, -1154, -1154, -1154,
   -1154, -1154, -1154, -1154, -1154,     0, -1154, -1154, -1154, -1154,
   -1154, -1154, -1154, -1154, -1154, -1154, -1154,     0,     0,   273,
   -1154,     0, -1154,     0,     0,   274,   275,   276, -1154, -1154,
       0,     0, -1154, -1154, -1154, -1154, -1154, -1154,   277,   278,
   -1154, -1154, -1154, -1154, -1154, -1154, -1154, -1154, -1154,     0,
   -1154,     0,   279, -1154, -1154,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1729,   289, -1154,
       0,  1051, -1154, -1154,     0, -1154,   290,   291,     0,   292,
     293,   294,   295, -1187,  1735,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187,
   -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187,
   -1187, -1187, -1187, -1187,     0,   562,   563,   564,   565,   566,
     567,   568,   569,   570,   571,   572,     0,     0,   273, -1187,
       0, -1187,     0,     0,   274,   275,   276, -1187, -1187,     0,
       0, -1187,  1014, -1187, -1187, -1187, -1187,   277,   278,  1015,
   -1187,   575,   576,   577, -1187, -1187, -1187, -1187,     0, -1187,
       0,   279, -1187, -1187,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1050,   289,   578,     0,
    1051, -1187,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295,  -625,  1044,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,  -625,     0,  -625,  -625,  -625,  -625,  -625,  -625,
    -625,  -625,  -625,  -625,  -625,     0,     0,   273,  -625,     0,
    -625,     0,     0,   274,   275,   276,  -625,  -625,     0,     0,
    -625,  -625,  -625,  -625,  -625,  -625,   277,   278,  -625,  -625,
    -625,  -625,  -625,  -625,  -625,  -625,  -625,     0,  -625,     0,
     279,  -625,  -625,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  -625,   289,  1045,     0,  1046,
    -625,  -625,     0,  -625,   290,   291,     0,   292,   293,   294,
     295, -1178,  1044,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
   -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178,
   -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178,
   -1178, -1178,     0, -1178, -1178, -1178, -1178, -1178, -1178, -1178,
   -1178, -1178, -1178, -1178,     0,     0,   273, -1178,     0, -1178,
       0,     0,   274,   275,   276, -1178, -1178,     0,     0, -1178,
   -1178, -1178, -1178, -1178, -1178,   277,   278, -1178, -1178, -1178,
   -1178, -1178, -1178, -1178, -1178, -1178,     0, -1178,     0,   279,
   -1178, -1178,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1960,   289, -1178,     0,  1046, -1178,
   -1178,     0, -1178,   290,   291,     0,   292,   293,   294,   295,
   -1179,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179,     0, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179,     0,     0,   273, -1179,     0, -1179,     0,
       0,   274,   275,   276, -1179, -1179,     0,     0, -1179, -1179,
   -1179, -1179, -1179, -1179,   277,   278, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179, -1179,     0, -1179,     0,   279, -1179,
   -1179,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1050,   289,  1961,     0,  1051, -1179, -1179,
       0, -1179,   290,   291,     0,   292,   293,   294,   295, -1173,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1173, -1173,
   -1173, -1173, -1173, -1173, -1173, -1173, -1173, -1173, -1173, -1173,
   -1173, -1173, -1173, -1173, -1173, -1173, -1173, -1173, -1173, -1173,
       0,   562,   563,   564,   565,   566,   567,   568,   569,   570,
     571,   572,     0,     0,   273, -1173,     0, -1173,     0,     0,
     274,   275,   276, -1173, -1173,     0,     0, -1173,  1014, -1173,
   -1173, -1173, -1173,   277,   278,  1015, -1173,   575,   576,   577,
   -1173, -1173, -1173, -1173,     0, -1173,     0,   279, -1173, -1173,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1050,   289,   578,     0,  1051, -1173,   220,     0,
     579,   290,   291,     0,   292,   293,   294,   295, -1120,   553,
       0, -1120, -1120, -1120, -1120,     0, -1120, -1120,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,     0,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,
   -1120,     0,     0, -1120, -1120,     0, -1120,     0,     0, -1120,
   -1120, -1120, -1120, -1120,     0,     0, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120,     0, -1120,     0, -1120, -1120, -1120,     0,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,     0,     0,
   -1120,     0, -1120,   554,     0, -1120, -1120, -1120,     0, -1120,
   -1120, -1120,     0, -1120, -1120, -1120, -1120, -1143,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,   562,
     563,   564,   565,   566,   567,   568,   569,   570,   571,   572,
       0,     0,   273,   216,     0, -1143,     0,     0,   274,   275,
     276,    28,    29,     0,     0, -1143,   573, -1143, -1143, -1143,
   -1143,   277,   355,   574,   218,   575,   576,   577, -1143, -1143,
   -1143, -1143,     0, -1143,     0,   279, -1143,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   578,     0, -1143, -1143,   220,     0,   579,   290,
     291,     0,   292,   293,   294,   295, -1121,   553,     0, -1121,
   -1121, -1121, -1121,     0, -1121, -1121,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0, -1121, -1121, -1121, -1121, -1121, -1121,
   -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121,
   -1121, -1121, -1121, -1121, -1121, -1121, -1121,     0, -1121, -1121,
   -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121,     0,
       0, -1121, -1121,     0, -1121,     0,     0, -1121, -1121, -1121,
   -1121, -1121,     0,     0, -1121, -1121, -1121, -1121, -1121, -1121,
   -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121, -1121,
   -1121,     0, -1121,     0, -1121, -1121, -1121,     0, -1121, -1121,
   -1121, -1121, -1121, -1121, -1121, -1121,     0,     0, -1121,     0,
   -1121,   554,     0, -1121, -1121, -1121,     0, -1121, -1121, -1121,
       0, -1121, -1121, -1121, -1121, -1183,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183, -1183,
   -1183, -1183, -1183, -1183, -1183, -1183,     0,  1006,  1007,  1008,
     565,  1009,  1010,  1011,  1012,   570,   571,  1013,     0,     0,
     273, -1183,     0, -1183,     0,     0,   274,   275,   276, -1183,
   -1183,     0,     0, -1183,  1014, -1183, -1183, -1183, -1183,   277,
     278,  1015, -1183,   575,   576,   577, -1183, -1183, -1183, -1183,
       0, -1183,     0,   279, -1183, -1183,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     578,     0, -1183, -1183,   220,     0,   579,   290,   291,     0,
     292,   293,   294,   295, -1201,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1201, -1201, -1201, -1201, -1201, -1201, -1201,
   -1201, -1201, -1201, -1201, -1201, -1201, -1201, -1201, -1201, -1201,
   -1201, -1201, -1201, -1201, -1201,     0, -1201, -1201, -1201, -1201,
   -1201, -1201, -1201, -1201, -1201, -1201, -1201,     0,     0,   273,
   -1201,     0, -1201,     0,     0,   274,   275,   276, -1201, -1201,
       0,     0, -1201, -1201, -1201, -1201, -1201, -1201,   277,   278,
   -1201, -1201, -1201, -1201, -1201, -1201, -1201, -1201, -1201,     0,
   -1201,     0,   279, -1201, -1201,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1025,
       0, -1201, -1201,   672,     0, -1201,   290,   291,     0,   292,
     293,   294,   295, -1133,  1053,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,   562,   563,   564,   565,   566,
     567,   568,   569,   570,   571,   572,     0,     0,   273,   216,
       0, -1133,     0,     0,   274,   275,   276,    28,    29,     0,
       0, -1133,   573, -1133, -1133, -1133, -1133,   277,   355,   574,
     218,   575,   576,   577, -1133, -1133, -1133, -1133,     0, -1133,
       0,   279, -1133,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   578,     0,
   -1133, -1133,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295, -1137,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,   562,   563,   564,   565,   566,   567,
     568,   569,   570,   571,   572,     0,     0,   273,   216,     0,
   -1137,     0,     0,   274,   275,   276,    28,    29,     0,     0,
   -1137,   573, -1137, -1137, -1137, -1137,   277,   355,   574,   218,
     575,   576,   577, -1137, -1137, -1137, -1137,     0, -1137,     0,
     279, -1137,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,   578,     0, -1137,
   -1137,   220,     0,   579,   290,   291,     0,   292,   293,   294,
     295, -1132,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,     0,     0,   273,   216,     0, -1132,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1132,
     573, -1132, -1132, -1132, -1132,   277,   355,   574,   218,   575,
     576,   577, -1132, -1132, -1132, -1132,     0, -1132,     0,   279,
   -1132,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   578,     0, -1132, -1132,
     220,     0,   579,   290,   291,     0,   292,   293,   294,   295,
   -1136,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,     0,     0,   273,   216,     0, -1136,     0,
       0,   274,   275,   276,    28,    29,     0,     0, -1136,   573,
   -1136, -1136, -1136, -1136,   277,   355,   574,   218,   575,   576,
     577, -1136, -1136, -1136, -1136,     0, -1136,     0,   279, -1136,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   578,     0, -1136, -1136,   220,
       0,   579,   290,   291,     0,   292,   293,   294,   295, -1050,
    1066,     0, -1050, -1050, -1050, -1050,     0, -1050, -1050,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0, -1050, -1050, -1050,
   -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050,
   -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050,
       0, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050,
   -1050, -1050,     0,     0, -1050, -1050,     0, -1050,     0,     0,
   -1050, -1050, -1050, -1050, -1050,     0,     0, -1050, -1050, -1050,
   -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050,
   -1050, -1050, -1050, -1050,     0, -1050,     0, -1050, -1050, -1050,
       0, -1050, -1050, -1050, -1050, -1050, -1050, -1050, -1050,     0,
       0, -1050,     0, -1050, -1050,     0, -1050, -1050, -1050,     0,
   -1050, -1050, -1050,     0, -1050, -1050, -1050, -1050, -1052,  1067,
       0, -1052, -1052, -1052, -1052,     0, -1052, -1052,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1052, -1052, -1052, -1052,
   -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052,
   -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052,     0,
   -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052,
   -1052,     0,     0, -1052, -1052,     0, -1052,     0,     0, -1052,
   -1052, -1052, -1052, -1052,     0,     0, -1052, -1052, -1052, -1052,
   -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052,
   -1052, -1052, -1052,     0, -1052,     0, -1052, -1052, -1052,     0,
   -1052, -1052, -1052, -1052, -1052, -1052, -1052, -1052,     0,     0,
   -1052,     0, -1052, -1052,     0, -1052, -1052, -1052,     0, -1052,
   -1052, -1052,     0, -1052, -1052, -1052, -1052, -1092,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1092, -1092, -1092, -1092,
   -1092, -1092, -1092, -1092, -1092, -1092, -1092, -1092, -1092, -1092,
   -1092, -1092, -1092, -1092, -1092, -1092, -1092, -1092,     0,   562,
     563,   564,   565,   566,   567,   568,   569,   570,   571,   572,
       0,     0,   273, -1092,     0, -1092,     0,     0,   274,   275,
     276, -1092, -1092,     0,     0, -1092,  1014, -1092, -1092, -1092,
   -1092,   277,   278,  1015, -1092,   575,   576,   577, -1092, -1092,
   -1092, -1092,     0, -1092,     0,   279, -1092, -1092,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   578,     0, -1092, -1092,   220,     0,   579,   290,
     291,     0,   292,   293,   294,   295, -1094,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2, -1094, -1094, -1094, -1094, -1094,
   -1094, -1094, -1094, -1094, -1094, -1094, -1094, -1094, -1094, -1094,
   -1094, -1094, -1094, -1094, -1094, -1094, -1094,     0,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,   572,     0,
       0,   273, -1094,     0, -1094,     0,     0,   274,   275,   276,
   -1094, -1094,     0,     0, -1094,  1014, -1094, -1094, -1094, -1094,
     277,   278,  1015, -1094,   575,   576,   577, -1094, -1094, -1094,
   -1094,     0, -1094,     0,   279, -1094, -1094,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   578,     0, -1094, -1094,   220,     0,   579,   290,   291,
       0,   292,   293,   294,   295, -1134,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   562,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,     0,     0,
     273,   216,     0, -1134,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1134,   573, -1134, -1134, -1134, -1134,   277,
     355,   574,   218,   575,   576,   577, -1134, -1134, -1134, -1134,
       0, -1134,     0,   279, -1134,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     578,     0, -1134, -1134,   220,     0,   579,   290,   291,     0,
     292,   293,   294,   295, -1138,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,     0,     0,   273,
     216,     0, -1138,     0,     0,   274,   275,   276,    28,    29,
       0,     0, -1138,   573, -1138, -1138, -1138, -1138,   277,   355,
     574,   218,   575,   576,   577, -1138, -1138, -1138, -1138,     0,
   -1138,     0,   279, -1138,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   578,
       0, -1138, -1138,   220,     0,   579,   290,   291,     0,   292,
     293,   294,   295, -1135,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,   562,   563,   564,   565,   566,
     567,   568,   569,   570,   571,   572,     0,     0,   273,   216,
       0, -1135,     0,     0,   274,   275,   276,    28,    29,     0,
       0, -1135,   573, -1135, -1135, -1135, -1135,   277,   355,   574,
     218,   575,   576,   577, -1135, -1135, -1135, -1135,     0, -1135,
       0,   279, -1135,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   578,     0,
   -1135, -1135,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295, -1139,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,   562,   563,   564,   565,   566,   567,
     568,   569,   570,   571,   572,     0,     0,   273,   216,     0,
   -1139,     0,     0,   274,   275,   276,    28,    29,     0,     0,
   -1139,   573, -1139, -1139, -1139, -1139,   277,   355,   574,   218,
     575,   576,   577, -1139, -1139, -1139, -1139,     0, -1139,     0,
     279, -1139,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,   578,     0, -1139,
   -1139,   220,     0,   579,   290,   291,     0,   292,   293,   294,
     295, -1130,   553,     0, -1130, -1130, -1130, -1130,     0, -1130,
   -1130,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0, -1130,
   -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130,
   -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130,
   -1130, -1130,     0, -1130, -1130, -1130, -1130, -1130, -1130, -1130,
   -1130, -1130, -1130, -1130,     0,     0, -1130, -1130,     0, -1130,
       0,     0, -1130, -1130, -1130, -1130, -1130,     0,     0, -1130,
   -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130, -1130,
   -1130, -1130, -1130, -1130, -1130, -1130,     0, -1130,     0, -1130,
   -1130, -1130,     0, -1130, -1130, -1130, -1130, -1130, -1130, -1130,
   -1130,     0,     0, -1130,     0, -1130,   554,     0, -1130, -1130,
   -1130,     0, -1130, -1130, -1130,     0, -1130, -1130, -1130, -1130,
   -1131,   553,     0, -1131, -1131, -1131, -1131,     0, -1131, -1131,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131,     0, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131, -1131, -1131,     0,     0, -1131, -1131,     0, -1131,     0,
       0, -1131, -1131, -1131, -1131, -1131,     0,     0, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131,     0, -1131,     0, -1131, -1131,
   -1131,     0, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
       0,     0, -1131,     0, -1131,   554,     0, -1131, -1131, -1131,
       0, -1131, -1131, -1131,     0, -1131, -1131, -1131, -1131,  -980,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,  -980,  -980,
    -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,
    -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,
       0,  -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,  -980,
    -980,  -980,     0,     0,   273,  -980,     0,  -980,     0,     0,
     274,   275,   276,  -980,  -980,     0,     0,  -980,  -980,  -980,
    -980,  -980,  -980,   277,   278,  -980,  -980,  -980,  -980,  -980,
    -980,  -980,  -980,  -980,     0,  -980,     0,   279,  -980,  -980,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  -980,     0,  1708,  1709,   920,     0,
    -980,   290,   291,     0,   292,   293,   294,   295,  -982,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,  -982,  -982,  -982,
    -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,
    -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,     0,
    -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,  -982,
    -982,     0,     0,   273,  -982,     0,  -982,     0,     0,   274,
     275,   276,  -982,  -982,     0,     0,  -982,  -982,  -982,  -982,
    -982,  -982,   277,   278,  -982,  -982,  -982,  -982,  -982,  -982,
    -982,  -982,  -982,     0,  -982,     0,   279,  -982,  -982,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,  -982,     0,  -982,  1876,   920,     0,  -982,
     290,   291,     0,   292,   293,   294,   295,  -976,  1879,     0,
    -976,  -976,  -976,  -976,     0,  -976,  -976,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,     0,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
       0,     0,  -976,  -976,     0,  -976,     0,     0,  -976,  -976,
    -976,  -976,  -976,     0,     0,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,     0,  -976,     0,  -976,  -976,  -976,     0,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,     0,     0,  -976,
       0,  -976,  -976,     0,  -976,  -976,  -976,     0,  -976,  -976,
    -976,     0,  -976,  -976,  -976,  -976, -1180,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2, -1180, -1180, -1180, -1180, -1180,
   -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180,
   -1180, -1180, -1180, -1180, -1180, -1180, -1180,     0, -1180, -1180,
   -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180,     0,
       0,   273, -1180,     0, -1180,     0,     0,   274,   275,   276,
   -1180, -1180,     0,     0, -1180, -1180, -1180, -1180, -1180, -1180,
     277,   278, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180,
   -1180,     0, -1180,     0,   279, -1180, -1180,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289, -1180,     0, -1180, -1180, -1180,     0, -1180,   290,   291,
       0,   292,   293,   294,   295,  -977,  1952,     0,  -977,  -977,
    -977,  -977,     0,  -977,  -977,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -977,  -977,  -977,  -977,  -977,  -977,  -977,
    -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,
    -977,  -977,  -977,  -977,  -977,  -977,     0,  -977,  -977,  -977,
    -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,     0,     0,
    -977,  -977,     0,  -977,     0,     0,  -977,  -977,  -977,  -977,
    -977,     0,     0,  -977,  -977,  -977,  -977,  -977,  -977,  -977,
    -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,  -977,
       0,  -977,     0,  -977,  -977,  -977,     0,  -977,  -977,  -977,
    -977,  -977,  -977,  -977,  -977,     0,     0,  -977,     0,  -977,
    -977,     0,  -977,  -977,  -977,     0,  -977,  -977,  -977,     0,
    -977,  -977,  -977,  -977,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   355,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   894,     0,
     895,   896,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,  1146,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   355,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   894,     0,   895,  -109,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
    1153,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   894,     0,   895,   -97,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,  1157,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   355,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   894,     0,   895,  -101,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,   216,     0,     0,     0,     0,   274,   275,   276,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,   277,
     355,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1422,     0,   895,   -64,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   355,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,  1431,     0,
     895,  1432,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,  1475,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   355,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   894,     0,   895,   -80,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1431,     0,   895,  -106,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   355,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,  1431,     0,   895,   -96,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,   216,     0,     0,     0,     0,   274,   275,   276,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,   277,
     355,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1431,     0,   895,  -100,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,  1673,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   355,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   894,     0,
     895,   -87,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   355,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,  1431,     0,   895,   -77,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1431,     0,   895,   -84,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   778,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   355,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
     268,   289,     1,   269,    97,   270,     0,   271,   272,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,   277,   380,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,    40,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,   661,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1079,    27,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,   277,   380,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,    40,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   638,
     661,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,     0,     0,     0,   274,   275,   276,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,   277,
     380,    38,    39,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,    40,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,   268,   289,
       1,   269,    97,   270,   220,   271,   272,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,   277,   380,    38,    39,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   279,     0,    40,     0,   280,
     281,   282,   283,   284,   285,   286,   801,     0,     0,   802,
     661,   289,     2,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1006,  1007,  1008,   565,
    1009,  1010,  1011,  1012,   570,   571,  1013,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,  1014,     0,     0,     0,     0,   277,   278,
    1015,     0,   575,   576,   577,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1050,   289,   578,
       0,  1051,     0,   220,     0,   579,   290,   291,     0,   292,
     293,   294,   295,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1006,  1007,  1008,   565,  1009,  1010,
    1011,  1012,   570,   571,  1013,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,  1014,     0,     0,     0,     0,   277,   278,  1015,     0,
     575,   576,   577,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,   578,     0,     0,
       0,   220,     0,   579,   290,   291,     0,   292,   293,   294,
     295,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,     0,     0,     0,     0,     0,  1014,
       0,     0,     0,     0,   277,   278,  1015,     0,   575,   576,
     577,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   578,     0,     0,     0,   220,
       0,   579,   290,   291,     0,   292,   293,   294,   295,  1732,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1006,  1007,  1008,   565,  1009,  1010,  1011,  1012,   570,   571,
    1013,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,  1014,     0,     0,
       0,     0,   277,   278,  1015,     0,   575,   576,   577,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   578,     0,     0,     0,   220,     0,   579,
     290,   291,     0,   292,   293,   294,   295,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1050,
     289,     0,     0,  1051,     0,     0,     0,     0,   290,   291,
    1780,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1898,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1050,   289,  1754,     0,  1051,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1044,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1050,   289,  1754,     0,  1051,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1962,   289,
    1963,     0,  1046,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,  1991,  1992,   920,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1044,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1050,   289,  1961,     0,  1051,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1234,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1045,
       0,  1046,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1235,   289,     0,     0,     0,     0,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  1025,     0,     0,     0,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1505,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1050,   289,     0,     0,
    1051,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1044,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1506,
     289,  1507,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1555,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1515,     0,  1046,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1565,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1556,   289,     0,     0,     0,
       0,   672,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1566,   289,
       0,     0,     0,     0,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1044,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1598,   289,     0,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1044,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,  1046,     0,
       0,     0,     0,   290,   291,  1623,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1044,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,  1626,     0,     0,     0,  1627,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1044,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,  1046,     0,     0,     0,     0,   290,
     291,  1634,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1044,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1626,     0,     0,
       0,  1636,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1044,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
    1626,     0,     0,     0,  1648,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1044,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,  1626,     0,     0,     0,  1652,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1044,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1728,   289,     0,     0,  1046,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1730,   289,     0,     0,  1046,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1731,   289,
       0,     0,  1051,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1734,   289,     0,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1044,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1506,   289,  1507,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1755,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1752,
       0,  1046,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1044,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1756,   289,  1507,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1044,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1046,     0,     0,
       0,     0,   290,   291,  1775,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
    1046,     0,     0,     0,     0,   290,   291,  1779,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1044,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1729,
     289,     0,     0,  1051,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1890,   289,     0,     0,  1046,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1044,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1756,   289,  1507,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1966,   289,
       0,     0,  1046,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1044,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1998,   289,     0,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1999,   289,     0,     0,  1046,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1044,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,  2026,   920,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    2027,   289,     0,     0,  1046,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,   493,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   919,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,   920,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,   956,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,     0,     0,   998,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1197,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,   661,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1202,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1273,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,   672,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1369,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,     0,     0,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,   920,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1488,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
    1461,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1489,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1525,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,     0,     0,  1492,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1534,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1698,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1701,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1705,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,   672,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,     0,     0,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1742,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1531,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,  1800,     0,   289,     0,     0,
       0,     0,  1801,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1537,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1899,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1900,   289,     0,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1957,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,  1801,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   628,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   629,     0,   289,     0,
       0,     0,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1181,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   638,
       0,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1184,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1250,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1253,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1531,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1537,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    -257,   834,     0,     1,   269,    97,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,  -257,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,  -255,   837,  -257,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,  -255,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,  -258,   834,  -255,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,  -258,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,  -256,   837,
    -258,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,  -256,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,   375,  -256,     1,   269,    97,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
       0,   443,   392,     1,   269,    97,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,     0,   465,   444,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,     0,   470,   466,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,     0,   474,
     471,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,   834,   475,     1,   269,    97,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
       0,   837,  -775,     1,   269,    97,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,     0,   834,  -776,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,     0,   837,  -772,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,     0,   834,
    -773,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,   837,  -778,     1,   269,    97,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
       0,   941,  -779,     1,   269,    97,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,     0,   945,   942,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,     0,   834,   946,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,     0,   837,
    -758,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,   834,  -759,     1,   269,    97,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
       0,   837,  -761,     1,   269,    97,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,     0,   834,  -762,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,     0,   837,  -686,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,     0,   834,
    -687,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,   837,  -679,     1,   269,    97,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
       0,   834,  -680,     1,   269,    97,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,     0,   837,  -675,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,     0,   834,  -676,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,     0,   837,
    -665,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,   834,  -666,     1,   269,    97,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
       0,   837,  -660,     1,   269,    97,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   376,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   377,    32,
     378,   379,    35,    36,     0,   380,    38,    39,   381,     0,
       0,   382,   383,   384,   385,     0,   386,     0,   387,   388,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   389,     0,   390,   391,     0,   834,  -661,     1,
     269,    97,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,   376,     0,     0,   274,   275,     0,
      28,    29,     0,     0,   377,    32,   378,   379,    35,    36,
       0,   380,    38,    39,   381,     0,     0,   382,   383,   384,
     385,     0,   386,     0,   387,   388,    40,     0,   280,   281,
     282,   283,   284,   285,   286,    43,     0,     0,   389,     0,
     390,   391,     0,   837,  -677,     1,   269,    97,   290,   291,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
     376,     0,     0,   274,   275,     0,    28,    29,     0,     0,
     377,    32,   378,   379,    35,    36,     0,   380,    38,    39,
     381,     0,     0,   382,   383,   384,   385,     0,   386,     0,
     387,   388,    40,     0,   280,   281,   282,   283,   284,   285,
     286,    43,     0,     0,   389,     0,   390,   391,     0,   268,
    -678,     1,   269,    97,   290,   291,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,   375,     0,     1,   269,    97,     0,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,   443,
       0,     1,   269,    97,     0,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   376,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   377,    32,   378,   379,
      35,    36,     0,   380,    38,    39,   381,     0,     0,   382,
     383,   384,   385,     0,   386,     0,   387,   388,    40,     1,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     389,     0,   390,   391,     0,     0,     0,     0,     0,     0,
     290,   291,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1186,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,   507,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   508,
       0,   509, -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186,
   -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186,
   -1186, -1186, -1186, -1186,     0, -1186, -1186, -1186, -1186, -1186,
   -1186, -1186, -1186, -1186, -1186, -1186,     0,     0,     0, -1186,
       0, -1186,     0,     0,     0,     0,     0, -1186, -1186,     0,
       0, -1186, -1186, -1186, -1186, -1186, -1186,     0,     0, -1186,
   -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1169, -1186,
       0,     0, -1186, -1186,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1186,     0,
       0, -1186, -1186,     0, -1186,     0,     0, -1169, -1169, -1169,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,     0,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169,     0,     0,     0, -1169,     0, -1169,     0,     0,     0,
       0,     0, -1169, -1169,     0,     0, -1169, -1169, -1169, -1169,
   -1169, -1169,     0,     0, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169, -1169, -1169, -1171, -1169,     0,     0, -1169, -1169,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1169,     0,     0, -1169, -1169,     0, -1169,
       0,     0, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171,
   -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171,
   -1171, -1171, -1171, -1171,     0, -1171, -1171, -1171, -1171, -1171,
   -1171, -1171, -1171, -1171, -1171, -1171,     0,     0,     0, -1171,
       0, -1171,     0,     0,     0,     0,     0, -1171, -1171,     0,
       0, -1171, -1171, -1171, -1171, -1171, -1171,     0,     0, -1171,
   -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1168, -1171,
       0,     0, -1171, -1171,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1171,     0,
       0, -1171, -1171,     0, -1171,     0,     0, -1168, -1168, -1168,
   -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168,
   -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168,     0,
   -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168,
   -1168,     0,     0,     0, -1168,     0, -1168,     0,     0,     0,
       0,     0, -1168, -1168,     0,     0, -1168, -1168, -1168, -1168,
   -1168, -1168,     0,     0, -1168, -1168, -1168, -1168, -1168, -1168,
   -1168, -1168, -1168, -1170, -1168,     0,     0, -1168, -1168,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1168, -1168,     0, -1168,
       0,     0, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170,     0, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170,     0,     0,     0, -1170,
       0, -1170,     0,     0,     0,     0,     0, -1170, -1170,     0,
       0, -1170, -1170, -1170, -1170, -1170, -1170,     0,     0, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,     0, -1170,
       1,     0, -1170, -1170,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1170, -1170,     0, -1170,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,   219,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,  1107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1108,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,   219,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,  1107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1130,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,   219,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,  1107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1590,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,   219,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,  1107,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1605,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,   376,
       0,     0,     0,     0,     0,    28,    29,     0,     0,   377,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,   862,     0,   390,     0,     0,     0,     0,
       0,     0,   863,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,   842,     0,     0,
     843,     0,     0,     0,     0,     0,   844,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,   842,     0,     0,  1393,     0,     0,     0,     0,     0,
     844,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,  1618,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,    44,     0,     0,     0,     0,
       0,     0,     0,     0,   844,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,  1619,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   -94,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,     0,   217,    38,   218,     0,     0,     0,     0,
    1723,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   -95,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     0,     0,     0,
       0,  1865,     0,     0,     0,     0,     0,     0,     0,   219,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   -79,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0, -1249,   258,     0,     1,     0,     0,     0,     0,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   -86,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,    30,    31,     0,
      32,    33,    34,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,    40,    41,     0,     0,     0,    42,     0,     0,     0,
      43,     0,     0,    44,     0,     0,    45,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,   758,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1307,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,   758,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1646,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     0,   147,     0,     1,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,   758,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1647,
       2,     3,     4,   148,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,   147,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     0,     0,   149,     2,     3,
       4,   148,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,   542,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,    44,     0,     0,   149,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,     0,   217,    38,   218,     0,  -917,     0,  -917,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
      44,     0,     0,   543,  -917,  -917,  -917,  -917,  -917,  -917,
    -917,  -917,  -917,  -917,  -917,  -917,  -917,  -917,  -917,  -917,
    -917,  -917,  -917,  -917,  -917,  -917,  -917,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  -917,     0,     0,     0,     0,     0,     0,     0,
    -917,  -917,     0,     0,     0,  -917,     0,     0,     0,     0,
       0,  -917,  -917,  -917,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,  -917,     0,     0,     0,
       0,     0,     0,     0,     0,  -917,     0,     0,  -917,     0,
       0,  -917,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
      30,    31,     0,    32,    33,    34,    35,    36,     0,    37,
      38,    39, -1250,   250,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,    40,    41,     0,     0,     0,    42,
       0,     0,     0,    43,     0,     0,    44,     0,     0,    45,
       2,     3,     4,   148,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,    33,    34,    35,    36,     0,    37,    38,    39,
     171,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,   854,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,  1107,  1577,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,   171,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   178,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,   171,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1458,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   177,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,   147,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1790,     0,     2,     3,     4,   148,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,   147,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,    44,
       0,     0,     2,     3,     4,   148,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,   798,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,    44,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   216,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,     0,   217,    38,   218,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   219,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   799,     2,     3,     4,   148,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,    44,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,    44,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   653,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1357,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,    44,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,   969,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,   758,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,   970,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   177,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,   975,     0,     1,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,   976,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,   981,
       0,     1,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,   982,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   177,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,   783,     0,     1,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     1,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   219,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,   934,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     1,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
     987,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     1,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   177,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     1,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     1,     0,     0,    32,   432,   433,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   219,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     1,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   457,   216,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     1,     0,     0,
      32,     0,     0,     0,     0,     0,   217,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   219,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,   774,
    1574,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     508,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   219,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,   774,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   508,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   219,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1428,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     219
};

static const short int yycheck[] =
{
       0,    83,    51,   577,   652,   841,   117,   484,   507,    75,
     484,   517,    91,   519,   841,   906,   767,   908,   236,   370,
     771,    91,     0,    78,   763,   507,   763,    75,    76,    75,
      30,    31,   767,   672,    76,  1115,   771,  1117,   377,   678,
     873,    41,   681,   907,    44,   139,    78,    75,    51,  1499,
     161,    51,    56,    84,    84,   104,    56,   906,    58,   908,
      91,  1511,   427,   428,     3,    77,   291,     3,   767,   654,
     732,    74,   771,   127,    74,    75,    76,   906,    78,   908,
      80,   163,    82,   127,    84,   424,   140,    84,   142,     1,
     144,    91,    92,   112,     1,    95,   140,    75,   142,    30,
     144,     3,   136,   163,   104,     3,    84,   107,     1,   121,
     112,    42,   306,    91,    92,    79,   116,   117,   906,   119,
     908,   170,   112,   123,   124,   125,    75,   127,   131,     3,
      28,   131,     5,   133,   306,    84,   136,   137,     1,   139,
     140,   141,   142,   191,   144,     1,    75,   125,     1,   153,
       3,   110,   234,   153,     1,    84,   507,   121,     1,   137,
     160,   161,    91,   141,   906,   907,   908,    98,    99,   115,
     170,   102,   686,    17,   113,   254,   236,   256,   244,     1,
     180,   139,   182,   231,   254,   311,   256,   190,   254,   231,
     190,   191,   499,   672,   893,   255,   244,     1,   244,   678,
     112,   201,   681,   203,     1,   499,     1,   109,   254,   305,
     112,   118,     7,     8,     9,     3,   244,   524,   732,   793,
     527,   123,   529,   319,   531,   256,   256,   323,   121,     1,
     524,   231,     1,   527,     1,   529,   236,   531,     1,   350,
     240,     5,   116,   236,   244,   599,   600,     3,     3,     5,
     254,     1,     5,     3,   254,   118,   256,  1148,     1,   256,
       3,   311,   118,     3,  1155,   118,   244,     1,  1159,   775,
     776,   118,   115,  1106,   274,   774,   254,     1,   256,   373,
     280,     3,     3,  1147,     5,     1,    74,     3,   288,   133,
    1154,    79,   774,   115,  1158,   117,   118,  1747,    86,  1148,
     118,     1,   111,   118,   721,   254,  1155,   256,   117,   240,
    1159,   115,   394,   395,   396,   397,   113,   112,   669,  1148,
     117,   116,     3,   119,   112,   120,  1155,   256,   123,   118,
    1159,     1,   749,    73,     3,   123,     1,     3,    17,     5,
     112,   113,   342,   343,     0,   117,   115,     5,   117,   118,
     350,   118,   352,   117,     1,   118,   995,   113,   113,   290,
    1148,     1,   117,   115,   117,   121,   121,  1155,   118,   480,
     425,  1159,   372,   373,     3,   118,   376,   377,   118,   597,
     598,   599,   600,   383,   118,     5,   386,   387,   388,   389,
     390,   113,   113,   425,   118,   117,     5,   116,   376,   121,
     121,     1,   118,   485,     3,  1147,  1148,    17,   519,     3,
     388,     5,  1154,  1155,   372,   373,  1158,  1159,   118,   419,
     420,   421,     3,   774,   424,   425,   117,   427,   428,    28,
       1,   431,     3,  1095,    28,   116,   436,   440,   789,  1101,
     440,   441,   490,   491,   113,   445,   446,   113,   118,   800,
     504,   790,   506,   118,   133,   121,   962,   457,   458,   508,
     504,   509,   506,   441,   963,   117,   500,   467,   468,   234,
     235,   118,   472,   473,     5,   700,   476,   477,   118,     1,
     480,   963,   482,   112,   849,   850,   797,     3,   537,   585,
     490,   491,   588,   113,   859,   495,   861,   118,     1,   499,
     500,  1334,   727,   112,   504,  1585,   506,   507,   508,   509,
     735,   511,   706,   707,   708,     3,   995,   517,   118,   519,
     119,     1,  1107,   133,   524,   119,     3,   527,   723,   529,
     755,   531,   113,   872,   706,   707,   708,   537,   109,   110,
    1125,     5,   736,   737,   738,   624,   117,  1132,     1,    65,
     550,    28,   117,    83,   624,     3,   751,   112,   624,   124,
     620,   872,    17,  1396,   736,   737,   738,   567,   123,   569,
     652,  1310,  1311,  1310,  1311,   914,   119,   577,   624,     3,
    1331,  1095,     3,     1,   115,    73,  1477,  1101,   113,   715,
     716,   113,   718,   109,   110,   117,  1331,   597,   598,   599,
     600,     3,  1438,   119,   597,   598,   599,   600,  1107,   112,
     113,  1438,  1476,   616,   117,   615,   616,   743,   744,   745,
     746,     3,     1,     1,   624,  1107,    74,   118,  1477,   629,
       3,    79,  1331,   163,     3,   115,     5,   117,    86,     7,
       8,     9,   119,   643,   998,     3,   624,  1001,  1477,   113,
     650,   651,   652,   653,   654,   655,  1407,     1,  1409,   113,
     113,   968,     3,     3,   117,   715,   716,   974,   718,   669,
      28,   119,    74,   980,   968,     3,  1411,    79,   133,   986,
       3,   612,   613,   683,    86,  1039,   110,   687,    28,  1477,
       3,   115,   986,   743,   744,   745,   746,   115,   119,   117,
    1054,  1055,  1056,  1057,   234,    28,   236,   109,     3,   115,
     112,     3,    74,   119,     7,     8,     9,    79,     3,   121,
     485,   110,     3,   118,    86,   255,   657,   658,   659,   729,
     119,   113,    73,   733,  1476,  1477,  1375,  1088,   117,   117,
     109,   110,   824,   825,   112,   827,   119,    28,   830,   831,
    1583,     3,   120,   112,  1105,   123,  1589,   119,   758,   759,
     760,   119,   112,   763,   764,   765,   722,   767,     3,   113,
     770,   771,   112,   117,   774,     1,    77,   118,   778,   779,
     998,   109,   110,  1001,  1675,   788,   880,   881,   788,   789,
     790,   119,   116,   793,   750,     3,   119,   797,   124,   799,
     800,   127,   802,    11,   804,   109,   119,   855,   112,   767,
    1674,   789,   725,   771,   140,   897,   142,   109,   144,   112,
     112,  1039,   800,  1329,   119,  1658,  1675,   120,   113,     3,
     123,   885,   597,   598,   599,   600,  1054,  1055,  1056,  1057,
     753,   885,   842,   112,   109,   845,  1675,   112,    74,   849,
     850,   962,   886,    79,   123,   855,   621,     3,   123,   859,
      86,   861,   862,   115,   394,   117,     3,   397,     1,    11,
       3,   871,   872,   873,   109,   110,   754,   234,   235,   112,
     880,   881,    28,   883,   119,   885,   886,  1675,     3,   115,
     116,   117,   892,   893,   772,   773,  1375,   828,     7,     8,
       9,   124,   119,   111,   127,   939,   940,    11,   116,   117,
       3,   119,     0,    74,   914,   964,   112,   140,    79,   142,
      11,   144,   880,   881,   112,    86,  1151,   123,     7,     8,
       9,     3,  1674,  1675,   892,   109,   110,    74,   119,   939,
     940,    74,    79,   943,   944,   119,    79,   947,   948,    86,
     950,  1145,   113,    86,   113,   485,  1530,   112,   117,  1607,
       3,  1761,   962,   963,   964,  1798,   112,  1444,   968,   111,
    1444,   971,   109,  1145,   974,   117,   109,   977,   112,   112,
     980,   118,   115,   983,   117,   118,   986,    75,   988,  1982,
      88,    89,    90,   993,   109,   110,    84,   112,   998,    69,
      70,  1001,   112,    91,    92,   998,     3,   111,  1001,   118,
    1010,   120,  1012,   117,  1379,   119,  1381,   110,   111,  1073,
     111,  1021,     7,     8,     9,   116,   117,  1863,   119,  1073,
    1079,    74,   112,   110,  1034,   125,    79,   109,   110,  1039,
    1040,   120,   119,    86,   123,  2038,  1039,   270,   118,     7,
       8,     9,   724,   112,  1054,  1055,  1056,  1057,   721,    12,
      13,  1054,  1055,  1056,  1057,   111,   109,   597,   598,   599,
     600,   117,  1072,  1073,   112,   118,     1,    74,     3,  1079,
     752,  1081,    79,     1,   131,     3,   749,  1586,  1088,    86,
     620,   621,  1092,   419,   420,   132,  1096,     3,  1098,  1030,
     110,   508,  1102,   191,  1586,    16,  1106,  1107,  1908,   119,
    1910,   121,   109,     7,     8,     9,  1467,   125,     3,   445,
     446,   118,  1599,  1874,  1875,  1125,  1480,  1481,   485,   113,
     115,   116,  1132,   709,   710,   120,   113,  1491,   110,  1139,
     117,   467,   468,   115,   121,     0,   472,   473,   116,    74,
     476,   477,  1800,   121,    79,   562,   244,   110,   111,    65,
     722,    86,   120,   739,   740,   109,   254,   119,   256,   121,
     723,  1971,    90,  1973,   170,  1975,    12,    13,   504,     3,
     506,     5,     1,     1,   109,   129,   130,   112,   750,    74,
     115,  1765,   117,   118,    79,     3,   419,   420,   751,     1,
     288,    86,   725,   109,   110,   724,   111,    31,   431,   111,
     719,   720,   117,  2013,  2014,   117,  2016,     3,   719,   720,
      75,   113,   445,   446,   109,   117,   120,   112,   113,    84,
     753,  1708,  2032,   752,  1708,   131,    91,    92,   747,   748,
     597,   598,   599,   600,   467,   468,   747,   748,  2048,   472,
     473,   111,   111,   476,   477,    74,    74,   117,   117,   111,
      79,    79,  1480,  1481,   621,   117,    74,    86,    86,   132,
     111,    79,    74,  1491,   110,   111,   117,    79,    86,   275,
     119,   504,   121,   506,    86,   281,    44,    45,    74,  1054,
    1055,  1056,  1057,    79,   112,   113,   115,   116,   117,   117,
      86,  1301,  1302,   113,   112,  1305,  1306,   711,   712,  1074,
    1310,  1311,   109,   115,   116,   117,    74,    75,   111,    69,
      70,    79,   116,   109,   117,   115,   112,   121,    86,   119,
      74,  1331,   129,   130,  1334,    79,   424,   741,   742,    16,
    1340,    91,    86,  1343,     3,    95,     5,    97,   119,  1349,
    1350,   754,    44,    45,   112,  1355,  1356,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   897,   118,   772,
     773,   119,    31,  1331,   115,  1306,   116,  1377,   119,  1379,
    1734,  1381,    74,    75,  1384,   112,   111,    79,   119,   244,
     419,   420,   117,   113,    86,   117,  1396,   117,   111,   254,
     111,   256,  1402,  1403,   117,   111,   117,  1407,  1408,  1409,
    1410,   117,  1986,     1,   113,     3,   445,   446,   117,  1467,
     112,   115,   121,  1648,  1649,  1650,  1651,  1652,  1653,  1654,
    1655,   126,   127,   709,   710,    44,    45,   844,   467,   468,
      10,    11,   124,   472,   473,   127,   115,   476,   477,  1407,
    1408,  1409,  1410,   115,  1931,   116,   110,  1931,   140,   119,
     142,   121,   144,   739,   740,    74,    75,  1467,   998,   113,
      79,  1001,   113,   117,   113,   882,   117,    86,   117,   113,
    1480,  1481,   121,   117,    14,    15,   113,  1480,  1481,  1489,
     117,  1491,  1492,   110,   121,  1495,   822,   823,  1491,  1499,
     109,   711,   712,  1503,   137,   110,  1506,   113,   141,  1039,
     117,   117,   508,  1990,  1991,   113,  1734,  1991,   119,   117,
     121,   115,   377,   117,  1054,  1055,  1056,  1057,   119,   113,
    1530,   741,   742,   117,   113,    83,   624,   124,   117,   113,
    1540,   629,   124,   117,  1074,   113,  1900,   124,  1902,   117,
     119,   115,   121,   117,     1,   116,     3,   964,   115,   885,
     117,   119,   117,   121,   652,   119,   562,   121,     1,   424,
       3,  1502,     1,   119,     3,   419,   420,     1,   119,     3,
    1662,   669,  1540,  1583,   126,   127,  1586,  1518,     1,  1589,
       3,   115,   115,   117,   117,     1,   118,     3,   119,  1006,
     121,   445,   446,     1,     1,     3,     3,  1607,   117,  1609,
    1610,     1,  1966,     3,   115,   163,   117,   943,   944,    10,
      11,   947,   948,   467,   468,   115,   117,   117,   472,   473,
      14,    15,   476,   477,   115,  1689,   117,  1691,  1863,   119,
    1419,   121,  1421,  1643,  1419,  1689,  1421,  1691,   117,   822,
     823,   822,   823,   490,   491,   490,   491,   119,  1658,  1713,
     115,  1715,   885,   597,   598,  1665,   112,  1667,   121,  1713,
     112,  1715,   760,   597,   598,    91,    92,  1677,   764,   765,
     112,   115,  1900,   119,  1902,   115,   234,   235,   236,  1689,
     112,  1691,   112,   110,   115,   113,   115,  1054,  1055,  1056,
    1057,  1108,   790,   115,   115,   119,   110,   255,   118,   797,
     115,   119,   115,  1713,   802,  1715,   804,  1074,   118,   115,
     943,   944,   115,  1130,   947,   948,   115,   110,  1728,  1729,
    1730,  1731,   118,   118,  1734,   116,   113,   419,   420,  1739,
    1740,  1734,  1742,   113,  1744,   113,  1072,  1073,  1966,   431,
     124,   124,   124,   113,   113,   121,  1756,   121,   121,   112,
     112,   112,    56,   445,   446,  1765,   115,   855,  1768,   624,
     115,   115,   112,   110,   110,   113,   115,   123,   110,   113,
     113,   112,   112,   110,   872,   467,   468,   113,   113,   113,
     472,   473,   121,   121,   476,   477,  1990,   117,  1798,   117,
    1800,     0,   123,   118,   113,   121,   123,   121,   121,   121,
     121,   121,   113,   113,   113,   113,   113,  1871,  1990,   115,
     124,   124,   504,    56,   506,   112,   112,  1871,  1759,   124,
    1761,   121,   121,   113,   112,   123,   113,   113,   113,   113,
     113,   113,    41,   113,   110,   124,    11,    64,   844,  1072,
    1073,   115,    51,   124,   121,   124,   124,   119,   123,    58,
     116,   119,   121,   115,   112,   116,   116,   113,   115,  1869,
    1870,  1871,  1872,  1873,  1874,  1875,    75,   119,   113,    78,
    1880,  1881,  1882,  1883,    83,    84,   882,   124,   124,   113,
    1890,   113,    91,    92,   124,   124,   124,  1979,  1980,  1429,
    1900,   124,  1902,   124,   124,   104,   113,  1900,   107,  1902,
     113,  1911,  1912,    64,   943,   944,  1874,  1875,   947,   948,
     119,   115,   113,   124,   124,   124,   125,   113,   127,   124,
     478,   124,   115,   115,   115,   790,   115,   485,   137,   119,
     139,   140,   141,   142,   113,   144,   431,   115,  1948,  1949,
    1480,  1481,   115,  1953,  1954,   115,   115,  1957,   115,  1959,
     115,  1491,  1962,   115,   163,   115,  1966,   115,   964,   115,
     431,   170,   431,  1966,   431,  1382,  2021,  1908,   892,  1910,
    1980,   431,  1982,   182,   883,   770,  1986,   270,   270,   270,
    1377,   254,   191,   254,   388,     0,   280,   655,   914,  1999,
    1088,  1801,   853,  1970,   231,    91,    84,    84,   125,    92,
    1006,   236,    84,  1643,    -1,    -1,   425,   872,    -1,    -1,
     137,  2021,  2022,    -1,   141,    -1,    -1,  2027,    -1,    -1,
      -1,    -1,   231,    -1,    -1,   234,   235,   236,  2038,  1970,
    1971,    -1,  1973,    -1,  1975,   244,    -1,    -1,    -1,   597,
     598,   599,   600,    -1,    -1,   254,   255,   256,    -1,   914,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,   620,   621,    -1,   274,  1402,  1403,    -1,    84,
      -1,   280,  2013,  2014,    -1,  2016,    91,    92,    -1,   288,
      -1,    -1,    -1,    -1,    -1,   643,    -1,    -1,    -1,   943,
     944,  2032,    -1,   947,   948,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1108,    -1,   231,    -1,    -1,  2048,    -1,    -1,
      -1,    -1,    -1,    -1,   672,    -1,    -1,    -1,   119,    -1,
     678,    -1,     7,   681,  1130,    10,    11,    12,    13,    14,
      15,    16,    17,    -1,   343,    -1,    -1,    -1,    -1,   484,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   274,    -1,    -1,
      -1,    -1,    -1,   280,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   370,    -1,   372,   373,    -1,    -1,   376,   377,  1402,
    1403,  1588,    -1,  1590,   383,    -1,   191,    -1,   387,   388,
      -1,   390,    -1,    -1,    -1,    -1,    -1,  1604,  1605,    -1,
      -1,    -1,    -1,   885,  1734,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     419,   420,    -1,    -1,    -1,   424,   425,    -1,    -1,    -1,
      -1,    -1,   431,    -1,    -1,   110,   111,   436,    -1,   244,
      -1,    -1,   441,    -1,    -1,   120,   445,   446,    -1,   254,
      -1,   256,    -1,   370,   129,   130,   131,   132,   133,   376,
      -1,   943,   944,    -1,    -1,   947,   948,    -1,   467,   468,
      -1,   388,    -1,   472,   473,   266,    -1,   476,   477,   478,
      -1,    -1,    -1,    -1,   275,    -1,   485,    -1,    -1,    -1,
     281,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     499,    -1,    -1,    -1,    -1,   504,    -1,   506,   507,   508,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   441,   524,    -1,    -1,   527,    -1,
     529,    -1,   531,    -1,    -1,    -1,    -1,    -1,   537,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   686,    -1,    -1,    -1,    -1,    -1,    -1,   906,   907,
     908,    -1,    -1,  1689,    -1,  1691,    -1,    -1,    -1,    -1,
    1900,    -1,  1902,  1402,  1403,    -1,    -1,    -1,    -1,  1467,
      -1,   372,    -1,    -1,    -1,    -1,  1382,  1713,    -1,  1715,
    1072,  1073,  1799,    -1,    -1,    -1,    -1,   732,   597,   598,
     599,   600,  1809,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   424,
      -1,   620,   621,    -1,    -1,   624,    -1,    -1,    -1,    -1,
     629,    -1,    -1,    -1,    -1,    -1,  1966,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   643,    -1,    -1,   995,    -1,    -1,
      -1,   650,   651,   652,    -1,   654,   655,    -1,    -1,  1866,
    1867,    -1,    -1,    -1,    -1,    -1,  1689,    -1,  1691,    -1,
     669,    -1,    -1,   672,    -1,    -1,    -1,    -1,    -1,   678,
      -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1713,    -1,  1715,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,  1054,  1055,  1056,  1057,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1607,
      -1,    -1,    -1,    -1,    -1,    -1,  1074,    -1,    -1,    -1,
      -1,    -1,    -1,   650,   651,    -1,    -1,   654,   655,    -1,
      -1,    -1,    -1,  1869,  1870,  1871,  1872,  1873,    -1,    -1,
      -1,    -1,    -1,    -1,  1880,  1881,  1882,  1883,  1402,  1403,
      -1,   760,    -1,    -1,   763,   764,   765,    -1,   767,    -1,
      -1,   770,   771,    -1,    -1,   774,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   920,    -1,    -1,    -1,    -1,
     789,   790,  1588,    -1,  1590,    -1,    -1,    -1,   797,  1147,
    1148,   800,    -1,   802,    -1,   804,  1154,  1155,  1604,  1605,
    1158,  1159,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   624,
      -1,    -1,  1948,  1949,   629,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   625,    -1,    -1,   236,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1869,  1870,  1871,  1872,
    1873,    -1,    -1,    -1,    -1,    -1,   855,  1880,  1881,  1882,
    1883,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   789,   872,   873,    -1,    -1,    -1,    -1,    -1,
      -1,   880,   881,   800,    -1,    -1,   885,    -1,    -1,    -1,
      -1,    -1,   291,   892,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1041,   906,   907,   908,
      -1,  1046,  1800,    -1,  1049,   914,  1051,    -1,    -1,    -1,
    1402,  1403,    -1,    -1,    -1,  1948,  1949,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   943,   944,    -1,    -1,   947,   948,
      -1,    -1,    -1,    -1,    -1,   760,    -1,    -1,    -1,    -1,
    1095,    -1,    -1,    -1,   963,   964,  1101,    -1,    -1,   968,
      -1,    -1,    -1,    -1,    -1,   974,   767,    -1,    -1,   770,
     771,   980,    -1,    -1,    -1,   790,    -1,   986,    -1,    -1,
      -1,    -1,   797,    -1,    -1,    -1,   995,   914,    -1,   804,
      -1,    -1,    -1,  1799,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   266,    -1,  1809,    -1,    -1,    -1,    -1,    -1,    -1,
     275,    -1,    -1,    -1,    -1,    -1,   281,  1375,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1869,  1870,    -1,  1872,  1873,    -1,    -1,    -1,    -1,    -1,
     855,  1880,  1881,  1882,  1883,  1054,  1055,  1056,  1057,    -1,
       1,    -1,     3,     4,     5,    -1,    -1,   872,    -1,    -1,
    1866,  1867,    -1,  1072,  1073,  1074,    -1,    -1,    -1,    -1,
    1079,    -1,   873,    -1,    -1,   484,    -1,    28,    -1,  1088,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     0,    -1,    -1,  1105,  1106,  1107,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   372,    -1,  1948,
    1949,     0,    -1,    -1,    65,    -1,  1125,    -1,  1476,  1477,
      71,    72,    -1,  1132,    -1,    -1,    -1,   536,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    44,  1147,  1148,
      -1,    -1,    -1,    -1,    -1,  1154,  1155,    98,    -1,  1158,
    1159,   102,   103,   104,   105,   106,   107,   108,   567,    -1,
      -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,   122,   123,    -1,    -1,    82,    -1,    84,  1105,    -1,
      -1,    -1,    -1,    -1,    91,    92,    75,    -1,   597,   598,
     599,   600,    -1,    -1,    -1,    84,    -1,  1689,  1125,  1691,
      -1,    -1,    91,    92,    -1,  1132,    -1,    -1,    -1,    -1,
     117,   118,    -1,    -1,    -1,  1869,  1870,   124,  1872,  1873,
     127,  1713,    -1,  1715,    -1,    -1,  1880,  1881,  1882,  1883,
      -1,    -1,    -1,   140,    -1,   142,   125,   144,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   656,   137,    -1,
      -1,   660,   141,    -1,   161,   162,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1079,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1088,    -1,    -1,    -1,   686,    -1,    -1,
      -1,    -1,    -1,    -1,   191,    -1,    -1,    -1,    -1,    -1,
      -1,   700,    -1,    -1,  1948,  1949,    -1,    -1,    -1,  1444,
      -1,  1310,  1311,    -1,    -1,  1106,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1674,  1675,   727,    -1,
      -1,    -1,  1331,   732,   231,  1334,   735,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   244,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   755,   254,    -1,   256,
      -1,    -1,    -1,    -1,    -1,   244,    -1,    -1,    -1,    -1,
     625,    -1,    -1,    -1,    -1,   254,  1375,   256,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,  1869,  1870,  1871,
    1872,  1873,    -1,    -1,    -1,    -1,    -1,  1396,  1880,  1881,
    1882,  1883,    -1,  1402,  1403,    -1,    -1,    -1,  1407,  1408,
    1409,  1410,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     0,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,   350,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,  1948,  1949,  1467,    85,
      86,    87,    -1,   370,    -1,    -1,    -1,  1476,  1477,    -1,
     377,    -1,    -1,    -1,   100,    -1,  1621,    -1,    -1,    -1,
      -1,  1626,   389,    -1,  1629,    -1,    -1,   376,  1633,    -1,
      -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,   388,
      -1,    -1,   767,    -1,    -1,   770,   771,    -1,    -1,    75,
      -1,   920,   419,   420,    -1,    -1,    -1,   424,    84,    -1,
      -1,   428,    -1,    -1,   431,    91,    92,    -1,    -1,    -1,
    1331,  1540,    -1,  1334,    -1,    -1,    -1,    -1,   445,   446,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   441,    -1,    -1,    -1,    -1,    -1,    -1,   125,
     467,   468,    -1,  1708,    -1,   472,   473,    -1,    -1,   476,
     477,   137,    -1,   480,  1583,   141,    -1,  1586,    -1,    -1,
    1589,    -1,    -1,   490,   491,    -1,    -1,    -1,    -1,   998,
      -1,    -1,  1001,    -1,    -1,  1396,    -1,   504,  1607,   506,
     507,  1010,   509,    -1,    -1,    -1,    -1,    -1,   873,    -1,
    1411,    -1,   519,    -1,   521,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1032,  1033,    -1,    -1,    -1,  1773,    -1,
    1039,    -1,  1041,  1778,    -1,    -1,    -1,  1046,    -1,    -1,
    1049,    -1,  1051,    -1,    -1,  1054,  1055,  1056,  1057,  1658,
      -1,    -1,  1467,    -1,    -1,    -1,  1801,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1674,  1675,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   244,    -1,
    1689,    -1,  1691,    -1,    -1,    -1,  1095,    -1,   254,    -1,
     256,    -1,  1101,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,  1713,    -1,  1715,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   624,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   624,    -1,    -1,    -1,    -1,
      -1,    -1,  1151,   650,    -1,    -1,    -1,   654,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   124,    -1,    -1,   127,
      -1,    -1,   669,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,   142,    -1,   144,    -1,    -1,    -1,
      -1,    -1,  1583,    -1,    -1,    -1,  1931,    -1,  1589,  1798,
      -1,  1800,    -1,    -1,    -1,    -1,   110,   111,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,
     376,   125,   126,   127,    -1,   129,   130,   131,   132,   133,
      -1,    -1,   388,    -1,    -1,    78,  1627,  1628,    -1,  1630,
    1631,    -1,    -1,    -1,    -1,  1636,  1637,  1638,  1639,    -1,
      -1,  1106,    -1,    -1,    -1,    -1,  1991,  1648,  1649,  1650,
    1651,  1652,  1653,  1654,  1655,    -1,    -1,  1658,    -1,    -1,
    1869,  1870,  1871,  1872,  1873,  1874,  1875,   774,   236,    -1,
      -1,  1880,  1881,  1882,  1883,   441,    -1,    -1,    -1,    -1,
      -1,    -1,   789,   790,    -1,    -1,    -1,     3,    -1,    -1,
     797,    -1,    -1,   800,    -1,   802,    -1,    -1,    -1,    -1,
     789,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   800,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,   842,    -1,    -1,    -1,  1948,
    1949,    -1,    -1,   850,    -1,    -1,    -1,    -1,   855,    65,
      66,    -1,    -1,    -1,    -1,   862,    -1,    -1,    74,    75,
      76,    77,    -1,    79,    -1,   872,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,   885,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,   105,
      -1,    -1,    -1,   109,    -1,    -1,   112,  1798,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   121,    -1,   914,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1444,   943,   944,    -1,    -1,
     947,   948,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   419,   420,   960,    -1,   962,    -1,    -1,   624,    -1,
      -1,    -1,  1863,    -1,    -1,    -1,  1331,    -1,    -1,  1334,
      -1,  1480,  1481,    -1,    -1,    -1,    -1,   445,   446,    -1,
    1489,    -1,  1491,  1492,    -1,    -1,  1495,    -1,    -1,    -1,
     343,    -1,    -1,    -1,  1503,    -1,    -1,  1506,    -1,   467,
     468,    -1,    -1,    -1,   472,   473,    -1,    -1,   476,   477,
     478,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   377,    -1,    -1,    -1,    -1,    -1,
      -1,  1396,    -1,    -1,   387,    -1,   504,   390,   506,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1411,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1072,  1073,    -1,    -1,    -1,
      -1,    -1,   425,    -1,    -1,    -1,    -1,    -1,   431,    -1,
      -1,  1088,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1599,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1105,   567,
    1107,    -1,  1611,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1621,    -1,    -1,    -1,    -1,  1626,  1125,    -1,
    1629,    -1,    -1,   789,  1633,  1132,    -1,    -1,    -1,   597,
     598,   599,   600,    -1,   800,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,   499,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   507,    -1,    -1,    -1,    -1,    -1,
     119,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   524,    -1,    -1,   527,    -1,   529,    -1,   531,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1708,
      -1,    -1,    -1,    -1,   672,    -1,    -1,    -1,    -1,    -1,
     678,   170,    -1,   681,    -1,    -1,    -1,    -1,  1583,  1728,
    1729,  1730,  1731,    -1,  1589,  1734,    -1,    -1,    -1,    -1,
    1739,  1740,    -1,  1742,    -1,  1744,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1756,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1766,  1767,    -1,
      -1,    -1,  1627,  1628,  1773,  1630,  1631,    -1,    -1,  1778,
      -1,  1636,  1637,  1638,  1639,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1648,  1649,  1650,  1651,  1652,  1653,  1654,
    1655,    -1,  1801,  1658,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   266,    -1,    -1,
      -1,    -1,   271,   272,    -1,    -1,   275,    -1,    -1,    -1,
      -1,    -1,   281,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   291,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1350,    -1,    -1,    -1,   306,    -1,    -1,
      -1,    -1,   311,    -1,   822,   823,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1377,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1890,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1900,    -1,  1902,    -1,  1402,  1403,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     763,   764,   765,   372,    -1,    -1,    -1,   885,    -1,    -1,
      -1,   774,  1931,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1798,    -1,    -1,    -1,    -1,   906,    -1,
     908,    -1,    -1,    -1,  1953,  1954,    -1,    -1,  1957,    -1,
    1959,    -1,    -1,  1962,    -1,    -1,    -1,  1966,    -1,    -1,
    1467,    -1,    -1,  1972,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,   943,   944,    -1,    -1,   947,
     948,  1990,  1991,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1999,    -1,    -1,    28,    -1,    -1,    -1,    -1,  1863,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,  2027,   478,
      -1,    -1,    -1,    -1,    44,    -1,    -1,   995,    -1,    -1,
     998,    66,    -1,  1001,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,  1010,    -1,    79,    -1,    -1,    82,    83,   508,
      85,    86,    87,    -1,    -1,    75,    76,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,  1039,    -1,    -1,    -1,    -1,    -1,   536,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1054,  1055,  1056,  1057,
      -1,    -1,    -1,    -1,    -1,    -1,   116,   117,    -1,    -1,
      -1,    -1,    -1,   562,  1072,  1073,    -1,    -1,    -1,    -1,
     963,    -1,    -1,    -1,    -1,   968,    -1,    -1,    -1,    -1,
      -1,   974,    -1,    -1,    -1,    -1,    -1,   980,    -1,    -1,
      -1,    -1,    -1,   986,    -1,    -1,    -1,    -1,    -1,    -1,
     160,   161,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   625,    -1,    -1,    -1,
     629,   191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1148,    -1,  1689,    -1,  1691,    -1,    -1,  1155,    -1,    -1,
      -1,  1159,    -1,    -1,    -1,    -1,    -1,   656,    -1,    -1,
      -1,   660,    -1,    -1,    -1,    -1,  1713,    -1,  1715,    -1,
      -1,   231,   306,   672,    -1,  1722,    -1,    -1,    -1,   678,
      -1,    -1,   681,    -1,   244,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   700,    -1,    -1,    -1,    -1,    -1,   706,   707,   708,
     709,   710,   711,   712,  1107,    -1,   715,   716,    -1,   718,
     719,   720,   721,   722,   723,   724,   725,    -1,   727,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   735,   736,   737,   738,
     739,   740,   741,   742,   743,   744,   745,   746,   747,   748,
     749,   750,   751,   752,   753,    -1,   755,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   767,    -1,
      -1,   770,   771,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     350,    -1,   352,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,  1869,  1870,  1871,  1872,  1873,    -1,    -1,   389,
      -1,    66,    -1,  1880,  1881,  1882,  1883,    -1,    -1,    74,
      75,    -1,   841,    -1,    79,   844,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   424,   100,    -1,  1375,    -1,    -1,
      -1,    -1,    -1,    -1,   873,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   882,   119,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1402,  1403,    -1,    -1,    -1,    -1,
      -1,  1948,  1949,    -1,    -1,    -1,    -1,   906,    -1,   908,
      -1,  1419,    -1,  1421,    -1,    -1,    -1,  1310,  1311,    -1,
     480,    -1,   482,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     490,   491,    -1,    -1,    -1,    -1,    -1,    -1,   572,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   507,    -1,   509,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   517,    -1,   519,
      -1,    -1,    -1,    -1,    -1,   964,    -1,    -1,    -1,  1477,
      -1,    -1,  1480,  1481,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1489,    -1,  1491,  1492,     3,    -1,  1495,    -1,    -1,
     550,    -1,    -1,    -1,    -1,  1503,   995,    -1,  1506,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1006,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,  1032,  1033,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,   686,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,   719,   720,   721,   722,   723,
      -1,   109,   726,    -1,   112,    -1,    -1,    -1,   732,    -1,
      -1,   119,    -1,    -1,    -1,   123,    -1,  1106,   103,  1108,
      -1,    -1,    -1,   747,   748,   749,   750,   751,    -1,    -1,
     754,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
      -1,  1130,    -1,    -1,    -1,    -1,    -1,    -1,   772,   773,
      -1,    -1,    -1,    -1,    -1,    -1,  1145,    -1,    -1,  1148,
      -1,    -1,  1151,    -1,    -1,    -1,  1155,    -1,    -1,    -1,
    1159,    -1,    -1,    -1,    -1,    -1,    -1,  1675,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   170,    -1,    -1,    -1,    -1,
      -1,  1689,    -1,  1691,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1586,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1713,    -1,  1715,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1728,  1729,  1730,  1731,    -1,    -1,  1734,    -1,    -1,    -1,
      -1,  1739,  1740,    -1,  1742,    -1,  1744,   797,   103,    -1,
      -1,    -1,   802,    -1,    -1,    -1,    -1,    -1,  1756,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   266,    -1,    -1,    -1,    -1,   271,   272,    -1,    -1,
     275,    -1,   842,    -1,    -1,    -1,   281,    -1,    -1,   849,
     850,    -1,    -1,    -1,    -1,   855,   291,    -1,    -1,    -1,
      -1,    -1,   862,    -1,    -1,   170,    -1,    -1,    -1,    -1,
      -1,   306,   872,    -1,    -1,    -1,   311,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1331,    -1,    -1,  1334,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   914,    -1,    -1,    -1,    -1,    -1,
      -1,  1869,  1870,  1871,  1872,  1873,    -1,    -1,    -1,    -1,
      -1,    -1,  1880,  1881,  1882,  1883,  1375,   372,    -1,  1013,
      -1,    -1,  1890,  1382,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1900,    -1,  1902,    -1,    -1,  1396,    -1,    -1,
      -1,    -1,   962,    -1,    -1,    -1,    -1,  1041,    -1,    -1,
      -1,    -1,  1411,    -1,    -1,  1049,    -1,    -1,    -1,    -1,
    1419,    -1,  1421,    -1,    -1,     1,   291,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,  1438,
    1948,  1949,    -1,    -1,    -1,  1953,  1954,    -1,    -1,  1957,
      -1,  1959,    28,    -1,  1962,    -1,    -1,    -1,  1966,    -1,
      -1,  1095,    -1,    -1,    -1,    -1,    -1,  1101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1477,    -1,
      -1,    -1,    -1,   478,    -1,    -1,    -1,    -1,    -1,    65,
      -1,  1999,    -1,    -1,    -1,    71,    72,    73,    74,   291,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    -1,    -1,   508,   306,    -1,    -1,    -1,    -1,  2027,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,   536,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   562,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1583,    -1,    -1,    -1,    -1,  1588,
    1589,  1590,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1599,    -1,    -1,    -1,    -1,  1604,  1605,    -1,    -1,    -1,
      -1,    -1,  1611,   478,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1627,  1628,
     625,  1630,  1631,    -1,   629,    -1,    -1,  1636,  1637,  1638,
    1639,    -1,    -1,   508,    -1,    -1,    -1,    -1,    -1,  1648,
    1649,  1650,  1651,  1652,  1653,  1654,  1655,    -1,    -1,  1658,
      -1,   656,    -1,    -1,    -1,   660,    -1,    -1,    -1,    -1,
      -1,   536,    -1,    -1,    -1,    -1,  1675,   672,    -1,    -1,
      -1,    -1,    -1,   678,    -1,    -1,   681,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   562,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   700,    -1,    -1,    -1,    -1,
      -1,   706,   707,   708,   709,   710,   711,   712,    -1,    -1,
     715,   716,    -1,   718,   719,   720,   721,   722,   723,   724,
     725,    -1,   727,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     735,   736,   737,   738,   739,   740,   741,   742,   743,   744,
     745,   746,   747,   748,   749,   750,   751,   752,   753,    -1,
     755,    -1,    -1,    -1,    -1,    -1,    -1,  1766,  1767,    -1,
      -1,    -1,   767,    -1,    -1,   770,   771,    -1,    -1,    -1,
     572,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1349,
    1350,   656,    -1,    -1,    -1,   660,    -1,    -1,    -1,  1798,
    1799,    -1,    -1,    -1,    -1,    -1,    -1,   672,    -1,    -1,
    1809,    -1,    -1,   678,    -1,    -1,   681,  1377,    -1,  1379,
      -1,  1381,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   700,    -1,    -1,    -1,    -1,
      -1,    -1,   567,    -1,    -1,    -1,   841,    -1,    -1,   844,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   727,    -1,  1863,    -1,    -1,  1866,  1867,    -1,
     735,    -1,    -1,    -1,   599,   600,    -1,    -1,   873,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   882,    -1,    -1,
     755,    -1,    -1,    -1,   686,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1467,   700,    -1,
      -1,   906,    -1,   908,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   719,   720,   721,
     722,   723,    -1,    -1,   726,   727,    -1,    -1,    -1,    -1,
     732,    -1,    -1,   735,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   747,   748,   749,   750,   751,
      -1,    -1,   754,   755,    -1,    -1,    -1,    -1,    -1,   964,
      -1,    -1,    -1,  1972,    -1,    -1,   841,    -1,    -1,   844,
     772,   773,    -1,    -1,    -1,    -1,    -1,  1621,    -1,    -1,
      -1,  1990,  1626,  1627,  1628,  1629,  1630,  1631,    -1,  1633,
     995,    -1,  1636,  1637,  1638,  1639,    -1,    -1,    -1,    -1,
      -1,  1006,    -1,    -1,    -1,    -1,    -1,   882,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1032,  1033,    -1,
      -1,   906,    -1,   908,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,   964,
      -1,    -1,    -1,    -1,    -1,  1665,    -1,  1667,    -1,    -1,
      -1,  1106,    -1,  1108,    28,    -1,    -1,  1677,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     995,    -1,    -1,    -1,    -1,  1130,    -1,    -1,    -1,  1773,
      -1,  1006,    -1,    -1,  1778,    -1,    -1,    -1,    -1,    -1,
    1145,    65,    -1,  1148,    -1,    -1,  1151,    71,    72,    73,
    1155,    -1,    -1,    -1,  1159,    -1,    -1,  1032,  1033,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,  1013,    -1,    -1,     0,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1108,    -1,    -1,    -1,    -1,    -1,  1041,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1049,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1130,    -1,    -1,    44,    -1,
      -1,    -1,    -1,   998,    -1,    -1,  1001,    -1,    -1,    -1,
      -1,    -1,    -1,  1148,    -1,  1010,  1151,    -1,    -1,    -1,
    1155,    -1,    -1,    -1,  1159,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,  1095,    80,    -1,    82,    -1,    84,  1101,
      -1,     0,    -1,    -1,  1039,    91,    92,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1054,
    1055,  1056,  1057,    -1,    -1,    -1,  1331,    -1,    -1,  1334,
     116,   117,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    43,    -1,    -1,    -1,    -1,  1151,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1375,    -1,    -1,    -1,   160,   161,    75,  1382,    -1,    -1,
      -1,    -1,    -1,    -1,    83,    84,    -1,    -1,    -1,    -1,
      -1,  1396,    91,    92,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   191,  1411,    -1,    -1,    -1,
     109,    -1,    -1,    -1,  1419,   201,  1421,   203,    -1,    -1,
     119,    -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,
      -1,    -1,    -1,  1438,    -1,    -1,    -1,    -1,   137,    -1,
     139,    -1,   141,    -1,    -1,   231,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   244,    -1,
      -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,   254,    -1,
     256,    -1,  1477,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1375,    -1,    -1,    -1,    -1,    -1,    -1,  1382,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   231,    -1,    -1,   234,   235,   236,    -1,    -1,
      -1,    -1,    -1,    -1,  1419,   244,  1421,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   254,   255,   256,    -1,    -1,
      -1,    -1,    -1,  1438,   350,    -1,   352,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   274,    -1,    -1,  1583,    -1,
      -1,   280,    -1,  1588,  1589,  1590,    -1,    -1,    -1,   288,
      -1,    -1,    -1,    -1,  1599,    -1,    -1,    -1,    -1,  1604,
    1605,    -1,  1477,   389,    -1,    -1,  1611,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1627,  1628,    -1,  1630,  1631,    -1,    -1,    -1,
      -1,  1636,  1637,  1638,  1639,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1648,  1649,  1650,  1651,  1652,  1653,  1654,
    1655,    -1,    -1,  1658,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1675,   370,    -1,   372,   373,    -1,    -1,   376,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   388,
      -1,    -1,    -1,    -1,   480,    -1,   482,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   490,   491,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1588,    -1,  1590,    -1,    -1,    -1,    -1,
      -1,   507,    -1,   509,  1599,   424,    -1,    -1,    -1,  1604,
    1605,   517,    -1,   519,    -1,    -1,  1611,    -1,    -1,    -1,
      -1,    -1,   441,    -1,    -1,  1480,  1481,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1489,    -1,  1491,  1492,    -1,    -1,
    1495,  1766,  1767,    -1,   550,    -1,    -1,    -1,  1503,    -1,
      -1,  1506,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   478,
      -1,    -1,    -1,    -1,    -1,    -1,   485,    -1,    -1,    -1,
      -1,    -1,    -1,  1798,  1799,    -1,    -1,    -1,    -1,    -1,
    1675,    -1,    -1,    -1,  1809,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1621,
      -1,    -1,    -1,    -1,  1626,  1627,  1628,  1629,  1630,  1631,
      -1,  1633,    -1,    -1,  1636,  1637,  1638,  1639,   624,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1648,  1649,  1650,  1651,
    1652,  1653,  1654,  1655,    -1,    -1,    -1,    -1,  1863,    -1,
      -1,  1866,  1867,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   574,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1766,  1767,    -1,    -1,    -1,    -1,    -1,   597,   598,
     599,   600,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   620,   621,    -1,  1799,   624,    -1,    -1,    -1,    -1,
     629,    -1,    -1,    -1,  1809,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   643,    -1,    -1,    -1,    -1,    -1,
      -1,   650,   651,   652,    -1,   654,   655,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    83,  1972,    -1,    -1,
     669,  1773,    -1,   672,    -1,    -1,  1778,    -1,    -1,   678,
      -1,    -1,   681,    -1,    -1,  1990,    -1,    -1,    -1,    -1,
      -1,  1866,  1867,  1728,  1729,  1730,  1731,    -1,    -1,  1734,
      -1,    -1,   119,    -1,  1739,  1740,    -1,  1742,   125,  1744,
      -1,    -1,    -1,    -1,    -1,    -1,   802,    -1,    -1,    -1,
     137,  1756,   139,     1,   141,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,   842,    -1,    -1,    -1,
      -1,   760,    -1,    -1,    -1,    -1,    -1,    -1,   767,   855,
      -1,   770,   771,    -1,   191,    -1,   862,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
     789,   790,    -1,    71,    72,    73,    -1,  1972,   797,    -1,
      -1,   800,   801,   802,    -1,   804,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,   231,  1990,    -1,   234,   235,   236,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,   255,   117,
      -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,  1890,   855,   274,    -1,    -1,
      -1,    -1,    -1,   280,    -1,  1900,    -1,  1902,    -1,    -1,
      -1,    -1,    -1,   872,   873,    -1,   962,    -1,    -1,    -1,
      -1,   880,   881,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   892,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   906,   907,   908,
      -1,    -1,    -1,    -1,    -1,   914,    -1,    -1,  1953,  1954,
      -1,    -1,  1957,    -1,  1959,    -1,    -1,  1962,    -1,    -1,
      -1,  1966,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,   370,    -1,   372,   373,    -1,    -1,   376,
      -1,    -1,    -1,    -1,  1999,    28,    -1,    -1,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  2027,    -1,    -1,    -1,   995,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,   424,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,  1015,    -1,    -1,    -1,
      -1,    84,    85,    -1,   441,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,   117,  1054,  1055,  1056,  1057,   122,
     123,   478,   125,   126,   127,   128,    -1,    -1,   485,    -1,
      -1,    -1,    -1,    -1,    -1,  1074,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1088,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,  1105,  1106,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,  1125,    -1,    -1,    -1,
      -1,    -1,    -1,  1132,    -1,    -1,    44,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1147,  1148,
      -1,    -1,    -1,    -1,    -1,  1154,  1155,    -1,    65,  1158,
    1159,    -1,    -1,    -1,    71,    72,    73,    75,    76,    -1,
      -1,    -1,    80,    -1,    82,    -1,    -1,    84,    85,    -1,
     597,   598,   599,   600,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   620,   621,   112,   113,   114,   116,   117,
     117,    -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,   643,    -1,    -1,    -1,
      -1,    -1,    -1,   650,   651,    -1,    -1,   654,   655,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    83,    -1,
      -1,    -1,   160,   161,    -1,   672,    -1,    -1,    -1,    -1,
      -1,   678,    -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   191,   119,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   201,    -1,   203,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   231,    -1,    -1,    -1,    -1,   163,    -1,
      -1,    -1,  1331,    -1,    -1,  1334,   244,    -1,    -1,    -1,
      -1,    -1,    -1,   760,    -1,    -1,    -1,    -1,    -1,    -1,
     767,    -1,    -1,   770,   771,    -1,   191,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   789,   790,    -1,    -1,  1375,    -1,    -1,    -1,
     797,  1467,    -1,   800,    -1,    -1,    -1,   804,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   231,  1396,    -1,   234,
     235,   236,    -1,    -1,    -1,    -1,    -1,    -1,  1407,  1408,
    1409,  1410,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     255,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   855,   274,
      -1,    -1,   350,    -1,   352,   280,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   288,    -1,   872,   873,    -1,    -1,    -1,
      -1,    -1,    -1,   880,   881,    -1,    -1,    -1,  1467,    -1,
      -1,     3,    -1,    -1,    -1,   892,    -1,  1476,  1477,    -1,
      -1,   389,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   906,
     907,   908,    -1,    -1,    -1,    -1,    28,   914,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,   427,
     428,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,   370,    -1,   372,   373,    -1,
      -1,  1540,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,   480,    -1,   482,    -1,    -1,   109,   995,    -1,
     112,    -1,   490,   491,  1583,    -1,    -1,     1,    -1,   424,
    1589,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   507,
      -1,   509,    -1,    -1,    -1,    -1,    -1,    -1,  1607,   517,
      -1,   519,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,  1054,  1055,  1056,
    1057,    -1,   550,   478,    -1,    -1,    -1,    -1,    -1,    -1,
     485,    -1,    66,    -1,    -1,    -1,    -1,  1074,    -1,  1658,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,    -1,  1674,  1675,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,  1105,  1106,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   115,    -1,   117,   118,    -1,    -1,    -1,  1125,    -1,
      -1,    -1,    -1,    -1,    -1,  1132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1147,  1148,    -1,    -1,    -1,    -1,    -1,  1154,  1155,    -1,
      -1,  1158,  1159,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   597,   598,   599,   600,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   620,   621,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   629,    -1,    -1,    -1,    -1,  1798,
      -1,  1800,    -1,    -1,    -1,    -1,    -1,    -1,   643,    -1,
      -1,    -1,    -1,    -1,    -1,   650,   651,   652,    -1,   654,
     655,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      83,    -1,    -1,    -1,   669,    -1,    -1,   672,    -1,    -1,
      -1,    -1,    -1,   678,    -1,    -1,   681,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1874,  1875,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   802,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
     163,     8,     9,    -1,  1331,    -1,    -1,  1334,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   760,    -1,    -1,    -1,    -1,
      -1,    28,   767,    -1,   842,   770,   771,    -1,   191,    -1,
      -1,   849,   850,    -1,    -1,    -1,    -1,   855,    -1,    -1,
      -1,   859,    -1,   861,   862,   790,    -1,    -1,  1375,    -1,
      -1,    -1,   797,    -1,    -1,    -1,    -1,   802,    65,   804,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,   231,  1396,
      -1,   234,   235,   236,    -1,    -1,    -1,    84,    85,    -1,
    1407,  1408,  1409,  1410,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,   255,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     855,   274,   119,    -1,    -1,   122,   123,   280,   125,   126,
     127,   128,    -1,    -1,    -1,   288,    -1,   872,   873,    -1,
      -1,    -1,    -1,    -1,    -1,   880,   881,    -1,    -1,    -1,
    1467,    -1,    -1,    -1,   962,    -1,    -1,   892,    -1,  1476,
    1477,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   906,   907,   908,    -1,    -1,    -1,    -1,    -1,   914,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   370,    -1,   372,
     373,    -1,    -1,  1540,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    79,    -1,
     995,    -1,    -1,    84,    85,    86,  1583,    88,    89,    90,
      -1,   424,  1589,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,    -1,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1054,
    1055,  1056,  1057,    -1,    -1,   478,    -1,    -1,    -1,    -1,
      -1,    -1,   485,    -1,    -1,    -1,    -1,    -1,    -1,  1074,
      -1,  1658,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1088,    -1,    -1,    -1,  1674,  1675,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1105,  1106,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1125,    -1,    -1,    -1,    -1,    -1,    -1,  1132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1147,  1148,    -1,    -1,    -1,    -1,    -1,  1154,
    1155,    -1,    -1,  1158,  1159,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   597,   598,   599,   600,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   620,   621,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   629,    -1,    -1,    -1,
      -1,  1798,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     643,    -1,    -1,    -1,    -1,    -1,    -1,   650,   651,   652,
      -1,   654,   655,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   669,    -1,    -1,   672,
      -1,    -1,    -1,    -1,    -1,   678,    -1,    -1,   681,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1874,  1875,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1379,    -1,  1381,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,  1331,    -1,    -1,  1334,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   760,    -1,    -1,
      28,    -1,    -1,    -1,   767,    -1,    -1,   770,   771,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   790,    -1,    -1,
    1375,    -1,    -1,    -1,   797,    -1,    -1,    65,    -1,   802,
      -1,   804,    -1,    71,    72,    73,    -1,    -1,    -1,  1467,
      -1,  1396,    -1,    -1,    -1,    -1,    84,    85,    -1,    -1,
      -1,    -1,  1407,  1408,  1409,  1410,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    83,   112,   113,   114,    -1,    -1,   117,
      -1,    -1,   855,   121,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   872,
     873,    -1,    -1,    -1,    -1,    -1,    -1,   880,   881,   119,
      -1,    -1,  1467,    -1,    -1,   125,    -1,    -1,    -1,   892,
      -1,  1476,  1477,    -1,    -1,    -1,    -1,   137,     1,   139,
       3,   141,    -1,   906,   907,   908,    -1,    -1,    -1,    -1,
      -1,   914,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   163,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1540,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,   231,   995,    -1,   234,   235,   236,   100,  1583,    -1,
      -1,    -1,    -1,    -1,  1589,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,    -1,   255,    -1,    -1,    -1,    -1,
     123,    -1,  1607,    -1,    -1,    -1,    -1,    -1,    83,    -1,
      -1,    -1,    -1,    -1,   274,    -1,    -1,    -1,    -1,    -1,
     280,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1054,  1055,  1056,  1057,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
     125,  1074,    -1,  1658,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   137,    -1,   139,  1088,   141,    -1,    -1,  1674,
    1675,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1105,  1106,    -1,    -1,    -1,    -1,   163,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1125,    -1,    -1,    -1,    -1,    -1,    -1,  1132,
     370,    -1,   372,   373,    -1,    -1,   376,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1147,  1148,    -1,    -1,   388,    -1,
      -1,  1154,  1155,    -1,    -1,  1158,  1159,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   231,    -1,    -1,   234,
     235,   236,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     255,   441,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1798,    -1,  1800,    -1,    -1,    -1,   274,
      -1,    -1,    -1,    65,    -1,   280,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,   478,    -1,
      -1,    -1,    84,    85,    -1,   485,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,     0,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,  1874,
    1875,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    43,    44,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   370,    -1,   372,   373,    -1,
      -1,   376,    -1,    -1,    -1,    -1,    -1,    -1,  1331,    -1,
      -1,  1334,    -1,   388,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    84,    -1,    -1,    -1,    -1,    -1,    -1,
      91,    92,    -1,    -1,    -1,    -1,    -1,   597,   598,   599,
     600,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,  1375,    -1,    -1,   116,    -1,    -1,    -1,    -1,
     620,   621,    -1,    -1,    -1,    -1,   441,    -1,    -1,    -1,
      -1,    -1,    -1,  1396,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   643,  1407,  1408,  1409,  1410,    -1,    -1,
     650,   651,    -1,    -1,   654,   655,    -1,    -1,    -1,   160,
      -1,    -1,    -1,   478,    -1,    -1,    -1,    -1,    -1,    -1,
     485,    -1,   672,    -1,    -1,    -1,    -1,   236,   678,    -1,
      -1,   681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1467,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1476,  1477,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   288,
     231,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   244,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   254,    -1,   256,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   767,    -1,    -1,
     770,   771,    -1,    -1,    -1,    -1,    -1,  1540,    -1,    -1,
      -1,    -1,   597,   598,   599,   600,    -1,    -1,    -1,   789,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     800,    -1,    -1,    -1,    -1,   620,   621,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1583,    -1,    -1,    -1,    -1,    -1,  1589,    -1,   643,    -1,
     389,    -1,    -1,    -1,    -1,   650,   651,    -1,    -1,   654,
     655,    -1,    -1,    -1,  1607,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   672,    -1,    -1,
      -1,    -1,    -1,   678,    -1,    -1,   681,    -1,    -1,   370,
      -1,    -1,    -1,   873,    -1,    -1,    -1,    -1,    -1,    -1,
     880,   881,    -1,    -1,    -1,    -1,    -1,    -1,   389,    -1,
      -1,    -1,   892,    -1,    -1,  1658,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,    -1,   906,   907,   908,    -1,
      -1,  1674,  1675,    -1,   914,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   424,    -1,    -1,   427,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,   767,    -1,    -1,   770,   771,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,   119,    -1,
      -1,    -1,    -1,    -1,   789,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,   800,    85,    86,    87,   490,
     491,    -1,    -1,    -1,    -1,   995,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,   507,    -1,   509,    -1,
      -1,    -1,    -1,   572,   113,    -1,   517,    -1,    -1,   170,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   587,    -1,
      -1,    -1,    -1,    -1,    -1,  1798,    -1,  1800,   597,   598,
     599,   600,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   550,
      -1,    -1,    -1,    -1,  1054,  1055,  1056,  1057,   873,    -1,
      -1,    -1,    -1,    -1,    -1,   880,   881,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1074,    -1,    -1,   892,    -1,   638,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,   906,   907,   908,    -1,    -1,    -1,    -1,    -1,   914,
      -1,    -1,    -1,    -1,   663,  1105,  1106,    28,    -1,    -1,
      -1,  1874,  1875,    -1,    -1,   266,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   624,   275,  1125,    -1,    -1,    -1,   688,
     281,    -1,  1132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,  1147,  1148,   650,
      71,    72,    73,   654,  1154,  1155,    -1,    -1,  1158,  1159,
      -1,    -1,    -1,    84,    85,    -1,    -1,   726,   669,    -1,
      -1,    -1,    -1,    -1,    -1,   734,    -1,    98,    -1,    -1,
     995,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,   754,   117,    -1,    -1,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,   772,   773,    -1,    -1,    -1,    -1,    -1,
      -1,   372,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1054,
    1055,  1056,  1057,   802,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1074,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   774,   775,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   789,    -1,
    1105,  1106,    -1,    -1,    -1,    -1,   797,    -1,    -1,   800,
     801,   802,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1125,    -1,    -1,    -1,    -1,    -1,    -1,  1132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   478,    -1,    -1,
      -1,  1331,  1147,  1148,  1334,    -1,    -1,    -1,    -1,  1154,
    1155,   842,    -1,  1158,  1159,    -1,    -1,    -1,   849,    -1,
      -1,   288,    -1,    -1,   855,    -1,    -1,   508,    -1,    -1,
      -1,   862,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   872,    -1,    -1,    -1,  1375,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1396,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1407,  1408,  1409,
    1410,   562,    -1,   914,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   998,
      -1,    -1,  1001,  1002,  1003,    -1,  1005,    -1,    -1,    -1,
      -1,    -1,   389,    -1,  1013,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1021,    -1,    -1,    -1,    -1,    -1,    -1,  1028,
      -1,    -1,    -1,    -1,   625,    -1,  1476,  1477,    -1,    -1,
    1039,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1047,    -1,
      -1,    -1,    -1,  1052,    -1,  1054,  1055,  1056,  1057,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1331,    -1,    -1,  1334,
      -1,   672,    -1,    -1,    -1,    -1,    -1,   678,    -1,    -1,
     681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1097,    -1,
    1540,    -1,    -1,    -1,  1103,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1375,    -1,    -1,    -1,    -1,    -1,    -1,  1126,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1396,    -1,  1583,    -1,    -1,    -1,  1088,    -1,  1589,
      -1,    -1,  1407,  1408,  1409,  1410,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1105,    -1,  1107,    -1,    -1,    -1,
      -1,  1170,    -1,    -1,  1115,    -1,   767,    -1,    -1,   770,
     771,    -1,    -1,    -1,  1125,    -1,    -1,    -1,    -1,    -1,
      -1,  1132,    -1,    -1,    -1,   572,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     587,    -1,    -1,    -1,   591,    -1,    -1,    -1,  1658,    -1,
      -1,  1476,  1477,    -1,    -1,    -1,    -1,  1226,    -1,    -1,
      -1,    -1,    -1,    -1,  1674,  1675,    -1,    -1,    -1,    -1,
      -1,  1240,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     841,    -1,    -1,   844,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   638,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   652,    -1,    -1,    -1,    -1,
      -1,    -1,   873,    -1,    -1,  1540,   663,   664,    -1,    -1,
      -1,   882,    -1,    -1,    -1,    -1,  1295,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   688,    -1,    -1,    -1,   906,    -1,   908,    -1,    -1,
      -1,    -1,  1321,    -1,    -1,    -1,  1325,    -1,  1583,    -1,
      -1,    -1,    -1,    -1,  1589,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   726,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   734,  1798,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   964,    -1,    -1,    -1,   754,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   772,   773,    -1,    -1,    -1,
      -1,    -1,    -1,  1658,   995,    -1,    -1,    -1,  1349,    -1,
      -1,    -1,     3,    -1,    -1,  1006,    -1,    -1,    -1,  1674,
    1675,    -1,    -1,    -1,    -1,   802,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1874,  1875,  1377,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,  1480,  1481,    74,    75,  1484,    -1,  1486,    79,    -1,
      -1,  1490,  1491,    -1,    85,    86,    87,  1496,  1497,    -1,
    1499,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
    1509,    -1,  1511,    -1,    -1,  1106,    -1,  1108,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,  1467,    -1,   119,    -1,
      -1,    -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,
      -1,    -1,    -1,  1798,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1148,    -1,    -1,
      -1,    -1,  1561,    -1,  1155,    -1,    -1,    -1,  1159,     1,
      -1,    -1,  1571,    -1,    -1,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,  1874,
    1875,    -1,    -1,    -1,    -1,  1002,  1003,    -1,  1005,    -1,
      -1,    -1,    -1,    -1,    66,    -1,  1013,    -1,    -1,    -1,
    1017,    -1,    74,    75,  1021,    -1,    -1,    79,    -1,    -1,
      -1,  1028,  1029,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
    1047,  1048,    -1,    -1,    -1,  1052,    -1,   109,   110,   111,
     112,    -1,    -1,   115,   116,   117,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,   127,    -1,   129,   130,   131,
     132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1097,    -1,    -1,    -1,    -1,    -1,  1103,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,  1734,  1677,  1736,    -1,    -1,
    1331,    -1,    -1,  1334,  1743,    -1,    -1,    -1,  1747,  1126,
    1749,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1758,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,  1375,    -1,    -1,    -1,    -1,    -1,
      -1,  1382,    -1,  1170,  1171,    -1,    -1,    -1,    66,    -1,
      -1,  1800,    -1,    -1,    -1,  1396,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
    1411,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1419,    -1,
    1421,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1438,    -1,  1226,
     118,  1228,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1240,  1241,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1477,    -1,    -1,    -1,
      -1,    -1,  1891,  1892,    -1,  1894,    28,  1896,    -1,    -1,
      -1,  1900,  1901,  1902,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1295,    -1,
    1297,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,  1321,    -1,  1323,    -1,  1325,    -1,
    1327,    -1,    84,    85,    -1,    -1,  1955,    -1,    -1,  1958,
      -1,    -1,    -1,    -1,    -1,    -1,    98,  1966,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,  1583,   125,   126,   127,   128,  1588,  1589,  1590,
      -1,    -1,    -1,  2002,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1604,  1605,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1627,  1628,    -1,  1630,
    1631,    -1,    -1,    -1,    -1,  1636,  1637,  1638,  1639,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1648,  1649,  1650,
    1651,  1652,  1653,  1654,  1655,    -1,     1,  1658,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1675,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1484,  1485,  1486,
    1487,    -1,    -1,  1490,  1491,    -1,    -1,    -1,    -1,  1496,
    1497,    -1,  1499,    -1,  1501,    -1,    -1,    -1,    -1,    -1,
      65,    -1,  1509,  1510,  1511,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,  1561,  1562,    -1,   122,   123,   124,
     125,   126,   127,   128,  1571,  1572,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1798,  1799,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     0,     1,  1809,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    53,
      -1,    -1,  1863,    -1,    -1,  1866,  1867,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1736,
      -1,     1,    -1,     3,  1741,    -1,  1743,  1744,    -1,  1746,
    1747,    -1,  1749,    -1,  1751,    -1,    -1,    -1,    -1,    -1,
    1757,  1758,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1800,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,     1,    -1,     3,     4,     5,     6,   109,
       8,     9,   112,   113,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,  1891,  1892,    -1,  1894,  1895,  1896,
      -1,    -1,    -1,    -1,  1901,  1902,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,  1955,  1956,
      -1,  1958,  1959,    -1,   122,   123,  1963,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     0,     1,  2002,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,    -1,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,   117,   118,   119,   120,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     0,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
      -1,   117,   118,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,   118,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     0,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
     118,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,    -1,   117,   118,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     0,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     0,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     0,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     0,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
       1,   114,     3,     4,     5,     6,    -1,     8,     9,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    84,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,     1,   114,
       3,     4,     5,     6,   119,     8,     9,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    84,    85,    86,    87,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    28,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    -1,    88,    89,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
      -1,   117,    -1,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    -1,
      88,    89,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,
      -1,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    -1,    88,    89,
      90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    -1,    88,    89,    90,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,   124,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,   117,    -1,    -1,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,   124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,    -1,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
     117,    -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,   117,    -1,    -1,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,    -1,
      -1,    -1,   122,   123,   124,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,   118,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,   123,   124,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,   124,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
       0,     1,    -1,     3,     4,     5,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,     0,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    53,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,     0,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,     0,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,     1,   118,     3,     4,     5,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,     1,   118,     3,     4,     5,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,     1,   118,     3,     4,     5,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,     1,   118,     3,     4,     5,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,     1,   118,     3,     4,     5,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,     1,   118,     3,     4,     5,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,     1,   118,     3,     4,     5,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,     1,   118,     3,     4,     5,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,     1,   118,     3,     4,     5,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,     1,   118,     3,     4,     5,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,     1,   118,     3,     4,     5,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,     1,   118,     3,     4,     5,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,     3,
       4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,    88,    -1,    -1,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,     1,   118,     3,     4,     5,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,
     118,     3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,     1,    -1,     3,     4,     5,    -1,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,     1,
      -1,     3,     4,     5,    -1,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,     3,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,
     122,   123,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     0,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,
      -1,   125,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,    96,
      -1,    -1,    99,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    -1,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     0,    96,    -1,    -1,    99,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   115,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,    96,
      -1,    -1,    99,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    -1,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     0,    96,    -1,    -1,    99,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
       3,    -1,    99,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,    -1,   121,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     123,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   123,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   123,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
      -1,    -1,   121,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,    -1,    -1,    -1,    -1,    -1,   121,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    -1,    -1,    -1,    -1,    -1,
     121,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,     1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
       1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,     1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,     0,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    76,    77,    -1,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,   101,    -1,    -1,    -1,   105,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,   107,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,   107,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,   107,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,   115,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    53,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      76,    77,    -1,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,     0,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,   101,    -1,    -1,    -1,   105,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    80,    81,    82,    83,    -1,    85,    86,    87,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   113,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,   107,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,     1,    -1,     3,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     1,
      -1,     3,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,     1,    -1,     3,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,     3,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,     3,    -1,    -1,    79,    80,    81,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     123,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   123,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned short int yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    53,    65,    66,    74,    75,
      76,    77,    79,    80,    81,    82,    83,    85,    86,    87,
     100,   101,   105,   109,   112,   115,   135,   136,   137,   139,
     164,   201,   202,   203,   204,   205,   206,   260,   263,   264,
     267,   268,   269,   270,   271,   272,   273,   275,   279,   282,
     283,   284,   285,   286,   287,   292,   293,   301,   302,   303,
     306,   307,   310,   314,   341,   344,   345,   363,   364,   366,
     367,   368,   369,   370,   371,    77,   121,     5,    31,   206,
     365,   206,   112,   112,   112,   139,   206,   365,   273,   274,
     306,   310,   206,   301,   303,   305,   306,   310,   313,   110,
     115,   136,   137,   206,   119,   121,   115,   119,   118,   109,
     110,   201,   206,   119,   139,   206,   119,   121,   118,   110,
     119,   121,   119,   118,   119,   137,   206,     1,    31,   115,
     135,   203,   205,   206,   260,   270,   271,   273,   275,   303,
     306,   310,   313,   314,   322,   323,   324,   325,   324,   112,
     123,     1,    29,    30,    31,    32,    33,    65,   113,   135,
     206,   259,   263,   265,   266,   273,   275,   279,   280,   281,
     287,   291,   299,   300,   328,   329,   330,   331,   332,   333,
     303,   310,   303,   306,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    46,    47,    66,    85,    87,   100,
     119,   139,   160,   161,   259,   264,   265,   273,   276,   280,
     282,   290,   343,   346,   347,   348,   353,   354,   355,    31,
      76,   121,   203,   205,   292,   344,   345,   363,   364,   371,
       1,   203,   269,   286,   292,   314,   341,   367,     1,   366,
     367,     0,   206,   365,   365,     5,   116,   365,     1,     4,
       6,     8,     9,    65,    71,    72,    73,    84,    85,    98,
     102,   103,   104,   105,   106,   107,   108,   109,   112,   114,
     122,   123,   125,   126,   127,   128,   139,   165,   166,   206,
     207,   208,   211,   212,   216,   217,   219,   220,   221,   222,
     223,   224,   225,   226,   227,   228,   229,   230,   231,   232,
     233,   237,   239,   240,   242,   243,   244,   245,   246,   247,
     248,   249,   250,   251,   252,   253,   365,   377,   378,   379,
     380,   136,   206,   119,   139,   206,   273,   310,   301,   303,
     310,   305,   306,   113,   306,    85,   139,   190,   191,   193,
     195,   199,   200,   206,   217,   231,   232,   240,   252,   257,
     290,   115,   110,   110,   115,     1,    68,    78,    80,    81,
      85,    88,    91,    92,    93,    94,    96,    98,    99,   112,
     114,   115,   118,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   162,   163,   165,   166,   169,   170,   171,   172,
     173,   174,   175,   176,   177,   178,   182,   186,   187,   188,
     189,   206,   212,   237,   291,   302,   304,   306,   310,   314,
     315,   342,    80,    81,   206,   259,   263,   273,   276,   279,
     287,   294,   295,     1,   118,   188,   189,   137,   206,     1,
     206,   261,   262,     1,   118,   262,   295,    65,   190,   192,
     194,   196,   197,   198,   206,     1,   118,   188,   189,   295,
       1,   118,   188,   189,     1,   118,   188,   189,   119,   303,
     310,   303,   306,     1,   116,   347,   354,   355,     1,   115,
     117,   117,   115,   124,   136,   206,   253,   257,   258,   117,
     119,   139,   206,   118,   119,   118,   119,   112,   123,   125,
     135,   206,   259,   265,   273,   275,   280,   306,   308,   310,
     311,   313,     1,   113,   117,     1,   113,   117,     1,   117,
       1,   117,   113,   113,   303,   303,   112,   112,     1,   115,
       1,   118,     1,   115,   206,   259,   265,   273,   276,   280,
     306,   324,   325,     1,   115,     1,   343,   346,   354,   355,
     343,   346,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    79,    86,    88,    89,    90,   115,   121,
     183,   184,   185,   206,   212,   217,   233,   235,   240,   253,
     254,   255,   334,   335,   338,   339,   340,   347,   348,   349,
     350,   351,   352,   354,   355,   357,   358,   359,   360,   361,
     362,   118,    31,   206,   365,   206,   201,   202,   204,   205,
     314,   347,   355,   203,   292,   116,   232,   113,     1,   112,
     166,   208,   213,   216,   218,   238,   239,   241,   112,   217,
     240,   217,   240,   112,   206,   259,   265,   273,   276,   280,
     298,   257,   112,   112,   298,   257,   112,   112,   112,   112,
     112,   113,   233,   235,   255,   265,   273,   275,   280,   288,
     326,   365,   119,   167,   168,   209,   214,   233,   119,     1,
     118,   119,     1,     7,     8,     9,   112,   120,   123,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,   116,
     234,   168,   209,   210,   220,   242,   109,   129,   130,   126,
     127,    10,    11,   223,   245,    12,    13,   110,   111,    14,
      15,   125,   131,   132,    16,    17,   133,   234,   113,     7,
       8,     9,   112,   120,   123,   234,   109,   129,   130,   126,
     127,    10,    11,    12,    13,   110,   111,    14,    15,   125,
     131,   132,    16,    17,   133,   234,   113,   113,   107,   206,
     291,   372,   375,   376,   119,   119,   305,   116,    11,   111,
     117,   116,   133,   133,   112,   306,   310,   311,    65,   190,
     198,   206,   198,     1,   206,   259,   273,   276,   287,   296,
     291,   314,   315,   112,   139,   206,   206,   291,     1,   112,
     296,   109,   112,   206,   291,   115,   354,   355,   354,   355,
     354,   115,   354,   355,   115,   115,     1,   118,   115,     1,
       1,   115,   117,   117,    69,    70,    91,    95,    97,   118,
      69,    70,   118,   115,     1,   186,   187,     1,   186,   187,
       1,   116,   112,   115,   121,   206,   277,   278,   301,   306,
     310,   314,   315,   316,     1,   291,   299,   330,   304,   310,
     304,   306,   112,   121,   146,   147,   162,   163,   165,   166,
     175,   206,   291,   110,   139,   206,   206,   259,   273,   276,
     110,   110,   116,   117,     1,   115,   119,    28,   138,   206,
     206,   111,   117,   116,   115,   117,   118,   148,   149,   150,
     151,   152,   153,   154,   155,   156,   157,   158,   159,   209,
     210,   212,   232,   253,   290,   319,   320,   303,   303,     1,
     119,   233,   254,   317,   318,   354,   355,   322,   323,   322,
     323,   124,   124,   124,    51,   328,   329,     1,   262,   119,
     119,     1,   118,   188,   189,     1,   118,   188,   189,   113,
     206,   299,   300,   311,   332,   333,   124,   136,   257,   258,
     313,   308,   310,   112,   123,   308,     1,     1,   117,     1,
      51,   206,   328,   329,   117,     1,    51,   206,   328,   329,
     117,     1,    51,   206,   328,   329,   117,    51,   206,   328,
     329,   233,   136,   206,   118,   119,   115,   115,   121,   257,
     258,   121,   112,   112,     1,   112,    52,    53,    54,    56,
      57,    58,    59,    62,    79,    86,   206,   255,   334,   357,
     361,   112,   206,   115,   115,   115,   209,   210,   235,   255,
     112,   273,   112,   112,   179,   206,   115,   115,   115,   121,
     120,   234,     1,   120,     1,   115,   117,   235,   255,   234,
     113,   117,   235,     1,   349,   350,   349,   350,   334,   335,
     343,   346,   334,   335,   343,   346,     1,     1,   365,   365,
     137,   206,   119,   119,   347,   355,   355,   232,   115,    65,
     135,   206,   217,   240,   265,   273,   275,   280,   289,   327,
       1,     1,     7,     8,     9,   112,   120,   123,     7,     8,
       9,   112,   120,   123,   206,   290,   110,   112,   123,   206,
     259,   265,   273,   276,   280,   306,   309,   310,   312,   206,
     259,   265,   273,   276,   280,   297,   235,   326,   354,   206,
     123,   312,   297,   233,   365,   365,   365,   233,   113,   206,
     265,   273,   275,   280,   311,   113,     1,   158,   159,     1,
     118,   117,   124,     1,   158,   159,   118,     1,   158,   159,
       1,   206,     1,   113,   210,   214,   215,   254,     1,   206,
     235,   255,   209,   233,     1,   220,   242,   220,   242,   220,
     242,     1,   221,   243,     1,   221,   243,   222,   244,   222,
     244,   223,   245,   223,   245,   223,   245,     1,   209,   210,
     225,   246,     1,   209,   210,   225,   246,   209,   210,   226,
     247,   209,   210,   227,   248,   209,   210,   228,   249,   229,
     250,   230,   251,   121,   209,   210,   235,   236,   255,   256,
     209,   233,     1,   206,     1,   113,   214,   215,     1,   206,
     235,   255,   209,   233,   220,   242,   220,   242,   220,   242,
       1,   221,   243,     1,   221,   243,   222,   244,   222,   244,
     223,   245,   223,   245,   223,   245,   223,   245,     1,   209,
     210,   225,   246,     1,   209,   210,   225,   246,   209,   210,
     226,   247,   209,   210,   227,   248,   209,   210,   228,   249,
     229,   250,   230,   251,   121,   235,   236,   255,   256,   209,
     233,   110,   111,   206,   373,   374,   206,   118,   372,   375,
     376,   376,   190,   191,   193,   195,   206,   199,   191,   193,
     195,   235,   236,   255,   256,   235,   236,   255,   256,   310,
     111,   116,   111,   119,   110,   119,   206,   259,   273,   276,
     311,   314,   315,   179,   115,   115,   115,   278,   301,   306,
     310,   119,   206,   119,   206,   311,   206,   112,   118,   169,
     170,   169,   170,   354,   354,   354,   365,   354,   354,     1,
     319,   320,   113,   257,   258,   119,   115,   117,   301,   310,
     301,   306,   121,   307,   206,   112,   304,   304,   206,   115,
       1,   115,     1,   115,   278,   200,   110,   198,   198,   257,
     258,   261,   188,   189,     1,   118,   262,   116,   121,   116,
     121,   116,   197,   193,   206,   354,   355,     1,   115,   117,
     115,   117,   115,   150,   151,   154,   155,   156,   118,   148,
     151,   115,   118,   150,   151,   154,   155,   156,   116,   314,
     315,   316,   317,   318,   321,     1,   118,   262,     1,   118,
     262,   113,   113,   113,   124,   124,   124,   308,   113,   332,
     333,   124,   136,   257,   258,   328,   329,   291,   328,   328,
     328,   329,   113,   113,   113,     1,   158,   159,   334,   335,
     121,   121,   334,   335,   235,   255,   235,   255,     1,   113,
     235,   255,   121,   257,   258,   121,   112,   112,   334,   112,
     210,   255,   112,   121,    56,     1,   113,   115,   206,   235,
     255,   356,   115,   115,   115,   115,   115,   365,   112,   233,
     233,   206,   334,   335,    90,     1,   210,   254,    88,    89,
      90,     1,   233,   254,     1,   210,   254,     1,   233,   254,
     110,   355,   115,   135,   136,   113,   135,   265,   273,   275,
     280,   311,   113,     1,   206,     1,   113,   214,   215,     1,
     206,   235,   255,     1,   206,     1,   113,   214,   215,     1,
     206,   235,   255,   113,   113,   311,   200,   113,   312,   332,
     333,   257,   258,   110,   309,   310,   112,   309,   123,   110,
     123,   206,   259,   265,   273,   276,   280,   312,   113,   113,
     113,   113,   257,   258,   123,   123,   312,   117,   113,   117,
     117,   117,   220,   242,     1,   118,   209,   233,     1,     1,
     113,   117,   113,   124,   124,     1,   117,   121,   121,   117,
     121,   121,   113,   117,   124,   124,   121,   121,   121,   121,
     206,   206,   115,   117,   206,   365,   118,   118,   121,   121,
     121,   121,   121,   121,   121,   121,   193,   200,   110,   119,
     119,   206,   113,   115,   301,   310,   301,   306,   113,   119,
     119,   206,   113,     1,   158,   159,   277,   306,   301,   301,
     257,   258,   112,   113,   115,   111,   200,   111,   111,   115,
       1,   115,   191,   206,   190,   191,   190,   195,     1,   152,
     153,     1,   152,   153,   355,     1,   319,   320,   117,   118,
     317,   318,     1,   115,     1,   115,   113,   113,   124,   124,
     124,   311,   313,     1,   334,   335,   334,   335,   113,   113,
     113,   113,     1,   334,   113,     1,   235,   334,   335,   121,
     121,   255,   113,   235,   255,    56,   255,   356,   365,   112,
     334,   121,   115,     1,   115,     1,   113,   255,   356,     3,
     113,   121,   365,   113,   113,   117,   112,   112,   179,   113,
     113,     1,   113,   117,   113,   124,   124,   113,   117,   124,
     124,   113,   111,   113,   113,   113,   124,   124,   200,   309,
     113,   332,   333,   257,   258,   200,   257,   258,   110,   123,
     112,   119,   317,   124,   124,   257,   258,   257,   258,   123,
     326,   206,   206,   233,     1,   210,   254,   209,   210,   209,
     210,   232,   252,   209,   210,   232,   252,   209,   210,   209,
     210,   232,   252,   209,   210,   232,   252,     1,   209,   210,
     232,   252,   209,   210,   232,   252,   209,   210,   232,   252,
     209,   210,   232,   252,   373,   115,   115,   111,   200,   119,
     354,   301,   301,   116,   119,     1,   121,   121,   111,   188,
     189,   115,   188,   189,   116,   116,   118,   317,   318,     1,
     188,   189,   188,   189,   334,   334,   334,   334,   334,   335,
     113,   112,   356,   113,   235,   255,   235,   334,     1,     1,
     113,   235,   255,   336,   337,   365,   115,   337,     3,   113,
     121,   119,   179,   233,   233,     1,     1,     1,     1,   111,
     113,   113,   124,   124,   111,   124,   124,   200,   257,   258,
     326,   321,   124,   124,   124,   124,   257,   258,   113,   113,
     113,   113,   111,   319,   257,   258,   257,   258,   188,   189,
     191,   191,     1,    64,    64,   235,   255,   113,   235,   255,
     113,   115,   113,   115,   334,   335,   113,   334,   335,   113,
     117,   121,   112,     3,   113,   121,   337,   115,   337,    73,
     179,   180,   181,   113,   113,   113,   117,   111,   124,   124,
     113,   117,   118,   124,   124,   115,   334,   334,   113,   113,
     115,   334,   235,   334,   335,   115,   336,   337,   233,   337,
     115,   337,   113,   121,     3,   113,   121,   354,   354,   118,
     180,   119,   179,   220,   242,   317,   118,   113,   113,   113,
     113,   113,   121,   115,   337,   337,   115,   337,   181,   113,
     334,   115,   115,   115,   337,   113,   113,   113,   121,   118,
     113,   115,   115,   115,   337,   115,   113,   115
};

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");\
      YYERROR;							\
    }								\
while (0)


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (N)								\
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
    while (0)
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
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
} while (0)

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr, 					\
                  Type, Value, Location);	\
      YYFPRINTF (stderr, "\n");					\
    }								\
} while (0)

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_stack_print (short int *bottom, short int *top)
#else
static void
yy_stack_print (bottom, top)
    short int *bottom;
    short int *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (/* Nothing. */; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_reduce_print (int yyrule)
#else
static void
yy_reduce_print (yyrule)
    int yyrule;
#endif
{
  int yyi;
  unsigned int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %u), ",
             yyrule - 1, yylno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname [yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname [yyr1[yyrule]]);
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (Rule);		\
} while (0)

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
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  register const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
{
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

#endif /* !YYERROR_VERBOSE */



#if YYDEBUG
/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yysymprint (FILE *yyoutput, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yysymprint (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;
  (void) yylocationp;

  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  fprintf (yyoutput, ": ");

# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyoutput, ")");
}

#endif /* ! YYDEBUG */
/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
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
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;
  (void) yylocationp;

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {
      case 136: /* type */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10132 "grammar.ec"
        break;
      case 140: /* class_function_definition_start */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10137 "grammar.ec"
        break;
      case 141: /* constructor_function_definition_start */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10142 "grammar.ec"
        break;
      case 142: /* destructor_function_definition_start */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10147 "grammar.ec"
        break;
      case 143: /* virtual_class_function_definition_start */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10152 "grammar.ec"
        break;
      case 144: /* class_function_definition_start_error */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10157 "grammar.ec"
        break;
      case 145: /* virtual_class_function_definition_start_error */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10162 "grammar.ec"
        break;
      case 146: /* class_function_definition */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10167 "grammar.ec"
        break;
      case 147: /* class_function_definition_error */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10172 "grammar.ec"
        break;
      case 148: /* instance_class_function_definition_start */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10177 "grammar.ec"
        break;
      case 149: /* instance_class_function_definition_start_error */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10182 "grammar.ec"
        break;
      case 150: /* instance_class_function_definition */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10187 "grammar.ec"
        break;
      case 151: /* instance_class_function_definition_error */
#line 224 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10192 "grammar.ec"
        break;
      case 152: /* data_member_initialization */
#line 222 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10197 "grammar.ec"
        break;
      case 153: /* data_member_initialization_error */
#line 222 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10202 "grammar.ec"
        break;
      case 154: /* data_member_initialization_list */
#line 244 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10207 "grammar.ec"
        break;
      case 155: /* data_member_initialization_list_error */
#line 244 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10212 "grammar.ec"
        break;
      case 156: /* data_member_initialization_list_coloned */
#line 244 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10217 "grammar.ec"
        break;
      case 157: /* members_initialization_list_coloned */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10222 "grammar.ec"
        break;
      case 158: /* members_initialization_list */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10227 "grammar.ec"
        break;
      case 159: /* members_initialization_list_error */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10232 "grammar.ec"
        break;
      case 160: /* instantiation_named */
#line 220 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10237 "grammar.ec"
        break;
      case 161: /* instantiation_named_error */
#line 220 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10242 "grammar.ec"
        break;
      case 165: /* instantiation_unnamed */
#line 220 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10247 "grammar.ec"
        break;
      case 166: /* instantiation_unnamed_error */
#line 220 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10252 "grammar.ec"
        break;
      case 169: /* default_property */
#line 222 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10257 "grammar.ec"
        break;
      case 170: /* default_property_error */
#line 222 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10262 "grammar.ec"
        break;
      case 171: /* default_property_list */
#line 244 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10267 "grammar.ec"
        break;
      case 172: /* default_property_list_error */
#line 244 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10272 "grammar.ec"
        break;
      case 175: /* property */
#line 231 "grammar.y"
        { FreeProperty((yyvaluep->prop)); };
#line 10277 "grammar.ec"
        break;
      case 186: /* struct_declaration */
#line 229 "grammar.y"
        { FreeClassDef((yyvaluep->classDef)); };
#line 10282 "grammar.ec"
        break;
      case 187: /* struct_declaration_error */
#line 229 "grammar.y"
        { FreeClassDef((yyvaluep->classDef)); };
#line 10287 "grammar.ec"
        break;
      case 188: /* struct_declaration_list */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeClassDef); };
#line 10292 "grammar.ec"
        break;
      case 189: /* struct_declaration_list_error */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeClassDef); };
#line 10297 "grammar.ec"
        break;
      case 203: /* class */
#line 228 "grammar.y"
        { FreeClass((yyvaluep->_class)); };
#line 10302 "grammar.ec"
        break;
      case 205: /* class_error */
#line 228 "grammar.y"
        { FreeClass((yyvaluep->_class)); };
#line 10307 "grammar.ec"
        break;
      case 206: /* identifier */
#line 186 "grammar.y"
        { FreeIdentifier((yyvaluep->id)); };
#line 10312 "grammar.ec"
        break;
      case 207: /* primary_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10317 "grammar.ec"
        break;
      case 211: /* primary_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10322 "grammar.ec"
        break;
      case 212: /* postfix_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10327 "grammar.ec"
        break;
      case 214: /* argument_expression_list */
#line 233 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10332 "grammar.ec"
        break;
      case 215: /* argument_expression_list_error */
#line 233 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10337 "grammar.ec"
        break;
      case 217: /* unary_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10342 "grammar.ec"
        break;
      case 220: /* cast_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10347 "grammar.ec"
        break;
      case 221: /* multiplicative_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10352 "grammar.ec"
        break;
      case 222: /* additive_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10357 "grammar.ec"
        break;
      case 223: /* shift_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10362 "grammar.ec"
        break;
      case 225: /* relational_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10367 "grammar.ec"
        break;
      case 226: /* equality_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10372 "grammar.ec"
        break;
      case 227: /* and_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10377 "grammar.ec"
        break;
      case 228: /* exclusive_or_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10382 "grammar.ec"
        break;
      case 229: /* inclusive_or_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10387 "grammar.ec"
        break;
      case 230: /* logical_and_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10392 "grammar.ec"
        break;
      case 231: /* logical_or_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10397 "grammar.ec"
        break;
      case 232: /* conditional_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10402 "grammar.ec"
        break;
      case 233: /* assignment_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10407 "grammar.ec"
        break;
      case 235: /* expression */
#line 233 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10412 "grammar.ec"
        break;
      case 237: /* postfix_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10417 "grammar.ec"
        break;
      case 240: /* unary_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10422 "grammar.ec"
        break;
      case 242: /* cast_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10427 "grammar.ec"
        break;
      case 243: /* multiplicative_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10432 "grammar.ec"
        break;
      case 244: /* additive_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10437 "grammar.ec"
        break;
      case 245: /* shift_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10442 "grammar.ec"
        break;
      case 246: /* relational_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10447 "grammar.ec"
        break;
      case 247: /* equality_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10452 "grammar.ec"
        break;
      case 248: /* and_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10457 "grammar.ec"
        break;
      case 249: /* exclusive_or_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10462 "grammar.ec"
        break;
      case 250: /* inclusive_or_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10467 "grammar.ec"
        break;
      case 251: /* logical_and_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10472 "grammar.ec"
        break;
      case 252: /* logical_or_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10477 "grammar.ec"
        break;
      case 253: /* conditional_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10482 "grammar.ec"
        break;
      case 254: /* assignment_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10487 "grammar.ec"
        break;
      case 255: /* expression_error */
#line 233 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10492 "grammar.ec"
        break;
      case 257: /* constant_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10497 "grammar.ec"
        break;
      case 258: /* constant_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10502 "grammar.ec"
        break;
      case 259: /* storage_class_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10507 "grammar.ec"
        break;
      case 260: /* external_storage_class_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10512 "grammar.ec"
        break;
      case 261: /* enumerator */
#line 203 "grammar.y"
        { FreeEnumerator((yyvaluep->enumerator)); };
#line 10517 "grammar.ec"
        break;
      case 262: /* enumerator_list */
#line 234 "grammar.y"
        { FreeList((yyvaluep->list), FreeEnumerator); };
#line 10522 "grammar.ec"
        break;
      case 266: /* enum_specifier_compound_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10527 "grammar.ec"
        break;
      case 270: /* class_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10532 "grammar.ec"
        break;
      case 271: /* class_specifier_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10537 "grammar.ec"
        break;
      case 272: /* ext_storage */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10542 "grammar.ec"
        break;
      case 273: /* type_qualifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10547 "grammar.ec"
        break;
      case 274: /* type_qualifier_list */
#line 235 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10552 "grammar.ec"
        break;
      case 275: /* type_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10557 "grammar.ec"
        break;
      case 277: /* struct_declarator */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10562 "grammar.ec"
        break;
      case 278: /* struct_declarator_list */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclarator); };
#line 10567 "grammar.ec"
        break;
      case 280: /* struct_or_union_specifier_compound */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10572 "grammar.ec"
        break;
      case 281: /* struct_or_union_specifier_compound_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10577 "grammar.ec"
        break;
      case 282: /* struct_or_union_specifier_nocompound */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10582 "grammar.ec"
        break;
      case 285: /* struct_class */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10587 "grammar.ec"
        break;
      case 286: /* struct_class_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10592 "grammar.ec"
        break;
      case 288: /* specifier_qualifier_list */
#line 235 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10597 "grammar.ec"
        break;
      case 290: /* declaration_specifiers */
#line 235 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10602 "grammar.ec"
        break;
      case 294: /* _inheritance_specifiers */
#line 235 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10607 "grammar.ec"
        break;
      case 295: /* inheritance_specifiers */
#line 235 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10612 "grammar.ec"
        break;
      case 299: /* identifier_list_error */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10617 "grammar.ec"
        break;
      case 300: /* identifier_list */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10622 "grammar.ec"
        break;
      case 301: /* direct_declarator_nofunction */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10627 "grammar.ec"
        break;
      case 302: /* direct_declarator_function_start */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10632 "grammar.ec"
        break;
      case 303: /* direct_declarator_function */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10637 "grammar.ec"
        break;
      case 304: /* direct_declarator_function_error */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10642 "grammar.ec"
        break;
      case 305: /* direct_declarator */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10647 "grammar.ec"
        break;
      case 306: /* ext_decl */
#line 230 "grammar.y"
        { delete (yyvaluep->string); };
#line 10652 "grammar.ec"
        break;
      case 308: /* direct_abstract_declarator */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10657 "grammar.ec"
        break;
      case 309: /* direct_abstract_declarator_noarray */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10662 "grammar.ec"
        break;
      case 310: /* pointer */
#line 187 "grammar.y"
        { FreePointer((yyvaluep->pointer)); };
#line 10667 "grammar.ec"
        break;
      case 311: /* abstract_declarator */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10672 "grammar.ec"
        break;
      case 312: /* abstract_declarator_noarray */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10677 "grammar.ec"
        break;
      case 313: /* declarator */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10682 "grammar.ec"
        break;
      case 314: /* declarator_function */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10687 "grammar.ec"
        break;
      case 315: /* declarator_function_error */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10692 "grammar.ec"
        break;
      case 316: /* declarator_nofunction */
#line 204 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10697 "grammar.ec"
        break;
      case 317: /* initializer */
#line 209 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10702 "grammar.ec"
        break;
      case 318: /* initializer_error */
#line 209 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10707 "grammar.ec"
        break;
      case 319: /* initializer_condition */
#line 209 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10712 "grammar.ec"
        break;
      case 320: /* initializer_condition_error */
#line 209 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10717 "grammar.ec"
        break;
      case 321: /* initializer_list */
#line 238 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitializer); };
#line 10722 "grammar.ec"
        break;
      case 322: /* init_declarator */
#line 210 "grammar.y"
        { FreeInitDeclarator((yyvaluep->initDeclarator)); };
#line 10727 "grammar.ec"
        break;
      case 323: /* init_declarator_error */
#line 210 "grammar.y"
        { FreeInitDeclarator((yyvaluep->initDeclarator)); };
#line 10732 "grammar.ec"
        break;
      case 324: /* init_declarator_list */
#line 239 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitDeclarator); };
#line 10737 "grammar.ec"
        break;
      case 325: /* init_declarator_list_error */
#line 239 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitDeclarator); };
#line 10742 "grammar.ec"
        break;
      case 326: /* type_name */
#line 211 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10747 "grammar.ec"
        break;
      case 327: /* guess_type_name */
#line 211 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10752 "grammar.ec"
        break;
      case 328: /* parameter_declaration */
#line 211 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10757 "grammar.ec"
        break;
      case 329: /* parameter_declaration_error */
#line 211 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10762 "grammar.ec"
        break;
      case 330: /* parameter_list */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10767 "grammar.ec"
        break;
      case 331: /* parameter_list_error */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10772 "grammar.ec"
        break;
      case 332: /* parameter_type_list */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10777 "grammar.ec"
        break;
      case 333: /* parameter_type_list_error */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10782 "grammar.ec"
        break;
      case 334: /* statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10787 "grammar.ec"
        break;
      case 335: /* statement_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10792 "grammar.ec"
        break;
      case 339: /* labeled_statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10797 "grammar.ec"
        break;
      case 340: /* labeled_statement_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10802 "grammar.ec"
        break;
      case 341: /* declaration_mode */
#line 246 "grammar.y"
        { };
#line 10807 "grammar.ec"
        break;
      case 343: /* declaration */
#line 216 "grammar.y"
        { FreeDeclaration((yyvaluep->declaration)); };
#line 10812 "grammar.ec"
        break;
      case 347: /* declaration_list */
#line 237 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclaration); };
#line 10817 "grammar.ec"
        break;
      case 348: /* declaration_list_error */
#line 237 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclaration); };
#line 10822 "grammar.ec"
        break;
      case 349: /* statement_list */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeStatement); };
#line 10827 "grammar.ec"
        break;
      case 350: /* statement_list_error */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeStatement); };
#line 10832 "grammar.ec"
        break;
      case 351: /* compound_inside */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10837 "grammar.ec"
        break;
      case 352: /* compound_inside_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10842 "grammar.ec"
        break;
      case 354: /* compound_statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10847 "grammar.ec"
        break;
      case 355: /* compound_statement_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10852 "grammar.ec"
        break;
      case 356: /* expression_statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10857 "grammar.ec"
        break;
      case 357: /* selection_statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10862 "grammar.ec"
        break;
      case 358: /* selection_statement_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10867 "grammar.ec"
        break;
      case 359: /* iteration_statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10872 "grammar.ec"
        break;
      case 360: /* iteration_statement_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10877 "grammar.ec"
        break;
      case 361: /* jump_statement */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10882 "grammar.ec"
        break;
      case 362: /* jump_statement_error */
#line 212 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10887 "grammar.ec"
        break;
      case 363: /* function_definition */
#line 217 "grammar.y"
        { FreeFunction((yyvaluep->function)); };
#line 10892 "grammar.ec"
        break;
      case 364: /* function_definition_error */
#line 217 "grammar.y"
        { FreeFunction((yyvaluep->function)); };
#line 10897 "grammar.ec"
        break;
      case 365: /* string_literal */
#line 230 "grammar.y"
        { delete (yyvaluep->string); };
#line 10902 "grammar.ec"
        break;
      case 366: /* external_declaration */
#line 218 "grammar.y"
        { FreeExternal((yyvaluep->external)); };
#line 10907 "grammar.ec"
        break;
      case 367: /* external_declaration_error */
#line 218 "grammar.y"
        { FreeExternal((yyvaluep->external)); };
#line 10912 "grammar.ec"
        break;
      case 368: /* translation_unit_error */
#line 242 "grammar.y"
        { if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };
#line 10917 "grammar.ec"
        break;
      case 369: /* translation_unit */
#line 242 "grammar.y"
        { if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };
#line 10922 "grammar.ec"
        break;

      default:
        break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM);
# else
int yyparse ();
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;
/* Location data for the look-ahead symbol.  */
YYLTYPE yylloc;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM)
# else
int yyparse (YYPARSE_PARAM)
  void *YYPARSE_PARAM;
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short int yyssa[YYINITDEPTH];
  short int *yyss = yyssa;
  register short int *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;

  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
  /* The locations where the error started and ended. */
  YYLTYPE yyerror_range[2];

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* When reducing, the number of symbols on the RHS of the reduced
     rule.  */
  int yylen;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;
#if YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 0;
#endif


  yyvsp[0] = yylval;
    yylsp[0] = yylloc;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short int *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
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
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	short int *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);
	YYSTACK_RELOCATE (yyls);
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

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

/* Do appropriate processing given the current state.  */
/* Read a look-ahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to look-ahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
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

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
  *++yylsp = yylloc;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
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

  /* Default location. */
  YYLLOC_DEFAULT (yyloc, yylsp - yylen, yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 255 "grammar.y"
    {
      // if($1._class && !$1._class.name)
      if((yyvsp[-1].id)._class)
      {
         char name[1024];
         strcpy(name,  (yyvsp[-1].id)._class.name ? (yyvsp[-1].id)._class.name : "");
         strcat(name, "::");
         strcat(name, (yyvsp[-1].id).string);
         _DeclClass(0, name);
      }
      else
         _DeclClass(0, (yyvsp[-1].id).string);

      FreeIdentifier((yyvsp[-1].id));

      fileInput.Seek((yylsp[-1]).start.pos, start); 
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   ;}
    break;

  case 3:
#line 283 "grammar.y"
    {
   #ifdef PRECOMPILER
      // if($1._class && !$1._class.name)
      if((yyvsp[-1].id)._class)
      {
         char name[1024];
         strcpy(name,  (yyvsp[-1].id)._class.name ? (yyvsp[-1].id)._class.name : "");
         strcat(name, "::");
         strcat(name, (yyvsp[-1].id).string);
         _DeclClass(0, name);
      }
      else
         _DeclClass(0, (yyvsp[-1].id).string);

      FreeIdentifier((yyvsp[-1].id));

      fileInput.Seek((yylsp[-1]).start.pos, start); 
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #endif
   ;}
    break;

  case 4:
#line 340 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 5:
#line 342 "grammar.y"
    {
   #ifdef PRECOMPILER
      // if($1._class && !$1._class.name)
      if((yyvsp[-1].id)._class)
      {
         char name[1024];
         strcpy(name,  (yyvsp[-1].id)._class.name ? (yyvsp[-1].id)._class.name : "");
         strcat(name, "::");
         strcat(name, (yyvsp[-1].id).string);
         _DeclClass(0, name);
      }
      else
         _DeclClass(0, (yyvsp[-1].id).string);
      FreeIdentifier((yyvsp[-1].id));
      FreeIdentifier((yyvsp[0].id));

      fileInput.Seek((yylsp[-1]).start.pos, start); 
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #else
      Location tmpLoc = yylloc; (yyval.specifier) = (yyvsp[0].id); yylloc = (yylsp[-1]); 
      Compiler_Error("Not a type: %s\n", (yyvsp[-1].id).string);      
      yylloc = tmpLoc; (yyvsp[0].id).badID = (yyvsp[-1].id);
   #endif
   ;}
    break;

  case 6:
#line 441 "grammar.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 7:
#line 445 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 9:
#line 449 "grammar.y"
    { (yyval.specifier) = (yyvsp[-3].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:
#line 451 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-3].specifier);
      SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list));
      (yyval.specifier).loc = (yyloc);

      (yylsp[0]).end.pos--;
      fileInput.Seek((yylsp[0]).end.pos, start); 
      resetScannerPos(&(yylsp[0]).end);
      yyclearin;
    ;}
    break;

  case 11:
#line 500 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:
#line 502 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:
#line 507 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 14:
#line 512 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[-2].list), FreeSpecifier) ;}
    break;

  case 15:
#line 517 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:
#line 519 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:
#line 524 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 18:
#line 526 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 19:
#line 531 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 20:
#line 533 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 21:
#line 538 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 22:
#line 540 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 23:
#line 542 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 24:
#line 544 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 25:
#line 546 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 26:
#line 550 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 27:
#line 555 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 28:
#line 557 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 29:
#line 559 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 30:
#line 561 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 31:
#line 563 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 32:
#line 569 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 33:
#line 571 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, MkDeclaratorFunction((yyvsp[0].declarator), null), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 34:
#line 576 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 35:
#line 581 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 36:
#line 586 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 37:
#line 588 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 38:
#line 590 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 39:
#line 594 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 40:
#line 595 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 41:
#line 599 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 42:
#line 601 "grammar.y"
    { 
         (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), MkInitializerAssignment(MkExpDummy()));
         (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yyval.memberInit).initializer.loc.end = (yylsp[-1]).end; 

         fileInput.Seek((yylsp[-1]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-1]).end);
         (yyloc).start = (yylsp[-2]).start;
         (yyloc).end = (yylsp[-1]).end;
      ;}
    break;

  case 43:
#line 611 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 44:
#line 615 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 45:
#line 617 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 46:
#line 619 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 47:
#line 623 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 48:
#line 625 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 49:
#line 627 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 50:
#line 630 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[-1]).end; 
         { 
            Initializer dummy = MkInitializerAssignment(MkExpDummy()); 
            MemberInit memberInit = MkMemberInit(null, dummy); 
            memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[-1]).end; 
            memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[-1]).end; 
            ListAdd((yyvsp[-2].list), memberInit); 
          } 
       ;}
    break;

  case 51:
#line 641 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[-1]).end; 
         { 
            Initializer dummy = MkInitializerAssignment(MkExpDummy()); 
            MemberInit memberInit = MkMemberInit(null, dummy); 
            memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[-1]).end; 
            memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[-1]).end; 
            ListAdd((yyvsp[-2].list), memberInit); 
          } 
       ;}
    break;

  case 52:
#line 651 "grammar.y"
    {
         Initializer dummy = MkInitializerAssignment(MkExpDummy());
         MemberInit memberInit = MkMemberInit(null, dummy); 
         memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[0]).start; 
         memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[0]).start; 

         (yyval.list) = MkList();
         ListAdd((yyval.list), memberInit); 

         dummy = MkInitializerAssignment(MkExpDummy()); 
         memberInit = MkMemberInit(null, dummy); 
         memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[0]).end; 
         memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[0]).end; 
         ListAdd((yyval.list), memberInit); 
      ;}
    break;

  case 53:
#line 670 "grammar.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 54:
#line 672 "grammar.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 55:
#line 676 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 56:
#line 677 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 57:
#line 678 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members);  members.loc = (yylsp[0]);  ;}
    break;

  case 58:
#line 679 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 59:
#line 680 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 60:
#line 681 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 61:
#line 682 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 63:
#line 684 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 65:
#line 689 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 66:
#line 690 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 67:
#line 691 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 68:
#line 695 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 69:
#line 696 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 70:
#line 697 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 71:
#line 698 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 72:
#line 699 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 73:
#line 700 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 74:
#line 701 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[-1].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 75:
#line 706 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 76:
#line 708 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 77:
#line 713 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list)); (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 78:
#line 715 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 79:
#line 717 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list)); (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 80:
#line 719 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-2].list), MkExpIdentifier((yyvsp[-1].id)), null); (yyval.instance).exp.loc = (yylsp[-1]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-1]); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 81:
#line 721 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), null);(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 82:
#line 751 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 83:
#line 753 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 84:
#line 758 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list));(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 85:
#line 760 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 86:
#line 762 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list));(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 87:
#line 764 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-2].list), MkExpIdentifier((yyvsp[-1].id)), null);(yyval.instance).exp.loc = (yylsp[-1]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-1]); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 88:
#line 766 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), null);(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 89:
#line 795 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 90:
#line 797 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 91:
#line 799 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 92:
#line 804 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 93:
#line 806 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 94:
#line 811 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 95:
#line 813 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 96:
#line 817 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 97:
#line 819 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-1].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 98:
#line 821 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 99:
#line 823 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 100:
#line 828 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 101:
#line 831 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-1]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-1].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 102:
#line 834 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 103:
#line 837 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 104:
#line 902 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 105:
#line 904 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 106:
#line 909 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 107:
#line 911 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 108:
#line 913 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 109:
#line 915 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 110:
#line 917 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 111:
#line 947 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 112:
#line 951 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 113:
#line 952 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), MkInitializerAssignment(MkExpDummy())); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; (yyval.memberInit).initializer.loc.end = (yylsp[-1]).end; ;}
    break;

  case 114:
#line 953 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-1].exp), null); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 115:
#line 957 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 116:
#line 958 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 117:
#line 959 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 118:
#line 963 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 119:
#line 964 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 120:
#line 965 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 122:
#line 971 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 123:
#line 974 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 124:
#line 977 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-1].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 125:
#line 980 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), (yyvsp[-1].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 126:
#line 983 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 128:
#line 989 "grammar.y"
    { (yyvsp[-2].prop).setStmt = (yyvsp[0].stmt); ;}
    break;

  case 129:
#line 991 "grammar.y"
    { (yyvsp[-2].prop).getStmt = (yyvsp[0].stmt); ;}
    break;

  case 130:
#line 993 "grammar.y"
    { (yyvsp[-2].prop).issetStmt = (yyvsp[0].stmt); ;}
    break;

  case 131:
#line 995 "grammar.y"
    { (yyvsp[-1].prop).isWatchable = true; ;}
    break;

  case 132:
#line 997 "grammar.y"
    { (yyvsp[-2].prop).category = (yyvsp[0].string); ;}
    break;

  case 133:
#line 1001 "grammar.y"
    { (yyvsp[-1].prop).loc.end = (yylsp[0]).end; ;}
    break;

  case 134:
#line 1006 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 135:
#line 1009 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 136:
#line 1012 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-1].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 137:
#line 1015 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), (yyvsp[-1].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 138:
#line 1018 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 140:
#line 1024 "grammar.y"
    { (yyvsp[-2].prop).setStmt = (yyvsp[0].stmt); ;}
    break;

  case 141:
#line 1026 "grammar.y"
    { (yyvsp[-2].prop).getStmt = (yyvsp[0].stmt); ;}
    break;

  case 142:
#line 1030 "grammar.y"
    { (yyvsp[-1].prop).loc.end = (yylsp[0]).end; ;}
    break;

  case 143:
#line 1035 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].id)); ;}
    break;

  case 144:
#line 1037 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].id)); ;}
    break;

  case 145:
#line 1042 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 146:
#line 1044 "grammar.y"
    { (yyval.propertyWatch) = MkDeleteWatch((yyvsp[0].stmt)); ;}
    break;

  case 147:
#line 1049 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].propertyWatch)); ;}
    break;

  case 148:
#line 1051 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].propertyWatch)); ;}
    break;

  case 149:
#line 1056 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[-2].list), (yyvsp[0].stmt)); ;}
    break;

  case 150:
#line 1061 "grammar.y"
    { (yyval.stmt) = MkWatchStmt(null, (yyvsp[-4].exp), (yyvsp[-1].list)); ;}
    break;

  case 151:
#line 1063 "grammar.y"
    { (yyval.stmt) = MkWatchStmt((yyvsp[-8].exp), (yyvsp[-4].exp), (yyvsp[-1].list)); ;}
    break;

  case 152:
#line 1068 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[-3].exp), (yyvsp[-1].list)); ;}
    break;

  case 153:
#line 1070 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[-7].exp), (yyvsp[-3].exp), (yyvsp[-1].list)); ;}
    break;

  case 154:
#line 1072 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[-1].exp), null); ;}
    break;

  case 155:
#line 1074 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[-5].exp), (yyvsp[-1].exp), null); ;}
    break;

  case 156:
#line 1079 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, null); ;}
    break;

  case 157:
#line 1081 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, (yyvsp[0].list)); ;}
    break;

  case 158:
#line 1083 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[-2].exp), null); ;}
    break;

  case 159:
#line 1085 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[-3].exp), (yyvsp[0].list)); ;}
    break;

  case 160:
#line 1089 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 161:
#line 1090 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 162:
#line 1091 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 163:
#line 1092 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 164:
#line 1093 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 165:
#line 1094 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 166:
#line 1096 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-3].declMode); ;}
    break;

  case 167:
#line 1097 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 168:
#line 1098 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 169:
#line 1099 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 170:
#line 1100 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 171:
#line 1101 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 172:
#line 1103 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 173:
#line 1104 "grammar.y"
    { (yyval.classDef) = MkClassDefClassData(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 174:
#line 1105 "grammar.y"
    { (yyval.classDef) = MkClassDefClassProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 175:
#line 1106 "grammar.y"
    { (yyval.classDef) = MkClassDefPropertyWatch((yyvsp[-1].propertyWatch)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 176:
#line 1107 "grammar.y"
    { (yyval.classDef) = null; deleteWatchable = true; ;}
    break;

  case 177:
#line 1108 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[-1].id).string); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 178:
#line 1109 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[-1].specifier).name); FreeSpecifier((yyvsp[-1].specifier)); ;}
    break;

  case 179:
#line 1110 "grammar.y"
    { (yyval.classDef) = MkClassDefNoExpansion(); ;}
    break;

  case 180:
#line 1111 "grammar.y"
    { (yyval.classDef) = MkClassDefFixed(); ;}
    break;

  case 181:
#line 1112 "grammar.y"
    { (yyval.classDef) = MkClassDefDesignerDefaultProperty((yyvsp[-1].id)); ;}
    break;

  case 182:
#line 1113 "grammar.y"
    { (yyval.classDef) = MkClassDefClassPropertyValue((yyvsp[-4].id), (yyvsp[-1].initializer)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 183:
#line 1115 "grammar.y"
    { (yyval.classDef) = null; ;}
    break;

  case 184:
#line 1116 "grammar.y"
    { memberAccessStack[defaultMemberAccess] = (yyvsp[-1].declMode); if(defaultMemberAccess == 0) { (yyval.classDef) = MkClassDefMemberAccess(); (yyval.classDef).memberAccess = (yyvsp[-1].declMode); (yyval.classDef).loc = (yyloc); } else (yyval.classDef) = null; ;}
    break;

  case 185:
#line 1118 "grammar.y"
    { (yyval.classDef) = MkClassDefAccessOverride((yyvsp[-3].declMode), (yyvsp[-1].id)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 186:
#line 1122 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyvsp[0].classFunction).loc;  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 187:
#line 1123 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyvsp[-1].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 188:
#line 1124 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyvsp[-1].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 189:
#line 1125 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyvsp[0].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 190:
#line 1126 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyvsp[0].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 191:
#line 1128 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 192:
#line 1129 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 193:
#line 1130 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 194:
#line 1131 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 195:
#line 1132 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 196:
#line 1134 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[0].list)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; ;}
    break;

  case 197:
#line 1138 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 198:
#line 1139 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 199:
#line 1140 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 200:
#line 1144 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 203:
#line 1147 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 204:
#line 1148 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 205:
#line 1152 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); ;}
    break;

  case 206:
#line 1153 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 207:
#line 1154 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[0].id).string)), null); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 208:
#line 1158 "grammar.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[0].templateDatatype)); ;}
    break;

  case 209:
#line 1162 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[0].id), null, null); ;}
    break;

  case 210:
#line 1163 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-2].id), null, (yyvsp[0].templateArgument)); ;}
    break;

  case 211:
#line 1164 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-2].id), (yyvsp[0].templateDatatype), null); ;}
    break;

  case 212:
#line 1165 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-4].id), (yyvsp[-2].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 213:
#line 1166 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[0].string)), null, null); delete (yyvsp[0].string); ;}
    break;

  case 214:
#line 1167 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-2].string)), null, (yyvsp[0].templateArgument)); ;}
    break;

  case 215:
#line 1168 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-2].string)), (yyvsp[0].templateDatatype), null); ;}
    break;

  case 216:
#line 1169 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-4].string)), (yyvsp[-2].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 217:
#line 1173 "grammar.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[0].id)); ;}
    break;

  case 218:
#line 1177 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[0].id), dataMember, null); ;}
    break;

  case 219:
#line 1178 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[-2].id), dataMember, (yyvsp[0].templateArgument)); ;}
    break;

  case 220:
#line 1182 "grammar.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); ;}
    break;

  case 221:
#line 1186 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[0].id), (yyvsp[-1].templateDatatype), null); ;}
    break;

  case 222:
#line 1187 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[-2].id), (yyvsp[-3].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 226:
#line 1197 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateParameter)); ;}
    break;

  case 227:
#line 1198 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateParameter)); ;}
    break;

  case 231:
#line 1205 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 232:
#line 1206 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 233:
#line 1207 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 234:
#line 1209 "grammar.y"
    {
      (yyval.templateArgument) = (yyvsp[0].templateArgument); 
      if((yyvsp[-2].templateDatatype).specifiers && (yyvsp[-2].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[-2].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
      }
      FreeTemplateDataType((yyvsp[-2].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 235:
#line 1221 "grammar.y"
    {
      (yyval.templateArgument) = (yyvsp[0].templateArgument); 
      if((yyvsp[-2].templateDatatype).specifiers && (yyvsp[-2].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[-2].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
      }
      FreeTemplateDataType((yyvsp[-2].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 236:
#line 1233 "grammar.y"
    {
      (yyval.templateArgument) = (yyvsp[0].templateArgument); 
      if((yyvsp[-2].templateDatatype).specifiers && (yyvsp[-2].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[-2].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
      }
      FreeTemplateDataType((yyvsp[-2].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 237:
#line 1247 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); ;}
    break;

  case 238:
#line 1248 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); ;}
    break;

  case 239:
#line 1253 "grammar.y"
    {
      PushContext();
   ;}
    break;

  case 240:
#line 1258 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); FreeIdentifier((yyvsp[0].id)); (yyval.symbol).nameLoc = (yylsp[0]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 241:
#line 1260 "grammar.y"
    { 
      (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); 
      (yyval.symbol).nameLoc = (yylsp[0]); 
      FreeSpecifier((yyvsp[0].specifier)); 
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   ;}
    break;

  case 242:
#line 1267 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); FreeIdentifier((yyvsp[-2].id)); FreeIdentifier((yyvsp[0].id)); (yyval.symbol).nameLoc = (yylsp[0]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 243:
#line 1268 "grammar.y"
    { (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); FreeIdentifier((yyvsp[-2].id)); (yyval.symbol).nameLoc = (yylsp[0]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[0].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 244:
#line 1270 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-3].id)); (yyval.symbol).nameLoc = (yylsp[-3]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 245:
#line 1272 "grammar.y"
    { 
      (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name);
      (yyval.symbol).templateParams = (yyvsp[-1].list); 
      (yyval.symbol).nameLoc = (yylsp[-3]); 
      FreeSpecifier((yyvsp[-3].specifier)); 
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   ;}
    break;

  case 246:
#line 1280 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-5].id)); FreeIdentifier((yyvsp[-3].id)); (yyval.symbol).nameLoc = (yylsp[-3]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 247:
#line 1281 "grammar.y"
    { (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-5].id)); (yyval.symbol).nameLoc = (yylsp[-3]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[-3].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 248:
#line 1286 "grammar.y"
    {
         (yyval._class).loc = (yyloc);
      ;}
    break;

  case 249:
#line 1292 "grammar.y"
    {
         (yyval._class) = (yyvsp[-1]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[0]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 250:
#line 1299 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, MkList()); (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 251:
#line 1305 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 252:
#line 1312 "grammar.y"
    {
         (yyval._class) = MkClass(DeclClassAddNameSpace(0, (yyvsp[-1].id).string), null, null); FreeIdentifier((yyvsp[-1].id));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 253:
#line 1318 "grammar.y"
    {
         (yyval._class) = MkClass(DeclClass(0, (yyvsp[-1].specifier).name), null, null); FreeSpecifier((yyvsp[-1].specifier));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 254:
#line 1327 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), (yyvsp[0].list), null);
      ;}
    break;

  case 255:
#line 1334 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, (yyvsp[0].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 256:
#line 1340 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = (yyvsp[0].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 257:
#line 1346 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, (yyvsp[0].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 258:
#line 1352 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = (yyvsp[0].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 259:
#line 1358 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, MkList()); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 260:
#line 1364 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = MkList(); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 261:
#line 1375 "grammar.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); ;}
    break;

  case 263:
#line 1381 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 264:
#line 1385 "grammar.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 265:
#line 1386 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 266:
#line 1387 "grammar.y"
    { (yyval.exp) = MkExpExtensionCompound((yyvsp[-1].stmt)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 267:
#line 1388 "grammar.y"
    { (yyval.exp) = MkExpExtensionExpression((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 268:
#line 1389 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[-2].typeName), (yyvsp[0].initializer)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 269:
#line 1390 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[-5].typeName), MkInitializerAssignment(MkExpExtensionInitializer((yyvsp[-2].typeName), (yyvsp[0].initializer)))); (yyval.exp).loc = (yyloc); ;}
    break;

  case 270:
#line 1391 "grammar.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 271:
#line 1392 "grammar.y"
    { (yyval.exp) = MkExpString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 272:
#line 1393 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 273:
#line 1394 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 274:
#line 1395 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 275:
#line 1396 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 276:
#line 1397 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 277:
#line 1398 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 278:
#line 1399 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 279:
#line 1400 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 280:
#line 1401 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 281:
#line 1402 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 282:
#line 1403 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 283:
#line 1404 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 284:
#line 1405 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 285:
#line 1406 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 286:
#line 1407 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 287:
#line 1408 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 288:
#line 1409 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 289:
#line 1410 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 290:
#line 1411 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[-1].list), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 291:
#line 1412 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[-2].list), (yyvsp[-1].declarator)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 292:
#line 1413 "grammar.y"
    { (yyval.exp) = MkExpClass(MkListOne(MkSpecifierName((yyvsp[-1].id).string)), null); FreeIdentifier((yyvsp[-1].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 293:
#line 1414 "grammar.y"
    { (yyval.exp) = MkExpVaArg((yyvsp[-3].exp), (yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 294:
#line 1416 "grammar.y"
    { (yyval.exp) = MkExpClassData((yyvsp[-1].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 299:
#line 1422 "grammar.y"
    { (yyval.exp) = MkExpArray((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 300:
#line 1426 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 301:
#line 1430 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 302:
#line 1434 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[0].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 303:
#line 1435 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[0].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 305:
#line 1441 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 306:
#line 1442 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 307:
#line 1443 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 308:
#line 1444 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 309:
#line 1445 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); if((yyvsp[-1].list)->last) ((Expression)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; ;}
    break;

  case 310:
#line 1446 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 311:
#line 1447 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 312:
#line 1448 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 313:
#line 1449 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 314:
#line 1451 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 315:
#line 1452 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 316:
#line 1453 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 317:
#line 1454 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 318:
#line 1455 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 319:
#line 1456 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 320:
#line 1457 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 321:
#line 1458 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 323:
#line 1464 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 324:
#line 1465 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 325:
#line 1466 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 326:
#line 1467 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 327:
#line 1468 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); if((yyvsp[-1].list)->last) ((Expression)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; ;}
    break;

  case 328:
#line 1469 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 329:
#line 1470 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 330:
#line 1471 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 331:
#line 1472 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 332:
#line 1474 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 333:
#line 1475 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 334:
#line 1476 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 335:
#line 1477 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 336:
#line 1478 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 337:
#line 1479 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 338:
#line 1480 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 339:
#line 1481 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 340:
#line 1485 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 341:
#line 1486 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 342:
#line 1487 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 343:
#line 1488 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 344:
#line 1492 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 345:
#line 1493 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 346:
#line 1494 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 347:
#line 1495 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 348:
#line 1496 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[0]).end; exp.loc.end = (yylsp[0]).end; ListAdd((yyvsp[-1].list), exp); ;}
    break;

  case 349:
#line 1500 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 350:
#line 1501 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 351:
#line 1502 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 352:
#line 1503 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 353:
#line 1504 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 354:
#line 1505 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 355:
#line 1506 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 356:
#line 1507 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-1].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 357:
#line 1508 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-1].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 362:
#line 1522 "grammar.y"
    { (yyval.i) = '&'; ;}
    break;

  case 363:
#line 1523 "grammar.y"
    { (yyval.i) = '*'; ;}
    break;

  case 364:
#line 1524 "grammar.y"
    { (yyval.i) = '+'; ;}
    break;

  case 365:
#line 1525 "grammar.y"
    { (yyval.i) = '-'; ;}
    break;

  case 366:
#line 1526 "grammar.y"
    { (yyval.i) = '~'; ;}
    break;

  case 367:
#line 1527 "grammar.y"
    { (yyval.i) = '!'; ;}
    break;

  case 368:
#line 1528 "grammar.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 369:
#line 1529 "grammar.y"
    { (yyval.i) = _INCREF; ;}
    break;

  case 371:
#line 1534 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 373:
#line 1539 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 374:
#line 1540 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 375:
#line 1541 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 376:
#line 1542 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 377:
#line 1543 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 378:
#line 1544 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 380:
#line 1549 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 381:
#line 1550 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 382:
#line 1551 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 383:
#line 1552 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 385:
#line 1557 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 386:
#line 1558 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 387:
#line 1559 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 388:
#line 1560 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 389:
#line 1565 "grammar.y"
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   ;}
    break;

  case 391:
#line 1573 "grammar.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 392:
#line 1574 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 393:
#line 1575 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 394:
#line 1576 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 395:
#line 1577 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 396:
#line 1578 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 397:
#line 1579 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 398:
#line 1580 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 400:
#line 1585 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 401:
#line 1586 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 402:
#line 1587 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 403:
#line 1588 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 404:
#line 1590 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 405:
#line 1591 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 406:
#line 1592 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 407:
#line 1593 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 409:
#line 1598 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 410:
#line 1599 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 411:
#line 1601 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 412:
#line 1602 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 414:
#line 1607 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 415:
#line 1608 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 416:
#line 1610 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 417:
#line 1611 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 419:
#line 1616 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 420:
#line 1617 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 421:
#line 1619 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 422:
#line 1620 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 424:
#line 1625 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 425:
#line 1626 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 427:
#line 1631 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 428:
#line 1632 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 430:
#line 1637 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 431:
#line 1638 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 432:
#line 1639 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 433:
#line 1640 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 434:
#line 1642 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 435:
#line 1643 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 436:
#line 1644 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 437:
#line 1645 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 438:
#line 1647 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 439:
#line 1648 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 440:
#line 1649 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 441:
#line 1650 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 442:
#line 1652 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 443:
#line 1653 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 444:
#line 1654 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 445:
#line 1655 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 447:
#line 1660 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 448:
#line 1661 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 449:
#line 1662 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 450:
#line 1663 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 451:
#line 1665 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 452:
#line 1666 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 453:
#line 1667 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 454:
#line 1668 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 455:
#line 1672 "grammar.y"
    { (yyval.i) = '='; ;}
    break;

  case 456:
#line 1673 "grammar.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 457:
#line 1674 "grammar.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 458:
#line 1675 "grammar.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 459:
#line 1676 "grammar.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 460:
#line 1677 "grammar.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 461:
#line 1678 "grammar.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 462:
#line 1679 "grammar.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 463:
#line 1680 "grammar.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 464:
#line 1681 "grammar.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 465:
#line 1682 "grammar.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 466:
#line 1686 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 467:
#line 1687 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 468:
#line 1688 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 470:
#line 1693 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 471:
#line 1694 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 472:
#line 1695 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 474:
#line 1700 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); /*printf("Sorry, didn't mean that syntax error\n");*/ ;}
    break;

  case 476:
#line 1702 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 477:
#line 1704 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 478:
#line 1705 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 479:
#line 1707 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 480:
#line 1708 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 481:
#line 1709 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end;(yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 482:
#line 1710 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyloc).end = yylloc.start; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = yylloc.start; /*@2.end; $$.call.argLoc.end.charPos++;*/ ;}
    break;

  case 483:
#line 1711 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 484:
#line 1713 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 485:
#line 1714 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 486:
#line 1715 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 487:
#line 1716 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 488:
#line 1720 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); ;}
    break;

  case 490:
#line 1722 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 491:
#line 1724 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 492:
#line 1725 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 493:
#line 1727 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 494:
#line 1728 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 495:
#line 1729 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end;(yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 496:
#line 1730 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyloc).end = yylloc.start; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = yylloc.start; /*@2.end; $$.call.argLoc.end.charPos++;*/ ;}
    break;

  case 497:
#line 1731 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 498:
#line 1733 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 499:
#line 1734 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 500:
#line 1735 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 501:
#line 1736 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 502:
#line 1740 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 503:
#line 1741 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 504:
#line 1742 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 505:
#line 1743 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 506:
#line 1744 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 507:
#line 1745 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 508:
#line 1746 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-2].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 509:
#line 1747 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-2].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 510:
#line 1748 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-2].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 516:
#line 1764 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 518:
#line 1769 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 519:
#line 1770 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 520:
#line 1771 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 521:
#line 1772 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 522:
#line 1773 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 523:
#line 1774 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 525:
#line 1779 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 526:
#line 1780 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 527:
#line 1781 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 528:
#line 1782 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 529:
#line 1783 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 530:
#line 1784 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 531:
#line 1785 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 532:
#line 1786 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 534:
#line 1791 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 535:
#line 1792 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 536:
#line 1793 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 537:
#line 1794 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 539:
#line 1800 "grammar.y"
    {
      if((yyvsp[-1].exp).type == identifierExp)
      {
         if((yyvsp[-1].exp).identifier._class && !(yyvsp[-1].exp).identifier._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[-1].exp).identifier.string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-1].exp).identifier.string);

         // printf("Declaring Class %s\n", $1.identifier.string);
         skipErrors = false;

         FreeExpression((yyvsp[-1].exp));
         
         fileInput.Seek((yylsp[-1]).start.pos, start); 
         resetScannerPos(&(yylsp[-1]).start);
         yyclearin;

         YYPOPSTACK;
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);

         YYPOPSTACK;
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
/*         
         YYPOPSTACK;
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);

         YYPOPSTACK;
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
*/
         yyerrok;

         goto yysetstate;
      }
      else
      {
         (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp));
         (yyval.exp).loc = (yyloc);
      } 
      skipErrors = false;
   ;}
    break;

  case 540:
#line 1849 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 541:
#line 1850 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 542:
#line 1851 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 543:
#line 1852 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 544:
#line 1853 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 545:
#line 1854 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 546:
#line 1855 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 548:
#line 1860 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 549:
#line 1861 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 550:
#line 1862 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 551:
#line 1863 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 552:
#line 1865 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 553:
#line 1866 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 554:
#line 1867 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 555:
#line 1868 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 556:
#line 1870 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 557:
#line 1871 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 558:
#line 1872 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 559:
#line 1873 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 561:
#line 1878 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 562:
#line 1879 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 563:
#line 1881 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 564:
#line 1882 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 566:
#line 1887 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 567:
#line 1888 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 568:
#line 1890 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 569:
#line 1891 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 571:
#line 1896 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 572:
#line 1897 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 573:
#line 1899 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 574:
#line 1900 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 576:
#line 1905 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 577:
#line 1906 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 579:
#line 1911 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 580:
#line 1912 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 582:
#line 1917 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 583:
#line 1918 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 584:
#line 1919 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 585:
#line 1920 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 586:
#line 1921 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 587:
#line 1922 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 588:
#line 1923 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 589:
#line 1924 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 590:
#line 1926 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 591:
#line 1927 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 592:
#line 1928 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 593:
#line 1929 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 594:
#line 1930 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 595:
#line 1931 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 596:
#line 1932 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 597:
#line 1933 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 598:
#line 1935 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 599:
#line 1936 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 600:
#line 1937 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 601:
#line 1938 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 602:
#line 1940 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 603:
#line 1941 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 604:
#line 1942 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 605:
#line 1943 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 606:
#line 1946 "grammar.y"
    { 
         (yyval.exp) = MkExpCondition((yyvsp[-2].exp), MkListOne(MkExpDummy()), MkExpDummy()); 
         (yyval.exp).loc = (yyloc); 
         ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[-1]); 
         (yyval.exp).cond.elseExp.loc = (yylsp[0]); 
      ;}
    break;

  case 607:
#line 1953 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-2].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[-1]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 608:
#line 1957 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-1].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[0]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 609:
#line 1961 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-1].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[0]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 611:
#line 1968 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 612:
#line 1969 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).op.exp2.loc = (yylsp[-1]); ;}
    break;

  case 613:
#line 1970 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 614:
#line 1971 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).op.exp2.loc = (yylsp[-1]); ;}
    break;

  case 615:
#line 1973 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 616:
#line 1974 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 617:
#line 1978 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 618:
#line 1979 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].exp)); ;}
    break;

  case 619:
#line 1980 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 620:
#line 1981 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 627:
#line 1991 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 628:
#line 1992 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].exp)); ;}
    break;

  case 629:
#line 1993 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 630:
#line 1994 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 633:
#line 2004 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 634:
#line 2005 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 635:
#line 2006 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 636:
#line 2007 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 637:
#line 2008 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 638:
#line 2012 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); declMode = defaultAccess; ;}
    break;

  case 639:
#line 2013 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 640:
#line 2014 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); declMode = staticAccess; ;}
    break;

  case 641:
#line 2015 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 642:
#line 2016 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 643:
#line 2020 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 644:
#line 2021 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 645:
#line 2022 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 646:
#line 2026 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 647:
#line 2027 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 649:
#line 2032 "grammar.y"
    { memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 650:
#line 2036 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 651:
#line 2037 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); POP_DEFAULT_ACCESS ;}
    break;

  case 652:
#line 2041 "grammar.y"
    { (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 653:
#line 2042 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 654:
#line 2043 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), null); FreeSpecifier((yyvsp[-2].specifier)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 655:
#line 2047 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 656:
#line 2048 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 657:
#line 2050 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 658:
#line 2051 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list));  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 659:
#line 2052 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null);  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 660:
#line 2053 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 661:
#line 2054 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 662:
#line 2056 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-2].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 663:
#line 2057 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-3].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 664:
#line 2058 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), null); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-2].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 665:
#line 2059 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-4].specifier).name), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list); FreeSpecifier((yyvsp[-4].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 666:
#line 2060 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-4].specifier).name), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list); FreeSpecifier((yyvsp[-4].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 667:
#line 2064 "grammar.y"
    { (yyval.id) = (yyvsp[0].id); if(declMode) DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); ;}
    break;

  case 668:
#line 2065 "grammar.y"
    { (yyval.id) = MkIdentifier((yyvsp[0].specifier).name); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 669:
#line 2069 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 670:
#line 2070 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), null); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 671:
#line 2071 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 672:
#line 2075 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[0].list)); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 673:
#line 2076 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-1].list)); (yyval.specifier).baseSpecs = (yyvsp[-3].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 674:
#line 2077 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), null); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 675:
#line 2078 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), (yyvsp[-2].list)); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 676:
#line 2079 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), (yyvsp[-2].list)); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 677:
#line 2080 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-7].id), (yyvsp[-3].list)); (yyval.specifier).baseSpecs = (yyvsp[-5].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 678:
#line 2081 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-7].id), (yyvsp[-3].list)); (yyval.specifier).baseSpecs = (yyvsp[-5].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 679:
#line 2082 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), null); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 680:
#line 2083 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), null); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 681:
#line 2085 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 682:
#line 2086 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 683:
#line 2088 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 684:
#line 2089 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 685:
#line 2090 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 686:
#line 2091 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 687:
#line 2092 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 692:
#line 2106 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 693:
#line 2107 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].string)); delete (yyvsp[0].string); ;}
    break;

  case 694:
#line 2111 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 695:
#line 2112 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 696:
#line 2113 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 697:
#line 2118 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 698:
#line 2119 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 699:
#line 2123 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 700:
#line 2124 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 701:
#line 2125 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 702:
#line 2126 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 703:
#line 2127 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 704:
#line 2128 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 705:
#line 2129 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 706:
#line 2130 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 707:
#line 2131 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 708:
#line 2132 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 709:
#line 2133 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 710:
#line 2134 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 711:
#line 2135 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 715:
#line 2139 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); ;}
    break;

  case 716:
#line 2140 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 717:
#line 2141 "grammar.y"
    { _DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 718:
#line 2142 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 719:
#line 2143 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 720:
#line 2144 "grammar.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 721:
#line 2148 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 722:
#line 2149 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 723:
#line 2150 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 724:
#line 2151 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 725:
#line 2152 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 726:
#line 2153 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 727:
#line 2154 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 728:
#line 2155 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 729:
#line 2156 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 730:
#line 2157 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 731:
#line 2158 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 732:
#line 2159 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 733:
#line 2160 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 737:
#line 2164 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); ;}
    break;

  case 738:
#line 2165 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 739:
#line 2166 "grammar.y"
    { _DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 740:
#line 2167 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 741:
#line 2174 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 742:
#line 2176 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 743:
#line 2178 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 744:
#line 2180 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 745:
#line 2182 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 746:
#line 2184 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 747:
#line 2186 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 748:
#line 2188 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 749:
#line 2190 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 750:
#line 2192 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 751:
#line 2196 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 752:
#line 2197 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 753:
#line 2202 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null);
         (yyval.specifier).addNameSpace = true;
         (yyval.specifier).ctx = PushContext();
      ;}
    break;

  case 754:
#line 2208 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null);
         (yyval.specifier).ctx = PushContext();
         FreeSpecifier((yyvsp[0].specifier));
      ;}
    break;

  case 755:
#line 2216 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 756:
#line 2217 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 757:
#line 2218 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 758:
#line 2222 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); AddStructDefinitions((yyvsp[-2].specifier), (yyvsp[0].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 759:
#line 2223 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); AddStructDefinitions((yyvsp[-2].specifier), (yyvsp[0].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 760:
#line 2224 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 761:
#line 2226 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 762:
#line 2227 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 763:
#line 2228 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 764:
#line 2232 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 765:
#line 2237 "grammar.y"
    {
        (yyval.specifier) = (yyvsp[0].specifier);
        if(declMode)
        {
           ((yyvsp[0].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[0].specifier).id.string);
        }
     ;}
    break;

  case 766:
#line 2245 "grammar.y"
    {
      Symbol symbol = ((yyvsp[-3].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[-3].specifier).id.string);
      (yyval.specifier) = (yyvsp[-3].specifier);
      symbol.templateParams = (yyvsp[-1].list);
   ;}
    break;

  case 767:
#line 2254 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).baseSpecs = (yyvsp[0].list);
      SetupBaseSpecs(null, (yyvsp[0].list));
   ;}
    break;

  case 768:
#line 2262 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 769:
#line 2264 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 770:
#line 2265 "grammar.y"
    { POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 771:
#line 2266 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 772:
#line 2271 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).definitions = (yyvsp[0].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 773:
#line 2278 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).definitions = (yyvsp[0].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 774:
#line 2285 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext);;}
    break;

  case 775:
#line 2288 "grammar.y"
    {
        PopContext(curContext);
        if(!declMode)
        {
           (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifier).type, (yyvsp[-2].specifier).id, (yyvsp[0].list));
           (yyvsp[-2].specifier).id = null;
           FreeSpecifier((yyvsp[-2].specifier));
        }
        else
           (yyval.specifier).definitions = (yyvsp[0].list);
        POP_DEFAULT_ACCESS
     ;}
    break;

  case 776:
#line 2301 "grammar.y"
    {
        PopContext(curContext);

        if(!declMode)
        {
           (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifier).type, (yyvsp[-2].specifier).id, (yyvsp[0].list));
           (yyvsp[-2].specifier).id = null;
           FreeSpecifier((yyvsp[-2].specifier));
        }
        else
           (yyval.specifier).definitions = (yyvsp[0].list);
        POP_DEFAULT_ACCESS
     ;}
    break;

  case 777:
#line 2315 "grammar.y"
    { POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 778:
#line 2318 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS  ;}
    break;

  case 779:
#line 2320 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 780:
#line 2322 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 781:
#line 2326 "grammar.y"
    { (yyval.specifierType) = structSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 782:
#line 2327 "grammar.y"
    { (yyval.specifierType) = unionSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 783:
#line 2331 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 784:
#line 2332 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 785:
#line 2333 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 786:
#line 2334 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 787:
#line 2335 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 788:
#line 2336 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 789:
#line 2337 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 790:
#line 2338 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 791:
#line 2342 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 792:
#line 2343 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 793:
#line 2344 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 794:
#line 2345 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 795:
#line 2346 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 796:
#line 2347 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 797:
#line 2348 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 798:
#line 2349 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 799:
#line 2350 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 800:
#line 2351 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 801:
#line 2355 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 802:
#line 2356 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 803:
#line 2357 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 804:
#line 2358 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 805:
#line 2359 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 806:
#line 2360 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 807:
#line 2361 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 808:
#line 2362 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 809:
#line 2363 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 810:
#line 2364 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 811:
#line 2368 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 812:
#line 2369 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 813:
#line 2370 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 814:
#line 2371 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 815:
#line 2372 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 816:
#line 2373 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 817:
#line 2374 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 818:
#line 2375 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 819:
#line 2376 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 820:
#line 2377 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 821:
#line 2378 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 822:
#line 2379 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 823:
#line 2383 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 824:
#line 2384 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 825:
#line 2385 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 826:
#line 2386 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 827:
#line 2387 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 828:
#line 2388 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 829:
#line 2389 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 830:
#line 2390 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 831:
#line 2391 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 832:
#line 2392 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 833:
#line 2396 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 834:
#line 2397 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 835:
#line 2401 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PRIVATE)); ;}
    break;

  case 836:
#line 2402 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PUBLIC)); ;}
    break;

  case 837:
#line 2403 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 838:
#line 2404 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 839:
#line 2405 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 840:
#line 2406 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 841:
#line 2407 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 842:
#line 2408 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 843:
#line 2410 "grammar.y"
    { _DeclClass(0, (yyvsp[0].id).string); (yyval.list) = MkListOne(MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 844:
#line 2411 "grammar.y"
    { _DeclClass(0, (yyvsp[0].id).string); ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 845:
#line 2414 "grammar.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[-3].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[-3].id)._class.name ? (yyvsp[-3].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 846:
#line 2432 "grammar.y"
    {
         if((yyvsp[-3].id)._class && !(yyvsp[-3].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);
         ListAdd((yyvsp[-4].list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 848:
#line 2449 "grammar.y"
    { (yyval.list) = MkListOne(MkStructOrUnion((yyvsp[0].specifierType), null, null)); POP_DEFAULT_ACCESS ;}
    break;

  case 849:
#line 2453 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 850:
#line 2454 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 851:
#line 2455 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 852:
#line 2456 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 853:
#line 2457 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 854:
#line 2458 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 855:
#line 2459 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 856:
#line 2460 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 857:
#line 2462 "grammar.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[-3].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[-3].id)._class.name ? (yyvsp[-3].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 858:
#line 2480 "grammar.y"
    {
         if((yyvsp[-3].id)._class && !(yyvsp[-3].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);
         ListAdd((yyvsp[-4].list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 859:
#line 2496 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 860:
#line 2497 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 861:
#line 2498 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 862:
#line 2499 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 863:
#line 2500 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 864:
#line 2501 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 865:
#line 2502 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 866:
#line 2503 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 867:
#line 2504 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 868:
#line 2505 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 869:
#line 2506 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 870:
#line 2507 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 871:
#line 2509 "grammar.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[-3].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[-3].id)._class.name ? (yyvsp[-3].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 872:
#line 2527 "grammar.y"
    {
         if((yyvsp[-3].id)._class && !(yyvsp[-3].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);
         ListAdd((yyvsp[-4].list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 873:
#line 2543 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 874:
#line 2544 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 875:
#line 2545 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 876:
#line 2546 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 877:
#line 2547 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 878:
#line 2548 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 879:
#line 2549 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 880:
#line 2550 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 881:
#line 2551 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 882:
#line 2552 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 883:
#line 2553 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 884:
#line 2554 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 885:
#line 2556 "grammar.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[-3].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[-3].id)._class.name ? (yyvsp[-3].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 886:
#line 2574 "grammar.y"
    {
         if((yyvsp[-3].id)._class && !(yyvsp[-3].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[-3].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[-3].id).string);
         ListAdd((yyvsp[-4].list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      ;}
    break;

  case 887:
#line 2590 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 888:
#line 2591 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 889:
#line 2595 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 890:
#line 2596 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 891:
#line 2597 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 892:
#line 2598 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 893:
#line 2599 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 894:
#line 2603 "grammar.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 895:
#line 2604 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 896:
#line 2605 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 897:
#line 2606 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 898:
#line 2607 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 899:
#line 2608 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 901:
#line 2616 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 902:
#line 2617 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 903:
#line 2618 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 904:
#line 2619 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 905:
#line 2620 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 906:
#line 2626 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); 
         fileInput.Seek((yylsp[-1]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-1]).end);
         (yyloc).start = (yylsp[-1]).start;
         (yyloc).end = (yylsp[-1]).end;
      ;}
    break;

  case 907:
#line 2635 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); 
         fileInput.Seek((yylsp[-1]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-1]).end);
         (yyloc).start = (yylsp[-1]).start;
         (yyloc).end = (yylsp[-1]).end;
      ;}
    break;

  case 908:
#line 2644 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); 
         fileInput.Seek((yylsp[-2]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-2]).end);
         (yyloc).start = (yylsp[-2]).start;
         (yyloc).end = (yylsp[-2]).end;
      ;}
    break;

  case 909:
#line 2653 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), null); 
         fileInput.Seek((yylsp[-3]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-3]).end);
         (yyloc).start = (yylsp[-3]).start;
         (yyloc).end = (yylsp[-3]).end;
         FreeIdentifier((yyvsp[-1].id));
      ;}
    break;

  case 912:
#line 2668 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 913:
#line 2670 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 914:
#line 2714 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 916:
#line 2717 "grammar.y"
    {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, (yyvsp[-1].string));
         strcat(temp, ")");
         (yyval.string) = CopyString(temp);
         delete (yyvsp[-1].string);
      ;}
    break;

  case 917:
#line 2728 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 918:
#line 2734 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 919:
#line 2736 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 920:
#line 2738 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 921:
#line 2740 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 922:
#line 2742 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 923:
#line 2744 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 924:
#line 2746 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 925:
#line 2748 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 926:
#line 2750 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 927:
#line 2752 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 928:
#line 2754 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 929:
#line 2756 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 930:
#line 2758 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 931:
#line 2760 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 932:
#line 2762 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 933:
#line 2767 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 934:
#line 2769 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 935:
#line 2771 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 936:
#line 2773 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 937:
#line 2775 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 938:
#line 2777 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 939:
#line 2779 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 940:
#line 2783 "grammar.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 941:
#line 2784 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 942:
#line 2785 "grammar.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 943:
#line 2786 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 944:
#line 2790 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 946:
#line 2792 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 947:
#line 2793 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 948:
#line 2794 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 949:
#line 2795 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 950:
#line 2799 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 952:
#line 2801 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 953:
#line 2802 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 954:
#line 2803 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 955:
#line 2804 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 957:
#line 2810 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 958:
#line 2812 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 959:
#line 2814 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[0].string), (yyvsp[-1].declarator)); ;}
    break;

  case 961:
#line 2819 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 962:
#line 2820 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 963:
#line 2821 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 964:
#line 2822 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 966:
#line 2827 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 967:
#line 2828 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 968:
#line 2829 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 969:
#line 2830 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 971:
#line 2835 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 972:
#line 2836 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 973:
#line 2837 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 974:
#line 2838 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 975:
#line 2842 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 976:
#line 2843 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 977:
#line 2845 "grammar.y"
    { 
         (yyval.initializer) = MkInitializerList((yyvsp[-2].list)); 
         (yyval.initializer).loc = (yyloc); 

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[-1]);
            exp.loc = (yylsp[-1]);
            ListAdd((yyvsp[-2].list), init); 
         }
      ;}
    break;

  case 978:
#line 2860 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 979:
#line 2861 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-2].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 980:
#line 2862 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[0].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 981:
#line 2864 "grammar.y"
    { 
         (yyval.initializer) = MkInitializerList((yyvsp[-3].list)); 
         (yyval.initializer).loc = (yyloc);

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[-2]);
            exp.loc = (yylsp[-2]);
            ListAdd((yyvsp[-3].list), init); 
         }
      ;}
    break;

  case 982:
#line 2877 "grammar.y"
    { 
         (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); 
         (yyval.initializer).loc = (yyloc);

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[0]);
            exp.loc = (yylsp[0]);
            ListAdd((yyvsp[-1].list), init); 
         }
      ;}
    break;

  case 983:
#line 2892 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 984:
#line 2894 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 985:
#line 2898 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 986:
#line 2899 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 987:
#line 2903 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 988:
#line 2904 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 989:
#line 2905 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 990:
#line 2906 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 991:
#line 2909 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].initializer)); ;}
    break;

  case 992:
#line 2910 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].initializer)); ;}
    break;

  case 993:
#line 2914 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 994:
#line 2915 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 995:
#line 2919 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-1].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 996:
#line 2920 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), MkInitializerAssignment(MkExpDummy())); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc = (yylsp[-1]); (yyval.initDeclarator).initializer.exp.loc = (yylsp[-1]); ;}
    break;

  case 997:
#line 2921 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 998:
#line 2925 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 999:
#line 2926 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1000:
#line 2927 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1001:
#line 2931 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1002:
#line 2932 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].initDeclarator)); ;}
    break;

  case 1003:
#line 2933 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1004:
#line 2934 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1005:
#line 2938 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1006:
#line 2939 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1007:
#line 2943 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1008:
#line 2944 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1009:
#line 2949 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1010:
#line 2950 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1011:
#line 2951 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 1012:
#line 2952 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); ;}
    break;

  case 1013:
#line 2953 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1014:
#line 2955 "grammar.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 1015:
#line 2973 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), (yyvsp[-1].declarator)); ;}
    break;

  case 1016:
#line 2974 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), (yyvsp[-1].declarator)); ;}
    break;

  case 1017:
#line 2978 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1018:
#line 2979 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1019:
#line 2980 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1020:
#line 2981 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1021:
#line 2982 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1022:
#line 2983 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1023:
#line 2985 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1024:
#line 2986 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1025:
#line 2987 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1026:
#line 2988 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1027:
#line 2992 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1028:
#line 2993 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1029:
#line 2994 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1030:
#line 2995 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1031:
#line 2996 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1032:
#line 2998 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1033:
#line 2999 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1034:
#line 3000 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1036:
#line 3005 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1037:
#line 3006 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1038:
#line 3007 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1039:
#line 3008 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1040:
#line 3009 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, null)); ;}
    break;

  case 1042:
#line 3014 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 1045:
#line 3021 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1047:
#line 3023 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1048:
#line 3024 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1049:
#line 3025 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1053:
#line 3029 "grammar.y"
    {;}
    break;

  case 1057:
#line 3037 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1058:
#line 3038 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1059:
#line 3039 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1060:
#line 3040 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1061:
#line 3041 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1062:
#line 3042 "grammar.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1063:
#line 3043 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[0].list)); Compiler_Error("syntax error\n"); (yyval.stmt).loc = (yylsp[0]); ;}
    break;

  case 1064:
#line 3047 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[0].string), null); (yyval.asmField).loc = (yylsp[0]); ;}
    break;

  case 1065:
#line 3048 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[-3].string), (yyvsp[-1].exp)); (yyval.asmField).loc = (yyloc); ;}
    break;

  case 1066:
#line 3052 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].asmField)); ;}
    break;

  case 1067:
#line 3053 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].asmField)); ;}
    break;

  case 1068:
#line 3054 "grammar.y"
    { (yyval.list) = null; ;}
    break;

  case 1069:
#line 3058 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-4].specifier), (yyvsp[-2].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1070:
#line 3059 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-6].specifier), (yyvsp[-4].string), (yyvsp[-2].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1071:
#line 3060 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), (yyvsp[-4].list), (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1072:
#line 3061 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-10].specifier), (yyvsp[-8].string), (yyvsp[-6].list), (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1073:
#line 3063 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-6].specifier), (yyvsp[-4].string), null, (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1074:
#line 3064 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), null, (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1075:
#line 3065 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), (yyvsp[-4].list), null, (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1076:
#line 3067 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-2].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1077:
#line 3068 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-4].string), (yyvsp[-2].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1078:
#line 3069 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), (yyvsp[-4].list), (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1079:
#line 3070 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-8].string), (yyvsp[-6].list), (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1080:
#line 3072 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-4].string), null, (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1081:
#line 3073 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), null, (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1082:
#line 3074 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), (yyvsp[-4].list), null, (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1083:
#line 3078 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1084:
#line 3079 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1085:
#line 3080 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1086:
#line 3081 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[0].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-2]).end; ;}
    break;

  case 1087:
#line 3082 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1088:
#line 3086 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1089:
#line 3087 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1090:
#line 3088 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1091:
#line 3089 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[0].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-2]).end; ;}
    break;

  case 1092:
#line 3090 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), null); (yyval.stmt).caseStmt.exp.loc = (yylsp[0]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-1]).end; ;}
    break;

  case 1093:
#line 3091 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1094:
#line 3092 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1095:
#line 3096 "grammar.y"
    { (yyval.declMode) = declMode = publicAccess; ;}
    break;

  case 1096:
#line 3097 "grammar.y"
    { (yyval.declMode) = declMode = privateAccess; ;}
    break;

  case 1097:
#line 3098 "grammar.y"
    { (yyval.declMode) = declMode = defaultAccess; ;}
    break;

  case 1098:
#line 3102 "grammar.y"
    { (yyval.declMode) = publicAccess; ;}
    break;

  case 1099:
#line 3103 "grammar.y"
    { (yyval.declMode) = privateAccess; ;}
    break;

  case 1100:
#line 3107 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1101:
#line 3108 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1102:
#line 3109 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1103:
#line 3110 "grammar.y"
    {;}
    break;

  case 1104:
#line 3114 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1105:
#line 3115 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1106:
#line 3116 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1107:
#line 3118 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1108:
#line 3119 "grammar.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1109:
#line 3120 "grammar.y"
    { declMode = staticAccess; (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1110:
#line 3124 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); yyerrok; ;}
    break;

  case 1111:
#line 3128 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1112:
#line 3129 "grammar.y"
    {;}
    break;

  case 1113:
#line 3131 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1114:
#line 3132 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1115:
#line 3133 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), (yyvsp[0].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1116:
#line 3137 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1117:
#line 3138 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1118:
#line 3139 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1119:
#line 3140 "grammar.y"
    { ;}
    break;

  case 1120:
#line 3144 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 1121:
#line 3145 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 1122:
#line 3149 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 1123:
#line 3150 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1124:
#line 3151 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1125:
#line 3155 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 1126:
#line 3156 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1127:
#line 3157 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1128:
#line 3158 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1129:
#line 3159 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1130:
#line 3160 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1131:
#line 3161 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1132:
#line 3165 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 1133:
#line 3166 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 1134:
#line 3167 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1135:
#line 3168 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1136:
#line 3172 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 1137:
#line 3173 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 1138:
#line 3174 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1139:
#line 3175 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1140:
#line 3179 "grammar.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 1141:
#line 3183 "grammar.y"
    { (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1142:
#line 3188 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); (yyval.stmt).compound.context = (yyvsp[-1].context); PopContext((yyvsp[-1].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1143:
#line 3190 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, null); (yyval.stmt).compound.context = (yyvsp[0].context); PopContext((yyvsp[0].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1144:
#line 3193 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); (yyval.stmt).compound.context = (yyvsp[-1].context); PopContext((yyvsp[-1].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1145:
#line 3198 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1146:
#line 3199 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1147:
#line 3200 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1148:
#line 3204 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1149:
#line 3205 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1150:
#line 3206 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1151:
#line 3207 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1152:
#line 3208 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1153:
#line 3209 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1154:
#line 3213 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[0].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1156:
#line 3218 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1157:
#line 3219 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1158:
#line 3220 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1159:
#line 3222 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1160:
#line 3223 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-4].stmt), (yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1161:
#line 3225 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1162:
#line 3226 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1163:
#line 3227 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1164:
#line 3228 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), (yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1165:
#line 3229 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1166:
#line 3231 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[-4].id), (yyvsp[-2].list), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1167:
#line 3232 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[-6].id), (yyvsp[-4].list), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1168:
#line 3236 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1169:
#line 3237 "grammar.y"
    { (yyval.stmt) = MkForStmt(MkExpressionStmt((yyvsp[-1].list)), null, null, null); (yyval.stmt).forStmt.init.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1170:
#line 3238 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-1].stmt), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1171:
#line 3239 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), MkExpressionStmt((yyvsp[-1].list)), null, null); (yyval.stmt).loc = (yyloc); (yyval.stmt).forStmt.check.loc = (yylsp[-1]); ;}
    break;

  case 1172:
#line 3240 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), (yyvsp[-1].stmt), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1173:
#line 3241 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), (yyvsp[-1].stmt), (yyvsp[0].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1174:
#line 3242 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1175:
#line 3243 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1176:
#line 3244 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), (yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1177:
#line 3246 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-4].stmt), (yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1178:
#line 3247 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-3].stmt), (yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1179:
#line 3248 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-3].stmt), (yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1180:
#line 3249 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-2].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1181:
#line 3250 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-1].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1182:
#line 3251 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1183:
#line 3252 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1184:
#line 3255 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1185:
#line 3256 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1186:
#line 3257 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1187:
#line 3258 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[0].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1188:
#line 3259 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1189:
#line 3260 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1190:
#line 3261 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1191:
#line 3265 "grammar.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1192:
#line 3266 "grammar.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1193:
#line 3267 "grammar.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1194:
#line 3268 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 1195:
#line 3269 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1196:
#line 3270 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1197:
#line 3271 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[-1].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1198:
#line 3272 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[-1].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1199:
#line 3276 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1200:
#line 3277 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[0].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1201:
#line 3278 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc.start = exp.loc.end = (yylsp[0]).end; ;}
    break;

  case 1202:
#line 3279 "grammar.y"
    { (yyval.stmt) = MkGotoStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1203:
#line 3285 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1204:
#line 3287 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-2].list), (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1205:
#line 3289 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1206:
#line 3290 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc);;}
    break;

  case 1207:
#line 3293 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1208:
#line 3294 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-2].list), (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1209:
#line 3295 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1210:
#line 3296 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1211:
#line 3300 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 1212:
#line 3302 "grammar.y"
    { 
      int len1 = strlen((yyvsp[-1].string));
      int len2 = strlen(yytext);
      (yyval.string) = new byte[len1-1 + len2-1 + 1];
      memcpy((yyval.string), (yyvsp[-1].string), len1-1);
      memcpy((yyval.string) + len1-1, yytext+1, len2);
      delete (yyvsp[-1].string);
   ;}
    break;

  case 1213:
#line 3313 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyloc); (yyvsp[0].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1214:
#line 3315 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1215:
#line 3318 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1216:
#line 3321 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration));  (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1217:
#line 3322 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), normalImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1218:
#line 3323 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), staticImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1219:
#line 3324 "grammar.y"
    { if(!strcmp((yyvsp[-1].id).string, "remote")) { (yyval.external) = MkExternalImport((yyvsp[0].string), remoteImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); } else yyerror(); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 1220:
#line 3326 "grammar.y"
    { (yyval.external) = null; ;}
    break;

  case 1221:
#line 3328 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyloc); (yyvsp[0].function).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1222:
#line 3330 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1223:
#line 3331 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration)); (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1224:
#line 3332 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), normalImport, ((yyvsp[-2].declMode) != defaultAccess) ? (yyvsp[-2].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1225:
#line 3333 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), staticImport, ((yyvsp[-3].declMode) != defaultAccess) ? (yyvsp[-3].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1226:
#line 3334 "grammar.y"
    { if(!strcmp((yyvsp[-1].id).string, "remote")) { (yyval.external) = MkExternalImport((yyvsp[0].string), remoteImport, ((yyvsp[-3].declMode) != defaultAccess) ? (yyvsp[-3].declMode) : privateAccess);  (yyval.external).loc = (yyloc); FreeIdentifier((yyvsp[-1].id)); } else yyerror();  declMode = defaultDeclMode; ;}
    break;

  case 1227:
#line 3335 "grammar.y"
    { defaultDeclMode = (yyvsp[-1].declMode); (yyval.external) = null; ;}
    break;

  case 1228:
#line 3336 "grammar.y"
    { defaultDeclMode = staticAccess; (yyval.external) = null; ;}
    break;

  case 1229:
#line 3337 "grammar.y"
    { (yyval.external) = MkExternalNameSpace((yyvsp[0].id)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1230:
#line 3338 "grammar.y"
    { (yyval.external) = MkExternalNameSpace(MkIdentifier((yyvsp[0].specifier).name)); FreeSpecifier((yyvsp[0].specifier)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1231:
#line 3339 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[0].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[0].dbtableDef).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1232:
#line 3340 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[0].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[0].dbtableDef).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1233:
#line 3344 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1234:
#line 3345 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1235:
#line 3346 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyvsp[0].function).loc;  (yyvsp[0].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1236:
#line 3348 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1237:
#line 3349 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyvsp[0].function).loc; (yyvsp[0].function).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1238:
#line 3352 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration));  (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1239:
#line 3353 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration)); (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1240:
#line 3357 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].external)); ast = (yyval.list); ;}
    break;

  case 1241:
#line 3358 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1242:
#line 3359 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1245:
#line 3365 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].external)); ast = (yyval.list); ;}
    break;

  case 1246:
#line 3366 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1247:
#line 3368 "grammar.y"
    { External _class = MkExternalClass((yyvsp[0]._class)); ListAdd((yyvsp[-1].list), _class); _class.loc = (yylsp[0]);  (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1248:
#line 3370 "grammar.y"
    { External _class = MkExternalClass((yyvsp[0]._class)); ListAdd((yyvsp[-2].list), _class); _class.loc = (yylsp[0]);  (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1251:
#line 3376 "grammar.y"
    { ast = MkList(); ;}
    break;

  case 1252:
#line 3380 "grammar.y"
    { Symbol symbol = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); FreeIdentifier((yyvsp[-3].id)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[-4].string), symbol, (yyvsp[-1].list)); ;}
    break;

  case 1253:
#line 3381 "grammar.y"
    { Symbol symbol = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[-4].string), symbol, (yyvsp[-1].list)); ;}
    break;

  case 1254:
#line 3382 "grammar.y"
    { (yyval.dbtableDef) = MkDBTableDef((yyvsp[-3].string), null, (yyvsp[-1].list)); ;}
    break;

  case 1255:
#line 3386 "grammar.y"
    { (yyval.dbtableEntry) = MkDBFieldEntry(MkTypeName((yyvsp[-3].list), null), (yyvsp[-2].id), (yyvsp[-1].string)); ;}
    break;

  case 1256:
#line 3390 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), ascending); ;}
    break;

  case 1257:
#line 3391 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), descending); ;}
    break;

  case 1258:
#line 3392 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), ascending); ;}
    break;

  case 1259:
#line 3396 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbindexItem)); ;}
    break;

  case 1260:
#line 3397 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].dbindexItem)); ;}
    break;

  case 1261:
#line 3401 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[-1].list), null); ;}
    break;

  case 1262:
#line 3402 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[-2].list), (yyvsp[-1].id)); ;}
    break;

  case 1263:
#line 3406 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1264:
#line 3407 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1265:
#line 3408 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1266:
#line 3409 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1267:
#line 3413 "grammar.y"
    { (yyval.exp) = MkExpDBOpen((yyvsp[-3].exp), (yyvsp[-1].exp)); ;}
    break;

  case 1268:
#line 3417 "grammar.y"
    { (yyval.exp) = MkExpDBField((yyvsp[-3].string), (yyvsp[-1].id)); ;}
    break;

  case 1269:
#line 3421 "grammar.y"
    { (yyval.exp) = MkExpDBIndex((yyvsp[-3].string), (yyvsp[-1].id)); ;}
    break;

  case 1270:
#line 3425 "grammar.y"
    { (yyval.exp) = MkExpDBTable((yyvsp[-1].string)); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 17603 "grammar.ec"

  yyvsp -= yylen;
  yyssp -= yylen;
  yylsp -= yylen;

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
#if YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (YYPACT_NINF < yyn && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  int yytype = YYTRANSLATE (yychar);
	  const char* yyprefix;
	  char *yymsg;
	  int yyx;

	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  int yyxbegin = yyn < 0 ? -yyn : 0;

	  /* Stay within bounds of both yycheck and yytname.  */
	  int yychecklim = YYLAST - yyn;
	  int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
	  int yycount = 0;

	  yyprefix = ", expecting ";
	  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      {
		yysize += yystrlen (yyprefix) + yystrlen (yytname [yyx]);
		yycount += 1;
		if (yycount == 5)
		  {
		    yysize = 0;
		    break;
		  }
	      }
	  yysize += (sizeof ("syntax error, unexpected ")
		     + yystrlen (yytname[yytype]));
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "syntax error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yyprefix = ", expecting ";
		  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			yyp = yystpcpy (yyp, yyprefix);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yyprefix = " or ";
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("syntax error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("syntax error");
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* If at end of input, pop the error token,
	     then the rest of the stack, then return failure.  */
	  if (yychar == YYEOF)
	     for (;;)
	       {
                 yyerror_range[0] = *yylsp;
		 YYPOPSTACK;
		 if (yyssp == yyss)
		   YYABORT;
		 yydestruct ("Error: popping",
                             yystos[*yyssp], yyvsp, yylsp);
	       }
        }
      else
	{
	  yydestruct ("Error: discarding", yytoken, &yylval, &yylloc);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

#ifdef __GNUC__
  /* Pacify GCC when the user code never invokes YYERROR and the label
     yyerrorlab therefore never appears in user code.  */
  if (0)
     goto yyerrorlab;
#endif

  yyerror_range[0] = yylsp[1-yylen];
  yylsp -= yylen;
  yyvsp -= yylen;
  yyssp -= yylen;
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
      yydestruct ("Error: popping", yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the look-ahead.  YYLOC is available though. */
  YYLLOC_DEFAULT (yyloc, yyerror_range - 1, 2);
  *++yylsp = yyloc;

  /* Shift the error token. */
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
  yydestruct ("Error: discarding lookahead",
              yytoken, &yylval, &yylloc);
  yychar = YYEMPTY;
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 3428 "grammar.y"


