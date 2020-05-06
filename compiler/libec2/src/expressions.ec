import "lexing"
import "astNode"
import "specifiers"
import "declarators"

static TokenType2 opPrec[][4] =
{
   { '*', '/', '%' },
   { '+', '-' },
   { shiftLeft, shiftRight },
   { '<', '>', smallerEqual, greaterEqual },
   { equality, notEqual },
   { '&' },
   { '^' },
   { '|' },
   { logicalAnd },
   { logicalOr }
};

static define numPrec = sizeof(opPrec) / sizeof(opPrec[0]);

static bool isPrecedence(TokenType2 this, int l)
{
   // TO OPTIMIZE: return opPrec[this] == l
   if(this)
   {
      int o;
      for(o = 0; o < sizeof(opPrec[0]) / sizeof(opPrec[0][0]); o++)
      {
         TokenType2 op = opPrec[l][o];
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

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print(string);
      printEnd(out, o);
   }

   ASTIdentifier ::parse()
   {
      lexer.readToken();
      return { string = CopyString(lexer.token.text) };
   }

   ~ASTIdentifier()
   {
      delete string;
   }
};

public class ASTTypeName : ASTNode
{
public:
   SpecsList qualifiers;
   ASTDeclarator declarator;
   //ClassObjectType classObjectType;
   ASTExpression bitCount;

   ASTTypeName ::parse()
   {
      SpecsList specs = SpecsList::parse(true);
      ASTDeclarator decl = ASTDeclarator::parse();
      if(specs || decl)
         return { qualifiers = specs, declarator = decl };
      return null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(qualifiers) qualifiers.print(out, o);
      if(declarator) { if(qualifiers) out.Print(" "); declarator.print(out, o); }
      printEnd(out, o);
   }

   ~ASTTypeName()
   {
      delete qualifiers;
      delete declarator;
      delete bitCount;
   }
};

// Expressions
public class ASTExpression : ASTNode
{
public:
   // ExpressionType type;

   virtual float compute();

   bool debugValue;

   DataValue val;

   uint64 address;
   bool hasAddress;

   // *** COMPILING DATA ***
   //Type expType;
   //Type destType;

   //ExpUsage usage;
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
public:
   ExpList ::parse()
   {
      return (ExpList)ASTList::parse(class(ExpList), ASTExpression::parse, ',');
   }
}

/*
public class ExpCompound : ASTExpression
{
public:
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
   if(lexer.peekToken().type == constant)
      return ExpConstant::parse();
   else if(lexer.nextToken.type == identifier)
   {
      ExpIdentifier exp = ExpIdentifier::parse();
      if(lexer.peekToken().type == '{')
      {
         SpecsList specs { };
         specs.Add(SpecName { name = exp.identifier.string });
         return ExpInstance::parse(specs, null);
      }
      return exp;
   }
   else if(lexer.nextToken.type == dollar || lexer.nextToken.type == stringLiteral)
      return ExpString::parse();
   else if(lexer.nextToken.type == '{')
      return ExpInstance::parse(null, null);
   else if(lexer.nextToken.type == '[')
      return ExpArray::parse();
   else
      return null;
}

static ASTExpression parsePrimaryExpression()
{
   if(lexer.peekToken().type == '(')
   {
      ExpBrackets exp { };
      lexer.readToken();
      exp.list = ExpList::parse();
      if(lexer.peekToken().type == ')')
         lexer.readToken();
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
      if(lexer.peekToken().type == '[')
         exp = ExpIndex::parse(exp);
      else if(lexer.nextToken.type == '(')
         exp = ExpCall::parse(exp);
      else if(lexer.nextToken.type == '.')
         exp = ExpMember::parse(exp);
      else if(lexer.nextToken.type == ptrOp)
         exp = ExpPointer::parse(exp);
      else if(lexer.nextToken.type == increment || lexer.nextToken.type == decrement)
      {
         lexer.readToken();
         exp = ExpOperation { exp1 = exp, op = lexer.token.type };
      }
      else
         break;
   }
   return exp;
}

static ASTExpression parseUnaryExpression()
{
   lexer.peekToken();
   if(lexer.nextToken.type == increment || lexer.nextToken.type == decrement)
   {
      lexer.readToken();
      return ExpOperation { op = lexer.token.type, exp2 = parseUnaryExpression() };
   }
   else if(lexer.nextToken.type.isUnaryOperator)
   {
      lexer.readToken();
      return ExpOperation { op = lexer.token.type, exp2 = ExpCast::parse() };
   }
   /*
   else if(lexer.nextToken.type == SIZEOF)
      return ExpSizeof::parse();
   else if(lexer.nextToken.type == ALIGNOF)
      return ExpAlignOf::parse();
   */
   else
      return parsePostfixExpression();
}

