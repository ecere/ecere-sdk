#ifdef ECERE_STATIC
import static "ecere"
import static "ec"
#else
import "ecere"
import "ec"
#endif

#define YYLTYPE Location
#include "../libec/src/grammar.h"

// UNTIL IMPLEMENTED IN GRAMMAR
#define ACCESS_CLASSDATA(_class, baseClass) \
   (_class ? ((void *)(((char *)_class.data) + baseClass.offsetClass)) : null)

// #include <stdarg.h>

// WARNING: PropertyDefine, ClassDefine and DataMemberDefine must remain compatible
struct ClassDefine : Definition
{
   char * base;
   OldList propertiesAndMembers;
   OldList classProperties;
   OldList methods;
   bool isRemote;
   bool isWatchable;
   bool fixed;
   bool noExpansion;
   AccessMode accessMode;
};

struct Define : Definition
{
   Expression exp;
};

struct FunctionDefine : Definition
{
   char * dataType;
};

struct DataDefine : Definition
{
   char * dataType;
};

class MethodDefine : struct
{
   MethodDefine prev, next;
   char * name;
   AccessMode memberAccess;
   char * type;
   bool isVirtual;
};

// WARNING: PropertyDefine, ClassDefine and DataMemberDefine must remain compatible
class PropertyDefine : struct
{
   PropertyDefine prev, next;
   char * name;
   MemberType isProperty;
   char * type;

   bool isWatchable;
   AccessMode memberAccess;
   bool isVirtual;
   bool hasSet, hasGet;
};

// WARNING: PropertyDefine, ClassDefine and DataMemberDefine must remain compatible
class DataMemberDefine : struct
{
   DataMemberDefine prev, next;
   char * name;
   MemberType isProperty;
   char * type;
   OldList dataMembers;
   OldList classProperties;   // For binary compatibility with ClassDefine

   AccessMode memberAccess;
   DataMemberType memberType;
   int size, bitPos;
};

void FreeMethodDefine(MethodDefine method)
{
   delete method.name;
   delete method.type;
}

void FreeDataMemberDefine(DataMemberDefine dataMember)
{
   delete dataMember.name;
   delete dataMember.type;
}

void FreeDataDefine(DataDefine data)
{
   delete data.name;
   delete data.dataType;
}

void FreeDefinition(Definition definition)
{
   delete definition.name;
   switch(definition.type)
   {
      case classDefinition:
      {
         ClassDefine classDefine = (ClassDefine)definition;
         delete classDefine.base;
         classDefine.methods.Free(FreeMethodDefine);
         classDefine.propertiesAndMembers.Free(FreeDataMemberDefine);
         break;
      }
      case functionDefinition:
         delete ((FunctionDefine)definition).dataType;
         break;
      case dataDefinition:
         delete ((DataDefine)definition).dataType;
         break;
      case defineDefinition:
         break;
   }
}

/////////////////////////////////////
static bool globalInstance = false;
static Context globalContext { };
static OldList defines, imports, precompDefines;
static Module privateModule;
static OldList _excludedSymbols { offset = (uint)(uintptr)&((Symbol)0).left };
static NameSpace globalData
{
   classes.CompareKey = (void *)BinaryTree::CompareString;
   defines.CompareKey = (void *)BinaryTree::CompareString;
   functions.CompareKey = (void *)BinaryTree::CompareString;
   nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
};

