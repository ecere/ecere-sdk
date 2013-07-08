import "externals"

/*
public class MembersInit : struct
{
public:
   MembersInit prev, next;
   Location loc;
   MembersInitType type;
   union
   {
      OldList * dataMembers;
      ClassFunction function;
   };
   //bool coloned;
};

public class MemberInit : struct
{
public:
   MemberInit prev, next;
   Location loc;
   Location realLoc;
   OldList * identifiers;
   // Expression exp;
   Initializer initializer;

   // COMPILE DATA
   bool used;
   bool variable;
   bool takeOutExp;
};
*/

/*
public class ASTClassDefinition : struct
{
public:
   ASTSpecifier _class;
   SpecsList baseSpecs;
   SpecsList definitions;
   Symbol symbol;
   Location blockStart;
   Location nameLoc;
   int endid;
   AccessMode declMode;
   bool deleteWatchable;
};
*/

/*
public class PropertyDef : struct
{
public:
   PropertyDef prev, next;
   Location loc;
   OldList * specifiers;
   ASTDeclarator declarator;
   Identifier id;
   Statement getStmt;
   Statement setStmt;
   Statement issetStmt;
   Symbol symbol;
   bool conversion;
   bool isWatchable;
   Expression category;
};
*/

public class ClassDefList : ASTList<ASTClassDef>
{
   ClassDefList ::parse()
   {
      return (ClassDefList)ASTList::parse(class(ClassDefList), ASTClassDef::parse, 0);
   }

   void printSep()
   {
      PrintLn("");
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
      SpecsList specs = SpecsList::parse();
      InitDeclList decls = InitDeclList::parse();

      if(peekToken().type == '{')
         return ClassDefFunction::parse(specs, decls);
      else if(specs || decls)
         return ClassDefDeclaration::parse(specs, decls);
      else
      {
         readToken(); // Error
         return null;
      }
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
      {
         return { function = function };
      }
      return null;
   }

   void print()
   {
      if(function) function.print();
   }
}

/*
   List<ASTMemberInit> defProperties;
   ASTPropertyDef propertyDef;
   ASTPropertyWatch propertyWatch;
   String designer;
   ASTIdentifier defaultProperty;
*/
