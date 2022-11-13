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

#define C89_DECL_WARNING            $"eC expects all declarations to precede statements in the block (C89 style)\n"
#define CASE_LABELED_STMT_WARNING   $"labeled statement directly within a case statement\n"

#define uint _uint
default:

%}

%debug
%union
{
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
}

// *** Types ***

%type <symbol> class_decl
%type <specifierType> struct_or_union
%type <i>   unary_operator assignment_operator
%type <declMode> member_access declaration_mode
%type <id>  identifier enum_decl
%type <exp> primary_expression primary_expression_error postfix_expression unary_expression cast_expression
            multiplicative_expression additive_expression shift_expression
            relational_expression relational_expression_smaller_than equality_expression and_expression
            exclusive_or_expression inclusive_or_expression logical_and_expression
            logical_or_expression conditional_expression assignment_expression
            constant_expression constant_expression_error
            anon_instantiation_expression anon_instantiation_expression_error i18n_string
            postfix_expression_error unary_expression_error cast_expression_error
            multiplicative_expression_error additive_expression_error shift_expression_error
            relational_expression_error equality_expression_error and_expression_error
            exclusive_or_expression_error inclusive_or_expression_error logical_and_expression_error
            logical_or_expression_error conditional_expression_error assignment_expression_error
            simple_primary_expression constant
            common_unary_expression common_unary_expression_error
            database_open dbfield dbindex dbtable

//simple_unary_expression simple_unary_expression_error
// simple_postfix_expression simple_postfix_expression_error

%type <list> argument_expression_list expression expression_anon_inst expression_anon_inst_error enumerator_list type_qualifier_list
             struct_declarator_list struct_declaration_list
             declaration_specifiers identifier_list identifier_list_error initializer_list init_declarator_list
             parameter_list parameter_list_error parameter_type_list parameter_type_list_error declaration_list declaration_list_error statement_list statement_list_error
             translation_unit members_initialization_list members_initialization_list_coloned members_initialization_list_error  data_member_initialization_list data_member_initialization_list_coloned
             default_property_list data_member_initialization_list_error
             expression_error init_declarator_list_error argument_expression_list_error default_property_list_error struct_declaration_list_error
             translation_unit_error
             guess_declaration_specifiers
             external_guess_declaration_specifiers external_guess_declaration_specifiers_error
             specifier_qualifier_list guess_specifier_qualifier_list
             _inheritance_specifiers inheritance_specifiers property_specifiers
             new_specifiers renew_specifiers asm_field_list
             property_watch_list watch_property_list
             dbindex_item_list dbfield_definition_list
             template_arguments_list template_parameters_list attribs_list multi_attrib

%type <asmField> asm_field
%type <specifier> storage_class_specifier enum_specifier_compound enum_specifier_nocompound type_qualifier type_specifier class_specifier class_specifier_error
                  struct_or_union_specifier_compound struct_or_union_specifier_nocompound ext_storage type strict_type guess_type enum_class strict_type_specifier struct_class
                  struct_or_union_specifier_compound_error struct_class_error struct_decl
                  enum_specifier_compound_error enum_class_error external_storage_class_specifier
                  base_strict_type struct_head struct_entry
%type <enumerator> enumerator
%type <declarator> declarator direct_declarator direct_abstract_declarator abstract_declarator
                   direct_abstract_declarator_noarray abstract_declarator_noarray
                   struct_declarator direct_declarator_function direct_declarator_function_start declarator_function_error direct_declarator_function_error declarator_function direct_declarator_nofunction
                   direct_declarator_function_type_ok declarator_nofunction_type_ok direct_declarator_nofunction_type_ok declarator_function_type_ok direct_declarator_function_error_type_ok
                   direct_declarator_function_start_type_ok direct_declarator_type_ok declarator_type_ok declarator_function_error_type_ok
%type <pointer> pointer
%type <initializer> initializer initializer_error initializer_condition initializer_condition_error initializer_noexp
%type <initDeclarator> init_declarator init_declarator_error
%type <typeName> type_name guess_type_name parameter_declaration parameter_declaration_error
%type <stmt> statement labeled_statement labeled_statement_error compound_statement compound_statement_error expression_statement
             selection_statement selection_statement_error iteration_statement jump_statement jump_statement_error compound_inside compound_inside_error
             iteration_statement_error statement_error asm_statement
             stopwatching watch_definition firewatchers

%type <declaration> declaration declaration_error external_guess_declaration external_guess_declaration_error
%type <function>  function_definition  function_definition_error
%type <external>  external_declaration external_declaration_error

%type <instance> instantiation_named instantiation_named_error instantiation_unnamed instantiation_unnamed_error guess_instantiation_named guess_instantiation_named_error external_guess_instantiation_named
                 instantiation_anon instantiation_anon_error
%type <memberInit> data_member_initialization data_member_initialization_error default_property default_property_error
%type <classFunction> class_function_definition class_function_definition_error class_function_definition_start
                     class_function_definition_start_error virtual_class_function_definition_start virtual_class_function_definition_start_error
                     constructor_function_definition_start destructor_function_definition_start
%type <classFunction> instance_class_function_definition instance_class_function_definition_error instance_class_function_definition_start instance_class_function_definition_start_error
%type <_class> class class_error class_head
%type <classDef> struct_declaration struct_declaration_error
%type <string> string_literal base_strict_type_name attribute_word
%type <extDecl> ext_decl
%type <attrib> attrib
%type <attribute> attribute
%type <prop> property property_start property_body class_property class_property_start class_property_body
%type <propertyWatch> property_watch self_watch_definition

%type <templateParameter> template_parameter template_type_parameter template_identifier_parameter template_expression_parameter
%type <templateArgument> template_argument template_type_argument template_identifier_argument template_expression_argument
%type <templateDatatype> template_datatype

%type <dbtableEntry> dbindex_entry dbfield_entry
%type <dbindexItem> dbindex_item
%type <dbtableDef> dbtable_definition
%type <context> compound_start class_entry

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
%destructor { FreeExpression($$); } primary_expression primary_expression_error postfix_expression unary_expression cast_expression
                                    multiplicative_expression additive_expression shift_expression
                                    relational_expression equality_expression and_expression
                                    exclusive_or_expression inclusive_or_expression logical_and_expression
                                    logical_or_expression conditional_expression assignment_expression
                                    constant_expression constant_expression_error
                                    postfix_expression_error unary_expression_error cast_expression_error
                                    multiplicative_expression_error additive_expression_error shift_expression_error
                                    relational_expression_error equality_expression_error and_expression_error
                                    exclusive_or_expression_error inclusive_or_expression_error logical_and_expression_error
                                    logical_or_expression_error conditional_expression_error assignment_expression_error i18n_string
%destructor { FreeSpecifier($$); }  storage_class_specifier enum_specifier_compound enum_specifier_nocompound type_qualifier type_specifier class_specifier class_specifier_error
                                    struct_or_union_specifier_compound struct_or_union_specifier_nocompound ext_storage type strict_type guess_type enum_class strict_type_specifier struct_class
                                    struct_or_union_specifier_compound_error struct_class_error struct_decl
                                    enum_specifier_compound_error enum_class_error external_storage_class_specifier
                                    base_strict_type struct_head struct_entry
%destructor { FreeEnumerator($$); } enumerator
%destructor { FreeDeclarator($$); } declarator direct_declarator direct_abstract_declarator abstract_declarator
                                    direct_abstract_declarator_noarray abstract_declarator_noarray
                                    struct_declarator direct_declarator_function direct_declarator_function_start declarator_function_error direct_declarator_function_error declarator_function direct_declarator_nofunction
                                    direct_declarator_function_type_ok declarator_nofunction_type_ok direct_declarator_nofunction_type_ok declarator_function_type_ok direct_declarator_function_error_type_ok
                                    direct_declarator_function_start_type_ok direct_declarator_type_ok declarator_type_ok declarator_function_error_type_ok

%destructor { FreeInitializer($$); } initializer initializer_error initializer_condition initializer_condition_error
%destructor { FreeInitDeclarator($$); } init_declarator init_declarator_error
%destructor { FreeTypeName($$); } type_name guess_type_name parameter_declaration parameter_declaration_error
%destructor { FreeStatement($$); }  statement labeled_statement labeled_statement_error compound_statement compound_statement_error expression_statement
                                    selection_statement selection_statement_error iteration_statement jump_statement jump_statement_error compound_inside compound_inside_error
                                    iteration_statement_error statement_error

%destructor { FreeDeclaration($$); } declaration
%destructor { FreeFunction($$); } function_definition  function_definition_error
%destructor { FreeExternal($$); } external_declaration external_declaration_error

%destructor { FreeInstance($$); } instantiation_named instantiation_named_error instantiation_unnamed instantiation_unnamed_error

%destructor { FreeMemberInit($$); } data_member_initialization data_member_initialization_error default_property default_property_error

%destructor { FreeClassFunction($$); } class_function_definition class_function_definition_error class_function_definition_start
                                       class_function_definition_start_error virtual_class_function_definition_start virtual_class_function_definition_start_error
                                       constructor_function_definition_start destructor_function_definition_start
                                       instance_class_function_definition instance_class_function_definition_error instance_class_function_definition_start instance_class_function_definition_start_error
%destructor { Context ctx = curContext; PopContext(ctx); FreeContext(ctx); delete ctx; } class_entry
%destructor { Context ctx = curContext; PopContext(ctx); FreeContext(ctx); delete ctx; } class_decl
%destructor { FreeClass($$); } class class_error class_head
%destructor { FreeClassDef($$); } struct_declaration struct_declaration_error
%destructor { delete $$; } string_literal attribute_word base_strict_type_name
%destructor { FreeProperty($$); } property

%destructor { FreeList($$, FreeExpression); }  argument_expression_list expression expression_error argument_expression_list_error
%destructor { FreeList($$, FreeEnumerator); }  enumerator_list
%destructor { FreeList($$, FreeSpecifier); }   type_qualifier_list specifier_qualifier_list declaration_specifiers inheritance_specifiers _inheritance_specifiers external_guess_declaration_specifiers external_guess_declaration_specifiers_error
                                               guess_declaration_specifiers guess_specifier_qualifier_list
%destructor { FreeList($$, FreeDeclarator); }  struct_declarator_list
%destructor { FreeList($$, FreeDeclaration); } declaration_list declaration_list_error
%destructor { FreeList($$, FreeInitializer); } initializer_list
%destructor { FreeList($$, FreeInitDeclarator); } init_declarator_list init_declarator_list_error
%destructor { FreeList($$, FreeTypeName); } parameter_list parameter_list_error parameter_type_list parameter_type_list_error identifier_list identifier_list_error
%destructor { FreeList($$, FreeStatement); } statement_list statement_list_error
%destructor { if($$ != ast) FreeList($$, FreeExternal); } translation_unit translation_unit_error
%destructor { FreeList($$, FreeClassDef); } struct_declaration_list struct_declaration_list_error
%destructor { FreeList($$, FreeMemberInit); } default_property_list default_property_list_error data_member_initialization_list data_member_initialization_list_coloned data_member_initialization_list_error
%destructor { FreeList($$, FreeMembersInit); } members_initialization_list members_initialization_list_coloned members_initialization_list_error
%destructor { PopContext($$); FreeContext($$); delete $$; } compound_start
%destructor { FreeTemplateParameter($$); } template_parameter template_type_parameter template_identifier_parameter template_expression_parameter
%destructor { FreeTemplateArgument($$); } template_argument template_type_argument template_identifier_argument template_expression_argument
%destructor { FreeTemplateDataType($$); } template_datatype
%destructor { FreeList($$, FreeTemplateParameter); } template_parameters_list
%destructor { FreeList($$, FreeTemplateArgument); } template_arguments_list
%destructor { } declaration_mode
%destructor { FreeAttrib($$); } attrib
%destructor { FreeExtDecl($$); } ext_decl
%destructor { FreeAttribute($$); } attribute
%destructor { FreeList($$, FreeAttribute); }  attribs_list
%destructor { FreeList($$, FreeAttrib); }  multi_attrib

%start thefile

%%

guess_type:
   identifier '*'
   {
      $$ = null;
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
/*   | identifier '*' '<' template_arguments_list '>'
   {
      _DeclClass($1._class, $1.string);
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
   }*/
   ;

type:
   strict_type       { $$ = $1; }
   | identifier identifier
   {
   #ifdef PRECOMPILER
      if(!$1.string[0])
      {
         $$ = MkSpecifierName($1.string);
         FreeIdentifier($1);
         FreeIdentifier($2);
      }
      else
      {
         _DeclClass($1._class, $1.string);

         FreeIdentifier($1);
         FreeIdentifier($2);

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
   #else
         Location tmpLoc = yylloc; $$ = $2; yylloc = @1;
         Compiler_Error($"Not a type: %s\n", $1.string);
         yylloc = tmpLoc; $2.badID = $1;
   #endif
      }
   }
   /*
   | identifier '<'
   {
   #ifdef PRECOMPILER
      _DeclClass($1._class, $1.string);
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
/*   | strict_type '<' template_arguments_list '>'      { $$ = $1; }
   | identifier identifier '<' template_arguments_list '>'
   {
   #ifdef PRECOMPILER
      _DeclClass($1._class, $1.string);
      FreeIdentifier($1);
      FreeIdentifier($2);

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
   #else
      Location tmpLoc = yylloc; $$ = $2; yylloc = @1;
      Compiler_Error($"Not a type: %s\n", $1.string);
      yylloc = tmpLoc; $2.badID = $1;
   #endif
   }*/
   ;

base_strict_type:
     TYPE_NAME    { $$ = MkSpecifierName(yytext); }
   ;

base_strict_type_name:
     TYPE_NAME    { $$ = CopyString(yytext); }
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

/*    | identifier '<' template_arguments_list '>' */
      /*| identifier '<' error
      {
         _DeclClass($1._class, $1.string);

         yyerrok;

         fileInput.Seek(@1.start.pos, start);
         resetScannerPos(&@1.start);
         yyclearin;

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
         goto yysetstate;

         /* $$ = MkSpecifierNameArgs($1.string, $3); $$.loc = @$; FreeIdentifier($1); */
      /*}*/
   ;

class_function_definition_start:
   guess_declaration_specifiers declarator_function_type_ok
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
   | declarator_function
      { $$ = MkClassFunction(null, null, $1, null); $$.loc = @$; }
   ;

constructor_function_definition_start:
   guess_declaration_specifiers '(' ')'
      { $$ = MkClassFunction($1, null, null, null); $$.isConstructor = true; $$.loc = @$; }
   ;

destructor_function_definition_start:
   '~' guess_declaration_specifiers '(' ')'
      { $$ = MkClassFunction($2, null, null, null); $$.isDestructor = true; $$.loc = @$; }
   ;

virtual_class_function_definition_start:
     VIRTUAL guess_declaration_specifiers declarator_function_type_ok
      { $$ = MkClassFunction($2, null, $3, null); $$.isVirtual = true; $$.loc = @$; }
   | VIRTUAL declarator_function
      { $$ = MkClassFunction(null, null, $2, null); $$.isVirtual = true; $$.loc = @$; }
      ;

class_function_definition_start_error:
     guess_declaration_specifiers declarator_function_error_type_ok
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
   | declarator_function_error
      { $$ = MkClassFunction(null, null, $1, null); $$.loc = @$; }
   ;

virtual_class_function_definition_start_error:
     VIRTUAL guess_declaration_specifiers declarator_function_error_type_ok
      { $$ = MkClassFunction($2, null, $3, null); $$.isVirtual = true; $$.loc = @$; }
   | VIRTUAL declarator_function_error
      { $$ = MkClassFunction(null, null, $2, null); $$.isVirtual = true; $$.loc = @$; }
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

   // TESTING THIS
   | class_function_definition_start ';'
      { ProcessClassFunctionBody($1, null); $$.loc = @$; }

   // Added this to fix attrib not working after function pointer declarations
   | class_function_definition_start attrib ';'
      {
         if($1.declarator)
         {
            $1.declarator = MkStructDeclarator($1.declarator, null);
            $1.declarator.structDecl.attrib = $2;
         }
         ProcessClassFunctionBody($1, null);
         $$.loc = @$;
      }
  	;

class_function_definition_error:
	   class_function_definition_start compound_statement_error
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; $$.loc.end = $2.loc.end; }
   | 	class_function_definition_start_error
      { ProcessClassFunctionBody($1, null); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;}
	|  virtual_class_function_definition_start compound_statement_error
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; $$.loc.end = $2.loc.end; }
   | 	virtual_class_function_definition_start_error
      { ProcessClassFunctionBody($1, null); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;}
   | 	virtual_class_function_definition_start_error ';'
      { ProcessClassFunctionBody($1, null); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;}
  	;

// In Instances, return type is required to distinguish from calling the function
instance_class_function_definition_start:
   declaration_specifiers declarator_function_type_ok
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
   |  declaration_specifiers declarator_nofunction_type_ok
      { $$ = MkClassFunction($1, null, MkDeclaratorFunction($2, null), null); $$.loc = @$; }
      ;

instance_class_function_definition_start_error:
   declaration_specifiers declarator_function_error_type_ok
      { $$ = MkClassFunction($1, null, $2, null); $$.loc = @$; }
      ;

instance_class_function_definition:
	instance_class_function_definition_start compound_statement
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; }
  	;

instance_class_function_definition_error:
	instance_class_function_definition_start compound_statement_error
      { ProcessClassFunctionBody($1, $2); $$.loc = @$; $$.loc.end = $2.loc.end; $$.loc.end.charPos++; $$.loc.end.pos++;}
   | 	instance_class_function_definition_start_error
      { ProcessClassFunctionBody($1, null); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;}
   | 	instance_class_function_definition_start
      { ProcessClassFunctionBody($1, null); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;}
  	;

data_member_initialization:
     postfix_expression '=' initializer_condition { $$ = MkMemberInitExp($1, $3); $$.loc = @$; $$.realLoc = @$; $$.initializer.loc.start = @2.end;}
   | initializer_condition                { $$ = MkMemberInit(null, $1); $$.loc = @$; $$.realLoc = @$;}
   ;

data_member_initialization_error:
     postfix_expression '=' initializer_condition_error { $$ = MkMemberInitExp($1, $3); $$.loc = @$; $$.realLoc = @$; $$.initializer.loc.start = @2.end;}
   | postfix_expression '=' error
      {
         $$ = MkMemberInitExp($1, MkInitializerAssignment(MkExpDummy()));
         $$.loc = @$; $$.realLoc = @$; $$.initializer.loc.start = $$.initializer.loc.end = @2.end;

         fileInput.Seek(@2.end.pos, start);
         yyclearin;
         resetScannerPos(&@2.end);
         @$.start = @1.start;
         @$.end = @2.end;
      }
   | initializer_condition_error { $$ = MkMemberInit(null, $1); $$.loc = @$; $$.realLoc = @$;}
   ;

data_member_initialization_list:
   data_member_initialization { $$ = MkList(); ListAdd($$, $1); }
   | data_member_initialization_list ',' data_member_initialization
      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   | data_member_initialization_list_error ',' data_member_initialization
      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   ;

data_member_initialization_list_error:
   data_member_initialization_error { $$ = MkList(); ListAdd($$, $1); }
   | data_member_initialization_list ',' data_member_initialization_error
      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   | data_member_initialization_list_error ',' data_member_initialization_error
      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }

   | data_member_initialization_list ',' error
      { ((MemberInit)$1->last).loc.end = @2.end;
         {
            Initializer dummy = MkInitializerAssignment(MkExpDummy());
            MemberInit memberInit = MkMemberInit(null, dummy);
            memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = @2.end;
            memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = @2.end;
            ListAdd($1, memberInit);
          }
          $$ = $1;
       }
   |
   data_member_initialization_list_error ',' error
      { ((MemberInit)$1->last).loc.end = @2.end;
         {
            Initializer dummy = MkInitializerAssignment(MkExpDummy());
            MemberInit memberInit = MkMemberInit(null, dummy);
            memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = @2.end;
            memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = @2.end;
            ListAdd($1, memberInit);
          }
          $$ = $1;
       }
       |   ','
      {
         Initializer dummy = MkInitializerAssignment(MkExpDummy());
         MemberInit memberInit = MkMemberInit(null, dummy);
         memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = @1.start;
         memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = @1.start;

         $$ = MkList();
         ListAdd($$, memberInit);

         dummy = MkInitializerAssignment(MkExpDummy());
         memberInit = MkMemberInit(null, dummy);
         memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = @1.end;
         memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = @1.end;
         ListAdd($$, memberInit);
      }
   ;

data_member_initialization_list_coloned:
   data_member_initialization_list ';'
      { if($1->last) ((MemberInit)$1->last).loc.end = @2.end; $$ = $1; }
   | data_member_initialization_list_error ';'
      { if($1->last) ((MemberInit)$1->last).loc.end = @2.end; $$ = $1; }
   ;

