#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "ast"
import "freeAst"
import "firstPass"
import "pass0"
import "pass1"
import "pass15"
import "pass16"
import "pass2"
import "pass3"
import "loadSymbols"
import "copy"
import "shortcuts"
import "output"
import "dbpass"

#include <stdio.h>

enum Order { ascending, descending };

public class DBTableDef : struct
{
public:
   char * name;
   Symbol symbol;
   OldList * definitions;   
   AccessMode declMode;
}

enum DBTableEntryType { fieldEntry, indexEntry };

class DBTableEntry : struct
{
   DBTableEntry prev, next;
   DBTableEntryType type;
   Identifier id;
   union
   {
      struct
      {
         TypeName dataType;
         char * name;
      };
      OldList * items;
   };
};

class DBIndexItem : struct
{
   DBIndexItem prev, next;
   Identifier id;
   Order order;
};

bool inCompiler = false;
public void SetInCompiler(bool b) { inCompiler = b; }

Context curContext;
Context globalContext;
OldList * excludedSymbols;

Context topContext;
OldList * imports;
OldList * defines;
Module privateModule;
public void SetPrivateModule(Module module) { privateModule = module; }public Module GetPrivateModule() { return privateModule; }
ModuleImport mainModule;
public void SetMainModule(ModuleImport moduleImport) { mainModule = moduleImport; } public ModuleImport GetMainModule() { return mainModule; }
File fileInput;
public void SetFileInput(File file) { fileInput = file; }
char * symbolsDir = null;
public void SetSymbolsDir(char * s) { 
   delete symbolsDir;
   symbolsDir = CopyString(s);
} public char * GetSymbolsDir() { return symbolsDir ? symbolsDir : ""; }
char * outputFile;
public void SetOutputFile(char * s) { outputFile = s; } public char * GetOutputFile() { return outputFile; }
char * sourceFile;
public void SetSourceFile(char * s) { sourceFile = s; } public char * GetSourceFile() { return sourceFile; }

public void SetGlobalContext(Context context) { globalContext = context; } public Context GetGlobalContext() { return globalContext; }
public void SetTopContext(Context context) { topContext = context; } public Context GetTopContext() { return topContext; }
public void SetCurrentContext(Context context) { curContext = context; } public Context GetCurrentContext() { return curContext; }
public void SetExcludedSymbols(OldList * list) { excludedSymbols = list; }
public void SetImports(OldList * list) { imports = list; }
public void SetDefines(OldList * list) { defines = list; }

bool outputLineNumbers = true;
public void SetOutputLineNumbers(bool value) { outputLineNumbers = value; }

/*public Module GetPrivateModule()
{
   return privateModule;
}*/

public class GlobalData : BTNode
{
public:
   Module module;
   char * dataTypeString;
   Type dataType;
   void * symbol;
   char * fullName;
};

public class TemplatedType : BTNode
{
public:
   TemplateParameter param;
};

class DataRedefinition : struct
{
   DataRedefinition prev, next;
   char name[1024];
   char type1[1024], type2[1024];
};

public struct CodePosition
{
public:
   int line, charPos, pos;
   bool included;

   void AdjustDelete(BufferLocation start, BufferLocation end)
   {
      // Location is before, nothing to do
      if(line - 1 < start.y || (line - 1 == start.y && charPos - 1 < start.x))
         return;
      // Location is inside deleted bytes, point to the start
      if((line - 1 >= start.y && (line - 1 > start.y || charPos - 1 >= start.x)) &&
         (line - 1 >= end.y && (line - 1 > end.y || charPos - 1 >= end.x)))
      {
         // Location is after
         if(line - 1 >= end.y)
         {
            // Location is on another line
            if(line - 1 > end.y)
               line -= end.y - start.y;
            // Location is the last touched line
            else 
            {
               if(charPos - 1 >= end.x)
               {
                  line = start.y + 1;
                  //if(start.line == end.line)
                     charPos -= end.x - start.x;
               }
            }
         }
      }
      else
      {
         line = start.y + 1;
         charPos = start.x + 1;
      }
   }

   // Assuming no carriage return before first character ???? fixed?
   void AdjustAdd(BufferLocation start, BufferLocation end)
   {
      int numLines = end.y - start.y;
      if(line - 1 >= start.y)
      {
         if(line - 1 > start.y)
            line += numLines;
         else
         {
            if(charPos - 1 > start.x || (charPos - 1 == start.x /*&& (numLines ? true : false)*/))
            {
               line += numLines;
               //charPos - 1 += numLines ? end.x : (end.x - start.x);            
               charPos += end.x - start.x;
            }
         }
      }
   }
};

