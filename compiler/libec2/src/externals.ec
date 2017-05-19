import "statements"
import "lexing"

public class ASTDeclaration : ASTStmtOrDecl
{
public:
   // DeclarationType type;
   // ASTSpecifier extStorage;
   // Symbol symbol;
   // AccessMode declMode;

   ASTDeclaration ::parse(SpecsList specs, InitDeclList decls)
   {
      lexer.peekToken();
      if(lexer.nextToken.type == '{')
         return DeclarationInstance::parse(specs, decls);
      else if(lexer.nextToken.type == ';')
         lexer.readToken();
      return DeclarationInit { specifiers = specs, declarators = decls };
   }
}

public class DeclarationInit : ASTDeclaration
{
public:
   SpecsList specifiers;
   InitDeclList declarators;
   String comment;

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(specifiers)
      {
         specifiers.print(out, o);
         if(declarators) out.Print(" ");
      }
      if(declarators) declarators.print(out, o);
      out.Print(";");
      if(comment) out.Print(" // ", comment);
      printEnd(out, o);
   }
}

public class DeclarationInstance : ASTDeclaration
{
public:
   ASTInstantiation inst;

   DeclarationInstance ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTInstantiation inst = ASTInstantiation::parse(specs, decls);
      if(lexer.peekToken().type == ';')
         lexer.readToken();
      if(inst)
      {
         return { inst = inst };
      }
      return null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(inst)
      {
         inst.print(out, o);
         out.Print(";");
      }
      printEnd(out, o);
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

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      // out.PrintLn("");
      printIndent(out);
      if(specifiers)
      {
         for(s : specifiers)
            s.print(out, o);
         out.Print(" ");
      }
      if(declarator)
         declarator.print(out, o);
      out.PrintLn("");
      if(body)
         body.print(out, o);
      printEnd(out, o);
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

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      out.Print("import ");
      out.PrintLn(importString);
      printEnd(out, o);
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
      else if(decl._class == class(DeclPointer) || decl._class == class(DeclArray))
         funcDecl = null;
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

      lexer.peekToken();
      if(lexer.nextToken.type == _import)
      {
         ASTImport astImport { };
         lexer.readToken();
         lexer.peekToken();
         if(lexer.nextToken.type == _static)
         {
            lexer.readToken();
         }
         else if(lexer.nextToken.type == identifier)
         {
            lexer.readToken();
         }
         lexer.peekToken();
         if(lexer.nextToken.type == stringLiteral)
         {
            lexer.readToken();
            astImport.importString = CopyString(lexer.token.text);
         }
         return astImport;
      }
      else
      {
         specs = SpecsList::parse(true);
         decls = InitDeclList::parse();
         if(lexer.nextToken.type == '{')
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
            lexer.readToken(); // Error
            return null;
         }
      }
   }
public:
   AST ::parse()
   {
      AST ast = null;
      while(lexer.peekToken())
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

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      for(n : this)
      {
         n.print(out, o);
         out.PrintLn("");
      }
      printEnd(out, o);
   }
}