members_initialization_list_coloned:
     data_member_initialization_list_coloned                                        { MembersInit members = MkMembersInitList($1); $$ = MkList(); ListAdd($$, members); members.loc = @1; }
   | instance_class_function_definition                                             { $$ = MkList(); ListAdd($$, MkMembersInitMethod($1)); ((MembersInit)$$->last).loc = @1; }
   | members_initialization_list_error data_member_initialization_list_coloned      { MembersInit members = MkMembersInitList($2); ListAdd($$, members);  members.loc = @2; $$ = $1; }
   | members_initialization_list_error    instance_class_function_definition        { ListAdd($$, MkMembersInitMethod($2)); ((MembersInit)$$->last).loc = @2; $$ = $1; }
   | members_initialization_list_coloned  data_member_initialization_list_coloned   { MembersInit members = MkMembersInitList($2); ListAdd($$, members); members.loc = @2; $$ = $1; }
   | members_initialization_list_coloned  instance_class_function_definition        { ListAdd($$, MkMembersInitMethod($2)); ((MembersInit)$$->last).loc = @2; $$ = $1; }
   | members_initialization_list_error ';'
   | members_initialization_list_coloned ';'
   {
      MembersInit members = (MembersInit)$$->last;
      if(members.type == dataMembersInit)
         members.loc.end = @$.end;
      else
      {
         MembersInit members = MkMembersInitList(MkList());
         ListAdd($$, members);
         members.loc = @2;
      }
      $$ = $1;
   }
   | ';'                                                                            { MembersInit members = MkMembersInitList(MkList()); $$ = MkList(); ListAdd($$, members); members.loc = @1;  }
   ;

members_initialization_list:
     members_initialization_list_coloned
   | data_member_initialization_list                                       { $$ = MkList(); ListAdd($$, MkMembersInitList($1)); ((MembersInit)$$->last).loc = @1; }
   | members_initialization_list_coloned data_member_initialization_list   { ListAdd($1, MkMembersInitList($2));   ((MembersInit)$$->last).loc = @2; }
   | members_initialization_list_error data_member_initialization_list     { ListAdd($1, MkMembersInitList($2));   ((MembersInit)$$->last).loc = @2; }
   ;

members_initialization_list_error:
     instance_class_function_definition_error                                 { $$ = MkList(); ListAdd($$, MkMembersInitMethod($1)); ((MembersInit)$$->last).loc = @1; }
     | members_initialization_list instance_class_function_definition_error  { ListAdd($$, MkMembersInitMethod($2)); ((MembersInit)$$->last).loc = @2; $$ = $1; }
     | members_initialization_list_error instance_class_function_definition_error  { ListAdd($$, MkMembersInitMethod($2)); ((MembersInit)$$->last).loc = @2; $$ = $1; }
     | members_initialization_list_coloned instance_class_function_definition_error  { ListAdd($$, MkMembersInitMethod($2)); ((MembersInit)$$->last).loc = @2; $$ = $1; }
     | members_initialization_list_coloned data_member_initialization_list_error  { ListAdd($$, MkMembersInitList($2)); ((MembersInit)$$->last).loc = @2; $$ = $1; }
     | data_member_initialization_list_error                                  { $$ = MkList(); ListAdd($$, MkMembersInitList($1)); ((MembersInit)$$->last).loc = @1; }
     | data_member_initialization_list error                                  { $$ = MkList(); ListAdd($$, MkMembersInitList($1)); ((MembersInit)$$->last).loc = @2; }
   ;

instantiation_named:
     instantiation_named_error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; $$ = $1; }
    | instantiation_named_error error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; $$ = $1; }
   ;

instantiation_named_error:
    declaration_specifiers identifier '{' members_initialization_list_error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{' members_initialization_list error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{' members_initialization_list
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{' error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
   ;

/*
instantiation_named:
     declaration_specifiers identifier '{' members_initialization_list '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | declaration_specifiers identifier '{' members_initialization_list_error '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | declaration_specifiers identifier '{' '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), MkList()); $$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.start;}
   ;

instantiation_named_error:
    declaration_specifiers identifier '{' members_initialization_list_error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{' members_initialization_list error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{' members_initialization_list
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   declaration_specifiers identifier '{' error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
   ;
*/


guess_instantiation_named:
     guess_instantiation_named_error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; }
    | guess_instantiation_named_error error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; }
   ;

guess_instantiation_named_error:
    guess_declaration_specifiers identifier '{' members_initialization_list_error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{' members_initialization_list error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{' members_initialization_list
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{' error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
   ;

/*
guess_instantiation_named:
     guess_declaration_specifiers identifier '{' members_initialization_list '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | guess_declaration_specifiers identifier '{' members_initialization_list_error '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | guess_declaration_specifiers identifier '{' '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), MkList());  $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.start;}
   ;

guess_instantiation_named_error:
    guess_declaration_specifiers identifier '{' members_initialization_list_error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{' members_initialization_list error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{' members_initialization_list
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|   guess_declaration_specifiers identifier '{' error
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), null);$$.exp.loc = @2;  $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
   ;
*/

external_guess_instantiation_named:
     external_guess_declaration_specifiers identifier '{' members_initialization_list '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | external_guess_declaration_specifiers identifier '{' members_initialization_list_error '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), $4); $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @5.start;}
   | external_guess_declaration_specifiers identifier '{' '}'
      { $$ = MkInstantiationNamed($1, MkExpIdentifier($2), MkList());  $$.exp.loc = @2; $$.loc = @$; $$.nameLoc = @2; $$.insideLoc.start = @3.end; $$.insideLoc.end = @4.start;}
   ;

instantiation_unnamed:
     instantiation_unnamed_error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; $$ = $1; }
    | instantiation_unnamed_error error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; $$ = $1; }
   ;

instantiation_unnamed_error:
     strict_type '{' members_initialization_list
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|    identifier '{' members_initialization_list
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end; FreeIdentifier($1); }

