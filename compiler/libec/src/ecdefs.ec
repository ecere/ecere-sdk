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

#define yylloc _yylloc
#include "grammar.h"
#undef yylloc

public enum TokenType
{
  identifier = IDENTIFIER,
  constant = CONSTANT,
  stringLiteral = STRING_LITERAL,
  sizeOf = SIZEOF,
  ptrOp = PTR_OP,
  incOp = INC_OP,
  decOp = DEC_OP,
  leftOp = LEFT_OP,
  rightOp = RIGHT_OP,
  leOp = LE_OP,
  geOp = GE_OP,
  eqOp = EQ_OP,
  neOp = NE_OP,
  andOp = AND_OP,
  orOp = OR_OP,
  mulAssign = MUL_ASSIGN,
  divAssign = DIV_ASSIGN,
  modAssign = MOD_ASSIGN,
  addAssign = ADD_ASSIGN,
  subAssign = SUB_ASSIGN,
  leftAssign = LEFT_ASSIGN,
  rightAssign = RIGHT_ASSIGN,
  andAssign = AND_ASSIGN,
  xorAssign = XOR_ASSIGN,
  orAssign = OR_ASSIGN,
  typeName = TYPE_NAME,
  _typedef = TYPEDEF,
  _extern = EXTERN,
  _static = STATIC,
  _auto = AUTO,
  _register = REGISTER,
  _char = CHAR,
  _short = SHORT,
  _int = INT,
  _uint = UINT,
  _int64 = INT64,
  _int128 = INT128,
  _float128 = FLOAT128,
  _long = LONG,
  _signed = SIGNED,
  _unsigned = UNSIGNED,
  _float = FLOAT,
  _double = DOUBLE,
  _const = CONST,
  _volatile = VOLATILE,
  _void = VOID,
  _valist = VALIST,
  _struct = STRUCT,
  _union = UNION,
  _enum = ENUM,
  ellipsis = ELLIPSIS,
  _case = CASE,
  _default = DEFAULT,
  _if = IF,
  _switch = SWITCH,
  _while = WHILE,
  _do = DO,
  _for = FOR,
  _goto = GOTO,
  _continue = CONTINUE,
  _break = BREAK,
  _return = RETURN,
  ifx = IFX,
  _else = ELSE,
  _class = CLASS,
  thisClass = THISCLASS,
  _property = PROPERTY,
  setProp = SETPROP,
  getProp = GETPROP,
  newOp = NEWOP,
  _renew = RENEW,
  _delete = DELETE,
  _extDecl = EXT_DECL,
  _extStorage = EXT_STORAGE,
  _import = IMPORT,
  _define = DEFINE,
  _virtual = VIRTUAL,
  attrib = ATTRIB,
  _public = PUBLIC,
  _priate = PRIVATE,
  typedObject = TYPED_OBJECT,
  anyObject = ANY_OBJECT,
  _incref = _INCREF,
  extension = EXTENSION,
  ___asm = ASM,
  _typeof = TYPEOF,
  _watch = WATCH,
  stopWatching = STOPWATCHING,
  fireWatchers = FIREWATCHERS,
  _watchable = WATCHABLE,
  classDesigner = CLASS_DESIGNER,
  classNoExpansion = CLASS_NO_EXPANSION,
  classFixed = CLASS_FIXED,
  isPropSet = ISPROPSET,
  classDefaultProperty = CLASS_DEFAULT_PROPERTY,
  propertyCategory = PROPERTY_CATEGORY,
  classData = CLASS_DATA,
  classProperty = CLASS_PROPERTY,
  subClass = SUBCLASS,
  nameSpace = NAMESPACE,
  new0Op = NEW0OP,
  renew0Op = RENEW0,
  vaArg = VAARG,
  dbTable = DBTABLE,
  dbField = DBFIELD,
  dbIndex = DBINDEX,
  databaseOpen = DATABASE_OPEN,
  alignOf = ALIGNOF,
  attribDep = ATTRIB_DEP,
  _attrib = __ATTRIB,
  BOOL = BOOL,
  _BOOL = _BOOL,
  complex = _COMPLEX,
  imaginary = _IMAGINARY,
  _restrict = RESTRICT,
  _thread = THREAD
};

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

