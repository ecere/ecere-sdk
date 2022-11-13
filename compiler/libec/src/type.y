%{

import "ecdefs"

#define YYSIZE_T size_t
#define YYLTYPE Location
#include "grammar.h"

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

%}

%debug
%union
{
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
   TemplateParameter templateParameter;
   TemplateArgument templateArgument;
   TemplateDatatype templateDatatype;
}

// *** Types ***

%type <specifierType> struct_or_union
%type <i>   unary_operator assignment_operator
%type <id>  identifier
%type <exp> primary_expression postfix_expression unary_expression cast_expression
            multiplicative_expression additive_expression shift_expression
            relational_expression relational_expression_smaller_than equality_expression and_expression
            exclusive_or_expression inclusive_or_expression logical_and_expression
            logical_or_expression conditional_expression assignment_expression
            constant_expression
            common_unary_expression simple_primary_expression
            anon_instantiation_expression

//simple_postfix_expression simple_unary_expression

%type <list> argument_expression_list expression enumerator_list
             struct_declarator_list struct_declaration_list
             declaration_specifiers identifier_list initializer_list init_declarator_list
             parameter_list parameter_type_list declaration_list statement_list
             members_initialization_list members_initialization_list_coloned data_member_initialization_list data_member_initialization_list_coloned
             guess_declaration_specifiers real_guess_declaration_specifiers
             specifier_qualifier_list guess_specifier_qualifier_list
             type_qualifier_list property_specifiers
             renew_specifiers
             default_property_list
             template_arguments_list attribs_list multi_attrib


%type <specifier> storage_class_specifier enum_specifier_compound enum_specifier_nocompound type_qualifier type_specifier strict_type_specifier
                  struct_or_union_specifier_compound struct_or_union_specifier_nocompound guess_type type strict_type
                  real_guess_type ext_storage base_strict_type
%type <enumerator> enumerator
%type <declarator> declarator direct_declarator direct_abstract_declarator abstract_declarator
                   struct_declarator direct_declarator_function direct_declarator_function_start declarator_function direct_declarator_nofunction
                   direct_abstract_declarator_noarray abstract_declarator_noarray declarator_nofunction

%type <pointer> pointer
%type <initializer> initializer initializer_condition
%type <initDeclarator> init_declarator
%type <typeName> type_name guess_type_name parameter_declaration
%type <stmt> statement labeled_statement compound_statement expression_statement
             selection_statement iteration_statement jump_statement compound_inside

%type <declaration> declaration
%type <classDef> struct_declaration
%type <string> string_literal attribute_word
%type <extDecl> ext_decl
%type <attrib> attrib
%type <attribute> attribute

%type <instance> instantiation_named instantiation_unnamed guess_instantiation_named instantiation_anon
/* %type <membersInit>  members_initialization */
%type <memberInit> data_member_initialization default_property
%type <classFunction> class_function_definition class_function_definition_start
                     virtual_class_function_definition_start
                     constructor_function_definition_start destructor_function_definition_start
%type <classFunction> instance_class_function_definition instance_class_function_definition_start
%type <prop> property

%type <templateArgument> template_argument template_type_argument template_expression_argument
%type <templateDatatype> template_datatype

%type <context> compound_start

%token IDENTIFIER CONSTANT STRING_LITERAL SIZEOF
%token PTR_OP INC_OP DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP
%token AND_OP OR_OP MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN
%token SUB_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN AND_ASSIGN
%token XOR_ASSIGN OR_ASSIGN TYPE_NAME

%token TYPEDEF EXTERN STATIC AUTO REGISTER
%token CHAR SHORT INT UINT INT64 INT128 FLOAT128 FLOAT16 LONG SIGNED UNSIGNED FLOAT DOUBLE CONST VOLATILE VOID VALIST
%token STRUCT UNION ENUM ELLIPSIS

%token CASE DEFAULT IF SWITCH WHILE DO FOR GOTO CONTINUE BREAK RETURN

%nonassoc IFX
%nonassoc ELSE
%token CLASS THISCLASS
%token PROPERTY SETPROP GETPROP NEWOP RENEW DELETE EXT_DECL EXT_STORAGE IMPORT DEFINE VIRTUAL ATTRIB
%token PUBLIC PRIVATE
%token TYPED_OBJECT ANY_OBJECT _INCREF EXTENSION ASM TYPEOF
%token WATCH STOPWATCHING FIREWATCHERS WATCHABLE CLASS_DESIGNER CLASS_NO_EXPANSION CLASS_FIXED ISPROPSET
%token CLASS_DEFAULT_PROPERTY PROPERTY_CATEGORY CLASS_DATA CLASS_PROPERTY SUBCLASS NAMESPACE
%token NEW0OP RENEW0 VAARG
%token DBTABLE DBFIELD DBINDEX DATABASE_OPEN
%token ALIGNOF ATTRIB_DEP __ATTRIB
%token BOOL _BOOL _COMPLEX _IMAGINARY RESTRICT THREAD
%token WIDE_STRING_LITERAL
%token BUILTIN_OFFSETOF
%token PRAGMA
%token STATIC_ASSERT

%destructor { FreeIdentifier($$); } identifier
%destructor { FreePointer($$); } pointer
%destructor { FreeExpression($$); } primary_expression postfix_expression unary_expression cast_expression
                                    multiplicative_expression additive_expression shift_expression
                                    relational_expression equality_expression and_expression
                                    exclusive_or_expression inclusive_or_expression logical_and_expression
                                    logical_or_expression conditional_expression assignment_expression
                                    constant_expression
%destructor { FreeSpecifier($$); }  storage_class_specifier enum_specifier_compound enum_specifier_nocompound type_qualifier type_specifier
                                    struct_or_union_specifier_compound struct_or_union_specifier_nocompound ext_storage type strict_type guess_type strict_type_specifier
                                    base_strict_type
%destructor { FreeEnumerator($$); } enumerator
%destructor { FreeDeclarator($$); } declarator direct_declarator direct_abstract_declarator abstract_declarator
                                    direct_abstract_declarator_noarray abstract_declarator_noarray
                                    struct_declarator direct_declarator_function direct_declarator_function_start declarator_function direct_declarator_nofunction
                                    declarator_nofunction

%destructor { FreeInitializer($$); } initializer initializer_condition
%destructor { FreeInitDeclarator($$); } init_declarator
%destructor { FreeTypeName($$); } type_name guess_type_name parameter_declaration
%destructor { FreeStatement($$); }  statement labeled_statement compound_statement expression_statement
                                    selection_statement iteration_statement jump_statement compound_inside

%destructor { FreeDeclaration($$); } declaration

%destructor { FreeInstance($$); } instantiation_named instantiation_unnamed

%destructor { FreeMemberInit($$); } data_member_initialization default_property

%destructor { FreeClassFunction($$); } class_function_definition class_function_definition_start
                                       virtual_class_function_definition_start
                                       constructor_function_definition_start destructor_function_definition_start
                                       instance_class_function_definition instance_class_function_definition_start
%destructor { FreeClassDef($$); } struct_declaration
%destructor { delete $$; } string_literal attribute_word
%destructor { FreeProperty($$); } property

%destructor { FreeList($$, FreeExpression); }  argument_expression_list expression
%destructor { FreeList($$, FreeEnumerator); }  enumerator_list
%destructor { FreeList($$, FreeSpecifier); }   type_qualifier_list specifier_qualifier_list declaration_specifiers
                                               guess_declaration_specifiers guess_specifier_qualifier_list
%destructor { FreeList($$, FreeDeclarator); }  struct_declarator_list
%destructor { FreeList($$, FreeDeclaration); } declaration_list
%destructor { FreeList($$, FreeInitializer); } initializer_list
%destructor { FreeList($$, FreeInitDeclarator); } init_declarator_list
%destructor { FreeList($$, FreeTypeName); } parameter_list parameter_type_list identifier_list
%destructor { FreeList($$, FreeStatement); } statement_list
%destructor { FreeList($$, FreeClassDef); } struct_declaration_list
%destructor { FreeList($$, FreeMemberInit); } default_property_list data_member_initialization_list data_member_initialization_list_coloned
%destructor { FreeList($$, FreeMembersInit); } members_initialization_list members_initialization_list_coloned
%destructor { PopContext($$); FreeContext($$); delete $$; } compound_start
%destructor { FreeTemplateArgument($$); } template_argument template_type_argument template_expression_argument
%destructor { FreeTemplateDataType($$); } template_datatype
%destructor { FreeAttrib($$); } attrib
%destructor { FreeExtDecl($$); } ext_decl
%destructor { FreeAttribute($$); } attribute
%destructor { FreeList($$, FreeAttribute); }  attribs_list
%destructor { FreeList($$, FreeAttrib); }  multi_attrib

