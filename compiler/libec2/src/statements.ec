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
   AsmField prev, next;
   Location loc;
   char * command;
   Expression expression;
};
*/

// *** Statements ***
public class ASTStmtOrDecl : ASTNode
{
   ASTStmtOrDecl ::parse()
   {
      SpecsList specs = null;
      InitDeclList decls = null;
      bool isType = false;

      peekToken();
      if(nextToken.type.isSpecifier || (nextToken.type == IDENTIFIER && isType))
      {
         specs = SpecsList::parse();
         decls = InitDeclList::parse();
         return ASTDeclaration::parse(specs, decls);
      }
      else if(nextToken.type == IDENTIFIER)
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
         case ';':      readToken(); return { };
         case '{':      return StmtCompound::parse();
         case IF:       return StmtIf::parse();
         case SWITCH:   return StmtSwitch::parse();
         case DEFAULT:
         case CASE:     return StmtCase::parse();
         case WHILE:    return StmtWhile::parse();
         case DO:       return StmtDoWhile::parse();
         case FOR:      return StmtFor::parse();
         case BREAK:    return StmtBreak::parse();
         case GOTO:     return StmtGoto::parse();
         case RETURN:   return StmtReturn::parse();
         case CONTINUE: return StmtContinue::parse();
         case IDENTIFIER:
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
      PrintLn(";");
   }
};

public class StmtExpression : ASTStatement
{
   ExpList expressions;

   void print()
   {
      if(expressions) expressions.print();
      Print(";");
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
      Print("   ");
   }
}

public class StmtCompound : ASTStatement
{
   List<ASTDeclaration> declarations;
   List<ASTStatement> statements;
   // Context context;
   // bool isSwitch;

   void print()
   {
      printIndent();
      PrintLn("{");
      indent++;
      if(declarations)
      {
         for(d : declarations)
         {
            printIndent();
            d.print();
            PrintLn("");
         }
         if(statements)
            PrintLn("");
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
               PrintLn("");
         }
      }
      indent--;
      if(indent == caseIndent)
         indent--;
      printIndent();
      PrintLn("}");
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
   ExpList exp;
   ASTStatement stmt;
   ASTStatement elseStmt;

   void print()
   {
      Print("if(");
      if(exp) exp.print();
      PrintLn(")");
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent();
         stmt.print();
         if(stmt._class == class(StmtExpression)) PrintLn(""); 
         if(stmt._class != class(StmtCompound)) indent--;
      }
      if(elseStmt)
      {
         printIndent();
         Print("else");
         if(elseStmt._class != class(StmtCompound)) { PrintLn(""); indent++; }
         printIndent();
         if(elseStmt._class != class(StmtCompound)) elseStmt.print();
         if(elseStmt._class == class(StmtExpression)) PrintLn(""); 
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
         if(peekToken().type == ELSE)
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
   ExpList exp;
   ASTStatement stmt;

   void print()
   {
      int backCaseIndent = caseIndent;
      Print("switch(");
      if(exp) exp.print();
      PrintLn(")");
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
   ASTIdentifier id;
   ASTStatement stmt;

   void print()
   {
      if(id) id.print();
      PrintLn(":");
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
   ASTExpression exp;
   ASTStatement stmt;

   void print()
   {
      if(exp)
      {
         Print("case ");
         exp.print();
         PrintLn(":");
      }
      else
         PrintLn("default:");
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent();
         stmt.print();
         if(stmt._class == class(StmtExpression)) PrintLn(""); 
      }
   }

   StmtCase ::parse()
   {
      StmtCase stmt { };
      if(readToken().type == CASE)
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
   ExpList exp;
   ASTStatement stmt;

   StmtDoWhile ::parse()
   {
      StmtDoWhile stmt { };
      readToken();
      stmt.stmt = ASTStatement::parse();
      if(peekToken().type == WHILE)
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
   ASTStatement init;
   ASTStatement check;
   ExpList increment;
   ASTStatement stmt;

   void print()
   {
      Print("for(");
      if(init)
         init.print();
      if(check)
      {
         Print(" ");
         check.print();
      }
      if(increment)
      {
         Print(" ");
         increment.print();
      }
      PrintLn(")");
      
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent();
         stmt.print();
         if(stmt._class == class(StmtExpression)) PrintLn(""); 
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
   void print()
   {
      PrintLn("break;");
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
   void print()
   {
      PrintLn("continue;");
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
   ExpList exp;
   void print()
   {
      Print("return");
      if(exp)
      {
         Print(" ");
         exp.print();
      }
      ::PrintLn(";");
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
   ASTIdentifier id;

   void print()
   {
      Print("goto ");
      if(id) id.print();
      ::PrintLn(";");
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
   ASTSpecifier spec;
   String statements;
   List<String> inputFields;
   List<String> outputFields;
   List<String> clobberedFields;
}

public class StmtWatch : ASTStatement
{
   ASTExpression watcher, object;
   List<ASTPropertyWatch> watches;
}

public class StmtFireWatch : ASTStatement
{
   ASTExpression watcher, object;
   List<ASTIdentifiers> watches;
}

public class StmtStopWatching : ASTStatement
{
   ASTExpression watcher, object;
   List<ASTIdentifiers> watches;
}

public class StmtForEach : ASTStatement
{
   Identifier id;
   ExpList exp;
   ExpList filter;
   Statement stmt;
}

public class StmtDecl : ASTStatement
{
   ASTDeclaration decl;

   void print()
   {
      if(decl) { decl.print(); PrintLn(""); }
   }
}
