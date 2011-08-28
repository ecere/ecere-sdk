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
#define YYLAST   6366

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  105
/* YYNRULES -- Number of rules. */
#define YYNRULES  405
/* YYNRULES -- Number of states. */
#define YYNSTATES  709

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
     109,   110,   117,   118,   115,   119,   114,   122,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   129,   131,
     124,   130,   125,   128,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   112,     2,   113,   126,     2,     2,     2,     2,     2,
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
      22,    25,    32,    38,    45,    51,    59,    66,    74,    81,
      83,    85,    87,    92,    96,   101,   105,   109,   112,   115,
     117,   122,   126,   131,   135,   139,   142,   145,   147,   149,
     153,   157,   160,   163,   166,   171,   174,   179,   181,   183,
     185,   187,   189,   191,   193,   195,   197,   199,   201,   203,
     208,   210,   214,   218,   222,   224,   228,   232,   234,   238,
     242,   244,   248,   252,   256,   260,   262,   266,   270,   272,
     276,   278,   282,   284,   288,   290,   294,   296,   300,   302,
     308,   310,   314,   318,   320,   322,   324,   326,   328,   330,
     332,   334,   336,   338,   340,   342,   346,   348,   351,   355,
     358,   364,   366,   369,   371,   374,   376,   379,   381,   384,
     386,   389,   391,   394,   396,   399,   401,   404,   406,   409,
     411,   414,   416,   419,   421,   424,   426,   429,   431,   434,
     436,   439,   441,   444,   446,   449,   451,   454,   456,   460,
     462,   466,   468,   470,   472,   474,   476,   478,   480,   482,
     484,   486,   488,   490,   492,   494,   496,   498,   500,   502,
     504,   506,   508,   510,   512,   514,   516,   518,   520,   522,
     524,   529,   531,   533,   535,   537,   539,   541,   543,   545,
     547,   549,   551,   553,   555,   557,   559,   561,   566,   568,
     574,   579,   584,   588,   594,   597,   600,   602,   604,   606,
     609,   613,   615,   619,   629,   639,   647,   655,   661,   672,
     683,   692,   701,   708,   717,   726,   733,   740,   745,   755,
     765,   773,   781,   787,   791,   794,   797,   800,   802,   805,
     807,   809,   811,   815,   817,   820,   823,   827,   833,   836,
     839,   844,   850,   858,   866,   872,   874,   878,   880,   884,
     888,   891,   895,   899,   903,   908,   913,   916,   920,   924,
     929,   933,   936,   940,   944,   949,   951,   953,   956,   959,
     962,   966,   968,   970,   973,   976,   979,   983,   985,   988,
     992,   994,   998,  1003,  1007,  1012,  1014,  1017,  1020,  1024,
    1028,  1030,  1032,  1035,  1038,  1041,  1045,  1049,  1052,  1054,
    1057,  1059,  1062,  1065,  1069,  1071,  1075,  1077,  1081,  1084,
    1087,  1089,  1091,  1095,  1097,  1100,  1102,  1106,  1111,  1113,
    1115,  1117,  1121,  1123,  1125,  1127,  1129,  1131,  1133,  1137,
    1142,  1146,  1148,  1151,  1153,  1156,  1159,  1161,  1163,  1166,
    1168,  1171,  1175,  1177,  1180,  1186,  1194,  1200,  1206,  1214,
    1221,  1229,  1234,  1240,  1245,  1249,  1252,  1255,  1258,  1262,
    1264,  1270,  1275,  1280,  1284,  1289,  1293,  1297,  1300,  1303,
    1305,  1309,  1314,  1318,  1321,  1324,  1327,  1330,  1333,  1336,
    1339,  1342,  1346,  1348,  1350,  1354,  1357,  1359,  1361,  1364,
    1367,  1369,  1372,  1374,  1376,  1379
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     238,     0,    -1,     3,    -1,   137,    -1,   109,   160,   110,
      -1,   135,    -1,   224,    -1,     4,    -1,     5,    -1,   111,
     222,    -1,   109,   110,    -1,    71,   164,   194,   112,   161,
     113,    -1,    71,   164,   112,   161,   113,    -1,   102,   164,
     194,   112,   161,   113,    -1,   102,   164,   112,   161,   113,
      -1,    72,   161,   166,   194,   112,   161,   113,    -1,    72,
     161,   166,   112,   161,   113,    -1,   103,   161,   166,   194,
     112,   161,   113,    -1,   103,   161,   166,   112,   161,   113,
      -1,     1,    -1,   225,    -1,   136,    -1,   139,   112,   160,
     113,    -1,   139,   109,   110,    -1,   139,   109,   141,   110,
      -1,   139,   114,   135,    -1,   139,     7,   135,    -1,   139,
       8,    -1,   139,     9,    -1,   137,    -1,   140,   112,   160,
     113,    -1,   140,   109,   110,    -1,   140,   109,   141,   110,
      -1,   140,   114,   135,    -1,   140,     7,   135,    -1,   140,
       8,    -1,   140,     9,    -1,   158,    -1,   138,    -1,   141,
     115,   158,    -1,   141,   115,   138,    -1,     8,   143,    -1,
       9,   143,    -1,   145,   146,    -1,     6,   109,   143,   110,
      -1,     6,   144,    -1,     6,   109,   207,   110,    -1,   142,
      -1,   139,    -1,   142,    -1,   140,    -1,   116,    -1,   117,
      -1,   118,    -1,   119,    -1,   120,    -1,   121,    -1,    73,
      -1,   143,    -1,   109,   207,   110,   146,    -1,   146,    -1,
     147,   117,   146,    -1,   147,   122,   146,    -1,   147,   123,
     146,    -1,   147,    -1,   148,   118,   147,    -1,   148,   119,
     147,    -1,   148,    -1,   149,    10,   148,    -1,   149,    11,
     148,    -1,   149,    -1,   150,   124,   149,    -1,   150,   125,
     149,    -1,   150,    12,   149,    -1,   150,    13,   149,    -1,
     150,    -1,   151,    14,   150,    -1,   151,    15,   150,    -1,
     151,    -1,   152,   116,   151,    -1,   152,    -1,   153,   126,
     152,    -1,   153,    -1,   154,   127,   153,    -1,   154,    -1,
     155,    16,   154,    -1,   155,    -1,   156,    17,   155,    -1,
     156,    -1,   156,   128,   160,   129,   157,    -1,   157,    -1,
     143,   159,   158,    -1,   143,   159,   138,    -1,   130,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     158,    -1,   160,   115,   158,    -1,   157,    -1,   164,   131,
      -1,   164,   167,   131,    -1,   223,   131,    -1,    77,   135,
     130,   161,   131,    -1,   172,    -1,   163,   172,    -1,   175,
      -1,   163,   175,    -1,   188,    -1,   163,   188,    -1,   177,
      -1,   163,   177,    -1,   169,    -1,   164,   169,    -1,   172,
      -1,   164,   172,    -1,   175,    -1,   164,   175,    -1,   188,
      -1,   164,   188,    -1,   177,    -1,   164,   177,    -1,   169,
      -1,   165,   169,    -1,   172,    -1,   165,   172,    -1,   175,
      -1,   165,   175,    -1,   173,    -1,   165,   173,    -1,   169,
      -1,   166,   169,    -1,   172,    -1,   166,   172,    -1,   176,
      -1,   166,   176,    -1,   177,    -1,   166,   177,    -1,   188,
      -1,   166,   188,    -1,   168,    -1,   167,   115,   168,    -1,
     195,    -1,   195,   130,   208,    -1,    29,    -1,    30,    -1,
      31,    -1,    32,    -1,    33,    -1,    74,    -1,   171,    -1,
      79,    -1,    44,    -1,    45,    -1,    75,    -1,   174,    -1,
      28,    -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,
      43,    -1,    40,    -1,    41,    -1,    85,    -1,   178,    -1,
     187,    -1,   173,    -1,   100,   109,   173,   110,    -1,    66,
      -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,
      -1,    40,    -1,    41,    -1,   178,    -1,   187,    -1,   174,
      -1,   100,   109,   173,   110,    -1,    66,    -1,   179,   135,
     132,   180,   133,    -1,   179,   132,   180,   133,    -1,   179,
     135,   132,   133,    -1,   179,   132,   133,    -1,   179,   174,
     132,   180,   133,    -1,   179,   135,    -1,   179,   174,    -1,
      48,    -1,    49,    -1,   184,    -1,   180,   184,    -1,   139,
     130,   209,    -1,   181,    -1,   182,   115,   181,    -1,    68,
     165,   135,   132,    69,   217,    70,   217,   133,    -1,    68,
     165,   135,   132,    70,   217,    69,   217,   133,    -1,    68,
     165,   135,   132,    69,   217,   133,    -1,    68,   165,   135,
     132,    70,   217,   133,    -1,    68,   165,   135,   132,   133,
      -1,    68,   165,   193,   135,   132,    69,   217,    70,   217,
     133,    -1,    68,   165,   193,   135,   132,    70,   217,    69,
     217,   133,    -1,    68,   165,   193,   135,   132,    69,   217,
     133,    -1,    68,   165,   193,   135,   132,    70,   217,   133,
      -1,    68,   165,   193,   135,   132,   133,    -1,    68,   165,
     132,    69,   217,    70,   217,   133,    -1,    68,   165,   132,
      70,   217,    69,   217,   133,    -1,    68,   165,   132,    69,
     217,   133,    -1,    68,   165,   132,    70,   217,   133,    -1,
      68,   165,   132,   133,    -1,    68,   165,   193,   132,    69,
     217,    70,   217,   133,    -1,    68,   165,   193,   132,    70,
     217,    69,   217,   133,    -1,    68,   165,   193,   132,    69,
     217,   133,    -1,    68,   165,   193,   132,    70,   217,   133,
      -1,    68,   165,   193,   132,   133,    -1,   164,   185,   131,
      -1,   164,   131,    -1,   224,   131,    -1,   223,   131,    -1,
     230,    -1,   182,   131,    -1,   183,    -1,   131,    -1,   186,
      -1,   185,   115,   186,    -1,   195,    -1,   195,   171,    -1,
     129,   161,    -1,   195,   129,   161,    -1,   195,   129,   161,
     129,   161,    -1,    50,   135,    -1,    50,   174,    -1,    50,
     132,   189,   133,    -1,    50,   135,   132,   189,   133,    -1,
      50,   135,   132,   189,   131,   180,   133,    -1,    50,   174,
     132,   189,   131,   180,   133,    -1,    50,   174,   132,   189,
     133,    -1,   190,    -1,   189,   115,   190,    -1,   135,    -1,
     135,   130,   161,    -1,   109,   193,   110,    -1,   112,   113,
      -1,   112,   161,   113,    -1,   112,   173,   113,    -1,   191,
     112,   113,    -1,   191,   112,   161,   113,    -1,   191,   112,
     173,   113,    -1,   109,   110,    -1,   109,   203,   110,    -1,
     191,   109,   110,    -1,   191,   109,   203,   110,    -1,   109,
     194,   110,    -1,   109,   110,    -1,   109,   203,   110,    -1,
     192,   109,   110,    -1,   192,   109,   203,   110,    -1,   202,
      -1,   191,    -1,   202,   191,    -1,   170,   202,    -1,   170,
     191,    -1,   170,   202,   191,    -1,   202,    -1,   192,    -1,
     202,   192,    -1,   170,   202,    -1,   170,   192,    -1,   170,
     202,   192,    -1,   198,    -1,   202,   198,    -1,   170,   202,
     198,    -1,   135,    -1,   109,   195,   110,    -1,   196,   112,
     161,   113,    -1,   196,   112,   113,    -1,   196,   112,   173,
     113,    -1,   200,    -1,   202,   200,    -1,   170,   200,    -1,
     170,   202,   200,    -1,   202,   170,   200,    -1,   200,    -1,
     196,    -1,   170,   200,    -1,   170,   196,    -1,   196,   109,
      -1,   199,   203,   110,    -1,   199,   206,   110,    -1,   199,
     110,    -1,   172,    -1,   201,   172,    -1,   117,    -1,   117,
     201,    -1,   117,   202,    -1,   117,   201,   202,    -1,   204,
      -1,   204,   115,    51,    -1,   205,    -1,   204,   115,   205,
      -1,   164,   195,    -1,   164,   193,    -1,   164,    -1,   135,
      -1,   206,   115,   135,    -1,   163,    -1,   163,   193,    -1,
     158,    -1,   132,   210,   133,    -1,   132,   210,   115,   133,
      -1,   157,    -1,   138,    -1,   208,    -1,   210,   115,   208,
      -1,   212,    -1,   217,    -1,   218,    -1,   219,    -1,   220,
      -1,   221,    -1,   135,   129,   211,    -1,    52,   161,   129,
     211,    -1,    53,   129,   211,    -1,   162,    -1,   213,   162,
      -1,   211,    -1,   214,   211,    -1,   214,   162,    -1,   214,
      -1,   213,    -1,   213,   214,    -1,   132,    -1,   132,   133,
      -1,   216,   215,   133,    -1,   131,    -1,   160,   131,    -1,
      54,   109,   160,   110,   211,    -1,    54,   109,   160,   110,
     211,    64,   211,    -1,    55,   109,   160,   110,   211,    -1,
      56,   109,   160,   110,   211,    -1,    57,   211,    56,   109,
     160,   110,   131,    -1,    58,   109,   218,   218,   110,   211,
      -1,    58,   109,   218,   218,   160,   110,   211,    -1,    56,
     109,   110,   211,    -1,    58,   109,   218,   110,   211,    -1,
      58,   109,   110,   211,    -1,    59,   135,   131,    -1,    60,
     131,    -1,    61,   131,    -1,    62,   131,    -1,    62,   160,
     131,    -1,     5,    -1,   164,   135,   132,   237,   133,    -1,
     164,   135,   132,   133,    -1,   173,   132,   237,   133,    -1,
     173,   132,   133,    -1,   135,   132,   237,   133,    -1,   135,
     132,   133,    -1,   132,   237,   133,    -1,   132,   133,    -1,
     164,   197,    -1,   197,    -1,   164,   109,   110,    -1,   120,
     164,   109,   110,    -1,    78,   164,   197,    -1,    78,   197,
      -1,   226,   217,    -1,   229,   217,    -1,   229,   131,    -1,
     227,   217,    -1,   228,   217,    -1,   164,   197,    -1,   231,
     217,    -1,   139,   130,   209,    -1,   209,    -1,   233,    -1,
     234,   115,   233,    -1,   234,   131,    -1,   235,    -1,   232,
      -1,   236,   235,    -1,   236,   232,    -1,   131,    -1,   236,
     131,    -1,   236,    -1,   234,    -1,   236,   234,    -1,   158,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   153,   153,   158,   159,   164,   166,   168,   170,   172,
     173,   176,   177,   178,   179,   180,   181,   182,   183,   184,
     188,   192,   193,   194,   195,   196,   197,   198,   199,   204,
     205,   206,   207,   208,   209,   210,   211,   215,   216,   217,
     218,   222,   223,   224,   225,   226,   227,   231,   232,   236,
     237,   241,   242,   243,   244,   245,   246,   247,   251,   252,
     256,   257,   258,   259,   263,   264,   265,   269,   270,   271,
     275,   276,   277,   278,   279,   283,   284,   285,   289,   290,
     294,   295,   299,   300,   304,   305,   309,   310,   314,   315,
     319,   320,   322,   327,   328,   329,   330,   331,   332,   333,
     334,   335,   336,   337,   341,   342,   346,   350,   351,   352,
     353,   357,   358,   359,   360,   361,   362,   363,   364,   368,
     369,   370,   371,   372,   373,   374,   375,   376,   377,   391,
     392,   393,   394,   395,   396,   397,   398,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   415,   416,   420,
     421,   425,   426,   427,   428,   429,   433,   434,   438,   443,
     444,   445,   449,   474,   478,   479,   480,   481,   482,   483,
     484,   485,   486,   487,   488,   489,   490,   491,   492,   493,
     494,   495,   499,   500,   501,   502,   503,   504,   505,   506,
     507,   508,   509,   510,   511,   512,   513,   514,   515,   520,
     521,   522,   523,   524,   529,   530,   569,   570,   574,   575,
     579,   583,   584,   588,   590,   592,   594,   596,   599,   601,
     603,   605,   607,   610,   612,   614,   616,   618,   621,   623,
     625,   627,   629,   634,   635,   636,   637,   638,   639,   640,
     641,   645,   647,   652,   654,   656,   658,   660,   665,   666,
     670,   672,   673,   674,   675,   691,   693,   698,   700,   706,
     708,   710,   712,   714,   716,   718,   720,   722,   724,   726,
     731,   733,   735,   737,   739,   744,   745,   746,   747,   748,
     749,   753,   754,   755,   756,   757,   758,   804,   805,   807,
     813,   815,   817,   819,   821,   826,   827,   830,   832,   834,
     840,   841,   842,   844,   849,   853,   855,   857,   862,   863,
     867,   868,   869,   870,   874,   875,   879,   880,   884,   885,
     886,   890,   891,   895,   896,   905,   907,   909,   925,   926,
     947,   949,   954,   955,   956,   957,   958,   959,   963,   965,
     967,   972,   973,   977,   978,   981,   985,   986,   987,   991,
     995,  1003,  1008,  1009,  1013,  1014,  1015,  1019,  1020,  1021,
    1022,  1024,  1025,  1026,  1030,  1031,  1032,  1033,  1034,  1043,
    1083,  1085,  1090,  1092,  1094,  1096,  1101,  1103,  1108,  1110,
    1115,  1120,  1125,  1127,  1132,  1134,  1136,  1138,  1140,  1146,
    1151,  1161,  1162,  1166,  1168,  1173,  1178,  1179,  1180,  1181,
    1182,  1183,  1187,  1188,  1189,  1193
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
  "'['", "']'", "'.'", "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'",
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
      41,    36,    91,    93,    46,    44,    38,    42,    43,    45,
     126,    33,    47,    37,    60,    62,    94,   124,    63,    58,
      61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   134,   135,   136,   136,   137,   137,   137,   137,   137,
     137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
     138,   139,   139,   139,   139,   139,   139,   139,   139,   140,
     140,   140,   140,   140,   140,   140,   140,   141,   141,   141,
     141,   142,   142,   142,   142,   142,   142,   143,   143,   144,
     144,   145,   145,   145,   145,   145,   145,   145,   146,   146,
     147,   147,   147,   147,   148,   148,   148,   149,   149,   149,
     150,   150,   150,   150,   150,   151,   151,   151,   152,   152,
     153,   153,   154,   154,   155,   155,   156,   156,   157,   157,
     158,   158,   158,   159,   159,   159,   159,   159,   159,   159,
     159,   159,   159,   159,   160,   160,   161,   162,   162,   162,
     162,   163,   163,   163,   163,   163,   163,   163,   163,   164,
     164,   164,   164,   164,   164,   164,   164,   164,   164,   165,
     165,   165,   165,   165,   165,   165,   165,   166,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   167,   167,   168,
     168,   169,   169,   169,   169,   169,   170,   170,   171,   172,
     172,   172,   173,   174,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   175,   175,   175,   175,
     175,   175,   176,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   176,   176,   177,
     177,   177,   177,   177,   178,   178,   179,   179,   180,   180,
     181,   182,   182,   183,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   184,   184,   184,   184,   184,   184,   184,
     184,   185,   185,   186,   186,   186,   186,   186,   187,   187,
     188,   188,   188,   188,   188,   189,   189,   190,   190,   191,
     191,   191,   191,   191,   191,   191,   191,   191,   191,   191,
     192,   192,   192,   192,   192,   193,   193,   193,   193,   193,
     193,   194,   194,   194,   194,   194,   194,   195,   195,   195,
     196,   196,   196,   196,   196,   197,   197,   197,   197,   197,
     198,   198,   198,   198,   199,   200,   200,   200,   201,   201,
     202,   202,   202,   202,   203,   203,   204,   204,   205,   205,
     205,   206,   206,   207,   207,   208,   208,   208,   209,   209,
     210,   210,   211,   211,   211,   211,   211,   211,   212,   212,
     212,   213,   213,   214,   214,   214,   215,   215,   215,   216,
     217,   217,   218,   218,   219,   219,   219,   220,   220,   220,
     220,   220,   220,   220,   221,   221,   221,   221,   221,   222,
     223,   223,   224,   224,   224,   224,   225,   225,   226,   226,
     227,   228,   229,   229,   230,   230,   230,   230,   230,   231,
     232,   233,   233,   234,   234,   235,   236,   236,   236,   236,
     236,   236,   237,   237,   237,   238
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       2,     6,     5,     6,     5,     7,     6,     7,     6,     1,
       1,     1,     4,     3,     4,     3,     3,     2,     2,     1,
       4,     3,     4,     3,     3,     2,     2,     1,     1,     3,
       3,     2,     2,     2,     4,     2,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     3,     3,     3,     1,     3,     3,     1,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       1,     3,     1,     3,     1,     3,     1,     3,     1,     5,
       1,     3,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     1,     2,     3,     2,
       5,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     3,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     1,     5,
       4,     4,     3,     5,     2,     2,     1,     1,     1,     2,
       3,     1,     3,     9,     9,     7,     7,     5,    10,    10,
       8,     8,     6,     8,     8,     6,     6,     4,     9,     9,
       7,     7,     5,     3,     2,     2,     2,     1,     2,     1,
       1,     1,     3,     1,     2,     2,     3,     5,     2,     2,
       4,     5,     7,     7,     5,     1,     3,     1,     3,     3,
       2,     3,     3,     3,     4,     4,     2,     3,     3,     4,
       3,     2,     3,     3,     4,     1,     1,     2,     2,     2,
       3,     1,     1,     2,     2,     2,     3,     1,     2,     3,
       1,     3,     4,     3,     4,     1,     2,     2,     3,     3,
       1,     1,     2,     2,     2,     3,     3,     2,     1,     2,
       1,     2,     2,     3,     1,     3,     1,     3,     2,     2,
       1,     1,     3,     1,     2,     1,     3,     4,     1,     1,
       1,     3,     1,     1,     1,     1,     1,     1,     3,     4,
       3,     1,     2,     1,     2,     2,     1,     1,     2,     1,
       2,     3,     1,     2,     5,     7,     5,     5,     7,     6,
       7,     4,     5,     4,     3,     2,     2,     2,     3,     1,
       5,     4,     4,     3,     4,     3,     3,     2,     2,     1,
       3,     4,     3,     2,     2,     2,     2,     2,     2,     2,
       2,     3,     1,     1,     3,     2,     1,     1,     2,     2,
       1,     2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    19,     2,     7,     8,     0,     0,     0,   163,     0,
       0,    57,     0,     0,     0,     0,    51,    52,    53,    54,
      55,    56,     5,    21,     3,    48,    47,    58,     0,    60,
      64,    67,    70,    75,    78,    80,    82,    84,    86,    88,
      90,   405,     0,   162,     6,     0,     0,    29,    50,    49,
      45,     0,    41,    42,   151,   152,   153,   154,   155,   165,
     166,   167,   168,   169,   171,   174,   175,   172,   173,   159,
     160,   164,   170,   206,   207,     0,   181,   161,   176,     0,
       0,   119,   121,   179,   123,   127,   177,     0,   178,   125,
      58,   106,     0,     0,     0,    10,   104,     0,   323,   111,
     179,   113,   117,   115,     0,   369,     9,     0,     0,    27,
      28,     0,     0,     0,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   103,    93,     0,    43,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
       0,    35,    36,     0,     0,     0,     0,   248,   249,     0,
     156,   158,     0,     0,   310,   120,     0,   157,   122,   124,
     128,   126,   282,     0,   281,     0,   204,   205,   183,   184,
     185,   186,   187,   189,   192,   193,   190,   191,   182,   188,
     198,     0,     0,   137,   139,   196,   141,   143,   194,   195,
     145,     0,     0,     0,     4,     0,     0,     0,     0,   112,
     114,   118,   116,   276,   324,   275,     0,   400,     0,   375,
     329,    48,   328,     0,   392,    20,     0,   397,   393,   403,
     396,     0,     0,    26,    23,    38,     0,    37,     0,    25,
      92,    91,    61,    62,    63,    65,    66,    68,    69,    73,
      74,    71,    72,    76,    77,    79,    81,    83,    85,    87,
       0,   373,     0,    44,    46,    34,    31,     0,     0,    33,
     257,     0,   255,     0,     0,     0,   271,   320,     0,     0,
     314,   316,     0,   308,   311,   312,   285,   284,     0,     0,
     283,     0,     0,     0,     0,   240,   202,     5,     0,     0,
       0,     0,   211,     0,   239,   208,     0,   379,     0,   295,
       0,     0,     6,     0,     0,     0,     0,   237,     0,     0,
       0,     0,   138,   140,   142,   144,   146,     0,     0,     0,
       0,     0,   105,   266,     0,     0,   260,     0,     0,   279,
     278,     0,     0,   277,    59,   377,     0,     0,     0,   290,
     389,   349,     0,   390,     0,   395,   401,   399,   404,   398,
     374,    24,     0,    22,     0,   372,    32,    30,     0,     0,
     250,     0,     0,   180,     0,     0,   319,   318,   301,   287,
     300,   275,   270,   272,     0,    12,   309,   313,   286,   273,
       0,     0,     0,     0,   129,   131,   135,   133,     0,     0,
     383,     0,    52,     0,     0,     0,     0,     0,     0,     0,
     234,   290,     0,     0,   241,   243,   378,   300,     0,   297,
       0,   200,   209,     0,   238,   304,     0,   307,   321,     0,
       0,     0,   296,   236,   235,   384,   387,   388,   386,   385,
     201,     0,     0,     0,     0,     0,    14,     0,     0,     0,
     259,   267,   261,   262,   280,   268,     0,   263,     0,     0,
     376,   391,   350,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   352,     5,     0,   341,     0,
     343,   332,     0,     0,     0,   333,   334,   335,   336,   337,
       0,   394,    40,    39,    89,   258,   256,     0,   251,     0,
     254,   303,   302,   278,     0,   288,   315,   317,   274,    11,
     248,   249,     0,     0,   130,   132,   136,   134,     0,   204,
     205,   382,     0,   291,     0,   210,   380,   245,     0,   302,
       0,     0,   233,     0,   244,     0,   300,   298,   212,   293,
       0,     0,   305,   306,     0,   299,   199,   203,   197,    16,
       0,    13,    18,     0,   269,   264,   265,     0,     0,     0,
       0,     0,     0,     0,     0,   365,   366,   367,     0,     0,
       0,   353,   107,     0,   147,   149,   342,     0,   345,   344,
     351,   109,     0,     0,   289,     0,     0,   227,     0,     0,
       0,   381,   371,     0,   300,   242,   246,   302,   292,   294,
     322,    15,    17,     0,   340,     0,     0,     0,     0,     0,
       0,     0,   364,   368,     0,   338,     0,   108,     0,   252,
     253,     0,     0,     0,     0,   217,     0,     0,   232,     0,
     370,     0,   339,     0,     0,   361,     0,     0,   363,     0,
       0,     0,   148,     0,   325,   150,     0,   225,     0,   226,
       0,     0,     0,     0,     0,     0,   222,   247,   354,   356,
     357,     0,   362,     0,     0,   110,   330,     0,     0,     0,
       0,   215,     0,   216,     0,   230,     0,   231,     0,     0,
       0,     0,   359,     0,     0,   326,   223,   224,     0,     0,
       0,     0,     0,   220,     0,   221,   355,   358,   360,   327,
     331,   213,   214,   228,   229,     0,     0,   218,   219
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    22,    23,    24,   220,    25,    48,   236,    26,    90,
      50,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    96,   125,   477,    92,   578,    98,
     299,   393,   192,   573,   574,    81,   300,   167,    82,    42,
      43,    84,   196,    85,    86,    87,   301,   302,   303,   304,
     305,   413,   414,    88,    89,   271,   272,   213,   172,   334,
     173,   404,   306,   307,   379,   308,   309,   284,   310,   335,
     280,   281,   430,   104,   645,   224,   667,   480,   481,   482,
     483,   484,   352,   485,   486,   487,   488,   489,   106,   311,
      44,   225,   313,   314,   315,   316,   317,   226,   227,   228,
     229,   230,   231,   232,    45
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -604
static const short int yypact[] =
{
    4688,  -604,  -604,  -604,  -604,  4729,  4764,  4764,  -604,  6120,
    4688,  -604,  6120,  4688,  4274,    42,  -604,  -604,  -604,  -604,
    -604,  -604,   -53,  -604,  -604,   310,  -604,   495,  4688,  -604,
     326,   142,   395,   225,   414,   -32,    41,   -22,   269,    33,
    -604,  -604,   143,  -604,  -604,   301,  4395,  -604,   366,  -604,
    -604,  3902,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,    34,  -604,  -604,  -604,   223,
    5301,  -604,  -604,  -604,  -604,  -604,  -604,    38,  -604,  -604,
    -604,  -604,  6266,  5391,  6266,  -604,  -604,   131,  5709,  -604,
     143,  -604,  -604,  -604,   226,  -604,  -604,  1794,   339,  -604,
    -604,  1274,  4688,   339,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,  3445,  -604,  4688,  4688,  4688,
    4688,  4688,  4688,  4688,  4688,  4688,  4688,  4688,  4688,  4688,
    4688,  4688,  4688,  4688,  4688,  4688,  1915,  -604,   234,   245,
     339,  -604,  -604,  3372,  4688,   339,   339,   244,   251,   329,
    -604,  -604,  5481,  4688,    77,  -604,   -31,  -604,  -604,  -604,
    -604,  -604,   284,   308,   323,  2387,   298,   309,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,   338,  5571,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  4688,   347,  5661,  -604,  4688,  5211,  4446,   295,  -604,
    -604,  -604,  -604,    99,  -604,   231,  4688,  -604,  2036,  -604,
    -604,   304,  -604,  5038,  -604,  -604,   318,  -604,  -604,    44,
    -604,  2157,   337,  -604,  -604,  -604,   138,  -604,   179,  -604,
    -604,  -604,  -604,  -604,  -604,   326,   326,   142,   142,   395,
     395,   395,   395,   225,   225,   414,   -32,    41,   -22,   269,
     -46,  -604,   344,  -604,  -604,  -604,  -604,   219,   210,  -604,
     342,   150,  -604,   339,   339,   374,  -604,  4948,   379,   382,
     387,  -604,   384,  -604,    77,  -604,   284,   323,  5799,  4688,
     284,  6193,  5038,  3936,  6120,  -604,  -604,   -53,   492,  3951,
      27,  2496,  -604,    72,  -604,  -604,   305,  -604,  5128,  -604,
     259,   373,   381,   318,   318,   318,   355,  -604,  2605,  3606,
     329,  4688,  -604,  -604,  -604,  -604,  -604,   396,   397,  4688,
    4688,   430,  -604,  -604,   416,   428,  -604,   437,   -56,    99,
     231,  5882,  4480,    99,  -604,  -604,   422,  3445,   170,  -604,
    -604,   424,  3214,  -604,  3445,  -604,  -604,  -604,    44,  -604,
    -604,  -604,  3445,  -604,  4688,  -604,  -604,  -604,  4688,   339,
    -604,   121,   124,  -604,  4858,    97,  -604,  -604,   305,  -604,
    -604,   247,  -604,  -604,  6047,  -604,  -604,  -604,   284,  -604,
     452,   453,   207,  3846,  -604,  -604,  -604,  -604,   207,  5038,
    -604,  4153,   509,    27,   458,   259,  5965,  3445,   193,  4688,
    -604,   442,    27,   199,  -604,    -9,  -604,   443,   259,  -604,
      15,  -604,  -604,   434,  -604,  -604,  4532,  -604,  -604,   459,
     272,    15,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  2714,  2823,   466,   465,  4688,  -604,   467,   468,  4688,
    -604,  -604,  -604,  -604,    99,  -604,   469,  -604,   472,   -39,
    -604,  -604,  -604,  4688,   461,   473,   478,   482,  3299,   483,
     339,   462,   463,  3742,   339,  -604,    86,   236,  -604,  4055,
    -604,  -604,  1431,  1552,   464,  -604,  -604,  -604,  -604,  -604,
     471,  -604,  -604,  -604,  -604,  -604,  -604,  3606,  -604,  3606,
    -604,   305,  -604,   247,    15,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,   -35,   476,  -604,  -604,  -604,  -604,    14,  -604,
    -604,  -604,   259,  -604,   485,  -604,  -604,  -604,  2278,   477,
     259,    60,  -604,  4688,  -604,    15,   480,  -604,  -604,  -604,
     500,   -38,  -604,  -604,   339,  -604,  -604,  -604,  -604,  -604,
     501,  -604,  -604,   502,  -604,  -604,  -604,   487,  3299,  4688,
    4688,  4567,   540,  3658,   486,  -604,  -604,  -604,   264,   491,
    3299,  -604,  -604,   266,  -604,   493,  -604,  1673,  -604,  -604,
    -604,  -604,  2932,  3041,  -604,   318,   318,  -604,    47,   173,
     496,  -604,  -604,   508,   497,  -604,   490,   510,  -604,  -604,
    -604,  -604,  -604,  3299,  -604,   279,   321,  3299,   341,   535,
    3299,  3691,  -604,  -604,  4688,  -604,   170,  -604,  3497,  -604,
    -604,   -37,   -45,   318,   318,  -604,   318,   318,  -604,   194,
    -604,  4688,  -604,  3299,  3299,  -604,  3299,  4688,  -604,  3299,
    4608,   515,  -604,  3497,  -604,  -604,   318,  -604,   318,  -604,
     -14,   -15,    93,    45,   318,   318,  -604,  -604,   584,  -604,
    -604,   356,  -604,  3299,   359,  -604,  -604,   167,   519,   520,
     318,  -604,   318,  -604,   318,  -604,   318,  -604,   158,    62,
    3299,   524,  -604,  3299,  3093,  -604,  -604,  -604,   523,   525,
     526,   527,   318,  -604,   318,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,   532,   533,  -604,  -604
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -604,   377,  -604,   652,   -89,   -88,  -604,   518,   663,     0,
    -604,  -604,   -19,   404,   392,   394,   426,   534,   531,   537,
     530,   538,  -604,    16,     2,  -604,   -13,    18,  -347,  -604,
     215,  -604,   581,  -604,    65,   -21,   -77,   273,   850,   727,
     -27,    -3,  -112,     9,    48,  -246,  -306,   267,  -604,  -604,
    -293,  -604,   161,    66,    92,   299,   320,  -183,  -113,   -94,
     106,  -250,   920,  -195,  -366,  -604,   885,  -604,   669,  -120,
    -604,   315,  -604,   647,  -603,  -279,  -604,    28,  -604,  -604,
     212,  -604,  -604,   489,  -519,  -604,  -604,  -604,  -604,  -332,
     -42,  -604,  -604,  -604,  -604,  -604,  -604,  -604,   470,   346,
     474,   475,  -604,  -136,  -604
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -403
static const short int yytable[] =
{
      27,    97,    41,   166,   214,   478,    52,    53,   422,   126,
     262,   101,   441,   442,    27,   505,   166,     2,     2,   221,
     490,   208,   235,   102,   648,   339,    91,   377,   350,    91,
       2,    94,   343,   646,   585,   586,   240,     2,    97,   505,
     666,     2,   279,   101,   611,   398,   148,   105,   158,   415,
     144,    27,   505,   286,   672,   102,   670,   453,   221,   165,
     177,   290,     8,     2,   235,   195,     8,   195,   461,   205,
     161,   193,   165,   193,   556,   599,   146,   169,   162,   107,
     324,   700,   346,   364,   140,   166,   164,   298,   649,   170,
     169,   324,   640,   146,   146,   210,   647,   400,   587,   238,
       2,   197,   170,   197,   416,   142,   103,   211,   242,   243,
     244,    27,    27,   237,   676,   166,   623,   624,   673,   671,
     533,    69,    70,   222,   348,    27,   166,   241,   525,   208,
     221,   694,   260,   312,   160,   576,   348,   584,   103,   161,
     198,   268,   198,   221,   164,    27,   589,   398,   422,   422,
     490,   490,    77,    27,    27,   237,   584,   454,   199,   354,
     199,   145,   222,   674,   584,   195,   156,   141,   390,   348,
     175,   322,   171,     2,   388,   355,   195,   164,   677,    91,
     625,   282,   322,   376,   200,   171,   200,   423,   429,   409,
     212,   582,   339,   583,   164,   695,     2,   344,   343,   202,
     375,   325,   165,   424,   521,    27,   374,   332,   341,   207,
       2,   342,   325,   298,   164,   570,   403,    91,   107,   328,
     169,   456,   412,    91,    80,   337,   675,    93,   692,   575,
     298,   298,   170,   431,   222,     8,   369,   134,   135,   369,
     198,   204,   626,   627,   160,   490,   205,   222,   361,   161,
       2,   198,   497,   362,   498,   499,   165,   500,   199,   312,
     130,   131,     2,   654,   655,   369,   221,   160,   278,   199,
     394,   403,   161,   492,   169,   146,   312,   312,   165,   348,
      97,   415,   684,   370,   326,   143,   170,   164,   397,   422,
     422,   693,   363,    27,   205,   326,   169,   375,   327,   518,
     685,   147,   348,   526,   504,    91,   628,   391,   170,   331,
     164,   108,   109,   110,   531,   171,   208,   108,   109,   110,
     454,   160,   223,   367,   403,   205,   161,   656,   504,   366,
     532,   403,   159,   160,   362,   298,   216,    91,   161,   444,
     206,   535,     2,   207,   263,    91,    91,   447,   448,   136,
     137,   205,    27,   298,   298,   264,   374,     8,    91,   207,
     458,   223,    27,   222,   493,   511,   575,   571,   348,   171,
     222,   520,   514,   150,   151,   152,   273,   277,   165,   205,
     494,   616,   543,   274,    91,   165,   495,   544,    97,   633,
     517,   171,   593,   288,   205,   613,   169,   617,   101,   312,
     312,    27,   403,   169,   206,   132,   133,   207,   170,   298,
     102,   298,   164,   111,   425,   170,   112,   426,   113,   111,
     289,   277,   112,   222,   113,    91,   504,   527,   138,   139,
     318,   634,   162,   223,   347,     1,   205,     2,     3,     4,
     221,   319,    91,   127,   540,   504,   223,   320,   128,   129,
     351,   636,   157,   504,   403,   312,   205,   312,   165,   329,
     568,    91,     8,   550,   176,    91,   681,   553,    27,   683,
     360,   205,   368,    27,   205,   153,   169,   365,   154,    91,
     155,   557,    27,    27,   373,   233,   438,   351,   170,   382,
     239,   171,   383,   103,   298,   298,   562,   385,   171,   108,
     109,   110,   384,   277,   433,     9,    10,   399,   445,   406,
     446,   579,   434,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   277,   247,   248,   450,   265,   249,   250,
     251,   252,   269,   270,   245,   246,    12,    13,   451,   403,
     312,   312,   449,    51,   222,    15,   605,   606,   608,    91,
     452,   596,   297,    69,    70,   460,   277,   462,    27,    27,
      27,    27,   508,    27,   253,   254,   509,   479,   523,   542,
      27,   171,   371,   372,   528,  -295,   548,    27,   549,   554,
     551,   552,   559,  -310,    77,   555,   604,   560,  -310,   277,
     558,   561,   563,   565,   566,   591,   609,   580,   615,   277,
     349,   111,   581,    27,   112,   579,   113,    27,   588,  -297,
      27,    27,  -296,   598,   601,   602,   603,   612,    27,   631,
     644,   614,   407,   618,   661,   124,   164,   664,   629,  -298,
      91,   632,   641,    27,    27,   635,    27,    27,   638,    27,
      27,   630,  -299,    27,   637,   644,   665,    91,   680,   657,
     270,   270,   686,   687,   349,   697,   701,    47,   702,   703,
     704,   658,   659,    27,   660,   707,   708,   662,    49,   349,
     297,   267,   256,   258,   255,   203,   411,   349,   297,   257,
      27,   642,   259,    27,    27,   428,   644,   349,   534,   496,
     538,   682,   595,   149,   577,   297,   297,   479,   479,   507,
     491,   357,     0,     0,     0,   358,   359,     0,   696,     0,
       0,   698,     0,     0,     0,   353,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   349,     0,     0,     0,   476,
       0,     0,     0,     0,     0,     0,    83,     0,     0,    83,
       0,   100,     0,   223,     0,     0,   270,     0,     0,   174,
       0,   349,   349,     0,     0,     0,     0,     0,   349,     0,
       0,     0,   174,     0,     0,     0,     0,   215,     0,   510,
     513,     0,     0,   100,     0,   519,   349,     0,   297,     0,
     349,     0,   349,     0,     0,   349,     0,     0,     0,   349,
       0,     0,   479,     0,     0,   349,     0,   349,     0,     0,
       0,     0,   435,   436,   437,   439,     0,    83,   349,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   297,   297,
      83,     0,     0,     0,     0,    83,     0,     0,     0,     0,
       0,   174,     0,   285,   100,   287,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   476,     0,   564,     0,     0,
       0,   569,     0,     0,     0,     0,   411,     0,     0,   476,
     476,   174,     0,     0,    99,     0,     0,     0,     0,     0,
       0,     0,   174,   100,   297,   215,   297,   340,     0,     0,
     349,   349,     0,     0,     0,     0,   275,     0,     0,    83,
       0,     0,     0,     0,     0,   590,    99,     0,     0,   349,
       0,     0,   100,     0,     0,     0,     0,   349,   349,     0,
       0,     0,   349,     0,     0,     0,     0,     0,     0,     0,
       0,   600,     0,     0,     0,     0,     0,     0,     0,     0,
     168,     0,     0,    83,   338,   476,     0,     0,     0,     0,
       0,     0,   194,   168,   194,   100,   381,   476,   209,     0,
      83,     0,     0,   387,   476,     0,     0,     0,   100,   297,
     297,     0,   405,     0,     0,     0,     0,     0,   418,   420,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     476,     0,     0,     0,   476,     0,     0,   476,     0,     0,
       0,     0,     0,   349,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
     476,   476,     0,   476,   283,    83,   476,   405,   396,    83,
       0,    83,     0,     0,     0,     0,    83,     0,   100,     0,
       0,     0,     0,     0,     0,    83,     0,     0,     0,     0,
     476,     0,   323,   381,   503,   100,   100,   443,     0,     0,
       0,     0,     0,   323,     0,     0,     0,   476,     0,     0,
     476,     0,   215,     0,     0,     0,     0,     0,    83,   459,
     405,   285,   522,   168,   621,   622,     0,   405,     0,   100,
       0,   530,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,   650,   651,     0,   652,   653,     0,     0,     0,
     516,     0,     0,     0,     0,     0,    83,   168,   100,     0,
       0,     0,     0,    83,   386,   668,     0,   669,     0,     0,
       0,   395,     0,   678,   679,     0,     0,     0,   405,   168,
       0,     0,     0,   541,     0,     0,     0,     0,     0,   688,
       0,   689,   380,   690,     0,   691,     0,     0,   100,   100,
       0,     0,     0,     0,     0,     0,     0,     0,   380,     0,
       0,   705,     0,   706,   417,   419,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   432,     0,   378,     0,     0,
     405,     0,     0,     0,     0,     0,    83,     0,     0,   100,
     100,     0,     0,   378,     0,     0,     0,     0,     0,   378,
       0,     0,     0,     0,   100,     0,   100,     0,     0,     0,
       0,     0,     0,   380,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   515,     0,     0,     0,     0,     0,   168,
       0,    99,   283,     0,     0,   100,   168,     0,     0,   380,
     502,     0,     0,     0,     0,     0,   380,     0,   378,     0,
       0,     0,     0,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,   405,   380,     0,   502,     0,
     380,     0,     0,   380,   378,   501,     0,   529,     0,     0,
       0,   378,     8,   536,   100,   537,     0,     0,     0,   100,
     100,     0,     0,     0,     0,     0,   545,     0,     0,     0,
       0,   378,     0,   501,     0,   378,     0,     0,   378,   168,
       0,     0,   501,     0,     0,     0,     0,     0,   378,     0,
       0,     0,     0,     0,     0,     9,    10,    11,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   380,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    14,   234,    15,     0,     0,   380,   502,
      16,    17,    18,    19,    20,    21,     0,     0,     0,   378,
       0,     0,     0,     0,     0,     0,   218,   380,     0,     0,
       0,     0,     0,     0,     0,   594,   380,     0,     0,     0,
     597,     0,     0,   378,   501,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,   378,     0,     0,     0,     0,     0,     0,     0,
     378,   378,     0,     0,     0,   501,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,   463,   464,   465,   466,   467,   468,   469,
     470,   471,   472,   473,     0,     0,     0,    76,     0,     0,
       0,   380,     9,    10,    11,     0,    77,     0,   474,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,    12,    13,     0,   378,     0,     0,     0,
      14,     0,    15,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   475,   351,  -347,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,   463,   464,   465,   466,   467,   468,
     469,   470,   471,   472,   473,     0,     0,     0,    76,     0,
       0,     0,     0,     9,    10,    11,     0,    77,     0,   474,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,    15,     0,     0,     0,     0,    16,    17,
      18,    19,    20,    21,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   475,   351,  -346,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,   463,   464,   465,   466,   467,
     468,   469,   470,   471,   472,   473,     0,     0,     0,    76,
       0,     0,     0,     0,     9,    10,    11,     0,    77,     0,
     474,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,    15,     0,     0,     0,     0,    16,
      17,    18,    19,    20,    21,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   475,   351,  -348,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     9,    10,    11,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,    15,     0,     0,     0,     0,
      16,    17,    18,    19,    20,    21,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   217,   218,   219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     9,    10,    11,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,    15,     0,     0,     0,
       0,    16,    17,    18,    19,    20,    21,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   217,   218,   261,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,     0,     0,     9,    10,    11,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,    15,     0,     0,
       0,     0,    16,    17,    18,    19,    20,    21,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   217,   218,   345,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,     0,     0,     9,    10,
      11,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,    15,     0,
       0,     0,     0,    16,    17,    18,    19,    20,    21,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   356,   218,
    -402,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     9,
      10,    11,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     1,    15,
       2,     3,     4,     0,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   217,
     218,   592,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,   291,     0,     0,     9,    10,
       0,   160,    77,     0,     0,   292,   161,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,    12,
      13,     0,     0,     0,     0,     0,   293,     1,    15,     2,
       3,     4,     0,     0,   164,     0,     0,   294,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   295,     0,
     296,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,   291,     0,     0,     9,    10,     0,
     160,    77,     0,     0,   292,   161,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,   293,     1,    15,     2,     3,
       4,     0,     0,   164,     0,     0,   294,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   295,     0,   421,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,   291,     0,     0,     9,    10,     0,   160,
      77,     0,     0,   292,   161,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,    12,    13,     0,
       0,     0,     0,     0,   293,     1,    15,     2,     3,     4,
       0,     0,   164,     0,     0,   294,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   295,     0,   440,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,   291,     0,     0,     9,    10,     0,   160,    77,
       0,     0,   292,   161,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,    12,    13,     0,     0,
       0,     0,     0,   293,     1,    15,     2,     3,     4,     0,
       0,   164,     0,     0,   294,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   295,     0,   546,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,   291,     0,     0,     9,    10,     0,   160,    77,     0,
       0,   292,   161,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,   293,     1,    15,     2,     3,     4,     0,     0,
     164,     0,     0,   294,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   295,     0,   547,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
     291,     0,     0,     9,    10,     0,   160,    77,     0,     0,
     292,   161,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,    12,    13,     0,     0,     0,     0,
       0,   293,     1,    15,     2,     3,     4,     0,     0,   164,
       0,     0,   294,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   295,     0,   619,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,    76,     0,   291,
       0,     0,     9,    10,     0,   160,    77,     0,     0,   292,
     161,     8,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,    12,    13,     0,     0,     0,     0,     0,
     293,     0,    15,     0,     0,     0,     0,     0,   164,     0,
       0,   294,     0,     0,     9,    10,    11,     0,     0,     0,
       0,     0,   295,     0,   620,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,    15,     0,     0,     0,     0,    16,
      17,    18,    19,    20,    21,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,   643,   699,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,   463,   464,   465,   466,
     467,   468,   469,   470,   471,   472,   473,     0,     0,     0,
      76,     0,     0,     0,     0,     9,    10,    11,     0,    77,
       0,   474,     0,     0,     0,     0,     0,     0,     0,    78,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,    79,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,    15,     0,     8,     0,     0,
      16,    17,    18,    19,    20,    21,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   475,   351,     0,     0,     0,
       0,   463,   464,   465,   466,   467,   468,   469,   470,   471,
     472,   473,     0,     0,     0,     0,     0,     0,     0,     0,
       9,    10,    11,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    12,    13,     0,     0,     0,     0,     0,    14,     0,
      15,     0,     0,     0,     0,    16,    17,    18,    19,    20,
      21,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     475,   351,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    12,    13,     0,     0,     0,     0,
       0,    14,   266,    15,     0,     0,     0,     0,    16,    17,
      18,    19,    20,    21,     0,     0,     0,     0,     1,     0,
       2,     3,     4,     5,   218,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     0,
       0,     0,     0,     0,     0,     8,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,    15,     0,     0,     0,
       0,    16,    17,    18,    19,    20,    21,     0,     9,    10,
      11,     0,     0,     0,     0,     0,     0,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     1,    15,     2,
       3,     4,     0,    16,    17,    18,    19,    20,    21,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   643,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,    76,     0,   291,     0,     0,     9,    10,     0,
     160,    77,     0,     0,   292,   161,     8,     0,     0,     0,
       0,    78,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,   293,     0,    15,     0,     8,
       0,     0,     0,   164,     0,     0,   294,     0,     0,     9,
      10,    11,     0,     0,     0,     0,     0,   295,     0,     0,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     9,    10,    11,     0,     0,    14,   610,    15,
       8,     0,     0,     0,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   475,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,   639,    15,     0,     0,     0,     0,    16,    17,    18,
      19,    20,    21,     9,    10,    11,     0,     0,     0,     0,
       0,     0,   475,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     2,
       0,    14,     0,    15,     0,     0,     0,     0,    16,    17,
      18,    19,    20,    21,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   567,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,   392,     0,     0,     0,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,    76,     0,     0,     0,     0,     0,     0,     0,
     160,    77,     0,     0,     0,   161,     0,     0,     0,     0,
       8,    78,     0,     0,     0,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,    79,     0,     0,     0,
       0,     0,     0,     0,     2,   206,     0,     0,   207,     0,
       0,     0,     0,   164,     8,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     0,     0,   512,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,    12,    13,     0,     9,    10,    11,
     160,    14,    95,    15,     0,   161,     0,    76,    16,    17,
      18,    19,    20,    21,     0,   160,    77,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    78,     0,    12,    13,
       0,     0,     0,     0,     0,   401,    95,    15,     0,     0,
       0,    79,    16,   402,    18,    19,    20,    21,     2,     0,
     408,     0,     0,     0,     0,     0,     0,     0,   164,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     409,     0,   410,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,   160,
      77,     0,     0,     0,   161,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,    79,     2,     3,     4,     5,
       0,     6,     7,     0,   348,     0,     0,     0,     0,     0,
       0,     0,   164,     0,     0,     0,     0,     0,     0,     0,
       0,     8,     0,     0,     0,     0,   572,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     9,    10,    11,   160,    77,     0,
       0,     0,   161,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,   401,    95,    15,     0,     0,     0,     0,    16,
     402,    18,    19,    20,    21,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,     0,     0,     0,     0,     0,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     9,    10,    11,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,    12,    13,     0,     0,
       0,     0,     0,    14,    95,    15,     0,     0,     0,     0,
      16,    17,    18,    19,    20,    21,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     9,    10,    11,     0,
      77,     0,     0,     0,     8,     0,     0,     0,     0,     0,
      78,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,    79,     0,    12,    13,     0,
       0,     0,     0,     0,    51,    95,    15,     0,     8,     0,
       0,    16,    17,    18,    19,    20,    21,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     9,    10,    11,     0,    14,     0,    15,     0,   336,
       8,     0,    16,    17,    18,    19,    20,    21,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,    15,     0,   457,     0,     8,    16,    17,    18,    19,
      20,    21,     0,     9,    10,    11,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     8,     0,     9,    10,
      11,    14,     0,    15,     0,   539,     0,     0,    16,    17,
      18,    19,    20,    21,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,   607,    15,     9,
      10,    11,     0,    16,    17,    18,    19,    20,    21,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     8,    14,   663,    15,
       0,     0,     0,     0,    16,    17,    18,    19,    20,    21,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     9,
      10,    11,     0,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     8,     0,     0,     0,     0,    14,     0,    15,
       9,    10,    11,     0,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,     9,    10,    11,    46,     0,
      15,     0,     0,     0,     0,    16,    17,    18,    19,    20,
      21,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    51,     0,    15,     0,     0,     0,     0,
      16,    17,    18,    19,    20,    21,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,   160,    77,     0,     0,     0,   161,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,   374,   333,     0,
     207,     0,     0,     0,     0,   164,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,   160,    77,     0,     0,     0,   161,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,   374,     0,     0,
     207,     0,     0,     0,     0,   164,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,   160,    77,     0,     0,     0,   161,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,   348,     0,     0,
       0,     0,     0,     0,     0,   164,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   427,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   160,    77,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
     206,   333,     0,   207,     0,     0,     0,     0,   164,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   160,    77,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
     162,     0,     0,   163,     0,     0,     0,     0,   164,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   160,    77,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
     162,     0,     0,   201,     0,     0,     0,     0,   164,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   160,    77,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
     162,   276,     0,     0,     0,     0,     0,     0,   164,     8,
      54,    55,    56,    57,    58,   178,   179,   180,   181,   182,
     183,   184,   185,   186,   187,    69,    70,   188,   189,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   190,     0,     0,
       0,     0,     0,     0,     0,   160,    77,     0,     0,     0,
     161,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   191,     0,     0,     0,     0,     0,     0,     0,     0,
     162,     0,     0,   321,     0,     0,     0,     0,   164,     8,
      54,    55,    56,    57,    58,   178,   179,   180,   181,   182,
     183,   184,   185,   186,   187,    69,    70,   188,   189,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   190,     0,     0,
       0,     0,     0,     0,     0,   160,    77,     8,     0,     0,
     161,     0,     0,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,   191,     0,     0,     0,     0,     0,     0,     0,     0,
     162,     0,     0,   330,     0,    76,     0,     0,   164,     0,
       0,     0,     0,   160,    77,     0,     0,     0,   161,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,   206,     0,
       0,   207,     0,     0,     0,     0,   164,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    76,     0,     0,     0,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   389,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   455,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,   524,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,   506,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,   392,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     8,    54,    55,    56,    57,    58,
     178,   179,   180,   181,   182,   183,   184,   185,   186,   187,
      69,    70,   188,   189,    73,    74,    75,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   190,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   191
};

static const short int yycheck[] =
{
       0,    14,     0,    80,    98,   352,     6,     7,   301,    28,
     146,    14,   318,   319,    14,   381,    93,     3,     3,   107,
     352,    98,   111,    14,    69,   208,    10,   277,   223,    13,
       3,    13,   215,    70,    69,    70,   125,     3,    51,   405,
     643,     3,   162,    46,   563,   291,    46,     5,    75,   299,
      17,    51,   418,   166,    69,    46,    70,   113,   146,    80,
      87,   174,    28,     3,   153,    92,    28,    94,   347,   115,
      79,    92,    93,    94,   113,   113,   132,    80,   109,   132,
     192,   684,   218,   129,   116,   162,   117,   175,   133,    80,
      93,   203,   611,   132,   132,    98,   133,   292,   133,   112,
       3,    92,    93,    94,   299,   127,    14,    98,   127,   128,
     129,   111,   112,   111,    69,   192,    69,    70,   133,   133,
     129,    44,    45,   107,   109,   125,   203,   125,   407,   206,
     218,    69,   145,   175,    74,   482,   109,   503,    46,    79,
      92,   154,    94,   231,   117,   145,   132,   393,   441,   442,
     482,   483,    75,   153,   154,   153,   522,   340,    92,   115,
      94,   128,   146,    70,   530,   192,   132,   126,   288,   109,
     132,   192,    80,     3,   287,   131,   203,   117,   133,   163,
     133,   163,   203,   277,    92,    93,    94,   115,   308,   129,
      98,   497,   375,   499,   117,   133,     3,   216,   381,    93,
     277,   192,   223,   131,   399,   205,   109,   205,   109,   112,
       3,   112,   203,   301,   117,   129,   293,   201,   132,   201,
     223,   341,   299,   207,     9,   207,   133,    12,    70,   479,
     318,   319,   223,   310,   218,    28,   115,    12,    13,   115,
     192,   110,    69,    70,    74,   577,   115,   231,   110,    79,
       3,   203,   131,   115,   133,   131,   277,   133,   192,   301,
     118,   119,     3,    69,    70,   115,   354,    74,   162,   203,
     291,   348,    79,   362,   277,   132,   318,   319,   299,   109,
     293,   531,   115,   133,   192,    16,   277,   117,   291,   582,
     583,   133,   113,   293,   115,   203,   299,   374,   192,   393,
     133,     0,   109,   110,   381,   289,   133,   289,   299,   203,
     117,     7,     8,     9,   115,   223,   393,     7,     8,     9,
     503,    74,   107,   113,   401,   115,    79,   133,   405,   110,
     131,   408,   109,    74,   115,   423,   110,   321,    79,   321,
     109,   418,     3,   112,   110,   329,   330,   329,   330,   124,
     125,   115,   352,   441,   442,   110,   109,    28,   342,   112,
     342,   146,   362,   347,   362,   392,   616,   131,   109,   277,
     354,   398,   393,     7,     8,     9,   132,   162,   399,   115,
     364,   115,   110,   132,   368,   406,   368,   115,   401,   110,
     393,   299,   528,   109,   115,   131,   399,   131,   401,   441,
     442,   401,   479,   406,   109,    10,    11,   112,   399,   497,
     401,   499,   117,   109,   109,   406,   112,   112,   114,   109,
     112,   206,   112,   407,   114,   409,   503,   409,    14,    15,
     132,   110,   109,   218,   130,     1,   115,     3,     4,     5,
     528,   132,   426,   117,   426,   522,   231,   109,   122,   123,
     132,   110,    75,   530,   531,   497,   115,   499,   479,   112,
     473,   445,    28,   445,    87,   449,   110,   449,   468,   110,
     133,   115,   130,   473,   115,   109,   479,   133,   112,   463,
     114,   463,   482,   483,   110,   108,   131,   132,   479,   110,
     113,   399,   110,   401,   582,   583,   468,   113,   406,     7,
       8,     9,   115,   288,   131,    71,    72,   292,   112,   294,
     113,   483,   131,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,   308,   132,   133,   110,   150,   134,   135,
     136,   137,   155,   156,   130,   131,   102,   103,   110,   616,
     582,   583,   112,   109,   528,   111,   559,   560,   561,   533,
     113,   533,   175,    44,    45,   133,   341,   133,   558,   559,
     560,   561,   110,   563,   138,   139,   113,   352,   110,   110,
     570,   479,   273,   274,   132,   132,   110,   577,   113,   110,
     113,   113,   109,    74,    75,   113,   558,   109,    79,   374,
     129,   109,   109,   131,   131,   110,    56,   133,   570,   384,
     223,   109,   131,   603,   112,   577,   114,   607,   132,   132,
     610,   611,   132,   113,   113,   113,   129,   131,   618,   129,
     618,   130,   130,   130,   637,   130,   117,   640,   132,   132,
     614,   603,   614,   633,   634,   607,   636,   637,   610,   639,
     640,   133,   132,   643,   109,   643,   131,   631,    64,   631,
     273,   274,   133,   133,   277,   131,   133,     5,   133,   133,
     133,   633,   634,   663,   636,   133,   133,   639,     5,   292,
     293,   153,   141,   143,   140,    94,   299,   300,   301,   142,
     680,   616,   144,   683,   684,   308,   684,   310,   415,   369,
     423,   663,   531,    46,   482,   318,   319,   482,   483,   384,
     354,   231,    -1,    -1,    -1,   231,   231,    -1,   680,    -1,
      -1,   683,    -1,    -1,    -1,   226,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   348,    -1,    -1,    -1,   352,
      -1,    -1,    -1,    -1,    -1,    -1,     9,    -1,    -1,    12,
      -1,    14,    -1,   528,    -1,    -1,   369,    -1,    -1,    80,
      -1,   374,   375,    -1,    -1,    -1,    -1,    -1,   381,    -1,
      -1,    -1,    93,    -1,    -1,    -1,    -1,    98,    -1,   392,
     393,    -1,    -1,    46,    -1,   398,   399,    -1,   401,    -1,
     403,    -1,   405,    -1,    -1,   408,    -1,    -1,    -1,   412,
      -1,    -1,   577,    -1,    -1,   418,    -1,   420,    -1,    -1,
      -1,    -1,   313,   314,   315,   316,    -1,    80,   431,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   441,   442,
      93,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,    -1,
      -1,   162,    -1,   164,   107,   166,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   468,    -1,   470,    -1,    -1,
      -1,   474,    -1,    -1,    -1,    -1,   479,    -1,    -1,   482,
     483,   192,    -1,    -1,    14,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   203,   146,   497,   206,   499,   208,    -1,    -1,
     503,   504,    -1,    -1,    -1,    -1,   159,    -1,    -1,   162,
      -1,    -1,    -1,    -1,    -1,   518,    46,    -1,    -1,   522,
      -1,    -1,   175,    -1,    -1,    -1,    -1,   530,   531,    -1,
      -1,    -1,   535,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   544,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      80,    -1,    -1,   206,   207,   558,    -1,    -1,    -1,    -1,
      -1,    -1,    92,    93,    94,   218,   277,   570,    98,    -1,
     223,    -1,    -1,   284,   577,    -1,    -1,    -1,   231,   582,
     583,    -1,   293,    -1,    -1,    -1,    -1,    -1,   299,   300,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     603,    -1,    -1,    -1,   607,    -1,    -1,   610,    -1,    -1,
      -1,    -1,    -1,   616,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   277,    -1,    -1,    -1,    -1,    -1,
     633,   634,    -1,   636,   164,   288,   639,   348,   291,   292,
      -1,   294,    -1,    -1,    -1,    -1,   299,    -1,   301,    -1,
      -1,    -1,    -1,    -1,    -1,   308,    -1,    -1,    -1,    -1,
     663,    -1,   192,   374,   375,   318,   319,   320,    -1,    -1,
      -1,    -1,    -1,   203,    -1,    -1,    -1,   680,    -1,    -1,
     683,    -1,   393,    -1,    -1,    -1,    -1,    -1,   341,   342,
     401,   402,   403,   223,   585,   586,    -1,   408,    -1,   352,
      -1,   412,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   374,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   384,   623,   624,    -1,   626,   627,    -1,    -1,    -1,
     393,    -1,    -1,    -1,    -1,    -1,   399,   277,   401,    -1,
      -1,    -1,    -1,   406,   284,   646,    -1,   648,    -1,    -1,
      -1,   291,    -1,   654,   655,    -1,    -1,    -1,   479,   299,
      -1,    -1,    -1,   426,    -1,    -1,    -1,    -1,    -1,   670,
      -1,   672,   277,   674,    -1,   676,    -1,    -1,   441,   442,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   293,    -1,
      -1,   692,    -1,   694,   299,   300,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   310,    -1,   277,    -1,    -1,
     531,    -1,    -1,    -1,    -1,    -1,   479,    -1,    -1,   482,
     483,    -1,    -1,   293,    -1,    -1,    -1,    -1,    -1,   299,
      -1,    -1,    -1,    -1,   497,    -1,   499,    -1,    -1,    -1,
      -1,    -1,    -1,   348,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   393,    -1,    -1,    -1,    -1,    -1,   399,
      -1,   401,   402,    -1,    -1,   528,   406,    -1,    -1,   374,
     375,    -1,    -1,    -1,    -1,    -1,   381,    -1,   348,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,   616,   401,    -1,   403,    -1,
     405,    -1,    -1,   408,   374,   375,    -1,   412,    -1,    -1,
      -1,   381,    28,   418,   577,   420,    -1,    -1,    -1,   582,
     583,    -1,    -1,    -1,    -1,    -1,   431,    -1,    -1,    -1,
      -1,   401,    -1,   403,    -1,   405,    -1,    -1,   408,   479,
      -1,    -1,   412,    -1,    -1,    -1,    -1,    -1,   418,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   479,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,    -1,    -1,   503,   504,
     116,   117,   118,   119,   120,   121,    -1,    -1,    -1,   479,
      -1,    -1,    -1,    -1,    -1,    -1,   132,   522,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   530,   531,    -1,    -1,    -1,
     535,    -1,    -1,   503,   504,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,   522,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     530,   531,    -1,    -1,    -1,   535,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,
      -1,   616,    71,    72,    73,    -1,    75,    -1,    77,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,   616,    -1,    -1,    -1,
     109,    -1,   111,    -1,    -1,    -1,    -1,   116,   117,   118,
     119,   120,   121,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,    77,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,   111,    -1,    -1,    -1,    -1,   116,   117,
     118,   119,   120,   121,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   131,   132,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,
      77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
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
      -1,    -1,    -1,   109,    -1,   111,    -1,    -1,    -1,    -1,
     116,   117,   118,   119,   120,   121,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   131,   132,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    -1,    -1,
      -1,   116,   117,   118,   119,   120,   121,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   131,   132,   133,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    -1,
      -1,    -1,   116,   117,   118,   119,   120,   121,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,
      -1,    -1,    -1,   116,   117,   118,   119,   120,   121,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   131,   132,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,     1,   111,
       3,     4,     5,    -1,   116,   117,   118,   119,   120,   121,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
     132,   133,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,     1,   111,     3,
       4,     5,    -1,    -1,   117,    -1,    -1,   120,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,
     133,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,     1,   111,     3,     4,
       5,    -1,    -1,   117,    -1,    -1,   120,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,   133,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,     1,   111,     3,     4,     5,
      -1,    -1,   117,    -1,    -1,   120,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,     1,   111,     3,     4,     5,    -1,
      -1,   117,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,   133,    -1,    -1,
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
      49,    50,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    28,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,   111,    -1,    -1,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,   131,    -1,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,   111,    -1,    -1,    -1,    -1,   116,
     117,   118,   119,   120,   121,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,   132,   133,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,   111,    -1,    28,    -1,    -1,
     116,   117,   118,   119,   120,   121,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,   132,    -1,    -1,    -1,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
     111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,
     121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,    -1,    -1,    -1,    -1,   116,   117,
     118,   119,   120,   121,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,   132,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    -1,    -1,
      -1,   116,   117,   118,   119,   120,   121,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,     1,   111,     3,
       4,     5,    -1,   116,   117,   118,   119,   120,   121,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   132,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    28,    -1,    -1,    -1,
      -1,    85,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,   111,    -1,    28,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    71,    72,    73,    -1,    -1,   109,   110,   111,
      28,    -1,    -1,    -1,   116,   117,   118,   119,   120,   121,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,    -1,    -1,    -1,    -1,   116,   117,   118,
     119,   120,   121,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,     3,
      -1,   109,    -1,   111,    -1,    -1,    -1,    -1,   116,   117,
     118,   119,   120,   121,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      28,    85,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,   109,    -1,    -1,   112,    -1,
      -1,    -1,    -1,   117,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,   132,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,   102,   103,    -1,    71,    72,    73,
      74,   109,   110,   111,    -1,    79,    -1,    66,   116,   117,
     118,   119,   120,   121,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,    -1,    -1,
      -1,   100,   116,   117,   118,   119,   120,   121,     3,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     129,    -1,   131,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,   100,     3,     4,     5,     6,
      -1,     8,     9,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   117,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,   131,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,    -1,    -1,    -1,    -1,   116,
     117,   118,   119,   120,   121,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,    -1,    -1,    -1,    -1,
     116,   117,   118,   119,   120,   121,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      75,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      85,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,    -1,    28,    -1,
      -1,   116,   117,   118,   119,   120,   121,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    71,    72,    73,    -1,   109,    -1,   111,    -1,   113,
      28,    -1,   116,   117,   118,   119,   120,   121,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,   111,    -1,   113,    -1,    28,   116,   117,   118,   119,
     120,   121,    -1,    71,    72,    73,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    28,    -1,    71,    72,
      73,   109,    -1,   111,    -1,   113,    -1,    -1,   116,   117,
     118,   119,   120,   121,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,    71,
      72,    73,    -1,   116,   117,   118,   119,   120,   121,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    28,   109,   110,   111,
      -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,   121,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    71,
      72,    73,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    28,    -1,    -1,    -1,    -1,   109,    -1,   111,
      71,    72,    73,    -1,   116,   117,   118,   119,   120,   121,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    71,    72,    73,   109,    -1,
     111,    -1,    -1,    -1,    -1,   116,   117,   118,   119,   120,
     121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,   111,    -1,    -1,    -1,    -1,
     116,   117,   118,   119,   120,   121,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,   110,    -1,
     112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,   110,    -1,   112,    -1,    -1,    -1,    -1,   117,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,    -1,    -1,   117,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,    -1,    -1,   117,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,   110,    -1,    -1,    -1,    -1,    -1,    -1,   117,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,    -1,    -1,   117,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    28,    -1,    -1,
      79,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    66,    -1,    -1,   117,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,
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
      72,    73,   102,   103,   109,   111,   116,   117,   118,   119,
     120,   121,   135,   136,   137,   139,   142,   143,   145,   146,
     147,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     157,   158,   173,   174,   224,   238,   109,   137,   140,   142,
     144,   109,   143,   143,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    66,    75,    85,   100,
     164,   169,   172,   173,   175,   177,   178,   179,   187,   188,
     143,   157,   161,   164,   161,   110,   158,   160,   163,   172,
     173,   175,   177,   188,   207,     5,   222,   132,     7,     8,
       9,   109,   112,   114,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   130,   159,   146,   117,   122,   123,
     118,   119,    10,    11,    12,    13,   124,   125,    14,    15,
     116,   126,   127,    16,    17,   128,   132,     0,   143,   207,
       7,     8,     9,   109,   112,   114,   132,   135,   174,   109,
      74,    79,   109,   112,   117,   169,   170,   171,   172,   175,
     177,   188,   192,   194,   202,   132,   135,   174,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    46,    47,
      66,   100,   166,   169,   172,   174,   176,   177,   178,   187,
     188,   112,   194,   166,   110,   115,   109,   112,   170,   172,
     175,   177,   188,   191,   193,   202,   110,   131,   132,   133,
     138,   139,   157,   164,   209,   225,   231,   232,   233,   234,
     235,   236,   237,   135,   110,   138,   141,   158,   160,   135,
     138,   158,   146,   146,   146,   147,   147,   148,   148,   149,
     149,   149,   149,   150,   150,   151,   152,   153,   154,   155,
     160,   133,   237,   110,   110,   135,   110,   141,   160,   135,
     135,   189,   190,   132,   132,   173,   110,   164,   194,   203,
     204,   205,   161,   172,   201,   202,   192,   202,   109,   112,
     192,    68,    78,   109,   120,   131,   133,   135,   139,   164,
     170,   180,   181,   182,   183,   184,   196,   197,   199,   200,
     202,   223,   224,   226,   227,   228,   229,   230,   132,   132,
     109,   112,   169,   172,   176,   177,   188,   194,   161,   112,
     112,   194,   158,   110,   193,   203,   113,   161,   173,   191,
     202,   109,   112,   191,   146,   133,   237,   130,   109,   135,
     197,   132,   216,   217,   115,   131,   131,   232,   234,   235,
     133,   110,   115,   113,   129,   133,   110,   113,   130,   115,
     133,   189,   189,   110,   109,   170,   193,   195,   196,   198,
     200,   202,   110,   110,   115,   113,   172,   202,   192,   110,
     203,   161,    50,   165,   169,   172,   173,   175,   179,   164,
     197,   109,   117,   170,   195,   202,   164,   130,   109,   129,
     131,   135,   170,   185,   186,   195,   197,   200,   202,   200,
     202,   133,   184,   115,   131,   109,   112,   110,   135,   203,
     206,   170,   200,   131,   131,   217,   217,   217,   131,   217,
     133,   180,   180,   173,   161,   112,   113,   161,   161,   112,
     110,   110,   113,   113,   191,   110,   203,   113,   161,   173,
     133,   209,   133,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    77,   131,   135,   160,   162,   164,
     211,   212,   213,   214,   215,   217,   218,   219,   220,   221,
     223,   233,   138,   158,   157,   161,   190,   131,   133,   131,
     133,   196,   200,   202,   170,   198,    51,   205,   110,   113,
     135,   174,   132,   135,   169,   172,   173,   175,   193,   135,
     174,   197,   202,   110,   109,   209,   110,   161,   132,   200,
     202,   115,   131,   129,   171,   170,   200,   200,   181,   113,
     161,   173,   110,   110,   115,   200,   133,   133,   110,   113,
     161,   113,   113,   161,   110,   113,   113,   161,   129,   109,
     109,   109,   211,   109,   135,   131,   131,   131,   160,   135,
     129,   131,   131,   167,   168,   195,   162,   214,   162,   211,
     133,   131,   180,   180,   198,    69,    70,   133,   132,   132,
     135,   110,   133,   237,   200,   186,   161,   200,   113,   113,
     135,   113,   113,   129,   211,   160,   160,   110,   160,    56,
     110,   218,   131,   131,   130,   211,   115,   131,   130,   133,
     133,   217,   217,    69,    70,   133,    69,    70,   133,   132,
     133,   129,   211,   110,   110,   211,   110,   109,   211,   110,
     218,   161,   168,   132,   158,   208,    70,   133,    69,   133,
     217,   217,   217,   217,    69,    70,   133,   161,   211,   211,
     211,   160,   211,   110,   160,   131,   208,   210,   217,   217,
      70,   133,    69,   133,    70,   133,    69,   133,   217,   217,
      64,   110,   211,   110,   115,   133,   133,   133,   217,   217,
     217,   217,    70,   133,    69,   133,   211,   131,   211,   133,
     208,   133,   133,   133,   133,   217,   217,   133,   133
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
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:
#line 174 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 11:
#line 176 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 12:
#line 177 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:
#line 178 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:
#line 179 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:
#line 180 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:
#line 181 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:
#line 182 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:
#line 183 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:
#line 184 "expression.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 20:
#line 188 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:
#line 193 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:
#line 194 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:
#line 195 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:
#line 196 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:
#line 197 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:
#line 198 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:
#line 199 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:
#line 205 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:
#line 206 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:
#line 207 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:
#line 208 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:
#line 209 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:
#line 210 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:
#line 211 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:
#line 215 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 38:
#line 216 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 39:
#line 217 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 40:
#line 218 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  ;}
    break;

  case 41:
#line 222 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:
#line 223 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:
#line 224 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:
#line 225 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:
#line 226 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:
#line 227 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:
#line 241 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 52:
#line 242 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 53:
#line 243 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 54:
#line 244 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 55:
#line 245 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 56:
#line 246 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 57:
#line 247 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 59:
#line 252 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:
#line 257 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:
#line 258 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:
#line 259 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:
#line 264 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:
#line 265 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 68:
#line 270 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:
#line 271 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:
#line 276 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:
#line 277 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:
#line 278 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:
#line 279 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:
#line 284 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:
#line 285 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:
#line 290 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:
#line 295 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:
#line 300 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:
#line 305 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:
#line 310 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:
#line 315 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:
#line 320 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:
#line 322 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:
#line 327 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 94:
#line 328 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 95:
#line 329 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 96:
#line 330 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 97:
#line 331 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 98:
#line 332 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 99:
#line 333 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 100:
#line 334 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 101:
#line 335 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 102:
#line 336 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 103:
#line 337 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 104:
#line 341 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); ;}
    break;

  case 105:
#line 342 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); ;}
    break;

  case 107:
#line 350 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 108:
#line 351 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 109:
#line 352 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 110:
#line 353 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 111:
#line 357 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 112:
#line 358 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 113:
#line 359 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 114:
#line 360 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 115:
#line 361 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 116:
#line 362 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 117:
#line 363 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 118:
#line 364 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 119:
#line 368 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 120:
#line 369 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 121:
#line 370 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 122:
#line 371 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 123:
#line 372 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 124:
#line 373 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 125:
#line 374 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 126:
#line 375 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 127:
#line 376 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 128:
#line 377 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 129:
#line 391 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 130:
#line 392 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 131:
#line 393 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 132:
#line 394 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 133:
#line 395 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 134:
#line 396 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 135:
#line 397 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 136:
#line 398 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 137:
#line 402 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 138:
#line 403 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 139:
#line 404 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 140:
#line 405 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 141:
#line 406 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 142:
#line 407 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 143:
#line 408 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 144:
#line 409 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 145:
#line 410 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 146:
#line 411 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); ;}
    break;

  case 147:
#line 415 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 148:
#line 416 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); ;}
    break;

  case 149:
#line 420 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 150:
#line 421 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 151:
#line 425 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 152:
#line 426 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 153:
#line 427 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 154:
#line 428 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 155:
#line 429 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 156:
#line 433 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 158:
#line 438 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 159:
#line 443 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 160:
#line 444 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 161:
#line 445 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 162:
#line 449 "expression.y"
    { (yyval.specifier) = (yyvsp[0].specifier); ;}
    break;

  case 163:
#line 474 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 164:
#line 478 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 165:
#line 479 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 166:
#line 480 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 167:
#line 481 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 168:
#line 482 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 169:
#line 483 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 170:
#line 484 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 171:
#line 485 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 172:
#line 486 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 173:
#line 487 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 174:
#line 488 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 175:
#line 489 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 176:
#line 490 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 180:
#line 494 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 181:
#line 495 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 182:
#line 499 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 183:
#line 500 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 184:
#line 501 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 185:
#line 502 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 186:
#line 503 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 187:
#line 504 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 188:
#line 505 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 189:
#line 506 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 190:
#line 507 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 191:
#line 508 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 192:
#line 509 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 193:
#line 510 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 197:
#line 514 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); ;}
    break;

  case 198:
#line 515 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 199:
#line 520 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 200:
#line 521 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); ;}
    break;

  case 201:
#line 522 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-2].id).string); ;}
    break;

  case 202:
#line 523 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); ;}
    break;

  case 203:
#line 525 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 204:
#line 529 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 205:
#line 531 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 206:
#line 569 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 207:
#line 570 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 208:
#line 574 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); ;}
    break;

  case 209:
#line 575 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); ;}
    break;

  case 210:
#line 579 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; ;}
    break;

  case 211:
#line 583 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 212:
#line 584 "expression.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 213:
#line 589 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 214:
#line 591 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 215:
#line 593 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 216:
#line 595 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 217:
#line 597 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 218:
#line 600 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 219:
#line 602 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 220:
#line 604 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 221:
#line 606 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 222:
#line 608 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 223:
#line 611 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 224:
#line 613 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 225:
#line 615 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 226:
#line 617 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 227:
#line 619 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 228:
#line 622 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 229:
#line 624 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 230:
#line 626 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 231:
#line 628 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 232:
#line 630 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 233:
#line 634 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 234:
#line 635 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 235:
#line 636 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 236:
#line 637 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 237:
#line 638 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 238:
#line 639 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 239:
#line 640 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 240:
#line 641 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 241:
#line 646 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); ;}
    break;

  case 242:
#line 648 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); ;}
    break;

  case 243:
#line 653 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 244:
#line 655 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 245:
#line 657 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 246:
#line 659 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 247:
#line 661 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 248:
#line 665 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass(0, (yyvsp[0].id).string); ;}
    break;

  case 249:
#line 666 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); ;}
    break;

  case 250:
#line 671 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); ;}
    break;

  case 251:
#line 672 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].id).string); ;}
    break;

  case 252:
#line 673 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].id).string); ;}
    break;

  case 253:
#line 674 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); ;}
    break;

  case 254:
#line 675 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); ;}
    break;

  case 255:
#line 692 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); ;}
    break;

  case 256:
#line 694 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); ;}
    break;

  case 257:
#line 699 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null); ;}
    break;

  case 258:
#line 701 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp)); ;}
    break;

  case 259:
#line 707 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 260:
#line 709 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 261:
#line 711 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); ;}
    break;

  case 262:
#line 713 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); ;}
    break;

  case 263:
#line 715 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 264:
#line 717 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 265:
#line 719 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 266:
#line 721 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 267:
#line 723 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 268:
#line 725 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 269:
#line 727 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 270:
#line 732 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 271:
#line 734 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 272:
#line 736 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); ;}
    break;

  case 273:
#line 738 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); ;}
    break;

  case 274:
#line 740 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); ;}
    break;

  case 275:
#line 744 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 277:
#line 746 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 278:
#line 747 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 279:
#line 748 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 280:
#line 749 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 281:
#line 753 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); ;}
    break;

  case 283:
#line 755 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 284:
#line 756 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), MkDeclaratorPointer((yyvsp[0].pointer), null)); ;}
    break;

  case 285:
#line 757 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 286:
#line 758 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 288:
#line 806 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 289:
#line 808 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 290:
#line 814 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); ;}
    break;

  case 291:
#line 816 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); ;}
    break;

  case 292:
#line 818 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); ;}
    break;

  case 293:
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); ;}
    break;

  case 294:
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); ;}
    break;

  case 296:
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); ;}
    break;

  case 297:
