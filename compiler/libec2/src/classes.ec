import "externals"

public class ASTMemberInit : ASTNode
{
public:
   Location realLoc;
   List<ASTIdentifier> identifiers;
   ASTInitializer initializer;

   // COMPILE DATA
   bool used;
   bool variable;
   bool takeOutExp;

   ASTMemberInit ::parse()
   {
      ASTMemberInit init { };
      while(true)
      {
         ASTIdentifier id = ASTIdentifier::parse();
         if(id)
         {
            if(!init.identifiers) init.identifiers = { };
            init.identifiers.Add(id);
            if(peekToken().type != '.')
               break;
         }
      }
      if(peekToken().type == '=')
      {
         readToken();
         init.initializer = ASTInitializer::parse();
      }
      return init;
   }

   void print()
   {
      if(identifiers)
      {
         Iterator<ASTIdentifier> it { identifiers };
         while(it.Next())
         {
            it.data.print();
            if(identifiers.GetNext(it.pointer))
               Print(".");
         }
      }
      Print(" = ");
      if(initializer) initializer.print();
   }
};

public class MemberInitList : ASTList<ASTMemberInit>
{
   MemberInitList ::parse()
   {
      MemberInitList list = (MemberInitList)ASTList::parse(class(MemberInitList), ASTMemberInit::parse, ',');
      if(peekToken().type == ';')
         readToken();
      return list;
   }
}

public class ASTPropertyDef : ASTNode
{
   SpecsList specifiers;
   ASTDeclarator declarator;
   ASTIdentifier id;
   ASTStatement getStmt;
   ASTStatement setStmt;
   ASTStatement issetStmt;
   Symbol symbol;
   bool conversion;
   bool isWatchable;
   ASTExpression category;
};

public class ClassDefList : ASTList<ASTClassDef>
{
   ClassDefList ::parse()
   {
      return (ClassDefList)ASTList::parse(class(ClassDefList), ASTClassDef::parse, 0);
   }

   void printSep()
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

      peekToken();
      if(nextToken.type == '}')
         return null;

      if(nextToken.type == IDENTIFIER)
         a = pushAmbiguity();

      specs = SpecsList::parse();
      decls = InitDeclList::parse();
      peekToken();
      if(nextToken.type == '{' || (decls && decls[0] && decls[0].declarator && decls[0].declarator._class == class(DeclFunction)))
         return ClassDefFunction::parse(specs, decls);
      else if((specs || decls) && (nextToken.type != '.' && nextToken.type != '='))
      {
         if(a > -1) clearAmbiguity();
         return ClassDefDeclaration::parse(specs, decls);
      }
      else if(a > -1)
      {
         ClassDefInitialization init;
         popAmbiguity(a);

         init = ClassDefInitialization::parse();
         if(init)
            return init;
      }
      readToken(); // Error
      return null;
   }
};

public class ClassDefClassPropertyValue : ASTClassDef
{
   ASTIdentifier id;
   ASTInitializer initializer;
}

public class ClassDefDeclaration : ASTClassDef
{
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

   void print()
   {
      printIndent();
      if(decl) decl.print();
      PrintLn("");
   }
}

public class ASTClassFunction : ASTFunctionDefinition
{
public:
   Class _class;
   //List attached;    // For IDE
   AccessMode declMode;
   
   // COMPILING DATA
   Type type;
   Symbol propSet;

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
   ASTClassFunction function;

   ClassDefFunction ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTClassFunction function = ASTClassFunction::parse(specs, decls);
      if(function)
         return { function = function };
      return null;
   }

   void print()
   {
      if(function) function.print();
   }
}

public class ClassDefInitialization : ASTClassDef
{
   MemberInitList defValues;

   ClassDefInitialization ::parse()
   {
      MemberInitList defValues = MemberInitList::parse();
      if(defValues)
         return { defValues = defValues };
      return null;
   }

   void print()
   {
      if(defValues)
      {
         printIndent();
         defValues.print();
         PrintLn(";");
      }
   }
}

public class ClassDefProperty : ASTClassDef
{
   ASTPropertyDef propertyDef;
}

public class ClassDefPropertyWatch : ASTClassDef
{
   ASTPropertyWatch propertyWatch;
}

public class ClassDefDesigner : ASTClassDef
{
   String designer;
}

public class ClassDefDefaultProperty : ASTClassDef
{
   ASTIdentifier defaultProperty;
}