bool inDebugger = false;
public void SetInDebugger(bool b) { inDebugger = b; }

bool inBGen = false;
public void SetInBGen(bool b) { inBGen = b; }

public void SetBGenSymbolSwapCallback(const char * (*cb)(const char * spec, bool reduce, bool macro)) { bgenSymbolSwap = cb; }
const char * (*bgenSymbolSwap)(const char * symbol, bool reduce, bool macro);


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
public void SetSymbolsDir(const char * s) {
   delete symbolsDir;
   symbolsDir = CopyString(s);
} public const char * GetSymbolsDir() { return symbolsDir ? symbolsDir : ""; }
const char * outputFile;
public void SetOutputFile(const char * s) { outputFile = s; } public const char * GetOutputFile() { return outputFile; }
const char * sourceFile;
public void SetSourceFile(const char * s) { sourceFile = s; } public const char * GetSourceFile() { return sourceFile; }
const char * i18nModuleName;
public void SetI18nModuleName(const char * s) { i18nModuleName = s; } public const char * GetI18nModuleName() { return i18nModuleName; }

public void SetGlobalContext(Context context) { globalContext = context; } public Context GetGlobalContext() { return globalContext; }
public void SetTopContext(Context context) { topContext = context; } public Context GetTopContext() { return topContext; }
public void SetCurrentContext(Context context) { curContext = context; } public Context GetCurrentContext() { return curContext; }
public void SetExcludedSymbols(OldList * list) { excludedSymbols = list; }
public void SetImports(OldList * list) { imports = list; }
public void SetDefines(OldList * list) { defines = list; }

bool outputLineNumbers = true;
public void SetOutputLineNumbers(bool value) { outputLineNumbers = value; }

public void FixModuleName(char *moduleName)
{
   ChangeCh(moduleName, '.', '_');
   ChangeCh(moduleName, ' ', '_');
   ChangeCh(moduleName, '-', '_');
   ChangeCh(moduleName, '&', '_');
}

// todo support %var% variables for windows and $var for linux?
public char * PassArg(char * output, const char * input)
{
   const char * escChars, * escCharsQuoted;
   bool quoting = false;
   char *o = output;
   const char *i = input, *l = input;
   if(__runtimePlatform == win32)
   {
//define windowsFileNameCharsNeedEscaping = " !%&'()+,;=[]^`{}~"; // "#$-.@_" are ok
      escChars = " !\"%&'()+,;=[]^`{}~"; // windowsFileNameCharsNeedEscaping;
      escCharsQuoted = "\"";
      while(*l && !strchr(escChars, *l)) l++;
      if(*l) quoting = true;
   }
//define linuxFileNameCharsNeedEscaping = " !\"$&'()*:;<=>?[\\`{|"; // "#%+,-.@]^_}~" are ok
   else
   {
      escChars = " !\"$&'()*:;<=>?[\\`{|"; // linuxFileNameCharsNeedEscaping;
      escCharsQuoted = "\"()$";
      if(*i == '-')
      {
         l++;
         while(*l && !strchr(escChars, *l)) l++;
         if(*l) quoting = true;
         *o++ = *i++;
      }
   }
   if(quoting)
      *o++ = '\"';
   while(*i)
   {
      if(strchr(quoting ? escCharsQuoted : escChars, *i))
         *o++ = '\\';
      *o++ = *i++;
   }
   if(quoting)
      *o++ = '\"';
   *o = '\0';
   return o;
}
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
   int included;

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
   dummyExp, dereferenceErrorExp, symbolErrorExp,
   memberSymbolErrorExp, memoryErrorExp, unknownErrorExp,
   noDebuggerErrorExp,
   extensionCompoundExp, classExp, classDataExp, new0Exp, renew0Exp,
   dbopenExp, dbfieldExp, dbtableExp, dbindexExp, extensionExpressionExp, extensionInitializerExp,
   vaArgExp, arrayExp, typeAlignExp,
   memberPropertyErrorExp, functionCallErrorExp, divideBy0ErrorExp,
   offsetOfExp
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
   const char * dataTypeString;
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
         OldList/*<TemplateArgument>*/ * templateArgs;
         Specifier nsSpec;
      };
      struct
      {
         Identifier id;
         OldList/*<Enumerator>*/ * list;
         OldList/*<Specifier>*/ * baseSpecs;
         OldList/*<ClassDef>*/ * definitions;
         bool addNameSpace;
         Context ctx;
         ExtDecl extDeclStruct;
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
      struct
      {
         char * string;
         bool intlString;
         bool wideString;
      };
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
      struct
      {
         TypeName typeName;
         Identifier id;
      } offset;
   };

   bool debugValue;

   DataValue val;

   uint64 address;
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
   bool opDestType;
   bool usedInComparison;
   bool ambiguousUnits;
   bool parentOpDestType;
   uint needTemplateCast;

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
      opDestType = false;
      parentOpDestType = false;
      usedInComparison = false;
      needTemplateCast = 0;
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
   Identifier id;
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
   Identifier symbolic;
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
   Expression category;
   struct
   {
      bool conversion:1;
      bool isWatchable:1;
      bool isDBProp:1;
   };
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

