import "lexing"
import "astNode"
import "specifiers"
import "declarators"

static TokenType opPrec[][4] =
{
   { '*', '/', '%' },
   { '+', '-' },
   { LEFT_OP, RIGHT_OP },
   { '<', '>', LE_OP, GE_OP },
   { EQ_OP, NE_OP },
   { '&' },
   { '^' },
   { '|' },
   { AND_OP },
   { OR_OP }
};

static define numPrec = sizeof(opPrec) / sizeof(opPrec[0]);

static bool isPrecedence(TokenType this, int l)
{
   // TO OPTIMIZE: return opPrec[this] == l
   if(this)
   {
      int o;
      for(o = 0; o < sizeof(opPrec[0]) / sizeof(opPrec[0][0]); o++)
      {
         TokenType op = opPrec[l][o];
         if(this == op)
            return true;
         else if(!op)
            break;
      }
   }
   return false;
}

public class ASTIdentifier : ASTNode
{
public:
   // Symbol classSym;
   // Specifier _class;
   String string;
   // Identifier badID;

   void print()
   {
      Print(string);
   }

   ASTIdentifier ::parse()
   {
      readToken();
      return { string = CopyString(token.text) };
   }
};

public class ASTTypeName : ASTNode
{
public:
   SpecsList qualifiers;
   ASTDeclarator declarator;
   ClassObjectType classObjectType;
   ASTExpression bitCount;

   ASTTypeName ::parse()
   {
      SpecsList specs = SpecsList::parse();
      ASTDeclarator decl = ASTDeclarator::parse();
      if(specs || decl)
         return { qualifiers = specs, declarator = decl };
      return null;
   }

   void print()
   {
      if(qualifiers) qualifiers.print();
      if(declarator) { if(qualifiers) Print(" "); declarator.print(); }
   }
};

// Expressions
public class ASTExpression : ASTNode
{
public:
   ExpressionType type;

   virtual float Compute();

   bool debugValue;

   DataValue val;

   uint64 address;
   bool hasAddress;

   // *** COMPILING DATA ***
   Type expType;
   Type destType;

   ExpUsage usage;
   int tempCount;
   bool byReference;
   bool isConstant;
   bool addedThis;
   bool needCast;
   bool thisPtr;

   ASTExpression ::parse()
   {
      return ExpAssignment::parse();
   }
/*
   void Clear()
   {
      debugValue = false;
      val = { 0 };
      address = 0;
      hasAddress = false;

      expType = null;
      destType = null;

      usage = 0;
      tempCount = 0;
      byReference = false;
      isConstant = false;
      addedThis = false;
      needCast = false;
      thisPtr = false;
   }
*/
}

public class ExpList : ASTList<ASTExpression>
{
   ExpList ::parse()
   {
      return (ExpList)ASTList::parse(class(ExpList), ASTExpression::parse, ',');
   }
}

/*
public class ExpCompound : ASTExpression
{
   ASTStatement compound;
}
*/

static ASTExpression parseSimplePrimaryExpression()
{
/*
simple_primary_expression:
     instantiation_unnamed      { $$ = MkExpInstance($1); $$.loc = @$; }
   | EXTENSION '(' compound_statement ')'    { $$ = MkExpExtensionCompound($3); $$.loc = @$; }
   | EXTENSION '(' expression ')'    { $$ = MkExpExtensionExpression($3); $$.loc = @$; }
   | EXTENSION '(' type_name ')' initializer     { $$ = MkExpExtensionInitializer($3, $5); $$.loc = @$; }
   | EXTENSION '(' type_name ')' '(' type_name ')' initializer     { $$ = MkExpExtensionInitializer($3, MkInitializerAssignment(MkExpExtensionInitializer($6, $8))); $$.loc = @$; }
   | i18n_string
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

   | '[' argument_expression_list ']' { $$ = MkExpArray($2); $$.loc = @$; }
   ;
*/
   if(peekToken().type == CONSTANT)
      return ExpConstant::parse();
   else if(nextToken.type == IDENTIFIER)
   {
      ExpIdentifier exp = ExpIdentifier::parse();
      if(peekToken().type == '{')
      {
         SpecsList specs { };
         specs.Add(SpecName { name = exp.identifier.string });
         return ExpInstance::parse(specs, null);
      }
      return exp;
   }
   else if(nextToken.type == STRING_LITERAL)
      return ExpString::parse();
   else if(nextToken.type == '{')
      return ExpInstance::parse(null, null);
   else
      return null;
}