public class ExpConstant : ASTExpression
{
public:
   char * constant;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print(constant);
      printEnd(out, o);
   }

   ExpConstant ::parse()
   {
      Token token = lexer.readToken();
      ExpConstant e { constant = CopyString(token.text) };
      return e;
   }

   float compute()
   {
      return (float)atof(constant);
   }

   ~ExpConstant()
   {
      delete constant;
   }
}

public class ExpString : ASTExpression
{
public:
   String string;
   String i18nContext;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print(string);
      printEnd(out, o);
   }

   ExpString ::parse()
   {
      String i18nContext = null;
      lexer.readToken();
      if(lexer.token.type == dollar)
      {
         lexer.readToken();
         if(lexer.peekToken().type == '.')
         {
            i18nContext = CopyString(lexer.token.text);
            lexer.readToken();
            if(lexer.peekToken().type == stringLiteral)
               lexer.readToken();
         }
         else
            i18nContext = CopyString("");
      }
      return { string = CopyString(lexer.token.text), i18nContext = i18nContext };
   }

   ~ExpString()
   {
      delete string;
      delete i18nContext;
   }
}

public class ExpIdentifier : ASTExpression
{
public:
   ASTIdentifier identifier;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      identifier.print(out, o);
      printEnd(out, o);
   }

   ExpIdentifier ::parse()
   {
      return { identifier = ASTIdentifier::parse() };
   }

   ~ExpIdentifier()
   {
      delete identifier;
   }
}

public class ExpOperation : ASTExpression
{
public:
   TokenType2 op;
   ASTExpression exp1, exp2;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp1) { exp1.print(out, o); if(exp2) out.Print(" "); }
      op.print(out, o);
      if(exp2) { if(exp1) out.Print(" "); exp2.print(out, o); }
      printEnd(out, o);
   }

   ASTExpression ::parse(int prec)
   {
      ASTExpression exp = (prec > 0) ? parse(prec-1) : ExpCast::parse();
      while(isPrecedence(lexer.peekToken().type, prec))
         exp = ExpOperation { exp1 = exp, op = lexer.readToken().type, exp2 = (prec > 0) ? parse(prec-1) : ExpCast::parse() };
      return exp;
   }

   float compute()
   {
      if(exp1 && exp2)
      {
         switch(op)
         {
            case '*': return exp1.compute() * exp2.compute();
            case '/': return exp1.compute() / exp2.compute();
            case '-': return exp1.compute() - exp2.compute();
            case '+': return exp1.compute() + exp2.compute();
         }
      }
      else if(exp2)
      {
         switch(op)
         {
            case '-': return -exp2.compute();
            case '+': return  exp2.compute();
         }
      }
      return 0;
   }

   ~ExpOperation()
   {
      delete exp1;
      delete exp2;
   }
}

public class ExpAssignment : ExpOperation
{
public:
   ASTExpression ::parse()
   {
      ASTExpression exp = ExpConditional::parse();
      if(lexer.peekToken().type.isAssignmentOperator)
         exp = ExpAssignment { exp1 = exp, op = lexer.readToken().type, exp2 = ExpAssignment::parse() };
      return exp;
   }
}

public class ExpBrackets : ASTExpression
{
public:
   ExpList list;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      printParenOpen(out);
      if(list) list.print(out, o);
      printParenClose(out);
      printEnd(out, o);
   }

   float compute()
   {
      return (list && list.lastIterator.data) ? list.lastIterator.data.compute() : 0;
   }

   ~ExpBrackets()
   {
      delete list;
   }
}