static void AddDefinitions(ClassDefine classDefine, DataMemberDefine parentMemberDefine, Class regClass, DataMember member, OldList definitions)
{
   if(definitions != null)
   {
      ClassDef def;
      for(def = definitions.first; def; def = def.next)
      {
         if(def.type == declarationClassDef)
         {
            Declaration decl = def.decl;
            DataMember dataMember;
            Type dataType;
            DataMemberDefine dataMemberDefine;

            if(decl.type == structDeclaration)
            {
               Declarator d;

               if(decl.declarators)
               {
                  for(d = decl.declarators->first; d; d = d.next)
                  {
                     Identifier declId = GetDeclId(d);
                     //if(d.type != DeclaratorFunction)
                     if(declId)
                     {
                        dataMemberDefine = DataMemberDefine
                        {
                           isProperty = MemberType::dataMember;
                           memberType = normalMember;
                           name = CopyString(declId.string);
                        };
                        parentMemberDefine.dataMembers.Add(dataMemberDefine);
                        if(regClass && regClass.type == bitClass)
                        {
                           Expression sizeExp = d.structDecl.exp, posExp = d.structDecl.posExp;
                           int bitSize = 0, bitPos = -1;
                           char dataTypeString[1024];
                           dataTypeString[0] = '\0';

                           if(sizeExp)
                           {
                              ProcessExpressionType(sizeExp);
                              ComputeExpression(sizeExp);
                              if(sizeExp.isConstant)
                                 bitSize = strtol(sizeExp.constant, null, 0);
                              FreeExpression(sizeExp);
                           }

                           if(posExp)
                           {
                              ProcessExpressionType(posExp);
                              ComputeExpression(posExp);
                              if(posExp.isConstant)
                                 bitPos = strtol(posExp.constant, null, 0);
                              FreeExpression(posExp);

                           }

                           d.structDecl.exp = null;
                           d.structDecl.posExp = null;

                           dataType = ProcessType(decl.specifiers, d);
                           PrintType(dataType, dataTypeString, false, true);

                           //if(!eClass_FindDataMember(regClass, declId.string))
                           {
                              BitMember member = eClass_AddBitMember(regClass, declId.string, dataTypeString, 0, 0, def.memberAccess);
                              if(member)
                              {
                                 member.size = bitSize;
                                 member.pos = bitPos;
                              }
                              dataMember = (DataMember)member;
                           }
                           if(dataMember)
                              dataMember.dataType = dataType;

                           dataMemberDefine.size = bitSize;
                           dataMemberDefine.bitPos = bitPos;

                           dataMemberDefine.type = CopyString(dataTypeString);
                        }
                        else
                        {
                           //if(!eClass_FindDataMember(regClass, declId.string))
                           {
                              char typeString[1024];
                              typeString[0] = '\0';
                              dataType = ProcessType(decl.specifiers, d);
                              PrintType(dataType, typeString, false, true);

                              if(member)
                                 dataMember = eMember_AddDataMember(member, declId.string,
                                    typeString, /*ComputeTypeSize(dataType)*/ 0, 0, def.memberAccess);
                              else
                                 dataMember = eClass_AddDataMember(regClass, declId.string,
                                    typeString, /*ComputeTypeSize(dataType)*/ 0, 0, def.memberAccess);
                              if(dataMember)
                                 dataMember.dataType = dataType;

                              dataMemberDefine.type = CopyString(typeString);
                           }
                        }
                        dataMemberDefine.memberAccess = def.memberAccess; //(!isMember && regClass.type == structClass) ? true : false;
                     }
                  }
               }
               else if(decl.specifiers)
               {
                  Specifier spec;
                  // Unnamed struct/union
                  for(spec = decl.specifiers->first; spec; spec = spec.next)
                  {
                     if(spec.type == structSpecifier || spec.type == unionSpecifier)
                     {
                        if(spec.definitions && !spec.id)
                        {
                           DataMember dataMember = eMember_New((spec.type == unionSpecifier) ? unionMember : structMember, def.memberAccess);

                           dataMemberDefine = DataMemberDefine
                           {
                              isProperty = MemberType::dataMember;
                              memberType = (spec.type == SpecifierType::unionSpecifier) ? unionMember : structMember;
                           };
                           parentMemberDefine.dataMembers.Add(dataMemberDefine);

                           AddDefinitions(null, dataMemberDefine, null, dataMember, spec.definitions);

                           if(member)
                              eMember_AddMember(member, dataMember);
                           else
                              eClass_AddMember(regClass, dataMember);
                        }
                        else if(spec.definitions && spec.id && spec.definitions->count)
                        {
                           //if(isMember || !eClass_FindDataMember(regClass, spec.id.string))
                           {
                              Identifier id = spec.id;
                              char typeString[1024];
                              typeString[0] = '\0';

                              spec.id = null;
                              decl.declarators = MkListOne(MkDeclaratorIdentifier(id));

                              dataType = ProcessType(decl.specifiers, null);
                              PrintType(dataType, typeString, false, true);

                              if(member)
                                 dataMember = eMember_AddDataMember(member, id.string,
                                    typeString, /*ComputeTypeSize(dataType)*/ 0, 0, def.memberAccess);
                              else
                                 dataMember = eClass_AddDataMember(regClass, id.string,
                                    typeString, /*ComputeTypeSize(dataType)*/ 0, 0, def.memberAccess);

                              //delete dataTypeString;
                              if(dataMember)
                                 dataMember.dataType = dataType;
                           }
                        }
                     }
                  }
               }
            }
            else if(decl.type == instDeclaration)
            {
               Instantiation inst = decl.inst;
               Expression exp = inst.exp;
               if(exp)
               {
                  // Add data member to the class
                  //if(!redefinition)
                  {
                     char * string = exp.identifier.string;
                     //if(!eClass_FindDataMember(regClass, string))
                     {
                        Type dataType = Type
                        {
                           kind = classType;
                           _class = inst._class.symbol; // FindClass(inst._class.name);
                           refCount = 1;
                        };
                        if(member)
                           dataMember = eMember_AddDataMember(member, string, inst._class.name, /*ComputeTypeSize(dataType)*/ 0, 0, def.memberAccess);
                        else
                           dataMember = eClass_AddDataMember(regClass, string, inst._class.name, /*ComputeTypeSize(dataType)*/ 0, 0, def.memberAccess);
                        if(dataMember)
                           dataMember.dataType = dataType;
                     }

                     dataMemberDefine = DataMemberDefine
                     {
                        isProperty = MemberType::dataMember;
                        memberType = normalMember;
                        name = CopyString(string);
                        type = CopyString(inst._class.name);
                     };
                     parentMemberDefine.dataMembers.Add(dataMemberDefine);
                  }
               }
            }
         }
         else if(def.type == propertyClassDef && def.propertyDef)
         {
            PropertyDef propertyDef = def.propertyDef;

            //if(propertyDef.id && (propertyDef.hasGet || propertyDef.hasSet))
            {
               Property prop;
               PropertyDefine propDefine;

               // Register the property in the list
               {
                  char * dataTypeString = StringFromSpecDecl(propertyDef.specifiers, propertyDef.declarator);
                  prop = eClass_AddProperty(regClass, propertyDef.conversion ? null : propertyDef.id.string, dataTypeString, propertyDef.setStmt, propertyDef.getStmt, def.memberAccess);
                  if(prop)
                  {
                     prop.IsSet = (void *)propertyDef.issetStmt;
                     prop.compiled = false;
                  }
                  delete dataTypeString;
               }
               //prop.symbol = propertyDef.symbol;

               //method.symbol = func.declarator.symbol;

               if(prop)
               {
                  prop.symbol = Symbol
                  {
                     string = CopyString(propertyDef.symbol.string);
                     type = propertyDef.symbol.type;
                  };
                  if(propertyDef.symbol.type)
                     propertyDef.symbol.type.refCount++;

                  //((Symbol)method.symbol).method = method;


                  propDefine = PropertyDefine
                  {
                     isProperty = propertyMember;
                     name = prop.conversion ? null : CopyString(prop.name);
                     type = CopyString(prop.dataTypeString);
                     isVirtual = false; // No virtual properties for now...
                     memberAccess = def.memberAccess;
                     hasSet = propertyDef.setStmt ? true : false;
                     hasGet = propertyDef.getStmt ? true : false;
                     isWatchable = propertyDef.isWatchable;
                  };
                  classDefine.propertiesAndMembers.Add(propDefine);
               }
            }
         }
         else if(def.type == classPropertyClassDef && def.propertyDef)
         {
            PropertyDef propertyDef = def.propertyDef;

            //if(propertyDef.id && (propertyDef.hasGet || propertyDef.hasSet))
            {
               ClassProperty prop;
               PropertyDefine propDefine;
               // Register the property in the list
               {
                  char * dataTypeString = StringFromSpecDecl(propertyDef.specifiers, propertyDef.declarator);
                  prop = eClass_AddClassProperty(regClass, propertyDef.id.string, dataTypeString, propertyDef.setStmt, propertyDef.getStmt);
                  delete dataTypeString;
               }
               if(prop)
               {
                  propDefine = PropertyDefine
                  {
                     name = CopyString(prop.name);
                     type = CopyString(prop.dataTypeString);
                     hasSet = propertyDef.setStmt ? true : false;
                     hasGet = propertyDef.getStmt ? true : false;
                  };
                  classDefine.classProperties.Add(propDefine);
               }
            }
         }
         else if(def.type == classFixedClassDef)
         {
            if(classDefine)
               classDefine.fixed = true;
         }
         else if(def.type == classNoExpansionClassDef)
         {
            if(classDefine)
               classDefine.noExpansion = true;
         }
         else if(def.type == accessOverrideClassDef)
         {
            DataMember member;
            Property prop;
            if((prop = eClass_FindProperty(regClass, def.id.string, privateModule)))
            {
               PropertyDefine propDefine;

               prop = eClass_AddProperty(regClass, def.id.string, null, null, null, def.memberAccess);
               if(prop)
               {
                  propDefine = PropertyDefine
                  {
                     isProperty = propertyMember;
                     name = CopyString(prop.name);
                     memberAccess = def.memberAccess;
                  };
                  classDefine.propertiesAndMembers.Add(propDefine);
               }
            }
            else if((member = eClass_FindDataMember(regClass, def.id.string, privateModule, null, null)))
            {
               DataMemberDefine dataMemberDefine;

               member = eClass_AddDataMember(regClass, def.id.string, null, 0, 0, def.memberAccess);

               dataMemberDefine = DataMemberDefine
               {
                  isProperty = dataMember;
                  memberType = normalMember;
                  name = CopyString(def.id.string);
                  memberAccess = def.memberAccess;
               };
               parentMemberDefine.dataMembers.Add(dataMemberDefine);
            }
         }
      }
   }
}

