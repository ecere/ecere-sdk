import "expressions"

public class ASTPointer : ASTNode
{
   SpecsList qualifiers;
   ASTPointer pointer;

   void print()
   {
      Print("*");
      if(qualifiers) qualifiers.print();
      if(pointer) pointer.print();
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
   // Symbol symbol;

   ASTDeclarator ::parse()
   {
      ASTDeclarator decl = null;

      if(peekToken().type == '*')
         decl = DeclPointer::parse();
      else
      {
         if(peekToken().type == IDENTIFIER)
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
   ASTDeclarator declarator;
   TypeNameList parameters;

   void print()
   {
      if(declarator) declarator.print();
      Print("(");
      if(parameters) parameters.print();
      Print(")");
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
   ASTIdentifier identifier;

   void print()
   {
      if(identifier) identifier.print();
   }

   DeclIdentifier ::parse()
   {
      return { identifier = ASTIdentifier::parse() };
   }
}

public class DeclBrackets : ASTDeclarator
{
   ASTDeclarator declarator;

   void print()
   {
      Print("(");
      if(declarator) declarator.print();
      Print(")");
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
   ASTDeclarator declarator;
   ASTExpression exp;
   // ASTSpecifier enumClass;

   void print()
   {
      if(declarator) declarator.print();
      Print("[");
      if(exp) exp.print();
      Print("]");
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
   ASTDeclarator declarator;
   ASTPointer pointer;

   void print()
   {
      if(pointer) pointer.print();
      if(declarator) declarator.print();
   }

   DeclPointer ::parse()
   {
      return { pointer = ASTPointer::parse(), declarator = ASTDeclarator::parse() };
   }
}

public class DeclStruct : ASTDeclarator
{
   ASTDeclarator declarator;
   ASTExpression exp;
   ASTExpression posExp;
   ASTAttrib attrib;

   DeclStruct ::parse()
   {
      return { declarator = ASTDeclarator::parse(); };
   }
}

public class DeclExtended : ASTDeclarator
{
   ExtDecl extended;
}

public class ASTInitializer : ASTNode
{
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
         return InitExp { exp = ASTExpression::parse() };
   }
};

public class InitExp : ASTInitializer
{
   ASTExpression exp;

   void print()
   {
      if(exp)
         exp.print();
   }
};

public class InitList : ASTInitializer
{
   ASTList<ASTInitializer> list;

   void print()
   {
      if(list)
      {
         Print("{ ");
         list.print();
         Print(" }");
      }
   }

   InitList ::parse()
   {
      ASTList<ASTInitializer> list = (ASTList<ASTInitializer>)ASTList::parse(class(ASTList<ASTInitializer>), ASTInitializer::parse, ',');
      return list ? { list = (void *)list } : null;
   }
};

public class ASTInitDeclarator : ASTNode
{
   ASTDeclarator declarator;
   ASTInitializer initializer;

   void print()
   {
      if(declarator) declarator.print();
      if(initializer)
      {
         Print(" = ");
         initializer.print();
      }
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
   InitDeclList ::parse()
   {
      return (InitDeclList)ASTList::parse(class(InitDeclList), ASTInitDeclarator::parse, ',');
   }
}
