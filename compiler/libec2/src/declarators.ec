import "expressions"

public class ASTPointer : ASTNode
{
public:
   SpecsList qualifiers;
   ASTPointer pointer;

   void print(OutputOptions o)
   {
      printStart(o);
      out.Print("*");
      if(qualifiers) qualifiers.print(o);
      if(pointer) pointer.print(o);
      printEnd(o);
   }

   ASTPointer ::parse()
   {
      ASTPointer ptr { };
      readToken();
      while(peekToken().type == '*')
      {
         readToken();
         ptr = { pointer = ptr };
      }
      return ptr;
   }
}

public class ASTDeclarator : ASTNode
{
public:
   DeclaratorType type;
   ASTDeclarator declarator;
   // Symbol symbol;

   ASTDeclarator ::parse()
   {
      ASTDeclarator decl = null;

      if(peekToken().type == '*')
         decl = DeclPointer::parse();
      else
      {
         if(peekToken().type == identifier)
            decl = DeclIdentifier::parse();
         else if(nextToken.type == '(')
            decl = DeclBrackets::parse();
         if(decl)
         {
            while(true)
            {
               if(peekToken().type == '[')
                  decl = DeclArray::parse(decl);
               else if(nextToken.type == '(')
                  decl = DeclFunction::parse(decl);
               else if(nextToken.type == ':')
                  decl = DeclBitField::parse(decl);
               else
                  break;
            }
         }
      }
      return decl;
   }
}

public class TypeNameList : ASTList<ASTTypeName>
{
public:
   TypeNameList ::parse()
   {
      TypeNameList list = null;
      int a = pushAmbiguity();
      while(true)
      {
         ASTTypeName e = ASTTypeName::parse();
         peekToken();
         if(e && (nextToken.type == ',' || nextToken.type == ')'))
         {
            if(!list) list = { };
            list.Add(e);

            clearAmbiguity();
            if(nextToken.type == ',')
            {
               readToken();
               a = pushAmbiguity();
            }
            else
               break;
         }
         else
         {
            // Error Recovery
            if(list)
               list.Add({});
            popAmbiguity(a);
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

   void print(OutputOptions o)
   {
      printStart(o);
      if(declarator) declarator.print(o);
      out.Print("(");
      if(parameters) parameters.print(o);
      out.Print(")");
      printEnd(o);
   }

   DeclFunction ::parse(ASTDeclarator d)
   {
      DeclFunction decl { declarator = d };
      readToken();
      if(peekToken().type != ')') decl.parameters = TypeNameList::parse();
      if(peekToken().type == ')')
         readToken();
      return decl;
   }
}

public class DeclIdentifier : ASTDeclarator
{
public:
   ASTIdentifier identifier;

   void print(OutputOptions o)
   {
      printStart(o);
      if(identifier) identifier.print(o);
      printEnd(o);
   }

   DeclIdentifier ::parse()
   {
      return { identifier = ASTIdentifier::parse() };
   }
}

public class DeclBrackets : ASTDeclarator
{
public:
   void print(OutputOptions o)
   {
      printStart(o);
      out.Print("(");
      if(declarator) declarator.print(o);
      out.Print(")");
      printEnd(o);
   }

   DeclBrackets ::parse()
   {
      DeclBrackets decl = null;
      ASTDeclarator d;
      readToken();
      d = ASTDeclarator::parse();
      if(d)
         decl = { declarator = d };
      if(peekToken().type == ')')
         readToken();
      return decl;
   }
}

public class DeclArray : ASTDeclarator
{
public:
   ASTExpression exp;
   // ASTSpecifier enumClass;

   void print(OutputOptions o)
   {
      printStart(o);
      if(declarator) declarator.print(o);
      out.Print("[");
      if(exp) exp.print(o);
      out.Print("]");
      printEnd(o);
   }

   DeclArray ::parse(ASTDeclarator d)
   {
      DeclArray decl { declarator = d };
      readToken();
      if(peekToken().type != ']') decl.exp = ExpConditional::parse();
      if(peekToken().type == ']') readToken();
      return decl;
   }
}

public class DeclPointer : ASTDeclarator
{
public:
   ASTPointer pointer;

   void print(OutputOptions o)
   {
      printStart(o);
      if(pointer) pointer.print(o);
      if(declarator) declarator.print(o);
      printEnd(o);
   }

   DeclPointer ::parse()
   {
      return { pointer = ASTPointer::parse(), declarator = ASTDeclarator::parse() };
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
}

public class DeclBitField : ASTDeclarator
{
public:
   ExpConstant size;

   void print(OutputOptions o)
   {
      printStart(o);
      if(declarator) declarator.print(o);
      out.Print(":");
      if(size) size.print(o);
      printEnd(o);
   }

   DeclBitField ::parse(ASTDeclarator d)
   {
      readToken();
      return { declarator = d, size = ExpConstant::parse(); };
   }
}

public class DeclExtended : ASTDeclarator
{
public:
   ExtDecl extended;
}

public class ASTInitializer : ASTNode
{
public:
   // bool isConstant;
   ASTInitializer ::parse()
   {
      if(peekToken().type == '{')
      {
         InitList init;
         readToken();
         init = InitList::parse();
         if(peekToken().type == '}') readToken();
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

   void print(OutputOptions o)
   {
      printStart(o);
      if(exp)
         exp.print(o);
      printEnd(o);
   }

   InitExp ::parse()
   {
      return InitExp { exp = ASTExpression::parse() };
   }
};

public class InitList : ASTInitializer
{
public:
   ASTList<ASTInitializer> list;

   void print(OutputOptions o)
   {
      printStart(o);
      if(list)
      {
         out.Print("{ ");
         list.print(o);
         out.Print(" }");
      }
      printEnd(o);
   }

   InitList ::parse()
   {
      ASTList<ASTInitializer> list = (ASTList<ASTInitializer>)ASTList::parse(class(ASTList<ASTInitializer>), ASTInitializer::parse, ',');
      return list ? { list = (void *)list } : null;
   }
};

public class ASTInitDeclarator : ASTNode
{
public:
   ASTDeclarator declarator;
   ASTInitializer initializer;

   void print(OutputOptions o)
   {
      printStart(o);
      if(declarator) declarator.print(o);
      if(initializer)
      {
         out.Print(" = ");
         initializer.print(o);
      }
      printEnd(o);
   }

   ASTInitDeclarator ::parse()
   {
      ASTDeclarator decl = ASTDeclarator::parse();
      if(decl)
      {
         ASTInitializer init = null;
         if(peekToken().type == '=')
         {
            readToken();
            init = ASTInitializer::parse();
         }
         return { declarator = decl, initializer = init };
      }
      return null;
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
