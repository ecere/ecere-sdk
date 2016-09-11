import "expressions"
import "externals"

public class ASTPropertyWatch : ASTNode
{
public:
   ASTStatement compound;
   List<ASTIdentifier> properties;
   bool deleteWatch;
};

/*
class AsmField : struct
{
public:
   AsmField prev, next;
   Location loc;
   char * command;
   Expression expression;
};
*/

// *** Statements ***
public class ASTStmtOrDecl : ASTNode
{
public:
   ASTStmtOrDecl ::parse()
   {
      SpecsList specs = null;
      InitDeclList decls = null;
      bool isType = false;

      peekToken();
      if(nextToken.type.isSpecifier || (nextToken.type == identifier && isType))
      {
         specs = SpecsList::parse();
         decls = InitDeclList::parse();
         return ASTDeclaration::parse(specs, decls);
      }
      else if(nextToken.type == identifier)
      {
         ASTStatement stmt;
         int a = pushAmbiguity();
         stmt = ASTStatement::parse();
         if(stmt)
         {
            clearAmbiguity();
            return stmt;
         }
         popAmbiguity(a);
         specs = SpecsList::parse();
         if(specs)
            decls = InitDeclList::parse();
         if(specs && decls)
            return ASTDeclaration::parse(specs, decls);
         else
            return null;
      }
      else
         return ASTStatement::parse();
   }
}

public class ASTStatement : ASTStmtOrDecl
{
public:
   StmtType type;

   ASTStatement ::parse()
   {
      switch(peekToken().type)
      {
         case ';':       readToken(); return { };
         case '{':       return StmtCompound::parse();
         case _if:       return StmtIf::parse();
         case _switch:   return StmtSwitch::parse();
         case _default:
         case _case:     return StmtCase::parse();
         case _while:    return StmtWhile::parse();
         case _do:       return StmtDoWhile::parse();
         case _for:      return StmtFor::parse();
         case _break:    return StmtBreak::parse();
         case _goto:     return StmtGoto::parse();
         case _return:   return StmtReturn::parse();
         case _continue: return StmtContinue::parse();
         case identifier:
         {
            ASTStatement stmt;
            int a = pushAmbiguity();
            stmt = StmtLabeled::parse();
            if(stmt)
            {
               clearAmbiguity();
               return stmt;
            }
            popAmbiguity(a);
         }
         default:       return StmtExpression::parse();
      }
   }

   void print()
   {
      out.PrintLn(";");
   }
};

public class StmtExpression : ASTStatement
{
public:
   ExpList expressions;

   void print()
   {
      if(expressions) expressions.print();
      out.Print(";");
   }

   StmtExpression ::parse()
   {
      ExpList exp = ExpList::parse();
      if(exp)
      {
         StmtExpression stmt { expressions = exp };
         if(peekToken().type == ';')
            readToken();
         else
         {
            if(ambiguous)
               delete stmt;
         }
         return stmt;
      }
      return null;
   }
}
int indent;
void printIndent()
{
   int i;
   for(i = 0; i < indent; i++)
   {
      out.Print("   ");
   }
}

public class StmtCompound : ASTStatement
{
public:
   List<ASTDeclaration> declarations;
   List<ASTStatement> statements;
   // Context context;
   // bool isSwitch;

   void print()
   {
      printIndent();
      out.PrintLn("{");
      indent++;
      if(declarations)
      {
         for(d : declarations)
         {
            printIndent();
            d.print();
            out.PrintLn("");
         }
         if(statements)
            out.PrintLn("");
      }
      if(statements)
      {
         for(s : statements)
         {
            if(s._class == class(StmtCase))
               indent = caseIndent;
            if(s._class != class(StmtLabeled) && s._class != class(StmtCompound))
               printIndent();
            s.print();
            if(s._class == class(StmtExpression))
               out.PrintLn("");
         }
      }
      indent--;
      if(indent == caseIndent)
         indent--;
      printIndent();
      out.PrintLn("}");
   }

