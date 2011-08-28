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
#line 1 "type.y"


import "ecdefs"

#define YYLTYPE Location

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
#line 38 "type.y"
typedef union YYSTYPE {
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
} YYSTYPE;
/* Line 190 of yacc.c.  */
#line 360 "type.ec"
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
#line 384 "type.ec"

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
#define YYFINAL  100
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7647

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  122
/* YYNRULES -- Number of rules. */
#define YYNRULES  497
/* YYNRULES -- Number of states. */
#define YYNSTATES  834

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
       2,     2,     2,   123,     2,     2,   115,   125,   120,     2,
     112,   113,   109,   121,   119,   122,   118,   124,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   129,   131,
     110,   130,   111,   128,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   116,     2,   117,   126,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,   127,   133,   114,     2,     2,     2,
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
       0,     0,     3,     6,     9,    12,    14,    17,    19,    21,
      26,    31,    34,    36,    40,    45,    49,    52,    54,    56,
      60,    62,    64,    66,    68,    71,    74,    81,    87,    94,
     100,   108,   115,   123,   130,   132,   134,   139,   143,   148,
     152,   156,   159,   162,   164,   166,   171,   175,   180,   184,
     188,   191,   194,   196,   198,   202,   206,   209,   212,   215,
     220,   223,   228,   230,   232,   234,   236,   238,   240,   242,
     244,   246,   248,   250,   252,   257,   259,   263,   267,   271,
     273,   277,   281,   283,   287,   291,   294,   296,   299,   303,
     307,   311,   313,   317,   321,   323,   327,   329,   333,   335,
     339,   341,   345,   347,   351,   353,   359,   361,   365,   369,
     371,   373,   375,   377,   379,   381,   383,   385,   387,   389,
     391,   393,   397,   399,   402,   406,   409,   415,   417,   420,
     422,   425,   427,   430,   432,   435,   437,   440,   442,   445,
     447,   450,   452,   455,   457,   460,   462,   465,   467,   470,
     472,   475,   477,   480,   482,   485,   487,   490,   492,   495,
     497,   500,   502,   505,   507,   510,   512,   515,   517,   520,
     522,   525,   527,   530,   532,   535,   537,   540,   542,   545,
     547,   550,   552,   555,   557,   560,   562,   565,   570,   576,
     578,   581,   583,   586,   588,   591,   593,   596,   598,   601,
     603,   606,   611,   617,   619,   623,   625,   629,   631,   633,
     635,   637,   639,   641,   643,   645,   647,   649,   651,   653,
     655,   657,   659,   661,   663,   665,   667,   669,   671,   673,
     675,   677,   679,   681,   683,   685,   687,   692,   697,   699,
     701,   703,   705,   707,   709,   711,   713,   715,   717,   719,
     721,   723,   725,   727,   729,   734,   739,   741,   747,   752,
     757,   761,   767,   770,   773,   775,   778,   780,   782,   784,
     786,   788,   790,   792,   796,   800,   804,   808,   812,   816,
     818,   822,   824,   826,   828,   831,   835,   837,   841,   851,
     861,   869,   877,   883,   894,   905,   914,   923,   930,   939,
     948,   955,   962,   967,   977,   987,   995,  1003,  1009,  1013,
    1016,  1019,  1022,  1024,  1027,  1029,  1031,  1033,  1037,  1039,
    1042,  1045,  1049,  1055,  1058,  1061,  1066,  1072,  1080,  1088,
    1094,  1096,  1100,  1102,  1106,  1110,  1113,  1117,  1121,  1125,
    1130,  1135,  1138,  1142,  1146,  1151,  1155,  1158,  1162,  1166,
    1171,  1173,  1175,  1178,  1181,  1184,  1188,  1190,  1192,  1195,
    1198,  1201,  1205,  1207,  1210,  1214,  1217,  1219,  1223,  1228,
    1232,  1237,  1239,  1242,  1245,  1249,  1253,  1256,  1260,  1264,
    1267,  1269,  1271,  1274,  1277,  1279,  1282,  1285,  1289,  1293,
    1295,  1298,  1300,  1303,  1306,  1310,  1312,  1316,  1318,  1322,
    1325,  1328,  1330,  1332,  1334,  1336,  1339,  1342,  1346,  1348,
    1351,  1353,  1356,  1359,  1361,  1365,  1367,  1370,  1372,  1375,
    1377,  1381,  1386,  1388,  1390,  1392,  1396,  1398,  1400,  1402,
    1404,  1406,  1408,  1412,  1417,  1421,  1423,  1426,  1428,  1431,
    1434,  1436,  1438,  1441,  1443,  1446,  1450,  1452,  1455,  1461,
    1469,  1475,  1481,  1489,  1496,  1504,  1509,  1515,  1520,  1524,
    1527,  1530,  1533,  1537,  1539,  1545,  1550,  1556,  1561,  1566,
    1570,  1575,  1579,  1583,  1586,  1589,  1592,  1595,  1598,  1601,
    1604,  1607,  1610,  1614,  1616,  1618,  1622,  1625,  1627,  1629,
    1632,  1635,  1637,  1640,  1642,  1644,  1647,  1649
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     255,     0,    -1,   144,   109,    -1,   144,   110,    -1,   144,
       1,    -1,   139,    -1,   144,   144,    -1,    28,    -1,   138,
      -1,   138,   110,   196,   111,    -1,   138,   110,   196,    11,
      -1,   176,   215,    -1,   215,    -1,   176,   112,   113,    -1,
     114,   176,   112,   113,    -1,    78,   176,   215,    -1,    78,
     215,    -1,     3,    -1,   146,    -1,   112,   170,   113,    -1,
     144,    -1,   245,    -1,     4,    -1,     5,    -1,   115,   242,
      -1,   112,   113,    -1,    71,   176,   212,   116,   171,   117,
      -1,    71,   176,   116,   171,   117,    -1,   102,   176,   212,
     116,   171,   117,    -1,   102,   176,   116,   171,   117,    -1,
      72,   171,   179,   212,   116,   171,   117,    -1,    72,   171,
     179,   116,   171,   117,    -1,   103,   171,   179,   212,   116,
     171,   117,    -1,   103,   171,   179,   116,   171,   117,    -1,
       1,    -1,   145,    -1,   147,   116,   170,   117,    -1,   147,
     112,   113,    -1,   147,   112,   150,   113,    -1,   147,   118,
     144,    -1,   147,     7,   144,    -1,   147,     8,    -1,   147,
       9,    -1,   246,    -1,   146,    -1,   149,   116,   170,   117,
      -1,   149,   112,   113,    -1,   149,   112,   150,   113,    -1,
     149,   118,   144,    -1,   149,     7,   144,    -1,   149,     8,
      -1,   149,     9,    -1,   168,    -1,   148,    -1,   150,   119,
     168,    -1,   150,   119,   148,    -1,     8,   152,    -1,     9,
     152,    -1,   154,   155,    -1,     6,   112,   152,   113,    -1,
       6,   153,    -1,     6,   112,   227,   113,    -1,   151,    -1,
     147,    -1,   151,    -1,   149,    -1,   120,    -1,   109,    -1,
     121,    -1,   122,    -1,   114,    -1,   123,    -1,    73,    -1,
     152,    -1,   112,   226,   113,   155,    -1,   155,    -1,   156,
     109,   155,    -1,   156,   124,   155,    -1,   156,   125,   155,
      -1,   156,    -1,   157,   121,   156,    -1,   157,   122,   156,
      -1,   157,    -1,   158,    10,   157,    -1,   158,    11,   157,
      -1,   160,   110,    -1,   158,    -1,   159,   158,    -1,   160,
     111,   158,    -1,   160,    12,   158,    -1,   160,    13,   158,
      -1,   160,    -1,   161,    14,   160,    -1,   161,    15,   160,
      -1,   161,    -1,   162,   120,   161,    -1,   162,    -1,   163,
     126,   162,    -1,   163,    -1,   164,   127,   163,    -1,   164,
      -1,   165,    16,   164,    -1,   165,    -1,   166,    17,   165,
      -1,   166,    -1,   166,   128,   170,   129,   167,    -1,   167,
      -1,   152,   169,   168,    -1,   152,   169,   148,    -1,   130,
      -1,    18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,
      -1,    23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,
      -1,   168,    -1,   170,   119,   168,    -1,   167,    -1,   175,
     131,    -1,   175,   180,   131,    -1,   243,   131,    -1,    77,
     144,   130,   171,   131,    -1,   186,    -1,   173,   186,    -1,
     187,    -1,   173,   187,    -1,   206,    -1,   173,   206,    -1,
     189,    -1,   173,   189,    -1,   186,    -1,   174,   186,    -1,
     187,    -1,   174,   187,    -1,   135,    -1,   174,   135,    -1,
     206,    -1,   174,   206,    -1,   189,    -1,   174,   189,    -1,
     182,    -1,   175,   182,    -1,   186,    -1,   175,   186,    -1,
     187,    -1,   175,   187,    -1,   206,    -1,   175,   206,    -1,
     189,    -1,   175,   189,    -1,   182,    -1,   176,   182,    -1,
     186,    -1,   176,   186,    -1,   187,    -1,   176,   187,    -1,
     135,    -1,   176,   135,    -1,   189,    -1,   176,   189,    -1,
     206,    -1,   176,   206,    -1,   182,    -1,   176,   182,    -1,
     186,    -1,   176,   186,    -1,   187,    -1,   176,   187,    -1,
     136,    -1,   176,   136,    -1,   189,    -1,   176,   189,    -1,
     206,    -1,   176,   206,    -1,   182,    -1,   178,   182,    -1,
     186,    -1,   178,   186,    -1,   188,    -1,   178,   188,    -1,
     144,    -1,   178,   144,    -1,   144,   110,   196,   111,    -1,
     178,   144,   110,   196,   111,    -1,   182,    -1,   179,   182,
      -1,   186,    -1,   179,   186,    -1,   188,    -1,   179,   188,
      -1,   189,    -1,   179,   189,    -1,   206,    -1,   179,   206,
      -1,   144,    -1,   179,   144,    -1,   144,   110,   196,   111,
      -1,   179,   144,   110,   196,   111,    -1,   181,    -1,   180,
     119,   181,    -1,   213,    -1,   213,   130,   228,    -1,    29,
      -1,    30,    -1,    31,    -1,    32,    -1,    33,    -1,    74,
      -1,   184,    -1,    79,    -1,    75,    -1,   183,    -1,    44,
      -1,    45,    -1,   185,    -1,    46,    -1,    34,    -1,    35,
      -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,
      -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,
      -1,   190,    -1,   205,    -1,   137,    -1,   100,   112,   137,
     113,    -1,   100,   112,   144,   113,    -1,    66,    -1,    46,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,
      -1,    41,    -1,   190,    -1,   205,    -1,   139,    -1,   100,
     112,   137,   113,    -1,   100,   112,   144,   113,    -1,    66,
      -1,   197,   144,   132,   198,   133,    -1,   197,   132,   198,
     133,    -1,   197,   144,   132,   133,    -1,   197,   132,   133,
      -1,   197,   138,   132,   198,   133,    -1,   197,   144,    -1,
     197,   139,    -1,   175,    -1,   175,   211,    -1,   144,    -1,
     191,    -1,   144,    -1,   158,    -1,   194,    -1,   193,    -1,
     192,    -1,   144,   130,   194,    -1,   144,   130,   193,    -1,
     144,   130,   192,    -1,   191,   130,   194,    -1,   191,   130,
     193,    -1,   191,   130,   192,    -1,   195,    -1,   196,   119,
     195,    -1,    48,    -1,    49,    -1,   202,    -1,   198,   202,
      -1,   147,   130,   229,    -1,   199,    -1,   200,   119,   199,
      -1,    68,   178,   144,   132,    69,   237,    70,   237,   133,
      -1,    68,   178,   144,   132,    70,   237,    69,   237,   133,
      -1,    68,   178,   144,   132,    69,   237,   133,    -1,    68,
     178,   144,   132,    70,   237,   133,    -1,    68,   178,   144,
     132,   133,    -1,    68,   178,   211,   144,   132,    69,   237,
      70,   237,   133,    -1,    68,   178,   211,   144,   132,    70,
     237,    69,   237,   133,    -1,    68,   178,   211,   144,   132,
      69,   237,   133,    -1,    68,   178,   211,   144,   132,    70,
     237,   133,    -1,    68,   178,   211,   144,   132,   133,    -1,
      68,   178,   132,    69,   237,    70,   237,   133,    -1,    68,
     178,   132,    70,   237,    69,   237,   133,    -1,    68,   178,
     132,    69,   237,   133,    -1,    68,   178,   132,    70,   237,
     133,    -1,    68,   178,   132,   133,    -1,    68,   178,   211,
     132,    69,   237,    70,   237,   133,    -1,    68,   178,   211,
     132,    70,   237,    69,   237,   133,    -1,    68,   178,   211,
     132,    69,   237,   133,    -1,    68,   178,   211,   132,    70,
     237,   133,    -1,    68,   178,   211,   132,   133,    -1,   176,
     203,   131,    -1,   176,   131,    -1,   245,   131,    -1,   244,
     131,    -1,   247,    -1,   200,   131,    -1,   201,    -1,   131,
      -1,   204,    -1,   203,   119,   204,    -1,   219,    -1,   219,
     184,    -1,   129,   171,    -1,   219,   129,   171,    -1,   219,
     129,   171,   129,   171,    -1,    50,   144,    -1,    50,   139,
      -1,    50,   132,   207,   133,    -1,    50,   144,   132,   207,
     133,    -1,    50,   144,   132,   207,   131,   198,   133,    -1,
      50,   139,   132,   207,   131,   198,   133,    -1,    50,   139,
     132,   207,   133,    -1,   208,    -1,   207,   119,   208,    -1,
     144,    -1,   144,   130,   171,    -1,   112,   211,   113,    -1,
     116,   117,    -1,   116,   171,   117,    -1,   116,   137,   117,
      -1,   209,   116,   117,    -1,   209,   116,   171,   117,    -1,
     209,   116,   137,   117,    -1,   112,   113,    -1,   112,   222,
     113,    -1,   209,   112,   113,    -1,   209,   112,   222,   113,
      -1,   112,   212,   113,    -1,   112,   113,    -1,   112,   222,
     113,    -1,   210,   112,   113,    -1,   210,   112,   222,   113,
      -1,   221,    -1,   209,    -1,   221,   209,    -1,   183,   221,
      -1,   183,   209,    -1,   183,   221,   209,    -1,   221,    -1,
     210,    -1,   221,   210,    -1,   183,   221,    -1,   183,   210,
      -1,   183,   221,   210,    -1,   218,    -1,   221,   218,    -1,
     183,   221,   218,    -1,   213,   183,    -1,   144,    -1,   112,
     213,   113,    -1,   214,   116,   171,   117,    -1,   214,   116,
     117,    -1,   214,   116,   137,   117,    -1,   217,    -1,   221,
     217,    -1,   183,   217,    -1,   183,   221,   217,    -1,   221,
     183,   217,    -1,   214,   112,    -1,   216,   222,   113,    -1,
     216,   225,   113,    -1,   216,   113,    -1,   217,    -1,   214,
      -1,   183,   217,    -1,   183,   214,    -1,   214,    -1,   221,
     214,    -1,   183,   214,    -1,   183,   221,   214,    -1,   221,
     183,   214,    -1,   186,    -1,   220,   186,    -1,   109,    -1,
     109,   220,    -1,   109,   221,    -1,   109,   220,   221,    -1,
     223,    -1,   223,   119,    51,    -1,   224,    -1,   223,   119,
     224,    -1,   176,   213,    -1,   176,   211,    -1,   176,    -1,
     177,    -1,    65,    -1,    82,    -1,    82,   120,    -1,    82,
     213,    -1,    82,   120,   213,    -1,    83,    -1,    83,   213,
      -1,     1,    -1,     1,   213,    -1,     1,   211,    -1,   144,
      -1,   225,   119,   144,    -1,   173,    -1,   173,   211,    -1,
     174,    -1,   174,   211,    -1,   168,    -1,   132,   230,   133,
      -1,   132,   230,   119,   133,    -1,   167,    -1,   148,    -1,
     228,    -1,   230,   119,   228,    -1,   232,    -1,   237,    -1,
     238,    -1,   239,    -1,   240,    -1,   241,    -1,   144,   129,
     231,    -1,    52,   171,   129,   231,    -1,    53,   129,   231,
      -1,   172,    -1,   233,   172,    -1,   231,    -1,   234,   231,
      -1,   234,   172,    -1,   234,    -1,   233,    -1,   233,   234,
      -1,   132,    -1,   132,   133,    -1,   236,   235,   133,    -1,
     131,    -1,   170,   131,    -1,    54,   112,   170,   113,   231,
      -1,    54,   112,   170,   113,   231,    64,   231,    -1,    55,
     112,   170,   113,   231,    -1,    56,   112,   170,   113,   231,
      -1,    57,   231,    56,   112,   170,   113,   131,    -1,    58,
     112,   238,   238,   113,   231,    -1,    58,   112,   238,   238,
     170,   113,   231,    -1,    56,   112,   113,   231,    -1,    58,
     112,   238,   113,   231,    -1,    58,   112,   113,   231,    -1,
      59,   144,   131,    -1,    60,   131,    -1,    61,   131,    -1,
      62,   131,    -1,    62,   170,   131,    -1,     5,    -1,   175,
     144,   132,   254,   133,    -1,   175,   144,   132,   133,    -1,
     176,   144,   132,   254,   133,    -1,   176,   144,   132,   133,
      -1,   137,   132,   254,   133,    -1,   137,   132,   133,    -1,
     144,   132,   254,   133,    -1,   144,   132,   133,    -1,   132,
     254,   133,    -1,   132,   133,    -1,   140,   237,    -1,   143,
     237,    -1,   143,   131,    -1,   141,   237,    -1,   142,   237,
      -1,   175,   215,    -1,   175,   219,    -1,   248,   237,    -1,
     147,   130,   229,    -1,   229,    -1,   250,    -1,   251,   119,
     250,    -1,   251,   131,    -1,   252,    -1,   249,    -1,   253,
     252,    -1,   253,   249,    -1,   131,    -1,   253,   131,    -1,
     253,    -1,   251,    -1,   253,   251,    -1,   224,    -1,   224,
     129,   171,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   160,   160,   177,   210,   260,   261,   288,   296,   297,
     298,   315,   317,   322,   327,   332,   334,   339,   344,   345,
     350,   352,   354,   356,   358,   359,   362,   363,   364,   365,
     366,   367,   368,   369,   370,   374,   375,   376,   377,   378,
     379,   380,   381,   385,   390,   391,   392,   393,   394,   395,
     396,   397,   401,   402,   403,   404,   408,   409,   410,   411,
     412,   413,   417,   418,   422,   423,   427,   428,   429,   430,
     431,   432,   433,   437,   438,   442,   443,   444,   445,   449,
     450,   451,   455,   456,   457,   461,   469,   470,   471,   472,
     473,   477,   478,   479,   483,   484,   488,   489,   493,   494,
     498,   499,   503,   504,   508,   509,   513,   514,   515,   519,
     520,   521,   522,   523,   524,   525,   526,   527,   528,   529,
     533,   534,   538,   542,   543,   544,   545,   557,   558,   559,
     560,   561,   562,   563,   564,   568,   569,   570,   571,   572,
     573,   574,   575,   576,   577,   581,   582,   583,   584,   585,
     586,   587,   588,   589,   590,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   603,   604,   605,   609,   610,   611,
     612,   613,   614,   615,   616,   617,   618,   619,   620,   681,
     682,   683,   684,   685,   686,   687,   688,   689,   707,   724,
     725,   726,   727,   728,   729,   730,   731,   732,   733,   734,
     735,   736,   754,   854,   855,   859,   860,   864,   865,   866,
     867,   868,   872,   873,   877,   882,   883,   887,   888,   889,
     894,   895,   896,   897,   898,   899,   900,   901,   902,   903,
     904,   905,   906,   907,   908,   909,   910,   911,   912,   916,
     917,   918,   919,   920,   921,   922,   923,   924,   925,   926,
     927,   928,   929,   930,   931,   932,   933,   938,   939,   940,
     941,   942,   947,   948,   953,   954,   955,   959,   974,   983,
    1003,  1004,  1005,  1006,  1007,  1008,  1009,  1021,  1033,  1048,
    1049,  1162,  1163,  1167,  1168,  1172,  1176,  1177,  1181,  1183,
    1185,  1187,  1189,  1192,  1194,  1196,  1198,  1200,  1203,  1205,
    1207,  1209,  1211,  1214,  1216,  1218,  1220,  1222,  1227,  1228,
    1229,  1230,  1231,  1232,  1233,  1234,  1238,  1240,  1245,  1247,
    1249,  1251,  1253,  1258,  1259,  1263,  1265,  1266,  1267,  1268,
    1284,  1286,  1291,  1293,  1299,  1301,  1303,  1305,  1307,  1309,
    1311,  1313,  1315,  1317,  1319,  1324,  1326,  1328,  1330,  1332,
    1337,  1338,  1339,  1340,  1341,  1342,  1346,  1347,  1348,  1349,
    1350,  1351,  1397,  1398,  1400,  1402,  1407,  1409,  1411,  1413,
    1415,  1420,  1421,  1424,  1426,  1428,  1434,  1438,  1440,  1442,
    1447,  1448,  1449,  1451,  1456,  1457,  1458,  1459,  1460,  1464,
    1465,  1469,  1470,  1471,  1472,  1476,  1477,  1481,  1482,  1486,
    1487,  1488,  1489,  1500,  1502,  1504,  1506,  1508,  1510,  1512,
    1515,  1517,  1519,  1523,  1524,  1528,  1529,  1533,  1534,  1538,
    1540,  1542,  1558,  1560,  1582,  1584,  1589,  1590,  1591,  1592,
    1593,  1594,  1598,  1600,  1602,  1607,  1608,  1612,  1613,  1616,
    1620,  1621,  1622,  1626,  1630,  1638,  1643,  1644,  1648,  1649,
    1650,  1654,  1655,  1656,  1657,  1659,  1660,  1661,  1665,  1666,
    1667,  1668,  1669,  1673,  1677,  1679,  1684,  1686,  1711,  1713,
    1715,  1717,  1722,  1724,  1728,  1730,  1732,  1734,  1736,  1742,
    1744,  1749,  1754,  1755,  1759,  1761,  1766,  1771,  1772,  1773,
    1774,  1775,  1776,  1780,  1781,  1782,  1786,  1787
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
  "'('", "')'", "'~'", "'$'", "'['", "']'", "'.'", "','", "'&'", "'+'",
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
  "storage_class_specifier", "ext_decl", "ext_attrib", "ext_storage",
  "type_qualifier", "type_specifier", "strict_type_specifier",
  "struct_or_union_specifier_compound",
  "struct_or_union_specifier_nocompound", "template_datatype",
  "template_type_argument", "template_identifier_argument",
  "template_expression_argument", "template_argument",
  "template_arguments_list", "struct_or_union", "struct_declaration_list",
  "default_property", "default_property_list", "property",
  "struct_declaration", "struct_declarator_list", "struct_declarator",
  "enum_specifier_nocompound", "enum_specifier_compound",
  "enumerator_list", "enumerator", "direct_abstract_declarator",
  "direct_abstract_declarator_noarray", "abstract_declarator",
  "abstract_declarator_noarray", "declarator",
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
      60,    62,    40,    41,   126,    36,    91,    93,    46,    44,
      38,    43,    45,    33,    47,    37,    94,   124,    63,    58,
      61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   134,   135,   135,   136,   137,   137,   138,   139,   139,
     139,   140,   140,   141,   142,   143,   143,   144,   145,   145,
     146,   146,   146,   146,   146,   146,   146,   146,   146,   146,
     146,   146,   146,   146,   146,   147,   147,   147,   147,   147,
     147,   147,   147,   148,   149,   149,   149,   149,   149,   149,
     149,   149,   150,   150,   150,   150,   151,   151,   151,   151,
     151,   151,   152,   152,   153,   153,   154,   154,   154,   154,
     154,   154,   154,   155,   155,   156,   156,   156,   156,   157,
     157,   157,   158,   158,   158,   159,   160,   160,   160,   160,
     160,   161,   161,   161,   162,   162,   163,   163,   164,   164,
     165,   165,   166,   166,   167,   167,   168,   168,   168,   169,
     169,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     170,   170,   171,   172,   172,   172,   172,   173,   173,   173,
     173,   173,   173,   173,   173,   174,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   175,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   177,   177,   177,
     177,   177,   177,   177,   177,   177,   177,   177,   177,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   180,   180,   181,   181,   182,   182,   182,
     182,   182,   183,   183,   184,   185,   185,   186,   186,   186,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   189,   189,   189,
     189,   189,   190,   190,   191,   191,   191,   192,   193,   194,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   196,
     196,   197,   197,   198,   198,   199,   200,   200,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   202,   202,
     202,   202,   202,   202,   202,   202,   203,   203,   204,   204,
     204,   204,   204,   205,   205,   206,   206,   206,   206,   206,
     207,   207,   208,   208,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   210,   210,   210,   210,   210,
     211,   211,   211,   211,   211,   211,   212,   212,   212,   212,
     212,   212,   213,   213,   213,   213,   214,   214,   214,   214,
     214,   215,   215,   215,   215,   215,   216,   217,   217,   217,
     218,   218,   218,   218,   219,   219,   219,   219,   219,   220,
     220,   221,   221,   221,   221,   222,   222,   223,   223,   224,
     224,   224,   224,   224,   224,   224,   224,   224,   224,   224,
     224,   224,   224,   225,   225,   226,   226,   227,   227,   228,
     228,   228,   229,   229,   230,   230,   231,   231,   231,   231,
     231,   231,   232,   232,   232,   233,   233,   234,   234,   234,
     235,   235,   235,   236,   237,   237,   238,   238,   239,   239,
     239,   240,   240,   240,   240,   240,   240,   240,   241,   241,
     241,   241,   241,   242,   243,   243,   244,   244,   245,   245,
     245,   245,   246,   246,   247,   247,   247,   247,   247,   248,
     248,   249,   250,   250,   251,   251,   252,   253,   253,   253,
     253,   253,   253,   254,   254,   254,   255,   255
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     2,     6,     5,     6,     5,
       7,     6,     7,     6,     1,     1,     4,     3,     4,     3,
       3,     2,     2,     1,     1,     4,     3,     4,     3,     3,
       2,     2,     1,     1,     3,     3,     2,     2,     2,     4,
       2,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     1,     3,     3,     3,     1,
       3,     3,     1,     3,     3,     2,     1,     2,     3,     3,
       3,     1,     3,     3,     1,     3,     1,     3,     1,     3,
       1,     3,     1,     3,     1,     5,     1,     3,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     2,     3,     2,     5,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     4,     5,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     4,     5,     1,     3,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     4,     1,     5,     4,     4,
       3,     5,     2,     2,     1,     2,     1,     1,     1,     1,
       1,     1,     1,     3,     3,     3,     3,     3,     3,     1,
       3,     1,     1,     1,     2,     3,     1,     3,     9,     9,
       7,     7,     5,    10,    10,     8,     8,     6,     8,     8,
       6,     6,     4,     9,     9,     7,     7,     5,     3,     2,
       2,     2,     1,     2,     1,     1,     1,     3,     1,     2,
       2,     3,     5,     2,     2,     4,     5,     7,     7,     5,
       1,     3,     1,     3,     3,     2,     3,     3,     3,     4,
       4,     2,     3,     3,     4,     3,     2,     3,     3,     4,
       1,     1,     2,     2,     2,     3,     1,     1,     2,     2,
       2,     3,     1,     2,     3,     2,     1,     3,     4,     3,
       4,     1,     2,     2,     3,     3,     2,     3,     3,     2,
       1,     1,     2,     2,     1,     2,     2,     3,     3,     1,
       2,     1,     2,     2,     3,     1,     3,     1,     3,     2,
       2,     1,     1,     1,     1,     2,     2,     3,     1,     2,
       1,     2,     2,     1,     3,     1,     2,     1,     2,     1,
       3,     4,     1,     1,     1,     3,     1,     1,     1,     1,
       1,     1,     3,     4,     3,     1,     2,     1,     2,     2,
       1,     1,     2,     1,     2,     3,     1,     2,     5,     7,
       5,     5,     7,     6,     7,     4,     5,     4,     3,     2,
       2,     2,     3,     1,     5,     4,     5,     4,     4,     3,
       4,     3,     3,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     3,     1,     1,     3,     2,     1,     1,     2,
       2,     1,     2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,   410,    17,     7,   207,   208,   209,   210,   211,   221,
     222,   223,   224,   225,   227,   230,   231,   228,   229,   217,
     218,   220,   226,   281,   282,     0,   403,   238,   212,   215,
     214,   404,   408,   232,     0,   161,   173,   235,     8,     5,
       0,   401,   402,   155,   216,   213,   219,   157,   159,   163,
     233,     0,   234,   165,   496,     0,   391,     0,     0,   366,
       0,   351,   412,   411,   381,     0,   380,   362,   350,     0,
     324,   323,     0,   405,     0,   406,     0,   409,     0,     0,
       4,     2,     3,     6,   162,   174,     0,   156,   216,   158,
     160,   164,   166,   400,   399,     0,     8,   263,   262,     0,
       1,   389,   392,   393,   341,     0,     0,     0,   395,   397,
      34,    22,    23,     0,     0,     0,     0,     0,    72,     0,
       0,    67,     0,    70,     0,   335,    66,    68,    69,    71,
       0,    20,    35,    18,    63,    62,    73,     0,    75,    79,
      82,    86,     0,    91,    94,    96,    98,   100,   102,   104,
     122,     0,    21,   354,   383,   382,   353,     0,     0,   365,
     376,     0,   379,     0,     0,     0,     0,   352,   363,   332,
       0,   330,     0,     0,   407,     0,     0,     0,   235,    20,
     269,   264,   145,   147,   149,   153,   267,   272,   271,   270,
     279,     0,   151,     0,     0,     0,     0,   315,   260,     0,
       0,     0,     0,    20,     0,     0,   155,   216,   157,   159,
     163,     0,   286,     0,   314,   283,   165,     0,    12,   371,
       0,     0,    21,   312,     0,     0,     0,   497,   390,   394,
     334,   367,   342,     0,     0,    44,    65,    64,    60,     0,
      56,    57,     0,     0,     0,     0,     0,    25,    73,   106,
     120,     0,   415,   127,   129,   133,   131,     0,   463,    24,
     337,     0,     0,     0,    41,    42,     0,     0,     0,    58,
       0,     0,     0,     0,     0,     0,     0,    87,     0,     0,
      85,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     336,   355,   364,   343,     0,   338,     0,     0,   369,     0,
       0,   377,   378,     0,     0,     0,   325,     0,     0,   236,
     237,     0,     0,     0,   146,   216,   148,   150,   154,   152,
     265,   350,     0,    10,     9,     0,   240,   241,   242,   243,
     244,   246,   249,   250,   247,   248,   239,   245,     0,   256,
       0,   253,   185,     0,   179,   181,   183,   251,     0,   252,
     366,     0,    16,    67,     0,    20,     0,   443,     0,   474,
     477,   478,   476,   475,     0,     0,     0,   309,   366,   156,
     216,   158,   160,   164,     0,   316,   166,   384,    11,   318,
       0,   373,     0,   258,   284,     0,   313,     0,   372,   311,
     310,     0,   259,     0,   396,   398,   139,    20,     0,   417,
     135,   137,   143,   141,     0,     0,    50,    51,     0,     0,
       0,     0,     0,   216,   357,     0,   356,   199,     0,   189,
     191,   193,   195,   197,     0,     0,     0,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   109,     0,    19,
       0,   128,   130,   134,   132,   416,     0,   491,     0,   469,
      63,   423,   422,     0,   483,    43,     0,   488,   484,   494,
     487,     0,     0,   471,     0,    40,    37,    53,     0,    52,
       0,    39,    76,    77,    78,    80,    81,    83,    84,    89,
      90,    88,    92,    93,    95,    97,    99,   101,   103,     0,
     344,   340,   339,   370,   368,   414,   333,   331,     0,   329,
       0,   326,    20,   267,   275,   274,   273,   353,   278,   277,
     276,   280,   324,   323,     0,     0,     0,   186,   180,   182,
     184,     0,   262,    15,   216,     0,   444,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   446,
      20,     0,   435,     0,   437,   426,     0,     0,     0,   427,
     428,   429,   430,   431,     0,   285,    13,   320,     0,   386,
       0,     0,   308,     0,   319,     0,   385,   374,   287,   375,
     261,   257,    59,   140,   136,   138,   144,   142,   418,    61,
      49,    46,     0,     0,    48,   346,     0,     0,     0,   360,
     359,     0,     0,   358,     0,     0,   200,   190,   192,   194,
     196,   198,     0,     0,     0,     0,     0,   108,   107,   121,
      74,   473,     0,     0,   366,   479,   480,   481,     0,   486,
     492,   490,   495,   489,   468,   470,    38,     0,    36,     0,
       0,     0,     0,     0,     0,     0,     0,   302,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,   459,   460,   461,     0,     0,     0,   447,   123,   366,
       0,   203,   205,   436,     0,   439,   438,   445,   125,   467,
       0,   387,     0,   317,   384,     0,   321,   388,    47,    45,
     345,   347,    27,   361,   348,     0,     0,     0,     0,     0,
       0,    29,     0,     0,     0,   472,   482,   485,    55,    54,
     105,   328,   327,   254,   255,   187,     0,     0,     0,     0,
       0,   292,     0,     0,   307,     0,     0,   434,     0,     0,
       0,     0,     0,     0,     0,   458,   462,     0,   432,     0,
       0,   124,     0,   466,   386,     0,     0,   385,     0,   349,
      26,   201,    31,     0,     0,    28,    33,     0,     0,   300,
       0,   301,   188,     0,     0,     0,     0,     0,     0,   297,
     433,     0,     0,   455,     0,     0,   457,     0,     0,     0,
     465,     0,   204,     0,   419,   206,   387,   388,   322,   202,
      30,    32,     0,     0,     0,   290,     0,   291,     0,   305,
       0,   306,     0,     0,   448,   450,   451,     0,   456,     0,
       0,   126,   464,   424,     0,   298,   299,     0,     0,     0,
       0,     0,   295,     0,   296,     0,     0,   453,     0,     0,
     420,   288,   289,   303,   304,     0,     0,   449,   452,   454,
     421,   425,   293,   294
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    35,    36,   226,    38,    39,   199,   200,   201,   202,
     131,   132,   133,   134,   451,   236,   468,   135,   136,   238,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   148,   149,   249,   250,   438,   541,   151,   665,   252,
     399,   181,   205,    42,   343,   418,   660,   661,   182,    44,
      45,    46,   183,   184,   421,   185,    50,   186,   187,   188,
     189,   190,   191,    51,   211,   212,   213,   214,   215,   374,
     375,    52,   192,   170,   171,    61,   414,   105,   415,   106,
      64,   218,    65,    66,    67,   379,   102,   220,   107,   108,
     109,   165,   257,   404,   775,   454,   804,   544,   545,   546,
     547,   548,   358,   549,   550,   551,   552,   553,   259,   554,
     221,   152,   455,   223,   456,   457,   458,   459,   460,   461,
     462,    55
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -726
static const short int yypact[] =
{
    7328,   321,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,
    -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,
    -726,  -726,  -726,  -726,  -726,    52,  -726,  -726,  -726,  -726,
    -726,   311,   498,  -726,   -22,  -726,  -726,  -726,   -13,  -726,
      61,  6157,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,
    -726,    53,  -726,  -726,    -7,   168,   265,  5979,  5576,  -726,
     214,    33,  -726,   434,   414,  6825,  -726,  -726,   175,   179,
     119,   128,   498,   498,   118,   434,   263,   434,    49,  5253,
    -726,  -726,  -726,  -726,  -726,  -726,   378,  -726,   214,  -726,
    -726,  -726,  -726,  -726,   434,  3704,   -39,  -726,   141,  5840,
    -726,  -726,   265,  -726,  -726,   167,   273,   204,   177,  -726,
    -726,  -726,  -726,  5875,  5928,  5928,  7401,  5840,  -726,  7401,
    5840,  -726,  5343,  -726,   314,  -726,  -726,  -726,  -726,  -726,
      11,    21,  -726,  -726,   407,  -726,  -726,  5840,  -726,   183,
     262,   531,  5840,   224,   538,   272,   210,   237,   405,    36,
    -726,   318,  -726,    33,   414,  -726,   175,  6911,  5611,  -726,
    -726,  5664,  -726,   370,   331,     7,    24,    33,  -726,   334,
     -10,  -726,   179,   179,   434,   263,   341,    35,   339,    56,
     531,  6246,  -726,  -726,  -726,  -726,   369,  -726,  -726,  -726,
    -726,    78,  -726,  7474,  7083,  5019,  7401,  -726,  -726,   399,
     399,   399,   489,    23,   320,  2378,  -726,   118,  -726,  -726,
    -726,  3819,  -726,   -35,  -726,  -726,  -726,   414,  -726,  -726,
     263,   379,   433,  -726,  4803,  3934,   339,  -726,  -726,  -726,
    -726,  -726,  -726,  7253,  5433,  -726,   438,  -726,  -726,  5699,
    -726,  -726,   112,  6335,  7547,  6424,  7547,  -726,   816,  -726,
    -726,   247,  6650,  -726,  -726,  -726,  -726,   458,  -726,  -726,
    -726,  2916,  3049,   179,  -726,  -726,  1589,  5840,   179,  -726,
    5840,  5840,  5840,  5840,  5840,  5840,  5840,   531,  5840,  5840,
    -726,  5840,  5840,  5840,  5840,  5840,  5840,  5840,  5840,  5840,
    -726,    33,  -726,  -726,   466,  -726,   162,   475,  -726,   244,
     487,  -726,  -726,   179,  5840,   179,  -726,   336,   373,  -726,
    -726,  5253,  6068,   179,  -726,   464,  -726,  -726,  -726,  -726,
    -726,   450,  5253,  -726,  -726,  5253,  -726,  -726,  -726,  -726,
    -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,    49,  -726,
     503,  -726,   513,  5038,  -726,  -726,  -726,  -726,    49,  -726,
     112,  7083,  -726,   265,  5523,    51,  7168,   494,  4509,  -726,
    -726,  -726,  -726,  -726,  4665,   350,  5840,  -726,   109,  -726,
     118,  -726,  -726,  -726,    95,  -726,  -726,   414,  -726,   -12,
     263,  -726,    24,  -726,  -726,   596,  -726,    24,  -726,  -726,
    -726,  4049,  -726,  4164,  -726,  -726,  -726,    23,   516,  6650,
    -726,  -726,  -726,  -726,   519,   179,  -726,  -726,  2009,  5840,
     179,  6739,  5840,   496,   528,   527,   535,   539,  6513,  -726,
    -726,  -726,  -726,  -726,  5840,   532,  6602,  -726,  -726,  -726,
    -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  4665,  -726,
    5840,  -726,  -726,  -726,  -726,  -726,  5840,  -726,  3182,  -726,
     574,  -726,  -726,  7083,  -726,  -726,   399,  -726,  -726,   131,
    -726,  3315,   524,  -726,   525,  -726,  -726,  -726,   329,  -726,
     499,  -726,  -726,  -726,  -726,   183,   183,   262,   262,   531,
     531,   531,   224,   224,   538,   272,   210,   237,   405,   322,
    -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  4803,  -726,
    4803,  -726,    21,  -726,  -726,  -726,  -726,   450,  -726,  -726,
    -726,  -726,  -726,  -726,    49,  5253,   -23,     3,  -726,  -726,
    -726,    55,  -726,  -726,   118,   548,  -726,  5840,   534,   553,
     558,   559,  4592,   562,   179,   545,   546,  4934,   179,  -726,
     103,   152,  -726,  5143,  -726,  -726,  2517,  2650,   547,  -726,
    -726,  -726,  -726,  -726,   550,  -726,  -726,  -726,  3448,   414,
      24,    25,  -726,  5840,  -726,    24,   414,  -726,  -726,  -726,
    -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,  -726,
    -726,  -726,   471,   500,  -726,  -726,   570,   571,   568,   528,
     535,  6997,  5840,   528,  5253,  5840,   577,  -726,  -726,  -726,
    -726,  -726,   578,   576,  5840,  5840,   579,  -726,  -726,  -726,
    -726,  -726,   563,  4665,   179,  -726,  -726,  -726,  4665,  -726,
    -726,  -726,   131,  -726,  -726,  -726,  -726,  4665,  -726,  5840,
    4279,  4394,   584,    47,   248,   399,   399,  -726,  5253,   229,
     276,   569,  -726,   581,  4592,  5840,  5840,  5752,   644,  4855,
     572,  -726,  -726,  -726,   258,   575,  4592,  -726,  -726,    84,
     303,  -726,   387,  -726,  2783,  -726,  -726,  -726,  -726,  -726,
     573,   414,   118,  -726,   591,   263,   585,   414,  -726,  -726,
    -726,  -726,  -726,   528,  -726,   605,   602,   366,   604,  5253,
    5840,  -726,   607,   608,  5840,  -726,  -726,  -726,  -726,  -726,
    -726,  -726,  -726,  -726,  -726,  -726,   -26,    -6,   409,   399,
     399,  -726,   399,   399,  -726,   343,  4592,  -726,   474,   476,
    4592,   483,   615,  4592,  4888,  -726,  -726,  5840,  -726,  3581,
     498,  -726,  4680,  -726,   591,    24,    24,   591,  5840,  -726,
    -726,  -726,  -726,   448,   616,  -726,  -726,   623,   399,  -726,
     399,  -726,  -726,    -9,   188,    -4,   198,   399,   399,  -726,
    -726,  4592,  4592,  -726,  4592,  5840,  -726,  4592,  5787,   614,
    -726,   613,  -726,  4680,  -726,  -726,   591,   591,  -726,  -726,
    -726,  -726,   617,   618,   399,  -726,   399,  -726,   399,  -726,
     399,  -726,    13,   216,   683,  -726,  -726,   490,  -726,  4592,
     493,  -726,  -726,  -726,   269,  -726,  -726,   619,   625,   626,
     627,   399,  -726,   399,  -726,  4592,   632,  -726,  4592,  2208,
    -726,  -726,  -726,  -726,  -726,   637,   641,  -726,  -726,  -726,
    -726,  -726,  -726,  -726
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -726,    50,   707,   417,   698,    60,  -726,  -726,  -726,  -726,
       0,  -726,   652,   324,  -258,  -726,   371,   665,   662,  -726,
    -726,  -130,   352,   359,   -50,  -726,   354,   497,   495,   501,
     502,   504,  -726,   849,  -264,  -726,   -77,   139,  -340,  -726,
    -726,  -257,    82,  -726,  -726,   540,  -726,    64,  1851,   725,
     411,  -726,  1442,  1994,  -178,  1526,  -144,   159,   200,   205,
     207,   470,  -480,  -174,  -212,   406,  -726,  -726,  -191,  -726,
     235,   -85,  1753,   473,   506,   -51,  -377,    29,  -203,     2,
    1109,  -184,  -726,  1976,   328,   351,  -726,   681,   -54,  -726,
      14,  -726,  -726,  -726,  -725,  -348,  -726,   429,  -726,  -726,
     257,  -726,  -726,   453,  -626,  -726,  -726,  -726,  -726,  -726,
    -726,   -73,  -726,  -726,  -726,   344,   189,   345,   348,  -726,
    -256,  -726
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -494
static const short int yytable[] =
{
      40,    59,   469,    63,   453,   453,   464,   269,   467,   153,
     352,   164,   391,   393,    54,   346,   555,   167,   542,   348,
     384,   378,   222,   724,     2,    71,     2,     2,     2,   180,
      62,    59,    59,    75,    77,   634,   589,   153,     2,   593,
      83,    86,   425,    94,   748,   251,   635,   636,   803,   347,
       2,    98,     2,   288,     2,     2,     2,    86,     2,     2,
      59,   784,    80,   750,     2,   163,   788,    30,    59,   169,
      93,    79,    59,    59,    59,   174,    59,     3,   177,   179,
       3,     3,    41,   811,   385,    70,    83,     2,    59,   323,
      78,    84,   277,   224,   831,   203,   386,    79,   768,    28,
     347,   543,   347,   294,    30,   291,     2,   749,   349,   305,
     637,    97,     2,   638,   687,     2,   242,   563,   251,   242,
     302,     2,    99,   306,   785,  -366,   303,   751,   260,   789,
    -366,    83,    81,    82,    56,   639,    72,    72,   222,    41,
     472,   473,   474,   261,   469,   157,   812,    41,   310,   158,
     467,   222,   222,   262,   366,   262,    59,    40,   708,   349,
     704,   349,   251,    83,   289,   520,    59,   523,   100,   348,
      81,    82,   169,   169,   608,    59,   609,    83,     2,    83,
     607,   313,     2,   262,    69,    95,   311,   640,   262,   324,
     470,   453,   612,   342,   350,   355,   242,   325,   243,   347,
     384,   245,   384,    83,   453,   368,   663,    59,   586,   743,
     320,   203,   489,   683,   561,   602,   729,     2,    81,    82,
      59,    81,    82,   606,   203,   203,   562,    56,   479,   480,
      72,   481,   656,    40,   397,   262,   278,   279,   227,    41,
     599,   558,    83,   242,   417,   242,   417,   395,   599,    28,
     618,   172,   313,   341,    30,    84,   244,   786,   349,   246,
     173,   180,   619,   465,   153,   696,     2,   790,   471,   615,
     167,   440,   180,   225,   347,   180,   351,   251,   356,   491,
     230,   445,   347,   657,   396,   813,   630,    57,   631,   543,
     543,    58,   270,    84,   261,    84,   233,   297,   709,   710,
     300,   453,   670,   495,   341,   169,   341,   271,   272,    19,
      20,   502,    40,    83,     2,    41,   610,   232,   222,   258,
     222,   787,   502,    56,     2,   179,    57,   263,   264,   265,
      58,   791,   583,   349,   280,   281,   285,    28,   513,    28,
      29,   349,    30,   517,    30,   712,   713,    28,   522,   814,
      83,   350,    30,     2,   355,    83,   242,   587,   540,   705,
     439,   493,   711,   699,   286,    59,   440,   325,    83,   698,
      59,    80,   521,     2,    56,    72,   261,   440,  -366,    80,
      59,     2,    59,   273,   274,    28,   231,    59,   819,   726,
      30,   203,   284,   203,    41,    28,   168,    83,   512,   242,
      30,    84,   820,   341,   168,   580,    84,   543,    97,   714,
     584,    40,   757,   758,   263,   264,   265,    37,   596,   204,
      56,   287,   730,    72,    28,   222,   596,   222,   578,    30,
      56,    73,   266,    57,   731,   290,   267,    58,   268,   384,
     384,   440,   626,   496,   301,   405,   406,   407,   627,   573,
     364,   629,  -366,   614,   309,   305,   291,  -366,    37,    56,
     654,    28,    72,   556,   304,   180,    30,   498,   774,   499,
     503,   261,   453,   771,    37,   130,   759,   741,   341,    81,
      82,   503,    37,  -413,   292,   325,   341,    81,    82,  -413,
    -366,  -366,   305,    41,  -366,   176,   178,  -366,   203,   322,
     203,     2,    83,   292,   500,   557,   501,  -366,    28,   774,
     389,   504,   178,    30,   633,   179,   505,   732,   506,   266,
     752,   641,   508,   267,    59,   268,   160,   509,   325,   510,
     161,   357,   540,    37,   650,   204,    37,   685,   655,   178,
      83,   275,   276,   659,   180,   662,   540,   540,   204,   204,
     408,   588,   282,   283,   409,   774,   410,   222,   222,   779,
      59,    59,   312,   603,   390,    59,    58,   325,   718,   719,
     721,   446,    28,    56,    37,   296,   312,    30,   299,   490,
      58,   263,   264,   265,   678,   450,   450,   761,   180,   762,
     627,    40,   492,   440,   179,   440,   764,   110,    37,     2,
     111,   112,   440,   816,   494,    56,   818,    56,   411,   440,
      72,    37,   440,    37,    83,   514,   628,   679,   440,   440,
     362,   357,    37,   515,     3,   475,   476,   526,   178,   572,
     203,   203,   579,    83,   477,   478,   482,   483,   179,   180,
     591,   178,   178,   592,   540,   307,   308,   411,   604,   594,
      37,   178,   359,   360,   361,   363,   540,   624,   625,    83,
      37,   642,    37,   644,   540,   645,   643,   116,   117,    37,
     646,   647,    59,    41,   649,    59,   651,   652,   178,   178,
     667,   668,    68,   680,   681,   682,   266,   689,   797,   179,
     267,   800,   268,   691,   690,   694,   695,   703,   119,   120,
     722,   715,   676,   725,   613,   727,   733,   161,   239,   204,
     716,   124,    76,    76,   738,   204,   540,   204,   739,   740,
     540,   742,    68,   540,   745,   746,    60,   765,   178,    37,
      59,   686,   662,   780,   688,    59,    59,   103,    68,   178,
     781,   156,   178,   692,   693,   801,   802,   815,    85,    96,
     805,   806,   821,    76,    76,   175,    74,    74,   822,   823,
     824,   540,   540,   828,   540,   235,    88,   540,    37,   156,
     832,   178,   450,    37,   833,   178,   240,   241,   237,   582,
     485,   484,    88,   229,   248,   450,   426,   486,   159,   487,
     564,   568,   488,   166,   772,   511,   673,    74,    74,   540,
     159,   166,   159,   664,   616,   621,   622,   697,   178,   623,
     178,   497,     0,     0,     0,   540,    37,     0,   540,   159,
     207,     0,   204,     0,   204,     0,     0,     0,    37,   744,
       0,   159,     0,   747,   427,   428,   429,   430,   431,   432,
     433,   434,   435,   436,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   248,     0,     0,
       0,     0,   321,     0,     0,   178,   769,     0,     0,     0,
      37,     0,     0,     0,     0,     0,    76,   778,   178,     0,
       0,   166,   450,     0,     0,     0,   380,     0,   382,     0,
       0,     0,     0,     0,     0,     0,   398,     0,     0,   159,
     166,   248,     0,     0,     0,     0,   315,   150,     0,   617,
       0,     0,     0,     0,     0,   178,     0,   178,     0,   207,
      74,     0,     0,     0,   416,     0,   416,     0,   248,   248,
     370,   632,   178,   321,     0,     0,   207,     0,     0,     0,
       0,     0,   450,     0,     0,   387,   437,     0,   150,   207,
     207,   248,     0,     0,   204,   204,     0,     0,     0,     0,
      37,   648,     0,   178,   178,     0,   150,     0,   413,   150,
     413,     0,     0,     0,     0,   178,   666,   315,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   321,     0,     0,   507,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   150,    37,     0,
     150,   178,     0,     0,     0,     0,   248,     0,     0,     0,
     248,     0,     0,     0,   321,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   103,    76,     0,   315,     0,     0,
       0,     0,     0,     0,     0,     0,    76,   178,   178,     0,
       0,   560,     0,   450,     0,   178,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   315,     0,
     248,   248,     0,   717,     0,     0,   207,     0,     0,   524,
     321,   178,     0,     0,     0,   728,     0,     0,   706,   707,
      74,     0,   416,   666,   590,     0,     0,     0,     0,   416,
     248,     0,   248,     0,     0,   565,   178,   416,     0,     0,
     452,   452,     0,     0,     0,     0,   207,     0,   207,     0,
       0,     0,     0,     0,   315,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   380,     0,   413,     0,     0,     0,
       0,     0,     0,   413,     0,   760,   178,     0,     0,   763,
       0,   413,   766,   150,     0,     0,     0,     0,     0,     0,
       0,     0,   753,   754,     0,   755,   756,     0,     0,   154,
       0,     0,     0,     0,     0,     0,     0,     0,   370,     0,
       0,     0,     0,   154,     0,     0,     0,     0,     0,     0,
     794,   795,     0,   796,   248,     0,   798,   154,     0,   248,
       0,   782,     0,   783,   217,   175,     0,     0,   248,   248,
     792,   793,     0,   452,     0,   150,     0,     0,     0,     0,
       0,     0,     0,   207,    76,   207,     0,     0,   817,     0,
       0,     0,     0,     0,     0,     0,     0,   807,     0,   808,
       0,   809,   675,   810,   827,     0,     0,   829,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   150,     0,     0,   825,     0,   826,     0,   524,     0,
       0,     0,     0,   150,     0,   154,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   672,     0,     0,   248,
       0,     0,     0,     0,     0,     0,     0,   452,     0,     0,
       0,     0,     0,   217,     0,     0,   248,   248,   248,   248,
     452,   248,     0,     0,   377,     0,   217,     0,   248,     0,
     217,     0,     0,     0,     0,     0,   248,     0,     0,   217,
       0,     0,     0,   217,   217,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   735,     0,   207,   207,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   150,     0,   248,     0,
       0,     0,   248,     0,     0,   248,   248,   159,     0,     0,
       0,     0,     0,     0,   248,     0,     0,     0,     0,     0,
     736,     0,     0,     0,     0,     0,     0,   452,     0,     0,
       0,    76,   150,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   248,   248,     0,   248,   248,     0,   248,
     248,     0,     0,     0,     0,   248,     0,     0,     0,     0,
       0,   150,    47,     0,   150,     0,     0,     0,     0,     0,
       0,     0,     0,   150,   150,    74,     0,     0,     0,     0,
     217,   248,   452,     0,     0,     0,     0,   452,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   248,   700,   559,
     248,   248,     0,    89,     0,     0,     0,     0,     0,   566,
       0,   217,     0,     0,     0,     0,   217,     0,   101,    47,
     217,     0,   217,     0,     0,     0,     0,    47,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    49,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   208,     0,   150,
       0,     0,     0,   150,   228,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   208,     0,
       0,   208,   377,     0,   253,     0,     0,    91,     0,     0,
       0,     0,     0,     0,     0,     0,   150,     0,   452,     0,
       0,     0,     0,    49,     0,     0,     0,   150,     0,     0,
     110,    49,     2,   111,   112,   113,     0,   114,   115,    47,
       0,     0,     0,     0,     0,     0,     0,   217,     0,   217,
       0,     0,     0,     0,     0,     0,     0,     3,     0,     0,
       0,   210,     0,   316,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   154,     0,   345,   208,     0,   208,     0,
       0,     0,   210,     0,     0,   210,     0,   371,   255,     0,
       0,     0,     0,   208,     0,     0,     0,     0,     0,     0,
     116,   117,   118,     0,     0,     0,   208,   208,     0,   671,
     674,     0,     0,     0,   677,    47,   400,     0,     0,     0,
       0,     0,     0,    49,     0,   371,   420,   371,   420,     0,
       0,   119,   120,     0,   441,     0,     0,     0,   121,     0,
       0,   122,   466,   123,   124,     0,     0,   318,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
     210,   448,   210,     0,     0,     0,     0,     0,     0,     0,
       0,   373,     0,     0,     0,     0,     0,   210,     0,   217,
     217,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     210,   210,     0,    53,    47,     0,     0,     0,     0,    49,
     402,     0,     0,     0,     0,     0,     0,     0,     0,   373,
     422,   373,   422,     0,     0,     0,     0,     0,   443,     0,
       0,   734,     0,     0,   737,   519,     0,     0,     0,     0,
       0,     0,     0,   371,    92,   101,   253,     0,   371,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      53,     0,     0,     0,     0,     0,     0,     0,    53,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   208,     0,   208,     0,     0,    49,     0,
       0,   574,     0,     0,   776,   777,     0,     0,   216,     0,
       0,    43,     0,    47,     0,     0,     0,     0,     0,     0,
     598,     0,     0,     0,     0,     0,     0,     0,   598,   216,
       0,     0,   216,     0,     0,   256,     0,   373,     0,     0,
     255,     0,   373,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    87,     0,     0,   316,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
      53,     0,     0,     0,     0,     0,    43,   210,     0,   210,
       0,     0,     0,     0,     0,   576,     0,     0,     0,     0,
       0,     0,     0,     0,   319,     0,     0,    49,     0,     0,
     208,     0,   208,     0,   600,     0,   206,   216,     0,   216,
       0,     0,   600,     0,     0,     0,     0,     0,   376,     0,
       0,     0,     0,     0,   216,     0,     0,   206,     0,     0,
     206,     0,     0,     0,     0,     0,     0,   216,   216,   318,
       0,     0,     0,     0,     0,   316,    53,   403,     0,     0,
       0,     0,     0,     0,    48,     0,   376,   423,   376,   423,
       0,     0,     0,     0,     0,   444,     0,     0,    43,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,   210,     0,   210,     0,     0,     0,
       0,     0,   314,    47,     0,    90,   155,     3,     0,     0,
       0,     0,     0,     0,   344,   206,     0,   206,     0,     0,
     155,    48,     0,     0,     0,     0,   369,     0,     0,    48,
       0,     0,   206,     0,   155,    53,     0,     0,     0,   318,
       0,   219,   208,   208,     0,   206,   206,     0,     0,     0,
     116,   117,   118,     0,    43,     0,     0,     0,     0,   209,
       0,     0,     0,     0,   369,   419,   369,   419,     0,     0,
       0,     0,     0,     0,   376,     0,     0,   256,     0,   376,
     209,   119,   120,   209,     0,     0,   254,    49,   121,     0,
       0,   122,   581,   123,   124,     0,     0,     0,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
       0,   448,   155,     0,   216,     0,   216,     0,     0,     0,
       0,    48,   577,     0,     0,     0,   210,   210,     0,     0,
       0,     0,     0,    43,    53,     0,     0,     0,     0,     0,
     219,   601,     0,     0,     0,   317,     0,     0,     0,   601,
       0,   219,     0,   381,     0,     0,     0,   219,   209,     0,
     209,     0,     0,     0,   518,     0,   388,     0,     0,   372,
     219,   219,   369,     0,     0,   209,   319,   369,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,   209,   209,
       0,     0,     0,     0,     0,     0,     0,    48,   401,     0,
       0,     0,     0,     0,     0,     0,     3,   372,     0,   372,
       0,     0,   206,     0,   206,     0,   442,     0,     0,     0,
       0,   216,     0,   216,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,     0,     0,     0,     0,   597,
       0,     0,     0,     0,     0,     0,     0,   597,     0,   116,
     117,   118,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   319,     0,     0,     0,
       0,     0,     0,     0,   314,     0,    48,     0,     0,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,     0,   123,   124,     0,     0,     0,   219,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,     0,
     773,   830,     0,     0,    53,   372,   381,     0,   254,   206,
     372,   206,     0,     0,     0,     0,   388,     0,   567,     0,
       0,     0,     0,   569,     0,     0,     0,   219,     0,   219,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,   216,   216,   209,     0,   209,     0,     0,
       0,     0,     0,   575,   314,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    48,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,   219,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,    27,     0,     0,   317,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     0,   219,     0,    34,     0,
       0,   206,   206,     0,     0,     0,     0,    56,     0,     0,
     365,     0,   209,     0,   209,     0,     0,     0,     0,     0,
     155,     0,     0,     0,     0,     0,     0,   366,     0,   367,
       0,     0,     0,     0,     0,     0,     0,     0,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   567,   317,     0,     0,
       0,   569,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,   527,
     528,   529,   530,   531,   532,   533,   534,   535,   536,   537,
       0,     0,     0,    27,     0,    48,     0,     0,   116,   117,
     118,    28,    29,     0,   538,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,   219,   219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,   209,   209,   121,     0,     0,   122,
       0,   123,   124,     0,     0,     0,     0,   126,   127,   128,
     129,     0,     0,     0,     0,     0,     0,     0,   539,   357,
    -441,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,   527,   528,   529,   530,   531,   532,   533,   534,
     535,   536,   537,     0,     0,     0,    27,     0,     0,     0,
       0,   116,   117,   118,    28,    29,     0,   538,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,     0,   123,   124,     0,     0,     0,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,   539,   357,  -440,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,   527,   528,   529,   530,   531,
     532,   533,   534,   535,   536,   537,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
     538,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,     0,   123,   124,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   539,   357,  -442,   110,     0,     2,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,   116,   117,   118,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,   122,     0,
     123,   124,     0,     0,     0,     0,   126,   127,   128,   129,
       0,     0,     0,     0,     0,     0,     0,   447,   448,   449,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
     116,   117,   118,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       0,   122,     0,   123,   124,     0,     0,     0,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
     447,   448,   463,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   116,   117,   118,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     0,   122,     0,   123,   124,     0,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,   447,   448,   611,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,   116,   117,   118,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   119,   120,     0,
       0,     0,     0,     0,   121,     0,     0,   122,     0,   123,
     124,     0,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   620,   448,  -493,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,     0,   123,   124,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   447,
     448,   669,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,   116,   117,   118,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,     0,   123,   124,     0,     0,     0,
       0,   126,   127,   128,   129,   110,     0,     2,   111,   112,
       0,     0,   447,   448,   770,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   193,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   194,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   195,     0,   196,   124,
     110,     0,     2,   111,   112,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   197,     0,   198,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   193,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   194,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   195,     0,   196,   124,   110,     0,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     197,     0,   383,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   193,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   194,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   195,     0,   196,   124,
     110,     0,     2,   111,   112,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   197,     0,   392,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   193,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   194,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   195,     0,   196,   124,   110,     0,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     197,     0,   570,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   193,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   194,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   195,     0,   196,   124,
     110,     0,     2,   111,   112,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   197,     0,   571,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   193,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   194,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   195,     0,   196,   124,   110,     0,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     197,     0,   701,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   193,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   194,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   195,     0,   196,   124,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,     0,   197,     0,   702,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,   527,   528,   529,   530,   531,   532,   533,   534,   535,
     536,   537,     0,     0,     0,    27,     0,     0,     0,     0,
     116,   117,   118,    28,    29,     0,   538,     0,    30,     0,
       0,     0,     0,   110,    33,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       3,   122,     0,   123,   124,     0,     0,     0,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
     539,   357,     0,     0,   527,   528,   529,   530,   531,   532,
     533,   534,   535,   536,   537,     0,     0,     0,     0,     0,
       0,     0,     0,   116,   117,   118,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     3,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     0,   122,     0,   123,   124,     3,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,   539,   357,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   116,   117,   118,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   116,   117,   118,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   119,   120,     0,
       0,     0,     0,     0,   121,     0,     0,   122,     0,   123,
     124,     0,   119,   120,     0,   126,   127,   128,   129,   121,
       0,     0,   122,     0,   123,   124,     0,   448,     0,     0,
     126,   127,   128,   129,   110,     0,     2,   111,   112,     0,
       0,     0,   773,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,    27,
       0,   193,     0,     0,   116,   117,     0,    28,    29,     0,
       0,   194,    30,     3,     0,     0,     0,     0,    33,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,    34,     0,   119,   120,     0,     0,     0,
       0,     0,    56,     0,     0,   195,     3,   196,   124,     0,
       0,     0,     0,     0,     0,     0,   116,   117,   118,     0,
       0,     0,     0,     0,   197,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   119,   120,   116,
     117,   118,     3,     0,   121,     0,     0,   122,   723,   123,
     124,     0,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   539,     0,     0,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,   767,   123,   124,     0,   116,   117,   118,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   539,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,     0,     0,   119,   120,     0,     0,
       0,     2,     0,   121,     0,     0,   122,     3,   123,   124,
       0,     0,     0,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,   653,     3,     4,     5,     6,
       7,     8,   326,   327,   328,   329,   330,   331,   332,   333,
     334,   335,    19,    20,   336,   337,    23,    24,   338,     0,
     116,   117,   118,    28,     0,     0,     0,     0,    30,     0,
       0,     0,     0,     0,   339,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
       0,   119,   120,     0,     0,     0,     0,     0,   353,     0,
       0,   354,   247,   123,   124,     0,     0,     0,   340,   126,
     127,   128,   129,     0,     0,     0,     2,    56,     0,     0,
     312,     0,     0,     0,    58,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     516,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,    56,     0,   110,    72,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   658,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,     0,   123,   124,     0,
       0,     3,     0,   126,   127,   128,   129,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,   247,   123,   124,     0,
       0,     3,     0,   126,   127,   128,   129,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   239,   247,   123,   124,     0,
       0,     3,     0,   126,   127,   128,   129,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
       0,     0,    30,     0,     3,     0,     0,     0,    33,     0,
       0,     0,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   353,     0,     0,   354,   247,   123,   124,     3,
       0,     0,     0,   126,   127,   128,   129,   116,   117,   118,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,   119,   120,
       0,     0,   116,   117,   118,   121,     0,     0,   122,     0,
     123,   124,     3,   125,     0,     0,   126,   127,   128,   129,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,     0,   123,   124,     3,   295,     0,
       0,   126,   127,   128,   129,   116,   117,   118,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,   119,   120,     0,     0,
     116,   117,   118,   121,     0,     0,   122,     0,   123,   124,
       3,   298,     0,     0,   126,   127,   128,   129,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       0,   122,   247,   123,   124,     3,     0,     0,     0,   126,
     127,   128,   129,   116,   117,   118,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,   119,   120,     0,     0,   116,   117,
     118,   121,     0,     0,   122,   720,   123,   124,     3,     0,
       0,     0,   126,   127,   128,   129,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,   119,
     120,     0,     0,     0,     0,     0,   121,     0,     0,   122,
     799,   123,   124,     3,     0,     0,     0,   126,   127,   128,
     129,   116,   117,   118,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,   119,   120,     0,     0,   116,   117,   118,   121,
       0,     0,   122,     0,   123,   124,     3,     0,     0,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   119,   120,     0,
       1,     0,     2,     0,   121,     0,     0,   234,     0,   123,
     124,     0,     0,     0,     0,   126,   127,   128,   129,   116,
     117,   118,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     239,     0,   123,   124,    26,    27,     0,     0,   126,   127,
     128,   129,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     0,     0,     0,     1,
       0,     2,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,    57,   104,     0,     0,    58,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,    56,     0,     0,
     312,   104,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,    57,
       0,     0,     0,    58,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,    56,     0,     0,   312,     0,
       0,     0,    58,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,    56,     0,     0,   411,     0,     0,
       0,   412,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,    56,     0,     0,   411,     0,     0,     0,
     424,     3,     4,     5,     6,     7,     8,   326,   327,   328,
     329,   330,   331,   332,   333,   334,   335,    19,    20,   336,
     337,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   339,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,   340,     0,     0,     0,     0,     0,     0,
       0,     0,    56,     0,     0,   411,     0,     0,     0,   595,
       3,     4,     5,     6,     7,     8,   326,   327,   328,   329,
     330,   331,   332,   333,   334,   335,    19,    20,   336,   337,
      23,    24,    25,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   339,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     3,     0,
       0,    30,     0,     0,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,   340,     0,     0,     0,     0,     0,     0,     0,
       0,    56,     0,     0,   411,     0,    27,     0,   605,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       1,     0,     2,     0,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,    56,
       0,     0,   312,     0,     0,     0,    58,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     1,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   411,   585,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,     1,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   162,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,    31,    32,     0,    33,     0,     1,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   293,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     684,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,    56,     0,     0,    72,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     1,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     525,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,   394,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     1,
       0,     2,    30,     0,     0,    31,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     2,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     2,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     3,     4,     5,     6,     7,     8,   326,   327,
     328,   329,   330,   331,   332,   333,   334,   335,    19,    20,
     336,   337,    23,    24,   338,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     339,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       2,     0,     0,    30,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   340,     3,     4,     5,     6,     7,
       8,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,    19,    20,   336,   337,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   339,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   340
};

static const short int yycheck[] =
{
       0,     1,   266,     1,   261,   262,   262,   137,   266,    60,
     194,    65,   224,   225,     0,   193,   364,    68,   358,   193,
     211,   205,    95,   649,     3,    25,     3,     3,     3,    79,
       1,    31,    32,    31,    32,   515,   413,    88,     3,   416,
      40,    41,   245,    41,    70,   122,    69,    70,   773,   193,
       3,    51,     3,    17,     3,     3,     3,    57,     3,     3,
      60,    70,     1,    69,     3,    65,    70,    79,    68,    69,
      41,   110,    72,    73,    74,    73,    76,    28,    78,    79,
      28,    28,     0,    70,   119,    25,    86,     3,    88,    11,
     112,    41,   142,   132,   819,    95,   131,   110,   724,    74,
     244,   358,   246,   157,    79,   156,     3,   133,   193,   119,
     133,    51,     3,   110,   594,     3,   116,   129,   195,   119,
     113,     3,   129,   133,   133,    74,   119,   133,   117,   133,
      79,   131,   109,   110,   109,   132,   112,   112,   211,    57,
     270,   271,   272,   132,   408,   112,   133,    65,   113,   116,
     408,   224,   225,   132,   129,   132,   156,   157,   638,   244,
     113,   246,   239,   163,   128,   343,   166,   351,     0,   343,
     109,   110,   172,   173,   438,   175,   440,   177,     3,   179,
     438,   181,     3,   132,   132,   132,   130,   132,   132,   111,
     267,   448,   448,   193,   194,   195,   196,   119,   116,   343,
     391,   119,   393,   203,   461,   205,   546,   207,   411,   689,
     181,   211,   289,   590,   119,   418,   132,     3,   109,   110,
     220,   109,   110,   426,   224,   225,   131,   109,   278,   279,
     112,   281,   129,   233,   234,   132,    12,    13,    99,   157,
     418,   132,   242,   243,   244,   245,   246,   233,   426,    74,
     119,   132,   252,   193,    79,   205,   117,    69,   343,   120,
     132,   311,   131,   263,   315,   613,     3,    69,   268,   453,
     321,   119,   322,   132,   418,   325,   194,   354,   196,   117,
     113,   252,   426,   131,   234,    69,   498,   112,   500,   546,
     547,   116,   109,   243,   132,   245,   119,   158,    69,    70,
     161,   558,   558,   303,   244,   305,   246,   124,   125,    44,
      45,   311,   312,   313,     3,   233,   446,   113,   391,     5,
     393,   133,   322,   109,     3,   325,   112,     7,     8,     9,
     116,   133,   409,   418,   110,   111,   126,    74,   338,    74,
      75,   426,    79,   343,    79,    69,    70,    74,   348,   133,
     350,   351,    79,     3,   354,   355,   356,   411,   358,   111,
     113,   117,   133,   627,   127,   365,   119,   119,   368,   627,
     370,     1,   343,     3,   109,   112,   132,   119,     0,     1,
     380,     3,   382,   121,   122,    74,   113,   387,   119,   131,
      79,   391,   120,   393,   312,    74,    68,   397,   338,   399,
      79,   351,   133,   343,    76,   405,   356,   664,   348,   133,
     410,   411,    69,    70,     7,     8,     9,     0,   418,    95,
     109,    16,   119,   112,    74,   498,   426,   500,   399,    79,
     109,   120,   112,   112,   131,   117,   116,   116,   118,   630,
     631,   119,   113,   304,   113,     7,     8,     9,   119,   399,
     130,   129,    74,   453,   113,   119,   507,    79,    41,   109,
     537,    74,   112,   113,   130,   515,    79,   131,   732,   133,
     311,   132,   729,   729,    57,    58,   133,   111,   418,   109,
     110,   322,    65,   113,   156,   119,   426,   109,   110,   119,
     112,   113,   119,   411,   116,    78,    79,   119,   498,   130,
     500,     3,   502,   175,   131,   366,   133,   129,    74,   773,
     131,   311,    95,    79,   514,   515,   311,   130,   311,   112,
     111,   521,   322,   116,   524,   118,   112,   322,   119,   322,
     116,   132,   532,   116,   534,   211,   119,   591,   538,   122,
     540,    10,    11,   543,   594,   543,   546,   547,   224,   225,
     112,   412,    14,    15,   116,   819,   118,   630,   631,   111,
     560,   561,   112,   424,   131,   565,   116,   119,   645,   646,
     647,   113,    74,   109,   157,   158,   112,    79,   161,   113,
     116,     7,     8,     9,   113,   261,   262,   113,   638,   113,
     119,   591,   117,   119,   594,   119,   113,     1,   181,     3,
       4,     5,   119,   113,   117,   109,   113,   109,   112,   119,
     112,   194,   119,   196,   614,   112,   117,   117,   119,   119,
     131,   132,   205,   110,    28,   273,   274,   133,   211,   113,
     630,   631,   113,   633,   275,   276,   282,   283,   638,   689,
     112,   224,   225,   116,   644,   172,   173,   112,   116,   110,
     233,   234,   199,   200,   201,   202,   656,   133,   133,   659,
     243,   113,   245,   129,   664,   112,   527,    71,    72,   252,
     112,   112,   672,   591,   112,   675,   131,   131,   261,   262,
     133,   131,     1,   113,   113,   117,   112,   110,   765,   689,
     116,   768,   118,   117,   116,   116,   133,   113,   102,   103,
      56,   132,   563,   131,   130,   130,   133,   116,   112,   385,
     129,   115,    31,    32,   129,   391,   716,   393,   113,   117,
     720,   117,    41,   723,   117,   117,     1,   112,   311,   312,
     730,   592,   730,   117,   595,   735,   736,    56,    57,   322,
     117,    60,   325,   604,   605,   131,   133,    64,    41,    51,
     133,   133,   133,    72,    73,    74,    31,    32,   133,   133,
     133,   761,   762,   131,   764,   113,    41,   767,   351,    88,
     133,   354,   448,   356,   133,   358,   114,   115,   113,   408,
     285,   284,    57,   102,   122,   461,   246,   286,    63,   287,
     379,   385,   288,    68,   730,   325,   561,    72,    73,   799,
      75,    76,    77,   546,   453,   461,   461,   618,   391,   461,
     393,   305,    -1,    -1,    -1,   815,   399,    -1,   818,    94,
      95,    -1,   498,    -1,   500,    -1,    -1,    -1,   411,   690,
      -1,   106,    -1,   694,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   195,    -1,    -1,
      -1,    -1,   181,    -1,    -1,   448,   727,    -1,    -1,    -1,
     453,    -1,    -1,    -1,    -1,    -1,   195,   738,   461,    -1,
      -1,   156,   558,    -1,    -1,    -1,   205,    -1,   207,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   234,    -1,    -1,   174,
     175,   239,    -1,    -1,    -1,    -1,   181,    58,    -1,   456,
      -1,    -1,    -1,    -1,    -1,   498,    -1,   500,    -1,   194,
     195,    -1,    -1,    -1,   243,    -1,   245,    -1,   266,   267,
     205,   514,   515,   252,    -1,    -1,   211,    -1,    -1,    -1,
      -1,    -1,   618,    -1,    -1,   220,   130,    -1,    99,   224,
     225,   289,    -1,    -1,   630,   631,    -1,    -1,    -1,    -1,
     543,   532,    -1,   546,   547,    -1,   117,    -1,   243,   120,
     245,    -1,    -1,    -1,    -1,   558,   547,   252,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   312,    -1,    -1,   315,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   158,   591,    -1,
     161,   594,    -1,    -1,    -1,    -1,   354,    -1,    -1,    -1,
     358,    -1,    -1,    -1,   343,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   353,   354,    -1,   312,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   365,   630,   631,    -1,
      -1,   370,    -1,   729,    -1,   638,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   343,    -1,
     408,   409,    -1,   644,    -1,    -1,   351,    -1,    -1,   354,
     399,   664,    -1,    -1,    -1,   656,    -1,    -1,   635,   636,
     365,    -1,   411,   664,   413,    -1,    -1,    -1,    -1,   418,
     438,    -1,   440,    -1,    -1,   380,   689,   426,    -1,    -1,
     261,   262,    -1,    -1,    -1,    -1,   391,    -1,   393,    -1,
      -1,    -1,    -1,    -1,   399,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   453,    -1,   411,    -1,    -1,    -1,
      -1,    -1,    -1,   418,    -1,   716,   729,    -1,    -1,   720,
      -1,   426,   723,   304,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   709,   710,    -1,   712,   713,    -1,    -1,    60,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   453,    -1,
      -1,    -1,    -1,    74,    -1,    -1,    -1,    -1,    -1,    -1,
     761,   762,    -1,   764,   532,    -1,   767,    88,    -1,   537,
      -1,   748,    -1,   750,    95,   524,    -1,    -1,   546,   547,
     757,   758,    -1,   364,    -1,   366,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   498,   543,   500,    -1,    -1,   799,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   784,    -1,   786,
      -1,   788,   561,   790,   815,    -1,    -1,   818,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   412,    -1,    -1,   811,    -1,   813,    -1,   543,    -1,
      -1,    -1,    -1,   424,    -1,   166,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   561,    -1,    -1,   627,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   448,    -1,    -1,
      -1,    -1,    -1,   194,    -1,    -1,   644,   645,   646,   647,
     461,   649,    -1,    -1,   205,    -1,   207,    -1,   656,    -1,
     211,    -1,    -1,    -1,    -1,    -1,   664,    -1,    -1,   220,
      -1,    -1,    -1,   224,   225,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   672,    -1,   630,   631,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   527,    -1,   716,    -1,
      -1,    -1,   720,    -1,    -1,   723,   724,   662,    -1,    -1,
      -1,    -1,    -1,    -1,   732,    -1,    -1,    -1,    -1,    -1,
     675,    -1,    -1,    -1,    -1,    -1,    -1,   558,    -1,    -1,
      -1,   730,   563,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   761,   762,    -1,   764,   765,    -1,   767,
     768,    -1,    -1,    -1,    -1,   773,    -1,    -1,    -1,    -1,
      -1,   592,     0,    -1,   595,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   604,   605,   730,    -1,    -1,    -1,    -1,
     351,   799,   613,    -1,    -1,    -1,    -1,   618,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   815,   629,   370,
     818,   819,    -1,    41,    -1,    -1,    -1,    -1,    -1,   380,
      -1,   382,    -1,    -1,    -1,    -1,   387,    -1,    56,    57,
     391,    -1,   393,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     0,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    95,    -1,   690,
      -1,    -1,    -1,   694,   102,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   116,    -1,
      -1,   119,   453,    -1,   122,    -1,    -1,    41,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   727,    -1,   729,    -1,
      -1,    -1,    -1,    57,    -1,    -1,    -1,   738,    -1,    -1,
       1,    65,     3,     4,     5,     6,    -1,     8,     9,   157,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   498,    -1,   500,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    95,    -1,   181,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   524,    -1,   193,   194,    -1,   196,    -1,
      -1,    -1,   116,    -1,    -1,   119,    -1,   205,   122,    -1,
      -1,    -1,    -1,   211,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,   224,   225,    -1,   560,
     561,    -1,    -1,    -1,   565,   233,   234,    -1,    -1,    -1,
      -1,    -1,    -1,   157,    -1,   243,   244,   245,   246,    -1,
      -1,   102,   103,    -1,   252,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,   181,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     194,   132,   196,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   205,    -1,    -1,    -1,    -1,    -1,   211,    -1,   630,
     631,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     224,   225,    -1,     0,   312,    -1,    -1,    -1,    -1,   233,
     234,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   243,
     244,   245,   246,    -1,    -1,    -1,    -1,    -1,   252,    -1,
      -1,   672,    -1,    -1,   675,   343,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   351,    41,   353,   354,    -1,   356,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      57,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   391,    -1,   393,    -1,    -1,   312,    -1,
      -1,   399,    -1,    -1,   735,   736,    -1,    -1,    95,    -1,
      -1,     0,    -1,   411,    -1,    -1,    -1,    -1,    -1,    -1,
     418,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   426,   116,
      -1,    -1,   119,    -1,    -1,   122,    -1,   351,    -1,    -1,
     354,    -1,   356,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    41,    -1,    -1,   453,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    57,    -1,
     157,    -1,    -1,    -1,    -1,    -1,    65,   391,    -1,   393,
      -1,    -1,    -1,    -1,    -1,   399,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   181,    -1,    -1,   411,    -1,    -1,
     498,    -1,   500,    -1,   418,    -1,    95,   194,    -1,   196,
      -1,    -1,   426,    -1,    -1,    -1,    -1,    -1,   205,    -1,
      -1,    -1,    -1,    -1,   211,    -1,    -1,   116,    -1,    -1,
     119,    -1,    -1,    -1,    -1,    -1,    -1,   224,   225,   453,
      -1,    -1,    -1,    -1,    -1,   543,   233,   234,    -1,    -1,
      -1,    -1,    -1,    -1,     0,    -1,   243,   244,   245,   246,
      -1,    -1,    -1,    -1,    -1,   252,    -1,    -1,   157,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,   498,    -1,   500,    -1,    -1,    -1,
      -1,    -1,   181,   591,    -1,    41,    60,    28,    -1,    -1,
      -1,    -1,    -1,    -1,   193,   194,    -1,   196,    -1,    -1,
      74,    57,    -1,    -1,    -1,    -1,   205,    -1,    -1,    65,
      -1,    -1,   211,    -1,    88,   312,    -1,    -1,    -1,   543,
      -1,    95,   630,   631,    -1,   224,   225,    -1,    -1,    -1,
      71,    72,    73,    -1,   233,    -1,    -1,    -1,    -1,    95,
      -1,    -1,    -1,    -1,   243,   244,   245,   246,    -1,    -1,
      -1,    -1,    -1,    -1,   351,    -1,    -1,   354,    -1,   356,
     116,   102,   103,   119,    -1,    -1,   122,   591,   109,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   132,   166,    -1,   391,    -1,   393,    -1,    -1,    -1,
      -1,   157,   399,    -1,    -1,    -1,   630,   631,    -1,    -1,
      -1,    -1,    -1,   312,   411,    -1,    -1,    -1,    -1,    -1,
     194,   418,    -1,    -1,    -1,   181,    -1,    -1,    -1,   426,
      -1,   205,    -1,   207,    -1,    -1,    -1,   211,   194,    -1,
     196,    -1,    -1,    -1,   343,    -1,   220,    -1,    -1,   205,
     224,   225,   351,    -1,    -1,   211,   453,   356,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   224,   225,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   233,   234,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   243,    -1,   245,
      -1,    -1,   391,    -1,   393,    -1,   252,    -1,    -1,    -1,
      -1,   498,    -1,   500,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   411,    -1,    -1,    -1,    -1,    -1,    -1,   418,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   426,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   543,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   453,    -1,   312,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,   351,   120,   121,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     132,   133,    -1,    -1,   591,   351,   370,    -1,   354,   498,
     356,   500,    -1,    -1,    -1,    -1,   380,    -1,   382,    -1,
      -1,    -1,    -1,   387,    -1,    -1,    -1,   391,    -1,   393,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,   630,   631,   391,    -1,   393,    -1,    -1,
      -1,    -1,    -1,   399,   543,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   411,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,   453,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   591,    -1,    66,    -1,    -1,   453,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   498,    -1,   500,    -1,   100,    -1,
      -1,   630,   631,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   498,    -1,   500,    -1,    -1,    -1,    -1,    -1,
     524,    -1,    -1,    -1,    -1,    -1,    -1,   129,    -1,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   560,   543,    -1,    -1,
      -1,   565,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,   591,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,   630,   631,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,   630,   631,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,    -1,    -1,    -1,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,   132,
     133,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    77,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,    -1,
     120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   131,   132,   133,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,   132,   133,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,    -1,    -1,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,   132,   133,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,
      -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,   132,   133,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,   132,   133,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,    -1,   120,   121,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
     132,   133,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
      -1,   120,   121,   122,   123,     1,    -1,     3,     4,     5,
      -1,    -1,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    -1,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    -1,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    -1,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    77,    -1,    79,    -1,
      -1,    -1,    -1,     1,    85,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      28,   112,    -1,   114,   115,    -1,    -1,    -1,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,   132,    -1,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,    28,    -1,
      -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   102,   103,    -1,   120,   121,   122,   123,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   132,    -1,    -1,
     120,   121,   122,   123,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    28,    -1,    -1,    -1,    -1,    85,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    28,   114,   115,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,   131,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,
      72,    73,    28,    -1,   109,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,   115,    -1,    71,    72,    73,   120,   121,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,     3,    -1,   109,    -1,    -1,   112,    28,   114,   115,
      -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      71,    72,    73,    74,    -1,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,   100,   120,
     121,   122,   123,    -1,    -1,    -1,     3,   109,    -1,    -1,
     112,    -1,    -1,    -1,   116,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,     1,   112,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      -1,    28,    -1,   120,   121,   122,   123,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    28,    -1,   120,   121,   122,   123,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    28,    -1,   120,   121,   122,   123,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    28,    -1,    -1,    -1,    85,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,   114,   115,    28,
      -1,    -1,    -1,   120,   121,   122,   123,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    71,    72,    73,   109,    -1,    -1,   112,    -1,
     114,   115,    28,   117,    -1,    -1,   120,   121,   122,   123,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,   115,    28,   117,    -1,
      -1,   120,   121,   122,   123,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      71,    72,    73,   109,    -1,    -1,   112,    -1,   114,   115,
      28,   117,    -1,    -1,   120,   121,   122,   123,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,   114,   115,    28,    -1,    -1,    -1,   120,
     121,   122,   123,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    71,    72,
      73,   109,    -1,    -1,   112,   113,   114,   115,    28,    -1,
      -1,    -1,   120,   121,   122,   123,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,   114,   115,    28,    -1,    -1,    -1,   120,   121,   122,
     123,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,    71,    72,    73,   109,
      -1,    -1,   112,    -1,   114,   115,    28,    -1,    -1,    -1,
     120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
       1,    -1,     3,    -1,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,   115,    65,    66,    -1,    -1,   120,   121,
     122,   123,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    -1,    -1,    -1,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,   116,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,   116,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,   116,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,    -1,   116,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      -1,   116,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,
     116,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,   116,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    28,    -1,
      -1,    79,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    66,    -1,   116,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    -1,   116,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   113,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     113,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     1,
      -1,     3,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       3,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     1,     3,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    65,    66,    74,    75,
      79,    82,    83,    85,   100,   135,   136,   137,   138,   139,
     144,   176,   177,   182,   183,   184,   185,   186,   187,   189,
     190,   197,   205,   206,   224,   255,   109,   112,   116,   144,
     183,   209,   211,   213,   214,   216,   217,   218,   221,   132,
     139,   144,   112,   120,   183,   213,   221,   213,   112,   110,
       1,   109,   110,   144,   135,   136,   144,   182,   183,   186,
     187,   189,   206,   211,   213,   132,   138,   139,   144,   129,
       0,   186,   220,   221,   113,   211,   213,   222,   223,   224,
       1,     4,     5,     6,     8,     9,    71,    72,    73,   102,
     103,   109,   112,   114,   115,   117,   120,   121,   122,   123,
     137,   144,   145,   146,   147,   151,   152,   154,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   171,   245,   209,   214,   217,   221,   112,   116,   183,
     112,   116,   113,   144,   222,   225,   183,   209,   218,   144,
     207,   208,   132,   132,   213,   221,   137,   144,   137,   144,
     158,   175,   182,   186,   187,   189,   191,   192,   193,   194,
     195,   196,   206,    68,    78,   112,   114,   131,   133,   140,
     141,   142,   143,   144,   147,   176,   182,   183,   186,   187,
     189,   198,   199,   200,   201,   202,   206,   214,   215,   217,
     221,   244,   245,   247,   132,   132,   137,   171,   186,   221,
     113,   113,   113,   119,   112,   146,   149,   151,   153,   112,
     152,   152,   144,   176,   171,   176,   171,   113,   152,   167,
     168,   170,   173,   186,   187,   189,   206,   226,     5,   242,
     117,   132,   132,     7,     8,     9,   112,   116,   118,   155,
     109,   124,   125,   121,   122,    10,    11,   158,    12,    13,
     110,   111,    14,    15,   120,   126,   127,    16,    17,   128,
     117,   209,   218,   113,   222,   117,   137,   171,   117,   137,
     171,   113,   113,   119,   130,   119,   133,   207,   207,   113,
     113,   130,   112,   144,   182,   183,   186,   187,   189,   206,
     211,   221,   130,    11,   111,   119,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    46,    47,    50,    66,
     100,   139,   144,   178,   182,   186,   188,   190,   197,   205,
     144,   176,   215,   109,   112,   144,   176,   132,   236,   237,
     237,   237,   131,   237,   130,   112,   129,   131,   144,   182,
     183,   186,   187,   189,   203,   204,   206,   214,   215,   219,
     221,   217,   221,   133,   202,   119,   131,   183,   217,   131,
     131,   198,   133,   198,    51,   224,   135,   144,   152,   174,
     186,   187,   189,   206,   227,     7,     8,     9,   112,   116,
     118,   112,   116,   183,   210,   212,   221,   144,   179,   182,
     186,   188,   189,   206,   116,   212,   179,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   130,   169,   113,
     119,   186,   187,   189,   206,   211,   113,   131,   132,   133,
     147,   148,   167,   175,   229,   246,   248,   249,   250,   251,
     252,   253,   254,   133,   254,   144,   113,   148,   150,   168,
     170,   144,   155,   155,   155,   156,   156,   157,   157,   158,
     158,   158,   160,   160,   161,   162,   163,   164,   165,   170,
     113,   117,   117,   117,   117,   144,   171,   208,   131,   133,
     131,   133,   144,   191,   192,   193,   194,   221,   192,   193,
     194,   195,   139,   144,   112,   110,   132,   144,   182,   186,
     188,   211,   144,   215,   183,   112,   133,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    77,   131,
     144,   170,   172,   175,   231,   232,   233,   234,   235,   237,
     238,   239,   240,   241,   243,   229,   113,   171,   132,   214,
     221,   119,   131,   129,   184,   183,   214,   217,   199,   217,
     133,   133,   113,   135,   186,   187,   189,   206,   211,   113,
     144,   113,   150,   170,   144,   113,   212,   222,   171,   210,
     221,   112,   116,   210,   110,   116,   144,   182,   186,   188,
     189,   206,   212,   171,   116,   116,   212,   148,   168,   168,
     155,   133,   254,   130,   144,   215,   219,   237,   119,   131,
     131,   249,   251,   252,   133,   133,   113,   119,   117,   129,
     198,   198,   137,   144,   196,    69,    70,   133,   110,   132,
     132,   144,   113,   171,   129,   112,   112,   112,   231,   112,
     144,   131,   131,   131,   170,   144,   129,   131,   131,   144,
     180,   181,   213,   172,   234,   172,   231,   133,   131,   133,
     254,   214,   183,   204,   214,   221,   171,   214,   113,   117,
     113,   113,   117,   210,   113,   222,   171,   196,   171,   110,
     116,   117,   171,   171,   116,   133,   229,   250,   148,   168,
     167,   133,   133,   113,   113,   111,   237,   237,   196,    69,
      70,   133,    69,    70,   133,   132,   129,   231,   170,   170,
     113,   170,    56,   113,   238,   131,   131,   130,   231,   132,
     119,   131,   130,   133,   214,   221,   183,   214,   129,   113,
     117,   111,   117,   196,   171,   117,   117,   171,    70,   133,
      69,   133,   111,   237,   237,   237,   237,    69,    70,   133,
     231,   113,   113,   231,   113,   112,   231,   113,   238,   171,
     133,   254,   181,   132,   168,   228,   214,   214,   171,   111,
     117,   117,   237,   237,    70,   133,    69,   133,    70,   133,
      69,   133,   237,   237,   231,   231,   231,   170,   231,   113,
     170,   131,   133,   228,   230,   133,   133,   237,   237,   237,
     237,    70,   133,    69,   133,    64,   113,   231,   113,   119,
     133,   133,   133,   133,   133,   237,   237,   231,   131,   231,
     133,   228,   133,   133
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
#line 161 "type.y"
    {
      DeclClass(0, (yyvsp[-1].id).string);
      fileInput.Seek((yylsp[-1]).start.pos, start); 
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;
      
      FreeIdentifier((yyvsp[-1].id));

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
#line 178 "type.y"
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
#line 211 "type.y"
    {
      DeclClass(0, (yyvsp[-1].id).string);
      fileInput.Seek((yylsp[-1]).start.pos, start); 
      parseTypeError = 0;
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;
      FreeIdentifier((yyvsp[-1].id));

      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   ;}
    break;

  case 5:
#line 260 "type.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 6:
#line 262 "type.y"
    {
   #ifdef PRECOMPILER
      DeclClass(0, (yyvsp[-1].id).string);
      fileInput.Seek((yylsp[-1]).start.pos, start); 
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      FreeIdentifier((yyvsp[-1].id));
      FreeIdentifier((yyvsp[0].id));

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
      yylloc = tmpLoc; (yyvsp[0].id).badID = (yyvsp[-1].id); // FreeIdentifier($1);
   #endif
   ;}
    break;

  case 7:
#line 288 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:
#line 297 "type.y"
    { (yyval.specifier) = (yyvsp[-3].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:
#line 299 "type.y"
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
#line 316 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:
#line 318 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:
#line 323 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 14:
#line 328 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 15:
#line 333 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:
#line 335 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:
#line 340 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); ;}
    break;

  case 19:
#line 346 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:
#line 351 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:
#line 353 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:
#line 355 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:
#line 357 "type.y"
    { (yyval.exp) = MkExpString(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:
#line 358 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:
#line 360 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 26:
#line 362 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:
#line 363 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:
#line 364 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:
#line 365 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:
#line 366 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:
#line 367 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:
#line 368 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:
#line 369 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:
#line 370 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 36:
#line 375 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:
#line 376 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:
#line 377 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:
#line 378 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:
#line 379 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:
#line 380 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:
#line 381 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:
#line 385 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:
#line 391 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:
#line 392 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:
#line 393 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:
#line 394 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:
#line 395 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:
#line 396 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:
#line 397 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:
#line 401 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 53:
#line 402 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 54:
#line 403 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 55:
#line 404 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 56:
#line 408 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:
#line 409 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:
#line 410 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:
#line 411 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:
#line 412 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:
#line 413 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:
#line 427 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 67:
#line 428 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 68:
#line 429 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 69:
#line 430 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 70:
#line 431 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 71:
#line 432 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 72:
#line 433 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 74:
#line 438 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:
#line 443 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:
#line 444 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:
#line 445 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:
#line 450 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:
#line 451 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:
#line 456 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:
#line 457 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:
#line 462 "type.y"
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   ;}
    break;

  case 87:
#line 470 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:
#line 471 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:
#line 472 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:
#line 473 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:
#line 478 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:
#line 479 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:
#line 484 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:
#line 489 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:
#line 494 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:
#line 499 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:
#line 504 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 105:
#line 509 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 107:
#line 514 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 108:
#line 515 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:
#line 519 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 110:
#line 520 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 111:
#line 521 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 112:
#line 522 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 113:
#line 523 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 114:
#line 524 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 115:
#line 525 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 116:
#line 526 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 117:
#line 527 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 118:
#line 528 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 119:
#line 529 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 120:
#line 533 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 121:
#line 534 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 123:
#line 542 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 124:
#line 543 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 125:
#line 544 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 126:
#line 545 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 127:
#line 557 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 128:
#line 558 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 129:
#line 559 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 130:
#line 560 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 131:
#line 561 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 132:
#line 562 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 133:
#line 563 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 134:
#line 564 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 135:
#line 568 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 136:
#line 569 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 137:
#line 570 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 138:
#line 571 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 139:
#line 572 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 140:
#line 573 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 141:
#line 574 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 142:
#line 575 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 143:
#line 576 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 144:
#line 577 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 145:
#line 581 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 146:
#line 582 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 147:
#line 583 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 148:
#line 584 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 149:
#line 585 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 150:
#line 586 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 151:
#line 587 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 152:
#line 588 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 153:
#line 589 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 154:
#line 590 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 155:
#line 594 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 156:
#line 595 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 157:
#line 596 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 158:
#line 597 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 159:
#line 598 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 160:
#line 599 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 161:
#line 600 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 162:
#line 601 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 163:
#line 602 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 164:
#line 603 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 165:
#line 604 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 166:
#line 605 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 167:
#line 609 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 168:
#line 610 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 169:
#line 611 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 170:
#line 612 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 171:
#line 613 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 172:
#line 614 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 173:
#line 615 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 174:
#line 616 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 175:
#line 617 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 176:
#line 618 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 177:
#line 619 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 178:
#line 620 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 179:
#line 681 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 180:
#line 682 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 181:
#line 683 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 182:
#line 684 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 183:
#line 685 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 184:
#line 686 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 185:
#line 687 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 186:
#line 688 "type.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 187:
#line 690 "type.y"
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

  case 188:
#line 708 "type.y"
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

  case 189:
#line 724 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 190:
#line 725 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 191:
#line 726 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 192:
#line 727 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 193:
#line 728 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 194:
#line 729 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 195:
#line 730 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 196:
#line 731 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 197:
#line 732 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 198:
#line 733 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 199:
#line 734 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 200:
#line 735 "type.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 201:
#line 737 "type.y"
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

  case 202:
#line 755 "type.y"
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

  case 203:
#line 854 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 204:
#line 855 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 205:
#line 859 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 206:
#line 860 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 207:
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 208:
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 209:
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 210:
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 211:
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 212:
#line 872 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 214:
#line 877 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 215:
#line 882 "type.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 216:
#line 883 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].string)); delete (yyvsp[0].string); ;}
    break;

  case 217:
#line 887 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 218:
#line 888 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 219:
#line 889 "type.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 220:
#line 894 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 221:
#line 895 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 222:
#line 896 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 223:
#line 897 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 224:
#line 898 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 225:
#line 899 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 226:
#line 900 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 227:
#line 901 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 228:
#line 902 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 229:
#line 903 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 230:
#line 904 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 231:
#line 905 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 232:
#line 906 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 236:
#line 910 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 237:
#line 911 "type.y"
    { DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 238:
#line 912 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 239:
#line 916 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 240:
#line 917 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 241:
#line 918 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 242:
#line 919 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 243:
#line 920 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 244:
#line 921 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 245:
#line 922 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 246:
#line 923 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 247:
#line 924 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 248:
#line 925 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 249:
#line 926 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 250:
#line 927 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 254:
#line 931 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 255:
#line 932 "type.y"
    { DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 256:
#line 933 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 257:
#line 938 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 258:
#line 939 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); ;}
    break;

  case 259:
#line 940 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-2].id).string); ;}
    break;

  case 260:
#line 941 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); ;}
    break;

  case 261:
#line 943 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 262:
#line 947 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 263:
#line 949 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 264:
#line 953 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); ;}
    break;

  case 265:
#line 954 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 266:
#line 955 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[0].id).string)), null); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 267:
#line 959 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[0].templateDatatype)); ;}
    break;

  case 268:
#line 974 "type.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[0].id)); ;}
    break;

  case 269:
#line 983 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); ;}
    break;

  case 273:
#line 1006 "type.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 274:
#line 1007 "type.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 275:
#line 1008 "type.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 276:
#line 1010 "type.y"
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

  case 277:
#line 1022 "type.y"
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

  case 278:
#line 1034 "type.y"
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

  case 279:
#line 1048 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); ;}
    break;

  case 280:
#line 1049 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); ;}
    break;

  case 281:
#line 1162 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 282:
#line 1163 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 283:
#line 1167 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 284:
#line 1168 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 285:
#line 1172 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 286:
#line 1176 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 287:
#line 1177 "type.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 288:
#line 1182 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 289:
#line 1184 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 290:
#line 1186 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 291:
#line 1188 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 292:
#line 1190 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 293:
#line 1193 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 294:
#line 1195 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 295:
#line 1197 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 296:
#line 1199 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 297:
#line 1201 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 298:
#line 1204 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 299:
#line 1206 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:
#line 1208 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:
#line 1210 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:
#line 1212 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:
#line 1215 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:
#line 1217 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:
#line 1219 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:
#line 1221 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:
#line 1223 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:
#line 1227 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 309:
#line 1228 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 310:
#line 1229 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 311:
#line 1230 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 312:
#line 1231 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 313:
#line 1232 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 314:
#line 1233 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 315:
#line 1234 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 316:
#line 1239 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 317:
#line 1241 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 318:
#line 1246 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 319:
#line 1248 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 320:
#line 1250 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 321:
#line 1252 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 322:
#line 1254 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 323:
#line 1258 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 324:
#line 1259 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 325:
#line 1264 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); ;}
    break;

  case 326:
#line 1265 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 327:
#line 1266 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].id).string); ;}
    break;

  case 328:
#line 1267 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); ;}
    break;

  case 329:
#line 1268 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 330:
#line 1285 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 331:
#line 1287 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 332:
#line 1292 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 333:
#line 1294 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 334:
#line 1300 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 335:
#line 1302 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 336:
#line 1304 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 337:
#line 1306 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 338:
#line 1308 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 339:
#line 1310 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 340:
#line 1312 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 341:
#line 1314 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 342:
#line 1316 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 343:
#line 1318 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 344:
#line 1320 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 345:
#line 1325 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 346:
#line 1327 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 347:
#line 1329 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 348:
#line 1331 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 349:
#line 1333 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 350:
#line 1337 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 352:
#line 1339 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 353:
#line 1340 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 354:
#line 1341 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 355:
#line 1342 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 356:
#line 1346 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 358:
#line 1348 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 359:
#line 1349 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 360:
#line 1350 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 361:
#line 1351 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 363:
#line 1399 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 364:
#line 1401 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 366:
#line 1408 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 367:
#line 1410 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 368:
#line 1412 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 369:
#line 1414 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 370:
#line 1416 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 372:
#line 1422 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 373:
#line 1425 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 374:
#line 1427 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 375:
#line 1429 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 377:
#line 1439 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 378:
#line 1441 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 379:
#line 1443 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 382:
#line 1450 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 383:
#line 1452 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 385:
#line 1457 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 386:
#line 1458 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 387:
#line 1459 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 388:
#line 1460 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 389:
#line 1464 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 390:
#line 1465 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 391:
#line 1469 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 392:
#line 1470 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 393:
#line 1471 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 394:
#line 1472 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 396:
#line 1477 "type.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 397:
#line 1481 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 398:
#line 1482 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 399:
#line 1486 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 400:
#line 1487 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 401:
#line 1488 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 402:
#line 1489 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 403:
#line 1501 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 404:
#line 1503 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); ;}
    break;

  case 405:
#line 1505 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 406:
#line 1507 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), (yyvsp[0].declarator));  ;}
    break;

  case 407:
#line 1509 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); ;}
    break;

  case 408:
#line 1511 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); ;}
    break;

  case 409:
#line 1513 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), (yyvsp[0].declarator)); ;}
    break;

  case 410:
#line 1516 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), null); ;}
    break;

  case 411:
#line 1517 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[0].declarator)); ;}
    break;

  case 412:
#line 1519 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[0].declarator)); ;}
    break;

  case 413:
#line 1523 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 414:
#line 1524 "type.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 415:
#line 1528 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 416:
#line 1529 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 417:
#line 1533 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 418:
#line 1534 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 419:
#line 1539 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 420:
#line 1541 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 421:
#line 1543 "type.y"
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

  case 422:
#line 1559 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 423:
#line 1561 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 424:
#line 1583 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 425:
#line 1585 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 432:
#line 1599 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 433:
#line 1601 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 434:
#line 1603 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 435:
#line 1607 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 436:
#line 1608 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 437:
#line 1612 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 438:
#line 1613 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 439:
#line 1616 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); ;}
    break;

  case 440:
#line 1620 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 441:
#line 1621 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 442:
#line 1622 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 443:
#line 1626 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 444:
#line 1631 "type.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 445:
#line 1639 "type.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 446:
#line 1643 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 447:
#line 1644 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:
#line 1648 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:
#line 1649 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:
#line 1650 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:
#line 1654 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:
#line 1655 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:
#line 1656 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:
#line 1657 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:
#line 1659 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:
#line 1660 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:
#line 1661 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:
#line 1665 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:
#line 1666 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:
#line 1667 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:
#line 1668 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 462:
#line 1669 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:
#line 1673 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 464:
#line 1678 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 465:
#line 1680 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 466:
#line 1685 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 467:
#line 1687 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 468:
#line 1712 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 469:
#line 1714 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 470:
#line 1716 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 471:
#line 1718 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 472:
#line 1723 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 473:
#line 1725 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 474:
#line 1729 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 475:
#line 1731 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 476:
#line 1733 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 477:
#line 1735 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 478:
#line 1737 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 479:
#line 1743 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 480:
#line 1745 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 481:
#line 1750 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 482:
#line 1754 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 483:
#line 1755 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 484:
#line 1760 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 485:
#line 1762 "type.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 486:
#line 1767 "type.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 487:
#line 1771 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 488:
#line 1772 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 489:
#line 1773 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 490:
#line 1774 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 491:
#line 1775 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 492:
#line 1776 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 494:
#line 1781 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 495:
#line 1782 "type.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 496:
#line 1786 "type.y"
    { parsedType = (yyvsp[0].typeName); ;}
    break;

  case 497:
#line 1787 "type.y"
    { parsedType = (yyvsp[-2].typeName); parsedType.bitCount = (yyvsp[0].exp); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 5986 "type.ec"

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


#line 1790 "type.y"