%start type_unit

%%

guess_type:
   identifier '*'
   {
      $$ = null;
      DeclClass($1._class, $1.string);
      fileInput.Seek(@1.start.pos, start);
      resetScannerPos(&@1.start);
      yyclearin;

      FreeIdentifier($1);

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   }
   | identifier '<'
   {
      $$ = null;
   #ifdef PRECOMPILER
      _DeclClass($1._class, $1.string);

      FreeIdentifier($1);

      fileInput.Seek(@1.start.pos, start);
      resetScannerPos(&@1.start);
      yyclearin;

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #endif
   }
   ;

real_guess_type:
   identifier error
   {
      DeclClass($1._class, $1.string);
      fileInput.Seek(@1.start.pos, start);
      parseTypeError = 0;
      resetScannerPos(&@1.start);
      yyclearin;
      FreeIdentifier($1);

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   }
/*   | identifier '<'
   {
   #ifdef PRECOMPILER
      _DeclClass($1._class, $1.string);

      FreeIdentifier($1);

      fileInput.Seek(@1.start.pos, start);
      resetScannerPos(&@1.start);
      yyclearin;

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #endif
   }
   ;
*/
type:
   strict_type       { $$ = $1; }
   | identifier identifier
   {
   #ifdef PRECOMPILER
      DeclClass($1._class, $1.string);
      fileInput.Seek(@1.start.pos, start);
      resetScannerPos(&@1.start);
      yyclearin;

      FreeIdentifier($1);
      FreeIdentifier($2);

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #else
      Location tmpLoc = yylloc; $$ = $2; yylloc = @1;
      Compiler_Error($"Not a type: %s\n", $1.string);
      yylloc = tmpLoc; $2.badID = $1; // FreeIdentifier($1);
   #endif
   }
   ;

base_strict_type:
     TYPE_NAME    { $$ = MkSpecifierName(yytext); }
   ;

strict_type:
     base_strict_type
    | base_strict_type '<' template_arguments_list '>' { $$ = $1; SetClassTemplateArgs($$, $3); $$.loc = @$; }
    | base_strict_type '<' template_arguments_list RIGHT_OP
    {
      $$ = $1;
      SetClassTemplateArgs($$, $3);
      $$.loc = @$;

      @4.end.pos--;
      fileInput.Seek(@4.end.pos, start);
      resetScannerPos(&@4.end);
      yyclearin;
    }

/*  | identifier '<' template_arguments_list '>'
      { $$ = MkSpecifierNameArgs($1.string, $3); $$.loc = @$; FreeIdentifier($1); } */
   ;

class_function_definition_start:
     guess_declaration_specifiers declarator_function
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
   | declarator_function
      { $$ = MkClassFunction(null, null, $1, null); $$.loc = @$; }
   ;

constructor_function_definition_start:
   guess_declaration_specifiers '(' ')'
      { $$ = MkClassFunction(null, null, null, null); $$.isConstructor = true; $$.loc = @$; FreeList /*FreeSpecifier*/($1, FreeSpecifier); }
   ;

destructor_function_definition_start:
   '~' guess_declaration_specifiers '(' ')'
      { $$ = MkClassFunction(null, null, null, null); $$.isDestructor = true; $$.loc = @$; FreeList /*FreeSpecifier*/($2, FreeSpecifier); }
   ;

virtual_class_function_definition_start:
     VIRTUAL guess_declaration_specifiers declarator_function
      { $$ = MkClassFunction($2, null, $3, null); $$.isVirtual = true; $$.loc = @$; }
   | VIRTUAL declarator_function
      { $$ = MkClassFunction(null, null, $2, null); $$.isVirtual = true; $$.loc = @$; }
      ;

identifier:
   IDENTIFIER
      { $$ = MkIdentifier(yytext); $$.loc = @1; }
   ;

primary_expression:
     simple_primary_expression
	| '(' expression ')'
      { $$ = MkExpBrackets($2); $$.loc = @$; }
   ;

simple_primary_expression:
	  identifier
      { $$ = MkExpIdentifier($1); $$.loc = @$; }
   | instantiation_unnamed
      { $$ = MkExpInstance($1); $$.loc = @$; }
	| CONSTANT
      { $$ = MkExpConstant(yytext); $$.loc = @$; }
   | WIDE_STRING_LITERAL { $$ = MkExpWideString(yytext); $$.loc = @$; }
	| string_literal
      { $$ = MkExpString($1); delete $1; $$.loc = @$; }
   | '$' string_literal     { $$ = MkExpIntlString($2, null); delete $2; $$.loc = @$; }
   | '$' string_literal '.' string_literal     { $$ = MkExpIntlString($4, $2); delete $2; delete $4; $$.loc = @$; }
   | '(' ')'
      { Expression exp = MkExpDummy(); exp.loc.start = @1.end; exp.loc.end = @2.start; $$ = MkExpBrackets(MkListOne(exp)); $$.loc = @$; yyerror(); }

   | NEWOP guess_declaration_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpNew(MkTypeName($2,$3), $5); $$.loc = @$; }
   | NEWOP guess_declaration_specifiers '[' constant_expression ']' { $$ = MkExpNew(MkTypeName($2,null), $4); $$.loc = @$; }
   | NEW0OP guess_declaration_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpNew0(MkTypeName($2,$3), $5); $$.loc = @$; }
   | NEW0OP guess_declaration_specifiers '[' constant_expression ']' { $$ = MkExpNew0(MkTypeName($2,null), $4); $$.loc = @$; }
   | RENEW constant_expression renew_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpRenew($2, MkTypeName($3,$4), $6); $$.loc = @$; }
   | RENEW constant_expression renew_specifiers '[' constant_expression ']' { $$ = MkExpRenew($2, MkTypeName($3,null), $5); $$.loc = @$; }
   | RENEW0 constant_expression renew_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpRenew0($2, MkTypeName($3,$4), $6); $$.loc = @$; }
   | RENEW0 constant_expression renew_specifiers '[' constant_expression ']' { $$ = MkExpRenew0($2, MkTypeName($3,null), $5); $$.loc = @$; }
   | error { $$ = MkExpDummy(); }
   ;

postfix_expression:
	  primary_expression
   | postfix_expression '[' expression ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
	| postfix_expression '(' ')'                          { $$ = MkExpCall($1, MkList()); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; }
	| postfix_expression '(' argument_expression_list ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.loc = @$; }
	| postfix_expression '.' identifier                   { $$ = MkExpMember($1, $3); $$.loc = @$; }
   | postfix_expression identifier
   {
      char * constant = $1.type == constantExp ? $1.constant : null;
      int len = constant ? strlen(constant) : 0;
      if(constant && constant[len-1] == '.')
      {
         constant[len-1] = 0;
         $$ = MkExpMember($1, $2);
         $$.loc = @$;
      }
      else
         yyerror();
   }
	| postfix_expression PTR_OP identifier                { $$ = MkExpPointer($1, $3); $$.loc = @$; }
	| postfix_expression INC_OP                           { $$ = MkExpOp($1, INC_OP, null); $$.loc = @$; }
	| postfix_expression DEC_OP                           { $$ = MkExpOp($1, DEC_OP, null); $$.loc = @$; }
	;

anon_instantiation_expression:
   instantiation_anon            { $$ = MkExpInstance($1); $$.loc = @$; }
   ;