static void ProcessClass(ClassType classType, OldList definitions, Symbol symbol, OldList baseSpecs, OldList enumValues, bool isWatchable, AccessMode declMode)
{
   Class regClass;
   ClassDef def;
   ClassDefine classDefine;
   char baseName[1024];
   bool unitType = false;
   bool wouldBeEnum = false;
   AccessMode inheritanceAccess = publicAccess;
   baseName[0] = '\0';

   if(baseSpecs != null)
   {
      Type baseType = ProcessType(baseSpecs, null);
      PrintType(baseType, baseName, false, true);
      if(baseType.kind == TypeKind::classType)
      {
         if(baseType._class.registered && classType == normalClass)
         {
            if(baseType._class.registered.type == unitClass)
               classType = unitClass;
            else if(baseType._class.registered.type == bitClass)
               classType = bitClass;
            else if(baseType._class.registered.type == noHeadClass)
               classType = noHeadClass;
            else if(baseType._class.registered.type == enumClass)
            {
               wouldBeEnum = true;
               // classType = enumClass;
            }
         }
      }
      else if(baseType.kind == structType || baseType.kind == unionType)
      {
         classType = noHeadClass;
         baseName[0] = '\0';
      }
      else
         unitType = true;
      FreeType(baseType);

      if(((Specifier)baseSpecs.first).type == baseSpecifier && ((Specifier)baseSpecs.first).specifier == PRIVATE)
         inheritanceAccess = privateAccess;
   }

   // Eventually compute size with declarations for optional constant size offset...

   // If there's any struct declaration in a unit data type, it means this is a bit class
   if(classType == normalClass)
   {
      if(unitType) classType = unitClass;
      if(definitions != null)
      {
         for(def = definitions.first; def; def = def.next)
         {
            if(def.type == declarationClassDef)
            {
               Declaration decl = def.decl;
               if(decl.type == structDeclaration)
               {
                  if(unitType)
                  {
                     classType = bitClass;
                     break;
                  }
                  if(decl.declarators)
                  {
                     Declarator d;

                     for(d = decl.declarators->first; d; d = d.next)
                     {
                        if(d.structDecl.exp)
                        {
                           classType = bitClass;
                           break;
                        }
                     }
                     if(d) break;
                  }
               }
            }
         }
      }
   }
   if(classType == normalClass && wouldBeEnum) classType = enumClass;

   regClass = symbol.registered = eSystem_RegisterClass((classType == unionClass) ? structClass : classType, symbol.string, baseName[0] ? baseName : null, 0, 0, null, null, privateModule, publicAccess, inheritanceAccess);
   if(regClass)
      regClass.symbol = symbol;

   classDefine = ClassDefine
   {
      type = classDefinition;
      name = CopyString(symbol.string);
      base = baseName[0] ? CopyString(baseName) : null;
      accessMode = declMode;
      isRemote = symbol.isRemote;
      isWatchable = isWatchable;
   };
   precompDefines.Add(classDefine);

   if(classType == unionClass)
   {
      DataMember unionMember = eMember_New(DataMemberType::unionMember, publicAccess);
      DataMemberDefine unionDefine;

      unionDefine = DataMemberDefine
      {
         isProperty = dataMember;
         memberType = DataMemberType::unionMember;
      };
      classDefine.propertiesAndMembers.Add(unionDefine);

      AddDefinitions(classDefine, unionDefine, regClass, unionMember, definitions);
      eClass_AddMember(regClass, unionMember);
   }
   else if(regClass)
      AddDefinitions(classDefine, (DataMemberDefine)classDefine, regClass, null, definitions);

   // Do the functions
   if(definitions != null)
   {
      for(def = definitions.first; def; def = def.next)
      {
         if(def.type == functionClassDef)
         {
            ClassFunction func = def.function;
            // Add ecereMethod_[class]_ to the declarator
            if(!func.dontMangle && func.declarator)
            {
               Identifier id = GetDeclId(func.declarator);
               Method method;
               MethodDefine methodDefine;

               {
                  char * dataTypeString  = StringFromSpecDecl(func.specifiers, func.declarator);
                  if(func.isVirtual)
                     method = eClass_AddVirtualMethod(regClass, id.string, dataTypeString, func.declarator.symbol, def.memberAccess);
                  else
                     method = eClass_AddMethod(regClass, id.string, dataTypeString, func.declarator.symbol, def.memberAccess);
                  delete dataTypeString;
               }

               // Should we make a copy here? We make a copy in pass0.c ...
               //method.symbol = func.declarator.symbol;

               if(method)
               {
                  method.symbol = Symbol
                  {
                     string = CopyString(func.declarator.symbol.string);
                     type = func.declarator.symbol.type;
                  };
                  if(func.declarator.symbol.type)
                     func.declarator.symbol.type.refCount++;

                  ((Symbol)method.symbol).method = method;


                  func.declarator.symbol = null;

                  if(method.type != virtualMethod || method._class == regClass)
                  {
                     methodDefine = MethodDefine
                     {
                        name = CopyString(method.name);
                        type = CopyString(method.dataTypeString);
                        memberAccess = def.memberAccess;
                        isVirtual = method.type == virtualMethod;
                     };
                     classDefine.methods.Add(methodDefine);
                  }
               }
            }
         }
         else if(def.type == accessOverrideClassDef)
         {
            Method method;
            if((method = eClass_FindMethod(regClass, def.id.string, privateModule)))
            {
               MethodDefine methodDefine;

               method = eClass_AddMethod(regClass, def.id.string, null, null, def.memberAccess);

               methodDefine = MethodDefine
               {
                  name = CopyString(method.name);
                  memberAccess = def.memberAccess;
               };
               classDefine.methods.Add(methodDefine);
            }
         }
      }
   }
   if(regClass && symbol.templateParams)
   {
      TemplateParameter param;
      // Add template parameters here
      for(param = symbol.templateParams->first; param; param = param.next)
      {
         ClassTemplateArgument defaultArg { };
         if(param.defaultArgument)
         {
            switch(param.type)
            {
               case type:
                  defaultArg.dataTypeString =
                     StringFromSpecDecl(param.defaultArgument.templateDatatype.specifiers, param.defaultArgument.templateDatatype.decl);
                  break;
               case identifier:
               {
                  char memberString[1024];
                  memberString[0] = '\0';

                  if(param.defaultArgument.identifier._class && param.defaultArgument.identifier._class.name)
                  {
                     if(param.defaultArgument.identifier._class.type == templateTypeSpecifier)
                        strcpy(memberString, param.defaultArgument.identifier._class.templateParameter.identifier.string);
                     else
                        strcpy(memberString, param.defaultArgument.identifier._class.name);
                  }

                  if(memberString[0])
                  {
                     strcat(memberString, "::");
                  }
                  strcat(memberString, param.defaultArgument.identifier.string);
                  defaultArg.memberString = CopyString(memberString);
                  break;
               }
/*                  switch(param.memberType)
                  {
                     case dataMember:
                        defaultArg.member = eClass_FindDataMember(regClass, param.defaultArgument.identifier.string, regClass.module, null, null);
                        break;
                     case method:
                        defaultArg.method = eClass_FindMethod(regClass, param.defaultArgument.identifier.string, regClass.module);
                        break;
                     case prop:
                        defaultArg.prop = eClass_FindProperty(regClass, param.defaultArgument.identifier.string, regClass.module);
                        break;
                  }
                  break;*/
               case expression:
               {
                  Operand op;
                  ProcessExpressionType(param.defaultArgument.expression);
                  ComputeExpression(param.defaultArgument.expression);
                  op = GetOperand(param.defaultArgument.expression);
                  defaultArg.expression.ui64 = op.ui64;
                  break;
               }
            }
         }
         if(param.type == identifier)
         {
            eClass_AddTemplateParameter(regClass, param.identifier.string, param.type, (void *)(uintptr)param.memberType, defaultArg);
         }
         else
         {
            char * typeString = param.dataType ? StringFromSpecDecl(param.dataType.specifiers, param.dataType.decl) : null;
            eClass_AddTemplateParameter(regClass, param.identifier.string, param.type, typeString, defaultArg);

            /*eClass_AddTemplateParameter(regClass, param.identifier.string, param.type,
               (param.type == type) ? eSystem_FindClass(regClass.module, typeString) : CopyString(typeString), defaultArg);*/
            // delete typeString;
         }

      }
   }
}