// An 'edge from' is a 'dependency on'
class TopoEdge : struct
{
   public LinkElement<TopoEdge> in, out;
   External from, to;
   bool breakable;
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

   // For the TopoSort
   External fwdDecl;
   LinkList<TopoEdge, link = out> outgoing { };
   LinkList<TopoEdge, link = in> incoming { };
   int nonBreakableIncoming;

   void CreateUniqueEdge(External from, bool soft)
   {
      for(i : from.outgoing; i.to == this)
      {
         if(i.breakable && !soft)
         {
#ifdef _DEBUG
            if(from == this)
               PrintLn("bug: self-dependency");
#endif
            i.breakable = false;
            nonBreakableIncoming++;
         }
         return;
      }
      CreateEdge(from, soft);
   }

   void CreateEdge(External from, bool soft)
   {
      TopoEdge e { from = from, to = this, breakable = soft };

#ifdef _DEBUG
      if(from == this && !soft)
         PrintLn("bug: self-dependency");

      /*for(i : from.outgoing)
      {
         if(i.to == this)
            PrintLn("Warning: adding a duplicate edge");
      }*/
#endif

      from.outgoing.Add(e);
      incoming.Add(e);
      if(!soft)
         nonBreakableIncoming++;
   }

   External ForwardDeclare()
   {
      External f = null;
      Context tmpContext = curContext;

      switch(type)
      {
         case declarationExternal:
         {
            if(declaration.type == initDeclaration)
            {
               OldList * specs = declaration.specifiers;
               if(specs)
               {
                  Specifier s;
                  for(s = specs->first; s; s = s.next)
                  {
                     if(s.type == structSpecifier || s.type == unionSpecifier)
                        break;
                  }
                  if(s)
                  {
                     curContext = null;
                     f = MkExternalDeclaration(MkDeclaration(MkListOne(MkStructOrUnion(s.type, CopyIdentifier(s.id), null)), null));
                     curContext = tmpContext;
                  }
               }
            }
            break;
         }
         case functionExternal:
         {
            curContext = null;
            f = MkExternalDeclaration(MkDeclaration(CopyList(function.specifiers, CopySpecifier), MkListOne(MkInitDeclarator(CopyDeclarator(function.declarator), null))));
            curContext = tmpContext;
            f.symbol = symbol;

            DeclareTypeForwardDeclare(f, symbol.type, false, false);
            break;
         }
      }

      /*
      for(i : m.protoDepsExternal)
      {
         // If the edge is already added, don't bother
         if(i.incoming.count)
            CreateEdge(f, i.fwdDecl ? i.fwdDecl : i, i.fwdDecl ? false : true);
      }
      */

      fwdDecl = f;

      if(!f)
         PrintLn("warning: unhandled forward declaration requested");
      return f;
   }
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
   bool notYetDeclared;
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
   bool mustRegister;   // Must register the class within the RegisterClass (also used to check whether this class is declared in this module)
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
   int isRemote;
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
// BEWARE: Adding a value in the middle of this list has very arcane bootstrapping implications!!
public enum TypeKind
{
   voidType, charType, shortType, intType, int64Type, longType, floatType,
   doubleType, classType, structType, unionType, functionType, arrayType, pointerType,
   ellipsisType, enumType, methodType, vaListType, /*typedObjectType, anyObjectType, classPointerType, */ dummyType,
   subClassType, templateType, thisClassType, intPtrType, intSizeType, _BoolType, int128Type, float128Type /* TODO! */
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
         TemplateParameter thisClassTemplate; // for a template parameter being used with the :: scoping operator
                                              // to refer to a member of the parameterizing class
         // only known occurence is link = LT::link within the LinkList base class definition:
         // public class LinkList<class LT:void * = ListItem, bool circ = false, link = LT::link> : Container<LT>
      };
      // For a method
      struct
      {
         Method method;
         Class methodClass;      // Clarify what this is!
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
   TypeKind kind;
   uint size;
   char * name;
   char * typeName;
   Class thisClassFrom;
   TypeKind promotedFrom;

