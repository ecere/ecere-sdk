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
#define YYFINAL  147
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   6238

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  105
/* YYNRULES -- Number of rules. */
#define YYNRULES  406
/* YYNRULES -- Number of states. */
#define YYNSTATES  711

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
       2,     2,     2,   121,     2,     2,   111,   123,   116,     2,
     109,   110,   117,   118,   115,   119,   112,   122,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   129,   131,
     124,   130,   125,   128,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   113,     2,   114,   126,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,   127,   133,   120,     2,     2,     2,
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
      22,    27,    30,    37,    43,    50,    56,    64,    71,    79,
      86,    88,    90,    92,    97,   101,   106,   110,   114,   117,
     120,   122,   127,   131,   136,   140,   144,   147,   150,   152,
     154,   158,   162,   165,   168,   171,   176,   179,   184,   186,
     188,   190,   192,   194,   196,   198,   200,   202,   204,   206,
     208,   213,   215,   219,   223,   227,   229,   233,   237,   239,
     243,   247,   249,   253,   257,   261,   265,   267,   271,   275,
     277,   281,   283,   287,   289,   293,   295,   299,   301,   305,
     307,   313,   315,   319,   323,   325,   327,   329,   331,   333,
     335,   337,   339,   341,   343,   345,   347,   351,   353,   356,
     360,   363,   369,   371,   374,   376,   379,   381,   384,   386,
     389,   391,   394,   396,   399,   401,   404,   406,   409,   411,
     414,   416,   419,   421,   424,   426,   429,   431,   434,   436,
     439,   441,   444,   446,   449,   451,   454,   456,   459,   461,
     465,   467,   471,   473,   475,   477,   479,   481,   483,   485,
     487,   489,   491,   493,   495,   497,   499,   501,   503,   505,
     507,   509,   511,   513,   515,   517,   519,   521,   523,   525,
     527,   529,   534,   536,   538,   540,   542,   544,   546,   548,
     550,   552,   554,   556,   558,   560,   562,   564,   566,   571,
     573,   579,   584,   589,   593,   599,   602,   605,   607,   609,
     611,   614,   618,   620,   624,   634,   644,   652,   660,   666,
     677,   688,   697,   706,   713,   722,   731,   738,   745,   750,
     760,   770,   778,   786,   792,   796,   799,   802,   805,   807,
     810,   812,   814,   816,   820,   822,   825,   828,   832,   838,
     841,   844,   849,   855,   863,   871,   877,   879,   883,   885,
     889,   893,   896,   900,   904,   908,   913,   918,   921,   925,
     929,   934,   938,   941,   945,   949,   954,   956,   958,   961,
     964,   967,   971,   973,   975,   978,   981,   984,   988,   990,
     993,   997,   999,  1003,  1008,  1012,  1017,  1019,  1022,  1025,
    1029,  1033,  1035,  1037,  1040,  1043,  1046,  1050,  1054,  1057,
    1059,  1062,  1064,  1067,  1070,  1074,  1076,  1080,  1082,  1086,
    1089,  1092,  1094,  1096,  1100,  1102,  1105,  1107,  1111,  1116,
    1118,  1120,  1122,  1126,  1128,  1130,  1132,  1134,  1136,  1138,
    1142,  1147,  1151,  1153,  1156,  1158,  1161,  1164,  1166,  1168,
    1171,  1173,  1176,  1180,  1182,  1185,  1191,  1199,  1205,  1211,
    1219,  1226,  1234,  1239,  1245,  1250,  1254,  1257,  1260,  1263,
    1267,  1269,  1275,  1280,  1285,  1289,  1294,  1298,  1302,  1305,
    1308,  1310,  1314,  1319,  1323,  1326,  1329,  1332,  1335,  1338,
    1341,  1344,  1347,  1351,  1353,  1355,  1359,  1362,  1364,  1366,
    1369,  1372,  1374,  1377,  1379,  1381,  1384
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     238,     0,    -1,     3,    -1,   137,    -1,   109,   160,   110,
      -1,   135,    -1,   224,    -1,     4,    -1,   222,    -1,   111,
     222,    -1,   111,   222,   112,   222,    -1,   109,   110,    -1,
      71,   164,   194,   113,   161,   114,    -1,    71,   164,   113,
     161,   114,    -1,   102,   164,   194,   113,   161,   114,    -1,
     102,   164,   113,   161,   114,    -1,    72,   161,   166,   194,
     113,   161,   114,    -1,    72,   161,   166,   113,   161,   114,
      -1,   103,   161,   166,   194,   113,   161,   114,    -1,   103,
     161,   166,   113,   161,   114,    -1,     1,    -1,   225,    -1,
     136,    -1,   139,   113,   160,   114,    -1,   139,   109,   110,
      -1,   139,   109,   141,   110,    -1,   139,   112,   135,    -1,
     139,     7,   135,    -1,   139,     8,    -1,   139,     9,    -1,
     137,    -1,   140,   113,   160,   114,    -1,   140,   109,   110,
      -1,   140,   109,   141,   110,    -1,   140,   112,   135,    -1,
     140,     7,   135,    -1,   140,     8,    -1,   140,     9,    -1,
     158,    -1,   138,    -1,   141,   115,   158,    -1,   141,   115,
     138,    -1,     8,   143,    -1,     9,   143,    -1,   145,   146,
      -1,     6,   109,   143,   110,    -1,     6,   144,    -1,     6,
     109,   207,   110,    -1,   142,    -1,   139,    -1,   142,    -1,
     140,    -1,   116,    -1,   117,    -1,   118,    -1,   119,    -1,
     120,    -1,   121,    -1,    73,    -1,   143,    -1,   109,   207,
     110,   146,    -1,   146,    -1,   147,   117,   146,    -1,   147,
     122,   146,    -1,   147,   123,   146,    -1,   147,    -1,   148,
     118,   147,    -1,   148,   119,   147,    -1,   148,    -1,   149,
      10,   148,    -1,   149,    11,   148,    -1,   149,    -1,   150,
     124,   149,    -1,   150,   125,   149,    -1,   150,    12,   149,
      -1,   150,    13,   149,    -1,   150,    -1,   151,    14,   150,
      -1,   151,    15,   150,    -1,   151,    -1,   152,   116,   151,
      -1,   152,    -1,   153,   126,   152,    -1,   153,    -1,   154,
     127,   153,    -1,   154,    -1,   155,    16,   154,    -1,   155,
      -1,   156,    17,   155,    -1,   156,    -1,   156,   128,   160,
     129,   157,    -1,   157,    -1,   143,   159,   158,    -1,   143,
     159,   138,    -1,   130,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,
      -1,    26,    -1,    27,    -1,   158,    -1,   160,   115,   158,
      -1,   157,    -1,   164,   131,    -1,   164,   167,   131,    -1,
     223,   131,    -1,    77,   135,   130,   161,   131,    -1,   172,
      -1,   163,   172,    -1,   175,    -1,   163,   175,    -1,   188,
      -1,   163,   188,    -1,   177,    -1,   163,   177,    -1,   169,
      -1,   164,   169,    -1,   172,    -1,   164,   172,    -1,   175,
      -1,   164,   175,    -1,   188,    -1,   164,   188,    -1,   177,
      -1,   164,   177,    -1,   169,    -1,   165,   169,    -1,   172,
      -1,   165,   172,    -1,   175,    -1,   165,   175,    -1,   173,
      -1,   165,   173,    -1,   169,    -1,   166,   169,    -1,   172,
      -1,   166,   172,    -1,   176,    -1,   166,   176,    -1,   177,
      -1,   166,   177,    -1,   188,    -1,   166,   188,    -1,   168,
      -1,   167,   115,   168,    -1,   195,    -1,   195,   130,   208,
      -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,    74,    -1,   171,    -1,    79,    -1,    44,    -1,    45,
      -1,    75,    -1,   174,    -1,    28,    -1,    46,    -1,    34,
      -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,
      -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,
      -1,    85,    -1,   178,    -1,   187,    -1,   173,    -1,   100,
     109,   173,   110,    -1,    66,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
     178,    -1,   187,    -1,   174,    -1,   100,   109,   173,   110,
      -1,    66,    -1,   179,   135,   132,   180,   133,    -1,   179,
     132,   180,   133,    -1,   179,   135,   132,   133,    -1,   179,
     132,   133,    -1,   179,   174,   132,   180,   133,    -1,   179,
     135,    -1,   179,   174,    -1,    48,    -1,    49,    -1,   184,
      -1,   180,   184,    -1,   139,   130,   209,    -1,   181,    -1,
     182,   115,   181,    -1,    68,   165,   135,   132,    69,   217,
      70,   217,   133,    -1,    68,   165,   135,   132,    70,   217,
      69,   217,   133,    -1,    68,   165,   135,   132,    69,   217,
     133,    -1,    68,   165,   135,   132,    70,   217,   133,    -1,
      68,   165,   135,   132,   133,    -1,    68,   165,   193,   135,
     132,    69,   217,    70,   217,   133,    -1,    68,   165,   193,
     135,   132,    70,   217,    69,   217,   133,    -1,    68,   165,
     193,   135,   132,    69,   217,   133,    -1,    68,   165,   193,
     135,   132,    70,   217,   133,    -1,    68,   165,   193,   135,
     132,   133,    -1,    68,   165,   132,    69,   217,    70,   217,
     133,    -1,    68,   165,   132,    70,   217,    69,   217,   133,
      -1,    68,   165,   132,    69,   217,   133,    -1,    68,   165,
     132,    70,   217,   133,    -1,    68,   165,   132,   133,    -1,
      68,   165,   193,   132,    69,   217,    70,   217,   133,    -1,
      68,   165,   193,   132,    70,   217,    69,   217,   133,    -1,
      68,   165,   193,   132,    69,   217,   133,    -1,    68,   165,
     193,   132,    70,   217,   133,    -1,    68,   165,   193,   132,
     133,    -1,   164,   185,   131,    -1,   164,   131,    -1,   224,
     131,    -1,   223,   131,    -1,   230,    -1,   182,   131,    -1,
     183,    -1,   131,    -1,   186,    -1,   185,   115,   186,    -1,
     195,    -1,   195,   171,    -1,   129,   161,    -1,   195,   129,
     161,    -1,   195,   129,   161,   129,   161,    -1,    50,   135,
      -1,    50,   174,    -1,    50,   132,   189,   133,    -1,    50,
     135,   132,   189,   133,    -1,    50,   135,   132,   189,   131,
     180,   133,    -1,    50,   174,   132,   189,   131,   180,   133,
      -1,    50,   174,   132,   189,   133,    -1,   190,    -1,   189,
     115,   190,    -1,   135,    -1,   135,   130,   161,    -1,   109,
     193,   110,    -1,   113,   114,    -1,   113,   161,   114,    -1,
     113,   173,   114,    -1,   191,   113,   114,    -1,   191,   113,
     161,   114,    -1,   191,   113,   173,   114,    -1,   109,   110,
      -1,   109,   203,   110,    -1,   191,   109,   110,    -1,   191,
     109,   203,   110,    -1,   109,   194,   110,    -1,   109,   110,
      -1,   109,   203,   110,    -1,   192,   109,   110,    -1,   192,
     109,   203,   110,    -1,   202,    -1,   191,    -1,   202,   191,
      -1,   170,   202,    -1,   170,   191,    -1,   170,   202,   191,
      -1,   202,    -1,   192,    -1,   202,   192,    -1,   170,   202,
      -1,   170,   192,    -1,   170,   202,   192,    -1,   198,    -1,
     202,   198,    -1,   170,   202,   198,    -1,   135,    -1,   109,
     195,   110,    -1,   196,   113,   161,   114,    -1,   196,   113,
     114,    -1,   196,   113,   173,   114,    -1,   200,    -1,   202,
     200,    -1,   170,   200,    -1,   170,   202,   200,    -1,   202,
     170,   200,    -1,   200,    -1,   196,    -1,   170,   200,    -1,
     170,   196,    -1,   196,   109,    -1,   199,   203,   110,    -1,
     199,   206,   110,    -1,   199,   110,    -1,   172,    -1,   201,
     172,    -1,   117,    -1,   117,   201,    -1,   117,   202,    -1,
     117,   201,   202,    -1,   204,    -1,   204,   115,    51,    -1,
     205,    -1,   204,   115,   205,    -1,   164,   195,    -1,   164,
     193,    -1,   164,    -1,   135,    -1,   206,   115,   135,    -1,
     163,    -1,   163,   193,    -1,   158,    -1,   132,   210,   133,
      -1,   132,   210,   115,   133,    -1,   157,    -1,   138,    -1,
     208,    -1,   210,   115,   208,    -1,   212,    -1,   217,    -1,
     218,    -1,   219,    -1,   220,    -1,   221,    -1,   135,   129,
     211,    -1,    52,   161,   129,   211,    -1,    53,   129,   211,
      -1,   162,    -1,   213,   162,    -1,   211,    -1,   214,   211,
      -1,   214,   162,    -1,   214,    -1,   213,    -1,   213,   214,
      -1,   132,    -1,   132,   133,    -1,   216,   215,   133,    -1,
     131,    -1,   160,   131,    -1,    54,   109,   160,   110,   211,
      -1,    54,   109,   160,   110,   211,    64,   211,    -1,    55,
     109,   160,   110,   211,    -1,    56,   109,   160,   110,   211,
      -1,    57,   211,    56,   109,   160,   110,   131,    -1,    58,
     109,   218,   218,   110,   211,    -1,    58,   109,   218,   218,
     160,   110,   211,    -1,    56,   109,   110,   211,    -1,    58,
     109,   218,   110,   211,    -1,    58,   109,   110,   211,    -1,
      59,   135,   131,    -1,    60,   131,    -1,    61,   131,    -1,
      62,   131,    -1,    62,   160,   131,    -1,     5,    -1,   164,
     135,   132,   237,   133,    -1,   164,   135,   132,   133,    -1,
     173,   132,   237,   133,    -1,   173,   132,   133,    -1,   135,
     132,   237,   133,    -1,   135,   132,   133,    -1,   132,   237,
     133,    -1,   132,   133,    -1,   164,   197,    -1,   197,    -1,
     164,   109,   110,    -1,   120,   164,   109,   110,    -1,    78,
     164,   197,    -1,    78,   197,    -1,   226,   217,    -1,   229,
     217,    -1,   229,   131,    -1,   227,   217,    -1,   228,   217,
      -1,   164,   197,    -1,   231,   217,    -1,   139,   130,   209,
      -1,   209,    -1,   233,    -1,   234,   115,   233,    -1,   234,
     131,    -1,   235,    -1,   232,    -1,   236,   235,    -1,   236,
     232,    -1,   131,    -1,   236,   131,    -1,   236,    -1,   234,
      -1,   236,   234,    -1,   158,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   153,   153,   158,   159,   164,   166,   168,   170,   172,
     173,   174,   177,   178,   179,   180,   181,   182,   183,   184,
     185,   189,   193,   194,   195,   196,   197,   198,   199,   200,
     205,   206,   207,   208,   209,   210,   211,   212,   216,   217,
     218,   219,   223,   224,   225,   226,   227,   228,   232,   233,
     237,   238,   242,   243,   244,   245,   246,   247,   248,   252,
     253,   257,   258,   259,   260,   264,   265,   266,   270,   271,
     272,   276,   277,   278,   279,   280,   284,   285,   286,   290,
     291,   295,   296,   300,   301,   305,   306,   310,   311,   315,
     316,   320,   321,   323,   328,   329,   330,   331,   332,   333,
     334,   335,   336,   337,   338,   342,   343,   347,   351,   352,
     353,   354,   358,   359,   360,   361,   362,   363,   364,   365,
     369,   370,   371,   372,   373,   374,   375,   376,   377,   378,
     392,   393,   394,   395,   396,   397,   398,   399,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   412,   416,   417,
     421,   422,   426,   427,   428,   429,   430,   434,   435,   439,
     444,   445,   446,   450,   475,   479,   480,   481,   482,   483,
     484,   485,   486,   487,   488,   489,   490,   491,   492,   493,
     494,   495,   496,   500,   501,   502,   503,   504,   505,   506,
     507,   508,   509,   510,   511,   512,   513,   514,   515,   516,
     521,   522,   523,   524,   525,   530,   531,   570,   571,   575,
     576,   580,   584,   585,   589,   591,   593,   595,   597,   600,
     602,   604,   606,   608,   611,   613,   615,   617,   619,   622,
     624,   626,   628,   630,   635,   636,   637,   638,   639,   640,
     641,   642,   646,   648,   653,   655,   657,   659,   661,   666,
     667,   671,   673,   674,   675,   676,   692,   694,   699,   701,
     707,   709,   711,   713,   715,   717,   719,   721,   723,   725,
     727,   732,   734,   736,   738,   740,   745,   746,   747,   748,
     749,   750,   754,   755,   756,   757,   758,   759,   805,   806,
     808,   814,   816,   818,   820,   822,   827,   828,   831,   833,
     835,   841,   842,   843,   845,   850,   854,   856,   858,   863,
     864,   868,   869,   870,   871,   875,   876,   880,   881,   885,
     886,   887,   891,   892,   896,   897,   906,   908,   910,   926,
     927,   948,   950,   955,   956,   957,   958,   959,   960,   964,
     966,   968,   973,   974,   978,   979,   982,   986,   987,   988,
     992,   996,  1004,  1009,  1010,  1014,  1015,  1016,  1020,  1021,
    1022,  1023,  1025,  1026,  1027,  1031,  1032,  1033,  1034,  1035,
    1044,  1084,  1086,  1091,  1093,  1095,  1097,  1102,  1104,  1109,
    1111,  1116,  1121,  1126,  1128,  1133,  1135,  1137,  1139,  1141,
    1147,  1152,  1162,  1163,  1167,  1169,  1174,  1179,  1180,  1181,
    1182,  1183,  1184,  1188,  1189,  1190,  1194
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
  "DBTABLE", "DBFIELD", "DBINDEX", "DATABASE_OPEN", "'('", "')'", "'$'",
  "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'",
  "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'", "'='", "';'",
  "'{'", "'}'", "$accept", "identifier", "primary_expression",
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
  "iteration_statement", "jump_statement", "string_literal",
  "instantiation_named", "instantiation_unnamed", "instantiation_anon",
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
      41,    36,    46,    91,    93,    44,    38,    42,    43,    45,
     126,    33,    47,    37,    60,    62,    94,   124,    63,    58,
      61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   134,   135,   136,   136,   137,   137,   137,   137,   137,
     137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
     137,   138,   139,   139,   139,   139,   139,   139,   139,   139,
     140,   140,   140,   140,   140,   140,   140,   140,   141,   141,
     141,   141,   142,   142,   142,   142,   142,   142,   143,   143,
     144,   144,   145,   145,   145,   145,   145,   145,   145,   146,
     146,   147,   147,   147,   147,   148,   148,   148,   149,   149,
     149,   150,   150,   150,   150,   150,   151,   151,   151,   152,
     152,   153,   153,   154,   154,   155,   155,   156,   156,   157,
     157,   158,   158,   158,   159,   159,   159,   159,   159,   159,
     159,   159,   159,   159,   159,   160,   160,   161,   162,   162,
     162,   162,   163,   163,   163,   163,   163,   163,   163,   163,
     164,   164,   164,   164,   164,   164,   164,   164,   164,   164,
     165,   165,   165,   165,   165,   165,   165,   165,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   167,   167,
     168,   168,   169,   169,   169,   169,   169,   170,   170,   171,
     172,   172,   172,   173,   174,   175,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   176,   176,   176,
     177,   177,   177,   177,   177,   178,   178,   179,   179,   180,
     180,   181,   182,   182,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   183,   184,   184,   184,   184,   184,   184,
     184,   184,   185,   185,   186,   186,   186,   186,   186,   187,
     187,   188,   188,   188,   188,   188,   189,   189,   190,   190,
     191,   191,   191,   191,   191,   191,   191,   191,   191,   191,
     191,   192,   192,   192,   192,   192,   193,   193,   193,   193,
     193,   193,   194,   194,   194,   194,   194,   194,   195,   195,
     195,   196,   196,   196,   196,   196,   197,   197,   197,   197,
     197,   198,   198,   198,   198,   199,   200,   200,   200,   201,
     201,   202,   202,   202,   202,   203,   203,   204,   204,   205,
     205,   205,   206,   206,   207,   207,   208,   208,   208,   209,
     209,   210,   210,   211,   211,   211,   211,   211,   211,   212,
     212,   212,   213,   213,   214,   214,   214,   215,   215,   215,
     216,   217,   217,   218,   218,   219,   219,   219,   220,   220,
     220,   220,   220,   220,   220,   221,   221,   221,   221,   221,
     222,   223,   223,   224,   224,   224,   224,   225,   225,   226,
     226,   227,   228,   229,   229,   230,   230,   230,   230,   230,
     231,   232,   233,   233,   234,   234,   235,   236,   236,   236,
     236,   236,   236,   237,   237,   237,   238
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       4,     2,     6,     5,     6,     5,     7,     6,     7,     6,
       1,     1,     1,     4,     3,     4,     3,     3,     2,     2,
       1,     4,     3,     4,     3,     3,     2,     2,     1,     1,
       3,     3,     2,     2,     2,     4,     2,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     1,     3,     3,     3,     3,     1,     3,     3,     1,
       3,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       5,     1,     3,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     1,     2,     3,
       2,     5,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     3,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     1,
       5,     4,     4,     3,     5,     2,     2,     1,     1,     1,
       2,     3,     1,     3,     9,     9,     7,     7,     5,    10,
      10,     8,     8,     6,     8,     8,     6,     6,     4,     9,
       9,     7,     7,     5,     3,     2,     2,     2,     1,     2,
       1,     1,     1,     3,     1,     2,     2,     3,     5,     2,
       2,     4,     5,     7,     7,     5,     1,     3,     1,     3,
       3,     2,     3,     3,     3,     4,     4,     2,     3,     3,
       4,     3,     2,     3,     3,     4,     1,     1,     2,     2,
       2,     3,     1,     1,     2,     2,     2,     3,     1,     2,
       3,     1,     3,     4,     3,     4,     1,     2,     2,     3,
       3,     1,     1,     2,     2,     2,     3,     3,     2,     1,
       2,     1,     2,     2,     3,     1,     3,     1,     3,     2,
       2,     1,     1,     3,     1,     2,     1,     3,     4,     1,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     3,
       4,     3,     1,     2,     1,     2,     2,     1,     1,     2,
       1,     2,     3,     1,     2,     5,     7,     5,     5,     7,
       6,     7,     4,     5,     4,     3,     2,     2,     2,     3,
       1,     5,     4,     4,     3,     4,     3,     3,     2,     2,
       1,     3,     4,     3,     2,     2,     2,     2,     2,     2,
       2,     2,     3,     1,     1,     3,     2,     1,     1,     2,
       2,     1,     2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    20,     2,     7,   370,     0,     0,     0,   164,     0,
       0,    58,     0,     0,     0,     0,    52,    53,    54,    55,
      56,    57,     5,    22,     3,    49,    48,    59,     0,    61,
      65,    68,    71,    76,    79,    81,    83,    85,    87,    89,
      91,   406,     0,   163,     8,     6,     0,     0,    30,    51,
      50,    46,     0,    42,    43,   152,   153,   154,   155,   156,
     166,   167,   168,   169,   170,   172,   175,   176,   173,   174,
     160,   161,   165,   171,   207,   208,     0,   182,   162,   177,
       0,     0,   120,   122,   180,   124,   128,   178,     0,   179,
     126,    59,   107,     0,     0,     0,    11,   105,     0,   324,
     112,   180,   114,   118,   116,     0,     9,     0,     0,    28,
      29,     0,     0,     0,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,    94,     0,    44,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
       0,    36,    37,     0,     0,     0,     0,   249,   250,     0,
     157,   159,     0,     0,   311,   121,     0,   158,   123,   125,
     129,   127,   283,     0,   282,     0,   205,   206,   184,   185,
     186,   187,   188,   190,   193,   194,   191,   192,   183,   189,
     199,     0,     0,   138,   140,   197,   142,   144,   195,   196,
     146,     0,     0,     0,     4,     0,     0,     0,     0,   113,
     115,   119,   117,   277,   325,   276,     0,     0,   401,     0,
     376,   330,    49,   329,     0,   393,    21,     0,   398,   394,
     404,   397,     0,     0,    27,    24,    39,     0,    38,    26,
       0,    93,    92,    62,    63,    64,    66,    67,    69,    70,
      74,    75,    72,    73,    77,    78,    80,    82,    84,    86,
      88,     0,   374,     0,    45,    47,    35,    32,     0,    34,
       0,   258,     0,   256,     0,     0,     0,   272,   321,     0,
       0,   315,   317,     0,   309,   312,   313,   286,   285,     0,
       0,   284,     0,     0,     0,     0,   241,   203,     5,     0,
       0,     0,     0,   212,     0,   240,   209,     0,   380,     0,
     296,     0,     0,     6,     0,     0,     0,     0,   238,     0,
       0,     0,     0,   139,   141,   143,   145,   147,     0,     0,
       0,     0,     0,   106,   267,     0,     0,   261,     0,     0,
     280,   279,     0,     0,   278,    60,    10,   378,     0,     0,
       0,   291,   390,   350,     0,   391,     0,   396,   402,   400,
     405,   399,   375,    25,     0,    23,     0,   373,    33,    31,
       0,     0,   251,     0,     0,   181,     0,     0,   320,   319,
     302,   288,   301,   276,   271,   273,     0,    13,   310,   314,
     287,   274,     0,     0,     0,     0,   130,   132,   136,   134,
       0,     0,   384,     0,    53,     0,     0,     0,     0,     0,
       0,     0,   235,   291,     0,     0,   242,   244,   379,   301,
       0,   298,     0,   201,   210,     0,   239,   305,     0,   308,
     322,     0,     0,     0,   297,   237,   236,   385,   388,   389,
     387,   386,   202,     0,     0,     0,     0,     0,    15,     0,
       0,     0,   260,   268,   262,   263,   281,   269,     0,   264,
       0,     0,   377,   392,   351,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   353,     5,     0,
     342,     0,   344,   333,     0,     0,     0,   334,   335,   336,
     337,   338,     0,   395,    41,    40,    90,   259,   257,     0,
     252,     0,   255,   304,   303,   279,     0,   289,   316,   318,
     275,    12,   249,   250,     0,     0,   131,   133,   137,   135,
       0,   205,   206,   383,     0,   292,     0,   211,   381,   246,
       0,   303,     0,     0,   234,     0,   245,     0,   301,   299,
     213,   294,     0,     0,   306,   307,     0,   300,   200,   204,
     198,    17,     0,    14,    19,     0,   270,   265,   266,     0,
       0,     0,     0,     0,     0,     0,     0,   366,   367,   368,
       0,     0,     0,   354,   108,     0,   148,   150,   343,     0,
     346,   345,   352,   110,     0,     0,   290,     0,     0,   228,
       0,     0,     0,   382,   372,     0,   301,   243,   247,   303,
     293,   295,   323,    16,    18,     0,   341,     0,     0,     0,
       0,     0,     0,     0,   365,   369,     0,   339,     0,   109,
       0,   253,   254,     0,     0,     0,     0,   218,     0,     0,
     233,     0,   371,     0,   340,     0,     0,   362,     0,     0,
     364,     0,     0,     0,   149,     0,   326,   151,     0,   226,
       0,   227,     0,     0,     0,     0,     0,     0,   223,   248,
     355,   357,   358,     0,   363,     0,     0,   111,   331,     0,
       0,     0,     0,   216,     0,   217,     0,   231,     0,   232,
       0,     0,     0,     0,   360,     0,     0,   327,   224,   225,
       0,     0,     0,     0,     0,   221,     0,   222,   356,   359,
     361,   328,   332,   214,   215,   229,   230,     0,     0,   219,
     220
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    22,    23,    24,   221,    25,    49,   237,    26,    91,
      51,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    97,   125,   479,    93,   580,    99,
     300,   395,   192,   575,   576,    82,   301,   167,    83,    42,
      43,    85,   196,    86,    87,    88,   302,   303,   304,   305,
     306,   415,   416,    89,    90,   272,   273,   213,   172,   335,
     173,   406,   307,   308,   381,   309,   310,   285,   311,   336,
     281,   282,   432,   105,   647,   225,   669,   482,   483,   484,
     485,   486,   354,   487,   488,   489,   490,   491,    44,   312,
      45,   226,   314,   315,   316,   317,   318,   227,   228,   229,
     230,   231,   232,   233,    46
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -585
static const short int yypact[] =
{
    4558,  -585,  -585,  -585,  -585,  4609,  4682,  4682,  -585,  5992,
    4558,  -585,  5992,  4558,  4151,    66,  -585,  -585,  -585,  -585,
    -585,  -585,   -44,  -585,  -585,   406,  -585,   700,  4558,  -585,
     285,   319,    98,   188,   474,    23,    43,    49,   180,    -7,
    -585,  -585,    97,  -585,  -585,  -585,   235,  4272,  -585,   414,
    -585,  -585,  3779,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,    20,  -585,  -585,  -585,
     141,  5173,  -585,  -585,  -585,  -585,  -585,  -585,    30,  -585,
    -585,  -585,  -585,  6138,  5263,  6138,  -585,  -585,   208,  5581,
    -585,    97,  -585,  -585,  -585,   149,   160,  1700,   275,  -585,
    -585,  3223,   275,  4558,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  3348,  -585,  4558,  4558,  4558,
    4558,  4558,  4558,  4558,  4558,  4558,  4558,  4558,  4558,  4558,
    4558,  4558,  4558,  4558,  4558,  4558,  1821,  -585,   207,   211,
     275,  -585,  -585,  3296,   275,  4558,   275,   195,   224,   315,
    -585,  -585,  5353,  4558,    -2,  -585,   219,  -585,  -585,  -585,
    -585,  -585,   250,   255,   300,  2293,   252,   262,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,   321,  5443,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  4558,   327,  5533,  -585,  4558,  5083,  4323,   284,  -585,
    -585,  -585,  -585,   287,  -585,   303,  4558,    66,  -585,  1942,
    -585,  -585,   202,  -585,  4910,  -585,  -585,   312,  -585,  -585,
     -55,  -585,  2063,   320,  -585,  -585,  -585,   259,  -585,  -585,
     390,  -585,  -585,  -585,  -585,  -585,   285,   285,   319,   319,
      98,    98,    98,    98,   188,   188,   474,    23,    43,    49,
     180,   215,  -585,   326,  -585,  -585,  -585,  -585,   296,  -585,
     410,   335,   -66,  -585,   275,   275,   340,  -585,  4820,   351,
     359,   358,  -585,   363,  -585,    -2,  -585,   250,   300,  5671,
    4558,   250,  6065,  4910,  3813,  5992,  -585,  -585,   -44,   233,
    3828,    80,  2402,  -585,    59,  -585,  -585,   338,  -585,  5000,
    -585,    21,   348,   350,   312,   312,   312,   389,  -585,  2511,
    3483,   315,  4558,  -585,  -585,  -585,  -585,  -585,   370,   382,
    4558,  4558,   387,  -585,  -585,   418,   422,  -585,   420,   -18,
     287,   303,  5754,  4357,   287,  -585,  -585,  -585,   381,  3348,
     369,  -585,  -585,   405,  3065,  -585,  3348,  -585,  -585,  -585,
     -55,  -585,  -585,  -585,  3348,  -585,  4558,  -585,  -585,  -585,
    4558,   275,  -585,   148,   152,  -585,  4730,   113,  -585,  -585,
     338,  -585,  -585,   222,  -585,  -585,  5919,  -585,  -585,  -585,
     250,  -585,   436,   434,    63,  3723,  -585,  -585,  -585,  -585,
      63,  4910,  -585,  4030,     6,    80,   443,    21,  5837,  3348,
     183,  4558,  -585,   423,    80,   159,  -585,   -42,  -585,   424,
      21,  -585,    35,  -585,  -585,   999,  -585,  -585,  4408,  -585,
    -585,   447,   310,    35,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  2620,  2729,   448,   445,  4558,  -585,   450,
     453,  4558,  -585,  -585,  -585,  -585,   287,  -585,   458,  -585,
     456,   134,  -585,  -585,  -585,  4558,   442,   465,   467,   469,
    3150,   471,   275,   452,   457,  3619,   275,  -585,   -70,   172,
    -585,  3932,  -585,  -585,  1337,  1458,   451,  -585,  -585,  -585,
    -585,  -585,   459,  -585,  -585,  -585,  -585,  -585,  -585,  3483,
    -585,  3483,  -585,   338,  -585,   222,    35,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,   -16,   463,  -585,  -585,  -585,  -585,
      29,  -585,  -585,  -585,    21,  -585,   479,  -585,  -585,  -585,
    2184,   464,    21,    86,  -585,  4558,  -585,    35,   466,  -585,
    -585,  -585,   483,   157,  -585,  -585,   275,  -585,  -585,  -585,
    -585,  -585,   485,  -585,  -585,   486,  -585,  -585,  -585,   472,
    3150,  4558,  4558,  4481,   546,  3535,   473,  -585,  -585,  -585,
     189,   476,  3150,  -585,  -585,   209,  -585,   477,  -585,  1579,
    -585,  -585,  -585,  -585,  2838,  2947,  -585,   312,   312,  -585,
      -6,   147,   478,  -585,  -585,   475,   482,  -585,   487,   490,
    -585,  -585,  -585,  -585,  -585,  3150,  -585,   314,   317,  3150,
     324,   502,  3150,  3568,  -585,  -585,  4558,  -585,   369,  -585,
    3374,  -585,  -585,   -29,   -34,   312,   312,  -585,   312,   312,
    -585,   177,  -585,  4558,  -585,  3150,  3150,  -585,  3150,  4558,
    -585,  3150,  4532,   484,  -585,  3374,  -585,  -585,   312,  -585,
     312,  -585,   -15,   -23,    -5,   125,   312,   312,  -585,  -585,
     553,  -585,  -585,   331,  -585,  3150,   361,  -585,  -585,   201,
     491,   493,   312,  -585,   312,  -585,   312,  -585,   312,  -585,
      14,   158,  3150,   488,  -585,  3150,  1180,  -585,  -585,  -585,
     495,   496,   498,   499,   312,  -585,   312,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,   501,   504,  -585,
    -585
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -585,   379,  -585,   613,  -108,   -68,  -585,   494,   620,     0,
    -585,  -585,    44,   400,   404,   376,   402,   503,   507,   509,
     506,   500,  -585,    17,     1,  -585,   -12,     7,  -328,  -585,
      13,  -585,   557,  -585,    40,    41,   -25,   242,   876,   730,
      10,   174,  -124,   492,    36,  -263,  -308,   236,  -585,  -585,
    -286,  -585,   127,    92,   721,   270,   291,  -200,  -138,   -86,
     298,  -269,   827,  -203,  -301,  -585,   787,  -585,   -24,  -143,
    -585,   277,  -585,   617,  -584,  -315,  -585,    96,  -585,  -585,
     182,  -585,  -585,   178,  -521,  -585,  -585,  -585,   -10,  -336,
     -82,  -585,  -585,  -585,  -585,  -585,  -585,  -585,   435,   313,
     438,   439,  -585,  -142,  -585
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -404
static const short int yytable[] =
{
      27,    41,    98,   236,   263,   106,    53,    54,   340,   379,
     144,   443,   444,   214,    27,   344,   424,   241,   492,   280,
      95,   352,    81,     2,     2,    94,   480,    92,   287,   400,
      92,   417,     2,     2,   463,   650,   291,   161,     2,   222,
      98,   648,    70,    71,   613,   236,   674,   148,     8,   371,
      70,    71,    27,   587,   588,   672,   166,   174,     8,   572,
     356,   668,   107,   625,   626,   676,     2,   372,   325,   166,
     174,     4,   126,    78,   208,   215,   357,   348,   222,   325,
    -311,    78,   507,     2,   694,  -311,   158,   535,   107,     2,
     402,     8,   642,   313,   527,   160,   455,   418,   177,   651,
     161,   240,   702,   195,   649,   195,   507,   299,   132,   133,
     675,    27,   238,    27,   146,   164,     2,   589,   673,   507,
     224,   145,   165,   164,   223,    27,   242,   627,   677,   198,
     350,   198,   400,   261,   193,   165,   193,   166,   174,   140,
     286,   456,   288,   270,   350,    27,   392,   695,   492,   492,
     390,   222,   156,    27,   238,    27,   578,   424,   424,   224,
     160,   591,   175,   223,   222,   161,   431,   166,   174,   141,
     283,   243,   244,   245,   425,   278,   142,   340,   166,   174,
      92,   208,   215,   344,   341,   199,     2,   199,   102,   350,
     426,   584,   378,   585,   678,   350,   143,   164,   523,   458,
     134,   135,   195,   164,   586,    27,   333,   346,   329,   108,
     109,   110,   577,   195,   338,   411,   628,   629,    92,   278,
     313,   102,   376,   586,    92,     2,   207,   696,   198,   146,
     164,   586,   224,   323,   299,   147,   223,   313,   313,   198,
     108,   109,   110,   492,   323,   224,   656,   657,   558,   223,
     159,   299,   299,   377,   383,   169,   494,   160,   679,   216,
     345,   389,   161,   371,   417,   165,   146,   371,   169,   405,
     407,   601,   217,   210,   533,   414,   420,   422,     2,   499,
     630,   500,    98,   501,   199,   502,   433,   205,   222,   146,
     534,   697,   350,   528,    27,   199,   160,   393,   424,   424,
     164,   161,   278,   573,   205,   456,   401,    92,   408,   520,
     658,   111,   136,   137,   112,   113,   686,   264,   204,   165,
     615,   265,   278,   205,   618,   405,   407,   274,   162,   446,
     205,   376,   349,   396,   687,   207,   164,   449,   450,    92,
     619,   165,   111,     8,   366,   112,   113,    92,    92,   577,
     460,   377,   383,   505,    27,   278,   275,   299,   506,   289,
      92,   313,   313,   409,    27,   495,   223,   481,   290,   363,
     208,   215,     2,   223,   364,   299,   299,   497,   405,   407,
     286,   524,   506,   496,   319,   405,   407,    92,   595,   278,
     532,    98,   202,   206,   320,   537,   342,   207,   169,   278,
     343,   164,   127,    27,   513,   355,   368,   128,   129,   162,
     522,   364,   206,   108,   109,   110,   207,   313,   529,   313,
     545,   150,   151,   152,   635,   546,   223,   636,    92,   205,
     321,   299,   205,   299,   638,   542,   516,   130,   131,   205,
     330,   683,   165,   160,   353,    92,   205,   427,   161,   165,
     375,   428,   169,   362,   552,   157,   405,   407,   555,   367,
     279,   384,   222,   570,    92,   370,   399,   176,    92,   385,
      27,   685,   559,   386,   169,    27,   205,   387,   350,   435,
     506,   436,    92,   447,    27,    27,   164,   234,   138,   139,
     328,   239,   437,   438,   439,   441,   448,   481,   481,   506,
     451,   332,   313,   313,   365,   205,   103,   506,   405,   407,
     250,   251,   252,   253,   462,   111,   299,   299,   112,   113,
     440,   353,   165,   153,   369,   205,   154,   155,   452,   266,
     246,   247,   453,   269,   454,   271,   248,   249,   464,   103,
     254,   255,   598,   224,   373,   374,   510,   223,   511,   607,
     608,   610,    92,   525,   298,   530,  -296,   544,   550,   551,
      27,    27,    27,    27,   553,    27,   564,   554,   556,   519,
     557,   560,    27,   170,   561,   169,   562,   102,   563,    27,
     565,   581,   169,   567,   582,   197,   170,   197,   568,   593,
     583,   211,   481,   405,   407,   590,  -298,   600,  -297,   603,
     604,   605,   611,   351,   614,    27,   616,   620,   632,    27,
     631,   639,    27,    27,  -299,   667,   633,   682,    48,   699,
      27,   646,  -300,   643,   688,    50,   689,   663,   703,   704,
     666,   705,   706,    92,   709,    27,    27,   710,    27,    27,
     659,    27,    27,   256,   260,    27,   646,   268,   257,   259,
      92,   258,   203,   271,   271,   169,   606,   351,   644,   536,
     597,   540,   498,   509,   149,    27,   579,   359,   617,   493,
     360,   361,   351,   298,     0,   581,     0,     0,     0,   413,
     351,   298,    27,     0,   326,    27,    27,   646,   430,     0,
     351,     0,     0,     0,     0,   326,     0,     0,   298,   298,
       0,   634,     0,     0,     0,   637,     0,     0,   640,     0,
       0,     0,     0,     0,     0,     0,   170,     0,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,     0,   351,
       0,   660,   661,   478,   662,   104,     0,   664,     0,    84,
       0,     0,    84,     0,   101,     0,     0,     0,     0,     0,
     271,     0,     0,     0,     0,   351,   351,     0,     0,     0,
       0,   684,   351,     0,     0,   623,   624,     0,   104,     0,
     170,     0,     0,   512,   515,     0,     0,   101,   698,   521,
     351,   700,   298,     0,   351,     0,   351,     0,     0,   351,
       0,     0,   170,   351,     0,     0,     0,     0,     0,   351,
       0,   351,   171,   652,   653,     0,   654,   655,     0,     0,
       0,    84,   351,     0,   200,   171,   200,     0,     0,     0,
     212,     0,   298,   298,    84,     0,   670,     0,   671,    84,
     124,     0,     0,     0,   680,   681,     0,   101,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   478,
     690,   566,   691,     0,   692,   571,   693,     0,     0,     0,
     413,     0,     0,   478,   478,     0,     0,     0,     0,     0,
       0,     0,   707,     0,   708,     0,   101,     0,   298,     0,
     298,     0,     0,     0,   351,   351,     0,     0,     0,   276,
     100,     0,    84,   170,     0,   103,     0,     0,     0,   592,
     170,     0,     0,   351,     0,   101,     0,     0,     0,     0,
       0,   351,   351,   327,     0,     0,   351,     0,     0,     0,
       0,     0,     0,   100,   327,   602,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    84,   339,     0,   478,
       0,     0,     0,     0,     0,   171,     0,     0,     0,   101,
       0,   478,     0,     0,    84,     0,     0,   168,   478,     0,
       0,     0,   101,   298,   298,     0,     0,     0,     0,   194,
     168,   194,     0,   170,     0,   209,     0,     0,     0,     0,
       0,     0,     0,     0,   478,     0,     0,     0,   478,     0,
       0,   478,     0,     0,     0,     0,     0,   351,     0,   171,
       1,     0,     2,     3,     4,     0,     0,     0,    84,     0,
       0,     0,     0,     0,   478,   478,     0,   478,     0,    84,
     478,   171,   398,    84,     0,    84,     0,     8,     0,     0,
      84,     0,   101,     0,     0,     0,     0,     0,     0,    84,
     284,     0,     0,     0,   478,     0,     0,     0,     0,   101,
     101,   445,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   478,     0,     0,   478,   382,     0,     0,   324,     0,
       9,    10,    84,   461,     0,     0,     0,     0,     0,   324,
       0,   382,     0,     0,   101,     0,     0,   419,   421,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   434,     0,
     168,    12,    13,     0,     0,   380,    84,     0,    52,     0,
      15,     0,     0,     0,     0,     0,    84,     0,     0,     0,
       0,   380,   171,     0,   104,   518,     0,   380,     0,   171,
       0,    84,     0,   101,     0,     0,     0,   382,    84,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   168,     0,     0,     0,   543,     0,
       0,   388,     0,   382,   504,     0,     0,     0,   397,     0,
     382,     0,     0,   101,   101,     0,   168,   380,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     382,     0,   504,     0,   382,     0,     0,   382,     0,     0,
       0,   531,   171,   380,   503,     0,     0,   538,     8,   539,
     380,    84,     0,     0,   101,   101,     0,     0,     0,     0,
     547,     0,     0,     0,     0,     0,     0,     0,     0,   101,
     380,   101,   503,     0,   380,     0,     0,   380,     0,     0,
       0,   503,     0,     0,     0,     0,     0,   380,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
     101,     0,     0,     0,     0,     0,     0,     0,   382,     0,
       0,   517,     0,     0,     0,     0,     0,   168,     0,   100,
     284,     0,    12,    13,   168,     0,     0,     0,     0,    14,
       0,    15,   382,   504,     0,     0,    16,    17,    18,    19,
      20,    21,     0,     0,     0,     0,     0,     0,   380,   101,
       0,   382,   645,   701,   101,   101,     0,     0,     0,   596,
     382,     0,     0,     0,   599,     0,     0,     0,     0,     0,
       0,     0,   380,   503,     0,     0,     0,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,   380,     0,     0,     0,     0,     0,   168,     0,   380,
     380,     0,     0,     0,   503,     8,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,   465,
     466,   467,   468,   469,   470,   471,   472,   473,   474,   475,
       0,     0,     0,    77,     0,   382,     0,     0,     9,    10,
      11,     0,    78,     0,   476,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    12,
      13,     0,     0,     0,     0,   380,    14,     0,    15,     0,
       0,     0,     0,    16,    17,    18,    19,    20,    21,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   477,   353,
    -348,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
     465,   466,   467,   468,   469,   470,   471,   472,   473,   474,
     475,     0,     0,     0,    77,     0,     0,     0,     0,     9,
      10,    11,     0,    78,     0,   476,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,    15,
       0,     0,     0,     0,    16,    17,    18,    19,    20,    21,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   477,
     353,  -347,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
       0,   465,   466,   467,   468,   469,   470,   471,   472,   473,
     474,   475,     0,     0,     0,    77,     0,     0,     0,     0,
       9,    10,    11,     0,    78,     0,   476,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
      15,     0,     0,     0,     0,    16,    17,    18,    19,    20,
      21,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     477,   353,  -349,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     9,    10,    11,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,    15,     0,     0,     0,     0,    16,    17,    18,    19,
      20,    21,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   218,   219,   220,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     9,    10,    11,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,    15,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   218,   219,   262,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     9,    10,    11,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,    15,     0,     0,     0,     0,    16,    17,
      18,    19,    20,    21,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   218,   219,   347,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     9,    10,    11,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,    15,     0,     0,     0,     0,    16,
      17,    18,    19,    20,    21,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   358,   219,  -403,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     9,    10,    11,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     1,    15,     2,     3,     4,     0,
      16,    17,    18,    19,    20,    21,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   218,   219,   594,     0,     0,
       0,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,   292,     0,     0,     9,    10,     0,   160,    78,     0,
       0,   293,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,    12,    13,     0,     0,     0,
       0,     0,   294,     1,    15,     2,     3,     4,     0,     0,
     164,     0,     0,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   296,     0,   297,     0,     0,     0,
       8,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
     292,     0,     0,     9,    10,     0,   160,    78,     0,     0,
     293,   161,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,    12,    13,     0,     0,     0,     0,
       0,   294,     1,    15,     2,     3,     4,     0,     0,   164,
       0,     0,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   296,     0,   423,     0,     0,     0,     8,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,   292,
       0,     0,     9,    10,     0,   160,    78,     0,     0,   293,
     161,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    12,    13,     0,     0,     0,     0,     0,
     294,     1,    15,     2,     3,     4,     0,     0,   164,     0,
       0,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   296,     0,   442,     0,     0,     0,     8,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,   292,     0,
       0,     9,    10,     0,   160,    78,     0,     0,   293,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,    12,    13,     0,     0,     0,     0,     0,   294,
       1,    15,     2,     3,     4,     0,     0,   164,     0,     0,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   296,     0,   548,     0,     0,     0,     8,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,   292,     0,     0,
       9,    10,     0,   160,    78,     0,     0,   293,   161,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,    12,    13,     0,     0,     0,     0,     0,   294,     1,
      15,     2,     3,     4,     0,     0,   164,     0,     0,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     296,     0,   549,     0,     0,     0,     8,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    77,     0,   292,     0,     0,     9,
      10,     0,   160,    78,     0,     0,   293,   161,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
      12,    13,     0,     0,     0,     0,     0,   294,     1,    15,
       2,     3,     4,     0,     0,   164,     0,     0,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   296,
       0,   621,     0,     0,     0,     8,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,   292,     0,     0,     9,    10,
       0,   160,    78,     0,     0,   293,   161,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    12,
      13,     0,     0,     0,     0,     0,   294,     0,    15,     0,
       0,     0,     0,     0,   164,     0,     1,   295,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,   296,     0,
     622,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,     0,   465,   466,   467,
     468,   469,   470,   471,   472,   473,   474,   475,     0,     0,
       0,    77,     0,     0,     0,     0,     9,    10,    11,     0,
      78,     0,   476,     0,     0,     0,     0,     0,     0,     0,
      79,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,    80,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,    15,     0,     8,     0,
       0,    16,    17,    18,    19,    20,    21,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   477,   353,     0,     0,
       0,     0,   465,   466,   467,   468,   469,   470,   471,   472,
     473,   474,   475,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,    15,     0,     0,     0,     0,    16,    17,    18,    19,
      20,    21,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   477,   353,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     9,    10,    11,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    12,    13,     0,     0,     0,
       0,     0,    14,   235,    15,     0,     0,     0,     0,    16,
      17,    18,    19,    20,    21,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,   219,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       0,     0,     0,     0,     0,     1,     8,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     8,     0,     0,    14,   267,    15,     0,     0,
       0,     0,    16,    17,    18,    19,    20,    21,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     9,    10,    11,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,    15,
       0,     0,     0,     0,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
     219,     0,     0,    14,     1,    15,     2,     3,     4,     0,
      16,    17,    18,    19,    20,    21,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   645,     0,     0,     0,
       0,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,    77,
       0,   292,     0,     0,     9,    10,     0,   160,    78,     0,
       0,   293,   161,     8,     0,     0,     0,     0,    79,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,    80,     0,    12,    13,     0,     0,     0,
       0,     0,   294,     0,    15,     0,     8,     0,     0,     0,
     164,     0,     0,   295,     0,     0,     9,    10,    11,     0,
       0,     0,     0,     0,   296,     0,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,     9,
      10,    11,     0,     0,    14,   612,    15,     8,     0,     0,
       0,    16,    17,    18,    19,    20,    21,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   477,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,   641,    15,
       0,     0,     0,     0,    16,    17,    18,    19,    20,    21,
       9,    10,    11,     0,     0,     0,     0,     0,     0,   477,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,     0,     2,     0,    14,     0,
      15,     0,     0,     0,     0,    16,    17,    18,    19,    20,
      21,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     569,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,   394,     0,     0,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,    77,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     8,    79,     0,
       0,     0,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,    80,     0,     0,     0,     0,     0,     0,
       0,     2,   206,     0,     0,     0,   207,     0,     0,     0,
     164,     8,     0,     0,     0,     0,     0,     0,     0,     0,
       9,    10,    11,     0,     0,   514,     8,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
       0,    12,    13,     0,     9,    10,    11,   160,    14,    96,
      15,     0,   161,     0,    77,    16,    17,    18,    19,    20,
      21,     0,   160,    78,     0,     0,     0,   161,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,   403,    96,    15,     0,     0,     0,    80,    16,
     404,    18,    19,    20,    21,     2,     0,   410,     0,     0,
       0,     0,     0,     0,     0,   164,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   411,     0,   412,
       8,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,   160,    78,     0,     0,
       0,   161,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,    80,     2,     3,     4,     5,     0,     6,     7,
       0,   350,     0,     0,     0,     0,     0,     0,     0,   164,
       0,     0,     0,     0,     0,     0,     0,     0,     8,     0,
       0,     0,     0,   574,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     9,    10,    11,   160,    78,     0,     0,     0,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,    12,    13,     0,     0,     0,     0,     0,   403,
      96,    15,     0,     0,     0,     0,    16,   404,    18,    19,
      20,    21,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
       0,     0,     0,     0,     0,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     9,    10,    11,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    12,    13,     0,     0,     0,     0,     0,
      14,    96,    15,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,     0,     0,     0,     0,     0,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     9,    10,    11,     0,    78,     0,     0,
       0,     8,     0,     0,     0,     0,     0,    79,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,    80,     0,    12,    13,     0,     0,     0,     0,
       0,    52,    96,    15,     0,     8,     0,     0,    16,    17,
      18,    19,    20,    21,     9,    10,    11,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,    12,    13,     0,     9,    10,
      11,     0,    14,     0,    15,     0,     8,   337,     0,    16,
      17,    18,    19,    20,    21,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,    15,     0,
       0,   459,     0,    16,    17,    18,    19,    20,    21,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     0,     0,     0,     0,    14,     0,    15,
       0,     0,   541,     0,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     0,     0,     0,     0,     1,
       8,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     8,     0,     0,     0,
      14,   609,    15,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,     9,    10,    11,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,    12,    13,     0,     8,     0,     0,
       0,    14,   665,    15,     0,     0,     0,     0,    16,    17,
      18,    19,    20,    21,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,    15,
       0,     0,     0,     0,    16,    17,    18,    19,    20,    21,
       9,    10,    11,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    12,    13,     0,     0,     0,     0,     0,    47,     0,
      15,     0,     0,     0,     0,    16,    17,    18,    19,    20,
      21,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     0,     0,     8,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       0,    52,     0,    15,     0,     0,    77,     0,    16,    17,
      18,    19,    20,    21,   160,    78,     0,     0,     0,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,   376,
     334,     0,     0,   207,     0,     0,     0,   164,     8,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,   160,    78,     0,     0,     0,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,   376,
       0,     0,     0,   207,     0,     0,     0,   164,     8,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,   160,    78,     0,     0,     0,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,   350,
       0,     0,     0,     0,     0,     0,     0,   164,     8,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     429,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,   206,   334,     0,     0,   207,     0,     0,     0,
     164,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,   162,     0,     0,     0,   163,     0,     0,     0,
     164,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,   162,     0,     0,     0,   201,     0,     0,     0,
     164,     8,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,   162,   277,     0,     0,     0,     0,     0,     0,
     164,     8,    55,    56,    57,    58,    59,   178,   179,   180,
     181,   182,   183,   184,   185,   186,   187,    70,    71,   188,
     189,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   190,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   191,     0,     0,     0,     0,     0,     0,
       0,     0,   162,     0,     0,     0,   322,     0,     0,     0,
     164,     8,    55,    56,    57,    58,    59,   178,   179,   180,
     181,   182,   183,   184,   185,   186,   187,    70,    71,   188,
     189,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   190,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     8,
       0,     0,   161,     0,     0,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,   191,     0,     0,     0,     0,     0,     0,
       0,     0,   162,     0,     0,     0,   331,    77,     0,     0,
     164,     0,     0,     0,     0,   160,    78,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
     206,     0,     0,     0,   207,     0,     0,     0,   164,     8,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   391,     8,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   457,     8,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,   526,     8,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
     508,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       8,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     8,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,   394,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     8,    55,    56,    57,
      58,    59,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,    70,    71,   188,   189,    74,    75,    76,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   190,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   191
};

static const short int yycheck[] =
{
       0,     0,    14,   111,   146,    15,     6,     7,   208,   278,
      17,   319,   320,    99,    14,   215,   302,   125,   354,   162,
      13,   224,     9,     3,     3,    12,   354,    10,   166,   292,
      13,   300,     3,     3,   349,    69,   174,    79,     3,   107,
      52,    70,    44,    45,   565,   153,    69,    47,    28,   115,
      44,    45,    52,    69,    70,    70,    81,    81,    28,   129,
     115,   645,   132,    69,    70,    70,     3,   133,   192,    94,
      94,     5,    28,    75,    99,    99,   131,   219,   146,   203,
      74,    75,   383,     3,    70,    79,    76,   129,   132,     3,
     293,    28,   613,   175,   409,    74,   114,   300,    88,   133,
      79,   113,   686,    93,   133,    95,   407,   175,    10,    11,
     133,   111,   111,   113,   132,   117,     3,   133,   133,   420,
     107,   128,    81,   117,   107,   125,   125,   133,   133,    93,
     109,    95,   395,   145,    93,    94,    95,   162,   162,   116,
     164,   341,   166,   155,   109,   145,   289,   133,   484,   485,
     288,   219,   132,   153,   153,   155,   484,   443,   444,   146,
      74,   132,   132,   146,   232,    79,   309,   192,   192,   126,
     163,   127,   128,   129,   115,   162,   127,   377,   203,   203,
     163,   206,   206,   383,   208,    93,     3,    95,    14,   109,
     131,   499,   278,   501,    69,   109,    16,   117,   401,   342,
      12,    13,   192,   117,   505,   205,   205,   217,   201,     7,
       8,     9,   481,   203,   207,   129,    69,    70,   201,   206,
     302,    47,   109,   524,   207,     3,   113,    69,   192,   132,
     117,   532,   219,   192,   302,     0,   219,   319,   320,   203,
       7,     8,     9,   579,   203,   232,    69,    70,   114,   232,
     109,   319,   320,   278,   278,    81,   364,    74,   133,   110,
     216,   285,    79,   115,   533,   224,   132,   115,    94,   294,
     294,   114,   112,    99,   115,   300,   300,   301,     3,   131,
     133,   133,   294,   131,   192,   133,   311,   115,   356,   132,
     131,   133,   109,   110,   294,   203,    74,   290,   584,   585,
     117,    79,   289,   131,   115,   505,   293,   290,   295,   395,
     133,   109,   124,   125,   112,   113,   115,   110,   110,   278,
     131,   110,   309,   115,   115,   350,   350,   132,   109,   322,
     115,   109,   130,   292,   133,   113,   117,   330,   331,   322,
     131,   300,   109,    28,   129,   112,   113,   330,   331,   618,
     343,   376,   376,   377,   354,   342,   132,   425,   383,   109,
     343,   443,   444,   130,   364,   364,   349,   354,   113,   110,
     395,   395,     3,   356,   115,   443,   444,   370,   403,   403,
     404,   405,   407,   366,   132,   410,   410,   370,   530,   376,
     414,   403,    94,   109,   132,   420,   109,   113,   224,   386,
     113,   117,   117,   403,   394,   227,   110,   122,   123,   109,
     400,   115,   109,     7,     8,     9,   113,   499,   411,   501,
     110,     7,     8,     9,   110,   115,   409,   110,   411,   115,
     109,   499,   115,   501,   110,   428,   395,   118,   119,   115,
     113,   110,   401,    74,   132,   428,   115,   109,    79,   408,
     110,   113,   278,   133,   447,    76,   481,   481,   451,   133,
     162,   110,   530,   475,   447,   130,   292,    88,   451,   110,
     470,   110,   465,   115,   300,   475,   115,   114,   109,   131,
     505,   131,   465,   113,   484,   485,   117,   108,    14,    15,
     192,   112,   314,   315,   316,   317,   114,   484,   485,   524,
     113,   203,   584,   585,   114,   115,    14,   532,   533,   533,
     134,   135,   136,   137,   133,   109,   584,   585,   112,   113,
     131,   132,   481,   109,   114,   115,   112,   113,   110,   150,
     130,   131,   110,   154,   114,   156,   132,   133,   133,    47,
     138,   139,   535,   530,   274,   275,   110,   530,   114,   561,
     562,   563,   535,   110,   175,   132,   132,   110,   110,   114,
     560,   561,   562,   563,   114,   565,   470,   114,   110,   395,
     114,   129,   572,    81,   109,   401,   109,   403,   109,   579,
     109,   485,   408,   131,   133,    93,    94,    95,   131,   110,
     131,    99,   579,   618,   618,   132,   132,   114,   132,   114,
     114,   129,    56,   224,   131,   605,   130,   130,   133,   609,
     132,   109,   612,   613,   132,   131,   129,    64,     5,   131,
     620,   620,   132,   616,   133,     5,   133,   639,   133,   133,
     642,   133,   133,   616,   133,   635,   636,   133,   638,   639,
     633,   641,   642,   140,   144,   645,   645,   153,   141,   143,
     633,   142,    95,   274,   275,   481,   560,   278,   618,   417,
     533,   425,   371,   386,    47,   665,   484,   232,   572,   356,
     232,   232,   293,   294,    -1,   579,    -1,    -1,    -1,   300,
     301,   302,   682,    -1,   192,   685,   686,   686,   309,    -1,
     311,    -1,    -1,    -1,    -1,   203,    -1,    -1,   319,   320,
      -1,   605,    -1,    -1,    -1,   609,    -1,    -1,   612,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   224,    -1,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    -1,   350,
      -1,   635,   636,   354,   638,    14,    -1,   641,    -1,     9,
      -1,    -1,    12,    -1,    14,    -1,    -1,    -1,    -1,    -1,
     371,    -1,    -1,    -1,    -1,   376,   377,    -1,    -1,    -1,
      -1,   665,   383,    -1,    -1,   587,   588,    -1,    47,    -1,
     278,    -1,    -1,   394,   395,    -1,    -1,    47,   682,   400,
     401,   685,   403,    -1,   405,    -1,   407,    -1,    -1,   410,
      -1,    -1,   300,   414,    -1,    -1,    -1,    -1,    -1,   420,
      -1,   422,    81,   625,   626,    -1,   628,   629,    -1,    -1,
      -1,    81,   433,    -1,    93,    94,    95,    -1,    -1,    -1,
      99,    -1,   443,   444,    94,    -1,   648,    -1,   650,    99,
     130,    -1,    -1,    -1,   656,   657,    -1,   107,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   470,
     672,   472,   674,    -1,   676,   476,   678,    -1,    -1,    -1,
     481,    -1,    -1,   484,   485,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   694,    -1,   696,    -1,   146,    -1,   499,    -1,
     501,    -1,    -1,    -1,   505,   506,    -1,    -1,    -1,   159,
      14,    -1,   162,   401,    -1,   403,    -1,    -1,    -1,   520,
     408,    -1,    -1,   524,    -1,   175,    -1,    -1,    -1,    -1,
      -1,   532,   533,   192,    -1,    -1,   537,    -1,    -1,    -1,
      -1,    -1,    -1,    47,   203,   546,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   206,   207,    -1,   560,
      -1,    -1,    -1,    -1,    -1,   224,    -1,    -1,    -1,   219,
      -1,   572,    -1,    -1,   224,    -1,    -1,    81,   579,    -1,
      -1,    -1,   232,   584,   585,    -1,    -1,    -1,    -1,    93,
      94,    95,    -1,   481,    -1,    99,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   605,    -1,    -1,    -1,   609,    -1,
      -1,   612,    -1,    -1,    -1,    -1,    -1,   618,    -1,   278,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,   278,    -1,
      -1,    -1,    -1,    -1,   635,   636,    -1,   638,    -1,   289,
     641,   300,   292,   293,    -1,   295,    -1,    28,    -1,    -1,
     300,    -1,   302,    -1,    -1,    -1,    -1,    -1,    -1,   309,
     164,    -1,    -1,    -1,   665,    -1,    -1,    -1,    -1,   319,
     320,   321,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   682,    -1,    -1,   685,   278,    -1,    -1,   192,    -1,
      71,    72,   342,   343,    -1,    -1,    -1,    -1,    -1,   203,
      -1,   294,    -1,    -1,   354,    -1,    -1,   300,   301,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   311,    -1,
     224,   102,   103,    -1,    -1,   278,   376,    -1,   109,    -1,
     111,    -1,    -1,    -1,    -1,    -1,   386,    -1,    -1,    -1,
      -1,   294,   401,    -1,   403,   395,    -1,   300,    -1,   408,
      -1,   401,    -1,   403,    -1,    -1,    -1,   350,   408,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   278,    -1,    -1,    -1,   428,    -1,
      -1,   285,    -1,   376,   377,    -1,    -1,    -1,   292,    -1,
     383,    -1,    -1,   443,   444,    -1,   300,   350,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     403,    -1,   405,    -1,   407,    -1,    -1,   410,    -1,    -1,
      -1,   414,   481,   376,   377,    -1,    -1,   420,    28,   422,
     383,   481,    -1,    -1,   484,   485,    -1,    -1,    -1,    -1,
     433,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   499,
     403,   501,   405,    -1,   407,    -1,    -1,   410,    -1,    -1,
      -1,   414,    -1,    -1,    -1,    -1,    -1,   420,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
     530,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   481,    -1,
      -1,   395,    -1,    -1,    -1,    -1,    -1,   401,    -1,   403,
     404,    -1,   102,   103,   408,    -1,    -1,    -1,    -1,   109,
      -1,   111,   505,   506,    -1,    -1,   116,   117,   118,   119,
     120,   121,    -1,    -1,    -1,    -1,    -1,    -1,   481,   579,
      -1,   524,   132,   133,   584,   585,    -1,    -1,    -1,   532,
     533,    -1,    -1,    -1,   537,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   505,   506,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   524,    -1,    -1,    -1,    -1,    -1,   481,    -1,   532,
     533,    -1,    -1,    -1,   537,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,   618,    -1,    -1,    71,    72,
      73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,   618,   109,    -1,   111,    -1,
      -1,    -1,    -1,   116,   117,   118,   119,   120,   121,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   131,   132,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,
      -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,   121,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   131,
     132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
     111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,
     121,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,   111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,
     120,   121,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,   111,    -1,    -1,    -1,    -1,   116,   117,   118,
     119,   120,   121,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,   111,    -1,    -1,    -1,    -1,   116,   117,
     118,   119,   120,   121,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   131,   132,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,   111,    -1,    -1,    -1,    -1,   116,
     117,   118,   119,   120,   121,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   131,   132,   133,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,     1,   111,     3,     4,     5,    -1,
     116,   117,   118,   119,   120,   121,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,   132,   133,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,     1,   111,     3,     4,     5,    -1,    -1,
     117,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,     1,   111,     3,     4,     5,    -1,    -1,   117,
      -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,    -1,   133,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,     1,   111,     3,     4,     5,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   131,    -1,   133,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
       1,   111,     3,     4,     5,    -1,    -1,   117,    -1,    -1,
     120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   131,    -1,   133,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,     1,
     111,     3,     4,     5,    -1,    -1,   117,    -1,    -1,   120,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    -1,   133,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,     1,   111,
       3,     4,     5,    -1,    -1,   117,    -1,    -1,   120,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
      -1,   133,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,
      -1,    -1,    -1,    -1,   117,    -1,     1,   120,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,   131,    -1,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    28,    -1,
      -1,   116,   117,   118,   119,   120,   121,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,   132,    -1,    -1,
      -1,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,   111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,
     120,   121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,    -1,    -1,    -1,    -1,   116,
     117,   118,   119,   120,   121,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,   132,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,     1,    28,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    28,    -1,    -1,   109,   110,   111,    -1,    -1,
      -1,    -1,   116,   117,   118,   119,   120,   121,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,
      -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,   121,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
     132,    -1,    -1,   109,     1,   111,     3,     4,     5,    -1,
     116,   117,   118,   119,   120,   121,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   132,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    28,    -1,    -1,    -1,    -1,    85,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,   111,    -1,    28,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,
      72,    73,    -1,    -1,   109,   110,   111,    28,    -1,    -1,
      -1,   116,   117,   118,   119,   120,   121,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
      -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,   121,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,     3,    -1,   109,    -1,
     111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,
     121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    28,    85,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   109,    -1,    -1,    -1,   113,    -1,    -1,    -1,
     117,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,   102,   103,    -1,    71,    72,    73,    74,   109,   110,
     111,    -1,    79,    -1,    66,   116,   117,   118,   119,   120,
     121,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,    -1,    -1,    -1,   100,   116,
     117,   118,   119,   120,   121,     3,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   129,    -1,   131,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,   100,     3,     4,     5,     6,    -1,     8,     9,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,   131,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,
     120,   121,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,    -1,    -1,    -1,    -1,   116,   117,   118,
     119,   120,   121,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    85,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,    -1,    28,    -1,    -1,   116,   117,
     118,   119,   120,   121,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    71,    72,
      73,    -1,   109,    -1,   111,    -1,    28,   114,    -1,   116,
     117,   118,   119,   120,   121,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,
      -1,   114,    -1,   116,   117,   118,   119,   120,   121,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,
      -1,    -1,   114,    -1,   116,   117,   118,   119,   120,   121,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,     1,
      28,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    28,    -1,    -1,    -1,
     109,   110,   111,    -1,    -1,    -1,    -1,   116,   117,   118,
     119,   120,   121,    71,    72,    73,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,   102,   103,    -1,    28,    -1,    -1,
      -1,   109,   110,   111,    -1,    -1,    -1,    -1,   116,   117,
     118,   119,   120,   121,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,
      -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,   121,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
     111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,
     121,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,   111,    -1,    -1,    66,    -1,   116,   117,
     118,   119,   120,   121,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
     110,    -1,    -1,   113,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,   113,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,   110,    -1,    -1,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,   110,    -1,    -1,    -1,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    28,
      -1,    -1,    79,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,   113,    66,    -1,    -1,
     117,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,   113,    -1,    -1,    -1,   117,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,    28,    29,    30,    31,    32,    33,    34,    35,
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
      -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   111,   116,   117,   118,   119,
     120,   121,   135,   136,   137,   139,   142,   143,   145,   146,
     147,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     157,   158,   173,   174,   222,   224,   238,   109,   137,   140,
     142,   144,   109,   143,   143,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    66,    75,    85,
     100,   164,   169,   172,   173,   175,   177,   178,   179,   187,
     188,   143,   157,   161,   164,   161,   110,   158,   160,   163,
     172,   173,   175,   177,   188,   207,   222,   132,     7,     8,
       9,   109,   112,   113,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   130,   159,   146,   117,   122,   123,
     118,   119,    10,    11,    12,    13,   124,   125,    14,    15,
     116,   126,   127,    16,    17,   128,   132,     0,   143,   207,
       7,     8,     9,   109,   112,   113,   132,   135,   174,   109,
      74,    79,   109,   113,   117,   169,   170,   171,   172,   175,
     177,   188,   192,   194,   202,   132,   135,   174,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    46,    47,
      66,   100,   166,   169,   172,   174,   176,   177,   178,   187,
     188,   113,   194,   166,   110,   115,   109,   113,   170,   172,
     175,   177,   188,   191,   193,   202,   110,   112,   131,   132,
     133,   138,   139,   157,   164,   209,   225,   231,   232,   233,
     234,   235,   236,   237,   135,   110,   138,   141,   158,   135,
     160,   138,   158,   146,   146,   146,   147,   147,   148,   148,
     149,   149,   149,   149,   150,   150,   151,   152,   153,   154,
     155,   160,   133,   237,   110,   110,   135,   110,   141,   135,
     160,   135,   189,   190,   132,   132,   173,   110,   164,   194,
     203,   204,   205,   161,   172,   201,   202,   192,   202,   109,
     113,   192,    68,    78,   109,   120,   131,   133,   135,   139,
     164,   170,   180,   181,   182,   183,   184,   196,   197,   199,
     200,   202,   223,   224,   226,   227,   228,   229,   230,   132,
     132,   109,   113,   169,   172,   176,   177,   188,   194,   161,
     113,   113,   194,   158,   110,   193,   203,   114,   161,   173,
     191,   202,   109,   113,   191,   146,   222,   133,   237,   130,
     109,   135,   197,   132,   216,   217,   115,   131,   131,   232,
     234,   235,   133,   110,   115,   114,   129,   133,   110,   114,
     130,   115,   133,   189,   189,   110,   109,   170,   193,   195,
     196,   198,   200,   202,   110,   110,   115,   114,   172,   202,
     192,   110,   203,   161,    50,   165,   169,   172,   173,   175,
     179,   164,   197,   109,   117,   170,   195,   202,   164,   130,
     109,   129,   131,   135,   170,   185,   186,   195,   197,   200,
     202,   200,   202,   133,   184,   115,   131,   109,   113,   110,
     135,   203,   206,   170,   200,   131,   131,   217,   217,   217,
     131,   217,   133,   180,   180,   173,   161,   113,   114,   161,
     161,   113,   110,   110,   114,   114,   191,   110,   203,   114,
     161,   173,   133,   209,   133,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    77,   131,   135,   160,
     162,   164,   211,   212,   213,   214,   215,   217,   218,   219,
     220,   221,   223,   233,   138,   158,   157,   161,   190,   131,
     133,   131,   133,   196,   200,   202,   170,   198,    51,   205,
     110,   114,   135,   174,   132,   135,   169,   172,   173,   175,
     193,   135,   174,   197,   202,   110,   109,   209,   110,   161,
     132,   200,   202,   115,   131,   129,   171,   170,   200,   200,
     181,   114,   161,   173,   110,   110,   115,   200,   133,   133,
     110,   114,   161,   114,   114,   161,   110,   114,   114,   161,
     129,   109,   109,   109,   211,   109,   135,   131,   131,   131,
     160,   135,   129,   131,   131,   167,   168,   195,   162,   214,
     162,   211,   133,   131,   180,   180,   198,    69,    70,   133,
     132,   132,   135,   110,   133,   237,   200,   186,   161,   200,
     114,   114,   135,   114,   114,   129,   211,   160,   160,   110,
     160,    56,   110,   218,   131,   131,   130,   211,   115,   131,
     130,   133,   133,   217,   217,    69,    70,   133,    69,    70,
     133,   132,   133,   129,   211,   110,   110,   211,   110,   109,
     211,   110,   218,   161,   168,   132,   158,   208,    70,   133,
      69,   133,   217,   217,   217,   217,    69,    70,   133,   161,
     211,   211,   211,   160,   211,   110,   160,   131,   208,   210,
     217,   217,    70,   133,    69,   133,    70,   133,    69,   133,
     217,   217,    64,   110,   211,   110,   115,   133,   133,   133,
     217,   217,   217,   217,    70,   133,    69,   133,   211,   131,
     211,   133,   208,   133,   133,   133,   133,   217,   217,   133,
     133
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
#line 172 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), null); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:
#line 173 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), (yyvsp[-2].string)); delete (yyvsp[-2].string); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:
#line 175 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 12:
#line 177 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:
#line 178 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:
#line 179 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:
#line 180 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:
#line 181 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:
#line 182 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:
#line 183 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:
#line 184 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:
#line 185 "expression.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 21:
#line 189 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:
#line 194 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:
#line 195 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:
#line 196 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:
#line 197 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:
#line 198 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:
#line 199 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:
#line 200 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:
#line 206 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:
#line 207 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:
#line 208 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:
#line 209 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:
#line 210 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:
#line 211 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:
#line 212 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:
#line 216 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 39:
#line 217 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 40:
#line 218 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 41:
#line 219 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 42:
#line 223 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:
#line 224 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:
#line 225 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:
#line 226 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:
#line 227 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:
#line 228 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:
#line 242 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 53:
#line 243 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 54:
#line 244 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 55:
#line 245 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 56:
#line 246 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 57:
#line 247 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 58:
#line 248 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 60:
#line 253 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:
#line 258 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:
#line 259 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:
#line 260 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:
#line 265 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:
#line 266 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:
#line 271 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:
#line 272 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:
#line 277 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:
#line 278 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:
#line 279 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:
#line 280 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:
#line 285 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:
#line 286 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:
#line 291 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:
#line 296 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:
#line 301 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:
#line 306 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:
#line 311 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:
#line 316 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:
#line 321 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:
#line 323 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:
#line 328 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 95:
#line 329 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 96:
#line 330 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 97:
#line 331 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 98:
#line 332 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 99:
#line 333 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 100:
#line 334 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 101:
#line 335 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 102:
#line 336 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 103:
#line 337 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 104:
#line 338 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 105:
#line 342 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 106:
#line 343 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 108:
#line 351 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 109:
#line 352 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 110:
#line 353 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 111:
#line 354 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
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
#line 364 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 119:
#line 365 "expression.y"
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
#line 377 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 129:
#line 378 "expression.y"
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
#line 398 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 137:
#line 399 "expression.y"
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
#line 411 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 147:
#line 412 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 148:
#line 416 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 149:
#line 417 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 150:
#line 421 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 151:
#line 422 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 152:
#line 426 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 153:
#line 427 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 154:
#line 428 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 155:
#line 429 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 156:
#line 430 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 157:
#line 434 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 159:
#line 439 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 160:
#line 444 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 161:
#line 445 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 162:
#line 446 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 163:
#line 450 "expression.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 164:
#line 475 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 165:
#line 479 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 166:
#line 480 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 167:
#line 481 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 168:
#line 482 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 169:
#line 483 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 170:
#line 484 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 171:
#line 485 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 172:
#line 486 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 173:
#line 487 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 174:
#line 488 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 175:
#line 489 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 176:
#line 490 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 177:
#line 491 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 181:
#line 495 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 182:
#line 496 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 183:
#line 500 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 184:
#line 501 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 185:
#line 502 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 186:
#line 503 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 187:
#line 504 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 188:
#line 505 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 189:
#line 506 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 190:
#line 507 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 191:
#line 508 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 192:
#line 509 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 193:
#line 510 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 194:
#line 511 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 198:
#line 515 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 199:
#line 516 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 200:
#line 521 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 201:
#line 522 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); ;}
    break;

  case 202:
#line 523 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-2].id).string); ;}
    break;

  case 203:
#line 524 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); ;}
    break;

  case 204:
#line 526 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 205:
#line 530 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 206:
#line 532 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 207:
#line 570 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 208:
#line 571 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 209:
#line 575 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 210:
#line 576 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 211:
#line 580 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 212:
#line 584 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 213:
#line 585 "expression.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 214:
#line 590 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 215:
#line 592 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 216:
#line 594 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 217:
#line 596 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 218:
#line 598 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 219:
#line 601 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 220:
#line 603 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 221:
#line 605 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 222:
#line 607 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 223:
#line 609 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 224:
#line 612 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 225:
#line 614 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 226:
#line 616 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 227:
#line 618 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 228:
#line 620 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 229:
#line 623 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 230:
#line 625 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 231:
#line 627 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 232:
#line 629 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 233:
#line 631 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 234:
#line 635 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 235:
#line 636 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 236:
#line 637 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 237:
#line 638 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 238:
#line 639 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 239:
#line 640 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 240:
#line 641 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 241:
#line 642 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 242:
#line 647 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 243:
#line 649 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 244:
#line 654 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 245:
#line 656 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 246:
#line 658 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 247:
#line 660 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 248:
#line 662 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 249:
#line 666 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 250:
#line 667 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 251:
#line 672 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); ;}
    break;

  case 252:
#line 673 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 253:
#line 674 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].id).string); ;}
    break;

  case 254:
#line 675 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); ;}
    break;

  case 255:
#line 676 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 256:
#line 693 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 257:
#line 695 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 258:
#line 700 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 259:
#line 702 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 260:
#line 708 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 261:
#line 710 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 262:
#line 712 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 263:
#line 714 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 264:
#line 716 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 265:
#line 718 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 266:
#line 720 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 267:
#line 722 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 268:
#line 724 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 269:
#line 726 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 270:
#line 728 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 271:
#line 733 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 272:
#line 735 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 273:
#line 737 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 274:
#line 739 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 275:
#line 741 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 276:
#line 745 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 278:
#line 747 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 279:
#line 748 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 280:
#line 749 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 281:
#line 750 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 282:
#line 754 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 284:
#line 756 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 285:
#line 757 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 286:
#line 758 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 287:
#line 759 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 289:
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 290:
#line 809 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 291:
#line 815 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 292:
#line 817 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 293:
#line 819 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 294:
#line 821 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 295:
#line 823 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 297:
#line 829 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 298:
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 299:
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 300:
#line 836 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 303:
#line 844 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 304:
#line 846 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 306:
#line 855 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 307:
#line 857 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 308:
#line 859 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 309:
#line 863 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 310:
#line 864 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 311:
#line 868 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 312:
#line 869 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 313:
#line 870 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 314:
#line 871 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 316:
#line 876 "expression.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 317:
#line 880 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 318:
#line 881 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 319:
#line 885 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 320:
#line 886 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 321:
#line 887 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 322:
#line 891 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 323:
#line 892 "expression.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 324:
#line 896 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 325:
#line 897 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 326:
#line 907 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 327:
#line 909 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 328:
#line 911 "expression.y"
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

  case 329:
#line 926 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 330:
#line 928 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 331:
#line 949 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 332:
#line 951 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 339:
#line 965 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 340:
#line 967 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 341:
#line 969 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 342:
#line 973 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 343:
#line 974 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 344:
#line 978 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 345:
#line 979 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 346:
#line 982 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); ;}
    break;

  case 347:
#line 986 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 348:
#line 987 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 349:
#line 988 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 350:
#line 992 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 351:
#line 997 "expression.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 352:
#line 1005 "expression.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 353:
#line 1009 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 354:
#line 1010 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 355:
#line 1014 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 356:
#line 1015 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 357:
#line 1016 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 358:
#line 1020 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 359:
#line 1021 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 360:
#line 1022 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 361:
#line 1023 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 362:
#line 1025 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 363:
#line 1026 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 364:
#line 1027 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 365:
#line 1031 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 366:
#line 1032 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 367:
#line 1033 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 368:
#line 1034 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 369:
#line 1035 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 370:
#line 1044 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 371:
#line 1085 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 372:
#line 1087 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 373:
#line 1092 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 374:
#line 1094 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 375:
#line 1096 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 376:
#line 1098 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 377:
#line 1103 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 378:
#line 1105 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 379:
#line 1110 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 380:
#line 1112 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 381:
#line 1117 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 382:
#line 1122 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 383:
#line 1127 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 384:
#line 1129 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 385:
#line 1134 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 386:
#line 1136 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 387:
#line 1138 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 388:
#line 1140 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 389:
#line 1142 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 390:
#line 1148 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 391:
#line 1153 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 392:
#line 1162 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 393:
#line 1163 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 394:
#line 1168 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 395:
#line 1170 "expression.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 396:
#line 1175 "expression.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 397:
#line 1179 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 398:
#line 1180 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 399:
#line 1181 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 400:
#line 1182 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 401:
#line 1183 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 402:
#line 1184 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 404:
#line 1189 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 405:
#line 1190 "expression.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 406:
#line 1194 "expression.y"
    { parsedExpression = (yyvsp[0].exp); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 4986 "expression.ec"

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


#line 1196 "expression.y"



