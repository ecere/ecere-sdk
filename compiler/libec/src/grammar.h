/* A Bison parser, made by GNU Bison 2.7.12-4996.  */

/* Bison interface for Yacc-like parsers in C
   
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

#ifndef YY_YY_GRAMMAR_H_INCLUDED
# define YY_YY_GRAMMAR_H_INCLUDED
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
     LONG = 297,
     SIGNED = 298,
     UNSIGNED = 299,
     FLOAT = 300,
     DOUBLE = 301,
     CONST = 302,
     VOLATILE = 303,
     VOID = 304,
     VALIST = 305,
     STRUCT = 306,
     UNION = 307,
     ENUM = 308,
     ELLIPSIS = 309,
     CASE = 310,
     DEFAULT = 311,
     IF = 312,
     SWITCH = 313,
     WHILE = 314,
     DO = 315,
     FOR = 316,
     GOTO = 317,
     CONTINUE = 318,
     BREAK = 319,
     RETURN = 320,
     IFX = 321,
     ELSE = 322,
     CLASS = 323,
     THISCLASS = 324,
     PROPERTY = 325,
     SETPROP = 326,
     GETPROP = 327,
     NEWOP = 328,
     RENEW = 329,
     DELETE = 330,
     EXT_DECL = 331,
     EXT_STORAGE = 332,
     IMPORT = 333,
     DEFINE = 334,
     VIRTUAL = 335,
     ATTRIB = 336,
     PUBLIC = 337,
     PRIVATE = 338,
     TYPED_OBJECT = 339,
     ANY_OBJECT = 340,
     _INCREF = 341,
     EXTENSION = 342,
     ASM = 343,
     TYPEOF = 344,
     WATCH = 345,
     STOPWATCHING = 346,
     FIREWATCHERS = 347,
     WATCHABLE = 348,
     CLASS_DESIGNER = 349,
     CLASS_NO_EXPANSION = 350,
     CLASS_FIXED = 351,
     ISPROPSET = 352,
     CLASS_DEFAULT_PROPERTY = 353,
     PROPERTY_CATEGORY = 354,
     CLASS_DATA = 355,
     CLASS_PROPERTY = 356,
     SUBCLASS = 357,
     NAMESPACE = 358,
     NEW0OP = 359,
     RENEW0 = 360,
     VAARG = 361,
     DBTABLE = 362,
     DBFIELD = 363,
     DBINDEX = 364,
     DATABASE_OPEN = 365,
     ALIGNOF = 366,
     ATTRIB_DEP = 367,
     __ATTRIB = 368,
     BOOL = 369,
     _BOOL = 370,
     _COMPLEX = 371,
     _IMAGINARY = 372,
     RESTRICT = 373,
     THREAD = 374,
     WIDE_STRING_LITERAL = 375,
     BUILTIN_OFFSETOF = 376,
     PRAGMA = 377,
     STATIC_ASSERT = 378
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2053 of yacc.c  */
#line 39 "grammar.y"

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
   PropertyWatch propertyWatch;
   TemplateParameter templateParameter;
   TemplateArgument templateArgument;
   TemplateDatatype templateDatatype;

   DBTableEntry dbtableEntry;
   DBIndexItem dbindexItem;
   DBTableDef dbtableDef;


/* Line 2053 of yacc.c  */
#line 224 "grammar.h"
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

#endif /* !YY_YY_GRAMMAR_H_INCLUDED  */
