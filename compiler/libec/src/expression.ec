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
#line 1 "expression.y"


import "ecdefs"

#define YYLTYPE Location

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
#line 36 "expression.y"
typedef union YYSTYPE {
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

   Instantiation instance;
   MembersInit membersInit;
   MemberInit memberInit;
   ClassFunction classFunction;
   ClassDefinition _class;
   ClassDef classDef;
   PropertyDef prop;
   char * string;
   Symbol symbol;
} YYSTYPE;
/* Line 190 of yacc.c.  */
#line 356 "expression.ec"
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
#line 380 "expression.ec"

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
#define YYFINAL  144
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   6396

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  104
/* YYNRULES -- Number of rules. */
#define YYNRULES  403
/* YYNRULES -- Number of states. */
#define YYNSTATES  706

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
       2,     2,     2,   120,     2,     2,     2,   122,   115,     2,
     109,   110,   116,   117,   114,   118,   113,   121,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   128,   130,
     123,   129,   124,   127,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   111,     2,   112,   125,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   131,   126,   132,   119,     2,     2,     2,
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
       0,     0,     3,     5,     7,    11,    13,    15,    17,    19,
      22,    29,    35,    42,    48,    56,    63,    71,    78,    80,
      82,    84,    89,    93,    98,   102,   106,   109,   112,   114,
     119,   123,   128,   132,   136,   139,   142,   144,   146,   150,
     154,   157,   160,   163,   168,   171,   176,   178,   180,   182,
     184,   186,   188,   190,   192,   194,   196,   198,   200,   205,
     207,   211,   215,   219,   221,   225,   229,   231,   235,   239,
     241,   245,   249,   253,   257,   259,   263,   267,   269,   273,
     275,   279,   281,   285,   287,   291,   293,   297,   299,   305,
     307,   311,   315,   317,   319,   321,   323,   325,   327,   329,
     331,   333,   335,   337,   339,   343,   345,   348,   352,   355,
     361,   363,   366,   368,   371,   373,   376,   378,   381,   383,
     386,   388,   391,   393,   396,   398,   401,   403,   406,   408,
     411,   413,   416,   418,   421,   423,   426,   428,   431,   433,
     436,   438,   441,   443,   446,   448,   451,   453,   457,   459,
     463,   465,   467,   469,   471,   473,   475,   477,   479,   481,
     483,   485,   487,   489,   491,   493,   495,   497,   499,   501,
     503,   505,   507,   509,   511,   513,   515,   517,   519,   521,
     526,   528,   530,   532,   534,   536,   538,   540,   542,   544,
     546,   548,   550,   552,   554,   556,   558,   563,   565,   571,
     576,   581,   585,   591,   594,   597,   599,   601,   603,   606,
     610,   612,   616,   626,   636,   644,   652,   658,   669,   680,
     689,   698,   705,   714,   723,   730,   737,   742,   752,   762,
     770,   778,   784,   788,   791,   794,   797,   799,   802,   804,
     806,   808,   812,   814,   817,   820,   824,   830,   833,   836,
     841,   847,   855,   863,   869,   871,   875,   877,   881,   885,
     888,   892,   896,   900,   905,   910,   913,   917,   921,   926,
     930,   933,   937,   941,   946,   948,   950,   953,   956,   959,
     963,   965,   967,   970,   973,   976,   980,   982,   985,   989,
     991,   995,  1000,  1004,  1009,  1011,  1014,  1017,  1021,  1025,
    1027,  1029,  1032,  1035,  1038,  1042,  1046,  1049,  1051,  1054,
    1056,  1059,  1062,  1066,  1068,  1072,  1074,  1078,  1081,  1084,
    1086,  1088,  1092,  1094,  1097,  1099,  1103,  1108,  1110,  1112,
    1114,  1118,  1120,  1122,  1124,  1126,  1128,  1130,  1134,  1139,
    1143,  1145,  1148,  1150,  1153,  1156,  1158,  1160,  1163,  1165,
    1168,  1172,  1174,  1177,  1183,  1191,  1197,  1203,  1211,  1218,
    1226,  1231,  1237,  1242,  1246,  1249,  1252,  1255,  1259,  1265,
    1270,  1275,  1279,  1284,  1288,  1292,  1295,  1298,  1300,  1304,
    1309,  1313,  1316,  1319,  1322,  1325,  1328,  1331,  1334,  1337,
    1341,  1343,  1345,  1349,  1352,  1354,  1356,  1359,  1362,  1364,
    1367,  1369,  1371,  1374
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     236,     0,    -1,     3,    -1,   136,    -1,   109,   159,   110,
      -1,   134,    -1,   222,    -1,     4,    -1,     5,    -1,   109,
     110,    -1,    71,   163,   193,   111,   160,   112,    -1,    71,
     163,   111,   160,   112,    -1,   102,   163,   193,   111,   160,
     112,    -1,   102,   163,   111,   160,   112,    -1,    72,   160,
     165,   193,   111,   160,   112,    -1,    72,   160,   165,   111,
     160,   112,    -1,   103,   160,   165,   193,   111,   160,   112,
      -1,   103,   160,   165,   111,   160,   112,    -1,     1,    -1,
     223,    -1,   135,    -1,   138,   111,   159,   112,    -1,   138,
     109,   110,    -1,   138,   109,   140,   110,    -1,   138,   113,
     134,    -1,   138,     7,   134,    -1,   138,     8,    -1,   138,
       9,    -1,   136,    -1,   139,   111,   159,   112,    -1,   139,
     109,   110,    -1,   139,   109,   140,   110,    -1,   139,   113,
     134,    -1,   139,     7,   134,    -1,   139,     8,    -1,   139,
       9,    -1,   157,    -1,   137,    -1,   140,   114,   157,    -1,
     140,   114,   137,    -1,     8,   142,    -1,     9,   142,    -1,
     144,   145,    -1,     6,   109,   142,   110,    -1,     6,   143,
      -1,     6,   109,   206,   110,    -1,   141,    -1,   138,    -1,
     141,    -1,   139,    -1,   115,    -1,   116,    -1,   117,    -1,
     118,    -1,   119,    -1,   120,    -1,    73,    -1,   142,    -1,
     109,   206,   110,   145,    -1,   145,    -1,   146,   116,   145,
      -1,   146,   121,   145,    -1,   146,   122,   145,    -1,   146,
      -1,   147,   117,   146,    -1,   147,   118,   146,    -1,   147,
      -1,   148,    10,   147,    -1,   148,    11,   147,    -1,   148,
      -1,   149,   123,   148,    -1,   149,   124,   148,    -1,   149,
      12,   148,    -1,   149,    13,   148,    -1,   149,    -1,   150,
      14,   149,    -1,   150,    15,   149,    -1,   150,    -1,   151,
     115,   150,    -1,   151,    -1,   152,   125,   151,    -1,   152,
      -1,   153,   126,   152,    -1,   153,    -1,   154,    16,   153,
      -1,   154,    -1,   155,    17,   154,    -1,   155,    -1,   155,
     127,   159,   128,   156,    -1,   156,    -1,   142,   158,   157,
      -1,   142,   158,   137,    -1,   129,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    25,    -1,    26,    -1,    27,    -1,   157,    -1,   159,
     114,   157,    -1,   156,    -1,   163,   130,    -1,   163,   166,
     130,    -1,   221,   130,    -1,    77,   134,   129,   160,   130,
      -1,   171,    -1,   162,   171,    -1,   174,    -1,   162,   174,
      -1,   187,    -1,   162,   187,    -1,   176,    -1,   162,   176,
      -1,   168,    -1,   163,   168,    -1,   171,    -1,   163,   171,
      -1,   174,    -1,   163,   174,    -1,   187,    -1,   163,   187,
      -1,   176,    -1,   163,   176,    -1,   168,    -1,   164,   168,
      -1,   171,    -1,   164,   171,    -1,   174,    -1,   164,   174,
      -1,   172,    -1,   164,   172,    -1,   168,    -1,   165,   168,
      -1,   171,    -1,   165,   171,    -1,   175,    -1,   165,   175,
      -1,   176,    -1,   165,   176,    -1,   187,    -1,   165,   187,
      -1,   167,    -1,   166,   114,   167,    -1,   194,    -1,   194,
     129,   207,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,    74,    -1,   170,    -1,    79,    -1,    44,
      -1,    45,    -1,    75,    -1,   173,    -1,    28,    -1,    46,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,
      -1,    41,    -1,    85,    -1,   177,    -1,   186,    -1,   172,
      -1,   100,   109,   172,   110,    -1,    66,    -1,    46,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,
      41,    -1,   177,    -1,   186,    -1,   173,    -1,   100,   109,
     172,   110,    -1,    66,    -1,   178,   134,   131,   179,   132,
      -1,   178,   131,   179,   132,    -1,   178,   134,   131,   132,
      -1,   178,   131,   132,    -1,   178,   173,   131,   179,   132,
      -1,   178,   134,    -1,   178,   173,    -1,    48,    -1,    49,
      -1,   183,    -1,   179,   183,    -1,   138,   129,   208,    -1,
     180,    -1,   181,   114,   180,    -1,    68,   164,   134,   131,
      69,   216,    70,   216,   132,    -1,    68,   164,   134,   131,
      70,   216,    69,   216,   132,    -1,    68,   164,   134,   131,
      69,   216,   132,    -1,    68,   164,   134,   131,    70,   216,
     132,    -1,    68,   164,   134,   131,   132,    -1,    68,   164,
     192,   134,   131,    69,   216,    70,   216,   132,    -1,    68,
     164,   192,   134,   131,    70,   216,    69,   216,   132,    -1,
      68,   164,   192,   134,   131,    69,   216,   132,    -1,    68,
     164,   192,   134,   131,    70,   216,   132,    -1,    68,   164,
     192,   134,   131,   132,    -1,    68,   164,   131,    69,   216,
      70,   216,   132,    -1,    68,   164,   131,    70,   216,    69,
     216,   132,    -1,    68,   164,   131,    69,   216,   132,    -1,
      68,   164,   131,    70,   216,   132,    -1,    68,   164,   131,
     132,    -1,    68,   164,   192,   131,    69,   216,    70,   216,
     132,    -1,    68,   164,   192,   131,    70,   216,    69,   216,
     132,    -1,    68,   164,   192,   131,    69,   216,   132,    -1,
      68,   164,   192,   131,    70,   216,   132,    -1,    68,   164,
     192,   131,   132,    -1,   163,   184,   130,    -1,   163,   130,
      -1,   222,   130,    -1,   221,   130,    -1,   228,    -1,   181,
     130,    -1,   182,    -1,   130,    -1,   185,    -1,   184,   114,
     185,    -1,   194,    -1,   194,   170,    -1,   128,   160,    -1,
     194,   128,   160,    -1,   194,   128,   160,   128,   160,    -1,
      50,   134,    -1,    50,   173,    -1,    50,   131,   188,   132,
      -1,    50,   134,   131,   188,   132,    -1,    50,   134,   131,
     188,   130,   179,   132,    -1,    50,   173,   131,   188,   130,
     179,   132,    -1,    50,   173,   131,   188,   132,    -1,   189,
      -1,   188,   114,   189,    -1,   134,    -1,   134,   129,   160,
      -1,   109,   192,   110,    -1,   111,   112,    -1,   111,   160,
     112,    -1,   111,   172,   112,    -1,   190,   111,   112,    -1,
     190,   111,   160,   112,    -1,   190,   111,   172,   112,    -1,
     109,   110,    -1,   109,   202,   110,    -1,   190,   109,   110,
      -1,   190,   109,   202,   110,    -1,   109,   193,   110,    -1,
     109,   110,    -1,   109,   202,   110,    -1,   191,   109,   110,
      -1,   191,   109,   202,   110,    -1,   201,    -1,   190,    -1,
     201,   190,    -1,   169,   201,    -1,   169,   190,    -1,   169,
     201,   190,    -1,   201,    -1,   191,    -1,   201,   191,    -1,
     169,   201,    -1,   169,   191,    -1,   169,   201,   191,    -1,
     197,    -1,   201,   197,    -1,   169,   201,   197,    -1,   134,
      -1,   109,   194,   110,    -1,   195,   111,   160,   112,    -1,
     195,   111,   112,    -1,   195,   111,   172,   112,    -1,   199,
      -1,   201,   199,    -1,   169,   199,    -1,   169,   201,   199,
      -1,   201,   169,   199,    -1,   199,    -1,   195,    -1,   169,
     199,    -1,   169,   195,    -1,   195,   109,    -1,   198,   202,
     110,    -1,   198,   205,   110,    -1,   198,   110,    -1,   171,
      -1,   200,   171,    -1,   116,    -1,   116,   200,    -1,   116,
     201,    -1,   116,   200,   201,    -1,   203,    -1,   203,   114,
      51,    -1,   204,    -1,   203,   114,   204,    -1,   163,   194,
      -1,   163,   192,    -1,   163,    -1,   134,    -1,   205,   114,
     134,    -1,   162,    -1,   162,   192,    -1,   157,    -1,   131,
     209,   132,    -1,   131,   209,   114,   132,    -1,   156,    -1,
     137,    -1,   207,    -1,   209,   114,   207,    -1,   211,    -1,
     216,    -1,   217,    -1,   218,    -1,   219,    -1,   220,    -1,
     134,   128,   210,    -1,    52,   160,   128,   210,    -1,    53,
     128,   210,    -1,   161,    -1,   212,   161,    -1,   210,    -1,
     213,   210,    -1,   213,   161,    -1,   213,    -1,   212,    -1,
     212,   213,    -1,   131,    -1,   131,   132,    -1,   215,   214,
     132,    -1,   130,    -1,   159,   130,    -1,    54,   109,   159,
     110,   210,    -1,    54,   109,   159,   110,   210,    64,   210,
      -1,    55,   109,   159,   110,   210,    -1,    56,   109,   159,
     110,   210,    -1,    57,   210,    56,   109,   159,   110,   130,
      -1,    58,   109,   217,   217,   110,   210,    -1,    58,   109,
     217,   217,   159,   110,   210,    -1,    56,   109,   110,   210,
      -1,    58,   109,   217,   110,   210,    -1,    58,   109,   110,
     210,    -1,    59,   134,   130,    -1,    60,   130,    -1,    61,
     130,    -1,    62,   130,    -1,    62,   159,   130,    -1,   163,
     134,   131,   235,   132,    -1,   163,   134,   131,   132,    -1,
     172,   131,   235,   132,    -1,   172,   131,   132,    -1,   134,
     131,   235,   132,    -1,   134,   131,   132,    -1,   131,   235,
     132,    -1,   131,   132,    -1,   163,   196,    -1,   196,    -1,
     163,   109,   110,    -1,   119,   163,   109,   110,    -1,    78,
     163,   196,    -1,    78,   196,    -1,   224,   216,    -1,   227,
     216,    -1,   227,   130,    -1,   225,   216,    -1,   226,   216,
      -1,   163,   196,    -1,   229,   216,    -1,   138,   129,   208,
      -1,   208,    -1,   231,    -1,   232,   114,   231,    -1,   232,
     130,    -1,   233,    -1,   230,    -1,   234,   233,    -1,   234,
     230,    -1,   130,    -1,   234,   130,    -1,   234,    -1,   232,
      -1,   234,   232,    -1,   157,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   153,   153,   158,   159,   164,   166,   168,   170,   172,
     175,   176,   177,   178,   179,   180,   181,   182,   183,   187,
     191,   192,   193,   194,   195,   196,   197,   198,   203,   204,
     205,   206,   207,   208,   209,   210,   214,   215,   216,   217,
     221,   222,   223,   224,   225,   226,   230,   231,   235,   236,
     240,   241,   242,   243,   244,   245,   246,   250,   251,   255,
     256,   257,   258,   262,   263,   264,   268,   269,   270,   274,
     275,   276,   277,   278,   282,   283,   284,   288,   289,   293,
     294,   298,   299,   303,   304,   308,   309,   313,   314,   318,
     319,   321,   326,   327,   328,   329,   330,   331,   332,   333,
     334,   335,   336,   340,   341,   345,   349,   350,   351,   352,
     356,   357,   358,   359,   360,   361,   362,   363,   367,   368,
     369,   370,   371,   372,   373,   374,   375,   376,   390,   391,
     392,   393,   394,   395,   396,   397,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   414,   415,   419,   420,
     424,   425,   426,   427,   428,   432,   433,   437,   442,   443,
     444,   448,   473,   477,   478,   479,   480,   481,   482,   483,
     484,   485,   486,   487,   488,   489,   490,   491,   492,   493,
     494,   498,   499,   500,   501,   502,   503,   504,   505,   506,
     507,   508,   509,   510,   511,   512,   513,   514,   519,   520,
     521,   522,   523,   528,   529,   568,   569,   573,   574,   578,
     582,   583,   587,   589,   591,   593,   595,   598,   600,   602,
     604,   606,   609,   611,   613,   615,   617,   620,   622,   624,
     626,   628,   633,   634,   635,   636,   637,   638,   639,   640,
     644,   646,   651,   653,   655,   657,   659,   664,   665,   669,
     671,   672,   673,   674,   690,   692,   697,   699,   705,   707,
     709,   711,   713,   715,   717,   719,   721,   723,   725,   730,
     732,   734,   736,   738,   743,   744,   745,   746,   747,   748,
     752,   753,   754,   755,   756,   757,   803,   804,   806,   812,
     814,   816,   818,   820,   825,   826,   829,   831,   833,   839,
     840,   841,   843,   848,   852,   854,   856,   861,   862,   866,
     867,   868,   869,   873,   874,   878,   879,   883,   884,   885,
     889,   890,   894,   895,   904,   906,   908,   924,   925,   946,
     948,   953,   954,   955,   956,   957,   958,   962,   964,   966,
     971,   972,   976,   977,   980,   984,   985,   986,   990,   994,
    1002,  1007,  1008,  1012,  1013,  1014,  1018,  1019,  1020,  1021,
    1023,  1024,  1025,  1029,  1030,  1031,  1032,  1033,  1082,  1084,
    1089,  1091,  1093,  1095,  1100,  1102,  1107,  1109,  1114,  1119,
    1124,  1126,  1131,  1133,  1135,  1137,  1139,  1145,  1150,  1160,
    1161,  1165,  1167,  1172,  1177,  1178,  1179,  1180,  1181,  1182,
    1186,  1187,  1188,  1192
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
  "DBTABLE", "DBFIELD", "DBINDEX", "DATABASE_OPEN", "'('", "')'", "'['",
  "']'", "'.'", "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'", "'/'",
  "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'",
  "'}'", "$accept", "identifier", "primary_expression",
  "simple_primary_expression", "anon_instantiation_expression",
  "postfix_expression", "simple_postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "simple_unary_expression", "unary_operator",
  "cast_expression", "multiplicative_expression", "additive_expression",
  "shift_expression", "relational_expression", "equality_expression",
  "and_expression", "exclusive_or_expression", "inclusive_or_expression",
  "logical_and_expression", "logical_or_expression",
  "conditional_expression", "assignment_expression", "assignment_operator",
  "expression", "constant_expression", "declaration",
  "specifier_qualifier_list", "declaration_specifiers",
  "property_specifiers", "renew_specifiers", "init_declarator_list",
  "init_declarator", "storage_class_specifier", "ext_decl", "ext_attrib",
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
  "iteration_statement", "jump_statement", "instantiation_named",
  "instantiation_unnamed", "instantiation_anon",
  "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start", "class_function_definition",
  "instance_class_function_definition_start",
  "instance_class_function_definition", "data_member_initialization",
  "data_member_initialization_list",
  "data_member_initialization_list_coloned",
  "members_initialization_list_coloned", "members_initialization_list",
  "expression_unit", 0
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
     355,   356,   357,   358,   359,   360,   361,   362,   363,    40,
      41,    91,    93,    46,    44,    38,    42,    43,    45,   126,
      33,    47,    37,    60,    62,    94,   124,    63,    58,    61,
      59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   133,   134,   135,   135,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   136,   136,   136,   136,   136,   137,
     138,   138,   138,   138,   138,   138,   138,   138,   139,   139,
     139,   139,   139,   139,   139,   139,   140,   140,   140,   140,
     141,   141,   141,   141,   141,   141,   142,   142,   143,   143,
     144,   144,   144,   144,   144,   144,   144,   145,   145,   146,
     146,   146,   146,   147,   147,   147,   148,   148,   148,   149,
     149,   149,   149,   149,   150,   150,   150,   151,   151,   152,
     152,   153,   153,   154,   154,   155,   155,   156,   156,   157,
     157,   157,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   159,   159,   160,   161,   161,   161,   161,
     162,   162,   162,   162,   162,   162,   162,   162,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   164,   164,
     164,   164,   164,   164,   164,   164,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   166,   166,   167,   167,
     168,   168,   168,   168,   168,   169,   169,   170,   171,   171,
     171,   172,   173,   174,   174,   174,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   174,   174,   174,   174,   174,
     174,   175,   175,   175,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   175,   175,   176,   176,
     176,   176,   176,   177,   177,   178,   178,   179,   179,   180,
     181,   181,   182,   182,   182,   182,   182,   182,   182,   182,
     182,   182,   182,   182,   182,   182,   182,   182,   182,   182,
     182,   182,   183,   183,   183,   183,   183,   183,   183,   183,
     184,   184,   185,   185,   185,   185,   185,   186,   186,   187,
     187,   187,   187,   187,   188,   188,   189,   189,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   191,
     191,   191,   191,   191,   192,   192,   192,   192,   192,   192,
     193,   193,   193,   193,   193,   193,   194,   194,   194,   195,
     195,   195,   195,   195,   196,   196,   196,   196,   196,   197,
     197,   197,   197,   198,   199,   199,   199,   200,   200,   201,
     201,   201,   201,   202,   202,   203,   203,   204,   204,   204,
     205,   205,   206,   206,   207,   207,   207,   208,   208,   209,
     209,   210,   210,   210,   210,   210,   210,   211,   211,   211,
     212,   212,   213,   213,   213,   214,   214,   214,   215,   216,
     216,   217,   217,   218,   218,   218,   219,   219,   219,   219,
     219,   219,   219,   220,   220,   220,   220,   220,   221,   221,
     222,   222,   222,   222,   223,   223,   224,   224,   225,   226,
     227,   227,   228,   228,   228,   228,   228,   229,   230,   231,
     231,   232,   232,   233,   234,   234,   234,   234,   234,   234,
     235,   235,   235,   236
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       6,     5,     6,     5,     7,     6,     7,     6,     1,     1,
       1,     4,     3,     4,     3,     3,     2,     2,     1,     4,
       3,     4,     3,     3,     2,     2,     1,     1,     3,     3,
       2,     2,     2,     4,     2,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     1,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     1,     3,     1,
       3,     1,     3,     1,     3,     1,     3,     1,     5,     1,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     3,     1,     2,     3,     2,     5,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     3,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     1,     5,     4,
       4,     3,     5,     2,     2,     1,     1,     1,     2,     3,
       1,     3,     9,     9,     7,     7,     5,    10,    10,     8,
       8,     6,     8,     8,     6,     6,     4,     9,     9,     7,
       7,     5,     3,     2,     2,     2,     1,     2,     1,     1,
       1,     3,     1,     2,     2,     3,     5,     2,     2,     4,
       5,     7,     7,     5,     1,     3,     1,     3,     3,     2,
       3,     3,     3,     4,     4,     2,     3,     3,     4,     3,
       2,     3,     3,     4,     1,     1,     2,     2,     2,     3,
       1,     1,     2,     2,     2,     3,     1,     2,     3,     1,
       3,     4,     3,     4,     1,     2,     2,     3,     3,     1,
       1,     2,     2,     2,     3,     3,     2,     1,     2,     1,
       2,     2,     3,     1,     3,     1,     3,     2,     2,     1,
       1,     3,     1,     2,     1,     3,     4,     1,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     3,     4,     3,
       1,     2,     1,     2,     2,     1,     1,     2,     1,     2,
       3,     1,     2,     5,     7,     5,     5,     7,     6,     7,
       4,     5,     4,     3,     2,     2,     2,     3,     5,     4,
       4,     3,     4,     3,     3,     2,     2,     1,     3,     4,
       3,     2,     2,     2,     2,     2,     2,     2,     2,     3,
       1,     1,     3,     2,     1,     1,     2,     2,     1,     2,
       1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    18,     2,     7,     8,     0,     0,     0,   162,     0,
       0,    56,     0,     0,     0,    50,    51,    52,    53,    54,
      55,     5,    20,     3,    47,    46,    57,     0,    59,    63,
      66,    69,    74,    77,    79,    81,    83,    85,    87,    89,
     403,     0,   161,     6,     0,     0,    28,    49,    48,    44,
       0,    40,    41,   150,   151,   152,   153,   154,   164,   165,
     166,   167,   168,   170,   173,   174,   171,   172,   158,   159,
     163,   169,   205,   206,     0,   180,   160,   175,     0,     0,
     118,   120,   178,   122,   126,   176,     0,   177,   124,    57,
     105,     0,     0,     0,     9,   103,     0,   322,   110,   178,
     112,   116,   114,     0,     0,     0,    26,    27,     0,     0,
       0,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,    92,     0,    42,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,     0,     0,    34,    35,
       0,     0,     0,     0,   247,   248,     0,   155,   157,     0,
       0,   309,   119,     0,   156,   121,   123,   127,   125,   281,
       0,   280,     0,   203,   204,   182,   183,   184,   185,   186,
     188,   191,   192,   189,   190,   181,   187,   197,     0,     0,
     136,   138,   195,   140,   142,   193,   194,   144,     0,     0,
       0,     4,     0,     0,     0,     0,   111,   113,   117,   115,
     275,   323,   274,     0,   398,     0,   373,   328,    47,   327,
       0,   390,    19,     0,   395,   391,   401,   394,     0,     0,
      25,    22,    37,     0,    36,     0,    24,    91,    90,    60,
      61,    62,    64,    65,    67,    68,    72,    73,    70,    71,
      75,    76,    78,    80,    82,    84,    86,     0,   371,     0,
      43,    45,    33,    30,     0,     0,    32,   256,     0,   254,
       0,     0,     0,   270,   319,     0,     0,   313,   315,     0,
     307,   310,   311,   284,   283,     0,     0,   282,     0,     0,
       0,     0,   239,   201,     5,     0,     0,     0,     0,   210,
       0,   238,   207,     0,   377,     0,   294,     0,     0,     6,
       0,     0,     0,     0,   236,     0,     0,     0,     0,   137,
     139,   141,   143,   145,     0,     0,     0,     0,     0,   104,
     265,     0,     0,   259,     0,     0,   278,   277,     0,     0,
     276,    58,   375,     0,     0,     0,   289,   387,   348,     0,
     388,     0,   393,   399,   397,   402,   396,   372,    23,     0,
      21,     0,   370,    31,    29,     0,     0,   249,     0,     0,
     179,     0,     0,   318,   317,   300,   286,   299,   274,   269,
     271,     0,    11,   308,   312,   285,   272,     0,     0,     0,
       0,   128,   130,   134,   132,     0,     0,   381,     0,    51,
       0,     0,     0,     0,     0,     0,     0,   233,   289,     0,
       0,   240,   242,   376,   299,     0,   296,     0,   199,   208,
       0,   237,   303,     0,   306,   320,     0,     0,     0,   295,
     235,   234,   382,   385,   386,   384,   383,   200,     0,     0,
       0,     0,     0,    13,     0,     0,     0,   258,   266,   260,
     261,   279,   267,     0,   262,     0,     0,   374,   389,   349,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   351,     5,     0,   340,     0,   342,   331,     0,
       0,     0,   332,   333,   334,   335,   336,     0,   392,    39,
      38,    88,   257,   255,     0,   250,     0,   253,   302,   301,
     277,     0,   287,   314,   316,   273,    10,   247,   248,     0,
       0,   129,   131,   135,   133,     0,   203,   204,   380,     0,
     290,     0,   209,   378,   244,     0,   301,     0,     0,   232,
       0,   243,     0,   299,   297,   211,   292,     0,     0,   304,
     305,     0,   298,   198,   202,   196,    15,     0,    12,    17,
       0,   268,   263,   264,     0,     0,     0,     0,     0,     0,
       0,     0,   364,   365,   366,     0,     0,     0,   352,   106,
       0,   146,   148,   341,     0,   344,   343,   350,   108,     0,
       0,   288,     0,     0,   226,     0,     0,     0,   379,   369,
       0,   299,   241,   245,   301,   291,   293,   321,    14,    16,
       0,   339,     0,     0,     0,     0,     0,     0,     0,   363,
     367,     0,   337,     0,   107,     0,   251,   252,     0,     0,
       0,     0,   216,     0,     0,   231,     0,   368,     0,   338,
       0,     0,   360,     0,     0,   362,     0,     0,     0,   147,
       0,   324,   149,     0,   224,     0,   225,     0,     0,     0,
       0,     0,     0,   221,   246,   353,   355,   356,     0,   361,
       0,     0,   109,   329,     0,     0,     0,     0,   214,     0,
     215,     0,   229,     0,   230,     0,     0,     0,     0,   358,
       0,     0,   325,   222,   223,     0,     0,     0,     0,     0,
     219,     0,   220,   354,   357,   359,   326,   330,   212,   213,
     227,   228,     0,     0,   217,   218
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    21,    22,    23,   217,    24,    47,   233,    25,    89,
      49,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    95,   122,   474,    91,   575,    97,
     296,   390,   189,   570,   571,    80,   297,   164,    81,    41,
      42,    83,   193,    84,    85,    86,   298,   299,   300,   301,
     302,   410,   411,    87,    88,   268,   269,   210,   169,   331,
     170,   401,   303,   304,   376,   305,   306,   281,   307,   332,
     277,   278,   427,   103,   642,   221,   664,   477,   478,   479,
     480,   481,   349,   482,   483,   484,   485,   486,   308,    43,
     222,   310,   311,   312,   313,   314,   223,   224,   225,   226,
     227,   228,   229,    44
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -595
static const short int yypact[] =
{
    4727,  -595,  -595,  -595,  -595,  4800,  4850,  4850,  -595,  6150,
    4727,  -595,  6150,  4727,  4279,  -595,  -595,  -595,  -595,  -595,
    -595,   -69,  -595,  -595,   259,  -595,   557,  4727,  -595,   163,
     -49,   393,    69,   394,    -3,    35,    74,   174,    54,  -595,
    -595,    79,  -595,  -595,   195,  4399,  -595,   500,  -595,  -595,
    3910,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,    10,  -595,  -595,  -595,   114,  5336,
    -595,  -595,  -595,  -595,  -595,  -595,    32,  -595,  -595,  -595,
    -595,  6296,  5425,  6296,  -595,  -595,   126,  5740,  -595,    79,
    -595,  -595,  -595,   132,  1830,   283,  -595,  -595,  3324,  4727,
     283,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  3458,  -595,  4727,  4727,  4727,  4727,  4727,  4727,
    4727,  4727,  4727,  4727,  4727,  4727,  4727,  4727,  4727,  4727,
    4727,  4727,  4727,  1950,  -595,   154,   201,   283,  -595,  -595,
    3385,  4727,   283,   283,   208,   225,   290,  -595,  -595,  5514,
    4727,    41,  -595,   -53,  -595,  -595,  -595,  -595,  -595,   264,
     275,   288,  2417,   304,   309,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,   333,  5603,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  4727,   336,
    5692,  -595,  4727,  5247,  4477,   260,  -595,  -595,  -595,  -595,
      23,  -595,   291,  4727,  -595,  2070,  -595,  -595,   147,  -595,
    5075,  -595,  -595,   318,  -595,  -595,   143,  -595,  2190,   322,
    -595,  -595,  -595,   141,  -595,   307,  -595,  -595,  -595,  -595,
    -595,  -595,   163,   163,   -49,   -49,   393,   393,   393,   393,
      69,    69,   394,    -3,    35,    74,   174,   -73,  -595,   324,
    -595,  -595,  -595,  -595,   179,   319,  -595,   330,   111,  -595,
     283,   283,   351,  -595,  4986,   361,   364,   367,  -595,   363,
    -595,    41,  -595,   264,   288,  5829,  4727,   264,  6223,  5075,
    4449,  6150,  -595,  -595,   -69,   408,  3958,    61,  2524,  -595,
     177,  -595,  -595,   323,  -595,  5164,  -595,   243,   353,   355,
     318,   318,   318,   296,  -595,  2631,  3616,   290,  4727,  -595,
    -595,  -595,  -595,  -595,   378,   380,  4727,  4727,   382,  -595,
    -595,   384,   386,  -595,   385,   -58,    23,   291,  5912,  4528,
      23,  -595,  -595,   366,  3458,    56,  -595,  -595,   369,  3168,
    -595,  3458,  -595,  -595,  -595,   143,  -595,  -595,  -595,  3458,
    -595,  4727,  -595,  -595,  -595,  4727,   283,  -595,   -40,   139,
    -595,  4897,    64,  -595,  -595,   323,  -595,  -595,   124,  -595,
    -595,  6077,  -595,  -595,  -595,   264,  -595,   392,   398,    67,
    3854,  -595,  -595,  -595,  -595,    67,  5075,  -595,  4159,   320,
      61,   395,   243,  5995,  3458,   204,  4727,  -595,   381,    61,
     180,  -595,   -45,  -595,   387,   243,  -595,    39,  -595,  -595,
     660,  -595,  -595,  4601,  -595,  -595,   401,   187,    39,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  2738,  2845,
     403,   404,  4727,  -595,   410,   411,  4727,  -595,  -595,  -595,
    -595,    23,  -595,   415,  -595,   414,   -55,  -595,  -595,  -595,
    4727,   399,   422,   423,   424,  3251,   426,   283,   406,   409,
    3751,   283,  -595,   -27,   224,  -595,  4061,  -595,  -595,  1470,
    1590,   418,  -595,  -595,  -595,  -595,  -595,   412,  -595,  -595,
    -595,  -595,  -595,  -595,  3616,  -595,  3616,  -595,   323,  -595,
     124,    39,  -595,  -595,  -595,  -595,  -595,  -595,  -595,    29,
     416,  -595,  -595,  -595,  -595,    33,  -595,  -595,  -595,   243,
    -595,   430,  -595,  -595,  -595,  2310,   420,   243,   171,  -595,
    4727,  -595,    39,   421,  -595,  -595,  -595,   442,   -54,  -595,
    -595,   283,  -595,  -595,  -595,  -595,  -595,   447,  -595,  -595,
     449,  -595,  -595,  -595,   434,  3251,  4727,  4727,  4651,   507,
    3668,   435,  -595,  -595,  -595,   249,   437,  3251,  -595,  -595,
     261,  -595,   443,  -595,  1710,  -595,  -595,  -595,  -595,  2952,
    3059,  -595,   318,   318,  -595,   127,   193,   440,  -595,  -595,
     441,   454,  -595,   459,   458,  -595,  -595,  -595,  -595,  -595,
    3251,  -595,   214,   219,  3251,   268,   481,  3251,  3701,  -595,
    -595,  4727,  -595,    56,  -595,  3509,  -595,  -595,   -17,   -57,
     318,   318,  -595,   318,   318,  -595,   205,  -595,  4727,  -595,
    3251,  3251,  -595,  3251,  4727,  -595,  3251,  4677,   461,  -595,
    3509,  -595,  -595,   318,  -595,   318,  -595,    -9,   -44,    37,
     -39,   318,   318,  -595,  -595,   528,  -595,  -595,   270,  -595,
    3251,   282,  -595,  -595,   115,   462,   463,   318,  -595,   318,
    -595,   318,  -595,   318,  -595,   117,   -30,  3251,   468,  -595,
    3251,  1313,  -595,  -595,  -595,   471,   473,   480,   482,   318,
    -595,   318,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,   484,   486,  -595,  -595
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -595,   377,  -595,   614,   -98,   -10,  -595,   470,   617,     0,
    -595,  -595,    -7,   310,   316,   280,   331,   488,   485,   487,
     492,   494,  -595,    16,     2,  -595,   -13,    18,  -333,  -595,
     215,  -595,   535,  -595,    25,   314,   -75,   227,   935,   815,
     -42,   203,   -89,    52,    12,  -269,  -268,   221,  -595,  -595,
    -271,  -595,   121,   146,    92,   198,   277,  -184,  -148,   -92,
     162,  -263,   545,  -217,  -289,  -595,   965,  -595,   770,  -119,
    -595,   269,  -595,   600,  -594,  -326,  -595,   233,  -595,  -595,
     173,  -595,  -595,   574,  -517,  -595,  -595,  -595,  -340,  -107,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,   425,   303,   427,
     428,  -595,  -135,  -595
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -401
static const short int yytable[] =
{
      26,    96,    40,   347,   163,   211,    51,    52,   259,   487,
     232,   374,   645,     2,    26,   283,   475,   163,   458,   395,
     123,   336,   205,   287,   237,   669,    90,   419,   340,    90,
     673,    93,   155,   412,   158,     2,     2,    96,     8,   691,
     276,   202,     2,   608,   174,   145,   663,   438,   439,   192,
      26,   192,   232,   643,   450,   361,   159,   553,   596,     2,
       8,   667,   104,   161,     2,   309,   101,     2,   127,   128,
       2,   141,   397,   143,   366,   646,   143,   143,   522,   413,
     343,   131,   132,   530,   163,    68,    69,   697,   670,   502,
     494,   637,   495,   674,   218,     8,   235,   101,   582,   583,
     321,   567,   692,   195,   104,   195,   102,   671,    26,    26,
     234,   321,   137,   502,   163,   644,    76,   239,   240,   241,
     219,   395,    26,   668,   238,   163,   502,     2,   205,   257,
     157,   167,   338,   218,   339,   158,   385,   102,   265,   487,
     487,   153,    26,   194,   167,   194,   573,   192,   345,   208,
      26,    26,   234,   451,   105,   106,   107,   161,   192,   219,
     138,   584,   295,   172,   586,   345,   387,   419,   419,   672,
     345,   168,   161,   371,     2,   204,    90,   161,   279,   518,
     161,   142,   373,   197,   168,   197,   426,   689,   336,   209,
     140,   309,   133,   134,   340,   144,   620,   621,   157,   372,
     139,   195,    26,   158,   329,   218,   341,     2,   309,   309,
     143,   581,   195,   572,    90,   400,   325,   100,   218,   453,
      90,   409,   334,   156,    79,   366,   579,    92,   580,   681,
     581,   219,   428,   371,   487,   204,   201,   196,   581,   196,
     202,   322,   213,   367,   219,   157,     2,   682,   100,   690,
     158,   358,   322,   366,   199,   359,   108,   351,   109,   622,
     110,   489,   623,   624,   260,   412,   105,   106,   107,   496,
     400,   497,   167,   352,   651,   652,   344,    96,   157,   124,
     345,   323,   166,   158,   125,   126,     2,   161,   295,   363,
      26,   420,   323,   359,   528,   166,   372,   540,   515,   406,
     207,   541,    90,   501,   388,   295,   295,   421,   419,   419,
     529,   261,   168,   345,   523,   205,   451,   157,     8,   220,
     161,   275,   158,   400,   630,   625,   167,   501,   202,   631,
     400,   309,   309,   202,    90,   196,   441,   653,   202,   270,
     532,   218,    90,    90,   444,   445,   196,   508,   167,    26,
     572,   324,   345,   517,   568,    90,   271,   455,   220,    26,
     219,   490,   328,   202,    68,    69,   168,   219,   108,   203,
     109,   204,   110,   285,   274,   613,   161,   491,   633,   610,
     678,    90,   202,   492,   202,    96,   286,   309,   168,   309,
     590,   614,   680,   162,  -309,    76,   202,   159,    26,  -309,
     203,   400,   204,   129,   130,   190,   162,   190,   135,   136,
     295,   246,   247,   248,   249,   105,   106,   107,   274,   360,
     219,   202,    90,   166,   524,   501,   435,   348,   295,   295,
     220,   364,   422,   202,   423,   315,   161,   242,   243,    90,
     316,   537,   317,   220,   501,   244,   245,   326,   167,   348,
     101,   154,   501,   400,   357,   167,   362,   565,    90,   365,
     547,   370,    90,   173,   550,    26,   250,   251,   368,   369,
      26,   379,   309,   309,   380,   382,    90,   166,   554,    26,
      26,   381,   230,   430,   295,   431,   295,   236,   168,   442,
     102,   394,   443,   446,   447,   168,   448,   449,   457,   166,
     274,   459,   505,   319,   396,   520,   403,   147,   148,   149,
     506,   539,   525,   545,   319,   218,   546,   108,  -294,   109,
     274,   110,   548,   549,   262,   551,   552,   555,   167,   266,
     267,   556,   557,   558,   162,   560,   562,   404,   400,   563,
     588,   219,   578,   602,   603,   605,    90,   585,   593,   294,
     577,  -296,  -295,   274,   595,    26,    26,    26,    26,   598,
      26,   599,   600,   606,   476,   609,   611,    26,   168,   295,
     295,   626,   615,   627,    26,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,  -297,   274,   628,   162,  -298,
     634,   662,   677,   514,   683,   684,   274,   346,   694,   166,
      26,   100,   391,   698,    26,   699,   166,    26,    26,   150,
     162,   151,   700,   152,   701,    26,   704,   641,   705,    46,
     264,   658,    48,   253,   661,   252,   254,    90,   200,   638,
      26,    26,   255,    26,    26,   256,    26,    26,   639,   531,
      26,   535,   641,   493,    90,   146,   654,   267,   267,   592,
     504,   346,   574,   354,   488,   355,   356,     0,     0,     0,
      26,     1,     0,     2,     3,     4,   346,   294,     0,     0,
       0,     0,     0,   408,   346,   294,     0,    26,     0,   166,
      26,    26,   425,   641,   346,     0,   121,     0,     8,     0,
       0,     0,   294,   294,   476,   476,     0,     0,   559,     0,
       0,     0,     0,     0,   511,     0,     0,     0,     0,     0,
     162,     0,     0,   576,     0,     0,     0,   162,     0,     0,
       0,     0,   346,     0,     0,     0,   473,     0,     0,     0,
       0,     9,    10,     0,     0,     0,     0,     0,     0,     0,
     220,     0,     0,   267,     0,     0,     0,     0,   346,   346,
       0,     0,     0,     0,     0,   346,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     0,   507,   510,     0,    50,
       0,     0,   516,   346,     0,   294,     0,   346,     0,   346,
       0,     0,   346,     0,     0,     0,   346,     0,   601,   476,
     162,     0,   346,     0,   346,     0,     0,   350,     0,     0,
     612,     0,     0,     0,     0,   346,     0,   576,     0,     0,
       0,     0,     0,     0,     0,   294,   294,     0,     0,   375,
       0,     0,     0,     0,    82,     0,     0,    82,     0,    99,
       0,     0,     0,   629,     0,   375,     0,   632,     0,     0,
     635,   375,   473,     0,   561,     0,     0,     0,   566,   171,
       0,     0,     0,   408,     0,     0,   473,   473,     0,     0,
      99,     0,   171,   655,   656,     0,   657,   212,     0,   659,
       0,   294,     0,   294,     0,     0,     0,   346,   346,     0,
       0,     0,     0,     0,   432,   433,   434,   436,     0,     0,
     375,     0,   587,   679,    82,     0,   346,     0,     0,     0,
       0,     0,     0,     0,   346,   346,     0,    82,     0,   346,
     693,     0,    82,   695,     0,     0,   375,   498,   597,    99,
       0,     0,     0,   375,     0,     0,     0,     0,     0,   171,
       0,   282,   473,   284,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   375,   473,   498,     0,   375,     0,    98,
     375,   473,     0,     0,   498,     0,   294,   294,    99,   171,
     375,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     171,   272,     0,   212,    82,   337,     0,   473,     0,     0,
      98,   473,     0,     0,   473,     0,     0,    99,     0,     0,
     346,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   473,   473,     0,
     473,     0,     0,   473,   165,     0,     0,     0,    82,   335,
       0,   375,     0,     0,     0,     0,   191,   165,   191,     0,
      99,     0,   206,     0,     0,    82,     0,   473,     0,     0,
       0,     0,     0,    99,   378,   375,   498,     0,     0,     0,
       0,   384,     0,     0,   473,     0,     0,   473,     0,     0,
     402,     0,     0,     0,   375,     0,   415,   417,     0,     0,
       0,     0,   375,   375,     0,     0,     0,   498,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,   280,     0,     0,     0,
      82,     0,     0,   393,    82,     0,    82,     0,     0,     0,
       0,    82,     0,    99,     0,   402,     0,     0,     0,     0,
      82,     0,     0,     0,   320,     0,     0,     0,     0,     0,
      99,    99,   440,     0,     0,   320,     0,     0,     0,     0,
       0,   378,   500,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,   456,   165,   618,   619,   375,     0,
     212,     0,     0,     0,    99,     0,     0,     0,   402,   282,
     519,     0,     0,     0,     0,   402,     0,     0,     0,   527,
       0,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,   647,   648,    82,   649,   650,     0,
       0,     0,     0,     0,     0,   513,     0,     0,     0,   165,
       0,    82,     0,    99,     0,     0,   383,   665,    82,   666,
       0,     0,     0,   392,     0,   675,   676,     0,     0,     0,
       0,   165,     0,     0,     0,     0,     0,     0,   538,   377,
       0,   685,     0,   686,     0,   687,   402,   688,     0,     0,
       0,     0,     0,    99,    99,   377,     0,     0,     0,     0,
       0,   414,   416,   702,     0,   703,     0,     0,     0,     0,
       0,     0,   429,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,     0,    99,    99,     0,     0,   402,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    99,
     377,    99,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,   512,     0,     0,     0,     0,
       0,   165,     0,    98,   280,     0,   377,   499,   165,     0,
      99,     8,     0,   377,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   377,     0,   499,     0,   377,     0,     0,
     377,     0,     0,     0,   526,     0,     0,     0,     0,     0,
     533,     0,   534,   402,     9,    10,    11,     0,     0,    99,
       0,     0,     0,   542,    99,    99,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   165,     0,     0,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,    15,    16,
      17,    18,    19,    20,     0,     0,     0,     0,     0,     0,
       0,   377,     0,     0,   640,   696,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   377,   499,     0,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,   377,     0,     0,     0,     0,     0,
       0,     0,   591,   377,     0,     0,     0,   594,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,   460,   461,   462,   463,   464,   465,   466,   467,
     468,   469,   470,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,   471,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,   377,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     472,   348,  -346,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,   460,   461,   462,   463,   464,   465,   466,   467,
     468,   469,   470,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,   471,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     472,   348,  -345,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,   460,   461,   462,   463,   464,   465,   466,   467,
     468,   469,   470,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,   471,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     472,   348,  -347,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     214,   215,   216,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     214,   215,   258,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     214,   215,   342,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     353,   215,  -400,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     9,    10,    11,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     1,    14,
       2,     3,     4,     0,     0,    15,    16,    17,    18,    19,
      20,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     214,   215,   589,     0,     0,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,   288,     0,     0,     9,    10,
       0,   157,    76,     0,     0,   289,   158,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,    12,
      13,     0,     0,     0,     0,     1,   290,     2,     3,     4,
       0,     0,     0,   161,     0,     0,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   292,     0,   293,
       0,     0,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      75,     0,   288,     0,     0,     9,    10,     0,   157,    76,
       0,     0,   289,   158,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,    12,    13,     0,     0,
       0,     0,     1,   290,     2,     3,     4,     0,     0,     0,
     161,     0,     0,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   292,     0,   418,     0,     0,     8,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    75,     0,   288,
       0,     0,     9,    10,     0,   157,    76,     0,     0,   289,
     158,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,    12,    13,     0,     0,     0,     0,     1,
     290,     2,     3,     4,     0,     0,     0,   161,     0,     0,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   292,     0,   437,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,   288,     0,     0,     9,
      10,     0,   157,    76,     0,     0,   289,   158,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     1,   290,     2,     3,
       4,     0,     0,     0,   161,     0,     0,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   292,     0,
     543,     0,     0,     8,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    75,     0,   288,     0,     0,     9,    10,     0,   157,
      76,     0,     0,   289,   158,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,    12,    13,     0,
       0,     0,     0,     1,   290,     2,     3,     4,     0,     0,
       0,   161,     0,     0,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   292,     0,   544,     0,     0,
       8,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    75,     0,
     288,     0,     0,     9,    10,     0,   157,    76,     0,     0,
     289,   158,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,    12,    13,     0,     0,     0,     0,
       1,   290,     2,     3,     4,     0,     0,     0,   161,     0,
       0,   291,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   292,     0,   616,     0,     0,     8,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,   288,     0,     0,
       9,    10,     0,   157,    76,     0,     0,   289,   158,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,    12,    13,     0,     0,     0,     0,     0,   290,     1,
       0,     2,     3,     4,     5,   161,     6,     7,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   292,
       0,   617,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
     460,   461,   462,   463,   464,   465,   466,   467,   468,   469,
     470,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,   471,     0,     0,     0,     0,
       0,     0,     1,    77,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     8,
       0,     0,     0,    15,    16,    17,    18,    19,    20,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   472,   348,
       0,     0,     0,   460,   461,   462,   463,   464,   465,   466,
     467,   468,   469,   470,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,    15,    16,    17,    18,
      19,    20,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   472,   348,     0,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     9,    10,    11,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    14,   231,     0,     0,     0,     0,    15,
      16,    17,    18,    19,    20,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   215,     9,    10,    11,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    12,    13,     0,
       0,     0,     0,     0,    14,   263,     0,     0,     0,     0,
      15,    16,    17,    18,    19,    20,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,   215,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,    15,    16,    17,    18,    19,    20,     0,
       9,    10,    11,     0,     0,     0,     0,     0,     0,   215,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,     0,     0,     1,    14,     2,
       3,     4,     0,     0,    15,    16,    17,    18,    19,    20,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     640,     0,     0,     0,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,    75,     0,   288,     0,     0,     9,    10,     0,
     157,    76,     0,     0,   289,   158,     8,     0,     0,     0,
       0,    77,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,    78,     0,    12,    13,
       0,     0,     0,     0,     0,   290,     0,     0,     0,     8,
       0,     0,   161,     0,     0,   291,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     0,   292,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     9,    10,    11,     0,     0,    14,   607,     8,
       0,     0,     0,    15,    16,    17,    18,    19,    20,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   472,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,   636,     0,     0,     0,     0,    15,    16,    17,    18,
      19,    20,     9,    10,    11,     0,     0,     0,     0,     0,
       0,   472,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     2,     0,     0,
      14,     0,     0,     0,     0,     0,    15,    16,    17,    18,
      19,    20,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   564,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,   389,     0,     0,     0,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
      75,     0,     0,     0,     0,     0,     0,     0,   157,    76,
       0,     0,     0,   158,     0,     0,     0,     0,     8,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     2,     0,   203,     0,   204,     0,     0,     0,     0,
     161,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,   509,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
      94,     0,     0,     0,    75,    15,    16,    17,    18,    19,
      20,     0,   157,    76,     0,     0,     0,   158,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     2,     0,     0,   405,     0,     0,
       0,     0,     0,     0,   161,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   406,     0,   407,     8,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    75,     0,     0,
       0,     0,     0,     0,     0,   157,    76,     0,     0,     0,
     158,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,    78,     2,     3,     4,     5,     0,     6,     7,     0,
     345,     0,     0,     0,     0,     0,     0,   161,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,   569,     0,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       9,    10,    11,   157,    76,     0,     0,     0,   158,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,    12,    13,     0,     0,     0,     0,     0,   398,    94,
       0,     0,     0,     0,    15,   399,    17,    18,    19,    20,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       9,    10,    11,     0,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,    12,    13,     0,     0,     0,     0,     0,    14,    94,
       0,     0,     0,     0,    15,    16,    17,    18,    19,    20,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       9,    10,    11,     0,    76,     0,     0,     8,     1,     0,
       2,     3,     4,     5,    77,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,    12,    13,     0,     0,     8,     0,     0,    50,    94,
       0,     0,     0,     0,    15,    16,    17,    18,    19,    20,
       9,    10,    11,   157,     0,     0,     0,     0,   158,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,    12,    13,     0,     0,     0,     8,     0,   398,    94,
       0,     0,     0,     0,    15,   399,    17,    18,    19,    20,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,   333,
       0,     0,    15,    16,    17,    18,    19,    20,     0,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
     454,     0,     0,    15,    16,    17,    18,    19,    20,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     0,     0,     0,     1,     8,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     8,     0,     0,     0,     0,
      14,     0,     0,   536,     0,     0,    15,    16,    17,    18,
      19,    20,     9,    10,    11,     0,     0,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,     0,     0,    12,    13,     8,     0,     0,     0,     0,
      14,   604,     0,     0,     0,     0,    15,    16,    17,    18,
      19,    20,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,   660,     0,     0,
       0,     0,    15,    16,    17,    18,    19,    20,     9,    10,
      11,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,    15,    16,    17,    18,    19,    20,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     8,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,    12,    13,     0,     0,     0,     0,     0,    45,
       0,     0,     0,     0,     0,    15,    16,    17,    18,    19,
      20,     9,    10,    11,     0,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    50,
       0,     0,     0,    75,     0,    15,    16,    17,    18,    19,
      20,   157,    76,     0,     0,     0,   158,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,   371,   330,   204,     0,
       0,     0,     0,   161,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,     0,     0,     0,     0,     0,     0,     0,
     157,    76,     0,     0,     0,   158,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,   371,     0,   204,     0,     0,
       0,     0,   161,     8,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    75,     0,     0,     0,     0,     0,     0,     0,   157,
      76,     0,     0,     0,   158,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,   345,     0,     0,     0,     0,     0,
       0,   161,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      75,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   424,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,     0,     0,     0,     0,     0,
       0,   157,    76,     0,     0,     0,   158,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,   203,   330,   204,     0,
       0,     0,     0,   161,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,     0,     0,     0,     0,     0,     0,     0,
     157,    76,     0,     0,     0,   158,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,   159,     0,   160,     0,     0,
       0,     0,   161,     8,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    75,     0,     0,     0,     0,     0,     0,     0,   157,
      76,     0,     0,     0,   158,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,   159,     0,   198,     0,     0,     0,
       0,   161,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      75,     0,     0,     0,     0,     0,     0,     0,   157,    76,
       0,     0,     0,   158,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,   159,   273,     0,     0,     0,     0,     0,
     161,     8,    53,    54,    55,    56,    57,   175,   176,   177,
     178,   179,   180,   181,   182,   183,   184,    68,    69,   185,
     186,    72,    73,    74,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   187,
       0,     0,     0,     0,     0,     0,     0,   157,    76,     0,
       0,     0,   158,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   188,     0,     0,     0,     0,     0,     0,
       0,     0,   159,     0,   318,     0,     0,     0,     0,   161,
       8,    53,    54,    55,    56,    57,   175,   176,   177,   178,
     179,   180,   181,   182,   183,   184,    68,    69,   185,   186,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   187,     0,
       0,     0,     0,     0,     0,     0,   157,    76,     8,     0,
       0,   158,     0,     0,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,   188,     0,     0,     0,     0,     0,     0,     0,
       0,   159,     0,   327,     0,     0,    75,     0,   161,     0,
       0,     0,     0,     0,   157,    76,     0,     0,     0,   158,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,   203,
       0,   204,     0,     0,     0,     0,   161,     8,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   386,
       8,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    75,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   452,     8,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    75,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,   521,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,   503,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     0,     0,     0,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     8,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,   389,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    75,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     8,    53,    54,    55,    56,    57,
     175,   176,   177,   178,   179,   180,   181,   182,   183,   184,
      68,    69,   185,   186,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   187,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   188
};

static const short int yycheck[] =
{
       0,    14,     0,   220,    79,    97,     6,     7,   143,   349,
     108,   274,    69,     3,    14,   163,   349,    92,   344,   288,
      27,   205,    97,   171,   122,    69,    10,   298,   212,    13,
      69,    13,    74,   296,    79,     3,     3,    50,    28,    69,
     159,   114,     3,   560,    86,    45,   640,   315,   316,    91,
      50,    93,   150,    70,   112,   128,   109,   112,   112,     3,
      28,    70,   131,   116,     3,   172,    14,     3,   117,   118,
       3,    17,   289,   131,   114,   132,   131,   131,   404,   296,
     215,    12,    13,   128,   159,    44,    45,   681,   132,   378,
     130,   608,   132,   132,   104,    28,   109,    45,    69,    70,
     189,   128,   132,    91,   131,    93,    14,    70,   108,   109,
     108,   200,   115,   402,   189,   132,    75,   124,   125,   126,
     104,   390,   122,   132,   122,   200,   415,     3,   203,   142,
      74,    79,   109,   143,   111,    79,   284,    45,   151,   479,
     480,   131,   142,    91,    92,    93,   479,   189,   109,    97,
     150,   151,   150,   337,     7,     8,     9,   116,   200,   143,
     125,   132,   172,   131,   131,   109,   285,   438,   439,   132,
     109,    79,   116,   109,     3,   111,   160,   116,   160,   396,
     116,   127,   274,    91,    92,    93,   305,    70,   372,    97,
      16,   298,   123,   124,   378,     0,    69,    70,    74,   274,
     126,   189,   202,    79,   202,   215,   213,     3,   315,   316,
     131,   500,   200,   476,   198,   290,   198,    14,   228,   338,
     204,   296,   204,   109,     9,   114,   494,    12,   496,   114,
     519,   215,   307,   109,   574,   111,   110,    91,   527,    93,
     114,   189,   110,   132,   228,    74,     3,   132,    45,   132,
      79,   110,   200,   114,    92,   114,   109,   114,   111,   132,
     113,   359,    69,    70,   110,   528,     7,     8,     9,   130,
     345,   132,   220,   130,    69,    70,   129,   290,    74,   116,
     109,   189,    79,    79,   121,   122,     3,   116,   298,   110,
     290,   114,   200,   114,   114,    92,   371,   110,   390,   128,
      97,   114,   286,   378,   286,   315,   316,   130,   579,   580,
     130,   110,   220,   109,   110,   390,   500,    74,    28,   104,
     116,   159,    79,   398,   110,   132,   274,   402,   114,   110,
     405,   438,   439,   114,   318,   189,   318,   132,   114,   131,
     415,   351,   326,   327,   326,   327,   200,   389,   296,   349,
     613,   189,   109,   395,   130,   339,   131,   339,   143,   359,
     344,   359,   200,   114,    44,    45,   274,   351,   109,   109,
     111,   111,   113,   109,   159,   114,   116,   361,   110,   130,
     110,   365,   114,   365,   114,   398,   111,   494,   296,   496,
     525,   130,   110,    79,    74,    75,   114,   109,   398,    79,
     109,   476,   111,    10,    11,    91,    92,    93,    14,    15,
     420,   131,   132,   133,   134,     7,     8,     9,   203,   112,
     404,   114,   406,   220,   406,   500,   130,   131,   438,   439,
     215,   112,   109,   114,   111,   131,   116,   127,   128,   423,
     131,   423,   109,   228,   519,   129,   130,   111,   396,   131,
     398,    74,   527,   528,   132,   403,   132,   470,   442,   129,
     442,   110,   446,    86,   446,   465,   135,   136,   270,   271,
     470,   110,   579,   580,   110,   112,   460,   274,   460,   479,
     480,   114,   105,   130,   494,   130,   496,   110,   396,   111,
     398,   288,   112,   111,   110,   403,   110,   112,   132,   296,
     285,   132,   110,   189,   289,   110,   291,     7,     8,     9,
     112,   110,   131,   110,   200,   525,   112,   109,   131,   111,
     305,   113,   112,   112,   147,   110,   112,   128,   476,   152,
     153,   109,   109,   109,   220,   109,   130,   129,   613,   130,
     110,   525,   130,   556,   557,   558,   530,   131,   530,   172,
     132,   131,   131,   338,   112,   555,   556,   557,   558,   112,
     560,   112,   128,    56,   349,   130,   129,   567,   476,   579,
     580,   131,   129,   132,   574,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,   131,   371,   128,   274,   131,
     109,   130,    64,   390,   132,   132,   381,   220,   130,   396,
     600,   398,   288,   132,   604,   132,   403,   607,   608,   109,
     296,   111,   132,   113,   132,   615,   132,   615,   132,     5,
     150,   634,     5,   138,   637,   137,   139,   611,    93,   611,
     630,   631,   140,   633,   634,   141,   636,   637,   613,   412,
     640,   420,   640,   366,   628,    45,   628,   270,   271,   528,
     381,   274,   479,   228,   351,   228,   228,    -1,    -1,    -1,
     660,     1,    -1,     3,     4,     5,   289,   290,    -1,    -1,
      -1,    -1,    -1,   296,   297,   298,    -1,   677,    -1,   476,
     680,   681,   305,   681,   307,    -1,   129,    -1,    28,    -1,
      -1,    -1,   315,   316,   479,   480,    -1,    -1,   465,    -1,
      -1,    -1,    -1,    -1,   390,    -1,    -1,    -1,    -1,    -1,
     396,    -1,    -1,   480,    -1,    -1,    -1,   403,    -1,    -1,
      -1,    -1,   345,    -1,    -1,    -1,   349,    -1,    -1,    -1,
      -1,    71,    72,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     525,    -1,    -1,   366,    -1,    -1,    -1,    -1,   371,   372,
      -1,    -1,    -1,    -1,    -1,   378,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,   389,   390,    -1,   109,
      -1,    -1,   395,   396,    -1,   398,    -1,   400,    -1,   402,
      -1,    -1,   405,    -1,    -1,    -1,   409,    -1,   555,   574,
     476,    -1,   415,    -1,   417,    -1,    -1,   223,    -1,    -1,
     567,    -1,    -1,    -1,    -1,   428,    -1,   574,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   438,   439,    -1,    -1,   274,
      -1,    -1,    -1,    -1,     9,    -1,    -1,    12,    -1,    14,
      -1,    -1,    -1,   600,    -1,   290,    -1,   604,    -1,    -1,
     607,   296,   465,    -1,   467,    -1,    -1,    -1,   471,    79,
      -1,    -1,    -1,   476,    -1,    -1,   479,   480,    -1,    -1,
      45,    -1,    92,   630,   631,    -1,   633,    97,    -1,   636,
      -1,   494,    -1,   496,    -1,    -1,    -1,   500,   501,    -1,
      -1,    -1,    -1,    -1,   310,   311,   312,   313,    -1,    -1,
     345,    -1,   515,   660,    79,    -1,   519,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   527,   528,    -1,    92,    -1,   532,
     677,    -1,    97,   680,    -1,    -1,   371,   372,   541,   104,
      -1,    -1,    -1,   378,    -1,    -1,    -1,    -1,    -1,   159,
      -1,   161,   555,   163,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   398,   567,   400,    -1,   402,    -1,    14,
     405,   574,    -1,    -1,   409,    -1,   579,   580,   143,   189,
     415,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     200,   156,    -1,   203,   159,   205,    -1,   600,    -1,    -1,
      45,   604,    -1,    -1,   607,    -1,    -1,   172,    -1,    -1,
     613,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   630,   631,    -1,
     633,    -1,    -1,   636,    79,    -1,    -1,    -1,   203,   204,
      -1,   476,    -1,    -1,    -1,    -1,    91,    92,    93,    -1,
     215,    -1,    97,    -1,    -1,   220,    -1,   660,    -1,    -1,
      -1,    -1,    -1,   228,   274,   500,   501,    -1,    -1,    -1,
      -1,   281,    -1,    -1,   677,    -1,    -1,   680,    -1,    -1,
     290,    -1,    -1,    -1,   519,    -1,   296,   297,    -1,    -1,
      -1,    -1,   527,   528,    -1,    -1,    -1,   532,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   274,
      -1,    -1,    -1,    -1,    -1,    -1,   161,    -1,    -1,    -1,
     285,    -1,    -1,   288,   289,    -1,   291,    -1,    -1,    -1,
      -1,   296,    -1,   298,    -1,   345,    -1,    -1,    -1,    -1,
     305,    -1,    -1,    -1,   189,    -1,    -1,    -1,    -1,    -1,
     315,   316,   317,    -1,    -1,   200,    -1,    -1,    -1,    -1,
      -1,   371,   372,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   338,   339,   220,   582,   583,   613,    -1,
     390,    -1,    -1,    -1,   349,    -1,    -1,    -1,   398,   399,
     400,    -1,    -1,    -1,    -1,   405,    -1,    -1,    -1,   409,
      -1,    -1,    -1,    -1,    -1,    -1,   371,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   620,   621,   381,   623,   624,    -1,
      -1,    -1,    -1,    -1,    -1,   390,    -1,    -1,    -1,   274,
      -1,   396,    -1,   398,    -1,    -1,   281,   643,   403,   645,
      -1,    -1,    -1,   288,    -1,   651,   652,    -1,    -1,    -1,
      -1,   296,    -1,    -1,    -1,    -1,    -1,    -1,   423,   274,
      -1,   667,    -1,   669,    -1,   671,   476,   673,    -1,    -1,
      -1,    -1,    -1,   438,   439,   290,    -1,    -1,    -1,    -1,
      -1,   296,   297,   689,    -1,   691,    -1,    -1,    -1,    -1,
      -1,    -1,   307,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   476,    -1,    -1,   479,   480,    -1,    -1,   528,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   494,
     345,   496,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,   390,    -1,    -1,    -1,    -1,
      -1,   396,    -1,   398,   399,    -1,   371,   372,   403,    -1,
     525,    28,    -1,   378,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   398,    -1,   400,    -1,   402,    -1,    -1,
     405,    -1,    -1,    -1,   409,    -1,    -1,    -1,    -1,    -1,
     415,    -1,   417,   613,    71,    72,    73,    -1,    -1,   574,
      -1,    -1,    -1,   428,   579,   580,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   476,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,   115,   116,
     117,   118,   119,   120,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   476,    -1,    -1,   131,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   500,   501,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,   519,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   527,   528,    -1,    -1,    -1,   532,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,   613,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,     1,   109,
       3,     4,     5,    -1,    -1,   115,   116,   117,   118,   119,
     120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     130,   131,   132,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,     5,
      -1,    -1,    -1,   116,    -1,    -1,   119,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,   132,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,     1,   109,     3,     4,     5,    -1,    -1,    -1,
     116,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   130,    -1,   132,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,     1,
     109,     3,     4,     5,    -1,    -1,    -1,   116,    -1,    -1,
     119,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   130,    -1,   132,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,
       5,    -1,    -1,    -1,   116,    -1,    -1,   119,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,
     132,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,     1,   109,     3,     4,     5,    -1,    -1,
      -1,   116,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   130,    -1,   132,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
       1,   109,     3,     4,     5,    -1,    -1,    -1,   116,    -1,
      -1,   119,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   130,    -1,   132,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,     1,
      -1,     3,     4,     5,     6,   116,     8,     9,   119,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,
      -1,   132,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    85,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    28,
      -1,    -1,    -1,   115,   116,   117,   118,   119,   120,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,   131,
      -1,    -1,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,
     119,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   130,   131,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,    -1,    -1,    -1,    -1,   115,
     116,   117,   118,   119,   120,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,    -1,    -1,    -1,    -1,
     115,   116,   117,   118,   119,   120,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,   131,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,   115,   116,   117,   118,   119,   120,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,
       4,     5,    -1,    -1,   115,   116,   117,   118,   119,   120,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    28,    -1,    -1,    -1,
      -1,    85,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    28,
      -1,    -1,   116,    -1,    -1,   119,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,   130,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    71,    72,    73,    -1,    -1,   109,   110,    28,
      -1,    -1,    -1,   115,   116,   117,   118,   119,   120,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,    -1,    -1,    -1,    -1,   115,   116,   117,   118,
     119,   120,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,     3,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,
     119,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   130,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    28,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,   109,    -1,   111,    -1,    -1,    -1,    -1,
     116,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,   131,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,    -1,    -1,    -1,    66,   115,   116,   117,   118,   119,
     120,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,   116,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   128,    -1,   130,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,   100,     3,     4,     5,     6,    -1,     8,     9,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,   116,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,   130,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
      -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,   120,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
      -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,   120,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    28,     1,    -1,
       3,     4,     5,     6,    85,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    28,    -1,    -1,   109,   110,
      -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,   120,
      71,    72,    73,    74,    -1,    -1,    -1,    -1,    79,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,   102,   103,    -1,    -1,    -1,    28,    -1,   109,   110,
      -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,   120,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,   116,   117,   118,   119,   120,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,   116,   117,   118,   119,   120,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,     1,    28,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    28,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,   116,   117,   118,
     119,   120,    71,    72,    73,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,   102,   103,    28,    -1,    -1,    -1,    -1,
     109,   110,    -1,    -1,    -1,    -1,   115,   116,   117,   118,
     119,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,    -1,    -1,
      -1,    -1,   115,   116,   117,   118,   119,   120,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,   115,   116,   117,   118,   119,   120,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,   115,   116,   117,   118,   119,
     120,    71,    72,    73,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    66,    -1,   115,   116,   117,   118,   119,
     120,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,    -1,
      -1,    -1,    -1,   116,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    -1,
      -1,    -1,   116,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,   116,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,    -1,
      -1,    -1,    -1,   116,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    -1,
      -1,    -1,   116,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    -1,    -1,
      -1,   116,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,   110,    -1,    -1,    -1,    -1,    -1,
     116,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,   111,    -1,    -1,    -1,    -1,   116,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    28,    -1,
      -1,    79,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,   111,    -1,    -1,    66,    -1,   116,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,   111,    -1,    -1,    -1,    -1,   116,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   115,   116,   117,   118,   119,
     120,   134,   135,   136,   138,   141,   142,   144,   145,   146,
     147,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     157,   172,   173,   222,   236,   109,   136,   139,   141,   143,
     109,   142,   142,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    66,    75,    85,   100,   163,
     168,   171,   172,   174,   176,   177,   178,   186,   187,   142,
     156,   160,   163,   160,   110,   157,   159,   162,   171,   172,
     174,   176,   187,   206,   131,     7,     8,     9,   109,   111,
     113,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   129,   158,   145,   116,   121,   122,   117,   118,    10,
      11,    12,    13,   123,   124,    14,    15,   115,   125,   126,
      16,    17,   127,   131,     0,   142,   206,     7,     8,     9,
     109,   111,   113,   131,   134,   173,   109,    74,    79,   109,
     111,   116,   168,   169,   170,   171,   174,   176,   187,   191,
     193,   201,   131,   134,   173,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    46,    47,    66,   100,   165,
     168,   171,   173,   175,   176,   177,   186,   187,   111,   193,
     165,   110,   114,   109,   111,   169,   171,   174,   176,   187,
     190,   192,   201,   110,   130,   131,   132,   137,   138,   156,
     163,   208,   223,   229,   230,   231,   232,   233,   234,   235,
     134,   110,   137,   140,   157,   159,   134,   137,   157,   145,
     145,   145,   146,   146,   147,   147,   148,   148,   148,   148,
     149,   149,   150,   151,   152,   153,   154,   159,   132,   235,
     110,   110,   134,   110,   140,   159,   134,   134,   188,   189,
     131,   131,   172,   110,   163,   193,   202,   203,   204,   160,
     171,   200,   201,   191,   201,   109,   111,   191,    68,    78,
     109,   119,   130,   132,   134,   138,   163,   169,   179,   180,
     181,   182,   183,   195,   196,   198,   199,   201,   221,   222,
     224,   225,   226,   227,   228,   131,   131,   109,   111,   168,
     171,   175,   176,   187,   193,   160,   111,   111,   193,   157,
     110,   192,   202,   112,   160,   172,   190,   201,   109,   111,
     190,   145,   132,   235,   129,   109,   134,   196,   131,   215,
     216,   114,   130,   130,   230,   232,   233,   132,   110,   114,
     112,   128,   132,   110,   112,   129,   114,   132,   188,   188,
     110,   109,   169,   192,   194,   195,   197,   199,   201,   110,
     110,   114,   112,   171,   201,   191,   110,   202,   160,    50,
     164,   168,   171,   172,   174,   178,   163,   196,   109,   116,
     169,   194,   201,   163,   129,   109,   128,   130,   134,   169,
     184,   185,   194,   196,   199,   201,   199,   201,   132,   183,
     114,   130,   109,   111,   110,   134,   202,   205,   169,   199,
     130,   130,   216,   216,   216,   130,   216,   132,   179,   179,
     172,   160,   111,   112,   160,   160,   111,   110,   110,   112,
     112,   190,   110,   202,   112,   160,   172,   132,   208,   132,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    77,   130,   134,   159,   161,   163,   210,   211,   212,
     213,   214,   216,   217,   218,   219,   220,   221,   231,   137,
     157,   156,   160,   189,   130,   132,   130,   132,   195,   199,
     201,   169,   197,    51,   204,   110,   112,   134,   173,   131,
     134,   168,   171,   172,   174,   192,   134,   173,   196,   201,
     110,   109,   208,   110,   160,   131,   199,   201,   114,   130,
     128,   170,   169,   199,   199,   180,   112,   160,   172,   110,
     110,   114,   199,   132,   132,   110,   112,   160,   112,   112,
     160,   110,   112,   112,   160,   128,   109,   109,   109,   210,
     109,   134,   130,   130,   130,   159,   134,   128,   130,   130,
     166,   167,   194,   161,   213,   161,   210,   132,   130,   179,
     179,   197,    69,    70,   132,   131,   131,   134,   110,   132,
     235,   199,   185,   160,   199,   112,   112,   134,   112,   112,
     128,   210,   159,   159,   110,   159,    56,   110,   217,   130,
     130,   129,   210,   114,   130,   129,   132,   132,   216,   216,
      69,    70,   132,    69,    70,   132,   131,   132,   128,   210,
     110,   110,   210,   110,   109,   210,   110,   217,   160,   167,
     131,   157,   207,    70,   132,    69,   132,   216,   216,   216,
     216,    69,    70,   132,   160,   210,   210,   210,   159,   210,
     110,   159,   130,   207,   209,   216,   216,    70,   132,    69,
     132,    70,   132,    69,   132,   216,   216,    64,   110,   210,
     110,   114,   132,   132,   132,   216,   216,   216,   216,    70,
     132,    69,   132,   210,   130,   210,   132,   207,   132,   132,
     132,   132,   216,   216,   132,   132
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
#line 154 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); ;}
    break;

  case 4:
#line 160 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:
#line 165 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:
#line 167 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:
#line 169 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:
#line 171 "expression.y"
    { (yyval.exp) = MkExpString(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:
#line 173 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 10:
#line 175 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:
#line 176 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 12:
#line 177 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:
#line 178 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:
#line 179 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:
#line 180 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:
#line 181 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:
#line 182 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:
#line 183 "expression.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 19:
#line 187 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:
#line 192 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:
#line 193 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:
#line 194 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:
#line 195 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:
#line 196 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:
#line 197 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:
#line 198 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:
#line 204 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:
#line 205 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:
#line 206 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:
#line 207 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:
#line 208 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:
#line 209 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:
#line 210 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:
#line 214 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 37:
#line 215 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 38:
#line 216 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 39:
#line 217 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 40:
#line 221 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:
#line 222 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:
#line 223 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:
#line 224 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:
#line 225 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:
#line 226 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:
#line 240 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 51:
#line 241 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 52:
#line 242 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 53:
#line 243 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 54:
#line 244 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 55:
#line 245 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 56:
#line 246 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 58:
#line 251 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:
#line 256 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:
#line 257 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:
#line 258 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:
#line 263 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:
#line 264 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:
#line 269 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 68:
#line 270 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:
#line 275 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:
#line 276 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:
#line 277 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:
#line 278 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:
#line 283 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:
#line 284 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:
#line 289 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:
#line 294 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:
#line 299 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:
#line 304 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:
#line 309 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:
#line 314 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:
#line 319 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:
#line 321 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:
#line 326 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 93:
#line 327 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 94:
#line 328 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 95:
#line 329 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 96:
#line 330 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 97:
#line 331 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 98:
#line 332 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 99:
#line 333 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 100:
#line 334 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 101:
#line 335 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 102:
#line 336 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 103:
#line 340 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 104:
#line 341 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 106:
#line 349 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 107:
#line 350 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 108:
#line 351 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 109:
#line 352 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 110:
#line 356 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 111:
#line 357 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 112:
#line 358 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 113:
#line 359 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 114:
#line 360 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 115:
#line 361 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 116:
#line 362 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 117:
#line 363 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 118:
#line 367 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 119:
#line 368 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 120:
#line 369 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 121:
#line 370 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 122:
#line 371 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 123:
#line 372 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 124:
#line 373 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 125:
#line 374 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 126:
#line 375 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 127:
#line 376 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 128:
#line 390 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 129:
#line 391 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 130:
#line 392 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 131:
#line 393 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 132:
#line 394 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 133:
#line 395 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 134:
#line 396 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 135:
#line 397 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 136:
#line 401 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 137:
#line 402 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 138:
#line 403 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 139:
#line 404 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 140:
#line 405 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 141:
#line 406 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 142:
#line 407 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 143:
#line 408 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 144:
#line 409 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 145:
#line 410 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 146:
#line 414 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 147:
#line 415 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 148:
#line 419 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 149:
#line 420 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 150:
#line 424 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 151:
#line 425 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 152:
#line 426 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 153:
#line 427 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 154:
#line 428 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 155:
#line 432 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 157:
#line 437 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 158:
#line 442 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 159:
#line 443 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 160:
#line 444 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 161:
#line 448 "expression.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 162:
#line 473 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 163:
#line 477 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 164:
#line 478 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 165:
#line 479 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 166:
#line 480 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 167:
#line 481 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 168:
#line 482 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 169:
#line 483 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 170:
#line 484 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 171:
#line 485 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 172:
#line 486 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 173:
#line 487 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 174:
#line 488 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 175:
#line 489 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 179:
#line 493 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 180:
#line 494 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 181:
#line 498 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 182:
#line 499 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 183:
#line 500 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 184:
#line 501 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 185:
#line 502 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 186:
#line 503 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 187:
#line 504 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 188:
#line 505 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 189:
#line 506 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 190:
#line 507 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 191:
#line 508 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 192:
#line 509 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 196:
#line 513 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 197:
#line 514 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 198:
#line 519 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 199:
#line 520 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); ;}
    break;

  case 200:
#line 521 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-2].id).string); ;}
    break;

  case 201:
#line 522 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); ;}
    break;

  case 202:
#line 524 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 203:
#line 528 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 204:
#line 530 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 205:
#line 568 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 206:
#line 569 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 207:
#line 573 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 208:
#line 574 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 209:
#line 578 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 210:
#line 582 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 211:
#line 583 "expression.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 212:
#line 588 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 213:
#line 590 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 214:
#line 592 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 215:
#line 594 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 216:
#line 596 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 217:
#line 599 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 218:
#line 601 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 219:
#line 603 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 220:
#line 605 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 221:
#line 607 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 222:
#line 610 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 223:
#line 612 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 224:
#line 614 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 225:
#line 616 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 226:
#line 618 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 227:
#line 621 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 228:
#line 623 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 229:
#line 625 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 230:
#line 627 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 231:
#line 629 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 232:
#line 633 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 233:
#line 634 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 234:
#line 635 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 235:
#line 636 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 236:
#line 637 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 237:
#line 638 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 238:
#line 639 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 239:
#line 640 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 240:
#line 645 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 241:
#line 647 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 242:
#line 652 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 243:
#line 654 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 244:
#line 656 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 245:
#line 658 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 246:
#line 660 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 247:
#line 664 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 248:
#line 665 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 249:
#line 670 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); ;}
    break;

  case 250:
#line 671 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 251:
#line 672 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].id).string); ;}
    break;

  case 252:
#line 673 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); ;}
    break;

  case 253:
#line 674 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 254:
#line 691 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 255:
#line 693 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 256:
#line 698 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 257:
#line 700 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 258:
#line 706 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 259:
#line 708 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 260:
#line 710 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 261:
#line 712 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 262:
#line 714 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 263:
#line 716 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 264:
#line 718 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 265:
#line 720 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 266:
#line 722 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 267:
#line 724 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 268:
#line 726 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 269:
#line 731 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 270:
#line 733 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 271:
#line 735 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 272:
#line 737 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 273:
#line 739 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 274:
#line 743 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 276:
#line 745 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 277:
#line 746 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 278:
#line 747 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 279:
#line 748 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 280:
#line 752 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 282:
#line 754 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 283:
#line 755 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 284:
#line 756 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 285:
#line 757 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 287:
#line 805 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 288:
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 289:
#line 813 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 290:
#line 815 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 291:
#line 817 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 292:
#line 819 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 293:
#line 821 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 295:
#line 827 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 296:
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 297:
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 298:
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 301:
#line 842 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 302:
#line 844 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 304:
#line 853 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 305:
#line 855 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 306:
#line 857 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 307:
#line 861 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 308:
#line 862 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 309:
#line 866 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 310:
#line 867 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 311:
#line 868 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 312:
#line 869 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 314:
#line 874 "expression.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 315:
#line 878 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 316:
#line 879 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 317:
#line 883 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 318:
#line 884 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 319:
#line 885 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 320:
#line 889 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 321:
#line 890 "expression.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 322:
#line 894 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 323:
#line 895 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 324:
#line 905 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 325:
#line 907 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 326:
#line 909 "expression.y"
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

  case 327:
#line 924 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 328:
#line 926 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 329:
#line 947 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 330:
#line 949 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 337:
#line 963 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 338:
#line 965 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 339:
#line 967 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 340:
#line 971 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 341:
#line 972 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 342:
#line 976 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 343:
#line 977 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 344:
#line 980 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); ;}
    break;

  case 345:
#line 984 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 346:
#line 985 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 347:
#line 986 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 348:
#line 990 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 349:
#line 995 "expression.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 350:
#line 1003 "expression.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 351:
#line 1007 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 352:
#line 1008 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 353:
#line 1012 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 354:
#line 1013 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 355:
#line 1014 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 356:
#line 1018 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 357:
#line 1019 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 358:
#line 1020 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 359:
#line 1021 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 360:
#line 1023 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 361:
#line 1024 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 362:
#line 1025 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 363:
#line 1029 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 364:
#line 1030 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 365:
#line 1031 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 366:
#line 1032 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 367:
#line 1033 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 368:
#line 1083 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 369:
#line 1085 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 370:
#line 1090 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 371:
#line 1092 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 372:
#line 1094 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 373:
#line 1096 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 374:
#line 1101 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 375:
#line 1103 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 376:
#line 1108 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 377:
#line 1110 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 378:
#line 1115 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 379:
#line 1120 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 380:
#line 1125 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 381:
#line 1127 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 382:
#line 1132 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 383:
#line 1134 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 384:
#line 1136 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 385:
#line 1138 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 386:
#line 1140 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 387:
#line 1146 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 388:
#line 1151 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 389:
#line 1160 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 390:
#line 1161 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 391:
#line 1166 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 392:
#line 1168 "expression.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 393:
#line 1173 "expression.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 394:
#line 1177 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 395:
#line 1178 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 396:
#line 1179 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 397:
#line 1180 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 398:
#line 1181 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 399:
#line 1182 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 401:
#line 1187 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 402:
#line 1188 "expression.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 403:
#line 1192 "expression.y"
    { parsedExpression = (yyvsp[0].exp); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 4999 "expression.ec"

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


#line 1194 "expression.y"