public struct Location
{
public:
   CodePosition start, end;

   bool Inside(int line, int charPos)
   {
      return (start.line < line || (start.line == line && start.charPos <= charPos)) && 
             (end.line > line || (end.line == line && end.charPos >= charPos));
   }
};

public enum DefinitionType { moduleDefinition, classDefinition, defineDefinition, functionDefinition, dataDefinition };

public class Definition : struct
{
public:
   Definition prev, next;
   char * name;
   DefinitionType type;
};

public class ImportedModule : struct
{
public:
   ImportedModule prev, next;
   char * name;
   DefinitionType type;
   ImportType importType;
   bool globalInstance;
   bool dllOnly;
   AccessMode importAccess;
};

public class Identifier : struct
{
public:
   Identifier prev, next;
   Location loc;
   // TODO: NameSpace * nameSpace;
   Symbol classSym;
   Specifier _class;
   char * string;
   Identifier badID;
};

public enum ExpressionType
{ 
   identifierExp, instanceExp, constantExp, stringExp, opExp,
   bracketsExp, indexExp, callExp, memberExp, pointerExp, typeSizeExp,
   castExp, conditionExp, newExp, renewExp, classSizeExp,
   dummyExp, dereferenceErrorExp, symbolErrorExp, classMemberSymbolErrorExp,
   structMemberSymbolErrorExp, memoryErrorExp, unknownErrorExp,
   noDebuggerErrorExp, debugStateErrorExp,
   extensionCompoundExp, classExp, classDataExp, new0Exp, renew0Exp,
   dbopenExp, dbfieldExp, dbtableExp, dbindexExp, extensionExpressionExp, extensionInitializerExp,
   vaArgExp, arrayExp, typeAlignExp
};

public enum MemberType
{
   unresolvedMember, propertyMember, methodMember, dataMember, reverseConversionMember, classPropertyMember
};

public class ExpUsage
{
public:
   bool usageGet:1, usageSet:1, usageArg:1, usageCall:1, usageMember:1, usageDeepGet:1, usageRef:1, usageDelete:1;
};

public class TemplateParameter : struct
{
public:
   TemplateParameter prev, next;
   Location loc;
   
   TemplateParameterType type;
   Identifier identifier;
   union
   {
      TemplateDatatype dataType; // For both base datatype (type) and data type (expression)
      TemplateMemberType memberType;   // For identifier
   };
   TemplateArgument defaultArgument;
    
   // For type parameters
   char * dataTypeString;
   Type baseType;
}

public class TemplateDatatype : struct
{
public:
   OldList * specifiers;
   Declarator decl;
}

public class TemplateArgument : struct
{
public:
   TemplateArgument prev, next;
   Location loc;
   
   Identifier name;
   TemplateParameterType type;
   union
   {
      Expression expression;
      Identifier identifier;
      TemplateDatatype templateDatatype;
   };
}

public enum SpecifierType
{
   baseSpecifier, nameSpecifier, enumSpecifier, structSpecifier, unionSpecifier, /*classSpecifier,*/
   extendedSpecifier, typeOfSpecifier, subClassSpecifier, templateTypeSpecifier
};

public class Specifier : struct
{
public:
   Specifier prev, next;
   Location loc;
   SpecifierType type;
   union
   {
      int specifier;
      struct
      {
         ExtDecl extDecl;
         char * name;
         Symbol symbol;
         OldList * templateArgs;
      };
      struct
      {
         Identifier id;
         OldList * list;
         OldList * baseSpecs;
         OldList * definitions;
         bool addNameSpace;
         Context ctx;
      };
      Expression expression;
      Specifier _class;
      TemplateParameter templateParameter;
   };
};

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

public enum ExtDeclType
{
   extDeclString, extDeclAttrib
};

public class Expression : struct
{
public:
   Expression prev, next;
   Location loc;
   ExpressionType type;
   union
   {
      struct
      {
         char * constant;
         Identifier identifier;
      };
      Statement compound;
      Instantiation instance;
      char * string;
      OldList * list;
      struct
      {
         OldList * specifiers;
         Declarator decl;
      } _classExp;
      struct
      {
         Identifier id;
      } classData;
      struct
      {
         Expression exp;
         OldList * arguments;
         Location argLoc;
      } call;
      struct
      {
         Expression exp;
         OldList * index;
      } index;
      struct
      {
         Expression exp;
         Identifier member;

