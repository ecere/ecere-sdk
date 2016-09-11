import "statements"

public class ASTDeclaration : ASTStmtOrDecl
{
public:
   DeclarationType type;
   // ASTSpecifier extStorage;
   // Symbol symbol;
   // AccessMode declMode;

   ASTDeclaration ::parse(SpecsList specs, InitDeclList decls)
   {
      peekToken();
      if(nextToken.type == '{')
         return DeclarationInstance::parse(specs, decls);
      else if(nextToken.type == ';')
         readToken();
      return DeclarationInit { specifiers = specs, declarators = decls };
   }
}

public class DeclarationInit : ASTDeclaration
{
public:
   SpecsList specifiers;
   InitDeclList declarators;

   void print(OutputOptions o)
   {
      printStart(o);
      if(specifiers)
      {
         specifiers.print(o);
         if(declarators) out.Print(" ");
      }
      if(declarators) declarators.print(o);
      out.Print(";");
      printEnd(o);
   }
}

public class DeclarationInstance : ASTDeclaration
{
public:
   ASTInstantiation inst;

   DeclarationInstance ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTInstantiation inst = ASTInstantiation::parse(specs, decls);
      if(peekToken().type == ';')
         readToken();
      if(inst)
      {
         return { inst = inst };
      }
      return null;
   }

   void print(OutputOptions o)
   {
      printStart(o);
      if(inst)
      {
         inst.print(o);
         out.Print(";");
      }
      printEnd(o);
   }
}

public class DeclarationDefine : ASTDeclaration
{
public:
   ASTIdentifier id;
   ASTExpression exp;
}

public class ASTFunctionDefinition : ASTNode
{
public:
   SpecsList specifiers;
   ASTDeclarator declarator;
   List<ASTDeclaration> oldStyleDeclarations;
   StmtCompound body;

   void print(OutputOptions o)
   {
      printStart(o);
      // out.PrintLn("");
      printIndent();
      if(specifiers)
      {
         for(s : specifiers)
            s.print(o);
         out.Print(" ");
      }
      if(declarator)
         declarator.print(o);
      out.PrintLn("");
      if(body)
         body.print(o);
      printEnd(o);
   }

   ASTFunctionDefinition ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTFunctionDefinition function { };
      ASTDeclarator decl = (decls && decls[0]) ? decls[0].declarator : null;
      if(decl && decls[0]) decls[0].declarator = null;
      delete decls;
      function.specifiers = specs;
      function.declarator = decl;
      function.body = StmtCompound::parse();
      return function;
   }
   /*
   Class _class;
   OldList attached;    // For IDE
   AccessMode declMode;

   Type type;
   Symbol propSet;

   int tempCount;
   bool propertyNoThis; // Not used yet; might use to support both this = and return syntax for conversion properties
   */
};

class ASTImport : ASTNode
{
   String importString;

   void print(OutputOptions o)
   {
      printStart(o);
      out.Print("import ");
      out.PrintLn(importString);
      printEnd(o);
   }
}

/*
   union
   {
      ASTFunctionDefinition function;
      SpecClass _class;
      ASTDeclaration declaration;
      ASTIdentifier id;
      DBTableDef table;
   };
};
*/

/*
class External
{
   ImportType importType;
}
*/

public ASTDeclarator GetFuncDecl(ASTDeclarator decl)
{
   ASTDeclarator funcDecl = null;
   while(decl && decl._class != class(DeclIdentifier))
   {
      if(decl._class == class(DeclFunction))
         funcDecl = decl;
      decl = decl.declarator;
   }
   return funcDecl;
}

public class AST : ASTList<ASTNode>
{
public:
   ASTNode ::parseExternalDeclaration()
   {
      SpecsList specs = null;
      InitDeclList decls = null;

      peekToken();
      if(nextToken.type == _import)
      {
         ASTImport astImport { };
         readToken();
         peekToken();
         if(nextToken.type == _static)
         {
            readToken();
         }
         else if(nextToken.type == identifier)
         {
            readToken();
         }
         peekToken();
         if(nextToken.type == stringLiteral)
         {
            readToken();
            astImport.importString = CopyString(token.text);
         }
         return astImport;
      }
      else
      {
         specs = SpecsList::parse();
         decls = InitDeclList::parse();
         if(nextToken.type == '{')
         {
            ASTDeclarator funcDecl = GetFuncDecl((decls && decls[0]) ? decls[0].declarator : null);
            if(funcDecl)
               return ASTFunctionDefinition::parse(specs, decls);
            else
               return ASTDeclaration::parse(specs, decls);
         }
         else if(specs || decls)
            return ASTDeclaration::parse(specs, decls);
         else
         {
            readToken(); // Error
            return null;
         }
      }
   }
public:
   AST ::parse()
   {
      AST ast = null;
      while(peekToken())
      {
         ASTNode n = parseExternalDeclaration();
         if(n)
         {
            if(!ast) ast = { };
            ast.Add(n);
         }
      }
      return ast;
   }

   void print(OutputOptions o)
   {
      printStart(o);
      for(n : this)
      {
         n.print(o);
         out.PrintLn("");
      }
      printEnd(o);
   }
}
