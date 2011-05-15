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
#define YYLAST   7581

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  121
/* YYNRULES -- Number of rules. */
#define YYNRULES  495
/* YYNRULES -- Number of states. */
#define YYNSTATES  831

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
       2,     2,     2,   122,     2,     2,     2,   124,   119,     2,
     112,   113,   109,   120,   118,   121,   117,   123,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   128,   130,
     110,   129,   111,   127,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   115,     2,   116,   125,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   131,   126,   132,   114,     2,     2,     2,
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
      60,    62,    64,    66,    68,    71,    78,    84,    91,    97,
     105,   112,   120,   127,   129,   131,   136,   140,   145,   149,
     153,   156,   159,   161,   163,   168,   172,   177,   181,   185,
     188,   191,   193,   195,   199,   203,   206,   209,   212,   217,
     220,   225,   227,   229,   231,   233,   235,   237,   239,   241,
     243,   245,   247,   249,   254,   256,   260,   264,   268,   270,
     274,   278,   280,   284,   288,   291,   293,   296,   300,   304,
     308,   310,   314,   318,   320,   324,   326,   330,   332,   336,
     338,   342,   344,   348,   350,   356,   358,   362,   366,   368,
     370,   372,   374,   376,   378,   380,   382,   384,   386,   388,
     390,   394,   396,   399,   403,   406,   412,   414,   417,   419,
     422,   424,   427,   429,   432,   434,   437,   439,   442,   444,
     447,   449,   452,   454,   457,   459,   462,   464,   467,   469,
     472,   474,   477,   479,   482,   484,   487,   489,   492,   494,
     497,   499,   502,   504,   507,   509,   512,   514,   517,   519,
     522,   524,   527,   529,   532,   534,   537,   539,   542,   544,
     547,   549,   552,   554,   557,   559,   562,   567,   573,   575,
     578,   580,   583,   585,   588,   590,   593,   595,   598,   600,
     603,   608,   614,   616,   620,   622,   626,   628,   630,   632,
     634,   636,   638,   640,   642,   644,   646,   648,   650,   652,
     654,   656,   658,   660,   662,   664,   666,   668,   670,   672,
     674,   676,   678,   680,   682,   684,   689,   694,   696,   698,
     700,   702,   704,   706,   708,   710,   712,   714,   716,   718,
     720,   722,   724,   726,   731,   736,   738,   744,   749,   754,
     758,   764,   767,   770,   772,   775,   777,   779,   781,   783,
     785,   787,   789,   793,   797,   801,   805,   809,   813,   815,
     819,   821,   823,   825,   828,   832,   834,   838,   848,   858,
     866,   874,   880,   891,   902,   911,   920,   927,   936,   945,
     952,   959,   964,   974,   984,   992,  1000,  1006,  1010,  1013,
    1016,  1019,  1021,  1024,  1026,  1028,  1030,  1034,  1036,  1039,
    1042,  1046,  1052,  1055,  1058,  1063,  1069,  1077,  1085,  1091,
    1093,  1097,  1099,  1103,  1107,  1110,  1114,  1118,  1122,  1127,
    1132,  1135,  1139,  1143,  1148,  1152,  1155,  1159,  1163,  1168,
    1170,  1172,  1175,  1178,  1181,  1185,  1187,  1189,  1192,  1195,
    1198,  1202,  1204,  1207,  1211,  1214,  1216,  1220,  1225,  1229,
    1234,  1236,  1239,  1242,  1246,  1250,  1253,  1257,  1261,  1264,
    1266,  1268,  1271,  1274,  1276,  1279,  1282,  1286,  1290,  1292,
    1295,  1297,  1300,  1303,  1307,  1309,  1313,  1315,  1319,  1322,
    1325,  1327,  1329,  1331,  1333,  1336,  1339,  1343,  1345,  1348,
    1350,  1353,  1356,  1358,  1362,  1364,  1367,  1369,  1372,  1374,
    1378,  1383,  1385,  1387,  1389,  1393,  1395,  1397,  1399,  1401,
    1403,  1405,  1409,  1414,  1418,  1420,  1423,  1425,  1428,  1431,
    1433,  1435,  1438,  1440,  1443,  1447,  1449,  1452,  1458,  1466,
    1472,  1478,  1486,  1493,  1501,  1506,  1512,  1517,  1521,  1524,
    1527,  1530,  1534,  1540,  1545,  1551,  1556,  1561,  1565,  1570,
    1574,  1578,  1581,  1584,  1587,  1590,  1593,  1596,  1599,  1602,
    1605,  1609,  1611,  1613,  1617,  1620,  1622,  1624,  1627,  1630,
    1632,  1635,  1637,  1639,  1642,  1644
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     253,     0,    -1,   143,   109,    -1,   143,   110,    -1,   143,
       1,    -1,   138,    -1,   143,   143,    -1,    28,    -1,   137,
      -1,   137,   110,   195,   111,    -1,   137,   110,   195,    11,
      -1,   175,   214,    -1,   214,    -1,   175,   112,   113,    -1,
     114,   175,   112,   113,    -1,    78,   175,   214,    -1,    78,
     214,    -1,     3,    -1,   145,    -1,   112,   169,   113,    -1,
     143,    -1,   243,    -1,     4,    -1,     5,    -1,   112,   113,
      -1,    71,   175,   211,   115,   170,   116,    -1,    71,   175,
     115,   170,   116,    -1,   102,   175,   211,   115,   170,   116,
      -1,   102,   175,   115,   170,   116,    -1,    72,   170,   178,
     211,   115,   170,   116,    -1,    72,   170,   178,   115,   170,
     116,    -1,   103,   170,   178,   211,   115,   170,   116,    -1,
     103,   170,   178,   115,   170,   116,    -1,     1,    -1,   144,
      -1,   146,   115,   169,   116,    -1,   146,   112,   113,    -1,
     146,   112,   149,   113,    -1,   146,   117,   143,    -1,   146,
       7,   143,    -1,   146,     8,    -1,   146,     9,    -1,   244,
      -1,   145,    -1,   148,   115,   169,   116,    -1,   148,   112,
     113,    -1,   148,   112,   149,   113,    -1,   148,   117,   143,
      -1,   148,     7,   143,    -1,   148,     8,    -1,   148,     9,
      -1,   167,    -1,   147,    -1,   149,   118,   167,    -1,   149,
     118,   147,    -1,     8,   151,    -1,     9,   151,    -1,   153,
     154,    -1,     6,   112,   151,   113,    -1,     6,   152,    -1,
       6,   112,   226,   113,    -1,   150,    -1,   146,    -1,   150,
      -1,   148,    -1,   119,    -1,   109,    -1,   120,    -1,   121,
      -1,   114,    -1,   122,    -1,    73,    -1,   151,    -1,   112,
     225,   113,   154,    -1,   154,    -1,   155,   109,   154,    -1,
     155,   123,   154,    -1,   155,   124,   154,    -1,   155,    -1,
     156,   120,   155,    -1,   156,   121,   155,    -1,   156,    -1,
     157,    10,   156,    -1,   157,    11,   156,    -1,   159,   110,
      -1,   157,    -1,   158,   157,    -1,   159,   111,   157,    -1,
     159,    12,   157,    -1,   159,    13,   157,    -1,   159,    -1,
     160,    14,   159,    -1,   160,    15,   159,    -1,   160,    -1,
     161,   119,   160,    -1,   161,    -1,   162,   125,   161,    -1,
     162,    -1,   163,   126,   162,    -1,   163,    -1,   164,    16,
     163,    -1,   164,    -1,   165,    17,   164,    -1,   165,    -1,
     165,   127,   169,   128,   166,    -1,   166,    -1,   151,   168,
     167,    -1,   151,   168,   147,    -1,   129,    -1,    18,    -1,
      19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,   167,    -1,
     169,   118,   167,    -1,   166,    -1,   174,   130,    -1,   174,
     179,   130,    -1,   241,   130,    -1,    77,   143,   129,   170,
     130,    -1,   185,    -1,   172,   185,    -1,   186,    -1,   172,
     186,    -1,   205,    -1,   172,   205,    -1,   188,    -1,   172,
     188,    -1,   185,    -1,   173,   185,    -1,   186,    -1,   173,
     186,    -1,   134,    -1,   173,   134,    -1,   205,    -1,   173,
     205,    -1,   188,    -1,   173,   188,    -1,   181,    -1,   174,
     181,    -1,   185,    -1,   174,   185,    -1,   186,    -1,   174,
     186,    -1,   205,    -1,   174,   205,    -1,   188,    -1,   174,
     188,    -1,   181,    -1,   175,   181,    -1,   185,    -1,   175,
     185,    -1,   186,    -1,   175,   186,    -1,   134,    -1,   175,
     134,    -1,   188,    -1,   175,   188,    -1,   205,    -1,   175,
     205,    -1,   181,    -1,   175,   181,    -1,   185,    -1,   175,
     185,    -1,   186,    -1,   175,   186,    -1,   135,    -1,   175,
     135,    -1,   188,    -1,   175,   188,    -1,   205,    -1,   175,
     205,    -1,   181,    -1,   177,   181,    -1,   185,    -1,   177,
     185,    -1,   187,    -1,   177,   187,    -1,   143,    -1,   177,
     143,    -1,   143,   110,   195,   111,    -1,   177,   143,   110,
     195,   111,    -1,   181,    -1,   178,   181,    -1,   185,    -1,
     178,   185,    -1,   187,    -1,   178,   187,    -1,   188,    -1,
     178,   188,    -1,   205,    -1,   178,   205,    -1,   143,    -1,
     178,   143,    -1,   143,   110,   195,   111,    -1,   178,   143,
     110,   195,   111,    -1,   180,    -1,   179,   118,   180,    -1,
     212,    -1,   212,   129,   227,    -1,    29,    -1,    30,    -1,
      31,    -1,    32,    -1,    33,    -1,    74,    -1,   183,    -1,
      79,    -1,    75,    -1,   182,    -1,    44,    -1,    45,    -1,
     184,    -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,
      43,    -1,    40,    -1,    41,    -1,    85,    -1,   189,    -1,
     204,    -1,   136,    -1,   100,   112,   136,   113,    -1,   100,
     112,   143,   113,    -1,    66,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
     189,    -1,   204,    -1,   138,    -1,   100,   112,   136,   113,
      -1,   100,   112,   143,   113,    -1,    66,    -1,   196,   143,
     131,   197,   132,    -1,   196,   131,   197,   132,    -1,   196,
     143,   131,   132,    -1,   196,   131,   132,    -1,   196,   137,
     131,   197,   132,    -1,   196,   143,    -1,   196,   138,    -1,
     174,    -1,   174,   210,    -1,   143,    -1,   190,    -1,   143,
      -1,   157,    -1,   193,    -1,   192,    -1,   191,    -1,   143,
     129,   193,    -1,   143,   129,   192,    -1,   143,   129,   191,
      -1,   190,   129,   193,    -1,   190,   129,   192,    -1,   190,
     129,   191,    -1,   194,    -1,   195,   118,   194,    -1,    48,
      -1,    49,    -1,   201,    -1,   197,   201,    -1,   146,   129,
     228,    -1,   198,    -1,   199,   118,   198,    -1,    68,   177,
     143,   131,    69,   236,    70,   236,   132,    -1,    68,   177,
     143,   131,    70,   236,    69,   236,   132,    -1,    68,   177,
     143,   131,    69,   236,   132,    -1,    68,   177,   143,   131,
      70,   236,   132,    -1,    68,   177,   143,   131,   132,    -1,
      68,   177,   210,   143,   131,    69,   236,    70,   236,   132,
      -1,    68,   177,   210,   143,   131,    70,   236,    69,   236,
     132,    -1,    68,   177,   210,   143,   131,    69,   236,   132,
      -1,    68,   177,   210,   143,   131,    70,   236,   132,    -1,
      68,   177,   210,   143,   131,   132,    -1,    68,   177,   131,
      69,   236,    70,   236,   132,    -1,    68,   177,   131,    70,
     236,    69,   236,   132,    -1,    68,   177,   131,    69,   236,
     132,    -1,    68,   177,   131,    70,   236,   132,    -1,    68,
     177,   131,   132,    -1,    68,   177,   210,   131,    69,   236,
      70,   236,   132,    -1,    68,   177,   210,   131,    70,   236,
      69,   236,   132,    -1,    68,   177,   210,   131,    69,   236,
     132,    -1,    68,   177,   210,   131,    70,   236,   132,    -1,
      68,   177,   210,   131,   132,    -1,   175,   202,   130,    -1,
     175,   130,    -1,   243,   130,    -1,   242,   130,    -1,   245,
      -1,   199,   130,    -1,   200,    -1,   130,    -1,   203,    -1,
     202,   118,   203,    -1,   218,    -1,   218,   183,    -1,   128,
     170,    -1,   218,   128,   170,    -1,   218,   128,   170,   128,
     170,    -1,    50,   143,    -1,    50,   138,    -1,    50,   131,
     206,   132,    -1,    50,   143,   131,   206,   132,    -1,    50,
     143,   131,   206,   130,   197,   132,    -1,    50,   138,   131,
     206,   130,   197,   132,    -1,    50,   138,   131,   206,   132,
      -1,   207,    -1,   206,   118,   207,    -1,   143,    -1,   143,
     129,   170,    -1,   112,   210,   113,    -1,   115,   116,    -1,
     115,   170,   116,    -1,   115,   136,   116,    -1,   208,   115,
     116,    -1,   208,   115,   170,   116,    -1,   208,   115,   136,
     116,    -1,   112,   113,    -1,   112,   221,   113,    -1,   208,
     112,   113,    -1,   208,   112,   221,   113,    -1,   112,   211,
     113,    -1,   112,   113,    -1,   112,   221,   113,    -1,   209,
     112,   113,    -1,   209,   112,   221,   113,    -1,   220,    -1,
     208,    -1,   220,   208,    -1,   182,   220,    -1,   182,   208,
      -1,   182,   220,   208,    -1,   220,    -1,   209,    -1,   220,
     209,    -1,   182,   220,    -1,   182,   209,    -1,   182,   220,
     209,    -1,   217,    -1,   220,   217,    -1,   182,   220,   217,
      -1,   212,   182,    -1,   143,    -1,   112,   212,   113,    -1,
     213,   115,   170,   116,    -1,   213,   115,   116,    -1,   213,
     115,   136,   116,    -1,   216,    -1,   220,   216,    -1,   182,
     216,    -1,   182,   220,   216,    -1,   220,   182,   216,    -1,
     213,   112,    -1,   215,   221,   113,    -1,   215,   224,   113,
      -1,   215,   113,    -1,   216,    -1,   213,    -1,   182,   216,
      -1,   182,   213,    -1,   213,    -1,   220,   213,    -1,   182,
     213,    -1,   182,   220,   213,    -1,   220,   182,   213,    -1,
     185,    -1,   219,   185,    -1,   109,    -1,   109,   219,    -1,
     109,   220,    -1,   109,   219,   220,    -1,   222,    -1,   222,
     118,    51,    -1,   223,    -1,   222,   118,   223,    -1,   175,
     212,    -1,   175,   210,    -1,   175,    -1,   176,    -1,    65,
      -1,    82,    -1,    82,   119,    -1,    82,   212,    -1,    82,
     119,   212,    -1,    83,    -1,    83,   212,    -1,     1,    -1,
       1,   212,    -1,     1,   210,    -1,   143,    -1,   224,   118,
     143,    -1,   172,    -1,   172,   210,    -1,   173,    -1,   173,
     210,    -1,   167,    -1,   131,   229,   132,    -1,   131,   229,
     118,   132,    -1,   166,    -1,   147,    -1,   227,    -1,   229,
     118,   227,    -1,   231,    -1,   236,    -1,   237,    -1,   238,
      -1,   239,    -1,   240,    -1,   143,   128,   230,    -1,    52,
     170,   128,   230,    -1,    53,   128,   230,    -1,   171,    -1,
     232,   171,    -1,   230,    -1,   233,   230,    -1,   233,   171,
      -1,   233,    -1,   232,    -1,   232,   233,    -1,   131,    -1,
     131,   132,    -1,   235,   234,   132,    -1,   130,    -1,   169,
     130,    -1,    54,   112,   169,   113,   230,    -1,    54,   112,
     169,   113,   230,    64,   230,    -1,    55,   112,   169,   113,
     230,    -1,    56,   112,   169,   113,   230,    -1,    57,   230,
      56,   112,   169,   113,   130,    -1,    58,   112,   237,   237,
     113,   230,    -1,    58,   112,   237,   237,   169,   113,   230,
      -1,    56,   112,   113,   230,    -1,    58,   112,   237,   113,
     230,    -1,    58,   112,   113,   230,    -1,    59,   143,   130,
      -1,    60,   130,    -1,    61,   130,    -1,    62,   130,    -1,
      62,   169,   130,    -1,   174,   143,   131,   252,   132,    -1,
     174,   143,   131,   132,    -1,   175,   143,   131,   252,   132,
      -1,   175,   143,   131,   132,    -1,   136,   131,   252,   132,
      -1,   136,   131,   132,    -1,   143,   131,   252,   132,    -1,
     143,   131,   132,    -1,   131,   252,   132,    -1,   131,   132,
      -1,   139,   236,    -1,   142,   236,    -1,   142,   130,    -1,
     140,   236,    -1,   141,   236,    -1,   174,   214,    -1,   174,
     218,    -1,   246,   236,    -1,   146,   129,   228,    -1,   228,
      -1,   248,    -1,   249,   118,   248,    -1,   249,   130,    -1,
     250,    -1,   247,    -1,   251,   250,    -1,   251,   247,    -1,
     130,    -1,   251,   130,    -1,   251,    -1,   249,    -1,   251,
     249,    -1,   223,    -1,   223,   128,   170,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   160,   160,   177,   210,   260,   261,   288,   296,   297,
     298,   315,   317,   322,   327,   332,   334,   339,   344,   345,
     350,   352,   354,   356,   358,   361,   362,   363,   364,   365,
     366,   367,   368,   369,   373,   374,   375,   376,   377,   378,
     379,   380,   384,   389,   390,   391,   392,   393,   394,   395,
     396,   400,   401,   402,   403,   407,   408,   409,   410,   411,
     412,   416,   417,   421,   422,   426,   427,   428,   429,   430,
     431,   432,   436,   437,   441,   442,   443,   444,   448,   449,
     450,   454,   455,   456,   460,   468,   469,   470,   471,   472,
     476,   477,   478,   482,   483,   487,   488,   492,   493,   497,
     498,   502,   503,   507,   508,   512,   513,   514,   518,   519,
     520,   521,   522,   523,   524,   525,   526,   527,   528,   532,
     533,   537,   541,   542,   543,   544,   556,   557,   558,   559,
     560,   561,   562,   563,   567,   568,   569,   570,   571,   572,
     573,   574,   575,   576,   580,   581,   582,   583,   584,   585,
     586,   587,   588,   589,   593,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   603,   604,   608,   609,   610,   611,
     612,   613,   614,   615,   616,   617,   618,   619,   680,   681,
     682,   683,   684,   685,   686,   687,   688,   706,   723,   724,
     725,   726,   727,   728,   729,   730,   731,   732,   733,   734,
     735,   753,   853,   854,   858,   859,   863,   864,   865,   866,
     867,   871,   872,   876,   881,   882,   886,   887,   888,   893,
     894,   895,   896,   897,   898,   899,   900,   901,   902,   903,
     904,   905,   906,   907,   908,   909,   910,   911,   915,   916,
     917,   918,   919,   920,   921,   922,   923,   924,   925,   926,
     927,   928,   929,   930,   931,   932,   937,   938,   939,   940,
     941,   946,   947,   952,   953,   954,   958,   973,   982,  1002,
    1003,  1004,  1005,  1006,  1007,  1008,  1020,  1032,  1047,  1048,
    1161,  1162,  1166,  1167,  1171,  1175,  1176,  1180,  1182,  1184,
    1186,  1188,  1191,  1193,  1195,  1197,  1199,  1202,  1204,  1206,
    1208,  1210,  1213,  1215,  1217,  1219,  1221,  1226,  1227,  1228,
    1229,  1230,  1231,  1232,  1233,  1237,  1239,  1244,  1246,  1248,
    1250,  1252,  1257,  1258,  1262,  1264,  1265,  1266,  1267,  1283,
    1285,  1290,  1292,  1298,  1300,  1302,  1304,  1306,  1308,  1310,
    1312,  1314,  1316,  1318,  1323,  1325,  1327,  1329,  1331,  1336,
    1337,  1338,  1339,  1340,  1341,  1345,  1346,  1347,  1348,  1349,
    1350,  1396,  1397,  1399,  1401,  1406,  1408,  1410,  1412,  1414,
    1419,  1420,  1423,  1425,  1427,  1433,  1437,  1439,  1441,  1446,
    1447,  1448,  1450,  1455,  1456,  1457,  1458,  1459,  1463,  1464,
    1468,  1469,  1470,  1471,  1475,  1476,  1480,  1481,  1485,  1486,
    1487,  1488,  1499,  1501,  1503,  1505,  1507,  1509,  1511,  1514,
    1516,  1518,  1522,  1523,  1527,  1528,  1532,  1533,  1537,  1539,
    1541,  1557,  1559,  1581,  1583,  1588,  1589,  1590,  1591,  1592,
    1593,  1597,  1599,  1601,  1606,  1607,  1611,  1612,  1615,  1619,
    1620,  1621,  1625,  1629,  1637,  1642,  1643,  1647,  1648,  1649,
    1653,  1654,  1655,  1656,  1658,  1659,  1660,  1664,  1665,  1666,
    1667,  1668,  1676,  1678,  1683,  1685,  1710,  1712,  1714,  1716,
    1721,  1723,  1727,  1729,  1731,  1733,  1735,  1741,  1743,  1748,
    1753,  1754,  1758,  1760,  1765,  1770,  1771,  1772,  1773,  1774,
    1775,  1779,  1780,  1781,  1785,  1786
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
  "'('", "')'", "'~'", "'['", "']'", "'.'", "','", "'&'", "'+'", "'-'",
  "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'",
  "'}'", "$accept", "guess_type", "real_guess_type", "type",
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
  "iteration_statement", "jump_statement", "instantiation_named",
  "guess_instantiation_named", "instantiation_unnamed",
  "instantiation_anon", "class_function_definition",
  "instance_class_function_definition_start",
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
      60,    62,    40,    41,   126,    91,    93,    46,    44,    38,
      43,    45,    33,    47,    37,    94,   124,    63,    58,    61,
      59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   133,   134,   134,   135,   136,   136,   137,   138,   138,
     138,   139,   139,   140,   141,   142,   142,   143,   144,   144,
     145,   145,   145,   145,   145,   145,   145,   145,   145,   145,
     145,   145,   145,   145,   146,   146,   146,   146,   146,   146,
     146,   146,   147,   148,   148,   148,   148,   148,   148,   148,
     148,   149,   149,   149,   149,   150,   150,   150,   150,   150,
     150,   151,   151,   152,   152,   153,   153,   153,   153,   153,
     153,   153,   154,   154,   155,   155,   155,   155,   156,   156,
     156,   157,   157,   157,   158,   159,   159,   159,   159,   159,
     160,   160,   160,   161,   161,   162,   162,   163,   163,   164,
     164,   165,   165,   166,   166,   167,   167,   167,   168,   168,
     168,   168,   168,   168,   168,   168,   168,   168,   168,   169,
     169,   170,   171,   171,   171,   171,   172,   172,   172,   172,
     172,   172,   172,   172,   173,   173,   173,   173,   173,   173,
     173,   173,   173,   173,   174,   174,   174,   174,   174,   174,
     174,   174,   174,   174,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   176,   177,   177,
     177,   177,   177,   177,   177,   177,   177,   177,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   179,   179,   180,   180,   181,   181,   181,   181,
     181,   182,   182,   183,   184,   184,   185,   185,   185,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   188,   188,   188,   188,
     188,   189,   189,   190,   190,   190,   191,   192,   193,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   195,   195,
     196,   196,   197,   197,   198,   199,   199,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   201,   201,   201,
     201,   201,   201,   201,   201,   202,   202,   203,   203,   203,
     203,   203,   204,   204,   205,   205,   205,   205,   205,   206,
     206,   207,   207,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   209,   209,   209,   209,   209,   210,
     210,   210,   210,   210,   210,   211,   211,   211,   211,   211,
     211,   212,   212,   212,   212,   213,   213,   213,   213,   213,
     214,   214,   214,   214,   214,   215,   216,   216,   216,   217,
     217,   217,   217,   218,   218,   218,   218,   218,   219,   219,
     220,   220,   220,   220,   221,   221,   222,   222,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   223,   223,   223,
     223,   223,   224,   224,   225,   225,   226,   226,   227,   227,
     227,   228,   228,   229,   229,   230,   230,   230,   230,   230,
     230,   231,   231,   231,   232,   232,   233,   233,   233,   234,
     234,   234,   235,   236,   236,   237,   237,   238,   238,   238,
     239,   239,   239,   239,   239,   239,   239,   240,   240,   240,
     240,   240,   241,   241,   242,   242,   243,   243,   243,   243,
     244,   244,   245,   245,   245,   245,   245,   246,   246,   247,
     248,   248,   249,   249,   250,   251,   251,   251,   251,   251,
     251,   252,   252,   252,   253,   253
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     6,     5,     6,     5,     7,
       6,     7,     6,     1,     1,     4,     3,     4,     3,     3,
       2,     2,     1,     1,     4,     3,     4,     3,     3,     2,
       2,     1,     1,     3,     3,     2,     2,     2,     4,     2,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     3,     3,     3,     1,     3,
       3,     1,     3,     3,     2,     1,     2,     3,     3,     3,
       1,     3,     3,     1,     3,     1,     3,     1,     3,     1,
       3,     1,     3,     1,     5,     1,     3,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     1,     2,     3,     2,     5,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     4,     5,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       4,     5,     1,     3,     1,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     4,     1,     5,     4,     4,     3,
       5,     2,     2,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     3,     3,     3,     3,     3,     3,     1,     3,
       1,     1,     1,     2,     3,     1,     3,     9,     9,     7,
       7,     5,    10,    10,     8,     8,     6,     8,     8,     6,
       6,     4,     9,     9,     7,     7,     5,     3,     2,     2,
       2,     1,     2,     1,     1,     1,     3,     1,     2,     2,
       3,     5,     2,     2,     4,     5,     7,     7,     5,     1,
       3,     1,     3,     3,     2,     3,     3,     3,     4,     4,
       2,     3,     3,     4,     3,     2,     3,     3,     4,     1,
       1,     2,     2,     2,     3,     1,     1,     2,     2,     2,
       3,     1,     2,     3,     2,     1,     3,     4,     3,     4,
       1,     2,     2,     3,     3,     2,     3,     3,     2,     1,
       1,     2,     2,     1,     2,     2,     3,     3,     1,     2,
       1,     2,     2,     3,     1,     3,     1,     3,     2,     2,
       1,     1,     1,     1,     2,     2,     3,     1,     2,     1,
       2,     2,     1,     3,     1,     2,     1,     2,     1,     3,
       4,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     3,     4,     3,     1,     2,     1,     2,     2,     1,
       1,     2,     1,     2,     3,     1,     2,     5,     7,     5,
       5,     7,     6,     7,     4,     5,     4,     3,     2,     2,
       2,     3,     5,     4,     5,     4,     4,     3,     4,     3,
       3,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       3,     1,     1,     3,     2,     1,     1,     2,     2,     1,
       2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,   409,    17,     7,   206,   207,   208,   209,   210,   220,
     221,   222,   223,   224,   226,   229,   230,   227,   228,   216,
     217,   219,   225,   280,   281,     0,   402,   237,   211,   214,
     213,   403,   407,   231,     0,   160,   172,   234,     8,     5,
       0,   400,   401,   154,   215,   212,   218,   156,   158,   162,
     232,     0,   233,   164,   494,     0,   390,     0,     0,   365,
       0,   350,   411,   410,   380,     0,   379,   361,   349,     0,
     323,   322,     0,   404,     0,   405,     0,   408,     0,     0,
       4,     2,     3,     6,   161,   173,     0,   155,   215,   157,
     159,   163,   165,   399,   398,     0,     8,   262,   261,     0,
       1,   388,   391,   392,   340,     0,     0,     0,   394,   396,
      33,    22,    23,     0,     0,     0,     0,     0,    71,     0,
       0,    66,     0,    69,   334,    65,    67,    68,    70,     0,
      20,    34,    18,    62,    61,    72,     0,    74,    78,    81,
      85,     0,    90,    93,    95,    97,    99,   101,   103,   121,
       0,    21,   353,   382,   381,   352,     0,     0,   364,   375,
       0,   378,     0,     0,     0,     0,   351,   362,   331,     0,
     329,     0,     0,   406,     0,     0,     0,   234,    20,   268,
     263,   144,   146,   148,   152,   266,   271,   270,   269,   278,
       0,   150,     0,     0,     0,     0,   314,   259,     0,     0,
       0,     0,    20,     0,     0,   154,   215,   156,   158,   162,
       0,   285,     0,   313,   282,   164,     0,    12,   370,     0,
       0,    21,   311,     0,     0,     0,   495,   389,   393,   333,
     366,   341,     0,     0,    43,    64,    63,    59,     0,    55,
      56,     0,     0,     0,     0,     0,    24,    72,   105,   119,
       0,   414,   126,   128,   132,   130,     0,   336,     0,     0,
       0,    40,    41,     0,     0,     0,    57,     0,     0,     0,
       0,     0,     0,     0,    86,     0,     0,    84,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   335,   354,   363,
     342,     0,   337,     0,     0,   368,     0,     0,   376,   377,
       0,     0,     0,   324,     0,     0,   235,   236,     0,     0,
       0,   145,   215,   147,   149,   153,   151,   264,   349,     0,
      10,     9,     0,   239,   240,   241,   242,   243,   245,   248,
     249,   246,   247,   238,   244,     0,   255,     0,   252,   184,
       0,   178,   180,   182,   250,     0,   251,   365,     0,    16,
      66,     0,    20,     0,   442,     0,   472,   475,   476,   474,
     473,     0,     0,     0,   308,   365,   155,   215,   157,   159,
     163,     0,   315,   165,   383,    11,   317,     0,   372,     0,
     257,   283,     0,   312,     0,   371,   310,   309,     0,   258,
       0,   395,   397,   138,    20,     0,   416,   134,   136,   142,
     140,     0,     0,    49,    50,     0,     0,     0,     0,     0,
     215,   356,     0,   355,   198,     0,   188,   190,   192,   194,
     196,     0,     0,     0,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   108,     0,    19,     0,   127,   129,
     133,   131,   415,     0,   489,     0,   467,    62,   422,   421,
       0,   481,    42,     0,   486,   482,   492,   485,     0,     0,
     469,     0,    39,    36,    52,     0,    51,     0,    38,    75,
      76,    77,    79,    80,    82,    83,    88,    89,    87,    91,
      92,    94,    96,    98,   100,   102,     0,   343,   339,   338,
     369,   367,   413,   332,   330,     0,   328,     0,   325,    20,
     266,   274,   273,   272,   352,   277,   276,   275,   279,   323,
     322,     0,     0,     0,   185,   179,   181,   183,     0,   261,
      15,   215,     0,   443,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   445,    20,     0,   434,
       0,   436,   425,     0,     0,     0,   426,   427,   428,   429,
     430,     0,   284,    13,   319,     0,   385,     0,     0,   307,
       0,   318,     0,   384,   373,   286,   374,   260,   256,    58,
     139,   135,   137,   143,   141,   417,    60,    48,    45,     0,
       0,    47,   345,     0,     0,     0,   359,   358,     0,     0,
     357,     0,     0,   199,   189,   191,   193,   195,   197,     0,
       0,     0,     0,     0,   107,   106,   120,    73,   471,     0,
       0,   365,   477,   478,   479,     0,   484,   490,   488,   493,
     487,   466,   468,    37,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,   301,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,   458,   459,
     460,     0,     0,     0,   446,   122,   365,     0,   202,   204,
     435,     0,   438,   437,   444,   124,   465,     0,   386,     0,
     316,   383,     0,   320,   387,    46,    44,   344,   346,    26,
     360,   347,     0,     0,     0,     0,     0,     0,    28,     0,
       0,     0,   470,   480,   483,    54,    53,   104,   327,   326,
     253,   254,   186,     0,     0,     0,     0,     0,   291,     0,
       0,   306,     0,     0,   433,     0,     0,     0,     0,     0,
       0,     0,   457,   461,     0,   431,     0,     0,   123,     0,
     464,   385,     0,     0,   384,     0,   348,    25,   200,    30,
       0,     0,    27,    32,     0,     0,   299,     0,   300,   187,
       0,     0,     0,     0,     0,     0,   296,   432,     0,     0,
     454,     0,     0,   456,     0,     0,     0,   463,     0,   203,
       0,   418,   205,   386,   387,   321,   201,    29,    31,     0,
       0,     0,   289,     0,   290,     0,   304,     0,   305,     0,
       0,   447,   449,   450,     0,   455,     0,     0,   125,   462,
     423,     0,   297,   298,     0,     0,     0,     0,     0,   294,
       0,   295,     0,     0,   452,     0,     0,   419,   287,   288,
     302,   303,     0,     0,   448,   451,   453,   420,   424,   292,
     293
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    35,    36,   225,    38,    39,   198,   199,   200,   201,
     130,   131,   132,   133,   448,   235,   465,   134,   135,   237,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   148,   248,   249,   435,   538,   150,   662,   251,
     396,   180,   204,    42,   340,   415,   657,   658,   181,    44,
      45,    46,   182,   183,   418,   184,    50,   185,   186,   187,
     188,   189,   190,    51,   210,   211,   212,   213,   214,   371,
     372,    52,   191,   169,   170,    61,   411,   105,   412,   106,
      64,   217,    65,    66,    67,   376,   102,   219,   107,   108,
     109,   164,   256,   401,   772,   451,   801,   541,   542,   543,
     544,   545,   355,   546,   547,   548,   549,   550,   551,   220,
     151,   452,   222,   453,   454,   455,   456,   457,   458,   459,
      55
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -690
static const short int yypact[] =
{
    7262,   504,  -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,  -690,  -690,  -690,  -690,    42,  -690,  -690,  -690,  -690,
    -690,   353,    34,  -690,   -66,  -690,  -690,  -690,   102,  -690,
     315,  6441,  -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,    68,  -690,  -690,   -24,   117,   559,  5921,  5129,  -690,
     165,   391,  -690,    71,   398,  6183,  -690,  -690,   222,   125,
      85,   151,    34,    34,   128,    71,    36,    71,    86,  5290,
    -690,  -690,  -690,  -690,  -690,  -690,   572,  -690,   165,  -690,
    -690,  -690,  -690,  -690,    71,  3766,   -13,  -690,   159,  5783,
    -690,  -690,   559,  -690,  -690,   143,   296,   191,   231,  -690,
    -690,  -690,  -690,  5818,  5870,  5870,  7335,  5783,  -690,  7335,
    5783,  -690,  5379,  -690,  -690,  -690,  -690,  -690,  -690,    54,
      13,  -690,  -690,   467,  -690,  -690,  5783,  -690,   250,   290,
     587,  5783,   275,   591,   201,   268,   269,   360,     7,  -690,
     362,  -690,   391,   398,  -690,   222,  6269,  5609,  -690,  -690,
    5644,  -690,   251,   369,   387,    47,   391,  -690,   357,   -34,
    -690,   125,   125,    71,    36,   396,    20,   385,    46,   587,
    6529,  -690,  -690,  -690,  -690,   403,  -690,  -690,  -690,  -690,
     111,  -690,  7408,  7017,  4955,  7335,  -690,  -690,   405,   405,
     405,   478,    27,   373,  5077,  -690,   128,  -690,  -690,  -690,
    3878,  -690,   282,  -690,  -690,  -690,   398,  -690,  -690,    36,
     429,   450,  -690,  4818,  3990,   385,  -690,  -690,  -690,  -690,
    -690,  -690,  7187,  5468,  -690,   484,  -690,  -690,  5164,  -690,
    -690,    51,  6617,  7481,  6705,  7481,  -690,  1050,  -690,  -690,
     404,  6929,  -690,  -690,  -690,  -690,   497,  -690,  2994,  3126,
     125,  -690,  -690,  1749,  5783,   125,  -690,  5783,  5783,  5783,
    5783,  5783,  5783,  5783,   587,  5783,  5783,  -690,  5783,  5783,
    5783,  5783,  5783,  5783,  5783,  5783,  5783,  -690,   391,  -690,
    -690,   499,  -690,   205,   502,  -690,   267,   510,  -690,  -690,
     125,  5783,   125,  -690,   273,   301,  -690,  -690,  5290,  6009,
     125,  -690,   368,  -690,  -690,  -690,  -690,  -690,   453,  5290,
    -690,  -690,  5290,  -690,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,  -690,  -690,  -690,  -690,    86,  -690,   503,  -690,   519,
    4973,  -690,  -690,  -690,  -690,    86,  -690,    51,  7017,  -690,
     559,  5557,    33,  7102,   507,  4550,  -690,  -690,  -690,  -690,
    -690,  4685,   441,  5783,  -690,   139,  -690,   128,  -690,  -690,
    -690,   300,  -690,  -690,   398,  -690,   202,    36,  -690,    47,
    -690,  -690,   711,  -690,    47,  -690,  -690,  -690,  4102,  -690,
    4214,  -690,  -690,  -690,    27,   529,  6929,  -690,  -690,  -690,
    -690,   531,   125,  -690,  -690,  4633,  5783,   125,  6097,  5783,
     254,   535,   537,   550,   553,  6793,  -690,  -690,  -690,  -690,
    -690,  5783,   549,  6881,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,  -690,  -690,  -690,  -690,  4685,  -690,  5783,  -690,  -690,
    -690,  -690,  -690,  5783,  -690,  3258,  -690,   452,  -690,  -690,
    7017,  -690,  -690,   405,  -690,  -690,   327,  -690,  3390,   533,
    -690,   534,  -690,  -690,  -690,   406,  -690,   -31,  -690,  -690,
    -690,  -690,   250,   250,   290,   290,   587,   587,   587,   275,
     275,   591,   201,   268,   269,   360,   214,  -690,  -690,  -690,
    -690,  -690,  -690,  -690,  -690,  4818,  -690,  4818,  -690,    13,
    -690,  -690,  -690,  -690,   453,  -690,  -690,  -690,  -690,  -690,
    -690,    86,  5290,    -8,   207,  -690,  -690,  -690,    52,  -690,
    -690,   128,   554,  -690,  5783,   543,   561,   562,   563,  2425,
     564,   125,   547,   558,  4870,   125,  -690,    80,   334,  -690,
    5180,  -690,  -690,  2598,  2730,   548,  -690,  -690,  -690,  -690,
    -690,   567,  -690,  -690,  -690,  3522,   398,    47,   325,  -690,
    5783,  -690,    47,   398,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,   410,
     271,  -690,  -690,   566,   570,   573,   535,   550,  6355,  5783,
     535,  5290,  5783,   582,  -690,  -690,  -690,  -690,  -690,   579,
     585,  5783,  5783,   588,  -690,  -690,  -690,  -690,  -690,   574,
    4685,   125,  -690,  -690,  -690,  4685,  -690,  -690,  -690,   327,
    -690,  -690,  -690,  -690,  4685,  -690,  5783,  4326,  4438,   592,
      25,   302,   405,   405,  -690,  5290,    -6,    -3,   580,  -690,
     576,  2425,  5783,  5783,  5696,   662,  1510,   589,  -690,  -690,
    -690,   336,   594,  2425,  -690,  -690,    87,   337,  -690,   176,
    -690,  2862,  -690,  -690,  -690,  -690,  -690,   593,   398,   128,
    -690,   609,    36,   598,   398,  -690,  -690,  -690,  -690,  -690,
     535,  -690,   615,   619,   330,   621,  5290,  5783,  -690,   622,
     625,  5783,  -690,  -690,  -690,  -690,  -690,  -690,  -690,  -690,
    -690,  -690,  -690,   -12,   136,   345,   405,   405,  -690,   405,
     405,  -690,   193,  2425,  -690,   420,   433,  2425,   434,   633,
    2425,  2141,  -690,  -690,  5783,  -690,  3654,    34,  -690,  4706,
    -690,   609,    47,    47,   609,  5783,  -690,  -690,  -690,  -690,
     390,   631,  -690,  -690,   632,   405,  -690,   405,  -690,  -690,
     114,   195,   161,   209,   405,   405,  -690,  -690,  2425,  2425,
    -690,  2425,  5783,  -690,  2425,  5731,   620,  -690,   623,  -690,
    4706,  -690,  -690,   609,   609,  -690,  -690,  -690,  -690,   628,
     630,   405,  -690,   405,  -690,   405,  -690,   405,  -690,   166,
     260,   687,  -690,  -690,   448,  -690,  2425,   472,  -690,  -690,
    -690,    -7,  -690,  -690,   634,   636,   637,   639,   405,  -690,
     405,  -690,  2425,   624,  -690,  2425,  2279,  -690,  -690,  -690,
    -690,  -690,   641,   645,  -690,  -690,  -690,  -690,  -690,  -690,
    -690
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -690,    53,   712,   498,   701,    81,  -690,  -690,  -690,  -690,
       0,  -690,   650,   212,  -253,  -690,   374,   652,   678,  -690,
    -690,  -128,   361,   364,   -61,  -690,   370,   500,   508,   501,
     496,   506,  -690,   947,  -256,  -690,  -117,   186,  -346,  -690,
    -690,  -232,    35,  -690,  -690,   540,  -690,    59,  1882,   803,
     413,  -690,  1485,  2123,  -139,  1568,  -144,  -226,    31,   120,
     160,   473,  -500,  -177,  -203,   412,  -690,  -690,  -181,  -690,
     240,  -140,  1809,   488,   509,   -46,  -366,    18,  -188,     2,
    1177,  -191,  -690,  1996,   223,   351,  -690,   930,   -54,  -690,
       6,  -690,  -690,  -690,  -689,  -357,  -690,  -172,  -690,  -690,
     259,  -690,  -690,   -11,  -407,  -690,  -690,  -690,  -690,  -690,
     -57,  -690,  -690,  -690,   347,   188,   350,   352,  -690,  -242,
    -690
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -492
static const short int yytable[] =
{
      40,    59,   349,    63,   552,   250,    54,   466,   266,   539,
     464,   163,   631,   375,   152,   345,     2,   461,   179,    62,
     388,   390,   166,     2,   285,    71,   450,   450,     2,   381,
       2,    59,    59,    75,    77,    41,     2,     2,   221,     2,
      83,    86,   152,    94,   586,     2,    78,   590,   344,     2,
       2,    98,   346,   343,     2,     2,   422,    86,   745,    93,
      59,   632,   633,   706,   707,   162,   709,   710,    59,   168,
       3,     2,    59,    59,    59,   173,    59,   250,   176,   178,
     274,   800,   500,     2,   302,   625,    83,   437,    59,     2,
       2,   684,    41,   500,    84,   202,     3,    79,   303,   344,
      41,   344,   291,   346,    99,   346,    70,  -365,    28,   288,
      28,   816,  -365,    30,     3,    30,   241,   100,   223,   241,
     746,   250,   320,   540,   634,   817,   708,   828,     2,   711,
      83,     2,    97,   307,   286,   705,    81,    82,   701,   469,
     470,   471,     2,    56,   259,    28,    72,   467,    72,   466,
      30,   242,   464,   221,   244,    59,    40,   520,   259,    72,
      81,    82,    83,   345,   259,    59,   221,   221,     2,   486,
     257,   168,   168,    69,    59,   308,    83,   259,    83,   605,
     310,   606,   604,   637,   781,   258,   740,   356,   357,   358,
     360,    41,   339,   347,   352,   241,   344,   660,   317,    95,
     346,   517,    83,   609,   365,   747,    59,   381,   653,   381,
     202,   259,    79,   450,   476,   477,   171,   478,   726,    59,
     583,   680,   321,   202,   202,     2,   450,   599,   348,   322,
     353,   785,    40,   394,   250,   603,   808,    56,   392,   721,
      72,    83,   241,   414,   241,   414,   782,   179,    81,    82,
      28,   310,    80,   693,     2,    30,   229,    84,   179,   612,
     462,   179,   754,   755,   783,   468,   152,    41,   748,   442,
     555,   344,   166,   338,    56,   346,   596,    57,   787,   344,
      58,    30,   172,   346,   596,   226,   393,   275,   276,   580,
     224,   167,   627,   786,   628,    84,    28,    84,   809,   167,
     492,    30,   168,   243,   231,   729,   245,   203,   499,    40,
      83,   540,   540,   667,   765,   607,    80,   635,     2,   499,
     281,   488,   178,   450,   338,   756,   338,   784,     2,   810,
     560,   221,   437,   221,    57,   510,   258,    58,   636,   501,
     514,   788,   626,   294,    41,   519,   297,    83,   347,   232,
     505,   352,    83,   241,   584,   537,     2,   645,   518,   267,
      81,    82,    59,    56,  -412,    83,   408,    59,   696,  -412,
      28,   695,   663,   268,   269,    30,   284,    59,   289,    59,
     260,   261,   262,   490,    59,   277,   278,   676,   202,   437,
     202,   302,   811,   282,    83,   283,   241,   289,   258,    28,
     382,    84,   577,   495,    30,   496,    84,   581,    40,   230,
     270,   271,   383,   702,   575,   593,   509,   651,   558,   302,
     322,   338,   203,   593,    81,    82,    97,    28,   502,   540,
     559,   497,    30,   498,    56,   203,   203,    72,   221,   506,
     221,   738,   614,    41,     2,   615,   381,   381,   322,   570,
     611,   179,   437,   363,   437,   727,   749,   616,   288,   260,
     261,   262,    56,   322,   654,    72,   723,   728,   503,   714,
     447,   447,    73,   771,   260,   261,   262,    56,   287,   507,
     309,   725,   298,    58,   768,   263,   301,   493,   264,   663,
     265,   402,   403,   404,   450,   202,   338,   202,    37,    83,
     299,   776,   361,   156,   338,   300,   157,     2,   322,   306,
     159,   630,   178,   160,   771,    28,   258,   436,   638,   623,
      30,    59,   437,   675,   624,   715,   716,   718,   624,   537,
     179,   647,   319,   758,   682,   652,   354,    83,   437,    37,
     656,   757,   659,   537,   537,   760,   759,   761,   763,   554,
      56,   437,   437,    72,   553,    37,   129,    59,    59,   386,
     771,   813,    59,    37,   263,   309,   437,   264,    58,   265,
     221,   221,  -365,    80,   179,     2,   175,   177,    28,   263,
     387,   610,   264,    30,   265,   815,   791,   792,    40,   793,
     437,   178,   795,   177,   203,   585,   405,   272,   273,   406,
     203,   407,   203,    19,    20,   279,   280,   600,   359,   354,
     443,    83,   487,    56,    37,   511,    57,    37,   489,    58,
     177,   703,   704,    41,   814,   179,   491,   202,   202,   512,
      83,   472,   473,    28,    29,   178,   474,   475,    30,   523,
     824,   537,   569,   826,   576,   794,  -365,   588,   797,   479,
     480,  -365,   589,   537,    37,   293,    83,   447,   296,   304,
     305,   537,   408,   591,   601,   621,   622,   639,    56,    59,
     447,   641,    59,   642,   643,   644,   646,   648,    37,   677,
     664,    81,    82,   678,  -365,  -365,   178,  -365,   649,   679,
    -365,    37,   686,    37,   687,   750,   751,   665,   752,   753,
    -365,   688,    37,   691,   713,   700,   692,   203,   177,   203,
     640,   712,   110,   537,     2,   111,   112,   537,   719,   722,
     537,   177,   177,   724,   160,   730,   735,    59,   736,   659,
      37,   177,    59,    59,   779,   737,   780,   739,   742,     3,
      37,   743,    37,   789,   790,   762,   673,   777,   778,    37,
     798,   812,    96,    85,   825,   799,   177,   177,   537,   537,
     802,   537,   803,   234,   537,   236,   818,   447,   819,   820,
     804,   821,   805,   829,   806,   683,   807,   830,   685,   579,
     484,   481,   116,   117,   483,   423,   769,   689,   690,   561,
     482,   485,   239,   240,   565,   508,   537,   822,   670,   823,
     247,   613,   661,   694,    60,   618,   177,    37,   619,     0,
     620,   494,   537,   119,   120,   537,     0,   177,     0,     0,
     177,     0,     0,   238,     0,     0,     0,   447,     0,     0,
       0,     0,     0,     0,    74,    74,     0,     0,     0,   203,
     203,     0,     0,     0,    88,     0,    37,     0,     0,   177,
       0,    37,     0,   177,     0,     0,     0,     0,     0,     0,
      88,     0,     0,     0,     0,     0,   158,     0,     0,     0,
       0,   165,   247,   741,     0,    74,    74,   744,   158,   165,
     158,     0,     0,     0,     0,     0,   177,     0,   177,     0,
       0,     0,     0,     0,    37,     0,     0,   158,   206,     0,
       0,     0,     0,     0,     0,     0,    37,     0,     0,   158,
     766,   395,     0,     0,     0,     0,   247,     0,     0,     0,
       0,   775,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    68,     0,     0,     0,     0,     0,     0,   447,     0,
       0,   247,   247,   177,     0,     0,     0,     0,    37,     0,
       0,     0,     0,     0,     0,     0,   177,     0,   165,     0,
       0,    76,    76,     0,   247,     0,     0,     0,     0,     0,
       0,    68,     0,     0,     0,     0,   158,   165,     0,     0,
       0,     0,     0,   312,     0,     0,   103,    68,     0,     0,
     155,     0,     0,   177,     0,   177,   206,    74,     0,     0,
       0,     0,    76,    76,   174,   149,     0,   367,     0,   629,
     177,     0,     0,   206,     0,     0,     0,     0,   155,     0,
       0,     0,   384,     0,     0,     0,   206,   206,     0,   247,
       0,     0,   228,   247,     0,     0,     0,     0,    37,     0,
       0,   177,   177,     0,     0,   410,   149,   410,     0,     0,
       0,     0,     0,   177,   312,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   149,     0,     0,   149,   424,   425,
     426,   427,   428,   429,   430,   431,   432,   433,     0,     0,
       0,     0,     0,   247,   247,     0,    37,     0,     0,   177,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   149,     0,     0,   149,     0,     0,
     318,     0,   312,   247,     0,   247,     0,     0,     0,     0,
       0,     0,     0,     0,    76,   177,   177,     0,     0,     0,
       0,     0,     0,   177,   377,     0,   379,     0,     0,     0,
       0,     0,     0,   312,     0,     0,     0,     0,     0,     0,
       0,   206,     0,     0,   521,     0,     0,     0,     0,   177,
       0,     0,     0,     0,     0,    74,     0,     0,     0,     0,
       0,     0,   413,     0,   413,     0,     0,     0,     0,   434,
     562,   318,     0,     0,   177,     0,     0,     0,     0,     0,
       0,   206,     0,   206,     0,     0,     0,     0,     0,   312,
       0,     0,     0,     0,     0,   449,   449,   247,     0,     0,
       0,   410,   247,     0,     0,     0,     0,     0,   410,     0,
       0,   247,   247,     0,   177,     0,   410,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   153,     0,   318,
       0,     0,   504,     0,     0,     0,     0,     0,   149,     0,
       0,   153,     0,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   153,     0,     0,     0,     0,
     318,     0,   216,     0,     0,     0,     0,     0,     0,     0,
     103,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,     0,     0,   557,   206,     0,
     206,     0,   247,     0,     0,     0,     0,     0,   449,     0,
     149,     0,     0,     0,     0,     0,     0,     0,     0,   247,
     247,   247,   247,     0,   247,     0,   318,     0,     0,     0,
       0,   247,     0,     0,     0,     0,     0,     0,   413,   247,
     587,     0,   153,   521,     0,   413,     0,     0,     0,     0,
       0,     0,     0,   413,     0,     0,   149,     0,     0,     0,
       0,   669,     0,     0,     0,     0,     0,     0,   149,     0,
     216,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     377,   374,     0,   216,     0,     0,     0,   216,     0,     0,
       0,   247,   449,     0,     0,   247,   216,     0,   247,   247,
     216,   216,     0,     0,     0,   449,     0,   247,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     206,   206,     0,     0,     0,     0,   247,   247,     0,   247,
     247,     0,   247,   247,     0,     0,     0,     0,   247,     0,
       0,   174,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   158,     0,     0,     0,     0,     0,     0,     0,
      76,   149,     0,     0,   247,   733,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    47,     0,     0,   672,     0,
     247,     0,     0,   247,   247,     0,     0,     0,     0,     0,
       0,     0,   449,     0,     0,     0,     0,   149,     0,     0,
       0,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,   216,    89,     0,     0,     0,
      74,     0,     0,     0,     0,     0,   149,     0,     3,   149,
       0,   101,    47,     0,   556,     0,     0,     0,   149,   149,
      47,     0,     0,     0,   563,     0,   216,   449,     0,     0,
       0,   216,   449,     0,     0,   216,     0,   216,    49,     0,
       0,     0,     0,   697,     0,     0,     0,     0,     0,     0,
     207,   116,   117,   118,     0,     0,     0,   227,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   732,
       0,   207,     0,     0,   207,     0,     0,   252,     0,    91,
       0,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,   720,   123,    49,     0,   374,     0,   125,
     126,   127,   128,    49,   149,     0,     0,     0,   149,     0,
     536,    47,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,   209,     0,   313,     0,     0,     0,     0,
       0,   149,   216,   449,   216,     0,     0,   342,   207,     0,
     207,     0,   149,     0,   209,     0,     0,   209,     0,   368,
     254,     0,     0,     0,     0,   207,     0,     0,   153,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   207,   207,
       0,     0,     0,     0,     0,     0,     0,    47,   397,     0,
       0,     0,     0,     0,    49,     0,     0,   368,   417,   368,
     417,     0,     0,     0,   668,   671,   438,     0,     0,   674,
       0,     0,     0,     0,     0,     0,     0,     0,   315,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,   209,     0,   209,     0,     0,     0,     0,     0,     0,
       0,     0,   370,     0,     0,     0,     0,     3,   209,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   209,   209,     0,    47,     0,     0,     0,     0,     0,
      49,   399,     0,     0,   216,   216,     0,     0,     0,    53,
     370,   419,   370,   419,     0,     0,     0,     0,     0,   440,
     116,   117,   118,     0,     0,   516,     0,     0,     0,     0,
       0,     0,     0,   368,     0,   101,   252,     0,   368,     0,
       0,     0,     0,     0,     0,     0,   731,     0,     0,   734,
      92,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       0,   122,   463,   123,     0,     0,    53,     0,   125,   126,
     127,   128,     0,   207,    53,   207,     0,    49,     0,     0,
     445,   571,    43,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    47,     0,     0,     0,     0,     0,     0,
     595,     0,     0,     0,   215,     0,     0,     0,   595,   773,
     774,     0,     0,     0,     0,     0,   370,     0,     0,   254,
       0,   370,     0,    87,     0,   215,     0,     0,   215,     0,
       0,   255,     0,     0,     0,   313,     0,     0,     0,    43,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
       0,     0,     0,     0,     0,     0,   209,     0,   209,     0,
       0,     0,     0,     0,   573,    53,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    49,   205,     0,     0,
     207,     0,   207,   597,     0,     0,     0,     0,     0,   316,
       0,   597,     0,     0,     0,     0,     0,     0,   205,     0,
       0,   205,   215,     0,   215,     0,     0,     0,     0,     0,
       0,     0,     0,   373,     0,     0,     0,     0,   315,   215,
       0,     0,     0,     0,     0,   313,     0,     0,     0,     0,
       0,     0,   215,   215,     0,     0,     0,     0,    43,     0,
       0,    53,   400,     0,     0,     0,     0,     0,     0,     0,
       0,   373,   420,   373,   420,     0,   154,     0,     0,     0,
     441,     0,   311,   209,     0,   209,     0,     0,     0,     0,
     154,     0,     0,    47,   341,   205,     0,   205,     0,     0,
       0,     0,     0,     0,   154,     0,   366,     0,     0,     0,
       0,   218,   205,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   205,   205,     0,   315,     0,
       0,     0,   207,   207,    43,     0,     0,     0,    53,     0,
       0,     0,     0,    48,   366,   416,   366,   416,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,     0,    49,   373,     0,     0,
     255,   154,   373,     0,    90,     0,     0,     0,     0,     3,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      48,     0,     0,     0,     0,     0,     0,     0,    48,   218,
       0,    43,     0,     0,     0,   209,   209,   215,     0,   215,
     218,     0,   378,     0,     0,   574,   218,     0,     0,     0,
       0,     0,   116,   117,   118,   385,     0,    53,   208,   218,
     218,     0,   515,     0,   598,     0,     0,     0,     0,     0,
     366,     0,   598,     0,     0,   366,     0,     0,     0,   208,
       0,     0,   208,   119,   120,   253,     0,     0,     0,     0,
     121,     0,     0,   122,   764,   123,     0,     0,     0,   316,
     125,   126,   127,   128,     0,     0,     0,     0,     0,     0,
     205,   536,   205,     0,     0,     0,     0,     0,     0,    48,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
      43,     0,     0,     0,     0,     0,     0,   594,     0,     0,
       0,     0,     0,   314,   215,   594,   215,     3,     0,     0,
       0,     0,     0,     0,     0,     0,   208,     0,   208,     0,
       0,     0,     0,     0,     0,     0,     0,   369,     0,     0,
       0,     0,   311,   208,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   218,     0,   208,   208,     0,   316,
     116,   117,   118,     0,     0,    48,   398,     0,     0,     0,
       0,     0,     0,   378,     0,   369,     0,   369,     0,     0,
       0,     0,     0,   385,   439,   564,     0,   205,     0,   205,
     566,   119,   120,     0,   218,     0,   218,     0,   121,     0,
       0,   122,     0,   123,     0,     0,     0,    53,   125,   126,
     127,   128,     0,     0,     0,     0,     0,     0,     0,     0,
     770,   827,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   311,     0,     0,     0,   110,     0,     2,   111,
     112,   113,    48,   114,   115,     0,   215,   215,     0,     0,
       0,     0,     0,     0,     0,     0,   218,     0,     0,     0,
       0,     0,     0,     3,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      43,   369,     0,     0,   253,     0,   369,   524,   525,   526,
     527,   528,   529,   530,   531,   532,   533,   534,     0,     0,
       0,   218,     0,   218,     0,     0,   116,   117,   118,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   205,
     205,   208,     0,   208,     0,     0,     0,   154,     0,   572,
       0,     0,     0,     0,     0,     0,     0,   119,   120,     0,
       0,    48,     0,     0,   121,     0,     0,   122,     0,   123,
       0,     0,     0,     0,   125,   126,   127,   128,     0,     0,
       0,     0,     0,   564,     0,   536,   354,     0,   566,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   314,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   208,     0,
     208,     0,     0,   218,   218,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
     524,   525,   526,   527,   528,   529,   530,   531,   532,   533,
     534,     0,     0,   314,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,   535,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,    48,   123,     0,     0,     0,     0,   125,   126,   127,
     128,     0,     0,     0,     0,     0,     0,     0,   536,   354,
    -440,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     208,   208,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,   524,   525,   526,   527,   528,   529,   530,   531,
     532,   533,   534,     0,     0,     0,    27,     0,     0,     0,
       0,   116,   117,   118,    28,    29,     0,   535,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,     0,   123,     0,     0,     0,     0,   125,
     126,   127,   128,     0,     0,     0,     0,     0,     0,     0,
     536,   354,  -439,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,   524,   525,   526,   527,   528,   529,
     530,   531,   532,   533,   534,     0,     0,     0,    27,     0,
       0,     0,     0,   116,   117,   118,    28,    29,     0,   535,
       0,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     0,   122,     0,   123,     0,     0,     0,
       0,   125,   126,   127,   128,     0,     0,     0,     0,     0,
       0,     0,   536,   354,  -441,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,   116,   117,   118,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     0,   122,     0,   123,     0,
       0,     0,     0,   125,   126,   127,   128,     0,     0,     0,
       0,     0,     0,     0,   444,   445,   446,   110,     0,     2,
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
     123,     0,     0,     0,     0,   125,   126,   127,   128,     0,
       0,     0,     0,     0,     0,     0,   444,   445,   460,   110,
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
     122,     0,   123,     0,     0,     0,     0,   125,   126,   127,
     128,     0,     0,     0,     0,     0,     0,     0,   444,   445,
     608,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,   116,   117,   118,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,     0,   123,     0,     0,     0,     0,   125,
     126,   127,   128,     0,     0,     0,     0,     0,     0,     0,
     617,   445,  -491,   110,     0,     2,   111,   112,   113,     0,
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
       0,   121,     0,     0,   122,     0,   123,     0,     0,     0,
       0,   125,   126,   127,   128,     0,     0,     0,     0,     0,
       0,     0,   444,   445,   666,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,   116,   117,   118,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     0,   122,   110,   123,     2,
     111,   112,     0,   125,   126,   127,   128,     0,     0,     0,
       0,     0,     0,     0,   444,   445,   767,     0,     0,     0,
       0,     0,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,   192,     0,     0,   116,   117,     0,
      28,    29,     0,     0,   193,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   119,   120,
       0,     0,     0,     0,     0,    56,     0,     0,   194,   110,
     195,     2,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   196,     0,   197,     0,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,   192,     0,     0,   116,
     117,     0,    28,    29,     0,     0,   193,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,    56,     0,     0,
     194,   110,   195,     2,   111,   112,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   196,     0,
     380,     0,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,   192,     0,
       0,   116,   117,     0,    28,    29,     0,     0,   193,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   119,   120,     0,     0,     0,     0,     0,    56,
       0,     0,   194,   110,   195,     2,   111,   112,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     196,     0,   389,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
     192,     0,     0,   116,   117,     0,    28,    29,     0,     0,
     193,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,    56,     0,     0,   194,   110,   195,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   196,     0,   567,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   192,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   193,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   194,   110,   195,     2,
     111,   112,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   196,     0,   568,     0,     0,     0,
       0,     0,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,   192,     0,     0,   116,   117,     0,
      28,    29,     0,     0,   193,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   119,   120,
       0,     0,     0,     0,     0,    56,     0,     0,   194,   110,
     195,     2,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   196,     0,   698,     0,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,   192,     0,     0,   116,
     117,     0,    28,    29,     0,     0,   193,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,    56,     0,     0,
     194,   110,   195,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,   196,     0,
     699,     0,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,   524,   525,   526,   527,   528,   529,   530,   531,
     532,   533,   534,     0,     0,     0,    27,     0,     0,     0,
       0,   116,   117,   118,    28,    29,     0,   535,     0,    30,
       0,     0,     0,     0,   110,    33,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     3,   122,     0,   123,     0,     0,     0,     0,   125,
     126,   127,   128,     0,     0,     0,     0,     0,     0,     0,
     536,   354,     0,     0,     0,     0,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   116,   117,   118,   110,     0,     2,
     111,   112,   113,     3,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     3,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,   578,   123,     0,     0,
       0,     0,   125,   126,   127,   128,   116,   117,   118,     0,
       0,     0,     0,     0,   445,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   116,   117,   118,
       0,     0,     0,     0,     0,     0,     0,   119,   120,     0,
       0,     0,     0,     0,   121,     0,     0,   122,     0,   123,
       0,     0,     0,     0,   125,   126,   127,   128,   119,   120,
       0,     0,     0,     0,     0,   121,   445,     0,   122,   110,
     123,     2,   111,   112,     0,   125,   126,   127,   128,     0,
       0,     0,     0,     0,     0,     0,     0,   770,     0,     0,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,    27,     0,   192,     0,     0,   116,
     117,     0,    28,    29,     0,     0,   193,    30,     3,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,    56,     0,     0,
     194,     0,   195,     0,     0,     0,     0,     0,     0,     0,
       0,   116,   117,   118,     0,     0,     0,     0,   196,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,   119,   120,     0,     0,     2,     0,     0,   121,
       0,     0,   122,     3,   123,     0,     0,     0,     0,   125,
     126,   127,   128,     0,     0,     0,     0,     0,     0,     0,
     650,     3,     4,     5,     6,     7,     8,   323,   324,   325,
     326,   327,   328,   329,   330,   331,   332,    19,    20,   333,
     334,    23,    24,   335,     0,     0,   116,   117,   118,    28,
       0,     0,     0,     0,    30,     0,     0,     0,     0,   336,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,   119,   120,     0,
       0,     0,     0,     0,   350,     0,     0,   351,   246,   123,
       0,     0,     0,   337,   125,   126,   127,   128,     0,     0,
       2,     0,    56,     0,     0,   309,     0,     0,    58,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   513,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     3,     0,     0,
       0,     0,    33,     0,     0,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     2,     0,     0,    56,     0,     0,   362,
       0,     0,     3,     0,     0,     0,     0,     0,     0,     0,
     116,   117,   118,     0,     0,   363,     0,   364,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,   119,   120,     0,     0,   116,   117,   118,   121,     0,
       0,   122,     0,   123,     0,   124,    27,     0,   125,   126,
     127,   128,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     0,   122,   246,   123,     0,
      34,     0,     0,   125,   126,   127,   128,     0,     0,    56,
       0,   110,    72,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     655,     0,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,   116,   117,   118,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
      34,     0,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,     0,   123,     0,     0,     3,     0,   125,
     126,   127,   128,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
     116,   117,   118,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       0,   122,   246,   123,     0,     0,     3,     0,   125,   126,
     127,   128,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     238,   246,   123,     0,     0,     3,     0,   125,   126,   127,
     128,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   116,   117,
     118,    28,    29,     0,     0,     0,    30,     3,     0,     0,
       0,     0,    33,     0,     0,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,     0,     0,   350,     0,     0,   351,
     246,   123,     3,     0,     0,     0,   125,   126,   127,   128,
     116,   117,   118,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
       0,   119,   120,     0,     0,   116,   117,   118,   121,     0,
       0,   122,     0,   123,     3,   292,     0,     0,   125,   126,
     127,   128,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,     0,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     0,   122,     0,   123,     3,
     295,     0,     0,   125,   126,   127,   128,   116,   117,   118,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,     0,   119,   120,
       0,     0,   116,   117,   118,   121,     0,     0,   122,   717,
     123,     3,     0,     0,     0,   125,   126,   127,   128,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,   796,   123,     3,     0,     0,     0,
     125,   126,   127,   128,   116,   117,   118,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,   119,   120,     0,     0,   116,
     117,   118,   121,     0,     0,   122,     0,   123,     3,     0,
       0,     0,   125,   126,   127,   128,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     119,   120,     1,     0,     2,     0,     0,   121,     0,     0,
     233,     0,   123,     0,     0,     0,     0,   125,   126,   127,
     128,   116,   117,   118,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   238,     0,   123,     0,    26,    27,     0,   125,
     126,   127,   128,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,    31,    32,     0,    33,     0,     0,     0,
       1,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,    57,   104,     0,    58,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     0,     0,     1,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   309,   104,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     1,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   408,
     582,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,    31,    32,     0,    33,     0,
       1,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   161,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     1,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   290,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   681,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,    57,     0,     0,    58,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   309,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   408,
       0,     0,   409,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,    56,     0,     0,   408,     0,     0,
     421,     3,     4,     5,     6,     7,     8,   323,   324,   325,
     326,   327,   328,   329,   330,   331,   332,    19,    20,   333,
     334,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   336,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,   337,     0,     0,     0,     0,     0,     0,
       0,     0,    56,     0,     0,   408,     0,     0,   592,     3,
       4,     5,     6,     7,     8,   323,   324,   325,   326,   327,
     328,   329,   330,   331,   332,    19,    20,   333,   334,    23,
      24,    25,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   336,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     3,     0,     0,
      30,     0,     0,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,   337,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,   408,     0,    27,   602,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   309,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,    72,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,    33,     1,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   522,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,   391,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     1,     0,     2,    30,     0,     0,    31,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     2,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     2,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     3,     4,     5,     6,
       7,     8,   323,   324,   325,   326,   327,   328,   329,   330,
     331,   332,    19,    20,   333,   334,    23,    24,   335,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   336,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     2,     0,     0,    30,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   337,     3,
       4,     5,     6,     7,     8,   323,   324,   325,   326,   327,
     328,   329,   330,   331,   332,    19,    20,   333,   334,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   336,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   337
};

static const short int yycheck[] =
{
       0,     1,   193,     1,   361,   122,     0,   263,   136,   355,
     263,    65,   512,   204,    60,   192,     3,   259,    79,     1,
     223,   224,    68,     3,    17,    25,   258,   259,     3,   210,
       3,    31,    32,    31,    32,     0,     3,     3,    95,     3,
      40,    41,    88,    41,   410,     3,   112,   413,   192,     3,
       3,    51,   192,   192,     3,     3,   244,    57,    70,    41,
      60,    69,    70,    69,    70,    65,    69,    70,    68,    69,
      28,     3,    72,    73,    74,    73,    76,   194,    78,    79,
     141,   770,   308,     3,   118,   116,    86,   118,    88,     3,
       3,   591,    57,   319,    41,    95,    28,   110,   132,   243,
      65,   245,   156,   243,   128,   245,    25,    74,    74,   155,
      74,   118,    79,    79,    28,    79,   116,     0,   131,   119,
     132,   238,    11,   355,   132,   132,   132,   816,     3,   132,
     130,     3,    51,   113,   127,   635,   109,   110,   113,   267,
     268,   269,     3,   109,   131,    74,   112,   264,   112,   405,
      79,   116,   405,   210,   119,   155,   156,   348,   131,   112,
     109,   110,   162,   340,   131,   165,   223,   224,     3,   286,
     116,   171,   172,   131,   174,   129,   176,   131,   178,   435,
     180,   437,   435,   131,    70,   131,   686,   198,   199,   200,
     201,   156,   192,   193,   194,   195,   340,   543,   180,   131,
     340,   340,   202,   445,   204,    69,   206,   388,   128,   390,
     210,   131,   110,   445,   275,   276,   131,   278,   131,   219,
     408,   587,   111,   223,   224,     3,   458,   415,   193,   118,
     195,    70,   232,   233,   351,   423,    70,   109,   232,   646,
     112,   241,   242,   243,   244,   245,   132,   308,   109,   110,
      74,   251,     1,   610,     3,    79,   113,   204,   319,   450,
     260,   322,    69,    70,    69,   265,   312,   232,   132,   251,
     131,   415,   318,   192,   109,   415,   415,   112,    69,   423,
     115,    79,   131,   423,   423,    99,   233,    12,    13,   406,
     131,    68,   495,   132,   497,   242,    74,   244,   132,    76,
     300,    79,   302,   117,   113,   129,   120,    95,   308,   309,
     310,   543,   544,   555,   721,   443,     1,   110,     3,   319,
     119,   116,   322,   555,   243,   132,   245,   132,     3,    69,
     128,   388,   118,   390,   112,   335,   131,   115,   131,   308,
     340,   132,   128,   157,   309,   345,   160,   347,   348,   118,
     319,   351,   352,   353,   408,   355,     3,   529,   340,   109,
     109,   110,   362,   109,   113,   365,   112,   367,   624,   118,
      74,   624,   544,   123,   124,    79,    16,   377,   155,   379,
       7,     8,     9,   116,   384,   110,   111,   116,   388,   118,
     390,   118,   132,   125,   394,   126,   396,   174,   131,    74,
     118,   348,   402,   130,    79,   132,   353,   407,   408,   113,
     120,   121,   130,   111,   396,   415,   335,   534,   118,   118,
     118,   340,   210,   423,   109,   110,   345,    74,   308,   661,
     130,   130,    79,   132,   109,   223,   224,   112,   495,   319,
     497,   111,   453,   408,     3,   118,   627,   628,   118,   396,
     450,   512,   118,   128,   118,   118,   111,   130,   504,     7,
       8,     9,   109,   118,   130,   112,   130,   130,   308,   641,
     258,   259,   119,   729,     7,     8,     9,   109,   116,   319,
     112,   653,   113,   115,   726,   112,   129,   301,   115,   661,
     117,     7,     8,     9,   726,   495,   415,   497,     0,   499,
     113,   111,   129,   112,   423,   118,   115,     3,   118,   113,
     112,   511,   512,   115,   770,    74,   131,   113,   518,   113,
      79,   521,   118,   113,   118,   642,   643,   644,   118,   529,
     591,   531,   129,   113,   588,   535,   131,   537,   118,    41,
     540,   713,   540,   543,   544,   717,   113,   113,   720,   363,
     109,   118,   118,   112,   113,    57,    58,   557,   558,   130,
     816,   113,   562,    65,   112,   112,   118,   115,   115,   117,
     627,   628,     0,     1,   635,     3,    78,    79,    74,   112,
     130,   129,   115,    79,   117,   113,   758,   759,   588,   761,
     118,   591,   764,    95,   382,   409,   112,    10,    11,   115,
     388,   117,   390,    44,    45,    14,    15,   421,   130,   131,
     113,   611,   113,   109,   116,   112,   112,   119,   116,   115,
     122,   632,   633,   588,   796,   686,   116,   627,   628,   110,
     630,   270,   271,    74,    75,   635,   272,   273,    79,   132,
     812,   641,   113,   815,   113,   762,    74,   112,   765,   279,
     280,    79,   115,   653,   156,   157,   656,   445,   160,   171,
     172,   661,   112,   110,   115,   132,   132,   113,   109,   669,
     458,   128,   672,   112,   112,   112,   112,   130,   180,   113,
     132,   109,   110,   113,   112,   113,   686,   115,   130,   116,
     118,   193,   110,   195,   115,   706,   707,   130,   709,   710,
     128,   116,   204,   115,   128,   113,   132,   495,   210,   497,
     524,   131,     1,   713,     3,     4,     5,   717,    56,   130,
     720,   223,   224,   129,   115,   132,   128,   727,   113,   727,
     232,   233,   732,   733,   745,   116,   747,   116,   116,    28,
     242,   116,   244,   754,   755,   112,   560,   116,   116,   251,
     130,    64,    51,    41,   130,   132,   258,   259,   758,   759,
     132,   761,   132,   113,   764,   113,   132,   555,   132,   132,
     781,   132,   783,   132,   785,   589,   787,   132,   592,   405,
     284,   281,    71,    72,   283,   245,   727,   601,   602,   376,
     282,   285,   114,   115,   382,   322,   796,   808,   558,   810,
     122,   450,   543,   615,     1,   458,   308,   309,   458,    -1,
     458,   302,   812,   102,   103,   815,    -1,   319,    -1,    -1,
     322,    -1,    -1,   112,    -1,    -1,    -1,   615,    -1,    -1,
      -1,    -1,    -1,    -1,    31,    32,    -1,    -1,    -1,   627,
     628,    -1,    -1,    -1,    41,    -1,   348,    -1,    -1,   351,
      -1,   353,    -1,   355,    -1,    -1,    -1,    -1,    -1,    -1,
      57,    -1,    -1,    -1,    -1,    -1,    63,    -1,    -1,    -1,
      -1,    68,   194,   687,    -1,    72,    73,   691,    75,    76,
      77,    -1,    -1,    -1,    -1,    -1,   388,    -1,   390,    -1,
      -1,    -1,    -1,    -1,   396,    -1,    -1,    94,    95,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   408,    -1,    -1,   106,
     724,   233,    -1,    -1,    -1,    -1,   238,    -1,    -1,    -1,
      -1,   735,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,    -1,    -1,    -1,    -1,    -1,   726,    -1,
      -1,   263,   264,   445,    -1,    -1,    -1,    -1,   450,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   458,    -1,   155,    -1,
      -1,    31,    32,    -1,   286,    -1,    -1,    -1,    -1,    -1,
      -1,    41,    -1,    -1,    -1,    -1,   173,   174,    -1,    -1,
      -1,    -1,    -1,   180,    -1,    -1,    56,    57,    -1,    -1,
      60,    -1,    -1,   495,    -1,   497,   193,   194,    -1,    -1,
      -1,    -1,    72,    73,    74,    58,    -1,   204,    -1,   511,
     512,    -1,    -1,   210,    -1,    -1,    -1,    -1,    88,    -1,
      -1,    -1,   219,    -1,    -1,    -1,   223,   224,    -1,   351,
      -1,    -1,   102,   355,    -1,    -1,    -1,    -1,   540,    -1,
      -1,   543,   544,    -1,    -1,   242,    99,   244,    -1,    -1,
      -1,    -1,    -1,   555,   251,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   117,    -1,    -1,   120,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    -1,    -1,
      -1,    -1,    -1,   405,   406,    -1,   588,    -1,    -1,   591,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   157,    -1,    -1,   160,    -1,    -1,
     180,    -1,   309,   435,    -1,   437,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   194,   627,   628,    -1,    -1,    -1,
      -1,    -1,    -1,   635,   204,    -1,   206,    -1,    -1,    -1,
      -1,    -1,    -1,   340,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   348,    -1,    -1,   351,    -1,    -1,    -1,    -1,   661,
      -1,    -1,    -1,    -1,    -1,   362,    -1,    -1,    -1,    -1,
      -1,    -1,   242,    -1,   244,    -1,    -1,    -1,    -1,   129,
     377,   251,    -1,    -1,   686,    -1,    -1,    -1,    -1,    -1,
      -1,   388,    -1,   390,    -1,    -1,    -1,    -1,    -1,   396,
      -1,    -1,    -1,    -1,    -1,   258,   259,   529,    -1,    -1,
      -1,   408,   534,    -1,    -1,    -1,    -1,    -1,   415,    -1,
      -1,   543,   544,    -1,   726,    -1,   423,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    60,    -1,   309,
      -1,    -1,   312,    -1,    -1,    -1,    -1,    -1,   301,    -1,
      -1,    74,    -1,   450,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,
     340,    -1,    95,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     350,   351,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   362,    -1,    -1,    -1,    -1,   367,   495,    -1,
     497,    -1,   624,    -1,    -1,    -1,    -1,    -1,   361,    -1,
     363,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   641,
     642,   643,   644,    -1,   646,    -1,   396,    -1,    -1,    -1,
      -1,   653,    -1,    -1,    -1,    -1,    -1,    -1,   408,   661,
     410,    -1,   165,   540,    -1,   415,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   423,    -1,    -1,   409,    -1,    -1,    -1,
      -1,   558,    -1,    -1,    -1,    -1,    -1,    -1,   421,    -1,
     193,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     450,   204,    -1,   206,    -1,    -1,    -1,   210,    -1,    -1,
      -1,   713,   445,    -1,    -1,   717,   219,    -1,   720,   721,
     223,   224,    -1,    -1,    -1,   458,    -1,   729,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     627,   628,    -1,    -1,    -1,    -1,   758,   759,    -1,   761,
     762,    -1,   764,   765,    -1,    -1,    -1,    -1,   770,    -1,
      -1,   521,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   659,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     540,   524,    -1,    -1,   796,   672,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     0,    -1,    -1,   558,    -1,
     812,    -1,    -1,   815,   816,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   555,    -1,    -1,    -1,    -1,   560,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,   348,    41,    -1,    -1,    -1,
     727,    -1,    -1,    -1,    -1,    -1,   589,    -1,    28,   592,
      -1,    56,    57,    -1,   367,    -1,    -1,    -1,   601,   602,
      65,    -1,    -1,    -1,   377,    -1,   379,   610,    -1,    -1,
      -1,   384,   615,    -1,    -1,   388,    -1,   390,     0,    -1,
      -1,    -1,    -1,   626,    -1,    -1,    -1,    -1,    -1,    -1,
      95,    71,    72,    73,    -1,    -1,    -1,   102,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   669,
      -1,   116,    -1,    -1,   119,    -1,    -1,   122,    -1,    41,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,   114,    57,    -1,   450,    -1,   119,
     120,   121,   122,    65,   687,    -1,    -1,    -1,   691,    -1,
     130,   156,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   727,    -1,    -1,
      -1,    -1,    -1,    95,    -1,   180,    -1,    -1,    -1,    -1,
      -1,   724,   495,   726,   497,    -1,    -1,   192,   193,    -1,
     195,    -1,   735,    -1,   116,    -1,    -1,   119,    -1,   204,
     122,    -1,    -1,    -1,    -1,   210,    -1,    -1,   521,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   223,   224,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   232,   233,    -1,
      -1,    -1,    -1,    -1,   156,    -1,    -1,   242,   243,   244,
     245,    -1,    -1,    -1,   557,   558,   251,    -1,    -1,   562,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   180,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,   193,    -1,   195,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   204,    -1,    -1,    -1,    -1,    28,   210,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   223,   224,    -1,   309,    -1,    -1,    -1,    -1,    -1,
     232,   233,    -1,    -1,   627,   628,    -1,    -1,    -1,     0,
     242,   243,   244,   245,    -1,    -1,    -1,    -1,    -1,   251,
      71,    72,    73,    -1,    -1,   340,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   348,    -1,   350,   351,    -1,   353,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   669,    -1,    -1,   672,
      41,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,    57,    -1,   119,   120,
     121,   122,    -1,   388,    65,   390,    -1,   309,    -1,    -1,
     131,   396,     0,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   408,    -1,    -1,    -1,    -1,    -1,    -1,
     415,    -1,    -1,    -1,    95,    -1,    -1,    -1,   423,   732,
     733,    -1,    -1,    -1,    -1,    -1,   348,    -1,    -1,   351,
      -1,   353,    -1,    41,    -1,   116,    -1,    -1,   119,    -1,
      -1,   122,    -1,    -1,    -1,   450,    -1,    -1,    -1,    57,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   388,    -1,   390,    -1,
      -1,    -1,    -1,    -1,   396,   156,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   408,    95,    -1,    -1,
     495,    -1,   497,   415,    -1,    -1,    -1,    -1,    -1,   180,
      -1,   423,    -1,    -1,    -1,    -1,    -1,    -1,   116,    -1,
      -1,   119,   193,    -1,   195,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   204,    -1,    -1,    -1,    -1,   450,   210,
      -1,    -1,    -1,    -1,    -1,   540,    -1,    -1,    -1,    -1,
      -1,    -1,   223,   224,    -1,    -1,    -1,    -1,   156,    -1,
      -1,   232,   233,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   242,   243,   244,   245,    -1,    60,    -1,    -1,    -1,
     251,    -1,   180,   495,    -1,   497,    -1,    -1,    -1,    -1,
      74,    -1,    -1,   588,   192,   193,    -1,   195,    -1,    -1,
      -1,    -1,    -1,    -1,    88,    -1,   204,    -1,    -1,    -1,
      -1,    95,   210,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   223,   224,    -1,   540,    -1,
      -1,    -1,   627,   628,   232,    -1,    -1,    -1,   309,    -1,
      -1,    -1,    -1,     0,   242,   243,   244,   245,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,   588,   348,    -1,    -1,
     351,   165,   353,    -1,    41,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      57,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,   193,
      -1,   309,    -1,    -1,    -1,   627,   628,   388,    -1,   390,
     204,    -1,   206,    -1,    -1,   396,   210,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,   219,    -1,   408,    95,   223,
     224,    -1,   340,    -1,   415,    -1,    -1,    -1,    -1,    -1,
     348,    -1,   423,    -1,    -1,   353,    -1,    -1,    -1,   116,
      -1,    -1,   119,   102,   103,   122,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,   450,
     119,   120,   121,   122,    -1,    -1,    -1,    -1,    -1,    -1,
     388,   130,   390,    -1,    -1,    -1,    -1,    -1,    -1,   156,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     408,    -1,    -1,    -1,    -1,    -1,    -1,   415,    -1,    -1,
      -1,    -1,    -1,   180,   495,   423,   497,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   193,    -1,   195,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   204,    -1,    -1,
      -1,    -1,   450,   210,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   348,    -1,   223,   224,    -1,   540,
      71,    72,    73,    -1,    -1,   232,   233,    -1,    -1,    -1,
      -1,    -1,    -1,   367,    -1,   242,    -1,   244,    -1,    -1,
      -1,    -1,    -1,   377,   251,   379,    -1,   495,    -1,   497,
     384,   102,   103,    -1,   388,    -1,   390,    -1,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,   588,   119,   120,
     121,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   540,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,   309,     8,     9,    -1,   627,   628,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   450,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     588,   348,    -1,    -1,   351,    -1,   353,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,   495,    -1,   497,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   627,
     628,   388,    -1,   390,    -1,    -1,    -1,   521,    -1,   396,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,   408,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,   120,   121,   122,    -1,    -1,
      -1,    -1,    -1,   557,    -1,   130,   131,    -1,   562,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   450,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   495,    -1,
     497,    -1,    -1,   627,   628,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,   540,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   588,   114,    -1,    -1,    -1,    -1,   119,   120,   121,
     122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,   131,
     132,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     627,   628,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    77,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,   131,   132,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,   120,   121,   122,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   130,   131,   132,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,   120,   121,   122,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   130,   131,   132,     1,    -1,     3,
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
     114,    -1,    -1,    -1,    -1,   119,   120,   121,   122,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   130,   131,   132,     1,
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
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,   120,   121,
     122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,   131,
     132,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,   131,   132,     1,    -1,     3,     4,     5,     6,    -1,
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
      -1,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,   120,   121,   122,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   130,   131,   132,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,     1,   114,     3,
       4,     5,    -1,   119,   120,   121,   122,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,     1,
     114,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,     1,   114,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,     1,   114,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,    -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,     1,   114,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   130,    -1,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,     1,   114,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   130,    -1,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,     1,
     114,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,     1,   114,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    77,    -1,    79,
      -1,    -1,    -1,    -1,     1,    85,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    28,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,   131,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    28,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
      -1,    -1,   119,   120,   121,   122,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,   120,   121,   122,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   131,    -1,   112,     1,
     114,     3,     4,     5,    -1,   119,   120,   121,   122,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    28,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,   130,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,     3,    -1,    -1,   109,
      -1,    -1,   112,    28,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    71,    72,    73,    74,
      -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,   100,   119,   120,   121,   122,    -1,    -1,
       3,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   131,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    28,    -1,    -1,
      -1,    -1,    85,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,   128,    -1,   130,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,   102,   103,    -1,    -1,    71,    72,    73,   109,    -1,
      -1,   112,    -1,   114,    -1,   116,    66,    -1,   119,   120,
     121,   122,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,   113,   114,    -1,
     100,    -1,    -1,   119,   120,   121,   122,    -1,    -1,   109,
      -1,     1,   112,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    28,    -1,   119,
     120,   121,   122,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,    28,    -1,   119,   120,
     121,   122,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,    28,    -1,   119,   120,   121,
     122,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    28,    -1,    -1,
      -1,    -1,    85,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,   114,    28,    -1,    -1,    -1,   119,   120,   121,   122,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    71,    72,    73,   109,    -1,
      -1,   112,    -1,   114,    28,   116,    -1,    -1,   119,   120,
     121,   122,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,    28,
     116,    -1,    -1,   119,   120,   121,   122,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    71,    72,    73,   109,    -1,    -1,   112,   113,
     114,    28,    -1,    -1,    -1,   119,   120,   121,   122,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,   114,    28,    -1,    -1,    -1,
     119,   120,   121,   122,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    71,
      72,    73,   109,    -1,    -1,   112,    -1,   114,    28,    -1,
      -1,    -1,   119,   120,   121,   122,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,     1,    -1,     3,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,   120,   121,
     122,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,    -1,    65,    66,    -1,   119,
     120,   121,   122,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    -1,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    -1,    -1,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,   115,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    28,    -1,    -1,
      79,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    66,   115,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,     1,    -1,     3,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,     3,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     1,     3,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    65,    66,    74,    75,
      79,    82,    83,    85,   100,   134,   135,   136,   137,   138,
     143,   175,   176,   181,   182,   183,   184,   185,   186,   188,
     189,   196,   204,   205,   223,   253,   109,   112,   115,   143,
     182,   208,   210,   212,   213,   215,   216,   217,   220,   131,
     138,   143,   112,   119,   182,   212,   220,   212,   112,   110,
       1,   109,   110,   143,   134,   135,   143,   181,   182,   185,
     186,   188,   205,   210,   212,   131,   137,   138,   143,   128,
       0,   185,   219,   220,   113,   210,   212,   221,   222,   223,
       1,     4,     5,     6,     8,     9,    71,    72,    73,   102,
     103,   109,   112,   114,   116,   119,   120,   121,   122,   136,
     143,   144,   145,   146,   150,   151,   153,   154,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     170,   243,   208,   213,   216,   220,   112,   115,   182,   112,
     115,   113,   143,   221,   224,   182,   208,   217,   143,   206,
     207,   131,   131,   212,   220,   136,   143,   136,   143,   157,
     174,   181,   185,   186,   188,   190,   191,   192,   193,   194,
     195,   205,    68,    78,   112,   114,   130,   132,   139,   140,
     141,   142,   143,   146,   175,   181,   182,   185,   186,   188,
     197,   198,   199,   200,   201,   205,   213,   214,   216,   220,
     242,   243,   245,   131,   131,   136,   170,   185,   220,   113,
     113,   113,   118,   112,   145,   148,   150,   152,   112,   151,
     151,   143,   175,   170,   175,   170,   113,   151,   166,   167,
     169,   172,   185,   186,   188,   205,   225,   116,   131,   131,
       7,     8,     9,   112,   115,   117,   154,   109,   123,   124,
     120,   121,    10,    11,   157,    12,    13,   110,   111,    14,
      15,   119,   125,   126,    16,    17,   127,   116,   208,   217,
     113,   221,   116,   136,   170,   116,   136,   170,   113,   113,
     118,   129,   118,   132,   206,   206,   113,   113,   129,   112,
     143,   181,   182,   185,   186,   188,   205,   210,   220,   129,
      11,   111,   118,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    46,    47,    50,    66,   100,   138,   143,
     177,   181,   185,   187,   189,   196,   204,   143,   175,   214,
     109,   112,   143,   175,   131,   235,   236,   236,   236,   130,
     236,   129,   112,   128,   130,   143,   181,   182,   185,   186,
     188,   202,   203,   205,   213,   214,   218,   220,   216,   220,
     132,   201,   118,   130,   182,   216,   130,   130,   197,   132,
     197,    51,   223,   134,   143,   151,   173,   185,   186,   188,
     205,   226,     7,     8,     9,   112,   115,   117,   112,   115,
     182,   209,   211,   220,   143,   178,   181,   185,   187,   188,
     205,   115,   211,   178,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   129,   168,   113,   118,   185,   186,
     188,   205,   210,   113,   130,   131,   132,   146,   147,   166,
     174,   228,   244,   246,   247,   248,   249,   250,   251,   252,
     132,   252,   143,   113,   147,   149,   167,   169,   143,   154,
     154,   154,   155,   155,   156,   156,   157,   157,   157,   159,
     159,   160,   161,   162,   163,   164,   169,   113,   116,   116,
     116,   116,   143,   170,   207,   130,   132,   130,   132,   143,
     190,   191,   192,   193,   220,   191,   192,   193,   194,   138,
     143,   112,   110,   131,   143,   181,   185,   187,   210,   143,
     214,   182,   112,   132,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    77,   130,   143,   169,   171,
     174,   230,   231,   232,   233,   234,   236,   237,   238,   239,
     240,   241,   228,   113,   170,   131,   213,   220,   118,   130,
     128,   183,   182,   213,   216,   198,   216,   132,   132,   113,
     134,   185,   186,   188,   205,   210,   113,   143,   113,   149,
     169,   143,   113,   211,   221,   170,   209,   220,   112,   115,
     209,   110,   115,   143,   181,   185,   187,   188,   205,   211,
     170,   115,   115,   211,   147,   167,   167,   154,   132,   252,
     129,   143,   214,   218,   236,   118,   130,   130,   247,   249,
     250,   132,   132,   113,   118,   116,   128,   197,   197,   136,
     143,   195,    69,    70,   132,   110,   131,   131,   143,   113,
     170,   128,   112,   112,   112,   230,   112,   143,   130,   130,
     130,   169,   143,   128,   130,   130,   143,   179,   180,   212,
     171,   233,   171,   230,   132,   130,   132,   252,   213,   182,
     203,   213,   220,   170,   213,   113,   116,   113,   113,   116,
     209,   113,   221,   170,   195,   170,   110,   115,   116,   170,
     170,   115,   132,   228,   248,   147,   167,   166,   132,   132,
     113,   113,   111,   236,   236,   195,    69,    70,   132,    69,
      70,   132,   131,   128,   230,   169,   169,   113,   169,    56,
     113,   237,   130,   130,   129,   230,   131,   118,   130,   129,
     132,   213,   220,   182,   213,   128,   113,   116,   111,   116,
     195,   170,   116,   116,   170,    70,   132,    69,   132,   111,
     236,   236,   236,   236,    69,    70,   132,   230,   113,   113,
     230,   113,   112,   230,   113,   237,   170,   132,   252,   180,
     131,   167,   227,   213,   213,   170,   111,   116,   116,   236,
     236,    70,   132,    69,   132,    70,   132,    69,   132,   236,
     236,   230,   230,   230,   169,   230,   113,   169,   130,   132,
     227,   229,   132,   132,   236,   236,   236,   236,    70,   132,
      69,   132,    64,   113,   230,   113,   118,   132,   132,   132,
     132,   132,   236,   236,   230,   130,   230,   132,   227,   132,
     132
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
#line 359 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 25:
#line 361 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:
#line 362 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:
#line 363 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:
#line 364 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:
#line 365 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:
#line 366 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:
#line 367 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:
#line 368 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:
#line 369 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 35:
#line 374 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:
#line 375 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:
#line 376 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:
#line 377 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:
#line 378 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:
#line 379 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:
#line 380 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:
#line 384 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:
#line 390 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:
#line 391 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:
#line 392 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:
#line 393 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:
#line 394 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:
#line 395 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:
#line 396 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:
#line 400 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 52:
#line 401 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 53:
#line 402 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 54:
#line 403 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 55:
#line 407 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:
#line 408 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:
#line 409 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:
#line 410 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:
#line 411 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:
#line 412 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:
#line 426 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 66:
#line 427 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 67:
#line 428 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 68:
#line 429 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 69:
#line 430 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 70:
#line 431 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 71:
#line 432 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 73:
#line 437 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:
#line 442 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:
#line 443 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:
#line 444 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:
#line 449 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:
#line 450 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:
#line 455 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:
#line 456 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:
#line 461 "type.y"
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   ;}
    break;

  case 86:
#line 469 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:
#line 470 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:
#line 471 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:
#line 472 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:
#line 477 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:
#line 478 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:
#line 483 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:
#line 488 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:
#line 493 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 100:
#line 498 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 102:
#line 503 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 104:
#line 508 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 106:
#line 513 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 107:
#line 514 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 108:
#line 518 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 109:
#line 519 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 110:
#line 520 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 111:
#line 521 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 112:
#line 522 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 113:
#line 523 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 114:
#line 524 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 115:
#line 525 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 116:
#line 526 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 117:
#line 527 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 118:
#line 528 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 119:
#line 532 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 120:
#line 533 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 122:
#line 541 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 123:
#line 542 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 124:
#line 543 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 125:
#line 544 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 126:
#line 556 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 127:
#line 557 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 128:
#line 558 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 129:
#line 559 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 130:
#line 560 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 131:
#line 561 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 132:
#line 562 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 133:
#line 563 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 134:
#line 567 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 135:
#line 568 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 136:
#line 569 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 137:
#line 570 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 138:
#line 571 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 139:
#line 572 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 140:
#line 573 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 141:
#line 574 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 142:
#line 575 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 143:
#line 576 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 144:
#line 580 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 145:
#line 581 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 146:
#line 582 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 147:
#line 583 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 148:
#line 584 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 149:
#line 585 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 150:
#line 586 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 151:
#line 587 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 152:
#line 588 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 153:
#line 589 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 154:
#line 593 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 155:
#line 594 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 156:
#line 595 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 157:
#line 596 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 158:
#line 597 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 159:
#line 598 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 160:
#line 599 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 161:
#line 600 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 162:
#line 601 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 163:
#line 602 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 164:
#line 603 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 165:
#line 604 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 166:
#line 608 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 167:
#line 609 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 168:
#line 610 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 169:
#line 611 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 170:
#line 612 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 171:
#line 613 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 172:
#line 614 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 173:
#line 615 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 174:
#line 616 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 175:
#line 617 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 176:
#line 618 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 177:
#line 619 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 178:
#line 680 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 179:
#line 681 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 180:
#line 682 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 181:
#line 683 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 182:
#line 684 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 183:
#line 685 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 184:
#line 686 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 185:
#line 687 "type.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 186:
#line 689 "type.y"
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

  case 187:
#line 707 "type.y"
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

  case 188:
#line 723 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 189:
#line 724 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 190:
#line 725 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 191:
#line 726 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 192:
#line 727 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 193:
#line 728 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 194:
#line 729 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 195:
#line 730 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 196:
#line 731 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 197:
#line 732 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 198:
#line 733 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 199:
#line 734 "type.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 200:
#line 736 "type.y"
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

  case 201:
#line 754 "type.y"
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

  case 202:
#line 853 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 203:
#line 854 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 204:
#line 858 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 205:
#line 859 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 206:
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 207:
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 208:
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 209:
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 210:
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 211:
#line 871 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 213:
#line 876 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 214:
#line 881 "type.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 215:
#line 882 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].string)); delete (yyvsp[0].string); ;}
    break;

  case 216:
#line 886 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 217:
#line 887 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 218:
#line 888 "type.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 219:
#line 893 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 220:
#line 894 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 221:
#line 895 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 222:
#line 896 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 223:
#line 897 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 224:
#line 898 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 225:
#line 899 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 226:
#line 900 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 227:
#line 901 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 228:
#line 902 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 229:
#line 903 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 230:
#line 904 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 231:
#line 905 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 235:
#line 909 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 236:
#line 910 "type.y"
    { DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 237:
#line 911 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 238:
#line 915 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 239:
#line 916 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 240:
#line 917 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 241:
#line 918 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 242:
#line 919 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 243:
#line 920 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 244:
#line 921 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 245:
#line 922 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 246:
#line 923 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 247:
#line 924 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 248:
#line 925 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 249:
#line 926 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 253:
#line 930 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 254:
#line 931 "type.y"
    { DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 255:
#line 932 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 256:
#line 937 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 257:
#line 938 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); ;}
    break;

  case 258:
#line 939 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-2].id).string); ;}
    break;

  case 259:
#line 940 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); ;}
    break;

  case 260:
#line 942 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 261:
#line 946 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 262:
#line 948 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 263:
#line 952 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); ;}
    break;

  case 264:
#line 953 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 265:
#line 954 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[0].id).string)), null); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 266:
#line 958 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[0].templateDatatype)); ;}
    break;

  case 267:
#line 973 "type.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[0].id)); ;}
    break;

  case 268:
#line 982 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); ;}
    break;

  case 272:
#line 1005 "type.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
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
#line 1009 "type.y"
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

  case 276:
#line 1021 "type.y"
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
#line 1033 "type.y"
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
#line 1047 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); ;}
    break;

  case 279:
#line 1048 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); ;}
    break;

  case 280:
#line 1161 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 281:
#line 1162 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 282:
#line 1166 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 283:
#line 1167 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 284:
#line 1171 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 285:
#line 1175 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 286:
#line 1176 "type.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 287:
#line 1181 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 288:
#line 1183 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 289:
#line 1185 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 290:
#line 1187 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 291:
#line 1189 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 292:
#line 1192 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 293:
#line 1194 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 294:
#line 1196 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 295:
#line 1198 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 296:
#line 1200 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 297:
#line 1203 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 298:
#line 1205 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 299:
#line 1207 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:
#line 1209 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:
#line 1211 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:
#line 1214 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:
#line 1216 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:
#line 1218 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:
#line 1220 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:
#line 1222 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:
#line 1226 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 308:
#line 1227 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 309:
#line 1228 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 310:
#line 1229 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 311:
#line 1230 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 312:
#line 1231 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 313:
#line 1232 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 314:
#line 1233 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 315:
#line 1238 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 316:
#line 1240 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 317:
#line 1245 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 318:
#line 1247 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 319:
#line 1249 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 320:
#line 1251 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 321:
#line 1253 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 322:
#line 1257 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 323:
#line 1258 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 324:
#line 1263 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); ;}
    break;

  case 325:
#line 1264 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 326:
#line 1265 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].id).string); ;}
    break;

  case 327:
#line 1266 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); ;}
    break;

  case 328:
#line 1267 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 329:
#line 1284 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 330:
#line 1286 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 331:
#line 1291 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 332:
#line 1293 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 333:
#line 1299 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 334:
#line 1301 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 335:
#line 1303 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 336:
#line 1305 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 337:
#line 1307 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 338:
#line 1309 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 339:
#line 1311 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 340:
#line 1313 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 341:
#line 1315 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 342:
#line 1317 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 343:
#line 1319 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 344:
#line 1324 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 345:
#line 1326 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 346:
#line 1328 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 347:
#line 1330 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 348:
#line 1332 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 349:
#line 1336 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 351:
#line 1338 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 352:
#line 1339 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 353:
#line 1340 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 354:
#line 1341 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 355:
#line 1345 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 357:
#line 1347 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 358:
#line 1348 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 359:
#line 1349 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 360:
#line 1350 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 362:
#line 1398 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 363:
#line 1400 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 365:
#line 1407 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 366:
#line 1409 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 367:
#line 1411 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 368:
#line 1413 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 369:
#line 1415 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 371:
#line 1421 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 372:
#line 1424 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 373:
#line 1426 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 374:
#line 1428 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 376:
#line 1438 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 377:
#line 1440 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 378:
#line 1442 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 381:
#line 1449 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 382:
#line 1451 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 384:
#line 1456 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 385:
#line 1457 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 386:
#line 1458 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 387:
#line 1459 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 388:
#line 1463 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 389:
#line 1464 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 390:
#line 1468 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 391:
#line 1469 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 392:
#line 1470 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 393:
#line 1471 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 395:
#line 1476 "type.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 396:
#line 1480 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 397:
#line 1481 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 398:
#line 1485 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 399:
#line 1486 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 400:
#line 1487 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 401:
#line 1488 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 402:
#line 1500 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 403:
#line 1502 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); ;}
    break;

  case 404:
#line 1504 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 405:
#line 1506 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), (yyvsp[0].declarator));  ;}
    break;

  case 406:
#line 1508 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); ;}
    break;

  case 407:
#line 1510 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); ;}
    break;

  case 408:
#line 1512 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), (yyvsp[0].declarator)); ;}
    break;

  case 409:
#line 1515 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), null); ;}
    break;

  case 410:
#line 1516 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[0].declarator)); ;}
    break;

  case 411:
#line 1518 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[0].declarator)); ;}
    break;

  case 412:
#line 1522 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 413:
#line 1523 "type.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 414:
#line 1527 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 415:
#line 1528 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 416:
#line 1532 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 417:
#line 1533 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 418:
#line 1538 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 419:
#line 1540 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 420:
#line 1542 "type.y"
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

  case 421:
#line 1558 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 422:
#line 1560 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 423:
#line 1582 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 424:
#line 1584 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 431:
#line 1598 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 432:
#line 1600 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 433:
#line 1602 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 434:
#line 1606 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 435:
#line 1607 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 436:
#line 1611 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 437:
#line 1612 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 438:
#line 1615 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); ;}
    break;

  case 439:
#line 1619 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 440:
#line 1620 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 441:
#line 1621 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 442:
#line 1625 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 443:
#line 1630 "type.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 444:
#line 1638 "type.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 445:
#line 1642 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 446:
#line 1643 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 447:
#line 1647 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:
#line 1648 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:
#line 1649 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:
#line 1653 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:
#line 1654 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:
#line 1655 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:
#line 1656 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:
#line 1658 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:
#line 1659 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:
#line 1660 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:
#line 1664 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:
#line 1665 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:
#line 1666 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:
#line 1667 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 461:
#line 1668 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:
#line 1677 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 463:
#line 1679 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 464:
#line 1684 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 465:
#line 1686 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 466:
#line 1711 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 467:
#line 1713 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 468:
#line 1715 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 469:
#line 1717 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 470:
#line 1722 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 471:
#line 1724 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 472:
#line 1728 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 473:
#line 1730 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 474:
#line 1732 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 475:
#line 1734 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 476:
#line 1736 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 477:
#line 1742 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 478:
#line 1744 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 479:
#line 1749 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:
#line 1753 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 481:
#line 1754 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 482:
#line 1759 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 483:
#line 1761 "type.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 484:
#line 1766 "type.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 485:
#line 1770 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 486:
#line 1771 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 487:
#line 1772 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 488:
#line 1773 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 489:
#line 1774 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 490:
#line 1775 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 492:
#line 1780 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 493:
#line 1781 "type.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 494:
#line 1785 "type.y"
    { parsedType = (yyvsp[0].typeName); ;}
    break;

  case 495:
#line 1786 "type.y"
    { parsedType = (yyvsp[-2].typeName); parsedType.bitCount = (yyvsp[0].exp); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 5963 "type.ec"

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


#line 1789 "type.y"