/*
simple_postfix_expression:
	  simple_primary_expression
   | simple_postfix_expression '[' expression ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
	| simple_postfix_expression '(' ')'                          { $$ = MkExpCall($1, MkList()); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; }
	| simple_postfix_expression '(' argument_expression_list ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.loc = @$; }
	| simple_postfix_expression '.' identifier                   { $$ = MkExpMember($1, $3); $$.loc = @$; }
   | simple_postfix_expression identifier
   {
      char * constant = $1.type == constantExp ? $1.constant : null;
      int len = constant ? strlen(constant) : 0;
      if(constant && constant[len-1] == '.')
      {
         constant[len-1] = 0;
         $$ = MkExpMember($1, $2);
         $$.loc = @$;
      }
      else
         yyerror();
   }
	| simple_postfix_expression PTR_OP identifier                { $$ = MkExpPointer($1, $3); $$.loc = @$; }
	| simple_postfix_expression INC_OP                           { $$ = MkExpOp($1, INC_OP, null); $$.loc = @$; }
	| simple_postfix_expression DEC_OP                           { $$ = MkExpOp($1, DEC_OP, null); $$.loc = @$; }
	;
*/
argument_expression_list:
	  assignment_expression          { $$ = MkList(); ListAdd($$, $1); }
   | anon_instantiation_expression  { $$ = MkList(); ListAdd($$, $1); }
	| argument_expression_list ',' assignment_expression   { $$ = $1; ListAdd($1, $3);  }
   | argument_expression_list ',' anon_instantiation_expression   { $$ = $1; ListAdd($1, $3);  }
	;

common_unary_expression:
	  INC_OP unary_expression           { $$ = MkExpOp(null, INC_OP, $2); $$.loc = @$; }
	| DEC_OP unary_expression           { $$ = MkExpOp(null, DEC_OP, $2); $$.loc = @$; }
	| unary_operator cast_expression    { $$ = MkExpOp(null, $1, $2); $$.loc = @$; }
	//| SIZEOF '(' unary_expression ')'         { $$ = MkExpOp(null, SIZEOF, $3); $$.loc = @$; }
   | SIZEOF unary_expression          { $$ = MkExpOp(null, SIZEOF, $2); $$.loc = @$; }
   | SIZEOF '(' guess_type_name ')'          { $$ = MkExpTypeSize($3); $$.loc = @$; }
	//| ALIGNOF '(' unary_expression ')'         { $$ = MkExpOp(null, ALIGNOF, $3); $$.loc = @$; }
   | ALIGNOF unary_expression          { $$ = MkExpOp(null, ALIGNOF, $2); $$.loc = @$; }
   | ALIGNOF '(' guess_type_name ')'          { $$ = MkExpTypeAlign($3); $$.loc = @$; }
   ;

unary_expression:
       common_unary_expression
	  | postfix_expression
	;
/*
simple_unary_expression:
     common_unary_expression
	| simple_postfix_expression
	;
*/
unary_operator:
	  '&'     { $$ = '&'; }
	| '*'     { $$ = '*'; }
	| '+'     { $$ = '+'; }
	| '-'     { $$ = '-'; }
	| '~'     { $$ = '~'; }
	| '!'     { $$ = '!'; }
   | DELETE  { $$ = DELETE; }
	;

cast_expression:
     unary_expression
	| '(' type_name ')' cast_expression    { $$ = MkExpCast($2, $4); $$.loc = @$; }
	;

multiplicative_expression:
	  cast_expression
	| multiplicative_expression '*' cast_expression { $$ = MkExpOp($1, '*', $3); $$.loc = @$; }
	| multiplicative_expression '/' cast_expression { $$ = MkExpOp($1, '/', $3); $$.loc = @$; }
	| multiplicative_expression '%' cast_expression { $$ = MkExpOp($1, '%', $3); $$.loc = @$; }
	;

additive_expression:
	  multiplicative_expression
	| additive_expression '+' multiplicative_expression  { $$ = MkExpOp($1, '+', $3); $$.loc = @$; }
	| additive_expression '-' multiplicative_expression  { $$ = MkExpOp($1, '-', $3); $$.loc = @$; }
	;

shift_expression:
	  additive_expression
	| shift_expression LEFT_OP additive_expression  { $$ = MkExpOp($1, LEFT_OP, $3); $$.loc = @$; }
	| shift_expression RIGHT_OP additive_expression { $$ = MkExpOp($1, RIGHT_OP, $3); $$.loc = @$; }
	;

relational_expression_smaller_than:
   relational_expression '<'
   {
      $$ = $1;
      skipErrors = true;
   }
   ;

relational_expression:
	  shift_expression
	| relational_expression_smaller_than /*relational_expression '<' */ shift_expression    { skipErrors = false; $$ = MkExpOp($1, '<', $2/*$3*/); $$.loc = @$; }
	| relational_expression '>' shift_expression    { $$ = MkExpOp($1, '>', $3); $$.loc = @$; }
	| relational_expression LE_OP shift_expression  { $$ = MkExpOp($1, LE_OP, $3); $$.loc = @$; }
	| relational_expression GE_OP shift_expression  { $$ = MkExpOp($1, GE_OP, $3); $$.loc = @$; }
	;

equality_expression:
	  relational_expression
	| equality_expression EQ_OP relational_expression  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	| equality_expression NE_OP relational_expression  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
	;

and_expression:
	  equality_expression
	| and_expression '&' equality_expression  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
	;

