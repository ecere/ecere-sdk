import "expressions"
import "externals"

public class ASTPropertyWatch : ASTNode
{
public:
   ASTStatement compound;
   List<ASTIdentifier> properties;
   bool deleteWatch;

   ~ASTPropertyWatch()
   {
      delete compound;
      if(properties) properties.Free();
      delete properties;
   }
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

      lexer.peekToken();
      if(lexer.nextToken.type.isSpecifier || (lexer.nextToken.type == identifier && isType))
      {
         specs = SpecsList::parse(true);
         decls = InitDeclList::parse();
         return ASTDeclaration::parse(specs, decls);
      }
      else if(lexer.nextToken.type == identifier)
      {
         ASTStatement stmt;
         int a = lexer.pushAmbiguity();
         stmt = ASTStatement::parse();
         if(stmt)
         {
            lexer.clearAmbiguity();
            return stmt;
         }
         lexer.popAmbiguity(a);
         specs = SpecsList::parse(true);
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
   //StmtType type;

   ASTStatement ::parse()
   {
      switch(lexer.peekToken().type)
      {
         case ';':       lexer.readToken(); return { };
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
            int a = lexer.pushAmbiguity();
            stmt = StmtLabeled::parse();
            if(stmt)
            {
               lexer.clearAmbiguity();
               return stmt;
            }
            lexer.popAmbiguity(a);
         }
         default:       return StmtExpression::parse();
      }
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.PrintLn(";");
      printEnd(out, o);
   }
};

public class StmtExpression : ASTStatement
{
public:
   ExpList expressions;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(expressions) expressions.print(out, o);
      out.Print(";");
      printEnd(out, o);
   }

   StmtExpression ::parse()
   {
      ExpList exp = ExpList::parse();
      if(exp)
      {
         StmtExpression stmt { expressions = exp };
         if(lexer.peekToken().type == ';')
            lexer.readToken();
         else
         {
            if(lexer.ambiguous)
               delete stmt;
         }
         return stmt;
      }
      return null;
   }

   ~StmtExpression()
   {
      delete expressions;
   }
}

int indent;
void printIndent(File out)
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

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      printIndent(out);
      out.PrintLn("{");
      indent++;
      if(declarations)
      {
         for(d : declarations)
         {
            printIndent(out);
            d.print(out, o);
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
               printIndent(out);
            s.print(out, o);
            if(s._class == class(StmtExpression))
               out.PrintLn("");
         }
      }
      indent--;
      if(indent == caseIndent)
         indent--;
      printIndent(out);
      out.PrintLn("}");
      printEnd(out, o);
   }

   StmtCompound ::parse()
   {
      StmtCompound stmt { };
      if(lexer.peekToken().type == '{')
      {
         bool inDecls = true;
         lexer.readToken();
         while(true)
         {
            if(lexer.peekToken().type == '}')
            {
               lexer.readToken();
               break;
            }
            else if(!lexer.nextToken)
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
                  /*while(lexer.readToken())
                     if(token == ';' || token == '}') break;*/
                  lexer.readToken();
               }
            }
         }
      }
      return stmt;
   }

   ~StmtCompound()
   {
      if(declarations) declarations.Free();
      delete declarations;
      if(statements) statements.Free();
      delete statements;
   }
}

public class StmtIf : ASTStatement
{
public:
   ExpList exp;
   ASTStatement stmt;
   ASTStatement elseStmt;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print("if");
      printParenOpen(out);
      if(exp) exp.print(out, o);
      printParenClose(out);
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent(out);
         stmt.print(out, o);
         if(stmt._class == class(StmtExpression)) out.PrintLn("");
         if(stmt._class != class(StmtCompound)) indent--;
      }
      if(elseStmt)
      {
         printIndent(out);
         out.Print("else");
         if(elseStmt._class != class(StmtCompound)) { out.PrintLn(""); indent++; }
         printIndent(out);
         if(elseStmt._class != class(StmtCompound)) elseStmt.print(out, o);
         if(elseStmt._class == class(StmtExpression)) out.PrintLn("");
         indent--;
      }
      printEnd(out, o);
   }

   StmtIf ::parse()
   {
      StmtIf stmt { };
      lexer.readToken();
      if(lexer.peekToken().type == '(')
      {
         lexer.readToken();
         stmt.exp = ExpList::parse();
         if(lexer.peekToken().type == ')') lexer.readToken();
         stmt.stmt = ASTStatement::parse();
         if(lexer.peekToken().type == _else)
         {
            lexer.readToken();
            stmt.elseStmt = ASTStatement::parse();
         }
      }
      return stmt;
   }

   ~StmtIf()
   {
      delete exp;
      delete stmt;
      delete elseStmt;
   }

}

