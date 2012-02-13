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
#define YYLAST   36903

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  247
/* YYNRULES -- Number of rules. */
#define YYNRULES  1271
/* YYNRULES -- Number of states. */
#define YYNSTATES  2060

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
     959,   961,   963,   966,   971,   974,   981,   988,   994,  1000,
    1007,  1014,  1020,  1026,  1034,  1042,  1049,  1056,  1064,  1072,
    1079,  1086,  1091,  1097,  1102,  1109,  1114,  1116,  1118,  1120,
    1122,  1126,  1128,  1131,  1134,  1137,  1139,  1144,  1149,  1153,
    1158,  1163,  1167,  1171,  1174,  1177,  1182,  1187,  1191,  1196,
    1200,  1204,  1207,  1210,  1212,  1217,  1222,  1226,  1231,  1236,
    1240,  1244,  1247,  1250,  1255,  1260,  1264,  1269,  1273,  1277,
    1280,  1283,  1285,  1287,  1291,  1295,  1297,  1299,  1303,  1307,
    1310,  1313,  1316,  1319,  1322,  1327,  1330,  1335,  1341,  1347,
    1349,  1351,  1353,  1355,  1357,  1359,  1361,  1363,  1365,  1367,
    1369,  1371,  1373,  1378,  1380,  1384,  1388,  1392,  1396,  1400,
    1404,  1406,  1410,  1414,  1418,  1422,  1424,  1428,  1432,  1436,
    1440,  1443,  1445,  1448,  1452,  1456,  1460,  1464,  1468,  1472,
    1476,  1478,  1482,  1486,  1490,  1494,  1498,  1502,  1506,  1510,
    1512,  1516,  1520,  1524,  1528,  1530,  1534,  1538,  1542,  1546,
    1548,  1552,  1556,  1560,  1564,  1566,  1570,  1574,  1576,  1580,
    1584,  1586,  1592,  1598,  1604,  1610,  1616,  1622,  1628,  1634,
    1640,  1646,  1652,  1658,  1664,  1670,  1676,  1682,  1684,  1688,
    1692,  1696,  1700,  1704,  1708,  1712,  1716,  1718,  1720,  1722,
    1724,  1726,  1728,  1730,  1732,  1734,  1736,  1738,  1740,  1744,
    1748,  1751,  1753,  1757,  1761,  1763,  1765,  1768,  1771,  1775,
    1779,  1783,  1787,  1793,  1797,  1801,  1805,  1811,  1815,  1819,
    1821,  1824,  1827,  1831,  1835,  1839,  1843,  1849,  1853,  1857,
    1861,  1867,  1871,  1875,  1878,  1881,  1884,  1887,  1891,  1894,
    1900,  1907,  1914,  1916,  1918,  1920,  1922,  1924,  1929,  1931,
    1935,  1939,  1943,  1947,  1951,  1955,  1957,  1961,  1965,  1969,
    1973,  1977,  1981,  1985,  1989,  1991,  1995,  1999,  2003,  2007,
    2009,  2012,  2016,  2020,  2024,  2028,  2032,  2036,  2040,  2042,
    2046,  2050,  2054,  2058,  2062,  2066,  2070,  2074,  2078,  2082,
    2086,  2090,  2092,  2096,  2100,  2104,  2108,  2110,  2114,  2118,
    2122,  2126,  2128,  2132,  2136,  2140,  2144,  2146,  2150,  2154,
    2156,  2160,  2164,  2166,  2172,  2178,  2184,  2190,  2195,  2200,
    2205,  2210,  2216,  2222,  2228,  2234,  2239,  2244,  2249,  2254,
    2260,  2266,  2272,  2278,  2284,  2290,  2296,  2302,  2306,  2310,
    2313,  2316,  2318,  2322,  2326,  2330,  2334,  2338,  2342,  2344,
    2347,  2351,  2355,  2359,  2363,  2366,  2369,  2372,  2375,  2377,
    2380,  2384,  2388,  2390,  2392,  2394,  2396,  2398,  2400,  2402,
    2404,  2406,  2408,  2410,  2412,  2414,  2418,  2422,  2424,  2428,
    2431,  2433,  2436,  2439,  2442,  2447,  2452,  2456,  2460,  2465,
    2471,  2476,  2483,  2490,  2495,  2501,  2506,  2513,  2520,  2523,
    2526,  2529,  2535,  2539,  2545,  2552,  2558,  2566,  2574,  2583,
    2592,  2600,  2608,  2612,  2616,  2620,  2625,  2629,  2635,  2641,
    2643,  2645,  2647,  2649,  2651,  2653,  2655,  2657,  2659,  2661,
    2664,  2666,  2668,  2670,  2672,  2674,  2676,  2678,  2680,  2682,
    2684,  2686,  2688,  2690,  2692,  2694,  2696,  2701,  2706,  2711,
    2713,  2715,  2717,  2719,  2721,  2723,  2725,  2727,  2729,  2731,
    2733,  2735,  2737,  2739,  2741,  2743,  2745,  2747,  2749,  2754,
    2759,  2764,  2766,  2768,  2771,  2774,  2778,  2784,  2787,  2791,
    2797,  2803,  2809,  2811,  2815,  2818,  2821,  2824,  2828,  2832,
    2836,  2840,  2844,  2848,  2852,  2856,  2858,  2860,  2865,  2869,
    2872,  2876,  2880,  2884,  2888,  2892,  2896,  2900,  2904,  2908,
    2912,  2916,  2920,  2922,  2924,  2926,  2929,  2931,  2934,  2936,
    2939,  2941,  2944,  2946,  2949,  2951,  2954,  2956,  2959,  2961,
    2964,  2966,  2969,  2971,  2974,  2976,  2979,  2981,  2984,  2986,
    2989,  2991,  2994,  2996,  2999,  3001,  3004,  3006,  3009,  3011,
    3014,  3016,  3019,  3021,  3024,  3026,  3029,  3031,  3034,  3036,
    3039,  3041,  3044,  3046,  3049,  3051,  3054,  3056,  3058,  3060,
    3063,  3065,  3068,  3070,  3073,  3075,  3078,  3083,  3089,  3091,
    3093,  3095,  3098,  3100,  3103,  3105,  3108,  3110,  3113,  3118,
    3124,  3126,  3129,  3131,  3134,  3136,  3139,  3141,  3144,  3146,
    3149,  3151,  3154,  3159,  3165,  3167,  3170,  3172,  3175,  3177,
    3180,  3182,  3185,  3187,  3190,  3192,  3195,  3200,  3206,  3210,
    3214,  3216,  3220,  3224,  3228,  3232,  3234,  3238,  3243,  3248,
    3253,  3257,  3260,  3264,  3268,  3272,  3276,  3279,  3282,  3285,
    3289,  3294,  3296,  3298,  3301,  3304,  3306,  3308,  3313,  3315,
    3319,  3322,  3326,  3330,  3334,  3338,  3343,  3348,  3353,  3356,
    3360,  3364,  3368,  3373,  3378,  3382,  3385,  3389,  3393,  3397,
    3402,  3407,  3409,  3412,  3415,  3419,  3421,  3423,  3426,  3429,
    3432,  3436,  3438,  3440,  3443,  3446,  3449,  3453,  3455,  3458,
    3462,  3465,  3467,  3470,  3473,  3477,  3481,  3483,  3486,  3489,
    3493,  3497,  3499,  3502,  3505,  3509,  3513,  3515,  3519,  3524,
    3526,  3531,  3534,  3540,  3544,  3546,  3548,  3550,  3552,  3554,
    3556,  3560,  3564,  3567,  3570,  3572,  3576,  3579,  3583,  3587,
    3589,  3593,  3597,  3599,  3602,  3606,  3610,  3612,  3615,  3617,
    3620,  3623,  3626,  3629,  3633,  3635,  3637,  3641,  3645,  3647,
    3651,  3656,  3660,  3665,  3669,  3673,  3678,  3682,  3687,  3689,
    3693,  3697,  3702,  3706,  3710,  3714,  3719,  3721,  3725,  3729,
    3733,  3737,  3741,  3743,  3747,  3750,  3752,  3754,  3756,  3758,
    3760,  3763,  3765,  3767,  3769,  3771,  3774,  3777,  3780,  3782,
    3784,  3786,  3788,  3790,  3793,  3795,  3797,  3802,  3804,  3808,
    3809,  3816,  3825,  3836,  3849,  3858,  3869,  3880,  3886,  3894,
    3904,  3916,  3924,  3934,  3944,  3948,  3953,  3958,  3962,  3966,
    3970,  3975,  3980,  3984,  3987,  3991,  3994,  3996,  3998,  4000,
    4002,  4004,  4007,  4011,  4014,  4017,  4020,  4024,  4028,  4031,
    4037,  4044,  4047,  4050,  4053,  4056,  4059,  4062,  4064,  4067,
    4070,  4074,  4076,  4079,  4081,  4084,  4087,  4089,  4092,  4095,
    4098,  4101,  4104,  4107,  4109,  4111,  4114,  4117,  4119,  4121,
    4124,  4127,  4129,  4132,  4135,  4137,  4140,  4142,  4145,  4148,
    4154,  4160,  4168,  4176,  4182,  4188,  4192,  4195,  4201,  4206,
    4211,  4219,  4226,  4233,  4239,  4247,  4254,  4259,  4267,  4277,
    4281,  4286,  4291,  4297,  4303,  4309,  4316,  4324,  4331,  4338,
    4344,  4350,  4355,  4359,  4362,  4364,  4367,  4371,  4376,  4380,
    4385,  4391,  4396,  4400,  4403,  4406,  4409,  4413,  4417,  4421,
    4425,  4428,  4431,  4433,  4435,  4440,  4444,  4448,  4451,  4456,
    4460,  4464,  4467,  4469,  4472,  4474,  4476,  4479,  4481,  4484,
    4488,  4492,  4494,  4497,  4500,  4503,  4507,  4512,  4517,  4520,
    4523,  4526,  4529,  4531,  4534,  4536,  4539,  4541,  4544,  4547,
    4549,  4552,  4554,  4557,  4560,  4563,  4566,  4568,  4571,  4574,
    4578,  4580,  4582,  4583,  4590,  4597,  4603,  4608,  4610,  4613,
    4616,  4618,  4622,  4626,  4631,  4633,  4635,  4638,  4641,  4648,
    4655,  4662
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
      -1,   365,    -1,   122,   365,    -1,   122,   365,   120,   365,
      -1,   112,   113,    -1,    71,   298,   312,   123,   257,   124,
      -1,    71,   298,   312,   123,   258,   124,    -1,    71,   298,
     123,   257,   124,    -1,    71,   298,   123,   258,   124,    -1,
     102,   298,   312,   123,   257,   124,    -1,   102,   298,   312,
     123,   258,   124,    -1,   102,   298,   123,   257,   124,    -1,
     102,   298,   123,   258,   124,    -1,    72,   257,   297,   312,
     123,   257,   124,    -1,    72,   257,   297,   312,   123,   258,
     124,    -1,    72,   257,   297,   123,   257,   124,    -1,    72,
     257,   297,   123,   258,   124,    -1,   103,   257,   297,   312,
     123,   257,   124,    -1,   103,   257,   297,   312,   123,   258,
     124,    -1,   103,   257,   297,   123,   257,   124,    -1,   103,
     257,   297,   123,   258,   124,    -1,    65,   112,   290,   113,
      -1,    65,   112,   290,   311,   113,    -1,    65,   112,   206,
     113,    -1,   104,   112,   233,   117,   326,   113,    -1,    98,
     112,   206,   113,    -1,   377,    -1,   378,    -1,   379,    -1,
     380,    -1,   123,   214,   124,    -1,   167,    -1,   168,     1,
      -1,   112,   235,    -1,   112,   255,    -1,   207,    -1,   212,
     123,   235,   124,    -1,   212,   123,   255,   124,    -1,   212,
     112,   113,    -1,   212,   112,   214,   113,    -1,   212,   112,
     215,   113,    -1,   212,   120,   206,    -1,   212,     7,   206,
      -1,   212,     8,    -1,   212,     9,    -1,   237,   123,   235,
     124,    -1,   237,   123,   255,   124,    -1,   237,   112,   113,
      -1,   237,   112,   214,   113,    -1,   237,   120,   206,    -1,
     237,     7,   206,    -1,   237,     8,    -1,   237,     9,    -1,
     208,    -1,   213,   123,   235,   124,    -1,   213,   123,   255,
     124,    -1,   213,   112,   113,    -1,   213,   112,   214,   113,
      -1,   213,   112,   215,   113,    -1,   213,   120,   206,    -1,
     213,     7,   206,    -1,   213,     8,    -1,   213,     9,    -1,
     238,   123,   235,   124,    -1,   238,   123,   255,   124,    -1,
     238,   112,   113,    -1,   238,   112,   214,   113,    -1,   238,
     120,   206,    -1,   238,     7,   206,    -1,   238,     8,    -1,
     238,     9,    -1,   233,    -1,   209,    -1,   214,   117,   233,
      -1,   214,   117,   209,    -1,   254,    -1,   210,    -1,   214,
     117,   254,    -1,   214,   117,   210,    -1,   214,   117,    -1,
       8,   217,    -1,     9,   217,    -1,   219,   220,    -1,   219,
     209,    -1,     6,   112,   217,   113,    -1,     6,   218,    -1,
       6,   112,   327,   113,    -1,     6,   112,    65,   136,   113,
      -1,     6,   112,    65,   135,   113,    -1,   216,    -1,   212,
      -1,   216,    -1,   213,    -1,   125,    -1,   109,    -1,   126,
      -1,   127,    -1,   114,    -1,   128,    -1,    73,    -1,    84,
      -1,   217,    -1,   112,   326,   113,   220,    -1,   220,    -1,
     221,   109,   220,    -1,   221,   129,   220,    -1,   221,   130,
     220,    -1,   243,   109,   220,    -1,   243,   129,   220,    -1,
     243,   130,   220,    -1,   221,    -1,   222,   126,   221,    -1,
     222,   127,   221,    -1,   244,   126,   221,    -1,   244,   127,
     221,    -1,   222,    -1,   223,    10,   222,    -1,   223,    11,
     222,    -1,   245,    10,   222,    -1,   245,    11,   222,    -1,
     225,   110,    -1,   223,    -1,   224,   223,    -1,   225,   111,
     223,    -1,   225,    12,   223,    -1,   225,    13,   223,    -1,
     246,   110,   223,    -1,   246,   111,   223,    -1,   246,    12,
     223,    -1,   246,    13,   223,    -1,   225,    -1,   226,    14,
     225,    -1,   226,    15,   225,    -1,   247,    14,   225,    -1,
     247,    15,   225,    -1,   226,    14,   209,    -1,   226,    15,
     209,    -1,   247,    14,   209,    -1,   247,    15,   209,    -1,
     226,    -1,   227,   125,   226,    -1,   248,   125,   226,    -1,
     227,   125,   209,    -1,   248,   125,   209,    -1,   227,    -1,
     228,   131,   227,    -1,   249,   131,   227,    -1,   228,   131,
     209,    -1,   249,   131,   209,    -1,   228,    -1,   229,   132,
     228,    -1,   250,   132,   228,    -1,   229,   132,   209,    -1,
     250,   132,   209,    -1,   229,    -1,   230,    16,   229,    -1,
     251,    16,   229,    -1,   230,    -1,   231,    17,   230,    -1,
     252,    17,   230,    -1,   231,    -1,   231,   133,   235,   121,
     232,    -1,   231,   133,   255,   121,   232,    -1,   252,   133,
     235,   121,   232,    -1,   252,   133,   255,   121,   232,    -1,
     231,   133,   236,   121,   232,    -1,   231,   133,   256,   121,
     232,    -1,   252,   133,   236,   121,   232,    -1,   252,   133,
     256,   121,   232,    -1,   231,   133,   235,   121,   209,    -1,
     231,   133,   255,   121,   209,    -1,   252,   133,   235,   121,
     209,    -1,   252,   133,   255,   121,   209,    -1,   231,   133,
     236,   121,   209,    -1,   231,   133,   256,   121,   209,    -1,
     252,   133,   236,   121,   209,    -1,   252,   133,   256,   121,
     209,    -1,   232,    -1,   217,   234,   233,    -1,   240,   234,
     233,    -1,   232,   234,   233,    -1,   253,   234,   233,    -1,
     217,   234,   209,    -1,   240,   234,   209,    -1,   232,   234,
     209,    -1,   253,   234,   209,    -1,   116,    -1,    18,    -1,
      19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,   233,    -1,
     235,   117,   233,    -1,   255,   117,   233,    -1,   255,   113,
      -1,   209,    -1,   235,   117,   209,    -1,   255,   117,   209,
      -1,   211,    -1,     1,    -1,   212,     1,    -1,   166,     1,
      -1,   212,     7,     1,    -1,   237,     7,     1,    -1,   212,
     112,   214,    -1,   212,   112,   215,    -1,   212,   112,   214,
     117,     1,    -1,   212,   112,     1,    -1,   212,   120,     1,
      -1,   237,   112,   215,    -1,   237,   112,   214,   117,     1,
      -1,   237,   112,     1,    -1,   237,   120,     1,    -1,     1,
      -1,   213,     1,    -1,   166,     1,    -1,   213,     7,     1,
      -1,   238,     7,     1,    -1,   213,   112,   214,    -1,   213,
     112,   215,    -1,   213,   112,   214,   117,     1,    -1,   213,
     112,     1,    -1,   213,   120,     1,    -1,   238,   112,   215,
      -1,   238,   112,   214,   117,     1,    -1,   238,   112,     1,
      -1,   238,   120,     1,    -1,     8,   240,    -1,     9,   240,
      -1,   219,   242,    -1,   219,   210,    -1,     6,   112,   240,
      -1,     6,   241,    -1,     6,   112,   327,   113,     1,    -1,
       6,   112,    65,   136,   113,     1,    -1,     6,   112,    65,
     135,   113,     1,    -1,   239,    -1,   237,    -1,   239,    -1,
     238,    -1,   240,    -1,   112,   326,   113,   242,    -1,   242,
      -1,   221,   109,   242,    -1,   221,   129,   242,    -1,   221,
     130,   242,    -1,   243,   109,   242,    -1,   243,   129,   242,
      -1,   243,   130,   242,    -1,   243,    -1,   222,   126,   243,
      -1,   222,   126,     1,    -1,   222,   127,   243,    -1,   222,
     127,     1,    -1,   244,   126,   243,    -1,   244,   126,     1,
      -1,   244,   127,   243,    -1,   244,   127,     1,    -1,   244,
      -1,   223,    10,   244,    -1,   223,    11,   244,    -1,   245,
      10,   244,    -1,   245,    11,   244,    -1,   245,    -1,   224,
     245,    -1,   225,   111,   245,    -1,   225,    12,   245,    -1,
     225,    13,   245,    -1,   246,   110,   245,    -1,   246,   111,
     245,    -1,   246,    12,   245,    -1,   246,    13,   245,    -1,
     246,    -1,   226,    14,   246,    -1,   226,    15,   246,    -1,
     247,    14,   246,    -1,   247,    15,   246,    -1,   226,    14,
       1,    -1,   226,    15,     1,    -1,   247,    14,     1,    -1,
     247,    15,     1,    -1,   226,    14,   210,    -1,   226,    15,
     210,    -1,   247,    14,   210,    -1,   247,    15,   210,    -1,
     247,    -1,   227,   125,   247,    -1,   248,   125,   247,    -1,
     227,   125,   210,    -1,   248,   125,   210,    -1,   248,    -1,
     228,   131,   248,    -1,   249,   131,   248,    -1,   228,   131,
     210,    -1,   249,   131,   210,    -1,   249,    -1,   229,   132,
     249,    -1,   250,   132,   249,    -1,   229,   132,   210,    -1,
     250,   132,   210,    -1,   250,    -1,   230,    16,   250,    -1,
     251,    16,   250,    -1,   251,    -1,   231,    17,   251,    -1,
     252,    17,   251,    -1,   252,    -1,   231,   133,   235,   121,
     252,    -1,   231,   133,   255,   121,   252,    -1,   252,   133,
     235,   121,   252,    -1,   252,   133,   255,   121,   252,    -1,
     231,   133,   235,   121,    -1,   231,   133,   255,   121,    -1,
     252,   133,   235,   121,    -1,   252,   133,   255,   121,    -1,
     231,   133,   236,   121,   252,    -1,   231,   133,   256,   121,
     252,    -1,   252,   133,   236,   121,   252,    -1,   252,   133,
     256,   121,   252,    -1,   231,   133,   236,   121,    -1,   231,
     133,   256,   121,    -1,   252,   133,   236,   121,    -1,   252,
     133,   256,   121,    -1,   231,   133,   235,   121,   210,    -1,
     231,   133,   255,   121,   210,    -1,   252,   133,   235,   121,
     210,    -1,   252,   133,   255,   121,   210,    -1,   231,   133,
     236,   121,   210,    -1,   231,   133,   256,   121,   210,    -1,
     252,   133,   236,   121,   210,    -1,   252,   133,   256,   121,
     210,    -1,   231,   133,   121,    -1,   252,   133,   121,    -1,
     231,   133,    -1,   252,   133,    -1,   253,    -1,   217,   234,
     254,    -1,   217,   234,     1,    -1,   240,   234,   254,    -1,
     240,   234,     1,    -1,   217,   234,   210,    -1,   240,   234,
     210,    -1,   254,    -1,   233,     1,    -1,   235,   117,   254,
      -1,   255,   117,   254,    -1,   235,   117,     1,    -1,   255,
     117,     1,    -1,   235,     1,    -1,   235,   235,    -1,   255,
     235,    -1,   235,   255,    -1,   210,    -1,   209,     1,    -1,
     235,   117,   210,    -1,   255,   117,   210,    -1,   232,    -1,
     253,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   206,    -1,   206,   116,   257,    -1,   206,   116,
     258,    -1,   261,    -1,   262,   117,   261,    -1,   262,   117,
      -1,    50,    -1,   263,   206,    -1,   263,   139,    -1,   266,
     118,    -1,   263,   206,   119,   118,    -1,   263,   139,   119,
     118,    -1,   263,   119,   262,    -1,   263,   119,     1,    -1,
     263,   206,   119,   262,    -1,   263,   206,   119,   262,     1,
      -1,   263,   206,   119,     1,    -1,   263,   206,   119,   262,
     115,   188,    -1,   263,   206,   119,   262,   115,   189,    -1,
     263,   139,   119,   262,    -1,   263,   139,   119,   262,     1,
      -1,   263,   139,   119,     1,    -1,   263,   139,   119,   262,
     115,   188,    -1,   263,   139,   119,   262,   115,   189,    -1,
     263,   206,    -1,   263,   139,    -1,   269,   118,    -1,   267,
     121,   295,   119,   118,    -1,   267,   119,   118,    -1,   267,
     121,   295,   119,   262,    -1,   267,   121,   295,   119,   262,
       1,    -1,   267,   121,   295,   119,     1,    -1,   267,   121,
     295,   119,   262,   115,   188,    -1,   267,   121,   295,   119,
     262,   115,   189,    -1,   267,   121,   295,   119,   262,     1,
     115,   188,    -1,   267,   121,   295,   119,   262,     1,   115,
     189,    -1,   267,   121,   295,   119,     1,   115,   188,    -1,
     267,   121,   295,   119,     1,   115,   189,    -1,   263,   119,
     262,    -1,   263,   119,     1,    -1,   267,   119,   262,    -1,
     267,   119,   262,     1,    -1,   267,   119,     1,    -1,   267,
     119,   262,   115,   188,    -1,   267,   119,   262,   115,   189,
      -1,   268,    -1,   285,    -1,   269,    -1,   286,    -1,    75,
      -1,   306,    -1,    44,    -1,    45,    -1,   272,    -1,   273,
      -1,   274,   273,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,
     282,    -1,   264,    -1,   136,    -1,    87,   112,   233,   113,
      -1,   100,   112,   136,   113,    -1,   100,   112,   206,   113,
      -1,    66,    -1,    82,    -1,    83,    -1,    46,    -1,    34,
      -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,
      -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,
      -1,    85,    -1,   282,    -1,   264,    -1,   139,    -1,    87,
     112,   233,   113,    -1,   100,   112,   136,   113,    -1,   100,
     112,   206,   113,    -1,    66,    -1,   316,    -1,   316,   307,
      -1,   121,   257,    -1,   316,   121,   257,    -1,   316,   121,
     257,   121,   257,    -1,   121,   258,    -1,   316,   121,   258,
      -1,   316,   121,   257,   121,   258,    -1,   316,   121,   258,
     121,   258,    -1,   316,   121,   258,   121,   257,    -1,   277,
      -1,   278,   117,   277,    -1,   287,   206,    -1,   287,   137,
      -1,   281,   118,    -1,   279,   119,   118,    -1,   287,   119,
     118,    -1,   279,   119,   188,    -1,   279,   119,   189,    -1,
     279,   119,     1,    -1,   287,   119,   188,    -1,   287,   119,
     189,    -1,   287,   119,     1,    -1,   279,    -1,   279,    -1,
     279,   110,   198,   111,    -1,   283,   121,   295,    -1,   286,
     118,    -1,   284,   119,   118,    -1,   283,   119,   118,    -1,
     287,   119,   118,    -1,   284,   119,   188,    -1,   284,   119,
     189,    -1,   284,   119,     1,    -1,   283,   119,   188,    -1,
     283,   119,   189,    -1,   283,   119,     1,    -1,   287,   119,
     188,    -1,   287,   119,   189,    -1,   287,   119,     1,    -1,
      48,    -1,    49,    -1,   273,    -1,   288,   273,    -1,   275,
      -1,   288,   275,    -1,   265,    -1,   288,   265,    -1,   280,
      -1,   288,   280,    -1,   273,    -1,   289,   273,    -1,   275,
      -1,   289,   275,    -1,   135,    -1,   289,   135,    -1,   265,
      -1,   289,   265,    -1,   280,    -1,   289,   280,    -1,   259,
      -1,   290,   259,    -1,   273,    -1,   290,   273,    -1,   276,
      -1,   290,   276,    -1,   265,    -1,   290,   265,    -1,   280,
      -1,   290,   280,    -1,   259,    -1,   291,   259,    -1,   273,
      -1,   291,   273,    -1,   275,    -1,   291,   275,    -1,   135,
      -1,   291,   135,    -1,   280,    -1,   291,   280,    -1,   265,
      -1,   291,   265,    -1,   260,    -1,   292,   260,    -1,   273,
      -1,   292,   273,    -1,   275,    -1,   292,   275,    -1,   135,
      -1,   292,   135,    -1,   270,    -1,   292,   270,    -1,   271,
      -1,   292,   271,    -1,    81,    -1,    80,    -1,   259,    -1,
     294,   259,    -1,   273,    -1,   294,   273,    -1,   276,    -1,
     294,   276,    -1,   206,    -1,   294,   206,    -1,   206,   110,
     200,   111,    -1,   294,   206,   110,   200,   111,    -1,   294,
      -1,   287,    -1,   259,    -1,   296,   259,    -1,   273,    -1,
     296,   273,    -1,   276,    -1,   296,   276,    -1,   206,    -1,
     296,   206,    -1,   206,   110,   200,   111,    -1,   296,   206,
     110,   200,   111,    -1,   259,    -1,   297,   259,    -1,   273,
      -1,   297,   273,    -1,   276,    -1,   297,   276,    -1,   280,
      -1,   297,   280,    -1,   265,    -1,   297,   265,    -1,   206,
      -1,   297,   206,    -1,   206,   110,   200,   111,    -1,   297,
     206,   110,   200,   111,    -1,   259,    -1,   298,   259,    -1,
     273,    -1,   298,   273,    -1,   276,    -1,   298,   276,    -1,
     280,    -1,   298,   280,    -1,   265,    -1,   298,   265,    -1,
     206,    -1,   298,   206,    -1,   206,   110,   200,   111,    -1,
     298,   206,   110,   200,   111,    -1,   300,   117,     1,    -1,
     299,   117,     1,    -1,   206,    -1,   300,   117,   206,    -1,
     299,   117,   206,    -1,   330,   117,   206,    -1,   331,   117,
     206,    -1,   206,    -1,   112,   313,   113,    -1,   301,   123,
     257,   124,    -1,   301,   123,   258,   124,    -1,   301,   123,
     136,   124,    -1,   301,   123,   124,    -1,   301,   112,    -1,
     302,   332,   113,    -1,   302,   333,   113,    -1,   302,   300,
     113,    -1,   302,   299,   113,    -1,   302,   113,    -1,   302,
     299,    -1,   302,     1,    -1,   302,   330,   112,    -1,   302,
     291,   206,   112,    -1,   303,    -1,   301,    -1,   306,   303,
      -1,   306,   301,    -1,    74,    -1,   307,    -1,    86,   112,
     365,   113,    -1,    79,    -1,   112,   311,   113,    -1,   123,
     124,    -1,   123,   257,   124,    -1,   123,   258,   124,    -1,
     123,   136,   124,    -1,   308,   123,   124,    -1,   308,   123,
     257,   124,    -1,   308,   123,   136,   124,    -1,   308,   123,
     258,   124,    -1,   112,   113,    -1,   112,   332,   113,    -1,
     112,   333,   113,    -1,   308,   112,   113,    -1,   308,   112,
     332,   113,    -1,   308,   112,   333,   113,    -1,   112,   312,
     113,    -1,   112,   113,    -1,   112,   332,   113,    -1,   112,
     333,   113,    -1,   309,   112,   113,    -1,   309,   112,   332,
     113,    -1,   309,   112,   333,   113,    -1,   109,    -1,   109,
     274,    -1,   109,   310,    -1,   109,   274,   310,    -1,   310,
      -1,   308,    -1,   310,   308,    -1,   306,   310,    -1,   306,
     308,    -1,   306,   310,   308,    -1,   310,    -1,   309,    -1,
     310,   309,    -1,   306,   310,    -1,   306,   309,    -1,   306,
     310,   309,    -1,   305,    -1,   310,   305,    -1,   306,   310,
     305,    -1,   313,   306,    -1,   303,    -1,   310,   303,    -1,
     306,   303,    -1,   306,   310,   303,    -1,   310,   306,   303,
      -1,   304,    -1,   310,   304,    -1,   306,   304,    -1,   306,
     310,   304,    -1,   310,   306,   304,    -1,   301,    -1,   310,
     301,    -1,   306,   301,    -1,   306,   310,   301,    -1,   310,
     306,   301,    -1,   233,    -1,   119,   321,   118,    -1,   119,
     321,   117,   118,    -1,   254,    -1,   119,   321,   118,     1,
      -1,   119,   321,    -1,   119,   321,   117,   118,     1,    -1,
     119,   321,   117,    -1,   232,    -1,   209,    -1,   253,    -1,
     210,    -1,   317,    -1,   318,    -1,   321,   117,   317,    -1,
     321,   117,   318,    -1,   321,   317,    -1,   321,   318,    -1,
     313,    -1,   313,   116,   317,    -1,   313,     1,    -1,   313,
     116,     1,    -1,   313,   116,   318,    -1,   322,    -1,   324,
     117,   322,    -1,   325,   117,   322,    -1,   323,    -1,   322,
       1,    -1,   324,   117,   323,    -1,   325,   117,   323,    -1,
     288,    -1,   288,   311,    -1,   289,    -1,   289,   311,    -1,
     291,   313,    -1,   291,   311,    -1,   291,   125,    -1,   291,
     125,   313,    -1,   291,    -1,    65,    -1,   291,   313,     1,
      -1,   291,   311,     1,    -1,   328,    -1,   330,   117,   328,
      -1,   330,     1,   117,   328,    -1,   331,   117,   328,    -1,
     331,     1,   117,   328,    -1,     1,   117,   328,    -1,   300,
     117,   328,    -1,   300,     1,   117,   328,    -1,   299,   117,
     328,    -1,   299,     1,   117,   328,    -1,   329,    -1,   330,
     117,   329,    -1,   331,   117,   329,    -1,   331,     1,   117,
     329,    -1,     1,   117,   329,    -1,   300,   117,   329,    -1,
     299,   117,   329,    -1,   299,     1,   117,   329,    -1,   330,
      -1,   330,   117,    51,    -1,   331,   117,    51,    -1,   300,
     117,    51,    -1,   299,   117,    51,    -1,     1,   117,    51,
      -1,   331,    -1,   330,   117,     1,    -1,   331,     1,    -1,
     339,    -1,    79,    -1,   354,    -1,   115,    -1,   121,    -1,
     235,   115,    -1,   357,    -1,   359,    -1,   361,    -1,   338,
      -1,   185,   115,    -1,   184,   115,    -1,   183,   115,    -1,
     340,    -1,   360,    -1,   355,    -1,   358,    -1,   362,    -1,
     361,     1,    -1,   255,    -1,   365,    -1,   365,   112,   233,
     113,    -1,   336,    -1,   337,   117,   336,    -1,    -1,    86,
     273,   112,   365,   113,   115,    -1,    86,   273,   112,   365,
     121,   337,   113,   115,    -1,    86,   273,   112,   365,   121,
     337,   121,   337,   113,   115,    -1,    86,   273,   112,   365,
     121,   337,   121,   337,   121,   337,   113,   115,    -1,    86,
     273,   112,   365,     3,   337,   113,   115,    -1,    86,   273,
     112,   365,     3,   337,   121,   337,   113,   115,    -1,    86,
     273,   112,   365,   121,   337,     3,   337,   113,   115,    -1,
      86,   112,   365,   113,   115,    -1,    86,   112,   365,   121,
     337,   113,   115,    -1,    86,   112,   365,   121,   337,   121,
     337,   113,   115,    -1,    86,   112,   365,   121,   337,   121,
     337,   121,   337,   113,   115,    -1,    86,   112,   365,     3,
     337,   113,   115,    -1,    86,   112,   365,     3,   337,   121,
     337,   113,   115,    -1,    86,   112,   365,   121,   337,     3,
     337,   113,   115,    -1,   206,   121,   334,    -1,    52,   257,
     121,   334,    -1,    52,   258,   121,   334,    -1,    52,   121,
     334,    -1,    53,   121,   334,    -1,   206,   121,   335,    -1,
      52,   257,   121,   335,    -1,    52,   258,   121,   335,    -1,
      52,   121,   335,    -1,    52,   121,    -1,    53,   121,   335,
      -1,    53,   121,    -1,    80,    -1,    81,    -1,    53,    -1,
      80,    -1,    81,    -1,   290,   115,    -1,   290,   324,   115,
      -1,   160,   115,    -1,   346,   115,    -1,   292,   115,    -1,
     292,   324,   115,    -1,   293,   324,   115,    -1,   164,   115,
      -1,    77,   206,   116,   232,   115,    -1,    31,    77,   206,
     116,   232,   115,    -1,   292,     1,    -1,   290,     1,    -1,
     346,     1,    -1,   161,     1,    -1,   160,     1,    -1,   290,
     325,    -1,   343,    -1,   347,   343,    -1,   348,   343,    -1,
     347,     1,   115,    -1,   346,    -1,   347,   346,    -1,   334,
      -1,   349,   334,    -1,   350,   334,    -1,   335,    -1,   349,
     335,    -1,   350,   335,    -1,   349,   343,    -1,   350,   343,
      -1,   349,   346,    -1,   350,   346,    -1,   349,    -1,   347,
      -1,   347,   349,    -1,   348,   349,    -1,   350,    -1,   348,
      -1,   347,   350,    -1,   348,   350,    -1,   119,    -1,   355,
     118,    -1,   353,   352,    -1,   353,    -1,   353,   351,    -1,
     115,    -1,   235,   115,    -1,   255,   115,    -1,    54,   112,
     235,   113,   334,    -1,    54,   112,   255,   113,   334,    -1,
      54,   112,   235,   113,   334,    64,   334,    -1,    54,   112,
     255,   113,   334,    64,   334,    -1,    55,   112,   235,   113,
     334,    -1,    55,   112,   255,   113,   334,    -1,    54,   112,
     255,    -1,   357,     1,    -1,    56,   112,   235,   113,   334,
      -1,    56,   112,   255,   334,    -1,    56,   112,   113,   334,
      -1,    57,   334,    56,   112,   235,   113,   115,    -1,    57,
     334,    56,   112,   255,   115,    -1,    58,   112,   356,   356,
     113,   334,    -1,    58,   112,   356,   113,   334,    -1,    58,
     112,   356,   356,   235,   113,   334,    -1,    58,   112,   356,
     356,   255,   334,    -1,    58,   112,   113,   334,    -1,    58,
     112,   206,   121,   235,   113,   334,    -1,    58,   112,   206,
     121,   235,   115,   235,   113,   334,    -1,    58,   112,     1,
      -1,    58,   112,   255,     1,    -1,    58,   112,   356,     1,
      -1,    58,   112,   356,   255,     1,    -1,    58,   112,   356,
     356,     1,    -1,    58,   112,   356,   356,   255,    -1,    58,
     112,   356,   356,   113,   335,    -1,    58,   112,   356,   356,
     235,   113,   335,    -1,    58,   112,   356,   356,   255,   335,
      -1,    57,   334,    56,   112,   235,   113,    -1,    57,   334,
      56,   112,   235,    -1,    57,   334,    56,   112,   255,    -1,
      57,   334,    56,   112,    -1,    57,   334,    56,    -1,    57,
     334,    -1,    57,    -1,    56,     1,    -1,    56,   112,     1,
      -1,    56,   112,   113,     1,    -1,    56,   112,   255,    -1,
      56,   112,   255,     1,    -1,    56,   112,   235,   113,   335,
      -1,    56,   112,   255,   335,    -1,    59,   206,   115,    -1,
      60,   115,    -1,    61,   115,    -1,    62,   115,    -1,    62,
     235,   115,    -1,    62,   255,   115,    -1,    62,   209,   115,
      -1,    62,   210,   115,    -1,    62,   255,    -1,    62,   210,
      -1,    62,    -1,    59,    -1,   292,   314,   347,   354,    -1,
     292,   314,   354,    -1,   314,   347,   354,    -1,   314,   354,
      -1,   292,   314,   347,   355,    -1,   292,   314,   355,    -1,
     314,   347,   355,    -1,   314,   355,    -1,     5,    -1,   365,
       5,    -1,   363,    -1,   203,    -1,   292,   203,    -1,   344,
      -1,    76,   365,    -1,    76,    31,   365,    -1,    76,   206,
     365,    -1,   115,    -1,   341,   363,    -1,   341,   203,    -1,
     341,   344,    -1,   341,    76,   365,    -1,   341,    76,    31,
     365,    -1,   341,    76,   206,   365,    -1,   341,   121,    -1,
      31,   121,    -1,   101,   206,    -1,   101,   139,    -1,   371,
      -1,   341,   371,    -1,   205,    -1,   292,   205,    -1,   364,
      -1,   341,   205,    -1,   341,   364,    -1,   345,    -1,   341,
     345,    -1,   367,    -1,   369,   367,    -1,   368,   367,    -1,
     369,     1,    -1,   368,     1,    -1,   366,    -1,   369,   366,
      -1,   368,   203,    -1,   368,   341,   203,    -1,   369,    -1,
     368,    -1,    -1,   105,   365,   206,   119,   376,   118,    -1,
     105,   365,   139,   119,   376,   118,    -1,   105,   365,   119,
     376,   118,    -1,   291,   206,   365,   115,    -1,   206,    -1,
     111,   206,    -1,   110,   206,    -1,   373,    -1,   374,   117,
     373,    -1,   107,   374,   115,    -1,   107,   374,   206,   115,
      -1,   372,    -1,   375,    -1,   376,   372,    -1,   376,   375,
      -1,   108,   112,   233,   117,   233,   113,    -1,   106,   112,
     365,   117,   206,   113,    -1,   107,   112,   365,   117,   206,
     113,    -1,   105,   112,   365,   113,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   259,   259,   287,   345,   346,   446,   450,   453,   454,
     455,   504,   506,   511,   516,   521,   523,   528,   530,   535,
     537,   542,   544,   546,   548,   550,   554,   559,   561,   563,
     565,   567,   573,   575,   580,   585,   590,   592,   594,   599,
     600,   604,   605,   616,   620,   621,   623,   628,   629,   631,
     634,   645,   655,   674,   676,   681,   682,   683,   684,   685,
     686,   687,   688,   689,   693,   694,   695,   696,   700,   701,
     702,   703,   704,   705,   706,   710,   712,   717,   719,   721,
     723,   725,   755,   757,   762,   764,   766,   768,   770,   799,
     801,   803,   808,   810,   815,   817,   821,   823,   825,   827,
     832,   835,   838,   841,   906,   908,   913,   915,   917,   919,
     921,   952,   956,   957,   958,   962,   963,   964,   968,   969,
     970,   971,   975,   978,   981,   984,   987,   992,   993,   995,
     997,   999,  1001,  1006,  1010,  1013,  1016,  1019,  1022,  1027,
    1028,  1030,  1035,  1039,  1041,  1046,  1048,  1053,  1055,  1060,
    1065,  1067,  1072,  1074,  1076,  1078,  1083,  1085,  1087,  1089,
    1094,  1095,  1096,  1097,  1098,  1099,  1101,  1102,  1103,  1104,
    1105,  1106,  1108,  1109,  1110,  1111,  1112,  1113,  1114,  1115,
    1116,  1117,  1118,  1120,  1121,  1123,  1127,  1128,  1129,  1130,
    1131,  1133,  1134,  1135,  1136,  1137,  1139,  1143,  1144,  1145,
    1149,  1150,  1151,  1152,  1153,  1157,  1158,  1159,  1163,  1167,
    1168,  1169,  1170,  1171,  1172,  1173,  1174,  1178,  1182,  1183,
    1187,  1191,  1192,  1196,  1197,  1198,  1202,  1203,  1207,  1208,
    1209,  1210,  1211,  1212,  1213,  1225,  1237,  1252,  1253,  1257,
    1263,  1264,  1272,  1273,  1275,  1276,  1285,  1286,  1290,  1296,
    1303,  1309,  1316,  1322,  1331,  1338,  1344,  1350,  1356,  1362,
    1368,  1379,  1384,  1385,  1390,  1391,  1392,  1393,  1394,  1395,
    1396,  1397,  1398,  1399,  1400,  1401,  1402,  1403,  1404,  1405,
    1406,  1407,  1408,  1409,  1410,  1411,  1412,  1413,  1414,  1415,
    1416,  1417,  1418,  1419,  1420,  1422,  1423,  1424,  1425,  1426,
    1428,  1432,  1436,  1440,  1441,  1445,  1447,  1448,  1449,  1450,
    1451,  1452,  1453,  1454,  1455,  1457,  1458,  1459,  1460,  1461,
    1462,  1463,  1464,  1468,  1470,  1471,  1472,  1473,  1474,  1475,
    1476,  1477,  1478,  1480,  1481,  1482,  1483,  1484,  1485,  1486,
    1487,  1491,  1492,  1493,  1494,  1498,  1499,  1500,  1501,  1502,
    1506,  1507,  1508,  1509,  1510,  1511,  1512,  1513,  1514,  1518,
    1519,  1523,  1524,  1528,  1529,  1530,  1531,  1532,  1533,  1534,
    1535,  1539,  1540,  1544,  1545,  1546,  1547,  1548,  1549,  1550,
    1554,  1555,  1556,  1557,  1558,  1562,  1563,  1564,  1565,  1566,
    1570,  1578,  1579,  1580,  1581,  1582,  1583,  1584,  1585,  1586,
    1590,  1591,  1592,  1593,  1594,  1596,  1597,  1598,  1599,  1603,
    1604,  1605,  1607,  1608,  1612,  1613,  1614,  1616,  1617,  1621,
    1622,  1623,  1625,  1626,  1630,  1631,  1632,  1636,  1637,  1638,
    1642,  1643,  1644,  1645,  1646,  1648,  1649,  1650,  1651,  1653,
    1654,  1655,  1656,  1658,  1659,  1660,  1661,  1665,  1666,  1667,
    1668,  1669,  1671,  1672,  1673,  1674,  1678,  1679,  1680,  1681,
    1682,  1683,  1684,  1685,  1686,  1687,  1688,  1692,  1693,  1694,
    1695,  1699,  1700,  1701,  1705,  1706,  1707,  1708,  1710,  1711,
    1713,  1714,  1715,  1716,  1717,  1719,  1720,  1721,  1722,  1726,
    1727,  1728,  1730,  1731,  1733,  1734,  1735,  1736,  1737,  1739,
    1740,  1741,  1742,  1746,  1747,  1748,  1749,  1750,  1751,  1752,
    1753,  1754,  1758,  1759,  1763,  1764,  1769,  1770,  1774,  1775,
    1776,  1777,  1778,  1779,  1780,  1784,  1785,  1786,  1787,  1788,
    1789,  1790,  1791,  1792,  1796,  1797,  1798,  1799,  1800,  1804,
    1805,  1855,  1856,  1857,  1858,  1859,  1860,  1861,  1865,  1866,
    1867,  1868,  1869,  1871,  1872,  1873,  1874,  1876,  1877,  1878,
    1879,  1883,  1884,  1885,  1887,  1888,  1892,  1893,  1894,  1896,
    1897,  1901,  1902,  1903,  1905,  1906,  1910,  1911,  1912,  1916,
    1917,  1918,  1922,  1923,  1924,  1925,  1926,  1927,  1928,  1929,
    1930,  1932,  1933,  1934,  1935,  1936,  1937,  1938,  1939,  1941,
    1942,  1943,  1944,  1946,  1947,  1948,  1949,  1951,  1958,  1962,
    1966,  1973,  1974,  1975,  1976,  1977,  1979,  1980,  1984,  1985,
    1986,  1987,  1988,  1989,  1990,  1991,  1992,  1993,  1997,  1998,
    1999,  2000,  2004,  2006,  2010,  2011,  2012,  2013,  2014,  2018,
    2019,  2020,  2021,  2022,  2026,  2027,  2028,  2032,  2033,  2034,
    2038,  2042,  2043,  2047,  2048,  2049,  2053,  2054,  2056,  2057,
    2058,  2059,  2060,  2062,  2063,  2064,  2065,  2066,  2070,  2071,
    2075,  2076,  2077,  2081,  2082,  2083,  2084,  2085,  2086,  2087,
    2088,  2089,  2091,  2092,  2094,  2095,  2096,  2097,  2098,  2102,
    2103,  2107,  2108,  2112,  2113,  2117,  2118,  2119,  2124,  2125,
    2129,  2130,  2131,  2132,  2133,  2134,  2135,  2136,  2137,  2138,
    2139,  2140,  2141,  2142,  2143,  2144,  2145,  2146,  2147,  2148,
    2149,  2150,  2154,  2155,  2156,  2157,  2158,  2159,  2160,  2161,
    2162,  2163,  2164,  2165,  2166,  2167,  2168,  2169,  2170,  2171,
    2172,  2173,  2179,  2181,  2183,  2185,  2187,  2189,  2191,  2193,
    2195,  2197,  2202,  2203,  2207,  2213,  2222,  2223,  2224,  2228,
    2229,  2230,  2232,  2233,  2234,  2238,  2242,  2250,  2259,  2268,
    2269,  2271,  2272,  2276,  2283,  2290,  2293,  2306,  2320,  2323,
    2325,  2327,  2332,  2333,  2337,  2338,  2339,  2340,  2341,  2342,
    2343,  2344,  2348,  2349,  2350,  2351,  2352,  2353,  2354,  2355,
    2356,  2357,  2361,  2362,  2363,  2364,  2365,  2366,  2367,  2368,
    2369,  2370,  2374,  2375,  2376,  2377,  2378,  2379,  2380,  2381,
    2382,  2383,  2384,  2385,  2389,  2390,  2391,  2392,  2393,  2394,
    2395,  2396,  2397,  2398,  2402,  2403,  2407,  2408,  2409,  2410,
    2411,  2412,  2413,  2414,  2415,  2417,  2419,  2437,  2454,  2455,
    2459,  2460,  2461,  2462,  2463,  2464,  2465,  2466,  2467,  2485,
    2502,  2503,  2504,  2505,  2506,  2507,  2508,  2509,  2510,  2511,
    2512,  2513,  2514,  2532,  2549,  2550,  2551,  2552,  2553,  2554,
    2555,  2556,  2557,  2558,  2559,  2560,  2561,  2579,  2596,  2597,
    2601,  2602,  2603,  2604,  2605,  2609,  2610,  2611,  2612,  2613,
    2614,  2618,  2622,  2623,  2624,  2625,  2626,  2631,  2640,  2649,
    2658,  2671,  2672,  2673,  2675,  2720,  2721,  2722,  2734,  2739,
    2741,  2743,  2745,  2747,  2749,  2751,  2753,  2755,  2757,  2759,
    2761,  2763,  2765,  2767,  2772,  2774,  2776,  2778,  2780,  2782,
    2784,  2789,  2790,  2791,  2792,  2796,  2797,  2798,  2799,  2800,
    2801,  2805,  2806,  2807,  2808,  2809,  2810,  2814,  2815,  2817,
    2819,  2824,  2825,  2826,  2827,  2828,  2832,  2833,  2834,  2835,
    2836,  2840,  2841,  2842,  2843,  2844,  2848,  2849,  2850,  2866,
    2867,  2868,  2869,  2882,  2898,  2899,  2904,  2905,  2909,  2910,
    2911,  2912,  2915,  2916,  2920,  2921,  2925,  2926,  2927,  2931,
    2932,  2933,  2937,  2938,  2939,  2940,  2944,  2945,  2949,  2950,
    2955,  2956,  2957,  2958,  2959,  2960,  2979,  2980,  2984,  2985,
    2986,  2987,  2988,  2989,  2991,  2992,  2993,  2994,  2998,  2999,
    3000,  3001,  3002,  3004,  3005,  3006,  3010,  3011,  3012,  3013,
    3014,  3015,  3019,  3020,  3021,  3026,  3027,  3028,  3029,  3030,
    3031,  3032,  3033,  3034,  3035,  3037,  3038,  3039,  3043,  3044,
    3045,  3046,  3047,  3048,  3049,  3053,  3054,  3058,  3059,  3060,
    3064,  3065,  3066,  3067,  3069,  3070,  3071,  3073,  3074,  3075,
    3076,  3078,  3079,  3080,  3084,  3085,  3086,  3087,  3088,  3092,
    3093,  3094,  3095,  3096,  3097,  3098,  3102,  3103,  3104,  3108,
    3109,  3113,  3114,  3115,  3116,  3120,  3121,  3122,  3124,  3125,
    3126,  3130,  3134,  3135,  3137,  3138,  3139,  3143,  3144,  3145,
    3146,  3150,  3151,  3155,  3156,  3157,  3161,  3162,  3163,  3164,
    3165,  3166,  3167,  3171,  3172,  3173,  3174,  3178,  3179,  3180,
    3181,  3185,  3189,  3193,  3195,  3198,  3204,  3205,  3206,  3210,
    3211,  3212,  3213,  3214,  3215,  3219,  3220,  3224,  3225,  3226,
    3228,  3229,  3231,  3232,  3233,  3234,  3235,  3237,  3238,  3242,
    3243,  3244,  3245,  3246,  3247,  3248,  3249,  3250,  3252,  3253,
    3254,  3255,  3256,  3257,  3258,  3261,  3262,  3263,  3264,  3265,
    3266,  3267,  3271,  3272,  3273,  3274,  3275,  3276,  3277,  3278,
    3282,  3283,  3284,  3285,  3291,  3292,  3295,  3296,  3299,  3300,
    3301,  3302,  3306,  3307,  3319,  3320,  3323,  3326,  3328,  3329,
    3330,  3332,  3334,  3335,  3337,  3338,  3339,  3340,  3341,  3342,
    3343,  3344,  3345,  3346,  3350,  3351,  3352,  3354,  3355,  3357,
    3359,  3363,  3364,  3365,  3366,  3367,  3371,  3372,  3373,  3375,
    3380,  3381,  3382,  3386,  3387,  3388,  3392,  3396,  3397,  3398,
    3402,  3403,  3407,  3408,  3412,  3413,  3414,  3415,  3419,  3423,
    3427,  3431
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
     208,   209,   210,   211,   211,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   214,   214,   214,   214,   215,   215,   215,   215,   215,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   217,
     217,   218,   218,   219,   219,   219,   219,   219,   219,   219,
     219,   220,   220,   221,   221,   221,   221,   221,   221,   221,
     222,   222,   222,   222,   222,   223,   223,   223,   223,   223,
     224,   225,   225,   225,   225,   225,   225,   225,   225,   225,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   227,
     227,   227,   227,   227,   228,   228,   228,   228,   228,   229,
     229,   229,   229,   229,   230,   230,   230,   231,   231,   231,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   232,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   234,   235,   235,   235,
     235,   236,   236,   236,   237,   237,   237,   237,   237,   237,
     237,   237,   237,   237,   237,   237,   237,   237,   237,   238,
     238,   238,   238,   238,   238,   238,   238,   238,   238,   238,
     238,   238,   238,   239,   239,   239,   239,   239,   239,   239,
     239,   239,   240,   240,   241,   241,   242,   242,   243,   243,
     243,   243,   243,   243,   243,   244,   244,   244,   244,   244,
     244,   244,   244,   244,   245,   245,   245,   245,   245,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   247,   247,   247,
     247,   248,   248,   248,   248,   248,   249,   249,   249,   249,
     249,   250,   250,   250,   250,   250,   251,   251,   251,   252,
     252,   252,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   254,   254,   254,   254,   254,   254,   254,   255,   255,
     255,   255,   255,   255,   255,   255,   255,   255,   256,   256,
     256,   256,   257,   258,   259,   259,   259,   259,   259,   260,
     260,   260,   260,   260,   261,   261,   261,   262,   262,   262,
     263,   264,   264,   265,   265,   265,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   266,   267,   267,
     268,   268,   268,   269,   269,   269,   269,   269,   269,   269,
     269,   269,   269,   269,   269,   269,   269,   269,   269,   270,
     270,   271,   271,   272,   272,   273,   273,   273,   274,   274,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   275,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   276,   277,   277,   277,   277,   277,   277,   277,   277,
     277,   277,   278,   278,   279,   279,   280,   280,   280,   281,
     281,   281,   281,   281,   281,   282,   283,   283,   284,   285,
     285,   285,   285,   286,   286,   286,   286,   286,   286,   286,
     286,   286,   287,   287,   288,   288,   288,   288,   288,   288,
     288,   288,   289,   289,   289,   289,   289,   289,   289,   289,
     289,   289,   290,   290,   290,   290,   290,   290,   290,   290,
     290,   290,   291,   291,   291,   291,   291,   291,   291,   291,
     291,   291,   291,   291,   292,   292,   292,   292,   292,   292,
     292,   292,   292,   292,   293,   293,   294,   294,   294,   294,
     294,   294,   294,   294,   294,   294,   294,   294,   295,   295,
     296,   296,   296,   296,   296,   296,   296,   296,   296,   296,
     297,   297,   297,   297,   297,   297,   297,   297,   297,   297,
     297,   297,   297,   297,   298,   298,   298,   298,   298,   298,
     298,   298,   298,   298,   298,   298,   298,   298,   299,   299,
     300,   300,   300,   300,   300,   301,   301,   301,   301,   301,
     301,   302,   303,   303,   303,   303,   303,   304,   304,   304,
     304,   305,   305,   305,   305,   306,   306,   306,   307,   308,
     308,   308,   308,   308,   308,   308,   308,   308,   308,   308,
     308,   308,   308,   308,   309,   309,   309,   309,   309,   309,
     309,   310,   310,   310,   310,   311,   311,   311,   311,   311,
     311,   312,   312,   312,   312,   312,   312,   313,   313,   313,
     313,   314,   314,   314,   314,   314,   315,   315,   315,   315,
     315,   316,   316,   316,   316,   316,   317,   317,   317,   318,
     318,   318,   318,   318,   319,   319,   320,   320,   321,   321,
     321,   321,   321,   321,   322,   322,   323,   323,   323,   324,
     324,   324,   325,   325,   325,   325,   326,   326,   327,   327,
     328,   328,   328,   328,   328,   328,   329,   329,   330,   330,
     330,   330,   330,   330,   330,   330,   330,   330,   331,   331,
     331,   331,   331,   331,   331,   331,   332,   332,   332,   332,
     332,   332,   333,   333,   333,   334,   334,   334,   334,   334,
     334,   334,   334,   334,   334,   334,   334,   334,   335,   335,
     335,   335,   335,   335,   335,   336,   336,   337,   337,   337,
     338,   338,   338,   338,   338,   338,   338,   338,   338,   338,
     338,   338,   338,   338,   339,   339,   339,   339,   339,   340,
     340,   340,   340,   340,   340,   340,   341,   341,   341,   342,
     342,   343,   343,   343,   343,   344,   344,   344,   344,   344,
     344,   345,   346,   346,   346,   346,   346,   347,   347,   347,
     347,   348,   348,   349,   349,   349,   350,   350,   350,   350,
     350,   350,   350,   351,   351,   351,   351,   352,   352,   352,
     352,   353,   354,   355,   355,   355,   356,   356,   356,   357,
     357,   357,   357,   357,   357,   358,   358,   359,   359,   359,
     359,   359,   359,   359,   359,   359,   359,   359,   359,   360,
     360,   360,   360,   360,   360,   360,   360,   360,   360,   360,
     360,   360,   360,   360,   360,   360,   360,   360,   360,   360,
     360,   360,   361,   361,   361,   361,   361,   361,   361,   361,
     362,   362,   362,   362,   363,   363,   363,   363,   364,   364,
     364,   364,   365,   365,   366,   366,   366,   366,   366,   366,
     366,   366,   366,   366,   366,   366,   366,   366,   366,   366,
     366,   366,   366,   366,   367,   367,   367,   367,   367,   367,
     367,   368,   368,   368,   368,   368,   369,   369,   369,   369,
     370,   370,   370,   371,   371,   371,   372,   373,   373,   373,
     374,   374,   375,   375,   376,   376,   376,   376,   377,   378,
     379,   380
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
       1,     1,     2,     4,     2,     6,     6,     5,     5,     6,
       6,     5,     5,     7,     7,     6,     6,     7,     7,     6,
       6,     4,     5,     4,     6,     4,     1,     1,     1,     1,
       3,     1,     2,     2,     2,     1,     4,     4,     3,     4,
       4,     3,     3,     2,     2,     4,     4,     3,     4,     3,
       3,     2,     2,     1,     4,     4,     3,     4,     4,     3,
       3,     2,     2,     4,     4,     3,     4,     3,     3,     2,
       2,     1,     1,     3,     3,     1,     1,     3,     3,     2,
       2,     2,     2,     2,     4,     2,     4,     5,     5,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     1,     3,     3,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       2,     1,     2,     3,     3,     3,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     1,     3,     3,
       1,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     3,
       2,     1,     3,     3,     1,     1,     2,     2,     3,     3,
       3,     3,     5,     3,     3,     3,     5,     3,     3,     1,
       2,     2,     3,     3,     3,     3,     5,     3,     3,     3,
       5,     3,     3,     2,     2,     2,     2,     3,     2,     5,
       6,     6,     1,     1,     1,     1,     1,     4,     1,     3,
       3,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     3,     3,     3,     3,     1,
       2,     3,     3,     3,     3,     3,     3,     3,     1,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     3,     3,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     3,     3,     1,     3,     3,     1,
       3,     3,     1,     5,     5,     5,     5,     4,     4,     4,
       4,     5,     5,     5,     5,     4,     4,     4,     4,     5,
       5,     5,     5,     5,     5,     5,     5,     3,     3,     2,
       2,     1,     3,     3,     3,     3,     3,     3,     1,     2,
       3,     3,     3,     3,     2,     2,     2,     2,     1,     2,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     3,     1,     3,     2,
       1,     2,     2,     2,     4,     4,     3,     3,     4,     5,
       4,     6,     6,     4,     5,     4,     6,     6,     2,     2,
       2,     5,     3,     5,     6,     5,     7,     7,     8,     8,
       7,     7,     3,     3,     3,     4,     3,     5,     5,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     1,     1,     2,     2,     3,     5,     2,     3,     5,
       5,     5,     1,     3,     2,     2,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     1,     1,     4,     3,     2,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     1,     1,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     1,     1,     2,
       1,     2,     1,     2,     1,     2,     4,     5,     1,     1,
       1,     2,     1,     2,     1,     2,     1,     2,     4,     5,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     4,     5,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     4,     5,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     4,     4,     4,
       3,     2,     3,     3,     3,     3,     2,     2,     2,     3,
       4,     1,     1,     2,     2,     1,     1,     4,     1,     3,
       2,     3,     3,     3,     3,     4,     4,     4,     2,     3,
       3,     3,     4,     4,     3,     2,     3,     3,     3,     4,
       4,     1,     2,     2,     3,     1,     1,     2,     2,     2,
       3,     1,     1,     2,     2,     2,     3,     1,     2,     3,
       2,     1,     2,     2,     3,     3,     1,     2,     2,     3,
       3,     1,     2,     2,     3,     3,     1,     3,     4,     1,
       4,     2,     5,     3,     1,     1,     1,     1,     1,     1,
       3,     3,     2,     2,     1,     3,     2,     3,     3,     1,
       3,     3,     1,     2,     3,     3,     1,     2,     1,     2,
       2,     2,     2,     3,     1,     1,     3,     3,     1,     3,
       4,     3,     4,     3,     3,     4,     3,     4,     1,     3,
       3,     4,     3,     3,     3,     4,     1,     3,     3,     3,
       3,     3,     1,     3,     2,     1,     1,     1,     1,     1,
       2,     1,     1,     1,     1,     2,     2,     2,     1,     1,
       1,     1,     1,     2,     1,     1,     4,     1,     3,     0,
       6,     8,    10,    12,     8,    10,    10,     5,     7,     9,
      11,     7,     9,     9,     3,     4,     4,     3,     3,     3,
       4,     4,     3,     2,     3,     2,     1,     1,     1,     1,
       1,     2,     3,     2,     2,     2,     3,     3,     2,     5,
       6,     2,     2,     2,     2,     2,     2,     1,     2,     2,
       3,     1,     2,     1,     2,     2,     1,     2,     2,     2,
       2,     2,     2,     1,     1,     2,     2,     1,     1,     2,
       2,     1,     2,     2,     1,     2,     1,     2,     2,     5,
       5,     7,     7,     5,     5,     3,     2,     5,     4,     4,
       7,     6,     6,     5,     7,     6,     4,     7,     9,     3,
       4,     4,     5,     5,     5,     6,     7,     6,     6,     5,
       5,     4,     3,     2,     1,     2,     3,     4,     3,     4,
       5,     4,     3,     2,     2,     2,     3,     3,     3,     3,
       2,     2,     1,     1,     4,     3,     3,     2,     4,     3,
       3,     2,     1,     2,     1,     1,     2,     1,     2,     3,
       3,     1,     2,     2,     2,     3,     4,     4,     2,     2,
       2,     2,     1,     2,     1,     2,     1,     2,     2,     1,
       2,     1,     2,     2,     2,     2,     1,     2,     2,     3,
       1,     1,     0,     6,     6,     5,     4,     1,     2,     2,
       1,     3,     3,     4,     1,     1,     2,     2,     6,     6,
       6,     4
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
    1252,   261,     6,   639,   640,   641,   642,   643,   701,   702,
     703,   704,   705,   707,   710,   711,   708,   709,   695,   696,
     700,   706,   782,   783,   650,  1098,   239,   719,   915,   693,
       0,     0,   918,  1096,  1097,   720,   721,   712,     0,     0,
       0,     0,     0,   941,     0,  1221,   830,   715,     8,     4,
       0,     0,     0,  1215,     0,  1234,   895,   824,     0,   714,
       0,   689,   691,   832,   834,   697,   826,   828,   765,   713,
       0,     0,   690,   692,     0,     0,     0,     0,     0,   961,
     694,   916,     0,     0,     0,  1217,  1239,  1214,  1236,  1246,
    1241,     0,     0,     0,  1232,     0,  1229,  1212,     0,     0,
    1218,     0,     0,     0,     0,  1231,  1230,     0,   698,   942,
     694,   943,   895,   912,   911,   957,     0,     0,     0,     0,
    1108,     0,   241,   240,     0,     0,   249,     0,   248,     2,
       3,     0,     5,     0,   652,   651,     0,     0,   670,     0,
       0,     0,     0,   769,     0,   755,   754,  1111,   641,  1105,
     831,  1216,  1235,   895,   825,   833,   835,   827,   829,   961,
     694,     0,     0,     0,     0,  1002,     0,     0,     0,   901,
       0,     0,   634,   635,   636,   637,   638,  1015,   906,   818,
     890,   812,     0,   822,     0,   814,   816,   765,   820,     0,
       0,  1014,     0,     0,  1018,  1028,     0,     0,     0,     0,
     963,     0,   962,     0,   723,   724,   725,   726,   727,   729,
     732,   733,   730,   731,   722,   728,   741,   734,     0,     0,
    1141,   737,     0,     0,   802,   736,   808,   804,   806,   810,
     735,     0,  1117,     0,     0,     0,     0,  1207,  1211,   641,
       0,  1228,  1223,  1237,     0,  1224,  1240,  1222,  1238,  1233,
    1245,  1248,     0,     0,     0,     0,     0,  1243,  1244,  1247,
    1242,     1,     0,  1219,  1220,  1213,     0,     0,   475,   270,
       0,     0,     0,     0,     0,     0,   369,   370,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   364,     0,   367,
       0,     0,   363,   365,   366,   368,     0,   265,     0,   264,
     305,   262,   474,     0,   359,   371,     0,   373,   380,   385,
     391,     0,   400,   409,   414,   419,   424,   427,   430,   447,
       0,   513,   512,   516,   518,   525,   534,   539,   548,   561,
     566,   571,   576,   579,   582,     0,   271,   296,   297,   298,
     299,     0,     0,     0,     0,     0,   699,   944,   914,   913,
       0,   958,     0,   896,   960,   734,   737,   208,   230,   229,
     228,   237,     0,   264,   371,   430,   632,   516,     0,   220,
     205,   253,     0,     0,   252,   259,     0,     0,  1099,  1100,
     712,     0,   176,     0,   179,   180,     0,     0,     0,     0,
       0,   183,   250,     4,     0,     0,     0,     0,    28,    30,
     164,   186,   189,     0,   190,     0,   115,   118,     0,   196,
     127,     0,   165,   139,     0,   174,     0,   197,   200,     0,
       0,   264,     0,     0,     0,     0,   966,   694,     0,    12,
      18,     0,   837,   836,   844,   838,     0,   840,   842,   765,
     849,   848,   254,   260,   251,     0,     0,   243,   242,   683,
     644,   647,   682,   686,   672,     0,     0,     0,     0,   223,
     224,   225,   226,     0,   218,   475,   771,     0,     0,   768,
     475,   770,     0,     0,   475,   772,     0,     0,     0,   963,
       0,   962,     0,   996,     0,     0,  1205,  1209,  1003,  1106,
       0,     0,  1107,   900,     0,   264,   633,     0,     0,     0,
       0,   652,   651,   653,     0,   756,     0,     0,     0,  1012,
     819,   895,   813,   823,   815,   817,   821,   694,   946,   945,
       0,     0,     0,   905,     0,     0,   904,     0,     0,     0,
    1044,     0,   902,   903,   964,   965,     0,     0,  1115,  1103,
    1114,    75,  1112,  1101,   895,   803,   809,   805,   807,   811,
     694,     0,  1116,  1113,  1104,     0,  1118,     0,  1206,  1210,
    1119,     0,     0,     0,     0,     0,     0,     0,     0,  1203,
       0,     0,     0,  1046,     0,     0,     0,   156,  1048,  1049,
       0,     0,     0,   264,     0,   371,     0,     0,   516,   611,
     618,     0,  1123,  1126,  1054,  1045,  1058,     0,     0,     0,
       0,  1145,  1143,  1047,  1060,     0,  1061,  1052,  1059,     0,
    1062,  1142,     0,     0,  1225,   895,     0,     0,     0,  1235,
       0,     0,  1211,  1249,     0,     0,     0,   917,   489,     0,
       0,   323,     0,   361,   355,   515,   514,   508,     0,   350,
     503,   351,   504,     0,   884,   874,   882,   876,   878,   880,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   274,     0,     0,     0,   788,   784,   786,   790,  1006,
       0,   272,     0,   301,     0,   342,     0,   341,     0,   477,
      92,     0,   476,     0,   313,   314,     0,     0,     0,   457,
     458,   459,   460,   461,   462,   463,   464,   465,   466,   456,
       0,     0,   353,   506,   352,   505,     0,     0,     0,     0,
       0,     0,     0,   392,   540,     0,     0,   390,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   716,     0,
     321,   322,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   717,   718,     0,     0,
       0,  1264,  1265,     0,     0,     0,   959,     0,    10,     9,
       0,     0,     0,     0,     0,   694,   945,   206,     0,   208,
       0,   264,     0,     0,   856,   850,   852,   854,     0,     0,
       0,    16,    20,     0,     0,     0,     0,     0,     0,     0,
       0,   364,     0,   264,     0,    26,    21,    27,    24,     0,
      25,    23,    22,    29,    31,   163,   187,    82,   162,   188,
     121,   172,     0,     0,     0,     0,   131,     0,     0,   133,
       0,     0,   142,   175,   201,   198,   203,   202,   199,   204,
     114,     0,     0,   161,     0,   895,   752,     0,   971,   694,
       0,    11,    17,   742,   908,  1014,     0,     0,   968,     0,
     967,     0,     0,   184,   170,   191,   194,     0,   195,     0,
     171,   895,     0,     0,   652,   651,   845,   839,   841,   843,
       0,     0,     0,   649,   685,     0,     0,     7,   213,   209,
     221,   767,     0,     0,    61,    52,    91,    38,    37,    56,
      68,    44,    47,     0,    73,    55,     0,     0,     0,   985,
     987,     0,   984,   986,     0,    40,    43,   964,   965,   475,
       0,   976,   979,   995,   998,  1204,  1208,  1000,  1004,  1001,
    1005,   899,   897,   898,  1041,  1023,  1032,   657,   656,     0,
       0,   475,   757,     0,     0,   475,   758,     0,     0,   928,
     895,     0,     0,     0,     0,     0,   920,     0,     0,     0,
    1013,   949,   948,     0,     0,   947,  1017,  1016,     0,   889,
    1040,   892,  1026,  1034,     0,   888,  1039,   891,  1024,  1033,
       0,  1043,  1037,   893,  1019,  1029,     0,  1038,   894,  1021,
    1030,     0,     0,     0,    76,     0,  1102,  1120,     0,     0,
       0,     0,     0,     0,  1185,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1046,     0,   264,     0,  1183,  1051,
    1053,     0,     0,  1193,  1194,  1195,     0,  1201,     0,     0,
       0,     0,     0,     0,   157,   143,  1057,  1056,  1055,     0,
       0,     0,   619,     0,   475,  1050,     0,     0,     0,     0,
     470,     0,     0,   475,     0,     0,     0,     0,  1124,  1127,
    1129,     0,  1125,  1128,  1130,     0,  1156,  1063,  1226,  1227,
     241,   240,     0,     0,     0,  1209,  1210,     0,  1109,     0,
     796,   264,     0,   507,   798,   792,   794,   800,  1008,     0,
     491,   490,     0,   331,   332,     0,     0,     0,     0,   339,
     340,     0,     0,     0,     0,     0,     0,     0,     0,   885,
     875,   883,   877,   879,   881,   694,   952,   951,     0,   870,
     860,   868,   862,   864,   866,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   263,     0,
     789,   785,   787,   791,  1007,     0,     0,   475,     0,     0,
       0,   104,     0,   300,   475,     0,     0,    93,   475,     0,
       0,   478,   312,   475,   308,   346,   480,   481,   345,   484,
     311,     0,     0,   452,   448,   302,   374,   519,   375,   520,
     376,   521,   475,   381,   526,   475,   382,   528,   386,   535,
     387,   536,   394,   542,   395,   543,   393,   541,   475,   405,
     557,   401,   549,   475,   406,   558,   402,   550,   412,   564,
     410,   562,   417,   569,   415,   567,   422,   574,   420,   572,
     425,   577,   428,   580,   607,     0,   628,     0,     0,     0,
       0,   454,   450,   479,   320,   475,   317,     0,   485,   488,
     319,     0,     0,   453,   449,   377,   522,   378,   523,   379,
     524,   475,   383,   530,   475,   384,   532,   388,   537,   389,
     538,   398,   546,   399,   547,   396,   544,   397,   545,   475,
     407,   559,   403,   551,   475,   408,   560,   404,   552,   413,
     565,   411,   563,   418,   570,   416,   568,   423,   575,   421,
     573,   426,   578,   429,   581,   608,     0,     0,     0,     0,
     455,   451,     0,     0,  1257,  1260,     0,     0,  1255,  1266,
    1267,     0,     0,   208,   236,   235,   234,   264,   238,   233,
     232,   231,     0,     0,     0,     0,     0,     0,     0,     0,
     948,   245,     0,   244,   126,     0,   124,   857,   851,   853,
     855,     0,    15,    19,     0,   178,   177,   181,     0,   971,
     694,     0,   138,     0,   136,   857,     0,   264,     0,    83,
     116,   119,   117,   120,   128,   129,   130,   132,   140,   141,
     113,   111,   112,    13,   744,   747,     0,   160,     0,   973,
       0,   972,     0,     0,   743,   895,   909,   969,   970,   895,
     169,   192,   168,   193,   167,     0,     0,     0,     0,     0,
     645,   646,   648,     0,     0,   675,   671,     0,     0,     0,
       0,     0,     0,   227,   219,   217,    35,    36,    74,    53,
       0,    54,     0,    63,    60,    71,    66,    72,    59,    89,
      38,    69,    62,    90,    58,    70,    67,     0,    57,     0,
      32,    34,    33,   988,   989,     0,   665,   655,     0,   660,
     654,     0,   919,   929,   930,   923,   921,   922,   950,   931,
       0,     0,   924,     0,     0,     0,  1027,  1035,  1014,  1025,
    1020,  1022,  1031,   738,   739,   740,   475,     0,     0,  1087,
    1092,     0,     0,  1088,  1094,     0,     0,     0,     0,   475,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1182,   475,     0,  1146,   264,
       0,     0,     0,  1192,  1198,  1199,  1196,  1197,     0,     0,
       0,     0,   144,  1084,  1089,   158,   475,   616,   612,     0,
       0,     0,   475,   468,   620,   475,   617,   614,   475,   469,
     621,     0,  1208,  1110,     0,     0,   354,   797,   799,   793,
     795,   801,  1009,     0,   492,   330,   475,   326,   494,   495,
     498,   329,     0,     0,   493,   338,   475,   335,     0,   499,
     502,   337,     0,     0,   293,   291,     0,     0,   935,     0,
       0,     0,     0,     0,     0,   955,   954,     0,   953,     0,
       0,     0,   871,   861,   869,   863,   865,   867,     0,   267,
       0,   266,   295,     0,     0,     0,     0,     0,     0,  1271,
       0,     0,     0,   372,   517,   273,   107,   105,   344,   343,
      98,   102,   309,     0,   310,   306,   307,   629,     0,     0,
       0,     0,     0,     0,   318,     0,   315,   316,     0,     0,
       0,     0,  1259,  1258,  1262,     0,     0,     0,  1254,  1253,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,   122,   125,     0,     0,   173,   973,     0,   972,     0,
       0,   134,   137,     0,    14,   475,     0,     0,   753,     0,
     974,   975,   745,   748,   910,   185,   166,   846,     0,   247,
     246,     0,   674,     0,   214,   207,   215,   210,   211,   222,
      50,    45,    48,    51,    46,    49,    36,    42,    39,    41,
       0,     0,   992,   993,   664,     0,   659,     0,   932,   933,
     926,   925,   927,  1011,  1010,    78,  1085,  1090,  1086,  1091,
       0,     0,     0,     0,   475,  1159,     0,   475,     0,  1158,
    1191,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1166,     0,  1147,   475,  1148,   475,     0,     0,
       0,  1069,   917,  1069,     0,     0,   154,     0,     0,     0,
     159,     0,     0,   509,   327,     0,   328,   324,   325,   336,
       0,   333,   334,   292,   886,   934,   936,   937,   277,   278,
       0,   956,   938,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   268,   281,   282,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   475,   348,   347,   472,
     630,   439,   599,   431,   583,   443,   603,   435,   591,   473,
     631,   440,   600,   432,   584,   444,   604,   436,   592,   475,
     441,   601,   433,   585,   445,   605,   437,   593,   442,   602,
     434,   586,   446,   606,   438,   594,  1261,  1263,  1256,   858,
       0,   123,   149,   974,   975,     0,   135,    85,     0,     0,
     847,     0,     0,     0,     0,     0,     0,     0,     0,   990,
     991,   980,     0,     0,     0,     0,  1149,  1150,  1153,  1154,
    1157,  1190,     0,     0,     0,     0,     0,     0,     0,  1163,
     475,   475,     0,     0,     0,  1067,     0,  1065,  1077,     0,
    1069,     0,  1069,     0,     0,     0,     0,   511,   510,   475,
     475,   887,   939,   940,   275,   276,   872,   285,   286,     0,
       0,     0,     0,     0,   279,   280,   289,   290,     0,     0,
     294,  1269,  1270,  1268,   859,     0,   746,   749,   751,   750,
       0,     0,   216,   212,   982,     0,     0,     0,     0,     0,
       0,     0,  1178,  1161,     0,     0,  1162,  1175,     0,  1165,
    1177,     0,     0,  1069,     0,  1069,     0,  1069,     0,  1070,
       0,     0,     0,   147,     0,   152,     0,   155,     0,   873,
     283,   284,     0,     0,   977,   287,   288,   182,  1151,  1152,
       0,     0,  1160,  1167,     0,  1164,  1176,  1081,  1068,     0,
       0,     0,  1078,     0,     0,  1069,  1069,     0,  1069,   146,
     145,   150,   148,     0,     0,   372,   517,   269,   978,     0,
       0,  1066,     0,     0,  1069,  1074,     0,     0,  1071,     0,
       0,   153,  1168,  1082,  1083,  1079,     0,     0,     0,     0,
    1069,   151,     0,  1075,  1076,  1072,     0,  1080,     0,  1073
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,   179,    47,    48,   888,   296,   394,   395,   396,   397,
     398,   399,   400,   401,   897,   898,   899,   900,   901,   902,
     903,   904,   905,   906,   907,   908,   222,   223,   402,   403,
      50,   297,   298,   673,   701,   406,   407,   408,   409,   410,
     411,   412,   413,   414,   415,  1982,  1983,  1984,   416,   580,
     581,   582,   417,   418,   419,   420,   357,   358,   459,   359,
     460,   360,   461,   462,   780,   361,   362,    51,    52,    53,
      54,    55,   299,   300,   301,   909,   910,   302,   303,   632,
     676,  1167,   304,   585,   634,   306,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   662,
     755,   587,  1228,   321,   635,   322,   588,   637,   324,   325,
     326,   327,   328,   329,   330,   331,   332,   333,   334,   589,
     590,  1017,  1230,   369,   498,   181,    57,   451,   452,   182,
      59,   183,   184,    60,    61,    62,    63,    64,    65,   185,
     109,   186,   228,   846,   847,   187,   188,   189,    69,    70,
      71,    72,    73,   190,   669,  1088,   370,   424,    75,    76,
     441,   442,   789,  1125,   650,   951,   952,    77,   425,    79,
     426,   115,   110,    81,   518,  1116,   428,   520,  1118,   118,
     429,   430,   853,  1443,  1444,   915,   916,  1445,   164,   165,
     166,   167,   670,  1089,   194,   195,   196,   197,   198,   199,
     592,   593,  1905,  1906,   594,   595,   596,    84,   431,   232,
      85,    86,   233,   234,   235,   599,   600,   601,   602,   236,
     603,   809,  1512,  1019,   606,   607,   608,  1020,   610,    87,
      88,   336,    89,    90,    91,    92,    93,    94,   761,  1305,
    1306,   762,   763,   337,   338,   339,   340
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1590
static const int yypact[] =
{
   34238, -1590, -1590, -1590, -1590,   463, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
     770,   107, -1590, -1590, -1590, -1590, -1590, -1590,    84,   190,
     295,   372,   141,  1188,  1236, -1590, -1590, -1590,   312, -1590,
     218,   372,   870, -1590,   887,   311,  1166, -1590,   378, -1590,
    1215, -1590,   319, -1590, -1590, -1590, -1590, -1590,  1221, -1590,
    1233,   334, -1590,   361,   729, 33886,  1236,   290, 34500, -1590,
     904, -1590,  1001, 36620, 32417, -1590, -1590, -1590, -1590, -1590,
   -1590, 34326, 33525,   557, -1590,   107, -1590, -1590,   141,   141,
     569,   507,   141, 26501,   372, -1590, -1590,   573, -1590,  1188,
   -1590, -1590, -1590,   290, -1590, -1590,   904,  1001,  1242, 20474,
   -1590,   556,   527,   570, 27664, 36136, -1590, 27780, -1590, -1590,
   -1590,   372, -1590,  1411,  1351,  1389,   163, 36136, -1590, 36282,
   27896, 36136, 28012, -1590, 28128, -1590, -1590, -1590, -1590, -1590,
   -1590, -1590,   311,   628, -1590, -1590, -1590, -1590, -1590,   712,
     904,  1001,  1004, 36620,   209, -1590,  1388,   562,  1396, -1590,
   24530,   581, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
     823, -1590,   871, -1590,   568, -1590, -1590,   657, -1590,   687,
     899,  7616,   458,   723, -1590, -1590,   802,   859,   704,   744,
   -1590,   322, -1590,   322, -1590, -1590, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,   731,   786,
   -1590, -1590,    70,    38, -1590, -1590, -1590, -1590, -1590, -1590,
   -1590, 34062, -1590, 15586, 32887, 36803, 15715, -1590,   795,   930,
     915, -1590, -1590,   311, 33974, -1590, -1590, -1590, -1590, -1590,
   -1590, -1590,   319,   361, 34848, 36620, 35107, -1590, -1590, -1590,
   -1590, -1590,   805,   569,   569, -1590, 26501,   379, -1590, -1590,
   26574, 26647, 26647,   912, 36355, 26501, -1590, -1590,   926,   949,
   36355, 26501,   956,   965,   982,   992,   997, -1590, 20698, -1590,
     141, 24603, -1590, -1590, -1590, -1590,   908, -1590,   158,   995,
   -1590, -1590, -1590, 10895, -1590,  1416, 24603, -1590,   586,  1154,
    1395, 26501,  1088,  1465,  1018,  1019,   985,  1163,    80,  1416,
    1057,   811, -1590,  1416, -1590,   941,  1359,  1555,  1176,  1571,
    1067,  1105,  1119,  1245,   109,  1416,   569, -1590, -1590, -1590,
   -1590,  1151,    99, 35532,  1152,  1172, -1590, -1590,   290, -1590,
    1001, -1590,   322, -1590, -1590,   926,   908,  1189, -1590, -1590,
   -1590, -1590,  1036,  1097, -1590,   235, -1590, -1590,   275, -1590,
   36524, -1590, 20586, 36282, -1590,   929, 35844, 35192, -1590, -1590,
     926,  1202, -1590,   372, -1590, -1590,   107, 35277, 35022,  5665,
   36209, -1590, -1590,   908,   944,  1243,  1243,  1021, -1590,  1304,
   -1590, -1590,  1312,   180,  1153,   223, -1590, -1590,   477,  1315,
   -1590,  1326, -1590, -1590,    45, -1590,  1401, -1590, -1590, 27200,
   27316,   252,   903,   811, 32605, 34587, -1590,   904,  1001, -1590,
   -1590, 32511, -1590, -1590,  1354, -1590,   372, -1590, -1590, -1590,
     372, 36355, -1590,   929, -1590, 27432, 27548,  1392,  1412, -1590,
    1413, -1590,  1422, -1590, -1590,   791,  1414,   694,   107, -1590,
   -1590, -1590, -1590,   747,   159,  1063, -1590, 28244, 28360, -1590,
    1148, -1590, 28476, 28592,  1191, -1590, 28708, 28824, 18810,  1094,
    1001,   712,   322, -1590, 24676, 32887, -1590,   795, -1590, -1590,
    1236,  1236, -1590, -1590,  1426,   131, -1590,  1430,  1472, 35917,
    1524,  1470,  1485, -1590, 28940, -1590, 29056,  8275, 24749,  1236,
   -1590,   823, -1590, -1590, -1590, -1590, -1590,    83,   515,   184,
     544,   468,  1489, -1590, 35619,  1496, -1590, 35694,  1499, 35769,
    1503, 35990, -1590, -1590, -1590, -1590, 26501,   372, -1590, -1590,
    1513, -1590, -1590, -1590,  1515, -1590, -1590, -1590, -1590, -1590,
     904,  1425,   562, -1590, -1590,  1520, -1590, 15844, -1590,   795,
   -1590,   302, 24822,  1516,  1530,  1534,    62, 15973,  1539,   107,
    1540,  1541, 16102, 34150,  1251,  1542,  1546,   107, -1590, -1590,
    1547,  1549,  1551,  1424, 14291,  1416, 14425,  7254,  1416,  1416,
   -1590, 14554, -1590, -1590, -1590, -1590, -1590, 16231, 16360, 16489,
   16618, -1590, -1590, -1590,   795, 16747, -1590, -1590, -1590, 16876,
   -1590, -1590,   141,   141,   569,   602,   372,  1428,  1544, -1590,
   36620, 32887, -1590, -1590, 34935, 26501,  1556, -1590, -1590, 20826,
     248, -1590, 11046, -1590, -1590,   880, -1590, -1590, 24895, -1590,
   -1590, -1590, -1590, 36355,  1560, -1590, -1590, -1590, -1590, -1590,
   32033, 36355, 20954,   107, 32129, 36355, 26501,   141,   141,   141,
   26501, -1590, 11182, 11343, 11477, -1590, -1590, -1590, -1590,  5854,
    1552,    85, 18938, -1590,   281, -1590,   236, -1590, 19066,  1563,
   -1590, 19194, -1590,  1543, -1590, -1590,  9505,  1550, 26501, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
   24603,   286, -1590, -1590, -1590, -1590, 26501, 26501, 26501, 26720,
   26793, 26501, 26501,  1395,  1555, 26501, 26501, -1590, 26501, 24968,
   25041, 24603, 24603, 24603, 26501, 26501, 11611, 24603, -1590,  1554,
   -1590, -1590, 22267,  1557, 26501, 24603, 26501, 26501, 26501, 26866,
   26939, 26501, 26501, 26501, 26501, 26501, 26501, 25114, 25187, 24603,
   24603, 24603, 26501, 26501, 11745, 24603, -1590, -1590,   674,   823,
   36209, -1590, -1590, 33613, 35532, 35532, -1590, 20474, -1590, -1590,
   20474, 20474, 24603, 24603, 31368,   521,   793, -1590,   702,   262,
     848,   914,   864,  1553,  1568, -1590, -1590, -1590,   372,  8113,
   35192, -1590, -1590,   107,  1558,  1567,  1569, 32793,  1564,   107,
   31937,  1188, 21066,  1059, 35362, -1590, -1590,   795, -1590,   795,
   -1590, -1590, -1590,   795, -1590, -1590,  1572, -1590, -1590,  1103,
   -1590, -1590,  3269,  3269,  1243,  1243, -1590,  1243,   141, -1590,
    1243,  1243, -1590, -1590,  1034, -1590, -1590,  1034, -1590, -1590,
    1115, 25260,  1234, -1590, 26501,   631, -1590,  1446,   290,   904,
    1001, -1590, -1590,   244,   581,  7616, 18682,   639, -1590,   322,
   -1590,   322,  1236, -1590, -1590, -1590,  1574,   300,  1580,   305,
   -1590,   252, 32699, 20474, -1590, -1590,  1582, -1590, -1590, -1590,
   36282, 36282, 26501,   107, -1590, 31028,   201, -1590,   763,   836,
    1545, -1590, 36282,   107, -1590, -1590, -1590,  1243, -1590, -1590,
   -1590, -1590, -1590, 32979,  1447, -1590, 19322, 36712, 19450, -1590,
   -1590, 10698, -1590, -1590, 35447, -1590, -1590,   712,  1094, -1590,
   25333, -1590, -1590, -1590, -1590, -1590,   795, -1590, -1590, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,  1422,   261,
     296,  1578, -1590, 29172, 29288,  1579, -1590, 29404, 29520, -1590,
     927,   268,   519,  1585,  1591,  1592, -1590,  1562,  1583,  1586,
    1126,   515,   184, 34674, 25406,   515, -1590, -1590, 36063, -1590,
   -1590,   823, -1590, -1590, 36063, -1590, -1590,   823, -1590, -1590,
   36063, -1590, -1590,   823, -1590, -1590, 36063, -1590,   823, -1590,
   -1590,  1593,  1598,   351, -1590, 19578, -1590, -1590, 17005,  1566,
    1597, 17134, 26501, 26501, -1590, 25479, 25552,  1600,  1601,  1607,
   21153,  1610,   107, 22340, -1590,  1444,  1449, 22413,  1656, -1590,
   -1590, 22486,  1608, -1590, -1590, -1590,  1609,  1612, 22559, 14683,
     141,  1616, 26501, 26501,   107, -1590, -1590, -1590, -1590, 21281,
     354, 25625, -1590,  1336, -1590, -1590, 27012, 11879, 12013, 25698,
   -1590, 27085, 12147,  1520, 17263, 17392, 17521, 17650, -1590, -1590,
   -1590, 17779, -1590, -1590, -1590, 17908, -1590, -1590,   569,   569,
    1619,  1627, 31143, 31258, 32887, -1590, -1590,  1623, -1590,   923,
   -1590,   252,  1626, -1590, -1590, -1590, -1590, -1590,  5854,  1630,
    1563, -1590,  1570, -1590, -1590, 22632,  1573, 26501,  1576, -1590,
   -1590, 22705,  1577, 26501,  1632, 36428, 20474, 34413, 26501,  1637,
   -1590, -1590, -1590, -1590, -1590,   484,  1636,  1640,  1631,  1643,
   -1590, -1590, -1590, -1590, -1590, 32225, 22778,  1646,  1647,  1650,
   26501,  1645, 32321,  1657,   497,   103,   194,  1658, -1590,   107,
   -1590, -1590, -1590, -1590, -1590, 26501,   141,   330, 33070, 19706,
    1655, -1590, 24603, -1590,   337, 33161, 19834, -1590,   338, 33252,
   19962, -1590, -1590, -1590, -1590, -1590,  1074,  1663, -1590, -1590,
   -1590, 22851,  6163, -1590, -1590,  1655, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590,   586,   941, -1590,   586,   941,  1154,  1359,
    1154,  1359,  1395,  1555,  1395,  1555,  1395,  1555, -1590, -1590,
   -1590,  1088,  1176, -1590, -1590, -1590,  1088,  1176, -1590, -1590,
    1465,  1571, -1590, -1590,  1018,  1067, -1590, -1590,  1019,  1105,
     985,  1119,  1163,  1245, -1590,    34, -1590, 22924,  1660,  8972,
    1661, -1590, -1590, -1590, -1590, -1590, -1590,  1111, -1590, -1590,
   -1590, 22997,  9959, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
   -1590, -1590,   586,   941, -1590,   586,   941,  1154,  1359,  1154,
    1359,  1395,  1555,  1395,  1555,  1395,  1555,  1395,  1555, -1590,
   -1590, -1590,  1088,  1176, -1590, -1590, -1590,  1088,  1176, -1590,
   -1590,  1465,  1571, -1590, -1590,  1018,  1067, -1590, -1590,  1019,
    1105,   985,  1119,  1163,  1245, -1590, 23070,  1662, 10351,  1664,
   -1590, -1590,   107,   107, -1590, -1590,   371,  1180, -1590, -1590,
   -1590, 33704, 33795, -1590, -1590, -1590, -1590,   974, -1590, -1590,
   -1590, -1590, 23143,  1665, 21537,  1666, 23216,  1667, 21610,  1668,
     793, -1590, 20474, -1590, -1590, 20474, -1590,    59, -1590, -1590,
   -1590,   585, -1590, -1590,   435, -1590, -1590, -1590,  1466,  1654,
     904,  1001, -1590,  1671, -1590,   643,   617,  1055,  1677, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590,   569, -1590, -1590,
    3806, -1590, -1590, -1590, -1590, -1590, 20090, -1590,   660,   290,
     322,   290,   322, 26501, -1590,   844, -1590, -1590, -1590,  1678,
   -1590,  1572, -1590,  1563, -1590,  1477,   934, 20474,   986,  1085,
   -1590, -1590, -1590, 29636, 29752,  1679, -1590,  1397, 36355, 36355,
   36355, 36355, 26501, -1590, -1590, -1590, -1590,   795, -1590, -1590,
   25771, -1590, 25844, -1590, -1590, -1590,  1480,  1447, -1590, -1590,
    1243, -1590, -1590, -1590, -1590, -1590,  1480,  1447, -1590, 25917,
   -1590, -1590, -1590, -1590, -1590, 18037, -1590, -1590,   142, -1590,
   -1590,   217, -1590, -1590, -1590, -1590, -1590, -1590,   515, -1590,
    1683,  1684, -1590,  1674,  1682,  1685, -1590, -1590,  7616, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590,   347, 33343, 20218, -1590,
   -1590, 21281, 21281, -1590, -1590, 23289, 14812, 23362, 23435, -1590,
   21409, 23508, 14941, 21153,  1689,  1690, 21153, 26501, 25990,  1722,
   23581,  1612, 10136,   141, 21153,  1692, 31748, 21153, -1590,  1479,
   23654, 21683, 23727, -1590, -1590, -1590, -1590, -1590,    95,   141,
    1695,  1175, -1590, -1590, -1590, -1590, -1590, -1590, -1590,  1700,
    1701,   107, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
   -1590, 36282, -1590, -1590,  1702,  1703, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590, 12281, -1590, -1590, -1590, -1590,  1274,  1705,
   -1590, -1590, 23800, 21756, -1590, -1590, -1590, -1590,  1334, -1590,
   -1590, -1590, 23873, 21829, -1590, -1590,  1706,  1142, -1590,  1707,
    1709,  1711,  1704,  1710, 20474,  1636,  1640, 34761,  1636, 26501,
   20474, 26501,  1669, -1590, -1590, -1590, -1590, -1590,  1691, -1590,
   26063, -1590, -1590,  1712,  1713, 26501, 26501,  1708,  4570, -1590,
     107,   107, 26501, -1590, -1590,   569, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590, 12415, -1590, -1590, -1590, -1590, 26136, 12549,
   12683, 26209, 12817, 12951, -1590, 13085, -1590, -1590, 13219, 13353,
   13487, 13621, -1590, -1590, -1590,   674,  1714,   560, -1590, -1590,
   24603, 24603, 24603, 24603, 24603, 24603, 24603, 24603,  1781,  1207,
   20474, -1590, -1590,  1716,  1243, -1590,  1654,   322,  1654,   322,
    1717, -1590, -1590,  1719, -1590,   348, 33434, 20346, -1590,   904,
     290,   290,  1718,  1720, -1590, -1590, -1590, -1590,  1250, -1590,
   -1590, 31028,  1725, 31028, -1590, -1590,  1727, -1590,  1730, -1590,
    2691, -1590, -1590,  2691, -1590, -1590, -1590,  2691, -1590, -1590,
   18166, 18295, -1590, -1590, -1590, 31028, -1590, 31028, -1590, -1590,
   -1590, -1590, -1590, -1590,  1126, -1590, -1590, -1590, -1590, -1590,
   21153,  9138, 21153,  9138, 31463, -1590, 21281, -1590, 15070, -1590,
   -1590, 21153, 21153, 23946, 21153, 24019, 10527,  1715, 21902, 24092,
     117, 18424, -1590, 26501, -1590, 31558, -1590, 31843, 21153, 21975,
   26282,   141,  1732,   141,   195,  1731, -1590,   107, 26501, 26501,
     107, 13755, 13889, -1590, -1590, 14023, -1590, -1590, -1590, -1590,
   14157, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,
    1255,  1636, -1590,  1738,  1739,  1733,  1735,  1273,  1736,  1740,
   20474, 26501, 20698, 25333, -1590, -1590, -1590,  1741,  1742,  1743,
    1744, 26501,  1749,  1750,  1756,  1757, -1590, -1590, -1590, -1590,
   -1590, -1590, -1590, -1590,   275, -1590, -1590, -1590,   275, -1590,
   -1590, -1590, -1590, -1590,   275, -1590, -1590, -1590,   275, -1590,
   -1590, -1590, -1590,   275, -1590, -1590, -1590,   275, -1590, -1590,
   -1590,   275, -1590, -1590, -1590,   275, -1590, -1590, -1590, -1590,
    1275, -1590, -1590,  1654,  1654, 24603, -1590, -1590, 26501, 26501,
   -1590, 29868, 29984, 31028, 30100, 30216, 36355, 36355, 18553, -1590,
   -1590, -1590, 30332, 30448, 30564, 30680,  1761,  1762, -1590, -1590,
   -1590, -1590, 21153, 26501, 26355,  1732, 15199, 15328, 22048, -1590,
   31653, -1590, 21281, 24165, 15457, -1590,  1069,   606, -1590,   280,
     141,  1764,   141,   423,   546,  1775,  1349, -1590, -1590, -1590,
   -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590, -1590,  1290,
    1765,  1766,  1778, 22121, -1590, -1590, -1590, -1590,  1769,  1772,
   -1590, -1590, -1590, -1590, -1590,  1782, -1590, -1590, -1590, -1590,
   30796, 30912, -1590, -1590, -1590, 21153, 21153, 24238, 22194, 21153,
   24311, 10527,  1783, -1590, 21153, 26501, -1590, -1590, 21281, -1590,
   -1590,  1786,   141,   141, 26501,   141,  1790,   141,  1206, -1590,
     326,  1243,   625, -1590,   343, -1590,  1737, -1590,   107, -1590,
   -1590, -1590, 26428, 24384, -1590, -1590, -1590, -1590, -1590, -1590,
    1783, 21153, -1590, -1590, 24457, -1590, -1590, -1590, -1590,  1350,
    1793,  1352, -1590,  1260,  1794,   141,   141,  1796,   141, -1590,
   -1590, -1590, -1590,   423,   655, -1590, -1590, -1590, -1590, 21153,
    1797, -1590,  1802,  1804,   141, -1590,  1374,  1381, -1590,  1262,
     714, -1590, -1590, -1590, -1590, -1590,  1382,  1805,  1806,  1808,
     141, -1590,  1810, -1590, -1590, -1590,  1384, -1590,  1811, -1590
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
   -1590,  2678,   -19,    58, -1590,  1803, -1590, -1590, -1590, -1590,
   -1590, -1590,  1487,  1498,  -864, -1590,  -856,  -870,   183,   187,
    -839,  -655,  -588, -1590,  -543,  -524, -1590, -1590,  1500,  1501,
   -1590,  2621,  1289, -1590,  -197,   792,   800, -1590, -1590, -1590,
   -1590,  1502, -1590, -1590, -1590,  -570, -1589,  -168, -1590, -1590,
   -1590, -1590,  1688,  1779,  -124,   -74,  -126,  -746, -1590,  -743,
   -1590,  -706, -1590,  1016,   -46,  1165,  -865,    23,  1694,    74,
    1698,   -35,     0, -1590,  1676,  8083,  1687, -1590,  3306, -1590,
    -614,  -703,  1693,  4210, -1590, -1590,  -223,   269,   537,   -97,
   -1590,   726,  -576,    87,    57,    92,   100,  2380,  3897,  2799,
    -218,  8800,   122,  2176, -1590,  1697,  4723, -1590,  -185,   629,
     647,   251,   730,   221,   298,   395,   411,   450,  3515,   693,
    -381,  8300,   453,    47,   520,  6416,   -61,  1054,  -109,  1680,
    7805,  6959, -1590, -1590, -1590,   -68,   -60,   -65, -1590,  5833,
   -1590,   272,  1865,   561,  -457,  2689,  7115, -1590,  8253, -1590,
   -1590, -1590,   -45,  3532, -1590, -1590,  3913,  2524,     5, -1590,
   -1590,  1387,  1561,  1283,  1673,   -56,   -31,  6570,  5956,  6619,
    -315,   -84,  2756,  1101,  -508, -1053,  9765,  -264,  -566,   -16,
     358,  -247,  1027,  -472,  -458,  -836,  -822,   154,  1134,  1136,
     -59,  1729,  -650, -1590,  -302,  -292,  1533, -1590,  -503,  -501,
    8441,  -366,   -10,  -717, -1590, -1590, -1590,  1874, -1590,   102,
    1885,   -30,   110,  -108,  1734,  1032,  1035, -1590, -1590, -1590,
     -82,   620, -1455,  -188, -1590, -1590, -1590,   646, -1590,  1887,
     -11,    69,  1880,  1548, -1590, -1590, -1590,  1890,  -729,   331,
   -1590,  -721,   884, -1590, -1590, -1590, -1590
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1252
static const short int yytable[] =
{
      56,   237,  1127,   445,   954,  1371,   955,  1034,  1396,   961,
     156,   965,   923,   458,   154,   155,   467,   168,   472,  1372,
     476,  1314,   192,   252,  1315,  1319,   924,   455,  1320,  1238,
      99,   101,   121,   351,  1309,  1627,  1425,  1431,  1435,   540,
     152,   106,  1310,  1430,   112,  1749,   253,   193,   605,   243,
    1424,   123,  1434,   446,   246,   485,   132,  1760,   135,   162,
     162,  1316,  1585,  1004,  1588,  1321,   468,  1426,   473,  1436,
     477,   538,  1166,   248,   146,   153,   112,   351,   180,   131,
     112,   486,   112,   704,    56,   341,     1,   700,  1131,   244,
     265,    56,    56,   463,   674,   262,   254,   725,  1761,   100,
     265,   727,     1,   922,   342,   735,   777,   345,   265,   122,
       1,   107,   858,   860,   830,   831,   112,   112,  1237,   363,
    1761,   705,   265,   132,   421,   434,   753,   421,   597,  1148,
     792,   448,   145,   450,     1,  1155,   450,   434,  1159,   464,
     421,   434,   421,  1714,   421,  1210,    97,   621,  1149,   151,
    1414,   494,   558,   132,  1156,  -471,   541,  1160,   242,   679,
     112,   112,  -207,   832,   453,   251,     1,   263,   264,  1660,
     495,   267,   551,  1281,  1005,   521,   131,   852,  1661,   156,
     132,   816,   502,   154,   155,   539,   252,     1,   252,   447,
     146,   511,    43,   154,   155,   507,   102,   935,  1910,   265,
     265,   112,  1405,   112,     1,  1146,   508,   936,  1762,   253,
     488,   253,   757,   726,   713,   162,  1763,   497,  1716,   619,
    1610,   243,   972,  1344,   819,   978,   246,   984,   162,   989,
    1895,   544,   973,  1059,  1063,   979,   583,   985,  1763,   990,
     613,  1577,   754,   953,   615,   248,   779,   458,   145,  1090,
     681,  1427,   725,  1437,    56,     1,    56,  1715,    28,   883,
    -663,   624,  1446,    32,     1,     1,   766,   961,   965,   522,
      38,   954,    67,   955,   644,   893,   680,   616,  1431,  1435,
     644,   454,  1150,  1975,  1430,  1431,  1435,  1175,   495,  1431,
    1435,  1430,   753,  1434,  1894,  1430,   507,  1449,   817,     1,
    1434,  1391,   103,   553,  1434,  1168,  1393,   508,  1911,   614,
    1436,  1611,   806,   808,   810,   812,  1912,  1436,  1428,  1406,
    1438,  1436,   651,    32,  -999,     1,  -999,   782,   655,  2016,
     623,  -108,  1717,   120,   883,  -658,   556,   560,   -99,  -103,
    1348,   680,   132,   759,   557,   561,     1,   158,   -81,   -88,
     112,  1168,   112,  1152,     1,  1169,    67,     1,    83,   671,
    1153,   129,   130,    67,    67,  1383,   680,  1041,   772,   856,
    1049,   681,   781,   464,     1,     1,   784,   511,   767,  1447,
     943,     1,   947,   795,   265,   524,   796,   759,   784,   803,
     759,   938,  1559,  1976,   193,  2022,   766,  1972,  1569,  1151,
       2,  1977,   169,   925,  1151,  1144,     2,   104,   773,   605,
     605,   605,   605,   170,  1450,  1395,  1981,   554,   817,   421,
     421,   132,   119,   680,   845,   180,     1,   112,   112,   128,
     944,   871,   948,   163,    44,   351,   875,   138,     1,  2017,
     146,   876,    83,  1972,  1525,   421,   421,  2018,  -108,   255,
      83,  2022,  1477,   142,  1458,   -99,  -103,   889,   890,   522,
    1460,  2021,  1461,   515,  1475,   -81,   -88,   421,   421,   967,
    1659,  1478,   421,   421,   162,   162,   421,   421,   820,   143,
     112,  1558,   112,  1176,  1178,  1180,  1644,  1568,  1645,   957,
     112,   112,   627,   960,  1437,   132,  1981,   133,   145,   759,
     450,  1437,   265,   674,   421,  1437,   421,   950,   495,   112,
     953,   132,  1074,  1245,  1247,  1249,   158,   112,   992,   112,
     525,  1177,  1179,  1181,   971,  1341,   158,   977,    67,   983,
     674,   988,  1688,  1791,   858,   860,  1356,   993,   674,   922,
      95,  1579,    28,  1343,  1387,   966,  1388,    32,  1664,     1,
     112,  1246,  1248,  1250,    38,   958,   252,   261,   674,  1598,
     667,  1438,   714,   154,   155,   265,  1607,  1016,  1438,  1022,
    1128,   523,  1438,     1,   265,   524,     1,  1035,   265,   253,
   -1010, -1010,  1309,  1309,    96, -1010,  1319,   556,     1,  1658,
    1310,  1310,   821,    43,   822,   557,  1107,   583,   583,   583,
     583,     2,   163,  1708,  1580,     1,  1581,  1431,  1435,   999,
    1609,   265,   620,  1430,   255,   132,  1071,  1709,  1192,  1194,
       1,  1196,  1434,   266,   511,   852,  1321,   963,     1,  1081,
      43,     1,  1480,   774,     1,  1484,   527,   372,   964,  1436,
     528,  1313,    -8,  1104,   508,  1313,  1261,  1263,  1265,  1267,
    1109,  1119,   495,  1129,  1109,  1119, -1011, -1011,     1,  1985,
    1528, -1011,  1694,     1,  1697,  1534,  1466,  1441,  1537,  1139,
    1540,   371,  1469,  1524,  1070,  1858,  1467,     1,  1470,   491,
     373,  1068,  1069,  1162,  1471,   374,   503,  1170,  1059,  1063,
    1059,  1063,   343,    26,  1472,   706,   515,     1,   499,   556,
     560,  1060,  1064,   238,  1662,     1,  1699,   557,   561,  1061,
    1065,   129,   130,  -911,  1168,   707,   708,     1,  1974,  1790,
    1168,   478,   887,   556,   525,  1797,  1134,  1135,  1136,  1234,
     887,   557,     1,  1240,    28,   791,  1672,   129,   130,    32,
     129,   130,  1364,  1365,   220,  1366,    38,   478,  1368,  1369,
    1376,  1386, -1036,  1660,   458,   458,   529,     2,  1304,   132,
    1307,  1403,  1671,   759,   759,   759,   458,  1317,  2041,    43,
     363,  1317,    44,     1,   180,    97,   504,  1407,   889,   890,
    1218,   844,   851,   487,  1302,  1303,  -911,  1981,   146,  1337,
     511,  -911,   884,  1035,  -684,  1860,   335,   511,  -911,  1353,
    1355,    98,  1357,   528,   759,   505,  1431,  1435,  1289,  1214,
     605,  1404,  1430,   605,   643,  1416,  1220,   532,   729,   730,
     731,  1434,  1458,  1437,  1552,  1222,     1,  -911,  -911,  -911,
    1448,  1451,  2051,  1676,  1398,  1399,   526,  1285,  1436,   521,
     527,  1576,   112,   536,  1291,   132,   145,     1,   144,   112,
     112,   605,  1677,  1293,   559,  1385,   604,   533,   891,   112,
     530,   112,  1389,   496,   892,  -684,   605,   605,   605,   605,
    -684,   132,   845,   363,     1,   622,  1297,  -684,   766,  1408,
     464,   464,   609,   450,  1409,   421,   450,  1098,  1099,  1100,
    1438,  1374,   464,  1415,  1323,  1327,   158,  1367,   537,     2,
    -684,  1086,     1,  -684,   840,   774,   885,     1,   883,  -684,
     683,   684,   685,   611,   112, -1036,   508,  -207,     1,   529,
      97,   625,  1613,   732,   667,  -207,     1,     2,  -890,  1400,
       1,   733,   129,   130,   734,  1929,  -475,  -475,  -475,   450,
     450,  1142,  1211,   421,   421,  1463,   612,   421,   421,   445,
     132,     2,  1410,   129,   130,   674,  1684,  1411,  1812,  1331,
    1614,  1770,   112,   180,   495,   892,  1193,  1195,   759,  1197,
    1282,   132, -1042,  1712,   759,  1333,   531,   132,  1183,  1186,
     759,   892,   620,   132,   335,  -207,   759,  1713,   132,   124,
     500,   125,  1101,   132,  1262,  1264,  1266,  1268,   583,   446,
    1102,   583,   126,  1103,     1,   483,   127,    95,  1252,  1255,
    1016,  1464,  1022,    43,   807,   686,    44,   813,   506,   841,
    1215,  1509,  1437,   687,   643,  -207,   688,   678,   959,  1945,
    1332,  -207,   515,   681,  1522,   643,   129,   130,   652,   583,
    1170,  -475,  -475,  -475,  -890,  1687,  1909,   768,  1286,  -475,
     736,   770,  -475,  1494,   583,   583,   583,   583,     1,   805,
    1545,   653,   515,   220,   922,  1387,  -778,  1388,   656,   515,
     737,   738,   421,   421,   667,    28,   515,   657,    28,   759,
      32,   132,  1000,    32,  1793,  -207,  1794,    38,   759,  1438,
      38,  -207,  1555,   681,   658,  -913,  1561,  1689,  1565,  1518,
     715,   716,  1571,   892,   659,   926,   363,   180,  -207,   660,
    -477,  -477,  -477,    44,   681,  1727,  1729,   723,  1219,  -994,
     484,  -994,  -476,  -476,  -476,  1592,  1740,   515,  1804,  -895,
    1952,  1953,  1592,  -895,  -895,  1221,   811,  -778,  -895,   132,
     220,  -895,  -778,   721,   515,  -895,  1290,   769,  1342,  -778,
     722,  -775,  1932,   770,  -475,  1582,  1060,  1064,  1060,  1064,
    -265,  -265,  -265,  1292,  1061,  1065,  1061,  1065,  -913,     1,
     728,   913,  -778,  -913,   681,  1223,   556,  1603,   681,   724,
    -913,  -778,  1971,     1,   557,    97,  1972,  1622,   743,   744,
    1973,  1623,   749,  1978,  -781,  1980,  1690,  1914,   717,   718,
      28,   496,   892,  1294,  1723,    32,  1313,  1299,  -207,  -913,
    -913,  -913,    38,   771,  -207,  1615,   681,   604,   604,   604,
     604,  1157,  -775,  -477,  1634,  1325,  1329,  -775,  1635,   335,
     851,    26,    18,    19,  -775,  -476,   750,     1,  1879,     1,
    1075,  1076,  1818,   609,   609,   609,   609,  1534,  1188,  1190,
    1540,   751,  1880,  1784,  1818,   496,  2009,  -775,  2011,   770,
    2013,   752,    28,    29,   756,  -781,  -775,    32,   818,  -265,
    -781,   764,  1440,  -265,    38,   129,   130,  -781,  1257,  1259,
     709,   710,  1313,  1696,  1313,  1698,   745,   746,  1766,   129,
     130,   765,  1767,   605,   605,    18,    19,    43,  2036,  2037,
    -781,  2039,  1642,  1643,   605,   767,  1646,   132,    28,  -781,
      28,   759,   759,    32,   793,    32,    28,  2046,  1859,  2014,
      38,    32,    38,  1972,   770,    28,    29,  2015,    38,   922,
      32,   139,  1317,  2056,   136,   363,   137,    38,  1184,  1187,
    -766,  1663,  -766,    43,  1522,    43,    44,  1373,    44,   335,
     112,   112,   140,   335,   141,   353,  1673,   132,  1189,  1191,
    1550,  1870,   220,  1030,  1375,   913,  1921,   770,  1253,  1256,
    1891,   913,   770,  2033,   913,  2049,  1647,  1972,   112,  1972,
     112,  2034,   112,  2050,  1926,   132,  1944,  1774,  1258,  1260,
     770,  1775,   770,   335,  1818,   824,   825,   363,  1692,  1818,
    -673,  1989,  1401,   421,   421,   711,   712,   770,  1695,  1695,
    1695,  1695,   449,   405,     1,   458,   405,   826,  2024,   814,
     335,   827,   922,   828,  1529,  1530,  1531,   815,   335,   405,
    1682,   405,   823,   405,   689,   690,   691,   692,   693,   694,
     695,   696,   697,   698,   829,  1201,  1206,  1779,   335,  1202,
    1207,  1780,  1724,   674,   674,   674,   674,   674,   674,   674,
     674,  1712,  1987,  2030,   873,  2032,  1988,  1972,   511,  1972,
    -669,  -673,  -669,  1272,  1277,  1713,  -673,  1273,  1278,   719,
     720,   583,   583,  -673,  1465,   739,   740,  2047,    18,    19,
    1016,  1972,   583,  1016,  2048,  2052,  1016,  2058,  1972,  1972,
    1509,  1972,   880,   489,  1016,   490,  -673,  1016,  -668,  -673,
    -668,   492,  1693,   490,   883,  -673,   833,  1417,    28,    29,
    2027,  1879,   881,    32,   456,   937,  1495,     1,   469,   882,
      38,  1035,   699,   886,   913,  1880,  1967,   496,  1970,   883,
     996,   464,   490,   681,  1161,  1039,     1,  1072,   605,   125,
     931,  1169,   922,     1,   932,  1233,  1503,     1,  1239,   630,
       1,  1377,  1421,  1378,  1422,   741,   742,  1871,   681,  1874,
    1504,  1554,  1750,     1,  1560,   496,     1,  1564,  1570,     1,
       1,  1665,  1862,  1378,   363,   747,   748,   180,  1764,   939,
     363,  1882,  1686,  1884,  1378,  1419,   933,  1420,   681,   913,
    1753,   913,  2006,  1701,   940,  1704,   968,  1702,  1139,  1705,
    1813,  1814,   922,   974,  1360,  1362,   980,  1872,   604,  1875,
     986,   604,  1361,  1363,   927,   929,   928,   930,  1583,  1054,
    1056,   994,  1055,  1057,   995,   997,  1795,  1001,  1798,   257,
     260,  1883,  1002,  1885,   609,  1304,  1003,   609,  1311,  1312,
    1604,  1021,  1807,  1809,  1032,  1023,  1024,   496,  1033,   604,
     363,  1412,  1036,  1073,  1037,  1145,  1038,   112,   674,   112,
    1106,  1078,  1334,  1345,   604,   604,   604,   604,  1335,   112,
      58,  1157,  1346,  1352,  1347,   609,  1455,  1481,   913,  1390,
    1359,   421,  1397,   421,  1542,  1392,  -761,  -764,  1452,   496,
     609,   609,   609,   609,  1453,  1454,  1473,  1456,   405,   405,
    1457,  1474,  1505,  1497,   605,   421,   605,   421,  1482,  1498,
     869,  1496,  1500,  1513,  1514,   335,   335,  1515,  1519,  1541,
    1016,  1016,  1016,  1016,   405,   405,   583,   373,  1543,  1546,
     515,  1016,  1016,  1553,  1016,  1574,  1016,  1584,  1587,  1950,
    1313,  1313,  1107,  1590,  1589,    58,   405,   405,  1016,  1600,
    1601,   405,   405,  1602,    58,   405,   405,  1035,  1605,  2025,
    1522,    58,    58,  1617,  1608,  1612,  1624,   170,  1747,  1800,
     605,  1630,  1633,  1639,  1670,  1641,  1651,  1653,  1655,  1657,
    1674,  1685,  -232,   405,  1691,   405,  1718,  1719,  1720,  1951,
     363,   496,   495,    49,  1751,   436,  1721,  2026,  1765,  1722,
    1741,  1742,  1768,  1769,  1801,  1771,  1772,   436,  1776,  1783,
    1785,   436,  1786,   496,  1787,  1955,  1956,  1893,  1788,  1857,
    1907,  1811,  1907,  1865,  1789,  1861,  1805,  1806,  1866,  1868,
    1873,  1869,   913,  1876,   105,   335,  1877,  1908,  1930,   913,
    1913,  1922,  1923,   913,    49,  2040,  2023,  1924,  1938,  1925,
    1927,   134,  1940,  1941,  1928,  1934,  1935,  1936,  1937,  1942,
    1943,   421,   421,   421,   421,   421,  1695,  1695,    49,  1979,
     667,    49,   421,   421,   421,   421,   221,    49,  1986,  1990,
    1991,  1992,  1016,  1995,    49,    49,  1996,  1997,  2002,  2019,
    2020,  2007,   583,  1683,   583,  2012,  2031,    49,  1413,  2035,
     344,  2038,  2043,  1035,  1522,  1946,  1948,  2044,   864,  2045,
    2053,  2054,   356,  2055,    58,  2057,  2059,   393,   221,   865,
     393,   866,   867,   870,    58,  1318,    58,  1402,  1132,  1678,
     221,  1442,   221,   393,   221,   393,   631,   393,   617,   800,
     421,   421,   618,   654,  1384,  1016,  1016,  1933,   857,  1016,
     552,  1016,  2008,   633,  1016,   256,   221,   636,   583,   245,
     598,   247,   259,   393,   249,     0,  1856,     0,     0,  1907,
       0,  1907,  1522,     0,  1035,   501,     0,     0,  1035,     0,
     438,     0,     0,   703,    49,     0,     0,     0,     0,     0,
       0,  1016,   438,     0,     0,     0,   438,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1035,  1522,     0,     0,     0,     0,  1016,
       0,     0,     0,     0,   221,     0,     0,   221,   221,   356,
    1035,  1907,  1907,     0,  1907,     0,  1907,    49,     0,     0,
    1706,     0,     0,     0,     0,     0,   436,    49,   221,    49,
       0,     0,     0,     0,     0,     0,     0,     0,   436,   913,
       0,     0,     0,     0,   667,     0,   496,   221,     0,     0,
       0,     0,     0,   221,  1907,  1907,     0,  1907,     0,     0,
       0,   393,     0,     0,     0,     0,   548,     0,     0,     0,
       0,   604,   604,  1907,     0,     0,     0,   835,   838,  1796,
       0,  1799,   604,   913,     0,   913,     0,     0,     0,  1907,
       0,   436,     0,     0,     0,  1808,  1810,   609,   609,     0,
       0,     0,   913,   835,   838,     0,     0,     0,   609,   648,
       0,     0,     0,     0,     0,   648,    49,     0,     0,     0,
       0,     0,     0,     0,     0,   835,   838,     0,     0,     0,
     835,   838,     0,     0,   835,   838,     0,     0,     0,     0,
       0,   913,     0,   221,   405,   356,   221,     0,     0,   221,
      49,     0,     0,     0,     0,     0,   794,     0,     0,     0,
      49,   221,     0,    49,     0,     0,     0,     0,   836,   839,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   393,   393,   836,   839,     0,    49,    49,     0,
       0,     0,   405,   405,   393,   548,   405,   405,     0,   874,
       0,   787,     0,     0,   221,     0,   836,   839,   393,   393,
       0,   836,   839,   787,     0,   836,   839,     0,     0,  1027,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     393,   393,     0,     0,     0,   393,   393,     0,     0,   393,
     393,   356,   496,     0,   496,     0,     0,     0,   221,     0,
       0,     0,     0,   335,     0,     0,     0,     0,   496,   496,
     423,     0,    49,   423,    58,   335,   879,   393,     0,   393,
      49,   393,     0,     0,     0,     0,   423,     0,   423,     0,
     423,  1931,     0,     0,     0,     0,     0,    49,     0,     0,
      49,  1939,    49,     0,    49,     0,     0,     0,     0,     0,
      49,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   604,     0,     0,     0,
       0,   405,   405,     0,     0,     0,     0,     0,     0,     0,
     913,     0,     0,  1165,     0,     0,     0,     0,     0,     0,
       0,     0,   609,     0,     0,     0,     0,     0,  1947,  1949,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     356,   356,   356,   356,     0,     0,  1200,  1205,  1209,  1213,
    1217,     0,     0,  1226,     0,     0,     0,     0,     0,  1165,
       0,     0,     0,   221,   221,     0,     0,    49,     0,     0,
       0,     0,   393,     0,  1271,  1276,  1280,  1284,  1288,     0,
       0,  1226,     0,     0,     0,     0,   221,     0,     0,     0,
       0,     0,     0,   221,   221,   393,     0,   221,   221,  1226,
    1226,   335,   335,     0,     0,     0,     0,     0,     0,   436,
       0,     0,    49,     0,     0,   356,     0,     0,     0,     0,
     436,   356,     0,     0,   356,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   496,     0,     0,     0,     0,   365,
       0,     0,     0,     0,   496,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1113,  1123,     0,     0,  1113,
    1123,     0,   604,     0,   604,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   609,     0,
     609,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   496,   496,    49,     0,     0,    49,    49,    49,     0,
     356,     0,     0,   356,   356,     0,     0,    49,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   604,     0,
       0,     0,   221,    49,     0,   423,   423,     0,     0,     0,
      49,     0,   191,   221,     0,   393,     0,    49,     0,     0,
       0,     0,     0,     0,   609,     0,     0,     0,     0,     0,
       0,   423,   423,     0,     0,     0,     0,     0,     0,     0,
       0,   835,   838,     0,     0,   835,   838,     0,     0,     0,
       0,     0,     0,   423,   423,     0,   365,     0,   423,   423,
       0,     0,   423,   423,  1340,   365,     0,     0,    49,     0,
       0,   365,     0,     0,     0,  1340,     0,   335,     0,     0,
       0,     0,     0,     0,     0,    49,   356,     0,    46,     0,
     423,     0,   423,   221,   221,   335,     0,     0,   393,    68,
       0,     0,   405,   405,     0,   221,     0,     0,  -475,     0,
    1501,  -475,  -475,  -475,  -475,  -475,  -475,  -475,  -475,   356,
     221,   356,     0,     0,     0,     0,     0,   221,     0,     0,
       0,     0,   836,   839,     0,     0,   836,   839,  1527,     0,
       0,     0,     0,     0,     0,     0,  1536,     0,     0,     0,
       0,     0,     0,     0,     0,   404,   393,   393,   404,     0,
     393,   393,   365,   150,     0,     0,    80,     0,     0,     0,
       0,   404,    46,   404,    68,   404,    49,   393,     0,    46,
      46,    49,     0,    68,     0,     0,     0,    49,     0,   548,
      68,    68,  1165,    49,     0,     0,     0,     0,  1165,    49,
       0,     0,     0,     0,     0,     0,     0,     0,   356,     0,
     116,  -475,  -475,     0,     0,     0,     0,     0,     0,     0,
       0,  -475,     0,     0,   439,     0,     0,     0,     0,     0,
    -475,  -475,  -475,  -475,  -475,     0,   439,     0,     0,     0,
     439,   160,   116,     0,     0,     0,     0,     0,   203,     0,
      80,     0,     0,     0,     0,     0,     0,    80,    80,     0,
       0,     0,     0,     0,     0,     0,     0,   356,   356,   356,
     356,     0,     0,     0,     0,     0,     0,   760,     0,   510,
       0,     0,     0,   352,   354,   393,   393,   221,     0,     0,
     427,     0,    49,   427,     0,     0,     0,     0,     0,     0,
       0,    49,     0,     0,     0,     0,   427,     0,   427,     0,
     427,   790,   320,     0,     0,     0,     0,     0,   221,   356,
      49,   797,     0,     0,   804,     0,     0,   482,   354,     0,
       0,     0,   150,     0,     0,     0,     0,     0,   221,     0,
       0,     0,   150,    68,    46,   221,     0,     0,     0,     0,
       0,     0,     0,    68,     0,    68,     0,   517,     0,   855,
       0,   221,   356,     0,     0,   872,     0,     0,   221,   356,
       0,     0,   221,   356,     0,     0,     0,     0,     0,     0,
     548,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     405,     0,   405,     0,     0,     0,     0,   550,     0,     0,
    1596,     0,     0,     0,     0,     0,     0,  1596,   423,   423,
     160,     0,     0,     0,   405,   365,   405,     0,     0,     0,
      80,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   191,     0,     0,     0,     0,     0,     0,
       0,   191,     0,     0,     0,   586,     0,     0,     0,     0,
     404,   404,     0,     0,     0,     0,     0,     0,   191,     0,
       0,   191,   868,   191,     0,   191,     0,     0,     0,     0,
       0,   423,     0,     0,     0,   439,   404,   404,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   439,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   404,   404,
     677,   835,   838,   404,   404,     0,     0,   404,   404,     0,
       0,     0,   510,     0,     0,     0,   352,     0,     0,     0,
       0,     0,     0,     0,    49,    49,     0,     0,     0,   423,
     423,     0,     0,   423,   423,   404,   775,   404,     0,     0,
     439,     0,     0,   427,     0,   356,     0,     0,   356,     0,
       0,     0,     0,     0,     0,   116,     0,   365,     0,     0,
     365,   365,     0,     0,     0,     0,     0,     0,     0,     0,
     405,   405,   405,   405,   405,     0,     0,     0,     0,     0,
       0,   405,   405,   405,   405,   427,   427,     0,     0,   356,
     849,     0,   836,   839,   861,     0,     0,   427,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     356,   427,   427,     0,     0,     0,   393,   393,     0,     0,
       0,   221,   221,   221,   221,     0,     0,     0,     0,     0,
       0,     0,     0,   427,   427,     0,     0,     0,   427,   427,
       0,     0,   427,   427,     0,     0,   352,     0,     0,   405,
     405,     0,     0,     0,     0,     0,   116,   116,   423,   423,
       0,     0,     0,   365,     0,     0,     0,     0,     0,     0,
     427,     0,   427,   517,     0,   116,     0,     0,     0,     0,
     268,    49,     1,   269,    97,   352,     0,   354,     0,     0,
     221,   356,     0,   921,     0,     0,     0,   760,   760,   760,
       0,     0,     0,     0,     0,     0,     0,     2,   191,     0,
       0,     0,   150,     0,     0,     0,     0,  1080,     0,     0,
    1817,     0,     0,    68,     0,  1820,  1822,  1826,  1830,  1832,
    1836,     0,  1817,     0,     0,  1841,  1845,  1849,  1853,     0,
       0,     0,     0,     0,   273,   991,     0,     0,     0,     0,
     274,   275,     0,     0,   221,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   586,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,     0,     0,
      80,   638,     0,     0,     0,     0,     0,   356,     0,     0,
      49,   290,   291,   356,     0,     0,   586,   586,   586,   586,
       0,     0,     0,     0,     0,     0,  1115,     0,     0,     0,
    1115,    49,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   775,     0,     0,     0,     0,
     422,     0,     0,   422,     0,     0,     0,     0,   510,     0,
       0,     0,     0,     0,     0,     0,   422,     0,   422,     0,
     422,     0,     0,     0,     0,  1133,     0,     0,     0,  1137,
       0,     0,  1817,   356,     0,     0,     0,  1817,   510,     0,
       0,     0,     0,     0,     0,   510,     0,     0,   439,   221,
     356,     0,   510,     0,     0,   677,   365,   191,     0,   439,
       0,     0,   191,     0,   393,     0,   393,     0,  1468,  1174,
       0,     0,     0,     0,  1468,     0,   404,     0,     0,     0,
     191,     0,     0,     0,     0,     0,     0,     0,   393,     0,
     393,     0,     0,     0,     0,     0,  1232,     0,     0,     0,
     775,   677,    74,   510,  1244,     0,     0,     0,     0,     0,
       0,     0,   584,     0,     0,   775,   427,     0,     0,     0,
     510,     0,     0,  1350,  1301,     0,   775,     0,   550,   835,
     838,     0,   835,   838,   404,   404,     0,     0,   404,   404,
     835,   838,   835,   838,     0,     0,     0,     0,     0,   423,
     423,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   116,     0,
       0,     0,     0,   356,     0,   393,  1382,    74,     0,     0,
       0,   517,     0,     0,     0,     0,    74,     0,   116,     0,
       0,     0,     0,    74,    74,     0,     0,     0,   849,     0,
       0,   191,     0,     0,   368,     0,     0,     0,   835,   838,
       0,   427,     0,     0,     0,     0,     0,     0,     0,     0,
     836,   839,     0,   836,   839,     0,     0,   440,     0,     0,
       0,   836,   839,   836,   839,     0,     0,     0,     0,   440,
     849,     0,     0,   440,   393,   393,   393,   393,   393,   221,
     221,     0,     0,     0,     0,   393,   393,   393,   393,     0,
       0,     0,     0,   404,   404,     0,     0,     0,     0,   427,
     427,     0,     0,   427,   427,     0,     0,     0,     0,     0,
       0,     0,   365,     0,     0,   365,   354,     0,   352,   921,
       0,     0,     0,     0,     0,   422,   422,     0,     0,   836,
     839,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   422,   422,   393,   393,     0,     0,  1544,     0,     0,
       0,     0,     0,     0,     0,     0,  1547,     0,     0,     0,
       0,     0,     0,   422,   422,     0,    74,   365,   422,   422,
       0,   368,   422,   422,   911,     0,    74,     0,    74,     0,
     368,     0,   365,     0,     0,     0,   368,   586,     0,     0,
     586,     0,     0,     0,     0,     0,     0,     0,     0,   586,
     422,     0,   422,  -475,  -475,  -475,  -475,  -475,  -475,  -475,
    -475,  -475,  -475,  -475,     0,     0,     0,     0,   427,   427,
       0,  1520,  1521,     0,     0,   760,   760,     0,   586,     0,
    1174,     0,     0,     0,   775,  1533,     0,     0,  1244,     0,
    1539,     0,     0,   586,   586,   586,   586,     0,     0,     0,
       0,   775,     0,  1115,     0,     0,     0,   423,     0,   423,
       0,     0,     0,   584,     0,     0,     0,     0,     0,     0,
       0,  1115,     0,     0,     0,     0,     0,   368,  1115,     0,
       0,   423,     0,   423,   677,     0,     0,     0,     0,     0,
     677,     0,     0,   584,   584,   584,   584,     0,   788,     0,
       0,     0,     0,     0,     0,     0,  -475,  -475,     0,     0,
     788,     0,     0,     0,     0,     0,  -475,     0,     0,     0,
       0,  -475,  -475,  -475,     0,  -475,  -475,  -475,  -475,  -475,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1619,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   365,     0,     0,     0,     0,     0,
     365,     0,     0,   788,     0,     0,     0,     0,   911,     0,
       0,     0,     0,     0,   911,     0,     0,   911,     0,     0,
       0,     0,     0,     0,     0,     0,   231,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   365,
     365,     0,   365,   365,     0,     0,   366,     0,   365,   365,
     365,   365,     0,     0,   404,   404,     0,     0,     0,     0,
     365,   365,   365,   365,   365,   365,   365,   365,     0,     0,
     365,     0,     0,     0,     0,     0,     0,   423,   423,   423,
     423,   423,     0,     0,     0,     0,     0,     0,   423,   423,
     423,   423,     0,     0,     0,     0,     0,   366,     0,     0,
       0,     0,     0,     0,     0,     0,   231,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1669,     0,     0,
       0,   191,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   423,   423,   422,   422,
       0,     0,     0,     0,  1679,     0,     0,     0,     0,     0,
     368,     0,     0,     0,     0,     0,   510,   231,   231,   231,
       0,     0,     0,     0,     0,     0,    74,     0,     0,   427,
     427,     0,     0,   626,     0,     0,     0,     0,   231,     0,
       0,     0,   366,     0,     0,     0,     0,     0,   366,     0,
     365,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   422,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   911,     0,   911,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   517,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   921,   365,     0,     0,     0,   422,
     422,     0,     0,   422,   422,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   366,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     586,   586,   368,     0,     0,   368,   368,     0,     0,   586,
       0,   586,   586,     0,     0,   586,     0,     0,     0,     0,
       0,   911,     0,   586,   584,     0,   586,   584,     0,     0,
       0,     0,   404,   305,   404,     0,   584,     0,     0,     0,
       0,   788,     0,     0,     0,     0,     0,     0,     0,   364,
       0,     0,   788,     0,     0,     0,   404,     0,   404,     0,
       0,     0,     0,     0,     0,   584,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     584,   584,   584,   584,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   912,     0,     0,   422,   422,
     364,     0,     0,     0,     0,     0,     0,     0,   368,     0,
       0,   914,     0,     0,     0,     0,     0,     0,   231,   921,
       0,     0,     0,     0,     0,   366,     0,     0,     0,     0,
       0,  1815,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1619,     0,     0,     0,     0,  1533,     0,     0,
    1539,     0,     0,     0,  1619,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   427,     0,   427,
       0,     0,     0,     0,     0,   911,     0,     0,     0,   366,
       0,     0,   911,     0,     0,     0,   911,     0,     0,     0,
       0,   427,     0,   427,     0,     0,   364,     0,     0,     0,
     354,   639,   641,     0,     0,   364,     0,     0,     0,     0,
       0,   364,   404,   404,   404,   404,   404,     0,     0,     0,
       0,   305,     0,   404,   404,   404,   404,     0,     0,   921,
     231,   231,   231,   231,     0,     0,   364,     0,     0,     0,
       0,   364,  1077,     0,     0,     0,     0,     0,     0,   586,
     586,   586,   586,   231,   231,   586,     0,     0,     0,     0,
     586,   586,     0,   586,     0,   586,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1105,   586,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1915,  1916,   912,
       0,   404,   404,     1,  1619,   912,     0,     0,   912,  1619,
       0,     0,   364,     0,     0,   914,     0,     0,     0,     0,
       0,   914,     0,     0,   914,     0,     0,     0,     2,     0,
       0,     0,   921,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,   368,     0,     0,     0,     0,     0,   427,   427,   427,
     427,   427,     0,     0,     0,     0,    27,     0,   427,   427,
     427,   427,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,   366,     0,     0,   366,   366,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   911,     0,     0,     0,     0,     0,   364,     0,
       0,   586,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   586,     0,   586,     0,     0,   427,   427,     0,   422,
     422,     0,     0,     0,     0,     0,     0,     0,   364,     0,
       0,     0,     0,     0,     0,     0,   911,     0,   911,     0,
       0,     0,   921,     0,     0,     0,     0,     0,   912,     0,
       0,   366,     0,     0,     0,     0,   305,     0,     0,     0,
       0,     0,     0,     0,   586,   586,     0,     0,   586,     0,
     586,     0,     0,   586,     0,     0,     0,   586,     0,     0,
     366,     0,   364,  2010,     0,     0,     0,     0,     0,   366,
       0,     0,     0,     0,   911,     0,     0,   584,   584,     0,
       0,   921,   921,     0,     0,     0,   584,     0,   584,   584,
     586,     0,   584,   912,     0,   912,     0,     0,     0,     0,
     584,     0,     0,   584,     0,     0,     0,     0,     0,   914,
     914,   914,     0,     0,     0,     0,   323,     0,   586,     0,
       0,     0,     0,     0,     0,   364,     0,     0,     0,  1082,
       0,     0,   367,     0,     0,     0,     0,   368,     0,     0,
     368,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   366,     0,     0,     0,     0,   305,     0,     0,     0,
     305,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   364,     0,     0,     0,     0,     0,   364,     0,
       0,   364,   912,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   366,     0,     0,     0,     0,   914,     0,
     305,     0,   368,     0,     0,     0,   364,   364,   364,   364,
     364,   364,   364,     0,     0,   364,   364,   368,   364,   364,
     364,   364,   364,   364,   364,   364,     0,   305,     0,     0,
       0,     0,     0,     0,     0,   305,   364,   364,   364,   364,
     364,   364,   364,   364,   364,   364,   364,   364,   364,   364,
     364,   364,   364,   364,     0,   305,     0,   231,   231,   231,
     231,     0,     0,     0,     0,     0,     0,   364,     0,     0,
     364,   364,     0,   911,     0,     0,     0,   231,     0,   367,
       0,     0,     0,     0,   640,   642,     0,   422,   367,   422,
       0,     0,     0,   366,   367,   366,     0,     0,     0,     0,
       0,     0,     0,     0,   323,     0,     0,     0,     0,     0,
       0,   422,     0,   422,     0,     0,     0,   366,     0,   367,
       0,     0,     0,     0,   367,     0,   584,   584,   584,   584,
       0,     0,   584,     0,     0,     0,   912,   584,   584,     0,
     584,   364,   584,   912,   364,     0,     0,   912,     0,     0,
       0,   914,   914,     0,   584,     0,     0,     0,   914,   914,
       0,     0,   914,   914,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   364,     0,     0,     0,     0,     0,     0,
       0,     0,   364,     0,     0,   367,     0,     0,     0,   368,
       0,     0,     0,     0,     0,   368,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   364,     0,   364,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1824,  1828,     0,  1834,  1838,     0,
       0,     0,     0,  1843,  1847,  1851,  1855,     0,     0,     0,
       0,     0,     0,     0,     0,   368,   368,   368,   368,   368,
     368,   368,   368,     0,   364,   368,     0,   422,   422,   422,
     422,   422,     0,     0,     0,     0,     0,     0,   422,   422,
     422,   422,     0,     0,     0,     0,     0,     0,   584,     0,
       0,   367,     0,     0,     0,   364,     0,     0,   584,     0,
     584,     0,     0,     0,     0,     0,   364,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   366,
       0,   367,   366,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   305,   305,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   422,   422,     0,   323,
       0,   584,   584,     0,     0,   584,     0,   584,     0,     0,
     584,     0,     0,   912,   584,     0,     0,     0,     0,     0,
     366,     0,     0,     0,     0,   367,     0,     0,     0,   914,
       0,     0,     0,     0,   366,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   584,     0,   366,
       0,     0,     0,     0,     0,   368,   364,   912,   364,   912,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   584,   912,     0,     0,     0,
     364,     0,     0,     0,     0,     0,     0,     0,   367,     0,
       0,     0,  1083,     0,     0,   364,     0,     0,     0,   364,
       0,     0,   305,     0,     0,     0,   364,     0,     0,     0,
     364,     0,     0,     0,     0,   912,     0,     0,     0,   323,
     368,     0,     0,   323,     0,     0,     0,     0,     0,     0,
     914,   914,     0,     0,     0,   367,     0,     0,     0,     0,
       0,   367,     0,     0,   367,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   323,     0,     0,     0,     0,     0,   367,
     367,   367,   367,   367,   367,   367,     0,     0,   367,   367,
       0,   367,   367,   367,   367,   367,   367,   367,   367,     0,
     323,     0,     0,     0,     0,     0,     0,     0,   323,   367,
     367,   367,   367,   367,   367,   367,   367,   367,   367,   367,
     367,   367,   367,   367,   367,   367,   367,     0,   323,     0,
       0,   366,     0,     0,     0,     0,   366,   366,   366,     0,
     367,     0,     0,   367,   367,     0,     0,     0,     0,     0,
       0,     0,   366,   366,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1823,  1827,     0,  1833,
    1837,     0,     0,     0,     0,  1842,  1846,  1850,  1854,     0,
       0,     0,   364,     0,     0,   364,     0,  1823,  1827,  1833,
    1837,  1842,  1846,  1850,  1854,     0,     0,   366,     0,     0,
       0,     0,     0,     0,   367,     0,     0,   367,     0,     0,
       0,     0,     0,     0,   912,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   364,     0,     0,   914,
     914,     0,     0,   364,     0,     0,   367,     0,     0,     0,
       0,     0,     0,     0,     0,   367,     0,   364,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   364,     0,     0,     0,     0,     0,     0,   367,
     364,   367,   364,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   364,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   367,   364,     0,
       0,     0,     0,     2,     0,     0,     0,   366,   366,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   366,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   367,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   367,
     273,     0,     0,     0,     0,     0,   274,   275,   276,    28,
       0,     0,     0,     0,    32,     0,     0,     0,     0,   277,
     278,    38,     0,     0,     0,   323,   323,     0,     0,     0,
       0,     0,   912,   279,     0,   366,   366,   280,   281,   282,
     283,   284,   285,   286,   801,     0,     0,   802,   661,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,   364,     0,     0,     0,     0,   364,
     364,   364,     0,     0,     0,     0,     0,     0,     0,     0,
     305,     0,     0,     0,     0,   364,   364,     0,     0,     0,
       0,     0,   305,     0,     0,     0,     0,     0,     0,   367,
       0,   367,     0,    66,     0,     0,     0,     0,     0,   364,
     364,     0,   364,   364,     0,     0,     0,     0,   364,   364,
     364,   364,     0,   367,     0,     0,     0,     1,     0,     0,
     364,   364,   364,   364,   364,   364,   364,   364,   367,     0,
     364,     0,   367,     0,     0,   323,   108,     0,     0,   367,
       0,     0,     2,   367,     0,     0,     0,   364,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,   157,     0,
       0,     0,     0,     0,     0,     0,   227,    66,     0,     0,
      27,     0,     0,     0,    66,    66,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,   346,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   227,     0,    40,     0,    78,     0,   437,     0,
       0,     0,     0,    43,     0,     0,   774,     0,     0,     0,
     437,     0,   227,     0,   437,     0,     0,   508,   305,   305,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   227,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     364,   364,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   364,     0,     0,   514,     0,     0,     0,     0,     0,
       0,    78,    78,     0,     0,     0,    78,     0,    78,     0,
      78,     0,     0,     0,     0,     0,     0,    78,    78,     0,
       0,     0,     0,     0,     0,   367,     0,     0,   367,     0,
       0,     0,     0,     0,   547,     0,     0,   227,   227,   227,
       0,     0,    78,    78,     0,   364,     0,   157,   364,   364,
       0,     0,     0,     0,     0,     0,     0,   157,   227,    66,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   367,
       0,     0,     0,     0,     0,     0,   367,   647,     0,     0,
       0,     0,     0,   647,     0,     0,    78,    78,     0,     0,
     367,   666,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   367,     0,     0,     0,     0,
       0,     0,     0,   367,     0,   367,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,    78,
       0,     0,   367,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   305,     0,     0,    78,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
      78,   367,   305,   547,     0,   227,   227,     0,     0,   786,
      78,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,   786,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,   514,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,   878,   288,  1050,   289,     0,     0,
    1051,     0,     0,     0,     0,   290,   291,  1626,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,   367,    78,     0,
       0,   227,   367,   367,   367,     0,     0,     0,   227,     0,
       0,     0,     0,   323,     0,     0,     0,     0,   367,   367,
       0,     0,     0,     0,     0,   323,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,   367,   367,     0,   367,   367,     0,     0,     0,
       0,   367,   367,   367,   367,     0,     0,     0,     0,     0,
       0,     0,     0,   367,   367,   367,   367,   367,   367,   367,
     367,     0,     0,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     367,     0,     0,     0,     0,     0,     0,  1031,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     227,   227,   227,   227,     0,     0,    78,     0,    78,     0,
       0,     0,     0,     0,     0,     0,    78,    78,     0,     0,
       0,     0,     0,   227,   227,     0,     0,   157,     0,     0,
       0,     0,  1085,    78,     0,    78,     0,     0,     0,     0,
       0,     0,     0,    78,     0,    78,   227,     0,     0,     0,
       0,     0,     0,  1112,  1122,   666,     0,  1112,  1122,     0,
       0,   323,   323,     0,     0,     0,     0,     0,     0,   224,
       0,     0,  1141,     0,     0,   227,    78,     0,     0,     0,
       0,   227,     0,     0,   227,     0,     0,     0,     0,     0,
       0,     0,     0,   367,   367,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   367,   224,     0,     0,     0,     0,
       0,   435,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   435,     0,   224,     0,   435,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   224,
      78,     0,     0,     0,     0,     0,     0,     0,   367,     0,
       0,   367,   367,   514,     0,     0,     0,     0,     0,     0,
     227,     0,     0,   227,   227,     0,     0,   512,     0,     0,
       0,     0,     0,     0,   113,     0,     0,     0,     0,     0,
       0,     0,  1339,   514,     0,     0,     0,     0,     0,     0,
     514,     0,     0,  1339,   108,   666,     0,   514,     0,     0,
       0,     0,     0,     0,     0,   113,   113,   545,     0,     0,
     224,   224,   224,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,     0,     0,     0,     0,     0,     0,
       0,   224,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   348,   113,   514,     0,
     645,     0,     0,     0,   159,   114,   645,   323,     0,   200,
       0,   202,     0,     0,     0,   514,   227,     0,     0,     0,
       0,     0,     0,   227,   227,   323,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   227,     0,     0,     0,     0,
     348,   113,     0,     0,     0,   349,   114,     0,     0,   227,
     227,   227,     0,     0,     0,     0,     0,   547,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,   113,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   479,
     481,     0,     0,     0,     0,     0,   545,     0,   224,   224,
       0,     0,   785,     0,     0,     0,     0,     0,    78,     0,
       0,   113,     0,     0,   785,     0,     0,     0,     0,     0,
     114,    78,     0,     0,   113,     0,     0,     0,    78,     0,
     534,     0,   535,     0,     0,     0,     0,     0,   227,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     512,     0,     0,     0,     0,     0,     0,     0,  1031,     0,
     114,     0,     0,     0,     0,     0,     0,   877,     0,     0,
       0,     0,     0,   159,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   227,   227,   227,
     227,     0,     0,     0,   224,     0,     0,     0,     0,     0,
       0,   224,     0,     0,     0,     0,     0,   227,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
     113,  1549,   348,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   547,   227,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1595,   113,
       0,     0,     0,     0,     0,  1595,     0,     0,     0,   114,
       0,   349,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   227,   227,     0,     0,     0,     0,     0,   227,   227,
       0,     0,   227,   227,   848,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   114,     0,
       0,     0,     0,   224,   224,   224,   224,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,   224,     0,     0,
       0,     0,   226,     0,     0,     0,   200,   202,     0,     0,
     113,     0,   348,     0,     0,     0,     0,     0,     0,   224,
     113,   113,     0,     0,     0,     0,  1110,  1120,     0,     0,
    1110,  1120,     0,     0,     0,     0,     0,   113,   226,   113,
       0,     0,     0,     0,     0,     0,     0,   348,   224,   113,
       0,     0,     0,     0,   224,     0,     0,   224,   226,   917,
       0,   918,     0,     0,     0,     0,     0,     0,     0,   114,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     348,     0,   226,     0,     0,     0,   114,     0,   114,     0,
       0,     0,     0,     0,     0,     0,   349,     0,   114,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     513,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   227,     0,     0,   227,   349,
       0,     0,     0,     0,     0,     0,   512,     0,     0,     0,
       0,     0,     0,   224,     0,     0,   224,   224,     0,     0,
     546,     0,     0,   226,   226,   226,     0,     0,   229,     0,
       0,     0,     0,     0,     0,  1338,   512,     0,     0,   227,
       0,     0,     0,   512,   226,     0,  1338,     0,     0,     0,
     512,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     227,     0,     0,   646,   229,     0,     0,     0,     0,   646,
       0,   227,   227,   227,   227,     0,     0,   665,     0,     0,
       0,     0,     0,     0,   229,  1044,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,   512,     0,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     2,     0,     0,     0,     0,     0,   512,   224,
       0,     0,     0,     0,     0,     0,   224,   224,     0,     0,
       0,   514,     0,     0,     0,     0,   516,     0,   224,     0,
     227,   227,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,   224,   224,   224,   274,   275,   276,     0,   546,
     545,   226,   226,     0,     0,     0,     0,     0,   277,   278,
       0,     0,     0,     0,     0,     0,   549,     0,     0,   229,
     229,   229,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1349,   289,  1045,
     229,  1046,   113,     0,   227,     0,   290,   291,     0,   292,
     293,   294,   295,   513,     0,     0,     0,     0,     0,   649,
       0,     0,     0,     0,     0,   649,     0,     0,     0,     0,
       0,     0,     0,   668,     0,     0,     0,     0,     0,     0,
       0,   224,   113,     0,     0,     0,     0,   227,     0,  1379,
    1381,   114,     0,   227,    78,   113,     0,     0,     0,     0,
       0,     0,   113,     0,     0,     0,     0,   226,     0,     0,
       0,   666,   848,     0,   226,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   114,     0,     0,     0,     0,     0,     0,   200,   202,
     224,   224,   224,   224,   114,     0,     0,     0,   534,     0,
     535,   114,     0,     0,   848,   549,     0,   229,   229,     0,
     224,     0,     0,   227,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   227,
     227,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   545,   224,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   113,     0,     0,     0,     0,     0,     0,   516,
       0,  1593,     0,     0,     0,     0,     0,     0,  1593,     0,
       0,     0,     0,     0,     0,     0,   226,   226,   226,   226,
       0,     0,     0,     0,   224,   224,     0,     0,     0,     0,
       0,   224,   224,     0,     0,   224,   224,     0,     0,   226,
     226,   114,     0,     0,     0,     0,     0,     0,  1084,     0,
       0,     0,     0,   229,     0,     0,     0,     0,     0,     0,
     229,     0,   226,     0,     0,     0,     0,     0,     0,  1111,
    1121,   665,     0,  1111,  1121,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,  1140,     0,
       0,   226,     0,   227,     0,   666,     0,   226,     0,     0,
     226,     0,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,   227,
     227,     0,   229,   229,   229,   229,    40,     0,     0,   513,
       0,     0,     0,     0,     0,    43,   226,     0,   507,   226,
     226,     0,     0,     0,     0,   229,   229,     0,     0,   508,
       0,   509,     0,     0,  1087,     0,     0,     0,   224,   513,
       0,   224,     0,     0,     0,     0,   513,     0,   229,     0,
       0,   665,     0,   513,     0,  1114,  1124,   668,     0,  1114,
    1124,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1143,     0,     0,   229,     0,     0,
       0,     0,   224,   229,     0,     0,   229,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   224,   513,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   224,   224,   224,   224,     0,     0,
       0,   513,   226,     0,     0,     0,     0,     0,     0,   226,
     226,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   226,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   226,   226,     0,     0,
       0,     0,     0,   546,     0,   516,     0,     0,     0,     0,
       0,     0,   229,     0,   512,   229,   229,     0,   225,     0,
       0,     0,     0,   224,   224,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   516,     0,     0,     0,     0,
       0,     0,   516,     0,     0,     0,     0,   668,     0,   516,
    1666,  1668,     0,     0,   225,     0,     0,     0,     0,     0,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   225,     0,   225,     0,   225,     0,  1349,     0,
    1680,     0,  1681,     0,   226,     0,     0,   224,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,     0,
     516,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   516,   229,     0,
       0,     0,     0,     0,     0,   229,   229,     0,     0,   534,
     224,   535,     0,     0,     0,     0,   224,   229,     0,     0,
       0,     0,     0,   226,   226,   226,   226,     0,     0,     0,
       0,   229,   229,   229,     0,     0,     0,     0,     0,   549,
       0,     0,     0,   226,     0,     0,   225,     0,   113,   225,
     225,   225,     0,     0,     0,     0,     0,  1548,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,     0,   546,   226,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,     0,     0,   225,
       0,     0,     0,     0,  1594,   225,     0,   114,     0,     0,
       0,  1594,   224,   224,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   226,   226,     0,
     229,     0,     0,     0,   226,   226,     1,     0,   226,   226,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,   229,
     229,   229,   229,     0,     0,   225,     0,   225,   225,   216,
       0,   225,     0,     0,     0,     0,     0,    28,    29,   229,
       0,     0,    32,   225,     0,     0,     0,     0,   217,    38,
     218,     0,     0,  1551,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   219,     0,     0,   224,     0,     0,     0,
     549,   229,    43,     0,     0,   774,     0,     0,     0,     0,
       0,     0,  1336,     0,     0,     0,   508,  1863,     0,  1864,
    1597,     0,     0,     0,     0,     0,   225,  1597,     0,  1666,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   229,   229,     0,     0,     0,     0,     0,
     229,   229,     0,     0,   229,   229,   171,     0,     1,     0,
       0,     0,     0,   225,     0,     0,     0,     0,     0,     0,
     225,   226,   224,   224,   226,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   230,     0,     0,     0,
     177,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,   226,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     0,   226,   226,   226,
     226,     0,   230,     0,   675,    40,     0,     0,   230,     0,
       0,     0,     0,     0,    43,     0,     0,   507,   949,   702,
     230,     0,   230,     0,   230,     0,     0,     0,   508,     0,
       0,     0,   225,   225,   225,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   230,     0,     0,     0,
       0,     0,     0,     0,     0,   225,   225,   513,     0,     0,
       0,     0,     0,     0,     0,     0,   226,   226,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   229,   225,     0,
     229,     0,     0,     0,     0,   225,   225,     0,     0,   225,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   225,     0,     0,
       0,     0,     0,   225,   230,     0,   225,   230,   230,   230,
       0,   229,     0,     0,     0,     0,     0,     0,     0,     0,
     226,     0,     0,     0,     0,     0,     0,     0,   230,     0,
       0,     0,   229,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   229,   229,   229,   229,   230,     0,     0,
       0,     0,     0,   230,     0,     0,   591,     0,     0,     0,
       0,     0,     0,   226,     0,     0,     0,     0,     0,   226,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   665,     0,     0,
       0,     0,   225,     0,     0,   225,   225,     0,     0,     0,
       0,     0,     0,   516,     0,     0,     0,     0,   664,     0,
       0,     0,   229,   229,   225,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   226,
       0,     0,     0,   230,     0,   230,   230,     0,     0,   230,
       0,     0,     0,     0,     0,   226,   226,     0,     0,     0,
       0,   230,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1026,   229,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,     0,
       0,     0,     0,     0,     0,   225,   225,     0,     0,   664,
       0,     0,     0,     0,   230,     0,     0,   225,     0,   229,
       0,     0,     0,     0,     0,   229,     0,     0,     0,     0,
       0,   225,   225,   225,     0,     0,     0,     0,     0,   225,
       0,     0,     0,   668,     0,     0,     0,     0,     0,     0,
       0,   230,     0,     0,     0,     0,     0,     0,   230,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   226,
       0,   665,     0,     0,     0,     0,     0,     0,     0,   675,
       0,     0,     0,     0,     0,   229,     0,     0,     0,     0,
       0,     0,     0,  1173,     0,     0,     0,     0,     0,     0,
       0,   229,   229,     0,     0,     0,     0,     0,     0,     0,
     225,     0,  1199,  1204,  1208,  1212,  1216,     0,     0,  1225,
    1231,     0,     0,     0,     0,   675,     0,     0,  1243,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1270,  1275,  1279,  1283,  1287,   226,   226,  1225,  1300,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,   230,   230,   230,     0,  1225,  1225,     0,     0,   225,
     225,   225,   225,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1029,   230,   230,     0,     0,     0,     0,   225,
       0,     0,     0,     0,     0,     0,     0,  1048,     0,     0,
       0,     0,     0,     0,     0,     0,   230,   591,   591,   591,
     591,     0,     0,   230,   230,     0,     0,   230,   230,     0,
     225,   225,     0,     0,     0,   229,     0,   668,     0,     0,
       0,     0,     0,     0,     0,   230,     0,     0,     0,     0,
     225,   230,     0,     0,   230,     0,     0,   225,   664,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   225,   225,     0,     0,     0,     0,     0,
     225,   225,     0,  1048,   225,   225,     0,     0,     0,     0,
       0,     0,     0,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,  1172,     0,
       0,   229,   229,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,  1018,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,   230,   230,     0,  1229,     0,     0,     0,
       0,     0,     0,     0,  1242,     0,     0,   273,     0,     0,
    1058,  1062,   230,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,   230,  1298,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,  1324,  1328,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1050,   289,     0,   663,  1631,
       0,     0,     0,  1632,   290,   291,  1026,   292,   293,   294,
     295,     0,   664,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1173,     0,   230,     0,     0,     0,
       0,     0,  1243,   230,   230,     0,     0,   225,     0,   268,
     225,     1,   269,    97,   270,   230,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
     230,   230,     0,     0,     0,     0,     2,   230,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   675,     0,
       0,   225,     0,     0,   675,     0,     0,     0,     0,   663,
    1006,  1007,  1008,   565,  1009,  1010,  1011,  1012,   570,   571,
    1013,     0,   225,   273,     0,     0,     0,     0,     0,   274,
     275,   276,     0,   225,   225,   225,   225,  1014,     0,     0,
       0,     0,   277,   278,  1015,     0,   575,   576,   577,     0,
       0,     0,     0,     0,     0,  1618,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,   230,     0,
     288,  -470,   289,   578,     0,  -470,     0,   220,     0,   579,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   225,   225,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   591,     0,
       0,   591,  1486,  1488,     0,  1492,     0,   230,   230,   230,
     230,     0,     0,  1502,     0,     0,     0,     0,     0,     0,
       0,  1511,     0,     0,     0,     0,     0,   230,  1048,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   591,
       0,     0,     0,     0,     0,     0,   225,  1048,     0,     0,
       0,     0,  1048,     0,   591,   591,   591,   591,   230,   230,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1028,     0,     0,     0,     0,     0,   230,     0,
       0,     0,     0,     0,     0,   230,     0,  1047,     0,   225,
       0,  1052,     0,     0,     0,   225,     0,  1563,     0,     0,
       0,   230,   230,  1573,     0,     0,     0,     0,   230,   230,
       0,     0,   230,   230,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1048,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   663,  1479,
       0,     0,  1483,     0,     0,     0,     0,     0,     0,     0,
       0,  1499,  1126,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1047,  1052,   225,     0,     0,     0,     0,
       0,  1048,     0,     0,     0,     0,     0,     0,     0,     0,
    1523,   225,   225,     0,     0,     0,     0,     0,  1171,     0,
       0,     0,     0,     0,     0,  1058,  1062,  1058,  1062,     0,
       0,     0,     0,     0,     0,     0,  1163,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1227,  1048,     0,     0,
       0,     0,     0,     2,  1241,     0,     0,     0,     0,     0,
       0,  1048,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1296,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,  1322,  1326,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,   230,     0,     0,   230,   277,
     278,     0,     0,     0,     0,     0,  1048,     0,     0,     0,
       0,     0,   663,   279,     0,   225,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1164,   289,
       0,     0,  1048,     0,   672,     0,  1048,   290,   291,   230,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   230,   230,   230,   230,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   225,   225,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1618,     0,     0,     0,
       0,  1819,  1821,  1825,  1829,  1831,  1835,     0,  1618,     0,
       0,  1840,  1844,  1848,  1852,     0,     0,     0,     0,     0,
     230,   230,     0,  1821,  1825,  1831,  1835,  1840,  1844,  1848,
    1852,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   591,   591,     0,     0,  1048,     0,  1048,     0,     0,
       0,  1048,   591,     0,   230,     0,     0,  1743,  1746,     0,
    1748,     0,  1485,  1487,     0,  1491,     0,     0,   111,   117,
    1048,     0,  1759,  1028,     0,     0,     0,  1052,     0,     0,
       0,  1510,     0,     0,     0,     0,     0,     0,  1047,  1052,
       0,     0,     0,     0,     0,     0,     0,   230,     0,     0,
     161,   117,     0,   230,     0,   201,     0,  1047,  1052,    82,
       0,     0,  1047,     0,     0,     0,    82,    82,  1618,     0,
       0,     0,  1048,  1618,     0,     0,     0,     0,     0,     0,
       0,     0,  1048,     0,   347,     0,     0,     0,     0,     0,
       0,   350,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1562,     0,     0,
       0,     0,     0,  1572,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   230,     0,     0,     0,     0,     0,     0,
       0,     0,  1726,  1728,     0,   480,  1047,     0,     0,   230,
     230,  1735,     0,  1739,  1479,     0,     0,  1483,     0,     0,
       0,     0,     0,     0,     0,  1523,     0,     0,  1752,     0,
       0,     0,     0,     0,     0,     0,   519,     0,     0,     0,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,  1047,  1052,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,   117,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   161,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,    82,     0,     0,   273,     0,     0,  1047,     0,  1052,
     274,   275,   276,     0,     0,     0,   591,     0,  1048,     0,
       0,  1047,  1052,   277,   278,  1048,     0,     0,     0,  1748,
       0,  1897,     0,   230,     0,     0,     0,   279,     0,     0,
    1904,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1050,   289,     0,     0,  1051,     0,     0,     0,
       0,   290,   291,  1637,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,  1047,     0,  1052,     0,
       0,     0,   664,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1047,     0,  1052,     0,  1047,     0,  1052,   230,
     230,     0,     0,     0,     0,   776,     0,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,   117,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,  1886,  1887,  1888,  1889,     0,     0,  1890,     0,     0,
       0,     0,  1726,  1728,     0,  1735,     0,  1739,     0,   850,
       0,     0,   859,  1958,  1961,     0,  1048,     0,  1048,  1899,
       0,   273,   591,  1048,   591,     0,     0,   274,   275,   276,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1050,
     289,  1517,     0,  1051,     0,   117,   117,  1048,   290,   291,
    1048,   292,   293,   294,   295,     0,     0,     0,   591,     0,
       0,     0,   519,     0,   117,     0,     0,     0,     0,     0,
       0,     0,   962,     0,     0,  1047,  1052,  1047,  1052,     0,
       0,  1047,  1738,     0,     0,     0,     0,  1485,  1745,     0,
    1510,     0,  1052,     0,  1048,     0,     0,     0,     0,     0,
    1047,  1052,  1510,     0,     0,   350,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1890,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1966,     0,  1969,     0,     0,     0,     0,
       0,     0,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,  1047,  1052,     0,     0,     0,     0,     0,     0,
       0,     0,  1047,  1052,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,  1998,  1999,     0,     0,
    1966,     0,  1969,     0,     0,  2003,     0,     0,     0,  2005,
       0,     0,     0,     0,     0,  1117,   273,     0,     0,  1117,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   776,   277,   278,     0,     0,     0,
       0,     0,  2005,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1050,   289,     0,     0,  1631,     0,
    2042,     0,  1640,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,  1047,   776,
    1330,     0,     0,  1052,     0,  1047,  1738,     0,  1052,  1510,
       0,  1896,     0,  1898,   776,     2,     0,     0,     0,  1052,
    1903,     0,  1351,     0,     0,   776,   111,   117,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1006,
    1007,  1008,   565,  1009,  1010,  1011,  1012,   570,   571,  1013,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,     0,   663,     0,     0,     0,  1014,   117,     0,     0,
       0,   277,   278,  1015,  1380,   575,   576,   577,     0,     0,
     519,     0,     0,     0,     0,   279,     0,   117,     0,   280,
     281,   282,   283,   284,   285,   286,   287,   850,     0,   288,
    1050,   289,   578,     0,  1051,     0,   220,     0,   579,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   850,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1957,  1960,     0,  1047,  1052,  1047,   682,
       0,     0,     0,  1047,  1738,   683,   684,   685,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,
       0,     0,     0,     0,     0,     0,     0,  1047,  1052,     0,
    1047,  1738,     0,     0,  -360,  2004,     0,     0,     0,     0,
       0,     0,  -360,  -360,     0,     0,     0,  -360,     0,     0,
       0,     0,     0,  -360,  -360,  -360,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -360,     0,
       0,     0,     0,     0,  1047,     0,     0,  -360,  -360,  -360,
     686,     0,     0,  -360,  1439,  -360,  -360,     0,   687,     0,
       0,   688,     0,  -360,  -360,  -360,     0,  -360,  -360,  -360,
    -360,  -360,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   776,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     776,     0,  1117,     0,     0,     0,     0,     0,     0,     0,
    1586,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1117,     0,     0,     0,     0,  -360,   682,  1117,  -360,  -360,
    -360,  -360,   683,   684,   685,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,     0,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,     0,
    -360,  -360,     0,  -360,     0,     0,  -360,  -360,  -360,  -360,
    -360,     0,     0,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
       0,  -360,     0,  -360,  -360,  -360,     0,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,   686,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,   687,  -360,  -360,   688,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -362,  1091,     0,  -362,
    -362,  -362,  -362,  1092,  1093,  1094,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,     0,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,     0,
       0,  -362,  -362,     0,  -362,  1667,     0,  -362,  -362,  -362,
    -362,  -362,     0,     0,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,     0,  -362,  1351,  -362,  -362,  -362,     0,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  1095,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  1096,  -362,  -362,  1097,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
       0,     0,  -467,  1042,     0,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,   519,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,     0,     0,  -467,  -467,     0,
    -467,     0,     0,  -467,  -467,  -467,  -467,  -467,     0,     0,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,     0,  -467,     0,
    -467,  -467,  -467,     0,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -303,  1044,     0,     1,   269,    97,   270,
    -303,   271,   272,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,     2,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,     0,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,     0,     0,   273,  -303,
       0,  -303,     0,     0,   274,   275,   276,  -303,  -303,     0,
       0,  -303,  -303,  -303,  -303,  -303,  -303,   277,   278,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,     0,  -303,
       0,   279,  -303,  -303,  1667,   280,   281,   282,   283,   284,
     285,   286,   287,  -303,  -303,   288,  1138,   289,  -303,  -303,
    1046,  -303,  -303,  -303,  -303,   290,   291,  -303,   292,   293,
     294,   295,  -303,  -303,  -303,  -303,  -303,  -304,   268,     0,
       1,   269,    97,   270,  -304,   271,   272,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,     2,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,     0,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
       0,     0,   273,  -304,     0,  -304,     0,     0,   274,   275,
     276,  -304,  -304,     0,     0,  -304,  -304,  -304,  -304,  -304,
    -304,   277,   278,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,     0,  -304,     0,   279,  -304,  -304,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -304,  -304,   288,
    1050,   289,  -304,  -304,  1051,  -304,  -304,  -304,  -304,   290,
     291,  -304,   292,   293,   294,   295,  -304,  -304,  -304,  -304,
    -304,  -609,   268,     0,     1,   269,    97,   270,  -609,   271,
     272,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,     2,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,     0,  -609,  -609,  -609,  -609,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,     0,     0,   273,  -609,     0,  -609,
       0,     0,   274,   275,   276,  -609,  -609,     0,     0,  -609,
    -609,  -609,  -609,  -609,  -609,   277,   278,  -609,  -609,  -609,
    -609,  -609,  -609,  -609,  -609,  -609,     0,  -609,     0,   279,
    -609,  -609,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -609,  -609,   288,  -609,   289,  -609,  -609,  -609,  -609,
     672,  -609,  1224,   290,   291,  -609,   292,   293,   294,   295,
    -609,  -609,  -609,  -609,  -609,  -610,   268,     0,     1,   269,
      97,   270,  -610,   271,   272,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,     2,  -610,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,     0,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,     0,     0,
     273,  -610,     0,  -610,     0,     0,   274,   275,   276,  -610,
    -610,     0,     0,  -610,  -610,  -610,  -610,  -610,  -610,   277,
     278,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,
       0,  -610,     0,   279,  -610,  -610,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -610,  -610,   288,  -610,   289,
    -610,  -610,  -610,  -610,   672,  -610,  1295,   290,   291,  -610,
     292,   293,   294,   295,  -610,  -610,  -610,  -610,  -610,  -625,
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
    -625,  -625,  -625,  -627,   268,     0,     1,   269,    97,   270,
    -627,   271,   272,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,     2,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,     0,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,     0,     0,   273,  -627,
       0,  -627,     0,     0,   274,   275,   276,  -627,  -627,     0,
       0,  -627,  -627,  -627,  -627,  -627,  -627,   277,   278,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,     0,  -627,
       0,   279,  -627,  -627,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -627,  -627,   288,  1050,   289,  -627,  -627,
    1051,  -627,  -627,  -627,  -627,   290,   291,  -627,   292,   293,
     294,   295,  -627,  -627,  -627,  -627,  -627,  -626,  1044,     0,
       1,   269,    97,   270,  -626,   271,   272,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,     2,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,     0,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
       0,     0,   273,  -626,     0,  -626,     0,     0,   274,   275,
     276,  -626,  -626,     0,     0,  -626,  -626,  -626,  -626,  -626,
    -626,   277,   278,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,     0,  -626,     0,   279,  -626,  -626,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -626,  -626,   288,
    -626,   289,  -626,  -626,  1046,  -626,  -626,  -626,  -626,   290,
     291,  -626,   292,   293,   294,   295,  -626,  -626,  -626,  -626,
    -626,  -356,  1773,     0,  -356,  -356,  -356,  -356,  -356,  -356,
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
    -356,  -356,  -356,  -356,  -356,  -349,  1816,     0,     1,   269,
      97,   270,  -349,   271,   272,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,     2,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,     0,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,     0,     0,
     273,  -349,     0,  -349,     0,     0,   274,   275,   276,  -349,
    -349,     0,     0,  -349,  -349,  -349,  -349,  -349,  -349,   277,
     278,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
       0,  -349,     0,   279,  -349,  -349,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -349,  -349,   288,  -349,   289,
    -349,  -349,  -349,  -349,   672,  -349,  -349,   290,   291,  -349,
     292,   293,   294,   295,  -349,  -349,  -349,  -349,  -349,  -587,
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
     294,   295,  -595,  -595,  -595,  -595,  -595,  -588,   268,     0,
       1,   269,    97,   270,  -588,   271,   272,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,     2,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,     0,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
       0,     0,   273,  -588,     0,  -588,     0,     0,   274,   275,
     276,  -588,  -588,     0,     0,  -588,  -588,  -588,  -588,  -588,
    -588,   277,   278,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,     0,  -588,     0,   279,  -588,  -588,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -588,  -588,   288,
    -588,   289,  -588,  -588,  -588,  -588,   672,  -588,  -588,   290,
     291,  -588,   292,   293,   294,   295,  -588,  -588,  -588,  -588,
    -588,  -596,   268,     0,     1,   269,    97,   270,  -596,   271,
     272,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,     2,
    -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,     0,  -596,  -596,  -596,  -596,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,     0,     0,   273,  -596,     0,  -596,
       0,     0,   274,   275,   276,  -596,  -596,     0,     0,  -596,
    -596,  -596,  -596,  -596,  -596,   277,   278,  -596,  -596,  -596,
    -596,  -596,  -596,  -596,  -596,  -596,     0,  -596,     0,   279,
    -596,  -596,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -596,  -596,   288,  -596,   289,  -596,  -596,  -596,  -596,
     672,  -596,  -596,   290,   291,  -596,   292,   293,   294,   295,
    -596,  -596,  -596,  -596,  -596,  -349,  1839,     0,     1,   269,
      97,   270,  -349,   271,   272,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,     2,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,     0,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,     0,     0,
     273,  -349,     0,  -349,     0,     0,   274,   275,   276,  -349,
    -349,     0,     0,  -349,  -349,  -349,  -349,  -349,  -349,   277,
     278,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
       0,  -349,     0,   279,  -349,  -349,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -349,  -349,   288,  -349,   289,
    -349,  -349,  -349,  -349,   672,  -349,  -349,   290,   291,  -349,
     292,   293,   294,   295,  -349,  -349,  -349,  -349,  -349,  -589,
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
     294,   295,  -597,  -597,  -597,  -597,  -597,  -590,   268,     0,
       1,   269,    97,   270,  -590,   271,   272,  -590,  -590,  -590,
    -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,
    -590,  -590,  -590,  -590,  -590,     2,  -590,  -590,  -590,  -590,
    -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,
    -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,     0,  -590,
    -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,  -590,
       0,     0,   273,  -590,     0,  -590,     0,     0,   274,   275,
     276,  -590,  -590,     0,     0,  -590,  -590,  -590,  -590,  -590,
    -590,   277,   278,  -590,  -590,  -590,  -590,  -590,  -590,  -590,
    -590,  -590,     0,  -590,     0,   279,  -590,  -590,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -590,  -590,   288,
    -590,   289,  -590,  -590,  -590,  -590,   672,  -590,  -590,   290,
     291,  -590,   292,   293,   294,   295,  -590,  -590,  -590,  -590,
    -590,  -598,   268,     0,     1,   269,    97,   270,  -598,   271,
     272,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,
    -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,     2,
    -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,
    -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,  -598,
    -598,  -598,     0,  -598,  -598,  -598,  -598,  -598,  -598,  -598,
    -598,  -598,  -598,  -598,     0,     0,   273,  -598,     0,  -598,
       0,     0,   274,   275,   276,  -598,  -598,     0,     0,  -598,
    -598,  -598,  -598,  -598,  -598,   277,   278,  -598,  -598,  -598,
    -598,  -598,  -598,  -598,  -598,  -598,     0,  -598,     0,   279,
    -598,  -598,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -598,  -598,   288,  -598,   289,  -598,  -598,  -598,  -598,
     672,  -598,  -598,   290,   291,  -598,   292,   293,   294,   295,
    -598,  -598,  -598,  -598,  -598,  -358,  1917,     0,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,     0,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,     0,     0,
    -358,  -358,     0,  -358,     0,     0,  -358,  -358,  -358,  -358,
    -358,     0,     0,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
       0,  -358,     0,  -358,  -358,  -358,     0,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -357,
    1918,     0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
       0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,     0,     0,  -357,  -357,     0,  -357,     0,     0,
    -357,  -357,  -357,  -357,  -357,     0,     0,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,     0,  -357,     0,  -357,  -357,  -357,
       0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -349,  1919,     0,     1,   269,    97,   270,
    -349,   271,   272,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,     2,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,     0,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,     0,     0,   273,  -349,
       0,  -349,     0,     0,   274,   275,   276,  -349,  -349,     0,
       0,  -349,  -349,  -349,  -349,  -349,  -349,   277,   278,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,     0,  -349,
       0,   279,  -349,  -349,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -349,  -349,   288,  -349,   289,  -349,  -349,
    -349,  -349,   672,  -349,  -349,   290,   291,  -349,   292,   293,
     294,   295,  -349,  -349,  -349,  -349,  -349,  -349,  1920,     0,
       1,   269,    97,   270,  -349,   271,   272,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,     2,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,     0,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
       0,     0,   273,  -349,     0,  -349,     0,     0,   274,   275,
     276,  -349,  -349,     0,     0,  -349,  -349,  -349,  -349,  -349,
    -349,   277,   278,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,     0,  -349,     0,   279,  -349,  -349,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -349,  -349,   288,
    -349,   289,  -349,  -349,  -349,  -349,   672,  -349,  -349,   290,
     291,  -349,   292,   293,   294,   295,  -349,  -349,  -349,  -349,
    -349,  -360,   682,     0,  -360,  -360,  -360,  -360,   683,   684,
     685,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,     0,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,     0,     0,  -360,  -360,     0,  -360,
       0,     0,  -360,  -360,  -360,  -360,  -360,     0,     0,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,     0,  -360,     0,  -360,
    -360,  -360,     0,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,   686,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  1040,  -360,  -360,   688,     0,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -467,  1042,     0,  -467,  -467,
    -467,  -467,     0,  -467,  -467,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,     0,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,     0,     0,
    -467,  -467,     0,  -467,     0,     0,  -467,  -467,  -467,  -467,
    -467,     0,     0,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
       0,  -467,     0,  -467,  -467,  -467,     0,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,     0,     0,  -467,  -467,  -467,
    -467,     0,  -467,  -467,  -467,  1043,  -467,  -467,  -467,     0,
    -467,  -467,  -467,  -467, -1064,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1064, -1064, -1064, -1064, -1064, -1064, -1064,
   -1064, -1064, -1064, -1064, -1064, -1064, -1064, -1064, -1064, -1064,
   -1064, -1064, -1064, -1064, -1064,     0, -1064, -1064, -1064, -1064,
   -1064, -1064, -1064, -1064, -1064, -1064, -1064,     0,     0,   273,
   -1064,     0, -1064,     0,     0,   274,   275,   276, -1064, -1064,
       0,     0, -1064, -1064, -1064, -1064, -1064, -1064,   277,   278,
   -1064, -1064, -1064, -1064, -1064, -1064, -1064, -1064, -1064,     0,
   -1064,     0,   279, -1064, -1064,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1050,   289, -1064,
       0,  1051, -1064, -1064,     0, -1064,   290,   291,     0,   292,
     293,   294,   295, -1200,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200,
   -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200,
   -1200, -1200, -1200, -1200,     0, -1200, -1200, -1200, -1200, -1200,
   -1200, -1200, -1200, -1200, -1200, -1200,     0,     0,   273, -1200,
       0, -1200,     0,     0,   274,   275,   276, -1200, -1200,     0,
       0, -1200, -1200, -1200, -1200, -1200, -1200,   277,   278, -1200,
   -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200,     0, -1200,
       0,   279, -1200, -1200,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1050,   289,  1517,     0,
    1051, -1200, -1200,     0, -1200,   290,   291,     0,   292,   293,
     294,   295, -1155,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2, -1155, -1155, -1155, -1155, -1155, -1155, -1155, -1155, -1155,
   -1155, -1155, -1155, -1155, -1155, -1155, -1155, -1155, -1155, -1155,
   -1155, -1155, -1155,     0, -1155, -1155, -1155, -1155, -1155, -1155,
   -1155, -1155, -1155, -1155, -1155,     0,     0,   273, -1155,     0,
   -1155,     0,     0,   274,   275,   276, -1155, -1155,     0,     0,
   -1155, -1155, -1155, -1155, -1155, -1155,   277,   278, -1155, -1155,
   -1155, -1155, -1155, -1155, -1155, -1155, -1155,     0, -1155,     0,
     279, -1155, -1155,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1731,   289, -1155,     0,  1051,
   -1155, -1155,     0, -1155,   290,   291,     0,   292,   293,   294,
     295, -1188,  1737,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
   -1188, -1188, -1188, -1188, -1188, -1188, -1188, -1188, -1188, -1188,
   -1188, -1188, -1188, -1188, -1188, -1188, -1188, -1188, -1188, -1188,
   -1188, -1188,     0,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,     0,     0,   273, -1188,     0, -1188,
       0,     0,   274,   275,   276, -1188, -1188,     0,     0, -1188,
    1014, -1188, -1188, -1188, -1188,   277,   278,  1015, -1188,   575,
     576,   577, -1188, -1188, -1188, -1188,     0, -1188,     0,   279,
   -1188, -1188,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1050,   289,   578,     0,  1051, -1188,
     220,     0,   579,   290,   291,     0,   292,   293,   294,   295,
    -626,  1044,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,     0,  -626,  -626,  -626,  -626,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,     0,     0,   273,  -626,     0,  -626,     0,
       0,   274,   275,   276,  -626,  -626,     0,     0,  -626,  -626,
    -626,  -626,  -626,  -626,   277,   278,  -626,  -626,  -626,  -626,
    -626,  -626,  -626,  -626,  -626,     0,  -626,     0,   279,  -626,
    -626,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  -626,   289,  1045,     0,  1046,  -626,  -626,
       0,  -626,   290,   291,     0,   292,   293,   294,   295, -1179,
    1044,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1179, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
       0, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179,     0,     0,   273, -1179,     0, -1179,     0,     0,
     274,   275,   276, -1179, -1179,     0,     0, -1179, -1179, -1179,
   -1179, -1179, -1179,   277,   278, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179,     0, -1179,     0,   279, -1179, -1179,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1962,   289, -1179,     0,  1046, -1179, -1179,     0,
   -1179,   290,   291,     0,   292,   293,   294,   295, -1180,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2, -1180, -1180, -1180,
   -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180,
   -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180,     0,
   -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180, -1180,
   -1180,     0,     0,   273, -1180,     0, -1180,     0,     0,   274,
     275,   276, -1180, -1180,     0,     0, -1180, -1180, -1180, -1180,
   -1180, -1180,   277,   278, -1180, -1180, -1180, -1180, -1180, -1180,
   -1180, -1180, -1180,     0, -1180,     0,   279, -1180, -1180,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1050,   289,  1963,     0,  1051, -1180, -1180,     0, -1180,
     290,   291,     0,   292,   293,   294,   295, -1174,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1174, -1174, -1174, -1174,
   -1174, -1174, -1174, -1174, -1174, -1174, -1174, -1174, -1174, -1174,
   -1174, -1174, -1174, -1174, -1174, -1174, -1174, -1174,     0,   562,
     563,   564,   565,   566,   567,   568,   569,   570,   571,   572,
       0,     0,   273, -1174,     0, -1174,     0,     0,   274,   275,
     276, -1174, -1174,     0,     0, -1174,  1014, -1174, -1174, -1174,
   -1174,   277,   278,  1015, -1174,   575,   576,   577, -1174, -1174,
   -1174, -1174,     0, -1174,     0,   279, -1174, -1174,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1050,   289,   578,     0,  1051, -1174,   220,     0,   579,   290,
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
       0, -1121, -1121, -1121, -1121, -1144,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   562,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,     0,     0,
     273,   216,     0, -1144,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1144,   573, -1144, -1144, -1144, -1144,   277,
     355,   574,   218,   575,   576,   577, -1144, -1144, -1144, -1144,
       0, -1144,     0,   279, -1144,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     578,     0, -1144, -1144,   220,     0,   579,   290,   291,     0,
     292,   293,   294,   295, -1122,   553,     0, -1122, -1122, -1122,
   -1122,     0, -1122, -1122,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0, -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122,
   -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122,
   -1122, -1122, -1122, -1122, -1122,     0, -1122, -1122, -1122, -1122,
   -1122, -1122, -1122, -1122, -1122, -1122, -1122,     0,     0, -1122,
   -1122,     0, -1122,     0,     0, -1122, -1122, -1122, -1122, -1122,
       0,     0, -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122,
   -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122, -1122,     0,
   -1122,     0, -1122, -1122, -1122,     0, -1122, -1122, -1122, -1122,
   -1122, -1122, -1122, -1122,     0,     0, -1122,     0, -1122,   554,
       0, -1122, -1122, -1122,     0, -1122, -1122, -1122,     0, -1122,
   -1122, -1122, -1122, -1184,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1184, -1184, -1184, -1184, -1184, -1184, -1184, -1184,
   -1184, -1184, -1184, -1184, -1184, -1184, -1184, -1184, -1184, -1184,
   -1184, -1184, -1184, -1184,     0,  1006,  1007,  1008,   565,  1009,
    1010,  1011,  1012,   570,   571,  1013,     0,     0,   273, -1184,
       0, -1184,     0,     0,   274,   275,   276, -1184, -1184,     0,
       0, -1184,  1014, -1184, -1184, -1184, -1184,   277,   278,  1015,
   -1184,   575,   576,   577, -1184, -1184, -1184, -1184,     0, -1184,
       0,   279, -1184, -1184,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   578,     0,
   -1184, -1184,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295, -1202,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2, -1202, -1202, -1202, -1202, -1202, -1202, -1202, -1202, -1202,
   -1202, -1202, -1202, -1202, -1202, -1202, -1202, -1202, -1202, -1202,
   -1202, -1202, -1202,     0, -1202, -1202, -1202, -1202, -1202, -1202,
   -1202, -1202, -1202, -1202, -1202,     0,     0,   273, -1202,     0,
   -1202,     0,     0,   274,   275,   276, -1202, -1202,     0,     0,
   -1202, -1202, -1202, -1202, -1202, -1202,   277,   278, -1202, -1202,
   -1202, -1202, -1202, -1202, -1202, -1202, -1202,     0, -1202,     0,
     279, -1202, -1202,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1025,     0, -1202,
   -1202,   672,     0, -1202,   290,   291,     0,   292,   293,   294,
     295, -1134,  1053,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,     0,     0,   273,   216,     0, -1134,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1134,
     573, -1134, -1134, -1134, -1134,   277,   355,   574,   218,   575,
     576,   577, -1134, -1134, -1134, -1134,     0, -1134,     0,   279,
   -1134,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   578,     0, -1134, -1134,
     220,     0,   579,   290,   291,     0,   292,   293,   294,   295,
   -1138,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,     0,     0,   273,   216,     0, -1138,     0,
       0,   274,   275,   276,    28,    29,     0,     0, -1138,   573,
   -1138, -1138, -1138, -1138,   277,   355,   574,   218,   575,   576,
     577, -1138, -1138, -1138, -1138,     0, -1138,     0,   279, -1138,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   578,     0, -1138, -1138,   220,
       0,   579,   290,   291,     0,   292,   293,   294,   295, -1133,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,   562,   563,   564,   565,   566,   567,   568,   569,   570,
     571,   572,     0,     0,   273,   216,     0, -1133,     0,     0,
     274,   275,   276,    28,    29,     0,     0, -1133,   573, -1133,
   -1133, -1133, -1133,   277,   355,   574,   218,   575,   576,   577,
   -1133, -1133, -1133, -1133,     0, -1133,     0,   279, -1133,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   578,     0, -1133, -1133,   220,     0,
     579,   290,   291,     0,   292,   293,   294,   295, -1137,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
     562,   563,   564,   565,   566,   567,   568,   569,   570,   571,
     572,     0,     0,   273,   216,     0, -1137,     0,     0,   274,
     275,   276,    28,    29,     0,     0, -1137,   573, -1137, -1137,
   -1137, -1137,   277,   355,   574,   218,   575,   576,   577, -1137,
   -1137, -1137, -1137,     0, -1137,     0,   279, -1137,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   578,     0, -1137, -1137,   220,     0,   579,
     290,   291,     0,   292,   293,   294,   295, -1051,  1066,     0,
   -1051, -1051, -1051, -1051,     0, -1051, -1051,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0, -1051, -1051, -1051, -1051, -1051,
   -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051,
   -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051,     0, -1051,
   -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051,
       0,     0, -1051, -1051,     0, -1051,     0,     0, -1051, -1051,
   -1051, -1051, -1051,     0,     0, -1051, -1051, -1051, -1051, -1051,
   -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051, -1051,
   -1051, -1051,     0, -1051,     0, -1051, -1051, -1051,     0, -1051,
   -1051, -1051, -1051, -1051, -1051, -1051, -1051,     0,     0, -1051,
       0, -1051, -1051,     0, -1051, -1051, -1051,     0, -1051, -1051,
   -1051,     0, -1051, -1051, -1051, -1051, -1053,  1067,     0, -1053,
   -1053, -1053, -1053,     0, -1053, -1053,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0, -1053, -1053, -1053, -1053, -1053, -1053,
   -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053,
   -1053, -1053, -1053, -1053, -1053, -1053, -1053,     0, -1053, -1053,
   -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053,     0,
       0, -1053, -1053,     0, -1053,     0,     0, -1053, -1053, -1053,
   -1053, -1053,     0,     0, -1053, -1053, -1053, -1053, -1053, -1053,
   -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053, -1053,
   -1053,     0, -1053,     0, -1053, -1053, -1053,     0, -1053, -1053,
   -1053, -1053, -1053, -1053, -1053, -1053,     0,     0, -1053,     0,
   -1053, -1053,     0, -1053, -1053, -1053,     0, -1053, -1053, -1053,
       0, -1053, -1053, -1053, -1053, -1093,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1093, -1093, -1093, -1093, -1093, -1093,
   -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093,
   -1093, -1093, -1093, -1093, -1093, -1093,     0,   562,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,     0,     0,
     273, -1093,     0, -1093,     0,     0,   274,   275,   276, -1093,
   -1093,     0,     0, -1093,  1014, -1093, -1093, -1093, -1093,   277,
     278,  1015, -1093,   575,   576,   577, -1093, -1093, -1093, -1093,
       0, -1093,     0,   279, -1093, -1093,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     578,     0, -1093, -1093,   220,     0,   579,   290,   291,     0,
     292,   293,   294,   295, -1095,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1095, -1095, -1095, -1095, -1095, -1095, -1095,
   -1095, -1095, -1095, -1095, -1095, -1095, -1095, -1095, -1095, -1095,
   -1095, -1095, -1095, -1095, -1095,     0,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,     0,     0,   273,
   -1095,     0, -1095,     0,     0,   274,   275,   276, -1095, -1095,
       0,     0, -1095,  1014, -1095, -1095, -1095, -1095,   277,   278,
    1015, -1095,   575,   576,   577, -1095, -1095, -1095, -1095,     0,
   -1095,     0,   279, -1095, -1095,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   578,
       0, -1095, -1095,   220,     0,   579,   290,   291,     0,   292,
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
     295, -1136,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,     0,     0,   273,   216,     0, -1136,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1136,
     573, -1136, -1136, -1136, -1136,   277,   355,   574,   218,   575,
     576,   577, -1136, -1136, -1136, -1136,     0, -1136,     0,   279,
   -1136,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   578,     0, -1136, -1136,
     220,     0,   579,   290,   291,     0,   292,   293,   294,   295,
   -1140,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,     0,     0,   273,   216,     0, -1140,     0,
       0,   274,   275,   276,    28,    29,     0,     0, -1140,   573,
   -1140, -1140, -1140, -1140,   277,   355,   574,   218,   575,   576,
     577, -1140, -1140, -1140, -1140,     0, -1140,     0,   279, -1140,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   578,     0, -1140, -1140,   220,
       0,   579,   290,   291,     0,   292,   293,   294,   295, -1131,
     553,     0, -1131, -1131, -1131, -1131,     0, -1131, -1131,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0, -1131, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
       0, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131, -1131,     0,     0, -1131, -1131,     0, -1131,     0,     0,
   -1131, -1131, -1131, -1131, -1131,     0,     0, -1131, -1131, -1131,
   -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,
   -1131, -1131, -1131, -1131,     0, -1131,     0, -1131, -1131, -1131,
       0, -1131, -1131, -1131, -1131, -1131, -1131, -1131, -1131,     0,
       0, -1131,     0, -1131,   554,     0, -1131, -1131, -1131,     0,
   -1131, -1131, -1131,     0, -1131, -1131, -1131, -1131, -1132,   553,
       0, -1132, -1132, -1132, -1132,     0, -1132, -1132,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1132, -1132, -1132, -1132,
   -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132,
   -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132,     0,
   -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132,
   -1132,     0,     0, -1132, -1132,     0, -1132,     0,     0, -1132,
   -1132, -1132, -1132, -1132,     0,     0, -1132, -1132, -1132, -1132,
   -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132,
   -1132, -1132, -1132,     0, -1132,     0, -1132, -1132, -1132,     0,
   -1132, -1132, -1132, -1132, -1132, -1132, -1132, -1132,     0,     0,
   -1132,     0, -1132,   554,     0, -1132, -1132, -1132,     0, -1132,
   -1132, -1132,     0, -1132, -1132, -1132, -1132,  -981,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,     0,  -981,
    -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
       0,     0,   273,  -981,     0,  -981,     0,     0,   274,   275,
     276,  -981,  -981,     0,     0,  -981,  -981,  -981,  -981,  -981,
    -981,   277,   278,  -981,  -981,  -981,  -981,  -981,  -981,  -981,
    -981,  -981,     0,  -981,     0,   279,  -981,  -981,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,  -981,     0,  1710,  1711,   920,     0,  -981,   290,
     291,     0,   292,   293,   294,   295,  -983,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,  -983,  -983,  -983,  -983,  -983,
    -983,  -983,  -983,  -983,  -983,  -983,  -983,  -983,  -983,  -983,
    -983,  -983,  -983,  -983,  -983,  -983,  -983,     0,  -983,  -983,
    -983,  -983,  -983,  -983,  -983,  -983,  -983,  -983,  -983,     0,
       0,   273,  -983,     0,  -983,     0,     0,   274,   275,   276,
    -983,  -983,     0,     0,  -983,  -983,  -983,  -983,  -983,  -983,
     277,   278,  -983,  -983,  -983,  -983,  -983,  -983,  -983,  -983,
    -983,     0,  -983,     0,   279,  -983,  -983,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  -983,     0,  -983,  1878,   920,     0,  -983,   290,   291,
       0,   292,   293,   294,   295,  -977,  1881,     0,  -977,  -977,
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
    -977,  -977,  -977,  -977, -1181,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1181, -1181, -1181, -1181, -1181, -1181, -1181,
   -1181, -1181, -1181, -1181, -1181, -1181, -1181, -1181, -1181, -1181,
   -1181, -1181, -1181, -1181, -1181,     0, -1181, -1181, -1181, -1181,
   -1181, -1181, -1181, -1181, -1181, -1181, -1181,     0,     0,   273,
   -1181,     0, -1181,     0,     0,   274,   275,   276, -1181, -1181,
       0,     0, -1181, -1181, -1181, -1181, -1181, -1181,   277,   278,
   -1181, -1181, -1181, -1181, -1181, -1181, -1181, -1181, -1181,     0,
   -1181,     0,   279, -1181, -1181,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289, -1181,
       0, -1181, -1181, -1181,     0, -1181,   290,   291,     0,   292,
     293,   294,   295,  -978,  1954,     0,  -978,  -978,  -978,  -978,
       0,  -978,  -978,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,
    -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,
    -978,  -978,  -978,  -978,     0,  -978,  -978,  -978,  -978,  -978,
    -978,  -978,  -978,  -978,  -978,  -978,     0,     0,  -978,  -978,
       0,  -978,     0,     0,  -978,  -978,  -978,  -978,  -978,     0,
       0,  -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,
    -978,  -978,  -978,  -978,  -978,  -978,  -978,  -978,     0,  -978,
       0,  -978,  -978,  -978,     0,  -978,  -978,  -978,  -978,  -978,
    -978,  -978,  -978,     0,     0,  -978,     0,  -978,  -978,     0,
    -978,  -978,  -978,     0,  -978,  -978,  -978,     0,  -978,  -978,
    -978,  -978,  -907,   522,     0,  -907,  -907,  -907,  -907,     0,
    -907,  -907,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,
    -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,
    -907,  -907,  -907,     0,     0,  -907,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  -907,  -907,     0,
    -907,     0,     0,  -907,  -907,  -907,  -907,  -907,     0,     0,
    -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,  -907,
    -907,     0,     0,  -907,  -907,  -907,  -907,     0,  -907,     0,
    -907,  -907,  -907,     0,  -907,  -907,  -907,  -907,  -907,  -907,
    -907,  -907,     0,     0,  -907,   523,  -907,  -907,     0,   524,
    -907,  -907,     0,     0,  -907,  -907,     0,  -907,  -907,  -907,
    -907,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   355,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   894,     0,   895,   896,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,  1147,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,   216,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   277,   355,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   894,     0,   895,  -109,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,  1154,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   355,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   894,     0,   895,   -97,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,  1158,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   355,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   894,
       0,   895,  -101,   672,     0,     0,   290,   291,     0,   292,
     293,   294,   295,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   355,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1423,     0,   895,
     -64,   672,     0,     0,   290,   291,     0,   292,   293,   294,
     295,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   355,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  1432,     0,   895,  1433,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,  1476,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,   216,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   277,   355,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   894,     0,   895,   -80,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   355,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  1432,     0,   895,  -106,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   355,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1432,
       0,   895,   -96,   672,     0,     0,   290,   291,     0,   292,
     293,   294,   295,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   355,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1432,     0,   895,
    -100,   672,     0,     0,   290,   291,     0,   292,   293,   294,
     295,  1675,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   355,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   894,     0,   895,   -87,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,   216,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   277,   355,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,  1432,     0,   895,   -77,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   355,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  1432,     0,   895,   -84,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   355,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,   268,   289,     1,
     269,    97,   270,     0,   271,   272,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   778,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   355,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,   268,
     289,     1,   269,    97,   270,     0,   271,   272,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,   277,   380,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,    40,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,   661,   289,     0,     0,     0,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1079,    27,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
     277,   380,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,    40,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   638,   661,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,   277,   380,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,    40,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,   268,   289,     1,
     269,    97,   270,   220,   271,   272,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,    27,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
     277,   380,    38,    39,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   279,     0,    40,     0,   280,   281,
     282,   283,   284,   285,   286,   801,     0,     0,   802,   661,
     289,     2,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1006,  1007,  1008,   565,  1009,
    1010,  1011,  1012,   570,   571,  1013,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,  1014,     0,     0,     0,     0,   277,   278,  1015,
       0,   575,   576,   577,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   578,     0,
       0,     0,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
    1014,     0,     0,     0,     0,   277,   278,  1015,     0,   575,
     576,   577,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   578,     0,     0,     0,
     220,     0,   579,   290,   291,     0,   292,   293,   294,   295,
    1734,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1006,  1007,  1008,   565,  1009,  1010,  1011,  1012,   570,
     571,  1013,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,     0,  1014,     0,
       0,     0,     0,   277,   278,  1015,     0,   575,   576,   577,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   578,     0,     0,     0,   220,     0,
     579,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1050,   289,     0,     0,  1631,     0,     0,     0,  1652,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1755,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1050,   289,     0,     0,  1631,     0,     0,
       0,  1656,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1050,   289,  1756,     0,
    1051,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1050,
     289,     0,     0,  1051,     0,     0,     0,     0,   290,   291,
    1778,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1050,   289,     0,     0,  1051,     0,     0,     0,
       0,   290,   291,  1782,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1900,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1050,   289,  1756,     0,  1051,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1050,   289,
    1756,     0,  1051,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1964,   289,  1965,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,  1993,  1994,
     920,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1235,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1050,   289,  1963,
       0,  1051,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1236,   289,     0,     0,     0,     0,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  1025,     0,     0,     0,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1506,     0,     1,
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
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1507,
     289,  1508,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1556,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1516,     0,  1046,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1566,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1557,   289,     0,     0,     0,
       0,   672,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1567,   289,
       0,     0,     0,     0,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1044,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1599,   289,     0,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1044,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,  1046,     0,
       0,     0,     0,   290,   291,  1625,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1044,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,  1628,     0,     0,     0,  1629,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1044,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,  1046,     0,     0,     0,     0,   290,
     291,  1636,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1044,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1628,     0,     0,
       0,  1638,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1044,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
    1628,     0,     0,     0,  1650,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1044,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,  1628,     0,     0,     0,  1654,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1044,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1730,   289,     0,     0,  1046,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1732,   289,     0,     0,  1046,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1733,   289,
       0,     0,  1051,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1736,   289,     0,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1044,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1507,   289,  1508,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1757,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1754,
       0,  1046,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1044,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1758,   289,  1508,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1044,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1046,     0,     0,
       0,     0,   290,   291,  1777,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
    1046,     0,     0,     0,     0,   290,   291,  1781,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1044,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1731,
     289,     0,     0,  1051,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1892,   289,     0,     0,  1046,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1044,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1758,   289,  1508,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1044,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1968,   289,
       0,     0,  1046,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1044,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  2000,   289,     0,     0,  1046,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  2001,   289,     0,     0,  1046,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1044,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,  2028,   920,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    2029,   289,     0,     0,  1046,     0,     0,     0,     0,   290,
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
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1198,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,   661,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1203,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1269,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1274,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,   672,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1370,     0,     1,   269,    97,   270,     0,   271,   272,
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
    1489,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
    1462,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1490,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1526,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,     0,     0,  1493,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1535,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,  1700,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1703,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,  1707,     0,
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
       0,     0,   288,  1744,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1532,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,  1802,     0,   289,     0,     0,
       0,     0,  1803,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1538,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1901,     0,     1,   269,    97,   270,     0,
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
     286,   287,     0,     0,   288,  1902,   289,     0,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1959,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,  1803,     0,     0,
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
     276,  1182,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   638,
       0,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1185,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1251,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1254,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1532,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1538,     0,     1,   269,
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
       0,   837,  -776,     1,   269,    97,   290,   291,     0,     0,
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
       0,     0,   389,     0,   390,   391,     0,   834,  -777,     1,
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
     390,   391,     0,   837,  -773,     1,   269,    97,   290,   291,
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
    -774,     1,   269,    97,   290,   291,     0,     0,     0,     0,
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
     389,     0,   390,   391,     0,   837,  -779,     1,   269,    97,
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
       0,   941,  -780,     1,   269,    97,   290,   291,     0,     0,
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
    -759,     1,   269,    97,   290,   291,     0,     0,     0,     0,
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
     389,     0,   390,   391,     0,   834,  -760,     1,   269,    97,
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
       0,   837,  -762,     1,   269,    97,   290,   291,     0,     0,
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
       0,     0,   389,     0,   390,   391,     0,   834,  -763,     1,
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
     390,   391,     0,   837,  -687,     1,   269,    97,   290,   291,
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
    -688,     1,   269,    97,   290,   291,     0,     0,     0,     0,
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
     389,     0,   390,   391,     0,   837,  -680,     1,   269,    97,
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
       0,   834,  -681,     1,   269,    97,   290,   291,     0,     0,
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
       0,     0,   389,     0,   390,   391,     0,   837,  -676,     1,
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
     390,   391,     0,   834,  -677,     1,   269,    97,   290,   291,
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
    -666,     1,   269,    97,   290,   291,     0,     0,     0,     0,
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
     389,     0,   390,   391,     0,   834,  -667,     1,   269,    97,
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
       0,   837,  -661,     1,   269,    97,   290,   291,     0,     0,
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
       0,     0,   389,     0,   390,   391,     0,   834,  -662,     1,
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
     390,   391,     0,   837,  -678,     1,   269,    97,   290,   291,
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
    -679,     1,   269,    97,   290,   291,     0,     0,     0,     0,
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
     383,   384,   385,     0,   386,     0,   387,   388,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,   171,
     389,     1,   390,   391,     0,     0,     0,     0,     0,     0,
     290,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   177,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0, -1187,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
     774,   949,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   508, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187,
   -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187,
   -1187, -1187, -1187, -1187,     0, -1187, -1187, -1187, -1187, -1187,
   -1187, -1187, -1187, -1187, -1187, -1187,     0,     0,     0, -1187,
       0, -1187,     0,     0,     0,     0,     0, -1187, -1187,     0,
       0, -1187, -1187, -1187, -1187, -1187, -1187,     0,     0, -1187,
   -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1187, -1170, -1187,
       0,     0, -1187, -1187,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1187,     0,
       0, -1187, -1187,     0, -1187,     0,     0, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,     0,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170,     0,     0,     0, -1170,     0, -1170,     0,     0,     0,
       0,     0, -1170, -1170,     0,     0, -1170, -1170, -1170, -1170,
   -1170, -1170,     0,     0, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1172, -1170,     0,     0, -1170, -1170,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1170,     0,     0, -1170, -1170,     0, -1170,
       0,     0, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172,
   -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172,
   -1172, -1172, -1172, -1172,     0, -1172, -1172, -1172, -1172, -1172,
   -1172, -1172, -1172, -1172, -1172, -1172,     0,     0,     0, -1172,
       0, -1172,     0,     0,     0,     0,     0, -1172, -1172,     0,
       0, -1172, -1172, -1172, -1172, -1172, -1172,     0,     0, -1172,
   -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1169, -1172,
       0,     0, -1172, -1172,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1172,     0,
       0, -1172, -1172,     0, -1172,     0,     0, -1169, -1169, -1169,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,     0,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169,     0,     0,     0, -1169,     0, -1169,     0,     0,     0,
       0,     0, -1169, -1169,     0,     0, -1169, -1169, -1169, -1169,
   -1169, -1169,     0,     0, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169, -1169, -1169, -1171, -1169,     0,     0, -1169, -1169,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1169, -1169,     0, -1169,
       0,     0, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171,
   -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171,
   -1171, -1171, -1171, -1171,     0, -1171, -1171, -1171, -1171, -1171,
   -1171, -1171, -1171, -1171, -1171, -1171,     0,     0,     0, -1171,
       0, -1171,     0,     0,     0,     0,     0, -1171, -1171,     0,
       0, -1171, -1171, -1171, -1171, -1171, -1171,     0,     0, -1171,
   -1171, -1171, -1171, -1171, -1171, -1171, -1171, -1171,     0, -1171,
       1,     0, -1171, -1171,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1171, -1171,     0, -1171,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,   219,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,   774,
       0,     0,     0,     0,     0,     0,  1354,     0,     0,     0,
     508,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,   219,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,  1107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1108,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,   219,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,  1107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1130,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,   219,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,  1107,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1591,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   216,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,     0,   217,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,   219,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,  1107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1606,     2,     3,     4,   239,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,   240,    31,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,     0,    40,     0,     0,
       0,     0,    42,     0,     0,     0,    43,     0,     0,    44,
       0,     0,     0,     0,     0,     0,     0,     0,   241,     2,
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
       0,   842,     0,     0,  1394,     0,     0,     0,     0,     0,
     844,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,   555,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,    44,     0,     0,     0,     0,
       0,     0,     0,     0,   844,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,     0,
    1418,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   220,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   -65,     0,     0,     0,     0,
       0,     0,     0,   -65,   -65,     0,     0,     0,   -65,     0,
       0,     0,     0,     0,   -65,   -65,   -65,     0,     0,     0,
       0,  1616,     0,     0,     0,     0,     0,     0,     0,   -65,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1419,     0,  1420,   -65,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,  1620,     0,     0,     0,     0,     0,     0,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -110,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   216,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,     0,   217,    38,   218,     0,
       0,     0,     0,  1621,     0,     0,     0,     0,     0,     0,
       0,   219,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   -94,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,  1725,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     -95,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,  1867,     0,     0,     0,     0,
       0,     0,     0,   219,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   -79,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0, -1250,   258,     0,     1,     0,
       0,     0,     0,     0,   219,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   -86,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,    30,    31,     0,    32,    33,    34,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,    40,    41,     0,     0,     0,
      42,     0,     0,     0,    43,     0,     0,    44,     0,     0,
      45,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
     758,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1308,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,     1,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,   758,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1648,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     0,   147,     0,     1,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,   758,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1649,     2,     3,     4,   148,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,   147,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,    44,     0,
       0,   149,     2,     3,     4,   148,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,   542,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,    44,     0,     0,   149,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,  -918,     0,  -918,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     0,     0,   543,  -918,  -918,
    -918,  -918,  -918,  -918,  -918,  -918,  -918,  -918,  -918,  -918,
    -918,  -918,  -918,  -918,  -918,  -918,  -918,  -918,  -918,  -918,
    -918,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -918,     0,     0,     0,
       0,     0,     0,     0,  -918,  -918,     0,     0,     0,  -918,
       0,     0,     0,     0,     0,  -918,  -918,  -918,     0,     0,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
    -918,     0,     0,     0,     0,     0,     0,     0,     0,  -918,
       0,     0,  -918,     0,     0,  -918,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,    30,    31,     0,    32,    33,    34,
      35,    36,     0,    37,    38,    39, -1251,   250,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    40,    41,
       0,     0,     0,    42,     0,     0,     0,    43,     0,     0,
      44,     0,     0,    45,     2,     3,     4,   148,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,    33,    34,    35,    36,
       0,    37,    38,    39,   171,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,    44,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,   171,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,  1107,  1578,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   177,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,   854,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   178,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   177,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,   171,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     178,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   177,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,   171,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1459,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   177,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,   147,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1792,     0,     2,     3,     4,   148,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,   147,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
      44,     0,     0,     2,     3,     4,   148,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,   798,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,    44,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   799,     2,     3,     4,   148,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,    44,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   653,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1358,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,    44,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
     969,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,   758,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
     970,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,   975,     0,     1,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,   976,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   177,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
     981,     0,     1,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
     982,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,   783,     0,     1,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       1,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,   934,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   177,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     1,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,   987,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   177,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     1,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     1,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     1,     0,     0,    32,   432,   433,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     1,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   457,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     1,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   219,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,     0,   217,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
     774,  1575,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   508,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,   774,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   508,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   220,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1429,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   219
};

static const short int yycheck[] =
{
       0,    83,   652,   127,   507,   841,   507,   577,   873,   517,
      75,   519,   484,   139,    75,    75,   140,    76,   142,   841,
     144,   767,    78,    91,   767,   771,   484,   136,   771,   732,
      30,    31,    51,   117,   763,     1,   906,   907,   908,     1,
      75,    41,   763,   907,    44,  1500,    91,    78,   236,    84,
     906,    51,   908,   127,    84,   163,    56,  1512,    58,    75,
      76,   767,  1115,     1,  1117,   771,   140,   906,   142,   908,
     144,     1,   686,    84,    74,    75,    76,   161,    78,    56,
      80,   163,    82,   306,    84,   104,     3,   305,   654,    84,
       5,    91,    92,   139,   291,    95,    91,    17,     3,    30,
       5,   319,     3,   484,   104,   323,   370,   107,     5,    51,
       3,    42,   427,   428,    69,    70,   116,   117,   732,   119,
       3,   306,     5,   123,   124,   125,    17,   127,   236,   672,
     377,   131,    74,   133,     3,   678,   136,   137,   681,   139,
     140,   141,   142,     1,   144,   721,     5,   255,   672,    75,
     893,   170,   234,   153,   678,   121,   118,   681,    84,     1,
     160,   161,     3,   118,     1,    91,     3,    98,    99,   110,
     170,   102,   231,   749,   112,   191,   153,   424,   119,   244,
     180,     1,   182,   244,   244,   115,   254,     3,   256,   131,
     190,   191,   109,   254,   254,   112,   112,   499,     3,     5,
       5,   201,     1,   203,     3,   120,   123,   499,   113,   254,
       1,   256,   113,   133,   311,   231,   121,   170,     1,   254,
     117,   256,   524,   793,     1,   527,   256,   529,   244,   531,
     113,   231,   524,   599,   600,   527,   236,   529,   121,   531,
     240,  1106,   133,   507,   244,   256,   372,   373,   190,     1,
     119,   906,    17,   908,   254,     3,   256,   115,    74,   117,
     118,   256,     1,    79,     3,     3,   350,   775,   776,     1,
      86,   774,     0,   774,   274,   116,   118,   254,  1148,  1149,
     280,   118,     1,     3,  1148,  1155,  1156,     1,   288,  1159,
    1160,  1155,    17,  1149,  1749,  1159,   112,     1,   118,     3,
    1156,     1,   112,     1,  1160,   686,     1,   123,   113,   240,
    1149,   117,   394,   395,   396,   397,   121,  1156,   906,   118,
     908,  1160,   275,    79,   115,     3,   117,   373,   281,     3,
     256,     1,   115,   115,   117,   118,   234,   235,     1,     1,
     797,   118,   342,   343,   234,   235,     3,    75,     1,     1,
     350,   732,   352,   117,     3,     1,    84,     3,     0,   290,
     124,   109,   110,    91,    92,   121,   118,   585,   133,   425,
     588,   119,   372,   373,     3,     3,   376,   377,   116,   118,
     504,     3,   506,   383,     5,   117,   386,   387,   388,   389,
     390,   500,  1095,   113,   425,  1984,   480,   117,  1101,   118,
      28,   121,   112,   485,   118,   669,    28,   112,   133,   597,
     598,   599,   600,   123,   118,   872,    73,   115,   118,   419,
     420,   421,   110,   118,   424,   425,     3,   427,   428,   118,
     504,   431,   506,    75,   112,   519,   436,   118,     3,   113,
     440,   441,    84,   117,    90,   445,   446,   121,   118,    91,
      92,  2040,   995,   119,   962,   118,   118,   457,   458,     1,
     963,   118,   963,   191,   113,   118,   118,   467,   468,     1,
    1335,   995,   472,   473,   490,   491,   476,   477,     1,   118,
     480,  1095,   482,   706,   707,   708,   115,  1101,   117,   508,
     490,   491,   113,   509,  1149,   495,    73,   119,   440,   499,
     500,  1156,     5,   700,   504,  1160,   506,   507,   508,   509,
     774,   511,   620,   736,   737,   738,   244,   517,   537,   519,
       1,   706,   707,   708,   524,   789,   254,   527,   256,   529,
     727,   531,  1397,  1586,   849,   850,   800,   537,   735,   920,
      77,  1107,    74,   790,   859,     1,   861,    79,   113,     3,
     550,   736,   737,   738,    86,   508,   624,     0,   755,  1125,
     288,  1149,   311,   624,   624,     5,  1132,   567,  1156,   569,
     652,   113,  1160,     3,     5,   117,     3,   577,     5,   624,
     112,   113,  1311,  1312,   121,   117,  1332,   485,     3,  1332,
    1311,  1312,   115,   109,   117,   485,   112,   597,   598,   599,
     600,    28,   244,  1439,  1107,     3,  1107,  1477,  1478,   562,
     113,     5,   254,  1477,   256,   615,   616,  1439,   715,   716,
       3,   718,  1478,   116,   624,   872,  1332,   112,     3,   629,
     109,     3,   998,   112,     3,  1001,   117,   110,   123,  1478,
       1,   767,   115,   643,   123,   771,   743,   744,   745,   746,
     650,   651,   652,   653,   654,   655,   112,   113,     3,   113,
    1041,   117,  1408,     3,  1410,  1046,   968,   914,  1049,   669,
    1051,   115,   974,  1039,   616,   115,   968,     3,   980,   117,
     110,   612,   613,   683,   986,   115,   118,   687,  1054,  1055,
    1056,  1057,   119,    65,   986,   109,   424,     3,   117,   597,
     598,   599,   600,    83,   119,     3,  1412,   597,   598,   599,
     600,   109,   110,     1,  1095,   129,   130,     3,   112,  1584,
    1101,   119,    28,   621,     1,  1590,   657,   658,   659,   729,
      28,   621,     3,   733,    74,   377,   119,   109,   110,    79,
     109,   110,   824,   825,   119,   827,    86,   119,   830,   831,
     119,   112,   113,   110,   880,   881,   117,    28,   758,   759,
     760,   885,   119,   763,   764,   765,   892,   767,   113,   109,
     770,   771,   112,     3,   774,     5,   119,   886,   778,   779,
     723,   121,   424,   163,   110,   111,    74,    73,   788,   789,
     790,    79,     1,   793,     3,  1660,   103,   797,    86,   799,
     800,    31,   802,     1,   804,   118,  1676,  1677,   751,   722,
     998,   885,  1676,  1001,   112,   897,   724,   113,     7,     8,
       9,  1677,  1330,  1478,  1088,   725,     3,   115,   116,   117,
     939,   940,   118,  1376,   880,   881,   113,   750,  1677,   855,
     117,  1105,   842,   112,   752,   845,   788,     3,   119,   849,
     850,  1039,  1376,   753,   234,   855,   236,   113,   111,   859,
       1,   861,   862,   170,   117,    74,  1054,  1055,  1056,  1057,
      79,   871,   872,   873,     3,   255,   754,    86,   962,   116,
     880,   881,   236,   883,   121,   885,   886,     7,     8,     9,
    1478,   844,   892,   893,   772,   773,   624,   828,   112,    28,
     109,   629,     3,   112,     1,   112,   115,     3,   117,   118,
       7,     8,     9,   118,   914,   113,   123,     3,     3,   117,
       5,   116,  1145,   112,   652,    11,     3,    28,     1,   882,
       3,   120,   109,   110,   123,  1800,     7,     8,     9,   939,
     940,   669,   721,   943,   944,   964,    31,   947,   948,  1073,
     950,    28,   116,   109,   110,  1152,   112,   121,  1608,   111,
    1145,  1531,   962,   963,   964,   117,   715,   716,   968,   718,
     749,   971,   113,  1445,   974,   111,   117,   977,   709,   710,
     980,   117,   624,   983,   291,    11,   986,  1445,   988,   119,
     119,   121,   112,   993,   743,   744,   745,   746,   998,  1073,
     120,  1001,   115,   123,     3,     1,   119,    77,   739,   740,
    1010,   964,  1012,   109,   394,   112,   112,   397,   119,   116,
     722,  1021,  1677,   120,   112,   111,   123,   119,   508,  1865,
     116,   117,   760,   119,  1034,   112,   109,   110,   112,  1039,
    1040,     7,     8,     9,   117,   111,  1763,    11,   750,   120,
     109,   117,   123,  1006,  1054,  1055,  1056,  1057,     3,   115,
    1079,   112,   790,   119,  1445,  1380,     3,  1382,   112,   797,
     129,   130,  1072,  1073,   802,    74,   804,   112,    74,  1079,
      79,  1081,   562,    79,  1587,   111,  1587,    86,  1088,  1677,
      86,   117,  1092,   119,   112,     1,  1096,   111,  1098,  1030,
      12,    13,  1102,   117,   112,   485,  1106,  1107,    11,   112,
       7,     8,     9,   112,   119,  1481,  1482,   132,   723,   115,
     116,   117,     7,     8,     9,  1125,  1492,   855,  1600,    74,
    1876,  1877,  1132,    74,    79,   724,   115,    74,    79,  1139,
     119,    86,    79,   125,   872,    86,   751,   111,   790,    86,
     131,     3,  1802,   117,   120,  1108,  1054,  1055,  1056,  1057,
       7,     8,     9,   752,  1054,  1055,  1056,  1057,    74,     3,
     113,   478,   109,    79,   119,   725,  1074,  1130,   119,    16,
      86,   118,   113,     3,  1074,     5,   117,   113,    12,    13,
     121,   117,   125,  1910,     3,  1912,   111,  1767,   110,   111,
      74,   508,   117,   753,  1468,    79,  1332,   754,   111,   115,
     116,   117,    86,   116,   117,  1146,   119,   597,   598,   599,
     600,   118,    74,   120,   113,   772,   773,    79,   117,   536,
     872,    65,    44,    45,    86,   120,   131,     3,  1710,     3,
     620,   621,  1623,   597,   598,   599,   600,  1628,   711,   712,
    1631,   132,  1710,   111,  1635,   562,  1973,   109,  1975,   117,
    1977,    16,    74,    75,   113,    74,   118,    79,   115,   116,
      79,   119,   914,   120,    86,   109,   110,    86,   741,   742,
     126,   127,  1408,  1409,  1410,  1411,   110,   111,   113,   109,
     110,   119,   117,  1481,  1482,    44,    45,   109,  2015,  2016,
     109,  2018,  1302,  1303,  1492,   116,  1306,  1307,    74,   118,
      74,  1311,  1312,    79,   112,    79,    74,  2034,   111,   113,
      86,    79,    86,   117,   117,    74,    75,   121,    86,  1710,
      79,   110,  1332,  2050,   119,  1335,   121,    86,   709,   710,
     119,  1341,   121,   109,  1344,   109,   112,   113,   112,   656,
    1350,  1351,   119,   660,   121,   113,  1356,  1357,   711,   712,
    1088,   111,   119,   112,   844,   672,   111,   117,   739,   740,
    1736,   678,   117,   113,   681,   113,  1307,   117,  1378,   117,
    1380,   121,  1382,   121,   111,  1385,   111,   113,   741,   742,
     117,   117,   117,   700,  1775,    69,    70,  1397,     1,  1780,
       3,   111,   882,  1403,  1404,    10,    11,   117,  1408,  1409,
    1410,  1411,     1,   124,     3,  1541,   127,    91,  1988,   115,
     727,    95,  1803,    97,    88,    89,    90,   115,   735,   140,
    1383,   142,   117,   144,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   118,   719,   720,   113,   755,   719,
     720,   117,  1468,  1650,  1651,  1652,  1653,  1654,  1655,  1656,
    1657,  1933,   113,   113,   110,   113,   117,   117,  1468,   117,
     119,    74,   121,   747,   748,  1933,    79,   747,   748,    14,
      15,  1481,  1482,    86,   964,   126,   127,   113,    44,    45,
    1490,   117,  1492,  1493,   113,   113,  1496,   113,   117,   117,
    1500,   117,   110,   115,  1504,   117,   109,  1507,   119,   112,
     121,   115,   115,   117,   117,   118,   115,   897,    74,    75,
    1992,  1993,   110,    79,   137,     1,  1006,     3,   141,   116,
      86,  1531,   116,   119,   841,  1993,  1902,   844,  1904,   117,
     115,  1541,   117,   119,     1,   121,     3,   119,  1736,   121,
     124,     1,  1933,     3,   124,     1,   112,     3,     1,   270,
       3,   115,   115,   117,   117,    10,    11,  1691,   119,  1693,
     121,     1,  1503,     3,     1,   882,     3,     1,     1,     3,
       3,   115,  1664,   117,  1584,    14,    15,  1587,  1519,   119,
    1590,  1715,   115,  1717,   117,   115,   124,   117,   119,   906,
     121,   908,  1968,  1420,   119,  1422,   117,  1420,  1608,  1422,
    1610,  1611,  1993,   117,   822,   823,   117,  1691,   998,  1693,
     117,  1001,   822,   823,   490,   491,   490,   491,  1108,   597,
     598,   118,   597,   598,   119,   115,  1589,   121,  1591,    91,
      92,  1715,   112,  1717,   998,  1645,   112,  1001,   764,   765,
    1130,   112,  1605,  1606,   112,   115,   115,   964,   112,  1039,
    1660,   116,   115,   119,   115,   113,   115,  1667,  1865,  1669,
     110,   115,   119,   115,  1054,  1055,  1056,  1057,   110,  1679,
       0,   118,   115,   119,   115,  1039,   124,   121,   995,   115,
     118,  1691,   110,  1693,  1074,   115,   118,   118,   113,  1006,
    1054,  1055,  1056,  1057,   113,   113,   113,   124,   419,   420,
     124,   113,    56,   112,  1902,  1715,  1904,  1717,   121,   112,
     431,   121,   112,   115,   115,  1032,  1033,   115,   112,   110,
    1730,  1731,  1732,  1733,   445,   446,  1736,   110,   115,   113,
    1468,  1741,  1742,   113,  1744,   113,  1746,   110,   112,  1873,
    1876,  1877,   112,   110,   123,    75,   467,   468,  1758,   113,
     113,   472,   473,   113,    84,   476,   477,  1767,   123,  1992,
    1770,    91,    92,   118,   117,   117,   113,   123,    56,   110,
    1968,   121,   121,   121,   113,   121,   121,   121,   121,   121,
     113,   113,    11,   504,   115,   506,   113,   113,   124,  1873,
    1800,  1108,  1802,     0,   112,   125,   124,  1992,   113,   124,
     121,   121,   112,   112,   123,   113,   113,   137,   113,   113,
     113,   141,   113,  1130,   113,    64,    64,   112,   124,   115,
    1761,   123,  1763,   116,   124,   119,   124,   124,   119,   121,
     115,   121,  1149,   116,    41,  1152,   116,   115,  1801,  1156,
     119,   113,   113,  1160,    51,  2023,   119,   124,  1811,   124,
     124,    58,   113,   113,   124,   124,   124,   124,   124,   113,
     113,  1871,  1872,  1873,  1874,  1875,  1876,  1877,    75,   115,
    1608,    78,  1882,  1883,  1884,  1885,    83,    84,   113,   124,
     124,   113,  1892,   124,    91,    92,   124,   115,   115,  1981,
    1982,   115,  1902,  1383,  1904,   115,   113,   104,   892,   115,
     107,   115,   115,  1913,  1914,  1868,  1869,   115,   431,   115,
     115,   115,   119,   115,   244,   115,   115,   124,   125,   431,
     127,   431,   431,   431,   254,   770,   256,   883,   655,  1378,
     137,   914,   139,   140,   141,   142,   270,   144,   254,   388,
    1950,  1951,   254,   280,   853,  1955,  1956,  1803,   425,  1959,
     231,  1961,  1972,   270,  1964,    91,   163,   270,  1968,    84,
     236,    84,    92,   170,    84,    -1,  1645,    -1,    -1,  1910,
      -1,  1912,  1982,    -1,  1984,   182,    -1,    -1,  1988,    -1,
     125,    -1,    -1,   306,   191,    -1,    -1,    -1,    -1,    -1,
      -1,  2001,   137,    -1,    -1,    -1,   141,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  2023,  2024,    -1,    -1,    -1,    -1,  2029,
      -1,    -1,    -1,    -1,   231,    -1,    -1,   234,   235,   236,
    2040,  1972,  1973,    -1,  1975,    -1,  1977,   244,    -1,    -1,
    1430,    -1,    -1,    -1,    -1,    -1,   376,   254,   255,   256,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   388,  1376,
      -1,    -1,    -1,    -1,  1802,    -1,  1383,   274,    -1,    -1,
      -1,    -1,    -1,   280,  2015,  2016,    -1,  2018,    -1,    -1,
      -1,   288,    -1,    -1,    -1,    -1,   231,    -1,    -1,    -1,
      -1,  1481,  1482,  2034,    -1,    -1,    -1,   419,   420,  1589,
      -1,  1591,  1492,  1420,    -1,  1422,    -1,    -1,    -1,  2050,
      -1,   441,    -1,    -1,    -1,  1605,  1606,  1481,  1482,    -1,
      -1,    -1,  1439,   445,   446,    -1,    -1,    -1,  1492,   274,
      -1,    -1,    -1,    -1,    -1,   280,   343,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   467,   468,    -1,    -1,    -1,
     472,   473,    -1,    -1,   476,   477,    -1,    -1,    -1,    -1,
      -1,  1478,    -1,   370,   885,   372,   373,    -1,    -1,   376,
     377,    -1,    -1,    -1,    -1,    -1,   383,    -1,    -1,    -1,
     387,   388,    -1,   390,    -1,    -1,    -1,    -1,   419,   420,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   419,   420,   445,   446,    -1,   424,   425,    -1,
      -1,    -1,   943,   944,   431,   370,   947,   948,    -1,   436,
      -1,   376,    -1,    -1,   441,    -1,   467,   468,   445,   446,
      -1,   472,   473,   388,    -1,   476,   477,    -1,    -1,   572,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     467,   468,    -1,    -1,    -1,   472,   473,    -1,    -1,   476,
     477,   478,  1589,    -1,  1591,    -1,    -1,    -1,   485,    -1,
      -1,    -1,    -1,  1600,    -1,    -1,    -1,    -1,  1605,  1606,
     124,    -1,   499,   127,   624,  1612,   441,   504,    -1,   506,
     507,   508,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
     144,  1801,    -1,    -1,    -1,    -1,    -1,   524,    -1,    -1,
     527,  1811,   529,    -1,   531,    -1,    -1,    -1,    -1,    -1,
     537,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1736,    -1,    -1,    -1,
      -1,  1072,  1073,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1677,    -1,    -1,   686,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1736,    -1,    -1,    -1,    -1,    -1,  1868,  1869,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     597,   598,   599,   600,    -1,    -1,   719,   720,   721,   722,
     723,    -1,    -1,   726,    -1,    -1,    -1,    -1,    -1,   732,
      -1,    -1,    -1,   620,   621,    -1,    -1,   624,    -1,    -1,
      -1,    -1,   629,    -1,   747,   748,   749,   750,   751,    -1,
      -1,   754,    -1,    -1,    -1,    -1,   643,    -1,    -1,    -1,
      -1,    -1,    -1,   650,   651,   652,    -1,   654,   655,   772,
     773,  1768,  1769,    -1,    -1,    -1,    -1,    -1,    -1,   789,
      -1,    -1,   669,    -1,    -1,   672,    -1,    -1,    -1,    -1,
     800,   678,    -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1801,    -1,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,  1811,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   650,   651,    -1,    -1,   654,
     655,    -1,  1902,    -1,  1904,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1902,    -1,
    1904,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1868,  1869,   760,    -1,    -1,   763,   764,   765,    -1,
     767,    -1,    -1,   770,   771,    -1,    -1,   774,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1968,    -1,
      -1,    -1,   789,   790,    -1,   419,   420,    -1,    -1,    -1,
     797,    -1,    78,   800,    -1,   802,    -1,   804,    -1,    -1,
      -1,    -1,    -1,    -1,  1968,    -1,    -1,    -1,    -1,    -1,
      -1,   445,   446,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   943,   944,    -1,    -1,   947,   948,    -1,    -1,    -1,
      -1,    -1,    -1,   467,   468,    -1,   266,    -1,   472,   473,
      -1,    -1,   476,   477,   789,   275,    -1,    -1,   855,    -1,
      -1,   281,    -1,    -1,    -1,   800,    -1,  1974,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   872,   873,    -1,     0,    -1,
     504,    -1,   506,   880,   881,  1992,    -1,    -1,   885,     0,
      -1,    -1,  1403,  1404,    -1,   892,    -1,    -1,     7,    -1,
    1013,    10,    11,    12,    13,    14,    15,    16,    17,   906,
     907,   908,    -1,    -1,    -1,    -1,    -1,   914,    -1,    -1,
      -1,    -1,   943,   944,    -1,    -1,   947,   948,  1041,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1049,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   124,   943,   944,   127,    -1,
     947,   948,   372,    75,    -1,    -1,     0,    -1,    -1,    -1,
      -1,   140,    84,   142,    75,   144,   963,   964,    -1,    91,
      92,   968,    -1,    84,    -1,    -1,    -1,   974,    -1,   914,
      91,    92,  1095,   980,    -1,    -1,    -1,    -1,  1101,   986,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   995,    -1,
      44,   110,   111,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   120,    -1,    -1,   125,    -1,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,   133,    -1,   137,    -1,    -1,    -1,
     141,    75,    76,    -1,    -1,    -1,    -1,    -1,    82,    -1,
      84,    -1,    -1,    -1,    -1,    -1,    -1,    91,    92,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1054,  1055,  1056,
    1057,    -1,    -1,    -1,    -1,    -1,    -1,   343,    -1,   191,
      -1,    -1,    -1,   117,   118,  1072,  1073,  1074,    -1,    -1,
     124,    -1,  1079,   127,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1088,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
     144,   377,   103,    -1,    -1,    -1,    -1,    -1,  1105,  1106,
    1107,   387,    -1,    -1,   390,    -1,    -1,   161,   162,    -1,
      -1,    -1,   244,    -1,    -1,    -1,    -1,    -1,  1125,    -1,
      -1,    -1,   254,   244,   256,  1132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   254,    -1,   256,    -1,   191,    -1,   425,
      -1,  1148,  1149,    -1,    -1,   431,    -1,    -1,  1155,  1156,
      -1,    -1,  1159,  1160,    -1,    -1,    -1,    -1,    -1,    -1,
    1105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1691,    -1,  1693,    -1,    -1,    -1,    -1,   231,    -1,    -1,
    1125,    -1,    -1,    -1,    -1,    -1,    -1,  1132,   822,   823,
     244,    -1,    -1,    -1,  1715,   625,  1717,    -1,    -1,    -1,
     254,    -1,   256,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   499,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   507,    -1,    -1,    -1,   236,    -1,    -1,    -1,    -1,
     419,   420,    -1,    -1,    -1,    -1,    -1,    -1,   524,    -1,
      -1,   527,   431,   529,    -1,   531,    -1,    -1,    -1,    -1,
      -1,   885,    -1,    -1,    -1,   376,   445,   446,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   388,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   467,   468,
     291,  1403,  1404,   472,   473,    -1,    -1,   476,   477,    -1,
      -1,    -1,   424,    -1,    -1,    -1,   350,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1311,  1312,    -1,    -1,    -1,   943,
     944,    -1,    -1,   947,   948,   504,   370,   506,    -1,    -1,
     441,    -1,    -1,   377,    -1,  1332,    -1,    -1,  1335,    -1,
      -1,    -1,    -1,    -1,    -1,   389,    -1,   767,    -1,    -1,
     770,   771,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1871,  1872,  1873,  1874,  1875,    -1,    -1,    -1,    -1,    -1,
      -1,  1882,  1883,  1884,  1885,   419,   420,    -1,    -1,  1376,
     424,    -1,  1403,  1404,   428,    -1,    -1,   431,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1397,   445,   446,    -1,    -1,    -1,  1403,  1404,    -1,    -1,
      -1,  1408,  1409,  1410,  1411,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   467,   468,    -1,    -1,    -1,   472,   473,
      -1,    -1,   476,   477,    -1,    -1,   480,    -1,    -1,  1950,
    1951,    -1,    -1,    -1,    -1,    -1,   490,   491,  1072,  1073,
      -1,    -1,    -1,   873,    -1,    -1,    -1,    -1,    -1,    -1,
     504,    -1,   506,   507,    -1,   509,    -1,    -1,    -1,    -1,
       1,  1468,     3,     4,     5,   519,    -1,   521,    -1,    -1,
    1477,  1478,    -1,   484,    -1,    -1,    -1,   763,   764,   765,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   774,    -1,
      -1,    -1,   624,    -1,    -1,    -1,    -1,   629,    -1,    -1,
    1623,    -1,    -1,   624,    -1,  1628,  1629,  1630,  1631,  1632,
    1633,    -1,  1635,    -1,    -1,  1638,  1639,  1640,  1641,    -1,
      -1,    -1,    -1,    -1,    65,   536,    -1,    -1,    -1,    -1,
      71,    72,    -1,    -1,  1541,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   567,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,    -1,    -1,
     624,   112,    -1,    -1,    -1,    -1,    -1,  1584,    -1,    -1,
    1587,   122,   123,  1590,    -1,    -1,   597,   598,   599,   600,
      -1,    -1,    -1,    -1,    -1,    -1,   650,    -1,    -1,    -1,
     654,  1608,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   669,    -1,    -1,    -1,    -1,
     124,    -1,    -1,   127,    -1,    -1,    -1,    -1,   760,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
     144,    -1,    -1,    -1,    -1,   656,    -1,    -1,    -1,   660,
      -1,    -1,  1775,  1660,    -1,    -1,    -1,  1780,   790,    -1,
      -1,    -1,    -1,    -1,    -1,   797,    -1,    -1,   789,  1676,
    1677,    -1,   804,    -1,    -1,   686,  1106,   963,    -1,   800,
      -1,    -1,   968,    -1,  1691,    -1,  1693,    -1,   974,   700,
      -1,    -1,    -1,    -1,   980,    -1,   885,    -1,    -1,    -1,
     986,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1715,    -1,
    1717,    -1,    -1,    -1,    -1,    -1,   727,    -1,    -1,    -1,
     774,   732,     0,   855,   735,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   236,    -1,    -1,   789,   790,    -1,    -1,    -1,
     872,    -1,    -1,   797,   755,    -1,   800,    -1,   802,  1871,
    1872,    -1,  1874,  1875,   943,   944,    -1,    -1,   947,   948,
    1882,  1883,  1884,  1885,    -1,    -1,    -1,    -1,    -1,  1403,
    1404,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   842,    -1,
      -1,    -1,    -1,  1800,    -1,  1802,   850,    75,    -1,    -1,
      -1,   855,    -1,    -1,    -1,    -1,    84,    -1,   862,    -1,
      -1,    -1,    -1,    91,    92,    -1,    -1,    -1,   872,    -1,
      -1,  1107,    -1,    -1,   119,    -1,    -1,    -1,  1950,  1951,
      -1,   885,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1871,  1872,    -1,  1874,  1875,    -1,    -1,   125,    -1,    -1,
      -1,  1882,  1883,  1884,  1885,    -1,    -1,    -1,    -1,   137,
     914,    -1,    -1,   141,  1871,  1872,  1873,  1874,  1875,  1876,
    1877,    -1,    -1,    -1,    -1,  1882,  1883,  1884,  1885,    -1,
      -1,    -1,    -1,  1072,  1073,    -1,    -1,    -1,    -1,   943,
     944,    -1,    -1,   947,   948,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1332,    -1,    -1,  1335,   960,    -1,   962,   920,
      -1,    -1,    -1,    -1,    -1,   419,   420,    -1,    -1,  1950,
    1951,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   445,   446,  1950,  1951,    -1,    -1,  1079,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1088,    -1,    -1,    -1,
      -1,    -1,    -1,   467,   468,    -1,   244,  1397,   472,   473,
      -1,   266,   476,   477,   478,    -1,   254,    -1,   256,    -1,
     275,    -1,  1412,    -1,    -1,    -1,   281,   998,    -1,    -1,
    1001,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1010,
     504,    -1,   506,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    -1,    -1,    -1,    -1,  1072,  1073,
      -1,  1032,  1033,    -1,    -1,  1311,  1312,    -1,  1039,    -1,
    1041,    -1,    -1,    -1,  1088,  1046,    -1,    -1,  1049,    -1,
    1051,    -1,    -1,  1054,  1055,  1056,  1057,    -1,    -1,    -1,
      -1,  1105,    -1,  1107,    -1,    -1,    -1,  1691,    -1,  1693,
      -1,    -1,    -1,   567,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1125,    -1,    -1,    -1,    -1,    -1,   372,  1132,    -1,
      -1,  1715,    -1,  1717,  1095,    -1,    -1,    -1,    -1,    -1,
    1101,    -1,    -1,   597,   598,   599,   600,    -1,   376,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,    -1,
     388,    -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,   125,   126,   127,    -1,   129,   130,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1152,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1584,    -1,    -1,    -1,    -1,    -1,
    1590,    -1,    -1,   441,    -1,    -1,    -1,    -1,   672,    -1,
      -1,    -1,    -1,    -1,   678,    -1,    -1,   681,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    83,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1629,
    1630,    -1,  1632,  1633,    -1,    -1,   119,    -1,  1638,  1639,
    1640,  1641,    -1,    -1,  1403,  1404,    -1,    -1,    -1,    -1,
    1650,  1651,  1652,  1653,  1654,  1655,  1656,  1657,    -1,    -1,
    1660,    -1,    -1,    -1,    -1,    -1,    -1,  1871,  1872,  1873,
    1874,  1875,    -1,    -1,    -1,    -1,    -1,    -1,  1882,  1883,
    1884,  1885,    -1,    -1,    -1,    -1,    -1,   170,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1351,    -1,    -1,
      -1,  1587,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1950,  1951,   822,   823,
      -1,    -1,    -1,    -1,  1378,    -1,    -1,    -1,    -1,    -1,
     625,    -1,    -1,    -1,    -1,    -1,  1468,   234,   235,   236,
      -1,    -1,    -1,    -1,    -1,    -1,   624,    -1,    -1,  1403,
    1404,    -1,    -1,   266,    -1,    -1,    -1,    -1,   255,    -1,
      -1,    -1,   275,    -1,    -1,    -1,    -1,    -1,   281,    -1,
    1800,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   885,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   906,    -1,   908,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1468,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1445,  1865,    -1,    -1,    -1,   943,
     944,    -1,    -1,   947,   948,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   372,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1481,  1482,   767,    -1,    -1,   770,   771,    -1,    -1,  1490,
      -1,  1492,  1493,    -1,    -1,  1496,    -1,    -1,    -1,    -1,
      -1,   995,    -1,  1504,   998,    -1,  1507,  1001,    -1,    -1,
      -1,    -1,  1691,   103,  1693,    -1,  1010,    -1,    -1,    -1,
      -1,   789,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      -1,    -1,   800,    -1,    -1,    -1,  1715,    -1,  1717,    -1,
      -1,    -1,    -1,    -1,    -1,  1039,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1054,  1055,  1056,  1057,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   478,    -1,    -1,  1072,  1073,
     170,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   873,    -1,
      -1,   478,    -1,    -1,    -1,    -1,    -1,    -1,   485,  1600,
      -1,    -1,    -1,    -1,    -1,   508,    -1,    -1,    -1,    -1,
      -1,  1612,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1623,    -1,    -1,    -1,    -1,  1628,    -1,    -1,
    1631,    -1,    -1,    -1,  1635,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1691,    -1,  1693,
      -1,    -1,    -1,    -1,    -1,  1149,    -1,    -1,    -1,   562,
      -1,    -1,  1156,    -1,    -1,    -1,  1160,    -1,    -1,    -1,
      -1,  1715,    -1,  1717,    -1,    -1,   266,    -1,    -1,    -1,
    1724,   271,   272,    -1,    -1,   275,    -1,    -1,    -1,    -1,
      -1,   281,  1871,  1872,  1873,  1874,  1875,    -1,    -1,    -1,
      -1,   291,    -1,  1882,  1883,  1884,  1885,    -1,    -1,  1710,
     597,   598,   599,   600,    -1,    -1,   306,    -1,    -1,    -1,
      -1,   311,   625,    -1,    -1,    -1,    -1,    -1,    -1,  1730,
    1731,  1732,  1733,   620,   621,  1736,    -1,    -1,    -1,    -1,
    1741,  1742,    -1,  1744,    -1,  1746,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   643,  1758,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1768,  1769,   672,
      -1,  1950,  1951,     3,  1775,   678,    -1,    -1,   681,  1780,
      -1,    -1,   372,    -1,    -1,   672,    -1,    -1,    -1,    -1,
      -1,   678,    -1,    -1,   681,    -1,    -1,    -1,    28,    -1,
      -1,    -1,  1803,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,  1106,    -1,    -1,    -1,    -1,    -1,  1871,  1872,  1873,
    1874,  1875,    -1,    -1,    -1,    -1,    66,    -1,  1882,  1883,
    1884,  1885,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,   767,    -1,    -1,   770,   771,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1376,    -1,    -1,    -1,    -1,    -1,   478,    -1,
      -1,  1892,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1902,    -1,  1904,    -1,    -1,  1950,  1951,    -1,  1403,
    1404,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   508,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1420,    -1,  1422,    -1,
      -1,    -1,  1933,    -1,    -1,    -1,    -1,    -1,   841,    -1,
      -1,   844,    -1,    -1,    -1,    -1,   536,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1955,  1956,    -1,    -1,  1959,    -1,
    1961,    -1,    -1,  1964,    -1,    -1,    -1,  1968,    -1,    -1,
     873,    -1,   562,  1974,    -1,    -1,    -1,    -1,    -1,   882,
      -1,    -1,    -1,    -1,  1478,    -1,    -1,  1481,  1482,    -1,
      -1,  1992,  1993,    -1,    -1,    -1,  1490,    -1,  1492,  1493,
    2001,    -1,  1496,   906,    -1,   908,    -1,    -1,    -1,    -1,
    1504,    -1,    -1,  1507,    -1,    -1,    -1,    -1,    -1,   906,
     907,   908,    -1,    -1,    -1,    -1,   103,    -1,  2029,    -1,
      -1,    -1,    -1,    -1,    -1,   625,    -1,    -1,    -1,   629,
      -1,    -1,   119,    -1,    -1,    -1,    -1,  1332,    -1,    -1,
    1335,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   964,    -1,    -1,    -1,    -1,   656,    -1,    -1,    -1,
     660,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   672,    -1,    -1,    -1,    -1,    -1,   678,    -1,
      -1,   681,   995,   170,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1006,    -1,    -1,    -1,    -1,   995,    -1,
     700,    -1,  1397,    -1,    -1,    -1,   706,   707,   708,   709,
     710,   711,   712,    -1,    -1,   715,   716,  1412,   718,   719,
     720,   721,   722,   723,   724,   725,    -1,   727,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   735,   736,   737,   738,   739,
     740,   741,   742,   743,   744,   745,   746,   747,   748,   749,
     750,   751,   752,   753,    -1,   755,    -1,  1054,  1055,  1056,
    1057,    -1,    -1,    -1,    -1,    -1,    -1,   767,    -1,    -1,
     770,   771,    -1,  1677,    -1,    -1,    -1,  1074,    -1,   266,
      -1,    -1,    -1,    -1,   271,   272,    -1,  1691,   275,  1693,
      -1,    -1,    -1,  1106,   281,  1108,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   291,    -1,    -1,    -1,    -1,    -1,
      -1,  1715,    -1,  1717,    -1,    -1,    -1,  1130,    -1,   306,
      -1,    -1,    -1,    -1,   311,    -1,  1730,  1731,  1732,  1733,
      -1,    -1,  1736,    -1,    -1,    -1,  1149,  1741,  1742,    -1,
    1744,   841,  1746,  1156,   844,    -1,    -1,  1160,    -1,    -1,
      -1,  1148,  1149,    -1,  1758,    -1,    -1,    -1,  1155,  1156,
      -1,    -1,  1159,  1160,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   873,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   882,    -1,    -1,   372,    -1,    -1,    -1,  1584,
      -1,    -1,    -1,    -1,    -1,  1590,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   906,    -1,   908,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1629,  1630,    -1,  1632,  1633,    -1,
      -1,    -1,    -1,  1638,  1639,  1640,  1641,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1650,  1651,  1652,  1653,  1654,
    1655,  1656,  1657,    -1,   964,  1660,    -1,  1871,  1872,  1873,
    1874,  1875,    -1,    -1,    -1,    -1,    -1,    -1,  1882,  1883,
    1884,  1885,    -1,    -1,    -1,    -1,    -1,    -1,  1892,    -1,
      -1,   478,    -1,    -1,    -1,   995,    -1,    -1,  1902,    -1,
    1904,    -1,    -1,    -1,    -1,    -1,  1006,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1332,
      -1,   508,  1335,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1032,  1033,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1950,  1951,    -1,   536,
      -1,  1955,  1956,    -1,    -1,  1959,    -1,  1961,    -1,    -1,
    1964,    -1,    -1,  1376,  1968,    -1,    -1,    -1,    -1,    -1,
    1383,    -1,    -1,    -1,    -1,   562,    -1,    -1,    -1,  1376,
      -1,    -1,    -1,    -1,  1397,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  2001,    -1,  1412,
      -1,    -1,    -1,    -1,    -1,  1800,  1106,  1420,  1108,  1422,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  2029,  1439,    -1,    -1,    -1,
    1130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   625,    -1,
      -1,    -1,   629,    -1,    -1,  1145,    -1,    -1,    -1,  1149,
      -1,    -1,  1152,    -1,    -1,    -1,  1156,    -1,    -1,    -1,
    1160,    -1,    -1,    -1,    -1,  1478,    -1,    -1,    -1,   656,
    1865,    -1,    -1,   660,    -1,    -1,    -1,    -1,    -1,    -1,
    1477,  1478,    -1,    -1,    -1,   672,    -1,    -1,    -1,    -1,
      -1,   678,    -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   700,    -1,    -1,    -1,    -1,    -1,   706,
     707,   708,   709,   710,   711,   712,    -1,    -1,   715,   716,
      -1,   718,   719,   720,   721,   722,   723,   724,   725,    -1,
     727,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   735,   736,
     737,   738,   739,   740,   741,   742,   743,   744,   745,   746,
     747,   748,   749,   750,   751,   752,   753,    -1,   755,    -1,
      -1,  1584,    -1,    -1,    -1,    -1,  1589,  1590,  1591,    -1,
     767,    -1,    -1,   770,   771,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1605,  1606,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1629,  1630,    -1,  1632,
    1633,    -1,    -1,    -1,    -1,  1638,  1639,  1640,  1641,    -1,
      -1,    -1,  1332,    -1,    -1,  1335,    -1,  1650,  1651,  1652,
    1653,  1654,  1655,  1656,  1657,    -1,    -1,  1660,    -1,    -1,
      -1,    -1,    -1,    -1,   841,    -1,    -1,   844,    -1,    -1,
      -1,    -1,    -1,    -1,  1677,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1376,    -1,    -1,  1676,
    1677,    -1,    -1,  1383,    -1,    -1,   873,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   882,    -1,  1397,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1412,    -1,    -1,    -1,    -1,    -1,    -1,   906,
    1420,   908,  1422,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1439,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   964,  1478,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,  1800,  1801,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1811,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   995,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1006,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,
      85,    86,    -1,    -1,    -1,  1032,  1033,    -1,    -1,    -1,
      -1,    -1,  1865,    98,    -1,  1868,  1869,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,  1584,    -1,    -1,    -1,    -1,  1589,
    1590,  1591,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1600,    -1,    -1,    -1,    -1,  1605,  1606,    -1,    -1,    -1,
      -1,    -1,  1612,    -1,    -1,    -1,    -1,    -1,    -1,  1106,
      -1,  1108,    -1,     0,    -1,    -1,    -1,    -1,    -1,  1629,
    1630,    -1,  1632,  1633,    -1,    -1,    -1,    -1,  1638,  1639,
    1640,  1641,    -1,  1130,    -1,    -1,    -1,     3,    -1,    -1,
    1650,  1651,  1652,  1653,  1654,  1655,  1656,  1657,  1145,    -1,
    1660,    -1,  1149,    -1,    -1,  1152,    43,    -1,    -1,  1156,
      -1,    -1,    28,  1160,    -1,    -1,    -1,  1677,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    83,    84,    -1,    -1,
      66,    -1,    -1,    -1,    91,    92,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   100,    -1,     0,    -1,   125,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,
     137,    -1,   139,    -1,   141,    -1,    -1,   123,  1768,  1769,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,
      44,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1800,  1801,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1811,    -1,    -1,   191,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    82,    -1,
      84,    -1,    -1,    -1,    -1,    -1,    -1,    91,    92,    -1,
      -1,    -1,    -1,    -1,    -1,  1332,    -1,    -1,  1335,    -1,
      -1,    -1,    -1,    -1,   231,    -1,    -1,   234,   235,   236,
      -1,    -1,   116,   117,    -1,  1865,    -1,   244,  1868,  1869,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   254,   255,   256,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1376,
      -1,    -1,    -1,    -1,    -1,    -1,  1383,   274,    -1,    -1,
      -1,    -1,    -1,   280,    -1,    -1,   160,   161,    -1,    -1,
    1397,   288,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1412,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1420,    -1,  1422,    -1,   191,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   201,    -1,   203,
      -1,    -1,  1439,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1974,    -1,    -1,   231,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     244,  1478,  1992,   370,    -1,   372,   373,    -1,    -1,   376,
     254,    -1,   256,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   424,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,   441,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   350,  1584,   352,    -1,
      -1,   478,  1589,  1590,  1591,    -1,    -1,    -1,   485,    -1,
      -1,    -1,    -1,  1600,    -1,    -1,    -1,    -1,  1605,  1606,
      -1,    -1,    -1,    -1,    -1,  1612,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   389,    -1,    -1,    -1,    -1,
      -1,    -1,  1629,  1630,    -1,  1632,  1633,    -1,    -1,    -1,
      -1,  1638,  1639,  1640,  1641,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1650,  1651,  1652,  1653,  1654,  1655,  1656,
    1657,    -1,    -1,  1660,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1677,    -1,    -1,    -1,    -1,    -1,    -1,   574,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     597,   598,   599,   600,    -1,    -1,   480,    -1,   482,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   490,   491,    -1,    -1,
      -1,    -1,    -1,   620,   621,    -1,    -1,   624,    -1,    -1,
      -1,    -1,   629,   507,    -1,   509,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   517,    -1,   519,   643,    -1,    -1,    -1,
      -1,    -1,    -1,   650,   651,   652,    -1,   654,   655,    -1,
      -1,  1768,  1769,    -1,    -1,    -1,    -1,    -1,    -1,    83,
      -1,    -1,   669,    -1,    -1,   672,   550,    -1,    -1,    -1,
      -1,   678,    -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1800,  1801,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1811,   119,    -1,    -1,    -1,    -1,
      -1,   125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   137,    -1,   139,    -1,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   163,
     624,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1865,    -1,
      -1,  1868,  1869,   760,    -1,    -1,    -1,    -1,    -1,    -1,
     767,    -1,    -1,   770,   771,    -1,    -1,   191,    -1,    -1,
      -1,    -1,    -1,    -1,    44,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   789,   790,    -1,    -1,    -1,    -1,    -1,    -1,
     797,    -1,    -1,   800,   801,   802,    -1,   804,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,   231,    -1,    -1,
     234,   235,   236,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    44,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   255,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   116,   117,   855,    -1,
     274,    -1,    -1,    -1,    75,    76,   280,  1974,    -1,    80,
      -1,    82,    -1,    -1,    -1,   872,   873,    -1,    -1,    -1,
      -1,    -1,    -1,   880,   881,  1992,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   892,    -1,    -1,    -1,    -1,
     160,   161,    -1,    -1,    -1,   116,   117,    -1,    -1,   906,
     907,   908,    -1,    -1,    -1,    -1,    -1,   914,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   802,    -1,
      -1,   191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   160,
     161,    -1,    -1,    -1,    -1,    -1,   370,    -1,   372,   373,
      -1,    -1,   376,    -1,    -1,    -1,    -1,    -1,   842,    -1,
      -1,   231,    -1,    -1,   388,    -1,    -1,    -1,    -1,    -1,
     191,   855,    -1,    -1,   244,    -1,    -1,    -1,   862,    -1,
     201,    -1,   203,    -1,    -1,    -1,    -1,    -1,   995,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     424,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1015,    -1,
     231,    -1,    -1,    -1,    -1,    -1,    -1,   441,    -1,    -1,
      -1,    -1,    -1,   244,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1054,  1055,  1056,
    1057,    -1,    -1,    -1,   478,    -1,    -1,    -1,    -1,    -1,
      -1,   485,    -1,    -1,    -1,    -1,    -1,  1074,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   962,    -1,
     350,  1088,   352,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1105,  1106,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1125,   389,
      -1,    -1,    -1,    -1,    -1,  1132,    -1,    -1,    -1,   350,
      -1,   352,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1148,  1149,    -1,    -1,    -1,    -1,    -1,  1155,  1156,
      -1,    -1,  1159,  1160,   424,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   389,    -1,
      -1,    -1,    -1,   597,   598,   599,   600,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   620,   621,    -1,    -1,
      -1,    -1,    83,    -1,    -1,    -1,   427,   428,    -1,    -1,
     480,    -1,   482,    -1,    -1,    -1,    -1,    -1,    -1,   643,
     490,   491,    -1,    -1,    -1,    -1,   650,   651,    -1,    -1,
     654,   655,    -1,    -1,    -1,    -1,    -1,   507,   119,   509,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   517,   672,   519,
      -1,    -1,    -1,    -1,   678,    -1,    -1,   681,   139,   480,
      -1,   482,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   490,
     491,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     550,    -1,   163,    -1,    -1,    -1,   507,    -1,   509,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   517,    -1,   519,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1332,    -1,    -1,  1335,   550,
      -1,    -1,    -1,    -1,    -1,    -1,   760,    -1,    -1,    -1,
      -1,    -1,    -1,   767,    -1,    -1,   770,   771,    -1,    -1,
     231,    -1,    -1,   234,   235,   236,    -1,    -1,    83,    -1,
      -1,    -1,    -1,    -1,    -1,   789,   790,    -1,    -1,  1376,
      -1,    -1,    -1,   797,   255,    -1,   800,    -1,    -1,    -1,
     804,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1397,    -1,    -1,   274,   119,    -1,    -1,    -1,    -1,   280,
      -1,  1408,  1409,  1410,  1411,    -1,    -1,   288,    -1,    -1,
      -1,    -1,    -1,    -1,   139,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   855,    -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,   872,   873,
      -1,    -1,    -1,    -1,    -1,    -1,   880,   881,    -1,    -1,
      -1,  1468,    -1,    -1,    -1,    -1,   191,    -1,   892,    -1,
    1477,  1478,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,   906,   907,   908,    71,    72,    73,    -1,   370,
     914,   372,   373,    -1,    -1,    -1,    -1,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,   231,    -1,    -1,   234,
     235,   236,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   797,   114,   115,
     255,   117,   802,    -1,  1541,    -1,   122,   123,    -1,   125,
     126,   127,   128,   424,    -1,    -1,    -1,    -1,    -1,   274,
      -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   288,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   995,   842,    -1,    -1,    -1,    -1,  1584,    -1,   849,
     850,   802,    -1,  1590,  1468,   855,    -1,    -1,    -1,    -1,
      -1,    -1,   862,    -1,    -1,    -1,    -1,   478,    -1,    -1,
      -1,  1608,   872,    -1,   485,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   842,    -1,    -1,    -1,    -1,    -1,    -1,   849,   850,
    1054,  1055,  1056,  1057,   855,    -1,    -1,    -1,   859,    -1,
     861,   862,    -1,    -1,   914,   370,    -1,   372,   373,    -1,
    1074,    -1,    -1,  1660,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1676,
    1677,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1105,  1106,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   962,    -1,    -1,    -1,    -1,    -1,    -1,   424,
      -1,  1125,    -1,    -1,    -1,    -1,    -1,    -1,  1132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   597,   598,   599,   600,
      -1,    -1,    -1,    -1,  1148,  1149,    -1,    -1,    -1,    -1,
      -1,  1155,  1156,    -1,    -1,  1159,  1160,    -1,    -1,   620,
     621,   962,    -1,    -1,    -1,    -1,    -1,    -1,   629,    -1,
      -1,    -1,    -1,   478,    -1,    -1,    -1,    -1,    -1,    -1,
     485,    -1,   643,    -1,    -1,    -1,    -1,    -1,    -1,   650,
     651,   652,    -1,   654,   655,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   669,    -1,
      -1,   672,    -1,  1800,    -1,  1802,    -1,   678,    -1,    -1,
     681,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,  1876,
    1877,    -1,   597,   598,   599,   600,   100,    -1,    -1,   760,
      -1,    -1,    -1,    -1,    -1,   109,   767,    -1,   112,   770,
     771,    -1,    -1,    -1,    -1,   620,   621,    -1,    -1,   123,
      -1,   125,    -1,    -1,   629,    -1,    -1,    -1,  1332,   790,
      -1,  1335,    -1,    -1,    -1,    -1,   797,    -1,   643,    -1,
      -1,   802,    -1,   804,    -1,   650,   651,   652,    -1,   654,
     655,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   669,    -1,    -1,   672,    -1,    -1,
      -1,    -1,  1376,   678,    -1,    -1,   681,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1397,   855,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1408,  1409,  1410,  1411,    -1,    -1,
      -1,   872,   873,    -1,    -1,    -1,    -1,    -1,    -1,   880,
     881,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   892,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   906,   907,   908,    -1,    -1,
      -1,    -1,    -1,   914,    -1,   760,    -1,    -1,    -1,    -1,
      -1,    -1,   767,    -1,  1468,   770,   771,    -1,    83,    -1,
      -1,    -1,    -1,  1477,  1478,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   790,    -1,    -1,    -1,    -1,
      -1,    -1,   797,    -1,    -1,    -1,    -1,   802,    -1,   804,
    1350,  1351,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
     125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   137,    -1,   139,    -1,   141,    -1,  1378,    -1,
    1380,    -1,  1382,    -1,   995,    -1,    -1,  1541,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,
     855,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   872,   873,    -1,
      -1,    -1,    -1,    -1,    -1,   880,   881,    -1,    -1,  1380,
    1584,  1382,    -1,    -1,    -1,    -1,  1590,   892,    -1,    -1,
      -1,    -1,    -1,  1054,  1055,  1056,  1057,    -1,    -1,    -1,
      -1,   906,   907,   908,    -1,    -1,    -1,    -1,    -1,   914,
      -1,    -1,    -1,  1074,    -1,    -1,   231,    -1,  1468,   234,
     235,   236,    -1,    -1,    -1,    -1,    -1,  1088,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     255,    -1,    -1,    -1,  1105,  1106,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1660,    -1,    -1,   274,
      -1,    -1,    -1,    -1,  1125,   280,    -1,  1468,    -1,    -1,
      -1,  1132,  1676,  1677,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1148,  1149,    -1,
     995,    -1,    -1,    -1,  1155,  1156,     3,    -1,  1159,  1160,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,  1054,
    1055,  1056,  1057,    -1,    -1,   370,    -1,   372,   373,    66,
      -1,   376,    -1,    -1,    -1,    -1,    -1,    74,    75,  1074,
      -1,    -1,    79,   388,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,  1088,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,  1800,    -1,    -1,    -1,
    1105,  1106,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,    -1,    -1,   123,  1667,    -1,  1669,
    1125,    -1,    -1,    -1,    -1,    -1,   441,  1132,    -1,  1679,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1148,  1149,    -1,    -1,    -1,    -1,    -1,
    1155,  1156,    -1,    -1,  1159,  1160,     1,    -1,     3,    -1,
      -1,    -1,    -1,   478,    -1,    -1,    -1,    -1,    -1,    -1,
     485,  1332,  1876,  1877,  1335,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1376,    83,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,  1397,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,  1408,  1409,  1410,
    1411,    -1,   119,    -1,   291,   100,    -1,    -1,   125,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,   306,
     137,    -1,   139,    -1,   141,    -1,    -1,    -1,   123,    -1,
      -1,    -1,   597,   598,   599,   600,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   620,   621,  1468,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1477,  1478,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1332,   643,    -1,
    1335,    -1,    -1,    -1,    -1,   650,   651,    -1,    -1,   654,
     655,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   672,    -1,    -1,
      -1,    -1,    -1,   678,   231,    -1,   681,   234,   235,   236,
      -1,  1376,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1541,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   255,    -1,
      -1,    -1,  1397,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1408,  1409,  1410,  1411,   274,    -1,    -1,
      -1,    -1,    -1,   280,    -1,    -1,   236,    -1,    -1,    -1,
      -1,    -1,    -1,  1584,    -1,    -1,    -1,    -1,    -1,  1590,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1608,    -1,    -1,
      -1,    -1,   767,    -1,    -1,   770,   771,    -1,    -1,    -1,
      -1,    -1,    -1,  1468,    -1,    -1,    -1,    -1,   288,    -1,
      -1,    -1,  1477,  1478,   789,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   800,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1660,
      -1,    -1,    -1,   370,    -1,   372,   373,    -1,    -1,   376,
      -1,    -1,    -1,    -1,    -1,  1676,  1677,    -1,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   572,  1541,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   873,    -1,
      -1,    -1,    -1,    -1,    -1,   880,   881,    -1,    -1,   389,
      -1,    -1,    -1,    -1,   441,    -1,    -1,   892,    -1,  1584,
      -1,    -1,    -1,    -1,    -1,  1590,    -1,    -1,    -1,    -1,
      -1,   906,   907,   908,    -1,    -1,    -1,    -1,    -1,   914,
      -1,    -1,    -1,  1608,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   478,    -1,    -1,    -1,    -1,    -1,    -1,   485,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1800,
      -1,  1802,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   686,
      -1,    -1,    -1,    -1,    -1,  1660,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   700,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1676,  1677,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     995,    -1,   719,   720,   721,   722,   723,    -1,    -1,   726,
     727,    -1,    -1,    -1,    -1,   732,    -1,    -1,   735,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     747,   748,   749,   750,   751,  1876,  1877,   754,   755,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     597,   598,   599,   600,    -1,   772,   773,    -1,    -1,  1054,
    1055,  1056,  1057,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   572,   620,   621,    -1,    -1,    -1,    -1,  1074,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   587,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   643,   597,   598,   599,
     600,    -1,    -1,   650,   651,    -1,    -1,   654,   655,    -1,
    1105,  1106,    -1,    -1,    -1,  1800,    -1,  1802,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   672,    -1,    -1,    -1,    -1,
    1125,   678,    -1,    -1,   681,    -1,    -1,  1132,   638,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1148,  1149,    -1,    -1,    -1,    -1,    -1,
    1155,  1156,    -1,   663,  1159,  1160,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   688,    -1,
      -1,  1876,  1877,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   567,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     767,    -1,    -1,   770,   771,    -1,   726,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   734,    -1,    -1,    65,    -1,    -1,
     599,   600,   789,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   800,   754,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   772,   773,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,   288,   117,
      -1,    -1,    -1,   121,   122,   123,  1013,   125,   126,   127,
     128,    -1,   802,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1041,    -1,   873,    -1,    -1,    -1,
      -1,    -1,  1049,   880,   881,    -1,    -1,  1332,    -1,     1,
    1335,     3,     4,     5,     6,   892,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   906,
     907,   908,    -1,    -1,    -1,    -1,    28,   914,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1095,    -1,
      -1,  1376,    -1,    -1,  1101,    -1,    -1,    -1,    -1,   389,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,  1397,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,  1408,  1409,  1410,  1411,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    -1,    88,    89,    90,    -1,
      -1,    -1,    -1,    -1,    -1,  1152,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   995,    -1,
     112,   113,   114,   115,    -1,   117,    -1,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1477,  1478,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   998,    -1,
      -1,  1001,  1002,  1003,    -1,  1005,    -1,  1054,  1055,  1056,
    1057,    -1,    -1,  1013,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1021,    -1,    -1,    -1,    -1,    -1,  1074,  1028,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1039,
      -1,    -1,    -1,    -1,    -1,    -1,  1541,  1047,    -1,    -1,
      -1,    -1,  1052,    -1,  1054,  1055,  1056,  1057,  1105,  1106,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   572,    -1,    -1,    -1,    -1,    -1,  1125,    -1,
      -1,    -1,    -1,    -1,    -1,  1132,    -1,   587,    -1,  1584,
      -1,   591,    -1,    -1,    -1,  1590,    -1,  1097,    -1,    -1,
      -1,  1148,  1149,  1103,    -1,    -1,    -1,    -1,  1155,  1156,
      -1,    -1,  1159,  1160,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1126,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   638,   998,
      -1,    -1,  1001,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1010,   652,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   663,   664,  1660,    -1,    -1,    -1,    -1,
      -1,  1171,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1039,  1676,  1677,    -1,    -1,    -1,    -1,    -1,   688,    -1,
      -1,    -1,    -1,    -1,    -1,  1054,  1055,  1056,  1057,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   726,  1227,    -1,    -1,
      -1,    -1,    -1,    28,   734,    -1,    -1,    -1,    -1,    -1,
      -1,  1241,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   754,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,   772,   773,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,  1332,    -1,    -1,  1335,    84,
      85,    -1,    -1,    -1,    -1,    -1,  1296,    -1,    -1,    -1,
      -1,    -1,   802,    98,    -1,  1800,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,  1322,    -1,   119,    -1,  1326,   122,   123,  1376,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1397,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1408,  1409,  1410,  1411,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1876,  1877,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1623,    -1,    -1,    -1,
      -1,  1628,  1629,  1630,  1631,  1632,  1633,    -1,  1635,    -1,
      -1,  1638,  1639,  1640,  1641,    -1,    -1,    -1,    -1,    -1,
    1477,  1478,    -1,  1650,  1651,  1652,  1653,  1654,  1655,  1656,
    1657,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     0,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1481,  1482,    -1,    -1,  1485,    -1,  1487,    -1,    -1,
      -1,  1491,  1492,    -1,  1541,    -1,    -1,  1497,  1498,    -1,
    1500,    -1,  1002,  1003,    -1,  1005,    -1,    -1,    43,    44,
    1510,    -1,  1512,  1013,    -1,    -1,    -1,  1017,    -1,    -1,
      -1,  1021,    -1,    -1,    -1,    -1,    -1,    -1,  1028,  1029,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1584,    -1,    -1,
      75,    76,    -1,  1590,    -1,    80,    -1,  1047,  1048,    84,
      -1,    -1,  1052,    -1,    -1,    -1,    91,    92,  1775,    -1,
      -1,    -1,  1562,  1780,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1572,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,   116,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1097,    -1,    -1,
      -1,    -1,    -1,  1103,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1660,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1481,  1482,    -1,   160,  1126,    -1,    -1,  1676,
    1677,  1490,    -1,  1492,  1493,    -1,    -1,  1496,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1504,    -1,    -1,  1507,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   191,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,  1171,  1172,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   231,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   244,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   254,
      -1,   256,    -1,    -1,    65,    -1,    -1,  1227,    -1,  1229,
      71,    72,    73,    -1,    -1,    -1,  1736,    -1,  1738,    -1,
      -1,  1241,  1242,    84,    85,  1745,    -1,    -1,    -1,  1749,
      -1,  1751,    -1,  1800,    -1,    -1,    -1,    98,    -1,    -1,
    1760,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,   124,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1296,    -1,  1298,    -1,
      -1,    -1,  1802,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1322,    -1,  1324,    -1,  1326,    -1,  1328,  1876,
    1877,    -1,    -1,    -1,    -1,   370,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   389,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,  1730,  1731,  1732,  1733,    -1,    -1,  1736,    -1,    -1,
      -1,    -1,  1741,  1742,    -1,  1744,    -1,  1746,    -1,   424,
      -1,    -1,   427,  1893,  1894,    -1,  1896,    -1,  1898,  1758,
      -1,    65,  1902,  1903,  1904,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,   117,    -1,   490,   491,  1957,   122,   123,
    1960,   125,   126,   127,   128,    -1,    -1,    -1,  1968,    -1,
      -1,    -1,   507,    -1,   509,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   517,    -1,    -1,  1485,  1486,  1487,  1488,    -1,
      -1,  1491,  1492,    -1,    -1,    -1,    -1,  1497,  1498,    -1,
    1500,    -1,  1502,    -1,  2004,    -1,    -1,    -1,    -1,    -1,
    1510,  1511,  1512,    -1,    -1,   550,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1892,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1902,    -1,  1904,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,  1562,  1563,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1572,  1573,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   624,
      -1,    -1,    -1,    -1,    -1,    -1,  1955,  1956,    -1,    -1,
    1959,    -1,  1961,    -1,    -1,  1964,    -1,    -1,    -1,  1968,
      -1,    -1,    -1,    -1,    -1,   650,    65,    -1,    -1,   654,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   669,    84,    85,    -1,    -1,    -1,
      -1,    -1,  2001,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
    2029,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,  1738,   774,
     775,    -1,    -1,  1743,    -1,  1745,  1746,    -1,  1748,  1749,
      -1,  1751,    -1,  1753,   789,    28,    -1,    -1,    -1,  1759,
    1760,    -1,   797,    -1,    -1,   800,   801,   802,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,  1802,    -1,    -1,    -1,    79,   842,    -1,    -1,
      -1,    84,    85,    86,   849,    88,    89,    90,    -1,    -1,
     855,    -1,    -1,    -1,    -1,    98,    -1,   862,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   872,    -1,   112,
     113,   114,   115,    -1,   117,    -1,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   914,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1893,  1894,    -1,  1896,  1897,  1898,     1,
      -1,    -1,    -1,  1903,  1904,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1957,  1958,    -1,
    1960,  1961,    -1,    -1,    66,  1965,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,  2004,    -1,    -1,   109,   110,   111,
     112,    -1,    -1,   115,   116,   117,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,   127,    -1,   129,   130,   131,
     132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1088,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1105,    -1,  1107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1115,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1125,    -1,    -1,    -1,    -1,     0,     1,  1132,     3,     4,
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
     125,   126,   127,   128,   129,   130,   131,   132,   133,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,  1350,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,  1378,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
      -1,    -1,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,  1468,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,  1679,   102,   103,   104,   105,   106,
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
     119,   120,   121,   122,   123,    -1,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,   120,   121,   122,   123,    -1,
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
     112,   113,   114,   115,    -1,   117,   118,   119,    -1,   121,
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
     113,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
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
      48,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,     1,   114,     3,
       4,     5,     6,    -1,     8,     9,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,     1,
     114,     3,     4,     5,     6,    -1,     8,     9,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,     1,   114,     3,
       4,     5,     6,   119,     8,     9,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      84,    85,    86,    87,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    28,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      -1,    88,    89,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      -1,    -1,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    -1,    88,
      89,    90,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    -1,    88,    89,    90,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,    -1,    -1,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,   117,    -1,    -1,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,   124,   125,   126,   127,   128,    -1,    -1,
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
     112,   113,   114,   115,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
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
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,     1,
     112,     3,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     0,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   123,    29,    30,    31,    32,    33,    34,    35,    36,
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
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   123,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    76,    77,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,   100,    -1,    -1,
      -1,    -1,   105,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,    28,
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
      -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
       1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,     1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   115,    -1,   117,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,     1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,     0,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    76,    77,    -1,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,   101,    -1,    -1,    -1,
     105,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
     107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,   107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,   107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,   115,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    76,    77,    -1,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,     0,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,   101,
      -1,    -1,    -1,   105,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    53,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    80,    81,    82,    83,
      -1,    85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,    -1,    28,    29,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     113,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   113,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,   107,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     1,    -1,     3,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       1,    -1,     3,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     1,    -1,     3,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       3,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,     3,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,     3,    -1,    -1,    79,    80,    81,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   123,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100
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
     265,   273,   275,   280,   311,   113,   120,     1,   158,   159,
       1,   118,   117,   124,     1,   158,   159,   118,     1,   158,
     159,     1,   206,     1,   113,   210,   214,   215,   254,     1,
     206,   235,   255,   209,   233,     1,   220,   242,   220,   242,
     220,   242,     1,   221,   243,     1,   221,   243,   222,   244,
     222,   244,   223,   245,   223,   245,   223,   245,     1,   209,
     210,   225,   246,     1,   209,   210,   225,   246,   209,   210,
     226,   247,   209,   210,   227,   248,   209,   210,   228,   249,
     229,   250,   230,   251,   121,   209,   210,   235,   236,   255,
     256,   209,   233,     1,   206,     1,   113,   214,   215,     1,
     206,   235,   255,   209,   233,   220,   242,   220,   242,   220,
     242,     1,   221,   243,     1,   221,   243,   222,   244,   222,
     244,   223,   245,   223,   245,   223,   245,   223,   245,     1,
     209,   210,   225,   246,     1,   209,   210,   225,   246,   209,
     210,   226,   247,   209,   210,   227,   248,   209,   210,   228,
     249,   229,   250,   230,   251,   121,   235,   236,   255,   256,
     209,   233,   110,   111,   206,   373,   374,   206,   118,   372,
     375,   376,   376,   190,   191,   193,   195,   206,   199,   191,
     193,   195,   235,   236,   255,   256,   235,   236,   255,   256,
     310,   111,   116,   111,   119,   110,   119,   206,   259,   273,
     276,   311,   314,   315,   179,   115,   115,   115,   278,   301,
     306,   310,   119,   206,   119,   206,   311,   206,   112,   118,
     169,   170,   169,   170,   354,   354,   354,   365,   354,   354,
       1,   319,   320,   113,   257,   258,   119,   115,   117,   301,
     310,   301,   306,   121,   307,   206,   112,   304,   304,   206,
     115,     1,   115,     1,   115,   278,   200,   110,   198,   198,
     257,   258,   261,   188,   189,     1,   118,   262,   116,   121,
     116,   121,   116,   197,   193,   206,   354,   355,     1,   115,
     117,   115,   117,   115,   150,   151,   154,   155,   156,   118,
     148,   151,   115,   118,   150,   151,   154,   155,   156,   116,
     314,   315,   316,   317,   318,   321,     1,   118,   262,     1,
     118,   262,   113,   113,   113,   124,   124,   124,   308,   113,
     332,   333,   124,   136,   257,   258,   328,   329,   291,   328,
     328,   328,   329,   113,   113,   113,     1,   158,   159,   334,
     335,   121,   121,   334,   335,   235,   255,   235,   255,     1,
     113,   235,   255,   121,   257,   258,   121,   112,   112,   334,
     112,   210,   255,   112,   121,    56,     1,   113,   115,   206,
     235,   255,   356,   115,   115,   115,   115,   115,   365,   112,
     233,   233,   206,   334,   335,    90,     1,   210,   254,    88,
      89,    90,     1,   233,   254,     1,   210,   254,     1,   233,
     254,   110,   355,   115,   135,   136,   113,   135,   265,   273,
     275,   280,   311,   113,     1,   206,     1,   113,   214,   215,
       1,   206,   235,   255,     1,   206,     1,   113,   214,   215,
       1,   206,   235,   255,   113,   113,   311,   200,   113,   312,
     332,   333,   257,   258,   110,   309,   310,   112,   309,   123,
     110,   123,   206,   259,   265,   273,   276,   280,   312,   113,
     113,   113,   113,   257,   258,   123,   123,   312,   117,   113,
     117,   117,   117,   220,   242,   365,     1,   118,   209,   233,
       1,     1,   113,   117,   113,   124,   124,     1,   117,   121,
     121,   117,   121,   121,   113,   117,   124,   124,   121,   121,
     121,   121,   206,   206,   115,   117,   206,   365,   118,   118,
     121,   121,   121,   121,   121,   121,   121,   121,   193,   200,
     110,   119,   119,   206,   113,   115,   301,   310,   301,   306,
     113,   119,   119,   206,   113,     1,   158,   159,   277,   306,
     301,   301,   257,   258,   112,   113,   115,   111,   200,   111,
     111,   115,     1,   115,   191,   206,   190,   191,   190,   195,
       1,   152,   153,     1,   152,   153,   355,     1,   319,   320,
     117,   118,   317,   318,     1,   115,     1,   115,   113,   113,
     124,   124,   124,   311,   313,     1,   334,   335,   334,   335,
     113,   113,   113,   113,     1,   334,   113,     1,   235,   334,
     335,   121,   121,   255,   113,   235,   255,    56,   255,   356,
     365,   112,   334,   121,   115,     1,   115,     1,   113,   255,
     356,     3,   113,   121,   365,   113,   113,   117,   112,   112,
     179,   113,   113,     1,   113,   117,   113,   124,   124,   113,
     117,   124,   124,   113,   111,   113,   113,   113,   124,   124,
     200,   309,   113,   332,   333,   257,   258,   200,   257,   258,
     110,   123,   112,   119,   317,   124,   124,   257,   258,   257,
     258,   123,   326,   206,   206,   233,     1,   210,   254,   209,
     210,   209,   210,   232,   252,   209,   210,   232,   252,   209,
     210,   209,   210,   232,   252,   209,   210,   232,   252,     1,
     209,   210,   232,   252,   209,   210,   232,   252,   209,   210,
     232,   252,   209,   210,   232,   252,   373,   115,   115,   111,
     200,   119,   354,   301,   301,   116,   119,     1,   121,   121,
     111,   188,   189,   115,   188,   189,   116,   116,   118,   317,
     318,     1,   188,   189,   188,   189,   334,   334,   334,   334,
     334,   335,   113,   112,   356,   113,   235,   255,   235,   334,
       1,     1,   113,   235,   255,   336,   337,   365,   115,   337,
       3,   113,   121,   119,   179,   233,   233,     1,     1,     1,
       1,   111,   113,   113,   124,   124,   111,   124,   124,   200,
     257,   258,   326,   321,   124,   124,   124,   124,   257,   258,
     113,   113,   113,   113,   111,   319,   257,   258,   257,   258,
     188,   189,   191,   191,     1,    64,    64,   235,   255,   113,
     235,   255,   113,   115,   113,   115,   334,   335,   113,   334,
     335,   113,   117,   121,   112,     3,   113,   121,   337,   115,
     337,    73,   179,   180,   181,   113,   113,   113,   117,   111,
     124,   124,   113,   117,   118,   124,   124,   115,   334,   334,
     113,   113,   115,   334,   235,   334,   335,   115,   336,   337,
     233,   337,   115,   337,   113,   121,     3,   113,   121,   354,
     354,   118,   180,   119,   179,   220,   242,   317,   118,   113,
     113,   113,   113,   113,   121,   115,   337,   337,   115,   337,
     181,   113,   334,   115,   115,   115,   337,   113,   113,   113,
     121,   118,   113,   115,   115,   115,   337,   115,   113,   115
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
      case 135: /* guess_type */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10150 "grammar.ec"
        break;
      case 136: /* type */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10155 "grammar.ec"
        break;
      case 137: /* base_strict_type */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10160 "grammar.ec"
        break;
      case 139: /* strict_type */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10165 "grammar.ec"
        break;
      case 140: /* class_function_definition_start */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10170 "grammar.ec"
        break;
      case 141: /* constructor_function_definition_start */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10175 "grammar.ec"
        break;
      case 142: /* destructor_function_definition_start */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10180 "grammar.ec"
        break;
      case 143: /* virtual_class_function_definition_start */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10185 "grammar.ec"
        break;
      case 144: /* class_function_definition_start_error */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10190 "grammar.ec"
        break;
      case 145: /* virtual_class_function_definition_start_error */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10195 "grammar.ec"
        break;
      case 146: /* class_function_definition */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10200 "grammar.ec"
        break;
      case 147: /* class_function_definition_error */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10205 "grammar.ec"
        break;
      case 148: /* instance_class_function_definition_start */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10210 "grammar.ec"
        break;
      case 149: /* instance_class_function_definition_start_error */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10215 "grammar.ec"
        break;
      case 150: /* instance_class_function_definition */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10220 "grammar.ec"
        break;
      case 151: /* instance_class_function_definition_error */
#line 225 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10225 "grammar.ec"
        break;
      case 152: /* data_member_initialization */
#line 223 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10230 "grammar.ec"
        break;
      case 153: /* data_member_initialization_error */
#line 223 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10235 "grammar.ec"
        break;
      case 154: /* data_member_initialization_list */
#line 246 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10240 "grammar.ec"
        break;
      case 155: /* data_member_initialization_list_error */
#line 246 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10245 "grammar.ec"
        break;
      case 156: /* data_member_initialization_list_coloned */
#line 246 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10250 "grammar.ec"
        break;
      case 157: /* members_initialization_list_coloned */
#line 247 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10255 "grammar.ec"
        break;
      case 158: /* members_initialization_list */
#line 247 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10260 "grammar.ec"
        break;
      case 159: /* members_initialization_list_error */
#line 247 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10265 "grammar.ec"
        break;
      case 160: /* instantiation_named */
#line 221 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10270 "grammar.ec"
        break;
      case 161: /* instantiation_named_error */
#line 221 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10275 "grammar.ec"
        break;
      case 165: /* instantiation_unnamed */
#line 221 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10280 "grammar.ec"
        break;
      case 166: /* instantiation_unnamed_error */
#line 221 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10285 "grammar.ec"
        break;
      case 169: /* default_property */
#line 223 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10290 "grammar.ec"
        break;
      case 170: /* default_property_error */
#line 223 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10295 "grammar.ec"
        break;
      case 171: /* default_property_list */
#line 246 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10300 "grammar.ec"
        break;
      case 172: /* default_property_list_error */
#line 246 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10305 "grammar.ec"
        break;
      case 175: /* property */
#line 232 "grammar.y"
        { FreeProperty((yyvaluep->prop)); };
#line 10310 "grammar.ec"
        break;
      case 186: /* struct_declaration */
#line 230 "grammar.y"
        { FreeClassDef((yyvaluep->classDef)); };
#line 10315 "grammar.ec"
        break;
      case 187: /* struct_declaration_error */
#line 230 "grammar.y"
        { FreeClassDef((yyvaluep->classDef)); };
#line 10320 "grammar.ec"
        break;
      case 188: /* struct_declaration_list */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeClassDef); };
#line 10325 "grammar.ec"
        break;
      case 189: /* struct_declaration_list_error */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeClassDef); };
#line 10330 "grammar.ec"
        break;
      case 190: /* template_datatype */
#line 251 "grammar.y"
        { FreeTemplateDataType((yyvaluep->templateDatatype)); };
#line 10335 "grammar.ec"
        break;
      case 191: /* template_type_argument */
#line 250 "grammar.y"
        { FreeTemplateArgument((yyvaluep->templateArgument)); };
#line 10340 "grammar.ec"
        break;
      case 192: /* template_type_parameter */
#line 249 "grammar.y"
        { FreeTemplateParameter((yyvaluep->templateParameter)); };
#line 10345 "grammar.ec"
        break;
      case 193: /* template_identifier_argument */
#line 250 "grammar.y"
        { FreeTemplateArgument((yyvaluep->templateArgument)); };
#line 10350 "grammar.ec"
        break;
      case 194: /* template_identifier_parameter */
#line 249 "grammar.y"
        { FreeTemplateParameter((yyvaluep->templateParameter)); };
#line 10355 "grammar.ec"
        break;
      case 195: /* template_expression_argument */
#line 250 "grammar.y"
        { FreeTemplateArgument((yyvaluep->templateArgument)); };
#line 10360 "grammar.ec"
        break;
      case 196: /* template_expression_parameter */
#line 249 "grammar.y"
        { FreeTemplateParameter((yyvaluep->templateParameter)); };
#line 10365 "grammar.ec"
        break;
      case 197: /* template_parameter */
#line 249 "grammar.y"
        { FreeTemplateParameter((yyvaluep->templateParameter)); };
#line 10370 "grammar.ec"
        break;
      case 199: /* template_argument */
#line 250 "grammar.y"
        { FreeTemplateArgument((yyvaluep->templateArgument)); };
#line 10375 "grammar.ec"
        break;
      case 203: /* class */
#line 229 "grammar.y"
        { FreeClass((yyvaluep->_class)); };
#line 10380 "grammar.ec"
        break;
      case 205: /* class_error */
#line 229 "grammar.y"
        { FreeClass((yyvaluep->_class)); };
#line 10385 "grammar.ec"
        break;
      case 206: /* identifier */
#line 186 "grammar.y"
        { FreeIdentifier((yyvaluep->id)); };
#line 10390 "grammar.ec"
        break;
      case 207: /* primary_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10395 "grammar.ec"
        break;
      case 211: /* primary_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10400 "grammar.ec"
        break;
      case 212: /* postfix_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10405 "grammar.ec"
        break;
      case 214: /* argument_expression_list */
#line 234 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10410 "grammar.ec"
        break;
      case 215: /* argument_expression_list_error */
#line 234 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10415 "grammar.ec"
        break;
      case 217: /* unary_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10420 "grammar.ec"
        break;
      case 220: /* cast_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10425 "grammar.ec"
        break;
      case 221: /* multiplicative_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10430 "grammar.ec"
        break;
      case 222: /* additive_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10435 "grammar.ec"
        break;
      case 223: /* shift_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10440 "grammar.ec"
        break;
      case 225: /* relational_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10445 "grammar.ec"
        break;
      case 226: /* equality_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10450 "grammar.ec"
        break;
      case 227: /* and_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10455 "grammar.ec"
        break;
      case 228: /* exclusive_or_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10460 "grammar.ec"
        break;
      case 229: /* inclusive_or_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10465 "grammar.ec"
        break;
      case 230: /* logical_and_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10470 "grammar.ec"
        break;
      case 231: /* logical_or_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10475 "grammar.ec"
        break;
      case 232: /* conditional_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10480 "grammar.ec"
        break;
      case 233: /* assignment_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10485 "grammar.ec"
        break;
      case 235: /* expression */
#line 234 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10490 "grammar.ec"
        break;
      case 237: /* postfix_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10495 "grammar.ec"
        break;
      case 240: /* unary_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10500 "grammar.ec"
        break;
      case 242: /* cast_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10505 "grammar.ec"
        break;
      case 243: /* multiplicative_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10510 "grammar.ec"
        break;
      case 244: /* additive_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10515 "grammar.ec"
        break;
      case 245: /* shift_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10520 "grammar.ec"
        break;
      case 246: /* relational_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10525 "grammar.ec"
        break;
      case 247: /* equality_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10530 "grammar.ec"
        break;
      case 248: /* and_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10535 "grammar.ec"
        break;
      case 249: /* exclusive_or_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10540 "grammar.ec"
        break;
      case 250: /* inclusive_or_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10545 "grammar.ec"
        break;
      case 251: /* logical_and_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10550 "grammar.ec"
        break;
      case 252: /* logical_or_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10555 "grammar.ec"
        break;
      case 253: /* conditional_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10560 "grammar.ec"
        break;
      case 254: /* assignment_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10565 "grammar.ec"
        break;
      case 255: /* expression_error */
#line 234 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10570 "grammar.ec"
        break;
      case 257: /* constant_expression */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10575 "grammar.ec"
        break;
      case 258: /* constant_expression_error */
#line 188 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10580 "grammar.ec"
        break;
      case 259: /* storage_class_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10585 "grammar.ec"
        break;
      case 260: /* external_storage_class_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10590 "grammar.ec"
        break;
      case 261: /* enumerator */
#line 204 "grammar.y"
        { FreeEnumerator((yyvaluep->enumerator)); };
#line 10595 "grammar.ec"
        break;
      case 262: /* enumerator_list */
#line 235 "grammar.y"
        { FreeList((yyvaluep->list), FreeEnumerator); };
#line 10600 "grammar.ec"
        break;
      case 264: /* enum_specifier_nocompound */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10605 "grammar.ec"
        break;
      case 265: /* enum_specifier_compound */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10610 "grammar.ec"
        break;
      case 266: /* enum_specifier_compound_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10615 "grammar.ec"
        break;
      case 268: /* enum_class */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10620 "grammar.ec"
        break;
      case 269: /* enum_class_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10625 "grammar.ec"
        break;
      case 270: /* class_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10630 "grammar.ec"
        break;
      case 271: /* class_specifier_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10635 "grammar.ec"
        break;
      case 272: /* ext_storage */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10640 "grammar.ec"
        break;
      case 273: /* type_qualifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10645 "grammar.ec"
        break;
      case 274: /* type_qualifier_list */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10650 "grammar.ec"
        break;
      case 275: /* type_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10655 "grammar.ec"
        break;
      case 276: /* strict_type_specifier */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10660 "grammar.ec"
        break;
      case 277: /* struct_declarator */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10665 "grammar.ec"
        break;
      case 278: /* struct_declarator_list */
#line 238 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclarator); };
#line 10670 "grammar.ec"
        break;
      case 279: /* struct_entry */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10675 "grammar.ec"
        break;
      case 280: /* struct_or_union_specifier_compound */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10680 "grammar.ec"
        break;
      case 281: /* struct_or_union_specifier_compound_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10685 "grammar.ec"
        break;
      case 282: /* struct_or_union_specifier_nocompound */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10690 "grammar.ec"
        break;
      case 283: /* struct_decl */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10695 "grammar.ec"
        break;
      case 284: /* struct_head */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10700 "grammar.ec"
        break;
      case 285: /* struct_class */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10705 "grammar.ec"
        break;
      case 286: /* struct_class_error */
#line 199 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10710 "grammar.ec"
        break;
      case 288: /* specifier_qualifier_list */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10715 "grammar.ec"
        break;
      case 289: /* guess_specifier_qualifier_list */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10720 "grammar.ec"
        break;
      case 290: /* declaration_specifiers */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10725 "grammar.ec"
        break;
      case 291: /* guess_declaration_specifiers */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10730 "grammar.ec"
        break;
      case 292: /* external_guess_declaration_specifiers */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10735 "grammar.ec"
        break;
      case 293: /* external_guess_declaration_specifiers_error */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10740 "grammar.ec"
        break;
      case 294: /* _inheritance_specifiers */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10745 "grammar.ec"
        break;
      case 295: /* inheritance_specifiers */
#line 236 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10750 "grammar.ec"
        break;
      case 299: /* identifier_list_error */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10755 "grammar.ec"
        break;
      case 300: /* identifier_list */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10760 "grammar.ec"
        break;
      case 301: /* direct_declarator_nofunction */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10765 "grammar.ec"
        break;
      case 302: /* direct_declarator_function_start */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10770 "grammar.ec"
        break;
      case 303: /* direct_declarator_function */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10775 "grammar.ec"
        break;
      case 304: /* direct_declarator_function_error */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10780 "grammar.ec"
        break;
      case 305: /* direct_declarator */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10785 "grammar.ec"
        break;
      case 306: /* ext_decl */
#line 231 "grammar.y"
        { delete (yyvaluep->string); };
#line 10790 "grammar.ec"
        break;
      case 308: /* direct_abstract_declarator */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10795 "grammar.ec"
        break;
      case 309: /* direct_abstract_declarator_noarray */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10800 "grammar.ec"
        break;
      case 310: /* pointer */
#line 187 "grammar.y"
        { FreePointer((yyvaluep->pointer)); };
#line 10805 "grammar.ec"
        break;
      case 311: /* abstract_declarator */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10810 "grammar.ec"
        break;
      case 312: /* abstract_declarator_noarray */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10815 "grammar.ec"
        break;
      case 313: /* declarator */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10820 "grammar.ec"
        break;
      case 314: /* declarator_function */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10825 "grammar.ec"
        break;
      case 315: /* declarator_function_error */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10830 "grammar.ec"
        break;
      case 316: /* declarator_nofunction */
#line 205 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10835 "grammar.ec"
        break;
      case 317: /* initializer */
#line 210 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10840 "grammar.ec"
        break;
      case 318: /* initializer_error */
#line 210 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10845 "grammar.ec"
        break;
      case 319: /* initializer_condition */
#line 210 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10850 "grammar.ec"
        break;
      case 320: /* initializer_condition_error */
#line 210 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10855 "grammar.ec"
        break;
      case 321: /* initializer_list */
#line 240 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitializer); };
#line 10860 "grammar.ec"
        break;
      case 322: /* init_declarator */
#line 211 "grammar.y"
        { FreeInitDeclarator((yyvaluep->initDeclarator)); };
#line 10865 "grammar.ec"
        break;
      case 323: /* init_declarator_error */
#line 211 "grammar.y"
        { FreeInitDeclarator((yyvaluep->initDeclarator)); };
#line 10870 "grammar.ec"
        break;
      case 324: /* init_declarator_list */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitDeclarator); };
#line 10875 "grammar.ec"
        break;
      case 325: /* init_declarator_list_error */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitDeclarator); };
#line 10880 "grammar.ec"
        break;
      case 326: /* type_name */
#line 212 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10885 "grammar.ec"
        break;
      case 327: /* guess_type_name */
#line 212 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10890 "grammar.ec"
        break;
      case 328: /* parameter_declaration */
#line 212 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10895 "grammar.ec"
        break;
      case 329: /* parameter_declaration_error */
#line 212 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10900 "grammar.ec"
        break;
      case 330: /* parameter_list */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10905 "grammar.ec"
        break;
      case 331: /* parameter_list_error */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10910 "grammar.ec"
        break;
      case 332: /* parameter_type_list */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10915 "grammar.ec"
        break;
      case 333: /* parameter_type_list_error */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10920 "grammar.ec"
        break;
      case 334: /* statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10925 "grammar.ec"
        break;
      case 335: /* statement_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10930 "grammar.ec"
        break;
      case 339: /* labeled_statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10935 "grammar.ec"
        break;
      case 340: /* labeled_statement_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10940 "grammar.ec"
        break;
      case 341: /* declaration_mode */
#line 252 "grammar.y"
        { };
#line 10945 "grammar.ec"
        break;
      case 343: /* declaration */
#line 217 "grammar.y"
        { FreeDeclaration((yyvaluep->declaration)); };
#line 10950 "grammar.ec"
        break;
      case 347: /* declaration_list */
#line 239 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclaration); };
#line 10955 "grammar.ec"
        break;
      case 348: /* declaration_list_error */
#line 239 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclaration); };
#line 10960 "grammar.ec"
        break;
      case 349: /* statement_list */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeStatement); };
#line 10965 "grammar.ec"
        break;
      case 350: /* statement_list_error */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeStatement); };
#line 10970 "grammar.ec"
        break;
      case 351: /* compound_inside */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10975 "grammar.ec"
        break;
      case 352: /* compound_inside_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10980 "grammar.ec"
        break;
      case 353: /* compound_start */
#line 248 "grammar.y"
        { PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };
#line 10985 "grammar.ec"
        break;
      case 354: /* compound_statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10990 "grammar.ec"
        break;
      case 355: /* compound_statement_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10995 "grammar.ec"
        break;
      case 356: /* expression_statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11000 "grammar.ec"
        break;
      case 357: /* selection_statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11005 "grammar.ec"
        break;
      case 358: /* selection_statement_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11010 "grammar.ec"
        break;
      case 359: /* iteration_statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11015 "grammar.ec"
        break;
      case 360: /* iteration_statement_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11020 "grammar.ec"
        break;
      case 361: /* jump_statement */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11025 "grammar.ec"
        break;
      case 362: /* jump_statement_error */
#line 213 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 11030 "grammar.ec"
        break;
      case 363: /* function_definition */
#line 218 "grammar.y"
        { FreeFunction((yyvaluep->function)); };
#line 11035 "grammar.ec"
        break;
      case 364: /* function_definition_error */
#line 218 "grammar.y"
        { FreeFunction((yyvaluep->function)); };
#line 11040 "grammar.ec"
        break;
      case 365: /* string_literal */
#line 231 "grammar.y"
        { delete (yyvaluep->string); };
#line 11045 "grammar.ec"
        break;
      case 366: /* external_declaration */
#line 219 "grammar.y"
        { FreeExternal((yyvaluep->external)); };
#line 11050 "grammar.ec"
        break;
      case 367: /* external_declaration_error */
#line 219 "grammar.y"
        { FreeExternal((yyvaluep->external)); };
#line 11055 "grammar.ec"
        break;
      case 368: /* translation_unit_error */
#line 244 "grammar.y"
        { if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };
#line 11060 "grammar.ec"
        break;
      case 369: /* translation_unit */
#line 244 "grammar.y"
        { if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };
#line 11065 "grammar.ec"
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
#line 260 "grammar.y"
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
#line 288 "grammar.y"
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
#line 345 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 5:
#line 347 "grammar.y"
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
#line 446 "grammar.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 7:
#line 450 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 9:
#line 454 "grammar.y"
    { (yyval.specifier) = (yyvsp[-3].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:
#line 456 "grammar.y"
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
#line 505 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:
#line 507 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:
#line 512 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 14:
#line 517 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[-2].list), FreeSpecifier) ;}
    break;

  case 15:
#line 522 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:
#line 524 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:
#line 529 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 18:
#line 531 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 19:
#line 536 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 20:
#line 538 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 21:
#line 543 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 22:
#line 545 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 23:
#line 547 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 24:
#line 549 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 25:
#line 551 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 26:
#line 555 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 27:
#line 560 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 28:
#line 562 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 29:
#line 564 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 30:
#line 566 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 31:
#line 568 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 32:
#line 574 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 33:
#line 576 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, MkDeclaratorFunction((yyvsp[0].declarator), null), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 34:
#line 581 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 35:
#line 586 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 36:
#line 591 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 37:
#line 593 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 38:
#line 595 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 39:
#line 599 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 40:
#line 600 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 41:
#line 604 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 42:
#line 606 "grammar.y"
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
#line 616 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 44:
#line 620 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 45:
#line 622 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 46:
#line 624 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 47:
#line 628 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 48:
#line 630 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 49:
#line 632 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 50:
#line 635 "grammar.y"
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
#line 646 "grammar.y"
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
#line 656 "grammar.y"
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
#line 675 "grammar.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 54:
#line 677 "grammar.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 55:
#line 681 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 56:
#line 682 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 57:
#line 683 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members);  members.loc = (yylsp[0]);  ;}
    break;

  case 58:
#line 684 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 59:
#line 685 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 60:
#line 686 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 61:
#line 687 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 63:
#line 689 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 65:
#line 694 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 66:
#line 695 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 67:
#line 696 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 68:
#line 700 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 69:
#line 701 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 70:
#line 702 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 71:
#line 703 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 72:
#line 704 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 73:
#line 705 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 74:
#line 706 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[-1].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 75:
#line 711 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 76:
#line 713 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 77:
#line 718 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list)); (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 78:
#line 720 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 79:
#line 722 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list)); (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 80:
#line 724 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-2].list), MkExpIdentifier((yyvsp[-1].id)), null); (yyval.instance).exp.loc = (yylsp[-1]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-1]); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 81:
#line 726 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), null);(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 82:
#line 756 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 83:
#line 758 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 84:
#line 763 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list));(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 85:
#line 765 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 86:
#line 767 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list));(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 87:
#line 769 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-2].list), MkExpIdentifier((yyvsp[-1].id)), null);(yyval.instance).exp.loc = (yylsp[-1]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-1]); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 88:
#line 771 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), null);(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 89:
#line 800 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 90:
#line 802 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 91:
#line 804 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 92:
#line 809 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 93:
#line 811 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 94:
#line 816 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 95:
#line 818 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 96:
#line 822 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 97:
#line 824 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-1].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 98:
#line 826 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 99:
#line 828 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 100:
#line 833 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 101:
#line 836 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-1]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-1].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 102:
#line 839 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 103:
#line 842 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 104:
#line 907 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 105:
#line 909 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 106:
#line 914 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 107:
#line 916 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 108:
#line 918 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 109:
#line 920 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 110:
#line 922 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 111:
#line 952 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 112:
#line 956 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 113:
#line 957 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), MkInitializerAssignment(MkExpDummy())); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; (yyval.memberInit).initializer.loc.end = (yylsp[-1]).end; ;}
    break;

  case 114:
#line 958 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-1].exp), null); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 115:
#line 962 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 116:
#line 963 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 117:
#line 964 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 118:
#line 968 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 119:
#line 969 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 120:
#line 970 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 122:
#line 976 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 123:
#line 979 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 124:
#line 982 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-1].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 125:
#line 985 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), (yyvsp[-1].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 126:
#line 988 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 128:
#line 994 "grammar.y"
    { (yyvsp[-2].prop).setStmt = (yyvsp[0].stmt); ;}
    break;

  case 129:
#line 996 "grammar.y"
    { (yyvsp[-2].prop).getStmt = (yyvsp[0].stmt); ;}
    break;

  case 130:
#line 998 "grammar.y"
    { (yyvsp[-2].prop).issetStmt = (yyvsp[0].stmt); ;}
    break;

  case 131:
#line 1000 "grammar.y"
    { (yyvsp[-1].prop).isWatchable = true; ;}
    break;

  case 132:
#line 1002 "grammar.y"
    { (yyvsp[-2].prop).category = (yyvsp[0].string); ;}
    break;

  case 133:
#line 1006 "grammar.y"
    { (yyvsp[-1].prop).loc.end = (yylsp[0]).end; ;}
    break;

  case 134:
#line 1011 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 135:
#line 1014 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 136:
#line 1017 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-1].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 137:
#line 1020 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), (yyvsp[-1].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 138:
#line 1023 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 140:
#line 1029 "grammar.y"
    { (yyvsp[-2].prop).setStmt = (yyvsp[0].stmt); ;}
    break;

  case 141:
#line 1031 "grammar.y"
    { (yyvsp[-2].prop).getStmt = (yyvsp[0].stmt); ;}
    break;

  case 142:
#line 1035 "grammar.y"
    { (yyvsp[-1].prop).loc.end = (yylsp[0]).end; ;}
    break;

  case 143:
#line 1040 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].id)); ;}
    break;

  case 144:
#line 1042 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].id)); ;}
    break;

  case 145:
#line 1047 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 146:
#line 1049 "grammar.y"
    { (yyval.propertyWatch) = MkDeleteWatch((yyvsp[0].stmt)); ;}
    break;

  case 147:
#line 1054 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].propertyWatch)); ;}
    break;

  case 148:
#line 1056 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].propertyWatch)); ;}
    break;

  case 149:
#line 1061 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[-2].list), (yyvsp[0].stmt)); ;}
    break;

  case 150:
#line 1066 "grammar.y"
    { (yyval.stmt) = MkWatchStmt(null, (yyvsp[-4].exp), (yyvsp[-1].list)); ;}
    break;

  case 151:
#line 1068 "grammar.y"
    { (yyval.stmt) = MkWatchStmt((yyvsp[-8].exp), (yyvsp[-4].exp), (yyvsp[-1].list)); ;}
    break;

  case 152:
#line 1073 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[-3].exp), (yyvsp[-1].list)); ;}
    break;

  case 153:
#line 1075 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[-7].exp), (yyvsp[-3].exp), (yyvsp[-1].list)); ;}
    break;

  case 154:
#line 1077 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[-1].exp), null); ;}
    break;

  case 155:
#line 1079 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[-5].exp), (yyvsp[-1].exp), null); ;}
    break;

  case 156:
#line 1084 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, null); ;}
    break;

  case 157:
#line 1086 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, (yyvsp[0].list)); ;}
    break;

  case 158:
#line 1088 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[-2].exp), null); ;}
    break;

  case 159:
#line 1090 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[-3].exp), (yyvsp[0].list)); ;}
    break;

  case 160:
#line 1094 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 161:
#line 1095 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 162:
#line 1096 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 163:
#line 1097 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 164:
#line 1098 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 165:
#line 1099 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 166:
#line 1101 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-3].declMode); ;}
    break;

  case 167:
#line 1102 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 168:
#line 1103 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 169:
#line 1104 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 170:
#line 1105 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 171:
#line 1106 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 172:
#line 1108 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 173:
#line 1109 "grammar.y"
    { (yyval.classDef) = MkClassDefClassData(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 174:
#line 1110 "grammar.y"
    { (yyval.classDef) = MkClassDefClassProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 175:
#line 1111 "grammar.y"
    { (yyval.classDef) = MkClassDefPropertyWatch((yyvsp[-1].propertyWatch)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 176:
#line 1112 "grammar.y"
    { (yyval.classDef) = null; deleteWatchable = true; ;}
    break;

  case 177:
#line 1113 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[-1].id).string); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 178:
#line 1114 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[-1].specifier).name); FreeSpecifier((yyvsp[-1].specifier)); ;}
    break;

  case 179:
#line 1115 "grammar.y"
    { (yyval.classDef) = MkClassDefNoExpansion(); ;}
    break;

  case 180:
#line 1116 "grammar.y"
    { (yyval.classDef) = MkClassDefFixed(); ;}
    break;

  case 181:
#line 1117 "grammar.y"
    { (yyval.classDef) = MkClassDefDesignerDefaultProperty((yyvsp[-1].id)); ;}
    break;

  case 182:
#line 1118 "grammar.y"
    { (yyval.classDef) = MkClassDefClassPropertyValue((yyvsp[-4].id), (yyvsp[-1].initializer)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 183:
#line 1120 "grammar.y"
    { (yyval.classDef) = null; ;}
    break;

  case 184:
#line 1121 "grammar.y"
    { memberAccessStack[defaultMemberAccess] = (yyvsp[-1].declMode); if(defaultMemberAccess == 0) { (yyval.classDef) = MkClassDefMemberAccess(); (yyval.classDef).memberAccess = (yyvsp[-1].declMode); (yyval.classDef).loc = (yyloc); } else (yyval.classDef) = null; ;}
    break;

  case 185:
#line 1123 "grammar.y"
    { (yyval.classDef) = MkClassDefAccessOverride((yyvsp[-3].declMode), (yyvsp[-1].id)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 186:
#line 1127 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyvsp[0].classFunction).loc;  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 187:
#line 1128 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyvsp[-1].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 188:
#line 1129 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyvsp[-1].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 189:
#line 1130 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyvsp[0].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 190:
#line 1131 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyvsp[0].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 191:
#line 1133 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 192:
#line 1134 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 193:
#line 1135 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 194:
#line 1136 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 195:
#line 1137 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 196:
#line 1139 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[0].list)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; ;}
    break;

  case 197:
#line 1143 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 198:
#line 1144 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 199:
#line 1145 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 200:
#line 1149 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 203:
#line 1152 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 204:
#line 1153 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 205:
#line 1157 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); ;}
    break;

  case 206:
#line 1158 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 207:
#line 1159 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[0].id).string)), null); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 208:
#line 1163 "grammar.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[0].templateDatatype)); ;}
    break;

  case 209:
#line 1167 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[0].id), null, null); ;}
    break;

  case 210:
#line 1168 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-2].id), null, (yyvsp[0].templateArgument)); ;}
    break;

  case 211:
#line 1169 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-2].id), (yyvsp[0].templateDatatype), null); ;}
    break;

  case 212:
#line 1170 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-4].id), (yyvsp[-2].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 213:
#line 1171 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[0].string)), null, null); delete (yyvsp[0].string); ;}
    break;

  case 214:
#line 1172 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-2].string)), null, (yyvsp[0].templateArgument)); ;}
    break;

  case 215:
#line 1173 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-2].string)), (yyvsp[0].templateDatatype), null); ;}
    break;

  case 216:
#line 1174 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-4].string)), (yyvsp[-2].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 217:
#line 1178 "grammar.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[0].id)); ;}
    break;

  case 218:
#line 1182 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[0].id), dataMember, null); ;}
    break;

  case 219:
#line 1183 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[-2].id), dataMember, (yyvsp[0].templateArgument)); ;}
    break;

  case 220:
#line 1187 "grammar.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); ;}
    break;

  case 221:
#line 1191 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[0].id), (yyvsp[-1].templateDatatype), null); ;}
    break;

  case 222:
#line 1192 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[-2].id), (yyvsp[-3].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 226:
#line 1202 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateParameter)); ;}
    break;

  case 227:
#line 1203 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateParameter)); ;}
    break;

  case 231:
#line 1210 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 232:
#line 1211 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 233:
#line 1212 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 234:
#line 1214 "grammar.y"
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
#line 1226 "grammar.y"
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
#line 1238 "grammar.y"
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
#line 1252 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); ;}
    break;

  case 238:
#line 1253 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); ;}
    break;

  case 239:
#line 1258 "grammar.y"
    {
      PushContext();
   ;}
    break;

  case 240:
#line 1263 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); FreeIdentifier((yyvsp[0].id)); (yyval.symbol).nameLoc = (yylsp[0]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 241:
#line 1265 "grammar.y"
    { 
      (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); 
      (yyval.symbol).nameLoc = (yylsp[0]); 
      FreeSpecifier((yyvsp[0].specifier)); 
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   ;}
    break;

  case 242:
#line 1272 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); FreeIdentifier((yyvsp[-2].id)); FreeIdentifier((yyvsp[0].id)); (yyval.symbol).nameLoc = (yylsp[0]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 243:
#line 1273 "grammar.y"
    { (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); FreeIdentifier((yyvsp[-2].id)); (yyval.symbol).nameLoc = (yylsp[0]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[0].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 244:
#line 1275 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-3].id)); (yyval.symbol).nameLoc = (yylsp[-3]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 245:
#line 1277 "grammar.y"
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
#line 1285 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-5].id)); FreeIdentifier((yyvsp[-3].id)); (yyval.symbol).nameLoc = (yylsp[-3]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 247:
#line 1286 "grammar.y"
    { (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-5].id)); (yyval.symbol).nameLoc = (yylsp[-3]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[-3].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 248:
#line 1291 "grammar.y"
    {
         (yyval._class).loc = (yyloc);
      ;}
    break;

  case 249:
#line 1297 "grammar.y"
    {
         (yyval._class) = (yyvsp[-1]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[0]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 250:
#line 1304 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, MkList()); (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 251:
#line 1310 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 252:
#line 1317 "grammar.y"
    {
         (yyval._class) = MkClass(DeclClassAddNameSpace(0, (yyvsp[-1].id).string), null, null); FreeIdentifier((yyvsp[-1].id));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 253:
#line 1323 "grammar.y"
    {
         (yyval._class) = MkClass(DeclClass(0, (yyvsp[-1].specifier).name), null, null); FreeSpecifier((yyvsp[-1].specifier));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 254:
#line 1332 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), (yyvsp[0].list), null);
      ;}
    break;

  case 255:
#line 1339 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, (yyvsp[0].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 256:
#line 1345 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = (yyvsp[0].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 257:
#line 1351 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, (yyvsp[0].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 258:
#line 1357 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = (yyvsp[0].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 259:
#line 1363 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, MkList()); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 260:
#line 1369 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = MkList(); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 261:
#line 1380 "grammar.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); ;}
    break;

  case 263:
#line 1386 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 264:
#line 1390 "grammar.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 265:
#line 1391 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 266:
#line 1392 "grammar.y"
    { (yyval.exp) = MkExpExtensionCompound((yyvsp[-1].stmt)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 267:
#line 1393 "grammar.y"
    { (yyval.exp) = MkExpExtensionExpression((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 268:
#line 1394 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[-2].typeName), (yyvsp[0].initializer)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 269:
#line 1395 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[-5].typeName), MkInitializerAssignment(MkExpExtensionInitializer((yyvsp[-2].typeName), (yyvsp[0].initializer)))); (yyval.exp).loc = (yyloc); ;}
    break;

  case 270:
#line 1396 "grammar.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 271:
#line 1397 "grammar.y"
    { (yyval.exp) = MkExpString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 272:
#line 1398 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), null); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 273:
#line 1399 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), (yyvsp[-2].string)); delete (yyvsp[-2].string); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 274:
#line 1400 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 275:
#line 1401 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 276:
#line 1402 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 277:
#line 1403 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 278:
#line 1404 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 279:
#line 1405 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 280:
#line 1406 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 281:
#line 1407 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 282:
#line 1408 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 283:
#line 1409 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 284:
#line 1410 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 285:
#line 1411 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 286:
#line 1412 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 287:
#line 1413 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 288:
#line 1414 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 289:
#line 1415 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 290:
#line 1416 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 291:
#line 1417 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[-1].list), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 292:
#line 1418 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[-2].list), (yyvsp[-1].declarator)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 293:
#line 1419 "grammar.y"
    { (yyval.exp) = MkExpClass(MkListOne(MkSpecifierName((yyvsp[-1].id).string)), null); FreeIdentifier((yyvsp[-1].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 294:
#line 1420 "grammar.y"
    { (yyval.exp) = MkExpVaArg((yyvsp[-3].exp), (yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 295:
#line 1422 "grammar.y"
    { (yyval.exp) = MkExpClassData((yyvsp[-1].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 300:
#line 1428 "grammar.y"
    { (yyval.exp) = MkExpArray((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 301:
#line 1432 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 302:
#line 1436 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 303:
#line 1440 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[0].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 304:
#line 1441 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[0].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 306:
#line 1447 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 307:
#line 1448 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 308:
#line 1449 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 309:
#line 1450 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 310:
#line 1451 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); if((yyvsp[-1].list)->last) ((Expression)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; ;}
    break;

  case 311:
#line 1452 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 312:
#line 1453 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 313:
#line 1454 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 314:
#line 1455 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 315:
#line 1457 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 316:
#line 1458 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 317:
#line 1459 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 318:
#line 1460 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 319:
#line 1461 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 320:
#line 1462 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 321:
#line 1463 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 322:
#line 1464 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 324:
#line 1470 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 325:
#line 1471 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 326:
#line 1472 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 327:
#line 1473 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 328:
#line 1474 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); if((yyvsp[-1].list)->last) ((Expression)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; ;}
    break;

  case 329:
#line 1475 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 330:
#line 1476 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 331:
#line 1477 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 332:
#line 1478 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 333:
#line 1480 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 334:
#line 1481 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 335:
#line 1482 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 336:
#line 1483 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 337:
#line 1484 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 338:
#line 1485 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 339:
#line 1486 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 340:
#line 1487 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 341:
#line 1491 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 342:
#line 1492 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 343:
#line 1493 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 344:
#line 1494 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 345:
#line 1498 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 346:
#line 1499 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 347:
#line 1500 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 348:
#line 1501 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 349:
#line 1502 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[0]).end; exp.loc.end = (yylsp[0]).end; ListAdd((yyvsp[-1].list), exp); ;}
    break;

  case 350:
#line 1506 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 351:
#line 1507 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 352:
#line 1508 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 353:
#line 1509 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 354:
#line 1510 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 355:
#line 1511 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 356:
#line 1512 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 357:
#line 1513 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-1].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 358:
#line 1514 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-1].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 363:
#line 1528 "grammar.y"
    { (yyval.i) = '&'; ;}
    break;

  case 364:
#line 1529 "grammar.y"
    { (yyval.i) = '*'; ;}
    break;

  case 365:
#line 1530 "grammar.y"
    { (yyval.i) = '+'; ;}
    break;

  case 366:
#line 1531 "grammar.y"
    { (yyval.i) = '-'; ;}
    break;

  case 367:
#line 1532 "grammar.y"
    { (yyval.i) = '~'; ;}
    break;

  case 368:
#line 1533 "grammar.y"
    { (yyval.i) = '!'; ;}
    break;

  case 369:
#line 1534 "grammar.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 370:
#line 1535 "grammar.y"
    { (yyval.i) = _INCREF; ;}
    break;

  case 372:
#line 1540 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 374:
#line 1545 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 375:
#line 1546 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 376:
#line 1547 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 377:
#line 1548 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 378:
#line 1549 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 379:
#line 1550 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 381:
#line 1555 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 382:
#line 1556 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 383:
#line 1557 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 384:
#line 1558 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 386:
#line 1563 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 387:
#line 1564 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 388:
#line 1565 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 389:
#line 1566 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 390:
#line 1571 "grammar.y"
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   ;}
    break;

  case 392:
#line 1579 "grammar.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 393:
#line 1580 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 394:
#line 1581 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 395:
#line 1582 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 396:
#line 1583 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 397:
#line 1584 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 398:
#line 1585 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 399:
#line 1586 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 401:
#line 1591 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 402:
#line 1592 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 403:
#line 1593 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 404:
#line 1594 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 405:
#line 1596 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 406:
#line 1597 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 407:
#line 1598 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 408:
#line 1599 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 410:
#line 1604 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 411:
#line 1605 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 412:
#line 1607 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 413:
#line 1608 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 415:
#line 1613 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 416:
#line 1614 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 417:
#line 1616 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 418:
#line 1617 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 420:
#line 1622 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 421:
#line 1623 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 422:
#line 1625 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 423:
#line 1626 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 425:
#line 1631 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 426:
#line 1632 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 428:
#line 1637 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 429:
#line 1638 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 431:
#line 1643 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 432:
#line 1644 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 433:
#line 1645 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 434:
#line 1646 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 435:
#line 1648 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 436:
#line 1649 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 437:
#line 1650 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 438:
#line 1651 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 439:
#line 1653 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 440:
#line 1654 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 441:
#line 1655 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 442:
#line 1656 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 443:
#line 1658 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 444:
#line 1659 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 445:
#line 1660 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 446:
#line 1661 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 448:
#line 1666 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 449:
#line 1667 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 450:
#line 1668 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 451:
#line 1669 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 452:
#line 1671 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 453:
#line 1672 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 454:
#line 1673 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 455:
#line 1674 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 456:
#line 1678 "grammar.y"
    { (yyval.i) = '='; ;}
    break;

  case 457:
#line 1679 "grammar.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 458:
#line 1680 "grammar.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 459:
#line 1681 "grammar.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 460:
#line 1682 "grammar.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 461:
#line 1683 "grammar.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 462:
#line 1684 "grammar.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 463:
#line 1685 "grammar.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 464:
#line 1686 "grammar.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 465:
#line 1687 "grammar.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 466:
#line 1688 "grammar.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 467:
#line 1692 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 468:
#line 1693 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 469:
#line 1694 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 471:
#line 1699 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 472:
#line 1700 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 473:
#line 1701 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 475:
#line 1706 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); /*printf("Sorry, didn't mean that syntax error\n");*/ ;}
    break;

  case 477:
#line 1708 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 478:
#line 1710 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 479:
#line 1711 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 480:
#line 1713 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 481:
#line 1714 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 482:
#line 1715 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end;(yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 483:
#line 1716 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyloc).end = yylloc.start; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = yylloc.start; /*@2.end; $$.call.argLoc.end.charPos++;*/ ;}
    break;

  case 484:
#line 1717 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 485:
#line 1719 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 486:
#line 1720 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 487:
#line 1721 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 488:
#line 1722 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 489:
#line 1726 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); ;}
    break;

  case 491:
#line 1728 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 492:
#line 1730 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 493:
#line 1731 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 494:
#line 1733 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 495:
#line 1734 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 496:
#line 1735 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end;(yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 497:
#line 1736 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyloc).end = yylloc.start; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = yylloc.start; /*@2.end; $$.call.argLoc.end.charPos++;*/ ;}
    break;

  case 498:
#line 1737 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 499:
#line 1739 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 500:
#line 1740 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 501:
#line 1741 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 502:
#line 1742 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 503:
#line 1746 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 504:
#line 1747 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 505:
#line 1748 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 506:
#line 1749 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 507:
#line 1750 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 508:
#line 1751 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 509:
#line 1752 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-2].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 510:
#line 1753 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-2].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 511:
#line 1754 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-2].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 517:
#line 1770 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 519:
#line 1775 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 520:
#line 1776 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 521:
#line 1777 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 522:
#line 1778 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 523:
#line 1779 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 524:
#line 1780 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 526:
#line 1785 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 527:
#line 1786 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 528:
#line 1787 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 529:
#line 1788 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 530:
#line 1789 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 531:
#line 1790 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 532:
#line 1791 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 533:
#line 1792 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 535:
#line 1797 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 536:
#line 1798 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 537:
#line 1799 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 538:
#line 1800 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 540:
#line 1806 "grammar.y"
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

  case 541:
#line 1855 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 542:
#line 1856 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 543:
#line 1857 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 544:
#line 1858 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 545:
#line 1859 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 546:
#line 1860 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 547:
#line 1861 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 549:
#line 1866 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 550:
#line 1867 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 551:
#line 1868 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 552:
#line 1869 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 553:
#line 1871 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 554:
#line 1872 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 555:
#line 1873 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 556:
#line 1874 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 557:
#line 1876 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 558:
#line 1877 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 559:
#line 1878 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 560:
#line 1879 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 562:
#line 1884 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 563:
#line 1885 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 564:
#line 1887 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 565:
#line 1888 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 567:
#line 1893 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 568:
#line 1894 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 569:
#line 1896 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 570:
#line 1897 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 572:
#line 1902 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 573:
#line 1903 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 574:
#line 1905 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 575:
#line 1906 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 577:
#line 1911 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 578:
#line 1912 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 580:
#line 1917 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 581:
#line 1918 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 583:
#line 1923 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 584:
#line 1924 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 585:
#line 1925 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 586:
#line 1926 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 587:
#line 1927 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 588:
#line 1928 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 589:
#line 1929 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 590:
#line 1930 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 591:
#line 1932 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 592:
#line 1933 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 593:
#line 1934 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 594:
#line 1935 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 595:
#line 1936 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 596:
#line 1937 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 597:
#line 1938 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 598:
#line 1939 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 599:
#line 1941 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 600:
#line 1942 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 601:
#line 1943 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 602:
#line 1944 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 603:
#line 1946 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 604:
#line 1947 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 605:
#line 1948 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 606:
#line 1949 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 607:
#line 1952 "grammar.y"
    { 
         (yyval.exp) = MkExpCondition((yyvsp[-2].exp), MkListOne(MkExpDummy()), MkExpDummy()); 
         (yyval.exp).loc = (yyloc); 
         ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[-1]); 
         (yyval.exp).cond.elseExp.loc = (yylsp[0]); 
      ;}
    break;

  case 608:
#line 1959 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-2].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[-1]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 609:
#line 1963 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-1].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[0]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 610:
#line 1967 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-1].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[0]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 612:
#line 1974 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 613:
#line 1975 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).op.exp2.loc = (yylsp[-1]); ;}
    break;

  case 614:
#line 1976 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 615:
#line 1977 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).op.exp2.loc = (yylsp[-1]); ;}
    break;

  case 616:
#line 1979 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 617:
#line 1980 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 618:
#line 1984 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 619:
#line 1985 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].exp)); ;}
    break;

  case 620:
#line 1986 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 621:
#line 1987 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 625:
#line 1991 "grammar.y"
    { FreeList((yyvsp[0].list), FreeExpression); ;}
    break;

  case 626:
#line 1992 "grammar.y"
    { FreeList((yyvsp[0].list), FreeExpression); ;}
    break;

  case 627:
#line 1993 "grammar.y"
    { FreeList((yyvsp[0].list), FreeExpression); ;}
    break;

  case 628:
#line 1997 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 629:
#line 1998 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].exp)); ;}
    break;

  case 630:
#line 1999 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 631:
#line 2000 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 634:
#line 2010 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 635:
#line 2011 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 636:
#line 2012 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 637:
#line 2013 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 638:
#line 2014 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 639:
#line 2018 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); declMode = defaultAccess; ;}
    break;

  case 640:
#line 2019 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 641:
#line 2020 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); declMode = staticAccess; ;}
    break;

  case 642:
#line 2021 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 643:
#line 2022 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 644:
#line 2026 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 645:
#line 2027 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 646:
#line 2028 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 647:
#line 2032 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 648:
#line 2033 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 650:
#line 2038 "grammar.y"
    { memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 651:
#line 2042 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 652:
#line 2043 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); POP_DEFAULT_ACCESS ;}
    break;

  case 653:
#line 2047 "grammar.y"
    { (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 654:
#line 2048 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 655:
#line 2049 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), null); FreeSpecifier((yyvsp[-2].specifier)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 656:
#line 2053 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 657:
#line 2054 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 658:
#line 2056 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 659:
#line 2057 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list));  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 660:
#line 2058 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null);  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 661:
#line 2059 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 662:
#line 2060 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 663:
#line 2062 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-2].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 664:
#line 2063 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-3].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 665:
#line 2064 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), null); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-2].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 666:
#line 2065 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-4].specifier).name), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list); FreeSpecifier((yyvsp[-4].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 667:
#line 2066 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-4].specifier).name), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list); FreeSpecifier((yyvsp[-4].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 668:
#line 2070 "grammar.y"
    { (yyval.id) = (yyvsp[0].id); if(declMode) DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); ;}
    break;

  case 669:
#line 2071 "grammar.y"
    { (yyval.id) = MkIdentifier((yyvsp[0].specifier).name); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 670:
#line 2075 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 671:
#line 2076 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), null); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 672:
#line 2077 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 673:
#line 2081 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[0].list)); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 674:
#line 2082 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-1].list)); (yyval.specifier).baseSpecs = (yyvsp[-3].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 675:
#line 2083 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), null); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 676:
#line 2084 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), (yyvsp[-2].list)); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 677:
#line 2085 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), (yyvsp[-2].list)); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 678:
#line 2086 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-7].id), (yyvsp[-3].list)); (yyval.specifier).baseSpecs = (yyvsp[-5].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 679:
#line 2087 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-7].id), (yyvsp[-3].list)); (yyval.specifier).baseSpecs = (yyvsp[-5].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 680:
#line 2088 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), null); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 681:
#line 2089 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), null); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 682:
#line 2091 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 683:
#line 2092 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 684:
#line 2094 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 685:
#line 2095 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 686:
#line 2096 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 687:
#line 2097 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 688:
#line 2098 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 693:
#line 2112 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 694:
#line 2113 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].string)); delete (yyvsp[0].string); ;}
    break;

  case 695:
#line 2117 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 696:
#line 2118 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 697:
#line 2119 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 698:
#line 2124 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 699:
#line 2125 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 700:
#line 2129 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 701:
#line 2130 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 702:
#line 2131 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 703:
#line 2132 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 704:
#line 2133 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 705:
#line 2134 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 706:
#line 2135 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 707:
#line 2136 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 708:
#line 2137 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 709:
#line 2138 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 710:
#line 2139 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 711:
#line 2140 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 712:
#line 2141 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 716:
#line 2145 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); ;}
    break;

  case 717:
#line 2146 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 718:
#line 2147 "grammar.y"
    { _DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 719:
#line 2148 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 720:
#line 2149 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 721:
#line 2150 "grammar.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 722:
#line 2154 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 723:
#line 2155 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 724:
#line 2156 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 725:
#line 2157 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 726:
#line 2158 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 727:
#line 2159 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 728:
#line 2160 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 729:
#line 2161 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 730:
#line 2162 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 731:
#line 2163 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 732:
#line 2164 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 733:
#line 2165 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 734:
#line 2166 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 738:
#line 2170 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); ;}
    break;

  case 739:
#line 2171 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 740:
#line 2172 "grammar.y"
    { _DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 741:
#line 2173 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 742:
#line 2180 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 743:
#line 2182 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 744:
#line 2184 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 745:
#line 2186 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 746:
#line 2188 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 747:
#line 2190 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 748:
#line 2192 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 749:
#line 2194 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 750:
#line 2196 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 751:
#line 2198 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 752:
#line 2202 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 753:
#line 2203 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 754:
#line 2208 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null);
         (yyval.specifier).addNameSpace = true;
         (yyval.specifier).ctx = PushContext();
      ;}
    break;

  case 755:
#line 2214 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null);
         (yyval.specifier).ctx = PushContext();
         FreeSpecifier((yyvsp[0].specifier));
      ;}
    break;

  case 756:
#line 2222 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 757:
#line 2223 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 758:
#line 2224 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 759:
#line 2228 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); AddStructDefinitions((yyvsp[-2].specifier), (yyvsp[0].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 760:
#line 2229 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); AddStructDefinitions((yyvsp[-2].specifier), (yyvsp[0].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 761:
#line 2230 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 762:
#line 2232 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 763:
#line 2233 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 764:
#line 2234 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 765:
#line 2238 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 766:
#line 2243 "grammar.y"
    {
        (yyval.specifier) = (yyvsp[0].specifier);
        if(declMode)
        {
           ((yyvsp[0].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[0].specifier).id.string);
        }
     ;}
    break;

  case 767:
#line 2251 "grammar.y"
    {
      Symbol symbol = ((yyvsp[-3].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[-3].specifier).id.string);
      (yyval.specifier) = (yyvsp[-3].specifier);
      symbol.templateParams = (yyvsp[-1].list);
   ;}
    break;

  case 768:
#line 2260 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).baseSpecs = (yyvsp[0].list);
      SetupBaseSpecs(null, (yyvsp[0].list));
   ;}
    break;

  case 769:
#line 2268 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 770:
#line 2270 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 771:
#line 2271 "grammar.y"
    { POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 772:
#line 2272 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 773:
#line 2277 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).definitions = (yyvsp[0].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 774:
#line 2284 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).definitions = (yyvsp[0].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 775:
#line 2291 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext);;}
    break;

  case 776:
#line 2294 "grammar.y"
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
#line 2307 "grammar.y"
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

  case 778:
#line 2321 "grammar.y"
    { POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 779:
#line 2324 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS  ;}
    break;

  case 780:
#line 2326 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 781:
#line 2328 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 782:
#line 2332 "grammar.y"
    { (yyval.specifierType) = structSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 783:
#line 2333 "grammar.y"
    { (yyval.specifierType) = unionSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 784:
#line 2337 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 785:
#line 2338 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 786:
#line 2339 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 787:
#line 2340 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 788:
#line 2341 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 789:
#line 2342 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 790:
#line 2343 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 791:
#line 2344 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 792:
#line 2348 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 793:
#line 2349 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 794:
#line 2350 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 795:
#line 2351 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 796:
#line 2352 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 797:
#line 2353 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 798:
#line 2354 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 799:
#line 2355 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 800:
#line 2356 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 801:
#line 2357 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 802:
#line 2361 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 803:
#line 2362 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 804:
#line 2363 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 805:
#line 2364 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 806:
#line 2365 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 807:
#line 2366 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 808:
#line 2367 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 809:
#line 2368 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 810:
#line 2369 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 811:
#line 2370 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 812:
#line 2374 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 813:
#line 2375 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 814:
#line 2376 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 815:
#line 2377 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 816:
#line 2378 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 817:
#line 2379 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 818:
#line 2380 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 819:
#line 2381 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 820:
#line 2382 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 821:
#line 2383 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 822:
#line 2384 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 823:
#line 2385 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 824:
#line 2389 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 825:
#line 2390 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 826:
#line 2391 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 827:
#line 2392 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 828:
#line 2393 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 829:
#line 2394 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 830:
#line 2395 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 831:
#line 2396 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 832:
#line 2397 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 833:
#line 2398 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 834:
#line 2402 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 835:
#line 2403 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 836:
#line 2407 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PRIVATE)); ;}
    break;

  case 837:
#line 2408 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PUBLIC)); ;}
    break;

  case 838:
#line 2409 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 839:
#line 2410 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 840:
#line 2411 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 841:
#line 2412 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 842:
#line 2413 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 843:
#line 2414 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 844:
#line 2416 "grammar.y"
    { _DeclClass(0, (yyvsp[0].id).string); (yyval.list) = MkListOne(MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 845:
#line 2417 "grammar.y"
    { _DeclClass(0, (yyvsp[0].id).string); ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 846:
#line 2420 "grammar.y"
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

  case 847:
#line 2438 "grammar.y"
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

  case 849:
#line 2455 "grammar.y"
    { (yyval.list) = MkListOne(MkStructOrUnion((yyvsp[0].specifierType), null, null)); POP_DEFAULT_ACCESS ;}
    break;

  case 850:
#line 2459 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 851:
#line 2460 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 852:
#line 2461 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 853:
#line 2462 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 854:
#line 2463 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 855:
#line 2464 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 856:
#line 2465 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 857:
#line 2466 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 858:
#line 2468 "grammar.y"
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

  case 859:
#line 2486 "grammar.y"
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

  case 860:
#line 2502 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 861:
#line 2503 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 862:
#line 2504 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 863:
#line 2505 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 864:
#line 2506 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 865:
#line 2507 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 866:
#line 2508 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 867:
#line 2509 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 868:
#line 2510 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 869:
#line 2511 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 870:
#line 2512 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 871:
#line 2513 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 872:
#line 2515 "grammar.y"
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

  case 873:
#line 2533 "grammar.y"
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

  case 874:
#line 2549 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 875:
#line 2550 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 876:
#line 2551 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 877:
#line 2552 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 878:
#line 2553 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 879:
#line 2554 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 880:
#line 2555 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 881:
#line 2556 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 882:
#line 2557 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 883:
#line 2558 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 884:
#line 2559 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 885:
#line 2560 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 886:
#line 2562 "grammar.y"
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

  case 887:
#line 2580 "grammar.y"
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

  case 888:
#line 2596 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 889:
#line 2597 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 890:
#line 2601 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 891:
#line 2602 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 892:
#line 2603 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 893:
#line 2604 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 894:
#line 2605 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 895:
#line 2609 "grammar.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 896:
#line 2610 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 897:
#line 2611 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 898:
#line 2612 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 899:
#line 2613 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 900:
#line 2614 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 902:
#line 2622 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 903:
#line 2623 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 904:
#line 2624 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 905:
#line 2625 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 906:
#line 2626 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 907:
#line 2632 "grammar.y"
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
#line 2641 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); 
         fileInput.Seek((yylsp[-1]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-1]).end);
         (yyloc).start = (yylsp[-1]).start;
         (yyloc).end = (yylsp[-1]).end;
      ;}
    break;

  case 909:
#line 2650 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); 
         fileInput.Seek((yylsp[-2]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-2]).end);
         (yyloc).start = (yylsp[-2]).start;
         (yyloc).end = (yylsp[-2]).end;
      ;}
    break;

  case 910:
#line 2659 "grammar.y"
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

  case 913:
#line 2674 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 914:
#line 2676 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 915:
#line 2720 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 917:
#line 2723 "grammar.y"
    {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, (yyvsp[-1].string));
         strcat(temp, ")");
         (yyval.string) = CopyString(temp);
         delete (yyvsp[-1].string);
      ;}
    break;

  case 918:
#line 2734 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 919:
#line 2740 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 920:
#line 2742 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 921:
#line 2744 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 922:
#line 2746 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 923:
#line 2748 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 924:
#line 2750 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 925:
#line 2752 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 926:
#line 2754 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 927:
#line 2756 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 928:
#line 2758 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 929:
#line 2760 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 930:
#line 2762 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 931:
#line 2764 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 932:
#line 2766 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 933:
#line 2768 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 934:
#line 2773 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 935:
#line 2775 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 936:
#line 2777 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 937:
#line 2779 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 938:
#line 2781 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 939:
#line 2783 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 940:
#line 2785 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 941:
#line 2789 "grammar.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 942:
#line 2790 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 943:
#line 2791 "grammar.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 944:
#line 2792 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 945:
#line 2796 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 947:
#line 2798 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 948:
#line 2799 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 949:
#line 2800 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 950:
#line 2801 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 951:
#line 2805 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 953:
#line 2807 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 954:
#line 2808 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 955:
#line 2809 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 956:
#line 2810 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 958:
#line 2816 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 959:
#line 2818 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 960:
#line 2820 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[0].string), (yyvsp[-1].declarator)); ;}
    break;

  case 962:
#line 2825 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 963:
#line 2826 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 964:
#line 2827 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 965:
#line 2828 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 967:
#line 2833 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 968:
#line 2834 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 969:
#line 2835 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 970:
#line 2836 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 972:
#line 2841 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 973:
#line 2842 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 974:
#line 2843 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 975:
#line 2844 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 976:
#line 2848 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 977:
#line 2849 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 978:
#line 2851 "grammar.y"
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

  case 979:
#line 2866 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 980:
#line 2867 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-2].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 981:
#line 2868 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[0].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 982:
#line 2870 "grammar.y"
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

  case 983:
#line 2883 "grammar.y"
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

  case 984:
#line 2898 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 985:
#line 2900 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 986:
#line 2904 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 987:
#line 2905 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 988:
#line 2909 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 989:
#line 2910 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 990:
#line 2911 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 991:
#line 2912 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 992:
#line 2915 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].initializer)); ;}
    break;

  case 993:
#line 2916 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].initializer)); ;}
    break;

  case 994:
#line 2920 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 995:
#line 2921 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 996:
#line 2925 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-1].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 997:
#line 2926 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), MkInitializerAssignment(MkExpDummy())); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc = (yylsp[-1]); (yyval.initDeclarator).initializer.exp.loc = (yylsp[-1]); ;}
    break;

  case 998:
#line 2927 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 999:
#line 2931 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1000:
#line 2932 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1001:
#line 2933 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1002:
#line 2937 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1003:
#line 2938 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].initDeclarator)); ;}
    break;

  case 1004:
#line 2939 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1005:
#line 2940 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1006:
#line 2944 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1007:
#line 2945 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1008:
#line 2949 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1009:
#line 2950 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1010:
#line 2955 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1011:
#line 2956 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1012:
#line 2957 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 1013:
#line 2958 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); ;}
    break;

  case 1014:
#line 2959 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1015:
#line 2961 "grammar.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 1016:
#line 2979 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), (yyvsp[-1].declarator)); ;}
    break;

  case 1017:
#line 2980 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), (yyvsp[-1].declarator)); ;}
    break;

  case 1018:
#line 2984 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1019:
#line 2985 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1020:
#line 2986 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1021:
#line 2987 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1022:
#line 2988 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1023:
#line 2989 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1024:
#line 2991 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1025:
#line 2992 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1026:
#line 2993 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1027:
#line 2994 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1028:
#line 2998 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1029:
#line 2999 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1030:
#line 3000 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1031:
#line 3001 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1032:
#line 3002 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1033:
#line 3004 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1034:
#line 3005 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1035:
#line 3006 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1037:
#line 3011 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1038:
#line 3012 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1039:
#line 3013 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1040:
#line 3014 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1041:
#line 3015 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, null)); ;}
    break;

  case 1043:
#line 3020 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 1046:
#line 3027 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1048:
#line 3029 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1049:
#line 3030 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1050:
#line 3031 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1054:
#line 3035 "grammar.y"
    {;}
    break;

  case 1058:
#line 3043 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1059:
#line 3044 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1060:
#line 3045 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1061:
#line 3046 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1062:
#line 3047 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1063:
#line 3048 "grammar.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1064:
#line 3049 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[0].list)); Compiler_Error("syntax error\n"); (yyval.stmt).loc = (yylsp[0]); ;}
    break;

  case 1065:
#line 3053 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[0].string), null); (yyval.asmField).loc = (yylsp[0]); ;}
    break;

  case 1066:
#line 3054 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[-3].string), (yyvsp[-1].exp)); (yyval.asmField).loc = (yyloc); ;}
    break;

  case 1067:
#line 3058 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].asmField)); ;}
    break;

  case 1068:
#line 3059 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].asmField)); ;}
    break;

  case 1069:
#line 3060 "grammar.y"
    { (yyval.list) = null; ;}
    break;

  case 1070:
#line 3064 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-4].specifier), (yyvsp[-2].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1071:
#line 3065 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-6].specifier), (yyvsp[-4].string), (yyvsp[-2].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1072:
#line 3066 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), (yyvsp[-4].list), (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1073:
#line 3067 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-10].specifier), (yyvsp[-8].string), (yyvsp[-6].list), (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1074:
#line 3069 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-6].specifier), (yyvsp[-4].string), null, (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1075:
#line 3070 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), null, (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1076:
#line 3071 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), (yyvsp[-4].list), null, (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1077:
#line 3073 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-2].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1078:
#line 3074 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-4].string), (yyvsp[-2].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1079:
#line 3075 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), (yyvsp[-4].list), (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1080:
#line 3076 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-8].string), (yyvsp[-6].list), (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1081:
#line 3078 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-4].string), null, (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1082:
#line 3079 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), null, (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1083:
#line 3080 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), (yyvsp[-4].list), null, (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1084:
#line 3084 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1085:
#line 3085 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1086:
#line 3086 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1087:
#line 3087 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[0].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-2]).end; ;}
    break;

  case 1088:
#line 3088 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1089:
#line 3092 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1090:
#line 3093 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1091:
#line 3094 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1092:
#line 3095 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[0].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-2]).end; ;}
    break;

  case 1093:
#line 3096 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), null); (yyval.stmt).caseStmt.exp.loc = (yylsp[0]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-1]).end; ;}
    break;

  case 1094:
#line 3097 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1095:
#line 3098 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1096:
#line 3102 "grammar.y"
    { (yyval.declMode) = declMode = publicAccess; ;}
    break;

  case 1097:
#line 3103 "grammar.y"
    { (yyval.declMode) = declMode = privateAccess; ;}
    break;

  case 1098:
#line 3104 "grammar.y"
    { (yyval.declMode) = declMode = defaultAccess; ;}
    break;

  case 1099:
#line 3108 "grammar.y"
    { (yyval.declMode) = publicAccess; ;}
    break;

  case 1100:
#line 3109 "grammar.y"
    { (yyval.declMode) = privateAccess; ;}
    break;

  case 1101:
#line 3113 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1102:
#line 3114 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1103:
#line 3115 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1104:
#line 3116 "grammar.y"
    {;}
    break;

  case 1105:
#line 3120 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1106:
#line 3121 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1107:
#line 3122 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1108:
#line 3124 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1109:
#line 3125 "grammar.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1110:
#line 3126 "grammar.y"
    { declMode = staticAccess; (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1111:
#line 3130 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); yyerrok; ;}
    break;

  case 1112:
#line 3134 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1113:
#line 3135 "grammar.y"
    {;}
    break;

  case 1114:
#line 3137 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1115:
#line 3138 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1116:
#line 3139 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), (yyvsp[0].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1117:
#line 3143 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1118:
#line 3144 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1119:
#line 3145 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1120:
#line 3146 "grammar.y"
    { ;}
    break;

  case 1121:
#line 3150 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 1122:
#line 3151 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 1123:
#line 3155 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 1124:
#line 3156 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1125:
#line 3157 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1126:
#line 3161 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 1127:
#line 3162 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1128:
#line 3163 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1129:
#line 3164 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1130:
#line 3165 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1131:
#line 3166 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1132:
#line 3167 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1133:
#line 3171 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 1134:
#line 3172 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 1135:
#line 3173 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1136:
#line 3174 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1137:
#line 3178 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 1138:
#line 3179 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 1139:
#line 3180 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1140:
#line 3181 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1141:
#line 3185 "grammar.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 1142:
#line 3189 "grammar.y"
    { (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1143:
#line 3194 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); (yyval.stmt).compound.context = (yyvsp[-1].context); PopContext((yyvsp[-1].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1144:
#line 3196 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, null); (yyval.stmt).compound.context = (yyvsp[0].context); PopContext((yyvsp[0].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1145:
#line 3199 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); (yyval.stmt).compound.context = (yyvsp[-1].context); PopContext((yyvsp[-1].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1146:
#line 3204 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1147:
#line 3205 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1148:
#line 3206 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1149:
#line 3210 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1150:
#line 3211 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1151:
#line 3212 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1152:
#line 3213 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1153:
#line 3214 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1154:
#line 3215 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1155:
#line 3219 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[0].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1157:
#line 3224 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1158:
#line 3225 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1159:
#line 3226 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1160:
#line 3228 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1161:
#line 3229 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-4].stmt), (yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1162:
#line 3231 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1163:
#line 3232 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1164:
#line 3233 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1165:
#line 3234 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), (yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1166:
#line 3235 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1167:
#line 3237 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[-4].id), (yyvsp[-2].list), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1168:
#line 3238 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[-6].id), (yyvsp[-4].list), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1169:
#line 3242 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1170:
#line 3243 "grammar.y"
    { (yyval.stmt) = MkForStmt(MkExpressionStmt((yyvsp[-1].list)), null, null, null); (yyval.stmt).forStmt.init.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1171:
#line 3244 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-1].stmt), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1172:
#line 3245 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), MkExpressionStmt((yyvsp[-1].list)), null, null); (yyval.stmt).loc = (yyloc); (yyval.stmt).forStmt.check.loc = (yylsp[-1]); ;}
    break;

  case 1173:
#line 3246 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), (yyvsp[-1].stmt), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1174:
#line 3247 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), (yyvsp[-1].stmt), (yyvsp[0].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1175:
#line 3248 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1176:
#line 3249 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1177:
#line 3250 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), (yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1178:
#line 3252 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-4].stmt), (yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1179:
#line 3253 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-3].stmt), (yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1180:
#line 3254 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-3].stmt), (yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1181:
#line 3255 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-2].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1182:
#line 3256 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-1].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1183:
#line 3257 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1184:
#line 3258 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1185:
#line 3261 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1186:
#line 3262 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1187:
#line 3263 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1188:
#line 3264 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[0].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1189:
#line 3265 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1190:
#line 3266 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1191:
#line 3267 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1192:
#line 3271 "grammar.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1193:
#line 3272 "grammar.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1194:
#line 3273 "grammar.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1195:
#line 3274 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 1196:
#line 3275 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1197:
#line 3276 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1198:
#line 3277 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[-1].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1199:
#line 3278 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[-1].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1200:
#line 3282 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1201:
#line 3283 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[0].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1202:
#line 3284 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc.start = exp.loc.end = (yylsp[0]).end; ;}
    break;

  case 1203:
#line 3285 "grammar.y"
    { (yyval.stmt) = MkGotoStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1204:
#line 3291 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1205:
#line 3293 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-2].list), (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1206:
#line 3295 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1207:
#line 3296 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc);;}
    break;

  case 1208:
#line 3299 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1209:
#line 3300 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-2].list), (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1210:
#line 3301 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1211:
#line 3302 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1212:
#line 3306 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 1213:
#line 3308 "grammar.y"
    { 
      int len1 = strlen((yyvsp[-1].string));
      int len2 = strlen(yytext);
      (yyval.string) = new byte[len1-1 + len2-1 + 1];
      memcpy((yyval.string), (yyvsp[-1].string), len1-1);
      memcpy((yyval.string) + len1-1, yytext+1, len2);
      delete (yyvsp[-1].string);
   ;}
    break;

  case 1214:
#line 3319 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyloc); (yyvsp[0].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1215:
#line 3321 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1216:
#line 3324 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; FreeList((yyvsp[-1].list), FreeSpecifier); ;}
    break;

  case 1217:
#line 3327 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration));  (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1218:
#line 3328 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), normalImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1219:
#line 3329 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), staticImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1220:
#line 3330 "grammar.y"
    { if(!strcmp((yyvsp[-1].id).string, "remote")) { (yyval.external) = MkExternalImport((yyvsp[0].string), remoteImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); } else yyerror(); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 1221:
#line 3332 "grammar.y"
    { (yyval.external) = null; ;}
    break;

  case 1222:
#line 3334 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyloc); (yyvsp[0].function).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1223:
#line 3336 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1224:
#line 3337 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration)); (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1225:
#line 3338 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), normalImport, ((yyvsp[-2].declMode) != defaultAccess) ? (yyvsp[-2].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1226:
#line 3339 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), staticImport, ((yyvsp[-3].declMode) != defaultAccess) ? (yyvsp[-3].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1227:
#line 3340 "grammar.y"
    { if(!strcmp((yyvsp[-1].id).string, "remote")) { (yyval.external) = MkExternalImport((yyvsp[0].string), remoteImport, ((yyvsp[-3].declMode) != defaultAccess) ? (yyvsp[-3].declMode) : privateAccess);  (yyval.external).loc = (yyloc); FreeIdentifier((yyvsp[-1].id)); } else yyerror();  declMode = defaultDeclMode; ;}
    break;

  case 1228:
#line 3341 "grammar.y"
    { defaultDeclMode = (yyvsp[-1].declMode); (yyval.external) = null; ;}
    break;

  case 1229:
#line 3342 "grammar.y"
    { defaultDeclMode = staticAccess; (yyval.external) = null; ;}
    break;

  case 1230:
#line 3343 "grammar.y"
    { (yyval.external) = MkExternalNameSpace((yyvsp[0].id)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1231:
#line 3344 "grammar.y"
    { (yyval.external) = MkExternalNameSpace(MkIdentifier((yyvsp[0].specifier).name)); FreeSpecifier((yyvsp[0].specifier)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1232:
#line 3345 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[0].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[0].dbtableDef).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1233:
#line 3346 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[0].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[0].dbtableDef).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1234:
#line 3350 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1235:
#line 3351 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1236:
#line 3352 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyvsp[0].function).loc;  (yyvsp[0].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1237:
#line 3354 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1238:
#line 3355 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyvsp[0].function).loc; (yyvsp[0].function).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1239:
#line 3358 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration));  (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1240:
#line 3359 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration)); (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1241:
#line 3363 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].external)); ast = (yyval.list); ;}
    break;

  case 1242:
#line 3364 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1243:
#line 3365 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1246:
#line 3371 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].external)); ast = (yyval.list); ;}
    break;

  case 1247:
#line 3372 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1248:
#line 3374 "grammar.y"
    { External _class = MkExternalClass((yyvsp[0]._class)); ListAdd((yyvsp[-1].list), _class); _class.loc = (yylsp[0]);  (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1249:
#line 3376 "grammar.y"
    { External _class = MkExternalClass((yyvsp[0]._class)); ListAdd((yyvsp[-2].list), _class); _class.loc = (yylsp[0]);  (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1252:
#line 3382 "grammar.y"
    { ast = MkList(); ;}
    break;

  case 1253:
#line 3386 "grammar.y"
    { Symbol symbol = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); FreeIdentifier((yyvsp[-3].id)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[-4].string), symbol, (yyvsp[-1].list)); ;}
    break;

  case 1254:
#line 3387 "grammar.y"
    { Symbol symbol = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[-4].string), symbol, (yyvsp[-1].list)); ;}
    break;

  case 1255:
#line 3388 "grammar.y"
    { (yyval.dbtableDef) = MkDBTableDef((yyvsp[-3].string), null, (yyvsp[-1].list)); ;}
    break;

  case 1256:
#line 3392 "grammar.y"
    { (yyval.dbtableEntry) = MkDBFieldEntry(MkTypeName((yyvsp[-3].list), null), (yyvsp[-2].id), (yyvsp[-1].string)); ;}
    break;

  case 1257:
#line 3396 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), ascending); ;}
    break;

  case 1258:
#line 3397 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), descending); ;}
    break;

  case 1259:
#line 3398 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), ascending); ;}
    break;

  case 1260:
#line 3402 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbindexItem)); ;}
    break;

  case 1261:
#line 3403 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].dbindexItem)); ;}
    break;

  case 1262:
#line 3407 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[-1].list), null); ;}
    break;

  case 1263:
#line 3408 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[-2].list), (yyvsp[-1].id)); ;}
    break;

  case 1264:
#line 3412 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1265:
#line 3413 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1266:
#line 3414 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1267:
#line 3415 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1268:
#line 3419 "grammar.y"
    { (yyval.exp) = MkExpDBOpen((yyvsp[-3].exp), (yyvsp[-1].exp)); ;}
    break;

  case 1269:
#line 3423 "grammar.y"
    { (yyval.exp) = MkExpDBField((yyvsp[-3].string), (yyvsp[-1].id)); ;}
    break;

  case 1270:
#line 3427 "grammar.y"
    { (yyval.exp) = MkExpDBIndex((yyvsp[-3].string), (yyvsp[-1].id)); ;}
    break;

  case 1271:
#line 3431 "grammar.y"
    { (yyval.exp) = MkExpDBTable((yyvsp[-1].string)); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 17766 "grammar.ec"

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


#line 3434 "grammar.y"