static void ProcessClassEnumValues(ClassType classType, OldList definitions, Symbol symbol, OldList baseSpecs, OldList enumValues)
{
   Class regClass = symbol.registered;
   if(regClass && enumValues)
   {
      Enumerator e;
      int64 lastValue = -1;
      bool lastValueSet = false;
      for(e = enumValues.first; e; e = e.next)
      {
         if(e.exp)
         {
            Type destType
            {
               kind = int64Type;
               refCount = 1;
            };
            e.exp.destType = destType;

            // Set parsingType to avoid producing errors
            SetParsingType(true);
            ProcessExpressionType(e.exp);
            SetParsingType(false);

            if(!e.exp.expType)
            {
               destType.kind = TypeKind::classType;
               destType._class = symbol;
               ProcessExpressionType(e.exp);
            }
            if(e.exp.isConstant)
            {
               if(e.exp.type == identifierExp && e.exp.expType && e.exp.identifier && e.exp.identifier.string && e.exp.expType.kind == enumType)
               {
                  // Resolve enums here
                  NamedLink64 l;
                  char * string = e.exp.identifier.string;
                  for(l = e.exp.expType.members.first; l; l = l.next)
                  {
                     if(!strcmp(l.name, string))
                     {
                        if(l.data)
                        {
                           FreeExpContents(e.exp);
                           e.exp.type = constantExp;
                           e.exp.constant = PrintInt64(l.data);
                           FreeType(e.exp.expType);
                           e.exp.expType = ProcessTypeString("int64", false);
                        }
                        break;
                     }
                  }
               }
               else
                  ComputeExpression(e.exp);
            }
            if(e.exp.isConstant && e.exp.type == constantExp)
            {
               Operand op = GetOperand(e.exp);
               int64 value;
               //value = strtol(e.exp.string, null, 0);
               switch(op.kind)
               {
                  case charType:
                     value = op.type.isSigned ? (int64)op.c : (int64)op.uc;
                     break;
                  case shortType:
                     value = op.type.isSigned ? (int64)op.s : (int64)op.us;
                     break;
                  case int64Type:
                     value = op.type.isSigned ? (int64)op.i64 : (int64)op.ui64;
                     break;
                  case intType:
                  default:
                     value = op.type.isSigned ? (int64)op.i : (int)op.ui;
               }
               eEnum_AddFixedValue(regClass, e.id.string, value);
               lastValueSet = true;
               lastValue = value;
            }
            else
            {
               char expString[8192];
               expString[0] = 0;
               PrintExpression(e.exp, expString);
               printf($"error: could not resolve value %s for enum %s in precompiler\n", expString, regClass.name);
               ((PrecompApp)__thisModule).exitCode = 1;
               if(lastValueSet)
                  eEnum_AddFixedValue(regClass, e.id.string, ++lastValue);
               else
                  eEnum_AddValue(regClass, e.id.string);
            }
         }
         else
         {
            if(lastValueSet)
               eEnum_AddFixedValue(regClass, e.id.string, ++lastValue);
            else
               eEnum_AddValue(regClass, e.id.string);
         }
      }
   }
}

