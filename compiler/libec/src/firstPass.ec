import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

static void AddDefinitions(Class regClass, DataMember member, OldList definitions)
{
   if(definitions != null)
   {
      ClassDef def;
      for(def = definitions.first; def; def = def.next)
      {
         if(def.type == declarationClassDef)
         {
            Declaration decl = def.decl;
            DataMember dataMember = null;
            Type dataType;

            if(decl.type == structDeclaration)
            {
               Declarator d;
               // Add data members to the class
               if(decl.declarators)
               {
                  for(d = decl.declarators->first; d; d = d.next)
                  {
                     Identifier declId = GetDeclId(d);
                     if(declId)
                     {
                        if(regClass && regClass.type == bitClass)
                        {
                           Expression sizeExp = (d.type == structDeclarator) ? d.structDecl.exp : null;
                           Expression posExp = (d.type == structDeclarator) ? d.structDecl.posExp : null;
                           int bitSize = 0, bitPos = -1;
                           //char dataTypeString[1024] = "";
                           char dataTypeString[8192];
                           dataTypeString[0] = 0;

                           if(sizeExp)
                           {
                              // Should this be processed/computed later?
                              ProcessExpressionType(sizeExp);
                              ComputeExpression(sizeExp);

                              if(sizeExp.isConstant)
                                 bitSize = strtol(sizeExp.constant, null, 0);
                              FreeExpression(sizeExp);
                           }

                           if(posExp)
                           {
                              // Should this be processed/computed later?
                              ProcessExpressionType(posExp);
                              ComputeExpression(posExp);

                              if(posExp.isConstant)
                                 bitPos = strtol(posExp.constant, null, 0);
                              FreeExpression(posExp);
                           }

                           if(d.type == structDeclarator)
                           {
                              d.structDecl.posExp = null;
                              d.structDecl.exp = null;
                           }

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
                           else
                           {
                              Compiler_Error($"Member with same name (%s) already exists in class %s\n", declId.string, regClass.name);
                              FreeType(dataType);
                           }
                        }
                        else
                        {
                           //if(isMember || !eClass_FindDataMember(regClass, declId.string))
                           {
                              //char * dataTypeString = StringFromSpecDecl(decl.specifiers, d);
                              //char typeString[1024] = "";
                              char typeString[8192];
                              typeString[0] = 0;
                              dataType = ProcessType(decl.specifiers, d);
                              // TODO: Need to find a more generic way to set up 'thisClassFrom'
                              if(dataType && dataType.kind == templateType)
                                 dataType.thisClassFrom = regClass;
                              PrintType(dataType, typeString, false, true);

                              if(member)
                              {
                                 dataMember = eMember_AddDataMember(member, declId.string,
                                    typeString, 0, 0 /*ComputeTypeSize(dataType)*/, def.memberAccess);
                                 if(!dataMember)
                                    Compiler_Error($"Member with same name (%s) already exists in member %s\n", declId.string, member.name);
                              }
                              else if(regClass)
                              {
                                 dataMember = eClass_AddDataMember(regClass, declId.string,
                                    typeString, 0, 0 /*ComputeTypeSize(dataType)*/, def.memberAccess);
                                 if(!dataMember)
                                    Compiler_Error($"Member with same name (%s) already exists in class %s\n", declId.string, regClass.name);
                              }

                              //delete dataTypeString;
                              if(dataMember)
                                 dataMember.dataType = dataType;
                              else
                                 FreeType(dataType);
                           }
                        }
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

                           AddDefinitions(null, dataMember, spec.definitions);

                           if(member)
                           {
                              eMember_AddMember(member, dataMember);
                           }
                           else
                           {
                              eClass_AddMember(regClass, dataMember);
                           }
                        }
                        else if(spec.definitions && spec.id)
                        {
                           //if(isMember || !eClass_FindDataMember(regClass, spec.id.string))
                           {
                              Identifier id = spec.id;
                              // char typeString[1024] = "";
                              char typeString[8192];
                              typeString[0] = 0;

                              spec.id = null;
                              decl.declarators = MkListOne(MkDeclaratorIdentifier(id));

                              dataType = ProcessType(decl.specifiers, null);
                              PrintType(dataType, typeString, false, true);

                              if(member)
                              {
                                 dataMember = eMember_AddDataMember(member, id.string,
                                    typeString, 0, 0 /*ComputeTypeSize(dataType)*/, def.memberAccess);
                                 if(!dataMember)
                                    Compiler_Error($"Member with same name (%s) already exists in member %s\n", id.string, member.name);
                              }
                              else
                              {
                                 dataMember = eClass_AddDataMember(regClass, id.string,
                                    typeString, 0, 0 /*ComputeTypeSize(dataType)*/, def.memberAccess);
                                 if(!dataMember)
                                    Compiler_Error($"Member with same name (%s) already exists in class %s\n", id.string, regClass.name);

                              }

                              // delete dataTypeString;
                              if(dataMember)
                                 dataMember.dataType = dataType;
                              else
                                 FreeType(dataType);
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
                  char * string = exp.identifier.string;
                  //if(isMember || !eClass_FindDataMember(regClass, string))
                  {
                     Type dataType
                     {
                        kind = classType;
                        _class = inst._class.symbol; // FindClass(inst._class.name);
                        refCount = 1;
                     };
                     if(member)
                     {
                        dataMember = eMember_AddDataMember(member, string, inst._class.name, 0, 0 /*ComputeTypeSize(dataType)*/, def.memberAccess);
                        if(!dataMember)
                           Compiler_Error($"Member with same name (%s) already exists in member %s\n", string, member.name);

                     }
                     else
                     {
                        dataMember = eClass_AddDataMember(regClass, string, inst._class.name, 0, 0 /*ComputeTypeSize(dataType)*/, def.memberAccess);
                        if(!dataMember)
                           Compiler_Error($"Member with same name (%s) already exists in class %s\n", string, regClass.name);
                     }
                     if(dataMember)
                        dataMember.dataType = dataType;
                     else
                        FreeType(dataType);
                  }
               }
            }
         }
         // TODO: Decide whether property ID should go after member ID, if so this should move back to ProcessClass
         else if(def.type == propertyClassDef && def.propertyDef)
         {
            PropertyDef propertyDef = def.propertyDef;
            Property prop;

            // Register the property in the list
            // MOVED THIS UP HERE BEFORE NEXT BLOCK BECAUSE WE NULL OUT SPECIFIERS/DECLARATORS... OK?

            char * dataTypeString = StringFromSpecDecl(propertyDef.specifiers, propertyDef.declarator);
            prop = eClass_AddProperty(regClass, propertyDef.conversion ? null : propertyDef.id.string,
               dataTypeString,
               inCompiler ? propertyDef.setStmt : null, inCompiler ? propertyDef.getStmt : null, def.memberAccess);
            delete dataTypeString;
            if(prop)
            {
               if(inCompiler) prop.IsSet = (void *)propertyDef.issetStmt;

               prop.compiled = false;

               // prop.symbol = propertyDef.symbol;
               prop.symbol = Symbol
               {
                  string = CopyString(propertyDef.symbol.string);
                  type = propertyDef.symbol.type;
               };

               /*if(propertyDef.category)
               {
                  char temp[1024];
                  ReadString(temp, propertyDef.category);
                  prop.category = CopyString(temp);  // LEAK: To free in parsed classes...
               }*/
               // TODO: Support property category in parsing mode
               ((Symbol)prop.symbol).propCategory = propertyDef.category;
               propertyDef.category = null;

               if(propertyDef.isWatchable)
                  eProperty_Watchable(prop);
            }
            // TODO: else:  What happens here?

            // Testing this... wasn't found anywhere, seems to be useful
            // (Determining if it's a conversion property in ProcessClassFunction)
            propertyDef.symbol._property = prop;

            if(propertyDef.symbol.type)
               propertyDef.symbol.type.refCount++;
         }
         else if(def.type == classPropertyClassDef && def.propertyDef)
         {
            PropertyDef propertyDef = def.propertyDef;
            //ClassProperty prop;

            // Register the property in the list
            // MOVED THIS UP HERE BEFORE NEXT BLOCK BECAUSE WE NULL OUT SPECIFIERS/DECLARATORS... OK?

            char * dataTypeString = StringFromSpecDecl(propertyDef.specifiers, propertyDef.declarator);
            /*prop = */eClass_AddClassProperty(regClass, propertyDef.id.string, dataTypeString,
               inCompiler ? propertyDef.setStmt : null, inCompiler ? propertyDef.getStmt : null);

            delete dataTypeString;
         }
      }
   }
}

static void ProcessClass(ClassType classType, OldList definitions, Symbol symbol, OldList baseSpecs, OldList enumValues, Location loc, OldList defs, void * after, OldList initDeclarators, AccessMode declMode)
{
   Class regClass;
   ClassDef def;
   bool redefinition = false;

   regClass = eSystem_FindClass(privateModule /*__thisModule*/, symbol.string);
   if(regClass && !regClass.internalDecl)
   {
      if(symbol.parent || (Symbol)globalContext.classes.root == symbol)
      {
         globalContext.classes.Remove((BTNode)symbol);
         excludedSymbols->Add(symbol);
      }
      redefinition = true;
      if(inCompiler)
      {
         yylloc = loc;
         Compiler_Error($"redefinition of class %s\n", symbol.string /*_class._class.name*/);
         return;
      }
   }
   else
   {
      char baseName[1024] = "";
      bool unitType = false;
      bool wouldBeEnum = false;
      bool canBeBits = true;
      AccessMode inheritanceAccess = publicAccess;

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
                  //classType = enumClass;
               }
               else if(baseType._class.registered.type == normalClass)
                  canBeBits = false;
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

      // If there's any struct declaration in a unit data type, it means this is a bit class
      if(classType == normalClass)
      {
         if(unitType) classType = unitClass;
         if(definitions != null && canBeBits)
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
                           if(d.type != structDeclarator)
                              continue; // This should always be a structDeclarator (There's a bug somewhere else if it's not)
                           if(d.structDecl.exp && d.structDecl.exp.type == constantExp)  // TODO: Parser error if e.g. an instance expression
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

      regClass = symbol.registered = eSystem_RegisterClass((classType == unionClass) ? structClass : classType,
         symbol.string, baseName[0] ? baseName : null, 0, 0, null, null, privateModule, buildingECERECOMModule ? baseSystemAccess : declMode /*publicAccess*/, inheritanceAccess);

      // HI DANGER: TESTING THIS
      if(regClass)
         regClass.symbol = symbol;
   }

   // First check if there's any declaration or instantiations, we'll need a struct
   if(!redefinition)
   {
      if(classType == unionClass)
      {
         DataMember unionMember = eMember_New(DataMemberType::unionMember, publicAccess);
         AddDefinitions(regClass, unionMember, definitions);
         eClass_AddMember(regClass, unionMember);
      }
      else
         AddDefinitions(regClass, null, definitions);
   }

   // Do the functions
   if(definitions != null)
   {
      for(def = definitions.first; def; def = def.next)
      {
         if(def.type == functionClassDef && (def.function.isConstructor || def.function.isDestructor))
         {
            Specifier spec = def.function.specifiers ? def.function.specifiers->last : null;
            if(!spec || spec.type != nameSpecifier || !spec.name ||
               (strcmp(spec.name, regClass.name) && (!spec.symbol || !spec.symbol.registered || strcmp(spec.symbol.registered.name, regClass.name))) )
            {
               yylloc = def.function.loc;
               Compiler_Error($"wrong class name specified for %s\n", def.function.isConstructor ? $"constructor" : $"destructor");
            }
            FreeList(def.function.specifiers, FreeSpecifier);
            def.function.specifiers = null;
         }
         if(def.type == functionClassDef && def.function.declarator)
         {
            ClassFunction func = def.function;

            func._class = regClass;
            // Add ecereMethod_[class]_ to the declarator
            if(!redefinition && !func.dontMangle)
            {
               Declarator funcDecl = GetFuncDecl(func.declarator);
               Identifier id = GetDeclId(funcDecl);
               Method method;

               if(func.isVirtual)
               {
                  char * typeString = StringFromSpecDecl(func.specifiers, func.declarator);
                  method = eClass_AddVirtualMethod(regClass, id.string, typeString, inCompiler ? func.declarator.symbol : null, def.memberAccess);
                  delete typeString;
               }
               else
               {
                  char * typeString = StringFromSpecDecl(func.specifiers, func.declarator);
                  method = eClass_AddMethod(regClass, id.string, typeString,
                     inCompiler ? func.declarator.symbol : null, def.memberAccess);
                  if(!method)
                     Compiler_Error($"Redefinition of method %s in class %s\n", id.string, regClass.name);
                  delete typeString;
               }
               if(method && (method.type != virtualMethod || method._class == regClass))
               {
                  //method.symbol = func.declarator.symbol;

                  // Make a copy here...
                  method.symbol = Symbol
                  {
                     string = CopyString(func.declarator.symbol.string);
                     type = func.declarator.symbol.type;
                     method = method;
                  };
                  if(func.declarator.symbol.type)
                     func.declarator.symbol.type.refCount++;

                  func.declarator.symbol.method = method;
               }
               else
               {
                  /*
                  method.symbol = Symbol
                  {
                     string = CopyString(func.declarator.symbol.string);
                     type = func.declarator.symbol.type;
                     method = method;
                  };
                  if(func.declarator.symbol.type)
                     func.declarator.symbol.type.refCount++;
                  */
                  func.declarator.symbol.method = method;
               }
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

                  if(param.defaultArgument.identifier._class)
                  {
                     if(param.defaultArgument.identifier._class.type == templateTypeSpecifier)
                     {
                        if(param.defaultArgument.identifier._class.templateParameter)
                           strcpy(memberString, param.defaultArgument.identifier._class.templateParameter.identifier.string);
                     }
                     else
                     {
                        if(param.defaultArgument.identifier._class.name)
                           strcpy(memberString, param.defaultArgument.identifier._class.name);
                     }
                  }

                  if(memberString[0])
                  {
                     strcat(memberString, "::");
                  }
                  strcat(memberString, param.defaultArgument.identifier.string);
                  defaultArg.memberString = CopyString(memberString);
                  break;
               }
               case expression:
               {
                  Operand op;
                  param.defaultArgument.expression.destType = ProcessType(param.dataType.specifiers, param.dataType.decl);
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
            eClass_AddTemplateParameter(regClass, param.identifier.string, identifier, (void *)(uintptr)param.memberType, defaultArg);
         }
         else
         {
            char * typeString = param.dataType ? StringFromSpecDecl(param.dataType.specifiers, param.dataType.decl) : null;
            eClass_AddTemplateParameter(regClass, param.identifier.string, param.type, typeString, defaultArg);
            delete typeString;
         }
         if(param.type == type || param.type == identifier)
            delete (void *)defaultArg.dataTypeString;

      }
      eClass_DoneAddingTemplateParameters(regClass);
   }
}

extern External curExternal;

public void PrePreProcessClassDefinitions()
{
   External external, next;

   curExternal = null;

   if(ast)
   {
      for(external = ast->first; external; external = next)
      {
         next = external.next;
         curExternal = external;
         if(external.type == classExternal)
         {
            ClassDefinition _class = external._class;
            if(/*_class.definitions &&*/ (!_class.symbol.registered || !inCompiler))
            {
               if(_class.definitions)
                  _class.symbol.mustRegister = true;
               ProcessClass(normalClass, _class.definitions, _class.symbol, _class.baseSpecs, null, _class.loc, ast, external.prev, null, _class.declMode);
               _class.symbol.isStatic = _class.declMode == staticAccess;
            }
         }
         else if(external.type == declarationExternal)
         {
            Declaration declaration = external.declaration;
            if(declaration.type == initDeclaration)
            {
               if(declaration.specifiers)
               {
                  Specifier specifier;
                  for(specifier = declaration.specifiers->first; specifier; specifier = specifier.next)
                  {
                     if((specifier.type == enumSpecifier || specifier.type == structSpecifier || specifier.type == unionSpecifier) && specifier.id && specifier.id.string &&
                        (declaration.declMode || specifier.baseSpecs || (specifier.type == enumSpecifier && specifier.definitions)))
                     {
                        Symbol type = FindType(globalContext, specifier.id.string);
                        Symbol symbol = FindClass(specifier.id.string);
                        if(type)
                        {
                           declaration.declMode = defaultAccess;
                           if(symbol)
                           {
                              globalContext.classes.Remove((BTNode)symbol);
                              excludedSymbols->Add(symbol);
                           }
                        }
                        else if(symbol && !symbol.registered)
                        {
                           ClassType classType;

                           if(specifier.type == enumSpecifier)
                              classType = enumClass;
                           else if(specifier.type == unionSpecifier)
                              classType = unionClass;
                           else
                              classType = structClass;

                           if(specifier.definitions || specifier.type == enumSpecifier || specifier.baseSpecs)
                              symbol.mustRegister = true;

                           ProcessClass(classType, specifier.definitions, symbol, specifier.baseSpecs, specifier.list, specifier.loc, ast, external.prev, declaration.declarators, declaration.declMode);
                           symbol.isStatic = declaration.declMode == staticAccess;
                        }
                     }
                  }
               }
            }
         }
         else if(external.type == importExternal)
         {
            //ImportModule(external._import);
         }
      }


      // Update templated classes
      {
         for(external = ast->first; external; external = external.next)
         {
            if(external.type == classExternal)
            {
               ClassDefinition _class = external._class;
               if(_class.symbol)
               {
                  OldLink link;
                  for(link = _class.symbol.templatedClasses.first; link; link = link.next)
                  {
                     Symbol symbol = link.data;
                     symbol.registered = eSystem_FindClass(privateModule, symbol.string);
                  }
               }
            }
            else if(external.type == declarationExternal)
            {
               Declaration declaration = external.declaration;
               if(declaration.type == initDeclaration)
               {
                  if(declaration.specifiers)
                  {
                     Specifier specifier;
                     for(specifier = declaration.specifiers->first; specifier; specifier = specifier.next)
                     {
                        if((specifier.type == enumSpecifier || specifier.type == structSpecifier || specifier.type == unionSpecifier) && specifier.id && specifier.id.string &&
                           (declaration.declMode || specifier.baseSpecs || (specifier.type == enumSpecifier && specifier.definitions)))
                        {
                           Symbol type = FindType(globalContext, specifier.id.string);
                           Symbol symbol = FindClass(specifier.id.string);
                           if(type)
                           {
                           }
                           else if(symbol)
                           {
                              OldLink link;
                              for(link = symbol.templatedClasses.first; link; link = link.next)
                              {
                                 Symbol tplSymbol = link.data;
                                 tplSymbol.registered = eSystem_FindClass(privateModule, tplSymbol.string);
                                 tplSymbol.module = symbol.module ? symbol.module : mainModule;
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}