|    strict_type '{' members_initialization_list_error
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    strict_type '{'
      { $$ = MkInstantiation($1, null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    strict_type '{' members_initialization_list error
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    strict_type '{' error
      { $$ = MkInstantiation($1, null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end; $$.loc.end.charPos++; $$.loc.end.pos++;  }

   // Undeclared class

|    identifier '{' members_initialization_list_error
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
|    identifier '{'
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
|    identifier '{' members_initialization_list error
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
|    identifier '{' error
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end; $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
   ;

/*
instantiation_unnamed:
     strict_type '{' members_initialization_list '}'
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; }
   | strict_type '{' members_initialization_list error '}'
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @5.start; }
   | strict_type '{' members_initialization_list_error '}'
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; }
   | strict_type '{' '}'
      { $$ = MkInstantiation($1, null, MkList());  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.start;}
   | strict_type '{' error '}'
      { $$ = MkInstantiation($1, null, MkList());  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start;}

   // Undeclared class
   | identifier '{' members_initialization_list '}'
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; FreeIdentifier($1); }
   | identifier '{' members_initialization_list_error '}'
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; FreeIdentifier($1); }
   | identifier '{' members_initialization_list error '}'
      { yyloc = @1;
      $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @5.start; FreeIdentifier($1); }
   | identifier '{' '}'
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, MkList());  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.start; FreeIdentifier($1);}
   | identifier '{' error '}'
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, MkList());  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @4.start; FreeIdentifier($1); }
   ;


instantiation_unnamed_error:
     strict_type '{' members_initialization_list_error
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    strict_type '{'
      { $$ = MkInstantiation($1, null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    strict_type '{' members_initialization_list error
      { $$ = MkInstantiation($1, null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    strict_type '{' error
      { $$ = MkInstantiation($1, null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end; $$.loc.end.charPos++; $$.loc.end.pos++;  }

   // Undeclared class

|    identifier '{' members_initialization_list_error
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
|    identifier '{'
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
|    identifier '{' members_initialization_list error
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, $3);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @3.end;  $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
|    identifier '{' error
      { Location tmpLoc = yylloc; yylloc = @1;
      yylloc = tmpLoc;  $$ = MkInstantiation(MkSpecifierName($1.string), null, null);  $$.loc = @$; $$.insideLoc.start = @2.end; $$.insideLoc.end = @2.end; $$.loc.end.charPos++; $$.loc.end.pos++; FreeIdentifier($1); }
   ;
*/

instantiation_anon:
     instantiation_anon_error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; }
    | instantiation_anon_error error '}'
      { $$.loc = @$; $$.insideLoc.end = @2.start; }
   ;

instantiation_anon_error:
     '{' members_initialization_list_error
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
|    '{' members_initialization_list error
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    '{' error
      { $$ = MkInstantiation(null, null, null);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @1.end; $$.loc.end.charPos++; $$.loc.end.pos++;  }
|    '{'
      { $$ = MkInstantiation(null, null, null);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @1.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    '{' members_initialization_list
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.end; $$.loc.end.charPos++; $$.loc.end.pos++; }
   ;

/*
instantiation_anon:
     '{' members_initialization_list '}'
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @3.start; }
   | '{' members_initialization_list error '}'
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @4.start; }
   | '{' members_initialization_list_error '}'
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @3.start; }
   | '{' '}'
      { $$ = MkInstantiation(null, null, MkList());  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.start;}
   | '{' error '}'
      { $$ = MkInstantiation(null, null, MkList());  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @3.start;}
   ;

instantiation_anon_error:
     '{' members_initialization_list_error
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    '{'
      { $$ = MkInstantiation(null, null, null);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @1.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    '{' members_initialization_list error
      { $$ = MkInstantiation(null, null, $2);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @2.end;  $$.loc.end.charPos++; $$.loc.end.pos++; }
|    '{' error
      { $$ = MkInstantiation(null, null, null);  $$.loc = @$; $$.insideLoc.start = @1.end; $$.insideLoc.end = @1.end; $$.loc.end.charPos++; $$.loc.end.pos++;  }
   ;
*/

default_property:
     postfix_expression '=' initializer_condition { $$ = MkMemberInitExp($1, $3); $$.loc = @$; $$.realLoc = @$; }
   ;

default_property_error:
     postfix_expression '=' initializer_condition_error { $$ = MkMemberInitExp($1, $3); $$.loc = @$; $$.realLoc = @$; $$.initializer.loc.start = @2.end; }
   | postfix_expression '=' error { $$ = MkMemberInitExp($1, MkInitializerAssignment(MkExpDummy())); $$.loc = @$; $$.realLoc = @$; $$.initializer.loc.start = @2.end; $$.initializer.loc.end = @2.end; }
   | postfix_expression error { $$ = MkMemberInitExp($1, null); $$.loc = @$; $$.realLoc = @$; }
   ;

default_property_list:
     default_property        { $$ = MkList(); ListAdd($$, $1); ((MemberInit)$$->last).loc = @$; }
   | default_property_list ',' default_property      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   | default_property_list_error ',' default_property      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   ;

default_property_list_error:
      default_property_error      { $$ = MkList(); ListAdd($$, $1); ((MemberInit)$$->last).loc = @$; }
   | default_property_list ',' default_property_error      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   | default_property_list_error ',' default_property_error      { ((MemberInit)$1->last).loc.end = @3.start; ListAdd($1, $3); $$ = $1; }
   | default_property_list error
   ;

property_start:
     PROPERTY property_specifiers identifier '{'
      { $$ = MkProperty($2, null, $3, null, null); $$.loc = @$; }

   | PROPERTY property_specifiers abstract_declarator identifier '{'
      { $$ = MkProperty($2, $3, $4, null, null); $$.loc = @$; }

   | PROPERTY property_specifiers '{'
      { $$ = MkProperty($2, null, null, null, null); $$.loc = @$; }

   | PROPERTY property_specifiers abstract_declarator '{'
      { $$ = MkProperty($2, $3, null, null, null); $$.loc = @$; }

   | PROPERTY error '{'
      { $$ = MkProperty(null, null, null, null, null); $$.loc = @$; }
   ;

property_body:
     property_start
   | property_body SETPROP compound_statement
      { $1.setStmt = $3; }
   | property_body GETPROP compound_statement
      { $1.getStmt = $3; }
   | property_body ISPROPSET compound_statement
      { $1.issetStmt = $3; }
   | property_body WATCHABLE
      { $1.isWatchable = true; }
   | property_body PROPERTY_CATEGORY i18n_string
      { $1.category = $3; }
	;

property:
   property_body '}' { $1.loc.end = @2.end; $$ = $1; }
   ;

class_property_start:
     CLASS_PROPERTY property_specifiers identifier '{'
      { $$ = MkProperty($2, null, $3, null, null); $$.loc = @$; }

   | CLASS_PROPERTY property_specifiers abstract_declarator identifier '{'
      { $$ = MkProperty($2, $3, $4, null, null); $$.loc = @$; }

   | CLASS_PROPERTY property_specifiers '{'
      { $$ = MkProperty($2, null, null, null, null); $$.loc = @$; }

   | CLASS_PROPERTY property_specifiers abstract_declarator '{'
      { $$ = MkProperty($2, $3, null, null, null); $$.loc = @$; }

   | CLASS_PROPERTY error '{'
      { $$ = MkProperty(null, null, null, null, null); $$.loc = @$; }
   ;

class_property_body:
     class_property_start
   | class_property_body SETPROP compound_statement
      { $1.setStmt = $3; }
   | class_property_body GETPROP compound_statement
      { $1.getStmt = $3; }
	;

class_property:
   class_property_body '}' { $1.loc.end = @2.end; }
   ;

watch_property_list:
	  identifier
      { $$ = MkListOne($1); }
	| watch_property_list identifier
      { ListAdd($1, $2); }
	;

property_watch:
	  watch_property_list compound_statement
      { $$ = MkPropertyWatch($1, $2); }
	| DELETE compound_statement
      { $$ = MkDeleteWatch($2); }
	;

property_watch_list:
	  property_watch
      { $$ = MkListOne($1); }
	| property_watch_list property_watch
      { ListAdd($1, $2); }
	;

self_watch_definition:
	WATCH '(' watch_property_list ')' compound_statement
      { $$ = MkPropertyWatch($3, $5); }
	;

watch_definition:
	  WATCH '(' assignment_expression ')' '{' property_watch_list '}'
        { $$ = MkWatchStmt(null, $3, $6); }
	| assignment_expression '.' WATCH '(' assignment_expression ')' '{' property_watch_list '}'
        { $$ = MkWatchStmt($1, $5, $8); }
	;

stopwatching:
	  STOPWATCHING '(' assignment_expression ',' watch_property_list ')'
        { $$ = MkStopWatchingStmt(null, $3, $5); }
	| assignment_expression '.' STOPWATCHING '(' assignment_expression ',' watch_property_list ')'
        { $$ = MkStopWatchingStmt($1, $5, $7); }
	| STOPWATCHING '(' assignment_expression ')'
        { $$ = MkStopWatchingStmt(null, $3, null); }
	| assignment_expression '.' STOPWATCHING '(' assignment_expression ')'
        { $$ = MkStopWatchingStmt($1, $5, null); }
	;

firewatchers:
	  FIREWATCHERS
        { $$ = MkFireWatchersStmt(null, null); }
	| FIREWATCHERS watch_property_list
        { $$ = MkFireWatchersStmt(null, $2); }
	| postfix_expression '.' FIREWATCHERS
        { $$ = MkFireWatchersStmt($1, null); }
	| assignment_expression '.' FIREWATCHERS watch_property_list
        { $$ = MkFireWatchersStmt($1, $4); }
	;

struct_declaration:
     struct_declaration_error ';' { $$ = $1; $$.loc.end = @2.end; }
   | default_property_list ';'     { $$ = MkClassDefDefaultProperty($1); if($1->last) ((MemberInit)$1->last).loc.end = @2.start; $$.loc = @$; }
   | class_function_definition                                       { $$ = MkClassDefFunction($1); $$.loc = @$; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
   | property                       { $$ = MkClassDefProperty($1); $$.loc = @$; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
   | member_access class_function_definition                                       { $$ = MkClassDefFunction($2); $$.loc = @$; $$.memberAccess = $1; }
   | member_access property                       { $$ = MkClassDefProperty($2); $$.loc = @$; $$.memberAccess = $1; }
   | class_property                 { $$ = MkClassDefClassProperty($1); $$.loc = @$; }
   | WATCHABLE { $$ = null; deleteWatchable = true; }
   | CLASS_NO_EXPANSION             { $$ = MkClassDefNoExpansion(); }
   | CLASS_FIXED                    { $$ = MkClassDefFixed(); }
   | CLASS_PROPERTY '(' identifier ')' '=' initializer_condition ';' { $$ = MkClassDefClassPropertyValue($3, $6); $$.loc = @$; }

   | ';' { $$ = null; }
   | member_access ':' { memberAccessStack[defaultMemberAccess] = $1; if(defaultMemberAccess == 0) { $$ = MkClassDefMemberAccess(); $$.memberAccess = $1; $$.loc = @$; } else $$ = null; }

   | member_access '(' identifier ')'     { $$ = MkClassDefAccessOverride($1, $3); $$.loc = @$; }
	;

struct_declaration_error:
     class_function_definition_error { $$ = MkClassDefFunction($1); $$.loc = $1.loc;  $$.loc.end.charPos++; $$.loc.end.pos++; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }

// Moved all these in here without the ';'
   | guess_declaration_specifiers                                { $$ = MkClassDefDeclaration(MkStructDeclaration($1, null, null)); $$.decl.loc = @$; $$.loc = @$; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
	| guess_declaration_specifiers struct_declarator_list          { $$ = MkClassDefDeclaration(MkStructDeclaration($1, $2, null)); $$.decl.loc = @$; $$.loc = @$; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
	| member_access guess_declaration_specifiers struct_declarator_list         { $$ = MkClassDefDeclaration(MkStructDeclaration($2, $3, null)); $$.decl.loc = @$; $$.loc = @$; $$.memberAccess = $1; }
   | member_access guess_declaration_specifiers                                { $$ = MkClassDefDeclaration(MkStructDeclaration($2, null, null)); $$.decl.loc = @$; $$.loc = @$; $$.memberAccess = $1; }
   | member_access instantiation_unnamed                                       { $$ = MkClassDefDeclaration(MkDeclarationClassInst($2)); $$.loc = @$; $$.decl.loc = @$; $$.memberAccess = $1; }
   | member_access guess_instantiation_named                                   { $$ = MkClassDefDeclaration(MkDeclarationClassInst($2)); $$.loc = @$; $$.decl.loc = @$; $$.memberAccess = $1; }
   | CLASS_DATA guess_declaration_specifiers struct_declarator_list { $$ = MkClassDefClassData(MkStructDeclaration($2, $3, null)); $$.decl.loc = @$; $$.loc = @$; }
   | self_watch_definition      { $$ = MkClassDefPropertyWatch($1); $$.loc = @$; }
   | CLASS_DESIGNER identifier { $$ = MkClassDefDesigner($2.string); FreeIdentifier($2); }
   | CLASS_DESIGNER strict_type { $$ = MkClassDefDesigner($2.name); FreeSpecifier($2); }
   | CLASS_DEFAULT_PROPERTY identifier { $$ = MkClassDefDesignerDefaultProperty($2); }
   | instantiation_unnamed                                       { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = @$; $$.decl.loc = @$; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
   | guess_instantiation_named                                   { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = @$; $$.decl.loc = @$; $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
   | default_property_list     { $$ = MkClassDefDefaultProperty($1); if($1->last) ((MemberInit)$1->last).loc.end = @1.end; $$.loc = @$; }

   | guess_instantiation_named_error error { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = $1.loc; $$.decl.loc = $$.loc;  $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
   | instantiation_unnamed_error error { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = $1.loc; $$.decl.loc = $$.loc;  $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
//   | guess_instantiation_named { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = $1.loc; $$.decl.loc = $$.loc;  $$.memberAccess = memberAccessStack[defaultMemberAccess]; }
//   | instantiation_unnamed { $$ = MkClassDefDeclaration(MkDeclarationClassInst($1)); $$.loc = $1.loc; $$.decl.loc = $$.loc;  $$.memberAccess = memberAccessStack[defaultMemberAccess]; }

   | member_access class_function_definition_error { $$ = MkClassDefFunction($2); $$.loc = @$;  $$.loc.end.charPos++; $$.loc.end.pos++; $$.memberAccess = $1; }
   | member_access guess_instantiation_named_error error { $$ = MkClassDefDeclaration(MkDeclarationClassInst($2)); $$.loc = @$; $$.decl.loc = $$.loc; $$.memberAccess = $1; }
   | member_access instantiation_unnamed_error error { $$ = MkClassDefDeclaration(MkDeclarationClassInst($2)); $$.loc = @$; $$.decl.loc = $$.loc; $$.memberAccess = $1; }
//   | member_access guess_instantiation_named { $$ = MkClassDefDeclaration(MkDeclarationClassInst($2)); $$.loc = @$; $$.decl.loc = $$.loc; $$.memberAccess = $1; }
//   | member_access instantiation_unnamed { $$ = MkClassDefDeclaration(MkDeclarationClassInst($2)); $$.loc = @$; $$.decl.loc = $$.loc; $$.memberAccess = $1; }

   | default_property_list_error { $$ = MkClassDefDefaultProperty($1); $$.loc = @$;  $$.loc.end.charPos++; $$.loc.end.pos++; }
   ;

struct_declaration_list:
	  struct_declaration { $$ = MkList(); ListAdd($$, $1); }
	| struct_declaration_list struct_declaration   { $$ = $1; ListAdd($1, $2); }
   | struct_declaration_list_error struct_declaration   { $$ = $1; ListAdd($1, $2); }
	;

struct_declaration_list_error:
     struct_declaration_error { yyerror(); $$ = MkList(); ListAdd($$, $1); }
   | struct_declaration_list error
   | struct_declaration_list_error error
   | struct_declaration_list struct_declaration_error { yyerror(); $$ = $1; ListAdd($$, $2); }
   | struct_declaration_list_error struct_declaration_error { $$ = $1; ListAdd($$, $2); }
	;

template_datatype:
     guess_declaration_specifiers { $$ = MkTemplateDatatype($1, null); }
   | guess_declaration_specifiers abstract_declarator { $$ = MkTemplateDatatype($1, $2); }
//   | identifier { $$ = MkTemplateDatatype(MkListOne(MkSpecifierName($1.string)), null); FreeIdentifier($1); }
   ;

template_type_argument:
//     template_datatype { $$ = MkTemplateTypeArgument($1); }

//    Explicitly copied the rules here to handle:
//      ast.ec:  Map<List<Location>> intlStrings { };
//          vs
//      LinkList.ec:   class LinkList<bool circ = false>

     guess_declaration_specifiers { $$ = MkTemplateTypeArgument(MkTemplateDatatype($1, null)); }
   | guess_declaration_specifiers abstract_declarator { $$ = MkTemplateTypeArgument(MkTemplateDatatype($1, $2)); }
   ;

template_type_parameter:
     CLASS identifier { $$ = MkTypeTemplateParameter($2, null, null); }
   | CLASS identifier '=' template_type_argument { $$ = MkTypeTemplateParameter($2, null, $4); }
   | CLASS identifier ':' template_datatype { $$ = MkTypeTemplateParameter($2, $4, null); }
   | CLASS identifier ':' template_datatype '=' template_type_argument { $$ = MkTypeTemplateParameter($2, $4, $6); }
   | CLASS base_strict_type_name { $$ = MkTypeTemplateParameter(MkIdentifier($2), null, null); delete $2; }
   | CLASS base_strict_type_name '=' template_type_argument { $$ = MkTypeTemplateParameter(MkIdentifier($2), null, $4); }
   | CLASS base_strict_type_name ':' template_datatype { $$ = MkTypeTemplateParameter(MkIdentifier($2), $4, null); }
   | CLASS base_strict_type_name ':' template_datatype '=' template_type_argument { $$ = MkTypeTemplateParameter(MkIdentifier($2), $4, $6); }
   ;

template_identifier_argument:
     identifier { $$ = MkTemplateIdentifierArgument($1); }
   ;

template_identifier_parameter:
     identifier                                  { $$ = MkIdentifierTemplateParameter($1, dataMember, null); }
   | identifier '=' template_identifier_argument { $$ = MkIdentifierTemplateParameter($1, dataMember, $3); }
   ;

template_expression_argument:
     shift_expression /*constant_expression*/ { $$ = MkTemplateExpressionArgument($1); }
   ;

template_expression_parameter:
/*
     template_datatype identifier     { $$ = MkExpressionTemplateParameter($2, $1, null); }
   | template_datatype identifier '=' template_expression_argument    { $$ = MkExpressionTemplateParameter($2, $1, $4); }
*/
     guess_declaration_specifiers identifier '=' template_expression_argument    { $$ = MkExpressionTemplateParameter($2, MkTemplateDatatype($1, null), $4); }
   | guess_declaration_specifiers abstract_declarator identifier '=' template_expression_argument    { $$ = MkExpressionTemplateParameter($3, MkTemplateDatatype($1, $2), $5); }
   ;

template_parameter:
     template_type_parameter
   | template_identifier_parameter
   | template_expression_parameter
   ;

template_parameters_list:
     template_parameter                               { $$ = MkList(); ListAdd($$, $1); }
   | template_parameters_list ',' template_parameter  { $$ = $1; ListAdd($1, $3); }
   ;

template_argument:
     template_expression_argument
   | template_identifier_argument
   | template_type_argument
   | identifier '=' template_expression_argument   { $$ = $3; $$.name = $1; $$.loc = @$; }
   | identifier '=' template_identifier_argument   { $$ = $3; $$.name = $1; $$.loc = @$; }
   | identifier '=' template_type_argument         { $$ = $3; $$.name = $1; $$.loc = @$; }
   /*| template_datatype '=' template_expression_argument
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
   }
   | template_datatype '=' template_identifier_argument
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
   }
   | template_datatype '=' template_type_argument
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
   }*/
   ;

template_arguments_list:
     template_argument                                { $$ = MkList(); ListAdd($$, $1); }
   | template_arguments_list ',' template_argument    { $$ = $1; ListAdd($1, $3); }
   ;

class_entry:
   CLASS
   {
      if(curContext != globalContext)
         PopContext(curContext);
      $$ = PushContext();
   };

class_decl:
     class_entry identifier { (void)$1; $$ = DeclClassAddNameSpace($2._class, $2.string); FreeIdentifier($2); $$.nameLoc = @2; memberAccessStack[++defaultMemberAccess] = privateAccess; }
   | class_entry base_strict_type
   {
      (void)$1; $$ = DeclClass($2.nsSpec, $2.name);
      $$.nameLoc = @2;
      FreeSpecifier($2);
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   }
   | identifier class_entry identifier { (void)$2; $$ = DeclClassAddNameSpace($3._class, $3.string); FreeIdentifier($1); FreeIdentifier($3); $$.nameLoc = @3; $$.isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; }
   | identifier class_entry base_strict_type { (void)$2; $$ = DeclClass($3.nsSpec, $3.name); FreeIdentifier($1); $$.nameLoc = @3; $$.isRemote = true; FreeSpecifier($3); memberAccessStack[++defaultMemberAccess] = privateAccess; }

   | class_entry identifier '<' template_parameters_list '>' { (void)$1; $$ = DeclClassAddNameSpace($2._class, $2.string); $$.templateParams = $4; FreeIdentifier($2); $$.nameLoc = @2; memberAccessStack[++defaultMemberAccess] = privateAccess; }
   | class_entry base_strict_type '<' template_parameters_list '>'
   {
      (void)$1; $$ = DeclClass($2.nsSpec, $2.name);
      $$.templateParams = $4;
      $$.nameLoc = @2;
      FreeSpecifier($2);
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   }
   | identifier class_entry identifier '<' template_parameters_list '>' { (void)$2; $$ = DeclClassAddNameSpace($3._class, $3.string); $$.templateParams = $5; FreeIdentifier($1); FreeIdentifier($3); $$.nameLoc = @3; $$.isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; }
   | identifier class_entry base_strict_type '<' template_parameters_list '>' { (void)$2; $$ = DeclClass($3.nsSpec, $3.name); $$.templateParams = $5; FreeIdentifier($1); $$.nameLoc = @3; $$.isRemote = true; FreeSpecifier($3); memberAccessStack[++defaultMemberAccess] = privateAccess; }
   ;

class:
     class_error '}'
      {
         $$.loc = @$;
         $$ = $1;
      }

   // Added this for unit classes...
	| class_head ';'
      {
         $$ = $1; $$.definitions = MkList(); $$.blockStart = @2;  $$.loc = @$;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }

	| class_decl '{' '}'
      {
         $$ = MkClass($1, null, MkList()); $$.blockStart = @2;  $$.loc = @$;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_head '{' '}'
      {
         $$ = $1; $$.definitions = MkList(); $$.blockStart = @2;  $$.loc = @$;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }

	| class_entry identifier ';'
      {
         (void)$1; $$ = MkClass(DeclClassAddNameSpace($2._class, $2.string), null, null); FreeIdentifier($2);
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_entry type ';'
      {
         (void)$1; $$ = MkClass(DeclClass($2.nsSpec, $2.name), null, null); FreeSpecifier($2);
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
   ;

class_head:
	class_decl ':' inheritance_specifiers
      {
         $$ = MkClass($1, $3, null);
      }
   ;

class_error:
	 class_decl '{' struct_declaration_list_error
      {
         $$ = MkClass($1, null, $3); $$.deleteWatchable = deleteWatchable; deleteWatchable = false; $$.blockStart = @2; $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_head '{' struct_declaration_list_error
      {
         $$ = $1; $$.definitions = $3; $$.deleteWatchable = deleteWatchable; deleteWatchable = false; $$.blockStart = @2;  $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_decl '{' struct_declaration_list
      {
         $$ = MkClass($1, null, $3); $$.deleteWatchable = deleteWatchable; deleteWatchable = false; $$.blockStart = @2; $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_head '{' struct_declaration_list
      {
         $$ = $1; $$.definitions = $3; $$.deleteWatchable = deleteWatchable; deleteWatchable = false; $$.blockStart = @2;  $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_decl '{' error
      {
         $$ = MkClass($1, null, MkList()); $$.deleteWatchable = deleteWatchable; deleteWatchable = false; $$.blockStart = @2;  $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
	| class_head '{' error
      {
         $$ = $1; $$.definitions = MkList(); $$.deleteWatchable = deleteWatchable; deleteWatchable = false; $$.blockStart = @2;  $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      }
   ;

/**** EXPRESSIONS ********************************************************************/

identifier:
   IDENTIFIER
      { $$ = MkIdentifier(yytext); $$.loc = @1; }
   ;

primary_expression:
     simple_primary_expression
	| '(' expression ')'
      { $$ = MkExpBrackets($2); $$.loc = @$; }
   ;

i18n_string:
	  string_literal     { $$ = MkExpString($1); delete $1; $$.loc = @$; }
   | '$' string_literal     { $$ = MkExpIntlString($2, null); delete $2; $$.loc = @$; }
   | '$' string_literal '.' string_literal     { $$ = MkExpIntlString($4, $2); delete $2; delete $4; $$.loc = @$; }
   ;

constant:
   CONSTANT { $$ = MkExpConstant(yytext); $$.loc = @$; }
   ;

simple_primary_expression:
	  identifier         { $$ = MkExpIdentifier($1); $$.loc = @$; }
   | instantiation_unnamed      { $$ = MkExpInstance($1); $$.loc = @$; }
   | EXTENSION '(' compound_statement ')'    { $$ = MkExpExtensionCompound($3); $$.loc = @$; }
   | EXTENSION '(' expression ')'    { $$ = MkExpExtensionExpression($3); $$.loc = @$; }
   | EXTENSION '(' type_name ')' initializer     { $$ = MkExpExtensionInitializer($3, $5); $$.loc = @$; }
   | EXTENSION '(' type_name ')' '(' type_name ')' initializer     { $$ = MkExpExtensionInitializer($3, MkInitializerAssignment(MkExpExtensionInitializer($6, $8))); $$.loc = @$; }
   | constant identifier
   {
      char * constant = $1.constant;
      int len = strlen(constant);
      if(constant[len-1] == '.')
      {
         constant[len-1] = 0;
         $$ = MkExpMember($1, $2);
         $$.loc = @$;
      }
      else
         yyerror();
   }
	| constant { $$ = $1; }
   | i18n_string
   | WIDE_STRING_LITERAL { $$ = MkExpWideString(yytext); $$.loc = @$; }
   | '(' ')' { Expression exp = MkExpDummy(); exp.loc.start = @1.end; exp.loc.end = @2.start; $$ = MkExpBrackets(MkListOne(exp)); $$.loc = @$; yyerror(); }
   | NEWOP new_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpNew(MkTypeName($2,$3), $5); $$.loc = @$; }
   | NEWOP new_specifiers abstract_declarator_noarray '[' constant_expression_error ']' { $$ = MkExpNew(MkTypeName($2,$3), $5); $$.loc = @$; }
   | NEWOP new_specifiers '[' constant_expression ']' { $$ = MkExpNew(MkTypeName($2,null), $4); $$.loc = @$; }
   | NEWOP new_specifiers '[' constant_expression_error ']' { $$ = MkExpNew(MkTypeName($2,null), $4); $$.loc = @$; }
   | NEW0OP new_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpNew0(MkTypeName($2,$3), $5); $$.loc = @$; }
   | NEW0OP new_specifiers abstract_declarator_noarray '[' constant_expression_error ']' { $$ = MkExpNew0(MkTypeName($2,$3), $5); $$.loc = @$; }
   | NEW0OP new_specifiers '[' constant_expression ']' { $$ = MkExpNew0(MkTypeName($2,null), $4); $$.loc = @$; }
   | NEW0OP new_specifiers '[' constant_expression_error ']' { $$ = MkExpNew0(MkTypeName($2,null), $4); $$.loc = @$; }
   | RENEW constant_expression renew_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpRenew($2, MkTypeName($3,$4), $6); $$.loc = @$; }
   | RENEW constant_expression renew_specifiers abstract_declarator_noarray '[' constant_expression_error ']' { $$ = MkExpRenew($2, MkTypeName($3,$4), $6); $$.loc = @$; }
   | RENEW constant_expression renew_specifiers '[' constant_expression ']' { $$ = MkExpRenew($2, MkTypeName($3,null), $5); $$.loc = @$; }
   | RENEW constant_expression renew_specifiers '[' constant_expression_error ']' { $$ = MkExpRenew($2, MkTypeName($3,null), $5); $$.loc = @$; }
   | RENEW0 constant_expression renew_specifiers abstract_declarator_noarray '[' constant_expression ']' { $$ = MkExpRenew0($2, MkTypeName($3,$4), $6); $$.loc = @$; }
   | RENEW0 constant_expression renew_specifiers abstract_declarator_noarray '[' constant_expression_error ']' { $$ = MkExpRenew0($2, MkTypeName($3,$4), $6); $$.loc = @$; }
   | RENEW0 constant_expression renew_specifiers '[' constant_expression ']' { $$ = MkExpRenew0($2, MkTypeName($3,null), $5); $$.loc = @$; }
   | RENEW0 constant_expression renew_specifiers '[' constant_expression_error ']' { $$ = MkExpRenew0($2, MkTypeName($3,null), $5); $$.loc = @$; }
   | CLASS '(' declaration_specifiers ')' { $$ = MkExpClass($3, null); $$.loc = @$; }
   | CLASS '(' declaration_specifiers abstract_declarator ')' { $$ = MkExpClass($3, $4); $$.loc = @$; }
   | CLASS '(' identifier ')' { $$ = MkExpClass(MkListOne(MkSpecifierName($3.string)), null); FreeIdentifier($3); $$.loc = @$; }
   | VAARG '(' assignment_expression ',' type_name ')' { $$ = MkExpVaArg($3, $5); $$.loc = @$; }
   | CLASS_DATA '(' identifier ')' { $$ = MkExpClassData($3); $$.loc = @$; }
   | database_open
   | dbfield
   | dbindex
   | dbtable

   | '[' argument_expression_list /*expression*/ ']' { $$ = MkExpArray($2); $$.loc = @$; }
   | '[' ']' { $$ = MkExpArray(null); $$.loc = @$; }
   ;

anon_instantiation_expression:
   instantiation_anon            { $$ = MkExpInstance($1); $$.loc = @$; }
   ;

anon_instantiation_expression_error:
   instantiation_anon_error error           { $$ = MkExpInstance($1); $$.loc = @$; }
   ;

primary_expression_error:
	  '(' expression  { yyerror(); $$ = MkExpBrackets($2); $$.loc = @$; }
   | '(' expression_error { $$ = MkExpBrackets($2); $$.loc = @$; }
   ;

postfix_expression:
	  primary_expression

   | postfix_expression '[' expression ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
   | postfix_expression '[' expression_error ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
	| postfix_expression '(' ')'                          { $$ = MkExpCall($1, MkList()); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; }
	| postfix_expression '(' argument_expression_list ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.loc = @$; }
   | postfix_expression '(' argument_expression_list_error ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.loc = @$; if($3->last) ((Expression)$3->last).loc.end = @4.start; }
	| postfix_expression '.' identifier                   { $$ = MkExpMember($1, $3); $$.loc = @$; }
	| postfix_expression PTR_OP identifier                { $$ = MkExpPointer($1, $3); $$.loc = @$; }
	| postfix_expression INC_OP                           { $$ = MkExpOp($1, INC_OP, null); $$.loc = @$; }
	| postfix_expression DEC_OP                           { $$ = MkExpOp($1, DEC_OP, null); $$.loc = @$; }

   | postfix_expression_error '[' expression ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
   | postfix_expression_error '[' expression_error ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
	| postfix_expression_error '(' ')'                          { $$ = MkExpCall($1, MkList()); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; }
	| postfix_expression_error '(' argument_expression_list ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end;$$.loc = @$; }
	| postfix_expression_error '.' identifier                   { $$ = MkExpMember($1, $3); $$.loc = @$; }
	| postfix_expression_error PTR_OP identifier                { $$ = MkExpPointer($1, $3); $$.loc = @$; }
	| postfix_expression_error INC_OP                           { $$ = MkExpOp($1, INC_OP, null); $$.loc = @$; }
	| postfix_expression_error DEC_OP                           { $$ = MkExpOp($1, DEC_OP, null); $$.loc = @$; }
;

/*simple_postfix_expression:
	  simple_primary_expression

   | simple_postfix_expression '[' expression ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
   | simple_postfix_expression '[' expression_error ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
	| simple_postfix_expression '(' ')'                          { $$ = MkExpCall($1, MkList()); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; }
	| simple_postfix_expression '(' argument_expression_list ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.loc = @$; }
   | simple_postfix_expression '(' argument_expression_list_error ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.loc = @$; if($3->last) ((Expression)$3->last).loc.end = @4.start; }
	| simple_postfix_expression '.' identifier                   { $$ = MkExpMember($1, $3); $$.loc = @$; }
	| simple_postfix_expression PTR_OP identifier                { $$ = MkExpPointer($1, $3); $$.loc = @$; }
	| simple_postfix_expression INC_OP                           { $$ = MkExpOp($1, INC_OP, null); $$.loc = @$; }
	| simple_postfix_expression DEC_OP                           { $$ = MkExpOp($1, DEC_OP, null); $$.loc = @$; }

   | simple_postfix_expression_error '[' expression ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
   | simple_postfix_expression_error '[' expression_error ']'               { $$ = MkExpIndex($1, $3); $$.loc = @$; }
	| simple_postfix_expression_error '(' ')'                          { $$ = MkExpCall($1, MkList()); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; }
	| simple_postfix_expression_error '(' argument_expression_list ')' { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end;$$.loc = @$; }
	| simple_postfix_expression_error '.' identifier                   { $$ = MkExpMember($1, $3); $$.loc = @$; }
	| simple_postfix_expression_error PTR_OP identifier                { $$ = MkExpPointer($1, $3); $$.loc = @$; }
	| simple_postfix_expression_error INC_OP                           { $$ = MkExpOp($1, INC_OP, null); $$.loc = @$; }
	| simple_postfix_expression_error DEC_OP                           { $$ = MkExpOp($1, DEC_OP, null); $$.loc = @$; }
;*/

argument_expression_list:
	  assignment_expression          { $$ = MkList(); ListAdd($$, $1); }
   | anon_instantiation_expression  { $$ = MkList(); ListAdd($$, $1); }
	| argument_expression_list ',' assignment_expression   { $$ = $1; ListAdd($1, $3);  }
   | argument_expression_list ',' anon_instantiation_expression   { $$ = $1; ListAdd($1, $3);  }
	;

argument_expression_list_error:
     assignment_expression_error    { $$ = MkList(); ListAdd($$, $1); }
   | anon_instantiation_expression_error    { $$ = MkList(); ListAdd($$, $1); }
   | argument_expression_list ',' assignment_expression_error  { $$ = $1; ListAdd($1, $3);  }
   | argument_expression_list ',' anon_instantiation_expression_error  { $$ = $1; ListAdd($1, $3);  }
   | argument_expression_list ',' { Expression exp = MkExpDummy(); yyerror(); exp.loc.start = @2.end; exp.loc.end = @2.end; $$ = $1; ListAdd($1, exp); }
	;

common_unary_expression:
	  INC_OP unary_expression           { $$ = MkExpOp(null, INC_OP, $2); $$.loc = @$; }
	| DEC_OP unary_expression           { $$ = MkExpOp(null, DEC_OP, $2); $$.loc = @$; }
	| unary_operator cast_expression    { $$ = MkExpOp(null, $1, $2); $$.loc = @$; }
   | unary_operator anon_instantiation_expression    { $$ = MkExpOp(null, $1, $2); $$.loc = @$; }
	//| SIZEOF '(' unary_expression ')'         { $$ = MkExpOp(null, SIZEOF, $3); $$.loc = @$; }
   | SIZEOF unary_expression           { $$ = MkExpOp(null, SIZEOF, $2); $$.loc = @$; }
   | SIZEOF '(' guess_type_name ')'          { $$ = MkExpTypeSize($3); $$.loc = @$; }
   | SIZEOF '(' CLASS type ')'          { $$ = MkExpClassSize($4); $$.loc = @$; }
   | SIZEOF '(' CLASS guess_type ')'          { $$ = MkExpClassSize($4); $$.loc = @$; }

	//| ALIGNOF '(' unary_expression ')'         { $$ = MkExpOp(null, ALIGNOF, $3); $$.loc = @$; }
   | ALIGNOF unary_expression           { $$ = MkExpOp(null, ALIGNOF, $2); $$.loc = @$; }
   | ALIGNOF '(' guess_type_name ')'          { $$ = MkExpTypeAlign($3); $$.loc = @$; }

   | BUILTIN_OFFSETOF '(' guess_type_name ',' identifier ')'      { $$ = MkExpOffsetOf($3, $5); $$.loc = @$; }
	;

unary_expression:
       common_unary_expression
	  | postfix_expression
	;
/*
?:
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
   | _INCREF  { $$ = _INCREF; }
	;

cast_expression:
       unary_expression
   | '(' type_name ')' initializer_noexp  { $$ = MkExpExtensionInitializer($2, $4); $$.loc = @$; }
	| '(' type_name ')' cast_expression    { $$ = MkExpCast($2, $4); $$.loc = @$; }
	;

multiplicative_expression:
	  cast_expression
	| multiplicative_expression '*' cast_expression { $$ = MkExpOp($1, '*', $3); $$.loc = @$; }
	| multiplicative_expression '/' cast_expression { $$ = MkExpOp($1, '/', $3); $$.loc = @$; }
	| multiplicative_expression '%' cast_expression { $$ = MkExpOp($1, '%', $3); $$.loc = @$; }
	| multiplicative_expression_error '*' cast_expression { $$ = MkExpOp($1, '*', $3); $$.loc = @$; }
	| multiplicative_expression_error '/' cast_expression { $$ = MkExpOp($1, '/', $3); $$.loc = @$; }
	| multiplicative_expression_error '%' cast_expression { $$ = MkExpOp($1, '%', $3); $$.loc = @$; }
	;

additive_expression:
	  multiplicative_expression
	| additive_expression '+' multiplicative_expression  { $$ = MkExpOp($1, '+', $3); $$.loc = @$; }
	| additive_expression '-' multiplicative_expression  { $$ = MkExpOp($1, '-', $3); $$.loc = @$; }
	| additive_expression_error '+' multiplicative_expression  { $$ = MkExpOp($1, '+', $3); $$.loc = @$; }
	| additive_expression_error '-' multiplicative_expression  { $$ = MkExpOp($1, '-', $3); $$.loc = @$; }
	;

shift_expression:
	  additive_expression
	| shift_expression LEFT_OP additive_expression  { $$ = MkExpOp($1, LEFT_OP, $3); $$.loc = @$; }
	| shift_expression RIGHT_OP additive_expression { $$ = MkExpOp($1, RIGHT_OP, $3); $$.loc = @$; }
	| shift_expression_error LEFT_OP additive_expression  { $$ = MkExpOp($1, LEFT_OP, $3); $$.loc = @$; }
	| shift_expression_error RIGHT_OP additive_expression { $$ = MkExpOp($1, RIGHT_OP, $3); $$.loc = @$; }
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
	| relational_expression_error '<' shift_expression    { $$ = MkExpOp($1, '<', $3); $$.loc = @$; }
	| relational_expression_error '>' shift_expression    { $$ = MkExpOp($1, '>', $3); $$.loc = @$; }
	| relational_expression_error LE_OP shift_expression  { $$ = MkExpOp($1, LE_OP, $3); $$.loc = @$; }
	| relational_expression_error GE_OP shift_expression  { $$ = MkExpOp($1, GE_OP, $3); $$.loc = @$; }
	;

equality_expression
	: relational_expression
	| equality_expression EQ_OP relational_expression  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	| equality_expression NE_OP relational_expression  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
	| equality_expression_error EQ_OP relational_expression  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	| equality_expression_error NE_OP relational_expression  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }

	| equality_expression EQ_OP anon_instantiation_expression  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	| equality_expression NE_OP anon_instantiation_expression  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
	| equality_expression_error EQ_OP anon_instantiation_expression  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	| equality_expression_error NE_OP anon_instantiation_expression  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
	;

and_expression
	: equality_expression
	| and_expression '&' equality_expression  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
	| and_expression_error '&' equality_expression  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }

	| and_expression '&' anon_instantiation_expression  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
	| and_expression_error '&' anon_instantiation_expression  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
	;

exclusive_or_expression
	: and_expression
	| exclusive_or_expression '^' and_expression { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
	| exclusive_or_expression_error '^' and_expression { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }

	| exclusive_or_expression '^' anon_instantiation_expression { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
	| exclusive_or_expression_error '^' anon_instantiation_expression { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
	;

inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression '|' exclusive_or_expression { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
	| inclusive_or_expression_error '|' exclusive_or_expression { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }

	| inclusive_or_expression '|' anon_instantiation_expression { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
	| inclusive_or_expression_error '|' anon_instantiation_expression { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
	;

logical_and_expression
	: inclusive_or_expression
	| logical_and_expression AND_OP inclusive_or_expression  { $$ = MkExpOp($1, AND_OP, $3); $$.loc = @$; }
	| logical_and_expression_error AND_OP inclusive_or_expression  { $$ = MkExpOp($1, AND_OP, $3); $$.loc = @$; }
	;

logical_or_expression
	: logical_and_expression
	| logical_or_expression OR_OP logical_and_expression     { $$ = MkExpOp($1, OR_OP, $3); $$.loc = @$; }
	| logical_or_expression_error OR_OP logical_and_expression     { $$ = MkExpOp($1, OR_OP, $3); $$.loc = @$; }
	;

conditional_expression
	: logical_or_expression
	| logical_or_expression '?' expression ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_error ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_error ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }

	| logical_or_expression '?' expression_anon_inst ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_anon_inst_error ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression_anon_inst ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_anon_inst_error ':' conditional_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }

	| logical_or_expression '?' expression ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_error ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_error ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }

	| logical_or_expression '?' expression_anon_inst ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_anon_inst_error ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression_anon_inst ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_anon_inst_error ':' anon_instantiation_expression { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	;

assignment_expression:
	  conditional_expression
	| unary_expression assignment_operator assignment_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   | unary_expression_error assignment_operator assignment_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
	| conditional_expression assignment_operator assignment_expression   { Compiler_Error($"l-value expected\n"); $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   | conditional_expression_error assignment_operator assignment_expression   { Compiler_Error($"l-value expected\n"); $$ = MkExpOp($1, $2, $3); $$.loc = @$; }

	| unary_expression assignment_operator anon_instantiation_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   | unary_expression_error assignment_operator anon_instantiation_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
	| conditional_expression assignment_operator anon_instantiation_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   | conditional_expression_error assignment_operator anon_instantiation_expression   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
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
   | expression_error ',' assignment_expression  { $$ = $1; ListAdd($1, $3); }
   | expression_error  ')'
	;

expression_anon_inst:
     anon_instantiation_expression                 { $$ = MkList(); ListAdd($$, $1); }
   | expression ',' anon_instantiation_expression  { $$ = $1; ListAdd($1, $3); }
	| expression_error ',' anon_instantiation_expression  { $$ = $1; ListAdd($1, $3); }
   ;

postfix_expression_error:
   primary_expression_error
   | error { $$ = MkExpDummy(); $$.loc = @$; /*printf("Sorry, didn't mean that syntax error\n");*/ }
   | postfix_expression error
   | instantiation_unnamed_error error { $$ = MkExpInstance($1); $$.loc = @$; }

   | postfix_expression PTR_OP error                { $$ = MkExpPointer($1, null); $$.loc = @$; }
   | postfix_expression_error PTR_OP error                { $$ = MkExpPointer($1, null); $$.loc = @$; }

   | postfix_expression '(' argument_expression_list { yyerror(); $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; $$.call.argLoc.end.charPos++;}
	| postfix_expression '(' argument_expression_list_error { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; $$.call.argLoc.end.charPos++;}
   /* Useless rules due to conflicts
   | postfix_expression '(' argument_expression_list ',' error { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end;$$.loc = @$; $$.call.argLoc.end.charPos++;}
   | postfix_expression '(' error { $$ = MkExpCall($1, MkList() ); @$.end = yylloc.start; $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = yylloc.start; }
   */
   | postfix_expression '.' error                   { $$ = MkExpMember($1, null); $$.loc = @$; }

	| postfix_expression_error '(' argument_expression_list_error { $$ = MkExpCall($1, $3); $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.call.argLoc.end.charPos++;}
   /* Useless rules due to conflicts
   | postfix_expression_error '(' argument_expression_list ',' error { $$ = MkExpCall($1, $3); $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.call.argLoc.end.charPos++;}
   | postfix_expression_error '(' error { $$ = MkExpCall($1, MkList() ); $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @2.end; $$.call.argLoc.end.charPos++;}
   */
   | postfix_expression_error '.' error                   { $$ = MkExpMember($1, null); $$.loc = @$; }
	;

/*simple_postfix_expression_error:
      error { $$ = MkExpDummy(); $$.loc = @$; }
   | simple_postfix_expression error
   | instantiation_unnamed_error error { $$ = MkExpInstance($1); $$.loc = @$; }

   | simple_postfix_expression PTR_OP error                { $$ = MkExpPointer($1, null); $$.loc = @$; }
   | simple_postfix_expression_error PTR_OP error                { $$ = MkExpPointer($1, null); $$.loc = @$; }

   | simple_postfix_expression '(' argument_expression_list { yyerror(); $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; $$.call.argLoc.end.charPos++;}
	| simple_postfix_expression '(' argument_expression_list_error { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.loc = @$; $$.call.argLoc.end.charPos++;}
   // Useless rules due to conflicts
   //| simple_postfix_expression '(' argument_expression_list ',' error { $$ = MkExpCall($1, $3); $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end;$$.loc = @$; $$.call.argLoc.end.charPos++;}
   //| simple_postfix_expression '(' error { $$ = MkExpCall($1, MkList() ); @$.end = yylloc.start; $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = yylloc.start; }

   | simple_postfix_expression '.' error                   { $$ = MkExpMember($1, null); $$.loc = @$; }

	| simple_postfix_expression_error '(' argument_expression_list_error { $$ = MkExpCall($1, $3); $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @3.end; $$.call.argLoc.end.charPos++;}
   // Useless rules due to conflicts
   //| simple_postfix_expression_error '(' argument_expression_list ',' error { $$ = MkExpCall($1, $3); $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @4.end; $$.call.argLoc.end.charPos++;}
   //| simple_postfix_expression_error '(' error { $$ = MkExpCall($1, MkList() ); $$.loc = @$; $$.call.argLoc.start = @2.start; $$.call.argLoc.end = @2.end; $$.call.argLoc.end.charPos++;}
   | simple_postfix_expression_error '.' error                   { $$ = MkExpMember($1, null); $$.loc = @$; }
	;
*/

common_unary_expression_error:
	   INC_OP unary_expression_error           { $$ = MkExpOp(null, INC_OP, $2); $$.loc = @$; }
	 | DEC_OP unary_expression_error           { $$ = MkExpOp(null, DEC_OP, $2); $$.loc = @$; }
	 | unary_operator cast_expression_error    { $$ = MkExpOp(null, $1, $2); $$.loc = @$; }
    | unary_operator anon_instantiation_expression_error    { $$ = MkExpOp(null, $1, $2); $$.loc = @$; }
    //| SIZEOF '(' unary_expression_error           { $$ = MkExpOp(null, SIZEOF, $3); $$.loc = @$; }
	 | SIZEOF unary_expression_error           { $$ = MkExpOp(null, SIZEOF, $2); $$.loc = @$; }
	 | SIZEOF '(' guess_type_name ')' error          { $$ = MkExpTypeSize($3); $$.loc = @$; }
    | SIZEOF '(' CLASS type ')' error   { $$ = MkExpClassSize($4); $$.loc = @$; }
    | SIZEOF '(' CLASS guess_type ')' error   { $$ = MkExpClassSize($4); $$.loc = @$; }
    //| ALIGNOF '(' unary_expression_error           { $$ = MkExpOp(null, ALIGNOF, $3); $$.loc = @$; }
	 | ALIGNOF unary_expression_error           { $$ = MkExpOp(null, ALIGNOF, $2); $$.loc = @$; }
	 | ALIGNOF '(' guess_type_name ')' error          { $$ = MkExpTypeAlign($3); $$.loc = @$; }
	;

unary_expression_error:
     common_unary_expression_error
	| postfix_expression_error
   ;

/*simple_unary_expression_error:
     common_unary_expression_error
	| simple_postfix_expression_error
   ;*/

cast_expression_error:
     unary_expression_error
	| '(' type_name ')' cast_expression_error    { $$ = MkExpCast($2, $4); $$.loc = @$; }
	;

multiplicative_expression_error:
     cast_expression_error
	| multiplicative_expression '*' cast_expression_error { $$ = MkExpOp($1, '*', $3); $$.loc = @$; }
	| multiplicative_expression '/' cast_expression_error { $$ = MkExpOp($1, '/', $3); $$.loc = @$; }
	| multiplicative_expression '%' cast_expression_error { $$ = MkExpOp($1, '%', $3); $$.loc = @$; }
	| multiplicative_expression_error '*' cast_expression_error { $$ = MkExpOp($1, '*', $3); $$.loc = @$; }
	| multiplicative_expression_error '/' cast_expression_error { $$ = MkExpOp($1, '/', $3); $$.loc = @$; }
	| multiplicative_expression_error '%' cast_expression_error { $$ = MkExpOp($1, '%', $3); $$.loc = @$; }
	;

additive_expression_error:
    multiplicative_expression_error
	| additive_expression '+' multiplicative_expression_error  { $$ = MkExpOp($1, '+', $3); $$.loc = @$; }
   /* Useless rules due to conflicts
	| additive_expression '+' error { $$ = MkExpOp($1, '+', null); $$.loc = @$; }
   */
	| additive_expression '-' multiplicative_expression_error  { $$ = MkExpOp($1, '-', $3); $$.loc = @$; }
   /* Useless rules due to conflicts
   | additive_expression '-' error { $$ = MkExpOp($1, '-', null); $$.loc = @$; }
   */
	| additive_expression_error '+' multiplicative_expression_error  { $$ = MkExpOp($1, '+', $3); $$.loc = @$; }
   /* Useless rules due to conflicts
	| additive_expression_error '+' error { $$ = MkExpOp($1, '+', null); $$.loc = @$; }
   */
	| additive_expression_error '-' multiplicative_expression_error  { $$ = MkExpOp($1, '-', $3); $$.loc = @$; }
   /* Useless rules due to conflicts
   | additive_expression_error '-' error { $$ = MkExpOp($1, '-', null); $$.loc = @$; }
   */
	;

shift_expression_error:
     additive_expression_error
	| shift_expression LEFT_OP additive_expression_error  { $$ = MkExpOp($1, LEFT_OP, $3); $$.loc = @$; }
	| shift_expression RIGHT_OP additive_expression_error { $$ = MkExpOp($1, RIGHT_OP, $3); $$.loc = @$; }
	| shift_expression_error LEFT_OP additive_expression_error  { $$ = MkExpOp($1, LEFT_OP, $3); $$.loc = @$; }
	| shift_expression_error RIGHT_OP additive_expression_error { $$ = MkExpOp($1, RIGHT_OP, $3); $$.loc = @$; }
	;

relational_expression_error:
     shift_expression_error
	| relational_expression_smaller_than /*relational_expression '<' */ shift_expression_error
   {
      if($1.type == identifierExp)
      {
         _DeclClass($1.identifier._class, $1.identifier.string);

         // printf("Declaring Class %s\n", $1.identifier.string);
         skipErrors = false;

         FreeExpression($1);
         FreeExpression($2);

         fileInput.Seek(@1.start.pos, start);
         resetScannerPos(&@1.start);
         yyclearin;

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
/*
         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
*/
         yyerrok;

         goto yysetstate;
      }
      else
      {
         $$ = MkExpOp($1, '<', $2);
         $$.loc = @$;
      }
      skipErrors = false;
   }
	| relational_expression '>' shift_expression_error    { $$ = MkExpOp($1, '>', $3); $$.loc = @$; }
	| relational_expression LE_OP shift_expression_error  { $$ = MkExpOp($1, LE_OP, $3); $$.loc = @$; }
	| relational_expression GE_OP shift_expression_error  { $$ = MkExpOp($1, GE_OP, $3); $$.loc = @$; }
	| relational_expression_error '<' shift_expression_error    { $$ = MkExpOp($1, '<', $3); $$.loc = @$; }
	| relational_expression_error '>' shift_expression_error    { $$ = MkExpOp($1, '>', $3); $$.loc = @$; }
	| relational_expression_error LE_OP shift_expression_error  { $$ = MkExpOp($1, LE_OP, $3); $$.loc = @$; }
	| relational_expression_error GE_OP shift_expression_error  { $$ = MkExpOp($1, GE_OP, $3); $$.loc = @$; }
	;

equality_expression_error:
       relational_expression_error
     | equality_expression EQ_OP relational_expression_error  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	  | equality_expression NE_OP relational_expression_error  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
     | equality_expression_error EQ_OP relational_expression_error  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	  | equality_expression_error NE_OP relational_expression_error  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
     /* Useless rules due to conflicts
     | equality_expression EQ_OP error        { $$ = MkExpOp($1, EQ_OP, MkExpDummy()); $$.loc = @$; }
	  | equality_expression NE_OP error        { $$ = MkExpOp($1, NE_OP, MkExpDummy()); $$.loc = @$; }
     | equality_expression_error EQ_OP error  { $$ = MkExpOp($1, EQ_OP, MkExpDummy()); $$.loc = @$; }
	  | equality_expression_error NE_OP error  { $$ = MkExpOp($1, NE_OP, MkExpDummy()); $$.loc = @$; }
     */
     | equality_expression EQ_OP anon_instantiation_expression_error  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	  | equality_expression NE_OP anon_instantiation_expression_error  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
     | equality_expression_error EQ_OP anon_instantiation_expression_error  { $$ = MkExpOp($1, EQ_OP, $3); $$.loc = @$; }
	  | equality_expression_error NE_OP anon_instantiation_expression_error  { $$ = MkExpOp($1, NE_OP, $3); $$.loc = @$; }
	;

and_expression_error:
   equality_expression_error
	| and_expression '&' equality_expression_error  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
   | and_expression_error '&' equality_expression_error  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }

	| and_expression '&' anon_instantiation_expression_error  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
   | and_expression_error '&' anon_instantiation_expression_error  { $$ = MkExpOp($1, '&', $3); $$.loc = @$; }
	;

exclusive_or_expression_error:
   and_expression_error
	| exclusive_or_expression '^' and_expression_error { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
   | exclusive_or_expression_error '^' and_expression_error { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }

	| exclusive_or_expression '^' anon_instantiation_expression_error { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
   | exclusive_or_expression_error '^' anon_instantiation_expression_error { $$ = MkExpOp($1, '^', $3); $$.loc = @$; }
	;

inclusive_or_expression_error:
     exclusive_or_expression_error
	| inclusive_or_expression '|' exclusive_or_expression_error { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
   | inclusive_or_expression_error '|' exclusive_or_expression_error { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }

	| inclusive_or_expression '|' anon_instantiation_expression_error { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
   | inclusive_or_expression_error '|' anon_instantiation_expression_error { $$ = MkExpOp($1, '|', $3); $$.loc = @$; }
	;

logical_and_expression_error:
   inclusive_or_expression_error
	| logical_and_expression AND_OP inclusive_or_expression_error  { $$ = MkExpOp($1, AND_OP, $3); $$.loc = @$; }
   | logical_and_expression_error AND_OP inclusive_or_expression_error  { $$ = MkExpOp($1, AND_OP, $3); $$.loc = @$; }
	;

logical_or_expression_error:
     logical_and_expression_error
   | logical_or_expression OR_OP logical_and_expression_error     { $$ = MkExpOp($1, OR_OP, $3); $$.loc = @$; }
	| logical_or_expression_error OR_OP logical_and_expression_error     { $$ = MkExpOp($1, OR_OP, $3); $$.loc = @$; }
	;

conditional_expression_error:
    logical_or_expression_error
	| logical_or_expression '?' expression ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_error ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_error ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression '?' expression ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }
   | logical_or_expression '?' expression_error ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }
	| logical_or_expression_error '?' expression ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }
   | logical_or_expression_error '?' expression_error ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }

	| logical_or_expression '?' expression_anon_inst ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_anon_inst_error ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression_anon_inst ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_anon_inst_error ':' logical_or_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression '?' expression_anon_inst ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }
   | logical_or_expression '?' expression_anon_inst_error ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }
	| logical_or_expression_error '?' expression_anon_inst ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }
   | logical_or_expression_error '?' expression_anon_inst_error ':' { $$ = MkExpCondition($1, $3, MkExpDummy()); $$.loc = @$; $$.cond.elseExp.loc = @3; }

	| logical_or_expression '?' expression ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_error ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_error ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }

	| logical_or_expression '?' expression_anon_inst ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression '?' expression_anon_inst_error ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
	| logical_or_expression_error '?' expression_anon_inst ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }
   | logical_or_expression_error '?' expression_anon_inst_error ':' anon_instantiation_expression_error { $$ = MkExpCondition($1, $3, $5); $$.loc = @$; }

	| logical_or_expression '?' ':'
      {
         yyerror();
         $$ = MkExpCondition($1, MkListOne(MkExpDummy()), MkExpDummy());
         $$.loc = @$;
         ((Expression)$$.cond.exp->last).loc = @2;
         $$.cond.elseExp.loc = @3;
      }
   | logical_or_expression_error '?' ':'
      {
         $$ = MkExpCondition($1, MkListOne(MkExpDummy()), MkExpDummy()); $$.loc = @$; ((Expression)$$.cond.exp->last).loc = @2; $$.cond.elseExp.loc = @3;
      }
   | logical_or_expression '?'
      {
         yyerror();
         $$ = MkExpCondition($1, MkListOne(MkExpDummy()), MkExpDummy()); $$.loc = @$; ((Expression)$$.cond.exp->last).loc = @2; $$.cond.elseExp.loc = @2;
      }
   | logical_or_expression_error '?'
      {
         $$ = MkExpCondition($1, MkListOne(MkExpDummy()), MkExpDummy()); $$.loc = @$; ((Expression)$$.cond.exp->last).loc = @2; $$.cond.elseExp.loc = @2;
      }
   ;

assignment_expression_error:
     conditional_expression_error
   | unary_expression assignment_operator assignment_expression_error   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   /* Useless rules due to conflicts
   | unary_expression assignment_operator error   { $$ = MkExpOp($1, $2, MkExpDummy()); $$.loc = @$; $$.op.exp2.loc = @2; }
   */
   | unary_expression_error assignment_operator assignment_expression_error   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   /* Useless rules due to conflicts
   | unary_expression_error assignment_operator error   { $$ = MkExpOp($1, $2, MkExpDummy()); $$.loc = @$; $$.op.exp2.loc = @2; }
   */

   | unary_expression assignment_operator anon_instantiation_expression_error   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
   | unary_expression_error assignment_operator anon_instantiation_expression_error   { $$ = MkExpOp($1, $2, $3); $$.loc = @$; }
	;

expression_error:
     assignment_expression_error                 { $$ = MkList(); ListAdd($$, $1); }
   | assignment_expression error                 { $$ = MkList(); ListAdd($$, $1); }
   | expression ',' assignment_expression_error  { $$ = $1; ListAdd($1, $3); }
	| expression_error ',' assignment_expression_error  { $$ = $1; ListAdd($1, $3); }
   /* Useless rules due to conflicts
   | expression ',' error
   | expression_error ',' error
   | expression error
   */
   | expression expression                      { yyerror(); $$ = $1; FreeList($2, FreeExpression); }
   | expression_error expression                { $$ = $1; FreeList($2, FreeExpression); }
   | expression expression_error                { $$ = $1; FreeList($2, FreeExpression); }
   ;

expression_anon_inst_error:
     anon_instantiation_expression_error                 { $$ = MkList(); ListAdd($$, $1); }
   | anon_instantiation_expression error                 { $$ = MkList(); ListAdd($$, $1); }
   | expression ',' anon_instantiation_expression_error  { $$ = $1; ListAdd($1, $3); }
	| expression_error ',' anon_instantiation_expression_error  { $$ = $1; ListAdd($1, $3); }
   ;


constant_expression: conditional_expression;

constant_expression_error: conditional_expression_error;

/**** TYPES **************************************************************************/
storage_class_specifier:
	  TYPEDEF       { $$ = MkSpecifier(TYPEDEF); }
	| EXTERN        { $$ = MkSpecifier(EXTERN); }
	| STATIC        { $$ = MkSpecifier(STATIC); }
	| THREAD        { $$ = MkSpecifier(THREAD); }
	| AUTO          { $$ = MkSpecifier(AUTO); }
	| REGISTER      { $$ = MkSpecifier(REGISTER); }
   | RESTRICT      { $$ = MkSpecifier(RESTRICT); }
	;

external_storage_class_specifier:
	  TYPEDEF       { $$ = MkSpecifier(TYPEDEF); structDeclMode = declMode = defaultAccess; }
	| EXTERN        { $$ = MkSpecifier(EXTERN); }
	| STATIC        { $$ = MkSpecifier(STATIC); structDeclMode = declMode = staticAccess; }
   | THREAD        { $$ = MkSpecifier(THREAD); }
	| AUTO          { $$ = MkSpecifier(AUTO); }
	| REGISTER      { $$ = MkSpecifier(REGISTER); }
   | RESTRICT      { $$ = MkSpecifier(RESTRICT); }
	;

enumerator:
	  identifier                           { $$ = MkEnumerator($1, null, null); }
	| identifier '=' constant_expression   { $$ = MkEnumerator($1, $3, null); }
   | identifier '=' constant_expression_error   { $$ = MkEnumerator($1, $3, null); }
	| identifier multi_attrib                          { $$ = MkEnumerator($1, null, $2); }
	| identifier multi_attrib '=' constant_expression   { $$ = MkEnumerator($1, $4, $2); }
   | identifier multi_attrib '=' constant_expression_error   { $$ = MkEnumerator($1, $4, $2); }
	;

enumerator_list:
	  enumerator                        { $$ = MkList(); ListAdd($$, $1); }
	| enumerator_list ',' enumerator    { $$ = $1; ListAdd($1, $3); }
   | enumerator_list ','
	;

enum_specifier:
     ENUM  { memberAccessStack[++defaultMemberAccess] = publicAccess; }
   ;

enum_specifier_nocompound:
     enum_specifier identifier                            { $$ = MkEnum($2, null); POP_DEFAULT_ACCESS; }
   | enum_specifier strict_type                           { $$ = MkEnum(MkIdentifier($2.name), null); POP_DEFAULT_ACCESS; }
   ;

enum_specifier_compound:
	  enum_specifier_compound_error '}' { $$.loc = @$; POP_DEFAULT_ACCESS $$ = $1; }
	| enum_specifier identifier '{' '}'    { $$ = MkEnum($2, null); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_specifier strict_type '{' '}'          { $$ = MkEnum(MkIdentifier($2.name), null); FreeSpecifier($2); $$.loc = @$; POP_DEFAULT_ACCESS; }
	;

enum_specifier_compound_error:
	  enum_specifier '{' enumerator_list       { $$ = MkEnum(null, $3); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_specifier '{' error                 { $$ = MkEnum(null, null); $$.loc = @$; POP_DEFAULT_ACCESS; }

	| enum_specifier identifier '{' enumerator_list          { $$ = MkEnum($2, $4); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_specifier identifier '{' enumerator_list error    { $$ = MkEnum($2, $4);  $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_specifier identifier '{' error    { $$ = MkEnum($2, null);  $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_specifier identifier '{' enumerator_list ';' struct_declaration_list     { $$ = MkEnum($2, $4); $$.loc = @$; $$.definitions = $6;  POP_DEFAULT_ACCESS; }
   | enum_specifier identifier '{' enumerator_list ';' struct_declaration_list_error     { $$ = MkEnum($2, $4); $$.loc = @$; $$.definitions = $6;  POP_DEFAULT_ACCESS; }

   | enum_specifier strict_type '{' enumerator_list           { $$ = MkEnum(MkIdentifier($2.name), $4); $$.loc = @$; FreeSpecifier($2); POP_DEFAULT_ACCESS; }
   | enum_specifier strict_type '{' enumerator_list error          { $$ = MkEnum(MkIdentifier($2.name), $4); $$.loc = @$; FreeSpecifier($2); POP_DEFAULT_ACCESS; }
   | enum_specifier strict_type '{' error                          { $$ = MkEnum(MkIdentifier($2.name), null); $$.loc = @$; FreeSpecifier($2); POP_DEFAULT_ACCESS; }
	| enum_specifier strict_type '{' enumerator_list ';' struct_declaration_list           { $$ = MkEnum(MkIdentifier($2.name), $4); $$.loc = @$; $$.definitions = $6; FreeSpecifier($2); POP_DEFAULT_ACCESS; }
	| enum_specifier strict_type '{' enumerator_list ';' struct_declaration_list_error           { $$ = MkEnum(MkIdentifier($2.name), $4); $$.loc = @$; $$.definitions = $6; FreeSpecifier($2); POP_DEFAULT_ACCESS; }

   | enum_specifier identifier '{' enumerator_list ';'      { $$ = MkEnum($2, $4); $$.loc = @$; POP_DEFAULT_ACCESS; }
	| enum_specifier strict_type '{' enumerator_list ';'            { $$ = MkEnum(MkIdentifier($2.name), $4); $$.loc = @$; FreeSpecifier($2); POP_DEFAULT_ACCESS; }
	;

enum_decl:
     enum_specifier identifier  { $$ = $2; if(declMode) DeclClassAddNameSpace($2._class, $2.string); }
   | enum_specifier strict_type { $$ = MkIdentifier($2.name); if(declMode) DeclClass($2.nsSpec, $2.name); FreeSpecifier($2); }
   ;

enum_class:
     enum_class_error '}'  { $$ = $1; $$.loc = @$; }
   | enum_decl ':' inheritance_specifiers '{' '}' { $$ = MkEnum($1, null); $$.baseSpecs = $3; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl '{' '}'    { $$ = MkEnum($1, null); POP_DEFAULT_ACCESS; }
   ;

enum_class_error:
     enum_decl ':' inheritance_specifiers '{' enumerator_list           { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' enumerator_list error          { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' error          { $$ = MkEnum($1, null); $$.baseSpecs = $3; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' enumerator_list ';' struct_declaration_list           { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.definitions = $7; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' enumerator_list ';' struct_declaration_list_error           { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.definitions = $7; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' enumerator_list error ';' struct_declaration_list           { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.definitions = $8; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' enumerator_list error ';' struct_declaration_list_error           { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.definitions = $8; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' error ';' struct_declaration_list           { $$ = MkEnum($1, null); $$.baseSpecs = $3; $$.definitions = $7; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' error ';' struct_declaration_list_error           { $$ = MkEnum($1, null); $$.baseSpecs = $3; $$.definitions = $7; $$.loc = @$; POP_DEFAULT_ACCESS; }

	| enum_specifier '{' enumerator_list       { $$ = MkEnum(null, $3); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_specifier '{' error                 { $$ = MkEnum(null, null); $$.loc = @$; POP_DEFAULT_ACCESS; }

	| enum_decl '{' enumerator_list          { $$ = MkEnum($1, $3); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl '{' enumerator_list error    { $$ = MkEnum($1, $3); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl '{' error    { $$ = MkEnum($1, null); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl '{' enumerator_list ';' struct_declaration_list     { $$ = MkEnum($1, $3); $$.definitions = $5; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl '{' enumerator_list ';' struct_declaration_list_error     { $$ = MkEnum($1, $3); $$.definitions = $5; $$.loc = @$; POP_DEFAULT_ACCESS; }

   | enum_decl ':' inheritance_specifiers '{' enumerator_list ';'            { $$ = MkEnum($1, $5); $$.baseSpecs = $3; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' enumerator_list error ';'            { $$ = MkEnum($1, $5); $$.baseSpecs = $3;  $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl ':' inheritance_specifiers '{' error ';'            { $$ = MkEnum($1, null); $$.baseSpecs = $3; $$.loc = @$; POP_DEFAULT_ACCESS; }
   | enum_decl '{' enumerator_list ';'      { $$ = MkEnum($1, $3);  $$.loc = @$; POP_DEFAULT_ACCESS; }
   ;

class_specifier:
     enum_class
   | struct_class
   ;

class_specifier_error:
     enum_class_error
   | struct_class_error
   ;

ext_storage:
   ext_decl   { $$ = MkSpecifierExtended($1); }
   ;

type_qualifier:
	  CONST        { $$ = MkSpecifier(CONST); }
	| VOLATILE     { $$ = MkSpecifier(VOLATILE); }
   | ext_storage  { $$ = $1; }
	;


type_qualifier_list:
	  type_qualifier                          { $$ = MkList(); ListAdd($$, $1); }
	| type_qualifier_list type_qualifier      { $$ = $1; ListAdd($1, $2);  }
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
   | FLOAT16         { $$ = MkSpecifier(FLOAT16); }
   | VALIST          { $$ = MkSpecifier(VALIST); }
	| LONG            { $$ = MkSpecifier(LONG); }
	| FLOAT           { $$ = MkSpecifier(FLOAT); }
	| DOUBLE          { $$ = MkSpecifier(DOUBLE); }
	| SIGNED          { $$ = MkSpecifier(SIGNED); }
	| UNSIGNED        { $$ = MkSpecifier(UNSIGNED); }
   | EXTENSION       { $$ = MkSpecifier(EXTENSION); }
	| struct_or_union_specifier_nocompound
 	| enum_specifier_nocompound
	| type
   | TYPEOF '(' assignment_expression ')' { $$ = MkSpecifierTypeOf($3); }
   | SUBCLASS '(' type ')'                { $$ = MkSpecifierSubClass($3); }
   | SUBCLASS '(' identifier ')'          { _DeclClass($3._class, $3.string); $$ = MkSpecifierSubClass(MkSpecifierName($3.string)); FreeIdentifier($3); }
   | THISCLASS       { $$ = MkSpecifier(THISCLASS); }
   | TYPED_OBJECT    { $$ = MkSpecifier(TYPED_OBJECT); }
   | ANY_OBJECT      { $$ = MkSpecifier(ANY_OBJECT); }
   | _BOOL           { $$ = MkSpecifier(_BOOL); }
   | BOOL            { $$ = MkSpecifier(BOOL); }
   | _COMPLEX        { $$ = MkSpecifier(_COMPLEX); }
   | _IMAGINARY      { $$ = MkSpecifier(_IMAGINARY); }
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
   | FLOAT16         { $$ = MkSpecifier(FLOAT16); }
   | VALIST          { $$ = MkSpecifier(VALIST); }
	| LONG            { $$ = MkSpecifier(LONG); }
	| FLOAT           { $$ = MkSpecifier(FLOAT); }
	| DOUBLE          { $$ = MkSpecifier(DOUBLE); }
	| SIGNED          { $$ = MkSpecifier(SIGNED); }
	| UNSIGNED        { $$ = MkSpecifier(UNSIGNED); }
   | EXTENSION       { $$ = MkSpecifier(EXTENSION); }
	| struct_or_union_specifier_nocompound
	| enum_specifier_nocompound
	| strict_type
   | _BOOL           { $$ = MkSpecifier(_BOOL); }
   | BOOL            { $$ = MkSpecifier(BOOL); }
   | _COMPLEX        { $$ = MkSpecifier(_COMPLEX); }
   | _IMAGINARY      { $$ = MkSpecifier(_IMAGINARY); }
   | TYPEOF '(' assignment_expression ')' { $$ = MkSpecifierTypeOf($3); }
   | SUBCLASS '(' type ')'                { $$ = MkSpecifierSubClass($3); }
   | SUBCLASS '(' identifier ')'          { _DeclClass($3._class, $3.string); $$ = MkSpecifierSubClass(MkSpecifierName($3.string)); FreeIdentifier($3); }
   | THISCLASS       { $$ = MkSpecifier(THISCLASS); }
	;

// TESTING declarator_nofunction here... For function declarations

struct_declarator:
	  declarator_nofunction_type_ok
      { $$ = MkStructDeclarator($1, null); $$.loc = @$; }
	| declarator_nofunction_type_ok attrib
      { $$ = MkStructDeclarator($1, null); $$.structDecl.attrib = $2; $$.loc = @$; }
	| ':' constant_expression
      { $$ = MkStructDeclarator(null, $2);  $$.loc = @$; }
	| declarator_nofunction_type_ok ':' constant_expression
      { $$ = MkStructDeclarator($1, $3);  $$.loc = @$; }
   | declarator_nofunction_type_ok ':' constant_expression ':' constant_expression
      { $$ = MkStructDeclarator($1, $3); $$.structDecl.posExp = $5; $$.loc = @$; }
	| ':' constant_expression_error
      { $$ = MkStructDeclarator(null, $2);  $$.loc = @$; }
	| declarator_nofunction_type_ok ':' constant_expression_error
      { $$ = MkStructDeclarator($1, $3);  $$.loc = @$; }
   | declarator_nofunction_type_ok ':' constant_expression ':' constant_expression_error
      { $$ = MkStructDeclarator($1, $3); $$.structDecl.posExp = $5; $$.loc = @$; }
   | declarator_nofunction_type_ok ':' constant_expression_error ':' constant_expression_error
      { $$ = MkStructDeclarator($1, $3); $$.structDecl.posExp = $5; $$.loc = @$; }
   | declarator_nofunction_type_ok ':' constant_expression_error ':' constant_expression
      { $$ = MkStructDeclarator($1, $3); $$.structDecl.posExp = $5; $$.loc = @$; }
   ;

struct_declarator_list:
	  struct_declarator                                { $$ = MkList(); ListAdd($$, $1); }
	| struct_declarator_list ',' struct_declarator     { $$ = $1; ListAdd($1, $3); }
	;

struct_entry:
     struct_or_union identifier
      {
         $$ = MkStructOrUnion($1, $2, null);
         $$.addNameSpace = true;
         $$.ctx = PushContext();
      }
   | struct_or_union base_strict_type
      {
         $$ = MkStructOrUnion($1, MkIdentifier($2.name), null);
         $$.ctx = PushContext();
         FreeSpecifier($2);
      }
   | struct_or_union ext_decl identifier
      {
         $$ = MkStructOrUnion($1, $3, null);
         $$.extDeclStruct = $2;
         $$.addNameSpace = true;
         $$.ctx = PushContext();
      }
   | struct_or_union ext_decl base_strict_type
      {
         $$ = MkStructOrUnion($1, MkIdentifier($3.name), null);
         $$.extDeclStruct = $2;
         $$.ctx = PushContext();
         FreeSpecifier($3);
      }
   ;

struct_or_union_specifier_compound:
     struct_or_union_specifier_compound_error '}' { $$ = $1; $$.loc = @$; }
   | struct_entry '{' '}'                 { $$ = $1; $$.loc = @$; POP_DEFAULT_ACCESS PopContext(curContext); }
   | struct_or_union '{' '}'              { $$ = MkStructOrUnion($1, null, null); $$.loc = @$; POP_DEFAULT_ACCESS; }
   | struct_or_union ext_decl '{' '}'              { $$ = MkStructOrUnion($1, null, null); $$.extDeclStruct = $2; $$.loc = @$; POP_DEFAULT_ACCESS; }
	;

struct_or_union_specifier_compound_error:
     struct_entry '{' struct_declaration_list        { $$ = $1; AddStructDefinitions($1, $3);  POP_DEFAULT_ACCESS PopContext(curContext); }
   | struct_entry '{' struct_declaration_list_error   { $$ = $1; AddStructDefinitions($1, $3);  POP_DEFAULT_ACCESS PopContext(curContext); }
   | struct_entry '{' error   { $$ = $1; POP_DEFAULT_ACCESS PopContext(curContext); }

	| struct_or_union '{' struct_declaration_list               { $$ = MkStructOrUnion($1, null, $3); POP_DEFAULT_ACCESS; }
   | struct_or_union '{' struct_declaration_list_error               { $$ = MkStructOrUnion($1, null, $3); POP_DEFAULT_ACCESS; }
   | struct_or_union '{' error              { $$ = MkStructOrUnion($1, null, null); POP_DEFAULT_ACCESS; }

	| struct_or_union ext_decl '{' struct_declaration_list               { $$ = MkStructOrUnion($1, null, $4); $$.extDeclStruct = $2; POP_DEFAULT_ACCESS; }
   | struct_or_union ext_decl '{' struct_declaration_list_error               { $$ = MkStructOrUnion($1, null, $4); $$.extDeclStruct = $2; POP_DEFAULT_ACCESS; }
   | struct_or_union ext_decl '{' error              { $$ = MkStructOrUnion($1, null, null); $$.extDeclStruct = $2; POP_DEFAULT_ACCESS; }
	;

struct_or_union_specifier_nocompound:
	  struct_entry { $$ = $1; POP_DEFAULT_ACCESS PopContext(curContext); }
	;

struct_decl:
     struct_entry
     {
        $$ = $1;
        if(declMode)
        {
           ($1.addNameSpace ? DeclClassAddNameSpace : DeclClass)($1.id._class, $1.id.string);
        }
     }
   | struct_entry '<' template_parameters_list '>'
   {
      Symbol symbol = ($1.addNameSpace ? DeclClassAddNameSpace : DeclClass)($1.id._class, $1.id.string);
      $$ = $1;
      symbol.templateParams = $3;
   }
   ;

struct_head:
   struct_decl ':' inheritance_specifiers
   {
      $$ = $1;
      $$.baseSpecs = $3;
      SetupBaseSpecs(null, $3);
   }
   ;

struct_class:
     struct_class_error '}' { $$ = $1; $$.loc = @$; }
   | struct_head '{' '}'
      { $$ = $1; POP_DEFAULT_ACCESS PopContext(curContext); }
   | struct_decl '{' '}'   { $$ = $1; POP_DEFAULT_ACCESS PopContext(curContext); }
   | struct_or_union '{' '}' { $$ = MkStructOrUnion($1, null, null); POP_DEFAULT_ACCESS; }
   ;

struct_class_error:
	struct_head '{' struct_declaration_list
   {
      $$ = $1;
      $$.definitions = $3;
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   }
	| struct_head '{' struct_declaration_list_error
   {
      $$ = $1;
      $$.definitions = $3;
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   }
	| struct_head '{' error
   { $$ = $1; POP_DEFAULT_ACCESS PopContext(curContext);}

	| struct_decl '{' struct_declaration_list
     {
        PopContext(curContext);
        if(!declMode)
        {
           $$ = MkStructOrUnion($1.type, $1.id, $3);
           $1.id = null;
           $$.ctx = $1.ctx;
           $1.ctx = null;

           FreeSpecifier($1);
        }
        else
           $$.definitions = $3;
        POP_DEFAULT_ACCESS;
     }
	| struct_decl '{' struct_declaration_list_error
     {
        PopContext(curContext);

        if(!declMode)
        {
           $$ = MkStructOrUnion($1.type, $1.id, $3);
           $1.id = null;
           FreeSpecifier($1);
        }
        else
           $$.definitions = $3;
        POP_DEFAULT_ACCESS;
     }
   | struct_decl '{' error
      { $$ = $1; POP_DEFAULT_ACCESS PopContext(curContext); }

	| struct_or_union '{' struct_declaration_list
      { $$ = MkStructOrUnion($1, null, $3); POP_DEFAULT_ACCESS;  }
   | struct_or_union '{' struct_declaration_list_error
      { $$ = MkStructOrUnion($1, null, $3); POP_DEFAULT_ACCESS; }
   | struct_or_union '{' error
      { $$ = MkStructOrUnion($1, null, null); POP_DEFAULT_ACCESS; }
   ;

struct_or_union:
	  STRUCT    { $$ = structSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; }
	| UNION     { $$ = unionSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; }
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
   | strict_type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | declaration_specifiers  strict_type_specifier            { $$ = $1; ListAdd($1, $2); }
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

external_guess_declaration_specifiers:
     external_storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | external_guess_declaration_specifiers external_storage_class_specifier    { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | external_guess_declaration_specifiers  type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | external_guess_declaration_specifiers  type_specifier            { $$ = $1; ListAdd($1, $2); }
   | guess_type                                       { $$ = MkList(); ListAdd($$, $1); }
	| external_guess_declaration_specifiers guess_type          { $$ = $1; ListAdd($1, $2); }
   | class_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | external_guess_declaration_specifiers class_specifier            { $$ = $1; ListAdd($1, $2); }
   ;

external_guess_declaration_specifiers_error:
     class_specifier_error                             { $$ = MkList(); ListAdd($$, $1); }
   | external_guess_declaration_specifiers class_specifier_error      { $$ = $1; ListAdd($1, $2); }
   ;

_inheritance_specifiers:
     PRIVATE                                          { $$ = MkList(); ListAdd($$, MkSpecifier(PRIVATE)); }
   | PUBLIC                                           { $$ = MkList(); ListAdd($$, MkSpecifier(PUBLIC)); }
   | storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | _inheritance_specifiers storage_class_specifier   { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | _inheritance_specifiers type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | strict_type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | _inheritance_specifiers strict_type_specifier            { $$ = $1; ListAdd($1, $2); }
   | identifier
      { _DeclClass($1._class, $1.string); $$ = MkListOne(MkSpecifierName($1.string)); FreeIdentifier($1); }
	| _inheritance_specifiers identifier                { $$ = $1; _DeclClass($2._class, $2.string); ListAdd($1, MkSpecifierName($2.string)); FreeIdentifier($2); }

   | identifier '<' template_arguments_list '>'
      {
         _DeclClass($1._class, $1.string);

         $$ = MkList();
         ListAdd($$, MkSpecifierNameArgs($1.string, $3));
         FreeIdentifier($1);
      }
   | _inheritance_specifiers identifier '<' template_arguments_list '>'
      {
         $$ = $1;
         _DeclClass($2._class, $2.string);
         ListAdd($1, MkSpecifierNameArgs($2.string, $4));
         FreeIdentifier($2);
      }
   ;

inheritance_specifiers:
     _inheritance_specifiers
   | struct_or_union    { $$ = MkListOne(MkStructOrUnion($1, null, null)); POP_DEFAULT_ACCESS; }
   ;

property_specifiers:
     storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | property_specifiers storage_class_specifier     { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | property_specifiers type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | strict_type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | property_specifiers strict_type_specifier            { $$ = $1; ListAdd($1, $2); }
   | identifier                        { $$ = MkList(); ListAdd($$, MkSpecifierName($1.string)); FreeIdentifier($1); }
   | property_specifiers identifier          { $$ = $1; ListAdd($1, MkSpecifierName($2.string)); FreeIdentifier($2); }
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

new_specifiers:
     storage_class_specifier                          { $$ = MkList(); ListAdd($$, $1); }
   | new_specifiers storage_class_specifier    { $$ = $1; ListAdd($1, $2); }
   | type_qualifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | new_specifiers  type_qualifier            { $$ = $1; ListAdd($1, $2); }
   | strict_type_specifier                                   { $$ = MkList(); ListAdd($$, $1); }
   | new_specifiers strict_type_specifier            { $$ = $1; ListAdd($1, $2); }
   | struct_or_union_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| new_specifiers struct_or_union_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | enum_specifier_compound              { $$ = MkList(); ListAdd($$, $1); }
	| new_specifiers enum_specifier_compound          { $$ = $1; ListAdd($1, $2); }
   | identifier                        { $$ = MkList(); ListAdd($$, MkSpecifierName($1.string)); FreeIdentifier($1); }
   | new_specifiers identifier          { $$ = $1; ListAdd($1, MkSpecifierName($2.string)); FreeIdentifier($2); }
   | identifier '<' template_arguments_list '>'
      {
         _DeclClass($1._class, $1.string);

         $$ = MkList();
         ListAdd($$, MkSpecifierNameArgs($1.string, $3));
         FreeIdentifier($1);
      }
   | new_specifiers identifier '<' template_arguments_list '>'
      {
         _DeclClass($2._class, $2.string);
         ListAdd($1, MkSpecifierNameArgs($2.string, $4));
         FreeIdentifier($2);
      }
   ;

identifier_list_error:
     identifier_list ',' error         { $$ = $1; ListAdd($1, null); }
   | identifier_list_error ',' error         { $$ = $1; ListAdd($1, null); }
   ;

identifier_list:
	  identifier                        { $$ = MkList(); ListAdd($$, MkTypeName(null, MkDeclaratorIdentifier($1))); }
	| identifier_list ',' identifier    { $$ = $1; ListAdd($1, MkTypeName(null, MkDeclaratorIdentifier($3))); }
   | identifier_list_error ',' identifier    { $$ = $1; ListAdd($1, MkTypeName(null, MkDeclaratorIdentifier($3))); }
	| parameter_list ',' identifier    { $$ = $1; ListAdd($1, MkTypeName(null, MkDeclaratorIdentifier($3))); }
   | parameter_list_error ',' identifier    { $$ = $1; ListAdd($1, MkTypeName(null, MkDeclaratorIdentifier($3))); }
	;

direct_declarator_nofunction_type_ok:
     direct_declarator_nofunction
   | base_strict_type
   {
      char * colon = $1.name ? RSearchString($1.name, "::", strlen($1.name), true, false) : null;
      String s = colon ? colon + 2 : $1.name;
      $$ = MkDeclaratorIdentifier(MkIdentifier(s));
      FreeSpecifier($1);
   }
   | UINT { $$ = MkDeclaratorIdentifier(MkIdentifier("uint")); }
   // These rules need to be reviewed in lights of prototypes with types only...
	| base_strict_type '[' constant_expression ']'
      {
         Declarator decl;
         char * colon = RSearchString($1.name, "::", strlen($1.name), true, false);
         String s = colon ? colon + 2 : $1.name;
         decl = MkDeclaratorIdentifier(MkIdentifier(s));
         FreeSpecifier($1);
         $$ = MkDeclaratorArray(decl, $3);
      }
   | base_strict_type '[' constant_expression_error ']'
      {
         Declarator decl;
         char * colon = RSearchString($1.name, "::", strlen($1.name), true, false);
         String s = colon ? colon + 2 : $1.name;
         decl = MkDeclaratorIdentifier(MkIdentifier(s));
         FreeSpecifier($1);
         $$ = MkDeclaratorArray(decl, $3);
      }
	| base_strict_type '[' type ']'
      {
         Declarator decl;
         char * colon = RSearchString($1.name, "::", strlen($1.name), true, false);
         String s = colon ? colon + 2 : $1.name;
         decl = MkDeclaratorIdentifier(MkIdentifier(s));
         FreeSpecifier($1);
         $$ = MkDeclaratorEnumArray(decl, $3);
      }
	| base_strict_type '[' ']'
      {
         Declarator decl;
         char * colon = RSearchString($1.name, "::", strlen($1.name), true, false);
         String s = colon ? colon + 2 : $1.name;
         decl = MkDeclaratorIdentifier(MkIdentifier(s));
         FreeSpecifier($1);
         $$ = MkDeclaratorEnumArray(decl, null);
      }
	| direct_declarator_nofunction_type_ok '[' constant_expression ']' { $$ = MkDeclaratorArray($1, $3); }
   | direct_declarator_nofunction_type_ok '[' constant_expression_error ']' { $$ = MkDeclaratorArray($1, $3); }
	| direct_declarator_nofunction_type_ok '[' type ']' { $$ = MkDeclaratorEnumArray($1, $3); }
	| direct_declarator_nofunction_type_ok '[' ']'                     { $$ = MkDeclaratorArray($1, null); }
  	;

direct_declarator_nofunction:
	  identifier                                                   { $$ = MkDeclaratorIdentifier($1); }
	| '(' declarator ')'                            { $$ = MkDeclaratorBrackets($2); }
   | '(' ext_decl declarator ')'                            { $$ = MkDeclaratorBrackets(MkDeclaratorExtended($2, $3)); }
	| '(' declarator_type_ok ')'                            { $$ = MkDeclaratorBrackets($2); }
   | '(' ext_decl declarator_type_ok ')'                            { $$ = MkDeclaratorBrackets(MkDeclaratorExtended($2, $3)); }
	| direct_declarator_nofunction '[' constant_expression ']' { $$ = MkDeclaratorArray($1, $3); }
   | direct_declarator_nofunction '[' constant_expression_error ']' { $$ = MkDeclaratorArray($1, $3); }
	| direct_declarator_nofunction '[' type ']' { $$ = MkDeclaratorEnumArray($1, $3); }
	| direct_declarator_nofunction '[' ']'                     { $$ = MkDeclaratorArray($1, null); }
  	;

direct_declarator_function_start:
     direct_declarator_nofunction '('
   ;

direct_declarator_function:
	  direct_declarator_function_start parameter_type_list ')' { $$ = MkDeclaratorFunction($1, $2); }
   | direct_declarator_function_start parameter_type_list_error ')' { $$ = MkDeclaratorFunction($1, $2); }
	| direct_declarator_function_start identifier_list ')'     { $$ = MkDeclaratorFunction($1, $2); }
   | direct_declarator_function_start identifier_list_error ')'     { $$ = MkDeclaratorFunction($1, $2); }
	| direct_declarator_function_start ')'                     { $$ = MkDeclaratorFunction($1, null); }
  	;

// Tricky stuff here for overriding...
direct_declarator_function_error:
   direct_declarator_function_start identifier_list_error
      {
         $$ = MkDeclaratorFunction($1, $2);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
      }
   | direct_declarator_function_start error
      {
         $$ = MkDeclaratorFunction($1, null);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
      }
   | direct_declarator_function_start parameter_list '('
      {
         $$ = MkDeclaratorFunction($1, $2);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
      }
   | direct_declarator_function_start guess_declaration_specifiers identifier '('
      {
         $$ = MkDeclaratorFunction($1, null);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
         FreeList($2, FreeSpecifier);
         FreeIdentifier($3);
      }
  	;

direct_declarator:
     direct_declarator_function
   | direct_declarator_nofunction
   ;


direct_declarator_function_start_type_ok:
     direct_declarator_nofunction_type_ok '('
   ;

direct_declarator_function_type_ok:
	  direct_declarator_function_start_type_ok parameter_type_list ')' { $$ = MkDeclaratorFunction($1, $2); }
   | direct_declarator_function_start_type_ok parameter_type_list_error ')' { $$ = MkDeclaratorFunction($1, $2); }
	| direct_declarator_function_start_type_ok identifier_list ')'     { $$ = MkDeclaratorFunction($1, $2); }
   | direct_declarator_function_start_type_ok identifier_list_error ')'     { $$ = MkDeclaratorFunction($1, $2); }
	| direct_declarator_function_start_type_ok ')'                     { $$ = MkDeclaratorFunction($1, null); }
  	;

// Tricky stuff here for overriding...
direct_declarator_function_error_type_ok:
   direct_declarator_function_start_type_ok identifier_list_error
      {
         $$ = MkDeclaratorFunction($1, $2);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
      }
   | direct_declarator_function_start_type_ok error
      {
         $$ = MkDeclaratorFunction($1, null);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
      }
   | direct_declarator_function_start_type_ok parameter_list '('
      {
         $$ = MkDeclaratorFunction($1, $2);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
      }
   | direct_declarator_function_start_type_ok guess_declaration_specifiers identifier '('
      {
         $$ = MkDeclaratorFunction($1, null);
         fileInput.Seek(@1.end.pos, start);
         yyclearin;
         resetScannerPos(&@1.end);
         @$.start = @1.start;
         @$.end = @1.end;
         FreeList($2, FreeSpecifier);
         FreeIdentifier($3);
      }
  	;

direct_declarator_type_ok:
     direct_declarator_function_type_ok
   | direct_declarator_nofunction_type_ok
/*
   | ext_decl direct_declarator_function_type_ok
      { $$ = MkDeclaratorExtended($1, $2); }
   | ext_decl direct_declarator_nofunction_type_ok
      { $$ = MkDeclaratorExtended($1, $2); }
*/
   ;
/*
asm_start:
    ASM '(' STRING_LITERAL { $<string>$ = CopyString(yytext); } STRING_LITERAL { $<string>$ = CopyString(yytext); }
      {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, $<string>4);
         strcat(temp, " ");
         strcat(temp, $<string>6);
         delete $<string>4;
         delete $<string>6;
         $<string>$ = CopyString(temp);
      }
   ;

ext_decl:
     EXT_DECL { $$ = MkExtDeclString(CopyString(yytext)); }
   | attrib { $$ = MkExtDeclAttrib($1);
   | asm_start ')'
      {
         char temp[1024];
         strcpy(temp, $<string>1);
         strcat(temp, ")");
         delete $<string>1;
         $$ = MkExtDeclString(CopyString(temp));
      }
   | asm_start STRING_LITERAL { $$ = CopyString(yytext); } ')'
      {
         char temp[1024];
         strcpy(temp, $<string>1);
         strcat(temp, " ");
         strcat(temp, $<string>3);
         strcat(temp, ")");
         delete $<string>1;
         delete $<string>3;
         $$ = MkExtDeclString(CopyString(temp));
      }
   ;
*/

ext_decl:
     EXT_DECL { $$ = MkExtDeclString(CopyString(yytext)); }
   | EXT_STORAGE  { $$ = MkExtDeclString(CopyString(yytext)); }

   | ext_decl EXT_STORAGE
      {
         TempFile f { };
         OutputExtDecl($1, f);
         f.Putc(' ');
         f.Puts(yytext);
         f.Putc(0);
         $$ = MkExtDeclString((String)f.StealBuffer());
         FreeExtDecl($1);
         delete f;
      }
   | ext_decl EXT_DECL
      {
         TempFile f { };
         OutputExtDecl($1, f);
         f.Putc(' ');
         f.Puts(yytext);
         f.Putc(0);
         $$ = MkExtDeclString((String)f.StealBuffer());
         FreeExtDecl($1);
         delete f;
      }
   | attrib { $$ = MkExtDeclAttrib($1); }
   | multi_attrib { $$ = MkExtDeclMultiAttrib($1); }
   | ASM '(' string_literal ')'
      {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, $3);
         strcat(temp, ")");
         $$ = MkExtDeclString(CopyString(temp));
         delete $3;
      }
   ;

_attrib:
   ATTRIB      { $<i>$ = ATTRIB; }
 | ATTRIB_DEP  { $<i>$ = ATTRIB_DEP; }
 | __ATTRIB    { $<i>$ = __ATTRIB; }
 ;


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

multi_attrib:
     attrib                { $$ = MkListOne($1); }
   | multi_attrib attrib   { ListAdd($1, $2); $$ = $1; }


direct_abstract_declarator:
	  '(' abstract_declarator ')'               { $$ = MkDeclaratorBrackets($2); }
	| '(' ext_decl abstract_declarator ')'               { $$ = MkDeclaratorBrackets(MkDeclaratorExtended($2, $3)); }
	| '[' ']'                                   { $$ = MkDeclaratorArray(null, null); }
   | '[' constant_expression ']'               { $$ = MkDeclaratorArray(null, $2); }
	| '[' constant_expression_error ']'         { $$ = MkDeclaratorArray(null, $2); }
   | '[' type ']'                              { $$ = MkDeclaratorEnumArray(null, $2); }
	| direct_abstract_declarator '[' ']'        { $$ = MkDeclaratorArray($1, null); }
	| direct_abstract_declarator '[' constant_expression ']'        { $$ = MkDeclaratorArray($1, $3); }
	| direct_abstract_declarator '[' type']'                        { $$ = MkDeclaratorEnumArray($1, $3); }
	| direct_abstract_declarator '[' constant_expression_error ']'  { $$ = MkDeclaratorArray($1, $3); }
	| '(' ')'                                   { $$ = MkDeclaratorFunction(null, null); }
	| '(' parameter_type_list ')'               { $$ = MkDeclaratorFunction(null, $2); }
	| '(' parameter_type_list_error ')'         { $$ = MkDeclaratorFunction(null, $2); }
	| direct_abstract_declarator '(' ')'        { $$ = MkDeclaratorFunction($1, null); }
	| direct_abstract_declarator '(' parameter_type_list ')'         { $$ = MkDeclaratorFunction($1, $3); }
	| direct_abstract_declarator '(' parameter_type_list_error ')'   { $$ = MkDeclaratorFunction($1, $3); }
	;

direct_abstract_declarator_noarray:
	  '(' abstract_declarator_noarray ')'          { $$ = MkDeclaratorBrackets($2); }
	| '(' ext_decl abstract_declarator_noarray ')' { $$ = MkDeclaratorBrackets(MkDeclaratorExtended($2, $3)); }
	| '(' ')'                                      { $$ = MkDeclaratorFunction(null, null); }
	| '(' parameter_type_list ')'                  { $$ = MkDeclaratorFunction(null, $2); }
   	| '(' parameter_type_list_error ')'         { $$ = MkDeclaratorFunction(null, $2); }
	| direct_abstract_declarator_noarray '(' ')'   { $$ = MkDeclaratorFunction($1, null); }
	| direct_abstract_declarator_noarray '(' parameter_type_list ')'       { $$ = MkDeclaratorFunction($1, $3); }
	| direct_abstract_declarator_noarray '(' parameter_type_list_error ')' { $$ = MkDeclaratorFunction($1, $3); }
	;

pointer:
	  '*'                               { $$ = MkPointer(null, null); }
	| '*' type_qualifier_list           { $$ = MkPointer($2, null); }
	| '*' pointer                       { $$ = MkPointer(null, $2); }
	| '*' type_qualifier_list pointer   { $$ = MkPointer($2, $3); }
	;

abstract_declarator:
	  pointer                              { $$ = MkDeclaratorPointer($1, null); }
	| direct_abstract_declarator
	| pointer direct_abstract_declarator   { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl pointer { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, null)); }
	| ext_decl pointer direct_abstract_declarator { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	;

abstract_declarator_noarray:
	  pointer                              { $$ = MkDeclaratorPointer($1, null); }
	| direct_abstract_declarator_noarray
	| pointer direct_abstract_declarator_noarray   { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl pointer { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, null)); }
   | ext_decl pointer direct_abstract_declarator_noarray { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	;

declarator:
	  direct_declarator
	| pointer direct_declarator
      { $$ = MkDeclaratorPointer($1, $2); }
   | ext_decl pointer direct_declarator
      { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
   | declarator ext_decl
      { $$ = MkDeclaratorExtendedEnd($2, $1); }
   | declarator_nofunction_type_ok ext_decl
      { $$ = MkDeclaratorExtendedEnd($2, $1); }
   ;

declarator_type_ok:
	  direct_declarator_type_ok
	| pointer direct_declarator_type_ok
      { $$ = MkDeclaratorPointer($1, $2); }
  | ext_decl pointer direct_declarator_type_ok
      { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
   | declarator_type_ok ext_decl
      { $$ = MkDeclaratorExtendedEnd($2, $1); }
   ;

declarator_function:
     direct_declarator_function
	| pointer direct_declarator_function      { $$ = MkDeclaratorPointer($1, $2); }
	| ext_decl pointer direct_declarator_function { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_function { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }
   ;

declarator_function_error:
	  direct_declarator_function_error
	| pointer direct_declarator_function_error      { $$ = MkDeclaratorPointer($1, $2); }
	| ext_decl pointer direct_declarator_function_error { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_function_error { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }
   ;

declarator_function_type_ok:
     direct_declarator_function_type_ok
	| pointer direct_declarator_function_type_ok      { $$ = MkDeclaratorPointer($1, $2); }
	| ext_decl pointer direct_declarator_function_type_ok { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_function_type_ok { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }
   ;

declarator_function_error_type_ok:
	  direct_declarator_function_error_type_ok
	| pointer direct_declarator_function_error_type_ok      { $$ = MkDeclaratorPointer($1, $2); }
	| ext_decl pointer direct_declarator_function_error_type_ok { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_function_error_type_ok { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }
   ;

declarator_nofunction_type_ok:
	  direct_declarator_nofunction_type_ok
	| pointer direct_declarator_nofunction_type_ok      { $$ = MkDeclaratorPointer($1, $2); }
	| ext_decl pointer direct_declarator_nofunction_type_ok { $$ = MkDeclaratorExtended($1, MkDeclaratorPointer($2, $3)); }
	| pointer ext_decl direct_declarator_nofunction_type_ok { $$ = MkDeclaratorPointer($1, MkDeclaratorExtended($2, $3)); }
   ;

initializer:
	  assignment_expression          { $$ = MkInitializerAssignment($1); $$.loc = @$; }
	| '{' initializer_list '}'       { $$ = MkInitializerList($2); $$.loc = @$; }
	| '{' initializer_list ',' '}'
      {
         Compiler_Warning($"extra comma\n");
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

initializer_noexp:
	  '{' initializer_list '}'       { $$ = MkInitializerList($2); $$.loc = @$; }
	| '{' initializer_list ',' '}'
      {
         Compiler_Warning($"extra comma\n");
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

initializer_error:
     assignment_expression_error    { $$ = MkInitializerAssignment($1); $$.loc = @$; }
	| '{' initializer_list '}' error      { $$ = MkInitializerList($2); $$.loc = @$; }
   | '{' initializer_list                 { yyerror(); $$ = MkInitializerList($2); $$.loc = @$; }
	| '{' initializer_list ',' '}' error
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
	| '{' initializer_list ','
      {
         yyerror();
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
	  conditional_expression          { $$ = MkInitializerAssignment($1); $$.loc = @$; }
   | anon_instantiation_expression
      { $$ = MkInitializerAssignment($1); $$.loc = @$; }
	;

initializer_condition_error:
     conditional_expression_error    { $$ = MkInitializerAssignment($1); $$.loc = @$; }
   | anon_instantiation_expression_error  { $$ = MkInitializerAssignment($1); $$.loc = @$; }
	;

initializer_list:
	  initializer                       { $$ = MkList(); ListAdd($$, $1); }
   | initializer_error                 { $$ = MkList(); ListAdd($$, $1); }
	| initializer_list ',' initializer  { $$ = $1; ListAdd($1, $3); }
   | initializer_list ',' initializer_error  { $$ = $1; ListAdd($1, $3); }

   // Errors
	| initializer_list initializer  { yyerror(); $$ = $1; ListAdd($1, $2); }
   | initializer_list initializer_error  { $$ = $1; ListAdd($1, $2); }
	;

init_declarator:
	  declarator                     { $$ = MkInitDeclarator($1, null); $$.loc = @$; }
   | declarator_type_ok             { $$ = MkInitDeclarator($1, null); $$.loc = @$; }
	| declarator '=' initializer     { $$ = MkInitDeclarator($1, $3); $$.loc = @$; $$.initializer.loc.start = @2.end; }
	;

init_declarator_error:
	  declarator error                 { $$ = MkInitDeclarator($1, null); $$.loc = @$; }
   /* Useless rules due to conflicts
   | declarator '=' error                 { $$ = MkInitDeclarator($1, MkInitializerAssignment(MkExpDummy())); $$.loc = @$; $$.initializer.loc = @2; $$.initializer.exp.loc = @2; }
   */
	| declarator '=' initializer_error     { $$ = MkInitDeclarator($1, $3); $$.loc = @$; $$.initializer.loc.start = @2.end; }
	;

init_declarator_list:
	  init_declarator                            { $$ = MkList(); ListAdd($$, $1); }
	| init_declarator_list ',' init_declarator   { $$ = $1; ListAdd($1, $3); }
	| UINT ',' init_declarator                  { $$ = MkList(); ListAdd($$, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("uint")), null)); ListAdd($$, $3); }
   | INT64 ',' init_declarator                  { $$ = MkList(); ListAdd($$, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("int64")), null)); ListAdd($$, $3); }
   | INT128 ',' init_declarator                 { $$ = MkList(); ListAdd($$, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__int128")), null)); ListAdd($$, $3); }
   | FLOAT128 ',' init_declarator               { $$ = MkList(); ListAdd($$, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__float128")), null)); ListAdd($$, $3); }
   | FLOAT16 ',' init_declarator               { $$ = MkList(); ListAdd($$, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("_Float16")), null)); ListAdd($$, $3); }
	| base_strict_type ',' init_declarator
   {
      char * colon = RSearchString($1.name, "::", strlen($1.name), true, false);
      String s = colon ? colon + 2 : $1.name;
      $$ = MkList();
      ListAdd($$, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), null));
      ListAdd($$, $3);
      FreeSpecifier($1);
   }
   | init_declarator_list_error ',' init_declarator   { $$ = $1; ListAdd($1, $3); }
   /*| base_strict_type ',' init_declarator
      {
         $$ = MkList();
         ListAdd($1, $3);
      }*/
	;

init_declarator_list_error:
	  init_declarator_error                            { $$ = MkList(); ListAdd($$, $1); }
   | init_declarator error                            { $$ = MkList(); ListAdd($$, $1); }
	| init_declarator_list ',' init_declarator_error   { $$ = $1; ListAdd($1, $3); }
   | init_declarator_list_error ',' init_declarator_error   { $$ = $1; ListAdd($1, $3); }
	;

type_name:
	  specifier_qualifier_list                      { $$ = MkTypeName($1, null); }
	| specifier_qualifier_list abstract_declarator  { $$ = MkTypeName($1, $2); }
	;

guess_type_name:
	  guess_specifier_qualifier_list                         { $$ = MkTypeName($1, null); }
	| guess_specifier_qualifier_list abstract_declarator     { $$ = MkTypeName($1, $2); }
	;

/*** PARAMETERS **********************************************************************/
parameter_declaration:
     guess_declaration_specifiers declarator_type_ok          { $$ = MkTypeName($1, $2); }
   | guess_declaration_specifiers abstract_declarator { $$ = MkTypeName($1, $2); }
   | guess_declaration_specifiers '&'                 { $$ = MkTypeName($1, MkDeclaratorPointer(MkPointer(null,null), null)); }
   | guess_declaration_specifiers '&' declarator_type_ok      { $$ = MkTypeName($1, MkDeclaratorPointer(MkPointer(null,null), $3)); }
	| guess_declaration_specifiers                     { $$ = MkTypeNameGuessDecl($1, null); }
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
*/
	;

parameter_declaration_error:
	  guess_declaration_specifiers declarator_type_ok error          { $$ = MkTypeName($1, $2); }
	| guess_declaration_specifiers abstract_declarator error { $$ = MkTypeName($1, $2); }
	;

parameter_list:
	  parameter_declaration                      { $$ = MkList(); ListAdd($$, $1); }
	| parameter_list ',' parameter_declaration   { $$ = $1; ListAdd($1, $3); }
   | parameter_list error ',' parameter_declaration   { $$ = $1; ListAdd($1, $4); }
   | parameter_list_error ',' parameter_declaration   { $$ = $1; ListAdd($1, $3); }
   | parameter_list_error error ',' parameter_declaration   { $$ = $1; ListAdd($1, $4); }
   | error ',' parameter_declaration   { $$ = MkList(); ListAdd($$, MkTypeName(MkList(), null)); ListAdd($$, $3); }

	| identifier_list ',' parameter_declaration   { $$ = $1; ListAdd($1, $3); }
   | identifier_list error ',' parameter_declaration   { $$ = $1; ListAdd($1, $4); }
   | identifier_list_error ',' parameter_declaration   { $$ = $1; ListAdd($1, $3); }
   | identifier_list_error error ',' parameter_declaration   { $$ = $1; ListAdd($1, $4); }
;

parameter_list_error:
	  parameter_declaration_error                      { $$ = MkList(); ListAdd($$, $1); }
	| parameter_list ',' parameter_declaration_error   { $$ = $1; ListAdd($1, $3); }
   | parameter_list_error ',' parameter_declaration_error   { $$ = $1; ListAdd($1, $3); }
   | parameter_list_error error ',' parameter_declaration_error   { $$ = $1; ListAdd($1, $4); }
   | error ',' parameter_declaration_error   { $$ = MkList(); ListAdd($$, MkTypeName(MkList(), null)); ListAdd($$, $3); }

	| identifier_list ',' parameter_declaration_error   { $$ = $1; ListAdd($1, $3); }
   | identifier_list_error ',' parameter_declaration_error   { $$ = $1; ListAdd($1, $3); }
   | identifier_list_error error ',' parameter_declaration_error   { $$ = $1; ListAdd($1, $4); }
	;

parameter_type_list:
	  parameter_list
	| parameter_list ',' ELLIPSIS                { $$ = $1; ListAdd($1, MkTypeName(null, null)); }
   | parameter_list_error ',' ELLIPSIS                { $$ = $1; ListAdd($1, MkTypeName(null, null)); }
	| identifier_list ',' ELLIPSIS                { $$ = $1; ListAdd($1, MkTypeName(null, null)); }
   | identifier_list_error ',' ELLIPSIS                { $$ = $1; ListAdd($1, MkTypeName(null, null)); }
   | error ',' ELLIPSIS                { $$ = MkList(); ListAdd($$, MkTypeName(null, null)); }
	;

parameter_type_list_error:
    parameter_list_error
   | parameter_list ',' error                { $$ = $1; ListAdd($1, null); }
   | parameter_list_error error
	;

/****** STATEMENTS *******************************************************************/
statement:
	  labeled_statement
   | attrib { $$ = MkExpressionStmt(null); FreeAttrib($1); }   // Ignoring this for now... ( For __attribute__ ((__unused__)) )
	| compound_statement
   | ';' { $$ = MkExpressionStmt(null); }
   | ':' { $$ = MkExpressionStmt(null); }
	| expression ';'              { $$ = MkExpressionStmt($1); $$.loc = @$; }
	| selection_statement
	| iteration_statement
	| jump_statement
   | asm_statement
   | firewatchers ';'
   | stopwatching ';'
   | watch_definition ';'
	;

statement_error:
	labeled_statement_error          { $$ = $1; Compiler_Error($"syntax error\n"); }
   | iteration_statement_error      { $$ = $1; Compiler_Error($"syntax error\n"); }
   | compound_statement_error       { $$ = $1; Compiler_Error($"syntax error\n"); }
	| selection_statement_error      { $$ = $1; Compiler_Error($"syntax error\n"); }
   | jump_statement_error           { $$ = $1; Compiler_Error($"syntax error\n"); }
	| jump_statement error           { $$ = $1; Compiler_Error($"syntax error\n"); }
   | expression_error { $$ = MkExpressionStmt($1); Compiler_Error($"syntax error\n"); $$.loc = @1; }
   ;

asm_field:
     string_literal { $$ = MkAsmField($1, null, null); $$.loc = @1; }
   | string_literal '(' assignment_expression ')' { $$ = MkAsmField($1, $3, null); $$.loc = @$; }
   | '[' identifier ']' string_literal '(' assignment_expression ')' { $$ = MkAsmField($4, $6, $2); $$.loc = @$; }
   ;

asm_field_list:
     asm_field { $$ = MkListOne($1); }
   | asm_field_list ',' asm_field { ListAdd($$, $3); }
   | { $$ = null; }
   ;

asm_statement:
     ASM type_qualifier '(' string_literal ')' ';'                                                          { $$ = MkAsmStmt($2, $4, null, null, null); $$.loc = @$; }
   | ASM type_qualifier '(' string_literal ':' asm_field_list ')' ';'                                       { $$ = MkAsmStmt($2, $4, $6, null, null); $$.loc = @$; }
   | ASM type_qualifier '(' string_literal ':' asm_field_list ':' asm_field_list ')' ';'                    { $$ = MkAsmStmt($2, $4, $6, $8, null); $$.loc = @$; }
   | ASM type_qualifier '(' string_literal ':' asm_field_list ':' asm_field_list ':' asm_field_list ')' ';' { $$ = MkAsmStmt($2, $4, $6, $8, $10); $$.loc = @$; }

   | ASM type_qualifier '(' string_literal IDENTIFIER asm_field_list ')' ';'                                { $$ = MkAsmStmt($2, $4, null, $6, null); $$.loc = @$; }
   | ASM type_qualifier '(' string_literal IDENTIFIER asm_field_list ':' asm_field_list ')' ';'             { $$ = MkAsmStmt($2, $4, null, $6, $8); $$.loc = @$; }
   | ASM type_qualifier '(' string_literal ':' asm_field_list IDENTIFIER asm_field_list ')' ';'             { $$ = MkAsmStmt($2, $4, $6, null, $8); $$.loc = @$; }

   | ASM '(' string_literal ')' ';'                                                                         { $$ = MkAsmStmt(null, $3, null, null, null); $$.loc = @$; }
   | ASM '(' string_literal ':' asm_field_list ')' ';'                                                      { $$ = MkAsmStmt(null, $3, $5, null, null); $$.loc = @$; }
   | ASM '(' string_literal ':' asm_field_list ':' asm_field_list ')' ';'                                   { $$ = MkAsmStmt(null, $3, $5, $7, null); $$.loc = @$; }
   | ASM '(' string_literal ':' asm_field_list ':' asm_field_list ':' asm_field_list ')' ';'                { $$ = MkAsmStmt(null, $3, $5, $7, $9); $$.loc = @$; }

   | ASM '(' string_literal IDENTIFIER asm_field_list ')' ';'                                               { $$ = MkAsmStmt(null, $3, null, $5, null); $$.loc = @$; }
   | ASM '(' string_literal IDENTIFIER asm_field_list ':' asm_field_list ')' ';'                            { $$ = MkAsmStmt(null, $3, null, $5, $7); $$.loc = @$; }
   | ASM '(' string_literal ':' asm_field_list IDENTIFIER asm_field_list ')' ';'                            { $$ = MkAsmStmt(null, $3, $5, null, $7); $$.loc = @$; }
   ;

labeled_statement:
     identifier ':' statement                      { $$ = MkLabeledStmt($1, $3); $$.loc = @$; }
   | CASE constant_expression ':' statement        { /*if($4.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt($2, $4); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE constant_expression_error ':' statement  { /*if($4.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt($2, $4); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE ':' statement                            { /*if($3.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt(MkExpDummy(), $3); $$.caseStmt.exp.loc = @2; $$.loc = @$; $$.caseStmt.exp.loc.start = @1.end; }
   | DEFAULT ':' statement                         { /*if($3.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt(null, $3); $$.loc = @$; }

   | identifier ':' declaration                      { Statement stmt = MkBadDeclStmt($3); stmt.loc = @3; Compiler_Warning(C89_DECL_WARNING); $$ = MkLabeledStmt($1, stmt); $$.loc = @$; }
   | CASE constant_expression ':' declaration        { Statement stmt = MkBadDeclStmt($4); stmt.loc = @4; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt($2, stmt); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE constant_expression_error ':' declaration  { Statement stmt = MkBadDeclStmt($4); stmt.loc = @4; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt($2, stmt); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE ':' declaration                            { Statement stmt = MkBadDeclStmt($3); stmt.loc = @3; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt(MkExpDummy(), stmt); $$.caseStmt.exp.loc = @2; $$.loc = @$; $$.caseStmt.exp.loc.start = @1.end; }
   | DEFAULT ':' declaration                         { Statement stmt = MkBadDeclStmt($3); stmt.loc = @3; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt(null, stmt); $$.loc = @$; }
   ;

labeled_statement_error:
	  identifier ':' statement_error                { $$ = MkLabeledStmt($1, $3); $$.loc = @$; }
   | CASE constant_expression ':' statement_error  { /*if($4.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt($2, $4); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE constant_expression_error ':' statement_error  { /*if($4.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt($2, $4); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE ':' statement_error  { /*if($3.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt(MkExpDummy(), $3); $$.caseStmt.exp.loc = @2; $$.loc = @$; $$.caseStmt.exp.loc.start = @1.end; }
   | CASE ':' { $$ = MkCaseStmt(MkExpDummy(), null); $$.caseStmt.exp.loc = @2; $$.loc = @$; $$.caseStmt.exp.loc.start = @1.end; }
	| DEFAULT ':' statement_error                   { /*if($3.type == labeledStmt) Compiler_Warning(CASE_LABELED_STMT_WARNING);*/ $$ = MkCaseStmt(null, $3); $$.loc = @$; }
   | DEFAULT ':'  { $$ = MkCaseStmt(null, null); $$.loc = @$; }

   | identifier ':' declaration_error                      { Statement stmt = MkBadDeclStmt($3); stmt.loc = @3; Compiler_Warning(C89_DECL_WARNING); $$ = MkLabeledStmt($1, stmt); $$.loc = @$; }
   | CASE constant_expression ':' declaration_error        { Statement stmt = MkBadDeclStmt($4); stmt.loc = @4; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt($2, stmt); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE constant_expression_error ':' declaration_error  { Statement stmt = MkBadDeclStmt($4); stmt.loc = @4; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt($2, stmt); $$.loc = @$; $2.loc.start = @1.end; }
   | CASE ':' declaration_error                            { Statement stmt = MkBadDeclStmt($3); stmt.loc = @3; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt(MkExpDummy(), stmt); $$.caseStmt.exp.loc = @2; $$.loc = @$; $$.caseStmt.exp.loc.start = @1.end; }
   | DEFAULT ':' declaration_error                         { Statement stmt = MkBadDeclStmt($3); stmt.loc = @3; Compiler_Warning(C89_DECL_WARNING); $$ = MkCaseStmt(null, stmt); $$.loc = @$; }
	;

declaration_mode:
     PUBLIC    { $$ = structDeclMode = declMode = publicAccess; }
   | PRIVATE   { $$ = structDeclMode = declMode = privateAccess; }
   | DEFAULT   { $$ = structDeclMode = declMode = defaultAccess; }
   ;

member_access:
     PUBLIC    { $$ = publicAccess; }
   | PRIVATE   { $$ = privateAccess; }
   ;

declaration:
	  declaration_specifiers ';'                       { $$ = MkDeclaration($1, null); $$.loc = @$; structDeclMode = defaultDeclMode; }
	| declaration_specifiers init_declarator_list ';'  { $$ = MkDeclaration($1, $2); $$.loc = @$; structDeclMode = defaultDeclMode; }
   | instantiation_named ';'                          { $$ = MkDeclarationInst($1); $$.loc = @$; structDeclMode = defaultDeclMode; }
   | declaration_error ';'                            { $$ = $1; structDeclMode = defaultDeclMode; }
   | STATIC_ASSERT '(' expression ')' { $$ = MkExpDummy(); $$.loc = @$; FreeList($3, FreeExpression); }
   | STATIC_ASSERT '(' expression ',' string_literal ')' { $$ = MkExpDummy(); $$.loc = @$; FreeList($3, FreeExpression); delete $5; }
	;

external_guess_declaration:
     external_guess_declaration_specifiers ';'                 { $$ = MkDeclaration($1, null); $$.loc = @$; }
   | external_guess_declaration_specifiers init_declarator_list ';'                { $$ = MkDeclaration($1, $2); $$.loc = @$; }
   | external_guess_declaration_specifiers_error init_declarator_list ';'                { $$ = MkDeclaration($1, $2); $$.loc = @$; }

   | external_guess_instantiation_named ';'                          { $$ = MkDeclarationInst($1); $$.loc = @$; }
   | DEFINE identifier '=' conditional_expression ';' { $$ = MkDeclarationDefine($2, $4); $$.loc = @$; }
   | STATIC DEFINE identifier '=' conditional_expression ';' { structDeclMode = declMode = staticAccess; $$ = MkDeclarationDefine($3, $5); $$.loc = @$; }
	;

external_guess_declaration_error:
   external_guess_declaration_specifiers error { $$ = MkDeclaration($1, null); $$.loc = @$; yyerrok; }
	;

declaration_error:
     declaration_specifiers error                       { $$ = MkDeclaration($1, null); $$.loc = @$; structDeclMode = defaultDeclMode; }
   | declaration_error error                            { structDeclMode = defaultDeclMode;  }

   | instantiation_named_error error                   { $$ = MkDeclarationInst($1); $$.loc = @$; structDeclMode = defaultDeclMode; }
   | instantiation_named error                         { $$ = MkDeclarationInst($1); $$.loc = @$; structDeclMode = defaultDeclMode; }
   | declaration_specifiers init_declarator_list_error  { $$ = MkDeclaration($1, $2); $$.loc = @$; structDeclMode = defaultDeclMode; }
   ;

declaration_list:
	  declaration                       { $$ = MkList(); ListAdd($$, $1); /*declMode = defaultDeclMode;*/ }
	| declaration_list declaration      { $$ = $1; ListAdd($1, $2); /*declMode = defaultDeclMode; */}
   | declaration_list_error declaration      { $$ = $1; ListAdd($1, $2); /*declMode = defaultDeclMode; */}
   | declaration_list error ';'       { $$ = $1; }
	;

declaration_list_error:
    declaration_error                       { $$ = MkList(); ListAdd($$, $1); }
   | declaration_list declaration_error { $$ = $1; ListAdd($1, $2); }
	;

statement_list:
	  statement                         { $$ = MkList(); ListAdd($$, $1); }
	| statement_list statement          { $$ = $1; ListAdd($1, $2); }
   | statement_list_error statement          { $$ = $1; ListAdd($1, $2); }
	;

statement_list_error:
     statement_error                   { $$ = MkList(); ListAdd($$, $1); }
   | statement_list statement_error          { $$ = $1; ListAdd($1, $2); }
   | statement_list_error statement_error          { $$ = $1; ListAdd($1, $2); }
   | statement_list declaration              { Statement stmt = MkBadDeclStmt($2); stmt.loc = @2; Compiler_Warning(C89_DECL_WARNING); $$ = $1; ListAdd($1, stmt); /*declMode = defaultDeclMode;*/ }
   | statement_list_error declaration        { Statement stmt = MkBadDeclStmt($2); stmt.loc = @2; Compiler_Warning(C89_DECL_WARNING); $$ = $1; ListAdd($1, stmt); /*declMode = defaultDeclMode;*/ }
   | statement_list declaration_error        { Statement stmt = MkBadDeclStmt($2); stmt.loc = @2; Compiler_Warning(C89_DECL_WARNING); $$ = $1; ListAdd($1, stmt); /*declMode = defaultDeclMode;*/ }
   | statement_list_error declaration_error  { Statement stmt = MkBadDeclStmt($2); stmt.loc = @2; Compiler_Warning(C89_DECL_WARNING); $$ = $1; ListAdd($1, stmt); /*declMode = defaultDeclMode;*/ }
   ;

compound_inside:
	statement_list                      { $$ = MkCompoundStmt(null, $1); }
	| declaration_list                  { $$ = MkCompoundStmt($1, null); }
	| declaration_list statement_list   { $$ = MkCompoundStmt($1, $2); }
   | declaration_list_error statement_list   { $$ = MkCompoundStmt($1, $2); }
   ;

compound_inside_error:
	statement_list_error                      { $$ = MkCompoundStmt(null, $1); }
	| declaration_list_error                  { $$ = MkCompoundStmt($1, null); }
	| declaration_list statement_list_error   { $$ = MkCompoundStmt($1, $2); }
   | declaration_list_error statement_list_error   { $$ = MkCompoundStmt($1, $2); }
   ;

compound_start:
    '{' { $<context>$ = PushContext(); }
    ;

compound_statement:
   compound_statement_error '}'     { $$ = $1; $$.loc = @$; }
	;

compound_statement_error:
	  compound_start compound_inside_error
      { $$ = $2; $$.compound.context = $<context>1; PopContext($<context>1); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++; }
   | 	compound_start
      { $$ = MkCompoundStmt(null, null); $$.compound.context = $<context>1; PopContext($<context>1); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++; }

	| compound_start compound_inside
      { $$ = $2; $$.compound.context = $<context>1; PopContext($<context>1); $$.loc = @$; $$.loc.end.charPos++; $$.loc.end.pos++; }

	;

expression_statement:
	';'                         { $$ = MkExpressionStmt(null); $$.loc = @$; }
	| expression ';'              { $$ = MkExpressionStmt($1); $$.loc = @$; }
   | expression_error ';'            { $$ = MkExpressionStmt($1); $$.loc = @$; }
	;

selection_statement:
	  IF '(' expression ')' statement %prec IFX        { $$ = MkIfStmt($3, $5, null); $$.loc = @$; }
   | IF '(' expression_error ')' statement %prec IFX        { $$ = MkIfStmt($3, $5, null); $$.loc = @$; }
	| IF '(' expression ')' statement ELSE statement   { $$ = MkIfStmt($3, $5, $7); $$.loc = @$; }
   | IF '(' expression_error ')' statement ELSE statement   { $$ = MkIfStmt($3, $5, $7); $$.loc = @$; }
	| SWITCH '(' expression ')' statement              { $$ = MkSwitchStmt($3, $5); $$.loc = @$; }
   | SWITCH '(' expression_error ')' statement              { $$ = MkSwitchStmt($3, $5); $$.loc = @$; }
	;

selection_statement_error:
   IF '(' expression_error    { $$ = MkIfStmt($3, null, null); $$.loc = @$; }
   | selection_statement error
   ;

iteration_statement:
	  WHILE '(' expression ')' statement           { $$ = MkWhileStmt($3, $5); $$.loc = @$; }
   | WHILE '(' expression_error statement     { $$ = MkWhileStmt($3, $4); $$.loc = @$; }
   | WHILE '(' ')' statement     { yyerror(); $$ = MkWhileStmt(null, $4); $$.loc = @$; }

	| DO statement WHILE '(' expression ')' ';'     { $$ = MkDoWhileStmt($2, $5); $$.loc = @$; }
   | DO statement WHILE '(' expression_error ';'     { $$ = MkDoWhileStmt($2, $5); $$.loc = @$; }

	| FOR '(' expression_statement expression_statement ')' statement                   { $$ = MkForStmt($3, $4, null, $6); $$.loc = @$; }
   | FOR '(' expression_statement ')' statement                   { yyerror(); $$ = MkForStmt($3, null, null, $5); $$.loc = @$; }
	| FOR '(' expression_statement expression_statement expression ')' statement        { $$ = MkForStmt($3, $4, $5, $7); $$.loc = @$; }
   | FOR '(' expression_statement expression_statement expression_error statement  { $$ = MkForStmt($3, $4, $5, $6 ); $$.loc = @$; }
   | FOR '(' ')' statement  { yyerror(); $$ = MkForStmt(null, null, null, $4); $$.loc = @$; }

   | FOR '(' identifier ':' expression ')' statement                   { $$ = MkForEachStmt($3, $5, null, $7); $$.loc = @$; }
   | FOR '(' identifier ':' expression ';' expression ')' statement    { $$ = MkForEachStmt($3, $5, $7, $9); $$.loc = @$; }
	;

iteration_statement_error:
   FOR '(' error                                                        { $$ = MkForStmt(null, null, null, null); $$.loc = @$; } |
	FOR '(' expression_error error                                       { $$ = MkForStmt(MkExpressionStmt($3), null, null, null); $$.forStmt.init.loc = @3; $$.loc = @$; } |
	FOR '(' expression_statement error                                   { $$ = MkForStmt($3, null, null, null); $$.loc = @$; } |
	FOR '(' expression_statement expression_error error                  { $$ = MkForStmt($3, MkExpressionStmt($4), null, null); $$.loc = @$; $$.forStmt.check.loc = @4; } |
   /* Useless rules due to conflicts
	FOR '(' expression_statement expression_statement error              { $$ = MkForStmt($3, $4, null, null); $$.loc = @$; } |
   */
   FOR '(' expression_statement expression_statement expression_error   { $$ = MkForStmt($3, $4, $5, null); $$.loc = @$; } |
	FOR '(' expression_statement expression_statement ')' statement_error                   { $$ = MkForStmt($3, $4, null, $6); $$.loc = @$; } |
	FOR '(' expression_statement expression_statement expression ')' statement_error  { $$ = MkForStmt($3, $4, $5, $7); $$.loc = @$; } |
   FOR '(' expression_statement expression_statement expression_error statement_error  { $$ = MkForStmt($3, $4, $5, $6 ); $$.loc = @$; } |

	DO statement WHILE '(' expression ')'     { yyerror(); $$ = MkDoWhileStmt($2, $5); $$.loc = @$; } |
	DO statement WHILE '(' expression      { yyerror(); $$ = MkDoWhileStmt($2, $5); $$.loc = @$; } |
   DO statement WHILE '(' expression_error      { $$ = MkDoWhileStmt($2, $5); $$.loc = @$; } |
	DO statement WHILE '(' { $$ = MkDoWhileStmt($2, null); $$.loc = @$; } |
   DO statement WHILE { yyerror(); $$ = MkDoWhileStmt($2, null); $$.loc = @$; } |
	DO statement { yyerror(); $$ = MkDoWhileStmt($2, null); $$.loc = @$; } |
   DO { yyerror(); $$ = MkDoWhileStmt(null, null); $$.loc = @$; } |


   WHILE error           { $$ = MkWhileStmt(null, null); $$.loc = @$; } |
   /* Useless rules due to conflicts
	WHILE '(' error           { $$ = MkWhileStmt(null, null); $$.loc = @$; } |
   */
   WHILE '(' ')' error           { $$ = MkWhileStmt(null, null); $$.loc = @$; } |
	WHILE '(' expression_error           { $$ = MkWhileStmt($3, null); $$.loc = @$; } |
   /* Useless rules due to conflicts
   WHILE '(' expression_error error          { $$ = MkWhileStmt($3, null); $$.loc = @$; } |
   */
	WHILE '(' expression ')' statement_error           { $$ = MkWhileStmt($3, $5); $$.loc = @$; } |
   WHILE '(' expression_error statement_error     { $$ = MkWhileStmt($3, $4 ); $$.loc = @$; }


jump_statement:
	  GOTO identifier ';'   { $$ = MkGotoStmt($2); $$.loc = @$; }
	| CONTINUE ';'          { $$ = MkContinueStmt(); $$.loc = @$; }
	| BREAK ';'             { $$ = MkBreakStmt(); $$.loc = @$; }
	| RETURN ';'            { Expression exp = MkExpDummy(); $$ = MkReturnStmt(MkListOne(exp)); $$.loc = @$; exp.loc = @2; }
	| RETURN expression ';' { $$ = MkReturnStmt($2); $$.loc = @$; }
   | RETURN expression_error ';' { $$ = MkReturnStmt($2); $$.loc = @$; }
	| RETURN anon_instantiation_expression ';' { $$ = MkReturnStmt(MkListOne($2)); $$.loc = @$; }
   | RETURN anon_instantiation_expression_error ';' { $$ = MkReturnStmt(MkListOne($2)); $$.loc = @$; }
	;

jump_statement_error:
     RETURN expression_error { $$ = MkReturnStmt($2); $$.loc = @$; } |
     RETURN anon_instantiation_expression_error { $$ = MkReturnStmt(MkListOne($2)); $$.loc = @$; } |
     RETURN { Expression exp = MkExpDummy(); $$ = MkReturnStmt(MkListOne(exp)); $$.loc = @$; exp.loc.start = exp.loc.end = @1.end; } |
     GOTO { $$ = MkGotoStmt(null); $$.loc = @$; }
	;

/*************************************************************************************/

function_definition:
	  external_guess_declaration_specifiers declarator_function declaration_list compound_statement      { $$ = MkFunction($1, $2, $3); ProcessFunctionBody($$, $4); $$.loc = @$; }
	| external_guess_declaration_specifiers declarator_function compound_statement
       { $$ = MkFunction($1, $2, null); ProcessFunctionBody($$, $3); $$.loc = @$; }
	| external_guess_declaration_specifiers declarator_function_type_ok declaration_list compound_statement      { $$ = MkFunction($1, $2, $3); ProcessFunctionBody($$, $4); $$.loc = @$; }
	| external_guess_declaration_specifiers declarator_function_type_ok compound_statement
       { $$ = MkFunction($1, $2, null); ProcessFunctionBody($$, $3); $$.loc = @$; }

	| declarator_function declaration_list compound_statement                             { $$ = MkFunction(null, $1, $2); ProcessFunctionBody($$, $3); $$.loc = @$; }
	| declarator_function compound_statement                                              { $$ = MkFunction(null, $1, null); ProcessFunctionBody($$, $2); $$.loc = @$;}
   ;
function_definition_error:
     external_guess_declaration_specifiers declarator_function declaration_list compound_statement_error      { $$ = MkFunction($1, $2, $3); ProcessFunctionBody($$, $4); $$.loc = @$; $$.loc.end = $4.loc.end; }
	| external_guess_declaration_specifiers declarator_function compound_statement_error                       { $$ = MkFunction($1, $2, null); ProcessFunctionBody($$, $3); $$.loc = @$; $$.loc.end = $3.loc.end; }
   | external_guess_declaration_specifiers declarator_function_type_ok declaration_list compound_statement_error      { $$ = MkFunction($1, $2, $3); ProcessFunctionBody($$, $4); $$.loc = @$; $$.loc.end = $4.loc.end; }
	| external_guess_declaration_specifiers declarator_function_type_ok compound_statement_error                       { $$ = MkFunction($1, $2, null); ProcessFunctionBody($$, $3); $$.loc = @$; $$.loc.end = $3.loc.end; }
	| declarator_function declaration_list compound_statement_error                             { $$ = MkFunction(null, $1, $2); ProcessFunctionBody($$, $3); $$.loc = @$; $$.loc.end = $3.loc.end; }
	| declarator_function compound_statement_error                                              { $$ = MkFunction(null, $1, null); ProcessFunctionBody($$, $2); $$.loc = @$; $$.loc.end = $2.loc.end; }
   ;

string_literal:
   STRING_LITERAL { $$ = CopyString(yytext); }
   | string_literal STRING_LITERAL
   {
      int len1 = strlen($1);
      int len2 = strlen(yytext);
      $$ = new byte[len1-1 + len2-1 + 1];
      memcpy($$, $1, len1-1);
      memcpy($$ + len1-1, yytext+1, len2);
      delete $1;
   }
   ;

external_declaration:
	  function_definition { $$ = MkExternalFunction($1); $$.loc = @$; $1.declMode = declMode; structDeclMode = declMode = defaultDeclMode; }
   | class
      { $$ = MkExternalClass($1);  $$.loc = @$; $1.declMode = (declMode != defaultAccess) ? declMode : privateAccess; structDeclMode = declMode = defaultDeclMode; }

   | external_guess_declaration_specifiers class
      { $$ = MkExternalClass($2);  $$.loc = @$; $2.declMode = (declMode != defaultAccess) ? declMode : privateAccess; structDeclMode = declMode = defaultDeclMode; FreeList($1, FreeSpecifier); }

	| external_guess_declaration
      { $$ = MkExternalDeclaration($1);  $$.loc = @$; $1.declMode = declMode; structDeclMode = declMode = defaultDeclMode; }
   | IMPORT string_literal { $$ = MkExternalImport($2, normalImport, (declMode != defaultAccess) ? declMode : privateAccess);  $$.loc = @$; }
   | IMPORT STATIC string_literal { $$ = MkExternalImport($3, staticImport, (declMode != defaultAccess) ? declMode : privateAccess);  $$.loc = @$; }
   | IMPORT identifier string_literal
   {
      bool isRemote = !strcmp($2.string, "remote");
      $$ = MkExternalImport($3, isRemote ? remoteImport : normalImport, (declMode != defaultAccess) ? declMode : privateAccess);
      $$.loc = @$;
      FreeIdentifier($2);
      if(!isRemote)
         yyerror();
   }

   | ';' { $$ = null; }

	| declaration_mode function_definition { $$ = MkExternalFunction($2); $$.loc = @$; $2.declMode = $1; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode class
      { $$ = MkExternalClass($2);  $$.loc = @$; $2.declMode = ($1 != defaultAccess) ? $1 : privateAccess; structDeclMode = declMode = defaultDeclMode; }
	| declaration_mode external_guess_declaration         { $$ = MkExternalDeclaration($2); $$.loc = @$; $2.declMode = $1; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode IMPORT string_literal { $$ = MkExternalImport($3, normalImport, ($1 != defaultAccess) ? $1 : privateAccess);  $$.loc = @$; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode IMPORT STATIC string_literal { $$ = MkExternalImport($4, staticImport, ($1 != defaultAccess) ? $1 : privateAccess);  $$.loc = @$; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode IMPORT identifier string_literal
   {
      bool isRemote = !strcmp($3.string, "remote");
      $$ = MkExternalImport($4, isRemote ? remoteImport : normalImport, ($1 != defaultAccess) ? $1 : privateAccess);
      $$.loc = @$;
      FreeIdentifier($3);
      structDeclMode = declMode = defaultDeclMode;
      if(!isRemote)
         yyerror();
   }
   | declaration_mode ':' { defaultDeclMode = $1; $$ = null; }
   | STATIC ':' { defaultDeclMode = staticAccess; $$ = null; }
   | NAMESPACE identifier { $$ = MkExternalNameSpace($2); $$.loc = @$; }
   | NAMESPACE strict_type { $$ = MkExternalNameSpace(MkIdentifier($2.name)); FreeSpecifier($2); $$.loc = @$; }
   | dbtable_definition { $$ = MkExternalDBTable($1); $$.loc = @$;  $1.declMode = (declMode != defaultAccess) ? declMode : privateAccess; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode  dbtable_definition { $$ = MkExternalDBTable($2); $$.loc = @$;  $2.declMode = ($1 != defaultAccess) ? declMode : privateAccess; structDeclMode = declMode = defaultDeclMode; }
   | PRAGMA { $$ = MkExternalPragma(yytext); $$.loc = @$; }
   | STATIC_ASSERT '(' expression ')' { $$ = MkExpDummy(); $$.loc = @$; FreeList($3, FreeExpression); }
   | STATIC_ASSERT '(' expression ',' string_literal ')' { $$ = MkExpDummy(); $$.loc = @$; FreeList($3, FreeExpression); delete $5; }
   ;

external_declaration_error:
     class_error               { yyerror(); $$ = MkExternalClass($1);  $$.loc = $1.loc; $1.declMode = (declMode != defaultAccess) ? declMode : privateAccess; structDeclMode = declMode = defaultDeclMode; }
   | external_guess_declaration_specifiers class_error
   {
      yyerror();
      FreeList($1, FreeSpecifier);
      $$ = MkExternalClass($2);
      $$.loc = $2.loc;
      $2.declMode = (declMode != defaultAccess) ? declMode : privateAccess;
      structDeclMode = declMode = defaultDeclMode;
   }
   | function_definition_error { yyerror(); $$ = MkExternalFunction($1); $$.loc = $1.loc;  $1.declMode = declMode; structDeclMode = declMode = defaultDeclMode; }

   | declaration_mode class_error               { yyerror(); $$ = MkExternalClass($2);  $$.loc = $2.loc; $2.declMode = ($1 != defaultAccess) ? $1 : privateAccess; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode function_definition_error { yyerror(); $$ = MkExternalFunction($2); $$.loc = $2.loc; $2.declMode = $1; structDeclMode = declMode = defaultDeclMode; }

	| external_guess_declaration_error
      { yyerror(); $$ = MkExternalDeclaration($1);  $$.loc = @$; $1.declMode = declMode; structDeclMode = declMode = defaultDeclMode; }
   | declaration_mode external_guess_declaration_error         { yyerror(); $$ = MkExternalDeclaration($2); $$.loc = @$; $2.declMode = $1; structDeclMode = declMode = defaultDeclMode; }
   ;

translation_unit_error:
     external_declaration_error                    { $$ = MkList(); ListAdd($$, $1); ast = $$; }
   | translation_unit external_declaration_error   { $$ = $1; ListAdd($1, $2); }
   | translation_unit_error external_declaration_error   { $$ = $1; ListAdd($1, $2); }
   | translation_unit error
   | translation_unit_error error
	;

translation_unit:
	  external_declaration                    { $$ = MkList(); ListAdd($$, $1); ast = $$; }
	| translation_unit external_declaration   { $$ = $1; ListAdd($1, $2); }
   | translation_unit_error class
      { External _class = MkExternalClass($2); $$ = $1; ListAdd($1, _class); _class.loc = @2;  $2.declMode = (declMode != defaultAccess) ? declMode : privateAccess; structDeclMode = declMode = defaultDeclMode; }
   | translation_unit_error declaration_mode class
      { External _class = MkExternalClass($3); $$ = $1; ListAdd($1, _class); _class.loc = @3;  $3.declMode = ($2 != defaultAccess) ? $2 : privateAccess; structDeclMode = declMode = defaultDeclMode; }
	;

thefile:
   translation_unit
   | translation_unit_error
   | { ast = MkList(); }
   ;

dbtable_definition:
     DBTABLE string_literal identifier   '{' dbfield_definition_list '}' { Symbol symbol = DeclClassAddNameSpace($3._class, $3.string); FreeIdentifier($3); $$ = MkDBTableDef($2, symbol, $5); }
   | DBTABLE string_literal strict_type  '{' dbfield_definition_list '}' { Symbol symbol = DeclClass($3.nsSpec, $3.name); FreeSpecifier($3); $$ = MkDBTableDef($2, symbol, $5); }
   | DBTABLE string_literal '{' dbfield_definition_list '}' { $$ = MkDBTableDef($2, null, $4); }
   ;

dbfield_entry:
   guess_declaration_specifiers identifier string_literal ';' { $$ = MkDBFieldEntry(MkTypeName($1, null), $2, $3); }
   ;

dbindex_item:
     identifier      { $$ = MkDBIndexItem($1, ascending); }
   | '>' identifier  { $$ = MkDBIndexItem($2, descending); }
   | '<' identifier  { $$ = MkDBIndexItem($2, ascending); }
   ;

dbindex_item_list:
     dbindex_item                         { $$ = MkList(); ListAdd($$, $1); }
   | dbindex_item_list ',' dbindex_item   { ListAdd($1, $3); }
   ;

dbindex_entry:
     DBINDEX dbindex_item_list ';'             { $$ = MkDBIndexEntry($2, null); }
   | DBINDEX dbindex_item_list identifier ';'  { $$ = MkDBIndexEntry($2, $3); }
   ;

dbfield_definition_list:
     dbfield_entry                           { $$ = MkList(); ListAdd($$, $1); }
   | dbindex_entry                           { $$ = MkList(); ListAdd($$, $1); }
   | dbfield_definition_list dbfield_entry   { ListAdd($1, $2); }
   | dbfield_definition_list dbindex_entry   { ListAdd($1, $2); }
   ;

database_open:
   DATABASE_OPEN '(' assignment_expression ',' assignment_expression ')'     { $$ = MkExpDBOpen($3, $5); }
   ;

dbfield:
   DBFIELD '(' string_literal ',' identifier ')'      { $$ = MkExpDBField($3, $5); }
   ;

dbindex:
   DBINDEX '(' string_literal ',' identifier ')'      { $$ = MkExpDBIndex($3, $5); }
   ;

dbtable:
   DBTABLE '(' string_literal ')'                     { $$ = MkExpDBTable($3); }
   ;

%%