void PreCompPreProcessClassDefinitions()
{
   OldList * ast = GetAST();
   External external, next;
   for(external = ast->first; external; external = next)
   {
      next = external.next;
      if(external.type == classExternal)
      {
         ClassDefinition _class = external._class;
         if(_class.declMode == publicAccess || _class.declMode == privateAccess || _class.declMode == staticAccess)
         {
            if(_class.definitions)
            {
               ProcessClass(normalClass, _class.definitions, _class.symbol, _class.baseSpecs, null, _class.deleteWatchable, _class.declMode);
            }
         }
      }
      else if(external.type == declarationExternal)
      {
         Declaration declaration = external.declaration;

         if(declaration.type == initDeclaration)
         {
            if(external.declaration.declMode == publicAccess || external.declaration.declMode == privateAccess || external.declaration.declMode == staticAccess)
            {
               if(declaration.specifiers)
               {
                  Specifier specifier;
                  for(specifier = declaration.specifiers->first; specifier; specifier = specifier.next)
                  {
                     if((specifier.type == enumSpecifier || specifier.type == structSpecifier || specifier.type == unionSpecifier) && specifier.id && specifier.id.string &&
                        (declaration.declMode || specifier.baseSpecs || (specifier.type == enumSpecifier && specifier.definitions)))
                     {
                        Symbol symbol = FindClass(specifier.id.string);
                        if(symbol)
                        {
                           ClassType classType;

                           if(specifier.type == enumSpecifier)
                              classType = enumClass;
                           else if(specifier.type == unionSpecifier)
                              classType = unionClass;
                           else
                              classType = structClass;
                           ProcessClass(classType, specifier.definitions, symbol, specifier.baseSpecs, specifier.list, false, external.declaration.declMode);
                        }
                     }
                  }
               }
               if(external.declaration.declMode == publicAccess || external.declaration.declMode == privateAccess)
               {
                  if(declaration.declarators)
                  {
                     InitDeclarator d;
                     for(d = declaration.declarators->first; d; d = d.next)
                     {
                        if(d.declarator)
                        {
                           Symbol symbol = d.declarator.symbol;
                           if(symbol)
                           {
                              DataDefine dataDefine;
                              char typeString[1024];
                              typeString[0] = '\0';
                              PrintType(symbol.type, typeString, false, true);
                              dataDefine = DataDefine
                              {
                                 type = dataDefinition;
                                 name = CopyString(symbol.string);
                                 dataType = CopyString(typeString);
                              };
                              precompDefines.Add(dataDefine);
                           }
                        }
                     }
                  }
               }
            }
         }
         else if(declaration.type == instDeclaration)
         {
            if(external.declaration.declMode == publicAccess || external.declaration.declMode == privateAccess)
            {
               Symbol symbol = declaration.inst.symbol;
               if(symbol)
               {
                  DataDefine dataDefine;
                  char typeString[1024];
                  typeString[0] = '\0';
                  PrintType(symbol.type, typeString, false, true);
                  dataDefine = DataDefine
                  {
                     type = dataDefinition;
                     name = CopyString(symbol.string);
                     dataType = CopyString(typeString);
                  };
                  precompDefines.Add(dataDefine);
               }
            }
            globalInstance = true;
         }
         else if(declaration.type == defineDeclaration)
         {
            if(external.declaration.declMode == publicAccess || external.declaration.declMode == privateAccess)
            {
               Define definition
               {
                  type = defineDefinition;
                  name = CopyString(declaration.id.string);
                  exp = declaration.exp;
               };
               precompDefines.Add(definition);
            }
         }
      }
      else if(external.type == functionExternal && (external.function.declMode == publicAccess || external.function.declMode == privateAccess))
      {
         FunctionDefinition function = external.function;
         FunctionDefine functionDefine;
         char typeString[1024];
         typeString[0] = '\0';
         PrintType(function.declarator.symbol.type, typeString, true, true);
         functionDefine = FunctionDefine
         {
            type = functionDefinition;
            name = CopyString(function.declarator.symbol.string);
            dataType = CopyString(typeString);
         };
         precompDefines.Add(functionDefine);
      }
      else if(external.type == nameSpaceExternal)
      {
         SetCurrentNameSpace(external.id.string); //currentNameSpace = external.id.string;
         //currentNameSpaceLen = currentNameSpace ? strlen(currentNameSpace) : 0;
      }
   }

   ComputeModuleClasses(privateModule);

   // Second pass for enumeration values
   for(external = ast->first; external; external = next)
   {
      next = external.next;
      if(external.type == declarationExternal && (external.declaration.declMode == publicAccess || external.declaration.declMode == privateAccess))
      {
         Declaration declaration = external.declaration;

         if(declaration.type == initDeclaration)
         {
            if(declaration.specifiers)
            {
               Specifier specifier;
               for(specifier = declaration.specifiers->first; specifier; specifier = specifier.next)
               {
                  if((specifier.type == enumSpecifier) && specifier.id && specifier.id.string &&
                     (declaration.declMode || specifier.baseSpecs || (specifier.type == enumSpecifier && specifier.definitions)))
                  {
                     Symbol symbol = FindClass(specifier.id.string);
                     if(symbol)
                     {
                        ProcessClassEnumValues(enumClass, specifier.definitions, symbol, specifier.baseSpecs, specifier.list);
                     }
                  }
               }
            }
         }
      }
   }
}