static ASTExpression parsePrimaryExpression()
{
   if(peekToken().type == '(')
   {
      ExpBrackets exp { };
      readToken();
      exp.list = ExpList::parse();
      if(peekToken().type == ')')
         readToken();
      return exp;
   }
   else
      return parseSimplePrimaryExpression();
}

static ASTExpression parsePostfixExpression()
{
   ASTExpression exp = parsePrimaryExpression();
   while(true)
   {
      if(peekToken().type == '[')
         exp = ExpIndex::parse(exp);
      else if(nextToken.type == '(')
         exp = ExpCall::parse(exp);
      else if(nextToken.type == '.')
         exp = ExpMember::parse(exp);
      else if(nextToken.type == PTR_OP)
         exp = ExpPointer::parse(exp);
      else if(nextToken.type == INC_OP || nextToken.type == DEC_OP)
      {
         readToken();
         exp = ExpOperation { exp1 = exp, op = token.type };
      }
      else
         break;
   }
   return exp;
}

static ASTExpression parseUnaryExpression()
{
   peekToken();
   if(nextToken.type == INC_OP || nextToken.type == DEC_OP)
   {
      readToken();
      return ExpOperation { op = token.type, exp2 = parseUnaryExpression() };
   }
   else if(nextToken.type.isUnaryOperator)
   {
      readToken();
      return ExpOperation { op = token.type, exp2 = ExpCast::parse() };
   }
   /*
   else if(nextToken.type == SIZEOF)
      return ExpSizeof::parse();
   else if(nextToken.type == ALIGNOF)
      return ExpAlignOf::parse();
   */
   else
      return parsePostfixExpression();
}

public class ExpConstant : ASTExpression
{
   String constant;

   void print()
   {
      Print(constant);
   }

   ExpConstant ::parse()
   {
      return { constant = CopyString(readToken().text); };
   }

   float Compute()
   {
      return (float)atof(constant);
   }
}

public class ExpString : ASTExpression
{
   String string;

   void print()
   {
      Print(string);
   }

   ExpString ::parse()
   {
      return { string = CopyString(readToken().text) };
   }
}

public class ExpIdentifier : ASTExpression
{
   ASTIdentifier identifier;

   void print()
   {
      identifier.print();
   }

   ExpIdentifier ::parse()
   {
      return { identifier = ASTIdentifier::parse() };
   }
}

public class ExpOperation : ASTExpression
{
   TokenType op;
   ASTExpression exp1, exp2;

   void print()
   {
      if(exp1) { exp1.print(); if(exp2) Print(" "); }
      op.print();
      if(exp2) { if(exp1) Print(" "); exp2.print(); }
   }

   ASTExpression ::parse(int prec)
   {
      ASTExpression exp = (prec > 0) ? parse(prec-1) : ExpCast::parse();
      while(isPrecedence(peekToken().type, prec))
         exp = ExpOperation { exp1 = exp, op = readToken().type, exp2 = (prec > 0) ? parse(prec-1) : ExpCast::parse() };
      return exp;
   }

   float Compute()
   {
      if(exp1 && exp2)
      {
         switch(op)
         {
            case '*': return exp1.Compute() * exp2.Compute();
            case '/': return exp1.Compute() / exp2.Compute();
            case '-': return exp1.Compute() - exp2.Compute();
            case '+': return exp1.Compute() + exp2.Compute();
         }
      }
      else if(exp2)
      {
         switch(op)
         {
            case '-': return -exp2.Compute();
            case '+': return  exp2.Compute();
         }
      }
      return 0;
   }
}