exclusive_or_expression:
	  and_expression
	| exclusive_or_expression '^' and_expression { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
	;

inclusive_or_expression:
	  exclusive_or_expression
	| inclusive_or_expression '|' exclusive_or_expression { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
	;

logical_and_expression:
	  inclusive_or_expression
	| logical_and_expression AND_OP inclusive_or_expression  { $$ = MkExpOp($1, AND_OP, $3); $$.loc = @$; }
	;

logical_or_expression:
	  logical_and_expression
	| logical_or_expression OR_OP logical_and_expression     { $$ = MkExpOp($1, OR_OP, $3); $$.loc = @$; }
	;

conditional_expression:
	  logical_or_expression
	| logical_or_expression '?' expression ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	;

assignment_expression:
	  conditional_expression
	| unary_expression assignment_operator assignment_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
	| unary_expression assignment_operator anon_instantiation_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   ;

assignment_operator:
	  '='                   { $$ = '='; }
	| MUL_ASSIGN            { $$ = MUL_ASSIGN; }
	| DIV_ASSIGN            { $$ = DIV_ASSIGN; }
	| MOD_ASSIGN            { $$ = MOD_ASSIGN; }
	| ADD_ASSIGN            { $$ = ADD_ASSIGN; }
	| SUB_ASSIGN            { $$ = SUB_ASSIGN; }
	| LEFT_ASSIGN           { $$ = LEFT_ASSIGN; }
	| RIGHT_ASSIGN          { $$ = RIGHT_ASSIGN; }
	| AND_ASSIGN            { $$ = AND_ASSIGN; }
	| XOR_ASSIGN            { $$ = XOR_ASSIGN; }
	| OR_ASSIGN             { $$ = OR_ASSIGN; }
	;

expression:
     assignment_expression                 { $$ = MkList(); ListAdd($$, $1); }
	| expression ',' assignment_expression  { $$ = $1; ListAdd($1, $3); }
	;

constant_expression:
	  conditional_expression
	;

declaration:
	  declaration_specifiers ';'                       { $$ = MkDeclaration($1, null); $$.loc = @$; }
	| declaration_specifiers init_declarator_list ';'  { $$ = MkDeclaration($1, $2); $$.loc = @$; }
   | instantiation_named ';'                          { $$ = MkDeclarationInst($1); $$.loc = @$; }
   | DEFINE identifier '=' constant_expression ';'           { $$ = MkDeclarationDefine($2, $4); $$.loc = @$; }
	;

specifier_qualifier_list:
     type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | specifier_qualifier_list  type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | specifier_qualifier_list  type_specifier            { $$ = $1; ListAdd($1, $2); }
   | enum_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| specifier_qualifier_list enum_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | struct_or_union_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| specifier_qualifier_list struct_or_union_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   ;

guess_specifier_qualifier_list:
     type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | guess_specifier_qualifier_list  type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | guess_specifier_qualifier_list  type_specifier            { $$ = $1; ListAdd($1, $2); }
   | guess_type                                       { $$ = MkList(); ListAdd($$, $1); }
   | guess_specifier_qualifier_list  guess_type            { $$ = $1; ListAdd($1, $2); }
   | enum_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| guess_specifier_qualifier_list enum_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | struct_or_union_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| guess_specifier_qualifier_list struct_or_union_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   ;

declaration_specifiers:
     storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | declaration_specifiers storage_class_specifier    { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | declaration_specifiers  type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | declaration_specifiers  type_specifier            { $$ = $1; ListAdd($1, $2); }
   | enum_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| declaration_specifiers enum_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | struct_or_union_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| declaration_specifiers struct_or_union_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   ;

guess_declaration_specifiers:
     storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | guess_declaration_specifiers storage_class_specifier    { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | guess_declaration_specifiers  type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | guess_declaration_specifiers  type_specifier            { $$ = $1; ListAdd($1, $2); }
   | guess_type                                       { $$ = MkList(); ListAdd($$, $1); }
	| guess_declaration_specifiers guess_type          { $$ = $1; ListAdd($1, $2); }
   | struct_or_union_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| guess_declaration_specifiers struct_or_union_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | enum_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| guess_declaration_specifiers enum_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   ;

real_guess_declaration_specifiers:
       guess_declaration_specifiers                          { $$ = $1; }
     | real_guess_type                                       { $$ = MkList(); ListAdd($$, $1); }
   ;

property_specifiers:
     storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | property_specifiers storage_class_specifier     { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | property_specifiers type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | strict_type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | property_specifiers strict_type_specifier            { $$ = $1; ListAdd($1, $2); }
   | identifier                        { $$ = MkList(); ListAdd($$, MkSpecifierName($1.string)); FreeIdentifier($1); }
   | property_specifiers identifier          { ListAdd($1, MkSpecifierName($2.string)); FreeIdentifier($2); }
   | identifier '<' template_arguments_list '>'
      {
         _DeclClass($1._class, $1.string);

         $$ = MkList();
         ListAdd($$, MkSpecifierNameArgs($1.string, $3));
         FreeIdentifier($1);
      }
   | property_specifiers identifier '<' template_arguments_list '>'
      {
         _DeclClass($2._class, $2.string);
         ListAdd($1, MkSpecifierNameArgs($2.string, $4));
         FreeIdentifier($2);
      }
   ;

renew_specifiers:
     storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | renew_specifiers storage_class_specifier    { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | renew_specifiers type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | strict_type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | renew_specifiers strict_type_specifier            { $$ = $1; ListAdd($1, $2); }
   | struct_or_union_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| renew_specifiers struct_or_union_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | enum_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| renew_specifiers enum_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | identifier                        { $$ = MkList(); ListAdd($$, MkSpecifierName($1.string)); FreeIdentifier($1); }
   | renew_specifiers identifier          { $$ = $1; ListAdd($1, MkSpecifierName($2.string)); FreeIdentifier($2); }
   | identifier '<' template_arguments_list '>'
      {
         _DeclClass($1._class, $1.string);

         $$ = MkList();
         ListAdd($$, MkSpecifierNameArgs($1.string, $3));
         FreeIdentifier($1);
      }
   | renew_specifiers identifier '<' template_arguments_list '>'
      {
         _DeclClass($2._class, $2.string);
         ListAdd($1, MkSpecifierNameArgs($2.string, $4));
         FreeIdentifier($2);
      }
   ;

init_declarator_list:
	  init_declarator                            { $$ = MkList(); ListAdd($$, $1); }
	| init_declarator_list ',' init_declarator   { $$ = $1; ListAdd($1, $3); }
	;

init_declarator:
	  declarator                        { $$ = MkInitDeclarator($1, null); $$.loc = @$; }
	| declarator '=' initializer                 { $$ = MkInitDeclarator($1, $3); $$.loc = @$; $$.initializer.loc.start = @2.end; }
	;

storage_class_specifier:
	  TYPEDEF       { $$ = MkSpecifier(TYPEDEF); }
	| EXTERN        { $$ = MkSpecifier(EXTERN); }
	| STATIC        { $$ = MkSpecifier(STATIC); }
	| AUTO          { $$ = MkSpecifier(AUTO); }
	| REGISTER      { $$ = MkSpecifier(REGISTER); }
   | THREAD        { $$ = MkSpecifier(THREAD); }
	;

ext_decl:
     EXT_DECL { $$ = MkExtDeclString(CopyString(yytext)); }
   | EXT_STORAGE { $$ = MkExtDeclString(CopyString(yytext)); }
   | attrib { $$ = MkExtDeclAttrib($1); }
   | multi_attrib { $$ = MkExtDeclMultiAttrib($1); }
   ;

_attrib:
   ATTRIB      { $<i>$ = ATTRIB; }
 | ATTRIB_DEP  { $<i>$ = ATTRIB_DEP; }
 | __ATTRIB    { $<i>$ = __ATTRIB; }
 ;

multi_attrib:
     attrib                { $$ = MkListOne($1); }
   | multi_attrib attrib   { $$ = $1; ListAdd($1, $2); }

attribute_word:
     IDENTIFIER   { $$  = CopyString(yytext); }
   | TYPE_NAME    { $$  = CopyString(yytext); }
   | EXT_STORAGE  { $$  = CopyString(yytext); }
   | EXT_DECL     { $$  = CopyString(yytext); }
   | CONST        { $$  = CopyString(yytext); }
   ;

attribute:
     attribute_word  { $$ = MkAttribute($1, null); $$.loc = @$; }
   | attribute_word '(' expression ')'  { $$ = MkAttribute($1, MkExpBrackets($3)); $$.loc = @$; }
   ;

attribs_list:
     attribute { $$ = MkListOne($1); }
   | attribs_list attribute { ListAdd($1, $2); $$ = $1; }
   | attribs_list ',' attribute { ListAdd($1, $3); $$ = $1; }
   ;

attrib:
     _attrib '(' '(' attribs_list ')' ')' { $$ = MkAttrib($<i>1, $4); $$.loc = @$; }
   | _attrib '(' '('              ')' ')'  { $$ = MkAttrib($<i>1, null); $$.loc = @$; }
   ;

ext_storage:
   ext_decl   { $$ = MkSpecifierExtended($1); }
   ;

type_qualifier:
	  CONST        { $$ = MkSpecifier(CONST); }
	| VOLATILE     { $$ = MkSpecifier(VOLATILE); }
   | ext_storage  { $$ = $1; }
	;


type_specifier:
	  VOID            { $$ = MkSpecifier(VOID); }
	| CHAR            { $$ = MkSpecifier(CHAR); }
	| SHORT           { $$ = MkSpecifier(SHORT); }
	| INT             { $$ = MkSpecifier(INT); }
   | UINT            { $$ = MkSpecifier(UINT); }
   | INT64           { $$ = MkSpecifier(INT64); }
   | INT128          { $$ = MkSpecifier(INT128); }
   | FLOAT128        { $$ = MkSpecifier(FLOAT128); }
   | FLOAT16        { $$ = MkSpecifier(FLOAT16); }
   | VALIST          { $$ = MkSpecifier(VALIST); }
	| LONG            { $$ = MkSpecifier(LONG); }
	| FLOAT           { $$ = MkSpecifier(FLOAT); }
	| DOUBLE          { $$ = MkSpecifier(DOUBLE); }
	| SIGNED          { $$ = MkSpecifier(SIGNED); }
	| UNSIGNED        { $$ = MkSpecifier(UNSIGNED); }
   | EXTENSION       { $$ = MkSpecifier(EXTENSION); }
   | _BOOL           { $$ = MkSpecifier(_BOOL); }
   | BOOL            { $$ = MkSpecifier(BOOL); }
	| struct_or_union_specifier_nocompound
	| enum_specifier_nocompound
	| type
   | TYPEOF '(' assignment_expression ')' { $$ = MkSpecifierTypeOf($3); }
   | SUBCLASS '(' type ')'                { $$ = MkSpecifierSubClass($3); }
   | SUBCLASS '(' identifier ')'          { _DeclClass($3._class, $3.string); $$ = MkSpecifierSubClass(MkSpecifierName($3.string)); FreeIdentifier($3); }
   | THISCLASS       { $$ = MkSpecifier(THISCLASS); }
   | TYPED_OBJECT    { $$ = MkSpecifier(TYPED_OBJECT); }
   | ANY_OBJECT      { $$ = MkSpecifier(ANY_OBJECT); }
	;

strict_type_specifier:
	  VOID            { $$ = MkSpecifier(VOID); }
	| CHAR            { $$ = MkSpecifier(CHAR); }
	| SHORT           { $$ = MkSpecifier(SHORT); }
	| INT             { $$ = MkSpecifier(INT); }
   | UINT            { $$ = MkSpecifier(UINT); }
   | INT64           { $$ = MkSpecifier(INT64); }
   | INT128          { $$ = MkSpecifier(INT128); }
   | FLOAT128        { $$ = MkSpecifier(FLOAT128); }
   | FLOAT16        { $$ = MkSpecifier(FLOAT16); }
   | VALIST          { $$ = MkSpecifier(VALIST); }
	| LONG            { $$ = MkSpecifier(LONG); }
	| FLOAT           { $$ = MkSpecifier(FLOAT); }
	| DOUBLE          { $$ = MkSpecifier(DOUBLE); }
	| SIGNED          { $$ = MkSpecifier(SIGNED); }
	| UNSIGNED        { $$ = MkSpecifier(UNSIGNED); }
   | EXTENSION       { $$ = MkSpecifier(EXTENSION); }
   | _BOOL           { $$ = MkSpecifier(_BOOL); }
   | BOOL            { $$ = MkSpecifier(BOOL); }
	| struct_or_union_specifier_nocompound
	| enum_specifier_nocompound
	| strict_type
   | TYPEOF '(' assignment_expression ')' { $$ = MkSpecifierTypeOf($3); }
   | SUBCLASS '(' type ')'                { $$ = MkSpecifierSubClass($3); }
   | SUBCLASS '(' identifier ')'          { _DeclClass($3._class, $3.string); $$ = MkSpecifierSubClass(MkSpecifierName($3.string)); FreeIdentifier($3); }
   | THISCLASS       { $$ = MkSpecifier(THISCLASS); }
	;


struct_or_union_specifier_compound:
	  struct_or_union identifier '{' struct_declaration_list '}'   { $$ = MkStructOrUnion($1, $2, $4); if(declMode) DeclClass($2._class, $2.string); }
	| struct_or_union '{' struct_declaration_list '}'              { $$ = MkStructOrUnion($1, null, $3); }
   | struct_or_union identifier '{' '}'   { $$ = MkStructOrUnion($1, $2, null); if(declMode) DeclClass($2._class, $2.string); }
   | struct_or_union '{' '}'              { $$ = MkStructOrUnion($1, null, null); }
	| struct_or_union base_strict_type '{' struct_declaration_list '}'
      { $$ = MkStructOrUnion($1, MkIdentifier($2.name), $4); if(declMode) DeclClass($2.nsSpec, $2.name); FreeSpecifier($2); }

	| struct_or_union ext_decl identifier '{' struct_declaration_list '}'   { $$ = MkStructOrUnion($1, $3, $5); $$.extDeclStruct = $2; if(declMode) DeclClass($3._class, $3.string); }
	| struct_or_union ext_decl '{' struct_declaration_list '}'              { $$ = MkStructOrUnion($1, null, $4); $$.extDeclStruct = $2; }
   | struct_or_union ext_decl identifier '{' '}'   { $$ = MkStructOrUnion($1, $3, null); $$.extDeclStruct = $2; if(declMode) DeclClass($3._class, $3.string); }
   | struct_or_union ext_decl '{' '}'              { $$ = MkStructOrUnion($1, null, null); $$.extDeclStruct = $2; }
	| struct_or_union ext_decl strict_type '{' struct_declaration_list '}'
      { $$ = MkStructOrUnion($1, MkIdentifier($3.name), $5); $$.extDeclStruct = $2; if(declMode) DeclClass($3.nsSpec, $3.name); FreeSpecifier($3); }
	;

struct_or_union_specifier_nocompound:
	  struct_or_union identifier                                   { $$ = MkStructOrUnion($1, $2, null); if(declMode) DeclClass($2._class, $2.string); }
	| struct_or_union strict_type
      { $$ = MkStructOrUnion($1, MkIdentifier($2.name), null); if(declMode) DeclClass($2.nsSpec, $2.name); FreeSpecifier($2); }

	| struct_or_union ext_decl identifier
      { $$ = MkStructOrUnion($1, $3, null); $$.extDeclStruct = $2;if(declMode) DeclClass($3._class, $3.string); }
	| struct_or_union ext_decl strict_type
      { $$ = MkStructOrUnion($1, MkIdentifier($3.name), null); $$.extDeclStruct = $2; if(declMode) DeclClass($3.nsSpec, $3.name); FreeSpecifier($3); }
	;

template_datatype:
     guess_declaration_specifiers { $$ = MkTemplateDatatype($1, null); }
   | guess_declaration_specifiers abstract_declarator { $$ = MkTemplateDatatype($1, $2); }
   /*| identifier { $$ = MkTemplateDatatype(MkListOne(MkSpecifierName($1.string)), null); FreeIdentifier($1); }*/
   ;

template_type_argument:
     guess_declaration_specifiers { $$ = MkTemplateTypeArgument(MkTemplateDatatype($1, null)); }
   | guess_declaration_specifiers abstract_declarator { $$ = MkTemplateTypeArgument(MkTemplateDatatype($1, $2)); }
     //template_datatype { $$ = MkTemplateTypeArgument($1); }
   ;

/*
template_identifier_argument:
     identifier { $$ = MkTemplateIdentifierArgument($1); }
   ;
*/

template_expression_argument:
     shift_expression /*constant_expression*/ { $$ = MkTemplateExpressionArgument($1); }
   ;

template_argument:
     template_expression_argument
   /*| template_identifier_argument*/
   | template_type_argument
   | identifier '=' template_expression_argument   { $$ = $3; $$.name = $1; $$.loc = @$; }
   /*| identifier '=' template_identifier_argument   { $$ = $3; $$.name = $1; $$.loc = @$; }*/
   | identifier '=' template_type_argument         { $$ = $3; $$.name = $1; $$.loc = @$; }
   | template_datatype '=' template_expression_argument
   {
      $$ = $3;
      if($1.specifiers && $1.specifiers->first)
      {
         Specifier spec = $1.specifiers->first;
         if(spec.type == nameSpecifier)
            $$.name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            $$.name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType($1);
      $$.loc = @$;
   }
   /*| template_datatype '=' template_identifier_argument
   {
      $$ = $3;
      if($1.specifiers && $1.specifiers->first)
      {
         Specifier spec = $1.specifiers->first;
         if(spec.type == nameSpecifier)
            $$.name = MkIdentifier(spec.name);
      }
      FreeTemplateDataType($1);
      $$.loc = @$;
   } */
   | template_datatype '=' template_type_argument
   {
      $$ = $3;
      if($1.specifiers && $1.specifiers->first)
      {
         Specifier spec = $1.specifiers->first;
         if(spec.type == nameSpecifier)
            $$.name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            $$.name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType($1);
      $$.loc = @$;
   }
   ;

template_arguments_list:
     template_argument                                { $$ = MkList(); ListAdd($$, $1); }
   | template_arguments_list ',' template_argument    { ListAdd($1, $3); }
   ;

struct_or_union:
	  STRUCT    { $$ = structSpecifier; }
	| UNION     { $$ = unionSpecifier; }
	;

struct_declaration_list:
	  struct_declaration                            { $$ = MkList(); ListAdd($$, $1); }
	| struct_declaration_list struct_declaration    { $$ = $1; ListAdd($1, $2); }
	;

default_property:
     postfix_expression '=' initializer_condition { $$ = MkMemberInitExp($1, $3); $$.loc = @$; $$.realLoc = @$; }
   ;

default_property_list:
     default_property        { $$ = MkList(); ListAdd($$, $1); ((MemberInit)$$->last).loc = @$; }
   | default_property_list ',' default_property      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   ;

property:
   PROPERTY property_specifiers identifier '{' SETPROP compound_statement GETPROP compound_statement '}'
      { $$ = MkProperty($2, null, $3, $6, $8); $$.loc = @$; }
   | PROPERTY property_specifiers identifier '{' GETPROP compound_statement SETPROP compound_statement '}'
      { $$ = MkProperty($2, null, $3, $8, $6); $$.loc = @$; }
   | PROPERTY property_specifiers identifier '{' SETPROP compound_statement '}'
      { $$ = MkProperty($2, null, $3, $6, null); $$.loc = @$; }
   | PROPERTY property_specifiers identifier '{' GETPROP compound_statement '}'
      { $$ = MkProperty($2, null, $3, null, $6); $$.loc = @$; }
   | PROPERTY property_specifiers identifier '{' '}'
      { $$ = MkProperty($2, null, $3, null, null); $$.loc = @$; }

   | PROPERTY property_specifiers abstract_declarator identifier '{' SETPROP compound_statement GETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, $4, $7, $9); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator identifier '{' GETPROP compound_statement SETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, $4, $9, $7); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator identifier '{' SETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, $4, $7, null); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator identifier '{' GETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, $4, null, $7); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator identifier '{' '}'
      { $$ = MkProperty($2, $3, $4, null, null); $$.loc = @$; }

   | PROPERTY property_specifiers '{' SETPROP compound_statement GETPROP compound_statement '}'
      { $$ = MkProperty($2, null, null, $5, $7); $$.loc = @$; }
   | PROPERTY property_specifiers '{' GETPROP compound_statement SETPROP compound_statement '}'
      { $$ = MkProperty($2, null, null, $7, $5); $$.loc = @$; }
   | PROPERTY property_specifiers '{' SETPROP compound_statement '}'
      { $$ = MkProperty($2, null, null, $5, null); $$.loc = @$; }
   | PROPERTY property_specifiers '{' GETPROP compound_statement '}'
      { $$ = MkProperty($2, null, null, null, $5); $$.loc = @$; }
   | PROPERTY property_specifiers '{' '}'
      { $$ = MkProperty($2, null, null, null, null); $$.loc = @$; }

   | PROPERTY property_specifiers abstract_declarator '{' SETPROP compound_statement GETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, null, $6, $8); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator '{' GETPROP compound_statement SETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, null, $8, $6); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator '{' SETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, null, $6, null); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator '{' GETPROP compound_statement '}'
      { $$ = MkProperty($2, $3, null, null, $6); $$.loc = @$; }
   | PROPERTY property_specifiers abstract_declarator '{' '}'
      { $$ = MkProperty($2, $3, null, null, null); $$.loc = @$; }
;

struct_declaration:
	  guess_declaration_specifiers struct_declarator_list ';'         { $$ = MkClassDefDeclaration(MkStructDeclaration($1, $2, null)); $$.decl.loc = @$; $$.loc = @$; }
   | guess_declaration_specifiers ';'                                { $$ = MkClassDefDeclaration(MkStructDeclaration($1, null, null)); $$.decl.loc = @$; $$.loc = @$; }
   | instantiation_unnamed ';'                                       { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = @$; $$.decl.loc = @$; }
   | guess_instantiation_named ';'                                   { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = @$; $$.decl.loc = @$; }
   | class_function_definition                                       { $$ = MkClassDefFunction($1); $$.loc = @$; }
   | default_property_list ';' { $$ = MkClassDefDefaultProperty($1); if($1->last) ((MemberInit)$1->last).loc.end = @2.start; $$.loc = @$; }
   | property { $$ = MkClassDefProperty($1); $$.loc = @$; }
   | ';' { $$ = null; }
	;

struct_declarator_list:
	  struct_declarator
      { $$ = MkList(); ListAdd($$, $1); }
	| struct_declarator_list ',' struct_declarator
      { $$ = $1; ListAdd($1, $3); }
	;

struct_declarator:
	  declarator_nofunction
      { $$ = MkStructDeclarator($1, null); $$.loc = @$; }
	| declarator_nofunction attrib
      { $$ = MkStructDeclarator($1, null); $$.structDecl.attrib = $2; $$.loc = @$; }
	| ':' constant_expression
      { $$ = MkStructDeclarator(null, $2);  $$.loc = @$; }
	| declarator_nofunction ':' constant_expression
      { $$ = MkStructDeclarator($1, $3);  $$.loc = @$; }
   | declarator_nofunction ':' constant_expression ':' constant_expression
      { $$ = MkStructDeclarator($1, $3); $$.structDecl.posExp = $5; $$.loc = @$; }
	;

enum_specifier_nocompound:
     ENUM identifier                            { $$ = MkEnum($2, null); if(declMode) DeclClass($2._class, $2.string); }
   | ENUM strict_type                           { $$ = MkEnum(MkIdentifier($2.name), null); if(declMode) DeclClass($2.nsSpec, $2.name); FreeSpecifier($2); }
   ;

enum_specifier_compound:
	  ENUM '{' enumerator_list '}'
      { $$ = MkEnum(null, $3); }
	| ENUM identifier '{' enumerator_list '}'    { $$ = MkEnum($2, $4); if(declMode) DeclClass($2._class, $2.string); }
   | ENUM identifier '{' enumerator_list ';' struct_declaration_list '}'    { $$ = MkEnum($2, $4); $$.definitions = $6; if(declMode) DeclClass($2._class, $2.string); }
	| ENUM strict_type '{' enumerator_list ';' struct_declaration_list '}'          { $$ = MkEnum(MkIdentifier($2.name), $4); $$.definitions = $6; if(declMode) DeclClass($2.nsSpec, $2.name); FreeSpecifier($2); }
   | ENUM strict_type '{' enumerator_list '}'          { $$ = MkEnum(MkIdentifier($2.name), $4); if(declMode) DeclClass($2.nsSpec, $2.name); FreeSpecifier($2); }
	;

enumerator_list:
	  enumerator
      { $$ = MkList(); ListAdd($$, $1); }
	| enumerator_list ',' enumerator
      { $$ = $1; ListAdd($1, $3); }
	;

enumerator:
	  identifier
      { $$ = MkEnumerator($1, null, null); }
	| identifier '=' constant_expression
      { $$ = MkEnumerator($1, $3, null); }
	| identifier multi_attrib                          { $$ = MkEnumerator($1, null, $2); }
	| identifier multi_attrib '=' constant_expression   { $$ = MkEnumerator($1, $4, $2); }
	;

direct_abstract_declarator:
	  '(' abstract_declarator ')'
                                 { $$ = MkDeclaratorBrackets($2); }
	| '[' ']'
                                 { $$ = MkDeclaratorArray(null, null); }
   | '[' constant_expression ']'
                                 { $$ = MkDeclaratorArray(null, $2); }
   | '[' type ']'
                                 { $$ = MkDeclaratorEnumArray(null, $2); }
	| direct_abstract_declarator '[' ']'
                                 { $$ = MkDeclaratorArray($1, null); }
	| direct_abstract_declarator '[' constant_expression ']'
                                 { $$ = MkDeclaratorArray($1, $3); }
	| direct_abstract_declarator '[' type']'
                                 { $$ = MkDeclaratorEnumArray($1, $3); }
	| '(' ')'
                                 { $$ = MkDeclaratorFunction(null, null); }
	| '(' parameter_type_list ')'
                                 { $$ = MkDeclaratorFunction(null, $2); }
	| direct_abstract_declarator '(' ')'
                                 { $$ = MkDeclaratorFunction($1, null); }
	| direct_abstract_declarator '(' parameter_type_list ')'
                                 { $$ = MkDeclaratorFunction($1, $3); }
	;

direct_abstract_declarator_noarray:
	  '(' abstract_declarator_noarray ')'
                                 { $$ = MkDeclaratorBrackets($2); }
	| '(' ')'
                                 { $$ = MkDeclaratorFunction(null, null); }
	| '(' parameter_type_list ')'
                                 { $$ = MkDeclaratorFunction(null, $2); }
	| direct_abstract_declarator_noarray '(' ')'
                                 { $$ = MkDeclaratorFunction($1, null); }
	| direct_abstract_declarator_noarray '(' parameter_type_list ')'
                                 { $$ = MkDeclaratorFunction($1, $3); }
	;

abstract_declarator:
	  pointer                              { $$ = MkDeclaratorPointer($1, null); }
	| direct_abstract_declarator
	| pointer direct_abstract_declarator   { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl pointer                     { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, null)); }
   | ext_decl direct_abstract_declarator  { $$ = MkDeclaratorExtended($1, $2); }
	| ext_decl pointer direct_abstract_declarator { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	;

abstract_declarator_noarray:
	  pointer                              { $$ = MkDeclaratorPointer($1, null); }
	| direct_abstract_declarator_noarray
	| pointer direct_abstract_declarator_noarray   { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl pointer { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, null)); }
   | ext_decl direct_abstract_declarator_noarray { $$ = MkDeclaratorExtended($1, $2); }
	| ext_decl pointer direct_abstract_declarator_noarray { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	;

/*
abstract_declarator:
	  pointer
      { $$ = MkDeclaratorPointer($1, null); }
	| direct_abstract_declarator
	| pointer direct_abstract_declarator
      { $$ = MkDeclaratorPointer($1, $2); }

   | ext_decl pointer
      { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, null)); }
	| ext_decl direct_abstract_declarator
      { $$ = MkDeclaratorExtended($1, $2); }
	| ext_decl pointer direct_abstract_declarator
      { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }

	;

direct_abstract_declarator:
	  '(' abstract_declarator ')'
      { $$ = MkDeclaratorBrackets($2); }
	| '[' ']'
      { $$ = MkDeclaratorArray(null, null); }
	| '[' constant_expression ']'
      { $$ = MkDeclaratorArray(null, $2); }
   | '[' type ']'
      { $$ = MkDeclaratorEnumArray(null, $2); }
	| direct_abstract_declarator '[' ']'
      { $$ = MkDeclaratorArray($1, null); }
	| direct_abstract_declarator '[' constant_expression ']'
      { $$ = MkDeclaratorArray($1, $3); }
	| direct_abstract_declarator '[' type ']'
      { $$ = MkDeclaratorEnumArray($1, $3); }
	| '(' ')'
      { $$ = MkDeclaratorFunction(null, null); }
	| '(' parameter_type_list ')'
      { $$ = MkDeclaratorFunction(null, $2); }
	| direct_abstract_declarator '(' ')'
      { $$ = MkDeclaratorFunction($1, null); }
	| direct_abstract_declarator '(' parameter_type_list ')'
      { $$ = MkDeclaratorFunction($1, $3); }
	;
*/
declarator:
	  direct_declarator
	| pointer direct_declarator
      { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl pointer direct_declarator
      { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
   | declarator ext_decl
      { $$ = MkDeclaratorExtendedEnd($2, $1); }
   ;

direct_declarator_nofunction:
	  identifier
      { $$ = MkDeclaratorIdentifier($1); }
	| '(' declarator ')'
      { $$ = MkDeclaratorBrackets($2); }
	| direct_declarator_nofunction '[' constant_expression ']'
      { $$ = MkDeclaratorArray($1, $3); }
	| direct_declarator_nofunction '[' ']'
      { $$ = MkDeclaratorArray($1, null); }
   | direct_declarator_nofunction '[' type ']'
      { $$ = MkDeclaratorEnumArray($1, $3); }
  	;

declarator_function:
     direct_declarator_function
	| pointer direct_declarator_function
      { $$ = MkDeclaratorPointer($1, $2); }

   | ext_decl direct_declarator_function
      { $$ = MkDeclaratorExtended($1, $2); }
	| ext_decl pointer direct_declarator_function
      { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_function
      { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }

   ;

direct_declarator_function_start:
     direct_declarator_nofunction '('
   ;

direct_declarator_function:
	  direct_declarator_function_start parameter_type_list ')'
      { $$ = MkDeclaratorFunction($1, $2); }
	| direct_declarator_function_start identifier_list ')'
      { $$ = MkDeclaratorFunction($1, $2); }
	| direct_declarator_function_start ')'
      { $$ = MkDeclaratorFunction($1, null); }
  	;

direct_declarator:
     direct_declarator_function
   | direct_declarator_nofunction
   | ext_decl direct_declarator_function
      { $$ = MkDeclaratorExtended($1, $2); }
   | ext_decl direct_declarator_nofunction
      { $$ = MkDeclaratorExtended($1, $2); }
	;

declarator_nofunction:
	  direct_declarator_nofunction
	| pointer direct_declarator_nofunction      { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl direct_declarator_nofunction { $$ = MkDeclaratorExtended($1, $2); }
	| ext_decl pointer direct_declarator_nofunction { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_nofunction { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }
;

type_qualifier_list:
	  type_qualifier                          { $$ = MkList(); ListAdd($$, $1); }
	| type_qualifier_list type_qualifier      { $$ = $1; ListAdd($1, $2);  }
	;

pointer:
	  '*'                               { $$ = MkPointer(null, null); }
	| '*' type_qualifier_list           { $$ = MkPointer($2, null); }
	| '*' pointer                       { $$ = MkPointer(null, $2); }
	| '*' type_qualifier_list pointer   { $$ = MkPointer($2, $3); }
	;

parameter_type_list:
	  parameter_list
	| parameter_list ',' ELLIPSIS { $$ = $1; ListAdd($1, MkTypeName(null, null)); }
	;

parameter_list:
	  parameter_declaration                      { $$ = MkList(); ListAdd($$, $1); }
	| parameter_list ',' parameter_declaration   { $$ = $1; ListAdd($1, $3); }
	;

parameter_declaration:
	  guess_declaration_specifiers declarator          { $$ = MkTypeName($1, $2); }
	| guess_declaration_specifiers abstract_declarator { $$ = MkTypeName($1, $2); }
   | guess_declaration_specifiers '&'                 { $$ = MkTypeName($1, MkDeclaratorPointer(MkPointer(null,null), null)); }
   | guess_declaration_specifiers '&' declarator      { $$ = MkTypeName($1, MkDeclaratorPointer(MkPointer(null,null), $3)); }
   | real_guess_declaration_specifiers                { $$ = MkTypeName($1, null); }
/*
   | CLASS
      { $$ = MkTypeName(MkList(), null); $$.typedObject = true; }                        // Confusion with ellipsis? MkList()?
   | CLASS '&'
      { $$ = MkTypeName(null, null); $$.typedObject = true; $$.byReference = true; }
   | CLASS declarator
      { $$ = MkTypeName(MkList(), $2); $$.typedObject = true; }                        // Confusion with ellipsis? MkList()?
   | CLASS '&' declarator
      { $$ = MkTypeName(null, $3); $$.typedObject = true; $$.byReference = true; }
*/
   | CLASS
      { $$ = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); }
/*
   | TYPED_OBJECT
      { $$ = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); }
   | TYPED_OBJECT '&'
      { $$ = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); }
   | TYPED_OBJECT declarator
      { $$ = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), $2);  }
   | TYPED_OBJECT '&' declarator
      { $$ = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), $3)); }
   | ANY_OBJECT
      { $$ = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); }
   | ANY_OBJECT declarator
      { $$ = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), $2); }

   | error
      { $$ = MkTypeName(MkListOne(MkSpecifier(INT)), null); }
   | error declarator             { $$ = MkTypeName(MkListOne(MkSpecifier(INT)), $2); }
   //| error struct_declarator             { $$ = MkTypeName(MkListOne(MkSpecifier(INT)), $2); }
   | error abstract_declarator          { $$ = MkTypeName(MkListOne(MkSpecifier(INT)), $2); }
*/
	;

identifier_list:
	  identifier                        { $$ = MkList(); ListAdd($$, MkTypeName(null, MkDeclaratorIdentifier($1))); }
	| identifier_list ',' identifier    { $$ = $1; ListAdd($1, MkTypeName(null, MkDeclaratorIdentifier($3))); }
	;

type_name:
	  specifier_qualifier_list                      { $$ = MkTypeName($1, null); }
	| specifier_qualifier_list abstract_declarator  { $$ = MkTypeName($1, $2); }
	;

guess_type_name:
	  guess_specifier_qualifier_list                         { $$ = MkTypeName($1, null); }
	| guess_specifier_qualifier_list abstract_declarator     { $$ = MkTypeName($1, $2); }
	;

initializer:
	  assignment_expression
      { $$ = MkInitializerAssignment($1); $$.loc = @$; }
	| '{' initializer_list '}'
      { $$ = MkInitializerList($2); $$.loc = @$; }
	| '{' initializer_list ',' '}'
      {
         $$ = MkInitializerList($2);
         $$.loc = @$;

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = @3;
            exp.loc = @3;
            ListAdd($2, init);
         }
      }
	;

initializer_condition:
	  conditional_expression
      { $$ = MkInitializerAssignment($1); $$.loc = @$; }
   | anon_instantiation_expression
      { $$ = MkInitializerAssignment($1); $$.loc = @$; }
/*
	| '{' initializer_list '}'
      { $$ = MkInitializerList($2); $$.loc = @$; }
	| '{' initializer_list ',' '}'
      {
         $$ = MkInitializerList($2);
         $$.loc = @$;

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = @3;
            exp.loc = @3;
            ListAdd($2, init);
         }
      }
*/
	;

initializer_list:
	  initializer
      { $$ = MkList(); ListAdd($$, $1); }
	| initializer_list ',' initializer
      { $$ = $1; ListAdd($1, $3); }
	;

statement:
	  labeled_statement
	| compound_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	;

labeled_statement:
	  identifier ':' statement
      { $$ = MkLabeledStmt($1, $3); $$.loc = @$; }
	| CASE constant_expression ':' statement
      { $$ = MkCaseStmt($2, $4); $$.loc = @$; $2.loc.start = @1.end; }
	| DEFAULT ':' statement
      { $$ = MkCaseStmt(null, $3); $$.loc = @$; }
	;

declaration_list:
	  declaration                       { $$ = MkList(); ListAdd($$, $1); }
	| declaration_list declaration      { $$ = $1; ListAdd($1, $2); }
	;

statement_list:
	  statement                         { $$ = MkList(); ListAdd($$, $1); }
	| statement_list statement          { $$ = $1; ListAdd($1, $2); }

   // declaration not allowed after statements
   | statement_list declaration              { Statement stmt = MkBadDeclStmt($2); stmt.loc = @2; /*yyerror(); */ ListAdd($1, stmt); $$ = $1; }
	;

compound_inside:
	  statement_list                      { $$ = MkCompoundStmt(null, $1); }
	| declaration_list                  { $$ = MkCompoundStmt($1, null); }
	| declaration_list statement_list   { $$ = MkCompoundStmt($1, $2); }
   ;

compound_start:
    '{' { $<context>$ = PushContext(); }
    ;

compound_statement:
   '{' '}'
   {
      $$ = MkCompoundStmt(null, null);
      $$.compound.context = PushContext();
      PopContext($$.compound.context);
      $$.loc = @$;
   }

	| compound_start compound_inside '}'
      { $$ = $2; $$.compound.context = $<context>1; PopContext($<context>1); $$.loc = @$; }
	;

expression_statement:
	  ';'                         { $$ = MkExpressionStmt(null); $$.loc = @$; }
	| expression ';'              { $$ = MkExpressionStmt($1); $$.loc = @$; }
	;

selection_statement:
	  IF '(' expression ')' statement %prec IFX        { $$ = MkIfStmt($3, $5, null); $$.loc = @$; }
	| IF '(' expression ')' statement ELSE statement   { $$ = MkIfStmt($3, $5, $7); $$.loc = @$; }
	| SWITCH '(' expression ')' statement              { $$ = MkSwitchStmt($3, $5); $$.loc = @$; }
	;

iteration_statement:
	  WHILE '(' expression ')' statement           { $$ = MkWhileStmt($3, $5); $$.loc = @$; }
	| DO statement WHILE '(' expression ')' ';'     { $$ = MkDoWhileStmt($2, $5); $$.loc = @$; }
	| FOR '(' expression_statement expression_statement ')' statement                   { $$ = MkForStmt($3, $4, null, $6); $$.loc = @$; }
	| FOR '(' expression_statement expression_statement expression ')' statement        { $$ = MkForStmt($3, $4, $5, $7); $$.loc = @$; }

   | WHILE '(' ')' statement     { $$ = MkWhileStmt(null, $4); $$.loc = @$; }
   | FOR '(' expression_statement ')' statement                   { $$ = MkForStmt($3, null, null, $5); $$.loc = @$; }
   | FOR '(' ')' statement  { $$ = MkForStmt(null, null, null, $4); $$.loc = @$; }
	;

jump_statement:
	  GOTO identifier ';'   { $$ = MkGotoStmt($2); $$.loc = @$; }
	| CONTINUE ';'          { $$ = MkContinueStmt(); $$.loc = @$; }
	| BREAK ';'             { $$ = MkBreakStmt(); $$.loc = @$; }
	| RETURN ';'            { Expression exp = MkExpDummy(); $$ = MkReturnStmt(MkListOne(exp)); $$.loc = @$; exp.loc = @2; }
	| RETURN expression ';' { $$ = MkReturnStmt($2); $$.loc = @$; }
	;

string_literal:
   STRING_LITERAL { $$ = CopyString(yytext); }
   ;

instantiation_named:
     declaration_specifiers identifier '{' members_initialization_list '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | declaration_specifiers identifier '{' '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), MkList());  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.start;}
   ;

guess_instantiation_named:
     guess_declaration_specifiers identifier '{' members_initialization_list '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   |  guess_declaration_specifiers identifier '{' '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), MkList());  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.start;}

   /*| guess_declaration_specifiers identifier '{' members_initialization_list error
      {
         int l = 0;
         $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;

         for(;;)
         {
            if(yychar == '}')
               l--;
            else if(yychar == '{')
               l++;
            if(l<0)
               break;
            yychar = yylex();
            yyerrok;
         }
         if(yychar == '}')
            yychar = yylex();
      }*/
   ;

