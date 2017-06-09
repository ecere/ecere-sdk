import "astNode"
import "classes"

// Specifiers
public class ASTSpecifier : ASTNode
{
public:
};

public class SpecTypeOf : ASTSpecifier
{
public:
   // Expression expression;

   ~SpecTypeOf()
   {
   }
}

public class SpecSubClass : ASTSpecifier
{
public:
   ASTSpecifier _class;

   ~SpecSubClass()
   {
      delete _class;
   }
}

public class SpecTemplateType : ASTSpecifier
{
public:
   // TemplateParameter templateParameter;
}

public class SpecsList : ASTList<ASTSpecifier>
{
public:
   void printSep(File out)
   {
      out.Print(" ");
   }

   SpecsList ::parse(bool identifiers)
   {
      SpecsList specs = null;
      bool gotSpec = false;
      while(true)
      {
         lexer.peekToken();
         if(lexer.nextToken.type == _struct || lexer.nextToken.type == _union || lexer.nextToken.type == _class || lexer.nextToken.type == _enum)
         {
            ASTSpecifier s = SpecClass::parse();
            if(s)
            {
               if(!specs) specs = { };
               specs.Add(s);
            }
            break;
         }
         else if(lexer.nextToken.type.isSpecifier)
         {
            lexer.readToken();
            if(!specs) specs = { };
            specs.Add(SpecBase { specifier = lexer.token.type });
            if(!lexer.token.type.isQualifier && lexer.token.type != _typedef)
               gotSpec = true;
         }
         else if(identifiers && lexer.nextToken.type == identifier)
         {
            bool isType = false;
            if(isType || !gotSpec)
            {
               lexer.readToken();
               if(!specs) specs = { };
               specs.Add(SpecName { name = CopyString(lexer.token.text) });
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
public:
   TokenType2 specifier;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      specifier.print(out, o);
      printEnd(out, o);
   }
}

public class SpecName : ASTSpecifier
{
public:
   String name;
   //ExtDecl extDecl;
   //Symbol symbol;
   //List<ClassTemplateArgument> templateArgs;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(name) out.Print(name);
      printEnd(out, o);
   }

   ~SpecName()
   {
      delete name;
   }
}

public class SpecClass : ASTSpecifier
{
public:
   TokenType2 type;
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
   // Context ctx;
   // ExtDecl extDeclStruct;

   SpecClass ::parse()
   {
      SpecClass spec = (lexer.peekToken().type == _enum) ? SpecEnum { } : SpecClass { };
      spec.type = lexer.readToken().type;
      if(lexer.peekToken().type == identifier)
         spec.id = ASTIdentifier::parse();
      if(lexer.peekToken().type == ':')
      {
         lexer.readToken();
         spec.baseSpecs = SpecsList::parse(true);
      }
      if(lexer.peekToken().type == '{')
      {
         lexer.readToken();
         spec.definitions = ClassDefList::parse();
         if(!spec.definitions)
            spec.definitions = { };
         if(lexer.peekToken().type == '}')
            lexer.readToken();
      }
      return spec;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      type.print(out, o);
      if(type && id)
         out.Print(" ");
      if(id) id.print(out, o);
      if(baseSpecs)
      {
         out.Print(" : ");
         baseSpecs.print(out, o);
      }
      if(definitions)
      {
         out.PrintLn("");
         printIndent(out);
         out.PrintLn("{");
         indent++;
         definitions.print(out, o);
         indent--;
         printIndent(out);
         out.Print("}");
      }
      printEnd(out, o);
   }

   ~SpecClass()
   {
      delete id;
      delete baseSpecs;
      delete definitions;
   }
}

public class ASTEnumerator : ASTNode
{
public:
   ASTIdentifier id;
   ASTExpression exp;

   ~ASTEnumerator()
   {
      delete id;
      delete exp;
   }
};

public class EnumeratorList : ASTList<ASTEnumerator>
{
public:
}

public class SpecEnum : SpecClass
{
public:
   EnumeratorList enumerators;

   ~SpecEnum()
   {
      delete enumerators;
   }
}

public class ASTAttribute : ASTNode
{
public:
   String attr;
   ASTExpression exp;

   ~ASTAttribute()
   {
      delete attr;
      delete exp;
   }
}

public class ASTAttrib : ASTNode
{
public:
   TokenType2 type;
   List<ASTAttribute> attribs;

   ~ASTAttrib()
   {
      if(attribs) attribs.Free();
      delete attribs;
   }
}

public class ASTExtDecl : ASTNode { }

public class ExtDeclString : ASTExtDecl
{
public:
   String s;

   ~ExtDeclString()
   {
      delete s;
   }
}

public class ExtDeclAttrib : ASTExtDecl
{
public:
   ASTAttrib attr;

   ~ExtDeclAttrib()
   {
      delete attr;
   }
}