public class ExpAssignment : ExpOperation
{
   ASTExpression ::parse()
   {
      ASTExpression exp = ExpConditional::parse();
      if(peekToken().type.isAssignmentOperator)
         exp = ExpAssignment { exp1 = exp, op = readToken().type, exp2 = ExpAssignment::parse() };
      return exp;
   }
}

public class ExpBrackets : ASTExpression
{
public:
   ExpList list;

   void print()
   {
      Print("(");
      if(list) list.print();
      Print(")");
   }

   float Compute()
   {
      return (list && list.lastIterator.data) ? list.lastIterator.data.Compute() : 0;
   }
}

public class ExpConditional : ASTExpression
{
public:
   ASTExpression condition;
   ExpList expList;
   ASTExpression elseExp;

   void print()
   {
      if(condition) condition.print();
      Print(" ? ");
      if(expList) expList.print();
      Print(" : ");
      if(elseExp)
         elseExp.print();
   }

   ASTExpression ::parse()
   {
      ASTExpression exp = ExpOperation::parse(numPrec-1);
      if(peekToken().type == '?')
      {
         exp = ExpConditional { condition = exp, expList = ExpList::parse() };
         if(peekToken().type == ':')
            ((ExpConditional)exp).elseExp = ExpConditional::parse();
      }
      return exp;
   }
}

public class ExpIndex : ASTExpression
{
   ASTExpression exp;
   ExpList index;

   void print()
   {
      if(exp) exp.print();
      Print("[");
      if(index) index.print();
      Print("]");
   }

   ExpIndex ::parse(ASTExpression e)
   {
      ExpIndex exp;
      readToken();
      exp = ExpIndex { exp = e, index = ExpList::parse() };
      if(peekToken().type == ']')
         readToken();
      return exp;
   }
}

public class ExpMember : ASTExpression
{
   ASTExpression exp;
   ASTIdentifier member;
   // MemberType memberType;
   // bool thisPtr;

   void print()
   {
      if(exp) exp.print();
      Print(".");
      if(member)
         member.print();
   }

   ExpMember ::parse(ASTExpression e)
   {
      readToken();
      return { exp = e, member = ASTIdentifier::parse() };
   }
}

public class ExpPointer : ExpMember
{
   void print()
   {
      if(exp) exp.print();
      Print("->");
      if(member)
         member.print();
   }

   ExpPointer ::parse(ASTExpression e)
   {
      readToken();
      return { exp = e, member = ASTIdentifier::parse() };
   }
}

public class ExpCall : ASTExpression
{
   ASTExpression exp;
   ExpList arguments;
   // Location argLoc;

   void print()
   {
      if(exp) exp.print();
      Print("(");
      if(arguments) arguments.print();
      Print(")");
   }

   ExpCall ::parse(ASTExpression e)
   {
      ExpCall exp;
      readToken();
      exp = ExpCall { exp = e, arguments = ExpList::parse() };
      if(peekToken().type == ')')
         readToken();
      return exp;
   }
}

public class ExpCast : ASTExpression
{
   ASTTypeName typeName;
   ASTExpression exp;

   ASTExpression ::parse()
   {
      ASTExpression exp = parseUnaryExpression();
      // TODO: Deal with cast ambiguity
      return exp;
   }
}

public class ExpInstance : ASTExpression
{
   ASTInstantiation instance;

   ExpInstance ::parse(SpecsList specs, InitDeclList decls)
   {
      return { instance = ASTInstantiation::parse(specs, decls) };
   }

   void print()
   {
      if(instance) instance.print();
   }
}
/*
public class ExpSizeOf : ASTExpression
{
   ASTTypeName typeName;

   ExpSizeOf ::parse()
   {

   }
}

public class ExpAlignOf : ASTExpression
{
   ASTTypeName typeName;

   ExpAlignOf ::parse()
   {
   }
}
*/
/*
   union
   {
      struct
      {
         OldList * specifiers;
         ASTDeclarator decl;
      } _classExp;
      struct
      {
         Identifier id;
      } classData;
      TypeName typeName;
      Specifier _class;
      struct
      {
         TypeName typeName;
         Expression size;
      } _new;
      struct
      {
         TypeName typeName;
         Expression size;
         Expression exp;
      } _renew;
      struct
      {
         char * table;
         Identifier id;
      } db;
      struct
      {
         Expression ds;
         Expression name;
      } dbopen;
      struct
      {
         TypeName typeName;
         Initializer initializer;
      } initializer;
      struct
      {
         Expression exp;
         TypeName typeName;
      } vaArg;
   };
};
*/