int caseIndent = -1;

public class StmtSwitch : ASTStatement
{
public:
   ExpList exp;
   ASTStatement stmt;

   void print(File out, OutputOptions o)
   {
      int backCaseIndent = caseIndent;
      printStart(out, o);
      out.Print("switch");
      printParenOpen(out);
      if(exp) exp.print(out, o);
      printParenClose(out);
      if(stmt)
      {
         caseIndent = indent+1;
         stmt.print(out, o);
         indent = caseIndent-1;
      }
      caseIndent = backCaseIndent;
      printEnd(out, o);
   }

   StmtSwitch ::parse()
   {
      StmtSwitch stmt { };
      lexer.readToken();
      if(lexer.peekToken().type == '(')
      {
         lexer.readToken();
         stmt.exp = ExpList::parse();
         if(lexer.peekToken().type == ')') lexer.readToken();
         stmt.stmt = ASTStatement::parse();
      }
      return stmt;
   }

   ~StmtSwitch()
   {
      delete exp;
      delete stmt;
   }
}

public class StmtLabeled : ASTStatement
{
public:
   ASTIdentifier id;
   ASTStatement stmt;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(id) id.print(out, o);
      out.PrintLn(":");
      if(stmt) stmt.print(out, o);
      printEnd(out, o);
   }

   StmtLabeled ::parse()
   {
      ASTIdentifier id = ASTIdentifier::parse();
      if(lexer.peekToken().type == ':')
         return StmtLabeled { id = id, stmt = ASTStatement::parse() };
      delete id;
      return null;
   }

   ~StmtLabeled()
   {
      delete id;
      delete stmt;
   }
}

public class StmtCase : ASTStatement
{
public:
   ASTExpression exp;
   ASTStatement stmt;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp)
      {
         out.Print("case ");
         exp.print(out, o);
         out.PrintLn(":");
      }
      else
         out.PrintLn("default:");
      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent(out);
         stmt.print(out, o);
         if(stmt._class == class(StmtExpression)) out.PrintLn("");
      }
      printEnd(out, o);
   }

   StmtCase ::parse()
   {
      StmtCase stmt { };
      if(lexer.readToken().type == _case)
         stmt.exp = ExpConditional::parse();
      if(lexer.peekToken().type == ':')
      {
         lexer.readToken();
         stmt.stmt = ASTStatement::parse();
      }
      return stmt;
   }

   ~StmtCase()
   {
      delete exp;
      delete stmt;
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
      lexer.readToken();
      if(lexer.peekToken().type == '(')
      {
         lexer.readToken();
         stmt.exp = ExpList::parse();
         if(lexer.peekToken().type == ')') lexer.readToken();
         stmt.stmt = ASTStatement::parse();
      }
      return stmt;
   }

   ~StmtWhile()
   {
      delete exp;
      delete stmt;
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
      lexer.readToken();
      stmt.stmt = ASTStatement::parse();
      if(lexer.peekToken().type == _while)
      {
         lexer.readToken();
         if(lexer.peekToken().type == '(')
         {
            lexer.readToken();
            stmt.exp = ExpList::parse();
            if(lexer.peekToken().type == ')') lexer.readToken();
         }
         if(lexer.peekToken().type == ';') lexer.readToken();
      }
      return stmt;
   }

   ~StmtDoWhile()
   {
      delete exp;
      delete stmt;
   }
}

public class StmtFor : ASTStatement
{
public:
   ASTStatement init;
   ASTStatement check;
   ExpList increment;
   ASTStatement stmt;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print("for");
      printParenOpen(out);
      if(init)
         init.print(out, o);
      if(check)
      {
         out.Print(" ");
         check.print(out, o);
      }
      if(increment)
      {
         out.Print(" ");
         increment.print(out, o);
      }
      printParenClose(out);