   ClassObjectType classObjectType;
   int alignment;
   uint offset;
   int bitFieldCount;
   int count;  // This is used to avoid outputting warnings when non-zero
   int bitMemberSize;

   bool isSigned:1;
   bool constant:1;
   bool truth:1;
   bool byReference:1;
   bool extraParam:1;      // Clarify this... One thing it is used for is adaptive method with their own type explicitly specified
   bool directClassAccess:1;     // Need to clarify this if this had the same intended purpose as declaredWithStruct
   bool computing:1;
   bool keepCast:1;
   bool passAsTemplate:1;
   bool dllExport:1;
   bool attrStdcall:1;
   bool declaredWithStruct:1;
   bool typedByReference:1;      // Originally typed by reference, regardless of class type
   bool casted:1;
   bool pointerAlignment:1; // true if the alignment is the pointer size
   bool isLong:1;    // true if this is truly a long set as a int/int64 (need to improve long support)
   bool signedBeforePromotion:1;
   bool isVector:1; // For __attribute__((__vector_size(..))
   // bool wasThisClass:1;
   // TODO: Add _Complex & _Imaginary support
   // bool complex:1, imaginary:1;

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
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

   property bool specConst
   {
      get
      {
         Type t = this;
         while((t.kind == pointerType || t.kind == arrayType) && t.type) t = t.type;
         return t.constant;
      }
   }

   // Used for generating calls to eClass_AddDataMember (differs slightly from 'isPointerType' below), meant to return true where ComputeTypeSize returns targetBits / 8
   property bool isPointerTypeSize
   {
      get
      {
         bool result = false;
         if(this)
         {
            switch(kind)
            {
               case classType:
               {
                  Class _class = this._class ? this._class.registered : null;
                  if(!_class || (_class.type != structClass && _class.type != unitClass && _class.type != enumClass && _class.type != bitClass))
                     result = true;
                  break;
               }
               case pointerType:
               case subClassType:
               case thisClassType:
               case intPtrType:
               case intSizeType:
                  result = true;
                  break;
               case templateType:
               {
                  TemplateParameter param = templateParameter;
                  Type baseType = ProcessTemplateParameterType(param);
                  if(baseType)
                     result = baseType.isPointerTypeSize;
                  break;
               }
            }
         }
         return result;
      }
   }

