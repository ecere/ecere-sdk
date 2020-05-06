import "expressions"

public class ASTPointer : ASTNode
{
public:
   SpecsList qualifiers;
   ASTPointer pointer;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print("*");
      if(qualifiers) qualifiers.print(out, o);
      if(pointer) pointer.print(out, o);
      printEnd(out, o);
   }

   ASTPointer ::parse()
   {
      ASTPointer ptr { };
      lexer.readToken();
      while(lexer.peekToken().type == '*')
      {
         lexer.readToken();
         ptr = { pointer = ptr };
      }
      return ptr;
   }

   ~ASTPointer()
   {
      delete qualifiers;
      delete pointer;
   }
}

public class ASTDeclarator : ASTNode
{
public:
   //DeclaratorType type;
   ASTDeclarator declarator;
   // Symbol symbol;

   ASTDeclarator ::parse()
   {
      ASTDeclarator decl = null;

      if(lexer.peekToken().type == '*')
         decl = DeclPointer::parse();
      else
      {
         if(lexer.peekToken().type == identifier)
            decl = DeclIdentifier::parse();
         else if(lexer.nextToken.type == '(')
            decl = DeclBrackets::parse();
         if(decl)
         {
            while(true)
            {
               if(lexer.peekToken().type == '[')
                  decl = DeclArray::parse(decl);
               else if(lexer.nextToken.type == '(')
                  decl = DeclFunction::parse(decl);
               else if(lexer.nextToken.type == ':')
                  decl = DeclBitField::parse(decl);
               else
                  break;
            }
         }
      }
      return decl;
   }

   ~ASTDeclarator()
   {
      delete declarator;
   }
}

public class TypeNameList : ASTList<ASTTypeName>
{
public:
   TypeNameList ::parse()
   {
      TypeNameList list = null;
      int a = lexer.pushAmbiguity();
      while(true)
      {
         ASTTypeName e = ASTTypeName::parse();
         lexer.peekToken();
         if(e && (lexer.nextToken.type == ',' || lexer.nextToken.type == ')'))
         {
            if(!list) list = { };
            list.Add(e);

            lexer.clearAmbiguity();
            if(lexer.nextToken.type == ',')
            {
               lexer.readToken();
               a = lexer.pushAmbiguity();
            }
            else
               break;
         }
         else
         {
            // Error Recovery
            if(list)
               list.Add({});
            lexer.popAmbiguity(a);
            break;
         }
      }
      return list;
      // return (TypeNameList)ASTList::parse(class(TypeNameList), ASTTypeName::parse, ',');
   }
}

public class DeclFunction : ASTDeclarator
{
public:
   TypeNameList parameters;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(declarator) declarator.print(out, o);
      printParenOpen(out);
      if(parameters) parameters.print(out, o);
      printParenClose(out);
      printEnd(out, o);
   }

   DeclFunction ::parse(ASTDeclarator d)
   {
      DeclFunction decl { declarator = d };
      lexer.readToken();
      if(lexer.peekToken().type != ')') decl.parameters = TypeNameList::parse();
      if(lexer.peekToken().type == ')')
         lexer.readToken();
      return decl;
   }

   ~DeclFunction()
   {
      delete parameters;
   }
}

public class DeclIdentifier : ASTDeclarator
{
public:
   ASTIdentifier identifier;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(identifier) identifier.print(out, o);
      printEnd(out, o);
   }

   DeclIdentifier ::parse()
   {
      return { identifier = ASTIdentifier::parse() };
   }

   ~DeclIdentifier()
   {
      delete identifier;
   }
}

public class DeclBrackets : ASTDeclarator
{
public:
   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      printParenOpen(out);
      if(declarator) declarator.print(out, o);
      printParenClose(out);
      printEnd(out, o);
   }

   DeclBrackets ::parse()
   {
      DeclBrackets decl = null;
      ASTDeclarator d;
      lexer.readToken();
      d = ASTDeclarator::parse();
      if(d)
         decl = { declarator = d };
      if(lexer.peekToken().type == ')')
         lexer.readToken();
      return decl;
   }
}

