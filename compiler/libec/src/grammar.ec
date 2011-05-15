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

public void SetAST(OldList * list) { ast = list; }
public OldList * GetAST() { return ast; }

public void ParseEc()
{
   yyparse();
}

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
#line 42 "grammar.y"
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
#line 371 "grammar.ec"
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
#line 395 "grammar.ec"

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
#define YYLAST   36230

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  247
/* YYNRULES -- Number of rules. */
#define YYNRULES  1269
/* YYNRULES -- Number of states. */
#define YYNSTATES  2056

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
       2,     2,     2,   127,     2,     2,     2,   129,   124,     2,
     112,   113,   109,   125,   117,   126,   120,   128,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   121,   115,
     110,   116,   111,   132,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   122,     2,   123,   130,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   119,   131,   118,   114,     2,     2,     2,
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
     959,   961,   963,   966,   973,   980,   986,   992,   999,  1006,
    1012,  1018,  1026,  1034,  1041,  1048,  1056,  1064,  1071,  1078,
    1083,  1089,  1094,  1101,  1106,  1108,  1110,  1112,  1114,  1118,
    1120,  1123,  1126,  1129,  1131,  1136,  1141,  1145,  1150,  1155,
    1159,  1163,  1166,  1169,  1174,  1179,  1183,  1188,  1192,  1196,
    1199,  1202,  1204,  1209,  1214,  1218,  1223,  1228,  1232,  1236,
    1239,  1242,  1247,  1252,  1256,  1261,  1265,  1269,  1272,  1275,
    1277,  1279,  1283,  1287,  1289,  1291,  1295,  1299,  1302,  1305,
    1308,  1311,  1314,  1319,  1322,  1327,  1333,  1339,  1341,  1343,
    1345,  1347,  1349,  1351,  1353,  1355,  1357,  1359,  1361,  1363,
    1365,  1370,  1372,  1376,  1380,  1384,  1388,  1392,  1396,  1398,
    1402,  1406,  1410,  1414,  1416,  1420,  1424,  1428,  1432,  1435,
    1437,  1440,  1444,  1448,  1452,  1456,  1460,  1464,  1468,  1470,
    1474,  1478,  1482,  1486,  1490,  1494,  1498,  1502,  1504,  1508,
    1512,  1516,  1520,  1522,  1526,  1530,  1534,  1538,  1540,  1544,
    1548,  1552,  1556,  1558,  1562,  1566,  1568,  1572,  1576,  1578,
    1584,  1590,  1596,  1602,  1608,  1614,  1620,  1626,  1632,  1638,
    1644,  1650,  1656,  1662,  1668,  1674,  1676,  1680,  1684,  1688,
    1692,  1696,  1700,  1704,  1708,  1710,  1712,  1714,  1716,  1718,
    1720,  1722,  1724,  1726,  1728,  1730,  1732,  1736,  1740,  1743,
    1745,  1749,  1753,  1755,  1757,  1760,  1763,  1767,  1771,  1775,
    1779,  1785,  1789,  1793,  1797,  1803,  1807,  1811,  1813,  1816,
    1819,  1823,  1827,  1831,  1835,  1841,  1845,  1849,  1853,  1859,
    1863,  1867,  1870,  1873,  1876,  1879,  1883,  1886,  1892,  1899,
    1906,  1908,  1910,  1912,  1914,  1916,  1921,  1923,  1927,  1931,
    1935,  1939,  1943,  1947,  1949,  1953,  1957,  1961,  1965,  1969,
    1973,  1977,  1981,  1983,  1987,  1991,  1995,  1999,  2001,  2004,
    2008,  2012,  2016,  2020,  2024,  2028,  2032,  2034,  2038,  2042,
    2046,  2050,  2054,  2058,  2062,  2066,  2070,  2074,  2078,  2082,
    2084,  2088,  2092,  2096,  2100,  2102,  2106,  2110,  2114,  2118,
    2120,  2124,  2128,  2132,  2136,  2138,  2142,  2146,  2148,  2152,
    2156,  2158,  2164,  2170,  2176,  2182,  2187,  2192,  2197,  2202,
    2208,  2214,  2220,  2226,  2231,  2236,  2241,  2246,  2252,  2258,
    2264,  2270,  2276,  2282,  2288,  2294,  2298,  2302,  2305,  2308,
    2310,  2314,  2318,  2322,  2326,  2330,  2334,  2336,  2339,  2343,
    2347,  2351,  2355,  2358,  2361,  2364,  2367,  2369,  2372,  2376,
    2380,  2382,  2384,  2386,  2388,  2390,  2392,  2394,  2396,  2398,
    2400,  2402,  2404,  2406,  2410,  2414,  2416,  2420,  2423,  2425,
    2428,  2431,  2434,  2439,  2444,  2448,  2452,  2457,  2463,  2468,
    2475,  2482,  2487,  2493,  2498,  2505,  2512,  2515,  2518,  2521,
    2527,  2531,  2537,  2544,  2550,  2558,  2566,  2575,  2584,  2592,
    2600,  2604,  2608,  2612,  2617,  2621,  2627,  2633,  2635,  2637,
    2639,  2641,  2643,  2645,  2647,  2649,  2651,  2653,  2656,  2658,
    2660,  2662,  2664,  2666,  2668,  2670,  2672,  2674,  2676,  2678,
    2680,  2682,  2684,  2686,  2688,  2693,  2698,  2703,  2705,  2707,
    2709,  2711,  2713,  2715,  2717,  2719,  2721,  2723,  2725,  2727,
    2729,  2731,  2733,  2735,  2737,  2739,  2741,  2746,  2751,  2756,
    2758,  2760,  2763,  2766,  2770,  2776,  2779,  2783,  2789,  2795,
    2801,  2803,  2807,  2810,  2813,  2816,  2820,  2824,  2828,  2832,
    2836,  2840,  2844,  2848,  2850,  2852,  2857,  2861,  2864,  2868,
    2872,  2876,  2880,  2884,  2888,  2892,  2896,  2900,  2904,  2908,
    2912,  2914,  2916,  2918,  2921,  2923,  2926,  2928,  2931,  2933,
    2936,  2938,  2941,  2943,  2946,  2948,  2951,  2953,  2956,  2958,
    2961,  2963,  2966,  2968,  2971,  2973,  2976,  2978,  2981,  2983,
    2986,  2988,  2991,  2993,  2996,  2998,  3001,  3003,  3006,  3008,
    3011,  3013,  3016,  3018,  3021,  3023,  3026,  3028,  3031,  3033,
    3036,  3038,  3041,  3043,  3046,  3048,  3050,  3052,  3055,  3057,
    3060,  3062,  3065,  3067,  3070,  3075,  3081,  3083,  3085,  3087,
    3090,  3092,  3095,  3097,  3100,  3102,  3105,  3110,  3116,  3118,
    3121,  3123,  3126,  3128,  3131,  3133,  3136,  3138,  3141,  3143,
    3146,  3151,  3157,  3159,  3162,  3164,  3167,  3169,  3172,  3174,
    3177,  3179,  3182,  3184,  3187,  3192,  3198,  3202,  3206,  3208,
    3212,  3216,  3220,  3224,  3226,  3230,  3235,  3240,  3245,  3249,
    3252,  3256,  3260,  3264,  3268,  3271,  3274,  3277,  3281,  3286,
    3288,  3290,  3293,  3296,  3298,  3300,  3305,  3307,  3311,  3314,
    3318,  3322,  3326,  3330,  3335,  3340,  3345,  3348,  3352,  3356,
    3360,  3365,  3370,  3374,  3377,  3381,  3385,  3389,  3394,  3399,
    3401,  3404,  3407,  3411,  3413,  3415,  3418,  3421,  3424,  3428,
    3430,  3432,  3435,  3438,  3441,  3445,  3447,  3450,  3454,  3457,
    3459,  3462,  3465,  3469,  3473,  3475,  3478,  3481,  3485,  3489,
    3491,  3494,  3497,  3501,  3505,  3507,  3511,  3516,  3518,  3523,
    3526,  3532,  3536,  3538,  3540,  3542,  3544,  3546,  3548,  3552,
    3556,  3559,  3562,  3564,  3568,  3571,  3575,  3579,  3581,  3585,
    3589,  3591,  3594,  3598,  3602,  3604,  3607,  3609,  3612,  3615,
    3618,  3621,  3625,  3627,  3629,  3633,  3637,  3639,  3643,  3648,
    3652,  3657,  3661,  3665,  3670,  3674,  3679,  3681,  3685,  3689,
    3694,  3698,  3702,  3706,  3711,  3713,  3717,  3721,  3725,  3729,
    3733,  3735,  3739,  3742,  3744,  3746,  3748,  3750,  3752,  3755,
    3757,  3759,  3761,  3763,  3766,  3769,  3772,  3774,  3776,  3778,
    3780,  3782,  3785,  3787,  3789,  3794,  3796,  3800,  3801,  3808,
    3817,  3828,  3841,  3850,  3861,  3872,  3878,  3886,  3896,  3908,
    3916,  3926,  3936,  3940,  3945,  3950,  3954,  3958,  3962,  3967,
    3972,  3976,  3979,  3983,  3986,  3988,  3990,  3992,  3994,  3996,
    3999,  4003,  4006,  4009,  4012,  4016,  4020,  4023,  4029,  4036,
    4039,  4042,  4045,  4048,  4051,  4054,  4056,  4059,  4062,  4066,
    4068,  4071,  4073,  4076,  4079,  4081,  4084,  4087,  4090,  4093,
    4096,  4099,  4101,  4103,  4106,  4109,  4111,  4113,  4116,  4119,
    4121,  4124,  4127,  4129,  4132,  4134,  4137,  4140,  4146,  4152,
    4160,  4168,  4174,  4180,  4184,  4187,  4193,  4198,  4203,  4211,
    4218,  4225,  4231,  4239,  4246,  4251,  4259,  4269,  4273,  4278,
    4283,  4289,  4295,  4301,  4308,  4316,  4323,  4330,  4336,  4342,
    4347,  4351,  4354,  4356,  4359,  4363,  4368,  4372,  4377,  4383,
    4388,  4392,  4395,  4398,  4401,  4405,  4409,  4413,  4417,  4420,
    4423,  4425,  4427,  4432,  4436,  4440,  4443,  4448,  4452,  4456,
    4459,  4461,  4464,  4466,  4468,  4471,  4473,  4476,  4480,  4484,
    4486,  4489,  4492,  4495,  4499,  4504,  4509,  4512,  4515,  4518,
    4521,  4523,  4526,  4528,  4531,  4533,  4536,  4539,  4541,  4544,
    4546,  4549,  4552,  4555,  4558,  4560,  4563,  4566,  4570,  4572,
    4574,  4575,  4582,  4589,  4595,  4600,  4602,  4605,  4608,  4610,
    4614,  4618,  4623,  4625,  4627,  4630,  4633,  4640,  4647,  4654
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     369,     0,    -1,   205,   109,    -1,   205,   110,    -1,   138,
      -1,   205,   205,    -1,    28,    -1,    28,    -1,   136,    -1,
     136,   110,   199,   111,    -1,   136,   110,   199,    11,    -1,
     290,   313,    -1,   313,    -1,   290,   112,   113,    -1,   114,
     290,   112,   113,    -1,    78,   290,   313,    -1,    78,   313,
      -1,   290,   314,    -1,   314,    -1,    78,   290,   314,    -1,
      78,   314,    -1,   139,   353,    -1,   142,   353,    -1,   142,
     115,    -1,   140,   353,    -1,   141,   353,    -1,   139,   115,
      -1,   139,   354,    -1,   143,    -1,   142,   354,    -1,   144,
      -1,   144,   115,    -1,   289,   313,    -1,   289,   315,    -1,
     289,   314,    -1,   147,   353,    -1,   147,   354,    -1,   148,
      -1,   147,    -1,   211,   116,   318,    -1,   318,    -1,   211,
     116,   319,    -1,   211,   116,     1,    -1,   319,    -1,   151,
      -1,   153,   117,   151,    -1,   154,   117,   151,    -1,   152,
      -1,   153,   117,   152,    -1,   154,   117,   152,    -1,   153,
     117,     1,    -1,   154,   117,     1,    -1,   117,    -1,   153,
     115,    -1,   154,   115,    -1,   155,    -1,   149,    -1,   158,
     155,    -1,   158,   149,    -1,   156,   155,    -1,   156,   149,
      -1,   115,    -1,   158,   115,    -1,   156,   115,    -1,   156,
      -1,   153,    -1,   156,   153,    -1,   158,   153,    -1,   150,
      -1,   157,   150,    -1,   158,   150,    -1,   156,   150,    -1,
     156,   154,    -1,   154,    -1,   153,     1,    -1,   160,   118,
      -1,   160,     1,   118,    -1,   289,   205,   119,   158,    -1,
     289,   205,   119,   157,     1,    -1,   289,   205,   119,   157,
      -1,   289,   205,   119,    -1,   289,   205,   119,     1,    -1,
     162,   118,    -1,   162,     1,   118,    -1,   290,   205,   119,
     158,    -1,   290,   205,   119,   157,     1,    -1,   290,   205,
     119,   157,    -1,   290,   205,   119,    -1,   290,   205,   119,
       1,    -1,   291,   205,   119,   157,   118,    -1,   291,   205,
     119,   158,   118,    -1,   291,   205,   119,   118,    -1,   165,
     118,    -1,   165,     1,   118,    -1,   138,   119,   157,    -1,
     205,   119,   157,    -1,   138,   119,   158,    -1,   138,   119,
      -1,   138,   119,   157,     1,    -1,   138,   119,     1,    -1,
     205,   119,   158,    -1,   205,   119,    -1,   205,   119,   157,
       1,    -1,   205,   119,     1,    -1,   167,   118,    -1,   167,
       1,   118,    -1,   119,   158,    -1,   119,   157,     1,    -1,
     119,     1,    -1,   119,    -1,   119,   157,    -1,   211,   116,
     318,    -1,   211,   116,   319,    -1,   211,   116,     1,    -1,
     211,     1,    -1,   168,    -1,   170,   117,   168,    -1,   171,
     117,   168,    -1,   169,    -1,   170,   117,   169,    -1,   171,
     117,   169,    -1,   170,     1,    -1,    68,   295,   205,   119,
      -1,    68,   295,   310,   205,   119,    -1,    68,   295,   119,
      -1,    68,   295,   310,   119,    -1,    68,     1,   119,    -1,
     172,    -1,   173,    69,   353,    -1,   173,    70,   353,    -1,
     173,    95,   353,    -1,   173,    91,    -1,   173,    97,   364,
      -1,   173,   118,    -1,    99,   295,   205,   119,    -1,    99,
     295,   310,   205,   119,    -1,    99,   295,   119,    -1,    99,
     295,   310,   119,    -1,    99,     1,   119,    -1,   175,    -1,
     176,    69,   353,    -1,   176,    70,   353,    -1,   176,   118,
      -1,   205,    -1,   178,   205,    -1,   178,   353,    -1,    73,
     353,    -1,   179,    -1,   180,   179,    -1,    88,   112,   178,
     113,   353,    -1,    88,   112,   232,   113,   119,   180,   118,
      -1,   232,   120,    88,   112,   232,   113,   119,   180,   118,
      -1,    89,   112,   232,   117,   178,   113,    -1,   232,   120,
      89,   112,   232,   117,   178,   113,    -1,    89,   112,   232,
     113,    -1,   232,   120,    89,   112,   232,   113,    -1,    90,
      -1,    90,   178,    -1,   211,   120,    90,    -1,   232,   120,
      90,   178,    -1,   290,   277,   115,    -1,   290,   115,    -1,
     164,   115,    -1,   161,   115,    -1,   145,    -1,   174,    -1,
     341,   290,   277,   115,    -1,   341,   290,   115,    -1,   341,
     164,   115,    -1,   341,   161,   115,    -1,   341,   145,    -1,
     341,   174,    -1,   170,   115,    -1,    98,   290,   277,   115,
      -1,   177,    -1,   181,   115,    -1,    91,    -1,    92,   205,
     115,    -1,    92,   138,   115,    -1,    93,    -1,    94,    -1,
      96,   205,   115,    -1,    99,   112,   205,   113,   116,   318,
     115,    -1,   115,    -1,   341,   121,    -1,   341,   112,   205,
     113,    -1,   146,    -1,   162,     1,    -1,   165,     1,    -1,
     161,    -1,   164,    -1,   341,   146,    -1,   341,   162,     1,
      -1,   341,   165,     1,    -1,   341,   161,    -1,   341,   164,
      -1,   171,    -1,   185,    -1,   187,   185,    -1,   188,   185,
      -1,   186,    -1,   187,     1,    -1,   188,     1,    -1,   187,
     186,    -1,   188,   186,    -1,   289,    -1,   289,   310,    -1,
     205,    -1,   189,    -1,    65,   205,    -1,    65,   205,   116,
     190,    -1,    65,   205,   121,   189,    -1,    65,   205,   121,
     189,   116,   190,    -1,    65,   137,    -1,    65,   137,   116,
     190,    -1,    65,   137,   121,   189,    -1,    65,   137,   121,
     189,   116,   190,    -1,   205,    -1,   205,    -1,   205,   116,
     192,    -1,   256,    -1,   189,   205,    -1,   189,   205,   116,
     194,    -1,   191,    -1,   193,    -1,   195,    -1,   196,    -1,
     197,   117,   196,    -1,   194,    -1,   192,    -1,   190,    -1,
     205,   116,   194,    -1,   205,   116,   192,    -1,   205,   116,
     190,    -1,   189,   116,   194,    -1,   189,   116,   192,    -1,
     189,   116,   190,    -1,   198,    -1,   199,   117,   198,    -1,
      65,    -1,   200,   205,    -1,   200,   136,    -1,   205,   200,
     205,    -1,   205,   200,   136,    -1,   200,   205,   110,   197,
     111,    -1,   200,   136,   110,   197,   111,    -1,   205,   200,
     205,   110,   197,   111,    -1,   205,   200,   136,   110,   197,
     111,    -1,   204,   118,    -1,   203,   115,    -1,   201,   119,
     118,    -1,   203,   119,   118,    -1,   200,   205,   115,    -1,
     200,   135,   115,    -1,   201,   121,   294,    -1,   201,   119,
     188,    -1,   203,   119,   188,    -1,   201,   119,   187,    -1,
     203,   119,   187,    -1,   201,   119,     1,    -1,   203,   119,
       1,    -1,     3,    -1,   207,    -1,   112,   234,   113,    -1,
     205,    -1,   164,    -1,    85,   112,   353,   113,    -1,    85,
     112,   234,   113,    -1,    85,   112,   325,   113,   316,    -1,
      85,   112,   325,   113,   112,   325,   113,   316,    -1,     4,
      -1,   364,    -1,   112,   113,    -1,    71,   297,   311,   122,
     256,   123,    -1,    71,   297,   311,   122,   257,   123,    -1,
      71,   297,   122,   256,   123,    -1,    71,   297,   122,   257,
     123,    -1,   102,   297,   311,   122,   256,   123,    -1,   102,
     297,   311,   122,   257,   123,    -1,   102,   297,   122,   256,
     123,    -1,   102,   297,   122,   257,   123,    -1,    72,   256,
     296,   311,   122,   256,   123,    -1,    72,   256,   296,   311,
     122,   257,   123,    -1,    72,   256,   296,   122,   256,   123,
      -1,    72,   256,   296,   122,   257,   123,    -1,   103,   256,
     296,   311,   122,   256,   123,    -1,   103,   256,   296,   311,
     122,   257,   123,    -1,   103,   256,   296,   122,   256,   123,
      -1,   103,   256,   296,   122,   257,   123,    -1,    65,   112,
     289,   113,    -1,    65,   112,   289,   310,   113,    -1,    65,
     112,   205,   113,    -1,   104,   112,   232,   117,   325,   113,
      -1,    98,   112,   205,   113,    -1,   376,    -1,   377,    -1,
     378,    -1,   379,    -1,   122,   213,   123,    -1,   166,    -1,
     167,     1,    -1,   112,   234,    -1,   112,   254,    -1,   206,
      -1,   211,   122,   234,   123,    -1,   211,   122,   254,   123,
      -1,   211,   112,   113,    -1,   211,   112,   213,   113,    -1,
     211,   112,   214,   113,    -1,   211,   120,   205,    -1,   211,
       7,   205,    -1,   211,     8,    -1,   211,     9,    -1,   236,
     122,   234,   123,    -1,   236,   122,   254,   123,    -1,   236,
     112,   113,    -1,   236,   112,   213,   113,    -1,   236,   120,
     205,    -1,   236,     7,   205,    -1,   236,     8,    -1,   236,
       9,    -1,   207,    -1,   212,   122,   234,   123,    -1,   212,
     122,   254,   123,    -1,   212,   112,   113,    -1,   212,   112,
     213,   113,    -1,   212,   112,   214,   113,    -1,   212,   120,
     205,    -1,   212,     7,   205,    -1,   212,     8,    -1,   212,
       9,    -1,   237,   122,   234,   123,    -1,   237,   122,   254,
     123,    -1,   237,   112,   113,    -1,   237,   112,   213,   113,
      -1,   237,   120,   205,    -1,   237,     7,   205,    -1,   237,
       8,    -1,   237,     9,    -1,   232,    -1,   208,    -1,   213,
     117,   232,    -1,   213,   117,   208,    -1,   253,    -1,   209,
      -1,   213,   117,   253,    -1,   213,   117,   209,    -1,   213,
     117,    -1,     8,   216,    -1,     9,   216,    -1,   218,   219,
      -1,   218,   208,    -1,     6,   112,   216,   113,    -1,     6,
     217,    -1,     6,   112,   326,   113,    -1,     6,   112,    65,
     135,   113,    -1,     6,   112,    65,   134,   113,    -1,   215,
      -1,   211,    -1,   215,    -1,   212,    -1,   124,    -1,   109,
      -1,   125,    -1,   126,    -1,   114,    -1,   127,    -1,    73,
      -1,    84,    -1,   216,    -1,   112,   325,   113,   219,    -1,
     219,    -1,   220,   109,   219,    -1,   220,   128,   219,    -1,
     220,   129,   219,    -1,   242,   109,   219,    -1,   242,   128,
     219,    -1,   242,   129,   219,    -1,   220,    -1,   221,   125,
     220,    -1,   221,   126,   220,    -1,   243,   125,   220,    -1,
     243,   126,   220,    -1,   221,    -1,   222,    10,   221,    -1,
     222,    11,   221,    -1,   244,    10,   221,    -1,   244,    11,
     221,    -1,   224,   110,    -1,   222,    -1,   223,   222,    -1,
     224,   111,   222,    -1,   224,    12,   222,    -1,   224,    13,
     222,    -1,   245,   110,   222,    -1,   245,   111,   222,    -1,
     245,    12,   222,    -1,   245,    13,   222,    -1,   224,    -1,
     225,    14,   224,    -1,   225,    15,   224,    -1,   246,    14,
     224,    -1,   246,    15,   224,    -1,   225,    14,   208,    -1,
     225,    15,   208,    -1,   246,    14,   208,    -1,   246,    15,
     208,    -1,   225,    -1,   226,   124,   225,    -1,   247,   124,
     225,    -1,   226,   124,   208,    -1,   247,   124,   208,    -1,
     226,    -1,   227,   130,   226,    -1,   248,   130,   226,    -1,
     227,   130,   208,    -1,   248,   130,   208,    -1,   227,    -1,
     228,   131,   227,    -1,   249,   131,   227,    -1,   228,   131,
     208,    -1,   249,   131,   208,    -1,   228,    -1,   229,    16,
     228,    -1,   250,    16,   228,    -1,   229,    -1,   230,    17,
     229,    -1,   251,    17,   229,    -1,   230,    -1,   230,   132,
     234,   121,   231,    -1,   230,   132,   254,   121,   231,    -1,
     251,   132,   234,   121,   231,    -1,   251,   132,   254,   121,
     231,    -1,   230,   132,   235,   121,   231,    -1,   230,   132,
     255,   121,   231,    -1,   251,   132,   235,   121,   231,    -1,
     251,   132,   255,   121,   231,    -1,   230,   132,   234,   121,
     208,    -1,   230,   132,   254,   121,   208,    -1,   251,   132,
     234,   121,   208,    -1,   251,   132,   254,   121,   208,    -1,
     230,   132,   235,   121,   208,    -1,   230,   132,   255,   121,
     208,    -1,   251,   132,   235,   121,   208,    -1,   251,   132,
     255,   121,   208,    -1,   231,    -1,   216,   233,   232,    -1,
     239,   233,   232,    -1,   231,   233,   232,    -1,   252,   233,
     232,    -1,   216,   233,   208,    -1,   239,   233,   208,    -1,
     231,   233,   208,    -1,   252,   233,   208,    -1,   116,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     232,    -1,   234,   117,   232,    -1,   254,   117,   232,    -1,
     254,   113,    -1,   208,    -1,   234,   117,   208,    -1,   254,
     117,   208,    -1,   210,    -1,     1,    -1,   211,     1,    -1,
     165,     1,    -1,   211,     7,     1,    -1,   236,     7,     1,
      -1,   211,   112,   213,    -1,   211,   112,   214,    -1,   211,
     112,   213,   117,     1,    -1,   211,   112,     1,    -1,   211,
     120,     1,    -1,   236,   112,   214,    -1,   236,   112,   213,
     117,     1,    -1,   236,   112,     1,    -1,   236,   120,     1,
      -1,     1,    -1,   212,     1,    -1,   165,     1,    -1,   212,
       7,     1,    -1,   237,     7,     1,    -1,   212,   112,   213,
      -1,   212,   112,   214,    -1,   212,   112,   213,   117,     1,
      -1,   212,   112,     1,    -1,   212,   120,     1,    -1,   237,
     112,   214,    -1,   237,   112,   213,   117,     1,    -1,   237,
     112,     1,    -1,   237,   120,     1,    -1,     8,   239,    -1,
       9,   239,    -1,   218,   241,    -1,   218,   209,    -1,     6,
     112,   239,    -1,     6,   240,    -1,     6,   112,   326,   113,
       1,    -1,     6,   112,    65,   135,   113,     1,    -1,     6,
     112,    65,   134,   113,     1,    -1,   238,    -1,   236,    -1,
     238,    -1,   237,    -1,   239,    -1,   112,   325,   113,   241,
      -1,   241,    -1,   220,   109,   241,    -1,   220,   128,   241,
      -1,   220,   129,   241,    -1,   242,   109,   241,    -1,   242,
     128,   241,    -1,   242,   129,   241,    -1,   242,    -1,   221,
     125,   242,    -1,   221,   125,     1,    -1,   221,   126,   242,
      -1,   221,   126,     1,    -1,   243,   125,   242,    -1,   243,
     125,     1,    -1,   243,   126,   242,    -1,   243,   126,     1,
      -1,   243,    -1,   222,    10,   243,    -1,   222,    11,   243,
      -1,   244,    10,   243,    -1,   244,    11,   243,    -1,   244,
      -1,   223,   244,    -1,   224,   111,   244,    -1,   224,    12,
     244,    -1,   224,    13,   244,    -1,   245,   110,   244,    -1,
     245,   111,   244,    -1,   245,    12,   244,    -1,   245,    13,
     244,    -1,   245,    -1,   225,    14,   245,    -1,   225,    15,
     245,    -1,   246,    14,   245,    -1,   246,    15,   245,    -1,
     225,    14,     1,    -1,   225,    15,     1,    -1,   246,    14,
       1,    -1,   246,    15,     1,    -1,   225,    14,   209,    -1,
     225,    15,   209,    -1,   246,    14,   209,    -1,   246,    15,
     209,    -1,   246,    -1,   226,   124,   246,    -1,   247,   124,
     246,    -1,   226,   124,   209,    -1,   247,   124,   209,    -1,
     247,    -1,   227,   130,   247,    -1,   248,   130,   247,    -1,
     227,   130,   209,    -1,   248,   130,   209,    -1,   248,    -1,
     228,   131,   248,    -1,   249,   131,   248,    -1,   228,   131,
     209,    -1,   249,   131,   209,    -1,   249,    -1,   229,    16,
     249,    -1,   250,    16,   249,    -1,   250,    -1,   230,    17,
     250,    -1,   251,    17,   250,    -1,   251,    -1,   230,   132,
     234,   121,   251,    -1,   230,   132,   254,   121,   251,    -1,
     251,   132,   234,   121,   251,    -1,   251,   132,   254,   121,
     251,    -1,   230,   132,   234,   121,    -1,   230,   132,   254,
     121,    -1,   251,   132,   234,   121,    -1,   251,   132,   254,
     121,    -1,   230,   132,   235,   121,   251,    -1,   230,   132,
     255,   121,   251,    -1,   251,   132,   235,   121,   251,    -1,
     251,   132,   255,   121,   251,    -1,   230,   132,   235,   121,
      -1,   230,   132,   255,   121,    -1,   251,   132,   235,   121,
      -1,   251,   132,   255,   121,    -1,   230,   132,   234,   121,
     209,    -1,   230,   132,   254,   121,   209,    -1,   251,   132,
     234,   121,   209,    -1,   251,   132,   254,   121,   209,    -1,
     230,   132,   235,   121,   209,    -1,   230,   132,   255,   121,
     209,    -1,   251,   132,   235,   121,   209,    -1,   251,   132,
     255,   121,   209,    -1,   230,   132,   121,    -1,   251,   132,
     121,    -1,   230,   132,    -1,   251,   132,    -1,   252,    -1,
     216,   233,   253,    -1,   216,   233,     1,    -1,   239,   233,
     253,    -1,   239,   233,     1,    -1,   216,   233,   209,    -1,
     239,   233,   209,    -1,   253,    -1,   232,     1,    -1,   234,
     117,   253,    -1,   254,   117,   253,    -1,   234,   117,     1,
      -1,   254,   117,     1,    -1,   234,     1,    -1,   234,   234,
      -1,   254,   234,    -1,   234,   254,    -1,   209,    -1,   208,
       1,    -1,   234,   117,   209,    -1,   254,   117,   209,    -1,
     231,    -1,   252,    -1,    29,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,    29,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,   205,    -1,   205,   116,   256,    -1,
     205,   116,   257,    -1,   260,    -1,   261,   117,   260,    -1,
     261,   117,    -1,    50,    -1,   262,   205,    -1,   262,   138,
      -1,   265,   118,    -1,   262,   205,   119,   118,    -1,   262,
     138,   119,   118,    -1,   262,   119,   261,    -1,   262,   119,
       1,    -1,   262,   205,   119,   261,    -1,   262,   205,   119,
     261,     1,    -1,   262,   205,   119,     1,    -1,   262,   205,
     119,   261,   115,   187,    -1,   262,   205,   119,   261,   115,
     188,    -1,   262,   138,   119,   261,    -1,   262,   138,   119,
     261,     1,    -1,   262,   138,   119,     1,    -1,   262,   138,
     119,   261,   115,   187,    -1,   262,   138,   119,   261,   115,
     188,    -1,   262,   205,    -1,   262,   138,    -1,   268,   118,
      -1,   266,   121,   294,   119,   118,    -1,   266,   119,   118,
      -1,   266,   121,   294,   119,   261,    -1,   266,   121,   294,
     119,   261,     1,    -1,   266,   121,   294,   119,     1,    -1,
     266,   121,   294,   119,   261,   115,   187,    -1,   266,   121,
     294,   119,   261,   115,   188,    -1,   266,   121,   294,   119,
     261,     1,   115,   187,    -1,   266,   121,   294,   119,   261,
       1,   115,   188,    -1,   266,   121,   294,   119,     1,   115,
     187,    -1,   266,   121,   294,   119,     1,   115,   188,    -1,
     262,   119,   261,    -1,   262,   119,     1,    -1,   266,   119,
     261,    -1,   266,   119,   261,     1,    -1,   266,   119,     1,
      -1,   266,   119,   261,   115,   187,    -1,   266,   119,   261,
     115,   188,    -1,   267,    -1,   284,    -1,   268,    -1,   285,
      -1,    75,    -1,   305,    -1,    44,    -1,    45,    -1,   271,
      -1,   272,    -1,   273,   272,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
      85,    -1,   281,    -1,   263,    -1,   135,    -1,    87,   112,
     232,   113,    -1,   100,   112,   135,   113,    -1,   100,   112,
     205,   113,    -1,    66,    -1,    82,    -1,    83,    -1,    46,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,
      -1,    41,    -1,    85,    -1,   281,    -1,   263,    -1,   138,
      -1,    87,   112,   232,   113,    -1,   100,   112,   135,   113,
      -1,   100,   112,   205,   113,    -1,    66,    -1,   315,    -1,
     315,   306,    -1,   121,   256,    -1,   315,   121,   256,    -1,
     315,   121,   256,   121,   256,    -1,   121,   257,    -1,   315,
     121,   257,    -1,   315,   121,   256,   121,   257,    -1,   315,
     121,   257,   121,   257,    -1,   315,   121,   257,   121,   256,
      -1,   276,    -1,   277,   117,   276,    -1,   286,   205,    -1,
     286,   136,    -1,   280,   118,    -1,   278,   119,   118,    -1,
     286,   119,   118,    -1,   278,   119,   187,    -1,   278,   119,
     188,    -1,   278,   119,     1,    -1,   286,   119,   187,    -1,
     286,   119,   188,    -1,   286,   119,     1,    -1,   278,    -1,
     278,    -1,   278,   110,   197,   111,    -1,   282,   121,   294,
      -1,   285,   118,    -1,   283,   119,   118,    -1,   282,   119,
     118,    -1,   286,   119,   118,    -1,   283,   119,   187,    -1,
     283,   119,   188,    -1,   283,   119,     1,    -1,   282,   119,
     187,    -1,   282,   119,   188,    -1,   282,   119,     1,    -1,
     286,   119,   187,    -1,   286,   119,   188,    -1,   286,   119,
       1,    -1,    48,    -1,    49,    -1,   272,    -1,   287,   272,
      -1,   274,    -1,   287,   274,    -1,   264,    -1,   287,   264,
      -1,   279,    -1,   287,   279,    -1,   272,    -1,   288,   272,
      -1,   274,    -1,   288,   274,    -1,   134,    -1,   288,   134,
      -1,   264,    -1,   288,   264,    -1,   279,    -1,   288,   279,
      -1,   258,    -1,   289,   258,    -1,   272,    -1,   289,   272,
      -1,   275,    -1,   289,   275,    -1,   264,    -1,   289,   264,
      -1,   279,    -1,   289,   279,    -1,   258,    -1,   290,   258,
      -1,   272,    -1,   290,   272,    -1,   274,    -1,   290,   274,
      -1,   134,    -1,   290,   134,    -1,   279,    -1,   290,   279,
      -1,   264,    -1,   290,   264,    -1,   259,    -1,   291,   259,
      -1,   272,    -1,   291,   272,    -1,   274,    -1,   291,   274,
      -1,   134,    -1,   291,   134,    -1,   269,    -1,   291,   269,
      -1,   270,    -1,   291,   270,    -1,    81,    -1,    80,    -1,
     258,    -1,   293,   258,    -1,   272,    -1,   293,   272,    -1,
     275,    -1,   293,   275,    -1,   205,    -1,   293,   205,    -1,
     205,   110,   199,   111,    -1,   293,   205,   110,   199,   111,
      -1,   293,    -1,   286,    -1,   258,    -1,   295,   258,    -1,
     272,    -1,   295,   272,    -1,   275,    -1,   295,   275,    -1,
     205,    -1,   295,   205,    -1,   205,   110,   199,   111,    -1,
     295,   205,   110,   199,   111,    -1,   258,    -1,   296,   258,
      -1,   272,    -1,   296,   272,    -1,   275,    -1,   296,   275,
      -1,   279,    -1,   296,   279,    -1,   264,    -1,   296,   264,
      -1,   205,    -1,   296,   205,    -1,   205,   110,   199,   111,
      -1,   296,   205,   110,   199,   111,    -1,   258,    -1,   297,
     258,    -1,   272,    -1,   297,   272,    -1,   275,    -1,   297,
     275,    -1,   279,    -1,   297,   279,    -1,   264,    -1,   297,
     264,    -1,   205,    -1,   297,   205,    -1,   205,   110,   199,
     111,    -1,   297,   205,   110,   199,   111,    -1,   299,   117,
       1,    -1,   298,   117,     1,    -1,   205,    -1,   299,   117,
     205,    -1,   298,   117,   205,    -1,   329,   117,   205,    -1,
     330,   117,   205,    -1,   205,    -1,   112,   312,   113,    -1,
     300,   122,   256,   123,    -1,   300,   122,   257,   123,    -1,
     300,   122,   135,   123,    -1,   300,   122,   123,    -1,   300,
     112,    -1,   301,   331,   113,    -1,   301,   332,   113,    -1,
     301,   299,   113,    -1,   301,   298,   113,    -1,   301,   113,
      -1,   301,   298,    -1,   301,     1,    -1,   301,   329,   112,
      -1,   301,   290,   205,   112,    -1,   302,    -1,   300,    -1,
     305,   302,    -1,   305,   300,    -1,    74,    -1,   306,    -1,
      86,   112,   364,   113,    -1,    79,    -1,   112,   310,   113,
      -1,   122,   123,    -1,   122,   256,   123,    -1,   122,   257,
     123,    -1,   122,   135,   123,    -1,   307,   122,   123,    -1,
     307,   122,   256,   123,    -1,   307,   122,   135,   123,    -1,
     307,   122,   257,   123,    -1,   112,   113,    -1,   112,   331,
     113,    -1,   112,   332,   113,    -1,   307,   112,   113,    -1,
     307,   112,   331,   113,    -1,   307,   112,   332,   113,    -1,
     112,   311,   113,    -1,   112,   113,    -1,   112,   331,   113,
      -1,   112,   332,   113,    -1,   308,   112,   113,    -1,   308,
     112,   331,   113,    -1,   308,   112,   332,   113,    -1,   109,
      -1,   109,   273,    -1,   109,   309,    -1,   109,   273,   309,
      -1,   309,    -1,   307,    -1,   309,   307,    -1,   305,   309,
      -1,   305,   307,    -1,   305,   309,   307,    -1,   309,    -1,
     308,    -1,   309,   308,    -1,   305,   309,    -1,   305,   308,
      -1,   305,   309,   308,    -1,   304,    -1,   309,   304,    -1,
     305,   309,   304,    -1,   312,   305,    -1,   302,    -1,   309,
     302,    -1,   305,   302,    -1,   305,   309,   302,    -1,   309,
     305,   302,    -1,   303,    -1,   309,   303,    -1,   305,   303,
      -1,   305,   309,   303,    -1,   309,   305,   303,    -1,   300,
      -1,   309,   300,    -1,   305,   300,    -1,   305,   309,   300,
      -1,   309,   305,   300,    -1,   232,    -1,   119,   320,   118,
      -1,   119,   320,   117,   118,    -1,   253,    -1,   119,   320,
     118,     1,    -1,   119,   320,    -1,   119,   320,   117,   118,
       1,    -1,   119,   320,   117,    -1,   231,    -1,   208,    -1,
     252,    -1,   209,    -1,   316,    -1,   317,    -1,   320,   117,
     316,    -1,   320,   117,   317,    -1,   320,   316,    -1,   320,
     317,    -1,   312,    -1,   312,   116,   316,    -1,   312,     1,
      -1,   312,   116,     1,    -1,   312,   116,   317,    -1,   321,
      -1,   323,   117,   321,    -1,   324,   117,   321,    -1,   322,
      -1,   321,     1,    -1,   323,   117,   322,    -1,   324,   117,
     322,    -1,   287,    -1,   287,   310,    -1,   288,    -1,   288,
     310,    -1,   290,   312,    -1,   290,   310,    -1,   290,   124,
      -1,   290,   124,   312,    -1,   290,    -1,    65,    -1,   290,
     312,     1,    -1,   290,   310,     1,    -1,   327,    -1,   329,
     117,   327,    -1,   329,     1,   117,   327,    -1,   330,   117,
     327,    -1,   330,     1,   117,   327,    -1,     1,   117,   327,
      -1,   299,   117,   327,    -1,   299,     1,   117,   327,    -1,
     298,   117,   327,    -1,   298,     1,   117,   327,    -1,   328,
      -1,   329,   117,   328,    -1,   330,   117,   328,    -1,   330,
       1,   117,   328,    -1,     1,   117,   328,    -1,   299,   117,
     328,    -1,   298,   117,   328,    -1,   298,     1,   117,   328,
      -1,   329,    -1,   329,   117,    51,    -1,   330,   117,    51,
      -1,   299,   117,    51,    -1,   298,   117,    51,    -1,     1,
     117,    51,    -1,   330,    -1,   329,   117,     1,    -1,   330,
       1,    -1,   338,    -1,    79,    -1,   353,    -1,   115,    -1,
     121,    -1,   234,   115,    -1,   356,    -1,   358,    -1,   360,
      -1,   337,    -1,   184,   115,    -1,   183,   115,    -1,   182,
     115,    -1,   339,    -1,   359,    -1,   354,    -1,   357,    -1,
     361,    -1,   360,     1,    -1,   254,    -1,   364,    -1,   364,
     112,   232,   113,    -1,   335,    -1,   336,   117,   335,    -1,
      -1,    86,   272,   112,   364,   113,   115,    -1,    86,   272,
     112,   364,   121,   336,   113,   115,    -1,    86,   272,   112,
     364,   121,   336,   121,   336,   113,   115,    -1,    86,   272,
     112,   364,   121,   336,   121,   336,   121,   336,   113,   115,
      -1,    86,   272,   112,   364,     3,   336,   113,   115,    -1,
      86,   272,   112,   364,     3,   336,   121,   336,   113,   115,
      -1,    86,   272,   112,   364,   121,   336,     3,   336,   113,
     115,    -1,    86,   112,   364,   113,   115,    -1,    86,   112,
     364,   121,   336,   113,   115,    -1,    86,   112,   364,   121,
     336,   121,   336,   113,   115,    -1,    86,   112,   364,   121,
     336,   121,   336,   121,   336,   113,   115,    -1,    86,   112,
     364,     3,   336,   113,   115,    -1,    86,   112,   364,     3,
     336,   121,   336,   113,   115,    -1,    86,   112,   364,   121,
     336,     3,   336,   113,   115,    -1,   205,   121,   333,    -1,
      52,   256,   121,   333,    -1,    52,   257,   121,   333,    -1,
      52,   121,   333,    -1,    53,   121,   333,    -1,   205,   121,
     334,    -1,    52,   256,   121,   334,    -1,    52,   257,   121,
     334,    -1,    52,   121,   334,    -1,    52,   121,    -1,    53,
     121,   334,    -1,    53,   121,    -1,    80,    -1,    81,    -1,
      53,    -1,    80,    -1,    81,    -1,   289,   115,    -1,   289,
     323,   115,    -1,   159,   115,    -1,   345,   115,    -1,   291,
     115,    -1,   291,   323,   115,    -1,   292,   323,   115,    -1,
     163,   115,    -1,    77,   205,   116,   231,   115,    -1,    31,
      77,   205,   116,   231,   115,    -1,   291,     1,    -1,   289,
       1,    -1,   345,     1,    -1,   160,     1,    -1,   159,     1,
      -1,   289,   324,    -1,   342,    -1,   346,   342,    -1,   347,
     342,    -1,   346,     1,   115,    -1,   345,    -1,   346,   345,
      -1,   333,    -1,   348,   333,    -1,   349,   333,    -1,   334,
      -1,   348,   334,    -1,   349,   334,    -1,   348,   342,    -1,
     349,   342,    -1,   348,   345,    -1,   349,   345,    -1,   348,
      -1,   346,    -1,   346,   348,    -1,   347,   348,    -1,   349,
      -1,   347,    -1,   346,   349,    -1,   347,   349,    -1,   119,
      -1,   354,   118,    -1,   352,   351,    -1,   352,    -1,   352,
     350,    -1,   115,    -1,   234,   115,    -1,   254,   115,    -1,
      54,   112,   234,   113,   333,    -1,    54,   112,   254,   113,
     333,    -1,    54,   112,   234,   113,   333,    64,   333,    -1,
      54,   112,   254,   113,   333,    64,   333,    -1,    55,   112,
     234,   113,   333,    -1,    55,   112,   254,   113,   333,    -1,
      54,   112,   254,    -1,   356,     1,    -1,    56,   112,   234,
     113,   333,    -1,    56,   112,   254,   333,    -1,    56,   112,
     113,   333,    -1,    57,   333,    56,   112,   234,   113,   115,
      -1,    57,   333,    56,   112,   254,   115,    -1,    58,   112,
     355,   355,   113,   333,    -1,    58,   112,   355,   113,   333,
      -1,    58,   112,   355,   355,   234,   113,   333,    -1,    58,
     112,   355,   355,   254,   333,    -1,    58,   112,   113,   333,
      -1,    58,   112,   205,   121,   234,   113,   333,    -1,    58,
     112,   205,   121,   234,   115,   234,   113,   333,    -1,    58,
     112,     1,    -1,    58,   112,   254,     1,    -1,    58,   112,
     355,     1,    -1,    58,   112,   355,   254,     1,    -1,    58,
     112,   355,   355,     1,    -1,    58,   112,   355,   355,   254,
      -1,    58,   112,   355,   355,   113,   334,    -1,    58,   112,
     355,   355,   234,   113,   334,    -1,    58,   112,   355,   355,
     254,   334,    -1,    57,   333,    56,   112,   234,   113,    -1,
      57,   333,    56,   112,   234,    -1,    57,   333,    56,   112,
     254,    -1,    57,   333,    56,   112,    -1,    57,   333,    56,
      -1,    57,   333,    -1,    57,    -1,    56,     1,    -1,    56,
     112,     1,    -1,    56,   112,   113,     1,    -1,    56,   112,
     254,    -1,    56,   112,   254,     1,    -1,    56,   112,   234,
     113,   334,    -1,    56,   112,   254,   334,    -1,    59,   205,
     115,    -1,    60,   115,    -1,    61,   115,    -1,    62,   115,
      -1,    62,   234,   115,    -1,    62,   254,   115,    -1,    62,
     208,   115,    -1,    62,   209,   115,    -1,    62,   254,    -1,
      62,   209,    -1,    62,    -1,    59,    -1,   291,   313,   346,
     353,    -1,   291,   313,   353,    -1,   313,   346,   353,    -1,
     313,   353,    -1,   291,   313,   346,   354,    -1,   291,   313,
     354,    -1,   313,   346,   354,    -1,   313,   354,    -1,     5,
      -1,   364,     5,    -1,   362,    -1,   202,    -1,   291,   202,
      -1,   343,    -1,    76,   364,    -1,    76,    31,   364,    -1,
      76,   205,   364,    -1,   115,    -1,   340,   362,    -1,   340,
     202,    -1,   340,   343,    -1,   340,    76,   364,    -1,   340,
      76,    31,   364,    -1,   340,    76,   205,   364,    -1,   340,
     121,    -1,    31,   121,    -1,   101,   205,    -1,   101,   138,
      -1,   370,    -1,   340,   370,    -1,   204,    -1,   291,   204,
      -1,   363,    -1,   340,   204,    -1,   340,   363,    -1,   344,
      -1,   340,   344,    -1,   366,    -1,   368,   366,    -1,   367,
     366,    -1,   368,     1,    -1,   367,     1,    -1,   365,    -1,
     368,   365,    -1,   367,   202,    -1,   367,   340,   202,    -1,
     368,    -1,   367,    -1,    -1,   105,   364,   205,   119,   375,
     118,    -1,   105,   364,   138,   119,   375,   118,    -1,   105,
     364,   119,   375,   118,    -1,   290,   205,   364,   115,    -1,
     205,    -1,   111,   205,    -1,   110,   205,    -1,   372,    -1,
     373,   117,   372,    -1,   107,   373,   115,    -1,   107,   373,
     205,   115,    -1,   371,    -1,   374,    -1,   375,   371,    -1,
     375,   374,    -1,   108,   112,   232,   117,   232,   113,    -1,
     106,   112,   364,   117,   205,   113,    -1,   107,   112,   364,
     117,   205,   113,    -1,   105,   112,   364,   113,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   262,   262,   290,   348,   349,   449,   453,   456,   457,
     458,   507,   509,   514,   519,   524,   526,   531,   533,   538,
     540,   545,   547,   549,   551,   553,   557,   562,   564,   566,
     568,   570,   576,   578,   583,   588,   593,   595,   597,   602,
     603,   607,   608,   619,   623,   624,   626,   631,   632,   634,
     637,   648,   658,   677,   679,   684,   685,   686,   687,   688,
     689,   690,   691,   692,   696,   697,   698,   699,   703,   704,
     705,   706,   707,   708,   709,   713,   715,   720,   722,   724,
     726,   728,   758,   760,   765,   767,   769,   771,   773,   802,
     804,   806,   811,   813,   818,   820,   824,   826,   828,   830,
     835,   838,   841,   844,   909,   911,   916,   918,   920,   922,
     924,   955,   959,   960,   961,   965,   966,   967,   971,   972,
     973,   974,   978,   981,   984,   987,   990,   995,   996,   998,
    1000,  1002,  1004,  1009,  1013,  1016,  1019,  1022,  1025,  1030,
    1031,  1033,  1038,  1042,  1044,  1049,  1051,  1056,  1058,  1063,
    1068,  1070,  1075,  1077,  1079,  1081,  1086,  1088,  1090,  1092,
    1097,  1098,  1099,  1100,  1101,  1102,  1104,  1105,  1106,  1107,
    1108,  1109,  1111,  1112,  1113,  1114,  1115,  1116,  1117,  1118,
    1119,  1120,  1121,  1123,  1124,  1126,  1130,  1131,  1132,  1133,
    1134,  1136,  1137,  1138,  1139,  1140,  1142,  1146,  1147,  1148,
    1152,  1153,  1154,  1155,  1156,  1160,  1161,  1162,  1166,  1170,
    1171,  1172,  1173,  1174,  1175,  1176,  1177,  1181,  1185,  1186,
    1190,  1194,  1195,  1199,  1200,  1201,  1205,  1206,  1210,  1211,
    1212,  1213,  1214,  1215,  1216,  1228,  1240,  1255,  1256,  1260,
    1266,  1267,  1275,  1276,  1278,  1279,  1288,  1289,  1293,  1299,
    1306,  1312,  1319,  1325,  1334,  1341,  1347,  1353,  1359,  1365,
    1371,  1382,  1387,  1388,  1393,  1394,  1395,  1396,  1397,  1398,
    1399,  1400,  1401,  1402,  1403,  1404,  1405,  1406,  1407,  1408,
    1409,  1410,  1411,  1412,  1413,  1414,  1415,  1416,  1417,  1418,
    1419,  1420,  1421,  1423,  1424,  1425,  1426,  1427,  1429,  1433,
    1437,  1441,  1442,  1446,  1448,  1449,  1450,  1451,  1452,  1453,
    1454,  1455,  1456,  1458,  1459,  1460,  1461,  1462,  1463,  1464,
    1465,  1469,  1471,  1472,  1473,  1474,  1475,  1476,  1477,  1478,
    1479,  1481,  1482,  1483,  1484,  1485,  1486,  1487,  1488,  1492,
    1493,  1494,  1495,  1499,  1500,  1501,  1502,  1503,  1507,  1508,
    1509,  1510,  1511,  1512,  1513,  1514,  1515,  1519,  1520,  1524,
    1525,  1529,  1530,  1531,  1532,  1533,  1534,  1535,  1536,  1540,
    1541,  1545,  1546,  1547,  1548,  1549,  1550,  1551,  1555,  1556,
    1557,  1558,  1559,  1563,  1564,  1565,  1566,  1567,  1571,  1579,
    1580,  1581,  1582,  1583,  1584,  1585,  1586,  1587,  1591,  1592,
    1593,  1594,  1595,  1597,  1598,  1599,  1600,  1604,  1605,  1606,
    1608,  1609,  1613,  1614,  1615,  1617,  1618,  1622,  1623,  1624,
    1626,  1627,  1631,  1632,  1633,  1637,  1638,  1639,  1643,  1644,
    1645,  1646,  1647,  1649,  1650,  1651,  1652,  1654,  1655,  1656,
    1657,  1659,  1660,  1661,  1662,  1666,  1667,  1668,  1669,  1670,
    1672,  1673,  1674,  1675,  1679,  1680,  1681,  1682,  1683,  1684,
    1685,  1686,  1687,  1688,  1689,  1693,  1694,  1695,  1696,  1700,
    1701,  1702,  1706,  1707,  1708,  1709,  1711,  1712,  1714,  1715,
    1716,  1717,  1718,  1720,  1721,  1722,  1723,  1727,  1728,  1729,
    1731,  1732,  1734,  1735,  1736,  1737,  1738,  1740,  1741,  1742,
    1743,  1747,  1748,  1749,  1750,  1751,  1752,  1753,  1754,  1755,
    1759,  1760,  1764,  1765,  1770,  1771,  1775,  1776,  1777,  1778,
    1779,  1780,  1781,  1785,  1786,  1787,  1788,  1789,  1790,  1791,
    1792,  1793,  1797,  1798,  1799,  1800,  1801,  1805,  1806,  1856,
    1857,  1858,  1859,  1860,  1861,  1862,  1866,  1867,  1868,  1869,
    1870,  1872,  1873,  1874,  1875,  1877,  1878,  1879,  1880,  1884,
    1885,  1886,  1888,  1889,  1893,  1894,  1895,  1897,  1898,  1902,
    1903,  1904,  1906,  1907,  1911,  1912,  1913,  1917,  1918,  1919,
    1923,  1924,  1925,  1926,  1927,  1928,  1929,  1930,  1931,  1933,
    1934,  1935,  1936,  1937,  1938,  1939,  1940,  1942,  1943,  1944,
    1945,  1947,  1948,  1949,  1950,  1952,  1959,  1963,  1967,  1974,
    1975,  1976,  1977,  1978,  1980,  1981,  1985,  1986,  1987,  1988,
    1989,  1990,  1991,  1992,  1993,  1994,  1998,  1999,  2000,  2001,
    2005,  2007,  2011,  2012,  2013,  2014,  2015,  2019,  2020,  2021,
    2022,  2023,  2027,  2028,  2029,  2033,  2034,  2035,  2039,  2043,
    2044,  2048,  2049,  2050,  2054,  2055,  2057,  2058,  2059,  2060,
    2061,  2063,  2064,  2065,  2066,  2067,  2071,  2072,  2076,  2077,
    2078,  2082,  2083,  2084,  2085,  2086,  2087,  2088,  2089,  2090,
    2092,  2093,  2095,  2096,  2097,  2098,  2099,  2103,  2104,  2108,
    2109,  2113,  2114,  2118,  2119,  2120,  2125,  2126,  2130,  2131,
    2132,  2133,  2134,  2135,  2136,  2137,  2138,  2139,  2140,  2141,
    2142,  2143,  2144,  2145,  2146,  2147,  2148,  2149,  2150,  2151,
    2155,  2156,  2157,  2158,  2159,  2160,  2161,  2162,  2163,  2164,
    2165,  2166,  2167,  2168,  2169,  2170,  2171,  2172,  2173,  2174,
    2180,  2182,  2184,  2186,  2188,  2190,  2192,  2194,  2196,  2198,
    2203,  2204,  2208,  2214,  2223,  2224,  2225,  2229,  2230,  2231,
    2233,  2234,  2235,  2239,  2243,  2251,  2260,  2269,  2270,  2272,
    2273,  2277,  2284,  2291,  2294,  2307,  2321,  2324,  2326,  2328,
    2333,  2334,  2338,  2339,  2340,  2341,  2342,  2343,  2344,  2345,
    2349,  2350,  2351,  2352,  2353,  2354,  2355,  2356,  2357,  2358,
    2362,  2363,  2364,  2365,  2366,  2367,  2368,  2369,  2370,  2371,
    2375,  2376,  2377,  2378,  2379,  2380,  2381,  2382,  2383,  2384,
    2385,  2386,  2390,  2391,  2392,  2393,  2394,  2395,  2396,  2397,
    2398,  2399,  2403,  2404,  2408,  2409,  2410,  2411,  2412,  2413,
    2414,  2415,  2416,  2418,  2420,  2438,  2455,  2456,  2460,  2461,
    2462,  2463,  2464,  2465,  2466,  2467,  2468,  2486,  2503,  2504,
    2505,  2506,  2507,  2508,  2509,  2510,  2511,  2512,  2513,  2514,
    2515,  2533,  2550,  2551,  2552,  2553,  2554,  2555,  2556,  2557,
    2558,  2559,  2560,  2561,  2562,  2580,  2597,  2598,  2602,  2603,
    2604,  2605,  2606,  2610,  2611,  2612,  2613,  2614,  2615,  2619,
    2623,  2624,  2625,  2626,  2627,  2632,  2641,  2650,  2659,  2672,
    2673,  2674,  2676,  2721,  2722,  2723,  2735,  2740,  2742,  2744,
    2746,  2748,  2750,  2752,  2754,  2756,  2758,  2760,  2762,  2764,
    2766,  2768,  2773,  2775,  2777,  2779,  2781,  2783,  2785,  2790,
    2791,  2792,  2793,  2797,  2798,  2799,  2800,  2801,  2802,  2806,
    2807,  2808,  2809,  2810,  2811,  2815,  2816,  2818,  2820,  2825,
    2826,  2827,  2828,  2829,  2833,  2834,  2835,  2836,  2837,  2841,
    2842,  2843,  2844,  2845,  2849,  2850,  2851,  2867,  2868,  2869,
    2870,  2883,  2899,  2900,  2905,  2906,  2910,  2911,  2912,  2913,
    2916,  2917,  2921,  2922,  2926,  2927,  2928,  2932,  2933,  2934,
    2938,  2939,  2940,  2941,  2945,  2946,  2950,  2951,  2956,  2957,
    2958,  2959,  2960,  2961,  2984,  2985,  2989,  2990,  2991,  2992,
    2993,  2994,  2996,  2997,  2998,  2999,  3003,  3004,  3005,  3006,
    3007,  3009,  3010,  3011,  3015,  3016,  3017,  3018,  3019,  3020,
    3024,  3025,  3026,  3031,  3032,  3033,  3034,  3035,  3036,  3037,
    3038,  3039,  3040,  3042,  3043,  3044,  3048,  3049,  3050,  3051,
    3052,  3053,  3054,  3058,  3059,  3063,  3064,  3065,  3069,  3070,
    3071,  3072,  3074,  3075,  3076,  3078,  3079,  3080,  3081,  3083,
    3084,  3085,  3089,  3090,  3091,  3092,  3093,  3097,  3098,  3099,
    3100,  3101,  3102,  3103,  3107,  3108,  3109,  3113,  3114,  3118,
    3119,  3120,  3121,  3125,  3126,  3127,  3129,  3130,  3131,  3135,
    3139,  3140,  3142,  3143,  3144,  3148,  3149,  3150,  3151,  3155,
    3156,  3160,  3161,  3162,  3166,  3167,  3168,  3169,  3170,  3171,
    3172,  3176,  3177,  3178,  3179,  3183,  3184,  3185,  3186,  3190,
    3194,  3198,  3200,  3203,  3209,  3210,  3211,  3215,  3216,  3217,
    3218,  3219,  3220,  3224,  3225,  3229,  3230,  3231,  3233,  3234,
    3236,  3237,  3238,  3239,  3240,  3242,  3243,  3247,  3248,  3249,
    3250,  3251,  3252,  3253,  3254,  3255,  3257,  3258,  3259,  3260,
    3261,  3262,  3263,  3266,  3267,  3268,  3269,  3270,  3271,  3272,
    3276,  3277,  3278,  3279,  3280,  3281,  3282,  3283,  3287,  3288,
    3289,  3290,  3296,  3297,  3300,  3301,  3304,  3305,  3306,  3307,
    3311,  3312,  3324,  3325,  3328,  3331,  3333,  3334,  3335,  3337,
    3339,  3340,  3342,  3343,  3344,  3345,  3346,  3347,  3348,  3349,
    3350,  3351,  3355,  3356,  3357,  3359,  3360,  3362,  3364,  3368,
    3369,  3370,  3371,  3372,  3376,  3377,  3378,  3380,  3385,  3386,
    3387,  3391,  3392,  3393,  3397,  3401,  3402,  3403,  3407,  3408,
    3412,  3413,  3417,  3418,  3419,  3420,  3424,  3428,  3432,  3436
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
  "'['", "']'", "'&'", "'+'", "'-'", "'!'", "'/'", "'%'", "'^'", "'|'",
  "'?'", "$accept", "guess_type", "type", "base_strict_type",
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
      46,    58,    91,    93,    38,    43,    45,    33,    47,    37,
      94,   124,    63
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned short int yyr1[] =
{
       0,   133,   134,   134,   135,   135,   136,   137,   138,   138,
     138,   139,   139,   140,   141,   142,   142,   143,   143,   144,
     144,   145,   145,   145,   145,   145,   145,   146,   146,   146,
     146,   146,   147,   147,   148,   149,   150,   150,   150,   151,
     151,   152,   152,   152,   153,   153,   153,   154,   154,   154,
     154,   154,   154,   155,   155,   156,   156,   156,   156,   156,
     156,   156,   156,   156,   157,   157,   157,   157,   158,   158,
     158,   158,   158,   158,   158,   159,   159,   160,   160,   160,
     160,   160,   161,   161,   162,   162,   162,   162,   162,   163,
     163,   163,   164,   164,   165,   165,   165,   165,   165,   165,
     165,   165,   165,   165,   166,   166,   167,   167,   167,   167,
     167,   168,   169,   169,   169,   170,   170,   170,   171,   171,
     171,   171,   172,   172,   172,   172,   172,   173,   173,   173,
     173,   173,   173,   174,   175,   175,   175,   175,   175,   176,
     176,   176,   177,   178,   178,   179,   179,   180,   180,   181,
     182,   182,   183,   183,   183,   183,   184,   184,   184,   184,
     185,   185,   185,   185,   185,   185,   185,   185,   185,   185,
     185,   185,   185,   185,   185,   185,   185,   185,   185,   185,
     185,   185,   185,   185,   185,   185,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   187,   187,   187,
     188,   188,   188,   188,   188,   189,   189,   189,   190,   191,
     191,   191,   191,   191,   191,   191,   191,   192,   193,   193,
     194,   195,   195,   196,   196,   196,   197,   197,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   199,   199,   200,
     201,   201,   201,   201,   201,   201,   201,   201,   202,   202,
     202,   202,   202,   202,   203,   204,   204,   204,   204,   204,
     204,   205,   206,   206,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   208,
     209,   210,   210,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   213,
     213,   213,   213,   214,   214,   214,   214,   214,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   216,   216,   217,
     217,   218,   218,   218,   218,   218,   218,   218,   218,   219,
     219,   220,   220,   220,   220,   220,   220,   220,   221,   221,
     221,   221,   221,   222,   222,   222,   222,   222,   223,   224,
     224,   224,   224,   224,   224,   224,   224,   224,   225,   225,
     225,   225,   225,   225,   225,   225,   225,   226,   226,   226,
     226,   226,   227,   227,   227,   227,   227,   228,   228,   228,
     228,   228,   229,   229,   229,   230,   230,   230,   231,   231,
     231,   231,   231,   231,   231,   231,   231,   231,   231,   231,
     231,   231,   231,   231,   231,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   233,   233,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   234,   234,   234,   234,   235,
     235,   235,   236,   236,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   237,   237,   237,
     237,   237,   237,   237,   237,   237,   237,   237,   237,   237,
     237,   238,   238,   238,   238,   238,   238,   238,   238,   238,
     239,   239,   240,   240,   241,   241,   242,   242,   242,   242,
     242,   242,   242,   243,   243,   243,   243,   243,   243,   243,
     243,   243,   244,   244,   244,   244,   244,   245,   245,   245,
     245,   245,   245,   245,   245,   245,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,   247,
     247,   247,   247,   247,   248,   248,   248,   248,   248,   249,
     249,   249,   249,   249,   250,   250,   250,   251,   251,   251,
     252,   252,   252,   252,   252,   252,   252,   252,   252,   252,
     252,   252,   252,   252,   252,   252,   252,   252,   252,   252,
     252,   252,   252,   252,   252,   252,   252,   252,   252,   253,
     253,   253,   253,   253,   253,   253,   254,   254,   254,   254,
     254,   254,   254,   254,   254,   254,   255,   255,   255,   255,
     256,   257,   258,   258,   258,   258,   258,   259,   259,   259,
     259,   259,   260,   260,   260,   261,   261,   261,   262,   263,
     263,   264,   264,   264,   265,   265,   265,   265,   265,   265,
     265,   265,   265,   265,   265,   265,   266,   266,   267,   267,
     267,   268,   268,   268,   268,   268,   268,   268,   268,   268,
     268,   268,   268,   268,   268,   268,   268,   269,   269,   270,
     270,   271,   271,   272,   272,   272,   273,   273,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     274,   274,   274,   274,   274,   274,   274,   274,   274,   274,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     277,   277,   278,   278,   279,   279,   279,   280,   280,   280,
     280,   280,   280,   281,   282,   282,   283,   284,   284,   284,
     284,   285,   285,   285,   285,   285,   285,   285,   285,   285,
     286,   286,   287,   287,   287,   287,   287,   287,   287,   287,
     288,   288,   288,   288,   288,   288,   288,   288,   288,   288,
     289,   289,   289,   289,   289,   289,   289,   289,   289,   289,
     290,   290,   290,   290,   290,   290,   290,   290,   290,   290,
     290,   290,   291,   291,   291,   291,   291,   291,   291,   291,
     291,   291,   292,   292,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   294,   294,   295,   295,
     295,   295,   295,   295,   295,   295,   295,   295,   296,   296,
     296,   296,   296,   296,   296,   296,   296,   296,   296,   296,
     296,   296,   297,   297,   297,   297,   297,   297,   297,   297,
     297,   297,   297,   297,   297,   297,   298,   298,   299,   299,
     299,   299,   299,   300,   300,   300,   300,   300,   300,   301,
     302,   302,   302,   302,   302,   303,   303,   303,   303,   304,
     304,   304,   304,   305,   305,   305,   306,   307,   307,   307,
     307,   307,   307,   307,   307,   307,   307,   307,   307,   307,
     307,   307,   308,   308,   308,   308,   308,   308,   308,   309,
     309,   309,   309,   310,   310,   310,   310,   310,   310,   311,
     311,   311,   311,   311,   311,   312,   312,   312,   312,   313,
     313,   313,   313,   313,   314,   314,   314,   314,   314,   315,
     315,   315,   315,   315,   316,   316,   316,   317,   317,   317,
     317,   317,   318,   318,   319,   319,   320,   320,   320,   320,
     320,   320,   321,   321,   322,   322,   322,   323,   323,   323,
     324,   324,   324,   324,   325,   325,   326,   326,   327,   327,
     327,   327,   327,   327,   328,   328,   329,   329,   329,   329,
     329,   329,   329,   329,   329,   329,   330,   330,   330,   330,
     330,   330,   330,   330,   331,   331,   331,   331,   331,   331,
     332,   332,   332,   333,   333,   333,   333,   333,   333,   333,
     333,   333,   333,   333,   333,   333,   334,   334,   334,   334,
     334,   334,   334,   335,   335,   336,   336,   336,   337,   337,
     337,   337,   337,   337,   337,   337,   337,   337,   337,   337,
     337,   337,   338,   338,   338,   338,   338,   339,   339,   339,
     339,   339,   339,   339,   340,   340,   340,   341,   341,   342,
     342,   342,   342,   343,   343,   343,   343,   343,   343,   344,
     345,   345,   345,   345,   345,   346,   346,   346,   346,   347,
     347,   348,   348,   348,   349,   349,   349,   349,   349,   349,
     349,   350,   350,   350,   350,   351,   351,   351,   351,   352,
     353,   354,   354,   354,   355,   355,   355,   356,   356,   356,
     356,   356,   356,   357,   357,   358,   358,   358,   358,   358,
     358,   358,   358,   358,   358,   358,   358,   359,   359,   359,
     359,   359,   359,   359,   359,   359,   359,   359,   359,   359,
     359,   359,   359,   359,   359,   359,   359,   359,   359,   359,
     360,   360,   360,   360,   360,   360,   360,   360,   361,   361,
     361,   361,   362,   362,   362,   362,   363,   363,   363,   363,
     364,   364,   365,   365,   365,   365,   365,   365,   365,   365,
     365,   365,   365,   365,   365,   365,   365,   365,   365,   365,
     365,   365,   366,   366,   366,   366,   366,   366,   366,   367,
     367,   367,   367,   367,   368,   368,   368,   368,   369,   369,
     369,   370,   370,   370,   371,   372,   372,   372,   373,   373,
     374,   374,   375,   375,   375,   375,   376,   377,   378,   379
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
       1,     1,     2,     6,     6,     5,     5,     6,     6,     5,
       5,     7,     7,     6,     6,     7,     7,     6,     6,     4,
       5,     4,     6,     4,     1,     1,     1,     1,     3,     1,
       2,     2,     2,     1,     4,     4,     3,     4,     4,     3,
       3,     2,     2,     4,     4,     3,     4,     3,     3,     2,
       2,     1,     4,     4,     3,     4,     4,     3,     3,     2,
       2,     4,     4,     3,     4,     3,     3,     2,     2,     1,
       1,     3,     3,     1,     1,     3,     3,     2,     2,     2,
       2,     2,     4,     2,     4,     5,     5,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     3,     3,     3,     3,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     3,     3,     2,     1,
       2,     3,     3,     3,     3,     3,     3,     3,     1,     3,
       3,     3,     3,     3,     3,     3,     3,     1,     3,     3,
       3,     3,     1,     3,     3,     3,     3,     1,     3,     3,
       3,     3,     1,     3,     3,     1,     3,     3,     1,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     3,     2,     1,
       3,     3,     1,     1,     2,     2,     3,     3,     3,     3,
       5,     3,     3,     3,     5,     3,     3,     1,     2,     2,
       3,     3,     3,     3,     5,     3,     3,     3,     5,     3,
       3,     2,     2,     2,     2,     3,     2,     5,     6,     6,
       1,     1,     1,     1,     1,     4,     1,     3,     3,     3,
       3,     3,     3,     1,     3,     3,     3,     3,     3,     3,
       3,     3,     1,     3,     3,     3,     3,     1,     2,     3,
       3,     3,     3,     3,     3,     3,     1,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     1,     3,     3,
       1,     5,     5,     5,     5,     4,     4,     4,     4,     5,
       5,     5,     5,     4,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     3,     3,     2,     2,     1,
       3,     3,     3,     3,     3,     3,     1,     2,     3,     3,
       3,     3,     2,     2,     2,     2,     1,     2,     3,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     3,     1,     3,     2,     1,     2,
       2,     2,     4,     4,     3,     3,     4,     5,     4,     6,
       6,     4,     5,     4,     6,     6,     2,     2,     2,     5,
       3,     5,     6,     5,     7,     7,     8,     8,     7,     7,
       3,     3,     3,     4,     3,     5,     5,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     4,     1,
       1,     2,     2,     3,     5,     2,     3,     5,     5,     5,
       1,     3,     2,     2,     2,     3,     3,     3,     3,     3,
       3,     3,     3,     1,     1,     4,     3,     2,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       1,     1,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     1,     1,     2,     1,     2,
       1,     2,     1,     2,     4,     5,     1,     1,     1,     2,
       1,     2,     1,     2,     1,     2,     4,     5,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       4,     5,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     4,     5,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     4,     4,     4,     3,     2,
       3,     3,     3,     3,     2,     2,     2,     3,     4,     1,
       1,     2,     2,     1,     1,     4,     1,     3,     2,     3,
       3,     3,     3,     4,     4,     4,     2,     3,     3,     3,
       4,     4,     3,     2,     3,     3,     3,     4,     4,     1,
       2,     2,     3,     1,     1,     2,     2,     2,     3,     1,
       1,     2,     2,     2,     3,     1,     2,     3,     2,     1,
       2,     2,     3,     3,     1,     2,     2,     3,     3,     1,
       2,     2,     3,     3,     1,     3,     4,     1,     4,     2,
       5,     3,     1,     1,     1,     1,     1,     1,     3,     3,
       2,     2,     1,     3,     2,     3,     3,     1,     3,     3,
       1,     2,     3,     3,     1,     2,     1,     2,     2,     2,
       2,     3,     1,     1,     3,     3,     1,     3,     4,     3,
       4,     3,     3,     4,     3,     4,     1,     3,     3,     4,
       3,     3,     3,     4,     1,     3,     3,     3,     3,     3,
       1,     3,     2,     1,     1,     1,     1,     1,     2,     1,
       1,     1,     1,     2,     2,     2,     1,     1,     1,     1,
       1,     2,     1,     1,     4,     1,     3,     0,     6,     8,
      10,    12,     8,    10,    10,     5,     7,     9,    11,     7,
       9,     9,     3,     4,     4,     3,     3,     3,     4,     4,
       3,     2,     3,     2,     1,     1,     1,     1,     1,     2,
       3,     2,     2,     2,     3,     3,     2,     5,     6,     2,
       2,     2,     2,     2,     2,     1,     2,     2,     3,     1,
       2,     1,     2,     2,     1,     2,     2,     2,     2,     2,
       2,     1,     1,     2,     2,     1,     1,     2,     2,     1,
       2,     2,     1,     2,     1,     2,     2,     5,     5,     7,
       7,     5,     5,     3,     2,     5,     4,     4,     7,     6,
       6,     5,     7,     6,     4,     7,     9,     3,     4,     4,
       5,     5,     5,     6,     7,     6,     6,     5,     5,     4,
       3,     2,     1,     2,     3,     4,     3,     4,     5,     4,
       3,     2,     2,     2,     3,     3,     3,     3,     2,     2,
       1,     1,     4,     3,     3,     2,     4,     3,     3,     2,
       1,     2,     1,     1,     2,     1,     2,     3,     3,     1,
       2,     2,     2,     3,     4,     4,     2,     2,     2,     2,
       1,     2,     1,     2,     1,     2,     2,     1,     2,     1,
       2,     2,     2,     2,     1,     2,     2,     3,     1,     1,
       0,     6,     6,     5,     4,     1,     2,     2,     1,     3,
       3,     4,     1,     1,     2,     2,     6,     6,     6,     4
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
    1250,   261,     6,   637,   638,   639,   640,   641,   699,   700,
     701,   702,   703,   705,   708,   709,   706,   707,   693,   694,
     698,   704,   780,   781,   648,  1096,   239,   717,   913,   691,
       0,     0,   916,  1094,  1095,   718,   719,   710,     0,     0,
       0,     0,     0,   939,     0,  1219,   828,   713,     8,     4,
       0,     0,     0,  1213,     0,  1232,   893,   822,     0,   712,
       0,   687,   689,   830,   832,   695,   824,   826,   763,   711,
       0,     0,   688,   690,     0,     0,     0,     0,     0,   959,
     692,   914,     0,     0,     0,  1215,  1237,  1212,  1234,  1244,
    1239,     0,     0,     0,  1230,     0,  1227,  1210,     0,     0,
    1216,     0,     0,     0,     0,  1229,  1228,     0,   696,   940,
     692,   941,   893,   910,   909,   955,     0,     0,     0,     0,
    1106,     0,   241,   240,     0,     0,   249,     0,   248,     2,
       3,     0,     5,     0,   650,   649,     0,     0,   668,     0,
       0,     0,     0,   767,     0,   753,   752,  1109,   639,  1103,
     829,  1214,  1233,   893,   823,   831,   833,   825,   827,   959,
     692,     0,     0,     0,     0,  1000,     0,     0,     0,   899,
       0,     0,   632,   633,   634,   635,   636,  1013,   904,   816,
     888,   810,     0,   820,     0,   812,   814,   763,   818,     0,
       0,  1012,     0,     0,  1016,  1026,     0,     0,     0,     0,
     961,     0,   960,     0,   721,   722,   723,   724,   725,   727,
     730,   731,   728,   729,   720,   726,   739,   732,     0,     0,
    1139,   735,     0,     0,   800,   734,   806,   802,   804,   808,
     733,     0,  1115,     0,     0,     0,     0,  1205,  1209,   639,
       0,  1226,  1221,  1235,     0,  1222,  1238,  1220,  1236,  1231,
    1243,  1246,     0,     0,     0,     0,     0,  1241,  1242,  1245,
    1240,     1,     0,  1217,  1218,  1211,     0,     0,   473,   270,
       0,     0,     0,     0,     0,     0,   367,   368,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   362,     0,   365,
       0,   361,   363,   364,   366,     0,   265,     0,   264,   303,
     262,   472,     0,   357,   369,     0,   371,   378,   383,   389,
       0,   398,   407,   412,   417,   422,   425,   428,   445,     0,
     511,   510,   514,   516,   523,   532,   537,   546,   559,   564,
     569,   574,   577,   580,     0,   271,   294,   295,   296,   297,
       0,     0,     0,     0,     0,   697,   942,   912,   911,     0,
     956,     0,   894,   958,   732,   735,   208,   230,   229,   228,
     237,     0,   264,   369,   428,   630,   514,     0,   220,   205,
     253,     0,     0,   252,   259,     0,     0,  1097,  1098,   710,
       0,   176,     0,   179,   180,     0,     0,     0,     0,     0,
     183,   250,     4,     0,     0,     0,     0,    28,    30,   164,
     186,   189,     0,   190,     0,   115,   118,     0,   196,   127,
       0,   165,   139,     0,   174,     0,   197,   200,     0,     0,
     264,     0,     0,     0,     0,   964,   692,     0,    12,    18,
       0,   835,   834,   842,   836,     0,   838,   840,   763,   847,
     846,   254,   260,   251,     0,     0,   243,   242,   681,   642,
     645,   680,   684,   670,     0,     0,     0,     0,   223,   224,
     225,   226,     0,   218,   473,   769,     0,     0,   766,   473,
     768,     0,     0,   473,   770,     0,     0,     0,   961,     0,
     960,     0,   994,     0,     0,  1203,  1207,  1001,  1104,     0,
       0,  1105,   898,     0,   264,   631,     0,     0,     0,     0,
     650,   649,   651,     0,   754,     0,     0,     0,  1010,   817,
     893,   811,   821,   813,   815,   819,   692,   944,   943,     0,
       0,     0,   903,     0,     0,   902,     0,     0,     0,  1042,
       0,   900,   901,   962,   963,     0,     0,  1113,  1101,  1112,
      75,  1110,  1099,   893,   801,   807,   803,   805,   809,   692,
       0,  1114,  1111,  1102,     0,  1116,     0,  1204,  1208,  1117,
       0,     0,     0,     0,     0,     0,     0,     0,  1201,     0,
       0,     0,  1044,     0,     0,     0,   156,  1046,  1047,     0,
       0,     0,   264,     0,   369,     0,     0,   514,   609,   616,
       0,  1121,  1124,  1052,  1043,  1056,     0,     0,     0,     0,
    1143,  1141,  1045,  1058,     0,  1059,  1050,  1057,     0,  1060,
    1140,     0,     0,  1223,   893,     0,     0,     0,  1233,     0,
       0,  1209,  1247,     0,     0,     0,   915,   487,     0,     0,
     321,     0,   359,   353,   513,   512,   506,     0,   348,   501,
     349,   502,     0,   882,   872,   880,   874,   876,   878,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     272,     0,     0,     0,   786,   782,   784,   788,  1004,     0,
       0,   299,     0,   340,     0,   339,     0,   475,    92,     0,
     474,     0,   311,   312,     0,     0,     0,   455,   456,   457,
     458,   459,   460,   461,   462,   463,   464,   454,     0,     0,
     351,   504,   350,   503,     0,     0,     0,     0,     0,     0,
       0,   390,   538,     0,     0,   388,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   714,     0,   319,   320,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   715,   716,     0,     0,     0,  1262,
    1263,     0,     0,     0,   957,     0,    10,     9,     0,     0,
       0,     0,     0,   692,   943,   206,     0,   208,     0,   264,
       0,     0,   854,   848,   850,   852,     0,     0,     0,    16,
      20,     0,     0,     0,     0,     0,     0,     0,     0,   362,
       0,   264,     0,    26,    21,    27,    24,     0,    25,    23,
      22,    29,    31,   163,   187,    82,   162,   188,   121,   172,
       0,     0,     0,     0,   131,     0,     0,   133,     0,     0,
     142,   175,   201,   198,   203,   202,   199,   204,   114,     0,
       0,   161,     0,   893,   750,     0,   969,   692,     0,    11,
      17,   740,   906,  1012,     0,     0,   966,     0,   965,     0,
       0,   184,   170,   191,   194,     0,   195,     0,   171,   893,
       0,     0,   650,   649,   843,   837,   839,   841,     0,     0,
       0,   647,   683,     0,     0,     7,   213,   209,   221,   765,
       0,     0,    61,    52,    91,    38,    37,    56,    68,    44,
      47,     0,    73,    55,     0,     0,     0,   983,   985,     0,
     982,   984,     0,    40,    43,   962,   963,   473,     0,   974,
     977,   993,   996,  1202,  1206,   998,  1002,   999,  1003,   897,
     895,   896,  1039,  1021,  1030,   655,   654,     0,     0,   473,
     755,     0,     0,   473,   756,     0,     0,   926,   893,     0,
       0,     0,     0,     0,   918,     0,     0,     0,  1011,   947,
     946,     0,     0,   945,  1015,  1014,     0,   887,  1038,   890,
    1024,  1032,     0,   886,  1037,   889,  1022,  1031,     0,  1041,
    1035,   891,  1017,  1027,     0,  1036,   892,  1019,  1028,     0,
       0,     0,    76,     0,  1100,  1118,     0,     0,     0,     0,
       0,     0,  1183,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1044,     0,   264,     0,  1181,  1049,  1051,     0,
       0,  1191,  1192,  1193,     0,  1199,     0,     0,     0,     0,
       0,     0,   157,   143,  1055,  1054,  1053,     0,     0,     0,
     617,     0,   473,  1048,     0,     0,     0,     0,   468,     0,
       0,   473,     0,     0,     0,     0,  1122,  1125,  1127,     0,
    1123,  1126,  1128,     0,  1154,  1061,  1224,  1225,   241,   240,
       0,     0,     0,  1207,  1208,     0,  1107,     0,   794,   264,
       0,   505,   796,   790,   792,   798,  1006,     0,   489,   488,
       0,   329,   330,     0,     0,     0,     0,   337,   338,     0,
       0,     0,     0,     0,     0,     0,     0,   883,   873,   881,
     875,   877,   879,   692,   950,   949,     0,   868,   858,   866,
     860,   862,   864,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   263,     0,   787,   783,
     785,   789,  1005,     0,   473,     0,     0,     0,   104,     0,
     298,   473,     0,     0,    93,   473,     0,     0,   476,   310,
     473,   306,   344,   478,   479,   343,   482,   309,     0,     0,
     450,   446,   300,   372,   517,   373,   518,   374,   519,   473,
     379,   524,   473,   380,   526,   384,   533,   385,   534,   392,
     540,   393,   541,   391,   539,   473,   403,   555,   399,   547,
     473,   404,   556,   400,   548,   410,   562,   408,   560,   415,
     567,   413,   565,   420,   572,   418,   570,   423,   575,   426,
     578,   605,     0,   626,     0,     0,     0,     0,   452,   448,
     477,   318,   473,   315,     0,   483,   486,   317,     0,     0,
     451,   447,   375,   520,   376,   521,   377,   522,   473,   381,
     528,   473,   382,   530,   386,   535,   387,   536,   396,   544,
     397,   545,   394,   542,   395,   543,   473,   405,   557,   401,
     549,   473,   406,   558,   402,   550,   411,   563,   409,   561,
     416,   568,   414,   566,   421,   573,   419,   571,   424,   576,
     427,   579,   606,     0,     0,     0,     0,   453,   449,     0,
       0,  1255,  1258,     0,     0,  1253,  1264,  1265,     0,     0,
     208,   236,   235,   234,   264,   238,   233,   232,   231,     0,
       0,     0,     0,     0,     0,     0,     0,   946,   245,     0,
     244,   126,     0,   124,   855,   849,   851,   853,     0,    15,
      19,     0,   178,   177,   181,     0,   969,   692,     0,   138,
       0,   136,   855,     0,   264,     0,    83,   116,   119,   117,
     120,   128,   129,   130,   132,   140,   141,   113,   111,   112,
      13,   742,   745,     0,   160,     0,   971,     0,   970,     0,
       0,   741,   893,   907,   967,   968,   893,   169,   192,   168,
     193,   167,     0,     0,     0,     0,     0,   643,   644,   646,
       0,     0,   673,   669,     0,     0,     0,     0,     0,     0,
     227,   219,   217,    35,    36,    74,    53,     0,    54,     0,
      63,    60,    71,    66,    72,    59,    89,    38,    69,    62,
      90,    58,    70,    67,     0,    57,     0,    32,    34,    33,
     986,   987,     0,   663,   653,     0,   658,   652,     0,   917,
     927,   928,   921,   919,   920,   948,   929,     0,     0,   922,
       0,     0,     0,  1025,  1033,  1012,  1023,  1018,  1020,  1029,
     736,   737,   738,   473,     0,     0,  1085,  1090,     0,     0,
    1086,  1092,     0,     0,     0,     0,   473,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1180,   473,     0,  1144,   264,     0,     0,     0,
    1190,  1196,  1197,  1194,  1195,     0,     0,     0,     0,   144,
    1082,  1087,   158,   473,   614,   610,     0,     0,     0,   473,
     466,   618,   473,   615,   612,   473,   467,   619,     0,  1206,
    1108,     0,     0,   352,   795,   797,   791,   793,   799,  1007,
       0,   490,   328,   473,   324,   492,   493,   496,   327,     0,
       0,   491,   336,   473,   333,     0,   497,   500,   335,     0,
       0,   291,   289,     0,     0,   933,     0,     0,     0,     0,
       0,     0,   953,   952,     0,   951,     0,     0,     0,   869,
     859,   867,   861,   863,   865,     0,   267,     0,   266,   293,
       0,     0,     0,     0,     0,     0,  1269,     0,     0,     0,
     370,   515,   107,   105,   342,   341,    98,   102,   307,     0,
     308,   304,   305,   627,     0,     0,     0,     0,     0,     0,
     316,     0,   313,   314,     0,     0,     0,     0,  1257,  1256,
    1260,     0,     0,     0,  1252,  1251,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     0,     0,   122,   125,     0,
       0,   173,   971,     0,   970,     0,     0,   134,   137,     0,
      14,   473,     0,     0,   751,     0,   972,   973,   743,   746,
     908,   185,   166,   844,     0,   247,   246,     0,   672,     0,
     214,   207,   215,   210,   211,   222,    50,    45,    48,    51,
      46,    49,    36,    42,    39,    41,     0,     0,   990,   991,
     662,     0,   657,     0,   930,   931,   924,   923,   925,  1009,
    1008,    78,  1083,  1088,  1084,  1089,     0,     0,     0,     0,
     473,  1157,     0,   473,     0,  1156,  1189,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1164,     0,
    1145,   473,  1146,   473,     0,     0,     0,  1067,   915,  1067,
       0,     0,   154,     0,     0,     0,   159,     0,     0,   507,
     325,     0,   326,   322,   323,   334,     0,   331,   332,   290,
     884,   932,   934,   935,   275,   276,     0,   954,   936,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     268,   279,   280,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   473,   346,   345,   470,   628,   437,   597,   429,
     581,   441,   601,   433,   589,   471,   629,   438,   598,   430,
     582,   442,   602,   434,   590,   473,   439,   599,   431,   583,
     443,   603,   435,   591,   440,   600,   432,   584,   444,   604,
     436,   592,  1259,  1261,  1254,   856,     0,   123,   149,   972,
     973,     0,   135,    85,     0,     0,   845,     0,     0,     0,
       0,     0,     0,     0,     0,   988,   989,   978,     0,     0,
       0,     0,  1147,  1148,  1151,  1152,  1155,  1188,     0,     0,
       0,     0,     0,     0,     0,  1161,   473,   473,     0,     0,
       0,  1065,     0,  1063,  1075,     0,  1067,     0,  1067,     0,
       0,     0,     0,   509,   508,   473,   473,   885,   937,   938,
     273,   274,   870,   283,   284,     0,     0,     0,     0,     0,
     277,   278,   287,   288,     0,     0,   292,  1267,  1268,  1266,
     857,     0,   744,   747,   749,   748,     0,     0,   216,   212,
     980,     0,     0,     0,     0,     0,     0,     0,  1176,  1159,
       0,     0,  1160,  1173,     0,  1163,  1175,     0,     0,  1067,
       0,  1067,     0,  1067,     0,  1068,     0,     0,     0,   147,
       0,   152,     0,   155,     0,   871,   281,   282,     0,     0,
     975,   285,   286,   182,  1149,  1150,     0,     0,  1158,  1165,
       0,  1162,  1174,  1079,  1066,     0,     0,     0,  1076,     0,
       0,  1067,  1067,     0,  1067,   146,   145,   150,   148,     0,
       0,   370,   515,   269,   976,     0,     0,  1064,     0,     0,
    1067,  1072,     0,     0,  1069,     0,     0,   153,  1166,  1080,
    1081,  1077,     0,     0,     0,     0,  1067,   151,     0,  1073,
    1074,  1070,     0,  1078,     0,  1071
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,   179,    47,    48,   886,   295,   393,   394,   395,   396,
     397,   398,   399,   400,   895,   896,   897,   898,   899,   900,
     901,   902,   903,   904,   905,   906,   222,   223,   401,   402,
      50,   296,   297,   671,   699,   405,   406,   407,   408,   409,
     410,   411,   412,   413,   414,  1978,  1979,  1980,   415,   579,
     580,   581,   416,   417,   418,   419,   356,   357,   458,   358,
     459,   359,   460,   461,   778,   360,   361,    51,    52,    53,
      54,    55,   298,   299,   300,   907,   908,   301,   302,   631,
     674,  1164,   303,   584,   633,   305,   306,   307,   308,   309,
     310,   311,   312,   313,   314,   315,   316,   317,   318,   661,
     753,   586,  1225,   320,   634,   321,   587,   636,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   588,
     589,  1015,  1227,   368,   497,   181,    57,   450,   451,   182,
      59,   183,   184,    60,    61,    62,    63,    64,    65,   185,
     109,   186,   228,   844,   845,   187,   188,   189,    69,    70,
      71,    72,    73,   190,   668,  1086,   369,   423,    75,    76,
     440,   441,   787,  1123,   649,   949,   950,    77,   424,    79,
     425,   115,   110,    81,   517,  1114,   427,   519,  1116,   118,
     428,   429,   851,  1440,  1441,   913,   914,  1442,   164,   165,
     166,   167,   669,  1087,   194,   195,   196,   197,   198,   199,
     591,   592,  1901,  1902,   593,   594,   595,    84,   430,   232,
      85,    86,   233,   234,   235,   598,   599,   600,   601,   236,
     602,   807,  1509,  1017,   605,   606,   607,  1018,   609,    87,
      88,   335,    89,    90,    91,    92,    93,    94,   759,  1302,
    1303,   760,   761,   336,   337,   338,   339
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1466
static const int yypact[] =
{
   33757, -1466, -1466, -1466, -1466,   544, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
    1038,   211, -1466, -1466, -1466, -1466, -1466, -1466,    55,   220,
     234,   555,   408,  1557,   927, -1466, -1466, -1466,   462, -1466,
     477,   555,   366, -1466,   519,   417,  1084, -1466,   174, -1466,
     536, -1466,   517, -1466, -1466, -1466, -1466, -1466,   661, -1466,
     803,   551, -1466,   594,   539, 33405,   927,   325, 34019, -1466,
     342, -1466,   903, 35947, 32210, -1466, -1466, -1466, -1466, -1466,
   -1466, 33845, 33044,   760, -1466,   211, -1466, -1466,   408,   408,
     834,   740,   408, 26276,   555, -1466, -1466,   319, -1466,  1557,
   -1466, -1466, -1466,   325, -1466, -1466,   342,   903,  1276, 20650,
   -1466,   762,    20,   376, 27379, 35655, -1466, 27495, -1466, -1466,
   -1466,   555, -1466,   989,  1045,  1290,   112, 35655, -1466, 35801,
   27611, 35655, 27727, -1466, 27843, -1466, -1466, -1466, -1466, -1466,
   -1466, -1466,   417,   801, -1466, -1466, -1466, -1466, -1466,   758,
     342,   903,  1199, 35947,   424, -1466,  1301,   748,  1390, -1466,
   24485,   802, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
     915, -1466,   545, -1466,   818, -1466, -1466,   849, -1466,   831,
     590, 31637,   500,   569, -1466, -1466,   666,   668,   866,   901,
   -1466,   643, -1466,   643, -1466, -1466, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466,   944,   970,
   -1466, -1466,   359,   148, -1466, -1466, -1466, -1466, -1466, -1466,
   -1466, 33581, -1466, 15927,  6958, 36130, 16055, -1466,   997,  1055,
    1107, -1466, -1466,   417, 33493, -1466, -1466, -1466, -1466, -1466,
   -1466, -1466,   517,   594, 34367, 35947, 34626, -1466, -1466, -1466,
   -1466, -1466,  1066,   834,   834, -1466, 26276,   671, -1466, -1466,
   26334, 26407, 26407,  1083, 35874, 26276, -1466, -1466,  1100,  1112,
   35874, 26276,  1117,  1142,  1147,  1171,  1180, -1466, 20874, -1466,
   24558, -1466, -1466, -1466, -1466,  1183, -1466,   171,  1208, -1466,
   -1466, -1466, 11155, -1466,  1299, 24558, -1466,  1267,  1349,  1524,
   26276,  1127,   348,  1206,  1213,  1225,  1347,   129,  1299,  1258,
     986, -1466,  1299, -1466,  1293,  1448,  1582,  1155,  1619,  1254,
    1302,  1257,  1427,   178,  1299,   834, -1466, -1466, -1466, -1466,
    1351,   160, 35051,  1340,  1361, -1466, -1466,   325, -1466,   903,
   -1466,   643, -1466, -1466,  1100,  1183,  1369, -1466, -1466, -1466,
   -1466,   894,  1098, -1466,   193, -1466, -1466,   284, -1466,  4718,
   -1466, 20762, 35801, -1466,   425, 35363, 34711, -1466, -1466,  1100,
    1384, -1466,   555, -1466, -1466,   211, 34796, 34541,  4294, 35728,
   -1466, -1466,  1183,   988,  1380,  1380,  1227, -1466,  1393, -1466,
   -1466,  1399,   205,   887,   222, -1466, -1466,   712,  1405, -1466,
    1275, -1466, -1466,   745, -1466,  1410, -1466, -1466, 26915, 27031,
     584,   295,   986, 32398, 34106, -1466,   342,   903, -1466, -1466,
   32304, -1466, -1466,  1430, -1466,   555, -1466, -1466, -1466,   555,
   35874, -1466,   425, -1466, 27147, 27263,  1469,  1493, -1466,  1504,
   -1466,  1512, -1466, -1466,   835,  1542,   813,   211, -1466, -1466,
   -1466, -1466,   946,   531,   814, -1466, 27959, 28075, -1466,  1178,
   -1466, 28191, 28307,  1188, -1466, 28423, 28539, 10170,  1219,   903,
     758,   643, -1466, 24616,  6958, -1466,   997, -1466, -1466,   927,
     927, -1466, -1466,  1531,   115, -1466,  1550,  1555, 35436,  1540,
    1567,  1569, -1466, 28655, -1466, 28771,  4987, 24689,   927, -1466,
     915, -1466, -1466, -1466, -1466, -1466,   103,   585,   278,   291,
    1039,  1577, -1466, 35138,  1579, -1466, 35213,  1583, 35288,  1585,
   35509, -1466, -1466, -1466, -1466, 26276,   555, -1466, -1466,  1586,
   -1466, -1466, -1466,  1584, -1466, -1466, -1466, -1466, -1466,   342,
    1465,   748, -1466, -1466,  1590, -1466, 16183, -1466,   997, -1466,
     396, 24762,  1587,  1594,  1595,    87, 16311,  1600,   211,  1599,
    1602, 16439, 33669,  1409,  1604,  1606,   211, -1466, -1466,  1605,
    1607,  1608,  1464, 14510,  1299, 14775, 22301,  1299,  1299, -1466,
   14903, -1466, -1466, -1466, -1466, -1466, 16567, 16695, 16823, 16951,
   -1466, -1466, -1466,   997, 17079, -1466, -1466, -1466, 17207, -1466,
   -1466,   408,   408,   834,   616,   555,  1467,  1611, -1466, 35947,
    6958, -1466, -1466, 34454, 26276,  1609, -1466, -1466, 21001,   232,
   -1466, 11291, -1466, -1466,  1009, -1466, -1466, 24820, -1466, -1466,
   -1466, -1466, 35874,  1621, -1466, -1466, -1466, -1466, -1466, 31830,
   35874, 21128,   211, 31925, 35874, 26276,   408,   408,   408, 26276,
   -1466, 11451, 11584, 11717, -1466, -1466, -1466, -1466,  7099,  1620,
   19126, -1466,   237, -1466,  1042, -1466, 19253,  1591, -1466, 19380,
   -1466,  1588, -1466, -1466, 22374,  1596, 26276, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, 24558,   238,
   -1466, -1466, -1466, -1466, 26276, 26276, 26276, 26465, 26538, 26276,
   26276,  1524,  1582, 26276, 26276, -1466, 26276, 24893, 24951, 24558,
   24558, 24558, 26276, 26276, 11850, 24558, -1466,  1597, -1466, -1466,
   22432,  1603, 26276, 24558, 26276, 26276, 26276, 26596, 26669, 26276,
   26276, 26276, 26276, 26276, 26276, 25024, 25082, 24558, 24558, 24558,
   26276, 26276, 11983, 24558, -1466, -1466,   147,   915, 35728, -1466,
   -1466, 33132, 35051, 35051, -1466, 20650, -1466, -1466, 20650, 20650,
   24558, 24558, 31542,   746,   750, -1466,   687,   598,  1044,   613,
    1099,  1615,  1626, -1466, -1466, -1466,   555,  7490, 34711, -1466,
   -1466,   211,  1624,  1628,  1629, 32586,  1622,   211, 31735,  1557,
   21240,  1182, 34881, -1466, -1466,   997, -1466,   997, -1466, -1466,
   -1466,   997, -1466, -1466,  1630, -1466, -1466,  1053, -1466, -1466,
    1364,  1364,  1380,  1380, -1466,  1380,   408, -1466,  1380,  1380,
   -1466, -1466,   908, -1466, -1466,   908, -1466, -1466,   926, 25155,
    1198, -1466, 26276,   702, -1466,  1494,   325,   342,   903, -1466,
   -1466,    76,   802, 31637, 18999,   625, -1466,   643, -1466,   643,
     927, -1466, -1466, -1466,  1634,   274,  1635,   283, -1466,   584,
   32492, 20650, -1466, -1466,  1642, -1466, -1466, -1466, 35801, 35801,
   26276,   211, -1466, 30743,   153, -1466,   673,   786,  1643, -1466,
   35801,   211, -1466, -1466, -1466,  1380, -1466, -1466, -1466, -1466,
   -1466, 32680,  1495, -1466, 19507, 36039, 19634, -1466, -1466, 14642,
   -1466, -1466, 34966, -1466, -1466,   758,  1219, -1466, 25213, -1466,
   -1466, -1466, -1466, -1466,   997, -1466, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466,  1512,   296,   304,  1633,
   -1466, 28887, 29003,  1639, -1466, 29119, 29235, -1466,   447,   125,
     226,  1640,  1645,  1647, -1466,  1598,  1648,  1650,   948,   585,
     278, 34193, 25286,   585, -1466, -1466, 35582, -1466, -1466,   915,
   -1466, -1466, 35582, -1466, -1466,   915, -1466, -1466, 35582, -1466,
   -1466,   915, -1466, -1466, 35582, -1466,   915, -1466, -1466,  1651,
    1652,   433, -1466, 19761, -1466, -1466, 17335,  1653,  1654, 17463,
   26276, 26276, -1466, 25359, 25417,  1655,  1656,  1666, 21454,  1667,
     211, 22505, -1466,  1437,  1498, 22563,  1663, -1466, -1466, 22636,
    1668, -1466, -1466, -1466,  1669,  1670, 22694, 15031,   408,  1676,
   26276, 26276,   211, -1466, -1466, -1466, -1466, 21581,  1032, 25490,
   -1466,  1462, -1466, -1466, 26727, 12116, 12249, 25548, -1466, 26800,
   12382,  1590, 17591, 17719, 17847, 17975, -1466, -1466, -1466, 18103,
   -1466, -1466, -1466, 18231, -1466, -1466,   834,   834,  1671,  1672,
   30858, 30973,  6958, -1466, -1466,  1674, -1466,   775, -1466,   584,
    1677, -1466, -1466, -1466, -1466, -1466,  7099,  1678,  1591, -1466,
    1613, -1466, -1466, 22767,  1637, 26276,  1641, -1466, -1466, 22825,
    1644, 26276,  1679,  2663, 20650, 33932, 26276,  1683, -1466, -1466,
   -1466, -1466, -1466,   780,  1682,  1685,  1680,  1689, -1466, -1466,
   -1466, -1466, -1466, 32020, 22898,  1687,  1692,  1693, 26276,  1686,
   32115,  1690,   705,   356,   400,  1695, -1466,   211, -1466, -1466,
   -1466, -1466, -1466, 26276,   337,  5447, 19888,  1691, -1466, 24558,
   -1466,   352, 10789, 20015, -1466,   364, 32771, 20142, -1466, -1466,
   -1466, -1466, -1466,  1331,  1697, -1466, -1466, -1466, 22956,  6425,
   -1466, -1466,  1691, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
    1267,  1293, -1466,  1267,  1293,  1349,  1448,  1349,  1448,  1524,
    1582,  1524,  1582,  1524,  1582, -1466, -1466, -1466,  1127,  1155,
   -1466, -1466, -1466,  1127,  1155, -1466, -1466,   348,  1619, -1466,
   -1466,  1206,  1254, -1466, -1466,  1213,  1302,  1225,  1257,  1347,
    1427, -1466,    92, -1466, 23029,  1701,  6576,  1702, -1466, -1466,
   -1466, -1466, -1466, -1466,  1360, -1466, -1466, -1466, 23087,  8296,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466,  1267,
    1293, -1466,  1267,  1293,  1349,  1448,  1349,  1448,  1524,  1582,
    1524,  1582,  1524,  1582,  1524,  1582, -1466, -1466, -1466,  1127,
    1155, -1466, -1466, -1466,  1127,  1155, -1466, -1466,   348,  1619,
   -1466, -1466,  1206,  1254, -1466, -1466,  1213,  1302,  1225,  1257,
    1347,  1427, -1466, 23160,  1705,  8504,  1706, -1466, -1466,   211,
     211, -1466, -1466,   619,   830, -1466, -1466, -1466, 33223, 33314,
   -1466, -1466, -1466, -1466,  1152, -1466, -1466, -1466, -1466, 23218,
    1708,  9262,  1709, 23291,  1710, 10654,  1711,   750, -1466, 20650,
   -1466, -1466, 20650, -1466,    19, -1466, -1466, -1466,   131, -1466,
   -1466,   524, -1466, -1466, -1466,  1534,  1694,   342,   903, -1466,
    1700, -1466,   846,   261,   521,  1720, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466,   834, -1466, -1466,  2536, -1466, -1466,
   -1466, -1466, -1466, 20269, -1466,   107,   325,   643,   325,   643,
   26276, -1466,   864, -1466, -1466, -1466,  1721, -1466,  1630, -1466,
    1591, -1466,  1535,  1102, 20650,  1115,  1136, -1466, -1466, -1466,
   29351, 29467,  1699, -1466,  1113, 35874, 35874, 35874, 35874, 26276,
   -1466, -1466, -1466, -1466,   997, -1466, -1466, 25621, -1466, 25679,
   -1466, -1466, -1466,  1538,  1495, -1466, -1466,  1380, -1466, -1466,
   -1466, -1466, -1466,  1538,  1495, -1466, 25752, -1466, -1466, -1466,
   -1466, -1466, 18359, -1466, -1466,   191, -1466, -1466,   203, -1466,
   -1466, -1466, -1466, -1466, -1466,   585, -1466,  1722,  1725, -1466,
    1716,  1717,  1718, -1466, -1466, 31637, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466,   365, 32862, 20396, -1466, -1466, 21581, 21581,
   -1466, -1466, 23349, 15159, 23422, 23480, -1466, 21708, 23553, 15287,
   21454,  1723,  1724, 21454, 26276, 25810,  1762, 23611,  1670,  9471,
     408, 21454,  1730, 31353, 21454, -1466,  1543, 23684, 11005, 23742,
   -1466, -1466, -1466, -1466, -1466,   166,   408,  1733,  1381, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466,  1731,  1735,   211, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, 35801, -1466,
   -1466,  1736,  1737, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
   12515, -1466, -1466, -1466, -1466,  1402,  1738, -1466, -1466, 23815,
   21835, -1466, -1466, -1466, -1466,  1407, -1466, -1466, -1466, 23888,
   21908, -1466, -1466,  1739,  1220, -1466,  1740,  1741,  1743,  1734,
    1751, 20650,  1682,  1685, 34280,  1682, 26276, 20650, 26276,  1750,
   -1466, -1466, -1466, -1466, -1466,  1726, -1466, 25883, -1466, -1466,
    1752,  1754, 26276, 26276,  1742,  4188, -1466,   211,   211, 26276,
   -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466, 12648,
   -1466, -1466, -1466, -1466, 25941, 12781, 12914, 26014, 13047, 13180,
   -1466, 13313, -1466, -1466, 13446, 13579, 13712, 13845, -1466, -1466,
   -1466,   147,  1746,   583, -1466, -1466, 24558, 24558, 24558, 24558,
   24558, 24558, 24558, 24558,  1851,  1269, 20650, -1466, -1466,  1744,
    1380, -1466,  1694,   643,  1694,   643,  1766, -1466, -1466,  1747,
   -1466,   420, 32953, 20523, -1466,   342,   325,   325,  1763,  1765,
   -1466, -1466, -1466, -1466,  1270, -1466, -1466, 30743,  1768, 30743,
   -1466, -1466,  1771, -1466,  1773, -1466,  1229, -1466, -1466,  1229,
   -1466, -1466, -1466,  1229, -1466, -1466, 18487, 18615, -1466, -1466,
   -1466, 30743, -1466, 30743, -1466, -1466, -1466, -1466, -1466, -1466,
     948, -1466, -1466, -1466, -1466, -1466, 21454, 10843, 21454, 10843,
   31068, -1466, 21581, -1466, 15415, -1466, -1466, 21454, 21454, 23961,
   21454, 24019, 21327,  1778, 21981, 24092,   170, 18743, -1466, 26276,
   -1466, 31163, -1466, 31448, 21454, 22039, 26072,   408,  1776,   408,
     215,  1775, -1466,   211, 26276, 26276,   211, 13978, 14111, -1466,
   -1466, 14244, -1466, -1466, -1466, -1466, 14377, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466, -1466,  1274,  1682, -1466,  1784,
    1786,  1779,  1780,  1309,  1781,  1782, 20650, 26276, 20874, 25213,
   -1466, -1466, -1466,  1783,  1785,  1789,  1791, 26276,  1788,  1794,
    1802,  1803, -1466, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
     284, -1466, -1466, -1466,   284, -1466, -1466, -1466, -1466, -1466,
     284, -1466, -1466, -1466,   284, -1466, -1466, -1466, -1466,   284,
   -1466, -1466, -1466,   284, -1466, -1466, -1466,   284, -1466, -1466,
   -1466,   284, -1466, -1466, -1466, -1466,  1328, -1466, -1466,  1694,
    1694, 24558, -1466, -1466, 26276, 26276, -1466, 29583, 29699, 30743,
   29815, 29931, 35874, 35874, 18871, -1466, -1466, -1466, 30047, 30163,
   30279, 30395,  1853,  1854, -1466, -1466, -1466, -1466, 21454, 26276,
   26145,  1776, 15543, 15671, 22112, -1466, 31258, -1466, 21581, 24150,
   15799, -1466,   976,   173, -1466,   142,   408,  1804,   408,   380,
     626,  1810,  1413, -1466, -1466, -1466, -1466, -1466, -1466, -1466,
   -1466, -1466, -1466, -1466, -1466,  1346,  1805,  1806,  1811, 22170,
   -1466, -1466, -1466, -1466,  1807,  1808, -1466, -1466, -1466, -1466,
   -1466,  1812, -1466, -1466, -1466, -1466, 30511, 30627, -1466, -1466,
   -1466, 21454, 21454, 24223, 22243, 21454, 24281, 21327,  1817, -1466,
   21454, 26276, -1466, -1466, 21581, -1466, -1466,  1819,   408,   408,
   26276,   408,  1821,   408,  1306, -1466,   165,  1380,   440, -1466,
     557, -1466,  1818, -1466,   211, -1466, -1466, -1466, 26203, 24354,
   -1466, -1466, -1466, -1466, -1466, -1466,  1817, 21454, -1466, -1466,
   24412, -1466, -1466, -1466, -1466,  1414,  1825,  1419, -1466,  1320,
    1824,   408,   408,  1827,   408, -1466, -1466, -1466, -1466,   380,
     641, -1466, -1466, -1466, -1466, 21454,  1828, -1466,  1830,  1833,
     408, -1466,  1420,  1429, -1466,  1321,   807, -1466, -1466, -1466,
   -1466, -1466,  1444,  1834,  1835,  1838,   408, -1466,  1839, -1466,
   -1466, -1466,  1445, -1466,  1841, -1466
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
   -1466,  1801,    18,   -11, -1466,  1959, -1466, -1466, -1466, -1466,
   -1466, -1466,  1510,  1532,  -808, -1466,  -827,  -571,   257,   260,
    -669,  -653,  -644, -1466,  -662,  -654, -1466, -1466,  1537,  1539,
   -1466,  5323,  2062, -1466,   -25,   837,   847, -1466, -1466, -1466,
   -1466,  1541, -1466, -1466, -1466,  -574, -1465,   -47, -1466, -1466,
   -1466, -1466,   980,  1848,   -74,   -41,  -126,  -745, -1466,  -704,
   -1466,  -726, -1466,  1080,  -105,  1205,  -705,    -2,  1728,    14,
    1729,   -49,     0, -1466,  1704,  5628,  5270, -1466,  3448, -1466,
    -647,  -715,  1715,  3974, -1466, -1466,  -184,   250,   664,   185,
   -1466,   452,   236,   301,   164,   326,   360,   -81,  8937,  2586,
    -210,  9138,   518,  4914, -1466,  1719,  4536, -1466,  -173,   676,
     721,   331,   488,   373,   399,   423,   458,   439,   526,  4880,
    1026,  8591,   581,   184,   697,  6692,   -70,  1095,  -118,  2001,
    8077,  7129, -1466, -1466, -1466,   -45,   -46,    -3, -1466,  5967,
   -1466,   967,  2086,   600,  -681,  2678,  7668, -1466,  8642, -1466,
   -1466, -1466,   -32,  3231, -1466, -1466,  3506,  1435,   -27, -1466,
   -1466,  1422,  1592,  1332,  1707,   -33,   -26,  2707,  7625,  7311,
    -379,  -106,  2910,  1137,  -497, -1028,  9877,  -258,  -586,   -48,
      73,  -276,  1078,  -471,  -479,  -830,  -816,   194,  1191,  1193,
      -5,  1764,  -641, -1466,   176,   133,  1570, -1466,  -503,  -500,
    7154,  -304,    28,  -828, -1466, -1466, -1466,  1907, -1466,    81,
    1915,   -35,   124,  -127,  1767,  1088,  1094, -1466, -1466, -1466,
     -82,    13, -1447,  -229, -1466, -1466, -1466,  -203, -1466,  1918,
     -24,    60,  1912,  1601, -1466, -1466, -1466,  1921,  -729,   367,
   -1466,  -719,   936, -1466, -1466, -1466, -1466
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1250
static const short int yytable[] =
{
      56,   237,  1032,   952,   922,   154,   953,   604,  1145,  1368,
    1125,   350,   921,   457,  1152,  1235,  1146,  1156,   454,   959,
    1311,   963,  1153,  1369,  1316,  1157,   152,   162,   162,   155,
      99,   101,  1306,   608,   462,   243,   484,  1163,   364,  1313,
     122,   106,  1307,  1318,   112,   192,   252,   856,   858,   246,
    1745,   123,   193,   444,   131,   350,   132,   244,   135,   253,
     248,  1312,  1756,   145,   254,  1317,   466,  1129,   471,   121,
     475,   168,   156,    83,   146,   153,   112,  1421,   180,  1431,
     112,   485,   112,  1234,    56,  1582,   445,  1585,  1002,   151,
     100,    56,    56,  1623,   698,   262,   238,  1427,   242,   467,
     790,   472,   107,   476,   341,   251,     1,   344,   725,   596,
       1,   775,   733,   452,  1345,     1,   112,   112,     1,   362,
     446,   702,   340,   132,   420,   433,   521,   420,   620,  1656,
     371,   447,   703,   449,     1,    -8,   449,   433,  1657,   463,
     420,   433,   420,   520,   420,  1971,   723,   850,   163,   539,
       1,   131,   557,   132,  1402,    32,     1,    83,   263,   264,
     112,   112,   267,     1,   255,    83,  1393,   102,  2012,  1757,
     494,   265,   677,  1757,   154,   265,   486,     1,   265,   145,
     132,    28,   501,   162,   154,   364,    32,  1411,   493,  1392,
     146,   510,  1710,    38,   364,   751,   162,  1380,   155,  1003,
     364,   112,     2,   112,  1712,   618,   814,   243,   155,   252,
     723,   252,    43,  -469,     1,   506,    43,  1341,  1906,    44,
     265,   246,   253,   817,   253,   507,   550,   524,   842,   623,
     453,   543,   248,  1088,   679,  1423,   582,  1433,  1147,  1172,
     612,   156,   523,   764,   614,   777,   457,   558,   951,   603,
    1658,  1424,   615,  1434,    56,  1972,    56,  1299,  1300,  1968,
    1425,   724,  1435,  1973,     1,   672,   540,   780,   621,   952,
     622,  1403,   953,   755,   643,  1388,   959,   963,  2013,  1758,
     643,     1,  1968,  1891,  1390,  1970,  2014,  1759,   494,   678,
     364,  1759,   964,   133,  1057,  1061,   838,  1443,  1890,     1,
     613,   751,   681,   682,   683,  1446,  1711,     1,   881,  -661,
     752,   804,   806,   808,   810,   555,   559,   163,  1713,  1431,
     881,  -656,     1,   815,   265,   770,  1431,   619,  1907,   255,
    1431,  1474,   103,  1422,  1428,  1432,  1908,  1427,  -108,  1475,
     678,   132,   757,   526,  1427,     1,   104,     2,  1427,   112,
     678,   112,    28,   -99,   496,  1148,  1148,    32,   556,   560,
     537,   265,   717,   718,    38,  -103,   -81,   604,   604,   604,
     604,   779,   463,   764,  1039,   782,   510,  1047,  1556,     1,
    1668,   936,   793,     1,  1566,   794,   757,   782,   801,   757,
     506,   854,   815,   608,   608,   608,   608,   552,   193,  1574,
     507,   678,   923, -1009, -1009,   265,   805,   684, -1009,   811,
    1142,   839,   350,    97,  1444,   685,   771,   686,   420,   420,
     132,   -88,  1447,   843,   180,   487,   112,   112,   145,   941,
     869,   945,  -473,  -473,  -473,   873,     1,   169,   342,   146,
     874,   162,   162,     1,   420,   420,  1555,   170,  -888,   789,
       1,    43,  1565,  1977,    44,  -108,   887,   888,  1457,   650,
     958,  1458,   942,  1455,   946,   654,   420,   420,   856,   858,
     -99,   420,   420,  1607,   538,   420,   420,  1433,  1384,   112,
    1385,   112,  -103,   -81,  1433,   124,   372,   125,  1433,   112,
     112,   373,  1072,  1434,   132,   711,   849,   924,   757,   449,
    1434,   521,  1435,   420,  1434,   420,   948,   494,   112,  1435,
     132,   553,  1340,  1435,   951,  2018,   112,  1608,   112,  1576,
    1173,  1175,  1177,   969,     1,   955,   975,     1,   981,  1338,
     986,  1174,  1176,  1178,  -207,   128,   991,  1595,   -88,  -997,
    1353,  -997,     1,   364,  1604,  -473,  1472,  -473,     1,   112,
    1242,  1244,  1246,   154,   990,  1787,   129,   130,     1,   220,
       1,  1243,  1245,  1247,  -888,   555,  1014,     2,  1020,  1126,
     524,  2018,   119,     2,  1428,  1432,  1033,   155,   252,  1306,
    1306,  1428,  1432,     2,  1316,  1428,  1432,     1,   265,  1307,
    1307,   253,   120,     1,   850,  -893,   582,   582,   582,   582,
    -893,     1,  1577,  1318,  1068,  1578,  1704,  -893,   556,   603,
     603,   603,   603,   522,   132,  1069,  -207,   523,     2,     1,
    1705,    95,     1,   510,  -207,  1654,   527,  1655,  1079,     1,
    1977,   934,  1073,  1074,   126,   138,  1438,  1660,   127,  1310,
     679,   712,  1102,  1310,     1,   367,     1,   891,  1431,  1107,
    1117,   494,  1127,  1107,  1117,   136,   971,   137,   144,   977,
    1690,   983,  1693,   988,   499,    96,  1427,   527,  1137,   529,
     142,  1066,  1067,   672,   933,  2017,   265,   555,   559,  1058,
    1062,  1159,   525,  1695,   364,  1167,   526,   364,   364,  1684,
       1,   956,  1477,   129,   130,  1481,   619,   961,  1854,   970,
     672,   555,   976,   679,   982,     1,   987,   962,   672,   505,
     265,  1672,   143,   818,   765,   885,  1132,  1133,  1134,  1673,
     556,   560,  1059,  1063,  -207,   129,   130,  1231,   672,  1329,
    -207,  1237,   679,  1521,  1640,   477,  1641,  1383, -1034,  1981,
    1361,  1362,   528,  1363,   556,   997,  1365,  1366,  1057,  1061,
    1057,  1061,   457,   457,  2037,    44,  1301,   132,  1304,  -909,
     261,   757,   757,   757,   457,  1314,  1404,   604,   362,  1314,
     604,   139,   180,  1395,  1396,   145,   887,   888,     1, -1034,
    -764, -1040,  -764,   528,   626,   530,   146,  1334,   510,  1405,
     364,  1033,   367,   608,  1406,   510,   608,  1350,  1352,   642,
    1354,   367,   757,     2,     1,   520,  1433,   367,   604,  1400,
       1,   129,   130,  1413,   828,   829,     1,  -776,  1606,  1445,
    1448,  1373,  1434,   604,   604,   604,   604,   819,  1549,   820,
    1455,  1435,  -909,     1,   608,    97,   882,  -909,  -682,   265,
     112,   885,  1401,   132,  -909,  1573,  1431,   112,   112,   608,
     608,   608,   608,  1382,   764,    43,   266,   112,   772,   112,
    1386,  1339,   772,   830,  1427,   490,    26,     1,   507,   132,
     843,   362,   507,  -909,  -909,  -909,  1786,   370,   463,   463,
    1977,   449,  1793,   420,   449,  1215,  1364,   642,  -776,    43,
     463,  1412,  1105,  -776,  -265,  -265,  -265,   367,  1189,  1191,
    -776,  1193,  1407,  1428,  1432,   766,     1,  1408,  1414,  -682,
     129,   130,   112,  1286,  -682,  -473,  -473,  -473,     1,   498,
     477,  -682,   140,  -776,   141,  2047,  1258,  1260,  1262,  1264,
       1,  1905,  -776,  -474,  -474,  -474,   502,   449,   449,   129,
     130,   420,   420,   849,  -682,   420,   420,  -682,   132,   504,
     883,  1856,   881,  -682,  1766,  1207,  1656,  1180,  1183,  1610,
     112,   180,   494,  1709,  1808,  1667,   757,    67,   503,   132,
    1611,  1708,   757,   129,   130,   132,  1680,    28,   757,   531,
    1460,   132,    32,  1278,   757,  1437,   132,  1249,  1252,    38,
     448,   132,     1,   727,   728,   729,   582,   444,  1384,   582,
    1385,    28,   816,  -265,  1433,   767,    32,  -265,  1014,   603,
    1020,   768,   603,    38,   532,    44,  1096,  1097,  1098,  1506,
    1434,  1211,    28,   364,   129,   130,  1371,    32,  -473,  1435,
     445,  1941,  1519,  1166,    38,     1,    43,   582,  1167,    44,
     965,     1,   158,    97,  1190,  1192,  -474,  1194,  1217,  1282,
     603,    67,   582,   582,   582,   582,   535,   889,    67,    67,
    -475,  -475,  -475,   890,  1397,   603,   603,   603,   603,    98,
     420,   420,  1259,  1261,  1263,  1265,  1288,   757,  1974,   132,
    1976,  1789,   536,  1219,  1790,  1539,   757,     1,  1515,  1967,
    1552,  1925,  1208,  1968,  1558,  1542,  1562,  1969,   730,  1464,
    1568,  1428,  1432,   803,   362,   180,   731,   220,   732,  -207,
       1,  1290,    97,    28,  1688,   610,  -671,  1469,    32,  1212,
    1279,  1099,  1522,  1589,   672,    38,  1800,  1948,  1949,  1100,
    1589,  1101,    95,  1058,  1062,  1058,  1062,   132,   611,   713,
     714,  2005,  1463,  2007,  1216,  2009,  1461,  1283,  1466,    26,
     367, -1008, -1008,   555,  1467,  1328, -1008,  1928,   514,  1149,
    1468,   890,  1220,  -207,  -667,  1150,  -667,   741,   742,  1198,
    1203,  1154,  1287,  -475,  1723,  1725,  1059,  1063,  1059,  1063,
    1218,  -773,   624,  2032,  2033,  1736,  2035,  -671,  1491,  1910,
    1291,  -779,  -671,   129,   130,   642,   556,  1269,  1274,  -671,
     482,     1,  2042,  1310,   957,  1199,  1204,  1719,  1289,  -207,
    1330,   158,   651,  1683,   769,  -207,   890,   679,  2052,   768,
    -911,   158,  -671,    67,   652,  -671,  1685,  1876,  1689,   655,
     881,  -671,   890,  1270,  1275,  1875,  -473,   715,   716,  -473,
    -473,  -473,  -473,  -473,  -473,  -473,  -473,  1686,   364,   604,
     604,   364,  -773,   890,   656,   666,  -893,  -773,   998,   657,
     604,  -893,  -779,  -207,  -773,   743,   744,  -779,  -893,  -207,
    1294,   679,    28,    28,  -779,   608,   608,    32,    32,  1310,
    1692,  1310,  1694,   658,    38,    38,   608,  -773,  1320,  1324,
    1579,   367,   659,  -911,   367,   367,  -773,  -779,  -911,  1638,
    1639,   679,   676,  1642,   132,  -911,  -779,    43,   757,   757,
      44,  1370,  1600,   364,  -992,   483,  -992,   687,   688,   689,
     690,   691,   692,   693,   694,   695,   696,   679,   364,  1314,
     719,  1780,   362,  1296,  -911,  -911,  -911,   768,  1659,  -473,
    -473,  1519,   809,   720,   822,   823,   220,   112,   112,  -473,
      28,  1322,  1326,  1669,   132,    32,   721,  -473,  -473,  -473,
    -473,  -473,    38,   722,  1643,   268,   824,     1,   269,    97,
     825,   726,   826,  1185,  1187,   112,   704,   112,   747,   112,
    1855,  1866,   132,  1181,  1184,  1917,   768,   768,   749,   352,
     514,   768,     2,   827,   362,   705,   706,   367,   833,   836,
     420,   420,   734,  1254,  1256,  1691,  1691,  1691,  1691,  -666,
    2020,  -666,   457,  1250,  1253,   697,   488,  1720,   489,  2010,
    1922,   735,   736,  1968,   833,   836,   768,  2011,  1887,   273,
    1186,  1188,   748,  2029,  2045,   274,   275,  1968,  1968,  1940,
    1702,  2030,  2046,   750,  1618,   768,   833,   836,  1619,   278,
    1709,   833,   836,    18,    19,   833,   836,  1985,  1708,   762,
    1255,  1257,   279,   768,   754,   510,   280,   281,   282,   283,
     284,   285,   286,  1630,   707,   708,   637,  1631,   582,   582,
     763,    18,    19,    28,    29,   765,   290,  1014,    32,   582,
    1014,   603,   603,  1014,  1762,    38,   791,  1506,  1763,   220,
     364,  1014,   603,   604,  1014,   491,   364,   489,   812,   920,
    1876,    28,    29,   191,   813,  1770,    32,  2023,  1875,  1771,
    1775,  1028,   821,    38,  1776,   831,  1983,  2026,  1033,   608,
    1984,  1968,  2028,  2043,   709,   710,  1968,  1968,   463,  1372,
     871,   935,  2044,     1,   364,   364,  1968,   364,   364,  1500,
    1526,  1527,  1528,   364,   364,   364,   364,  2048,  2054,   455,
    1746,  1968,  1968,   468,  1678,   364,   364,   364,   364,   364,
     364,   364,   364,   737,   738,   364,  1760,  1398,  1858,   878,
     994,   362,   489,   679,   180,  1037,  1070,   362,   125,  1158,
     158,     1,   739,   740,  1963,  1084,  1966,  1166,  1230,     1,
       1,    18,    19,   879,  1236,  1137,     1,  1809,  1810,  1374,
    1418,  1375,  1419,  1867,  1551,  1870,     1,   679,   666,  1501,
     880,   672,   672,   672,   672,   672,   672,   672,   672,   881,
     367,    28,    29,   745,   746,  1140,    32,  1878,  1557,  1880,
       1,  1301,  1561,    38,     1,  1567,  1868,     1,  1871,  1661,
    1682,  1375,  1375,  1416,   929,  1417,   362,  1357,  1359,  1462,
    2002,   884,   679,   112,  1749,   112,    43,  1358,  1360,   604,
    1879,   604,  1881,   930,  1697,   112,  1700,  1698,   931,  1701,
     925,   927,   926,   928,  1052,  1054,   937,   420,   938,   420,
    1053,  1055,   257,   260,   966,   608,   972,   608,  1308,  1309,
     978,  1492,   984,   993,   992,   995,  1000,  1001,   999,  1154,
    1165,   420,  1019,   420,  1021,   364,  1030,  1022,  1031,  1502,
    1034,  1452,  1035,  1036,  1076,   514,  1014,  1014,  1014,  1014,
    1071,  1104,   582,  1143,  1331,   604,  1332,  1014,  1014,  1342,
    1014,  1349,  1014,  1343,  1344,   603,  1310,  1310,  1356,  1387,
    1389,  -759,  1394,  1449,  1014,   514,  1165,  -762,  1450,  1409,
    1451,   608,   514,  1033,  1470,  1471,  1519,   666,  1494,   514,
    1791,  1453,  1794,  1454,  1478,  1479,  1493,   758,  1495,  1497,
     364,  1538,   372,  1510,  1511,  1512,  1803,  1805,  1516,  1540,
    1543,  1550,  1571,  1581,  1584,  1946,   362,  1105,   494,  1587,
    1597,    46,  1586,  1580,  2021,  1598,  1599,  1605,  1602,  1613,
    1620,   788,  1609,  1666,  1687,  2022,   170,  1903,  1743,  1903,
     514,   795,  1626,  1629,   802,  1601,  1635,  1637,  1947,  1647,
    1649,  1651,  1653,  1670,  1681,  1714,   672,   514,  1715,  1716,
    1717,  1718,  1747,  1764,  1737,  1738,  1761,  1765,  1797,  1767,
    1768,  1772,  1779,  1781,  1782,   367,  1783,  1784,   367,   853,
    1796,  1853,  -232,  1857,  1807,   870,  1862,   420,   420,   420,
     420,   420,  1691,  1691,  1785,  1801,   150,  1802,   420,   420,
     420,   420,  1861,  1869,  1864,    46,  1865,  1872,  1014,  1873,
    1889,  1904,    46,    46,  1909,  2015,  2016,  1918,   582,  1919,
     582,  1936,  1920,  1921,  1923,  1924,  1930,  1937,  1931,  1033,
    1519,   603,  1932,   603,  1933,  1938,  1939,  1951,  1952,  1975,
     367,   833,   836,  1982,  1988,   833,   836,  1993,  1986,  1987,
    1991,  1992,  1998,   191,  2003,   367,  2008,  2019,  2027,  2031,
     862,   191,  2034,  2039,   920,  2040,   420,   420,  2041,  2049,
    2050,  1014,  1014,  2051,  2053,  1014,  2055,  1014,   191,    49,
    1014,   191,   863,   191,   582,   191,  1903,   864,  1903,   865,
    1410,   868,  2036,  1315,   630,  1674,  1399,   603,  1519,   798,
    1033,  1926,   616,   617,  1033,   632,  1130,   653,  1381,   635,
    1439,  1934,   509,  1929,   855,   551,  2004,  1014,   256,   245,
     105,    58,   247,   597,   259,   249,     0,     0,  1852,     0,
      49,     0,     0,     0,     0,     0,     0,   134,     0,  1033,
    1519,     0,     0,     0,     0,  1014,     0,     0,  1903,  1903,
       0,  1903,     0,  1903,    49,     0,  1033,    49,     0,     0,
       0,     0,   221,    49,     0,   150,     0,     0,  1942,  1944,
      49,    49,     0,  1547,     0,   150,     0,    46,     0,     0,
       0,     0,     0,    49,     0,  1525,   343,     0,     0,     0,
    1531,  1903,  1903,  1534,  1903,  1537,    58,  1679,   355,     0,
       0,     0,     0,   392,   221,    58,   392,     0,     0,     0,
    1903,     0,    58,    58,     0,     0,   221,     0,   221,   392,
     221,   392,     0,   392,     0,     0,  1903,   367,     0,     0,
       0,     0,     0,   367,     0,     0,     0,     0,     0,  1165,
       0,     0,   221,     0,     0,  1165,   435,     0,     0,   392,
       0,     0,     0,     0,     0,     0,     0,     0,   435,     0,
       0,   500,   435,     0,     0,     0,     0,     0,     0,     0,
      49,  1820,  1824,     0,  1830,  1834,     0,     0,     0,     0,
    1839,  1843,  1847,  1851,     0,     0,     0,     0,     0,     0,
       0,     0,   367,   367,   367,   367,   367,   367,   367,   367,
       0,     0,   367,     0,     0,     0,   404,     0,     0,   404,
     221,     0,     0,   221,   221,   355,   758,   758,   758,     0,
       0,     0,   404,    49,   404,     0,   404,   191,     0,     0,
       0,   437,     0,    49,   221,    49,     0,     0,     0,     0,
       0,     0,     0,   437,   509,     0,     0,   437,     0,     0,
       0,     0,     0,   221,     0,     0,     0,     0,     0,   221,
       0,     0,     0,     0,     0,    58,     0,   392,     0,     0,
       0,     0,     0,     0,     0,    58,     0,    58,     0,     0,
       0,     0,     0,     0,     0,     0,   834,   837,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1792,     0,  1795,     0,     0,     0,     0,
       0,     0,   834,   837,     0,     0,     0,     0,     0,  1804,
    1806,    49,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   834,   837,     0,   547,     0,   834,
     837,     0,   367,   834,   837,     0,     0,     0,   221,     0,
     355,   221,   629,     0,   221,    49,     0,     0,     0,     0,
       0,   792,     0,     0,     0,    49,   221,     0,    49,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     647,     0,     0,     0,     0,     0,   647,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   435,   392,   392,     0,
     833,   836,    49,    49,     0,     0,     0,   367,   435,   392,
       0,     0,     0,     0,   872,     0,   191,     0,     0,   221,
       0,   191,     0,   392,   392,     0,     0,  1465,     0,     0,
       0,     0,     0,  1465,     0,     0,     0,     0,     0,   191,
       0,     0,     0,     0,   150,   392,   392,     0,     0,  1078,
     392,   392,   514,     0,   392,   392,   355,     0,     0,     0,
       0,   435,     0,   221,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   547,     0,    49,     0,     0,
       0,   785,   392,     0,   392,    49,   392,     0,   920,     0,
       0,     0,     0,   785,     0,     0,     0,     0,     0,     0,
     404,   404,    49,     0,     0,    49,     0,    49,     0,    49,
       0,     0,   867,     0,  1927,    49,     0,     0,     0,     0,
       0,     0,     0,     0,  1935,     0,   404,   404,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   877,     0,   404,   404,
       0,     0,     0,   404,   404,     0,     0,   404,   404,     0,
     191,     0,     0,  -473,  -473,  -473,  -473,  -473,  -473,  -473,
    -473,  -473,  -473,  -473,     0,   355,   355,   355,   355,   509,
       0,  1943,  1945,     0,     0,   404,     0,   404,     0,     0,
       0,     0,   666,     0,     0,     0,     0,     0,   221,   221,
       0,     0,    49,     0,     0,     0,     0,   392,     0,   509,
       0,     0,     0,     0,     0,     0,   509,     0,     0,     0,
       0,   221,     0,   509,     0,     0,     0,     0,   221,   221,
     392,     0,   221,   221,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    58,     0,     0,    49,     0,   355,
       0,     0,     0,     0,     0,   355,     0,     0,   355,     0,
       0,     0,     0,     0,     0,  1814,  -473,  -473,     0,     0,
    1531,     0,     0,  1537,   509,     0,  -473,  1814,     0,     0,
    -473,  -473,  -473,     0,  -473,  -473,  -473,  -473,  -473,     0,
       0,   509,     0,     0,     0,     0,     0,     0,    68,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   319,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,    49,     0,     0,
      49,    49,    49,     0,   355,     0,     0,   355,   355,   216,
       0,    49,   920,     0,     0,  1111,  1121,    28,    29,  1111,
    1121,     0,    32,   758,   758,     0,   221,    49,   217,    38,
     218,   113,     0,    68,    49,     0,     0,   221,     0,   392,
       0,    49,    68,   219,     0,   666,     0,     0,     0,    68,
      68,     0,    43,     0,     0,   772,  1572,     0,     0,     0,
       0,     0,   113,   113,     0,   507,     0,     0,   435,   834,
     837,     0,     0,   834,   837,     0,     0,  1814,     0,   435,
       0,     0,  1814,   438,     0,     0,     0,     0,     0,     0,
       0,     0,    49,     0,     0,   438,     0,     0,     0,   438,
       0,     0,   585,   347,   113,   920,     0,     0,     0,    49,
     355,     0,     0,     0,     0,     0,     0,   221,   221,     0,
       0,     0,   392,     0,     0,     0,     0,   833,   836,   221,
     833,   836,     0,     0,     0,     0,     0,     0,   833,   836,
     833,   836,     0,   355,   221,   355,     0,   347,   113,     0,
       0,   221,     0,  1337,     0,     0,   675,     0,  1541,     0,
       0,     0,     0,     0,  1337,     0,     0,  1544,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   113,     0,
     392,   392,     0,     0,   392,   392,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      49,   392,    68,     0,     0,    49,   833,   836,     0,     0,
       0,    49,    68,     0,    68,     0,     0,    49,   113,     0,
       0,     0,     0,    49,     0,   404,     0,     0,     0,     0,
       0,   113,   355,     0,   116,   920,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   160,   116,     0,     0,     0,
       0,     0,   203,     0,    80,     0,     0,     0,   547,     0,
       0,    80,    80,   404,   404,     0,     0,   404,   404,     0,
       0,   355,   355,   355,   355,   920,     0,     0,     0,   191,
       0,     0,     0,     0,     0,     0,     0,   351,   353,   392,
     392,   221,     0,     0,   426,     0,    49,   426,     0,     0,
       0,     0,     0,     0,     0,    49,     0,     0,     0,     0,
     426,     0,   426,   438,   426,     0,   113,     0,   347,     0,
       0,     0,   221,   355,    49,   438,     0,     0,     0,   919,
       0,   481,   353,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   221,     0,     0,     0,     0,     0,     0,   221,
       0,     0,     0,     0,     0,   113,     0,     0,     0,     0,
       0,   516,     0,     0,   221,   355,     0,     0,     0,     0,
       0,   221,   355,     0,     0,   221,   355,     0,   438,     0,
       0,   989,     0,     0,     0,     0,     0,     0,     0,     0,
     846,     0,   404,   404,     0,     0,     0,     0,     0,     0,
       0,   549,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   585,     0,   160,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   585,   585,   585,   585,   113,     0,   347,   547,
       0,     0,     0,     0,     0,     0,   113,   113,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1593,
       0,     0,     0,   113,     0,   113,  1593,     0,     0,     0,
       0,     0,     0,   347,     0,   113,     0,     0,     0,     0,
       0,    74,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1131,     0,     0,     0,  1135,     0,     0,   834,   837,
       0,     0,     0,     0,     0,     0,   347,     0,     0,   351,
       0,     0,     0,     0,     0,     0,   509,    49,    49,     0,
     675,     0,     0,     0,     0,     0,     0,     0,     0,   773,
       0,     0,     0,     0,  1171,     0,   426,     0,   355,     0,
       0,   355,     0,     0,     0,     0,     0,     0,   116,     0,
       0,    68,     0,     0,     0,     0,    74,     0,     0,     0,
       0,  1229,     0,     0,     0,    74,   675,     0,     0,  1241,
       0,     0,    74,    74,     0,     0,     0,     0,   426,   426,
       0,     0,   355,   847,     0,     0,     0,   859,     0,  1298,
     426,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   355,   426,   426,   439,     0,     0,   392,
     392,     0,     0,     0,   221,   221,   221,   221,   439,     0,
       0,     0,   439,     0,     0,     0,   426,   426,     0,     0,
       0,   426,   426,     0,     0,   426,   426,     0,     0,   351,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   116,
     116,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   426,     0,   426,   516,     0,   116,     0,
       0,     0,     0,     0,    49,     0,     0,     0,   351,     0,
     353,     0,     0,   221,   355,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   404,   404,     0,   438,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    74,   438,     0,     0,     0,
       0,     0,     0,     0,     0,    74,     0,    74,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   221,     0,     0,
       0,     0,  1346,     0,   919,     0,     0,   113,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
     355,     0,     0,    49,     0,     0,   355,   113,     0,     0,
       0,     0,     0,     0,  1376,  1378,     0,     0,     0,  1113,
     113,     0,     0,  1113,    49,     0,     0,   113,     0,     0,
       0,     0,   421,     0,     0,   421,     0,   846,   773,     0,
       0,     0,   585,     0,     0,   585,     0,     0,   421,   231,
     421,     0,   421,     0,   585,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   786,     0,     0,     0,
       0,     0,     0,     0,     0,   355,  1517,  1518,   786,   846,
       0,     0,     0,   585,     0,  1171,     0,     0,     0,     0,
    1530,   221,   355,  1241,     0,  1536,     0,     0,   585,   585,
     585,   585,     0,     0,     0,     0,   392,     0,   392,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   113,     0,   231,
     392,   786,   392,     0,     0,     0,     0,     0,     0,   675,
       0,     0,   773,     0,   583,   675,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   773,   426,     0,
       0,     0,     0,     0,     0,  1347,     0,     0,   773,     0,
     549,     0,     0,     0,     0,   834,   837,     0,   834,   837,
       0,     0,     0,     0,     0,     0,   834,   837,   834,   837,
       0,     0,     0,     0,     0,  1615,     0,     0,     0,     0,
     231,   231,   231,     0,     0,     0,     0,     0,     0,   404,
     116,   404,     0,     0,     0,   355,     0,   392,  1379,     0,
       0,   231,     0,   516,     0,     0,     0,     0,     0,     0,
     116,     0,     0,   404,     0,   404,     0,     0,     0,     0,
     847,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   426,   834,   837,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   847,     0,     0,     0,   392,   392,   392,   392,
     392,   221,   221,     0,     0,     0,     0,   392,   392,   392,
     392,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   426,   426,     0,    74,   426,   426,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   421,   421,   353,     0,
     351,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   421,   421,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   392,   392,     0,     0,     0,
       0,     0,     0,     0,   421,   421,     0,     0,     0,   421,
     421,     0,     0,   421,   421,   909,     0,     0,     0,   404,
     404,   404,   404,   404,     0,     0,     0,     0,     0,     0,
     404,   404,   404,   404,     0,     0,     0,     0,     0,     0,
       0,   421,     0,   421,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     426,   426,     0,   912,     0,     0,     0,     0,     0,     0,
     231,     0,     0,     0,     0,     0,   773,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   404,   404,
       0,     0,     0,   773,   583,  1113,     0,     0,   786,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   919,   786,
       0,     0,     0,  1113,     0,     0,     0,     0,     0,     0,
    1113,     0,     0,     0,   583,   583,   583,   583,     0,     0,
       0,     0,     0,     0,  1662,  1664,     0,     0,     0,     0,
       0,     0,     0,     0,   585,   585,     0,     0,     0,     0,
       0,     0,     0,   585,     0,   585,   585,   304,     0,   585,
       0,     0,  1346,     0,  1676,     0,  1677,   585,     0,     0,
     585,     0,     0,   363,     0,     0,     0,     0,     0,     0,
       0,     0,   231,   231,   231,   231,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   909,     0,
       0,     0,     0,     0,   909,   231,   231,   909,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   363,     0,     0,     0,  1103,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   113,     0,     0,     0,   912,     0,     0,     0,
       0,     0,   912,   919,     0,   912,     0,     0,     0,     0,
       0,     1,     0,     0,     0,  1811,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1615,     0,     0,     0,     0,
    1530,     0,     0,  1536,     0,     0,     2,  1615,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
     363,     0,     0,     0,     0,   638,   640,     0,     0,   363,
       0,     0,     0,     0,    27,   363,     0,     0,  1665,     0,
       0,     0,    28,    29,   304,     0,     0,    32,   421,   421,
      35,    36,     0,    37,    38,    39,     0,     0,     0,   363,
       0,     0,     0,     0,   363,  1675,     0,     0,    40,     0,
       0,     0,   919,     0,     0,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
     426,   426,   585,   585,   585,   585,     0,     0,   585,     0,
       0,     0,     2,   585,   585,     0,   585,     0,   585,     0,
       0,   421,     0,     0,     0,     0,     0,     0,     0,     0,
     585,     0,     0,     0,     0,   363,     0,     0,     0,     0,
    1911,  1912,   909,     0,   909,     0,     0,  1615,     0,   273,
       0,     0,  1615,     0,     0,   274,   275,   276,    28,     0,
    1859,     0,  1860,    32,     0,   516,     0,     0,   277,   278,
      38,     0,  1662,     0,     0,   919,     0,     0,     0,   421,
     421,     0,   279,   421,   421,     0,   280,   281,   282,   283,
     284,   285,   286,   799,     0,     0,   800,   660,   289,     0,
     912,   912,   912,     0,     0,     0,   290,     0,   291,   292,
     293,   294,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   909,     0,     0,   583,     0,     0,   583,     0,     0,
       0,   363,     0,     0,     0,     0,   583,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   585,     0,     0,     0,     0,     0,
       0,   363,     0,     0,   585,   583,   585,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   912,
     583,   583,   583,   583,     0,     0,     0,     0,     0,   304,
       0,     0,     0,     0,     0,   919,     0,     0,   421,   421,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   363,     0,   585,   585,     0,
       0,   585,     0,   585,     0,     0,   585,     0,     0,     0,
     585,     0,     0,     0,     0,     0,  2006,     0,   231,   231,
     231,   231,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   919,   919,     0,     0,   231,     0,
       0,     0,     0,   585,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   909,     0,     0,   426,   363,   426,
       0,   909,  1080,     0,     0,   909,     0,     0,     0,     0,
       0,   585,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   426,     0,   426,     0,     0,     0,     0,     0,   304,
     353,     0,     0,   304,     0,     0,     0,     0,     0,   322,
       0,     0,     0,     0,   363,     0,     0,     0,     0,     0,
     363,   912,   912,   363,     0,   366,     0,     0,   912,   912,
       0,     0,   912,   912,     0,     0,     0,     0,     0,     0,
       0,     0,   304,     0,     0,     0,     0,     0,   363,   363,
     363,   363,   363,   363,   363,     0,     0,   363,   363,     0,
     363,   363,   363,   363,   363,   363,   363,   363,     0,   304,
       0,     0,     0,     0,     0,     0,   366,   304,   363,   363,
     363,   363,   363,   363,   363,   363,   363,   363,   363,   363,
     363,   363,   363,   363,   363,   363,     0,   304,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   363,
       0,     0,   363,   363,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,   426,   426,   426,
     426,   426,     0,     0,   216,     0,     0,     0,   426,   426,
     426,   426,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   366,   217,    38,   218,     0,   639,   641,     0,
       0,   366,     0,   363,     0,     0,   363,   366,   219,     0,
       0,   909,     0,     0,     0,     0,   322,    43,     0,     0,
     772,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     507,   366,     0,     0,     0,   363,   366,     0,   421,   421,
       0,     0,     0,     0,   363,     0,   426,   426,     0,     0,
       0,     0,     0,     0,     0,   909,     0,   909,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   363,   912,
     363,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   366,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   909,     0,     0,   583,   583,     0,     0,
       0,     0,     0,     0,     0,   583,   363,   583,   583,     0,
       0,   583,     0,     0,     0,     0,     0,     0,     0,   583,
       0,     0,   583,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   363,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   363,     0,
     912,   912,     0,   334,     0,     0,     0,     0,   171,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   304,   304,     0,     0,     0,     0,
       0,     0,     0,   366,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,   422,     0,
       0,   422,     0,   366,     0,     0,     0,     0,     0,     0,
     495,     0,   177,    27,   422,     0,   422,     0,   422,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,   322,    37,    38,    39,     0,     0,     0,   363,     0,
     363,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,    43,   366,     0,   506,
     947,     0,   363,     0,     0,     0,     0,     0,     0,   507,
       0,     0,     0,     0,     0,     0,     0,   363,     0,     0,
     363,   909,     0,   304,     0,     0,     0,   363,     0,     0,
       0,   363,     0,     0,     0,   421,     0,   421,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   421,
     366,   421,     0,     0,  1081,     0,     0,     0,     0,     0,
     334,     0,     0,     0,   583,   583,   583,   583,   912,   912,
     583,     0,     0,     0,     0,   583,   583,     0,   583,     0,
     583,   322,     0,     0,     0,   322,     0,     0,     0,     0,
       0,     0,   583,     0,     0,     0,   366,     0,     0,     0,
       0,     0,   366,     0,     0,   366,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   322,     0,     0,     0,     0,     0,
     366,   366,   366,   366,   366,   366,   366,     0,     0,   366,
     366,     0,   366,   366,   366,   366,   366,   366,   366,   366,
       0,   322,     0,     0,     0,     0,     0,     0,     0,   322,
     366,   366,   366,   366,   366,   366,   366,   366,   366,   366,
     366,   366,   366,   366,   366,   366,   366,   366,     0,   322,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   366,     0,   363,   366,   366,   363,     0,     0,     0,
       0,     0,     0,     0,     0,   421,   421,   421,   421,   421,
       0,     0,     0,     0,     0,     0,   421,   421,   421,   421,
       0,     0,   422,   422,     0,     0,   583,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   583,   363,   583,     0,
       0,     0,     0,     0,   363,     0,     0,   911,   422,   422,
       0,     0,     0,     0,     0,     0,     0,     0,   363,     0,
       0,     0,     0,     0,     0,   366,     0,     0,   366,     0,
     422,   422,     0,   363,     0,   422,   422,   495,     0,   422,
     422,   363,     0,   363,   421,   421,     0,     0,     0,   583,
     583,     0,     0,   583,     0,   583,     0,   366,   583,     0,
     363,     0,   583,     0,     0,   334,   366,   422,     0,   422,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     366,   495,   366,     0,     0,   583,     0,   403,  1612,   363,
     403,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   403,     0,   403,     0,   403,     0,     0,
       0,     0,     0,   583,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,   366,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,   366,
       0,     0,   217,    38,   218,   334,     0,     0,     0,   334,
     366,     0,     0,     0,     0,     0,     0,   219,     0,     0,
     911,     0,     0,     0,     0,   363,   911,     0,     0,   911,
     363,   363,   363,     0,     0,  -110,   322,   322,     0,     0,
       0,   304,     0,     0,     0,   701,   363,   363,   334,     0,
       0,     0,     0,   304,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   363,
     363,     0,   363,   363,     0,   334,     0,     0,   363,   363,
     363,   363,     0,   334,     0,     0,     0,     0,     0,     0,
     363,   363,   363,   363,   363,   363,   363,   363,     0,     0,
     363,     0,     0,   334,     0,     0,     0,     0,     0,     0,
     366,     0,   366,     0,     0,     0,     0,   363,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   366,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   366,
       0,     0,   366,     0,     0,   322,     0,     0,     0,   366,
       0,     0,     0,   366,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   911,
       0,     0,   495,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   422,   422,     0,     0,   304,   304,
       0,   403,   403,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   866,     0,     0,     0,     0,     0,     0,
     495,     0,     0,     0,     0,     0,     0,   403,   403,     0,
     363,   363,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   363,     0,     0,   911,     0,   911,     0,     0,   403,
     403,     0,     0,     0,   403,   403,     0,   422,   403,   403,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   403,     0,   403,     0,
       0,     0,     0,     0,     0,   363,     0,     0,   363,   363,
       0,  1025,   495,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   422,   422,     0,     0,   422,
     422,     0,     0,     0,     0,   366,     0,     0,   366,     0,
       0,     0,     0,   911,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   495,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   366,
     334,   334,     0,     0,     0,     0,   366,     0,   673,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     366,     0,     0,   700,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   304,   366,     0,     0,     0,     0,
       0,     0,     0,   366,  1162,   366,     0,     0,     0,     0,
       0,     0,   304,     0,     0,     0,     0,    66,     0,     0,
       0,     0,   366,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   422,   422,   495,  1197,  1202,  1206,
    1210,  1214,     0,     0,  1223,     0,     0,     0,     0,     0,
    1162,     0,     0,     0,     0,     0,     0,     0,   495,     0,
     108,   366,     0,     0,     0,  1268,  1273,  1277,  1281,  1285,
       0,     0,  1223,     0,     0,     0,   911,     0,     0,   334,
       0,     0,     0,   911,     0,     0,     0,   911,     0,     0,
    1223,  1223,   157,     0,     0,     0,     0,     0,     0,     0,
     227,    66,     0,     0,     0,     0,     0,     0,    66,    66,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   345,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   227,     0,     0,     0,
       0,     0,   436,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   436,     0,   227,     0,   436,     0,
       0,     0,     0,     0,     0,     0,     0,   366,     0,     0,
       0,     0,   366,   366,   366,     0,     0,     0,     0,     0,
     227,     0,     0,   322,     0,     0,     0,     0,   366,   366,
       0,     0,     0,     0,     0,   322,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   513,     0,
       0,   366,   366,     0,   366,   366,     0,     0,     0,     0,
     366,   366,   366,   366,     0,     0,     0,     0,     0,     0,
       0,     0,   366,   366,   366,   366,   366,   366,   366,   366,
       0,     0,   366,     0,     0,     0,     0,     0,   546,  1024,
       0,   227,   227,   227,     0,     0,   403,     0,     0,   366,
       0,   157,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   157,   227,    66,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   646,     0,     0,     0,     0,     0,   646,     0,     0,
       0,     0,     0,   911,     0,   665,     0,     0,     0,     0,
     495,     0,     0,     0,   403,   403,     0,     0,   403,   403,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1498,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   911,     0,   911,
     322,   322,     0,     0,     0,     0,     0,     0,     0,  1524,
       0,     0,   673,     0,   422,   422,   911,  1533,     0,     0,
       0,     0,     0,     0,     0,     0,  1170,     0,     0,     0,
       0,     0,   366,   366,     0,     0,   546,     0,   227,   227,
       0,     0,   784,   366,     0,  1196,  1201,  1205,  1209,  1213,
       0,     0,  1222,  1228,   784,   911,     0,     0,   673,     0,
       0,  1240,     0,  1162,     0,     0,     0,     0,     0,  1162,
       0,     0,     0,  1267,  1272,  1276,  1280,  1284,     0,     0,
    1222,  1297,     0,     0,     0,     0,     0,     0,     0,     0,
     513,     0,     0,   403,   403,     0,     0,   366,  1222,  1222,
     366,   366,     0,     0,     0,     0,     0,   876,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   227,     0,     0,     0,     0,     0,
       0,   227,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   495,     0,   495,     0,
       0,     0,     0,     0,     0,     0,     0,   334,     0,     0,
       0,     0,   495,   495,     0,     0,     0,     0,     0,   334,
     273,     0,     0,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,   322,     0,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,   322,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1048,   289,
    1029,     0,  1049,     0,     0,     0,     0,   290,  1622,   291,
     292,   293,   294,   911,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   227,   227,   227,   227,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   268,     0,     1,
     269,    97,   270,     0,   271,   272,   227,   227,     0,     0,
     157,     0,     0,     0,     0,  1083,     0,     0,     0,     0,
       0,   422,     0,   422,     2,     0,     0,     0,     0,   227,
       0,     0,     0,     0,     0,     0,  1110,  1120,   665,     0,
    1110,  1120,     0,     0,     0,   422,     0,   422,     0,     0,
       0,     0,     0,     0,     0,  1139,     0,   227,     0,  1024,
       0,   273,     0,   227,   334,   334,   227,   274,   275,   276,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   278,     0,     0,     0,     0,     0,  1170,     0,     0,
       0,     0,     0,     0,   279,  1240,     0,   495,   280,   281,
     282,   283,   284,   285,   286,   287,     0,   495,   288,  1048,
     289,     0,     0,  1627,     0,     0,     0,  1628,   290,     0,
     291,   292,   293,   294,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   673,     0,   403,   403,   513,     0,   673,     0,     0,
       0,     0,   227,     0,     0,   227,   227,     0,     0,     0,
       0,     0,     0,     0,   495,   495,     0,     0,     0,     0,
       0,     0,     0,     0,  1336,   513,     0,     0,     0,     0,
       0,     0,   513,     0,     0,  1336,   108,   665,     0,   513,
       0,     0,     0,     0,     0,   224,     0,  1614,     0,     0,
       0,   422,   422,   422,   422,   422,     0,     0,     0,     0,
       0,     0,   422,   422,   422,   422,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   224,     0,     0,     0,     0,     0,   434,     0,     0,
     513,     0,     0,     0,     0,     0,     0,     0,     0,   434,
       0,   224,     0,   434,     0,     0,     0,   513,   227,     0,
       0,     0,     0,     0,     0,   227,   227,     0,     0,     0,
     334,     0,     0,     0,     0,   224,     0,   227,     0,     0,
     422,   422,     0,     0,     0,     0,     0,     0,   334,     0,
       0,   227,   227,   227,     0,     0,     0,     0,     0,   546,
       0,     0,     0,   511,     0,     0,     0,     0,     0,  1813,
       0,     0,     0,     0,  1816,  1818,  1822,  1826,  1828,  1832,
       0,  1813,     0,     0,  1837,  1841,  1845,  1849,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   544,     0,     0,   224,   224,   224,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   224,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   554,
     227,     0,     0,     0,     0,     0,   644,     0,     0,     0,
       0,     0,   644,     0,     0,     0,     0,     0,     0,     0,
    1029,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
     403,     0,   403,     0,     0,     0,     0,     0,     0,   227,
     227,   227,   227,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,   403,     0,   403,    32,     0,   227,
       0,  1813,     0,   217,    38,   218,  1813,     0,     0,     0,
       0,     0,     0,  1546,     0,     0,     0,     0,   219,     0,
       0,   544,     0,   224,   224,     0,     0,   783,     0,     0,
     546,   227,     0,     0,     0,     0,     0,   220,     0,   783,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1592,     0,     0,     0,     0,     0,     0,  1592,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   227,   227,     0,   511,     0,     0,     0,   227,
     227,     0,     0,   227,   227,     0,     0,     2,     0,     0,
       0,     0,   875,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,   224,
       0,     0,     0,    28,    29,     0,   224,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
     403,   403,   403,   403,   403,     0,     0,     0,     0,    40,
       0,   403,   403,   403,   403,     0,     0,     0,    43,     0,
       0,   772,   226,     0,     0,     0,     0,     0,     0,     0,
       0,   507,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1614,   226,     0,
       0,     0,  1815,  1817,  1821,  1825,  1827,  1831,     0,  1614,
       0,     0,  1836,  1840,  1844,  1848,     0,     0,   226,   403,
     403,     0,     0,     0,  1817,  1821,  1827,  1831,  1836,  1840,
    1844,  1848,     0,     0,     0,     0,     0,     0,   224,   224,
     224,   224,   226,     0,     0,     0,   227,     0,     0,   227,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   224,   224,     0,     0,     0,     0,     0,     0,     0,
     512,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   224,     0,     0,     0,     0,     0,
     227,  1108,  1118,     0,     0,  1108,  1118,     0,     0,     0,
       0,     0,     0,     0,     0,   114,     0,     0,     0,     0,
     545,   227,   224,   226,   226,   226,     0,     0,   224,     0,
       0,   224,   227,   227,   227,   227,     0,     0,     0,     0,
       0,     0,     0,     0,   226,     0,   159,   114,     0,     0,
       0,   200,     0,   202,     0,     0,     0,     0,     0,  1614,
       0,     0,     0,   645,  1614,     0,     0,     0,     0,   645,
       0,     0,     0,     0,     0,     0,     0,   664,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   348,   114,     0,
       0,     0,   513,     0,     0,     0,     0,     0,     0,     0,
       0,   227,   227,     0,     0,     0,     0,     0,     0,     0,
     511,     0,     0,     0,     0,     0,     0,   224,     0,     0,
     224,   224,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   478,   480,     0,     0,     0,     0,     0,     0,  1335,
     511,     0,     0,     0,     0,     0,     0,   511,     0,     0,
    1335,     0,     0,     1,   511,     0,     0,     0,   545,     0,
     226,   226,   114,     0,     0,   227,     0,     0,     0,     0,
       0,     0,   533,     0,   534,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,   114,     0,     0,   511,     0,     0,   227,     0,
       0,     0,   512,     0,   227,   159,   216,     0,     0,     0,
       0,     0,   511,   224,    28,    29,     0,     0,     0,    32,
     224,   224,   665,     0,     0,   217,    38,   218,     0,     0,
       0,     0,   224,     0,     0,     0,     0,     0,     0,     0,
     219,     0,     0,     0,     0,     0,   224,   224,   224,    43,
       0,     0,   772,     0,   544,     0,   226,     0,     0,  1333,
       0,     0,   507,   226,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   227,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   227,
     227,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     114,     0,   348,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   224,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   114,
      78,    78,     0,     0,     0,    78,     0,    78,     0,    78,
       0,     0,     0,     0,     0,     0,    78,    78,     0,     0,
    1016,     0,     0,     0,     0,   226,   226,   226,   226,     0,
       0,     0,     0,     0,     0,     0,     0,   200,   202,     0,
       0,    78,    78,     0,   224,   224,   224,   224,   226,   226,
       0,   229,  1056,  1060,     0,     0,     0,  1082,     0,     0,
       0,     0,     0,   227,   224,   665,     0,     0,     0,     0,
       0,   226,     0,     0,     0,     0,     0,     0,  1109,  1119,
     664,     0,  1109,  1119,     0,    78,    78,   229,     0,     0,
     915,     0,   916,     0,     0,   544,   224,  1138,     0,   226,
     114,   114,     0,     0,     0,   226,     0,   229,   226,     0,
       0,     0,     0,     0,     0,  1590,    78,   114,     0,   114,
       0,     0,  1590,     0,     0,     0,    78,   348,    78,   114,
       0,   229,     0,     0,     0,     0,     0,   224,   224,   227,
     227,     0,     0,     0,   224,   224,     0,     0,   224,   224,
       0,     0,     0,     0,     0,     0,    78,     0,     0,   515,
     348,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,    78,     0,     0,     0,     0,     0,   512,     0,     0,
       0,     0,     0,     0,   226,     0,     0,   226,   226,   548,
       0,     0,   229,   229,   229,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   512,     0,     0,
       0,     0,     0,   229,   512,     0,     0,     0,     0,   664,
       0,   512,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   648,     0,     0,     0,     0,     0,   648,     0,
       0,     0,     0,     0,     0,     0,   667,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,    78,     0,     0,     0,
       0,     0,   512,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   512,
     226,     0,     0,     0,     0,     0,     0,   226,   226,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,   226,
       0,   224,     0,     0,   224,     0,     0,     0,     0,     0,
       0,     0,     0,   226,   226,   226,     0,   548,     0,   229,
     229,   545,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   224,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,     0,     0,     0,
       0,   515,     0,     0,     0,     0,     0,   224,   224,   224,
     224,     0,     0,     0,    78,     0,    78,     0,     0,     0,
       0,   114,     0,     0,    78,    78,     0,     0,     0,     0,
       0,     0,   226,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,    78,     0,     0,     0,     0,     0,     0,
       0,    78,     0,    78,     0,   229,     0,     0,     0,     0,
    1476,   114,   229,  1480,     0,     0,     0,   511,   200,   202,
     225,     0,  1496,     0,   114,     0,   224,   224,   533,     0,
     534,   114,     0,     0,    78,     0,     0,     0,     0,     0,
       0,   226,   226,   226,   226,     0,     0,     0,     0,     0,
       0,  1520,     0,     0,     0,     0,   225,     0,     0,     0,
       0,   226,   225,     0,     0,     0,  1056,  1060,  1056,  1060,
       0,     0,     0,     0,   225,  1545,   225,     0,   225,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     224,     0,   545,   226,     0,     0,     0,     0,     0,     0,
     225,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,  1591,     0,     0,     0,     0,     0,     0,  1591,
       0,     0,     0,     0,   229,   229,   229,   229,     0,     0,
       0,   114,     0,   224,   226,   226,     0,     0,     0,   224,
       0,   226,   226,     0,     0,   226,   226,   229,   229,     0,
       0,     0,     0,     0,     0,     0,  1085,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,   225,     0,
     229,   225,   225,   225,     0,     0,     0,  1112,  1122,   667,
       0,  1112,  1122,     0,     2,     0,     0,     0,     0,     0,
       0,     0,   225,     0,     0,     0,  1141,     0,   229,     0,
       0,     0,     0,     0,   229,     0,     0,   229,   224,     0,
       0,   225,     0,     0,     0,     0,     0,   225,     0,     0,
       0,   273,     0,     0,   224,   224,     0,   274,   275,   276,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1048,
     289,     0,     0,  1049,     0,     0,     0,     0,   290,  1633,
     291,   292,   293,   294,     0,    78,   515,     0,     0,     0,
       0,     0,     0,   229,     0,     0,   229,   229,     0,     0,
       0,     0,     0,     0,     0,     0,   225,     0,   225,   225,
       0,     0,   225,     0,     0,     0,   515,     0,   226,     0,
       0,   226,     0,   515,   225,    78,     0,     0,   667,     0,
     515,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,    78,     0,     0,   224,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   226,     0,     0,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,   225,     0,     0,
       0,   515,     0,   226,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,   226,   226,   226,   226,   515,   229,
       0,     0,     0,     0,     0,     0,   229,   229,     0,     0,
       0,     0,     0,     0,   225,     0,     0,     0,   229,     0,
       0,   225,     0,     0,   224,   224,     0,     0,     0,   273,
       0,     0,   229,   229,   229,   274,   275,   276,     0,     0,
     548,     0,     0,     0,     0,    78,     0,     0,   277,   278,
       0,     0,     0,     0,   512,     0,     0,     0,     0,     0,
       0,     0,   279,   226,   226,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1048,   289,     0,
       0,  1627,     0,     0,     0,  1636,   290,     0,   291,   292,
     293,   294,  1722,  1724,     0,     0,     0,     0,     0,     0,
       0,  1731,     0,  1735,  1476,     0,     0,  1480,     0,     0,
       0,     0,     0,     0,     0,  1520,     0,     0,  1748,     0,
       0,   229,     0,     0,     0,     0,     0,   226,     0,     0,
       0,     0,     0,   225,   225,   225,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   533,     0,
     534,     0,     0,     0,     0,     0,   225,   225,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     226,     0,     0,     0,     0,     0,   226,     0,     0,   225,
     229,   229,   229,   229,     0,   230,   225,   225,     0,     0,
     225,   225,     0,     0,   664,     0,     0,     0,     0,     0,
     229,     0,     0,     0,     0,     0,     0,   225,     0,     0,
       0,     0,     0,   225,  1548,     0,   225,     0,     0,     0,
       0,   230,     0,     0,     0,     0,     0,   230,     0,     0,
       0,   548,   229,     0,     0,     0,   114,     0,     0,   230,
       0,   230,     0,   230,     0,   226,     0,     0,     0,     0,
       0,  1594,     0,     0,     0,     0,     0,     0,  1594,     0,
       0,   226,   226,     0,     0,   230,     0,     0,     0,     0,
       0,     0,     0,   229,   229,     0,     0,     0,     0,     0,
     229,   229,     0,     0,   229,   229,     0,   590,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   225,     0,     0,   225,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   225,     0,     0,     0,     0,     0,
       0,     0,     0,   230,     0,   225,   230,   230,   230,   663,
    1882,  1883,  1884,  1885,     0,     0,  1886,     0,     0,     0,
       0,  1722,  1724,     0,  1731,     0,  1735,   230,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1895,     0,
       0,     0,     0,     0,     0,     0,   230,     0,     0,     0,
       0,     0,   230,     0,     0,   226,     0,   664,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,     0,
       0,     0,     0,     0,     0,   225,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   225,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   663,
       0,   225,   225,   225,     0,     0,     0,     0,     0,   225,
       0,     0,     0,     0,     0,     0,     0,   229,     0,     0,
     229,   226,   226,     0,     0,     0,     0,     0,     0,     0,
       0,   230,     0,   230,   230,     0,     0,   230,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   229,  1886,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1962,     0,  1965,     0,   365,     0,     0,     0,
       0,     0,   229,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,   229,   229,   229,   229,     0,     0,     0,
       0,     0,   230,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1994,  1995,   365,     0,  1962,
       0,  1965,     0,     0,  1999,     0,     0,     0,  2001,   230,
       0,     0,     0,     0,     0,     0,   230,     0,     0,   225,
     225,   225,   225,   515,     0,     0,     0,     0,     0,     0,
       0,     0,   229,   229,     0,     0,     0,     0,     0,   225,
       0,  2001,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1027,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1046,     0,  2038,
     225,   225,     0,     0,     0,     0,     0,   590,   590,   590,
     590,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,   625,     0,     0,   229,   225,     0,     0,
       0,     0,   365,     0,     0,     0,     0,     0,   365,     0,
       0,     0,   225,   225,     0,     0,     0,     0,   663,   225,
     225,     0,     0,   225,   225,     0,     0,     0,   230,   230,
     230,   230,     0,     0,     0,     0,     0,     0,     0,   229,
       0,     0,     0,  1046,     0,   229,     0,     0,     0,     0,
       0,   230,   230,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   667,     0,     0,     0,  1169,     0,     0,
       0,     0,     0,     0,   230,     0,     0,     0,     0,     0,
       2,   230,   230,     0,     0,   230,   230,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   365,     0,
       0,     0,   230,     0,     0,  1226,     0,     0,   230,     0,
       0,   230,     0,  1239,   229,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
     229,   229,     0,  1295,     0,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,  1321,  1325,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1048,   289,     0,     0,  1627,
       0,     0,     0,  1648,   290,     0,   291,   292,   293,   294,
       0,   663,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   225,   230,     0,   225,
     230,   230,     0,     0,   910,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   662,     0,     0,   230,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,   365,     0,     0,     0,     0,     0,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   229,     0,   667,     0,     0,     0,
       0,   225,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   225,   225,   225,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   365,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   230,     0,     0,     0,     0,     0,     0,
     230,   230,     0,     0,     0,     0,   662,     0,     0,     0,
       0,     0,   230,     0,     0,     0,   273,     0,     0,     0,
     229,   229,   274,   275,   276,     0,   230,   230,   230,     0,
       0,   225,   225,     0,   230,   277,   278,     0,     0,     0,
       0,  1075,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1048,   289,  1514,   590,  1049,     0,
     590,  1483,  1485,   290,  1489,   291,   292,   293,   294,     0,
       0,     0,  1499,     0,     0,     0,     0,   910,     0,     0,
    1508,     0,     0,   910,     0,   225,   910,  1046,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   590,     0,
       0,     0,     0,     0,     0,   230,  1046,     0,     0,     0,
       0,  1046,     0,   590,   590,   590,   590,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,     0,
       0,     0,     0,     0,   225,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1560,     0,     0,     0,
       0,     0,  1570,     0,   230,   230,   230,   230,     0,     0,
       0,     0,   365,     0,     0,   365,   365,     0,     0,  1026,
       0,     0,     0,     0,   230,  1046,     0,     0,     0,     0,
       0,     0,     0,     0,  1045,     0,     0,     0,  1050,     0,
       0,     0,     0,   225,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   230,   230,     0,     0,   225,
     225,     0,     0,     0,     0,     0,     0,     0,     0,  1046,
       0,     0,     0,     0,     0,   230,     0,     0,     0,     0,
       0,     0,   230,     0,     0,   662,   910,     0,     0,   365,
       0,     0,     0,     0,     0,     0,     0,   230,   230,  1124,
       0,     0,     0,     0,   230,   230,     0,     0,   230,   230,
    1045,  1050,     0,     0,     0,     0,     0,     0,   365,     0,
       0,     0,     0,     0,     0,  1046,     0,   365,     0,     0,
       0,     0,     0,     0,  1168,     0,     0,     0,     0,  1046,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   910,     0,   910,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1224,     0,     0,     0,     0,     0,     0,     0,
    1238,     0,     0,   225,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     0,  1046,     0,     0,     0,     0,     0,
    1293,     0,     0,     0,     0,     0,     0,     0,     0,   365,
       0,     0,     0,     0,     0,     0,     0,     0,  1319,  1323,
    1046,     0,     0,     0,  1046,     0,     0,     0,     0,     0,
     111,   117,     0,     0,     0,     0,     0,     0,     0,     0,
     910,     0,     0,     0,     0,     0,     0,     0,   662,     0,
       0,   365,     0,     0,     0,     0,     0,     0,     0,   225,
     225,     0,   161,   117,     0,     0,     0,   201,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,    82,    82,
       0,   230,     0,     0,   230,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   346,     0,     0,     0,
       0,     0,     0,   349,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   230,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   230,   479,     0,     0,
       0,   365,     0,   365,     0,     0,     0,   230,   230,   230,
     230,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   365,     0,     0,   518,   590,
     590,     0,     0,  1046,     0,  1046,     0,     0,     0,  1046,
     590,     0,     0,   910,     0,  1739,  1742,     0,  1744,     0,
     910,     0,     0,     0,   910,     0,     0,     0,  1046,     0,
    1755,     0,     0,     0,     0,     0,     0,     0,   117,     0,
       0,     0,     0,     0,     0,     0,   230,   230,     0,     0,
       0,   161,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,    82,     0,     0,     0,     0,  1482,  1484,
       0,  1488,     0,     0,     0,     0,     0,     0,     0,  1026,
    1046,     0,     0,  1050,     0,     0,     0,  1507,     0,     0,
    1046,     0,     0,     0,  1045,  1050,     0,     0,     0,     0,
       0,   268,     0,     1,   269,    97,   270,     0,   271,   272,
     230,     0,     0,  1045,  1050,     0,     0,     0,  1045,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,   230,     0,     0,     0,     0,     0,   230,
       0,     0,     0,  1559,     0,   273,   216,     0,     0,  1569,
       0,   274,   275,   276,    28,    29,   774,     0,     0,    32,
       0,     0,     0,     0,   277,   354,    38,   218,     0,     0,
       0,     0,  1045,     0,     0,   117,   365,     0,   279,   365,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   892,     0,   893,   894,   670,
       0,     0,   290,     0,   291,   292,   293,   294,   230,     0,
     848,     0,     0,   857,     0,     0,  1045,  1050,     0,     0,
     910,     0,     0,     0,   230,   230,     0,   365,     0,     0,
       0,     0,     0,   590,     0,  1046,     0,     0,     0,     0,
       0,   365,  1046,     0,     0,     0,  1744,     0,  1893,     0,
       0,     0,     0,     0,     0,     0,   365,  1900,     0,     0,
       0,     0,     0,     0,   910,     0,   910,     0,     0,     0,
       0,     0,  1045,     0,  1050,     0,   117,   117,     0,     0,
       0,     0,     0,   910,     0,     0,  1045,  1050,     0,     0,
       0,     0,     0,   518,     0,   117,     0,     0,     0,   663,
       0,     0,     0,   960,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   910,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   349,     0,     0,     0,
       0,  1045,     0,  1050,     0,     0,     0,     0,   230,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1045,     0,  1050,
       0,  1045,     0,  1050,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1954,  1957,     0,  1046,     0,  1046,     0,     0,     0,   590,
    1046,   590,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   230,   230,     0,     0,   365,     0,
       0,     0,     0,   365,   365,   365,  1115,     0,     0,     0,
    1115,     0,     0,     0,     0,     0,     0,     0,     0,   365,
     365,     0,     0,     0,  1046,   774,     0,  1046,     0,     0,
       0,     0,     0,     0,     0,   590,     0,     0,     0,     0,
       0,     0,  1819,  1823,     0,  1829,  1833,     0,     0,     0,
       0,  1838,  1842,  1846,  1850,     0,     0,     0,     0,     0,
       0,     0,     0,  1819,  1823,  1829,  1833,  1838,  1842,  1846,
    1850,  1046,     0,   365,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     910,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1045,  1050,  1045,  1050,     0,     0,  1045,  1734,     0,     0,
       0,     0,  1482,  1741,     0,  1507,     0,  1050,     0,     0,
       0,     0,     0,     0,     0,  1045,  1050,  1507,     0,   774,
    1327,     0,     0,     0,     0,   268,     0,     1,   269,    97,
     270,     0,   271,   272,   774,     0,     0,     0,     0,     0,
       0,     0,  1348,     0,     0,   774,   111,   117,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1045,  1050,     0,
       0,     0,     0,     0,     0,     0,     0,  1045,  1050,     0,
       0,     0,     0,     0,     0,     0,     0,   117,     0,   273,
       0,     0,     0,     0,  1377,   274,   275,   276,     0,     0,
     518,     0,     0,   365,   365,     0,     0,   117,   277,   278,
       0,     0,     0,     0,   365,     0,     0,   848,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1048,   289,     0,
       0,  1627,     0,     0,     0,  1652,   290,     0,   291,   292,
     293,   294,     0,     0,     0,     0,     0,     0,     0,   848,
    1616,     0,     0,     0,     0,     0,     0,     0,   910,     0,
       0,   365,   365,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     2,  1045,     0,   217,    38,   218,  1050,     0,  1045,
    1734,     0,  1050,  1507,     0,  1892,     0,  1894,     0,   219,
       0,     0,     0,  1050,  1899,  1004,  1005,  1006,   564,  1007,
    1008,  1009,  1010,   569,   570,  1011,     0,   -94,   273,     0,
       0,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,  1012,     0,     0,     0,     0,   277,   278,  1013,
       0,   574,   575,   576,     0,     0,   662,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  -468,   289,   577,     0,
    -468,     0,   220,   774,   578,   290,     0,   291,   292,   293,
     294,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     774,     0,  1115,     0,     0,     0,     0,     0,     0,     0,
    1583,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1115,     0,     0,     0,     0,     0,  1751,  1115,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1953,  1956,     0,
    1045,  1050,  1045,     2,     0,     0,     0,  1045,  1734,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     278,  1045,  1050,     0,  1045,  1734,     0,     0,     0,  2000,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1048,   289,
    1752,     0,  1049,     0,     0,     0,     0,   290,     0,   291,
     292,   293,   294,     0,     0,     0,     0,     0,  1045,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  -358,   680,     0,  -358,  -358,
    -358,  -358,   681,   682,   683,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,     0,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,     0,     0,
    -358,  -358,     0,  -358,  1663,     0,  -358,  -358,  -358,  -358,
    -358,     0,     0,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
       0,  -358,  1348,  -358,  -358,  -358,     0,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,   684,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,   685,  -358,   686,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,     0,     0,
       0,  -360,  1089,     0,  -360,  -360,  -360,  -360,  1090,  1091,
    1092,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,   518,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,     0,     0,  -360,  -360,     0,  -360,
       0,     0,  -360,  -360,  -360,  -360,  -360,     0,     0,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,     0,  -360,     0,  -360,
    -360,  -360,     0,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  1093,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  1094,  -360,  1095,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  -465,  1040,     0,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,     0,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,     0,     0,  -465,  -465,     0,  -465,
       0,     0,  -465,  -465,  -465,  -465,  -465,     0,     0,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,     0,  -465,     0,  -465,
    -465,  -465,  1663,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -301,  1042,     0,     1,   269,    97,
     270,  -301,   271,   272,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,     2,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,  -301,  -301,  -301,     0,  -301,  -301,  -301,  -301,
    -301,  -301,  -301,  -301,  -301,  -301,  -301,     0,     0,   273,
    -301,     0,  -301,     0,     0,   274,   275,   276,  -301,  -301,
       0,     0,  -301,  -301,  -301,  -301,  -301,  -301,   277,   278,
    -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,     0,
    -301,     0,   279,  -301,  -301,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -301,  -301,   288,  1136,   289,  -301,
    -301,  1044,  -301,  -301,  -301,  -301,   290,  -301,   291,   292,
     293,   294,  -301,  -301,  -301,  -301,  -301,  -302,   268,     0,
       1,   269,    97,   270,  -302,   271,   272,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,     2,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,     0,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
       0,     0,   273,  -302,     0,  -302,     0,     0,   274,   275,
     276,  -302,  -302,     0,     0,  -302,  -302,  -302,  -302,  -302,
    -302,   277,   278,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,     0,  -302,     0,   279,  -302,  -302,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -302,  -302,   288,
    1048,   289,  -302,  -302,  1049,  -302,  -302,  -302,  -302,   290,
    -302,   291,   292,   293,   294,  -302,  -302,  -302,  -302,  -302,
    -607,   268,     0,     1,   269,    97,   270,  -607,   271,   272,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,     2,  -607,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,     0,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,     0,     0,   273,  -607,     0,  -607,     0,
       0,   274,   275,   276,  -607,  -607,     0,     0,  -607,  -607,
    -607,  -607,  -607,  -607,   277,   278,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,  -607,  -607,     0,  -607,     0,   279,  -607,
    -607,     0,   280,   281,   282,   283,   284,   285,   286,   287,
    -607,  -607,   288,  -607,   289,  -607,  -607,  -607,  -607,   670,
    -607,  1221,   290,  -607,   291,   292,   293,   294,  -607,  -607,
    -607,  -607,  -607,  -608,   268,     0,     1,   269,    97,   270,
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
    -608,  -608,   670,  -608,  1292,   290,  -608,   291,   292,   293,
     294,  -608,  -608,  -608,  -608,  -608,  -623,  1042,     0,     1,
     269,    97,   270,  -623,   271,   272,  -623,  -623,  -623,  -623,
    -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,
    -623,  -623,  -623,  -623,     2,  -623,  -623,  -623,  -623,  -623,
    -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,
    -623,  -623,  -623,  -623,  -623,  -623,  -623,     0,  -623,  -623,
    -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,     0,
       0,   273,  -623,     0,  -623,     0,     0,   274,   275,   276,
    -623,  -623,     0,     0,  -623,  -623,  -623,  -623,  -623,  -623,
     277,   278,  -623,  -623,  -623,  -623,  -623,  -623,  -623,  -623,
    -623,     0,  -623,     0,   279,  -623,  -623,     0,   280,   281,
     282,   283,   284,   285,   286,   287,  -623,  -623,   288,  -623,
     289,  -623,  -623,  1044,  -623,  -623,  -623,  -623,   290,  -623,
     291,   292,   293,   294,  -623,  -623,  -623,  -623,  -623,  -625,
     268,     0,     1,   269,    97,   270,  -625,   271,   272,  -625,
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
    -625,   288,  1048,   289,  -625,  -625,  1049,  -625,  -625,  -625,
    -625,   290,  -625,   291,   292,   293,   294,  -625,  -625,  -625,
    -625,  -625,  -624,  1042,     0,     1,   269,    97,   270,  -624,
     271,   272,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
       2,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,     0,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,     0,     0,   273,  -624,     0,
    -624,     0,     0,   274,   275,   276,  -624,  -624,     0,     0,
    -624,  -624,  -624,  -624,  -624,  -624,   277,   278,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,     0,  -624,     0,
     279,  -624,  -624,     0,   280,   281,   282,   283,   284,   285,
     286,   287,  -624,  -624,   288,  -624,   289,  -624,  -624,  1044,
    -624,  -624,  -624,  -624,   290,  -624,   291,   292,   293,   294,
    -624,  -624,  -624,  -624,  -624,  -354,  1769,     0,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,     0,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,     0,     0,
    -354,  -354,     0,  -354,     0,     0,  -354,  -354,  -354,  -354,
    -354,     0,     0,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
       0,  -354,     0,  -354,  -354,  -354,     0,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,
    -354,  -354,  -354,  -354,  -354,  -354,  -354,  -354,  -347,  1812,
       0,     1,   269,    97,   270,  -347,   271,   272,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,     2,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,     0,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,     0,     0,   273,  -347,     0,  -347,     0,     0,   274,
     275,   276,  -347,  -347,     0,     0,  -347,  -347,  -347,  -347,
    -347,  -347,   277,   278,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,     0,  -347,     0,   279,  -347,  -347,     0,
     280,   281,   282,   283,   284,   285,   286,   287,  -347,  -347,
     288,  -347,   289,  -347,  -347,  -347,  -347,   670,  -347,  -347,
     290,  -347,   291,   292,   293,   294,  -347,  -347,  -347,  -347,
    -347,  -585,   268,     0,     1,   269,    97,   270,  -585,   271,
     272,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,     2,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,     0,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,     0,     0,   273,  -585,     0,  -585,
       0,     0,   274,   275,   276,  -585,  -585,     0,     0,  -585,
    -585,  -585,  -585,  -585,  -585,   277,   278,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,     0,  -585,     0,   279,
    -585,  -585,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -585,  -585,   288,  -585,   289,  -585,  -585,  -585,  -585,
     670,  -585,  -585,   290,  -585,   291,   292,   293,   294,  -585,
    -585,  -585,  -585,  -585,  -593,   268,     0,     1,   269,    97,
     270,  -593,   271,   272,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,     2,  -593,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,     0,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,     0,     0,   273,
    -593,     0,  -593,     0,     0,   274,   275,   276,  -593,  -593,
       0,     0,  -593,  -593,  -593,  -593,  -593,  -593,   277,   278,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,     0,
    -593,     0,   279,  -593,  -593,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -593,  -593,   288,  -593,   289,  -593,
    -593,  -593,  -593,   670,  -593,  -593,   290,  -593,   291,   292,
     293,   294,  -593,  -593,  -593,  -593,  -593,  -586,   268,     0,
       1,   269,    97,   270,  -586,   271,   272,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,     2,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,     0,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
       0,     0,   273,  -586,     0,  -586,     0,     0,   274,   275,
     276,  -586,  -586,     0,     0,  -586,  -586,  -586,  -586,  -586,
    -586,   277,   278,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,     0,  -586,     0,   279,  -586,  -586,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -586,  -586,   288,
    -586,   289,  -586,  -586,  -586,  -586,   670,  -586,  -586,   290,
    -586,   291,   292,   293,   294,  -586,  -586,  -586,  -586,  -586,
    -594,   268,     0,     1,   269,    97,   270,  -594,   271,   272,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,     2,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,     0,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,     0,     0,   273,  -594,     0,  -594,     0,
       0,   274,   275,   276,  -594,  -594,     0,     0,  -594,  -594,
    -594,  -594,  -594,  -594,   277,   278,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,     0,  -594,     0,   279,  -594,
    -594,     0,   280,   281,   282,   283,   284,   285,   286,   287,
    -594,  -594,   288,  -594,   289,  -594,  -594,  -594,  -594,   670,
    -594,  -594,   290,  -594,   291,   292,   293,   294,  -594,  -594,
    -594,  -594,  -594,  -347,  1835,     0,     1,   269,    97,   270,
    -347,   271,   272,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,     2,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,     0,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,     0,     0,   273,  -347,
       0,  -347,     0,     0,   274,   275,   276,  -347,  -347,     0,
       0,  -347,  -347,  -347,  -347,  -347,  -347,   277,   278,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,     0,  -347,
       0,   279,  -347,  -347,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -347,  -347,   288,  -347,   289,  -347,  -347,
    -347,  -347,   670,  -347,  -347,   290,  -347,   291,   292,   293,
     294,  -347,  -347,  -347,  -347,  -347,  -587,   268,     0,     1,
     269,    97,   270,  -587,   271,   272,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,     2,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,     0,  -587,  -587,
    -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,     0,
       0,   273,  -587,     0,  -587,     0,     0,   274,   275,   276,
    -587,  -587,     0,     0,  -587,  -587,  -587,  -587,  -587,  -587,
     277,   278,  -587,  -587,  -587,  -587,  -587,  -587,  -587,  -587,
    -587,     0,  -587,     0,   279,  -587,  -587,     0,   280,   281,
     282,   283,   284,   285,   286,   287,  -587,  -587,   288,  -587,
     289,  -587,  -587,  -587,  -587,   670,  -587,  -587,   290,  -587,
     291,   292,   293,   294,  -587,  -587,  -587,  -587,  -587,  -595,
     268,     0,     1,   269,    97,   270,  -595,   271,   272,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,     2,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
       0,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,     0,     0,   273,  -595,     0,  -595,     0,     0,
     274,   275,   276,  -595,  -595,     0,     0,  -595,  -595,  -595,
    -595,  -595,  -595,   277,   278,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,     0,  -595,     0,   279,  -595,  -595,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -595,
    -595,   288,  -595,   289,  -595,  -595,  -595,  -595,   670,  -595,
    -595,   290,  -595,   291,   292,   293,   294,  -595,  -595,  -595,
    -595,  -595,  -588,   268,     0,     1,   269,    97,   270,  -588,
     271,   272,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
       2,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,     0,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,     0,     0,   273,  -588,     0,
    -588,     0,     0,   274,   275,   276,  -588,  -588,     0,     0,
    -588,  -588,  -588,  -588,  -588,  -588,   277,   278,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,     0,  -588,     0,
     279,  -588,  -588,     0,   280,   281,   282,   283,   284,   285,
     286,   287,  -588,  -588,   288,  -588,   289,  -588,  -588,  -588,
    -588,   670,  -588,  -588,   290,  -588,   291,   292,   293,   294,
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
    -596,  -596,  -596,  -596,   670,  -596,  -596,   290,  -596,   291,
     292,   293,   294,  -596,  -596,  -596,  -596,  -596,  -356,  1913,
       0,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,     0,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,     0,     0,  -356,  -356,     0,  -356,     0,     0,  -356,
    -356,  -356,  -356,  -356,     0,     0,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,     0,  -356,     0,  -356,  -356,  -356,     0,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -355,  1914,     0,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,     0,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,     0,     0,  -355,  -355,     0,  -355,
       0,     0,  -355,  -355,  -355,  -355,  -355,     0,     0,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,     0,  -355,     0,  -355,
    -355,  -355,     0,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -347,  1915,     0,     1,   269,    97,
     270,  -347,   271,   272,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,     2,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,     0,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,     0,     0,   273,
    -347,     0,  -347,     0,     0,   274,   275,   276,  -347,  -347,
       0,     0,  -347,  -347,  -347,  -347,  -347,  -347,   277,   278,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,     0,
    -347,     0,   279,  -347,  -347,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -347,  -347,   288,  -347,   289,  -347,
    -347,  -347,  -347,   670,  -347,  -347,   290,  -347,   291,   292,
     293,   294,  -347,  -347,  -347,  -347,  -347,  -347,  1916,     0,
       1,   269,    97,   270,  -347,   271,   272,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,     2,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,     0,  -347,
    -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
       0,     0,   273,  -347,     0,  -347,     0,     0,   274,   275,
     276,  -347,  -347,     0,     0,  -347,  -347,  -347,  -347,  -347,
    -347,   277,   278,  -347,  -347,  -347,  -347,  -347,  -347,  -347,
    -347,  -347,     0,  -347,     0,   279,  -347,  -347,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -347,  -347,   288,
    -347,   289,  -347,  -347,  -347,  -347,   670,  -347,  -347,   290,
    -347,   291,   292,   293,   294,  -347,  -347,  -347,  -347,  -347,
    -358,   680,     0,  -358,  -358,  -358,  -358,   681,   682,   683,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,     0,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,     0,     0,  -358,  -358,     0,  -358,     0,
       0,  -358,  -358,  -358,  -358,  -358,     0,     0,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,     0,  -358,     0,  -358,  -358,
    -358,     0,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,   684,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    1038,  -358,   686,     0,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,   680,     0,     0,     0,     0,     0,   681,
     682,   683,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -358,     0,
       0,     0,     0,     0,     0,     0,  -358,  -358,     0,     0,
       0,  -358,     0,     0,     0,     0,     0,  -358,  -358,  -358,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  -358,     0,     0,     0,     0,     0,     0,     0,
       0,  -358,  -358,  -358,   684,     0,     0,  -358,  1436,  -358,
    -358,     0,   685,     0,   686,     0,  -358,  -358,  -358,     0,
    -358,  -358,  -358,  -358,  -358,  -465,  1040,     0,  -465,  -465,
    -465,  -465,     0,  -465,  -465,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,     0,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,     0,     0,
    -465,  -465,     0,  -465,     0,     0,  -465,  -465,  -465,  -465,
    -465,     0,     0,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,  -465,
       0,  -465,     0,  -465,  -465,  -465,     0,  -465,  -465,  -465,
    -465,  -465,  -465,  -465,  -465,     0,     0,  -465,  -465,  -465,
    -465,     0,  -465,  -465,  -465,  1041,  -465,  -465,     0,  -465,
    -465,  -465,  -465, -1062,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1062, -1062, -1062, -1062, -1062, -1062, -1062, -1062,
   -1062, -1062, -1062, -1062, -1062, -1062, -1062, -1062, -1062, -1062,
   -1062, -1062, -1062, -1062,     0, -1062, -1062, -1062, -1062, -1062,
   -1062, -1062, -1062, -1062, -1062, -1062,     0,     0,   273, -1062,
       0, -1062,     0,     0,   274,   275,   276, -1062, -1062,     0,
       0, -1062, -1062, -1062, -1062, -1062, -1062,   277,   278, -1062,
   -1062, -1062, -1062, -1062, -1062, -1062, -1062, -1062,     0, -1062,
       0,   279, -1062, -1062,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1048,   289, -1062,     0,
    1049, -1062, -1062,     0, -1062,   290,     0,   291,   292,   293,
     294, -1198,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
   -1198, -1198, -1198, -1198, -1198, -1198, -1198, -1198, -1198, -1198,
   -1198, -1198, -1198, -1198, -1198, -1198, -1198, -1198, -1198, -1198,
   -1198, -1198,     0, -1198, -1198, -1198, -1198, -1198, -1198, -1198,
   -1198, -1198, -1198, -1198,     0,     0,   273, -1198,     0, -1198,
       0,     0,   274,   275,   276, -1198, -1198,     0,     0, -1198,
   -1198, -1198, -1198, -1198, -1198,   277,   278, -1198, -1198, -1198,
   -1198, -1198, -1198, -1198, -1198, -1198,     0, -1198,     0,   279,
   -1198, -1198,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1048,   289,  1514,     0,  1049, -1198,
   -1198,     0, -1198,   290,     0,   291,   292,   293,   294, -1153,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1153, -1153,
   -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153,
   -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153,
       0, -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153, -1153,
   -1153, -1153,     0,     0,   273, -1153,     0, -1153,     0,     0,
     274,   275,   276, -1153, -1153,     0,     0, -1153, -1153, -1153,
   -1153, -1153, -1153,   277,   278, -1153, -1153, -1153, -1153, -1153,
   -1153, -1153, -1153, -1153,     0, -1153,     0,   279, -1153, -1153,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1727,   289, -1153,     0,  1049, -1153, -1153,     0,
   -1153,   290,     0,   291,   292,   293,   294, -1186,  1733,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1186, -1186, -1186, -1186,
   -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186,
   -1186, -1186, -1186, -1186, -1186, -1186, -1186, -1186,     0,   561,
     562,   563,   564,   565,   566,   567,   568,   569,   570,   571,
       0,     0,   273, -1186,     0, -1186,     0,     0,   274,   275,
     276, -1186, -1186,     0,     0, -1186,  1012, -1186, -1186, -1186,
   -1186,   277,   278,  1013, -1186,   574,   575,   576, -1186, -1186,
   -1186, -1186,     0, -1186,     0,   279, -1186, -1186,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1048,   289,   577,     0,  1049, -1186,   220,     0,   578,   290,
       0,   291,   292,   293,   294,  -624,  1042,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,     0,  -624,  -624,  -624,
    -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,     0,     0,
     273,  -624,     0,  -624,     0,     0,   274,   275,   276,  -624,
    -624,     0,     0,  -624,  -624,  -624,  -624,  -624,  -624,   277,
     278,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,  -624,
       0,  -624,     0,   279,  -624,  -624,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  -624,   289,
    1043,     0,  1044,  -624,  -624,     0,  -624,   290,     0,   291,
     292,   293,   294, -1177,  1042,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177,
   -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177,
   -1177, -1177, -1177, -1177,     0, -1177, -1177, -1177, -1177, -1177,
   -1177, -1177, -1177, -1177, -1177, -1177,     0,     0,   273, -1177,
       0, -1177,     0,     0,   274,   275,   276, -1177, -1177,     0,
       0, -1177, -1177, -1177, -1177, -1177, -1177,   277,   278, -1177,
   -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177,     0, -1177,
       0,   279, -1177, -1177,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1958,   289, -1177,     0,
    1044, -1177, -1177,     0, -1177,   290,     0,   291,   292,   293,
     294, -1178,   268,     0,     1,   269,    97,   270,     0,   271,
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
     287,     0,     0,   288,  1048,   289,  1959,     0,  1049, -1178,
   -1178,     0, -1178,   290,     0,   291,   292,   293,   294, -1172,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1172, -1172,
   -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172,
   -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172, -1172,
       0,   561,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,     0,     0,   273, -1172,     0, -1172,     0,     0,
     274,   275,   276, -1172, -1172,     0,     0, -1172,  1012, -1172,
   -1172, -1172, -1172,   277,   278,  1013, -1172,   574,   575,   576,
   -1172, -1172, -1172, -1172,     0, -1172,     0,   279, -1172, -1172,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1048,   289,   577,     0,  1049, -1172,   220,     0,
     578,   290,     0,   291,   292,   293,   294, -1119,   552,     0,
   -1119, -1119, -1119, -1119,     0, -1119, -1119,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0, -1119, -1119, -1119, -1119, -1119,
   -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119,
   -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119,     0, -1119,
   -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119,
       0,     0, -1119, -1119,     0, -1119,     0,     0, -1119, -1119,
   -1119, -1119, -1119,     0,     0, -1119, -1119, -1119, -1119, -1119,
   -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119, -1119,
   -1119, -1119,     0, -1119,     0, -1119, -1119, -1119,     0, -1119,
   -1119, -1119, -1119, -1119, -1119, -1119, -1119,     0,     0, -1119,
       0, -1119,   553,     0, -1119, -1119, -1119,     0, -1119, -1119,
       0, -1119, -1119, -1119, -1119, -1142,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   561,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,     0,     0,
     273,   216,     0, -1142,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1142,   572, -1142, -1142, -1142, -1142,   277,
     354,   573,   218,   574,   575,   576, -1142, -1142, -1142, -1142,
       0, -1142,     0,   279, -1142,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     577,     0, -1142, -1142,   220,     0,   578,   290,     0,   291,
     292,   293,   294, -1120,   552,     0, -1120, -1120, -1120, -1120,
       0, -1120, -1120,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120,     0, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120, -1120, -1120,     0,     0, -1120, -1120,
       0, -1120,     0,     0, -1120, -1120, -1120, -1120, -1120,     0,
       0, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120, -1120, -1120, -1120, -1120, -1120,     0, -1120,
       0, -1120, -1120, -1120,     0, -1120, -1120, -1120, -1120, -1120,
   -1120, -1120, -1120,     0,     0, -1120,     0, -1120,   553,     0,
   -1120, -1120, -1120,     0, -1120, -1120,     0, -1120, -1120, -1120,
   -1120, -1182,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
   -1182, -1182, -1182, -1182, -1182, -1182, -1182, -1182, -1182, -1182,
   -1182, -1182, -1182, -1182, -1182, -1182, -1182, -1182, -1182, -1182,
   -1182, -1182,     0,  1004,  1005,  1006,   564,  1007,  1008,  1009,
    1010,   569,   570,  1011,     0,     0,   273, -1182,     0, -1182,
       0,     0,   274,   275,   276, -1182, -1182,     0,     0, -1182,
    1012, -1182, -1182, -1182, -1182,   277,   278,  1013, -1182,   574,
     575,   576, -1182, -1182, -1182, -1182,     0, -1182,     0,   279,
   -1182, -1182,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   577,     0, -1182, -1182,
     220,     0,   578,   290,     0,   291,   292,   293,   294, -1200,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1200, -1200,
   -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200,
   -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200,
       0, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200, -1200,
   -1200, -1200,     0,     0,   273, -1200,     0, -1200,     0,     0,
     274,   275,   276, -1200, -1200,     0,     0, -1200, -1200, -1200,
   -1200, -1200, -1200,   277,   278, -1200, -1200, -1200, -1200, -1200,
   -1200, -1200, -1200, -1200,     0, -1200,     0,   279, -1200, -1200,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1023,     0, -1200, -1200,   670,     0,
   -1200,   290,     0,   291,   292,   293,   294, -1132,  1051,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,   561,
     562,   563,   564,   565,   566,   567,   568,   569,   570,   571,
       0,     0,   273,   216,     0, -1132,     0,     0,   274,   275,
     276,    28,    29,     0,     0, -1132,   572, -1132, -1132, -1132,
   -1132,   277,   354,   573,   218,   574,   575,   576, -1132, -1132,
   -1132, -1132,     0, -1132,     0,   279, -1132,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   577,     0, -1132, -1132,   220,     0,   578,   290,
       0,   291,   292,   293,   294, -1136,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   561,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,     0,     0,
     273,   216,     0, -1136,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1136,   572, -1136, -1136, -1136, -1136,   277,
     354,   573,   218,   574,   575,   576, -1136, -1136, -1136, -1136,
       0, -1136,     0,   279, -1136,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     577,     0, -1136, -1136,   220,     0,   578,   290,     0,   291,
     292,   293,   294, -1131,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,   561,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,     0,     0,   273,   216,
       0, -1131,     0,     0,   274,   275,   276,    28,    29,     0,
       0, -1131,   572, -1131, -1131, -1131, -1131,   277,   354,   573,
     218,   574,   575,   576, -1131, -1131, -1131, -1131,     0, -1131,
       0,   279, -1131,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   577,     0,
   -1131, -1131,   220,     0,   578,   290,     0,   291,   292,   293,
     294, -1135,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   561,   562,   563,   564,   565,   566,   567,
     568,   569,   570,   571,     0,     0,   273,   216,     0, -1135,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1135,
     572, -1135, -1135, -1135, -1135,   277,   354,   573,   218,   574,
     575,   576, -1135, -1135, -1135, -1135,     0, -1135,     0,   279,
   -1135,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   577,     0, -1135, -1135,
     220,     0,   578,   290,     0,   291,   292,   293,   294, -1049,
    1064,     0, -1049, -1049, -1049, -1049,     0, -1049, -1049,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0, -1049, -1049, -1049,
   -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049,
   -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049,
       0, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049,
   -1049, -1049,     0,     0, -1049, -1049,     0, -1049,     0,     0,
   -1049, -1049, -1049, -1049, -1049,     0,     0, -1049, -1049, -1049,
   -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049,
   -1049, -1049, -1049, -1049,     0, -1049,     0, -1049, -1049, -1049,
       0, -1049, -1049, -1049, -1049, -1049, -1049, -1049, -1049,     0,
       0, -1049,     0, -1049, -1049,     0, -1049, -1049, -1049,     0,
   -1049, -1049,     0, -1049, -1049, -1049, -1049, -1051,  1065,     0,
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
       0, -1051, -1051, -1051, -1051, -1091,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1091, -1091, -1091, -1091, -1091, -1091,
   -1091, -1091, -1091, -1091, -1091, -1091, -1091, -1091, -1091, -1091,
   -1091, -1091, -1091, -1091, -1091, -1091,     0,   561,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,     0,     0,
     273, -1091,     0, -1091,     0,     0,   274,   275,   276, -1091,
   -1091,     0,     0, -1091,  1012, -1091, -1091, -1091, -1091,   277,
     278,  1013, -1091,   574,   575,   576, -1091, -1091, -1091, -1091,
       0, -1091,     0,   279, -1091, -1091,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     577,     0, -1091, -1091,   220,     0,   578,   290,     0,   291,
     292,   293,   294, -1093,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093,
   -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093, -1093,
   -1093, -1093, -1093, -1093,     0,   561,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,     0,     0,   273, -1093,
       0, -1093,     0,     0,   274,   275,   276, -1093, -1093,     0,
       0, -1093,  1012, -1093, -1093, -1093, -1093,   277,   278,  1013,
   -1093,   574,   575,   576, -1093, -1093, -1093, -1093,     0, -1093,
       0,   279, -1093, -1093,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   577,     0,
   -1093, -1093,   220,     0,   578,   290,     0,   291,   292,   293,
     294, -1133,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   561,   562,   563,   564,   565,   566,   567,
     568,   569,   570,   571,     0,     0,   273,   216,     0, -1133,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1133,
     572, -1133, -1133, -1133, -1133,   277,   354,   573,   218,   574,
     575,   576, -1133, -1133, -1133, -1133,     0, -1133,     0,   279,
   -1133,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   577,     0, -1133, -1133,
     220,     0,   578,   290,     0,   291,   292,   293,   294, -1137,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,   561,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,     0,     0,   273,   216,     0, -1137,     0,     0,
     274,   275,   276,    28,    29,     0,     0, -1137,   572, -1137,
   -1137, -1137, -1137,   277,   354,   573,   218,   574,   575,   576,
   -1137, -1137, -1137, -1137,     0, -1137,     0,   279, -1137,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   577,     0, -1137, -1137,   220,     0,
     578,   290,     0,   291,   292,   293,   294, -1134,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,   561,
     562,   563,   564,   565,   566,   567,   568,   569,   570,   571,
       0,     0,   273,   216,     0, -1134,     0,     0,   274,   275,
     276,    28,    29,     0,     0, -1134,   572, -1134, -1134, -1134,
   -1134,   277,   354,   573,   218,   574,   575,   576, -1134, -1134,
   -1134, -1134,     0, -1134,     0,   279, -1134,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   577,     0, -1134, -1134,   220,     0,   578,   290,
       0,   291,   292,   293,   294, -1138,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   561,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,     0,     0,
     273,   216,     0, -1138,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1138,   572, -1138, -1138, -1138, -1138,   277,
     354,   573,   218,   574,   575,   576, -1138, -1138, -1138, -1138,
       0, -1138,     0,   279, -1138,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     577,     0, -1138, -1138,   220,     0,   578,   290,     0,   291,
     292,   293,   294, -1129,   552,     0, -1129, -1129, -1129, -1129,
       0, -1129, -1129,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129,
   -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129,
   -1129, -1129, -1129, -1129,     0, -1129, -1129, -1129, -1129, -1129,
   -1129, -1129, -1129, -1129, -1129, -1129,     0,     0, -1129, -1129,
       0, -1129,     0,     0, -1129, -1129, -1129, -1129, -1129,     0,
       0, -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129,
   -1129, -1129, -1129, -1129, -1129, -1129, -1129, -1129,     0, -1129,
       0, -1129, -1129, -1129,     0, -1129, -1129, -1129, -1129, -1129,
   -1129, -1129, -1129,     0,     0, -1129,     0, -1129,   553,     0,
   -1129, -1129, -1129,     0, -1129, -1129,     0, -1129, -1129, -1129,
   -1129, -1130,   552,     0, -1130, -1130, -1130, -1130,     0, -1130,
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
   -1130,     0,     0, -1130,     0, -1130,   553,     0, -1130, -1130,
   -1130,     0, -1130, -1130,     0, -1130, -1130, -1130, -1130,  -979,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,  -979,  -979,
    -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,
    -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,
       0,  -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,  -979,
    -979,  -979,     0,     0,   273,  -979,     0,  -979,     0,     0,
     274,   275,   276,  -979,  -979,     0,     0,  -979,  -979,  -979,
    -979,  -979,  -979,   277,   278,  -979,  -979,  -979,  -979,  -979,
    -979,  -979,  -979,  -979,     0,  -979,     0,   279,  -979,  -979,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  -979,     0,  1706,  1707,   918,     0,
    -979,   290,     0,   291,   292,   293,   294,  -981,   268,     0,
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
       0,   289,  -981,     0,  -981,  1874,   918,     0,  -981,   290,
       0,   291,   292,   293,   294,  -975,  1877,     0,  -975,  -975,
    -975,  -975,     0,  -975,  -975,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -975,  -975,  -975,  -975,  -975,  -975,  -975,
    -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,
    -975,  -975,  -975,  -975,  -975,  -975,     0,  -975,  -975,  -975,
    -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,     0,     0,
    -975,  -975,     0,  -975,     0,     0,  -975,  -975,  -975,  -975,
    -975,     0,     0,  -975,  -975,  -975,  -975,  -975,  -975,  -975,
    -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,  -975,
       0,  -975,     0,  -975,  -975,  -975,     0,  -975,  -975,  -975,
    -975,  -975,  -975,  -975,  -975,     0,     0,  -975,     0,  -975,
    -975,     0,  -975,  -975,  -975,     0,  -975,  -975,     0,  -975,
    -975,  -975,  -975, -1179,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179,     0, -1179, -1179, -1179, -1179, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179,     0,     0,   273, -1179,
       0, -1179,     0,     0,   274,   275,   276, -1179, -1179,     0,
       0, -1179, -1179, -1179, -1179, -1179, -1179,   277,   278, -1179,
   -1179, -1179, -1179, -1179, -1179, -1179, -1179, -1179,     0, -1179,
       0,   279, -1179, -1179,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289, -1179,     0,
   -1179, -1179, -1179,     0, -1179,   290,     0,   291,   292,   293,
     294,  -976,  1950,     0,  -976,  -976,  -976,  -976,     0,  -976,
    -976,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,     0,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,  -976,  -976,     0,     0,  -976,  -976,     0,  -976,
       0,     0,  -976,  -976,  -976,  -976,  -976,     0,     0,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,  -976,  -976,  -976,  -976,  -976,     0,  -976,     0,  -976,
    -976,  -976,     0,  -976,  -976,  -976,  -976,  -976,  -976,  -976,
    -976,     0,     0,  -976,     0,  -976,  -976,     0,  -976,  -976,
    -976,     0,  -976,  -976,     0,  -976,  -976,  -976,  -976,  -905,
     521,     0,  -905,  -905,  -905,  -905,     0,  -905,  -905,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  -905,  -905,  -905,
    -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,
    -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,
       0,     0,  -905,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -905,  -905,     0,  -905,     0,     0,
    -905,  -905,  -905,  -905,  -905,     0,     0,  -905,  -905,  -905,
    -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,     0,     0,
    -905,  -905,  -905,  -905,     0,  -905,     0,  -905,  -905,  -905,
       0,  -905,  -905,  -905,  -905,  -905,  -905,  -905,  -905,     0,
       0,  -905,   522,  -905,  -905,     0,   523,  -905,  -905,     0,
       0,  -905,     0,  -905,  -905,  -905,  -905,  1144,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   354,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   892,     0,   893,  -109,   670,     0,     0,   290,     0,
     291,   292,   293,   294,  1151,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   354,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   892,     0,
     893,   -97,   670,     0,     0,   290,     0,   291,   292,   293,
     294,  1155,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   354,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   892,     0,   893,  -101,   670,
       0,     0,   290,     0,   291,   292,   293,   294,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   354,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,  1420,     0,   893,   -64,   670,     0,     0,   290,
       0,   291,   292,   293,   294,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   354,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1429,
       0,   893,  1430,   670,     0,     0,   290,     0,   291,   292,
     293,   294,  1473,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   354,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   892,     0,   893,   -80,
     670,     0,     0,   290,     0,   291,   292,   293,   294,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,   216,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   277,   354,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,  1429,     0,   893,  -106,   670,     0,     0,
     290,     0,   291,   292,   293,   294,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,   216,     0,     0,     0,     0,   274,   275,   276,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,   277,
     354,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1429,     0,   893,   -96,   670,     0,     0,   290,     0,   291,
     292,   293,   294,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   354,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1429,     0,   893,
    -100,   670,     0,     0,   290,     0,   291,   292,   293,   294,
    1671,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   354,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   892,     0,   893,   -87,   670,     0,
       0,   290,     0,   291,   292,   293,   294,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   354,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  1429,     0,   893,   -77,   670,     0,     0,   290,     0,
     291,   292,   293,   294,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   354,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,  1429,     0,
     893,   -84,   670,     0,     0,   290,     0,   291,   292,   293,
     294,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   354,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,   268,   289,     1,   269,    97,   270,     0,
     271,   272,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   776,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   354,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,   268,   289,     1,   269,    97,
     270,     0,   271,   272,   290,     0,   291,   292,   293,   294,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,   277,   379,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,    40,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,   660,   289,     0,
       0,     0,     0,     0,     0,     0,   290,     0,   291,   292,
     293,   294,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1077,    27,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,   277,   379,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,    40,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   637,   660,   289,     0,     0,     0,     0,
       0,     0,     0,   290,     0,   291,   292,   293,   294,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,   277,   379,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,    40,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,   268,   289,     1,   269,    97,   270,   220,   271,   272,
     290,     0,   291,   292,   293,   294,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,   277,   379,    38,    39,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   279,     0,
      40,     0,   280,   281,   282,   283,   284,   285,   286,   799,
       0,     0,   800,   660,   289,     2,     0,     0,     0,     0,
       0,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1004,
    1005,  1006,   564,  1007,  1008,  1009,  1010,   569,   570,  1011,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,     0,     0,     0,     0,     0,  1012,     0,     0,     0,
       0,   277,   278,  1013,     0,   574,   575,   576,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1048,   289,   577,     0,  1049,     0,   220,     0,   578,   290,
       0,   291,   292,   293,   294,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1004,  1005,  1006,   564,
    1007,  1008,  1009,  1010,   569,   570,  1011,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,  1012,     0,     0,     0,     0,   277,   278,
    1013,     0,   574,   575,   576,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   577,
       0,     0,     0,   220,     0,   578,   290,     0,   291,   292,
     293,   294,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   561,   562,   563,   564,   565,   566,   567,
     568,   569,   570,   571,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
    1012,     0,     0,     0,     0,   277,   278,  1013,     0,   574,
     575,   576,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   577,     0,     0,     0,
     220,     0,   578,   290,     0,   291,   292,   293,   294,  1730,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1004,  1005,  1006,   564,  1007,  1008,  1009,  1010,   569,   570,
    1011,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,  1012,     0,     0,
       0,     0,   277,   278,  1013,     0,   574,   575,   576,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   577,     0,     0,     0,   220,     0,   578,
     290,     0,   291,   292,   293,   294,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1048,   289,
       0,     0,  1049,     0,     0,     0,     0,   290,  1774,   291,
     292,   293,   294,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1048,   289,     0,     0,  1049,     0,     0,     0,     0,
     290,  1778,   291,   292,   293,   294,     0,     0,     0,     0,
    1896,     0,     1,   269,    97,   270,   273,   271,   272,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,   278,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1048,   289,  1752,     0,  1049,     0,
       0,     0,     0,   290,   273,   291,   292,   293,   294,     0,
     274,   275,   276,  1042,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1048,   289,  1752,     0,  1049,     0,     0,     0,
       0,   290,     0,   291,   292,   293,   294,     0,     0,     0,
       0,   268,     0,     1,   269,    97,   270,   273,   271,   272,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   278,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1960,   289,  1961,     0,  1044,
       0,     0,     0,     0,   290,   273,   291,   292,   293,   294,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1989,  1990,   918,
       0,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,  1042,     0,     1,   269,    97,   270,   273,   271,
     272,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1048,   289,  1959,     0,
    1049,     0,     0,     0,     0,   290,   273,   291,   292,   293,
     294,     0,   274,   275,   276,  1160,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,  1043,     0,  1044,     0,
       0,     0,     0,   290,     0,   291,   292,   293,   294,     0,
       0,     0,     0,  1232,     0,     1,   269,    97,   270,   273,
     271,   272,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   277,   278,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1161,   289,     0,
       0,     0,     0,   670,     0,     0,   290,   273,   291,   292,
     293,   294,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1233,   289,     0,     0,     0,
       0,   670,     0,     0,   290,     0,   291,   292,   293,   294,
       0,     0,     0,     0,   268,     0,     1,   269,    97,   270,
     273,   271,   272,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     278,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1023,     0,     0,     0,   670,     0,     0,   290,   273,   291,
     292,   293,   294,     0,   274,   275,   276,  1503,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1048,   289,     0,     0,
    1049,     0,     0,     0,     0,   290,     0,   291,   292,   293,
     294,     0,     0,     0,     0,  1042,     0,     1,   269,    97,
     270,   273,   271,   272,     0,     0,     0,   274,   275,   276,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   278,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1504,
     289,  1505,     0,     0,     0,     0,     0,     0,   290,   273,
     291,   292,   293,   294,     0,   274,   275,   276,  1553,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1513,
       0,  1044,     0,     0,     0,     0,   290,     0,   291,   292,
     293,   294,     0,     0,     0,     0,  1563,     0,     1,   269,
      97,   270,   273,   271,   272,     0,     0,     0,   274,   275,
     276,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   277,   278,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1554,   289,     0,     0,     0,     0,   670,     0,     0,   290,
     273,   291,   292,   293,   294,     0,   274,   275,   276,  1042,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1564,   289,
       0,     0,     0,     0,   670,     0,     0,   290,     0,   291,
     292,   293,   294,     0,     0,     0,     0,  1042,     0,     1,
     269,    97,   270,   273,   271,   272,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   277,   278,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1596,   289,     0,     0,  1044,     0,     0,     0,     0,
     290,   273,   291,   292,   293,   294,     0,   274,   275,   276,
    1042,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,  1044,     0,     0,     0,     0,   290,  1621,
     291,   292,   293,   294,     0,     0,     0,     0,  1042,     0,
       1,   269,    97,   270,   273,   271,   272,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   277,   278,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,  1624,     0,     0,     0,
    1625,   290,   273,   291,   292,   293,   294,     0,   274,   275,
     276,  1042,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,  1044,     0,     0,     0,     0,   290,
    1632,   291,   292,   293,   294,     0,     0,     0,     0,  1042,
       0,     1,   269,    97,   270,   273,   271,   272,     0,     0,
       0,   274,   275,   276,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   277,   278,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1624,     0,     0,
       0,  1634,   290,   273,   291,   292,   293,   294,     0,   274,
     275,   276,  1042,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,  1624,     0,     0,     0,  1646,
     290,     0,   291,   292,   293,   294,     0,     0,     0,     0,
    1042,     0,     1,   269,    97,   270,   273,   271,   272,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,   278,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,  1624,     0,
       0,     0,  1650,   290,   273,   291,   292,   293,   294,     0,
     274,   275,   276,  1042,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1726,   289,     0,     0,  1044,     0,     0,     0,
       0,   290,     0,   291,   292,   293,   294,     0,     0,     0,
       0,   268,     0,     1,   269,    97,   270,   273,   271,   272,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   278,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1728,   289,     0,     0,  1044,
       0,     0,     0,     0,   290,   273,   291,   292,   293,   294,
       0,   274,   275,   276,  1042,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1729,   289,     0,     0,  1049,     0,     0,
       0,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,   268,     0,     1,   269,    97,   270,   273,   271,
     272,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1732,   289,     0,     0,
    1044,     0,     0,     0,     0,   290,   273,   291,   292,   293,
     294,     0,   274,   275,   276,  1042,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1504,   289,  1505,     0,     0,     0,
       0,     0,     0,   290,     0,   291,   292,   293,   294,     0,
       0,     0,     0,  1753,     0,     1,   269,    97,   270,   273,
     271,   272,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   277,   278,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1750,
       0,  1044,     0,     0,     0,     0,   290,   273,   291,   292,
     293,   294,     0,   274,   275,   276,  1042,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1754,   289,  1505,     0,     0,
       0,     0,     0,     0,   290,     0,   291,   292,   293,   294,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1042,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,  1044,     0,     0,     0,     0,   290,  1773,   291,
     292,   293,   294,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,  1044,     0,     0,     0,     0,
     290,  1777,   291,   292,   293,   294,     0,     0,     0,     0,
    1042,     0,     1,   269,    97,   270,   273,   271,   272,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,   278,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1727,   289,     0,     0,  1049,     0,
       0,     0,     0,   290,   273,   291,   292,   293,   294,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1888,   289,     0,     0,  1044,     0,     0,     0,
       0,   290,     0,   291,   292,   293,   294,     0,     0,     0,
       0,  1042,     0,     1,   269,    97,   270,   273,   271,   272,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   278,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1754,   289,  1505,     0,     0,
       0,     0,     0,     0,   290,   273,   291,   292,   293,   294,
       0,   274,   275,   276,  1042,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1964,   289,     0,     0,  1044,     0,     0,
       0,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,  1042,     0,     1,   269,    97,   270,   273,   271,
     272,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1996,   289,     0,     0,
    1044,     0,     0,     0,     0,   290,   273,   291,   292,   293,
     294,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1997,   289,     0,     0,  1044,     0,
       0,     0,     0,   290,     0,   291,   292,   293,   294,     0,
       0,     0,     0,  1042,     0,     1,   269,    97,   270,   273,
     271,   272,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   277,   278,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,  2024,   918,     0,     0,   290,   273,   291,   292,
     293,   294,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  2025,   289,     0,     0,  1044,
       0,     0,     0,     0,   290,     0,   291,   292,   293,   294,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   492,   291,
     292,   293,   294,     0,     0,     0,     0,   917,     0,     1,
     269,    97,   270,   273,   271,   272,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   277,   278,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   670,     0,     0,
     290,   273,   291,   292,   293,   294,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,   918,     0,     0,   290,     0,
     291,   292,   293,   294,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   954,   291,   292,   293,   294,     0,     0,     0,
       0,   268,     0,     1,   269,    97,   270,   273,   271,   272,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   278,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,     0,     0,   996,   290,   273,   291,   292,   293,   294,
       0,   274,   275,   276,  1195,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,   660,   289,     0,     0,     0,     0,     0,
       0,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,  1200,     0,     1,   269,    97,   270,   273,   271,
     272,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,   670,     0,     0,   290,   273,   291,   292,   293,
     294,     0,   274,   275,   276,  1266,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     670,     0,     0,   290,     0,   291,   292,   293,   294,     0,
       0,     0,     0,  1271,     0,     1,   269,    97,   270,   273,
     271,   272,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   277,   278,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,   670,     0,     0,   290,   273,   291,   292,
     293,   294,     0,   274,   275,   276,  1367,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,   670,     0,     0,   290,     0,   291,   292,   293,   294,
       0,     0,     0,     0,   268,     0,     1,   269,    97,   270,
     273,   271,   272,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     278,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,   670,     0,     0,   290,   273,   291,
     292,   293,   294,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,   918,     0,     0,   290,     0,   291,   292,   293,
     294,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1486,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,  1459,
     291,   292,   293,   294,     0,     0,     0,     0,   268,     0,
       1,   269,    97,   270,   273,   271,   272,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   277,   278,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1487,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   273,   291,   292,   293,   294,     0,   274,   275,
     276,  1523,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,     0,     0,     0,     0,  1490,   290,
       0,   291,   292,   293,   294,     0,     0,     0,     0,  1532,
       0,     1,   269,    97,   270,   273,   271,   272,     0,     0,
       0,   274,   275,   276,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   277,   278,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,   670,
       0,     0,   290,   273,   291,   292,   293,   294,     0,   274,
     275,   276,  1696,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   670,     0,     0,
     290,     0,   291,   292,   293,   294,     0,     0,     0,     0,
    1699,     0,     1,   269,    97,   270,   273,   271,   272,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,   278,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     670,     0,     0,   290,   273,   291,   292,   293,   294,     0,
     274,   275,   276,  1703,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,   670,     0,
       0,   290,     0,   291,   292,   293,   294,     0,     0,     0,
       0,   268,     0,     1,   269,    97,   270,   273,   271,   272,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   278,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,   670,     0,     0,   290,   273,   291,   292,   293,   294,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1740,   289,     0,     0,     0,     0,     0,
       0,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,  1529,     0,     1,   269,    97,   270,   273,   271,
     272,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,  1798,     0,   289,     0,     0,
       0,     0,  1799,     0,     0,   290,   273,   291,   292,   293,
     294,     0,   274,   275,   276,  1535,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
     670,     0,     0,   290,     0,   291,   292,   293,   294,     0,
       0,     0,     0,  1897,     0,     1,   269,    97,   270,   273,
     271,   272,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   277,   278,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,   670,     0,     0,   290,   273,   291,   292,
     293,   294,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1898,   289,     0,     0,     0,
       0,     0,     0,     0,   290,     0,   291,   292,   293,   294,
       0,     0,     0,     0,   268,     0,     1,   269,    97,   270,
     273,   271,   272,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     278,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1955,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   273,   291,
     292,   293,   294,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,  1799,     0,     0,   290,     0,   291,   292,   293,
     294,     0,     0,     0,     0,   627,     0,     1,   269,    97,
     270,   273,   271,   272,     0,     0,     0,   274,   275,   276,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   278,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   273,
     291,   292,   293,   294,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   628,     0,   289,     0,
       0,     0,     0,     0,     0,     0,   290,     0,   291,   292,
     293,   294,     0,     0,     0,     0,  1179,     0,     1,   269,
      97,   270,   273,   271,   272,     0,     0,     0,   274,   275,
     276,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   277,   278,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   637,
       0,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     273,   291,   292,   293,   294,     0,   274,   275,   276,  1182,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,     0,     0,     0,   290,     0,   291,
     292,   293,   294,     0,     0,     0,     0,  1248,     0,     1,
     269,    97,   270,   273,   271,   272,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   277,   278,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,     0,     0,     0,
     290,   273,   291,   292,   293,   294,     0,   274,   275,   276,
    1251,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,     0,
     291,   292,   293,   294,     0,     0,     0,     0,  1529,     0,
       1,   269,    97,   270,   273,   271,   272,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   277,   278,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   273,   291,   292,   293,   294,     0,   274,   275,
     276,  1535,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,     0,     0,     0,     0,     0,   290,
       0,   291,   292,   293,   294,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  -257,   832,     0,     1,   269,
      97,     0,   290,     0,   291,   292,   293,   294,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,  -257,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,  -255,   835,  -257,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,  -255,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,  -258,   832,  -255,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
    -258,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,  -256,   835,  -258,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,  -256,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
     374,  -256,     1,   269,    97,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   375,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   376,    32,   377,
     378,    35,    36,     0,   379,    38,    39,   380,     0,     0,
     381,   382,   383,   384,     0,   385,     0,   386,   387,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   388,     0,   389,   390,     0,   442,   391,     1,   269,
      97,   290,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,     0,   464,   443,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,     0,   469,   465,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,     0,   473,   470,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
     832,   474,     1,   269,    97,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   375,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   376,    32,   377,
     378,    35,    36,     0,   379,    38,    39,   380,     0,     0,
     381,   382,   383,   384,     0,   385,     0,   386,   387,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   388,     0,   389,   390,     0,   835,  -774,     1,   269,
      97,   290,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,     0,   832,  -775,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,     0,   835,  -771,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,     0,   832,  -772,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
     835,  -777,     1,   269,    97,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   375,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   376,    32,   377,
     378,    35,    36,     0,   379,    38,    39,   380,     0,     0,
     381,   382,   383,   384,     0,   385,     0,   386,   387,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   388,     0,   389,   390,     0,   939,  -778,     1,   269,
      97,   290,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,     0,   943,   940,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,     0,   832,   944,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,     0,   835,  -757,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
     832,  -758,     1,   269,    97,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   375,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   376,    32,   377,
     378,    35,    36,     0,   379,    38,    39,   380,     0,     0,
     381,   382,   383,   384,     0,   385,     0,   386,   387,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   388,     0,   389,   390,     0,   835,  -760,     1,   269,
      97,   290,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,     0,   832,  -761,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,     0,   835,  -685,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,     0,   832,  -686,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
     835,  -678,     1,   269,    97,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   375,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   376,    32,   377,
     378,    35,    36,     0,   379,    38,    39,   380,     0,     0,
     381,   382,   383,   384,     0,   385,     0,   386,   387,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   388,     0,   389,   390,     0,   832,  -679,     1,   269,
      97,   290,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,     0,   835,  -674,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,     0,   832,  -675,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,     0,   835,  -664,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
     832,  -665,     1,   269,    97,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   375,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   376,    32,   377,
     378,    35,    36,     0,   379,    38,    39,   380,     0,     0,
     381,   382,   383,   384,     0,   385,     0,   386,   387,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   388,     0,   389,   390,     0,   835,  -659,     1,   269,
      97,   290,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   375,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   376,    32,   377,   378,    35,    36,     0,
     379,    38,    39,   380,     0,     0,   381,   382,   383,   384,
       0,   385,     0,   386,   387,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   388,     0,   389,
     390,     0,   832,  -660,     1,   269,    97,   290,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   375,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   376,
      32,   377,   378,    35,    36,     0,   379,    38,    39,   380,
       0,     0,   381,   382,   383,   384,     0,   385,     0,   386,
     387,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   388,     0,   389,   390,     0,   835,  -676,
       1,   269,    97,   290,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   375,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   376,    32,   377,   378,    35,
      36,     0,   379,    38,    39,   380,     0,     0,   381,   382,
     383,   384,     0,   385,     0,   386,   387,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   388,
       0,   389,   390,     0,   268,  -677,     1,   269,    97,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384,     0,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,   374,
       0,     1,   269,    97,     0,   290,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,    27,     0,   375,     0,     0,   274,
     275,     0,    28,    29,     0,     0,   376,    32,   377,   378,
      35,    36,     0,   379,    38,    39,   380,     0,     0,   381,
     382,   383,   384,     0,   385,     0,   386,   387,    40,     0,
     280,   281,   282,   283,   284,   285,   286,    43,     0,     0,
     388,     0,   389,   390,   442,     0,     1,   269,    97,     0,
     290,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   375,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   376,    32,   377,   378,    35,    36,     0,   379,    38,
      39,   380,     0,     0,   381,   382,   383,   384, -1185,   385,
       0,   386,   387,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   388,     0,   389,   390,     0,
       0,     0,     0,     0,     0,   290,     0, -1185, -1185, -1185,
   -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185,
   -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185,     0,
   -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185, -1185,
   -1185,     0,     0,     0, -1185,     0, -1185,     0,     0,     0,
       0,     0, -1185, -1185,     0,     0, -1185, -1185, -1185, -1185,
   -1185, -1185,     0,     0, -1185, -1185, -1185, -1185, -1185, -1185,
   -1185, -1185, -1185, -1168, -1185,     0,     0, -1185, -1185,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1185,     0,     0, -1185, -1185,     0, -1185,
       0,     0, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168,
   -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168,
   -1168, -1168, -1168, -1168,     0, -1168, -1168, -1168, -1168, -1168,
   -1168, -1168, -1168, -1168, -1168, -1168,     0,     0,     0, -1168,
       0, -1168,     0,     0,     0,     0,     0, -1168, -1168,     0,
       0, -1168, -1168, -1168, -1168, -1168, -1168,     0,     0, -1168,
   -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1168, -1170, -1168,
       0,     0, -1168, -1168,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1168,     0,
       0, -1168, -1168,     0, -1168,     0,     0, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,     0,
   -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170,     0,     0,     0, -1170,     0, -1170,     0,     0,     0,
       0,     0, -1170, -1170,     0,     0, -1170, -1170, -1170, -1170,
   -1170, -1170,     0,     0, -1170, -1170, -1170, -1170, -1170, -1170,
   -1170, -1170, -1170, -1167, -1170,     0,     0, -1170, -1170,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1170,     0,     0, -1170, -1170,     0, -1170,
       0,     0, -1167, -1167, -1167, -1167, -1167, -1167, -1167, -1167,
   -1167, -1167, -1167, -1167, -1167, -1167, -1167, -1167, -1167, -1167,
   -1167, -1167, -1167, -1167,     0, -1167, -1167, -1167, -1167, -1167,
   -1167, -1167, -1167, -1167, -1167, -1167,     0,     0,     0, -1167,
       0, -1167,     0,     0,     0,     0,     0, -1167, -1167,     0,
       0, -1167, -1167, -1167, -1167, -1167, -1167,     0,     0, -1167,
   -1167, -1167, -1167, -1167, -1167, -1167, -1167, -1167, -1169, -1167,
       0,     0, -1167, -1167,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1167, -1167,     0, -1167,     0,     0, -1169, -1169, -1169,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,     0,
   -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169,     0,     0,     0, -1169,     0, -1169,     0,     0,     0,
       0,     0, -1169, -1169,     0,     0, -1169, -1169, -1169, -1169,
   -1169, -1169,     0,     0, -1169, -1169, -1169, -1169, -1169, -1169,
   -1169, -1169, -1169,   171, -1169,     1,     0, -1169, -1169,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1169, -1169,     0, -1169,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   177,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,   772,   947,     0,     0,     0,     0,
       0,     0,     0,     0,   507,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     1,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,   506,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   507,
       0,   508,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,   219,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,   772,     0,     0,
       0,     0,     0,     0,  1351,     0,     0,   507,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,  1105,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1106,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,   219,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,  1105,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1128,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,  1105,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1588,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,   219,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,  1105,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1603,     2,     3,
       4,   239,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,   240,    31,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
      40,     0,     0,     0,     0,    42,     0,     0,     0,    43,
       0,     0,    44,     0,     0,     0,     0,     0,     0,     0,
       0,   241,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   375,     0,     0,     0,     0,     0,    28,    29,
       0,     0,   376,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,   860,     0,   389,     0,
       0,     0,     0,     0,     0,   861,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
     840,     0,     0,   841,     0,     0,     0,     0,     0,   842,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,   840,     0,     0,  1391,     0,     0,
       0,     0,     0,   842,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,  1415,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,    44,     0,
       0,     0,     0,     0,     0,     0,     0,   842,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   -65,     0,     0,     0,
       0,     0,     0,     0,   -65,   -65,     0,     0,     0,   -65,
       0,     0,     0,     0,     0,   -65,   -65,   -65,     0,     0,
       0,     0,  1617,     0,     0,     0,     0,     0,     0,     0,
     -65,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1416,     0,  1417,   -65,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   216,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,     0,   217,    38,   218,     0,
       0,     0,     0,  1721,     0,     0,     0,     0,     0,     0,
       0,   219,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   -95,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,  1863,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     -79,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0, -1248,   258,     0,     1,     0,     0,
       0,     0,     0,   219,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   -86,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
      30,    31,     0,    32,    33,    34,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,    40,    41,     0,     0,     0,    42,
       0,     0,     0,    43,     0,     0,    44,     0,     0,    45,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     1,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,   756,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1305,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
     756,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1644,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,   147,     0,     1,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,   756,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1645,     2,     3,     4,   148,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,     0,   147,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,    44,     0,     0,
     149,     2,     3,     4,   148,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,   541,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,    44,     0,     0,   149,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   216,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,     0,   217,    38,   218,     0,
    -916,     0,  -916,     0,     0,     0,     0,     0,     0,     0,
       0,   219,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,    44,     0,     0,   542,  -916,  -916,  -916,
    -916,  -916,  -916,  -916,  -916,  -916,  -916,  -916,  -916,  -916,
    -916,  -916,  -916,  -916,  -916,  -916,  -916,  -916,  -916,  -916,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  -916,     0,     0,     0,     0,
       0,     0,     0,  -916,  -916,     0,     0,     0,  -916,     0,
       0,     0,     0,     0,  -916,  -916,  -916,     0,     0,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,  -916,
       0,     0,     0,     0,     0,     0,     0,     0,  -916,     0,
       0,  -916,     0,     0,  -916,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,    30,    31,     0,    32,    33,    34,    35,
      36,     0,    37,    38,    39, -1249,   250,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,    40,    41,     0,
       0,     0,    42,     0,     0,     0,    43,     0,     0,    44,
       0,     0,    45,     2,     3,     4,   148,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,    33,    34,    35,    36,     0,
      37,    38,    39,   171,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,    44,     0,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   177,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
     171,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,  1105,  1575,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,   852,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   178,     0,     2,   172,   173,   174,   175,   176,
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
       0,     0,     0,     0,     0,     0,  1456,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   177,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,   147,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1788,     0,     2,     3,     4,   148,     6,
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
      38,    39,   796,     0,     1,     0,     0,     0,     0,     0,
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
       0,     0,     0,   797,     2,     3,     4,   148,     6,     7,
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
       0,     0,     0,     0,     0,     0,     0,     0,   652,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1355,     2,   172,   173,   174,   175,   176,
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
      32,     0,     0,    35,    36,     0,    37,    38,    39,   967,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,   756,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,   968,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   177,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,   973,     0,     1,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,   974,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,   979,
       0,     1,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,   980,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   177,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,   781,     0,     1,    32,     0,     0,
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
      18,    19,    20,    21,    22,    23,    24,   932,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     1,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
     985,     0,     0,     0,     0,     0,     0,     0,     0,     0,
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
      29,     1,     0,     0,    32,   431,   432,     0,     0,     0,
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
       0,     0,     0,     0,     0,     0,   456,   216,     0,     0,
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
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   220,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   219,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1426,     2,   172,
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
       0,    83,   576,   506,   483,    75,   506,   236,   670,   839,
     651,   117,   483,   139,   676,   730,   670,   679,   136,   516,
     765,   518,   676,   839,   769,   679,    75,    75,    76,    75,
      30,    31,   761,   236,   139,    84,   163,   684,   119,   765,
      51,    41,   761,   769,    44,    78,    91,   426,   427,    84,
    1497,    51,    78,   127,    56,   161,    56,    84,    58,    91,
      84,   765,  1509,    74,    91,   769,   140,   653,   142,    51,
     144,    76,    75,     0,    74,    75,    76,   904,    78,   906,
      80,   163,    82,   730,    84,  1113,   127,  1115,     1,    75,
      30,    91,    92,     1,   304,    95,    83,   905,    84,   140,
     376,   142,    42,   144,   104,    91,     3,   107,   318,   236,
       3,   369,   322,     1,   795,     3,   116,   117,     3,   119,
     131,   305,   104,   123,   124,   125,     1,   127,   255,   110,
     110,   131,   305,   133,     3,   115,   136,   137,   119,   139,
     140,   141,   142,   191,   144,     3,    17,   423,    75,     1,
       3,   153,   234,   153,     1,    79,     3,    84,    98,    99,
     160,   161,   102,     3,    91,    92,   871,   112,     3,     3,
     170,     5,     1,     3,   244,     5,   163,     3,     5,   190,
     180,    74,   182,   231,   254,   266,    79,   891,   170,   870,
     190,   191,     1,    86,   275,    17,   244,   121,   244,   112,
     281,   201,    28,   203,     1,   254,     1,   256,   254,   254,
      17,   256,   109,   121,     3,   112,   109,   791,     3,   112,
       5,   256,   254,     1,   256,   122,   231,     1,   121,   256,
     118,   231,   256,     1,   119,   904,   236,   906,     1,     1,
     240,   244,   117,   349,   244,   371,   372,   234,   506,   236,
     119,   904,   254,   906,   254,   113,   256,   110,   111,   117,
     904,   132,   906,   121,     3,   290,   118,   372,   255,   772,
     256,   118,   772,   113,   274,     1,   773,   774,   113,   113,
     280,     3,   117,   113,     1,   112,   121,   121,   288,   118,
     371,   121,     1,   119,   598,   599,     1,     1,  1745,     3,
     240,    17,     7,     8,     9,     1,   115,     3,   117,   118,
     132,   393,   394,   395,   396,   234,   235,   244,   115,  1146,
     117,   118,     3,   118,     5,   132,  1153,   254,   113,   256,
    1157,   993,   112,   904,   905,   906,   121,  1145,     1,   993,
     118,   341,   342,   117,  1152,     3,   112,    28,  1156,   349,
     118,   351,    74,     1,   170,   118,   118,    79,   234,   235,
       1,     5,    14,    15,    86,     1,     1,   596,   597,   598,
     599,   371,   372,   479,   584,   375,   376,   587,  1093,     3,
     119,   499,   382,     3,  1099,   385,   386,   387,   388,   389,
     112,   424,   118,   596,   597,   598,   599,     1,   424,  1104,
     122,   118,   484,   112,   113,     5,   393,   112,   117,   396,
     668,   116,   518,     5,   118,   120,   132,   122,   418,   419,
     420,     1,   118,   423,   424,     1,   426,   427,   439,   503,
     430,   505,     7,     8,     9,   435,     3,   112,   119,   439,
     440,   489,   490,     3,   444,   445,  1093,   122,     1,   376,
       3,   109,  1099,    73,   112,   118,   456,   457,   961,   275,
     508,   961,   503,   960,   505,   281,   466,   467,   847,   848,
     118,   471,   472,   117,   115,   475,   476,  1146,   857,   479,
     859,   481,   118,   118,  1153,   119,   110,   121,  1157,   489,
     490,   115,   619,  1146,   494,   310,   423,   484,   498,   499,
    1153,     1,  1146,   503,  1157,   505,   506,   507,   508,  1153,
     510,   115,   788,  1157,   772,  1980,   516,   117,   518,  1105,
     704,   705,   706,   523,     3,   507,   526,     3,   528,   787,
     530,   704,   705,   706,     3,   118,   536,  1123,   118,   115,
     798,   117,     3,   624,  1130,   120,   113,   122,     3,   549,
     734,   735,   736,   623,   536,  1583,   109,   110,     3,   119,
       3,   734,   735,   736,   117,   484,   566,    28,   568,   651,
       1,  2036,   110,    28,  1145,  1146,   576,   623,   623,  1308,
    1309,  1152,  1153,    28,  1329,  1156,  1157,     3,     5,  1308,
    1309,   623,   115,     3,   870,    74,   596,   597,   598,   599,
      79,     3,  1105,  1329,   615,  1105,  1436,    86,   484,   596,
     597,   598,   599,   113,   614,   615,     3,   117,    28,     3,
    1436,    77,     3,   623,    11,  1329,     1,  1332,   628,     3,
      73,   498,   619,   620,   115,   118,   912,   113,   119,   765,
     119,   310,   642,   769,     3,   119,     3,   116,  1475,   649,
     650,   651,   652,   653,   654,   119,   523,   121,   119,   526,
    1405,   528,  1407,   530,   119,   121,  1474,     1,   668,     1,
     119,   611,   612,   698,   498,   118,     5,   596,   597,   598,
     599,   681,   113,  1409,   765,   685,   117,   768,   769,  1394,
       3,   507,   996,   109,   110,   999,   623,   112,   115,   523,
     725,   620,   526,   119,   528,     3,   530,   122,   733,   119,
       5,  1373,   118,     1,   116,    28,   656,   657,   658,  1373,
     596,   597,   598,   599,   111,   109,   110,   727,   753,   116,
     117,   731,   119,  1037,   115,   119,   117,   112,   113,   113,
     822,   823,   117,   825,   620,   561,   828,   829,  1052,  1053,
    1054,  1055,   878,   879,   113,   112,   756,   757,   758,     1,
       0,   761,   762,   763,   890,   765,   884,   996,   768,   769,
     999,   110,   772,   878,   879,   786,   776,   777,     3,   113,
     119,   113,   121,   117,   113,   117,   786,   787,   788,   116,
     871,   791,   266,   996,   121,   795,   999,   797,   798,   112,
     800,   275,   802,    28,     3,   853,  1475,   281,  1037,   883,
       3,   109,   110,   895,    69,    70,     3,     3,   113,   937,
     938,   119,  1475,  1052,  1053,  1054,  1055,   115,  1086,   117,
    1327,  1475,    74,     3,  1037,     5,     1,    79,     3,     5,
     840,    28,   883,   843,    86,  1103,  1673,   847,   848,  1052,
    1053,  1054,  1055,   853,   960,   109,   116,   857,   112,   859,
     860,   788,   112,   118,  1672,   117,    65,     3,   122,   869,
     870,   871,   122,   115,   116,   117,  1581,   115,   878,   879,
      73,   881,  1587,   883,   884,   721,   826,   112,    74,   109,
     890,   891,   112,    79,     7,     8,     9,   371,   713,   714,
      86,   716,   116,  1474,  1475,    11,     3,   121,   895,    74,
     109,   110,   912,   749,    79,     7,     8,     9,     3,   117,
     119,    86,   119,   109,   121,   118,   741,   742,   743,   744,
       3,  1759,   118,     7,     8,     9,   118,   937,   938,   109,
     110,   941,   942,   870,   109,   945,   946,   112,   948,   118,
     115,  1656,   117,   118,  1528,   719,   110,   707,   708,  1143,
     960,   961,   962,  1442,  1605,   119,   966,     0,   119,   969,
    1143,  1442,   972,   109,   110,   975,   112,    74,   978,   113,
     962,   981,    79,   747,   984,   912,   986,   737,   738,    86,
       1,   991,     3,     7,     8,     9,   996,  1071,  1377,   999,
    1379,    74,   115,   116,  1673,   111,    79,   120,  1008,   996,
    1010,   117,   999,    86,   113,   112,     7,     8,     9,  1019,
    1673,   720,    74,  1104,   109,   110,   842,    79,   120,  1673,
    1071,  1861,  1032,     1,    86,     3,   109,  1037,  1038,   112,
       1,     3,    75,     5,   713,   714,   120,   716,   722,   748,
    1037,    84,  1052,  1053,  1054,  1055,   112,   111,    91,    92,
       7,     8,     9,   117,   880,  1052,  1053,  1054,  1055,    31,
    1070,  1071,   741,   742,   743,   744,   750,  1077,  1906,  1079,
    1908,  1584,   112,   723,  1584,  1072,  1086,     3,  1028,   113,
    1090,  1796,   719,   117,  1094,  1077,  1096,   121,   112,   966,
    1100,  1672,  1673,   115,  1104,  1105,   120,   119,   122,    11,
       3,   751,     5,    74,     1,   118,     3,   984,    79,   720,
     747,   112,    90,  1123,  1149,    86,  1597,  1872,  1873,   120,
    1130,   122,    77,  1052,  1053,  1054,  1055,  1137,    31,    12,
      13,  1969,   966,  1971,   721,  1973,   962,   748,   972,    65,
     624,   112,   113,  1072,   978,   111,   117,  1798,   191,   117,
     984,   117,   723,    11,   119,   123,   121,    12,    13,   717,
     718,   118,   749,   120,  1478,  1479,  1052,  1053,  1054,  1055,
     722,     3,   116,  2011,  2012,  1489,  2014,    74,  1004,  1763,
     751,     3,    79,   109,   110,   112,  1072,   745,   746,    86,
       1,     3,  2030,  1329,   507,   717,   718,  1465,   750,   111,
     111,   244,   112,   111,   116,   117,   117,   119,  2046,   117,
       1,   254,   109,   256,   112,   112,   111,  1706,   115,   112,
     117,   118,   117,   745,   746,  1706,     7,   110,   111,    10,
      11,    12,    13,    14,    15,    16,    17,   111,  1329,  1478,
    1479,  1332,    74,   117,   112,   288,    74,    79,   561,   112,
    1489,    79,    74,   111,    86,   110,   111,    79,    86,   117,
     752,   119,    74,    74,    86,  1478,  1479,    79,    79,  1405,
    1406,  1407,  1408,   112,    86,    86,  1489,   109,   770,   771,
    1106,   765,   112,    74,   768,   769,   118,   109,    79,  1299,
    1300,   119,   119,  1303,  1304,    86,   118,   109,  1308,  1309,
     112,   113,  1128,  1394,   115,   116,   117,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   119,  1409,  1329,
     124,   111,  1332,   752,   115,   116,   117,   117,  1338,   110,
     111,  1341,   115,   130,    69,    70,   119,  1347,  1348,   120,
      74,   770,   771,  1353,  1354,    79,   131,   128,   129,   130,
     131,   132,    86,    16,  1304,     1,    91,     3,     4,     5,
      95,   113,    97,   709,   710,  1375,   109,  1377,   124,  1379,
     111,   111,  1382,   707,   708,   111,   117,   117,   131,   113,
     423,   117,    28,   118,  1394,   128,   129,   871,   418,   419,
    1400,  1401,   109,   739,   740,  1405,  1406,  1407,  1408,   119,
    1984,   121,  1538,   737,   738,   116,   115,  1465,   117,   113,
     111,   128,   129,   117,   444,   445,   117,   121,  1732,    65,
     709,   710,   130,   113,   113,    71,    72,   117,   117,   111,
    1427,   121,   121,    16,   113,   117,   466,   467,   117,    85,
    1929,   471,   472,    44,    45,   475,   476,   111,  1929,   119,
     739,   740,    98,   117,   113,  1465,   102,   103,   104,   105,
     106,   107,   108,   113,   125,   126,   112,   117,  1478,  1479,
     119,    44,    45,    74,    75,   116,   122,  1487,    79,  1489,
    1490,  1478,  1479,  1493,   113,    86,   112,  1497,   117,   119,
    1581,  1501,  1489,  1732,  1504,   115,  1587,   117,   115,   483,
    1989,    74,    75,    78,   115,   113,    79,  1988,  1989,   117,
     113,   112,   117,    86,   117,   115,   113,   113,  1528,  1732,
     117,   117,   113,   113,    10,    11,   117,   117,  1538,   842,
     110,     1,   113,     3,  1625,  1626,   117,  1628,  1629,   112,
      88,    89,    90,  1634,  1635,  1636,  1637,   113,   113,   137,
    1500,   117,   117,   141,  1380,  1646,  1647,  1648,  1649,  1650,
    1651,  1652,  1653,   125,   126,  1656,  1516,   880,  1660,   110,
     115,  1581,   117,   119,  1584,   121,   119,  1587,   121,     1,
     623,     3,    10,    11,  1898,   628,  1900,     1,     1,     3,
       3,    44,    45,   110,     1,  1605,     3,  1607,  1608,   115,
     115,   117,   117,  1687,     1,  1689,     3,   119,   651,   121,
     116,  1646,  1647,  1648,  1649,  1650,  1651,  1652,  1653,   117,
    1104,    74,    75,    14,    15,   668,    79,  1711,     1,  1713,
       3,  1641,     1,    86,     3,     1,  1687,     3,  1689,   115,
     115,   117,   117,   115,   123,   117,  1656,   820,   821,   962,
    1964,   119,   119,  1663,   121,  1665,   109,   820,   821,  1898,
    1711,  1900,  1713,   123,  1417,  1675,  1419,  1417,   123,  1419,
     489,   490,   489,   490,   596,   597,   119,  1687,   119,  1689,
     596,   597,    91,    92,   117,  1898,   117,  1900,   762,   763,
     117,  1004,   117,   119,   118,   115,   112,   112,   121,   118,
     684,  1711,   112,  1713,   115,  1796,   112,   115,   112,    56,
     115,   123,   115,   115,   115,   758,  1726,  1727,  1728,  1729,
     119,   110,  1732,   113,   119,  1964,   110,  1737,  1738,   115,
    1740,   119,  1742,   115,   115,  1732,  1872,  1873,   118,   115,
     115,   118,   110,   113,  1754,   788,   730,   118,   113,   116,
     113,  1964,   795,  1763,   113,   113,  1766,   800,   112,   802,
    1586,   123,  1588,   123,   121,   121,   121,   342,   112,   112,
    1861,   110,   110,   115,   115,   115,  1602,  1603,   112,   115,
     113,   113,   113,   110,   112,  1869,  1796,   112,  1798,   110,
     113,     0,   122,  1106,  1988,   113,   113,   117,   122,   118,
     113,   376,   117,   113,   115,  1988,   122,  1757,    56,  1759,
     853,   386,   121,   121,   389,  1128,   121,   121,  1869,   121,
     121,   121,   121,   113,   113,   113,  1861,   870,   113,   123,
     123,   123,   112,   112,   121,   121,   113,   112,   122,   113,
     113,   113,   113,   113,   113,  1329,   113,   123,  1332,   424,
     110,   115,    11,   119,   122,   430,   119,  1867,  1868,  1869,
    1870,  1871,  1872,  1873,   123,   123,    75,   123,  1878,  1879,
    1880,  1881,   116,   115,   121,    84,   121,   116,  1888,   116,
     112,   115,    91,    92,   119,  1977,  1978,   113,  1898,   113,
    1900,   113,   123,   123,   123,   123,   123,   113,   123,  1909,
    1910,  1898,   123,  1900,   123,   113,   113,    64,    64,   115,
    1394,   941,   942,   113,   113,   945,   946,   115,   123,   123,
     123,   123,   115,   498,   115,  1409,   115,   119,   113,   115,
     430,   506,   115,   115,   918,   115,  1946,  1947,   115,   115,
     115,  1951,  1952,   115,   115,  1955,   115,  1957,   523,     0,
    1960,   526,   430,   528,  1964,   530,  1906,   430,  1908,   430,
     890,   430,  2019,   768,   270,  1375,   881,  1964,  1978,   387,
    1980,  1797,   254,   254,  1984,   270,   654,   280,   851,   270,
     912,  1807,   191,  1799,   424,   231,  1968,  1997,    91,    84,
      41,     0,    84,   236,    92,    84,    -1,    -1,  1641,    -1,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    58,    -1,  2019,
    2020,    -1,    -1,    -1,    -1,  2025,    -1,    -1,  1968,  1969,
      -1,  1971,    -1,  1973,    75,    -1,  2036,    78,    -1,    -1,
      -1,    -1,    83,    84,    -1,   244,    -1,    -1,  1864,  1865,
      91,    92,    -1,  1086,    -1,   254,    -1,   256,    -1,    -1,
      -1,    -1,    -1,   104,    -1,  1039,   107,    -1,    -1,    -1,
    1044,  2011,  2012,  1047,  2014,  1049,    75,  1380,   119,    -1,
      -1,    -1,    -1,   124,   125,    84,   127,    -1,    -1,    -1,
    2030,    -1,    91,    92,    -1,    -1,   137,    -1,   139,   140,
     141,   142,    -1,   144,    -1,    -1,  2046,  1581,    -1,    -1,
      -1,    -1,    -1,  1587,    -1,    -1,    -1,    -1,    -1,  1093,
      -1,    -1,   163,    -1,    -1,  1099,   125,    -1,    -1,   170,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   137,    -1,
      -1,   182,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     191,  1625,  1626,    -1,  1628,  1629,    -1,    -1,    -1,    -1,
    1634,  1635,  1636,  1637,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1646,  1647,  1648,  1649,  1650,  1651,  1652,  1653,
      -1,    -1,  1656,    -1,    -1,    -1,   124,    -1,    -1,   127,
     231,    -1,    -1,   234,   235,   236,   761,   762,   763,    -1,
      -1,    -1,   140,   244,   142,    -1,   144,   772,    -1,    -1,
      -1,   125,    -1,   254,   255,   256,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   137,   423,    -1,    -1,   141,    -1,    -1,
      -1,    -1,    -1,   274,    -1,    -1,    -1,    -1,    -1,   280,
      -1,    -1,    -1,    -1,    -1,   244,    -1,   288,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   254,    -1,   256,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   418,   419,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1586,    -1,  1588,    -1,    -1,    -1,    -1,
      -1,    -1,   444,   445,    -1,    -1,    -1,    -1,    -1,  1602,
    1603,   342,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   466,   467,    -1,   231,    -1,   471,
     472,    -1,  1796,   475,   476,    -1,    -1,    -1,   369,    -1,
     371,   372,   270,    -1,   375,   376,    -1,    -1,    -1,    -1,
      -1,   382,    -1,    -1,    -1,   386,   387,    -1,   389,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     274,    -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   375,   418,   419,    -1,
    1400,  1401,   423,   424,    -1,    -1,    -1,  1861,   387,   430,
      -1,    -1,    -1,    -1,   435,    -1,   961,    -1,    -1,   440,
      -1,   966,    -1,   444,   445,    -1,    -1,   972,    -1,    -1,
      -1,    -1,    -1,   978,    -1,    -1,    -1,    -1,    -1,   984,
      -1,    -1,    -1,    -1,   623,   466,   467,    -1,    -1,   628,
     471,   472,  1465,    -1,   475,   476,   477,    -1,    -1,    -1,
      -1,   440,    -1,   484,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   369,    -1,   498,    -1,    -1,
      -1,   375,   503,    -1,   505,   506,   507,    -1,  1442,    -1,
      -1,    -1,    -1,   387,    -1,    -1,    -1,    -1,    -1,    -1,
     418,   419,   523,    -1,    -1,   526,    -1,   528,    -1,   530,
      -1,    -1,   430,    -1,  1797,   536,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1807,    -1,   444,   445,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   440,    -1,   466,   467,
      -1,    -1,    -1,   471,   472,    -1,    -1,   475,   476,    -1,
    1105,    -1,    -1,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    -1,   596,   597,   598,   599,   758,
      -1,  1864,  1865,    -1,    -1,   503,    -1,   505,    -1,    -1,
      -1,    -1,  1605,    -1,    -1,    -1,    -1,    -1,   619,   620,
      -1,    -1,   623,    -1,    -1,    -1,    -1,   628,    -1,   788,
      -1,    -1,    -1,    -1,    -1,    -1,   795,    -1,    -1,    -1,
      -1,   642,    -1,   802,    -1,    -1,    -1,    -1,   649,   650,
     651,    -1,   653,   654,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   623,    -1,    -1,   668,    -1,   670,
      -1,    -1,    -1,    -1,    -1,   676,    -1,    -1,   679,    -1,
      -1,    -1,    -1,    -1,    -1,  1619,   110,   111,    -1,    -1,
    1624,    -1,    -1,  1627,   853,    -1,   120,  1631,    -1,    -1,
     124,   125,   126,    -1,   128,   129,   130,   131,   132,    -1,
      -1,   870,    -1,    -1,    -1,    -1,    -1,    -1,     0,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,   758,    -1,    -1,
     761,   762,   763,    -1,   765,    -1,    -1,   768,   769,    66,
      -1,   772,  1706,    -1,    -1,   649,   650,    74,    75,   653,
     654,    -1,    79,  1308,  1309,    -1,   787,   788,    85,    86,
      87,    44,    -1,    75,   795,    -1,    -1,   798,    -1,   800,
      -1,   802,    84,   100,    -1,  1798,    -1,    -1,    -1,    91,
      92,    -1,   109,    -1,    -1,   112,   113,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,   122,    -1,    -1,   787,   941,
     942,    -1,    -1,   945,   946,    -1,    -1,  1771,    -1,   798,
      -1,    -1,  1776,   125,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   853,    -1,    -1,   137,    -1,    -1,    -1,   141,
      -1,    -1,   236,   116,   117,  1799,    -1,    -1,    -1,   870,
     871,    -1,    -1,    -1,    -1,    -1,    -1,   878,   879,    -1,
      -1,    -1,   883,    -1,    -1,    -1,    -1,  1867,  1868,   890,
    1870,  1871,    -1,    -1,    -1,    -1,    -1,    -1,  1878,  1879,
    1880,  1881,    -1,   904,   905,   906,    -1,   160,   161,    -1,
      -1,   912,    -1,   787,    -1,    -1,   290,    -1,  1077,    -1,
      -1,    -1,    -1,    -1,   798,    -1,    -1,  1086,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   191,    -1,
     941,   942,    -1,    -1,   945,   946,    -1,    -1,    -1,    -1,
       0,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     961,   962,   244,    -1,    -1,   966,  1946,  1947,    -1,    -1,
      -1,   972,   254,    -1,   256,    -1,    -1,   978,   231,    -1,
      -1,    -1,    -1,   984,    -1,   883,    -1,    -1,    -1,    -1,
      -1,   244,   993,    -1,    44,  1929,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      -1,    -1,    82,    -1,    84,    -1,    -1,    -1,   912,    -1,
      -1,    91,    92,   941,   942,    -1,    -1,   945,   946,    -1,
      -1,  1052,  1053,  1054,  1055,  1989,    -1,    -1,    -1,  1584,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,   118,  1070,
    1071,  1072,    -1,    -1,   124,    -1,  1077,   127,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1086,    -1,    -1,    -1,    -1,
     140,    -1,   142,   375,   144,    -1,   349,    -1,   351,    -1,
      -1,    -1,  1103,  1104,  1105,   387,    -1,    -1,    -1,   483,
      -1,   161,   162,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,
      -1,    -1,    -1,    -1,    -1,   388,    -1,    -1,    -1,    -1,
      -1,   191,    -1,    -1,  1145,  1146,    -1,    -1,    -1,    -1,
      -1,  1152,  1153,    -1,    -1,  1156,  1157,    -1,   440,    -1,
      -1,   535,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     423,    -1,  1070,  1071,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   231,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   566,    -1,   244,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   254,    -1,   256,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   596,   597,   598,   599,   479,    -1,   481,  1103,
      -1,    -1,    -1,    -1,    -1,    -1,   489,   490,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1123,
      -1,    -1,    -1,   506,    -1,   508,  1130,    -1,    -1,    -1,
      -1,    -1,    -1,   516,    -1,   518,    -1,    -1,    -1,    -1,
      -1,     0,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   655,    -1,    -1,    -1,   659,    -1,    -1,  1400,  1401,
      -1,    -1,    -1,    -1,    -1,    -1,   549,    -1,    -1,   349,
      -1,    -1,    -1,    -1,    -1,    -1,  1465,  1308,  1309,    -1,
     684,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   369,
      -1,    -1,    -1,    -1,   698,    -1,   376,    -1,  1329,    -1,
      -1,  1332,    -1,    -1,    -1,    -1,    -1,    -1,   388,    -1,
      -1,   623,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,   725,    -1,    -1,    -1,    84,   730,    -1,    -1,   733,
      -1,    -1,    91,    92,    -1,    -1,    -1,    -1,   418,   419,
      -1,    -1,  1373,   423,    -1,    -1,    -1,   427,    -1,   753,
     430,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1394,   444,   445,   125,    -1,    -1,  1400,
    1401,    -1,    -1,    -1,  1405,  1406,  1407,  1408,   137,    -1,
      -1,    -1,   141,    -1,    -1,    -1,   466,   467,    -1,    -1,
      -1,   471,   472,    -1,    -1,   475,   476,    -1,    -1,   479,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   489,
     490,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   503,    -1,   505,   506,    -1,   508,    -1,
      -1,    -1,    -1,    -1,  1465,    -1,    -1,    -1,   518,    -1,
     520,    -1,    -1,  1474,  1475,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1400,  1401,    -1,   787,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   244,   798,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   254,    -1,   256,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1538,    -1,    -1,
      -1,    -1,   795,    -1,   918,    -1,    -1,   800,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   623,    -1,    -1,    -1,    -1,    -1,    -1,
    1581,    -1,    -1,  1584,    -1,    -1,  1587,   840,    -1,    -1,
      -1,    -1,    -1,    -1,   847,   848,    -1,    -1,    -1,   649,
     853,    -1,    -1,   653,  1605,    -1,    -1,   860,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,   870,   668,    -1,
      -1,    -1,   996,    -1,    -1,   999,    -1,    -1,   140,    83,
     142,    -1,   144,    -1,  1008,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   375,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1656,  1030,  1031,   387,   912,
      -1,    -1,    -1,  1037,    -1,  1039,    -1,    -1,    -1,    -1,
    1044,  1672,  1673,  1047,    -1,  1049,    -1,    -1,  1052,  1053,
    1054,  1055,    -1,    -1,    -1,    -1,  1687,    -1,  1689,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   960,    -1,   163,
    1711,   440,  1713,    -1,    -1,    -1,    -1,    -1,    -1,  1093,
      -1,    -1,   772,    -1,   236,  1099,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   787,   788,    -1,
      -1,    -1,    -1,    -1,    -1,   795,    -1,    -1,   798,    -1,
     800,    -1,    -1,    -1,    -1,  1867,  1868,    -1,  1870,  1871,
      -1,    -1,    -1,    -1,    -1,    -1,  1878,  1879,  1880,  1881,
      -1,    -1,    -1,    -1,    -1,  1149,    -1,    -1,    -1,    -1,
     234,   235,   236,    -1,    -1,    -1,    -1,    -1,    -1,  1687,
     840,  1689,    -1,    -1,    -1,  1796,    -1,  1798,   848,    -1,
      -1,   255,    -1,   853,    -1,    -1,    -1,    -1,    -1,    -1,
     860,    -1,    -1,  1711,    -1,  1713,    -1,    -1,    -1,    -1,
     870,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   883,  1946,  1947,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   912,    -1,    -1,    -1,  1867,  1868,  1869,  1870,
    1871,  1872,  1873,    -1,    -1,    -1,    -1,  1878,  1879,  1880,
    1881,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   941,   942,    -1,   623,   945,   946,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   418,   419,   958,    -1,
     960,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   444,   445,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1946,  1947,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   466,   467,    -1,    -1,    -1,   471,
     472,    -1,    -1,   475,   476,   477,    -1,    -1,    -1,  1867,
    1868,  1869,  1870,  1871,    -1,    -1,    -1,    -1,    -1,    -1,
    1878,  1879,  1880,  1881,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   503,    -1,   505,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1070,  1071,    -1,   477,    -1,    -1,    -1,    -1,    -1,    -1,
     484,    -1,    -1,    -1,    -1,    -1,  1086,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1946,  1947,
      -1,    -1,    -1,  1103,   566,  1105,    -1,    -1,   787,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1442,   798,
      -1,    -1,    -1,  1123,    -1,    -1,    -1,    -1,    -1,    -1,
    1130,    -1,    -1,    -1,   596,   597,   598,   599,    -1,    -1,
      -1,    -1,    -1,    -1,  1347,  1348,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1478,  1479,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1487,    -1,  1489,  1490,   103,    -1,  1493,
      -1,    -1,  1375,    -1,  1377,    -1,  1379,  1501,    -1,    -1,
    1504,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   596,   597,   598,   599,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   670,    -1,
      -1,    -1,    -1,    -1,   676,   619,   620,   679,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   170,    -1,    -1,    -1,   642,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1465,    -1,    -1,    -1,   670,    -1,    -1,    -1,
      -1,    -1,   676,  1597,    -1,   679,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,  1609,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1619,    -1,    -1,    -1,    -1,
    1624,    -1,    -1,  1627,    -1,    -1,    28,  1631,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
     266,    -1,    -1,    -1,    -1,   271,   272,    -1,    -1,   275,
      -1,    -1,    -1,    -1,    66,   281,    -1,    -1,  1348,    -1,
      -1,    -1,    74,    75,   290,    -1,    -1,    79,   820,   821,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,   305,
      -1,    -1,    -1,    -1,   310,  1375,    -1,    -1,   100,    -1,
      -1,    -1,  1706,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
    1400,  1401,  1726,  1727,  1728,  1729,    -1,    -1,  1732,    -1,
      -1,    -1,    28,  1737,  1738,    -1,  1740,    -1,  1742,    -1,
      -1,   883,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1754,    -1,    -1,    -1,    -1,   371,    -1,    -1,    -1,    -1,
    1764,  1765,   904,    -1,   906,    -1,    -1,  1771,    -1,    65,
      -1,    -1,  1776,    -1,    -1,    71,    72,    73,    74,    -1,
    1663,    -1,  1665,    79,    -1,  1465,    -1,    -1,    84,    85,
      86,    -1,  1675,    -1,    -1,  1799,    -1,    -1,    -1,   941,
     942,    -1,    98,   945,   946,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
     904,   905,   906,    -1,    -1,    -1,   122,    -1,   124,   125,
     126,   127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   993,    -1,    -1,   996,    -1,    -1,   999,    -1,    -1,
      -1,   477,    -1,    -1,    -1,    -1,  1008,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1888,    -1,    -1,    -1,    -1,    -1,
      -1,   507,    -1,    -1,  1898,  1037,  1900,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   993,
    1052,  1053,  1054,  1055,    -1,    -1,    -1,    -1,    -1,   535,
      -1,    -1,    -1,    -1,    -1,  1929,    -1,    -1,  1070,  1071,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   561,    -1,  1951,  1952,    -1,
      -1,  1955,    -1,  1957,    -1,    -1,  1960,    -1,    -1,    -1,
    1964,    -1,    -1,    -1,    -1,    -1,  1970,    -1,  1052,  1053,
    1054,  1055,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1988,  1989,    -1,    -1,  1072,    -1,
      -1,    -1,    -1,  1997,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1146,    -1,    -1,  1687,   624,  1689,
      -1,  1153,   628,    -1,    -1,  1157,    -1,    -1,    -1,    -1,
      -1,  2025,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1711,    -1,  1713,    -1,    -1,    -1,    -1,    -1,   655,
    1720,    -1,    -1,   659,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    -1,    -1,    -1,   670,    -1,    -1,    -1,    -1,    -1,
     676,  1145,  1146,   679,    -1,   119,    -1,    -1,  1152,  1153,
      -1,    -1,  1156,  1157,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   698,    -1,    -1,    -1,    -1,    -1,   704,   705,
     706,   707,   708,   709,   710,    -1,    -1,   713,   714,    -1,
     716,   717,   718,   719,   720,   721,   722,   723,    -1,   725,
      -1,    -1,    -1,    -1,    -1,    -1,   170,   733,   734,   735,
     736,   737,   738,   739,   740,   741,   742,   743,   744,   745,
     746,   747,   748,   749,   750,   751,    -1,   753,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   765,
      -1,    -1,   768,   769,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1867,  1868,  1869,
    1870,  1871,    -1,    -1,    66,    -1,    -1,    -1,  1878,  1879,
    1880,  1881,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,   266,    85,    86,    87,    -1,   271,   272,    -1,
      -1,   275,    -1,   839,    -1,    -1,   842,   281,   100,    -1,
      -1,  1373,    -1,    -1,    -1,    -1,   290,   109,    -1,    -1,
     112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     122,   305,    -1,    -1,    -1,   871,   310,    -1,  1400,  1401,
      -1,    -1,    -1,    -1,   880,    -1,  1946,  1947,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1417,    -1,  1419,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   904,  1373,
     906,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   371,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1475,    -1,    -1,  1478,  1479,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1487,   962,  1489,  1490,    -1,
      -1,  1493,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1501,
      -1,    -1,  1504,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   993,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1004,    -1,
    1474,  1475,    -1,   103,    -1,    -1,    -1,    -1,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1030,  1031,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   477,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,   124,    -1,
      -1,   127,    -1,   507,    -1,    -1,    -1,    -1,    -1,    -1,
     170,    -1,    65,    66,   140,    -1,   142,    -1,   144,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,   535,    85,    86,    87,    -1,    -1,    -1,  1104,    -1,
    1106,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,   561,    -1,   112,
     113,    -1,  1128,    -1,    -1,    -1,    -1,    -1,    -1,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1143,    -1,    -1,
    1146,  1673,    -1,  1149,    -1,    -1,    -1,  1153,    -1,    -1,
      -1,  1157,    -1,    -1,    -1,  1687,    -1,  1689,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1711,
     624,  1713,    -1,    -1,   628,    -1,    -1,    -1,    -1,    -1,
     290,    -1,    -1,    -1,  1726,  1727,  1728,  1729,  1672,  1673,
    1732,    -1,    -1,    -1,    -1,  1737,  1738,    -1,  1740,    -1,
    1742,   655,    -1,    -1,    -1,   659,    -1,    -1,    -1,    -1,
      -1,    -1,  1754,    -1,    -1,    -1,   670,    -1,    -1,    -1,
      -1,    -1,   676,    -1,    -1,   679,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   698,    -1,    -1,    -1,    -1,    -1,
     704,   705,   706,   707,   708,   709,   710,    -1,    -1,   713,
     714,    -1,   716,   717,   718,   719,   720,   721,   722,   723,
      -1,   725,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   733,
     734,   735,   736,   737,   738,   739,   740,   741,   742,   743,
     744,   745,   746,   747,   748,   749,   750,   751,    -1,   753,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   765,    -1,  1329,   768,   769,  1332,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1867,  1868,  1869,  1870,  1871,
      -1,    -1,    -1,    -1,    -1,    -1,  1878,  1879,  1880,  1881,
      -1,    -1,   418,   419,    -1,    -1,  1888,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1898,  1373,  1900,    -1,
      -1,    -1,    -1,    -1,  1380,    -1,    -1,   477,   444,   445,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1394,    -1,
      -1,    -1,    -1,    -1,    -1,   839,    -1,    -1,   842,    -1,
     466,   467,    -1,  1409,    -1,   471,   472,   507,    -1,   475,
     476,  1417,    -1,  1419,  1946,  1947,    -1,    -1,    -1,  1951,
    1952,    -1,    -1,  1955,    -1,  1957,    -1,   871,  1960,    -1,
    1436,    -1,  1964,    -1,    -1,   535,   880,   503,    -1,   505,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     904,   561,   906,    -1,    -1,  1997,    -1,   124,     1,  1475,
     127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    -1,   144,    -1,    -1,
      -1,    -1,    -1,  2025,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,   962,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,   993,
      -1,    -1,    85,    86,    87,   655,    -1,    -1,    -1,   659,
    1004,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
     670,    -1,    -1,    -1,    -1,  1581,   676,    -1,    -1,   679,
    1586,  1587,  1588,    -1,    -1,   118,  1030,  1031,    -1,    -1,
      -1,  1597,    -1,    -1,    -1,   305,  1602,  1603,   698,    -1,
      -1,    -1,    -1,  1609,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1625,
    1626,    -1,  1628,  1629,    -1,   725,    -1,    -1,  1634,  1635,
    1636,  1637,    -1,   733,    -1,    -1,    -1,    -1,    -1,    -1,
    1646,  1647,  1648,  1649,  1650,  1651,  1652,  1653,    -1,    -1,
    1656,    -1,    -1,   753,    -1,    -1,    -1,    -1,    -1,    -1,
    1104,    -1,  1106,    -1,    -1,    -1,    -1,  1673,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1143,
      -1,    -1,  1146,    -1,    -1,  1149,    -1,    -1,    -1,  1153,
      -1,    -1,    -1,  1157,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   839,
      -1,    -1,   842,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   820,   821,    -1,    -1,  1764,  1765,
      -1,   418,   419,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   430,    -1,    -1,    -1,    -1,    -1,    -1,
     880,    -1,    -1,    -1,    -1,    -1,    -1,   444,   445,    -1,
    1796,  1797,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1807,    -1,    -1,   904,    -1,   906,    -1,    -1,   466,
     467,    -1,    -1,    -1,   471,   472,    -1,   883,   475,   476,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   503,    -1,   505,    -1,
      -1,    -1,    -1,    -1,    -1,  1861,    -1,    -1,  1864,  1865,
      -1,   571,   962,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   941,   942,    -1,    -1,   945,
     946,    -1,    -1,    -1,    -1,  1329,    -1,    -1,  1332,    -1,
      -1,    -1,    -1,   993,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1004,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1373,
    1030,  1031,    -1,    -1,    -1,    -1,  1380,    -1,   290,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1394,    -1,    -1,   305,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1970,  1409,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1417,   684,  1419,    -1,    -1,    -1,    -1,
      -1,    -1,  1988,    -1,    -1,    -1,    -1,     0,    -1,    -1,
      -1,    -1,  1436,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1070,  1071,  1106,   717,   718,   719,
     720,   721,    -1,    -1,   724,    -1,    -1,    -1,    -1,    -1,
     730,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1128,    -1,
      43,  1475,    -1,    -1,    -1,   745,   746,   747,   748,   749,
      -1,    -1,   752,    -1,    -1,    -1,  1146,    -1,    -1,  1149,
      -1,    -1,    -1,  1153,    -1,    -1,    -1,  1157,    -1,    -1,
     770,   771,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      83,    84,    -1,    -1,    -1,    -1,    -1,    -1,    91,    92,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,    -1,   125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   137,    -1,   139,    -1,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1581,    -1,    -1,
      -1,    -1,  1586,  1587,  1588,    -1,    -1,    -1,    -1,    -1,
     163,    -1,    -1,  1597,    -1,    -1,    -1,    -1,  1602,  1603,
      -1,    -1,    -1,    -1,    -1,  1609,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   191,    -1,
      -1,  1625,  1626,    -1,  1628,  1629,    -1,    -1,    -1,    -1,
    1634,  1635,  1636,  1637,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1646,  1647,  1648,  1649,  1650,  1651,  1652,  1653,
      -1,    -1,  1656,    -1,    -1,    -1,    -1,    -1,   231,   571,
      -1,   234,   235,   236,    -1,    -1,   883,    -1,    -1,  1673,
      -1,   244,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   254,   255,   256,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   274,    -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,
      -1,    -1,    -1,  1373,    -1,   288,    -1,    -1,    -1,    -1,
    1380,    -1,    -1,    -1,   941,   942,    -1,    -1,   945,   946,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1011,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1417,    -1,  1419,
    1764,  1765,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1039,
      -1,    -1,   684,    -1,  1400,  1401,  1436,  1047,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   698,    -1,    -1,    -1,
      -1,    -1,  1796,  1797,    -1,    -1,   369,    -1,   371,   372,
      -1,    -1,   375,  1807,    -1,   717,   718,   719,   720,   721,
      -1,    -1,   724,   725,   387,  1475,    -1,    -1,   730,    -1,
      -1,   733,    -1,  1093,    -1,    -1,    -1,    -1,    -1,  1099,
      -1,    -1,    -1,   745,   746,   747,   748,   749,    -1,    -1,
     752,   753,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     423,    -1,    -1,  1070,  1071,    -1,    -1,  1861,   770,   771,
    1864,  1865,    -1,    -1,    -1,    -1,    -1,   440,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   477,    -1,    -1,    -1,    -1,    -1,
      -1,   484,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1586,    -1,  1588,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1597,    -1,    -1,
      -1,    -1,  1602,  1603,    -1,    -1,    -1,    -1,    -1,  1609,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1970,    -1,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,  1988,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     573,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,   124,
     125,   126,   127,  1673,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   596,   597,   598,   599,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   619,   620,    -1,    -1,
     623,    -1,    -1,    -1,    -1,   628,    -1,    -1,    -1,    -1,
      -1,  1687,    -1,  1689,    28,    -1,    -1,    -1,    -1,   642,
      -1,    -1,    -1,    -1,    -1,    -1,   649,   650,   651,    -1,
     653,   654,    -1,    -1,    -1,  1711,    -1,  1713,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   668,    -1,   670,    -1,  1011,
      -1,    65,    -1,   676,  1764,  1765,   679,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,  1039,    -1,    -1,
      -1,    -1,    -1,    -1,    98,  1047,    -1,  1797,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,  1807,   112,   113,
     114,    -1,    -1,   117,    -1,    -1,    -1,   121,   122,    -1,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1093,    -1,  1400,  1401,   758,    -1,  1099,    -1,    -1,
      -1,    -1,   765,    -1,    -1,   768,   769,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1864,  1865,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   787,   788,    -1,    -1,    -1,    -1,
      -1,    -1,   795,    -1,    -1,   798,   799,   800,    -1,   802,
      -1,    -1,    -1,    -1,    -1,    83,    -1,  1149,    -1,    -1,
      -1,  1867,  1868,  1869,  1870,  1871,    -1,    -1,    -1,    -1,
      -1,    -1,  1878,  1879,  1880,  1881,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   119,    -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,
     853,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   137,
      -1,   139,    -1,   141,    -1,    -1,    -1,   870,   871,    -1,
      -1,    -1,    -1,    -1,    -1,   878,   879,    -1,    -1,    -1,
    1970,    -1,    -1,    -1,    -1,   163,    -1,   890,    -1,    -1,
    1946,  1947,    -1,    -1,    -1,    -1,    -1,    -1,  1988,    -1,
      -1,   904,   905,   906,    -1,    -1,    -1,    -1,    -1,   912,
      -1,    -1,    -1,   191,    -1,    -1,    -1,    -1,    -1,  1619,
      -1,    -1,    -1,    -1,  1624,  1625,  1626,  1627,  1628,  1629,
      -1,  1631,    -1,    -1,  1634,  1635,  1636,  1637,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   231,    -1,    -1,   234,   235,   236,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   255,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
     993,    -1,    -1,    -1,    -1,    -1,   274,    -1,    -1,    -1,
      -1,    -1,   280,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1013,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
    1687,    -1,  1689,    -1,    -1,    -1,    -1,    -1,    -1,  1052,
    1053,  1054,  1055,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,  1711,    -1,  1713,    79,    -1,  1072,
      -1,  1771,    -1,    85,    86,    87,  1776,    -1,    -1,    -1,
      -1,    -1,    -1,  1086,    -1,    -1,    -1,    -1,   100,    -1,
      -1,   369,    -1,   371,   372,    -1,    -1,   375,    -1,    -1,
    1103,  1104,    -1,    -1,    -1,    -1,    -1,   119,    -1,   387,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1145,  1146,    -1,   423,    -1,    -1,    -1,  1152,
    1153,    -1,    -1,  1156,  1157,    -1,    -1,    28,    -1,    -1,
      -1,    -1,   440,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,   477,
      -1,    -1,    -1,    74,    75,    -1,   484,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
    1867,  1868,  1869,  1870,  1871,    -1,    -1,    -1,    -1,   100,
      -1,  1878,  1879,  1880,  1881,    -1,    -1,    -1,   109,    -1,
      -1,   112,    83,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1619,   119,    -1,
      -1,    -1,  1624,  1625,  1626,  1627,  1628,  1629,    -1,  1631,
      -1,    -1,  1634,  1635,  1636,  1637,    -1,    -1,   139,  1946,
    1947,    -1,    -1,    -1,  1646,  1647,  1648,  1649,  1650,  1651,
    1652,  1653,    -1,    -1,    -1,    -1,    -1,    -1,   596,   597,
     598,   599,   163,    -1,    -1,    -1,  1329,    -1,    -1,  1332,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   619,   620,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   642,    -1,    -1,    -1,    -1,    -1,
    1373,   649,   650,    -1,    -1,   653,   654,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    44,    -1,    -1,    -1,    -1,
     231,  1394,   670,   234,   235,   236,    -1,    -1,   676,    -1,
      -1,   679,  1405,  1406,  1407,  1408,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   255,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    82,    -1,    -1,    -1,    -1,    -1,  1771,
      -1,    -1,    -1,   274,  1776,    -1,    -1,    -1,    -1,   280,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   288,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   116,   117,    -1,
      -1,    -1,  1465,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1474,  1475,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     758,    -1,    -1,    -1,    -1,    -1,    -1,   765,    -1,    -1,
     768,   769,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   160,   161,    -1,    -1,    -1,    -1,    -1,    -1,   787,
     788,    -1,    -1,    -1,    -1,    -1,    -1,   795,    -1,    -1,
     798,    -1,    -1,     3,   802,    -1,    -1,    -1,   369,    -1,
     371,   372,   191,    -1,    -1,  1538,    -1,    -1,    -1,    -1,
      -1,    -1,   201,    -1,   203,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,   231,    -1,    -1,   853,    -1,    -1,  1581,    -1,
      -1,    -1,   423,    -1,  1587,   244,    66,    -1,    -1,    -1,
      -1,    -1,   870,   871,    74,    75,    -1,    -1,    -1,    79,
     878,   879,  1605,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,   890,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,   904,   905,   906,   109,
      -1,    -1,   112,    -1,   912,    -1,   477,    -1,    -1,   119,
      -1,    -1,   122,   484,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1656,    -1,     0,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1672,
    1673,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     349,    -1,   351,    -1,    -1,    -1,    -1,    -1,    -1,    44,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   993,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   388,
      75,    76,    -1,    -1,    -1,    80,    -1,    82,    -1,    84,
      -1,    -1,    -1,    -1,    -1,    -1,    91,    92,    -1,    -1,
     566,    -1,    -1,    -1,    -1,   596,   597,   598,   599,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   426,   427,    -1,
      -1,   116,   117,    -1,  1052,  1053,  1054,  1055,   619,   620,
      -1,    83,   598,   599,    -1,    -1,    -1,   628,    -1,    -1,
      -1,    -1,    -1,  1796,  1072,  1798,    -1,    -1,    -1,    -1,
      -1,   642,    -1,    -1,    -1,    -1,    -1,    -1,   649,   650,
     651,    -1,   653,   654,    -1,   160,   161,   119,    -1,    -1,
     479,    -1,   481,    -1,    -1,  1103,  1104,   668,    -1,   670,
     489,   490,    -1,    -1,    -1,   676,    -1,   139,   679,    -1,
      -1,    -1,    -1,    -1,    -1,  1123,   191,   506,    -1,   508,
      -1,    -1,  1130,    -1,    -1,    -1,   201,   516,   203,   518,
      -1,   163,    -1,    -1,    -1,    -1,    -1,  1145,  1146,  1872,
    1873,    -1,    -1,    -1,  1152,  1153,    -1,    -1,  1156,  1157,
      -1,    -1,    -1,    -1,    -1,    -1,   231,    -1,    -1,   191,
     549,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   244,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   254,
      -1,   256,    -1,    -1,    -1,    -1,    -1,   758,    -1,    -1,
      -1,    -1,    -1,    -1,   765,    -1,    -1,   768,   769,   231,
      -1,    -1,   234,   235,   236,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   788,    -1,    -1,
      -1,    -1,    -1,   255,   795,    -1,    -1,    -1,    -1,   800,
      -1,   802,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   274,    -1,    -1,    -1,    -1,    -1,   280,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   288,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   349,    -1,   351,    -1,    -1,    -1,
      -1,    -1,   853,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   870,
     871,    -1,    -1,    -1,    -1,    -1,    -1,   878,   879,    -1,
      -1,    -1,    -1,   388,    -1,    -1,    -1,    -1,    -1,   890,
      -1,  1329,    -1,    -1,  1332,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   904,   905,   906,    -1,   369,    -1,   371,
     372,   912,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1373,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1394,    -1,    -1,    -1,
      -1,   423,    -1,    -1,    -1,    -1,    -1,  1405,  1406,  1407,
    1408,    -1,    -1,    -1,   479,    -1,   481,    -1,    -1,    -1,
      -1,   800,    -1,    -1,   489,   490,    -1,    -1,    -1,    -1,
      -1,    -1,   993,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   506,    -1,   508,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   516,    -1,   518,    -1,   477,    -1,    -1,    -1,    -1,
     996,   840,   484,   999,    -1,    -1,    -1,  1465,   847,   848,
      83,    -1,  1008,    -1,   853,    -1,  1474,  1475,   857,    -1,
     859,   860,    -1,    -1,   549,    -1,    -1,    -1,    -1,    -1,
      -1,  1052,  1053,  1054,  1055,    -1,    -1,    -1,    -1,    -1,
      -1,  1037,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,  1072,   125,    -1,    -1,    -1,  1052,  1053,  1054,  1055,
      -1,    -1,    -1,    -1,   137,  1086,   139,    -1,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1538,    -1,  1103,  1104,    -1,    -1,    -1,    -1,    -1,    -1,
     163,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   623,    -1,
      -1,    -1,  1123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,
      -1,    -1,    -1,    -1,   596,   597,   598,   599,    -1,    -1,
      -1,   960,    -1,  1581,  1145,  1146,    -1,    -1,    -1,  1587,
      -1,  1152,  1153,    -1,    -1,  1156,  1157,   619,   620,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   628,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,   231,    -1,
     642,   234,   235,   236,    -1,    -1,    -1,   649,   650,   651,
      -1,   653,   654,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   255,    -1,    -1,    -1,   668,    -1,   670,    -1,
      -1,    -1,    -1,    -1,   676,    -1,    -1,   679,  1656,    -1,
      -1,   274,    -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,
      -1,    65,    -1,    -1,  1672,  1673,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,    -1,   800,   758,    -1,    -1,    -1,
      -1,    -1,    -1,   765,    -1,    -1,   768,   769,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   369,    -1,   371,   372,
      -1,    -1,   375,    -1,    -1,    -1,   788,    -1,  1329,    -1,
      -1,  1332,    -1,   795,   387,   840,    -1,    -1,   800,    -1,
     802,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   853,    -1,
      -1,    -1,    -1,    -1,    -1,   860,    -1,    -1,  1796,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1373,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,   440,    -1,    -1,
      -1,   853,    -1,  1394,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,  1405,  1406,  1407,  1408,   870,   871,
      -1,    -1,    -1,    -1,    -1,    -1,   878,   879,    -1,    -1,
      -1,    -1,    -1,    -1,   477,    -1,    -1,    -1,   890,    -1,
      -1,   484,    -1,    -1,  1872,  1873,    -1,    -1,    -1,    65,
      -1,    -1,   904,   905,   906,    71,    72,    73,    -1,    -1,
     912,    -1,    -1,    -1,    -1,   960,    -1,    -1,    84,    85,
      -1,    -1,    -1,    -1,  1465,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,  1474,  1475,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,   117,    -1,    -1,    -1,   121,   122,    -1,   124,   125,
     126,   127,  1478,  1479,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1487,    -1,  1489,  1490,    -1,    -1,  1493,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1501,    -1,    -1,  1504,    -1,
      -1,   993,    -1,    -1,    -1,    -1,    -1,  1538,    -1,    -1,
      -1,    -1,    -1,   596,   597,   598,   599,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1377,    -1,
    1379,    -1,    -1,    -1,    -1,    -1,   619,   620,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1581,    -1,    -1,    -1,    -1,    -1,  1587,    -1,    -1,   642,
    1052,  1053,  1054,  1055,    -1,    83,   649,   650,    -1,    -1,
     653,   654,    -1,    -1,  1605,    -1,    -1,    -1,    -1,    -1,
    1072,    -1,    -1,    -1,    -1,    -1,    -1,   670,    -1,    -1,
      -1,    -1,    -1,   676,  1086,    -1,   679,    -1,    -1,    -1,
      -1,   119,    -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,
      -1,  1103,  1104,    -1,    -1,    -1,  1465,    -1,    -1,   137,
      -1,   139,    -1,   141,    -1,  1656,    -1,    -1,    -1,    -1,
      -1,  1123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,    -1,
      -1,  1672,  1673,    -1,    -1,   163,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1145,  1146,    -1,    -1,    -1,    -1,    -1,
    1152,  1153,    -1,    -1,  1156,  1157,    -1,   236,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   765,    -1,    -1,   768,   769,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   787,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   231,    -1,   798,   234,   235,   236,   288,
    1726,  1727,  1728,  1729,    -1,    -1,  1732,    -1,    -1,    -1,
      -1,  1737,  1738,    -1,  1740,    -1,  1742,   255,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1754,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   274,    -1,    -1,    -1,
      -1,    -1,   280,    -1,    -1,  1796,    -1,  1798,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   871,    -1,
      -1,    -1,    -1,    -1,    -1,   878,   879,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   890,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   388,
      -1,   904,   905,   906,    -1,    -1,    -1,    -1,    -1,   912,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1329,    -1,    -1,
    1332,  1872,  1873,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   369,    -1,   371,   372,    -1,    -1,   375,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   387,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1373,  1888,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1898,    -1,  1900,    -1,   119,    -1,    -1,    -1,
      -1,    -1,  1394,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     993,    -1,    -1,  1405,  1406,  1407,  1408,    -1,    -1,    -1,
      -1,    -1,   440,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1465,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1951,  1952,   170,    -1,  1955,
      -1,  1957,    -1,    -1,  1960,    -1,    -1,    -1,  1964,   477,
      -1,    -1,    -1,    -1,    -1,    -1,   484,    -1,    -1,  1052,
    1053,  1054,  1055,  1465,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1474,  1475,    -1,    -1,    -1,    -1,    -1,  1072,
      -1,  1997,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   571,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   586,    -1,  2025,
    1103,  1104,    -1,    -1,    -1,    -1,    -1,   596,   597,   598,
     599,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1123,    -1,    -1,   266,    -1,    -1,  1538,  1130,    -1,    -1,
      -1,    -1,   275,    -1,    -1,    -1,    -1,    -1,   281,    -1,
      -1,    -1,  1145,  1146,    -1,    -1,    -1,    -1,   637,  1152,
    1153,    -1,    -1,  1156,  1157,    -1,    -1,    -1,   596,   597,
     598,   599,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1581,
      -1,    -1,    -1,   662,    -1,  1587,    -1,    -1,    -1,    -1,
      -1,   619,   620,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,  1605,    -1,    -1,    -1,   686,    -1,    -1,
      -1,    -1,    -1,    -1,   642,    -1,    -1,    -1,    -1,    -1,
      28,   649,   650,    -1,    -1,   653,   654,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   371,    -1,
      -1,    -1,   670,    -1,    -1,   724,    -1,    -1,   676,    -1,
      -1,   679,    -1,   732,  1656,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
    1672,  1673,    -1,   752,    -1,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,   770,   771,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,
      -1,    -1,    -1,   121,   122,    -1,   124,   125,   126,   127,
      -1,   800,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1329,   765,    -1,  1332,
     768,   769,    -1,    -1,   477,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   288,    -1,    -1,   787,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     798,    -1,    -1,    -1,   507,    -1,    -1,    -1,    -1,    -1,
    1373,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1796,    -1,  1798,    -1,    -1,    -1,
      -1,  1394,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,  1405,  1406,  1407,  1408,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   561,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   871,    -1,    -1,    -1,    -1,    -1,    -1,
     878,   879,    -1,    -1,    -1,    -1,   388,    -1,    -1,    -1,
      -1,    -1,   890,    -1,    -1,    -1,    65,    -1,    -1,    -1,
    1872,  1873,    71,    72,    73,    -1,   904,   905,   906,    -1,
      -1,  1474,  1475,    -1,   912,    84,    85,    -1,    -1,    -1,
      -1,   624,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,   996,   117,    -1,
     999,  1000,  1001,   122,  1003,   124,   125,   126,   127,    -1,
      -1,    -1,  1011,    -1,    -1,    -1,    -1,   670,    -1,    -1,
    1019,    -1,    -1,   676,    -1,  1538,   679,  1026,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1037,    -1,
      -1,    -1,    -1,    -1,    -1,   993,  1045,    -1,    -1,    -1,
      -1,  1050,    -1,  1052,  1053,  1054,  1055,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1581,    -1,
      -1,    -1,    -1,    -1,  1587,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1095,    -1,    -1,    -1,
      -1,    -1,  1101,    -1,  1052,  1053,  1054,  1055,    -1,    -1,
      -1,    -1,   765,    -1,    -1,   768,   769,    -1,    -1,   571,
      -1,    -1,    -1,    -1,  1072,  1124,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   586,    -1,    -1,    -1,   590,    -1,
      -1,    -1,    -1,  1656,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1103,  1104,    -1,    -1,  1672,
    1673,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1168,
      -1,    -1,    -1,    -1,    -1,  1123,    -1,    -1,    -1,    -1,
      -1,    -1,  1130,    -1,    -1,   637,   839,    -1,    -1,   842,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1145,  1146,   651,
      -1,    -1,    -1,    -1,  1152,  1153,    -1,    -1,  1156,  1157,
     662,   663,    -1,    -1,    -1,    -1,    -1,    -1,   871,    -1,
      -1,    -1,    -1,    -1,    -1,  1224,    -1,   880,    -1,    -1,
      -1,    -1,    -1,    -1,   686,    -1,    -1,    -1,    -1,  1238,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   904,    -1,   906,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   724,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     732,    -1,    -1,  1796,    -1,    -1,    -1,     0,    -1,    -1,
      -1,    -1,    -1,    -1,  1293,    -1,    -1,    -1,    -1,    -1,
     752,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   962,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   770,   771,
    1319,    -1,    -1,    -1,  1323,    -1,    -1,    -1,    -1,    -1,
      43,    44,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     993,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   800,    -1,
      -1,  1004,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1872,
    1873,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      -1,    84,    -1,    -1,    -1,    -1,    -1,    -1,    91,    92,
      -1,  1329,    -1,    -1,  1332,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,   116,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1373,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1394,   160,    -1,    -1,
      -1,  1104,    -1,  1106,    -1,    -1,    -1,  1405,  1406,  1407,
    1408,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1128,    -1,    -1,   191,  1478,
    1479,    -1,    -1,  1482,    -1,  1484,    -1,    -1,    -1,  1488,
    1489,    -1,    -1,  1146,    -1,  1494,  1495,    -1,  1497,    -1,
    1153,    -1,    -1,    -1,  1157,    -1,    -1,    -1,  1507,    -1,
    1509,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   231,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1474,  1475,    -1,    -1,
      -1,   244,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   254,    -1,   256,    -1,    -1,    -1,    -1,  1000,  1001,
      -1,  1003,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1011,
    1559,    -1,    -1,  1015,    -1,    -1,    -1,  1019,    -1,    -1,
    1569,    -1,    -1,    -1,  1026,  1027,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
    1538,    -1,    -1,  1045,  1046,    -1,    -1,    -1,  1050,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,  1581,    -1,    -1,    -1,    -1,    -1,  1587,
      -1,    -1,    -1,  1095,    -1,    65,    66,    -1,    -1,  1101,
      -1,    71,    72,    73,    74,    75,   369,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,  1124,    -1,    -1,   388,  1329,    -1,    98,  1332,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,    -1,   122,    -1,   124,   125,   126,   127,  1656,    -1,
     423,    -1,    -1,   426,    -1,    -1,  1168,  1169,    -1,    -1,
    1373,    -1,    -1,    -1,  1672,  1673,    -1,  1380,    -1,    -1,
      -1,    -1,    -1,  1732,    -1,  1734,    -1,    -1,    -1,    -1,
      -1,  1394,  1741,    -1,    -1,    -1,  1745,    -1,  1747,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1409,  1756,    -1,    -1,
      -1,    -1,    -1,    -1,  1417,    -1,  1419,    -1,    -1,    -1,
      -1,    -1,  1224,    -1,  1226,    -1,   489,   490,    -1,    -1,
      -1,    -1,    -1,  1436,    -1,    -1,  1238,  1239,    -1,    -1,
      -1,    -1,    -1,   506,    -1,   508,    -1,    -1,    -1,  1798,
      -1,    -1,    -1,   516,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1475,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   549,    -1,    -1,    -1,
      -1,  1293,    -1,  1295,    -1,    -1,    -1,    -1,  1796,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1319,    -1,  1321,
      -1,  1323,    -1,  1325,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1889,  1890,    -1,  1892,    -1,  1894,    -1,    -1,    -1,  1898,
    1899,  1900,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     623,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1872,  1873,    -1,    -1,  1581,    -1,
      -1,    -1,    -1,  1586,  1587,  1588,   649,    -1,    -1,    -1,
     653,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1602,
    1603,    -1,    -1,    -1,  1953,   668,    -1,  1956,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1964,    -1,    -1,    -1,    -1,
      -1,    -1,  1625,  1626,    -1,  1628,  1629,    -1,    -1,    -1,
      -1,  1634,  1635,  1636,  1637,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1646,  1647,  1648,  1649,  1650,  1651,  1652,
    1653,  2000,    -1,  1656,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1673,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1482,  1483,  1484,  1485,    -1,    -1,  1488,  1489,    -1,    -1,
      -1,    -1,  1494,  1495,    -1,  1497,    -1,  1499,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1507,  1508,  1509,    -1,   772,
     773,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   787,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   795,    -1,    -1,   798,   799,   800,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1559,  1560,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1569,  1570,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   840,    -1,    65,
      -1,    -1,    -1,    -1,   847,    71,    72,    73,    -1,    -1,
     853,    -1,    -1,  1796,  1797,    -1,    -1,   860,    84,    85,
      -1,    -1,    -1,    -1,  1807,    -1,    -1,   870,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,   117,    -1,    -1,    -1,   121,   122,    -1,   124,   125,
     126,   127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   912,
       1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1861,    -1,
      -1,  1864,  1865,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    28,  1734,    -1,    85,    86,    87,  1739,    -1,  1741,
    1742,    -1,  1744,  1745,    -1,  1747,    -1,  1749,    -1,   100,
      -1,    -1,    -1,  1755,  1756,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,   118,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      -1,    88,    89,    90,    -1,    -1,  1798,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,    -1,   119,  1086,   121,   122,    -1,   124,   125,   126,
     127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1103,    -1,  1105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1123,    -1,    -1,    -1,    -1,    -1,     1,  1130,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1889,  1890,    -1,
    1892,  1893,  1894,    28,    -1,    -1,    -1,  1899,  1900,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,
      85,  1953,  1954,    -1,  1956,  1957,    -1,    -1,    -1,  1961,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,    -1,    -1,    -1,    -1,   122,    -1,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,    -1,  2000,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,  1347,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,  1375,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,    -1,    -1,
      -1,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,  1465,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,  1675,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,     0,     1,    -1,
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
       0,     1,    -1,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,     0,     1,    -1,     3,     4,     5,     6,
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
     127,   128,   129,   130,   131,   132,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,     0,
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
     131,   132,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,     0,     1,    -1,     3,     4,
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
     125,   126,   127,   128,   129,   130,   131,   132,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
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
     129,   130,   131,   132,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,     0,     1,    -1,
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
       0,     1,    -1,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,     0,     1,    -1,     3,     4,     5,     6,
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
     127,   128,   129,   130,   131,   132,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,     0,
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
     131,   132,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,     0,     1,    -1,     3,     4,
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
     125,   126,   127,   128,   129,   130,   131,   132,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
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
     129,   130,   131,   132,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,     0,     1,    -1,
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
       0,     1,    -1,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,    -1,   124,   125,   126,   127,   128,   129,
     130,   131,   132,     1,    -1,    -1,    -1,    -1,    -1,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,    -1,    -1,   115,   116,   117,
     118,    -1,   120,    -1,   122,    -1,   124,   125,   126,    -1,
     128,   129,   130,   131,   132,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,   120,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
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
     121,   122,    -1,   124,   125,   126,   127,     0,     1,    -1,
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
      -1,   124,   125,   126,   127,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
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
     121,   122,    -1,   124,   125,   126,   127,     0,     1,    -1,
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
      -1,   124,   125,   126,   127,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
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
     121,   122,    -1,   124,   125,   126,   127,     0,     1,    -1,
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
      -1,   124,   125,   126,   127,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
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
     121,   122,    -1,   124,   125,   126,   127,     0,     1,    -1,
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
      -1,   124,   125,   126,   127,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
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
     121,   122,    -1,   124,   125,   126,   127,     0,     1,    -1,
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
      -1,   124,   125,   126,   127,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
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
     121,   122,    -1,   124,   125,   126,   127,     0,     1,    -1,
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
      -1,   124,   125,   126,   127,     0,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,   121,   122,    -1,   124,
     125,   126,   127,     0,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,   121,   122,    -1,   124,   125,   126,
     127,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,    -1,   124,   125,   126,   127,     1,    -1,     3,
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
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,   126,   127,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,    -1,   122,    -1,   124,   125,   126,
     127,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
      -1,    -1,   122,    -1,   124,   125,   126,   127,     1,    -1,
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
      -1,   124,   125,   126,   127,     1,    -1,     3,     4,     5,
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
      -1,   117,   118,   119,    -1,    -1,   122,    -1,   124,   125,
     126,   127,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,    -1,   122,    -1,   124,   125,   126,   127,     1,
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
     122,    -1,   124,   125,   126,   127,     1,    -1,     3,     4,
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
     115,    -1,   117,   118,   119,    -1,    -1,   122,    -1,   124,
     125,   126,   127,     1,    -1,     3,     4,     5,     6,    -1,
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
     118,   119,    -1,    -1,   122,    -1,   124,   125,   126,   127,
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
      -1,   122,    -1,   124,   125,   126,   127,     1,    -1,     3,
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
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,   126,   127,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,    -1,   122,    -1,   124,   125,   126,
     127,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
      -1,    -1,   112,     1,   114,     3,     4,     5,     6,    -1,
       8,     9,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,     1,   114,     3,     4,     5,
       6,    -1,     8,     9,   122,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   122,    -1,   124,   125,
     126,   127,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,     1,   114,     3,     4,     5,     6,   119,     8,     9,
     122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    84,    85,    86,    87,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    28,    -1,    -1,    -1,    -1,
      -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    -1,    88,    89,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,   117,    -1,   119,    -1,   121,   122,
      -1,   124,   125,   126,   127,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    -1,    88,    89,    90,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,    -1,    -1,   119,    -1,   121,   122,    -1,   124,   125,
     126,   127,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,   121,   122,    -1,   124,   125,   126,   127,     1,
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
     122,    -1,   124,   125,   126,   127,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    65,     8,     9,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,    -1,   117,    -1,
      -1,    -1,    -1,   122,    65,   124,   125,   126,   127,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,    -1,    -1,    -1,
      -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    65,     8,     9,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
      -1,    -1,    -1,    -1,   122,    65,   124,   125,   126,   127,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,   117,   118,   119,
      -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    65,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,    -1,    -1,    -1,    -1,   122,    65,   124,   125,   126,
     127,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,    -1,
      -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    65,
       8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,    65,   124,   125,
     126,   127,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,   119,    -1,    -1,   122,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      65,     8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,
      85,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,    -1,    -1,   119,    -1,    -1,   122,    65,   124,
     125,   126,   127,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,    -1,   124,   125,   126,
     127,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    65,     8,     9,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      84,    85,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,    -1,    -1,    -1,    -1,    -1,   122,    65,
     124,   125,   126,   127,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,    -1,    -1,    -1,    -1,   122,    -1,   124,   125,
     126,   127,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    65,     8,     9,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    84,    85,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,
      65,   124,   125,   126,   127,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,    -1,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    65,     8,     9,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    84,    85,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,    65,   124,   125,   126,   127,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    65,     8,     9,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    84,    85,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,   117,    -1,    -1,    -1,
     121,   122,    65,   124,   125,   126,   127,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,   124,   125,   126,   127,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    65,     8,     9,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    84,    85,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,    -1,
      -1,   121,   122,    65,   124,   125,   126,   127,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,   117,    -1,    -1,    -1,   121,
     122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    65,     8,     9,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,
      -1,    -1,   121,   122,    65,   124,   125,   126,   127,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    65,     8,     9,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,
      -1,    -1,    -1,    -1,   122,    65,   124,   125,   126,   127,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,
      -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    65,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,    65,   124,   125,   126,
     127,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,
      -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    65,
       8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,    -1,    -1,    -1,    -1,   122,    65,   124,   125,
     126,   127,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,    -1,
      -1,    -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    65,     8,     9,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,    65,   124,   125,   126,   127,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    65,     8,     9,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,    -1,
      -1,    -1,    -1,    -1,   122,    65,   124,   125,   126,   127,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,
      -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    65,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,    65,   124,   125,   126,
     127,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    65,
       8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,   118,   119,    -1,    -1,   122,    65,   124,   125,
     126,   127,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,
      -1,    -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    65,     8,     9,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    84,    85,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,    65,   124,   125,   126,   127,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,    -1,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    65,     8,     9,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,    -1,    -1,   121,   122,    65,   124,   125,   126,   127,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    65,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,    65,   124,   125,   126,
     127,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    65,
       8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,    65,   124,   125,
     126,   127,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,    -1,    -1,   122,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      65,     8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,
      85,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,    65,   124,
     125,   126,   127,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,    -1,   124,   125,   126,
     127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    65,     8,     9,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    84,    85,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,    65,   124,   125,   126,   127,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,   121,   122,
      -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    65,     8,     9,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    84,    85,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
      -1,    -1,   122,    65,   124,   125,   126,   127,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    65,     8,     9,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   122,    65,   124,   125,   126,   127,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,
      -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    65,     8,     9,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,    -1,    -1,   122,    65,   124,   125,   126,   127,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    65,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,    65,   124,   125,   126,
     127,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   122,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    65,
       8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,    65,   124,   125,
     126,   127,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   122,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      65,     8,     9,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,
      85,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,    65,   124,
     125,   126,   127,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,    -1,   124,   125,   126,
     127,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    65,     8,     9,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      84,    85,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,    65,
     124,   125,   126,   127,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   122,    -1,   124,   125,
     126,   127,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    65,     8,     9,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    84,    85,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
      65,   124,   125,   126,   127,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,    -1,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    65,     8,     9,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    84,    85,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     122,    65,   124,   125,   126,   127,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,    -1,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    65,     8,     9,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    84,    85,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,    65,   124,   125,   126,   127,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
      -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,     0,     1,    -1,     3,     4,
       5,    -1,   122,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,     0,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,     0,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,     0,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
      -1,     3,     4,     5,    -1,   122,    -1,    -1,    -1,    -1,
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
     122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,     0,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      -1,    -1,    -1,    -1,    -1,   122,    -1,    29,    30,    31,
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
      -1,    -1,    -1,   115,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,    96,
      -1,    -1,    99,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    -1,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     1,    96,     3,    -1,    99,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,   119,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   122,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
      -1,   124,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    76,    77,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
     100,    -1,    -1,    -1,    -1,   105,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   121,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,    -1,    -1,   121,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,    -1,    -1,    -1,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,    -1,    -1,
      -1,    -1,    -1,   121,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,     1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   115,    -1,   117,   118,    28,
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
      87,    -1,    -1,    -1,     0,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    53,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      76,    77,    -1,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,   101,    -1,    -1,    -1,   105,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,   107,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
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
      86,    87,    -1,    -1,    -1,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,   107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,    -1,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    76,    77,    -1,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,     0,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,   101,    -1,
      -1,    -1,   105,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,    -1,    28,    29,    30,    31,    32,    33,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    28,    29,    30,
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
     100,   101,   105,   109,   112,   115,   134,   135,   136,   138,
     163,   200,   201,   202,   203,   204,   205,   259,   262,   263,
     266,   267,   268,   269,   270,   271,   272,   274,   278,   281,
     282,   283,   284,   285,   286,   291,   292,   300,   301,   302,
     305,   306,   309,   313,   340,   343,   344,   362,   363,   365,
     366,   367,   368,   369,   370,    77,   121,     5,    31,   205,
     364,   205,   112,   112,   112,   138,   205,   364,   272,   273,
     305,   309,   205,   300,   302,   304,   305,   309,   312,   110,
     115,   135,   136,   205,   119,   121,   115,   119,   118,   109,
     110,   200,   205,   119,   138,   205,   119,   121,   118,   110,
     119,   121,   119,   118,   119,   136,   205,     1,    31,   115,
     134,   202,   204,   205,   259,   269,   270,   272,   274,   302,
     305,   309,   312,   313,   321,   322,   323,   324,   323,   112,
     122,     1,    29,    30,    31,    32,    33,    65,   113,   134,
     205,   258,   262,   264,   265,   272,   274,   278,   279,   280,
     286,   290,   298,   299,   327,   328,   329,   330,   331,   332,
     302,   309,   302,   305,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    46,    47,    66,    85,    87,   100,
     119,   138,   159,   160,   258,   263,   264,   272,   275,   279,
     281,   289,   342,   345,   346,   347,   352,   353,   354,    31,
      76,   121,   202,   204,   291,   343,   344,   362,   363,   370,
       1,   202,   268,   285,   291,   313,   340,   366,     1,   365,
     366,     0,   205,   364,   364,     5,   116,   364,     1,     4,
       6,     8,     9,    65,    71,    72,    73,    84,    85,    98,
     102,   103,   104,   105,   106,   107,   108,   109,   112,   114,
     122,   124,   125,   126,   127,   138,   164,   165,   205,   206,
     207,   210,   211,   215,   216,   218,   219,   220,   221,   222,
     223,   224,   225,   226,   227,   228,   229,   230,   231,   232,
     236,   238,   239,   241,   242,   243,   244,   245,   246,   247,
     248,   249,   250,   251,   252,   364,   376,   377,   378,   379,
     135,   205,   119,   138,   205,   272,   309,   300,   302,   309,
     304,   305,   113,   305,    85,   138,   189,   190,   192,   194,
     198,   199,   205,   216,   230,   231,   239,   251,   256,   289,
     115,   110,   110,   115,     1,    68,    78,    80,    81,    85,
      88,    91,    92,    93,    94,    96,    98,    99,   112,   114,
     115,   118,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   161,   162,   164,   165,   168,   169,   170,   171,   172,
     173,   174,   175,   176,   177,   181,   185,   186,   187,   188,
     205,   211,   236,   290,   301,   303,   305,   309,   313,   314,
     341,    80,    81,   205,   258,   262,   272,   275,   278,   286,
     293,   294,     1,   118,   187,   188,   136,   205,     1,   205,
     260,   261,     1,   118,   261,   294,    65,   189,   191,   193,
     195,   196,   197,   205,     1,   118,   187,   188,   294,     1,
     118,   187,   188,     1,   118,   187,   188,   119,   302,   309,
     302,   305,     1,   116,   346,   353,   354,     1,   115,   117,
     117,   115,   123,   135,   205,   252,   256,   257,   117,   119,
     138,   205,   118,   119,   118,   119,   112,   122,   124,   134,
     205,   258,   264,   272,   274,   279,   305,   307,   309,   310,
     312,     1,   113,   117,     1,   113,   117,     1,   117,     1,
     117,   113,   113,   302,   302,   112,   112,     1,   115,     1,
     118,     1,   115,   205,   258,   264,   272,   275,   279,   305,
     323,   324,     1,   115,     1,   342,   345,   353,   354,   342,
     345,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    79,    86,    88,    89,    90,   115,   121,   182,
     183,   184,   205,   211,   216,   232,   234,   239,   252,   253,
     254,   333,   334,   337,   338,   339,   346,   347,   348,   349,
     350,   351,   353,   354,   356,   357,   358,   359,   360,   361,
     118,    31,   205,   364,   205,   200,   201,   203,   204,   313,
     346,   354,   202,   291,   116,   231,   113,     1,   112,   165,
     207,   212,   215,   217,   237,   238,   240,   112,   216,   239,
     216,   239,   112,   205,   258,   264,   272,   275,   279,   297,
     256,   112,   112,   297,   256,   112,   112,   112,   112,   112,
     113,   232,   234,   254,   264,   272,   274,   279,   287,   325,
     119,   166,   167,   208,   213,   232,   119,     1,   118,   119,
       1,     7,     8,     9,   112,   120,   122,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   116,   233,   167,
     208,   209,   219,   241,   109,   128,   129,   125,   126,    10,
      11,   222,   244,    12,    13,   110,   111,    14,    15,   124,
     130,   131,    16,    17,   132,   233,   113,     7,     8,     9,
     112,   120,   122,   233,   109,   128,   129,   125,   126,    10,
      11,    12,    13,   110,   111,    14,    15,   124,   130,   131,
      16,    17,   132,   233,   113,   113,   107,   205,   290,   371,
     374,   375,   119,   119,   304,   116,    11,   111,   117,   116,
     132,   132,   112,   305,   309,   310,    65,   189,   197,   205,
     197,     1,   205,   258,   272,   275,   286,   295,   290,   313,
     314,   112,   138,   205,   205,   290,     1,   112,   295,   109,
     112,   205,   290,   115,   353,   354,   353,   354,   353,   115,
     353,   354,   115,   115,     1,   118,   115,     1,     1,   115,
     117,   117,    69,    70,    91,    95,    97,   118,    69,    70,
     118,   115,     1,   185,   186,     1,   185,   186,     1,   116,
     112,   115,   121,   205,   276,   277,   300,   305,   309,   313,
     314,   315,     1,   290,   298,   329,   303,   309,   303,   305,
     112,   121,   145,   146,   161,   162,   164,   165,   174,   205,
     290,   110,   138,   205,   205,   258,   272,   275,   110,   110,
     116,   117,     1,   115,   119,    28,   137,   205,   205,   111,
     117,   116,   115,   117,   118,   147,   148,   149,   150,   151,
     152,   153,   154,   155,   156,   157,   158,   208,   209,   211,
     231,   252,   289,   318,   319,   302,   302,     1,   119,   232,
     253,   316,   317,   353,   354,   321,   322,   321,   322,   123,
     123,   123,    51,   327,   328,     1,   261,   119,   119,     1,
     118,   187,   188,     1,   118,   187,   188,   113,   205,   298,
     299,   310,   331,   332,   123,   135,   256,   257,   312,   307,
     309,   112,   122,   307,     1,     1,   117,     1,    51,   205,
     327,   328,   117,     1,    51,   205,   327,   328,   117,     1,
      51,   205,   327,   328,   117,    51,   205,   327,   328,   232,
     135,   205,   118,   119,   115,   115,   121,   256,   257,   121,
     112,   112,     1,   112,    52,    53,    54,    56,    57,    58,
      59,    62,    79,    86,   205,   254,   333,   356,   360,   112,
     205,   115,   115,   115,   208,   209,   234,   254,   112,   272,
     112,   112,   178,   205,   115,   115,   115,   121,   120,   233,
       1,   120,     1,   115,   117,   234,   254,   233,   113,   117,
     234,     1,   348,   349,   348,   349,   333,   334,   342,   345,
     333,   334,   342,   345,     1,     1,   364,   364,   136,   205,
     119,   119,   346,   354,   354,   231,   115,    65,   134,   205,
     216,   239,   264,   272,   274,   279,   288,   326,     1,     1,
       7,     8,     9,   112,   120,   122,     7,     8,     9,   112,
     120,   122,   205,   289,   110,   112,   122,   205,   258,   264,
     272,   275,   279,   305,   308,   309,   311,   205,   258,   264,
     272,   275,   279,   296,   234,   325,   353,   205,   122,   311,
     296,   232,   364,   364,   364,   232,   113,   205,   264,   272,
     274,   279,   310,   113,     1,   157,   158,     1,   118,   117,
     123,     1,   157,   158,   118,     1,   157,   158,     1,   205,
       1,   113,   209,   213,   214,   253,     1,   205,   234,   254,
     208,   232,     1,   219,   241,   219,   241,   219,   241,     1,
     220,   242,     1,   220,   242,   221,   243,   221,   243,   222,
     244,   222,   244,   222,   244,     1,   208,   209,   224,   245,
       1,   208,   209,   224,   245,   208,   209,   225,   246,   208,
     209,   226,   247,   208,   209,   227,   248,   228,   249,   229,
     250,   121,   208,   209,   234,   235,   254,   255,   208,   232,
       1,   205,     1,   113,   213,   214,     1,   205,   234,   254,
     208,   232,   219,   241,   219,   241,   219,   241,     1,   220,
     242,     1,   220,   242,   221,   243,   221,   243,   222,   244,
     222,   244,   222,   244,   222,   244,     1,   208,   209,   224,
     245,     1,   208,   209,   224,   245,   208,   209,   225,   246,
     208,   209,   226,   247,   208,   209,   227,   248,   228,   249,
     229,   250,   121,   234,   235,   254,   255,   208,   232,   110,
     111,   205,   372,   373,   205,   118,   371,   374,   375,   375,
     189,   190,   192,   194,   205,   198,   190,   192,   194,   234,
     235,   254,   255,   234,   235,   254,   255,   309,   111,   116,
     111,   119,   110,   119,   205,   258,   272,   275,   310,   313,
     314,   178,   115,   115,   115,   277,   300,   305,   309,   119,
     205,   119,   205,   310,   205,   112,   118,   168,   169,   168,
     169,   353,   353,   353,   364,   353,   353,     1,   318,   319,
     113,   256,   257,   119,   115,   117,   300,   309,   300,   305,
     121,   306,   205,   112,   303,   303,   205,   115,     1,   115,
       1,   115,   277,   199,   110,   197,   197,   256,   257,   260,
     187,   188,     1,   118,   261,   116,   121,   116,   121,   116,
     196,   192,   205,   353,   354,     1,   115,   117,   115,   117,
     115,   149,   150,   153,   154,   155,   118,   147,   150,   115,
     118,   149,   150,   153,   154,   155,   116,   313,   314,   315,
     316,   317,   320,     1,   118,   261,     1,   118,   261,   113,
     113,   113,   123,   123,   123,   307,   113,   331,   332,   123,
     135,   256,   257,   327,   328,   290,   327,   327,   327,   328,
     113,   113,   113,     1,   157,   158,   333,   334,   121,   121,
     333,   334,   234,   254,   234,   254,     1,   113,   234,   254,
     121,   256,   257,   121,   112,   112,   333,   112,   209,   254,
     112,   121,    56,     1,   113,   115,   205,   234,   254,   355,
     115,   115,   115,   115,   115,   364,   112,   232,   232,   205,
     333,   334,    90,     1,   209,   253,    88,    89,    90,     1,
     232,   253,     1,   209,   253,     1,   232,   253,   110,   354,
     115,   134,   135,   113,   134,   264,   272,   274,   279,   310,
     113,     1,   205,     1,   113,   213,   214,     1,   205,   234,
     254,     1,   205,     1,   113,   213,   214,     1,   205,   234,
     254,   113,   113,   310,   199,   113,   311,   331,   332,   256,
     257,   110,   308,   309,   112,   308,   122,   110,   122,   205,
     258,   264,   272,   275,   279,   311,   113,   113,   113,   113,
     256,   257,   122,   122,   311,   117,   113,   117,   117,   117,
     219,   241,     1,   118,   208,   232,     1,     1,   113,   117,
     113,   123,   123,     1,   117,   121,   121,   117,   121,   121,
     113,   117,   123,   123,   121,   121,   121,   121,   205,   205,
     115,   117,   205,   364,   118,   118,   121,   121,   121,   121,
     121,   121,   121,   121,   192,   199,   110,   119,   119,   205,
     113,   115,   300,   309,   300,   305,   113,   119,   119,   205,
     113,     1,   157,   158,   276,   305,   300,   300,   256,   257,
     112,   113,   115,   111,   199,   111,   111,   115,     1,   115,
     190,   205,   189,   190,   189,   194,     1,   151,   152,     1,
     151,   152,   354,     1,   318,   319,   117,   118,   316,   317,
       1,   115,     1,   115,   113,   113,   123,   123,   123,   310,
     312,     1,   333,   334,   333,   334,   113,   113,   113,   113,
       1,   333,   113,     1,   234,   333,   334,   121,   121,   254,
     113,   234,   254,    56,   254,   355,   364,   112,   333,   121,
     115,     1,   115,     1,   113,   254,   355,     3,   113,   121,
     364,   113,   113,   117,   112,   112,   178,   113,   113,     1,
     113,   117,   113,   123,   123,   113,   117,   123,   123,   113,
     111,   113,   113,   113,   123,   123,   199,   308,   113,   331,
     332,   256,   257,   199,   256,   257,   110,   122,   112,   119,
     316,   123,   123,   256,   257,   256,   257,   122,   325,   205,
     205,   232,     1,   209,   253,   208,   209,   208,   209,   231,
     251,   208,   209,   231,   251,   208,   209,   208,   209,   231,
     251,   208,   209,   231,   251,     1,   208,   209,   231,   251,
     208,   209,   231,   251,   208,   209,   231,   251,   208,   209,
     231,   251,   372,   115,   115,   111,   199,   119,   353,   300,
     300,   116,   119,     1,   121,   121,   111,   187,   188,   115,
     187,   188,   116,   116,   118,   316,   317,     1,   187,   188,
     187,   188,   333,   333,   333,   333,   333,   334,   113,   112,
     355,   113,   234,   254,   234,   333,     1,     1,   113,   234,
     254,   335,   336,   364,   115,   336,     3,   113,   121,   119,
     178,   232,   232,     1,     1,     1,     1,   111,   113,   113,
     123,   123,   111,   123,   123,   199,   256,   257,   325,   320,
     123,   123,   123,   123,   256,   257,   113,   113,   113,   113,
     111,   318,   256,   257,   256,   257,   187,   188,   190,   190,
       1,    64,    64,   234,   254,   113,   234,   254,   113,   115,
     113,   115,   333,   334,   113,   333,   334,   113,   117,   121,
     112,     3,   113,   121,   336,   115,   336,    73,   178,   179,
     180,   113,   113,   113,   117,   111,   123,   123,   113,   117,
     118,   123,   123,   115,   333,   333,   113,   113,   115,   333,
     234,   333,   334,   115,   335,   336,   232,   336,   115,   336,
     113,   121,     3,   113,   121,   353,   353,   118,   179,   119,
     178,   219,   241,   316,   118,   113,   113,   113,   113,   113,
     121,   115,   336,   336,   115,   336,   180,   113,   333,   115,
     115,   115,   336,   113,   113,   113,   121,   118,   113,   115,
     115,   115,   336,   115,   113,   115
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
      case 135: /* type */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10019 "grammar.ec"
        break;
      case 139: /* class_function_definition_start */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10024 "grammar.ec"
        break;
      case 140: /* constructor_function_definition_start */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10029 "grammar.ec"
        break;
      case 141: /* destructor_function_definition_start */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10034 "grammar.ec"
        break;
      case 142: /* virtual_class_function_definition_start */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10039 "grammar.ec"
        break;
      case 143: /* class_function_definition_start_error */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10044 "grammar.ec"
        break;
      case 144: /* virtual_class_function_definition_start_error */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10049 "grammar.ec"
        break;
      case 145: /* class_function_definition */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10054 "grammar.ec"
        break;
      case 146: /* class_function_definition_error */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10059 "grammar.ec"
        break;
      case 147: /* instance_class_function_definition_start */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10064 "grammar.ec"
        break;
      case 148: /* instance_class_function_definition_start_error */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10069 "grammar.ec"
        break;
      case 149: /* instance_class_function_definition */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10074 "grammar.ec"
        break;
      case 150: /* instance_class_function_definition_error */
#line 232 "grammar.y"
        { FreeClassFunction((yyvaluep->classFunction)); };
#line 10079 "grammar.ec"
        break;
      case 151: /* data_member_initialization */
#line 230 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10084 "grammar.ec"
        break;
      case 152: /* data_member_initialization_error */
#line 230 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10089 "grammar.ec"
        break;
      case 153: /* data_member_initialization_list */
#line 252 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10094 "grammar.ec"
        break;
      case 154: /* data_member_initialization_list_error */
#line 252 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10099 "grammar.ec"
        break;
      case 155: /* data_member_initialization_list_coloned */
#line 252 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10104 "grammar.ec"
        break;
      case 156: /* members_initialization_list_coloned */
#line 253 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10109 "grammar.ec"
        break;
      case 157: /* members_initialization_list */
#line 253 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10114 "grammar.ec"
        break;
      case 158: /* members_initialization_list_error */
#line 253 "grammar.y"
        { FreeList((yyvaluep->list), FreeMembersInit); };
#line 10119 "grammar.ec"
        break;
      case 159: /* instantiation_named */
#line 228 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10124 "grammar.ec"
        break;
      case 160: /* instantiation_named_error */
#line 228 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10129 "grammar.ec"
        break;
      case 164: /* instantiation_unnamed */
#line 228 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10134 "grammar.ec"
        break;
      case 165: /* instantiation_unnamed_error */
#line 228 "grammar.y"
        { FreeInstance((yyvaluep->instance)); };
#line 10139 "grammar.ec"
        break;
      case 168: /* default_property */
#line 230 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10144 "grammar.ec"
        break;
      case 169: /* default_property_error */
#line 230 "grammar.y"
        { FreeMemberInit((yyvaluep->memberInit)); };
#line 10149 "grammar.ec"
        break;
      case 170: /* default_property_list */
#line 252 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10154 "grammar.ec"
        break;
      case 171: /* default_property_list_error */
#line 252 "grammar.y"
        { FreeList((yyvaluep->list), FreeMemberInit); };
#line 10159 "grammar.ec"
        break;
      case 174: /* property */
#line 239 "grammar.y"
        { FreeProperty((yyvaluep->prop)); };
#line 10164 "grammar.ec"
        break;
      case 185: /* struct_declaration */
#line 237 "grammar.y"
        { FreeClassDef((yyvaluep->classDef)); };
#line 10169 "grammar.ec"
        break;
      case 186: /* struct_declaration_error */
#line 237 "grammar.y"
        { FreeClassDef((yyvaluep->classDef)); };
#line 10174 "grammar.ec"
        break;
      case 187: /* struct_declaration_list */
#line 251 "grammar.y"
        { FreeList((yyvaluep->list), FreeClassDef); };
#line 10179 "grammar.ec"
        break;
      case 188: /* struct_declaration_list_error */
#line 251 "grammar.y"
        { FreeList((yyvaluep->list), FreeClassDef); };
#line 10184 "grammar.ec"
        break;
      case 202: /* class */
#line 236 "grammar.y"
        { FreeClass((yyvaluep->_class)); };
#line 10189 "grammar.ec"
        break;
      case 204: /* class_error */
#line 236 "grammar.y"
        { FreeClass((yyvaluep->_class)); };
#line 10194 "grammar.ec"
        break;
      case 205: /* identifier */
#line 194 "grammar.y"
        { FreeIdentifier((yyvaluep->id)); };
#line 10199 "grammar.ec"
        break;
      case 206: /* primary_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10204 "grammar.ec"
        break;
      case 210: /* primary_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10209 "grammar.ec"
        break;
      case 211: /* postfix_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10214 "grammar.ec"
        break;
      case 213: /* argument_expression_list */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10219 "grammar.ec"
        break;
      case 214: /* argument_expression_list_error */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10224 "grammar.ec"
        break;
      case 216: /* unary_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10229 "grammar.ec"
        break;
      case 219: /* cast_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10234 "grammar.ec"
        break;
      case 220: /* multiplicative_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10239 "grammar.ec"
        break;
      case 221: /* additive_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10244 "grammar.ec"
        break;
      case 222: /* shift_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10249 "grammar.ec"
        break;
      case 224: /* relational_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10254 "grammar.ec"
        break;
      case 225: /* equality_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10259 "grammar.ec"
        break;
      case 226: /* and_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10264 "grammar.ec"
        break;
      case 227: /* exclusive_or_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10269 "grammar.ec"
        break;
      case 228: /* inclusive_or_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10274 "grammar.ec"
        break;
      case 229: /* logical_and_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10279 "grammar.ec"
        break;
      case 230: /* logical_or_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10284 "grammar.ec"
        break;
      case 231: /* conditional_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10289 "grammar.ec"
        break;
      case 232: /* assignment_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10294 "grammar.ec"
        break;
      case 234: /* expression */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10299 "grammar.ec"
        break;
      case 236: /* postfix_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10304 "grammar.ec"
        break;
      case 239: /* unary_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10309 "grammar.ec"
        break;
      case 241: /* cast_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10314 "grammar.ec"
        break;
      case 242: /* multiplicative_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10319 "grammar.ec"
        break;
      case 243: /* additive_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10324 "grammar.ec"
        break;
      case 244: /* shift_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10329 "grammar.ec"
        break;
      case 245: /* relational_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10334 "grammar.ec"
        break;
      case 246: /* equality_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10339 "grammar.ec"
        break;
      case 247: /* and_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10344 "grammar.ec"
        break;
      case 248: /* exclusive_or_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10349 "grammar.ec"
        break;
      case 249: /* inclusive_or_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10354 "grammar.ec"
        break;
      case 250: /* logical_and_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10359 "grammar.ec"
        break;
      case 251: /* logical_or_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10364 "grammar.ec"
        break;
      case 252: /* conditional_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10369 "grammar.ec"
        break;
      case 253: /* assignment_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10374 "grammar.ec"
        break;
      case 254: /* expression_error */
#line 241 "grammar.y"
        { FreeList((yyvaluep->list), FreeExpression); };
#line 10379 "grammar.ec"
        break;
      case 256: /* constant_expression */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10384 "grammar.ec"
        break;
      case 257: /* constant_expression_error */
#line 196 "grammar.y"
        { FreeExpression((yyvaluep->exp)); };
#line 10389 "grammar.ec"
        break;
      case 258: /* storage_class_specifier */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10394 "grammar.ec"
        break;
      case 259: /* external_storage_class_specifier */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10399 "grammar.ec"
        break;
      case 260: /* enumerator */
#line 211 "grammar.y"
        { FreeEnumerator((yyvaluep->enumerator)); };
#line 10404 "grammar.ec"
        break;
      case 261: /* enumerator_list */
#line 242 "grammar.y"
        { FreeList((yyvaluep->list), FreeEnumerator); };
#line 10409 "grammar.ec"
        break;
      case 265: /* enum_specifier_compound_error */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10414 "grammar.ec"
        break;
      case 269: /* class_specifier */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10419 "grammar.ec"
        break;
      case 270: /* class_specifier_error */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10424 "grammar.ec"
        break;
      case 271: /* ext_storage */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10429 "grammar.ec"
        break;
      case 272: /* type_qualifier */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10434 "grammar.ec"
        break;
      case 273: /* type_qualifier_list */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10439 "grammar.ec"
        break;
      case 274: /* type_specifier */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10444 "grammar.ec"
        break;
      case 276: /* struct_declarator */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10449 "grammar.ec"
        break;
      case 277: /* struct_declarator_list */
#line 244 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclarator); };
#line 10454 "grammar.ec"
        break;
      case 279: /* struct_or_union_specifier_compound */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10459 "grammar.ec"
        break;
      case 280: /* struct_or_union_specifier_compound_error */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10464 "grammar.ec"
        break;
      case 281: /* struct_or_union_specifier_nocompound */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10469 "grammar.ec"
        break;
      case 284: /* struct_class */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10474 "grammar.ec"
        break;
      case 285: /* struct_class_error */
#line 207 "grammar.y"
        { FreeSpecifier((yyvaluep->specifier)); };
#line 10479 "grammar.ec"
        break;
      case 287: /* specifier_qualifier_list */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10484 "grammar.ec"
        break;
      case 289: /* declaration_specifiers */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10489 "grammar.ec"
        break;
      case 293: /* _inheritance_specifiers */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10494 "grammar.ec"
        break;
      case 294: /* inheritance_specifiers */
#line 243 "grammar.y"
        { FreeList((yyvaluep->list), FreeSpecifier); };
#line 10499 "grammar.ec"
        break;
      case 298: /* identifier_list_error */
#line 248 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10504 "grammar.ec"
        break;
      case 299: /* identifier_list */
#line 248 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10509 "grammar.ec"
        break;
      case 300: /* direct_declarator_nofunction */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10514 "grammar.ec"
        break;
      case 301: /* direct_declarator_function_start */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10519 "grammar.ec"
        break;
      case 302: /* direct_declarator_function */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10524 "grammar.ec"
        break;
      case 303: /* direct_declarator_function_error */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10529 "grammar.ec"
        break;
      case 304: /* direct_declarator */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10534 "grammar.ec"
        break;
      case 305: /* ext_decl */
#line 238 "grammar.y"
        { delete (yyvaluep->string); };
#line 10539 "grammar.ec"
        break;
      case 307: /* direct_abstract_declarator */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10544 "grammar.ec"
        break;
      case 308: /* direct_abstract_declarator_noarray */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10549 "grammar.ec"
        break;
      case 309: /* pointer */
#line 195 "grammar.y"
        { FreePointer((yyvaluep->pointer)); };
#line 10554 "grammar.ec"
        break;
      case 310: /* abstract_declarator */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10559 "grammar.ec"
        break;
      case 311: /* abstract_declarator_noarray */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10564 "grammar.ec"
        break;
      case 312: /* declarator */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10569 "grammar.ec"
        break;
      case 313: /* declarator_function */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10574 "grammar.ec"
        break;
      case 314: /* declarator_function_error */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10579 "grammar.ec"
        break;
      case 315: /* declarator_nofunction */
#line 212 "grammar.y"
        { FreeDeclarator((yyvaluep->declarator)); };
#line 10584 "grammar.ec"
        break;
      case 316: /* initializer */
#line 217 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10589 "grammar.ec"
        break;
      case 317: /* initializer_error */
#line 217 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10594 "grammar.ec"
        break;
      case 318: /* initializer_condition */
#line 217 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10599 "grammar.ec"
        break;
      case 319: /* initializer_condition_error */
#line 217 "grammar.y"
        { FreeInitializer((yyvaluep->initializer)); };
#line 10604 "grammar.ec"
        break;
      case 320: /* initializer_list */
#line 246 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitializer); };
#line 10609 "grammar.ec"
        break;
      case 321: /* init_declarator */
#line 218 "grammar.y"
        { FreeInitDeclarator((yyvaluep->initDeclarator)); };
#line 10614 "grammar.ec"
        break;
      case 322: /* init_declarator_error */
#line 218 "grammar.y"
        { FreeInitDeclarator((yyvaluep->initDeclarator)); };
#line 10619 "grammar.ec"
        break;
      case 323: /* init_declarator_list */
#line 247 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitDeclarator); };
#line 10624 "grammar.ec"
        break;
      case 324: /* init_declarator_list_error */
#line 247 "grammar.y"
        { FreeList((yyvaluep->list), FreeInitDeclarator); };
#line 10629 "grammar.ec"
        break;
      case 325: /* type_name */
#line 219 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10634 "grammar.ec"
        break;
      case 326: /* guess_type_name */
#line 219 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10639 "grammar.ec"
        break;
      case 327: /* parameter_declaration */
#line 219 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10644 "grammar.ec"
        break;
      case 328: /* parameter_declaration_error */
#line 219 "grammar.y"
        { FreeTypeName((yyvaluep->typeName)); };
#line 10649 "grammar.ec"
        break;
      case 329: /* parameter_list */
#line 248 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10654 "grammar.ec"
        break;
      case 330: /* parameter_list_error */
#line 248 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10659 "grammar.ec"
        break;
      case 331: /* parameter_type_list */
#line 248 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10664 "grammar.ec"
        break;
      case 332: /* parameter_type_list_error */
#line 248 "grammar.y"
        { FreeList((yyvaluep->list), FreeTypeName); };
#line 10669 "grammar.ec"
        break;
      case 333: /* statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10674 "grammar.ec"
        break;
      case 334: /* statement_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10679 "grammar.ec"
        break;
      case 338: /* labeled_statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10684 "grammar.ec"
        break;
      case 339: /* labeled_statement_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10689 "grammar.ec"
        break;
      case 340: /* declaration_mode */
#line 254 "grammar.y"
        { };
#line 10694 "grammar.ec"
        break;
      case 342: /* declaration */
#line 224 "grammar.y"
        { FreeDeclaration((yyvaluep->declaration)); };
#line 10699 "grammar.ec"
        break;
      case 346: /* declaration_list */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclaration); };
#line 10704 "grammar.ec"
        break;
      case 347: /* declaration_list_error */
#line 245 "grammar.y"
        { FreeList((yyvaluep->list), FreeDeclaration); };
#line 10709 "grammar.ec"
        break;
      case 348: /* statement_list */
#line 249 "grammar.y"
        { FreeList((yyvaluep->list), FreeStatement); };
#line 10714 "grammar.ec"
        break;
      case 349: /* statement_list_error */
#line 249 "grammar.y"
        { FreeList((yyvaluep->list), FreeStatement); };
#line 10719 "grammar.ec"
        break;
      case 350: /* compound_inside */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10724 "grammar.ec"
        break;
      case 351: /* compound_inside_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10729 "grammar.ec"
        break;
      case 353: /* compound_statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10734 "grammar.ec"
        break;
      case 354: /* compound_statement_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10739 "grammar.ec"
        break;
      case 355: /* expression_statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10744 "grammar.ec"
        break;
      case 356: /* selection_statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10749 "grammar.ec"
        break;
      case 357: /* selection_statement_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10754 "grammar.ec"
        break;
      case 358: /* iteration_statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10759 "grammar.ec"
        break;
      case 359: /* iteration_statement_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10764 "grammar.ec"
        break;
      case 360: /* jump_statement */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10769 "grammar.ec"
        break;
      case 361: /* jump_statement_error */
#line 220 "grammar.y"
        { FreeStatement((yyvaluep->stmt)); };
#line 10774 "grammar.ec"
        break;
      case 362: /* function_definition */
#line 225 "grammar.y"
        { FreeFunction((yyvaluep->function)); };
#line 10779 "grammar.ec"
        break;
      case 363: /* function_definition_error */
#line 225 "grammar.y"
        { FreeFunction((yyvaluep->function)); };
#line 10784 "grammar.ec"
        break;
      case 364: /* string_literal */
#line 238 "grammar.y"
        { delete (yyvaluep->string); };
#line 10789 "grammar.ec"
        break;
      case 365: /* external_declaration */
#line 226 "grammar.y"
        { FreeExternal((yyvaluep->external)); };
#line 10794 "grammar.ec"
        break;
      case 366: /* external_declaration_error */
#line 226 "grammar.y"
        { FreeExternal((yyvaluep->external)); };
#line 10799 "grammar.ec"
        break;
      case 367: /* translation_unit_error */
#line 250 "grammar.y"
        { if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };
#line 10804 "grammar.ec"
        break;
      case 368: /* translation_unit */
#line 250 "grammar.y"
        { if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };
#line 10809 "grammar.ec"
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
#line 263 "grammar.y"
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
#line 291 "grammar.y"
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
#line 348 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 5:
#line 350 "grammar.y"
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
#line 449 "grammar.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 7:
#line 453 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 9:
#line 457 "grammar.y"
    { (yyval.specifier) = (yyvsp[-3].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:
#line 459 "grammar.y"
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
#line 508 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:
#line 510 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:
#line 515 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 14:
#line 520 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[-2].list), FreeSpecifier) ;}
    break;

  case 15:
#line 525 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:
#line 527 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:
#line 532 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 18:
#line 534 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 19:
#line 539 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 20:
#line 541 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 21:
#line 546 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 22:
#line 548 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 23:
#line 550 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 24:
#line 552 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 25:
#line 554 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 26:
#line 558 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 27:
#line 563 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 28:
#line 565 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 29:
#line 567 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 30:
#line 569 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 31:
#line 571 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 32:
#line 577 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 33:
#line 579 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, MkDeclaratorFunction((yyvsp[0].declarator), null), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 34:
#line 584 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 35:
#line 589 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 36:
#line 594 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[0].stmt).loc.end; (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 37:
#line 596 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 38:
#line 598 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[0].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 39:
#line 602 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 40:
#line 603 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 41:
#line 607 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 42:
#line 609 "grammar.y"
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
#line 619 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 44:
#line 623 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 45:
#line 625 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 46:
#line 627 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 47:
#line 631 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 48:
#line 633 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 49:
#line 635 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 50:
#line 638 "grammar.y"
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
#line 649 "grammar.y"
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
#line 659 "grammar.y"
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
#line 678 "grammar.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 54:
#line 680 "grammar.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 55:
#line 684 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 56:
#line 685 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 57:
#line 686 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members);  members.loc = (yylsp[0]);  ;}
    break;

  case 58:
#line 687 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 59:
#line 688 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 60:
#line 689 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 61:
#line 690 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 63:
#line 692 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 65:
#line 697 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 66:
#line 698 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 67:
#line 699 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 68:
#line 703 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 69:
#line 704 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 70:
#line 705 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 71:
#line 706 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 72:
#line 707 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 73:
#line 708 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 74:
#line 709 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[-1].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 75:
#line 714 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 76:
#line 716 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 77:
#line 721 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list)); (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 78:
#line 723 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 79:
#line 725 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list)); (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 80:
#line 727 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-2].list), MkExpIdentifier((yyvsp[-1].id)), null); (yyval.instance).exp.loc = (yylsp[-1]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-1]); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 81:
#line 729 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), null);(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 82:
#line 759 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 83:
#line 761 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 84:
#line 766 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list));(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 85:
#line 768 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 86:
#line 770 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), (yyvsp[0].list));(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 87:
#line 772 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-2].list), MkExpIdentifier((yyvsp[-1].id)), null);(yyval.instance).exp.loc = (yylsp[-1]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-1]); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 88:
#line 774 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), null);(yyval.instance).exp.loc = (yylsp[-2]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 89:
#line 803 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 90:
#line 805 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).exp.loc = (yylsp[-3]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 91:
#line 807 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).exp.loc = (yylsp[-2]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 92:
#line 812 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 93:
#line 814 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 94:
#line 819 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 95:
#line 821 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 96:
#line 825 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 97:
#line 827 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-1].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 98:
#line 829 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 99:
#line 831 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 100:
#line 836 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 101:
#line 839 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-1]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-1].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 102:
#line 842 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 103:
#line 845 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 104:
#line 910 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 105:
#line 912 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[-1]).start; ;}
    break;

  case 106:
#line 917 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 107:
#line 919 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 108:
#line 921 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[-1]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 109:
#line 923 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[0]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 110:
#line 925 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[0].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 111:
#line 955 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 112:
#line 959 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 113:
#line 960 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), MkInitializerAssignment(MkExpDummy())); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; (yyval.memberInit).initializer.loc.end = (yylsp[-1]).end; ;}
    break;

  case 114:
#line 961 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-1].exp), null); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 115:
#line 965 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 116:
#line 966 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 117:
#line 967 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 118:
#line 971 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 119:
#line 972 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 120:
#line 973 "grammar.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 122:
#line 979 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 123:
#line 982 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 124:
#line 985 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-1].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 125:
#line 988 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), (yyvsp[-1].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 126:
#line 991 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 128:
#line 997 "grammar.y"
    { (yyvsp[-2].prop).setStmt = (yyvsp[0].stmt); ;}
    break;

  case 129:
#line 999 "grammar.y"
    { (yyvsp[-2].prop).getStmt = (yyvsp[0].stmt); ;}
    break;

  case 130:
#line 1001 "grammar.y"
    { (yyvsp[-2].prop).issetStmt = (yyvsp[0].stmt); ;}
    break;

  case 131:
#line 1003 "grammar.y"
    { (yyvsp[-1].prop).isWatchable = true; ;}
    break;

  case 132:
#line 1005 "grammar.y"
    { (yyvsp[-2].prop).category = (yyvsp[0].string); ;}
    break;

  case 133:
#line 1009 "grammar.y"
    { (yyvsp[-1].prop).loc.end = (yylsp[0]).end; ;}
    break;

  case 134:
#line 1014 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 135:
#line 1017 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 136:
#line 1020 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-1].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 137:
#line 1023 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), (yyvsp[-1].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 138:
#line 1026 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 140:
#line 1032 "grammar.y"
    { (yyvsp[-2].prop).setStmt = (yyvsp[0].stmt); ;}
    break;

  case 141:
#line 1034 "grammar.y"
    { (yyvsp[-2].prop).getStmt = (yyvsp[0].stmt); ;}
    break;

  case 142:
#line 1038 "grammar.y"
    { (yyvsp[-1].prop).loc.end = (yylsp[0]).end; ;}
    break;

  case 143:
#line 1043 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].id)); ;}
    break;

  case 144:
#line 1045 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].id)); ;}
    break;

  case 145:
#line 1050 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 146:
#line 1052 "grammar.y"
    { (yyval.propertyWatch) = MkDeleteWatch((yyvsp[0].stmt)); ;}
    break;

  case 147:
#line 1057 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].propertyWatch)); ;}
    break;

  case 148:
#line 1059 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].propertyWatch)); ;}
    break;

  case 149:
#line 1064 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[-2].list), (yyvsp[0].stmt)); ;}
    break;

  case 150:
#line 1069 "grammar.y"
    { (yyval.stmt) = MkWatchStmt(null, (yyvsp[-4].exp), (yyvsp[-1].list)); ;}
    break;

  case 151:
#line 1071 "grammar.y"
    { (yyval.stmt) = MkWatchStmt((yyvsp[-8].exp), (yyvsp[-4].exp), (yyvsp[-1].list)); ;}
    break;

  case 152:
#line 1076 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[-3].exp), (yyvsp[-1].list)); ;}
    break;

  case 153:
#line 1078 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[-7].exp), (yyvsp[-3].exp), (yyvsp[-1].list)); ;}
    break;

  case 154:
#line 1080 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[-1].exp), null); ;}
    break;

  case 155:
#line 1082 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[-5].exp), (yyvsp[-1].exp), null); ;}
    break;

  case 156:
#line 1087 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, null); ;}
    break;

  case 157:
#line 1089 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, (yyvsp[0].list)); ;}
    break;

  case 158:
#line 1091 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[-2].exp), null); ;}
    break;

  case 159:
#line 1093 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[-3].exp), (yyvsp[0].list)); ;}
    break;

  case 160:
#line 1097 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 161:
#line 1098 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 162:
#line 1099 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 163:
#line 1100 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 164:
#line 1101 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 165:
#line 1102 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 166:
#line 1104 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-3].declMode); ;}
    break;

  case 167:
#line 1105 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 168:
#line 1106 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 169:
#line 1107 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 170:
#line 1108 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 171:
#line 1109 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 172:
#line 1111 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 173:
#line 1112 "grammar.y"
    { (yyval.classDef) = MkClassDefClassData(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 174:
#line 1113 "grammar.y"
    { (yyval.classDef) = MkClassDefClassProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 175:
#line 1114 "grammar.y"
    { (yyval.classDef) = MkClassDefPropertyWatch((yyvsp[-1].propertyWatch)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 176:
#line 1115 "grammar.y"
    { (yyval.classDef) = null; deleteWatchable = true; ;}
    break;

  case 177:
#line 1116 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[-1].id).string); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 178:
#line 1117 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[-1].specifier).name); FreeSpecifier((yyvsp[-1].specifier)); ;}
    break;

  case 179:
#line 1118 "grammar.y"
    { (yyval.classDef) = MkClassDefNoExpansion(); ;}
    break;

  case 180:
#line 1119 "grammar.y"
    { (yyval.classDef) = MkClassDefFixed(); ;}
    break;

  case 181:
#line 1120 "grammar.y"
    { (yyval.classDef) = MkClassDefDesignerDefaultProperty((yyvsp[-1].id)); ;}
    break;

  case 182:
#line 1121 "grammar.y"
    { (yyval.classDef) = MkClassDefClassPropertyValue((yyvsp[-4].id), (yyvsp[-1].initializer)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 183:
#line 1123 "grammar.y"
    { (yyval.classDef) = null; ;}
    break;

  case 184:
#line 1124 "grammar.y"
    { memberAccessStack[defaultMemberAccess] = (yyvsp[-1].declMode); if(defaultMemberAccess == 0) { (yyval.classDef) = MkClassDefMemberAccess(); (yyval.classDef).memberAccess = (yyvsp[-1].declMode); (yyval.classDef).loc = (yyloc); } else (yyval.classDef) = null; ;}
    break;

  case 185:
#line 1126 "grammar.y"
    { (yyval.classDef) = MkClassDefAccessOverride((yyvsp[-3].declMode), (yyvsp[-1].id)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 186:
#line 1130 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyvsp[0].classFunction).loc;  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 187:
#line 1131 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyvsp[-1].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 188:
#line 1132 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyvsp[-1].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 189:
#line 1133 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyvsp[0].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 190:
#line 1134 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyvsp[0].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 191:
#line 1136 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 192:
#line 1137 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 193:
#line 1138 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-2].declMode); ;}
    break;

  case 194:
#line 1139 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 195:
#line 1140 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[0].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[-1].declMode); ;}
    break;

  case 196:
#line 1142 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[0].list)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; ;}
    break;

  case 197:
#line 1146 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 198:
#line 1147 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 199:
#line 1148 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 200:
#line 1152 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 203:
#line 1155 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 204:
#line 1156 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 205:
#line 1160 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); ;}
    break;

  case 206:
#line 1161 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 207:
#line 1162 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[0].id).string)), null); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 208:
#line 1166 "grammar.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[0].templateDatatype)); ;}
    break;

  case 209:
#line 1170 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[0].id), null, null); ;}
    break;

  case 210:
#line 1171 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-2].id), null, (yyvsp[0].templateArgument)); ;}
    break;

  case 211:
#line 1172 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-2].id), (yyvsp[0].templateDatatype), null); ;}
    break;

  case 212:
#line 1173 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[-4].id), (yyvsp[-2].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 213:
#line 1174 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[0].string)), null, null); delete (yyvsp[0].string); ;}
    break;

  case 214:
#line 1175 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-2].string)), null, (yyvsp[0].templateArgument)); ;}
    break;

  case 215:
#line 1176 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-2].string)), (yyvsp[0].templateDatatype), null); ;}
    break;

  case 216:
#line 1177 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[-4].string)), (yyvsp[-2].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 217:
#line 1181 "grammar.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[0].id)); ;}
    break;

  case 218:
#line 1185 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[0].id), dataMember, null); ;}
    break;

  case 219:
#line 1186 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[-2].id), dataMember, (yyvsp[0].templateArgument)); ;}
    break;

  case 220:
#line 1190 "grammar.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); ;}
    break;

  case 221:
#line 1194 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[0].id), (yyvsp[-1].templateDatatype), null); ;}
    break;

  case 222:
#line 1195 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[-2].id), (yyvsp[-3].templateDatatype), (yyvsp[0].templateArgument)); ;}
    break;

  case 226:
#line 1205 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateParameter)); ;}
    break;

  case 227:
#line 1206 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateParameter)); ;}
    break;

  case 231:
#line 1213 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 232:
#line 1214 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 233:
#line 1215 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 234:
#line 1217 "grammar.y"
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
#line 1229 "grammar.y"
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
#line 1241 "grammar.y"
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
#line 1255 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); ;}
    break;

  case 238:
#line 1256 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); ;}
    break;

  case 239:
#line 1261 "grammar.y"
    {
      PushContext();
   ;}
    break;

  case 240:
#line 1266 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); FreeIdentifier((yyvsp[0].id)); (yyval.symbol).nameLoc = (yylsp[0]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 241:
#line 1268 "grammar.y"
    { 
      (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); 
      (yyval.symbol).nameLoc = (yylsp[0]); 
      FreeSpecifier((yyvsp[0].specifier)); 
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   ;}
    break;

  case 242:
#line 1275 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); FreeIdentifier((yyvsp[-2].id)); FreeIdentifier((yyvsp[0].id)); (yyval.symbol).nameLoc = (yylsp[0]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 243:
#line 1276 "grammar.y"
    { (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); FreeIdentifier((yyvsp[-2].id)); (yyval.symbol).nameLoc = (yylsp[0]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[0].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 244:
#line 1278 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-3].id)); (yyval.symbol).nameLoc = (yylsp[-3]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 245:
#line 1280 "grammar.y"
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
#line 1288 "grammar.y"
    { (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-5].id)); FreeIdentifier((yyvsp[-3].id)); (yyval.symbol).nameLoc = (yylsp[-3]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 247:
#line 1289 "grammar.y"
    { (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); (yyval.symbol).templateParams = (yyvsp[-1].list); FreeIdentifier((yyvsp[-5].id)); (yyval.symbol).nameLoc = (yylsp[-3]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[-3].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 248:
#line 1294 "grammar.y"
    {
         (yyval._class).loc = (yyloc);
      ;}
    break;

  case 249:
#line 1300 "grammar.y"
    {
         (yyval._class) = (yyvsp[-1]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[0]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 250:
#line 1307 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, MkList()); (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 251:
#line 1313 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 252:
#line 1320 "grammar.y"
    {
         (yyval._class) = MkClass(DeclClassAddNameSpace(0, (yyvsp[-1].id).string), null, null); FreeIdentifier((yyvsp[-1].id));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 253:
#line 1326 "grammar.y"
    {
         (yyval._class) = MkClass(DeclClass(0, (yyvsp[-1].specifier).name), null, null); FreeSpecifier((yyvsp[-1].specifier));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 254:
#line 1335 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), (yyvsp[0].list), null);
      ;}
    break;

  case 255:
#line 1342 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, (yyvsp[0].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 256:
#line 1348 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = (yyvsp[0].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 257:
#line 1354 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, (yyvsp[0].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 258:
#line 1360 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = (yyvsp[0].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 259:
#line 1366 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[-2].symbol), null, MkList()); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 260:
#line 1372 "grammar.y"
    {
         (yyval._class) = (yyvsp[-2]._class); (yyval._class).definitions = MkList(); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[-1]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 261:
#line 1383 "grammar.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); ;}
    break;

  case 263:
#line 1389 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 264:
#line 1393 "grammar.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 265:
#line 1394 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 266:
#line 1395 "grammar.y"
    { (yyval.exp) = MkExpExtensionCompound((yyvsp[-1].stmt)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 267:
#line 1396 "grammar.y"
    { (yyval.exp) = MkExpExtensionExpression((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 268:
#line 1397 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[-2].typeName), (yyvsp[0].initializer)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 269:
#line 1398 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[-5].typeName), MkInitializerAssignment(MkExpExtensionInitializer((yyvsp[-2].typeName), (yyvsp[0].initializer)))); (yyval.exp).loc = (yyloc); ;}
    break;

  case 270:
#line 1399 "grammar.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 271:
#line 1400 "grammar.y"
    { (yyval.exp) = MkExpString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 272:
#line 1401 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 273:
#line 1402 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 274:
#line 1403 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 275:
#line 1404 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 276:
#line 1405 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 277:
#line 1406 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 278:
#line 1407 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 279:
#line 1408 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 280:
#line 1409 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 281:
#line 1410 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 282:
#line 1411 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 283:
#line 1412 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 284:
#line 1413 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 285:
#line 1414 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 286:
#line 1415 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 287:
#line 1416 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 288:
#line 1417 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 289:
#line 1418 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[-1].list), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 290:
#line 1419 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[-2].list), (yyvsp[-1].declarator)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 291:
#line 1420 "grammar.y"
    { (yyval.exp) = MkExpClass(MkListOne(MkSpecifierName((yyvsp[-1].id).string)), null); FreeIdentifier((yyvsp[-1].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 292:
#line 1421 "grammar.y"
    { (yyval.exp) = MkExpVaArg((yyvsp[-3].exp), (yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 293:
#line 1423 "grammar.y"
    { (yyval.exp) = MkExpClassData((yyvsp[-1].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 298:
#line 1429 "grammar.y"
    { (yyval.exp) = MkExpArray((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 299:
#line 1433 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 300:
#line 1437 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 301:
#line 1441 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[0].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 302:
#line 1442 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[0].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 304:
#line 1448 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 305:
#line 1449 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 306:
#line 1450 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 307:
#line 1451 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 308:
#line 1452 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); if((yyvsp[-1].list)->last) ((Expression)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; ;}
    break;

  case 309:
#line 1453 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 310:
#line 1454 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 311:
#line 1455 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 312:
#line 1456 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 313:
#line 1458 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 314:
#line 1459 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 315:
#line 1460 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 316:
#line 1461 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 317:
#line 1462 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 318:
#line 1463 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 319:
#line 1464 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 320:
#line 1465 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 322:
#line 1471 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 323:
#line 1472 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 324:
#line 1473 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 325:
#line 1474 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 326:
#line 1475 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); if((yyvsp[-1].list)->last) ((Expression)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; ;}
    break;

  case 327:
#line 1476 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 328:
#line 1477 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 329:
#line 1478 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 330:
#line 1479 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 331:
#line 1481 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 332:
#line 1482 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 333:
#line 1483 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 334:
#line 1484 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 335:
#line 1485 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 336:
#line 1486 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 337:
#line 1487 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 338:
#line 1488 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 339:
#line 1492 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 340:
#line 1493 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 341:
#line 1494 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 342:
#line 1495 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 343:
#line 1499 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 344:
#line 1500 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 345:
#line 1501 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 346:
#line 1502 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 347:
#line 1503 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[0]).end; exp.loc.end = (yylsp[0]).end; ListAdd((yyvsp[-1].list), exp); ;}
    break;

  case 348:
#line 1507 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 349:
#line 1508 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 350:
#line 1509 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 351:
#line 1510 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 352:
#line 1511 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 353:
#line 1512 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 354:
#line 1513 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 355:
#line 1514 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-1].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 356:
#line 1515 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-1].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 361:
#line 1529 "grammar.y"
    { (yyval.i) = '&'; ;}
    break;

  case 362:
#line 1530 "grammar.y"
    { (yyval.i) = '*'; ;}
    break;

  case 363:
#line 1531 "grammar.y"
    { (yyval.i) = '+'; ;}
    break;

  case 364:
#line 1532 "grammar.y"
    { (yyval.i) = '-'; ;}
    break;

  case 365:
#line 1533 "grammar.y"
    { (yyval.i) = '~'; ;}
    break;

  case 366:
#line 1534 "grammar.y"
    { (yyval.i) = '!'; ;}
    break;

  case 367:
#line 1535 "grammar.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 368:
#line 1536 "grammar.y"
    { (yyval.i) = _INCREF; ;}
    break;

  case 370:
#line 1541 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 372:
#line 1546 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 373:
#line 1547 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 374:
#line 1548 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 375:
#line 1549 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 376:
#line 1550 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 377:
#line 1551 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 379:
#line 1556 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 380:
#line 1557 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 381:
#line 1558 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 382:
#line 1559 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 384:
#line 1564 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 385:
#line 1565 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 386:
#line 1566 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 387:
#line 1567 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 388:
#line 1572 "grammar.y"
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   ;}
    break;

  case 390:
#line 1580 "grammar.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 391:
#line 1581 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 392:
#line 1582 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 393:
#line 1583 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 394:
#line 1584 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 395:
#line 1585 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 396:
#line 1586 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 397:
#line 1587 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 399:
#line 1592 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 400:
#line 1593 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 401:
#line 1594 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 402:
#line 1595 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 403:
#line 1597 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 404:
#line 1598 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 405:
#line 1599 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 406:
#line 1600 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 408:
#line 1605 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 409:
#line 1606 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 410:
#line 1608 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 411:
#line 1609 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 413:
#line 1614 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 414:
#line 1615 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 415:
#line 1617 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 416:
#line 1618 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 418:
#line 1623 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 419:
#line 1624 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 420:
#line 1626 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 421:
#line 1627 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 423:
#line 1632 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 424:
#line 1633 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 426:
#line 1638 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 427:
#line 1639 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 429:
#line 1644 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 430:
#line 1645 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 431:
#line 1646 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 432:
#line 1647 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 433:
#line 1649 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 434:
#line 1650 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 435:
#line 1651 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 436:
#line 1652 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 437:
#line 1654 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 438:
#line 1655 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 439:
#line 1656 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 440:
#line 1657 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 441:
#line 1659 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 442:
#line 1660 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 443:
#line 1661 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 444:
#line 1662 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 446:
#line 1667 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 447:
#line 1668 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 448:
#line 1669 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 449:
#line 1670 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 450:
#line 1672 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 451:
#line 1673 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 452:
#line 1674 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 453:
#line 1675 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 454:
#line 1679 "grammar.y"
    { (yyval.i) = '='; ;}
    break;

  case 455:
#line 1680 "grammar.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 456:
#line 1681 "grammar.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 457:
#line 1682 "grammar.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 458:
#line 1683 "grammar.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 459:
#line 1684 "grammar.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 460:
#line 1685 "grammar.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 461:
#line 1686 "grammar.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 462:
#line 1687 "grammar.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 463:
#line 1688 "grammar.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 464:
#line 1689 "grammar.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 465:
#line 1693 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 466:
#line 1694 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 467:
#line 1695 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 469:
#line 1700 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 470:
#line 1701 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 471:
#line 1702 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 473:
#line 1707 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); /*printf("Sorry, didn't mean that syntax error\n");*/ ;}
    break;

  case 475:
#line 1709 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 476:
#line 1711 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 477:
#line 1712 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 478:
#line 1714 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 479:
#line 1715 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 480:
#line 1716 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end;(yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 481:
#line 1717 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyloc).end = yylloc.start; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = yylloc.start; /*@2.end; $$.call.argLoc.end.charPos++;*/ ;}
    break;

  case 482:
#line 1718 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 483:
#line 1720 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 484:
#line 1721 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 485:
#line 1722 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 486:
#line 1723 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 487:
#line 1727 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); ;}
    break;

  case 489:
#line 1729 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[-1].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 490:
#line 1731 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 491:
#line 1732 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 492:
#line 1734 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 493:
#line 1735 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 494:
#line 1736 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end;(yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 495:
#line 1737 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyloc).end = yylloc.start; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = yylloc.start; /*@2.end; $$.call.argLoc.end.charPos++;*/ ;}
    break;

  case 496:
#line 1738 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 497:
#line 1740 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), (yyvsp[0].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 498:
#line 1741 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-4].exp), (yyvsp[-2].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-3]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 499:
#line 1742 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList() ); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[-1]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 500:
#line 1743 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 501:
#line 1747 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 502:
#line 1748 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 503:
#line 1749 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 504:
#line 1750 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 505:
#line 1751 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 506:
#line 1752 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 507:
#line 1753 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-2].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 508:
#line 1754 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-2].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 509:
#line 1755 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[-2].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 515:
#line 1771 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 517:
#line 1776 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 518:
#line 1777 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 519:
#line 1778 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 520:
#line 1779 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 521:
#line 1780 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 522:
#line 1781 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 524:
#line 1786 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 525:
#line 1787 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 526:
#line 1788 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 527:
#line 1789 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 528:
#line 1790 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 529:
#line 1791 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 530:
#line 1792 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 531:
#line 1793 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 533:
#line 1798 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 534:
#line 1799 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 535:
#line 1800 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 536:
#line 1801 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 538:
#line 1807 "grammar.y"
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

  case 539:
#line 1856 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 540:
#line 1857 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 541:
#line 1858 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 542:
#line 1859 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 543:
#line 1860 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 544:
#line 1861 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 545:
#line 1862 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 547:
#line 1867 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 548:
#line 1868 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 549:
#line 1869 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 550:
#line 1870 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 551:
#line 1872 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 552:
#line 1873 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 553:
#line 1874 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 554:
#line 1875 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, MkExpDummy()); (yyval.exp).loc = (yyloc); ;}
    break;

  case 555:
#line 1877 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 556:
#line 1878 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 557:
#line 1879 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 558:
#line 1880 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 560:
#line 1885 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 561:
#line 1886 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 562:
#line 1888 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 563:
#line 1889 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 565:
#line 1894 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 566:
#line 1895 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 567:
#line 1897 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 568:
#line 1898 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 570:
#line 1903 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 571:
#line 1904 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 572:
#line 1906 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 573:
#line 1907 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 575:
#line 1912 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 576:
#line 1913 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 578:
#line 1918 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 579:
#line 1919 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 581:
#line 1924 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 582:
#line 1925 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 583:
#line 1926 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 584:
#line 1927 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 585:
#line 1928 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 586:
#line 1929 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 587:
#line 1930 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 588:
#line 1931 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 589:
#line 1933 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 590:
#line 1934 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 591:
#line 1935 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 592:
#line 1936 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 593:
#line 1937 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 594:
#line 1938 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 595:
#line 1939 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 596:
#line 1940 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-3].exp), (yyvsp[-1].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[-1]); ;}
    break;

  case 597:
#line 1942 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 598:
#line 1943 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 599:
#line 1944 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 600:
#line 1945 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 601:
#line 1947 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 602:
#line 1948 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 603:
#line 1949 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 604:
#line 1950 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 605:
#line 1953 "grammar.y"
    { 
         (yyval.exp) = MkExpCondition((yyvsp[-2].exp), MkListOne(MkExpDummy()), MkExpDummy()); 
         (yyval.exp).loc = (yyloc); 
         ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[-1]); 
         (yyval.exp).cond.elseExp.loc = (yylsp[0]); 
      ;}
    break;

  case 606:
#line 1960 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-2].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[-1]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 607:
#line 1964 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-1].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[0]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 608:
#line 1968 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[-1].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[0]); (yyval.exp).cond.elseExp.loc = (yylsp[0]);
      ;}
    break;

  case 610:
#line 1975 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 611:
#line 1976 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).op.exp2.loc = (yylsp[-1]); ;}
    break;

  case 612:
#line 1977 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 613:
#line 1978 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).op.exp2.loc = (yylsp[-1]); ;}
    break;

  case 614:
#line 1980 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 615:
#line 1981 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 616:
#line 1985 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 617:
#line 1986 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].exp)); ;}
    break;

  case 618:
#line 1987 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 619:
#line 1988 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 626:
#line 1998 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 627:
#line 1999 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].exp)); ;}
    break;

  case 628:
#line 2000 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 629:
#line 2001 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 632:
#line 2011 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 633:
#line 2012 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 634:
#line 2013 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 635:
#line 2014 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 636:
#line 2015 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 637:
#line 2019 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); declMode = defaultAccess; ;}
    break;

  case 638:
#line 2020 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 639:
#line 2021 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); declMode = staticAccess; ;}
    break;

  case 640:
#line 2022 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 641:
#line 2023 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 642:
#line 2027 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 643:
#line 2028 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 644:
#line 2029 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 645:
#line 2033 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 646:
#line 2034 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 648:
#line 2039 "grammar.y"
    { memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 649:
#line 2043 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 650:
#line 2044 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); POP_DEFAULT_ACCESS ;}
    break;

  case 651:
#line 2048 "grammar.y"
    { (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 652:
#line 2049 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 653:
#line 2050 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), null); FreeSpecifier((yyvsp[-2].specifier)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 654:
#line 2054 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 655:
#line 2055 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 656:
#line 2057 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 657:
#line 2058 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list));  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 658:
#line 2059 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null);  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 659:
#line 2060 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 660:
#line 2061 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 661:
#line 2063 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-2].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 662:
#line 2064 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-3].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 663:
#line 2065 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-2].specifier).name), null); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[-2].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 664:
#line 2066 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-4].specifier).name), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list); FreeSpecifier((yyvsp[-4].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 665:
#line 2067 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-4].specifier).name), (yyvsp[-2].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[0].list); FreeSpecifier((yyvsp[-4].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 666:
#line 2071 "grammar.y"
    { (yyval.id) = (yyvsp[0].id); if(declMode) DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[0].id).string); ;}
    break;

  case 667:
#line 2072 "grammar.y"
    { (yyval.id) = MkIdentifier((yyvsp[0].specifier).name); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 668:
#line 2076 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 669:
#line 2077 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), null); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 670:
#line 2078 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 671:
#line 2082 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[0].list)); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 672:
#line 2083 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-1].list)); (yyval.specifier).baseSpecs = (yyvsp[-3].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 673:
#line 2084 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), null); (yyval.specifier).baseSpecs = (yyvsp[-2].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 674:
#line 2085 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), (yyvsp[-2].list)); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 675:
#line 2086 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), (yyvsp[-2].list)); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 676:
#line 2087 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-7].id), (yyvsp[-3].list)); (yyval.specifier).baseSpecs = (yyvsp[-5].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 677:
#line 2088 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-7].id), (yyvsp[-3].list)); (yyval.specifier).baseSpecs = (yyvsp[-5].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 678:
#line 2089 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), null); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 679:
#line 2090 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-6].id), null); (yyval.specifier).baseSpecs = (yyvsp[-4].list); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 680:
#line 2092 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 681:
#line 2093 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 682:
#line 2095 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), (yyvsp[0].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 683:
#line 2096 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 684:
#line 2097 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-2].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 685:
#line 2098 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 686:
#line 2099 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[-4].id), (yyvsp[-2].list)); (yyval.specifier).definitions = (yyvsp[0].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 691:
#line 2113 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 692:
#line 2114 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].string)); delete (yyvsp[0].string); ;}
    break;

  case 693:
#line 2118 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 694:
#line 2119 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 695:
#line 2120 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 696:
#line 2125 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 697:
#line 2126 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 698:
#line 2130 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 699:
#line 2131 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 700:
#line 2132 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 701:
#line 2133 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 702:
#line 2134 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 703:
#line 2135 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 704:
#line 2136 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 705:
#line 2137 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 706:
#line 2138 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 707:
#line 2139 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 708:
#line 2140 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 709:
#line 2141 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 710:
#line 2142 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 714:
#line 2146 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); ;}
    break;

  case 715:
#line 2147 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 716:
#line 2148 "grammar.y"
    { _DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 717:
#line 2149 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 718:
#line 2150 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 719:
#line 2151 "grammar.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 720:
#line 2155 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 721:
#line 2156 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 722:
#line 2157 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 723:
#line 2158 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 724:
#line 2159 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 725:
#line 2160 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 726:
#line 2161 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 727:
#line 2162 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 728:
#line 2163 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 729:
#line 2164 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 730:
#line 2165 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 731:
#line 2166 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 732:
#line 2167 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 736:
#line 2171 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); ;}
    break;

  case 737:
#line 2172 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 738:
#line 2173 "grammar.y"
    { _DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 739:
#line 2174 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 740:
#line 2181 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 741:
#line 2183 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 742:
#line 2185 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 743:
#line 2187 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 744:
#line 2189 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 745:
#line 2191 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 746:
#line 2193 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 747:
#line 2195 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 748:
#line 2197 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 749:
#line 2199 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 750:
#line 2203 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 751:
#line 2204 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 752:
#line 2209 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null);
         (yyval.specifier).addNameSpace = true;
         (yyval.specifier).ctx = PushContext();
      ;}
    break;

  case 753:
#line 2215 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null);
         (yyval.specifier).ctx = PushContext();
         FreeSpecifier((yyvsp[0].specifier));
      ;}
    break;

  case 754:
#line 2223 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 755:
#line 2224 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 756:
#line 2225 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 757:
#line 2229 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); AddStructDefinitions((yyvsp[-2].specifier), (yyvsp[0].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 758:
#line 2230 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); AddStructDefinitions((yyvsp[-2].specifier), (yyvsp[0].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 759:
#line 2231 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 760:
#line 2233 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 761:
#line 2234 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 762:
#line 2235 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 763:
#line 2239 "grammar.y"
    { (yyval.specifier) = (yyvsp[0].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 764:
#line 2244 "grammar.y"
    {
        (yyval.specifier) = (yyvsp[0].specifier);
        if(declMode)
        {
           ((yyvsp[0].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[0].specifier).id.string);
        }
     ;}
    break;

  case 765:
#line 2252 "grammar.y"
    {
      Symbol symbol = ((yyvsp[-3].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[-3].specifier).id.string);
      (yyval.specifier) = (yyvsp[-3].specifier);
      symbol.templateParams = (yyvsp[-1].list);
   ;}
    break;

  case 766:
#line 2261 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).baseSpecs = (yyvsp[0].list);
      SetupBaseSpecs(null, (yyvsp[0].list));
   ;}
    break;

  case 767:
#line 2269 "grammar.y"
    { (yyval.specifier).loc = (yyloc); ;}
    break;

  case 768:
#line 2271 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 769:
#line 2272 "grammar.y"
    { POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 770:
#line 2273 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 771:
#line 2278 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).definitions = (yyvsp[0].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 772:
#line 2285 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[-2].specifier);
      (yyval.specifier).definitions = (yyvsp[0].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 773:
#line 2292 "grammar.y"
    { (yyval.specifier) = (yyvsp[-2].specifier); POP_DEFAULT_ACCESS PopContext(curContext);;}
    break;

  case 774:
#line 2295 "grammar.y"
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

  case 775:
#line 2308 "grammar.y"
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
#line 2322 "grammar.y"
    { POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 777:
#line 2325 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS  ;}
    break;

  case 778:
#line 2327 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, (yyvsp[0].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 779:
#line 2329 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 780:
#line 2333 "grammar.y"
    { (yyval.specifierType) = structSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 781:
#line 2334 "grammar.y"
    { (yyval.specifierType) = unionSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 782:
#line 2338 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 783:
#line 2339 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 784:
#line 2340 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 785:
#line 2341 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 786:
#line 2342 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 787:
#line 2343 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 788:
#line 2344 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 789:
#line 2345 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 790:
#line 2349 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 791:
#line 2350 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 792:
#line 2351 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 793:
#line 2352 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 794:
#line 2353 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 795:
#line 2354 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 796:
#line 2355 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 797:
#line 2356 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 798:
#line 2357 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 799:
#line 2358 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 800:
#line 2362 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 801:
#line 2363 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 802:
#line 2364 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 803:
#line 2365 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 804:
#line 2366 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 805:
#line 2367 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 806:
#line 2368 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 807:
#line 2369 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 808:
#line 2370 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 809:
#line 2371 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 810:
#line 2375 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 811:
#line 2376 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 812:
#line 2377 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 813:
#line 2378 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 814:
#line 2379 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 815:
#line 2380 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 816:
#line 2381 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 817:
#line 2382 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 818:
#line 2383 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 819:
#line 2384 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 820:
#line 2385 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 821:
#line 2386 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 822:
#line 2390 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 823:
#line 2391 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 824:
#line 2392 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 825:
#line 2393 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 826:
#line 2394 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 827:
#line 2395 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 828:
#line 2396 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 829:
#line 2397 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 830:
#line 2398 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 831:
#line 2399 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 832:
#line 2403 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 833:
#line 2404 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 834:
#line 2408 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PRIVATE)); ;}
    break;

  case 835:
#line 2409 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PUBLIC)); ;}
    break;

  case 836:
#line 2410 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 837:
#line 2411 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 838:
#line 2412 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 839:
#line 2413 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 840:
#line 2414 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 841:
#line 2415 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 842:
#line 2417 "grammar.y"
    { _DeclClass(0, (yyvsp[0].id).string); (yyval.list) = MkListOne(MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 843:
#line 2418 "grammar.y"
    { _DeclClass(0, (yyvsp[0].id).string); ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 844:
#line 2421 "grammar.y"
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

  case 845:
#line 2439 "grammar.y"
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

  case 847:
#line 2456 "grammar.y"
    { (yyval.list) = MkListOne(MkStructOrUnion((yyvsp[0].specifierType), null, null)); POP_DEFAULT_ACCESS ;}
    break;

  case 848:
#line 2460 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 849:
#line 2461 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 850:
#line 2462 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 851:
#line 2463 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 852:
#line 2464 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 853:
#line 2465 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 854:
#line 2466 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 855:
#line 2467 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 856:
#line 2469 "grammar.y"
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

  case 857:
#line 2487 "grammar.y"
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

  case 858:
#line 2503 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 859:
#line 2504 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 860:
#line 2505 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 861:
#line 2506 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 862:
#line 2507 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 863:
#line 2508 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 864:
#line 2509 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 865:
#line 2510 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 866:
#line 2511 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 867:
#line 2512 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 868:
#line 2513 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 869:
#line 2514 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 870:
#line 2516 "grammar.y"
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

  case 871:
#line 2534 "grammar.y"
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

  case 872:
#line 2550 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 873:
#line 2551 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 874:
#line 2552 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 875:
#line 2553 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 876:
#line 2554 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 877:
#line 2555 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 878:
#line 2556 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 879:
#line 2557 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 880:
#line 2558 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 881:
#line 2559 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 882:
#line 2560 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 883:
#line 2561 "grammar.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 884:
#line 2563 "grammar.y"
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

  case 885:
#line 2581 "grammar.y"
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

  case 886:
#line 2597 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 887:
#line 2598 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 888:
#line 2602 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 889:
#line 2603 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 890:
#line 2604 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 891:
#line 2605 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 892:
#line 2606 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 893:
#line 2610 "grammar.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 894:
#line 2611 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 895:
#line 2612 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 896:
#line 2613 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 897:
#line 2614 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 898:
#line 2615 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 900:
#line 2623 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 901:
#line 2624 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 902:
#line 2625 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 903:
#line 2626 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 904:
#line 2627 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 905:
#line 2633 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); 
         fileInput.Seek((yylsp[-1]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-1]).end);
         (yyloc).start = (yylsp[-1]).start;
         (yyloc).end = (yylsp[-1]).end;
      ;}
    break;

  case 906:
#line 2642 "grammar.y"
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
#line 2651 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); 
         fileInput.Seek((yylsp[-2]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[-2]).end);
         (yyloc).start = (yylsp[-2]).start;
         (yyloc).end = (yylsp[-2]).end;
      ;}
    break;

  case 908:
#line 2660 "grammar.y"
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

  case 911:
#line 2675 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 912:
#line 2677 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 913:
#line 2721 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 915:
#line 2724 "grammar.y"
    {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, (yyvsp[-1].string));
         strcat(temp, ")");
         (yyval.string) = CopyString(temp);
         delete (yyvsp[-1].string);
      ;}
    break;

  case 916:
#line 2735 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 917:
#line 2741 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 918:
#line 2743 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 919:
#line 2745 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 920:
#line 2747 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 921:
#line 2749 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 922:
#line 2751 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 923:
#line 2753 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 924:
#line 2755 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 925:
#line 2757 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 926:
#line 2759 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 927:
#line 2761 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 928:
#line 2763 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 929:
#line 2765 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 930:
#line 2767 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 931:
#line 2769 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 932:
#line 2774 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 933:
#line 2776 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 934:
#line 2778 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 935:
#line 2780 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 936:
#line 2782 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 937:
#line 2784 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 938:
#line 2786 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 939:
#line 2790 "grammar.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 940:
#line 2791 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 941:
#line 2792 "grammar.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 942:
#line 2793 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 943:
#line 2797 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 945:
#line 2799 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 946:
#line 2800 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 947:
#line 2801 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 948:
#line 2802 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 949:
#line 2806 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 951:
#line 2808 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 952:
#line 2809 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 953:
#line 2810 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 954:
#line 2811 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 956:
#line 2817 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 957:
#line 2819 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 958:
#line 2821 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[0].string), (yyvsp[-1].declarator)); ;}
    break;

  case 960:
#line 2826 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 961:
#line 2827 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 962:
#line 2828 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 963:
#line 2829 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 965:
#line 2834 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 966:
#line 2835 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 967:
#line 2836 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 968:
#line 2837 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 970:
#line 2842 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 971:
#line 2843 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 972:
#line 2844 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 973:
#line 2845 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 974:
#line 2849 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 975:
#line 2850 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 976:
#line 2852 "grammar.y"
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

  case 977:
#line 2867 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 978:
#line 2868 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-2].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 979:
#line 2869 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[0].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 980:
#line 2871 "grammar.y"
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

  case 981:
#line 2884 "grammar.y"
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

  case 982:
#line 2899 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 983:
#line 2901 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 984:
#line 2905 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 985:
#line 2906 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 986:
#line 2910 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 987:
#line 2911 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 988:
#line 2912 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 989:
#line 2913 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 990:
#line 2916 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].initializer)); ;}
    break;

  case 991:
#line 2917 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].initializer)); ;}
    break;

  case 992:
#line 2921 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 993:
#line 2922 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 994:
#line 2926 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-1].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 995:
#line 2927 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), MkInitializerAssignment(MkExpDummy())); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc = (yylsp[-1]); (yyval.initDeclarator).initializer.exp.loc = (yylsp[-1]); ;}
    break;

  case 996:
#line 2928 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 997:
#line 2932 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 998:
#line 2933 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 999:
#line 2934 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1000:
#line 2938 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1001:
#line 2939 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[-1].initDeclarator)); ;}
    break;

  case 1002:
#line 2940 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1003:
#line 2941 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 1004:
#line 2945 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1005:
#line 2946 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1006:
#line 2950 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1007:
#line 2951 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1008:
#line 2956 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1009:
#line 2957 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 1010:
#line 2958 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 1011:
#line 2959 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); ;}
    break;

  case 1012:
#line 2960 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 1013:
#line 2962 "grammar.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 1014:
#line 2984 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), (yyvsp[-1].declarator)); ;}
    break;

  case 1015:
#line 2985 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), (yyvsp[-1].declarator)); ;}
    break;

  case 1016:
#line 2989 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1017:
#line 2990 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1018:
#line 2991 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1019:
#line 2992 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1020:
#line 2993 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1021:
#line 2994 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1022:
#line 2996 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1023:
#line 2997 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1024:
#line 2998 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1025:
#line 2999 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1026:
#line 3003 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1027:
#line 3004 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1028:
#line 3005 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1029:
#line 3006 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1030:
#line 3007 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 1031:
#line 3009 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1032:
#line 3010 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 1033:
#line 3011 "grammar.y"
    { ListAdd((yyvsp[-3].list), (yyvsp[0].typeName)); ;}
    break;

  case 1035:
#line 3016 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1036:
#line 3017 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1037:
#line 3018 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1038:
#line 3019 "grammar.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 1039:
#line 3020 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, null)); ;}
    break;

  case 1041:
#line 3025 "grammar.y"
    { ListAdd((yyvsp[-2].list), null); ;}
    break;

  case 1044:
#line 3032 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1046:
#line 3034 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1047:
#line 3035 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1048:
#line 3036 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1052:
#line 3040 "grammar.y"
    {;}
    break;

  case 1056:
#line 3048 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1057:
#line 3049 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1058:
#line 3050 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1059:
#line 3051 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1060:
#line 3052 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1061:
#line 3053 "grammar.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1062:
#line 3054 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[0].list)); Compiler_Error("syntax error\n"); (yyval.stmt).loc = (yylsp[0]); ;}
    break;

  case 1063:
#line 3058 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[0].string), null); (yyval.asmField).loc = (yylsp[0]); ;}
    break;

  case 1064:
#line 3059 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[-3].string), (yyvsp[-1].exp)); (yyval.asmField).loc = (yyloc); ;}
    break;

  case 1065:
#line 3063 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[0].asmField)); ;}
    break;

  case 1066:
#line 3064 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[0].asmField)); ;}
    break;

  case 1067:
#line 3065 "grammar.y"
    { (yyval.list) = null; ;}
    break;

  case 1068:
#line 3069 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-4].specifier), (yyvsp[-2].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1069:
#line 3070 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-6].specifier), (yyvsp[-4].string), (yyvsp[-2].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1070:
#line 3071 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), (yyvsp[-4].list), (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1071:
#line 3072 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-10].specifier), (yyvsp[-8].string), (yyvsp[-6].list), (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1072:
#line 3074 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-6].specifier), (yyvsp[-4].string), null, (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1073:
#line 3075 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), null, (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1074:
#line 3076 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[-8].specifier), (yyvsp[-6].string), (yyvsp[-4].list), null, (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1075:
#line 3078 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-2].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1076:
#line 3079 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-4].string), (yyvsp[-2].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1077:
#line 3080 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), (yyvsp[-4].list), (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1078:
#line 3081 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-8].string), (yyvsp[-6].list), (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1079:
#line 3083 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-4].string), null, (yyvsp[-2].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1080:
#line 3084 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), null, (yyvsp[-4].list), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1081:
#line 3085 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[-6].string), (yyvsp[-4].list), null, (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1082:
#line 3089 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1083:
#line 3090 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1084:
#line 3091 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1085:
#line 3092 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[0].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-2]).end; ;}
    break;

  case 1086:
#line 3093 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1087:
#line 3097 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1088:
#line 3098 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1089:
#line 3099 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 1090:
#line 3100 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[0].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-2]).end; ;}
    break;

  case 1091:
#line 3101 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), null); (yyval.stmt).caseStmt.exp.loc = (yylsp[0]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[-1]).end; ;}
    break;

  case 1092:
#line 3102 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1093:
#line 3103 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1094:
#line 3107 "grammar.y"
    { (yyval.declMode) = declMode = publicAccess; ;}
    break;

  case 1095:
#line 3108 "grammar.y"
    { (yyval.declMode) = declMode = privateAccess; ;}
    break;

  case 1096:
#line 3109 "grammar.y"
    { (yyval.declMode) = declMode = defaultAccess; ;}
    break;

  case 1097:
#line 3113 "grammar.y"
    { (yyval.declMode) = publicAccess; ;}
    break;

  case 1098:
#line 3114 "grammar.y"
    { (yyval.declMode) = privateAccess; ;}
    break;

  case 1099:
#line 3118 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1100:
#line 3119 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1101:
#line 3120 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1102:
#line 3121 "grammar.y"
    {;}
    break;

  case 1103:
#line 3125 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1104:
#line 3126 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1105:
#line 3127 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1106:
#line 3129 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1107:
#line 3130 "grammar.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1108:
#line 3131 "grammar.y"
    { declMode = staticAccess; (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1109:
#line 3135 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); yyerrok; ;}
    break;

  case 1110:
#line 3139 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1111:
#line 3140 "grammar.y"
    {;}
    break;

  case 1112:
#line 3142 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1113:
#line 3143 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1114:
#line 3144 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), (yyvsp[0].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1115:
#line 3148 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1116:
#line 3149 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1117:
#line 3150 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1118:
#line 3151 "grammar.y"
    { ;}
    break;

  case 1119:
#line 3155 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 1120:
#line 3156 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 1121:
#line 3160 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 1122:
#line 3161 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1123:
#line 3162 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1124:
#line 3166 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 1125:
#line 3167 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1126:
#line 3168 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 1127:
#line 3169 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1128:
#line 3170 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1129:
#line 3171 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1130:
#line 3172 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); yyerror(); ListAdd((yyvsp[-1].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1131:
#line 3176 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 1132:
#line 3177 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 1133:
#line 3178 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1134:
#line 3179 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1135:
#line 3183 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 1136:
#line 3184 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 1137:
#line 3185 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1138:
#line 3186 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 1139:
#line 3190 "grammar.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 1140:
#line 3194 "grammar.y"
    { (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1141:
#line 3199 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); (yyval.stmt).compound.context = (yyvsp[-1].context); PopContext((yyvsp[-1].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1142:
#line 3201 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, null); (yyval.stmt).compound.context = (yyvsp[0].context); PopContext((yyvsp[0].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1143:
#line 3204 "grammar.y"
    { (yyval.stmt) = (yyvsp[0].stmt); (yyval.stmt).compound.context = (yyvsp[-1].context); PopContext((yyvsp[-1].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1144:
#line 3209 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1145:
#line 3210 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1146:
#line 3211 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1147:
#line 3215 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1148:
#line 3216 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1149:
#line 3217 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1150:
#line 3218 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1151:
#line 3219 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1152:
#line 3220 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1153:
#line 3224 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[0].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1155:
#line 3229 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1156:
#line 3230 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1157:
#line 3231 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1158:
#line 3233 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1159:
#line 3234 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-4].stmt), (yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1160:
#line 3236 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1161:
#line 3237 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1162:
#line 3238 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1163:
#line 3239 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), (yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1164:
#line 3240 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1165:
#line 3242 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[-4].id), (yyvsp[-2].list), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1166:
#line 3243 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[-6].id), (yyvsp[-4].list), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1167:
#line 3247 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1168:
#line 3248 "grammar.y"
    { (yyval.stmt) = MkForStmt(MkExpressionStmt((yyvsp[-1].list)), null, null, null); (yyval.stmt).forStmt.init.loc = (yylsp[-1]); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1169:
#line 3249 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-1].stmt), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1170:
#line 3250 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), MkExpressionStmt((yyvsp[-1].list)), null, null); (yyval.stmt).loc = (yyloc); (yyval.stmt).forStmt.check.loc = (yylsp[-1]); ;}
    break;

  case 1171:
#line 3251 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), (yyvsp[-1].stmt), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1172:
#line 3252 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), (yyvsp[-1].stmt), (yyvsp[0].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1173:
#line 3253 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1174:
#line 3254 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1175:
#line 3255 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), (yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1176:
#line 3257 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-4].stmt), (yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1177:
#line 3258 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-3].stmt), (yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1178:
#line 3259 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-3].stmt), (yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1179:
#line 3260 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-2].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1180:
#line 3261 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-1].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1181:
#line 3262 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1182:
#line 3263 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1183:
#line 3266 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1184:
#line 3267 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1185:
#line 3268 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1186:
#line 3269 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[0].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1187:
#line 3270 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1188:
#line 3271 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1189:
#line 3272 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-1].list), (yyvsp[0].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1190:
#line 3276 "grammar.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1191:
#line 3277 "grammar.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1192:
#line 3278 "grammar.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1193:
#line 3279 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 1194:
#line 3280 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1195:
#line 3281 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1196:
#line 3282 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[-1].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1197:
#line 3283 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[-1].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1198:
#line 3287 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[0].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1199:
#line 3288 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[0].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1200:
#line 3289 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc.start = exp.loc.end = (yylsp[0]).end; ;}
    break;

  case 1201:
#line 3290 "grammar.y"
    { (yyval.stmt) = MkGotoStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1202:
#line 3296 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1203:
#line 3298 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-2].list), (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1204:
#line 3300 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1205:
#line 3301 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc);;}
    break;

  case 1206:
#line 3304 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-3].list), (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1207:
#line 3305 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[-2].list), (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1208:
#line 3306 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-2].declarator), (yyvsp[-1].list)); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1209:
#line 3307 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[-1].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[0].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[0].stmt).loc.end; ;}
    break;

  case 1210:
#line 3311 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 1211:
#line 3313 "grammar.y"
    { 
      int len1 = strlen((yyvsp[-1].string));
      int len2 = strlen(yytext);
      (yyval.string) = eSystem_New(len1-1 + len2-1 + 1);
      memcpy((yyval.string), (yyvsp[-1].string), len1-1);
      memcpy((yyval.string) + len1-1, yytext+1, len2);
      delete (yyvsp[-1].string);
   ;}
    break;

  case 1212:
#line 3324 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyloc); (yyvsp[0].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1213:
#line 3326 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1214:
#line 3329 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1215:
#line 3332 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration));  (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1216:
#line 3333 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), normalImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1217:
#line 3334 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), staticImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1218:
#line 3335 "grammar.y"
    { if(!strcmp((yyvsp[-1].id).string, "remote")) { (yyval.external) = MkExternalImport((yyvsp[0].string), remoteImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); } else yyerror(); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 1219:
#line 3337 "grammar.y"
    { (yyval.external) = null; ;}
    break;

  case 1220:
#line 3339 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyloc); (yyvsp[0].function).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1221:
#line 3341 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyloc); (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1222:
#line 3342 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration)); (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1223:
#line 3343 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), normalImport, ((yyvsp[-2].declMode) != defaultAccess) ? (yyvsp[-2].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1224:
#line 3344 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[0].string), staticImport, ((yyvsp[-3].declMode) != defaultAccess) ? (yyvsp[-3].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1225:
#line 3345 "grammar.y"
    { if(!strcmp((yyvsp[-1].id).string, "remote")) { (yyval.external) = MkExternalImport((yyvsp[0].string), remoteImport, ((yyvsp[-3].declMode) != defaultAccess) ? (yyvsp[-3].declMode) : privateAccess);  (yyval.external).loc = (yyloc); FreeIdentifier((yyvsp[-1].id)); } else yyerror();  declMode = defaultDeclMode; ;}
    break;

  case 1226:
#line 3346 "grammar.y"
    { defaultDeclMode = (yyvsp[-1].declMode); (yyval.external) = null; ;}
    break;

  case 1227:
#line 3347 "grammar.y"
    { defaultDeclMode = staticAccess; (yyval.external) = null; ;}
    break;

  case 1228:
#line 3348 "grammar.y"
    { (yyval.external) = MkExternalNameSpace((yyvsp[0].id)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1229:
#line 3349 "grammar.y"
    { (yyval.external) = MkExternalNameSpace(MkIdentifier((yyvsp[0].specifier).name)); FreeSpecifier((yyvsp[0].specifier)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1230:
#line 3350 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[0].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[0].dbtableDef).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1231:
#line 3351 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[0].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[0].dbtableDef).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1232:
#line 3355 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1233:
#line 3356 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1234:
#line 3357 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyvsp[0].function).loc;  (yyvsp[0].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1235:
#line 3359 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[0]._class));  (yyval.external).loc = (yyvsp[0]._class).loc; (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1236:
#line 3360 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[0].function)); (yyval.external).loc = (yyvsp[0].function).loc; (yyvsp[0].function).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1237:
#line 3363 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration));  (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1238:
#line 3364 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[0].declaration)); (yyval.external).loc = (yyloc); (yyvsp[0].declaration).declMode = (yyvsp[-1].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1239:
#line 3368 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].external)); ast = (yyval.list); ;}
    break;

  case 1240:
#line 3369 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1241:
#line 3370 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1244:
#line 3376 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].external)); ast = (yyval.list); ;}
    break;

  case 1245:
#line 3377 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].external)); ;}
    break;

  case 1246:
#line 3379 "grammar.y"
    { External _class = MkExternalClass((yyvsp[0]._class)); ListAdd((yyvsp[-1].list), _class); _class.loc = (yylsp[0]);  (yyvsp[0]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1247:
#line 3381 "grammar.y"
    { External _class = MkExternalClass((yyvsp[0]._class)); ListAdd((yyvsp[-2].list), _class); _class.loc = (yylsp[0]);  (yyvsp[0]._class).declMode = ((yyvsp[-1].declMode) != defaultAccess) ? (yyvsp[-1].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1250:
#line 3387 "grammar.y"
    { ast = MkList(); ;}
    break;

  case 1251:
#line 3391 "grammar.y"
    { Symbol symbol = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[-3].id).string); FreeIdentifier((yyvsp[-3].id)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[-4].string), symbol, (yyvsp[-1].list)); ;}
    break;

  case 1252:
#line 3392 "grammar.y"
    { Symbol symbol = DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[-4].string), symbol, (yyvsp[-1].list)); ;}
    break;

  case 1253:
#line 3393 "grammar.y"
    { (yyval.dbtableDef) = MkDBTableDef((yyvsp[-3].string), null, (yyvsp[-1].list)); ;}
    break;

  case 1254:
#line 3397 "grammar.y"
    { (yyval.dbtableEntry) = MkDBFieldEntry(MkTypeName((yyvsp[-3].list), null), (yyvsp[-2].id), (yyvsp[-1].string)); ;}
    break;

  case 1255:
#line 3401 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), ascending); ;}
    break;

  case 1256:
#line 3402 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), descending); ;}
    break;

  case 1257:
#line 3403 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[0].id), ascending); ;}
    break;

  case 1258:
#line 3407 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbindexItem)); ;}
    break;

  case 1259:
#line 3408 "grammar.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].dbindexItem)); ;}
    break;

  case 1260:
#line 3412 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[-1].list), null); ;}
    break;

  case 1261:
#line 3413 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[-2].list), (yyvsp[-1].id)); ;}
    break;

  case 1262:
#line 3417 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1263:
#line 3418 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1264:
#line 3419 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1265:
#line 3420 "grammar.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].dbtableEntry)); ;}
    break;

  case 1266:
#line 3424 "grammar.y"
    { (yyval.exp) = MkExpDBOpen((yyvsp[-3].exp), (yyvsp[-1].exp)); ;}
    break;

  case 1267:
#line 3428 "grammar.y"
    { (yyval.exp) = MkExpDBField((yyvsp[-3].string), (yyvsp[-1].id)); ;}
    break;

  case 1268:
#line 3432 "grammar.y"
    { (yyval.exp) = MkExpDBIndex((yyvsp[-3].string), (yyvsp[-1].id)); ;}
    break;

  case 1269:
#line 3436 "grammar.y"
    { (yyval.exp) = MkExpDBTable((yyvsp[-1].string)); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 17485 "grammar.ec"

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


#line 3439 "grammar.y"