         MemberType memberType;
         bool thisPtr;
      } member;
      struct
      {
         int op;
         Expression exp1, exp2;
      } op;
      TypeName typeName;
      Specifier _class;
      struct
      {
         TypeName typeName;
         Expression exp;
      } cast;
      struct
      {
         Expression cond;
         OldList * exp;
         Expression elseExp;
      } cond;
      struct
      {
         TypeName typeName;
         Expression size;
      } _new;
      struct
      {
         TypeName typeName;
         Expression size;
         Expression exp;
      } _renew;
      struct
      {
         char * table;
         Identifier id;
      } db;
      struct
      {
         Expression ds;
         Expression name;
      } dbopen;
      struct
      {
         TypeName typeName;
         Initializer initializer;
      } initializer;
      struct
      {
         Expression exp;
         TypeName typeName;
      } vaArg;
   };

   bool debugValue;

   DataValue val;

   uint address;
   bool hasAddress;

   // *** COMPILING DATA ***
   Type expType;
   Type destType;

   ExpUsage usage;
   int tempCount;
   bool byReference;
   bool isConstant;
   bool addedThis;
   bool needCast;
   bool thisPtr;

   void Clear()
   {
      debugValue = false;
      val = { 0 };
      address = 0;
      hasAddress = false;

      expType = null;
      destType = null;

      usage = 0;
      tempCount = 0;
      byReference = false;
      isConstant = false;
      addedThis = false;
      needCast = false;
      thisPtr = false;
   }
};

public class Enumerator : struct
{
public:
   Enumerator prev, next;
   Location loc;
   Identifier id;
   Expression exp;
};

class Pointer : struct
{
   Pointer prev, next;
   Location loc;
   OldList * qualifiers;
   Pointer pointer;
};

public enum DeclaratorType
{
   structDeclarator, identifierDeclarator, bracketsDeclarator, arrayDeclarator, 
   functionDeclarator, pointerDeclarator, extendedDeclarator, extendedDeclaratorEnd
};

public class Declarator : struct
{
public:
   Declarator prev, next;
   Location loc;
   DeclaratorType type;
   Symbol symbol;//, propSymbol;
   Declarator declarator;
   union
   {
      Identifier identifier;
      struct
      {
         Expression exp;
         Expression posExp;
         Attrib attrib;
      } structDecl;
      struct
      {
         Expression exp;
         Specifier enumClass;
      } array;
      struct
      {
         OldList * parameters;
      } function;
      struct
      {
         Pointer pointer;
      } pointer;
      struct
      {
         ExtDecl extended;
      } extended;
   };
};

public enum InitializerType { expInitializer, listInitializer };

public class Initializer : struct
{
public:
   Initializer prev, next;
   Location loc;
   InitializerType type;
   union
   {
      Expression exp;
      OldList * list;
   };
   bool isConstant;
};

public class InitDeclarator : struct
{
public:
   InitDeclarator prev, next;
   Location loc;
   Declarator declarator;
   Initializer initializer;
};

public enum ClassObjectType
{
   none,
   classPointer,
   typedObject,
   anyObject
};

public class TypeName : struct
{
public:
   TypeName prev, next;
   Location loc;
   OldList * qualifiers;
   Declarator declarator;
   //bool /*typedObject, */byReference;
   //bool anyObject;
   ClassObjectType classObjectType;
   Expression bitCount;
};

class AsmField : struct
{
   AsmField prev, next;
   Location loc;
   char * command;
   Expression expression;
};

public enum StmtType { labeledStmt, caseStmt, compoundStmt,
               expressionStmt, ifStmt, switchStmt, whileStmt, doWhileStmt, 
               forStmt, gotoStmt, continueStmt, breakStmt, returnStmt, asmStmt, badDeclarationStmt,
               fireWatchersStmt, stopWatchingStmt, watchStmt, forEachStmt
             };