   property bool isPointerType
   {
      get
      {
         if(this)
         {
            if(kind == pointerType || kind == methodType || kind == functionType || kind == arrayType || kind == subClassType)
               return true;
            else if(kind == classType)
            {
               if(_class && _class.registered)
               {
                  Class c = _class.registered;
                  if(c.type == bitClass || c.type == unitClass || c.type == enumClass || c.type == systemClass)
                     return false;
                  else if(c.type == structClass && !byReference)
                     return false;
               }
               return true;
            }
            else if(kind == templateType)
            {
               if(passAsTemplate) return false;
               if(templateParameter)
               {
                  if(templateParameter.dataType)
                  {
                     Specifier spec = templateParameter.dataType.specifiers ? templateParameter.dataType.specifiers->first : null;
                     if(templateParameter.dataType.decl && templateParameter.dataType.decl.type == pointerDeclarator)
                        return true;
                     if(spec && spec.type == nameSpecifier && strcmp(spec.name, "uint64"))
                        return true;
                  }
                  if(templateParameter.dataTypeString)
                     return true;
               }
            }
            else
               return false;
         }
         return false;
      }
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
      // unsigned char * p; // Now always storing addresses in ui64
      int64 i64;
      uint64 ui64;
      // intptr iptr;
      // uintptr uiptr;
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

define MAX_INCLUDE_DEPTH = 30;

#include <stdarg.h>

void Compiler_Error(const char * format, ...)
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
         printf("%s", string);

         /*
         yylloc.start.col = yylloc.end.col = 1;
         yylloc.start.line = yylloc.end.line = 1;
         yylloc.start.pos = yylloc.end.pos = 0;
         */
#ifdef _DEBUG
         if(!yylloc.start.line)
            printf("no line");
#endif

         //printf("(%d, %d) : error: ", yylloc.start.line, yylloc.start.charPos);
         printf($":%d:%d: error: ", yylloc.start.line, yylloc.start.charPos);
         //printf(":%d: error: ", yylloc.start.line);
         va_start(args, format);
         vsnprintf(string, sizeof(string), format, args);
         string[sizeof(string)-1] = 0;
         va_end(args);
         fputs(string, stdout);
         fflush(stdout);
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

void Compiler_Warning(const char * format, ...)
{
   if(inCompiler)
   {
      va_list args;
      char string[10000];
      char fileName[MAX_FILENAME];

      if(yylloc.start.included)
      {
         String include = GetIncludeFileFromID(yylloc.start.included);
         GetWorkingDir(string, sizeof(string));
         PathCat(string, include);
      }
      else
      {
         GetWorkingDir(string, sizeof(string));
         PathCat(string, sourceFile);
      }

      // Skip these warnings from MinGW-w64 GCC 4.8 in intrin-impl.h
      GetLastDirectory(string, fileName);
      if(!strcmp(fileName, "intrin-impl.h")) return;

      printf("%s", string);

      //printf("(%d, %d) : warning: ", yylloc.start.line, yylloc.start.charPos);
      printf($":%d:%d: warning: ", yylloc.start.line, yylloc.start.charPos);
      //printf(":%d: warning: ", yylloc.start.line);
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      va_end(args);
      fputs(string, stdout);
      fflush(stdout);
      numWarnings++;
   }
}
bool parseError;
bool skipErrors;

int yyerror()
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

public int GetHostBits()
{
   // Default to runtime platform in case we fail to determine host
   int hostBits = (sizeof(uintptr) == 8) ? 64 : 32;
   String hostType = getenv("HOSTTYPE");
   char host[256];
   if(!hostType)
   {
      DualPipe f = DualPipeOpen({ output = true }, "uname -m");
      if(f)
      {
         if(f.GetLine(host, sizeof(host)))
            hostType = host;
         delete f;
      }
   }
   if(hostType)
   {
      if(!strcmp(hostType, "x86_64"))
         hostBits = 64;
      else if(!strcmp(hostType, "i386") || !strcmp(hostType, "i686"))
         hostBits = 32;
   }
   return hostBits;
}

public void SetTargetPlatform(Platform platform) { targetPlatform = platform; };

int targetBits;

public void SetTargetBits(int bits) { targetBits = bits; };
public int GetTargetBits() { return targetBits; };
