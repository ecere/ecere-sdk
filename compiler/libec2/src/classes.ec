import "externals"

public class ASTMemberInit : ASTNode
{
public:
   // Location realLoc;
   List<ASTIdentifier> identifiers;
   ASTInitializer initializer;

   // COMPILE DATA
   bool used;
   bool variable;
   bool takeOutExp;

   ASTMemberInit ::parse()
   {
      List<ASTIdentifier> identifiers = null;
      ASTInitializer initializer = null;
      if(lexer.peekToken().type == identifier)
      {
         int a = lexer.pushAmbiguity();
         while(true)
         {
            ASTIdentifier id = ASTIdentifier::parse();
            if(id)
            {
               if(!identifiers) identifiers = { };
               identifiers.Add(id);
               if(lexer.peekToken().type != '.')
                  break;
               else
                  lexer.readToken();
            }
         }
         if(lexer.peekToken().type == '=')
         {
            lexer.clearAmbiguity();
            lexer.readToken();
         }
         else
            lexer.popAmbiguity(a);
      }
      initializer = InitExp::parse();
      return (identifiers || initializer) ?
         ASTMemberInit { identifiers = (void *)identifiers, initializer = initializer } : null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(identifiers)
      {
         Iterator<ASTIdentifier> it { identifiers };
         while(it.Next())
         {
            it.data.print(out, o);
            if(identifiers.GetNext(it.pointer))
               out.Print(".");
         }
         out.Print(" = ");
      }
      if(initializer)
         initializer.print(out, o);
      printEnd(out, o);
   }
};

public class MemberInitList : ASTList<ASTMemberInit>
{
public:
   MemberInitList ::parse()
   {
      MemberInitList list = (MemberInitList)ASTList::parse(class(MemberInitList), ASTMemberInit::parse, ',');
      if(lexer.peekToken().type == ';')
         lexer.readToken();
      return list;
   }
}

public class ASTPropertyDef : ASTNode
{
public:
   SpecsList specifiers;
   ASTDeclarator declarator;
   ASTIdentifier id;
   ASTStatement getStmt;
   ASTStatement setStmt;
   ASTStatement issetStmt;
   // Symbol symbol;
   bool conversion;
   bool isWatchable;
   ASTExpression category;
};

public class ClassDefList : ASTList<ASTClassDef>
{
public:
   ClassDefList ::parse()
   {
      return (ClassDefList)ASTList::parse(class(ClassDefList), ASTClassDef::parse, 0);
   }

   void printSep(File out)
   {
   }
}

public class ASTClassDef : ASTNode
{
public:
   AccessMode memberAccess;

   // IDE
   void * object;

   ASTClassDef ::parse()
   {
      SpecsList specs = null;
      InitDeclList decls = null;
      int a = -1;
      ASTDeclarator decl;

      lexer.peekToken();
      if(lexer.nextToken.type == '}')
         return null;

      if(lexer.nextToken.type == identifier)
         a = lexer.pushAmbiguity();

      specs = SpecsList::parse(true);
      decls = InitDeclList::parse();
      lexer.peekToken();
      decl = GetFuncDecl(decls && decls[0] ? decls[0].declarator : null);
      if(decl)
      {
         if(a > -1) lexer.clearAmbiguity();
         return ClassDefFunction::parse(specs, decls);
      }
      else if((specs || decls) && (lexer.nextToken.type != '.' && lexer.nextToken.type != '='))
      {
         if(a > -1) lexer.clearAmbiguity();
         return ClassDefDeclaration::parse(specs, decls);
      }
      else if(a > -1)
      {
         ClassDefInitialization init;
         lexer.popAmbiguity(a);

         init = ClassDefInitialization::parse();
         if(init)
            return init;
      }
      lexer.readToken(); // Error
      return null;
   }
};

public class ClassDefClassPropertyValue : ASTClassDef
{
public:
   ASTIdentifier id;
   ASTInitializer initializer;
}

public class ClassDefDeclaration : ASTClassDef
{
public:
   ASTDeclaration decl;

   ClassDefDeclaration ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTDeclaration decl = ASTDeclaration::parse(specs, decls);
      if(decl)
      {
         return { decl = decl };
      }
      return null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      printIndent(out);
      if(decl) decl.print(out, o);
      out.PrintLn("");
      printEnd(out, o);
   }
}

public class ASTClassFunction : ASTFunctionDefinition
{
public:
   Class _class;
   //List attached;    // For IDE
   AccessMode declMode;

   // COMPILING DATA
   //Type type;
   //Symbol propSet;

   bool isVirtual;
   bool isConstructor, isDestructor;
   bool dontMangle;
   // int id, idCode;

   ASTClassFunction ::parse(SpecsList specs, InitDeclList decls)
   {
      return (ASTClassFunction)ASTFunctionDefinition::parse(specs, decls);
   }
};

public class ClassDefFunction : ASTClassDef
{
public:
   ASTClassFunction function;

   ClassDefFunction ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTClassFunction function = ASTClassFunction::parse(specs, decls);
      if(function)
         return { function = function };
      return null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(function) function.print(out, o);
      printEnd(out, o);
   }
}

public class ClassDefInitialization : ASTClassDef
{
public:
   MemberInitList defValues;

   ClassDefInitialization ::parse()
   {
      MemberInitList defValues = MemberInitList::parse();
      if(defValues)
         return { defValues = defValues };
      return null;
   }

   void print(File out, OutputOptions o)
   {
      printStart(out, o);
      if(defValues)
      {
         printIndent(out);
         defValues.print(out, o);
         out.PrintLn(";");
      }
      printEnd(out, o);
   }
}

public class ClassDefProperty : ASTClassDef
{
public:
   ASTPropertyDef propertyDef;
}

public class ClassDefPropertyWatch : ASTClassDef
{
public:
   ASTPropertyWatch propertyWatch;
}

public class ClassDefDesigner : ASTClassDef
{
public:
   String designer;
}

public class ClassDefDefaultProperty : ASTClassDef
{
public:
   ASTIdentifier defaultProperty;
}