public class Statement : struct
{
public:
   Statement prev, next;
   Location loc;
   StmtType type;
   union
   {
      OldList * expressions;
      struct
      {
         Identifier id;
         Statement stmt;
      } labeled;
      struct
      {
         Expression exp;
         Statement stmt;
      } caseStmt;
      struct
      {
         OldList * declarations;
         OldList * statements;
         Context context;
         bool isSwitch;
      } compound;
      struct
      {
         OldList * exp;
         Statement stmt;
         Statement elseStmt;                  
      } ifStmt;
      struct
      {
         OldList * exp;
         Statement stmt;
      } switchStmt;
      struct
      {
         OldList * exp;
         Statement stmt;
      } whileStmt;
      struct
      {
         OldList * exp;
         Statement stmt;
      } doWhile;
      struct
      {
         Statement init;
         Statement check;
         OldList * increment;
         Statement stmt;
      } forStmt;
      struct
      {
         Identifier id;
      } gotoStmt;
      struct
      {
         Specifier spec;
         char * statements;
         OldList * inputFields;
         OldList * outputFields;
         OldList * clobberedFields;
      } asmStmt;
      struct
      {
         Expression watcher, object;
         OldList * watches;   // OldList of PropertyWatch for a StmtWatch, list of property identifiers for firewatches, stopwatching
      } _watch;
      struct
      {
         Identifier id;
         OldList * exp;
         OldList * filter;
         Statement stmt;
      } forEachStmt;
      Declaration decl;
   };
};

public enum DeclarationType { structDeclaration, initDeclaration, instDeclaration, defineDeclaration };

public class Declaration : struct
{
public:
   Declaration prev, next;
   Location loc;
   DeclarationType type;
   union
   {
      struct
      {
         OldList * specifiers;
         OldList * declarators;
      };
      Instantiation inst;
      struct
      {
         Identifier id;
         Expression exp;
      };
   };
   Specifier extStorage;
   Symbol symbol;
   AccessMode declMode;
};

public class Instantiation : struct
{
public:
   Instantiation prev, next;
   Location loc;
   Specifier _class;
   Expression exp;
   OldList * members;
   Symbol symbol;
   bool fullSet;
   bool isConstant;
   byte * data;
   Location nameLoc, insideLoc;
   bool built;
};

public enum MembersInitType { dataMembersInit, methodMembersInit };

public class FunctionDefinition : struct
{
public:
   FunctionDefinition prev, next;
   Location loc;
   OldList * specifiers;
   Declarator declarator;
   OldList * declarations;
   Statement body;
   Class _class;
   OldList attached;    // For IDE
   AccessMode declMode;

   Type type;
   Symbol propSet;

   int tempCount;
   bool propertyNoThis; // Not used yet; might use to support both this = and return syntax for conversion properties
};

public class ClassFunction : struct
{
public:
   ClassFunction prev, next;
   Location loc;
   OldList * specifiers;
   Declarator declarator;
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

public class PropertyWatch : struct
{
public:
   PropertyWatch prev, next;
   Location loc;
   Statement compound;
   OldList * properties;
   bool deleteWatch;
};

public enum ClassDefType
{ 
   functionClassDef, defaultPropertiesClassDef, declarationClassDef, propertyClassDef,
   propertyWatchClassDef, classDesignerClassDef, classNoExpansionClassDef, classFixedClassDef,
   designerDefaultPropertyClassDef, classDataClassDef, classPropertyClassDef, classPropertyValueClassDef,
   memberAccessClassDef, accessOverrideClassDef
};

public class PropertyDef : struct
{
public:
   PropertyDef prev, next;
   Location loc;
   OldList * specifiers;
   Declarator declarator;
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
      PropertyWatch propertyWatch;
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

public enum ExternalType { functionExternal, declarationExternal, classExternal, importExternal, nameSpaceExternal, dbtableExternal };

public class External : struct
{
public:
   External prev, next;
   Location loc;
   ExternalType type;
   Symbol symbol;
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

public class Context : struct
{
public:
   Context parent;
   BinaryTree types { CompareKey = (void *)BinaryTree::CompareString };
   BinaryTree classes { CompareKey = (void *)BinaryTree::CompareString };
   BinaryTree symbols { CompareKey = (void *)BinaryTree::CompareString };
   BinaryTree structSymbols { CompareKey = (void *)BinaryTree::CompareString };
   int nextID;
   int simpleID;
   BinaryTree templateTypes { CompareKey = (void *)BinaryTree::CompareString };
   ClassDefinition classDef;
   bool templateTypesOnly;
   bool hasNameSpace;
};

/*************** Compiling passes symbols ***************/

public class Symbol : struct
{
public:
   char * string;
   Symbol parent, left, right;   // Reusing left, right as prev, next when in excludedSymbols
   int depth;