   StmtCompound ::parse()
   {
      StmtCompound stmt { };
      if(peekToken().type == '{')
      {
         bool inDecls = true;
         readToken();
         while(true)
         {
            if(peekToken().type == '}')
            {
               readToken();
               break;
            }
            else if(!nextToken)
               break;
            else
            {
               ASTStmtOrDecl sod = ASTStmtOrDecl::parse();
               if(sod)
               {
                  if(eClass_IsDerived(sod._class, class(ASTDeclaration)))
                  {
                     ASTDeclaration decl = (ASTDeclaration)sod;
                     if(!stmt.declarations) stmt.declarations = { };
                     if(inDecls)
                        stmt.declarations.Add(decl);
                     else
                        stmt.statements.Add(StmtDecl { decl = decl });
                  }
                  else
                  {
                     ASTStatement s = (ASTStatement)sod;
                     if(!stmt.statements) stmt.statements = { };
                     stmt.statements.Add(s);
                     inDecls = false;
                  }
               }
               else
               {
                  // ERROR
                  /*while(readToken())
                     if(token == ';' || token == '}') break;*/
                  readToken();
               }
            }
         }
      }
      return stmt;
   }
}

public class StmtIf : ASTStatement
{
public:
   ExpList exp;
   ASTStatement stmt;
   ASTStatement elseStmt;

   void print()
   {
      out.Print("if(");
      if(exp) exp.print();
      out.PrintLn(")");
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent();
         stmt.print();
         if(stmt._class == class(StmtExpression)) out.PrintLn("");
         if(stmt._class != class(StmtCompound)) indent--;
      }
      if(elseStmt)
      {
         printIndent();
         out.Print("else");
         if(elseStmt._class != class(StmtCompound)) { out.PrintLn(""); indent++; }
         printIndent();
         if(elseStmt._class != class(StmtCompound)) elseStmt.print();
         if(elseStmt._class == class(StmtExpression)) out.PrintLn("");
         indent--;
      }
   }

   StmtIf ::parse()
   {
      StmtIf stmt { };
      readToken();
      if(peekToken().type == '(')
      {
         readToken();
         stmt.exp = ExpList::parse();
         if(peekToken().type == ')') readToken();
         stmt.stmt = ASTStatement::parse();
         if(peekToken().type == _else)
         {
            readToken();
            stmt.elseStmt = ASTStatement::parse();
         }
      }
      return stmt;
   }
}

int caseIndent = -1;

public class StmtSwitch : ASTStatement
{
public:
   ExpList exp;
   ASTStatement stmt;

   void print()
   {
      int backCaseIndent = caseIndent;
      out.Print("switch(");
      if(exp) exp.print();
      out.PrintLn(")");
      if(stmt)
      {
         caseIndent = indent+1;
         stmt.print();
         indent = caseIndent-1;
      }
      caseIndent = backCaseIndent;
   }

   StmtSwitch ::parse()
   {
      StmtSwitch stmt { };
      readToken();
      if(peekToken().type == '(')
      {
         readToken();
         stmt.exp = ExpList::parse();
         if(peekToken().type == ')') readToken();
         stmt.stmt = ASTStatement::parse();
      }
      return stmt;
   }
}

public class StmtLabeled : ASTStatement
{
public:
   ASTIdentifier id;
   ASTStatement stmt;

   void print()
   {
      if(id) id.print();
      out.PrintLn(":");
      if(stmt) stmt.print();
   }

   StmtLabeled ::parse()
   {
      ASTIdentifier id = ASTIdentifier::parse();
      if(peekToken().type == ':')
         return StmtLabeled { id = id, stmt = ASTStatement::parse() };
      delete id;
      return null;
   }
}

public class StmtCase : ASTStatement
{
public:
   ASTExpression exp;
   ASTStatement stmt;

   void print()
   {
      if(exp)
      {
         out.Print("case ");
         exp.print();
         out.PrintLn(":");
      }
      else
         out.PrintLn("default:");
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent();
         stmt.print();
         if(stmt._class == class(StmtExpression)) out.PrintLn("");
      }
   }

   StmtCase ::parse()
   {
      StmtCase stmt { };
      if(readToken().type == _case)
         stmt.exp = ExpConditional::parse();
      if(peekToken().type == ':')
      {
         readToken();
         stmt.stmt = ASTStatement::parse();
      }
      return stmt;
   }
}

public class StmtWhile : ASTStatement
{
public:
   ExpList exp;
   ASTStatement stmt;