public class ExpConditional : ASTExpression
{
public:
   ASTExpression condition;
   ExpList expList;
   ASTExpression elseExp;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(condition) condition.print(out, o);
      out.Print(" ? ");
      if(expList) expList.print(out, o);
      out.Print(" : ");
      if(elseExp)
         elseExp.print(out, o);
      printEnd(out, o);
   }

   ASTExpression ::parse()
   {
      ASTExpression exp = ExpOperation::parse(numPrec-1);
      if(lexer.peekToken().type == '?')
      {
         lexer.readToken();
         exp = ExpConditional { condition = exp, expList = ExpList::parse() };
         if(lexer.peekToken().type == ':')
         {
            lexer.readToken();
            ((ExpConditional)exp).elseExp = ExpConditional::parse();
         }
      }
      return exp;
   }

   ~ExpConditional()
   {
      delete condition;
      delete expList;
      delete elseExp;
   }
}

public class ExpIndex : ASTExpression
{
public:
   ASTExpression exp;
   ExpList index;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp) exp.print(out, o);
      out.Print("[");
      if(index) index.print(out, o);
      out.Print("]");
      printEnd(out, o);
   }

   ExpIndex ::parse(ASTExpression e)
   {
      ExpIndex exp;
      lexer.readToken();
      exp = ExpIndex { exp = e, index = ExpList::parse() };
      if(lexer.peekToken().type == ']')
         lexer.readToken();
      return exp;
   }

   ~ExpIndex()
   {
      delete exp;
      delete index;
   }
}

public class ExpMember : ASTExpression
{
public:
   ASTExpression exp;
   ASTIdentifier member;
   // MemberType memberType;
   // bool thisPtr;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp) exp.print(out, o);
      out.Print(".");
      if(member)
         member.print(out, o);
      printEnd(out, o);
   }

   ExpMember ::parse(ASTExpression e)
   {
      lexer.readToken();
      return { exp = e, member = ASTIdentifier::parse() };
   }

   ~ExpMember()
   {
      delete exp;
      delete member;
   }
}

public class ExpPointer : ExpMember
{
public:
   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp) exp.print(out, o);
      out.Print("->");
      if(member)
         member.print(out, o);
      printEnd(out, o);
   }

   ExpPointer ::parse(ASTExpression e)
   {
      lexer.readToken();
      return { exp = e, member = ASTIdentifier::parse() };
   }
}

public class ExpCall : ASTExpression
{
public:
   ASTExpression exp;
   ExpList arguments;
   // Location argLoc;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp) exp.print(out, o);
      printParenOpen(out);
      if(arguments) arguments.print(out, o);
      printParenClose(out);
      printEnd(out, o);
   }

   ExpCall ::parse(ASTExpression e)
   {
      ExpCall exp;
      lexer.readToken();
      exp = ExpCall { exp = e, arguments = ExpList::parse() };
      if(lexer.peekToken().type == ')')
         lexer.readToken();
      return exp;
   }

   ~ExpCall()
   {
      delete exp;
      delete arguments;
   }
}

public class ExpArray : ASTExpression
{
public:
   ASTList<ASTExpression> elements;

   ExpArray ::parse()
   {
      ExpArray exp { };
      lexer.readToken();
      exp.elements = (ASTList<ASTExpression>)ASTList::parse(class(ASTList<ASTExpression>), ASTExpression::parse, ',');
      if(lexer.peekToken().type == ']')
         lexer.readToken();
      return exp;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(elements) elements.print(out, o);
      printEnd(out, o);
   }

   ~ExpArray()
   {
      delete elements;
   }
}

public class ExpCast : ASTExpression
{
public:
   ASTTypeName typeName;
   ASTExpression exp;

   ASTExpression ::parse()
   {
      ASTExpression exp = parseUnaryExpression();
      // TODO: Deal with cast ambiguity
      return exp;
   }

   ~ExpCast()
   {
      delete typeName;
      delete exp;
   }
}

public class ExpInstance : ASTExpression
{
public:
   ASTInstantiation instance;

   ExpInstance ::parse(SpecsList specs, InitDeclList decls)
   {
      return { instance = ASTInstantiation::parse(specs, decls) };
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(instance) instance.print(out, o);
      printEnd(out, o);
   }

