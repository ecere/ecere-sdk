import "astNode"
import "classes"

// Specifiers
public class ASTSpecifier : ASTNode
{
public:
  /*    struct
      {
         //ExtDecl extDecl;
         //Symbol symbol;
         //OldList * templateArgs;
      };
      Expression expression;
      NewSpecifier _class;
      TemplateParameter templateParameter;
   };
      */
};

public class SpecsList : ASTList<ASTSpecifier>
{
   void printSep()
   {
      Print(" ");
   }

   SpecsList ::parse()
   {
      SpecsList specs = null;
      bool gotSpec = false;
      while(true)
      {
         peekToken();
         if(nextToken.type == STRUCT || nextToken.type == UNION)
         {
            ASTSpecifier s = SpecClass::parse();
            if(s)
            {
               if(!specs) specs = { };
               specs.Add(s);
            }
            break;
         }
         else if(nextToken.type.isSpecifier)
         {
            readToken();
            if(!specs) specs = { };
            specs.Add(SpecBase { specifier = token.type });
            if(!token.type.isQualifier)
               gotSpec = true;
         }
         else if(nextToken.type == IDENTIFIER)
         {
            bool isType = false;
            if(isType || !gotSpec)
            {
               readToken();
               if(!specs) specs = { };
               specs.Add(SpecName { name = CopyString(token.text) });
               gotSpec = true;
            }
            else
               break;
         }
         else
            break;
      }
      return specs;
   }
}

public class SpecBase : ASTSpecifier
{
   TokenType specifier;

   void print()
   {
      specifier.print();
   }
}

public class SpecName : ASTSpecifier
{
   String name;

   void print()
   {
      if(name) Print(name);
   }
}

public class ASTEnumerator : struct
{
public:
   ASTIdentifier id;
   ASTExpression exp;
};

public class SpecClass : ASTSpecifier
{
   TokenType type;
   ASTIdentifier id;
   List<ASTEnumerator> enumerators;
   SpecsList baseSpecs;
   ClassDefList definitions;
   bool addNameSpace;
   Context ctx;
   // ExtDecl extDeclStruct;

   SpecClass ::parse()
   {
      SpecClass spec { };
      spec.type = readToken().type;
      if(peekToken().type == IDENTIFIER)
         spec.id = ASTIdentifier::parse();
      if(peekToken().type == '{')
      {
         readToken();
         spec.definitions = ClassDefList::parse();
         if(peekToken().type == '}')
            readToken();
      }
      return spec;
   }

   void print()
   {
      type.print();
      Print(" ");
      if(id) id.print();
      if(definitions)
      {
         PrintLn("\n{");
         indent++;
         definitions.print();
         indent--;
         Print("\n}");
      }
   }
}

/*
public class Attribute : struct
{
public:
   Attribute prev, next;
   Location loc;
   String attr;
   Expression exp;
}

public class Attrib : struct
{
public:
   Location loc;
   int type;
   OldList * attribs;
}

public class ExtDecl : struct
{
public:
   Location loc;
   ExtDeclType type;
   union
   {
      String s;
      Attrib attr;
   };
}
*/
