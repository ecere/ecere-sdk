/*
public class ClassFunction : struct
{
public:
   ClassFunction prev, next;
   Location loc;
   OldList * specifiers;
   ASTDeclarator declarator;
   OldList * declarations;
   Statement body;
   Class _class;
   OldList attached;    // For IDE
   AccessMode declMode;
   
   // COMPILING DATA
   Type type;
   Symbol propSet;

   bool isVirtual;
   bool isConstructor, isDestructor;
   bool dontMangle;
   int id, idCode;
};

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

public class ClassDefinition : struct
{
public:
   ClassDefinition prev, next;
   Location loc;
   Specifier _class;
   // Specifier base;
   OldList * baseSpecs;
   OldList * definitions;
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

public class ClassDef : struct
{
public:
   ClassDef prev, next;
   Location loc;
   ClassDefType type;
   union
   {
      Declaration decl;
      ClassFunction function;
      OldList * defProperties;
      PropertyDef propertyDef;
      ASTPropertyWatch propertyWatch;
      char * designer;
      Identifier defaultProperty;
      struct
      {
         Identifier id;
         Initializer initializer;
      };
   };
   AccessMode memberAccess;

   // IDE
   void * object;
};
*/