public class InstanceInit : ASTNode
{
   InstanceInit ::parse()
   {
      int a = pushAmbiguity();
      SpecsList specs = SpecsList::parse();
      InitDeclList decls = InitDeclList::parse();

      peekToken();
      if(nextToken.type == '{' || (specs && decls))
      {
         clearAmbiguity();
         return InstInitFunction::parse(specs, decls);
      }
      else if(nextToken.type != '}')
      {
         popAmbiguity(a);
         return InstInitMember::parse();
      }
      return null;
   }
}

public class InstInitMember : InstanceInit
{
   MemberInitList members;

   InstInitMember ::parse()
   {
      MemberInitList list = MemberInitList::parse();

      return { members = list };
   }

   void print()
   {
      if(members) members.print();
   }
}

public class InstInitFunction : InstanceInit
{
   ASTClassFunction function;

   InstInitFunction ::parse(SpecsList specs, InitDeclList decls)
   {
      return { function = ASTClassFunction::parse(specs, decls) };
   }

   void print()
   {
      if(function) function.print();
   }
}

public class InstInitList : ASTList<InstanceInit>
{
   InstInitList ::parse()
   {
      return (InstInitList)ASTList::parse(class(InstInitList), InstanceInit::parse, 0);
   }

   void print()
   {
      ASTList::print();
   }
}

public class ASTInstantiation : ASTNode
{
public:
   ASTSpecifier _class;
   ASTExpression exp;

   InstInitList members;
   Symbol symbol;
   bool fullSet;
   bool isConstant;
   byte * data;
   Location nameLoc, insideLoc;
   bool built;

   ASTInstantiation ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTInstantiation inst { };
      if(specs && specs[0])
         inst._class = specs[0];

      if(decls && decls[0] && decls[0].declarator && decls[0].declarator._class == class(DeclIdentifier))
         inst.exp = ExpIdentifier { identifier = ((DeclIdentifier)decls[0].declarator).identifier };

      readToken();
      inst.members = InstInitList::parse();
      if(peekToken().type == '}')
         readToken();
      return inst;
   }

   void print()
   {
      bool multiLine = false;
      if(members)
      {
         for(m : members; m._class == class(InstInitFunction))
         {
            multiLine = true;
            break;
         }
      }

      if(_class) { _class.print(); if(!multiLine || exp) Print(" "); }
      if(exp) { exp.print(); if(!multiLine) Print(" "); }
      if(multiLine)
      {
         PrintLn("");
         printIndent();
      }
      Print("{");
      if(multiLine)
      {
         PrintLn("");
         indent++;
      }
      if(members && members[0])
      {
         if(multiLine)
         {
            Iterator<InstanceInit> it { members };
            while(it.Next())
            {
               InstanceInit init = it.data;
               Link nextLink = (Link)members.GetNext(it.pointer);
               if(init._class != class(InstInitFunction))
                  printIndent();
               init.print();
               if(init._class == class(InstInitMember))
                  Print(";");
               if(nextLink)
               {
                  InstanceInit next = nextLink ? (InstanceInit)nextLink.data : null;
                  PrintLn("");
                  if(next._class == class(InstInitFunction))
                     PrintLn("");
               }
               else if(init._class != class(InstInitFunction))
                  PrintLn("");
            }
         }
         else
         {
            Print(" ");
            members.print();
            Print(" ");
         }
      }
      else
         Print(" ");
      if(multiLine)
      {
         indent--;
         printIndent();
      }
      Print("}");
   }
};