#line 831 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 298:
#line 833 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].string), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); ;}
    break;

  case 299:
#line 835 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator))); ;}
    break;

  case 302:
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 303:
#line 845 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].string), (yyvsp[0].declarator)); ;}
    break;

  case 305:
#line 854 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 306:
#line 856 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); ;}
    break;

  case 307:
#line 858 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); ;}
    break;

  case 308:
#line 862 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); ;}
    break;

  case 309:
#line 863 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  ;}
    break;

  case 310:
#line 867 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 311:
#line 868 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); ;}
    break;

  case 312:
#line 869 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); ;}
    break;

  case 313:
#line 870 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); ;}
    break;

  case 315:
#line 875 "expression.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, null)); ;}
    break;

  case 316:
#line 879 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); ;}
    break;

  case 317:
#line 880 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); ;}
    break;

  case 318:
#line 884 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 319:
#line 885 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 320:
#line 886 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 321:
#line 890 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 322:
#line 891 "expression.y"
    { ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); ;}
    break;

  case 323:
#line 895 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); ;}
    break;

  case 324:
#line 896 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); ;}
    break;

  case 325:
#line 906 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 326:
#line 908 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 327:
#line 910 "expression.y"
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

  case 328:
#line 925 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 329:
#line 927 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 330:
#line 948 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); ;}
    break;

  case 331:
#line 950 "expression.y"
    { ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); ;}
    break;

  case 338:
#line 964 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 339:
#line 966 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; ;}
    break;

  case 340:
#line 968 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 341:
#line 972 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); ;}
    break;

  case 342:
#line 973 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); ;}
    break;

  case 343:
#line 977 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); ;}
    break;

  case 344:
#line 978 "expression.y"
    { ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); ;}
    break;

  case 345:
#line 981 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); ;}
    break;

  case 346:
#line 985 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); ;}
    break;

  case 347:
#line 986 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); ;}
    break;

  case 348:
#line 987 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); ;}
    break;

  case 349:
#line 991 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 350:
#line 996 "expression.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 351:
#line 1004 "expression.y"
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 352:
#line 1008 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 353:
#line 1009 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 354:
#line 1013 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 355:
#line 1014 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 356:
#line 1015 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 357:
#line 1019 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 358:
#line 1020 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 359:
#line 1021 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 360:
#line 1022 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 361:
#line 1024 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 362:
#line 1025 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 363:
#line 1026 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 364:
#line 1030 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 365:
#line 1031 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 366:
#line 1032 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 367:
#line 1033 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); ;}
    break;

  case 368:
#line 1034 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 369:
#line 1043 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 370:
#line 1084 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 371:
#line 1086 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 372:
#line 1091 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 373:
#line 1093 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 374:
#line 1095 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); ;}
    break;

  case 375:
#line 1097 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); ;}
    break;

  case 376:
#line 1102 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; ;}
    break;

  case 377:
#line 1104 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;;}
    break;

  case 378:
#line 1109 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 379:
#line 1111 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 380:
#line 1116 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 381:
#line 1121 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); ;}
    break;

  case 382:
#line 1126 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 383:
#line 1128 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 384:
#line 1133 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 385:
#line 1135 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 386:
#line 1137 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 387:
#line 1139 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 388:
#line 1141 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 389:
#line 1147 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 390:
#line 1152 "expression.y"
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 391:
#line 1161 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;;}
    break;

  case 392:
#line 1162 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 393:
#line 1167 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ;}
    break;

  case 394:
#line 1169 "expression.y"
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); ;}
    break;

  case 395:
#line 1174 "expression.y"
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; ;}
    break;

  case 396:
#line 1178 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); ;}
    break;

  case 397:
#line 1179 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 398:
#line 1180 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 399:
#line 1181 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 400:
#line 1182 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 401:
#line 1183 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  ;}
    break;

  case 403:
#line 1188 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 404:
#line 1189 "expression.y"
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); ;}
    break;

  case 405:
#line 1193 "expression.y"
    { parsedExpression = (yyvsp[0].exp); ;}
    break;


    }

/* Line 1037 of yacc.c.  */
#line 5004 "expression.ec"

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


#line 1195 "expression.y"