   StmtWhile ::parse()
   {
      StmtWhile stmt { };
      readToken();
      if(peekToken().type == '(')
      {
         readToken();
         stmt.exp = ExpList::parse();
         if(peekToken().type == ')') readToken();
         stmt.stmt = ASTStatement::parse();
      }
      return stmt;
   }
}

public class StmtDoWhile : ASTStatement
{
public:
   ExpList exp;
   ASTStatement stmt;

   StmtDoWhile ::parse()
   {
      StmtDoWhile stmt { };
      readToken();
      stmt.stmt = ASTStatement::parse();
      if(peekToken().type == _while)
      {
         readToken();
         if(peekToken().type == '(')
         {
            readToken();
            stmt.exp = ExpList::parse();
            if(peekToken().type == ')') readToken();
         }
         if(peekToken().type == ';') readToken();
      }
      return stmt;
   }
}

public class StmtFor : ASTStatement
{
public:
   ASTStatement init;
   ASTStatement check;
   ExpList increment;
   ASTStatement stmt;

   void print()
   {
      out.Print("for(");
      if(init)
         init.print();
      if(check)
      {
         out.Print(" ");
         check.print();
      }
      if(increment)
      {
         out.Print(" ");
         increment.print();
      }
      out.PrintLn(")");

      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent();
         stmt.print();
         if(stmt._class == class(StmtExpression)) out.PrintLn("");
         if(stmt._class != class(StmtCompound)) indent--;
      }
   }

   StmtFor ::parse()
   {
      StmtFor stmt { };
      readToken();
      if(peekToken().type == '(')
      {
         readToken();
         stmt.init = ASTStatement::parse();
         stmt.check = ASTStatement::parse();
         stmt.increment = ExpList::parse();
         if(peekToken().type == ')')
         {
            readToken();
            stmt.stmt = ASTStatement::parse();
         }
      }
      return stmt;
   }
}

public class StmtBreak : ASTStatement
{
public:
   void print()
   {
      out.PrintLn("break;");
   }

   StmtBreak ::parse()
   {
      readToken();
      if(peekToken().type == ';') readToken();
      return { };
   }
}

public class StmtContinue : ASTStatement
{
public:
   void print()
   {
      out.PrintLn("continue;");
   }

   StmtContinue ::parse()
   {
      readToken();
      if(peekToken().type == ';') readToken();
      return { };
   }
}

public class StmtReturn : ASTStatement
{
public:
   ExpList exp;
   void print()
   {
      out.Print("return");
      if(exp)
      {
         out.Print(" ");
         exp.print();
      }
      ::out.PrintLn(";");
   }

   StmtReturn ::parse()
   {
      StmtReturn stmt { };
      readToken();
      if(peekToken().type != ';') stmt.exp = ExpList::parse();
      if(peekToken().type == ';') readToken();
      return stmt;
   }
}

public class StmtGoto : ASTStatement
{
public:
   ASTIdentifier id;

   void print()
   {
      out.Print("goto ");
      if(id) id.print();
      ::out.PrintLn(";");
   }

   StmtGoto ::parse()
   {
      StmtGoto stmt { };
      readToken();
      stmt.id = ASTIdentifier::parse();
      if(peekToken().type == ';') readToken();
      return stmt;
   }
}

public class StmtAsm : ASTStatement
{
public:
   ASTSpecifier spec;
   String statements;
   List<String> inputFields;
   List<String> outputFields;
   List<String> clobberedFields;
}

public class StmtWatch : ASTStatement
{
public:
   ASTExpression watcher, object;
   List<ASTPropertyWatch> watches;
}

public class StmtFireWatch : ASTStatement
{
public:
   ASTExpression watcher, object;
   List<ASTIdentifiers> watches;
}

public class StmtStopWatching : ASTStatement
{
public:
   ASTExpression watcher, object;
   List<ASTIdentifiers> watches;
}

public class StmtForEach : ASTStatement
{
public:
   Identifier id;
   ExpList exp;
   ExpList filter;
   Statement stmt;
}

public class StmtDecl : ASTStatement
{
public:
   ASTDeclaration decl;

   void print()
   {
      if(decl) { decl.print(); out.PrintLn(""); }
   }
}