      if(stmt)
      {
         if(stmt._class != class(StmtCompound)) indent++;
         printIndent(out);
         stmt.print(out, o);
         if(stmt._class == class(StmtExpression)) out.PrintLn("");
         if(stmt._class != class(StmtCompound)) indent--;
      }
      printEnd(out, o);
   }

   StmtFor ::parse()
   {
      StmtFor stmt { };
      lexer.readToken();
      if(lexer.peekToken().type == '(')
      {
         lexer.readToken();
         stmt.init = ASTStatement::parse();
         stmt.check = ASTStatement::parse();
         stmt.increment = ExpList::parse();
         if(lexer.peekToken().type == ')')
         {
            lexer.readToken();
            stmt.stmt = ASTStatement::parse();
         }
      }
      return stmt;
   }

   ~StmtFor()
   {
      delete init;
      delete check;
      delete increment;
      delete stmt;
   }
}

public class StmtBreak : ASTStatement
{
public:
   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.PrintLn("break;");
      printEnd(out, o);
   }

   StmtBreak ::parse()
   {
      lexer.readToken();
      if(lexer.peekToken().type == ';') lexer.readToken();
      return { };
   }
}

public class StmtContinue : ASTStatement
{
public:
   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.PrintLn("continue;");
      printEnd(out, o);
   }

   StmtContinue ::parse()
   {
      lexer.readToken();
      if(lexer.peekToken().type == ';') lexer.readToken();
      return { };
   }
}

public class StmtReturn : ASTStatement
{
public:
   ExpList exp;
   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print("return");
      if(exp)
      {
         out.Print(" ");
         exp.print(out, o);
      }
      ::out.PrintLn(";");
      printEnd(out, o);
   }

   StmtReturn ::parse()
   {
      StmtReturn stmt { };
      lexer.readToken();
      if(lexer.peekToken().type != ';') stmt.exp = ExpList::parse();
      if(lexer.peekToken().type == ';') lexer.readToken();
      return stmt;
   }

   ~StmtReturn()
   {
      delete exp;
   }
}

public class StmtGoto : ASTStatement
{
public:
   ASTIdentifier id;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print("goto ");
      if(id) id.print(out, o);
      ::out.PrintLn(";");
      printEnd(out, o);
   }

   StmtGoto ::parse()
   {
      StmtGoto stmt { };
      lexer.readToken();
      stmt.id = ASTIdentifier::parse();
      if(lexer.peekToken().type == ';') lexer.readToken();
      return stmt;
   }

   ~StmtGoto()
   {
      delete id;
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

   ~StmtAsm()
   {
      delete spec;
      delete statements;
      if(inputFields) inputFields.Free();
      delete inputFields;
      if(outputFields) outputFields.Free();
      delete outputFields;
      if(clobberedFields) clobberedFields.Free();
      delete clobberedFields;
   }
}

public class StmtWatch : ASTStatement
{
public:
   ASTExpression watcher, object;
   List<ASTPropertyWatch> watches;

   ~StmtWatch()
   {
      delete watcher;
      delete object;
      delete watches;
   }
}

public class StmtFireWatch : ASTStatement
{
public:
   ASTExpression watcher, object;
   List<ASTIdentifiers> watches;

   ~StmtFireWatch()
   {
      delete watcher;
      delete object;
      if(watches) watches.Free();
      delete watches;
   }
}

public class StmtStopWatching : ASTStatement
{
public:
   ASTExpression watcher, object;
   List<ASTIdentifiers> watches;

   ~StmtStopWatching()
   {
      delete watcher;
      delete object;
      if(watches) watches.Free();
      delete watches;
   }
}

public class StmtForEach : ASTStatement
{
public:
   // Identifier id;
   ExpList exp;
   ExpList filter;
   // Statement stmt;

   ~StmtForEach()
   {
      delete exp;
      delete filter;
   }
}

public class StmtDecl : ASTStatement
{
public:
   ASTDeclaration decl;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(decl) { decl.print(out, o); out.PrintLn(""); }
      printEnd(out, o);
   }

   ~StmtDecl()
   {
      delete decl;
   }
}
