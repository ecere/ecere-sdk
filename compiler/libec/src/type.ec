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
#define YYLAST   7483

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  122
/* YYNRULES -- Number of rules. */
#define YYNRULES  498
/* YYNRULES -- Number of states. */
#define YYNSTATES  836

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
     112,   113,   109,   121,   119,   122,   116,   124,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   129,   131,
     110,   130,   111,   128,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   117,     2,   118,   126,     2,     2,     2,     2,     2,
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
      60,    62,    64,    66,    68,    71,    76,    79,    86,    92,
      99,   105,   113,   120,   128,   135,   137,   139,   144,   148,
     153,   157,   161,   164,   167,   169,   171,   176,   180,   185,
     189,   193,   196,   199,   201,   203,   207,   211,   214,   217,
     220,   225,   228,   233,   235,   237,   239,   241,   243,   245,
     247,   249,   251,   253,   255,   257,   262,   264,   268,   272,
     276,   278,   282,   286,   288,   292,   296,   299,   301,   304,
     308,   312,   316,   318,   322,   326,   328,   332,   334,   338,
     340,   344,   346,   350,   352,   356,   358,   364,   366,   370,
     374,   376,   378,   380,   382,   384,   386,   388,   390,   392,
     394,   396,   398,   402,   404,   407,   411,   414,   420,   422,
     425,   427,   430,   432,   435,   437,   440,   442,   445,   447,
     450,   452,   455,   457,   460,   462,   465,   467,   470,   472,
     475,   477,   480,   482,   485,   487,   490,   492,   495,   497,
     500,   502,   505,   507,   510,   512,   515,   517,   520,   522,
     525,   527,   530,   532,   535,   537,   540,   542,   545,   547,
     550,   552,   555,   557,   560,   562,   565,   567,   570,   575,
     581,   583,   586,   588,   591,   593,   596,   598,   601,   603,
     606,   608,   611,   616,   622,   624,   628,   630,   634,   636,
     638,   640,   642,   644,   646,   648,   650,   652,   654,   656,
     658,   660,   662,   664,   666,   668,   670,   672,   674,   676,
     678,   680,   682,   684,   686,   688,   690,   692,   697,   702,
     704,   706,   708,   710,   712,   714,   716,   718,   720,   722,
     724,   726,   728,   730,   732,   734,   739,   744,   746,   752,
     757,   762,   766,   772,   775,   778,   780,   783,   785,   787,
     789,   791,   793,   795,   797,   801,   805,   809,   813,   817,
     821,   823,   827,   829,   831,   833,   836,   840,   842,   846,
     856,   866,   874,   882,   888,   899,   910,   919,   928,   935,
     944,   953,   960,   967,   972,   982,   992,  1000,  1008,  1014,
    1018,  1021,  1024,  1027,  1029,  1032,  1034,  1036,  1038,  1042,
    1044,  1047,  1050,  1054,  1060,  1063,  1066,  1071,  1077,  1085,
    1093,  1099,  1101,  1105,  1107,  1111,  1115,  1118,  1122,  1126,
    1130,  1135,  1140,  1143,  1147,  1151,  1156,  1160,  1163,  1167,
    1171,  1176,  1178,  1180,  1183,  1186,  1189,  1193,  1195,  1197,
    1200,  1203,  1206,  1210,  1212,  1215,  1219,  1222,  1224,  1228,
    1233,  1237,  1242,  1244,  1247,  1250,  1254,  1258,  1261,  1265,
    1269,  1272,  1274,  1276,  1279,  1282,  1284,  1287,  1290,  1294,
    1298,  1300,  1303,  1305,  1308,  1311,  1315,  1317,  1321,  1323,
    1327,  1330,  1333,  1335,  1337,  1339,  1341,  1344,  1347,  1351,
    1353,  1356,  1358,  1361,  1364,  1366,  1370,  1372,  1375,  1377,
    1380,  1382,  1386,  1391,  1393,  1395,  1397,  1401,  1403,  1405,
    1407,  1409,  1411,  1413,  1417,  1422,  1426,  1428,  1431,  1433,
    1436,  1439,  1441,  1443,  1446,  1448,  1451,  1455,  1457,  1460,
    1466,  1474,  1480,  1486,  1494,  1501,  1509,  1514,  1520,  1525,
    1529,  1532,  1535,  1538,  1542,  1544,  1550,  1555,  1561,  1566,
    1571,  1575,  1580,  1584,  1588,  1591,  1594,  1597,  1600,  1603,
    1606,  1609,  1612,  1615,  1619,  1621,  1623,  1627,  1630,  1632,
    1634,  1637,  1640,  1642,  1645,  1647,  1649,  1652,  1654
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
     144,    -1,   245,    -1,     4,    -1,   242,    -1,   115,   242,
      -1,   115,   242,   116,   242,    -1,   112,   113,    -1,    71,
     176,   212,   117,   171,   118,    -1,    71,   176,   117,   171,
     118,    -1,   102,   176,   212,   117,   171,   118,    -1,   102,
     176,   117,   171,   118,    -1,    72,   171,   179,   212,   117,
     171,   118,    -1,    72,   171,   179,   117,   171,   118,    -1,
     103,   171,   179,   212,   117,   171,   118,    -1,   103,   171,
     179,   117,   171,   118,    -1,     1,    -1,   145,    -1,   147,
     117,   170,   118,    -1,   147,   112,   113,    -1,   147,   112,
     150,   113,    -1,   147,   116,   144,    -1,   147,     7,   144,
      -1,   147,     8,    -1,   147,     9,    -1,   246,    -1,   146,
      -1,   149,   117,   170,   118,    -1,   149,   112,   113,    -1,
     149,   112,   150,   113,    -1,   149,   116,   144,    -1,   149,
       7,   144,    -1,   149,     8,    -1,   149,     9,    -1,   168,
      -1,   148,    -1,   150,   119,   168,    -1,   150,   119,   148,
      -1,     8,   152,    -1,     9,   152,    -1,   154,   155,    -1,
       6,   112,   152,   113,    -1,     6,   153,    -1,     6,   112,
     227,   113,    -1,   151,    -1,   147,    -1,   151,    -1,   149,
      -1,   120,    -1,   109,    -1,   121,    -1,   122,    -1,   114,
      -1,   123,    -1,    73,    -1,   152,    -1,   112,   226,   113,
     155,    -1,   155,    -1,   156,   109,   155,    -1,   156,   124,
     155,    -1,   156,   125,   155,    -1,   156,    -1,   157,   121,
     156,    -1,   157,   122,   156,    -1,   157,    -1,   158,    10,
     157,    -1,   158,    11,   157,    -1,   160,   110,    -1,   158,
      -1,   159,   158,    -1,   160,   111,   158,    -1,   160,    12,
     158,    -1,   160,    13,   158,    -1,   160,    -1,   161,    14,
     160,    -1,   161,    15,   160,    -1,   161,    -1,   162,   120,
     161,    -1,   162,    -1,   163,   126,   162,    -1,   163,    -1,
     164,   127,   163,    -1,   164,    -1,   165,    16,   164,    -1,
     165,    -1,   166,    17,   165,    -1,   166,    -1,   166,   128,
     170,   129,   167,    -1,   167,    -1,   152,   169,   168,    -1,
     152,   169,   148,    -1,   130,    -1,    18,    -1,    19,    -1,
      20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,    -1,
      25,    -1,    26,    -1,    27,    -1,   168,    -1,   170,   119,
     168,    -1,   167,    -1,   175,   131,    -1,   175,   180,   131,
      -1,   243,   131,    -1,    77,   144,   130,   171,   131,    -1,
     186,    -1,   173,   186,    -1,   187,    -1,   173,   187,    -1,
     206,    -1,   173,   206,    -1,   189,    -1,   173,   189,    -1,
     186,    -1,   174,   186,    -1,   187,    -1,   174,   187,    -1,
     135,    -1,   174,   135,    -1,   206,    -1,   174,   206,    -1,
     189,    -1,   174,   189,    -1,   182,    -1,   175,   182,    -1,
     186,    -1,   175,   186,    -1,   187,    -1,   175,   187,    -1,
     206,    -1,   175,   206,    -1,   189,    -1,   175,   189,    -1,
     182,    -1,   176,   182,    -1,   186,    -1,   176,   186,    -1,
     187,    -1,   176,   187,    -1,   135,    -1,   176,   135,    -1,
     189,    -1,   176,   189,    -1,   206,    -1,   176,   206,    -1,
     182,    -1,   176,   182,    -1,   186,    -1,   176,   186,    -1,
     187,    -1,   176,   187,    -1,   136,    -1,   176,   136,    -1,
     189,    -1,   176,   189,    -1,   206,    -1,   176,   206,    -1,
     182,    -1,   178,   182,    -1,   186,    -1,   178,   186,    -1,
     188,    -1,   178,   188,    -1,   144,    -1,   178,   144,    -1,
     144,   110,   196,   111,    -1,   178,   144,   110,   196,   111,
      -1,   182,    -1,   179,   182,    -1,   186,    -1,   179,   186,
      -1,   188,    -1,   179,   188,    -1,   189,    -1,   179,   189,
      -1,   206,    -1,   179,   206,    -1,   144,    -1,   179,   144,
      -1,   144,   110,   196,   111,    -1,   179,   144,   110,   196,
     111,    -1,   181,    -1,   180,   119,   181,    -1,   213,    -1,
     213,   130,   228,    -1,    29,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,    74,    -1,   184,    -1,    79,    -1,
      75,    -1,   183,    -1,    44,    -1,    45,    -1,   185,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,    85,    -1,   190,    -1,   205,    -1,
     137,    -1,   100,   112,   137,   113,    -1,   100,   112,   144,
     113,    -1,    66,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,   190,    -1,
     205,    -1,   139,    -1,   100,   112,   137,   113,    -1,   100,
     112,   144,   113,    -1,    66,    -1,   197,   144,   132,   198,
     133,    -1,   197,   132,   198,   133,    -1,   197,   144,   132,
     133,    -1,   197,   132,   133,    -1,   197,   138,   132,   198,
     133,    -1,   197,   144,    -1,   197,   139,    -1,   175,    -1,
     175,   211,    -1,   144,    -1,   191,    -1,   144,    -1,   158,
      -1,   194,    -1,   193,    -1,   192,    -1,   144,   130,   194,
      -1,   144,   130,   193,    -1,   144,   130,   192,    -1,   191,
     130,   194,    -1,   191,   130,   193,    -1,   191,   130,   192,
      -1,   195,    -1,   196,   119,   195,    -1,    48,    -1,    49,
      -1,   202,    -1,   198,   202,    -1,   147,   130,   229,    -1,
     199,    -1,   200,   119,   199,    -1,    68,   178,   144,   132,
      69,   237,    70,   237,   133,    -1,    68,   178,   144,   132,
      70,   237,    69,   237,   133,    -1,    68,   178,   144,   132,
      69,   237,   133,    -1,    68,   178,   144,   132,    70,   237,
     133,    -1,    68,   178,   144,   132,   133,    -1,    68,   178,
     211,   144,   132,    69,   237,    70,   237,   133,    -1,    68,
     178,   211,   144,   132,    70,   237,    69,   237,   133,    -1,
      68,   178,   211,   144,   132,    69,   237,   133,    -1,    68,
     178,   211,   144,   132,    70,   237,   133,    -1,    68,   178,
     211,   144,   132,   133,    -1,    68,   178,   132,    69,   237,
      70,   237,   133,    -1,    68,   178,   132,    70,   237,    69,
     237,   133,    -1,    68,   178,   132,    69,   237,   133,    -1,
      68,   178,   132,    70,   237,   133,    -1,    68,   178,   132,
     133,    -1,    68,   178,   211,   132,    69,   237,    70,   237,
     133,    -1,    68,   178,   211,   132,    70,   237,    69,   237,
     133,    -1,    68,   178,   211,   132,    69,   237,   133,    -1,
      68,   178,   211,   132,    70,   237,   133,    -1,    68,   178,
     211,   132,   133,    -1,   176,   203,   131,    -1,   176,   131,
      -1,   245,   131,    -1,   244,   131,    -1,   247,    -1,   200,
     131,    -1,   201,    -1,   131,    -1,   204,    -1,   203,   119,
     204,    -1,   219,    -1,   219,   184,    -1,   129,   171,    -1,
     219,   129,   171,    -1,   219,   129,   171,   129,   171,    -1,
      50,   144,    -1,    50,   139,    -1,    50,   132,   207,   133,
      -1,    50,   144,   132,   207,   133,    -1,    50,   144,   132,
     207,   131,   198,   133,    -1,    50,   139,   132,   207,   131,
     198,   133,    -1,    50,   139,   132,   207,   133,    -1,   208,
      -1,   207,   119,   208,    -1,   144,    -1,   144,   130,   171,
      -1,   112,   211,   113,    -1,   117,   118,    -1,   117,   171,
     118,    -1,   117,   137,   118,    -1,   209,   117,   118,    -1,
     209,   117,   171,   118,    -1,   209,   117,   137,   118,    -1,
     112,   113,    -1,   112,   222,   113,    -1,   209,   112,   113,
      -1,   209,   112,   222,   113,    -1,   112,   212,   113,    -1,
     112,   113,    -1,   112,   222,   113,    -1,   210,   112,   113,
      -1,   210,   112,   222,   113,    -1,   221,    -1,   209,    -1,
     221,   209,    -1,   183,   221,    -1,   183,   209,    -1,   183,
     221,   209,    -1,   221,    -1,   210,    -1,   221,   210,    -1,
     183,   221,    -1,   183,   210,    -1,   183,   221,   210,    -1,
     218,    -1,   221,   218,    -1,   183,   221,   218,    -1,   213,
     183,    -1,   144,    -1,   112,   213,   113,    -1,   214,   117,
     171,   118,    -1,   214,   117,   118,    -1,   214,   117,   137,
     118,    -1,   217,    -1,   221,   217,    -1,   183,   217,    -1,
     183,   221,   217,    -1,   221,   183,   217,    -1,   214,   112,
      -1,   216,   222,   113,    -1,   216,   225,   113,    -1,   216,
     113,    -1,   217,    -1,   214,    -1,   183,   217,    -1,   183,
     214,    -1,   214,    -1,   221,   214,    -1,   183,   214,    -1,
     183,   221,   214,    -1,   221,   183,   214,    -1,   186,    -1,
     220,   186,    -1,   109,    -1,   109,   220,    -1,   109,   221,
      -1,   109,   220,   221,    -1,   223,    -1,   223,   119,    51,
      -1,   224,    -1,   223,   119,   224,    -1,   176,   213,    -1,
     176,   211,    -1,   176,    -1,   177,    -1,    65,    -1,    82,
      -1,    82,   120,    -1,    82,   213,    -1,    82,   120,   213,
      -1,    83,    -1,    83,   213,    -1,     1,    -1,     1,   213,
      -1,     1,   211,    -1,   144,    -1,   225,   119,   144,    -1,
     173,    -1,   173,   211,    -1,   174,    -1,   174,   211,    -1,
     168,    -1,   132,   230,   133,    -1,   132,   230,   119,   133,
      -1,   167,    -1,   148,    -1,   228,    -1,   230,   119,   228,
      -1,   232,    -1,   237,    -1,   238,    -1,   239,    -1,   240,
      -1,   241,    -1,   144,   129,   231,    -1,    52,   171,   129,
     231,    -1,    53,   129,   231,    -1,   172,    -1,   233,   172,
      -1,   231,    -1,   234,   231,    -1,   234,   172,    -1,   234,
      -1,   233,    -1,   233,   234,    -1,   132,    -1,   132,   133,
      -1,   236,   235,   133,    -1,   131,    -1,   170,   131,    -1,
      54,   112,   170,   113,   231,    -1,    54,   112,   170,   113,
     231,    64,   231,    -1,    55,   112,   170,   113,   231,    -1,
      56,   112,   170,   113,   231,    -1,    57,   231,    56,   112,
     170,   113,   131,    -1,    58,   112,   238,   238,   113,   231,
      -1,    58,   112,   238,   238,   170,   113,   231,    -1,    56,
     112,   113,   231,    -1,    58,   112,   238,   113,   231,    -1,
      58,   112,   113,   231,    -1,    59,   144,   131,    -1,    60,
     131,    -1,    61,   131,    -1,    62,   131,    -1,    62,   170,
     131,    -1,     5,    -1,   175,   144,   132,   254,   133,    -1,
     175,   144,   132,   133,    -1,   176,   144,   132,   254,   133,
      -1,   176,   144,   132,   133,    -1,   137,   132,   254,   133,
      -1,   137,   132,   133,    -1,   144,   132,   254,   133,    -1,
     144,   132,   133,    -1,   132,   254,   133,    -1,   132,   133,
      -1,   140,   237,    -1,   143,   237,    -1,   143,   131,    -1,
     141,   237,    -1,   142,   237,    -1,   175,   215,    -1,   175,
     219,    -1,   248,   237,    -1,   147,   130,   229,    -1,   229,
      -1,   250,    -1,   251,   119,   250,    -1,   251,   131,    -1,
     252,    -1,   249,    -1,   253,   252,    -1,   253,   249,    -1,
     131,    -1,   253,   131,    -1,   253,    -1,   251,    -1,   253,
     251,    -1,   224,    -1,   224,   129,   171,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   160,   160,   177,   210,   260,   261,   288,   296,   297,
     298,   315,   317,   322,   327,   332,   334,   339,   344,   345,
     350,   352,   354,   356,   358,   359,   360,   363,   364,   365,
     366,   367,   368,   369,   370,   371,   375,   376,   377,   378,
     379,   380,   381,   382,   386,   391,   392,   393,   394,   395,
     396,   397,   398,   402,   403,   404,   405,   409,   410,   411,
     412,   413,   414,   418,   419,   423,   424,   428,   429,   430,
     431,   432,   433,   434,   438,   439,   443,   444,   445,   446,
     450,   451,   452,   456,   457,   458,   462,   470,   471,   472,
     473,   474,   478,   479,   480,   484,   485,   489,   490,   494,
     495,   499,   500,   504,   505,   509,   510,   514,   515,   516,
     520,   521,   522,   523,   524,   525,   526,   527,   528,   529,
     530,   534,   535,   539,   543,   544,   545,   546,   558,   559,
     560,   561,   562,   563,   564,   565,   569,   570,   571,   572,
     573,   574,   575,   576,   577,   578,   582,   583,   584,   585,
     586,   587,   588,   589,   590,   591,   595,   596,   597,   598,
     599,   600,   601,   602,   603,   604,   605,   606,   610,   611,
     612,   613,   614,   615,   616,   617,   618,   619,   620,   621,
     682,   683,   684,   685,   686,   687,   688,   689,   690,   708,
     725,   726,   727,   728,   729,   730,   731,   732,   733,   734,
     735,   736,   737,   755,   855,   856,   860,   861,   865,   866,
     867,   868,   869,   873,   874,   878,   883,   884,   888,   889,
     890,   895,   896,   897,   898,   899,   900,   901,   902,   903,
     904,   905,   906,   907,   908,   909,   910,   911,   912,   913,
     917,   918,   919,   920,   921,   922,   923,   924,   925,   926,
     927,   928,   929,   930,   931,   932,   933,   934,   939,   940,
     941,   942,   943,   948,   949,   954,   955,   956,   960,   975,
     984,  1004,  1005,  1006,  1007,  1008,  1009,  1010,  1022,  1034,
    1049,  1050,  1163,  1164,  1168,  1169,  1173,  1177,  1178,  1182,
    1184,  1186,  1188,  1190,  1193,  1195,  1197,  1199,  1201,  1204,
    1206,  1208,  1210,  1212,  1215,  1217,  1219,  1221,  1223,  1228,
    1229,  1230,  1231,  1232,  1233,  1234,  1235,  1239,  1241,  1246,
    1248,  1250,  1252,  1254,  1259,  1260,  1264,  1266,  1267,  1268,
    1269,  1285,  1287,  1292,  1294,  1300,  1302,  1304,  1306,  1308,
    1310,  1312,  1314,  1316,  1318,  1320,  1325,  1327,  1329,  1331,
    1333,  1338,  1339,  1340,  1341,  1342,  1343,  1347,  1348,  1349,
    1350,  1351,  1352,  1398,  1399,  1401,  1403,  1408,  1410,  1412,
    1414,  1416,  1421,  1422,  1425,  1427,  1429,  1435,  1439,  1441,
    1443,  1448,  1449,  1450,  1452,  1457,  1458,  1459,  1460,  1461,
    1465,  1466,  1470,  1471,  1472,  1473,  1477,  1478,  1482,  1483,
    1487,  1488,  1489,  1490,  1501,  1503,  1505,  1507,  1509,  1511,
    1513,  1516,  1518,  1520,  1524,  1525,  1529,  1530,  1534,  1535,
    1539,  1541,  1543,  1559,  1561,  1583,  1585,  1590,  1591,  1592,
    1593,  1594,  1595,  1599,  1601,  1603,  1608,  1609,  1613,  1614,
    1617,  1621,  1622,  1623,  1627,  1631,  1639,  1644,  1645,  1649,
    1650,  1651,  1655,  1656,  1657,  1658,  1660,  1661,  1662,  1666,
    1667,  1668,  1669,  1670,  1674,  1678,  1680,  1685,  1687,  1712,
    1714,  1716,  1718,  1723,  1725,  1729,  1731,  1733,  1735,  1737,
    1743,  1745,  1750,  1755,  1756,  1760,  1762,  1767,  1772,  1773,
    1774,  1775,  1776,  1777,  1781,  1782,  1783,  1787,  1788
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
  "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'+'",
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
      60,    62,    40,    41,   126,    36,    46,    91,    93,    44,
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
     146,   146,   146,   146,   146,   146,   147,   147,   147,   147,
     147,   147,   147,   147,   148,   149,   149,   149,   149,   149,
     149,   149,   149,   150,   150,   150,   150,   151,   151,   151,
     151,   151,   151,   152,   152,   153,   153,   154,   154,   154,
     154,   154,   154,   154,   155,   155,   156,   156,   156,   156,
     157,   157,   157,   158,   158,   158,   159,   160,   160,   160,
     160,   160,   161,   161,   161,   162,   162,   163,   163,   164,
     164,   165,   165,   166,   166,   167,   167,   168,   168,   168,
     169,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     169,   170,   170,   171,   172,   172,   172,   172,   173,   173,
     173,   173,   173,   173,   173,   173,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   174,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   176,   177,   177,
     177,   177,   177,   177,   177,   177,   177,   177,   177,   177,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   180,   180,   181,   181,   182,   182,
     182,   182,   182,   183,   183,   184,   185,   185,   186,   186,
     186,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   189,   189,
     189,   189,   189,   190,   190,   191,   191,   191,   192,   193,
     194,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     196,   196,   197,   197,   198,   198,   199,   200,   200,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   202,
     202,   202,   202,   202,   202,   202,   202,   203,   203,   204,
     204,   204,   204,   204,   205,   205,   206,   206,   206,   206,
     206,   207,   207,   208,   208,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   210,   210,   210,   210,
     210,   211,   211,   211,   211,   211,   211,   212,   212,   212,
     212,   212,   212,   213,   213,   213,   213,   214,   214,   214,
     214,   214,   215,   215,   215,   215,   215,   216,   217,   217,
     217,   218,   218,   218,   218,   219,   219,   219,   219,   219,
     220,   220,   221,   221,   221,   221,   222,   222,   223,   223,
     224,   224,   224,   224,   224,   224,   224,   224,   224,   224,
     224,   224,   224,   224,   225,   225,   226,   226,   227,   227,
     228,   228,   228,   229,   229,   230,   230,   231,   231,   231,
     231,   231,   231,   232,   232,   232,   233,   233,   234,   234,
     234,   235,   235,   235,   236,   237,   237,   238,   238,   239,
     239,   239,   240,   240,   240,   240,   240,   240,   240,   241,
     241,   241,   241,   241,   242,   243,   243,   244,   244,   245,
     245,   245,   245,   246,   246,   247,   247,   247,   247,   247,
     248,   248,   249,   250,   250,   251,   251,   252,   253,   253,
     253,   253,   253,   253,   254,   254,   254,   255,   255
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     4,     2,     6,     5,     6,
       5,     7,     6,     7,     6,     1,     1,     4,     3,     4,
       3,     3,     2,     2,     1,     1,     4,     3,     4,     3,
       3,     2,     2,     1,     1,     3,     3,     2,     2,     2,
       4,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     1,     3,     3,     3,
       1,     3,     3,     1,     3,     3,     2,     1,     2,     3,
       3,     3,     1,     3,     3,     1,     3,     1,     3,     1,
       3,     1,     3,     1,     3,     1,     5,     1,     3,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     2,     3,     2,     5,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     4,     5,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     4,     5,     1,     3,     1,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     1,     5,     4,
       4,     3,     5,     2,     2,     1,     2,     1,     1,     1,
       1,     1,     1,     1,     3,     3,     3,     3,     3,     3,
       1,     3,     1,     1,     1,     2,     3,     1,     3,     9,
       9,     7,     7,     5,    10,    10,     8,     8,     6,     8,
       8,     6,     6,     4,     9,     9,     7,     7,     5,     3,
       2,     2,     2,     1,     2,     1,     1,     1,     3,     1,
       2,     2,     3,     5,     2,     2,     4,     5,     7,     7,
       5,     1,     3,     1,     3,     3,     2,     3,     3,     3,
       4,     4,     2,     3,     3,     4,     3,     2,     3,     3,
       4,     1,     1,     2,     2,     2,     3,     1,     1,     2,
       2,     2,     3,     1,     2,     3,     2,     1,     3,     4,
       3,     4,     1,     2,     2,     3,     3,     2,     3,     3,
       2,     1,     1,     2,     2,     1,     2,     2,     3,     3,
       1,     2,     1,     2,     2,     3,     1,     3,     1,     3,
       2,     2,     1,     1,     1,     1,     2,     2,     3,     1,
       2,     1,     2,     2,     1,     3,     1,     2,     1,     2,
       1,     3,     4,     1,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     3,     4,     3,     1,     2,     1,     2,
       2,     1,     1,     2,     1,     2,     3,     1,     2,     5,
       7,     5,     5,     7,     6,     7,     4,     5,     4,     3,
       2,     2,     2,     3,     1,     5,     4,     5,     4,     4,
       3,     4,     3,     3,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     3,     1,     1,     3,     2,     1,     1,
       2,     2,     1,     2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,   411,    17,     7,   208,   209,   210,   211,   212,   222,
     223,   224,   225,   226,   228,   231,   232,   229,   230,   218,
     219,   221,   227,   282,   283,     0,   404,   239,   213,   216,
     215,   405,   409,   233,     0,   162,   174,   236,     8,     5,
       0,   402,   403,   156,   217,   214,   220,   158,   160,   164,
     234,     0,   235,   166,   497,     0,   392,     0,     0,   367,
       0,   352,   413,   412,   382,     0,   381,   363,   351,     0,
     325,   324,     0,   406,     0,   407,     0,   410,     0,     0,
       4,     2,     3,     6,   163,   175,     0,   157,   217,   159,
     161,   165,   167,   401,   400,     0,     8,   264,   263,     0,
       1,   390,   393,   394,   342,     0,     0,     0,   396,   398,
      35,    22,   464,     0,     0,     0,     0,     0,    73,     0,
       0,    68,     0,    71,     0,   336,    67,    69,    70,    72,
       0,    20,    36,    18,    64,    63,    74,     0,    76,    80,
      83,    87,     0,    92,    95,    97,    99,   101,   103,   105,
     123,     0,    23,    21,   355,   384,   383,   354,     0,     0,
     366,   377,     0,   380,     0,     0,     0,     0,   353,   364,
     333,     0,   331,     0,     0,   408,     0,     0,     0,   236,
      20,   270,   265,   146,   148,   150,   154,   268,   273,   272,
     271,   280,     0,   152,     0,     0,     0,     0,   316,   261,
       0,     0,     0,     0,    20,     0,     0,   156,   217,   158,
     160,   164,     0,   287,     0,   315,   284,   166,     0,    12,
     372,     0,     0,    21,   313,     0,     0,     0,   498,   391,
     395,   335,   368,   343,     0,     0,    45,    66,    65,    61,
       0,    57,    58,     0,     0,     0,     0,     0,    26,    74,
     107,   121,     0,   416,   128,   130,   134,   132,     0,    24,
     338,     0,     0,     0,    42,    43,     0,     0,     0,    59,
       0,     0,     0,     0,     0,     0,     0,    88,     0,     0,
      86,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     337,   356,   365,   344,     0,   339,     0,     0,   370,     0,
       0,   378,   379,     0,     0,     0,   326,     0,     0,   237,
     238,     0,     0,     0,   147,   217,   149,   151,   155,   153,
     266,   351,     0,    10,     9,     0,   241,   242,   243,   244,
     245,   247,   250,   251,   248,   249,   240,   246,     0,   257,
       0,   254,   186,     0,   180,   182,   184,   252,     0,   253,
     367,     0,    16,    68,     0,    20,     0,   444,     0,   475,
     478,   479,   477,   476,     0,     0,     0,   310,   367,   157,
     217,   159,   161,   165,     0,   317,   167,   385,    11,   319,
       0,   374,     0,   259,   285,     0,   314,     0,   373,   312,
     311,     0,   260,     0,   397,   399,   140,    20,     0,   418,
     136,   138,   144,   142,     0,     0,    51,    52,     0,     0,
       0,     0,     0,   217,   358,     0,   357,   200,     0,   190,
     192,   194,   196,   198,     0,     0,     0,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   110,     0,    19,
       0,   129,   131,   135,   133,   417,     0,     0,   492,     0,
     470,    64,   424,   423,     0,   484,    44,     0,   489,   485,
     495,   488,     0,     0,   472,     0,    41,    38,    54,     0,
      53,    40,     0,    77,    78,    79,    81,    82,    84,    85,
      90,    91,    89,    93,    94,    96,    98,   100,   102,   104,
       0,   345,   341,   340,   371,   369,   415,   334,   332,     0,
     330,     0,   327,    20,   268,   276,   275,   274,   354,   279,
     278,   277,   281,   325,   324,     0,     0,     0,   187,   181,
     183,   185,     0,   263,    15,   217,     0,   445,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     447,    20,     0,   436,     0,   438,   427,     0,     0,     0,
     428,   429,   430,   431,   432,     0,   286,    13,   321,     0,
     387,     0,     0,   309,     0,   320,     0,   386,   375,   288,
     376,   262,   258,    60,   141,   137,   139,   145,   143,   419,
      62,    50,    47,     0,    49,     0,   347,     0,     0,     0,
     361,   360,     0,     0,   359,     0,     0,   201,   191,   193,
     195,   197,   199,     0,     0,     0,     0,     0,   109,   108,
     122,    75,    25,   474,     0,     0,   367,   480,   481,   482,
       0,   487,   493,   491,   496,   490,   469,   471,    39,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,   303,
       0,     0,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,   460,   461,   462,     0,     0,     0,   448,
     124,   367,     0,   204,   206,   437,     0,   440,   439,   446,
     126,   468,     0,   388,     0,   318,   385,     0,   322,   389,
      48,    46,   346,   348,    28,   362,   349,     0,     0,     0,
       0,     0,     0,    30,     0,     0,     0,   473,   483,   486,
      56,    55,   106,   329,   328,   255,   256,   188,     0,     0,
       0,     0,     0,   293,     0,     0,   308,     0,     0,   435,
       0,     0,     0,     0,     0,     0,     0,   459,   463,     0,
     433,     0,     0,   125,     0,   467,   387,     0,     0,   386,
       0,   350,    27,   202,    32,     0,     0,    29,    34,     0,
       0,   301,     0,   302,   189,     0,     0,     0,     0,     0,
       0,   298,   434,     0,     0,   456,     0,     0,   458,     0,
       0,     0,   466,     0,   205,     0,   420,   207,   388,   389,
     323,   203,    31,    33,     0,     0,     0,   291,     0,   292,
       0,   306,     0,   307,     0,     0,   449,   451,   452,     0,
     457,     0,     0,   127,   465,   425,     0,   299,   300,     0,
       0,     0,     0,     0,   296,     0,   297,     0,     0,   454,
       0,     0,   421,   289,   290,   304,   305,     0,     0,   450,
     453,   455,   422,   426,   294,   295
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    35,    36,   227,    38,    39,   200,   201,   202,   203,
     131,   132,   133,   134,   452,   237,   469,   135,   136,   239,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   148,   149,   250,   251,   438,   542,   151,   667,   253,
     399,   182,   206,    42,   343,   418,   662,   663,   183,    44,
      45,    46,   184,   185,   421,   186,    50,   187,   188,   189,
     190,   191,   192,    51,   212,   213,   214,   215,   216,   374,
     375,    52,   193,   171,   172,    61,   414,   105,   415,   106,
      64,   219,    65,    66,    67,   379,   102,   221,   107,   108,
     109,   166,   258,   404,   777,   455,   806,   545,   546,   547,
     548,   549,   358,   550,   551,   552,   553,   554,   152,   555,
     222,   153,   456,   224,   457,   458,   459,   460,   461,   462,
     463,    55
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -714
static const short int yypact[] =
{
    7164,   334,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,
    -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,
    -714,  -714,  -714,  -714,  -714,    52,  -714,  -714,  -714,  -714,
    -714,   333,   550,  -714,   -82,  -714,  -714,  -714,   -27,  -714,
     139,  5987,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,
    -714,    98,  -714,  -714,   -19,   122,   528,  5806,  4918,  -714,
     257,   232,  -714,   416,   390,  6661,  -714,  -714,   357,   135,
      73,   142,   550,   550,   211,   416,   153,   416,   269,  5256,
    -714,  -714,  -714,  -714,  -714,  -714,   818,  -714,   257,  -714,
    -714,  -714,  -714,  -714,   416,  3539,   -20,  -714,   151,  5702,
    -714,  -714,   528,  -714,  -714,    31,    19,    35,   177,  -714,
    -714,  -714,  -714,  5755,  5790,  5790,  7237,  5702,  -714,  7237,
    5702,  -714,  5346,  -714,   304,  -714,  -714,  -714,  -714,  -714,
     -55,    21,  -714,  -714,   489,  -714,  -714,  5702,  -714,   237,
     405,   601,  5702,   409,   627,   204,   216,   246,   324,   -15,
    -714,   268,  -714,  -714,   232,   390,  -714,   357,  6747,  4991,
    -714,  -714,  5127,  -714,   375,   275,   214,    51,   232,  -714,
     276,   -16,  -714,   135,   135,   416,   153,   297,    26,   315,
     138,   601,  6077,  -714,  -714,  -714,  -714,   331,  -714,  -714,
    -714,  -714,   168,  -714,  7310,  6919,  1420,  7237,  -714,  -714,
     347,   347,   347,   -65,    20,   247,  5042,  -714,   211,  -714,
    -714,  -714,  3654,  -714,   161,  -714,  -714,  -714,   390,  -714,
    -714,   153,   362,   373,  -714,  4781,  3769,   315,  -714,  -714,
    -714,  -714,  -714,  -714,  7089,  5436,  -714,   551,  -714,  -714,
    5579,  -714,  -714,   198,  6167,  7383,  6257,  7383,  -714,   557,
    -714,  -714,   387,  6485,  -714,  -714,  -714,  -714,   352,   401,
    -714,  2751,  2884,   135,  -714,  -714,  4570,   135,  5702,  -714,
    5702,  5702,  5702,  5702,  5702,  5702,  5702,   601,  5702,  5702,
    -714,  5702,  5702,  5702,  5702,  5702,  5702,  5702,  5702,  5702,
    -714,   232,  -714,  -714,   417,  -714,    -4,   425,  -714,   213,
     434,  -714,  -714,   135,  5702,   135,  -714,   185,   325,  -714,
    -714,  5256,  5897,   135,  -714,   419,  -714,  -714,  -714,  -714,
    -714,   451,  5256,  -714,  -714,  5256,  -714,  -714,  -714,  -714,
    -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,   269,  -714,
     453,  -714,   457,  4937,  -714,  -714,  -714,  -714,   269,  -714,
     198,  6919,  -714,   528,  5526,    15,  7004,   464,  4414,  -714,
    -714,  -714,  -714,  -714,  4643,   535,  5702,  -714,    61,  -714,
     211,  -714,  -714,  -714,   248,  -714,  -714,   390,  -714,   -42,
     153,  -714,    51,  -714,  -714,   966,  -714,    51,  -714,  -714,
    -714,  3884,  -714,  3999,  -714,  -714,  -714,    20,   473,  6485,
    -714,  -714,  -714,  -714,   495,   135,  -714,  -714,  4585,   135,
    5702,  6575,  5702,   433,   501,   503,   518,   524,  6347,  -714,
    -714,  -714,  -714,  -714,  5702,   522,  6437,  -714,  -714,  -714,
    -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  4643,  -714,
    5702,  -714,  -714,  -714,  -714,  -714,  5702,   304,  -714,  3017,
    -714,   393,  -714,  -714,  6919,  -714,  -714,   347,  -714,  -714,
     301,  -714,  3150,   517,  -714,   519,  -714,  -714,  -714,   472,
    -714,  -714,   537,  -714,  -714,  -714,   237,   237,   405,   405,
     601,   601,   601,   409,   409,   627,   204,   216,   246,   324,
     295,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  4781,
    -714,  4781,  -714,    21,  -714,  -714,  -714,  -714,   451,  -714,
    -714,  -714,  -714,  -714,  -714,   269,  5256,    36,   132,  -714,
    -714,  -714,    43,  -714,  -714,   211,   544,  -714,  5702,   531,
     553,   570,   571,  4497,   572,   135,   538,   554,  4833,   135,
    -714,   104,   336,  -714,  5146,  -714,  -714,  2351,  2485,   555,
    -714,  -714,  -714,  -714,  -714,   559,  -714,  -714,  -714,  3283,
     390,    51,    25,  -714,  5702,  -714,    51,   390,  -714,  -714,
    -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,
    -714,  -714,  -714,   475,  -714,   552,  -714,   573,   581,   577,
     501,   518,  6833,  5702,   501,  5256,  5702,   587,  -714,  -714,
    -714,  -714,  -714,   582,   580,  5702,  5702,   584,  -714,  -714,
    -714,  -714,  -714,  -714,   569,  4643,   135,  -714,  -714,  -714,
    4643,  -714,  -714,  -714,   301,  -714,  -714,  -714,  -714,  4643,
    -714,  5702,  4114,  4229,   594,    55,   367,   347,   347,  -714,
    5256,   208,   219,   576,  -714,   583,  4497,  5702,  5702,  5614,
     653,  2187,   579,  -714,  -714,  -714,   344,   585,  4497,  -714,
    -714,    56,   349,  -714,   311,  -714,  2618,  -714,  -714,  -714,
    -714,  -714,   578,   390,   211,  -714,   596,   153,   590,   390,
    -714,  -714,  -714,  -714,  -714,   501,  -714,   603,   602,   402,
     605,  5256,  5702,  -714,   606,   608,  5702,  -714,  -714,  -714,
    -714,  -714,  -714,  -714,  -714,  -714,  -714,  -714,   -18,   -13,
     418,   347,   347,  -714,   347,   347,  -714,   326,  4497,  -714,
     477,   480,  4497,   502,   615,  4497,  2220,  -714,  -714,  5702,
    -714,  3416,   550,  -714,  4658,  -714,   596,    51,    51,   596,
    5702,  -714,  -714,  -714,  -714,   421,   610,  -714,  -714,   611,
     347,  -714,   347,  -714,  -714,    -9,    12,   167,    22,   347,
     347,  -714,  -714,  4497,  4497,  -714,  4497,  5702,  -714,  4497,
    5667,   604,  -714,   600,  -714,  4658,  -714,  -714,   596,   596,
    -714,  -714,  -714,  -714,   609,   612,   347,  -714,   347,  -714,
     347,  -714,   347,  -714,   188,    96,   672,  -714,  -714,   512,
    -714,  4497,   530,  -714,  -714,  -714,   238,  -714,  -714,   614,
     616,   618,   619,   347,  -714,   347,  -714,  4497,   613,  -714,
    4497,  4281,  -714,  -714,  -714,  -714,  -714,   620,   621,  -714,
    -714,  -714,  -714,  -714,  -714,  -714
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -714,    84,   698,   392,   690,    46,  -714,  -714,  -714,  -714,
       0,  -714,   642,   -10,  -231,  -714,   350,   644,   750,  -714,
    -714,  -111,   399,   400,   -40,  -714,   396,   476,   474,   479,
     481,   482,  -714,   858,  -257,  -714,   -78,   100,  -338,  -714,
    -714,  -249,    27,  -714,  -714,   514,  -714,    41,  1826,   699,
     398,  -714,  1402,  1920,  -145,  1487,  -124,   105,   108,   126,
     170,   454,  -468,  -177,  -215,   395,  -714,  -714,  -204,  -714,
     220,  -112,  1705,   507,   483,   -46,  -363,     4,  -208,     2,
     987,  -159,  -714,  1623,   258,   327,  -714,   827,   -58,  -714,
      16,  -714,  -714,  -714,  -713,  -349,  -714,   330,  -714,  -714,
     231,  -714,  -714,  1122,  -630,  -714,  -714,  -714,  -118,  -714,
    -714,   -76,  -714,  -714,  -714,   322,   166,   328,   335,  -714,
    -258,  -714
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -495
static const short int yytable[] =
{
      40,    59,   288,    63,   465,    62,   259,   165,   384,   470,
     391,   393,   454,   454,   154,   556,    54,   348,     2,   223,
     543,   726,   168,     2,     2,    71,   269,    41,     2,     2,
      78,    59,    59,    75,    77,   468,   352,    30,   425,   181,
      83,    86,   154,    94,   252,    93,     2,   378,   636,   346,
     590,    98,   750,   594,     2,     2,   752,    86,     2,     2,
      59,   786,   805,   260,     2,   164,   362,   357,    59,   170,
     347,    70,    59,    59,    59,   175,    59,   261,   178,   180,
       3,   788,   349,    79,    41,   205,    83,   564,    59,  -367,
      79,   792,    41,    28,  -367,   204,   770,    97,    30,    28,
     294,     2,   277,   305,    30,   637,   638,     2,   833,   544,
      99,   291,   225,   289,   492,   751,   243,   306,   252,   243,
     753,   347,   100,   347,   787,    84,     3,   689,   261,    81,
      82,    83,   232,   349,    56,   349,   223,    72,     2,   310,
      80,     2,     2,   244,   231,   789,   246,   262,   233,   223,
     223,   470,   262,   262,   366,   793,     2,    59,    40,   473,
     474,   475,   252,    72,    83,   815,   348,    59,   706,   639,
      81,    82,   710,   170,   170,   642,    59,   468,    83,   323,
      83,   609,   313,   610,    69,    41,   320,   384,   731,   384,
     472,   614,   524,   559,   342,   350,   355,   243,   521,   228,
     454,     2,   205,   587,    83,   173,   368,   608,    59,   665,
     603,   490,   204,   454,     2,   205,   205,   245,   607,   347,
     247,    59,   351,   745,   356,   204,   204,    28,   685,   816,
      95,   349,    30,   658,    40,   397,   262,   790,   480,   481,
     341,   482,   640,    83,   243,   417,   243,   417,    81,    82,
     395,   451,   451,   313,   263,   264,   265,   445,   813,   297,
       2,    41,   300,   466,   641,    72,   698,   471,   311,   154,
     262,   181,     2,   600,   174,   168,   252,   711,   712,   324,
     385,   600,   181,   226,   632,   181,   633,   325,   714,   715,
      84,   341,   386,   341,   347,   617,   234,     3,   544,   544,
     791,   672,   347,   496,   305,   170,   349,    81,    82,   112,
     454,   503,    40,    83,   349,   223,   499,   223,   500,   396,
      56,   814,   503,    72,   284,   180,   169,   302,    84,   612,
      84,   494,   585,   303,   169,   611,     2,     2,   514,    41,
     287,   713,   285,   518,   158,   261,   270,   522,   523,   159,
      83,   350,   716,   588,   355,    83,   243,   821,   541,   266,
       2,   271,   272,   267,   268,    59,    56,   562,    83,    57,
      59,   822,   701,   286,    58,   205,    80,   364,     2,   563,
      59,   205,    59,   205,   513,    28,   290,    59,   301,   341,
      30,   204,    37,   204,    97,   759,   760,    83,   700,   243,
     263,   264,   265,   579,   497,   581,   304,    28,    28,   584,
     309,    40,    30,    30,   440,   292,   504,   544,   597,   505,
     620,   278,   279,   223,   631,   223,   597,   504,   384,   384,
     509,    28,   621,    37,   292,    84,    30,   506,    41,   451,
      84,   734,    56,    56,   305,    72,    57,   261,   510,    37,
     130,    58,   451,    73,   616,   440,   501,    37,   502,   761,
     656,   322,   291,   440,   341,   446,   558,   659,   732,    57,
     177,   179,   341,   773,    58,   728,   181,   776,   707,   357,
     733,   507,   454,   574,    81,    82,   325,   179,  -414,   205,
      28,   205,   511,   389,  -414,    30,   263,   264,   265,   204,
     439,   204,   161,    83,   390,   266,   440,   162,    37,   267,
     268,    37,   589,   743,   179,   635,   180,   447,   776,   280,
     281,   325,   643,   615,   604,    59,   273,   274,    56,   754,
     491,   312,   781,   541,   687,   652,    58,   325,     2,   657,
     325,    83,    56,   493,   661,   411,   664,   541,   541,   451,
      37,   296,   495,     2,   299,   181,   223,   223,   405,   406,
     407,    59,    59,   312,   776,   515,    59,   516,    58,   720,
     721,   723,    19,    20,    37,   427,   428,   429,   430,   431,
     432,   433,   434,   435,   436,   628,   573,    37,   680,    37,
     763,   629,    40,   764,   629,   180,   440,   527,    37,   440,
     181,   266,    28,    29,   179,   267,   268,    30,   580,    28,
     451,   275,   276,   592,    30,   766,    83,   179,   179,    41,
     593,   440,   205,   205,    28,   818,    37,   179,   645,    30,
     411,   440,   204,   204,   595,    83,    37,    56,    37,   605,
     180,   282,   283,   820,    56,    37,   541,    72,   557,   440,
     626,   181,   627,   179,   179,   630,   440,   644,   541,    56,
     646,    83,    72,   408,   678,   647,   541,   409,   410,   653,
     681,   440,   476,   477,    59,   478,   479,    59,   483,   484,
     307,   308,   648,   649,   651,   654,   682,   437,   669,   799,
     670,   180,   802,   688,   683,   684,   690,   691,   693,   692,
      60,   696,   697,   179,    37,   694,   695,   705,   717,   724,
     727,   735,   718,   162,   179,   729,   741,   179,   541,   740,
     742,   451,   541,   744,   747,   541,   748,   767,   782,   783,
      74,    74,    59,   804,   664,   803,   817,    59,    59,    85,
      88,    96,   807,    37,   830,   808,   179,   823,    37,   824,
     179,   825,   826,   834,   835,   236,    88,   238,   583,   486,
     485,   426,   160,   541,   541,   487,   541,   167,   488,   541,
     489,    74,    74,   774,   160,   167,   160,   565,   666,   512,
     569,   618,   675,   179,   623,   179,   699,     0,   498,     0,
     624,    37,   746,   160,   208,     0,   749,   625,     0,     0,
       0,   541,     0,    37,     0,   160,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   541,  -367,    80,
     541,     2,     0,     0,     0,     0,     0,     0,    68,   771,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     780,   179,     0,     0,     0,     0,    37,     0,     0,     0,
       0,     0,     0,     0,   179,     0,   167,     0,    76,    76,
       0,     0,     0,   650,   241,   242,     0,     0,    68,     0,
       0,     0,   249,     0,   160,   167,     0,     0,   668,     0,
       0,   315,     0,   103,    68,     0,     0,   157,     0,     0,
       0,   179,  -367,   179,   208,    74,     0,  -367,     0,    76,
      76,   176,     0,     0,     0,   370,     0,   634,   179,     0,
       0,   208,     0,     0,     0,   157,   150,     0,     0,     0,
     387,     0,     0,     0,   208,   208,     0,    81,    82,   230,
    -367,  -367,     0,     0,     0,  -367,    37,  -367,     0,   179,
     179,     0,     0,   413,     0,   413,   249,  -367,     0,     0,
       0,   179,   315,     0,     0,     0,     0,   150,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   110,     0,     2,
     111,   112,     0,     0,     0,   150,   719,     0,   150,     0,
       0,     0,     0,     0,    37,   398,     0,   179,   730,     0,
     249,     0,     0,     0,     3,     0,   668,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   321,
       0,   315,     0,     0,     0,     0,   249,   150,   249,     0,
     150,     0,     0,    76,   179,   179,     0,     0,     0,     0,
       0,     0,   179,   380,     0,   382,     0,   116,   117,   249,
       0,     0,   315,     0,     0,     0,     0,   155,   762,     0,
     208,     0,   765,   525,     0,   768,     0,     0,   179,     0,
       0,   155,     0,     0,    74,     0,     0,     0,   119,   120,
       0,   416,     0,   416,     0,   155,     0,     0,   240,   566,
     321,   124,   218,   179,     0,     0,     0,     0,     0,     0,
     208,     0,   208,   796,   797,     0,   798,     0,   315,   800,
       0,     0,     0,     0,   249,     0,     0,     0,   249,     0,
     413,     0,     0,     0,     0,     0,     0,   413,     0,   453,
     453,     0,     0,   179,     0,   413,     0,     0,     0,     0,
       0,   819,     0,     0,     0,     0,     0,     0,     0,   321,
       0,     0,   508,     0,     0,     0,     0,   829,     0,     0,
     831,     0,     0,   370,   155,     0,     0,     0,   249,     0,
     249,     0,   150,     0,     0,     0,     0,     0,     0,     0,
     321,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     103,    76,   218,     0,     0,     0,     0,     0,   249,     0,
     249,     0,    76,   377,     0,   218,     0,   561,   208,   218,
     208,     0,     0,     0,     0,     0,     0,     0,   218,     0,
       0,     0,   218,   218,     0,     0,     0,     0,     0,     0,
       0,     0,   453,     0,   150,     0,   321,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   416,     0,
     591,     0,     0,   525,     0,   416,     0,     0,     0,     0,
       0,     0,     0,   416,     0,     0,     0,     0,     0,     0,
       0,   674,     0,     0,     0,     0,     0,     0,     0,     0,
     150,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   380,   150,   249,     0,     0,     0,     0,   249,     0,
       0,     0,     0,     0,     0,     0,     0,   249,   249,     0,
       0,     0,     0,     0,     0,     0,     0,   453,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     453,     0,   359,   360,   361,   363,     0,     0,     0,     0,
       0,   208,   208,     0,     0,     0,     0,     0,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   176,     0,     0,     0,     0,   560,     0,     0,
       0,     0,     0,   160,     0,     0,     0,   567,     0,   218,
       0,    76,     0,     0,   218,     0,   738,     0,   218,   249,
     218,     0,     0,     0,     0,     0,   150,     0,     0,   677,
       0,     0,     0,     0,     0,     0,   249,   249,   249,   249,
       0,   249,    47,     0,     0,     0,     0,     0,   249,     0,
       0,     0,     0,     0,     0,     0,   249,   453,     0,     0,
       0,   110,   150,     2,   111,   112,   113,     0,   114,   115,
       0,    74,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   377,     0,    89,     0,     0,     0,     0,     3,     0,
       0,   150,     0,     0,   150,     0,     0,     0,   101,    47,
       0,     0,     0,   150,   150,     0,     0,    47,   249,     0,
       0,     0,   249,   453,     0,   249,   249,     0,   453,     0,
       0,     0,     0,     0,   249,     0,   218,    49,   218,   702,
       0,   116,   117,   118,    28,     0,     0,   209,     0,    30,
       0,   737,     0,     0,   229,     0,     0,     0,     0,     0,
       0,     0,   155,   249,   249,     0,   249,   249,   209,   249,
     249,   209,   119,   120,   254,   249,     0,     0,    91,   353,
       0,     0,   354,   248,   123,   124,     0,     0,     0,     0,
     126,   127,   128,   129,    49,     0,     0,     0,   673,   676,
     150,   249,    49,   679,   150,     0,     0,     0,     0,    76,
      47,     0,     0,     0,     0,     0,     0,   249,     0,     0,
     249,   249,     0,     0,     0,     0,     0,     0,     0,   619,
       0,     0,   211,     0,   316,     0,     0,   150,     0,   453,
       0,     0,     0,     0,     0,     0,   345,   209,   150,   209,
       0,     0,     0,   211,     0,     0,   211,     0,   371,   256,
       0,     0,     0,     0,   209,     0,     0,     0,     0,   218,
     218,     0,     0,     0,     0,     0,     0,   209,   209,     0,
       0,     0,     0,     0,     0,     0,    47,   400,     0,     0,
       0,     0,     0,     0,     0,    49,   371,   420,   371,   420,
       0,     0,     0,     0,     0,   441,     0,     0,     0,     0,
       0,   736,     0,     0,   739,     0,     0,     0,     0,   318,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   211,   156,   211,     0,     0,     0,     0,     0,
       0,     0,     0,   373,     0,     0,     0,   156,     0,   211,
       0,     0,     0,     0,     0,    53,     0,     0,     0,     0,
       0,   156,   211,   211,    47,     0,     0,     0,   220,     0,
       0,    49,   402,     0,   778,   779,     0,     0,     0,     0,
       0,   373,   422,   373,   422,     0,     0,     0,     0,     0,
     443,     0,     0,     0,     0,   520,    92,     0,     0,     0,
       0,     0,     0,   371,     0,   101,   254,     0,   371,   708,
     709,     0,    53,     0,     0,     0,     0,     0,     0,     0,
      53,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     156,     0,     0,   209,     0,   209,     0,     0,     0,    49,
     217,   575,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    47,     0,     0,     0,     0,   220,     0,
     599,   217,     0,     0,   217,     0,    43,   257,   599,   220,
       0,   381,     0,   755,   756,   220,   757,   758,   373,     0,
       0,   256,     0,   373,   388,     0,     0,     0,   220,   220,
       0,     0,     0,     0,     0,     0,   316,     0,     0,     0,
       0,     0,     0,    53,     0,     0,     0,    87,     0,     0,
       0,     0,   784,     0,   785,     0,     0,     0,   211,     0,
     211,   794,   795,    43,     0,     0,   577,   319,     0,     0,
       0,    43,     0,     0,     0,     0,     0,     0,    49,     0,
     217,   209,   217,   209,     0,   601,     0,     0,   809,     0,
     810,   376,   811,   601,   812,     0,     0,   217,     0,     0,
      48,   207,     0,     0,     0,     0,     0,     0,     0,     0,
     217,   217,     0,     0,     0,   827,     0,   828,     0,    53,
     403,   318,   207,     0,     0,   207,   316,     0,     0,   376,
     423,   376,   423,     0,     0,     0,     0,     0,   444,     0,
       0,    90,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   220,     0,     0,    48,     0,     0,
       0,     0,     0,     0,    43,    48,   211,     0,   211,     0,
       0,     0,     0,   381,    47,     0,     0,     0,     0,     0,
       0,     0,     0,   388,     0,   568,     0,     0,   314,     0,
     570,     0,     0,     0,   220,   210,   220,    53,     0,     0,
     344,   207,     0,   207,     0,     0,     0,     0,     0,     0,
       0,   318,   369,     0,   209,   209,   210,     0,   207,   210,
       0,     0,   255,     0,     0,     0,     0,     0,     0,     0,
       0,   207,   207,     0,     0,     0,   376,     0,     0,   257,
      43,   376,     0,     0,     0,     0,     0,     0,     0,     0,
     369,   419,   369,   419,     0,     0,     0,   220,    48,    49,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   217,     0,   217,     0,
       0,     0,   317,     0,   578,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   210,    53,   210,     0,   211,
     211,     0,   220,   602,   220,     0,   372,     0,     0,     0,
       0,   602,   210,     0,     0,     0,     0,     0,    43,     0,
       0,     0,     0,     0,     0,   210,   210,     0,   156,     0,
       0,     0,     0,     0,    48,   401,     0,     0,     0,   319,
       0,     0,     0,     0,   372,     0,   372,     0,     0,   519,
       0,     0,     0,   442,     0,     0,     0,   369,     0,     0,
       0,     0,   369,     0,   568,     0,     0,     0,   110,   570,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,     0,     0,     0,   217,     0,   217,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     0,   207,     0,   207,
       0,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,    48,     0,     0,     0,     0,    43,     0,     0,
       0,     0,     0,     0,   598,     0,     0,     0,     3,   319,
       0,     0,   598,     0,     0,   220,   220,     0,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   372,     0,     0,   255,     0,   372,     0,     0,     0,
     314,     0,     0,     0,     0,     0,     0,     0,     0,   119,
     120,   116,   117,   118,     0,     0,   121,    53,     0,   122,
     725,   123,   124,     0,     0,     0,     0,   126,   127,   128,
     129,   210,     0,   210,     0,     0,     0,     0,   540,   576,
       0,     0,   119,   120,     0,   207,     0,   207,     0,   121,
       0,    48,   122,   769,   123,   124,     0,   217,   217,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,   540,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     314,     0,     0,     0,   317,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,   528,   529,   530,   531,   532,   533,   534,
     535,   536,   537,   538,     0,     0,     0,    27,    43,   210,
       0,   210,   116,   117,   118,    28,    29,     0,   539,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   119,   120,     0,     0,     0,   207,   207,
     121,     0,     0,   122,   317,   123,   124,     0,     0,     0,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,   540,   357,  -442,     0,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    48,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,   528,   529,   530,
     531,   532,   533,   534,   535,   536,   537,   538,     0,     0,
       0,    27,   210,   210,     0,     0,   116,   117,   118,    28,
      29,     0,   539,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   119,   120,     0,
       0,     0,     0,     0,   121,     0,     0,   122,     0,   123,
     124,     0,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   540,   357,  -441,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
     528,   529,   530,   531,   532,   533,   534,   535,   536,   537,
     538,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,   539,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,     0,   123,   124,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   540,
     357,  -443,   110,     0,     2,   111,   112,   113,     0,   114,
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
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,   448,   449,   450,   110,     0,     2,   111,   112,
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
       0,     0,     0,   121,     0,     0,   122,     0,   123,   124,
       0,     0,     0,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,   448,   449,   464,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   116,   117,
     118,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,     0,     0,   121,     0,     0,   122,
       0,   123,   124,     0,     0,     0,     0,   126,   127,   128,
     129,     0,     0,     0,     0,     0,     0,     0,   448,   449,
     613,   110,     0,     2,   111,   112,   113,     0,   114,   115,
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
       0,     0,   122,     0,   123,   124,     0,     0,     0,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,   622,   449,  -494,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,     0,   123,   124,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   448,   449,   671,   110,     0,     2,
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
     110,     0,     2,   111,   112,     0,     0,   448,   449,   772,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   194,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   195,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   196,     0,   197,   124,   110,     0,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     198,     0,   199,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   194,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   195,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   196,     0,   197,   124,
     110,     0,     2,   111,   112,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   198,     0,   383,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   194,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   195,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   196,     0,   197,   124,   110,     0,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     198,     0,   392,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   194,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   195,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   196,     0,   197,   124,
     110,     0,     2,   111,   112,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   198,     0,   571,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   194,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   195,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   196,     0,   197,   124,   110,     0,     2,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     198,     0,   572,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   194,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   195,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   196,     0,   197,   124,
     110,     0,     2,   111,   112,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   198,     0,   703,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,    27,     0,   194,     0,     0,
     116,   117,     0,    28,    29,     0,     0,   195,    30,     3,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,    56,     0,
       0,   196,     0,   197,   124,     0,     0,     0,     0,     0,
       0,     0,   116,   117,   118,     0,     0,     0,     0,     0,
     198,     0,   704,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,     0,   123,   124,     0,     0,     0,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,     0,   775,   832,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,   528,   529,   530,   531,
     532,   533,   534,   535,   536,   537,   538,     0,     0,     0,
      27,     0,     0,     0,     0,   116,   117,   118,    28,    29,
       0,   539,     0,    30,     0,     0,     0,     0,   110,    33,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     3,   122,     0,   123,   124,
       0,     0,     0,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,   540,   357,     0,     0,   528,
     529,   530,   531,   532,   533,   534,   535,   536,   537,   538,
       0,     0,     0,     0,     0,     0,     0,     0,   116,   117,
     118,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     3,   119,
     120,     0,     0,     0,     0,     0,   121,     0,     0,   122,
       0,   123,   124,     3,     0,     0,     0,   126,   127,   128,
     129,     0,     0,     0,     0,     0,     0,     0,   540,   357,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   116,   117,   118,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,   116,   117,   118,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     3,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,   467,   123,   124,     3,   119,   120,     0,
     126,   127,   128,   129,   121,     0,     0,   122,   582,   123,
     124,     0,   449,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,   116,   117,   118,   449,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   116,
     117,   118,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,     0,   123,   124,     0,
     119,   120,     0,   126,   127,   128,   129,   121,     0,     0,
     122,     0,   123,   124,     0,   449,     0,     0,   126,   127,
     128,   129,   110,     0,     2,   111,   112,     0,     0,     0,
     775,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,    27,     0,   194,
       0,     0,   116,   117,     0,    28,    29,     0,     0,   195,
      30,     3,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   119,   120,     0,     0,     0,     0,     0,
      56,     0,     0,   196,     0,   197,   124,     0,     0,     0,
       0,     0,     0,     0,   116,   117,   118,     0,     0,     0,
       0,     0,   198,     0,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,   119,   120,     0,     0,     0,
       2,     0,   121,     0,     0,   122,     3,   123,   124,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   655,     3,     4,     5,     6,     7,
       8,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,    19,    20,   336,   337,    23,    24,   338,     0,   116,
     117,   118,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,   339,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     3,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,     0,   123,   124,     0,     0,   125,   340,   126,   127,
     128,   129,     0,     0,     0,     2,    56,     0,     0,   312,
       0,     0,     0,     0,    58,     0,     0,     0,     0,     0,
       0,     0,   116,   117,   118,     0,     0,     0,     0,   517,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,     0,   123,   124,     0,    27,   295,
       0,   126,   127,   128,   129,     0,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,    33,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     2,
       0,    56,     0,     0,   365,     3,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   366,     0,   367,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,     0,   119,
     120,    33,     0,     0,     0,     0,   121,     0,     0,   122,
       0,   123,   124,     0,     0,   298,    34,   126,   127,   128,
     129,     0,     0,     0,     0,    56,     0,   110,    72,     2,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   660,     0,     0,
       0,     0,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,   116,   117,   118,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,    34,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,   122,     0,
     123,   124,     0,     0,     3,     0,   126,   127,   128,   129,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,   116,   117,   118,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,    34,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,   122,   248,
     123,   124,     0,     0,     3,     0,   126,   127,   128,   129,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,   116,   117,   118,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,    34,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,   240,   248,
     123,   124,     0,     0,     3,     0,   126,   127,   128,   129,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,    27,     0,     0,     0,     0,   116,   117,   118,
      28,    29,     0,     0,     0,    30,     0,     3,     0,     0,
       0,    33,     0,     0,     0,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,    34,     0,   119,   120,
       0,     0,     0,     0,     0,   353,     0,     0,   354,   248,
     123,   124,     3,     0,     0,     0,   126,   127,   128,   129,
     116,   117,   118,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,   119,   120,     0,     0,   116,   117,   118,   121,     0,
       0,   122,   248,   123,   124,     3,     0,     0,     0,   126,
     127,   128,   129,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     0,   122,   722,   123,   124,
       3,     0,     0,     0,   126,   127,   128,   129,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,   119,
     120,     0,     0,   116,   117,   118,   121,     0,     0,   122,
     801,   123,   124,     3,     0,     0,     0,   126,   127,   128,
     129,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,   119,   120,     0,     1,     0,     2,
       0,   121,     0,     0,   122,     0,   123,   124,     3,     0,
       0,     0,   126,   127,   128,   129,   116,   117,   118,     0,
       0,     0,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,   119,   120,     0,
       0,   116,   117,   118,   121,     0,     0,   235,     0,   123,
     124,    26,    27,     0,     0,   126,   127,   128,   129,     0,
      28,    29,     0,     0,     0,    30,     0,     0,    31,    32,
       0,    33,   119,   120,     0,     0,     0,     0,     1,   121,
       2,     0,   240,     0,   123,   124,    34,     0,     0,     0,
     126,   127,   128,   129,     0,    56,     0,     0,    57,   104,
       0,     0,     0,    58,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   312,
     104,     0,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,    57,
       0,     0,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   312,
       0,     0,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   411,
       0,     0,     0,     0,   412,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   411,
       0,     0,     0,     0,   424,     3,     4,     5,     6,     7,
       8,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,    19,    20,   336,   337,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   339,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,   340,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   411,
       0,     0,     0,     0,   596,     3,     4,     5,     6,     7,
       8,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,    19,    20,   336,   337,    23,    24,    25,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   339,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     3,     0,     0,    30,     0,     0,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,   340,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   411,
       0,    27,     0,     0,   606,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     1,     0,     2,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,    56,     0,     0,   312,     0,     0,
       0,     0,    58,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,     1,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,    56,     0,     0,   411,   586,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,    31,    32,     0,    33,     0,     1,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   163,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     1,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     293,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,    31,    32,     0,    33,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   686,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,    72,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       1,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   526,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
     394,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     1,     0,     2,    30,     0,
       0,    31,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       2,     0,     0,    30,     0,     0,    31,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     2,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     3,     4,
       5,     6,     7,     8,   326,   327,   328,   329,   330,   331,
     332,   333,   334,   335,    19,    20,   336,   337,    23,    24,
     338,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   339,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     2,     0,     0,    30,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     340,     3,     4,     5,     6,     7,     8,   326,   327,   328,
     329,   330,   331,   332,   333,   334,   335,    19,    20,   336,
     337,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   339,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   340
};

static const short int yycheck[] =
{
       0,     1,    17,     1,   262,     1,   124,    65,   212,   266,
     225,   226,   261,   262,    60,   364,     0,   194,     3,    95,
     358,   651,    68,     3,     3,    25,   137,     0,     3,     3,
     112,    31,    32,    31,    32,   266,   195,    79,   246,    79,
      40,    41,    88,    41,   122,    41,     3,   206,   516,   194,
     413,    51,    70,   416,     3,     3,    69,    57,     3,     3,
      60,    70,   775,   118,     3,    65,   131,   132,    68,    69,
     194,    25,    72,    73,    74,    73,    76,   132,    78,    79,
      28,    69,   194,   110,    57,    95,    86,   129,    88,    74,
     110,    69,    65,    74,    79,    95,   726,    51,    79,    74,
     158,     3,   142,   119,    79,    69,    70,     3,   821,   358,
     129,   157,   132,   128,   118,   133,   116,   133,   196,   119,
     133,   245,     0,   247,   133,    41,    28,   595,   132,   109,
     110,   131,   113,   245,   109,   247,   212,   112,     3,   113,
       1,     3,     3,   116,   113,   133,   119,   132,   113,   225,
     226,   408,   132,   132,   129,   133,     3,   157,   158,   270,
     271,   272,   240,   112,   164,    69,   343,   167,   113,   133,
     109,   110,   640,   173,   174,   132,   176,   408,   178,    11,
     180,   438,   182,   440,   132,   158,   182,   391,   132,   393,
     268,   449,   351,   132,   194,   195,   196,   197,   343,    99,
     449,     3,   212,   411,   204,   132,   206,   438,   208,   547,
     418,   289,   212,   462,     3,   225,   226,   117,   426,   343,
     120,   221,   195,   691,   197,   225,   226,    74,   591,   133,
     132,   343,    79,   129,   234,   235,   132,    70,   278,   279,
     194,   281,   110,   243,   244,   245,   246,   247,   109,   110,
     234,   261,   262,   253,     7,     8,     9,   253,    70,   159,
       3,   234,   162,   263,   132,   112,   615,   267,   130,   315,
     132,   311,     3,   418,   132,   321,   354,    69,    70,   111,
     119,   426,   322,   132,   499,   325,   501,   119,    69,    70,
     206,   245,   131,   247,   418,   454,   119,    28,   547,   548,
     133,   559,   426,   303,   119,   305,   418,   109,   110,     5,
     559,   311,   312,   313,   426,   391,   131,   393,   133,   235,
     109,   133,   322,   112,   120,   325,    68,   113,   244,   447,
     246,   118,   410,   119,    76,   446,     3,     3,   338,   312,
      16,   133,   126,   343,   112,   132,   109,   343,   348,   117,
     350,   351,   133,   411,   354,   355,   356,   119,   358,   112,
       3,   124,   125,   116,   117,   365,   109,   119,   368,   112,
     370,   133,   629,   127,   117,   385,     1,   130,     3,   131,
     380,   391,   382,   393,   338,    74,   118,   387,   113,   343,
      79,   391,     0,   393,   348,    69,    70,   397,   629,   399,
       7,     8,     9,   399,   304,   405,   130,    74,    74,   409,
     113,   411,    79,    79,   119,   157,   311,   666,   418,   311,
     119,    12,    13,   499,   129,   501,   426,   322,   632,   633,
     322,    74,   131,    41,   176,   351,    79,   311,   411,   449,
     356,   130,   109,   109,   119,   112,   112,   132,   322,    57,
      58,   117,   462,   120,   454,   119,   131,    65,   133,   133,
     538,   130,   508,   119,   418,   113,   366,   131,   119,   112,
      78,    79,   426,   731,   117,   131,   516,   734,   111,   132,
     131,   311,   731,   399,   109,   110,   119,    95,   113,   499,
      74,   501,   322,   131,   119,    79,     7,     8,     9,   499,
     113,   501,   112,   503,   131,   112,   119,   117,   116,   116,
     117,   119,   412,   111,   122,   515,   516,   116,   775,   110,
     111,   119,   522,   130,   424,   525,   121,   122,   109,   111,
     113,   112,   111,   533,   592,   535,   117,   119,     3,   539,
     119,   541,   109,   118,   544,   112,   544,   547,   548,   559,
     158,   159,   118,     3,   162,   595,   632,   633,     7,     8,
       9,   561,   562,   112,   821,   112,   566,   110,   117,   647,
     648,   649,    44,    45,   182,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,   113,   113,   195,   113,   197,
     113,   119,   592,   113,   119,   595,   119,   133,   206,   119,
     640,   112,    74,    75,   212,   116,   117,    79,   113,    74,
     620,    10,    11,   112,    79,   113,   616,   225,   226,   592,
     117,   119,   632,   633,    74,   113,   234,   235,   528,    79,
     112,   119,   632,   633,   110,   635,   244,   109,   246,   117,
     640,    14,    15,   113,   109,   253,   646,   112,   113,   119,
     133,   691,   133,   261,   262,   118,   119,   113,   658,   109,
     129,   661,   112,   112,   564,   112,   666,   116,   117,   131,
     118,   119,   273,   274,   674,   275,   276,   677,   282,   283,
     173,   174,   112,   112,   112,   131,   113,   130,   133,   767,
     131,   691,   770,   593,   113,   118,   596,   110,   118,   117,
       1,   117,   133,   311,   312,   605,   606,   113,   132,    56,
     131,   133,   129,   117,   322,   130,   113,   325,   718,   129,
     118,   731,   722,   118,   118,   725,   118,   112,   118,   118,
      31,    32,   732,   133,   732,   131,    64,   737,   738,    41,
      41,    51,   133,   351,   131,   133,   354,   133,   356,   133,
     358,   133,   133,   133,   133,   113,    57,   113,   408,   285,
     284,   247,    63,   763,   764,   286,   766,    68,   287,   769,
     288,    72,    73,   732,    75,    76,    77,   379,   547,   325,
     385,   454,   562,   391,   462,   393,   620,    -1,   305,    -1,
     462,   399,   692,    94,    95,    -1,   696,   462,    -1,    -1,
      -1,   801,    -1,   411,    -1,   106,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   817,     0,     1,
     820,     3,    -1,    -1,    -1,    -1,    -1,    -1,     1,   729,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     740,   449,    -1,    -1,    -1,    -1,   454,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   462,    -1,   157,    -1,    31,    32,
      -1,    -1,    -1,   533,   114,   115,    -1,    -1,    41,    -1,
      -1,    -1,   122,    -1,   175,   176,    -1,    -1,   548,    -1,
      -1,   182,    -1,    56,    57,    -1,    -1,    60,    -1,    -1,
      -1,   499,    74,   501,   195,   196,    -1,    79,    -1,    72,
      73,    74,    -1,    -1,    -1,   206,    -1,   515,   516,    -1,
      -1,   212,    -1,    -1,    -1,    88,    58,    -1,    -1,    -1,
     221,    -1,    -1,    -1,   225,   226,    -1,   109,   110,   102,
     112,   113,    -1,    -1,    -1,   117,   544,   119,    -1,   547,
     548,    -1,    -1,   244,    -1,   246,   196,   129,    -1,    -1,
      -1,   559,   253,    -1,    -1,    -1,    -1,    99,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,   117,   646,    -1,   120,    -1,
      -1,    -1,    -1,    -1,   592,   235,    -1,   595,   658,    -1,
     240,    -1,    -1,    -1,    28,    -1,   666,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,
      -1,   312,    -1,    -1,    -1,    -1,   266,   159,   268,    -1,
     162,    -1,    -1,   196,   632,   633,    -1,    -1,    -1,    -1,
      -1,    -1,   640,   206,    -1,   208,    -1,    71,    72,   289,
      -1,    -1,   343,    -1,    -1,    -1,    -1,    60,   718,    -1,
     351,    -1,   722,   354,    -1,   725,    -1,    -1,   666,    -1,
      -1,    74,    -1,    -1,   365,    -1,    -1,    -1,   102,   103,
      -1,   244,    -1,   246,    -1,    88,    -1,    -1,   112,   380,
     253,   115,    95,   691,    -1,    -1,    -1,    -1,    -1,    -1,
     391,    -1,   393,   763,   764,    -1,   766,    -1,   399,   769,
      -1,    -1,    -1,    -1,   354,    -1,    -1,    -1,   358,    -1,
     411,    -1,    -1,    -1,    -1,    -1,    -1,   418,    -1,   261,
     262,    -1,    -1,   731,    -1,   426,    -1,    -1,    -1,    -1,
      -1,   801,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   312,
      -1,    -1,   315,    -1,    -1,    -1,    -1,   817,    -1,    -1,
     820,    -1,    -1,   454,   167,    -1,    -1,    -1,   408,    -1,
     410,    -1,   304,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     343,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     353,   354,   195,    -1,    -1,    -1,    -1,    -1,   438,    -1,
     440,    -1,   365,   206,    -1,   208,    -1,   370,   499,   212,
     501,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   221,    -1,
      -1,    -1,   225,   226,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   364,    -1,   366,    -1,   399,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   411,    -1,
     413,    -1,    -1,   544,    -1,   418,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   426,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   562,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     412,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   454,   424,   533,    -1,    -1,    -1,    -1,   538,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   547,   548,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   449,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     462,    -1,   200,   201,   202,   203,    -1,    -1,    -1,    -1,
      -1,   632,   633,    -1,    -1,    -1,    -1,    -1,   351,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   525,    -1,    -1,    -1,    -1,   370,    -1,    -1,
      -1,    -1,    -1,   664,    -1,    -1,    -1,   380,    -1,   382,
      -1,   544,    -1,    -1,   387,    -1,   677,    -1,   391,   629,
     393,    -1,    -1,    -1,    -1,    -1,   528,    -1,    -1,   562,
      -1,    -1,    -1,    -1,    -1,    -1,   646,   647,   648,   649,
      -1,   651,     0,    -1,    -1,    -1,    -1,    -1,   658,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   666,   559,    -1,    -1,
      -1,     1,   564,     3,     4,     5,     6,    -1,     8,     9,
      -1,   732,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   454,    -1,    41,    -1,    -1,    -1,    -1,    28,    -1,
      -1,   593,    -1,    -1,   596,    -1,    -1,    -1,    56,    57,
      -1,    -1,    -1,   605,   606,    -1,    -1,    65,   718,    -1,
      -1,    -1,   722,   615,    -1,   725,   726,    -1,   620,    -1,
      -1,    -1,    -1,    -1,   734,    -1,   499,     0,   501,   631,
      -1,    71,    72,    73,    74,    -1,    -1,    95,    -1,    79,
      -1,   674,    -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   525,   763,   764,    -1,   766,   767,   116,   769,
     770,   119,   102,   103,   122,   775,    -1,    -1,    41,   109,
      -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,    -1,
     120,   121,   122,   123,    57,    -1,    -1,    -1,   561,   562,
     692,   801,    65,   566,   696,    -1,    -1,    -1,    -1,   732,
     158,    -1,    -1,    -1,    -1,    -1,    -1,   817,    -1,    -1,
     820,   821,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   457,
      -1,    -1,    95,    -1,   182,    -1,    -1,   729,    -1,   731,
      -1,    -1,    -1,    -1,    -1,    -1,   194,   195,   740,   197,
      -1,    -1,    -1,   116,    -1,    -1,   119,    -1,   206,   122,
      -1,    -1,    -1,    -1,   212,    -1,    -1,    -1,    -1,   632,
     633,    -1,    -1,    -1,    -1,    -1,    -1,   225,   226,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   234,   235,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   158,   244,   245,   246,   247,
      -1,    -1,    -1,    -1,    -1,   253,    -1,    -1,    -1,    -1,
      -1,   674,    -1,    -1,   677,    -1,    -1,    -1,    -1,   182,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   195,    60,   197,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   206,    -1,    -1,    -1,    74,    -1,   212,
      -1,    -1,    -1,    -1,    -1,     0,    -1,    -1,    -1,    -1,
      -1,    88,   225,   226,   312,    -1,    -1,    -1,    95,    -1,
      -1,   234,   235,    -1,   737,   738,    -1,    -1,    -1,    -1,
      -1,   244,   245,   246,   247,    -1,    -1,    -1,    -1,    -1,
     253,    -1,    -1,    -1,    -1,   343,    41,    -1,    -1,    -1,
      -1,    -1,    -1,   351,    -1,   353,   354,    -1,   356,   637,
     638,    -1,    57,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     167,    -1,    -1,   391,    -1,   393,    -1,    -1,    -1,   312,
      95,   399,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   411,    -1,    -1,    -1,    -1,   195,    -1,
     418,   116,    -1,    -1,   119,    -1,     0,   122,   426,   206,
      -1,   208,    -1,   711,   712,   212,   714,   715,   351,    -1,
      -1,   354,    -1,   356,   221,    -1,    -1,    -1,   225,   226,
      -1,    -1,    -1,    -1,    -1,    -1,   454,    -1,    -1,    -1,
      -1,    -1,    -1,   158,    -1,    -1,    -1,    41,    -1,    -1,
      -1,    -1,   750,    -1,   752,    -1,    -1,    -1,   391,    -1,
     393,   759,   760,    57,    -1,    -1,   399,   182,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    -1,   411,    -1,
     195,   499,   197,   501,    -1,   418,    -1,    -1,   786,    -1,
     788,   206,   790,   426,   792,    -1,    -1,   212,    -1,    -1,
       0,    95,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     225,   226,    -1,    -1,    -1,   813,    -1,   815,    -1,   234,
     235,   454,   116,    -1,    -1,   119,   544,    -1,    -1,   244,
     245,   246,   247,    -1,    -1,    -1,    -1,    -1,   253,    -1,
      -1,    41,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   351,    -1,    -1,    57,    -1,    -1,
      -1,    -1,    -1,    -1,   158,    65,   499,    -1,   501,    -1,
      -1,    -1,    -1,   370,   592,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   380,    -1,   382,    -1,    -1,   182,    -1,
     387,    -1,    -1,    -1,   391,    95,   393,   312,    -1,    -1,
     194,   195,    -1,   197,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   544,   206,    -1,   632,   633,   116,    -1,   212,   119,
      -1,    -1,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   225,   226,    -1,    -1,    -1,   351,    -1,    -1,   354,
     234,   356,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     244,   245,   246,   247,    -1,    -1,    -1,   454,   158,   592,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   391,    -1,   393,    -1,
      -1,    -1,   182,    -1,   399,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   195,   411,   197,    -1,   632,
     633,    -1,   499,   418,   501,    -1,   206,    -1,    -1,    -1,
      -1,   426,   212,    -1,    -1,    -1,    -1,    -1,   312,    -1,
      -1,    -1,    -1,    -1,    -1,   225,   226,    -1,   525,    -1,
      -1,    -1,    -1,    -1,   234,   235,    -1,    -1,    -1,   454,
      -1,    -1,    -1,    -1,   244,    -1,   246,    -1,    -1,   343,
      -1,    -1,    -1,   253,    -1,    -1,    -1,   351,    -1,    -1,
      -1,    -1,   356,    -1,   561,    -1,    -1,    -1,     1,   566,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   499,    -1,   501,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,   391,    -1,   393,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,   312,    -1,    -1,    -1,    -1,   411,    -1,    -1,
      -1,    -1,    -1,    -1,   418,    -1,    -1,    -1,    28,   544,
      -1,    -1,   426,    -1,    -1,   632,   633,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   351,    -1,    -1,   354,    -1,   356,    -1,    -1,    -1,
     454,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    71,    72,    73,    -1,    -1,   109,   592,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,    -1,   120,   121,   122,
     123,   391,    -1,   393,    -1,    -1,    -1,    -1,   131,   399,
      -1,    -1,   102,   103,    -1,   499,    -1,   501,    -1,   109,
      -1,   411,   112,   113,   114,   115,    -1,   632,   633,    -1,
     120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   131,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     544,    -1,    -1,    -1,   454,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    66,   592,   499,
      -1,   501,    71,    72,    73,    74,    75,    -1,    77,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,   632,   633,
     109,    -1,    -1,   112,   544,   114,   115,    -1,    -1,    -1,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   131,   132,   133,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   592,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,   632,   633,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    77,    -1,    79,    -1,    -1,    -1,    -1,    -1,
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
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,
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
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   131,   132,   133,     1,    -1,     3,     4,     5,
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
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,   132,   133,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,    -1,    -1,    -1,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,   132,
     133,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
      -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,    -1,
     120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   131,   132,   133,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
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
       1,    -1,     3,     4,     5,    -1,    -1,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    28,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
     131,    -1,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   132,   133,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    77,    -1,    79,    -1,    -1,    -1,    -1,     1,    85,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    28,   112,    -1,   114,   115,
      -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,   132,    -1,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    28,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,    28,    -1,    -1,    -1,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,   132,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,   114,   115,    28,   102,   103,    -1,
     120,   121,   122,   123,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   132,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     102,   103,    -1,   120,   121,   122,   123,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   132,    -1,    -1,   120,   121,
     122,   123,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    28,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
       3,    -1,   109,    -1,    -1,   112,    28,   114,   115,    -1,
      -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   131,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,   118,   100,   120,   121,
     122,   123,    -1,    -1,    -1,     3,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,   132,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    66,   118,
      -1,   120,   121,   122,   123,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,   109,    -1,    -1,   112,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   129,    -1,   131,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,   102,
     103,    85,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,    -1,   118,   100,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,   109,    -1,     1,   112,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,    -1,    28,    -1,   120,   121,   122,   123,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
     114,   115,    -1,    -1,    28,    -1,   120,   121,   122,   123,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
     114,   115,    -1,    -1,    28,    -1,   120,   121,   122,   123,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    28,    -1,    -1,
      -1,    85,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
     114,   115,    28,    -1,    -1,    -1,   120,   121,   122,   123,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    71,    72,    73,   109,    -1,
      -1,   112,   113,   114,   115,    28,    -1,    -1,    -1,   120,
     121,   122,   123,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,   113,   114,   115,
      28,    -1,    -1,    -1,   120,   121,   122,   123,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    71,    72,    73,   109,    -1,    -1,   112,
     113,   114,   115,    28,    -1,    -1,    -1,   120,   121,   122,
     123,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,   102,   103,    -1,     1,    -1,     3,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,    28,    -1,
      -1,    -1,   120,   121,   122,   123,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,   102,   103,    -1,
      -1,    71,    72,    73,   109,    -1,    -1,   112,    -1,   114,
     115,    65,    66,    -1,    -1,   120,   121,   122,   123,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,   102,   103,    -1,    -1,    -1,    -1,     1,   109,
       3,    -1,   112,    -1,   114,   115,   100,    -1,    -1,    -1,
     120,   121,   122,   123,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    28,    -1,    -1,    79,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    66,    -1,    -1,   117,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
      -1,    -1,   117,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    28,
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
      83,    -1,    85,    -1,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     113,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     1,    -1,     3,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       3,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,     3,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100
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
     190,   197,   205,   206,   224,   255,   109,   112,   117,   144,
     183,   209,   211,   213,   214,   216,   217,   218,   221,   132,
     139,   144,   112,   120,   183,   213,   221,   213,   112,   110,
       1,   109,   110,   144,   135,   136,   144,   182,   183,   186,
     187,   189,   206,   211,   213,   132,   138,   139,   144,   129,
       0,   186,   220,   221,   113,   211,   213,   222,   223,   224,
       1,     4,     5,     6,     8,     9,    71,    72,    73,   102,
     103,   109,   112,   114,   115,   118,   120,   121,   122,   123,
     137,   144,   145,   146,   147,   151,   152,   154,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   171,   242,   245,   209,   214,   217,   221,   112,   117,
     183,   112,   117,   113,   144,   222,   225,   183,   209,   218,
     144,   207,   208,   132,   132,   213,   221,   137,   144,   137,
     144,   158,   175,   182,   186,   187,   189,   191,   192,   193,
     194,   195,   196,   206,    68,    78,   112,   114,   131,   133,
     140,   141,   142,   143,   144,   147,   176,   182,   183,   186,
     187,   189,   198,   199,   200,   201,   202,   206,   214,   215,
     217,   221,   244,   245,   247,   132,   132,   137,   171,   186,
     221,   113,   113,   113,   119,   112,   146,   149,   151,   153,
     112,   152,   152,   144,   176,   171,   176,   171,   113,   152,
     167,   168,   170,   173,   186,   187,   189,   206,   226,   242,
     118,   132,   132,     7,     8,     9,   112,   116,   117,   155,
     109,   124,   125,   121,   122,    10,    11,   158,    12,    13,
     110,   111,    14,    15,   120,   126,   127,    16,    17,   128,
     118,   209,   218,   113,   222,   118,   137,   171,   118,   137,
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
     117,   112,   117,   183,   210,   212,   221,   144,   179,   182,
     186,   188,   189,   206,   117,   212,   179,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   130,   169,   113,
     119,   186,   187,   189,   206,   211,   113,   116,   131,   132,
     133,   147,   148,   167,   175,   229,   246,   248,   249,   250,
     251,   252,   253,   254,   133,   254,   144,   113,   148,   150,
     168,   144,   170,   155,   155,   155,   156,   156,   157,   157,
     158,   158,   158,   160,   160,   161,   162,   163,   164,   165,
     170,   113,   118,   118,   118,   118,   144,   171,   208,   131,
     133,   131,   133,   144,   191,   192,   193,   194,   221,   192,
     193,   194,   195,   139,   144,   112,   110,   132,   144,   182,
     186,   188,   211,   144,   215,   183,   112,   133,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    77,
     131,   144,   170,   172,   175,   231,   232,   233,   234,   235,
     237,   238,   239,   240,   241,   243,   229,   113,   171,   132,
     214,   221,   119,   131,   129,   184,   183,   214,   217,   199,
     217,   133,   133,   113,   135,   186,   187,   189,   206,   211,
     113,   144,   113,   150,   144,   170,   113,   212,   222,   171,
     210,   221,   112,   117,   210,   110,   117,   144,   182,   186,
     188,   189,   206,   212,   171,   117,   117,   212,   148,   168,
     168,   155,   242,   133,   254,   130,   144,   215,   219,   237,
     119,   131,   131,   249,   251,   252,   133,   133,   113,   119,
     118,   129,   198,   198,   137,   144,   196,    69,    70,   133,
     110,   132,   132,   144,   113,   171,   129,   112,   112,   112,
     231,   112,   144,   131,   131,   131,   170,   144,   129,   131,
     131,   144,   180,   181,   213,   172,   234,   172,   231,   133,
     131,   133,   254,   214,   183,   204,   214,   221,   171,   214,
     113,   118,   113,   113,   118,   210,   113,   222,   171,   196,
     171,   110,   117,   118,   171,   171,   117,   133,   229,   250,
     148,   168,   167,   133,   133,   113,   113,   111,   237,   237,
     196,    69,    70,   133,    69,    70,   133,   132,   129,   231,
     170,   170,   113,   170,    56,   113,   238,   131,   131,   130,
     231,   132,   119,   131,   130,   133,   214,   221,   183,   214,
     129,   113,   118,   111,   118,   196,   171,   118,   118,   171,
      70,   133,    69,   133,   111,   237,   237,   237,   237,    69,
      70,   133,   231,   113,   113,   231,   113,   112,   231,   113,
     238,   171,   133,   254,   181,   132,   168,   228,   214,   214,
     171,   111,   118,   118,   237,   237,    70,   133,    69,   133,
      70,   133,    69,   133,   237,   237,   231,   231,   231,   170,
     231,   113,   170,   131,   133,   228,   230,   133,   133,   237,
     237,   237,   237,    70,   133,    69,   133,    64,   113,   231,
     113,   119,   133,   133,   133,   133,   133,   237,   237,   231,
     131,   231,   133,   228,   133,   133
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
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), null); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:
#line 359 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), (yyvsp[-2].string)); delete (yyvsp[-2].string); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:
#line 361 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 27:
#line 363 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:
#line 364 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:
#line 365 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:
#line 366 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:
#line 367 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:
#line 368 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:
#line 369 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:
#line 370 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:
#line 371 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 37:
#line 376 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:
#line 377 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:
#line 378 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:
#line 379 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:
#line 380 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:
#line 381 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:
#line 382 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:
#line 386 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:
#line 392 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:
#line 393 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:
#line 394 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:
#line 395 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:
#line 396 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:
#line 397 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:
#line 398 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:
#line 402 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 54:
#line 403 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 55:
#line 404 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 56:
#line 405 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 57:
#line 409 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:
#line 410 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:
#line 411 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:
#line 412 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:
#line 413 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:
#line 414 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:
#line 428 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 68:
#line 429 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 69:
#line 430 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 70:
#line 431 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 71:
#line 432 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 72:
#line 433 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 73:
#line 434 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 75:
#line 439 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:
#line 444 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:
#line 445 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:
#line 446 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:
#line 451 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:
#line 452 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:
#line 457 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:
#line 458 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:
#line 463 "type.y"
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   ;}
    break;

  case 88:
#line 471 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:
#line 472 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:
#line 473 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:
#line 474 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:
#line 479 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:
#line 480 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:
#line 485 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:
#line 490 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 100:
#line 495 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 102:
#line 500 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 104:
#line 505 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 106:
#line 510 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 108:
#line 515 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:
#line 516 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 110:
#line 520 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 111:
#line 521 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 112:
#line 522 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 113:
#line 523 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 114:
#line 524 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 115:
#line 525 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 116:
#line 526 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 117:
#line 527 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 118:
#line 528 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 119:
#line 529 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 120:
#line 530 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 121:
#line 534 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 122:
#line 535 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 124:
#line 543 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 125:
#line 544 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 126:
#line 545 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 127:
#line 546 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
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
#line 564 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 135:
#line 565 "type.y"
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
#line 577 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 145:
#line 578 "type.y"
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
#line 590 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 155:
#line 591 "type.y"
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
#line 605 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 167:
#line 606 "type.y"
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
#line 620 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 179:
#line 621 "type.y"
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
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 185:
#line 687 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 186:
#line 688 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 187:
#line 689 "type.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 188:
#line 691 "type.y"
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

  case 189:
#line 709 "type.y"
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
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 199:
#line 734 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 200:
#line 735 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 201:
#line 736 "type.y"
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id));}
    break;

  case 202:
#line 738 "type.y"
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

  case 203:
#line 756 "type.y"
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

  case 204:
#line 855 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 205:
#line 856 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 206:
#line 860 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 207:
#line 861 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 208:
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 209:
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 210:
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 211:
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 212:
#line 869 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 213:
#line 873 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 215:
#line 878 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 216:
#line 883 "type.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 217:
#line 884 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].string)); delete (yyvsp[0].string); ;}
    break;

  case 218:
#line 888 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 219:
#line 889 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 220:
#line 890 "type.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 221:
#line 895 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 222:
#line 896 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 223:
#line 897 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 224:
#line 898 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 225:
#line 899 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 226:
#line 900 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 227:
#line 901 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 228:
#line 902 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 229:
#line 903 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 230:
#line 904 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 231:
#line 905 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 232:
#line 906 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 233:
#line 907 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 237:
#line 911 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 238:
#line 912 "type.y"
    { DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 239:
#line 913 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 240:
#line 917 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 241:
#line 918 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 242:
#line 919 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 243:
#line 920 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 244:
#line 921 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 245:
#line 922 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 246:
#line 923 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 247:
#line 924 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 248:
#line 925 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 249:
#line 926 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 250:
#line 927 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 251:
#line 928 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 255:
#line 932 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 256:
#line 933 "type.y"
    { DeclClass(0, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); ;}
    break;

  case 257:
#line 934 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 258:
#line 939 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 259:
#line 940 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); ;}
    break;

  case 260:
#line 941 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-2].id).string); ;}
    break;

  case 261:
#line 942 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); ;}
    break;

  case 262:
#line 944 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 263:
#line 948 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 264:
#line 950 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 265:
#line 954 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); ;}
    break;

  case 266:
#line 955 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 267:
#line 956 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[0].id).string)), null); FreeIdentifier((yyvsp[0].id)); ;}
    break;

  case 268:
#line 960 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[0].templateDatatype)); ;}
    break;

  case 269:
#line 975 "type.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[0].id)); ;}
    break;

  case 270:
#line 984 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); ;}
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
#line 1009 "type.y"
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 277:
#line 1011 "type.y"
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
#line 1023 "type.y"
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
#line 1035 "type.y"
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

  case 280:
#line 1049 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); ;}
    break;

  case 281:
#line 1050 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); ;}
    break;

  case 282:
#line 1163 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 283:
#line 1164 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 284:
#line 1168 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 285:
#line 1169 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 286:
#line 1173 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 287:
#line 1177 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 288:
#line 1178 "type.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 289:
#line 1183 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 290:
#line 1185 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 291:
#line 1187 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 292:
#line 1189 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 293:
#line 1191 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 294:
#line 1194 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 295:
#line 1196 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 296:
#line 1198 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 297:
#line 1200 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 298:
#line 1202 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 299:
#line 1205 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:
#line 1207 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:
#line 1209 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:
#line 1211 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:
#line 1213 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:
#line 1216 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:
#line 1218 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:
#line 1220 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:
#line 1222 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:
#line 1224 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:
#line 1228 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 310:
#line 1229 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 311:
#line 1230 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 312:
#line 1231 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 313:
#line 1232 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 314:
#line 1233 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 315:
#line 1234 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 316:
#line 1235 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 317:
#line 1240 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 318:
#line 1242 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 319:
#line 1247 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 320:
#line 1249 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 321:
#line 1251 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 322:
#line 1253 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 323:
#line 1255 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 324:
#line 1259 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 325:
#line 1260 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 326:
#line 1265 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); ;}
    break;

  case 327:
#line 1266 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 328:
#line 1267 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].id).string); ;}
    break;

  case 329:
#line 1268 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); ;}
    break;

  case 330:
#line 1269 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 331:
#line 1286 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 332:
#line 1288 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 333:
#line 1293 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 334:
#line 1295 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 335:
#line 1301 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 336:
#line 1303 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 337:
#line 1305 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 338:
#line 1307 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 339:
#line 1309 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 340:
#line 1311 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 341:
#line 1313 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 342:
#line 1315 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 343:
#line 1317 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 344:
#line 1319 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 345:
#line 1321 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 346:
#line 1326 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 347:
#line 1328 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 348:
#line 1330 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 349:
#line 1332 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 350:
#line 1334 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 351:
#line 1338 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 353:
#line 1340 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 354:
#line 1341 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 355:
#line 1342 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 356:
#line 1343 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 357:
#line 1347 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 359:
#line 1349 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 360:
#line 1350 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 361:
#line 1351 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 362:
#line 1352 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 364:
#line 1400 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 365:
#line 1402 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 367:
#line 1409 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 368:
#line 1411 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 369:
#line 1413 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 370:
#line 1415 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 371:
#line 1417 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 373:
#line 1423 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 374:
#line 1426 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 375:
#line 1428 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 376:
#line 1430 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 378:
#line 1440 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 379:
#line 1442 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 380:
#line 1444 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 383:
#line 1451 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 384:
#line 1453 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 386:
#line 1458 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 387:
#line 1459 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 388:
#line 1460 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 389:
#line 1461 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 390:
#line 1465 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 391:
#line 1466 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 392:
#line 1470 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 393:
#line 1471 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 394:
#line 1472 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 395:
#line 1473 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 397:
#line 1478 "type.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 398:
#line 1482 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 399:
#line 1483 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 400:
#line 1487 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 401:
#line 1488 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 402:
#line 1489 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 403:
#line 1490 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 404:
#line 1502 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 405:
#line 1504 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); ;}
    break;

  case 406:
#line 1506 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 407:
#line 1508 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), (yyvsp[0].declarator));  ;}
    break;

  case 408:
#line 1510 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); ;}
    break;

  case 409:
#line 1512 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); ;}
    break;

  case 410:
#line 1514 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), (yyvsp[0].declarator)); ;}
    break;

  case 411:
#line 1517 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), null); ;}
    break;

  case 412:
#line 1518 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[0].declarator)); ;}
    break;

  case 413:
#line 1520 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[0].declarator)); ;}
    break;

  case 414:
#line 1524 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 415:
#line 1525 "type.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 416:
#line 1529 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 417:
#line 1530 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 418:
#line 1534 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 419:
#line 1535 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 420:
#line 1540 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 421:
#line 1542 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 422:
#line 1544 "type.y"
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

  case 423:
#line 1560 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 424:
#line 1562 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 425:
#line 1584 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 426:
#line 1586 "type.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 433:
#line 1600 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 434:
#line 1602 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 435:
#line 1604 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 436:
#line 1608 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 437:
#line 1609 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 438:
#line 1613 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 439:
#line 1614 "type.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 440:
#line 1617 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); ;}
    break;

  case 441:
#line 1621 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 442:
#line 1622 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 443:
#line 1623 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 444:
#line 1627 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 445:
#line 1632 "type.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 446:
#line 1640 "type.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 447:
#line 1644 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:
#line 1645 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:
#line 1649 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:
#line 1650 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:
#line 1651 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:
#line 1655 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:
#line 1656 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:
#line 1657 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:
#line 1658 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:
#line 1660 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:
#line 1661 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:
#line 1662 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:
#line 1666 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:
#line 1667 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:
#line 1668 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:
#line 1669 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 463:
#line 1670 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:
#line 1674 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 465:
#line 1679 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 466:
#line 1681 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 467:
#line 1686 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 468:
#line 1688 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 469:
#line 1713 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 470:
#line 1715 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 471:
#line 1717 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 472:
#line 1719 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 473:
#line 1724 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 474:
#line 1726 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 475:
#line 1730 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 476:
#line 1732 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 477:
#line 1734 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 478:
#line 1736 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 479:
#line 1738 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:
#line 1744 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 481:
#line 1746 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 482:
#line 1751 "type.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:
#line 1755 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 484:
#line 1756 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 485:
#line 1761 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 486:
#line 1763 "type.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 487:
#line 1768 "type.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 488:
#line 1772 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 489:
#line 1773 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 490:
#line 1774 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 491:
#line 1775 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 492:
#line 1776 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 493:
#line 1777 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 495:
#line 1782 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 496:
#line 1783 "type.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 497:
#line 1787 "type.y"
    { parsedType = (yyvsp[0].typeName); ;}
    break;

  case 498:
#line 1788 "type.y"
    { parsedType = (yyvsp[-2].typeName); parsedType.bitCount = (yyvsp[0].exp); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 5959 "type.ec"

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


#line 1791 "type.y"



