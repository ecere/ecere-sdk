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
      if(peekToken().type == identifier)
      {
         int a = pushAmbiguity();
         while(true)
         {
            ASTIdentifier id = ASTIdentifier::parse();
            if(id)
            {
               if(!init.identifiers) init.identifiers = { };
               init.identifiers.Add(id);
               if(peekToken().type != '.')
                  break;
               else
                  readToken();
            }
         }
         if(peekToken().type == '=')
         {
            clearAmbiguity();
            readToken();
         }
         else
            popAmbiguity(a);
      }
      init.initializer = InitExp::parse();
      return init;
   }

   void print(OutputOptions o)
   {
      printStart(o);
      if(identifiers)
      {
         Iterator<ASTIdentifier> it { identifiers };
         while(it.Next())
         {
            it.data.print(o);
            if(identifiers.GetNext(it.pointer))
               out.Print(".");
         }
         out.Print(" = ");
      }
      if(initializer)
         initializer.print(o);
      printEnd(o);
   }
};

public class MemberInitList : ASTList<ASTMemberInit>
{
public:
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
public:
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
public:
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
      ASTDeclarator decl;

      peekToken();
      if(nextToken.type == '}')
         return null;

      if(nextToken.type == identifier)
         a = pushAmbiguity();

      specs = SpecsList::parse();
      decls = InitDeclList::parse();
      peekToken();
      decl = GetFuncDecl(decls && decls[0] ? decls[0].declarator : null);
      if(decl)
      {
         if(a > -1) clearAmbiguity();
         return ClassDefFunction::parse(specs, decls);
      }
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

   void print(OutputOptions o)
   {
      printStart(o);
      printIndent();
      if(decl) decl.print(o);
      out.PrintLn("");
      printEnd(o);
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
public:
   ASTClassFunction function;

   ClassDefFunction ::parse(SpecsList specs, InitDeclList decls)
   {
      ASTClassFunction function = ASTClassFunction::parse(specs, decls);
      if(function)
         return { function = function };
      return null;
   }

   void print(OutputOptions o)
   {
      printStart(o);
      if(function) function.print(o);
      printEnd(o);
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

   void print(OutputOptions o)
   {
      printStart(o);
      if(defValues)
      {
         printIndent();
         defValues.print(o);
         out.PrintLn(";");
      }
      printEnd(o);
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