instantiation_unnamed:
     type '{' members_initialization_list '}'
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; }
   | type '{' '}'
      { $$ = MkInstantiation($1, null, MkList());  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.start;}
   | identifier '{' members_initialization_list '}'
      { Location tmpLoc = yylloc; yylloc = @1; yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);$$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; FreeIdentifier($1); }
   | identifier '{' '}'
      { Location tmpLoc = yylloc; yylloc = @1; yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, MkList());  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.start; FreeIdentifier($1); }
   ;

instantiation_anon:
     '{' members_initialization_list '}'
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @3.start; }
   | '{' '}'
      { $$ = MkInstantiation(null, null, MkList());  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.start;}
   ;
class_function_definition:
	  class_function_definition_start compound_statement
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; }
	| virtual_class_function_definition_start compound_statement
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; }
   | virtual_class_function_definition_start ';'
      { ProcessClassFunctionBody($1, null); $$.loc = @$; }
	| constructor_function_definition_start compound_statement
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; }
	| destructor_function_definition_start compound_statement
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; }
  	;

instance_class_function_definition_start:
   // Guess here conflicts with an expression...
     declaration_specifiers declarator_function
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
    | declaration_specifiers declarator_nofunction
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
      ;

instance_class_function_definition:
	  instance_class_function_definition_start compound_statement
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; }
  	;

