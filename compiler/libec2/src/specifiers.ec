import "astNode"
import "classes"

// Specifiers
public class ASTSpecifier : ASTNode
{
};

public class SpecTypeOf : ASTSpecifier
{
   Expression expression;
}

public class SpecSubClass : ASTSpecifier
{
   ASTSpecifier _class;
}

public class SpecTemplateType : ASTSpecifier
{
   TemplateParameter templateParameter;
}

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
         if(nextToken.type == STRUCT || nextToken.type == UNION || nextToken.type == CLASS || nextToken.type == ENUM)
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
   //ExtDecl extDecl;
   //Symbol symbol;
   //List<ClassTemplateArgument> templateArgs;

   void print()
   {
      if(name) Print(name);
   }
}

public class SpecClass : ASTSpecifier
{
   TokenType type;
   ASTIdentifier id;
   SpecsList baseSpecs;
   ClassDefList definitions;

   //ASTSpecifier _class;
   // Symbol symbol;
   //Location blockStart;
   //Location nameLoc;
   //bool deleteWatchable;
   //int endid;
   //AccessMode declMode;
   bool addNameSpace;
   Context ctx;
   // ExtDecl extDeclStruct;

   SpecClass ::parse()
   {
      SpecClass spec = (peekToken().type == ENUM) ? SpecEnum { } : SpecClass { };
      spec.type = readToken().type;
      if(peekToken().type == IDENTIFIER)
         spec.id = ASTIdentifier::parse();
      if(peekToken().type == ':')
      {
         readToken();
         spec.baseSpecs = SpecsList::parse();
      }
      if(peekToken().type == '{')
      {
         readToken();
         spec.definitions = ClassDefList::parse();
         if(!spec.definitions)
            spec.definitions = { };
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
      if(baseSpecs)
      {
         Print(" : ");
         baseSpecs.print();
      }
      if(definitions)
      {
         PrintLn("");
         printIndent();
         PrintLn("{");
         indent++;
         definitions.print();
         indent--;
         printIndent();
         Print("}");
      }
   }
}

public class ASTEnumerator : ASTNode
{
public:
   ASTIdentifier id;
   ASTExpression exp;
};

public class EnumeratorList : ASTList<ASTEnumerator>
{
}

public class SpecEnum : SpecClass
{
   EnumeratorList enumerators;
}

public class ASTAttribute : ASTNode
{
   String attr;
   ASTExpression exp;
}

public class ASTAttrib : ASTNode
{
   TokenType type;
   List<ASTAttribute> attribs;
}

public class ASTExtDecl : ASTNode { }

public class ExtDeclString : ASTExtDecl
{
   String s;
}

public class ExtDeclAttrib : ASTExtDecl
{
   ASTAttrib attr;
}
