import "astNode"

// Specifiers
public class ASTSpecifier : ASTNode
{
public:
   SpecifierType type;
  /*    struct
      {
         //ExtDecl extDecl;
         //Symbol symbol;
         //OldList * templateArgs;
      };
      struct
      {
         Identifier id;
         OldList * list;
         OldList * baseSpecs;
         OldList * definitions;
         bool addNameSpace;
         Context ctx;
         ExtDecl extDeclStruct;
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
         if(nextToken.type.isSpecifier)
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

/*
public class Enumerator : struct
{
public:
   Enumerator prev, next;
   Location loc;
   Identifier id;
   Expression exp;
};
*/
