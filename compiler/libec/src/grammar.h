/* A Bison parser, made by GNU Bison 2.7.91-dirty.  */

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
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
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
    LONG = 296,
    SIGNED = 297,
    UNSIGNED = 298,
    FLOAT = 299,
    DOUBLE = 300,
    CONST = 301,
    VOLATILE = 302,
    VOID = 303,
    VALIST = 304,
    STRUCT = 305,
    UNION = 306,
    ENUM = 307,
    ELLIPSIS = 308,
    CASE = 309,
    DEFAULT = 310,
    IF = 311,
    SWITCH = 312,
    WHILE = 313,
    DO = 314,
    FOR = 315,
    GOTO = 316,
    CONTINUE = 317,
    BREAK = 318,
    RETURN = 319,
    IFX = 320,
    ELSE = 321,
    CLASS = 322,
    THISCLASS = 323,
    PROPERTY = 324,
    SETPROP = 325,
    GETPROP = 326,
    NEWOP = 327,
    RENEW = 328,
    DELETE = 329,
    EXT_DECL = 330,
    EXT_STORAGE = 331,
    IMPORT = 332,
    DEFINE = 333,
    VIRTUAL = 334,
    ATTRIB = 335,
    PUBLIC = 336,
    PRIVATE = 337,
    TYPED_OBJECT = 338,
    ANY_OBJECT = 339,
    _INCREF = 340,
    EXTENSION = 341,
    ASM = 342,
    TYPEOF = 343,
    WATCH = 344,
    STOPWATCHING = 345,
    FIREWATCHERS = 346,
    WATCHABLE = 347,
    CLASS_DESIGNER = 348,
    CLASS_NO_EXPANSION = 349,
    CLASS_FIXED = 350,
    ISPROPSET = 351,
    CLASS_DEFAULT_PROPERTY = 352,
    PROPERTY_CATEGORY = 353,
    CLASS_DATA = 354,
    CLASS_PROPERTY = 355,
    SUBCLASS = 356,
    NAMESPACE = 357,
    NEW0OP = 358,
    RENEW0 = 359,
    VAARG = 360,
    DBTABLE = 361,
    DBFIELD = 362,
    DBINDEX = 363,
    DATABASE_OPEN = 364,
    ALIGNOF = 365,
    ATTRIB_DEP = 366,
    __ATTRIB = 367,
    BOOL = 368,
    _BOOL = 369,
    _COMPLEX = 370,
    _IMAGINARY = 371,
    RESTRICT = 372,
    THREAD = 373,
    WIDE_STRING_LITERAL = 374,
    BUILTIN_OFFSETOF = 375,
    PRAGMA = 376,
    STATIC_ASSERT = 377
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
#line 39 "grammar.y" /* yacc.c:1926  */

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

#line 220 "grammar.h" /* yacc.c:1926  */
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_GRAMMAR_H_INCLUDED  */