   ~ExpInstance()
   {
      delete instance;
   }
}
/*
public class ExpSizeOf : ASTExpression
{
public:
   ASTTypeName typeName;

   ExpSizeOf ::parse()
   {

   }
}

public class ExpAlignOf : ASTExpression
{
public:
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
public:
   InstanceInit ::parse()
   {
      InstanceInit init = null;
      int a = lexer.pushAmbiguity();
      SpecsList specs = SpecsList::parse(true);
      InitDeclList decls = InitDeclList::parse();

      if(lexer.peekToken().type == '{') // || (specs && decls))
      {
         init = InstInitFunction::parse(specs, decls);
         if(init)
         {
            lexer.clearAmbiguity();
            specs = null, decls = null;
         }
      }
      else
      {
         lexer.popAmbiguity(a);
         a = lexer.pushAmbiguity();
         // Method without return type
         delete specs;
         delete decls;
         specs = SpecsList::parse(false);
         decls = InitDeclList::parse();
         if(lexer.peekToken().type == '{')
         {
            lexer.clearAmbiguity();
            init = InstInitFunction::parse(specs, decls);
            if(init)
               specs = null, decls = null;
         }
         else //if(lexer.peekToken().type != '}')
         {
            lexer.popAmbiguity(a);
            init = InstInitMember::parse();
         }
      }
      delete specs;
      delete decls;
      return init;
   }
}

public class InstInitMember : InstanceInit
{
public:
   MemberInitList members;

   InstInitMember ::parse()
   {
      MemberInitList list = MemberInitList::parse();
      return list ? { members = list } : null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(members) members.print(out, o);
      printEnd(out, o);
   }

   ~InstInitMember()
   {
      delete members;
   }
}

public class InstInitFunction : InstanceInit
{
public:
   ASTClassFunction function;

   InstInitFunction ::parse(SpecsList specs, InitDeclList decls)
   {
      return { function = ASTClassFunction::parse(specs, decls) };
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(function) function.print(out, o);
      printEnd(out, o);
   }

   ~InstInitFunction()
   {
      delete function;
   }
}

public class InstInitList : ASTList<InstanceInit>
{
public:
   InstInitList ::parse()
   {
      return (InstInitList)ASTList::parse(class(InstInitList), InstanceInit::parse, 0);
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      ASTList::print(out, o);
      printEnd(out, o);
   }
}

public class ASTInstantiation : ASTNode
{
public:
   ASTSpecifier _class;
   ASTExpression exp;

   InstInitList members;
   //Symbol symbol;
   bool fullSet;
   bool isConstant;
   byte * data;
   //Location nameLoc, insideLoc;
   bool built;

   ASTInstantiation ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTInstantiation inst { };
      if(specs && specs[0])
         inst._class = specs[0];

      if(decls && decls[0] && decls[0].declarator && decls[0].declarator._class == class(DeclIdentifier))
         inst.exp = ExpIdentifier { identifier = ((DeclIdentifier)decls[0].declarator).identifier };

      lexer.readToken();
      inst.members = InstInitList::parse();
      if(lexer.peekToken().type == '}')
         lexer.readToken();
      return inst;
   }

   void print(File out, OutputOptions o)
   {
      bool multiLine = false;
      printStart(out, o);
      if(members)
      {
         for(m : members; m._class == class(InstInitFunction))
         {
            multiLine = true;
            break;
         }
      }

      if(_class) { _class.print(out, o); if(!multiLine || exp) out.Print(" "); }
      if(exp) { exp.print(out, o); if(!multiLine) out.Print(" "); }
      if(multiLine)
      {
         out.PrintLn("");
         printIndent(out);
      }
      out.Print("{");
      if(multiLine)
      {
         out.PrintLn("");
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
                  printIndent(out);
               init.print(out, o);
               if(init._class == class(InstInitMember))
                  out.Print(";");
               if(nextLink)
               {
                  InstanceInit next = nextLink ? (InstanceInit)(uintptr)nextLink.data : null;
                  out.PrintLn("");
                  if(next._class == class(InstInitFunction))
                     out.PrintLn("");
               }
               else if(init._class != class(InstInitFunction))
                  out.PrintLn("");
            }
         }
         else
         {
            out.Print(" ");
            members.print(out, o);
            out.Print(" ");
         }
      }
      else
         out.Print(" ");
      if(multiLine)
      {
         indent--;
         printIndent(out);
      }
      out.Print("}");
      printEnd(out, o);
   }


   ~ASTInstantiation()
   {
      delete _class;
      delete exp;

      delete members;
   }
};