data_member_initialization:
     postfix_expression '=' initializer_condition { $$ = MkMemberInitExp($1, $3); $$.loc = @$; $$.realLoc = @$; $$.initializer.loc.start = @2.end;}
   | initializer_condition                { $$ = MkMemberInit(null, $1); $$.loc = @$; $$.realLoc = @$;}
   ;

data_member_initialization_list:
     data_member_initialization
      { $$ = MkList(); ListAdd($$, $1); }
   | data_member_initialization_list ',' data_member_initialization
      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   ;

data_member_initialization_list_coloned:
   data_member_initialization_list ';'
      { if($1->last) ((MemberInit)$1->last).loc.end = @2.end; $$ = $1; }
   ;

members_initialization_list_coloned:
     data_member_initialization_list_coloned                                        { MembersInit members = MkMembersInitList($1); $$ = MkList(); ListAdd($$, members); members.loc = @1; }
   | instance_class_function_definition                                             { $$ = MkList(); ListAdd($$, MkMembersInitMethod($1)); ((MembersInit)$$->last).loc = @1; }
   | members_initialization_list_coloned  data_member_initialization_list_coloned   { MembersInit members = MkMembersInitList($2); ListAdd($$, members); members.loc = @2; $$ = $1;  }
   | members_initialization_list_coloned  instance_class_function_definition        { ListAdd($$, MkMembersInitMethod($2)); ((MembersInit)$$->last).loc = @2;$$ = $1;  }
   | ';'                                                                            { MembersInit members = MkMembersInitList(MkList()); $$ = MkList(); ListAdd($$, members); members.loc = @1;  }
   | members_initialization_list_coloned ';'                                        { MembersInit members = MkMembersInitList(MkList()); ListAdd($$, members); members.loc = @2; $$ = $1; }
   ;

members_initialization_list:
     members_initialization_list_coloned
   | data_member_initialization_list                                       { $$ = MkList(); ListAdd($$, MkMembersInitList($1)); ((MembersInit)$$->last).loc = @1; }
   | members_initialization_list_coloned data_member_initialization_list   { ListAdd($1, MkMembersInitList($2));   ((MembersInit)$$->last).loc = @2; }
   ;

type_unit:
     parameter_declaration                            { parsedType = $1; }
   | parameter_declaration ':' constant_expression    { parsedType = $1; parsedType.bitCount = $3; }
   ;

%%