static void OutputDataMembers(ClassDefine classDefine, Class _class, File f)
{
   if(classDefine.propertiesAndMembers.first)
   {
      DataMemberDefine member = classDefine.propertiesAndMembers.first;
      MemberType last = unresolvedMember;

      for(member = classDefine.propertiesAndMembers.first; member; member = member.next)
      {
         if(member.isProperty == propertyMember)
         {
            PropertyDefine prop = (PropertyDefine)member;
            if(last != propertyMember)
            {
               if(last)
                  f.Printf("         .\n");
               f.Printf("      [Defined Properties]\n");
            }

            if(prop.name)
               f.Printf("         %s\n", prop.name);
            else
               f.Printf("         [Conversion]\n");
            if(prop.memberAccess == publicAccess)
               f.Printf("            [Public]\n");
            else
               f.Printf("            [Private]\n");
            if(prop.isVirtual)
               f.Printf("            [Virtual]\n");
            if(prop.hasSet)
               f.Printf("            [Set]\n");
            if(prop.hasGet)
               f.Printf("            [Get]\n");
            if(prop.isWatchable)
               f.Printf("            [Watchable]\n");
            f.Printf("            [Type]\n");
            f.Printf("               %s\n", prop.type ? prop.type : "");
         }
         else
         {
            if(last != dataMember)
            {
               if(last)
                  f.Printf("         .\n");
               f.Printf("      [Defined Data Members]\n");
            }
            if(member.memberType == normalMember)
            {
               f.Printf("         %s\n", member.name);
               if(member.memberAccess == publicAccess)
                  f.Printf("            [Public]\n");
               else
                  f.Printf("            [Private]\n");
               if(_class && _class.type == bitClass)
               {
                  if(member.size)
                  {
                     f.Printf("            [Size]\n");
                     f.Printf("               %d\n", member.size);
                  }
                  if(member.bitPos != -1)
                  {
                     f.Printf("            [Pos]\n");
                     f.Printf("               %d\n", member.bitPos);
                  }
               }
               f.Printf("            [Type]\n");
               f.Printf("               %s\n", member.type ? member.type : "");
            }
            else
            {
               if(member.memberAccess == publicAccess)
                  f.Printf("            [Public]\n");
               else
                  f.Printf("            [Private]\n");
               f.Printf((member.memberType == unionMember) ? "      [Union]\n" : "      [Struct]\n");
               OutputDataMembers((ClassDefine)member, null, f);
            }
         }
         last = member.isProperty;
      }
      f.Printf("         .\n");
   }

   if(classDefine.classProperties.first)
   {
      PropertyDefine prop = classDefine.propertiesAndMembers.first;
      f.Printf("      [Defined Class Properties]\n");
      for(prop = classDefine.classProperties.first; prop; prop = prop.next)
      {
         if(prop.name)
            f.Printf("         %s\n", prop.name);
         if(prop.hasSet)
            f.Printf("            [Set]\n");
         if(prop.hasGet)
            f.Printf("            [Get]\n");
         f.Printf("            [Type]\n");
         f.Printf("               %s\n", prop.type ? prop.type : "");
      }
      f.Printf("         .\n");
   }
}

static void OutputSymbols(const char * fileName)
{
   File f = FileOpen(fileName, write);
   if(f)
   {
      DefinitionType lastType = (DefinitionType)-1;
      Definition definition;

      if(globalInstance)
         f.Printf("[Global Instance]\n");

      for(definition = precompDefines.first; definition; definition = definition.next)
      {
         if(definition.type != lastType)
         {
            if(lastType != (DefinitionType)-1)
               f.Printf("   .\n");
            if(definition.type == moduleDefinition)
               f.Printf("[Imported Modules]\n");
            else if(definition.type == classDefinition)
               f.Printf("[Defined Classes]\n");
            else if(definition.type == defineDefinition)
               f.Printf("[Defined Expressions]\n");
            else if(definition.type == functionDefinition)
               f.Printf("[Defined Functions]\n");
            else if(definition.type == dataDefinition)
               f.Printf("[Defined Data]\n");
            lastType = definition.type;
         }
         if(definition.type == moduleDefinition)
         {
            ImportedModule module = (ImportedModule) definition;

            if(module.importType == staticImport)
               f.Printf("   [Static]\n");
            else if(module.importType == remoteImport)
               f.Printf("   [Remote]\n");
            if(module.importAccess == privateAccess)
               f.Printf("   [Private]\n");
            f.Printf("   %s\n", module.name);
         }
         else if(definition.type == classDefinition)
         {
            // Can we do this? Or should we fill up the definition?
            Class _class = eSystem_FindClass(privateModule, definition.name);
            ClassDefine classDefine = (ClassDefine) definition;

            f.Printf("   %s\n", definition.name);
            if(classDefine.accessMode == staticAccess)
               f.Printf("      [Static]\n");
            if(classDefine.accessMode == privateAccess)
               f.Printf("      [Private]\n");
            if(classDefine.fixed)
               f.Printf("      [Fixed]\n");
            if(classDefine.noExpansion)
               f.Printf("      [No Expansion]\n");
            if(classDefine.isRemote)
               f.Printf("      [Remote]\n");
            if(classDefine.isWatchable)
               f.Printf("      [Watchable]\n");
            if(_class.type == enumClass)
               f.Printf("      [Enum]\n");
            else if(_class.type == bitClass)
               f.Printf("      [Bit]\n");
            else if(_class.type == structClass)
               f.Printf("      [Struct]\n");
            else if(_class.type == unitClass)
               f.Printf("      [Unit]\n");
            else if(_class.type == noHeadClass)
               f.Printf("      [NoHead]\n");

            if(_class.inheritanceAccess == privateAccess)
               f.Printf("      [Private Base]\n");
            else
               f.Printf("      [Base]\n");
            if(classDefine.base)
               f.Printf("         %s\n", classDefine.base);
            else
               f.Printf("         [None]\n");

            if(_class.templateParams.count)
            {
               ClassTemplateParameter param;
               TemplateParameter tp;

               f.Printf("         [Template Parameters]\n");

               for(tp = ((Symbol)_class.symbol).templateParams->first, param = _class.templateParams.first; param && tp; param = param.next, tp = tp.next)
               {
                  f.Printf("               %s\n", param.name);
                  switch(param.type)
                  {
                     case type:
                        f.Printf("               [Type]\n");
                        f.Printf("               %s\n", param.dataTypeString ? param.dataTypeString : "[None]");
                        f.Printf("               %s\n", param.defaultArg.dataTypeString ? param.defaultArg.dataTypeString : "[None]");
                        break;
                     case expression:
                        f.Printf("               [Expression]\n");
                        f.Printf("               %s\n", param.dataTypeString ? param.dataTypeString : "[None]");
                        if(tp.defaultArgument && tp.defaultArgument.expression)
                        {
                           char temp[8192];
                           temp[0] = 0;
                           PrintExpression(tp.defaultArgument.expression, temp);
                           ChangeCh(temp, '\n', ' ');
                           f.Printf("               ");
                           f.Puts(temp);
                           f.Puts("\n");
                        }
                        else
                           f.Printf("               [None]\n");
                        break;
                     case identifier:
                        f.Printf("               [Identifier]\n");
                        f.Printf("               %s\n", (param.memberType == dataMember) ? "[Data member]" : ((param.memberType == method) ? "[Method]" : "[Property]"));
                        if(tp.defaultArgument && tp.defaultArgument.identifier)
                        {
                           f.Printf("               ");
                           if(tp.defaultArgument.identifier._class && tp.defaultArgument.identifier._class.type == nameSpecifier &&
                              tp.defaultArgument.identifier._class.name)
                           {
                              f.Printf("%s::", tp.defaultArgument.identifier._class.name);
                           }
                           else if(tp.defaultArgument.identifier._class && tp.defaultArgument.identifier._class.type == templateTypeSpecifier &&
                              tp.defaultArgument.identifier._class.templateParameter.identifier)
                           {
                              f.Printf("%s::", tp.defaultArgument.identifier._class.templateParameter.identifier.string);
                           }
                           f.Printf("%s\n", tp.defaultArgument.identifier.string);
                        }
                        else
                        {
                           f.Printf("               [None]\n");
                        }
                        break;
                  }
               }
               f.Printf("         .\n");
            }

            if(classDefine.accessMode != staticAccess)
            {
               if(classDefine.methods.first)
               {
                  MethodDefine method;

                  f.Printf("      [Defined Methods]\n");
                  for(method = classDefine.methods.first; method; method = method.next)
                  {
                     f.Printf("         %s\n", method.name);
                     if(method.memberAccess == publicAccess)
                        f.Printf("            [Public]\n");
                     else
                        f.Printf("            [Private]\n");
                     if(method.isVirtual)
                        f.Printf("            [Virtual]\n");
                     f.Printf("            [Type]\n");
                     f.Printf("               %s\n", method.type ? method.type : "");
                  }
                  f.Printf("         .\n");
               }

               OutputDataMembers(classDefine, _class, f);

               if(_class.type == enumClass)
               {
                  NamedLink64 value;
                  Class enumClass = eSystem_FindClass(privateModule, "enum");
                  EnumClassData e = ACCESS_CLASSDATA(_class, enumClass);

                  f.Printf("      [Enum Values]\n");
                  for(value = e.values.first; value; value = value.next)
                  {
                     f.Printf("         %s = ", value.name);
                     // We can have a null _class.dataTypeString here if the enum uses a base defined in another module yet to be precompiled
                     if(_class.dataTypeString && !strcmp(_class.dataTypeString, "uint64") && *(uint64 *)&value.data > MAXINT64)
                        f.Printf(FORMAT64HEX, *(uint64 *)&value.data);
                     else
                        f.Printf(FORMAT64D, value.data);
                     f.Printf("\n");
                  }
                  f.Printf("         .\n");
               }
            }
         }
         else if(definition.type == defineDefinition)
         {
            Define defineDefine = (Define) definition;
            f.Printf("   %s\n", definition.name);
            f.Printf("      [Value]\n");
            f.Printf("         ");
            OutputExpression(defineDefine.exp, f);
            f.Printf("\n");
         }
         else if(definition.type == functionDefinition)
         {
            FunctionDefine functionDefine = (FunctionDefine) definition;
            f.Printf("   %s\n", functionDefine.name);
            f.Printf("      [Type]\n");
            f.Printf("         %s\n", functionDefine.dataType);
         }
         else if(definition.type == dataDefinition)
         {
            DataDefine dataDefine = (DataDefine) definition;
            f.Printf("   %s\n", dataDefine.name);
            f.Printf("      [Type]\n");
            f.Printf("         %s\n", dataDefine.dataType);
         }
      }
      f.Printf("   .\n");
      delete f;
   }
}

