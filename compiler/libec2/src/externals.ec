import "statements"

public class ASTDeclaration : ASTStmtOrDecl
{
public:
   DeclarationType type;

   ASTDeclaration ::parse(SpecsList specs, InitDeclList decls)
   {
      if(peekToken().type == ';')
         readToken();
      return DeclarationInit { specifiers = specs, declarators = decls };
   }
}

public class DeclarationInit : ASTDeclaration
{
public:
   SpecsList specifiers;
   InitDeclList declarators;

   void print()
   {
      if(specifiers)
      {
         for(s : specifiers)
            s.print();
         Print(" ");
      }
      if(declarators)
         declarators.print();
      Print(";");
   }
}

public class ASTFunctionDefinition : ASTNode
{
public:
   SpecsList specifiers;
   ASTDeclarator declarator;
   List<ASTDeclaration> oldStyleDeclarations;
   StmtCompound body;

   void print()
   {
      PrintLn("");
      if(specifiers) 
      {
         for(s : specifiers)
            s.print();
         Print(" ");
      }
      if(declarator)
         declarator.print();
      PrintLn("");
      if(body)
         body.print();
   }

   ASTFunctionDefinition ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTFunctionDefinition function { };
      ASTDeclarator decl = (decls && decls[0]) ? decls[0].declarator : null;
      if(decl && decls[0]) decls[0].declarator = null;
      delete decls;
      function.specifiers = (void *)specs;         // TOFIX: #768
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

/*
   union
   {
      FunctionDefinition function;
      ClassDefinition _class;
      Declaration declaration;
      char * importString;
      Identifier id;
      DBTableDef table;
   };
   ImportType importType;
};
*/

public class AST : ASTList<ASTNode>
{
   ASTNode ::ParseExternalDeclaration()
   {
      SpecsList specs = SpecsList::parse();
      InitDeclList decls = InitDeclList::parse();

      if(peekToken().type == '{')
         return ASTFunctionDefinition::parse(specs, decls);
      else if(specs || decls)
         return ASTDeclaration::parse(specs, decls);
      else
      {
         readToken(); // Error
         return null;
      }
   }
public:
   AST ::parse()
   {
      AST ast = null;
      while(peekToken().type)
      {
         ASTNode n = ParseExternalDeclaration();
         if(n)
         {
            if(!ast) ast = { };
            ast.Add(n);
         }
      }
      return ast;
   }

   void print()
   {
      for(n : this)
      {
         n.print();
         PrintLn("");
      }
   }
}