   Type type;
   union
   {
      Method method;
      Property _property;
      Class registered;
   };
   int id, idCode;
   union
   {
      struct
      {
         External pointerExternal;  // external declaration for the pointer to the Class:    e.g. __ecereClass___ecereNameSpace__ecere__com__Class
         External structExternal;   // external declaration for the actual class members structure: e.g. __ecereNameSpace__ecere__com__Class
      };
      struct
      {
         External externalGet;
         External externalSet;
         External externalPtr;    // Property pointer for watchers
         External externalIsSet;
      };
      struct
      {
         External methodExternal;
         External methodCodeExternal;
      };
   };
   bool imported, declaredStructSym;
   Class _class; // for properties only...

   // Only used for classes right now...
   bool declaredStruct;
   bool needConstructor, needDestructor;
   char * constructorName, * structName, * className, * destructorName;

   ModuleImport module;
   ClassImport _import;  
   Location nameLoc;
   bool isParam;
   bool isRemote;
   bool isStruct;
   bool fireWatchersDone;
   int declaring;
   bool classData;
   bool isStatic;
   char * shortName;
   OldList * templateParams;     // Review the necessity for this
   OldList templatedClasses;
   Context ctx;
   int isIterator;
   Expression propCategory;
};

// For the .imp file:
public class ClassImport : struct
{
public:
   ClassImport prev, next;
   char * name;
   OldList methods;
   OldList properties;
   bool itself;
   bool isRemote;
};

public class FunctionImport : struct
{
public:
   FunctionImport prev, next;
   char * name;
};

public class ModuleImport : struct
{
public:
   ModuleImport prev, next;
   char * name;
   OldList classes;
   OldList functions;
   ImportType importType;
   AccessMode importAccess;
};

public class PropertyImport : struct
{
public:
   PropertyImport prev, next;
   char * name;
   bool isVirtual;
   bool hasSet, hasGet;
};

public class MethodImport : struct
{
public:
   MethodImport prev, next;
   char * name;
   bool isVirtual;
};

// For the .sym file:
public enum TypeKind
{ 
   voidType, charType, shortType, intType, int64Type, longType, floatType,
   doubleType, classType, structType, unionType, functionType, arrayType, pointerType,
   ellipsisType, enumType, methodType, vaListType, /*typedObjectType, anyObjectType, classPointerType, */ dummyType,
   subClassType, templateType, thisClassType, intPtrType
};

public class Type : struct
{
public:
   Type prev, next;
   int refCount;
   union
   {
      Symbol _class;
      struct
      {
         OldList members;
         char * enumName;
      };
      // For a function:
      struct
      {
         Type returnType;
         OldList params;
         Symbol thisClass;
         bool staticMethod;
         TemplateParameter thisClassTemplate;
      };
      // For a method
      struct
      {
         Method method;
         Class methodClass;
         Class usedClass;
      };

      // For an array:
      struct
      {
         Type arrayType;
         int arraySize;
         Expression arraySizeExp;
         bool freeExp;
         Symbol enumClass;
      };
      // For a pointer:
      Type type;
      TemplateParameter templateParameter;
   };
   bool isSigned;
   TypeKind kind;
   bool constant;
   uint size;
   char * name;
   char * typeName;
   bool count;
   bool truth;

   ClassObjectType classObjectType;
   bool byReference;

   bool extraParam;
   int alignment;
   bool directClassAccess;
   bool computing;
   bool dllExport;
   uint offset;
   bool keepCast;
   bool passAsTemplate;
   int bitFieldCount;

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      Type type = (Type)this;
      tempString[0] = '\0';
      if(type)
         PrintType(type, tempString, false, true);
      return tempString;
   }

   void OnFree()
   {
      
   }
};            

public struct Operand
{
public:
   TypeKind kind;
   Type type;
   unsigned int ptrSize;
   union    // Promote to using data value
   {
      char c;
      unsigned char uc;
      short s;
      unsigned short us;
      int i;
      unsigned int ui;
      float f;
      double d;
      unsigned char * p;
      int64 i64;
      uint64 ui64;
      intptr iptr;
      uintptr uiptr;
   };
   OpTable ops;
};

public struct OpTable
{
public:
   // binary arithmetic
   bool (* Add)(Expression, Operand, Operand);
   bool (* Sub)(Expression, Operand, Operand);
   bool (* Mul)(Expression, Operand, Operand);
   bool (* Div)(Expression, Operand, Operand);
   bool (* Mod)(Expression, Operand, Operand);
   
   // unary arithmetic
   bool (* Neg)(Expression, Operand);
   
   // unary arithmetic increment and decrement
   bool (* Inc)(Expression, Operand);
   bool (* Dec)(Expression, Operand);
   