public class DeclArray : ASTDeclarator
{
public:
   ASTExpression exp;
   // ASTSpecifier enumClass;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(declarator) declarator.print(out, o);
      out.Print("[");
      if(exp) exp.print(out, o);
      out.Print("]");
      printEnd(out, o);
   }

   DeclArray ::parse(ASTDeclarator d)
   {
      DeclArray decl { declarator = d };
      lexer.readToken();
      if(lexer.peekToken().type != ']') decl.exp = ExpConditional::parse();
      if(lexer.peekToken().type == ']') lexer.readToken();
      return decl;
   }

   ~DeclArray()
   {
      delete exp;
   }
}

public class DeclPointer : ASTDeclarator
{
public:
   ASTPointer pointer;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(pointer) pointer.print(out, o);
      if(pointer && declarator) out.Print(" ");
      if(declarator) declarator.print(out, o);
      printEnd(out, o);
   }

   DeclPointer ::parse()
   {
      return { pointer = ASTPointer::parse(), declarator = ASTDeclarator::parse() };
   }

   ~DeclPointer()
   {
      delete pointer;
   }
}

public class DeclStruct : ASTDeclarator
{
public:
   ASTExpression exp;
   ASTExpression posExp;
   ASTAttrib attrib;

   DeclStruct ::parse()
   {
      return { declarator = ASTDeclarator::parse(); };
   }

   ~DeclStruct()
   {
      delete exp;
      delete posExp;
      delete attrib;
   }
}

public class DeclBitField : ASTDeclarator
{
public:
   ExpConstant size;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(declarator) declarator.print(out, o);
      out.Print(":");
      if(size) size.print(out, o);
      printEnd(out, o);
   }

   DeclBitField ::parse(ASTDeclarator d)
   {
      lexer.readToken();
      return { declarator = d, size = ExpConstant::parse(); };
   }

   ~DeclBitField()
   {
      delete size;
   }
}

public class DeclExtended : ASTDeclarator
{
public:
   // TODO: ExtDecl extended;

   ~DeclExtended()
   {
   }
}

public class ASTInitializer : ASTNode
{
public:
   // bool isConstant;
   ASTInitializer ::parse()
   {
      if(lexer.peekToken().type == '{')
      {
         InitList init;
         lexer.readToken();
         init = InitList::parse();
         if(lexer.peekToken().type == '}') lexer.readToken();
         return init;
      }
      else
         return InitExp::parse();
   }
};

public class InitExp : ASTInitializer
{
public:
   ASTExpression exp;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(exp)
         exp.print(out, o);
      printEnd(out, o);
   }

   InitExp ::parse()
   {
      ASTExpression exp = ASTExpression::parse();
      return exp ? InitExp { exp = exp } : null;
   }

   ~InitExp()
   {
      delete exp;
   }
};

public class InitList : ASTInitializer
{
public:
   ASTList<ASTInitializer> list;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(list)
      {
         out.Print("{ ");
         list.print(out, o);
         out.Print(" }");
      }
      printEnd(out, o);
   }

   InitList ::parse()
   {
      ASTList<ASTInitializer> list = (ASTList<ASTInitializer>)ASTList::parse(class(ASTList<ASTInitializer>), ASTInitializer::parse, ',');
      return list ? { list = (void *)list } : null;
   }

   ~InitList()
   {
      list.Free();
      delete list;
   }
};

public class ASTInitDeclarator : ASTNode
{
public:
   ASTDeclarator declarator;
   ASTInitializer initializer;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(declarator) declarator.print(out, o);
      if(initializer)
      {
         out.Print(" = ");
         initializer.print(out, o);
      }
      printEnd(out, o);
   }

   ASTInitDeclarator ::parse()
   {
      ASTDeclarator decl = ASTDeclarator::parse();
      if(decl)
      {
         ASTInitializer init = null;
         if(lexer.peekToken().type == '=')
         {
            lexer.readToken();
            init = ASTInitializer::parse();
         }
         return { declarator = decl, initializer = init };
      }
      return null;
   }

   ~ASTInitDeclarator()
   {
      delete declarator;
      delete initializer;
   }
};

public class InitDeclList : ASTList<ASTInitDeclarator>
{
public:
   InitDeclList ::parse()
   {
      return (InitDeclList)ASTList::parse(class(InitDeclList), ASTInitDeclarator::parse, ',');
   }
}