class PrecompApp : Application
{
   void Main()
   {
      int c;
      bool valid = true;
      char defaultSymFile[MAX_LOCATION];
      char * cppCommand = null;
      char * cppOptions = null;
      int cppOptionsLen = 0;
      /*char ** argv = null;
      int argc = 0;*/

      Platform targetPlatform = __runtimePlatform;
      int targetBits = GetRuntimeBits();
      /*
      for(c = 0; c<this.argc; c++)
      {
         char * arg = this.argv[c];
         int argLen = strlen(arg);

         argv = renew argv char *[argc + 1];
         argv[argc] = new char[argLen+1];
         strcpy(argv[argc], arg);

         while(argv[argc][argLen-1] == '\\' && c < this.argc-1)
         {
            int len;

            c++;
            arg = this.argv[c];
            len = strlen(arg);
            argv[argc] = renew argv[argc] char[argLen + len + 1];

            argv[argc][argLen-1] = ' ';
            strcpy(argv[argc] + argLen, arg);
            argLen += len;
         }
         argc++;
      }*/

#if 0 //def _DEBUG
      printf("\nArguments given:\n");
      for(c=1; c<argc; c++)
         printf(" %s", argv[c]);
      printf("\n\n");
      for(c=1; c<argc; c++)
         PrintLn("Arg", c, ": ", argv[c]);
      printf("\n");
      //getch();
#endif

      for(c = 1; c<argc; c++)
      {
         const char * arg = argv[c];
         if(arg[0] == '-')
         {
            if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
            {
               int newLen = cppOptionsLen + 1 + strlen(arg);
               cppOptions = renew cppOptions char[newLen + 1];
               cppOptions[cppOptionsLen] = ' ';
               strcpy(cppOptions + cppOptionsLen + 1, arg);
               cppOptionsLen = newLen;
               targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
            }
            else if(!strcmp(arg + 1, "t32") || !strcmp(arg + 1, "t64"))
            {
               targetBits = !strcmp(arg + 1, "t32") ? 32 : 64;
            }
            else if(arg[1] == 'D' || arg[1] == 'I')
            {
               char * buf;
               int size = cppOptionsLen + 1 + strlen(arg) * 2 + 1;
               cppOptions = renew cppOptions char[size];
               buf = cppOptions + cppOptionsLen;
               *buf++ = ' ';
               PassArg(buf, arg);
               cppOptionsLen = cppOptionsLen + 1 + strlen(buf);
            }
            else if(!strcmp(arg+1, "t"))
            {
               if(++c < argc)
               {
                  targetPlatform = argv[c];
                  if(targetPlatform == unknown)
                  {
                     PrintLn("Unknown platform: ", argv[c]);
                     if(!strcmp(argv[c], "32") || !strcmp(argv[c], "64"))
                        PrintLn("hint: bitness is specified with -t32 or -t64 without a space");
                     valid = false;
                  }
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "cpp"))
            {
               if(++c < argc)
                  cppCommand = CopyString(argv[c]);
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "o"))
            {
               if(!GetOutputFile() && c + 1 < argc)
               {
                  SetOutputFile(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "c"))
            {
               if(!GetSourceFile() && c + 1 < argc)
               {
                  SetSourceFile(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "isystem") || !strcmp(arg+1, "isysroot") || !strcmp(arg+1, "s"))
            {
               if(c + 1 < argc)
               {
                  char * buf;
                  const char * arg1 = argv[++c];
                  int size = cppOptionsLen + 1 + strlen(arg) * 2 + strlen(arg1) * 2 + 1;
                  cppOptions = renew cppOptions char[size];
                  buf = cppOptions + cppOptionsLen;
                  *buf++ = ' ';
                  buf = PassArg(buf, arg);
                  *buf++ = ' ';
                  buf = PassArg(buf, arg1);
                  cppOptionsLen = buf - cppOptions;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "fno-diagnostics-show-caret"))
            {
               char * buf;
               int size = cppOptionsLen + 1 + strlen(arg) * 2 + 1;
               cppOptions = renew cppOptions char[size];
               buf = cppOptions + cppOptionsLen;
               *buf++ = ' ';
               PassArg(buf, arg);
               cppOptionsLen = cppOptionsLen + 1 + strlen(buf);
            }
            else if(!strcmp(arg+1, "symbols"))
            {
               if(c + 1 < argc)
               {
                  SetSymbolsDir(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "defaultns"))
            {
               if(c + 1 < argc)
               {
                  SetDefaultNameSpace(argv[c+1]);
                  //defaultNameSpaceLen = strlen(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "strictns"))
            {
               SetStrictNameSpaces(true);
            }
            else if(!strcmp(arg+1, "module"))
            {
               if(c + 1 < argc)
               {
                  SetI18nModuleName(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
         }
         else
            valid = false;
      }
      if(valid)
      {
         if(!cppCommand)
            cppCommand = CopyString("gcc");
         if(!GetSourceFile())
            valid = false;
         else if(!GetOutputFile())
         {
            strcpy(defaultSymFile, GetSymbolsDir());
            PathCat(defaultSymFile, GetSourceFile());
            ChangeExtension(defaultSymFile, "sym", defaultSymFile);
            SetOutputFile(defaultSymFile);
         }
      }

      if(!valid)
      {
         printf("%s", $"Syntax:\n   ecp [-t <target platform>] [-cpp <c preprocessor>] [-o <output>] [-symbols <outputdir>] [-I<includedir>]* [-isystem <sysincludedir>]* [-D<definition>]* -c <input>\n");
      }
      else
      {
         DualPipe cppOutput;
         // TODO: Improve this
         char command[MAX_F_STRING*3];
         SetGlobalData(&globalData);
         SetExcludedSymbols(&_excludedSymbols);
         SetGlobalContext(globalContext);
         SetCurrentContext(globalContext);
         SetTopContext(globalContext);
         SetDefines(&::defines);
         SetImports(&imports);
         SetInPreCompiler(true);
         SetPrecompDefines(&precompDefines);
         SetTargetPlatform(targetPlatform);
         SetTargetBits(targetBits);
         SetEchoOn(false);

         privateModule = (Module)__ecere_COM_Initialize((bool)(true | (targetBits == sizeof(uintptr)*8 ? 0 : targetBits == 64 ? 2 : targetBits==32 ? 4 : 0) | 8), 1, null);
         SetPrivateModule(privateModule);

         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint64"), type = ProcessTypeString("unsigned int64", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint32"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint16"), type = ProcessTypeString("unsigned short", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("byte"), type = ProcessTypeString("unsigned char", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("intptr_t"), type = ProcessTypeString("intptr", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uintptr_t"), type = ProcessTypeString("uintptr", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("ssize_t"), type = ProcessTypeString("intsize", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("size_t"), type = ProcessTypeString("uintsize", false) });

         {
            const char * outputFilePath = GetOutputFile();
            if(FileExists(outputFilePath))
               DeleteFile(outputFilePath);
         }

         snprintf(command, sizeof(command), "%s%s -x c -E \"%s\"", cppCommand, cppOptions ? cppOptions : "", GetSourceFile());
         command[sizeof(command)-1] = 0;
         {
            char verbose[2048];
            if(GetEnvironment("V", verbose, sizeof(verbose)) && !strcmp(verbose, "1"))
               PrintLn("ecp: note: executing preprocessor: ", command);
         }
         if((cppOutput = DualPipeOpen({ output = true }, command)))
         {
            int exitCode;
            OldList * ast;
            TempFile fileInput { };
            ModuleImport mainModule { };
            //fileInput = TempFile { };
            SetFileInput(fileInput);

            SetMainModule(mainModule);
            imports.Add(/*(*/mainModule/* = ModuleImport { })*/);

            resetScanner();

            for(;!cppOutput.Eof();)
            {
               char junk[4096];
               int64 count = cppOutput.Read(junk, 1, 4096);
               fileInput.Write(junk, 1, count);
            }
            exitCode = cppOutput.GetExitCode();
            delete cppOutput;

            fileInput.Seek(0, start);

   #ifdef _DEBUG
            // SetYydebug(true);
   #endif
            ParseEc();
            SetCurrentNameSpace(null);
            SetYydebug(false);
            delete fileInput;
            SetFileInput(null);

            ast = GetAST();
            if(!exitCode)
            {
               if(ast)
               {
                  ProcessDBTableDefinitions();
                  PreCompPreProcessClassDefinitions();
               }
               if(!this.exitCode)
                  OutputSymbols(GetOutputFile());
            }
            else
               this.exitCode = exitCode;

            if(ast)
            {
               FreeASTTree(ast);
            }
         }
         else
         {
            PrintLn("(ecp) error: failed to execute C preprocessor");
            this.exitCode = 1;
         }


         FreeContext(globalContext);
         FreeExcludedSymbols(_excludedSymbols);

         ::defines.Free(FreeModuleDefine);
         imports.Free(FreeModuleImport);

         precompDefines.Free(FreeDefinition);

         FreeTypeData(privateModule);
         FreeIncludeFiles();
         FreeGlobalData(globalData);

         delete privateModule;
      }

      delete cppCommand;
      delete cppOptions;

      /*
      for(c = 0; c<argc; c++)
         delete argv[c];
      delete argv;
      */
      SetSymbolsDir(null); // Free symbols dir

#if 0 //defined(_DEBUG) && defined(__WIN32__)
      // CheckMemory();
      PrintLn("Done.");
      getch();
#endif
   }
}