   // binary arithmetic assignment
   bool (* Asign)(Expression, Operand, Operand);
   bool (* AddAsign)(Expression, Operand, Operand);
   bool (* SubAsign)(Expression, Operand, Operand);
   bool (* MulAsign)(Expression, Operand, Operand);
   bool (* DivAsign)(Expression, Operand, Operand);
   bool (* ModAsign)(Expression, Operand, Operand);
   
   // binary bitwise
   bool (* BitAnd)(Expression, Operand, Operand);
   bool (* BitOr)(Expression, Operand, Operand);
   bool (* BitXor)(Expression, Operand, Operand);
   bool (* LShift)(Expression, Operand, Operand);
   bool (* RShift)(Expression, Operand, Operand);
   bool (* BitNot)(Expression, Operand);
   
   // binary bitwise assignment
   bool (* AndAsign)(Expression, Operand, Operand);
   bool (* OrAsign)(Expression, Operand, Operand);
   bool (* XorAsign)(Expression, Operand, Operand);
   bool (* LShiftAsign)(Expression, Operand, Operand);
   bool (* RShiftAsign)(Expression, Operand, Operand);
   
   // unary logical negation
   bool (* Not)(Expression, Operand);
   
   // binary logical equality
   bool (* Equ)(Expression, Operand, Operand);
   bool (* Nqu)(Expression, Operand, Operand);
   
   // binary logical
   bool (* And)(Expression, Operand, Operand);
   bool (* Or)(Expression, Operand, Operand);
   
   // binary logical relational
   bool (* Grt)(Expression, Operand, Operand);
   bool (* Sma)(Expression, Operand, Operand);
   bool (* GrtEqu)(Expression, Operand, Operand);
   bool (* SmaEqu)(Expression, Operand, Operand);
   
   bool (* Cond)(Expression, Operand, Operand, Operand);
};

define MAX_INCLUDE_DEPTH = 10;

#include <stdarg.h>

void Compiler_Error(char * format, ...)
{
   if(inCompiler)
   {
      if(!parsingType)
      {
         va_list args;
         char string[10000];

         if(yylloc.start.included)
         {
            GetWorkingDir(string, sizeof(string));
            PathCat(string, GetIncludeFileFromID(yylloc.start.included));
         }
         else
         {
            GetWorkingDir(string, sizeof(string));
            PathCat(string, sourceFile);
         }
         printf(string);

         /*
         yylloc.start.col = yylloc.end.col = 1;
         yylloc.start.line = yylloc.end.line = 1;
         yylloc.start.pos = yylloc.end.pos = 0;
         */
#ifdef _DEBUG
         if(!yylloc.start.line)
            printf("");
#endif

         //printf("(%d, %d) : error: ", yylloc.start.line, yylloc.start.charPos);
         printf($":%d:%d: error: ", yylloc.start.line, yylloc.start.charPos);
         //printf(":%d: error: ", yylloc.start.line);
         va_start(args, format);
         vsnprintf(string, sizeof(string), format, args);
         string[sizeof(string)-1] = 0;
         va_end(args);
         fputs(string, stdout);
         __thisModule.application.exitCode = 1;
      }
      else
      {
         // Error parsing type
         parseTypeError = true;
      }
   }
}

int numWarnings;
public int GetNumWarnings() { return numWarnings; }

void Compiler_Warning(char * format, ...)
{
   if(inCompiler)
   {
      va_list args;
      char string[10000];

      if(yylloc.start.included)
      {
         GetWorkingDir(string, sizeof(string));
         PathCat(string, GetIncludeFileFromID(yylloc.start.included));
      }
      else
      {
         GetWorkingDir(string, sizeof(string));
         PathCat(string, sourceFile);
      }
      
      printf(string);

      //printf("(%d, %d) : warning: ", yylloc.start.line, yylloc.start.charPos);
      printf($":%d:%d: warning: ", yylloc.start.line, yylloc.start.charPos);
      //printf(":%d: warning: ", yylloc.start.line);
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      va_end(args);
      fputs(string, stdout);
      numWarnings++;
   }
}
bool parseError;
bool skipErrors;

int yyerror(char * s)
{
   if(!skipErrors)
   {
   	//fflush(stdout);
   	//printf("\n%*s\n%*s\n", column, "^", column, s);
      parseError = true;
      Compiler_Error($"syntax error\n");
   }
   return 0;
}

Platform targetPlatform;

public void SetTargetPlatform(Platform platform) { targetPlatform = platform; };
