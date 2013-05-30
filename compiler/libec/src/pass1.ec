import "ecdefs"

// UNTIL IMPLEMENTED IN GRAMMAR
#define ACCESS_CLASSDATA(_class, baseClass) \
   (_class ? ((void *)(((char *)_class.data) + baseClass.offsetClass)) : null)

#define YYLTYPE Location
#include "grammar.h"

static Statement registerModuleBody;
static External registerModuleExternal;
static Statement unregisterModuleBody;
static External unregisterModuleExternal;

extern int propWatcherID;

bool buildingECERECOM = false;
public void SetBuildingEcereCom(bool b) { buildingECERECOM = b; } public bool GetBuildingEcereCom() { return buildingECERECOM; }
bool buildingECERECOMModule = false;
public void SetBuildingEcereComModule(bool b) { buildingECERECOMModule = b; } public bool GetBuildingEcereComModule() { return buildingECERECOMModule; }

// This will also be called by the instance processer to make the instance methods... (pass 1.5)
External ProcessClassFunction(Class owningClass, ClassFunction func, OldList defs, External after, bool makeStatic)
{
   Identifier id = GetDeclId(func.declarator);
   Type type = null;
   Symbol symbol;
   External external = null;

   if(defs && func.declarator)
   {
      FunctionDefinition function = null;
      Symbol propSymbol;
      int symid = func.declarator.symbol.id;
      int symidCode = func.declarator.symbol.idCode;

      if(inCompiler)
      {
         if(!func.specifiers)
            func.specifiers = MkList();
         // Add static to the specifiers
         if(makeStatic)
            func.specifiers->Insert(null, MkSpecifier(STATIC));
      }

      propSymbol = func.declarator.symbol;

      ReplaceThisClassSpecifiers(func.specifiers, owningClass);

      if(propSymbol.externalGet == (External)func)
         func.declarator.symbol = null;
      else if(propSymbol.externalSet == (External)func)
      {
         func.declarator.symbol = null;
         symid++;
      }
      else if(propSymbol.externalIsSet == (External)func)
      {
         func.declarator.symbol = null;
         symid += 2; // TOFIX: What should we do with this? Where are 2 IDs allocated for properties? In MkProperty...
      }

      //if(inCompiler)
      {
         /*FunctionDefinition*/ function = _MkFunction(func.specifiers, func.declarator, null, false);
         function.propSet = func.propSet;
         function.type = func.type;
         if(func.type) func.type.refCount++;
         ProcessFunctionBody(function, func.body);
         external = MkExternalFunction(function);
         
         external.symbol = func.declarator.symbol;
         external.function._class = func._class;
      }

      symbol = func.declarator.symbol;
      //symbol.id = func.id; //symid;
      symbol.id = symid;
      symbol.idCode = symidCode;
      
      if(!func.dontMangle)
      {
         // Normal method
         Method method = func.declarator.symbol.method;
         func.declarator.symbol.methodExternal = external;

         // DANGER: Added this one... 

         if(method && method.symbol)
            //((Symbol)method.symbol).methodExternal = external;
            ((Symbol)method.symbol).methodCodeExternal = external;

         if(method && method.type == virtualMethod)
         {
            Type methodDataType;
            ProcessMethodType(method);
            
            methodDataType = method.dataType;

            // Do type checking here of type against method.dataType
            // ThisClass must be the owning class for types not specified, static for static, or inherit from method's ThisClass is specified
            // If not specified, defaults to ThisClass if ThisClass specified in method, otherwise overiding class or static

            type = symbol.type;

            if(!type.staticMethod && !type.thisClass && !type.thisClassTemplate)
            {
               if(method.dataType.thisClassTemplate)
               {
                  if(owningClass.templateArgs)
                  {
                     ClassTemplateArgument * arg = FindTemplateArg(owningClass, method.dataType.thisClassTemplate);
                     type.byReference = method.dataType.byReference;

                     methodDataType = ProcessTypeString(method.dataTypeString, false);
                     type.thisClass = methodDataType.thisClass = arg ? FindClass(arg->dataTypeString) : null;
                  }
               }
               else if(method.dataType.staticMethod)
                  type.staticMethod = true;
               else if(method.dataType.thisClass)
               {
                  type.thisClass = method.dataType.thisClass;
                  type.byReference = method.dataType.byReference;
               }
               else
               {
                  if(!owningClass.symbol)
                     owningClass.symbol = FindClass(owningClass.fullName);

                  type.thisClass = owningClass.symbol;
                  // WORKING ON THIS TO SUPPORT : pass.NotifyClicked(this, pass, 0, 0, key.modifiers);
                  type.extraParam = true;
               }
            }

            yylloc = func.loc;
            if(!MatchTypes(type, methodDataType, null, owningClass, method._class /*owningClass*/, true, true, true, false))
            {
#ifdef _DEBUG
               // MatchTypes(type, methodDataType, null, owningClass, owningClass, true, true, true, false);
#endif
               Compiler_Error($"Incompatible virtual function %s\n", method.name);
            }
            else
            {
               // Mark typed_object/any_object parameters as such according to method type
               Type typeParam;
               Declarator funcDecl = GetFuncDecl(func.declarator);
               if(funcDecl.function.parameters)
               {
                  TypeName param = funcDecl.function.parameters->first;

                  for(typeParam = methodDataType.params.first; typeParam; typeParam = typeParam.next)
                  {
                     if(typeParam.classObjectType)
                     {
                        param.classObjectType = typeParam.classObjectType;
                        if(param.declarator && param.declarator.symbol)
                           param.declarator.symbol.type.classObjectType = typeParam.classObjectType;
                     }
                     param = param.next;
                  }
               }
            }
            if(methodDataType != method.dataType)
               FreeType(methodDataType);
         }
         else
         {
            type = symbol.type;
            if(!type.staticMethod && !type.thisClass)
            {
               if(owningClass && !owningClass.symbol)
                  owningClass.symbol = FindClass(owningClass.fullName);

               type.thisClass = owningClass ? FindClass(owningClass.fullName) : null;
            }
         }
      }
      else
      {
         // TESTING THIS HERE: (Implementing Class Properties)
         if(symbol.type && !symbol.type.staticMethod && !symbol.type.thisClass)
         {
            if(!owningClass.symbol)
               owningClass.symbol = FindClass(owningClass.fullName);
            symbol.type.thisClass = owningClass.symbol;
         }

         // Those type of classes don't need a this parameter for Set methods, null thisClass before changing the externals
         if(propSymbol.externalSet == (External)func && propSymbol._property && propSymbol._property.conversion)
         {
            if(symbol.type.thisClass && symbol.type.classObjectType != classPointer)
            {
               // TODO: Perhaps improve this so as to support both "this =" and "return " syntax for all types of classes
               if(owningClass.type != structClass)
                  //function.propertyNoThis = true;
                  symbol.type.thisClass = null;
            }
         }

         // Property
         if(propSymbol.externalGet == (External)func)
         {
            propSymbol.externalGet = external;
         }
         else if(propSymbol.externalSet == (External)func)
         {
            propSymbol.externalSet = external;
         }
         else if(propSymbol.externalIsSet == (External)func)
         {
            propSymbol.externalIsSet = external;
         }
         else 
         {
            // Constructor destructor
            //symbol.type = Type { };
         }
      }
      if(inCompiler)
      {
         if(func.body)
         {
            func.declarator = null;
            func.specifiers = null;
            func.body = null;

            defs.Insert(after, external);
         }
         else
         {
            Method method = func.declarator.symbol.method;
            if(method && method.symbol)
               ((Symbol)method.symbol).methodCodeExternal = null;

            //external.function = null;
            func.declarator = null;
            func.specifiers = null;

            FreeExternal(external); // Free external here?
         }
      }
      else
      {
         globalContext /*curContext*/.symbols.Remove((BTNode)symbol);
         excludedSymbols->Add(symbol);
         
         // Testing this...
         defs.Insert(after, external);

         external.function.declarator = CopyDeclarator(external.function.declarator);
         external.function.specifiers = CopyList(external.function.specifiers, CopySpecifier);
         external.function.body = null;
      }
   }
   return external;
}

void CreateRegisterModuleBody()
{
   if(!registerModuleBody && inCompiler)
   {
      char registerName[1024], moduleName[MAX_FILENAME];
      OldList * specifiers;
      Declarator declarator;
      TypeName moduleParam;

      registerModuleBody = MkCompoundStmt(MkList(), MkList());
      registerModuleBody.compound.context = Context { parent = globalContext };

      #if 0
      ListAdd(registerModuleBody.compound.declarations, 
         MkDeclaration(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null) /*MkSpecifierName("ecere::com::Class")*/ /*MkStructOrUnion(SpecifierStruct, MkIdentifier("Class"), null)*/),
                       MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer(null,null), MkDeclaratorIdentifier(MkIdentifier("class"))), null))));
      #endif
      ListAdd(registerModuleBody.compound.declarations, 
         MkDeclaration(MkListOne(MkSpecifierName("ecere::com::Class")),
                       MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("class")), null))));

      specifiers = MkList();
      ListAdd(specifiers, MkSpecifier(VOID));

      moduleParam = MkTypeName(MkListOne(/*MkSpecifier(VOID)*/MkSpecifierName("Module")), 
         //MkDeclaratorPointer(MkPointer(null, null), 
         MkDeclaratorIdentifier(MkIdentifier("module")));

      GetLastDirectory(outputFile, moduleName);
      //strcpy(moduleName, argv[2]);
      StripExtension(moduleName);
      FixModuleName(moduleName);
      sprintf(registerName, "__ecereRegisterModule_%s", moduleName);

      declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)),
         MkListOne(moduleParam));

      {
         FunctionDefinition function = _MkFunction(specifiers, declarator, null, false);
         ProcessFunctionBody(function, registerModuleBody);
         function.declMode = defaultAccess;
         if(!ast) ast = MkList();
         ListAdd(ast, (registerModuleExternal = MkExternalFunction(function)));
      }
   }

   // Unregister Module
   if(!unregisterModuleBody && inCompiler)
   {      
      char registerName[1024], moduleName[MAX_FILENAME];
      OldList * specifiers;
      Declarator declarator;
      TypeName moduleParam;

      unregisterModuleBody = MkCompoundStmt(MkList(), MkList());
      unregisterModuleBody.compound.context = Context { parent = globalContext };

      specifiers = MkList();
      ListAdd(specifiers, MkSpecifier(VOID));

      moduleParam = MkTypeName(MkListOne(/*MkSpecifier(VOID)*/ MkSpecifierName("Module")), 
         //MkDeclaratorPointer(MkPointer(null, null), 
         MkDeclaratorIdentifier(MkIdentifier("module")));

      GetLastDirectory(outputFile, moduleName);
      StripExtension(moduleName);
      FixModuleName(moduleName);
      //strcpy(moduleName, argv[2]);
      sprintf(registerName, "__ecereUnregisterModule_%s", moduleName);

      declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)),
         MkListOne(moduleParam));

      {
         FunctionDefinition function = _MkFunction(specifiers, declarator, null, false);
         ProcessFunctionBody(function, unregisterModuleBody);
         function.declMode = defaultAccess;
         if(!ast) ast = MkList();
         ListAdd(ast, (unregisterModuleExternal = MkExternalFunction(function)));
      }
   }
}

void RegisterMembersAndProperties(Class regClass, bool isMember, char * className, Statement statement)
{
   DataMember dataMember = isMember ? (DataMember)regClass : null;
   DataMember member;
   Property prop;
   Expression exp;
   Statement stmt;
   char dataMemberSize[16];

   uint lastOffset = 0;
   int privateID = 0;
   bool privateMembers = false;

   sprintf(dataMemberSize, "%d", (int)sizeof(DataMember));
   if(!isMember)
   {
      for(prop = regClass.conversions.first; prop; prop = prop.next)
      {
         OldList * args = MkList();
         char name[1024];

         // Class class
         ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
         // char * name
         ListAdd(args, MkExpConstant("0"));

         // char * type
         {
            char * string = QMkString(prop.dataTypeString);
            ListAdd(args, MkExpString(string));
            delete string;
         }
         // void * Set
         if(prop.Set)
         {
            strcpy(name, "__ecereProp_");
            FullClassNameCat(name, regClass.fullName, false);
            strcat(name, "_Set_");
            // strcat(name, prop.name);
            FullClassNameCat(name, prop.name, true);
            MangleClassName(name);
            ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
         }
         else
            ListAdd(args, MkExpConstant("0"));
         // void * Get
         if(prop.Get)
         {
            strcpy(name, "__ecereProp_");
            FullClassNameCat(name, regClass.fullName, false);
            strcat(name, "_Get_");
            // strcat(name, prop.name);
            FullClassNameCat(name, prop.name, true);
            MangleClassName(name);

            ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
         }
         else
            ListAdd(args, MkExpConstant("0"));


         // Declaration Mode
         switch(prop.memberAccess)
         {
            case staticAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
               break;
            case privateAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
               break;
            case publicAccess:
            default:
               ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
               break;
         }

         strcpy(name, "__ecereProp_");
         FullClassNameCat(name, regClass.fullName, false);
         strcat(name, "_");
         FullClassNameCat(name, prop.name, true);
         // strcat(name, prop.name);
         MangleClassName(name);

         stmt = MkExpressionStmt(MkListOne(
            MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=',
            MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddProperty")), args))));
         ListAdd(registerModuleBody.compound.statements, stmt);
      }
   }

   for(member = isMember ? dataMember.members.first : regClass.membersAndProperties.first; member; member = member.next)
   {
      if(member.isProperty)
      {
         prop = (Property) member;
         {
            OldList * args = MkList();
            char name[1024], nameM[1024];
            char * string = QMkString(prop.name);

            // Class class
            ListAdd(args, MkExpIdentifier(MkIdentifier(className)));

            // char * name
            ListAdd(args, MkExpString(string));
            delete string;

            // char * type
            {
               char * string = QMkString(prop.dataTypeString);
               ListAdd(args, MkExpString(string));
               delete string;
            }
            // void * Set
            if(prop.Set)
            {
               strcpy(name, "__ecereProp_");
               FullClassNameCat(name, regClass.fullName, false);
               strcat(name, "_Set_");
               FullClassNameCat(name, prop.name, true);
               // strcat(name, prop.name);
               MangleClassName(name);
               ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
            }
            else
               ListAdd(args, MkExpConstant("0"));
            // void * Get
            if(prop.Get)
            {
               strcpy(name, "__ecereProp_");
               FullClassNameCat(name, regClass.fullName, false);
               strcat(name, "_Get_");
               FullClassNameCat(name, prop.name, true);
               // strcat(name, prop.name);
               MangleClassName(name);
               ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
            }
            else
               ListAdd(args, MkExpConstant("0"));

            // Declaration Mode
            switch(prop.memberAccess)
            {
               case staticAccess:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                  break;
               case privateAccess:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                  break;
               case publicAccess:
               default:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
                  break;
            }

            strcpy(name, "__ecereProp_");
            FullClassNameCat(name, regClass.fullName, false);
            strcat(name, "_");
            FullClassNameCat(name, prop.name, true);
            // strcat(name, prop.name);
            MangleClassName(name);

            strcpy(nameM, "__ecerePropM_");
            FullClassNameCat(nameM, regClass.fullName, false);
            strcat(nameM, "_");
            FullClassNameCat(nameM, prop.name, true);
            // strcat(nameM, prop.name);
            MangleClassName(nameM);

            if(prop.dataTypeString)
            {
               stmt = MkExpressionStmt(MkListOne(
                  MkExpOp(MkExpIdentifier(MkIdentifier(nameM)), '=',
                  MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddProperty")), args))));
            }
            else
            {
               stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddProperty")), args)));
            }
            ListAdd(registerModuleBody.compound.statements, stmt);

            if(prop.IsSet)
            {
               char name[1024];
               strcpy(name, "__ecereProp_");
               FullClassNameCat(name, regClass.fullName, true);
               strcat(name, "_IsSet_");
               FullClassNameCat(name, prop.name, false);
               // strcat(name, prop.name);
               MangleClassName(name);

               stmt = MkExpressionStmt(MkListOne(
                  MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier(nameM)), MkIdentifier("IsSet")), '=',
                  MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null,null), null)), MkExpIdentifier(MkIdentifier(name))))));
               ListAdd(registerModuleBody.compound.statements, stmt);
            }
            if(prop.symbol && ((Symbol)prop.symbol).propCategory)
            {
               stmt = MkExpressionStmt(MkListOne(
                  MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier(nameM)), MkIdentifier("category")), '=',
                  CopyExpression(((Symbol)prop.symbol).propCategory))));
               ListAdd(registerModuleBody.compound.statements, stmt);
            }

            if(prop.dataTypeString)
            {
               OldList * list = MkList();
               ListAdd(list, MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', MkExpIdentifier(MkIdentifier(nameM))));
               ListAdd(list, MkExpOp(MkExpIdentifier(MkIdentifier(nameM)), '=', MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null,null), null)), MkExpConstant("0"))));
               // stmt = MkIfStmt(MkListOne(MkExpOp(null, '!', MkExpIdentifier(MkIdentifier(name)))), MkExpressionStmt(list), null);
               stmt = MkIfStmt(MkListOne(MkExpOp(
                     MkExpMember(MkExpIdentifier(MkIdentifier("module")), MkIdentifier("application")), EQ_OP, 
                     MkExpMember(MkExpIdentifier(MkIdentifier("__thisModule")), MkIdentifier("application")))), MkExpressionStmt(list), null);

               ListAdd(registerModuleBody.compound.statements, stmt);

               // Unregister 2nd property
               stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(nameM)), '=', 
                  MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null,null), null)), MkExpConstant("0")))));
               ListAdd(unregisterModuleBody.compound.statements, stmt);
            }
         }
      }
      else if(member.type == normalMember && !isMember && regClass.type == bitClass)
      {
         BitMember bitMember = (BitMember) member;
         OldList * args = MkList();

         // Class class
         ListAdd(args, MkExpIdentifier(MkIdentifier(className)));

         // char * name
         {
            char * string = QMkString(bitMember.name);
            ListAdd(args, MkExpString(string));
            delete string;
         }
         // char * type
         {
            char * string = QMkString(bitMember.dataTypeString);
            ListAdd(args, MkExpString(string));
            delete string;
         }
         // int bitSize
         {
            char string[256];
            sprintf(string, "%d", bitMember.size);
            ListAdd(args, (exp = MkExpConstant(string)));
         }
         // int bitPos
         {
            char string[256];
            sprintf(string, "%d", bitMember.pos);
            ListAdd(args, (exp = MkExpConstant(string)));
         }

         // Declaration Mode
         switch(member.memberAccess)
         {
            case staticAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
               break;
            case privateAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
               break;
            case publicAccess:
            default:
               ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
               break;
         }

         stmt = MkExpressionStmt(MkListOne(
            MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddBitMember")), args)));

         ListAdd(statement.compound.statements, stmt);
      }
      else if(member.memberAccess == publicAccess || (member.type == normalMember && !member.dataTypeString))
      {
         OldList * args;
         // ADD PRIVATE DATA PADDING HERE...
         if(privateMembers)
         {
            uint offset = member.offset - lastOffset;

            args = MkList();

            // Class class
            ListAdd(args, MkExpIdentifier(MkIdentifier(className)));

            // char * name
            {
               char string[200];
               sprintf(string, "\"__ecerePrivateData%d\"", privateID++);
               ListAdd(args, MkExpString(string));
            }
            // char * type
            {
               char string[200];
               sprintf(string, "\"byte[%d]\"", offset);
               ListAdd(args, MkExpString(string));
            }
            // int size
            {
               char string[256];
               sprintf(string, "%d", offset);
               ListAdd(args, (exp = MkExpConstant(string)));
            }

            // int alignment
            ListAdd(args, (exp = MkExpConstant("1")));

            // Declaration Mode
            ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
            
            stmt = MkExpressionStmt(MkListOne(
               MkExpCall(MkExpIdentifier(MkIdentifier(isMember ? "eMember_AddDataMember" : "eClass_AddDataMember")), args)));

            ListAdd(statement.compound.statements, stmt);
            privateMembers = false;
         }

         if(member.type == normalMember)
         {
            if(!member.dataType)
               member.dataType = ProcessTypeString(member.dataTypeString, false);

            ComputeTypeSize(member.dataType);

            args = MkList();

            // Class class
            ListAdd(args, MkExpIdentifier(MkIdentifier(className)));

            // char * name
            {
               char * string = QMkString(member.name);
               ListAdd(args, MkExpString(string));
               delete string;
            }
            // char * type
            {
               char * string = QMkString(member.dataTypeString);
               ListAdd(args, MkExpString(string));
               delete string;
            }
            // int size
            {
               char string[256];
               sprintf(string, "%d", member.dataType.size);
               ListAdd(args, (exp = MkExpConstant(string)));
            }

            // int alignment
            {
               char string[256];
               sprintf(string, "%d", member.dataType.alignment);
               ListAdd(args, (exp = MkExpConstant(string)));
            }

            // Declaration Mode
            switch(member.memberAccess)
            {
               case staticAccess:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                  break;
               case privateAccess:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                  break;
               case publicAccess:
               default:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
                  break;
            }
            
            stmt = MkExpressionStmt(MkListOne(
               MkExpCall(MkExpIdentifier(MkIdentifier(isMember ? "eMember_AddDataMember" : "eClass_AddDataMember")), args)));

            ListAdd(statement.compound.statements, stmt);

            lastOffset = member.offset + member.dataType.size;
         }
         else
         {
            static int memberCount = 0;

            Context context;
            Statement compound;
            char memberName[256];
            sprintf(memberName, "dataMember%d", memberCount);
            memberCount++;

            curContext = statement.compound.context;
            context = PushContext();
            
            args = MkListOne(MkExpIdentifier(MkIdentifier((member.type == unionMember) ? "unionMember" : "structMember")));
            
            // Declaration Mode
            switch(member.memberAccess)
            {
               case staticAccess:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                  break;
               case privateAccess:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                  break;
               case publicAccess:
               default:
                  ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
                  break;
            }
            
            compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifierName("DataMember")), 
               MkListOne(MkInitDeclarator(/*MkDeclaratorPointer(MkPointer(null, null), */MkDeclaratorIdentifier(MkIdentifier(memberName))/*)*/, 
                  MkInitializerAssignment(MkExpCall(MkExpIdentifier(MkIdentifier("eMember_New")), args)))))), MkList());
            compound.compound.context = context;
         
            args = MkList();

            // Class class / DataMember member
            ListAdd(args, MkExpIdentifier(MkIdentifier(className)));

            // DataMember dataMember
            ListAdd(args, MkExpIdentifier(MkIdentifier(memberName)));

            RegisterMembersAndProperties((Class)member, true, memberName, compound);

            if(isMember)
               stmt = MkExpressionStmt(MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("eMember_AddMember")), args)));
            else
               stmt = MkExpressionStmt(MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddMember")), args)));

            ListAdd(compound.compound.statements, stmt);

            PopContext(context);

            ListAdd(statement.compound.statements, compound);

            memberCount--;

            lastOffset = member.offset + member.memberOffset;
         }
      }
      else
         privateMembers = true;
   }

   if(!isMember)
   {
      ClassProperty classProperty;

      // Watchable properties
      for(prop = regClass.membersAndProperties.first; prop; prop = prop.next)
      {
         if(prop.isProperty && prop.isWatchable)
         {
            OldList * args;
            char name[1024], nameM[1024];

            strcpy(name, "__ecereProp_");
            FullClassNameCat(name, regClass.fullName, true);
            strcat(name, "_");
            FullClassNameCat(name, prop.name, false);
            // strcat(name, prop.name);
            MangleClassName(name);

            strcpy(nameM, "__ecerePropM_");
            FullClassNameCat(nameM, regClass.fullName, true);
            strcat(nameM, "_");
            FullClassNameCat(nameM, prop.name, false);
            // strcat(nameM, prop.name);
            MangleClassName(nameM);

            args = MkListOne(MkExpCondition(MkExpIdentifier(MkIdentifier(nameM)), MkListOne(MkExpIdentifier(MkIdentifier(nameM))), MkExpIdentifier(MkIdentifier(name))));
            stmt = MkExpressionStmt(MkListOne(
               MkExpCall(MkExpIdentifier(MkIdentifier("eProperty_Watchable")), args)));
            ListAdd(registerModuleBody.compound.statements, stmt);
         }
      }

      // Add Class Properties
      for(classProperty = (ClassProperty)regClass.classProperties.first; classProperty; classProperty = (ClassProperty)((BTNode)classProperty).next)
      {
         OldList * args = MkList();
         char name[1024];
         char * string = QMkString(classProperty.name);

         // Class * class
         ListAdd(args, MkExpIdentifier(MkIdentifier(className)));

         // char * name
         ListAdd(args, MkExpString(string));
         delete string;

         // char * type
         {
            char * string = QMkString(classProperty.dataTypeString);
            ListAdd(args, MkExpString(string));
            delete string;
         }
         // void * Set
         if(classProperty.Set)
         {
            strcpy(name, "__ecereClassProp_");
            FullClassNameCat(name, regClass.fullName, true);
            strcat(name, "_Set_");
            strcat(name, classProperty.name);
            MangleClassName(name);
            ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
         }
         else
            ListAdd(args, MkExpConstant("0"));
         // void * Get
         if(classProperty.Get)
         {
            strcpy(name, "__ecereClassProp_");
            FullClassNameCat(name, regClass.fullName, true);
            strcat(name, "_Get_");
            strcat(name, classProperty.name);
            MangleClassName(name);

            ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
         }
         else
            ListAdd(args, MkExpConstant("0"));

         stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddClassProperty")), args)));
         ListAdd(registerModuleBody.compound.statements, stmt);
      }
   }
}

extern External curExternal;

void GetNameSpaceString(NameSpace ns, char * string)
{
   if(ns.parent)
      GetNameSpaceString(ns.parent, string);
   if(ns.name)
   {
      strcat(string, ns.name);
      strcat(string, "::");
   }
}

// *******************************************************************
static void ProcessClass(ClassType classType, OldList definitions, Symbol symbol, OldList baseSpecs, OldList enumValues, OldList defs, External external, AccessMode declMode)
{
   ClassDef def;
   Class regClass = symbol.registered;
   
   if(regClass)
   {
      classType = regClass.type;
      if(classType == enumClass && enumValues && (inCompiler || !buildingECERECOMModule))
      {
         Enumerator e;
         for(e = enumValues.first; e; e = e.next)
         {
            if(e.exp)
            {
               Type destType
               {
                  kind = intType;
                  refCount = 1;
               };
               e.exp.destType = destType;
            
               // Set parsingType to avoid producing errors
               parsingType = true;
               ProcessExpressionType(e.exp);
               parsingType = false;

               if(!e.exp.expType)
               {
                  destType.kind = TypeKind::classType;
                  destType._class = symbol;
                  ProcessExpressionType(e.exp);
               }
               ComputeExpression(e.exp);
               if(e.exp.isConstant && /*e.exp.expType.kind == intType*/ e.exp.type == constantExp)
               {
                  Operand op = GetOperand(e.exp);
                  int value;
                  // TODO: 64 BIT ENUM SUPPORT...
                  switch(op.kind)
                  {
                     case charType: value = op.c; break;
                     case shortType: value = op.s; break;
                     default: value = op.i;
                  }

                  // value = op.i; //strtol(e.exp.string, null, 0);
                  eEnum_AddFixedValue(regClass, e.id.string, value);
               }
               else
                  // Sort of an error
                  eEnum_AddValue(regClass, e.id.string);                        
            }
            else
               eEnum_AddValue(regClass, e.id.string);
         }
      }

      // Process all functions
      if(definitions != null)
      {
         if(inCompiler)
         {
            for(def = definitions.first; def; def = def.next)
            {
               if(def.type == propertyWatchClassDef && def.propertyWatch)
               {
                  PropertyWatch propWatch = def.propertyWatch;
                  ClassFunction func;
                  char watcherName[1024];
                  Identifier propID;
                  Statement stmt = MkExpressionStmt(MkList());
                  Declarator decl;

                  sprintf(watcherName,"__ecerePropertySelfWatcher_%d", propWatcherID++);
                  for(propID = propWatch.properties->first; propID; propID = propID.next)
                  {
                     strcat(watcherName, "_");
                     strcat(watcherName, propID.string);
                  }

                  // TESTING THIS STUFF... BEWARE OF SYMBOL ID ISSUES
                  decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)), MkListOne(MkTypeName(MkListOne(MkSpecifier(VOID)), null)));
                  func = MkClassFunction(MkListOne(MkSpecifier(VOID)), null, decl, null);
                  ProcessClassFunctionBody(func, propWatch.compound);

                  // TESTING WITH SAME SYMBOL ID AS CLASS
                  decl.symbol = Symbol
                  {
                     id = symbol.id;
                     idCode = symbol.idCode;
                  };
                  excludedSymbols->Add(decl.symbol);

                  func.id = symbol.id;
                  func.idCode = symbol.idCode;
                  func.dontMangle = true;

                  // Create a declaration above for constructor to see
                  {
                     External externalDecl = MkExternalDeclaration(null);
                     Declaration decl;
                     OldList * specifiers = MkList();
                     ListAdd(specifiers, MkSpecifier(STATIC));
                     ListAdd(specifiers, MkSpecifier(VOID));

                     ast->Insert(curExternal.prev, externalDecl);
               
                     decl = MkDeclaration(specifiers, 
                        MkListOne(MkInitDeclarator(MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)), 
                           MkListOne(MkTypeName(MkListOne(MkSpecifierName(regClass.fullName)), null))), null)));
                     externalDecl.declaration = decl;
                     if(decl.symbol && !decl.symbol.methodExternal)
                     {
                        decl.symbol.methodExternal = externalDecl;

                        // PATCHED THIS, 2 SYMBOLS WERE THERE.. THIS ONE HAD AN ID TOO BIG
                        decl.symbol.id = symbol.id;
                        decl.symbol.idCode = symbol.idCode;
                     }
                  }
            
                  propWatch.compound = null;
                  definitions.Insert(null, MkClassDefFunction(func));

                  stmt.type = expressionStmt;
                  stmt.expressions = MkList();

                  for(propID = propWatch.properties->first; propID; propID = propID.next)
                  {
                     Property prop = eClass_FindProperty(regClass, propID.string, privateModule);
                     if(prop)
                     {
                        // eProperty_SelfWatch(_class, name, callback);
                        OldList * args = MkList();
                        ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
                        ListAdd(args, MkExpString(QMkString(propID.string)));
                        ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));

                        ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("eProperty_SelfWatch")), args));
                     }
                     else
                        Compiler_Error($"Property %s not found in class %s\n", propID.string, regClass.fullName);
                  }
                  FreePropertyWatch(def.propertyWatch);
                  def.propertyWatch = (PropertyWatch)stmt; // Store this here to use it after CreateRegisterModuleBody is done

                  // ListAdd(statements, stmt);
               }
            }
         }

         for(def = definitions.first; def; def = def.next)
         {
            if(def.type == functionClassDef)
            {
               ProcessClassFunction(regClass, def.function, defs, external.prev, declMode == staticAccess);
            }
         }
      }

      // Make the RegisterClass section

      if(inCompiler && symbol.id != MAXINT && regClass)
      {
         Statement stmt;
         OldList * args = MkList();
         Method method;
         Expression exp;
         char * registerFunction = null;
         AccessMode inheritanceAccess = publicAccess;

         CreateRegisterModuleBody();

         curExternal = registerModuleExternal;

          // Class Type
         switch(regClass.type)
         {
            case structClass: ListAdd(args, MkExpIdentifier(MkIdentifier("structClass"))); break;
            case bitClass:    ListAdd(args, MkExpIdentifier(MkIdentifier("bitClass"))); break;
            case enumClass:   ListAdd(args, MkExpIdentifier(MkIdentifier("enumClass"))); break;
            case noHeadClass: ListAdd(args, MkExpIdentifier(MkIdentifier("noHeadClass"))); break;
            case unitClass:   ListAdd(args, MkExpIdentifier(MkIdentifier("unitClass"))); break;
            case normalClass: ListAdd(args, MkExpIdentifier(MkIdentifier("normalClass"))); break;
         }

         {
            char nameSpace[1024] = "";
            char className[1024] = "";
            char * string;
            GetNameSpaceString(regClass.nameSpace, nameSpace);

            if(declMode == staticAccess)
            {
               GetLastDirectory(sourceFile, className);
               ChangeCh(className, '.', '_');
               strcat(className, "}");
            }
            strcat(className, nameSpace);
            strcat(className, regClass.name);
            string = QMkString(className);
            ListAdd(args, MkExpString(string));
            delete string;
         }

         /*
         {
            char * string = QMkString(regClass.base.name);
            ListAdd(args, regClass.base ? MkExpString(string) :
               MkExpConstant("0"));
            delete string;
         }
         */

         if(baseSpecs != null)
         {
            Type baseType = ProcessType(baseSpecs, null);
            if(baseType.kind != structType && baseType.kind != unionType)
            {
               char baseName[1024] = "";
               char * string;
               if(baseType.kind == TypeKind::classType && baseType._class && baseType._class.isStatic)
               {
                  // TODO: Handle static classes and complex declarators...
                  GetLastDirectory(sourceFile, baseName);
                  ChangeCh(baseName, '.', '_');
                  strcat(baseName, "}");
                  strcat(baseName, baseType._class.string);
               }
               else
                  PrintType(baseType, baseName, false, true);

               string = QMkString(baseName);
               ListAdd(args, MkExpString(string));
               delete string;
            }
            else
               ListAdd(args, MkExpConstant("0"));
            FreeType(baseType);
            if(((Specifier)baseSpecs.first).type == baseSpecifier && ((Specifier)baseSpecs.first).specifier == PRIVATE)
               inheritanceAccess = privateAccess;
         }
         else
            ListAdd(args, MkExpConstant("0"));

         //ListAdd(args, class.declaredStruct ? MkExpTypeSize(MkTypeName(MkListOne(
            //MkSpecifierName(class.structName)), null)) : MkExpConstant("0"));
      
         if(regClass.type == structClass || regClass.type == normalClass || regClass.type == noHeadClass)
         {
            // Check if we have a data member in this class
            DataMember member = null;
            {
               Class base;
               for(base = regClass.base; base && base.type != systemClass; base = base.next)
               {
                  for(member = base.membersAndProperties.first; member; member = member.next)
                     if(!member.isProperty)
                        break;
                  if(member)
                     break;
               }
            }

            if(regClass.type == structClass && symbol.declaredStruct && member)
            {
               char baseStructName[1024];
               baseStructName[0] = 0;
               // TESTING THIS HERE
               // FullClassNameCat(baseStructName, regClass.base.fullName, false);
               strcpy(baseStructName, (regClass.base.templateClass ? regClass.base.templateClass : regClass.base).fullName);

               ListAdd(args, MkExpOp(
                  MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(symbol.structName), null)), null)), '-',
                  MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(baseStructName), null)), null))));
            }
            else
               ListAdd(args, symbol.declaredStruct ? MkExpTypeSize(MkTypeName(MkListOne(
                  MkStructOrUnion(structSpecifier, MkIdentifier(symbol.structName), null)), null)) : MkExpConstant("0"));
         }
         else
         {
            ListAdd(args, MkExpConstant("0"));
         }

         //if(regClass.type == normalClass)
         {
            char classDataStructName[1024];
            strcpy(classDataStructName, "__ecereClassData_");
            FullClassNameCat(classDataStructName, symbol.string, false);

            ListAdd(args, symbol.classData ? MkExpTypeSize(MkTypeName(MkListOne(
               MkStructOrUnion(structSpecifier, MkIdentifier(classDataStructName), null)), null)) : MkExpConstant("0"));
         }
         /*else
            // TODO: Support Class Data for all other types of classes
            ListAdd(args, MkExpConstant("0"));
            */

         if(regClass.type == normalClass || regClass.type == noHeadClass)
         {
            // Constructor
            ListAdd(args, symbol.needConstructor ? 
               MkExpIdentifier(MkIdentifier(symbol.constructorName)) :
               MkExpConstant("0"));
            // Destructor
            ListAdd(args, symbol.needDestructor ? 
               MkExpIdentifier(MkIdentifier(symbol.destructorName)) :
               MkExpConstant("0"));
         }
         else
         {
            // TODO: Support Constructors / Destructors for structs

            // Constructor
            ListAdd(args, MkExpConstant("0"));
            // Destructor
            ListAdd(args, MkExpConstant("0"));
         }

         // Module
         ListAdd(args, MkExpIdentifier(MkIdentifier("module")));

         // Declaration Mode
         switch(declMode)
         {
            case staticAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
               break;
            case privateAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
               break;
            case publicAccess:
            default:
               ListAdd(args, MkExpIdentifier(MkIdentifier(buildingECERECOMModule ? "baseSystemAccess" : "publicAccess")));
               break;
         }
         
         // Declaration Mode
         switch(inheritanceAccess)
         {
            case privateAccess:
               ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
               break;
            case publicAccess:
            default:
               ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
               break;
         }

         registerFunction = "eSystem_RegisterClass";

         stmt = MkExpressionStmt(MkListOne(
            MkExpOp(MkExpIdentifier(MkIdentifier("class")), '=',
            MkExpCall((exp = MkExpIdentifier(MkIdentifier(registerFunction))), args))));

         ListAdd(registerModuleBody.compound.statements, stmt);

         /*
         stmt = MkIfStmt(MkListOne(MkExpOp(null, '!', MkExpIdentifier(MkIdentifier(symbol.className)))),
               MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(symbol.className)), '=',
            MkExpIdentifier(MkIdentifier("class"))))), null);
         */

         stmt = MkIfStmt(MkListOne(
                  MkExpOp(MkExpOp(
                     MkExpMember(MkExpIdentifier(MkIdentifier("module")), MkIdentifier("application")), EQ_OP, 
                     MkExpMember(MkExpIdentifier(MkIdentifier("__thisModule")), MkIdentifier("application"))), AND_OP, MkExpIdentifier(MkIdentifier("class")))),
               MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(symbol.className)), '=',
            MkExpIdentifier(MkIdentifier("class"))))), null);
         /*
         stmt = MkIfStmt(MkListOne(
                  MkExpOp(MkExpOp(null, '!', MkExpIdentifier(MkIdentifier(symbol.className))), AND_OP, MkExpIdentifier(MkIdentifier("class")))),
               MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(symbol.className)), '=',
            MkExpIdentifier(MkIdentifier("class"))))), null);
         */

         ListAdd(registerModuleBody.compound.statements, stmt);

         if(external && external.type == classExternal && external._class.deleteWatchable)
         {
            args = MkListOne(MkExpIdentifier(MkIdentifier("class")));
            stmt = MkExpressionStmt(MkListOne(
               MkExpCall(MkExpIdentifier(MkIdentifier("eClass_DestructionWatchable")), args)));
            ListAdd(registerModuleBody.compound.statements, stmt);
         }

         // Add Virtual Methods
         if(regClass.base)
         {
            Class base = regClass.base;
            int c;
            for(c = 0; c<base.vTblSize; c++)
            {
               Symbol method = (Symbol)regClass._vTbl[c];
               if((void *) method != DummyMethod && base._vTbl[c] != (void *)method ) // TOLOOKAT: Module check here?
               {
                  External external = method.methodExternal;
                  OldList * args = MkList();
                  Identifier id = external.function ? GetDeclId(external.function.declarator) : null;
               
                  // Class class
                  ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
                  // char * name
                  {
                     //char * string = QMkString(method.string);

                     char * string = QMkString(method.method.name);
                     ListAdd(args, MkExpString(string));
                     delete string;
                  }
                  // char * type
                  ListAdd(args, MkExpConstant("0"));
                  // void * function
                  ListAdd(args, (exp = MkExpIdentifier(MkIdentifier(
                     id.string))));

                  // Declaration Mode
                  ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));

                  exp.expType = Type { refCount = 1 };
                  stmt = MkExpressionStmt(MkListOne(
                     MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddMethod")), args)));
                  ListAdd(registerModuleBody.compound.statements, stmt);
               }
            }
         }

         // Add Virtual Methods in order
         {
            int c;
            for(c = regClass.base ? regClass.base.vTblSize : 0; c < regClass.vTblSize; c++)
            {
               for(method = (Method)regClass.methods.first; method; method = (Method)((BTNode)method).next)
               {
                  if(method.type == virtualMethod && method._class == regClass && method.vid == c)
                  {
                     char name[1024];
                     Expression exp;

                     //External external = method->symbol ? ((Symbol)method.symbol).methodExternal : null;
                     External external = method.symbol ? ((Symbol)method.symbol).methodCodeExternal : null;
                     OldList * args = MkList();
                     Identifier id = (external && external.function) ? GetDeclId(external.function.declarator) : null;

                     // Class * class
                     ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
                     // char * name
                     {
                        char * string = QMkString(method.name);
                        ListAdd(args, MkExpString(string));
                        delete string;
                     }
                     // char * type
                     {
                        char * string = QMkString(method.dataTypeString);
                        ListAdd(args, MkExpString(string));
                        delete string;
                     }
                     // void * function
                     if(id && external.function.body)
                     {
                        ListAdd(args, (exp = MkExpIdentifier(MkIdentifier(id.string))));
                        exp.expType = Type { refCount = 1 };
                     }
                     else
                     {
                        ListAdd(args, (exp = MkExpConstant("0")));
                     }

                     // Declaration Mode
                     switch(method.memberAccess)
                     {
                        case staticAccess:
                           ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                           break;
                        case privateAccess:
                           ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                           break;
                        case publicAccess:
                        default:
                           ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
                           break;
                     }

                     //sprintf(name, "__ecereVMethodID_%s_%s", method._class.fullName, method.name);
                     strcpy(name, "__ecereVMethodID_");
                     FullClassNameCat(name, method._class.fullName, false);
                     strcat(name, "_");
                     strcat(name, method.name);

                     exp = /*MkExpPointer(*/MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddVirtualMethod")), args)/*, MkIdentifier("vid"))*/;
                     /*
                     exp->expType = eSystem_New(sizeof(Type));
                     exp->expType->refCount++;
                     exp->expType->isSigned = true;
                     exp->expType->kind = TypeInt;
                     */

                     stmt = MkExpressionStmt(MkListOne(/*
                        MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', */exp/*)*/));

                     DeclareMethod(method, name);

                     ListAdd(registerModuleBody.compound.statements, stmt);
                  }
               }
            }
         }


         // Add Public Methods (all for now)
         for(method = (Method)regClass.methods.first; method; method = (Method)((BTNode)method).next)
         {
            if(method.type == virtualMethod && method._class == regClass);
            else if(method.memberAccess == publicAccess || !method.dataTypeString)
            {
               //External external = method.symbol ? ((Symbol )method.symbol).methodExternal : null;
               External external = method.symbol ? ((Symbol )method.symbol).methodCodeExternal : null;
               OldList * args = MkList();
               Identifier id = (external && external.function) ? GetDeclId(external.function.declarator) : null;

               // Class class
               ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
               // char * name
               {
                  char * string = QMkString(method.name);
                  ListAdd(args, MkExpString(string));
                  delete string;
               }
               // char * type
               {
                  char * string = QMkString(method.dataTypeString);
                  ListAdd(args, MkExpString(string));
                  delete string;
               }
               // void * function
               if(id && external.function.body)
               {
                  ListAdd(args, (exp = MkExpIdentifier(MkIdentifier(
                     id.string))));
                  exp.expType = Type { refCount = 1 };
               }
               else
               {
                  ListAdd(args, (exp = MkExpConstant("0")));
               }

               // Declaration Mode
               switch(method.memberAccess)
               {
                  case staticAccess:
                     ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                     break;
                  case privateAccess:
                     ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                     break;
                  case publicAccess:
                  default:
                     ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
                     break;
               }

               stmt = MkExpressionStmt(MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddMethod")), args)));
               ListAdd(registerModuleBody.compound.statements, stmt);
            }
         }

         RegisterMembersAndProperties(regClass, false, "class", registerModuleBody);

         // Add Enumeration Values
         if(classType == enumClass)
         {
            NamedLink value;
            Class enumClass = eSystem_FindClass(privateModule, "enum");
            EnumClassData e = ACCESS_CLASSDATA(regClass, enumClass);

            for(value = e.values.first; value; value = value.next)
            {
               OldList * args = MkList();

               // Class class
               ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
               // char * name
               {
                  char * string = QMkString(value.name);
                  ListAdd(args, MkExpString(string));
                  delete string;
               }
               // uint value
               {
                  char temp[1024];
                  // TODO: Support 64 bit enums
                  sprintf(temp, "%d", (int)value.data);
                  ListAdd(args, MkExpConstant(temp));
               }

               stmt = MkExpressionStmt(MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("eEnum_AddFixedValue")), args)));
               ListAdd(registerModuleBody.compound.statements, stmt);
            }
         }

         // Add Template Parameters
         if(symbol.templateParams)
         {
            TemplateParameter param;
            for(param = symbol.templateParams->first; param; param = param.next)
            {
               OldList * args = MkList();

               // Class
               ListAdd(args, MkExpIdentifier(MkIdentifier("class")));

               // Name
               {
                  char * string = QMkString(param.identifier.string);
                  ListAdd(args, MkExpString(string));
                  delete string;
               }

               // Type
               ListAdd(args, MkExpIdentifier(MkIdentifier((param.type == type) ? "type" : ((param.type == identifier) ? "identifier" : "expression"))));

               // Parameter
               switch(param.type)
               {
                  case type:
                  case expression:
                  {
                     char * typeString = param.dataType ? StringFromSpecDecl(param.dataType.specifiers, param.dataType.decl) : null;
                     char * string = QMkString(typeString);
                     ListAdd(args, MkExpString(string));
                     delete typeString;
                     delete string;
                     break;
                  }
                  case identifier:
                  {
                     char memberTypeString[132] = "TemplateMemberType::";
                     bool needClass = true;
                     
                     param.memberType.OnGetString(memberTypeString + strlen(memberTypeString), null, &needClass);
                     ListAdd(args, 
                        MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, null), null)), 
                           MkExpIdentifier(MkIdentifier(memberTypeString))));
                     break;
                  }
               }

               // Default Argument
               if(param.defaultArgument)
               {
                  OldList * members = MkList();
                  switch(param.type)
                  {
                     case type:
                     {
                        char * typeString = param.defaultArgument.templateDatatype ? 
                           StringFromSpecDecl(param.defaultArgument.templateDatatype.specifiers, param.defaultArgument.templateDatatype.decl) : null;
                        char * string = QMkString(typeString);

                        members->Add(MkMemberInit(MkListOne(MkIdentifier("dataTypeString")), MkInitializerAssignment(MkExpString(string))));

                        delete typeString;
                        delete string;
                        break;
                     }
                     case identifier:
                     {
                        char memberString[1024];
                        char * string;
                        memberString[0] = '\0';

                        if(param.defaultArgument.identifier._class)
                        {
                           if(param.defaultArgument.identifier._class.type == templateTypeSpecifier)
                              strcpy(memberString, param.defaultArgument.identifier._class.templateParameter.identifier.string);
                           else if(param.defaultArgument.identifier._class.name)
                              strcpy(memberString, param.defaultArgument.identifier._class.name);
                        }
                        if(memberString[0])
                           strcat(memberString, "::");

                        strcat(memberString, param.defaultArgument.identifier.string);

                        string = QMkString(memberString);

                        // TOFIX: UNIONS ARE BROKEN FOR ASSIGNMENTS, USING dataTypeString INSTEAD
                        // members->Add(MkMemberInit(MkListOne(MkIdentifier("memberString")), MkInitializerAssignment(MkExpString(string))));
                        members->Add(MkMemberInit(MkListOne(MkIdentifier("dataTypeString")), MkInitializerAssignment(MkExpString(string))));                        

                        delete string;
                        break;
                     }
                     case expression:
                     {
                        Operand op { };
                        OldList * ids = MkList();
                        char * ui64String;
                        char * string = null;

                        //ProcessExpressionType(param.defaultArgument.expression);
                        //ComputeExpression(param.defaultArgument.expression);

                        op = GetOperand(param.defaultArgument.expression);
                        ui64String = PrintUInt64(op.ui64);
                        ids->Add(MkIdentifier("expression"));
                        ids->Add(MkIdentifier("ui64"));

                        //string = QMkString(ui64String);
                        members->Add(MkMemberInit(ids, MkInitializerAssignment(MkExpConstant(ui64String))));
                        
                        delete string;
                        delete ui64String;
                        break;
                     }
                  }
                  ListAdd(args, MkExpInstance(MkInstantiation(MkSpecifierName("ClassTemplateArgument"), null,
                     MkListOne(MkMembersInitList(members)))));
               }
               else
                  ListAdd(args, MkExpIdentifier(MkIdentifier("null")));

               stmt = MkExpressionStmt(MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddTemplateParameter")), args)));
               ListAdd(registerModuleBody.compound.statements, stmt);
            }
            stmt = MkExpressionStmt(MkListOne(
               MkExpCall(MkExpIdentifier(MkIdentifier("eClass_DoneAddingTemplateParameters")), 
                  MkListOne(MkExpIdentifier(MkIdentifier("class"))))));
            ListAdd(registerModuleBody.compound.statements, stmt);
         }

         if(definitions != null)
         {
            for(def = definitions.first; def; def = def.next)
            {
               if(def.type == propertyWatchClassDef && def.propertyWatch)
               {
                  ListAdd(registerModuleBody.compound.statements, (Statement)def.propertyWatch);
                  def.propertyWatch = null;
               }
               else if(def.type == classDesignerClassDef)
               {
                  /*
                  char className[1024];
                  sprintf(className, "__ecereClass_%s", def.designer);
                  MangleClassName(className);

                  DeclareClass(FindClass(def.designer), className);
                  */

                  stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(
                     MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("designerClass")), '=',
                        MkExpString(QMkString(def.designer))))), null);
                  ListAdd(registerModuleBody.compound.statements, stmt);
               }
               else if(def.type == classNoExpansionClassDef)
               {
                  stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(
                     MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("noExpansion")), '=',
                        MkExpConstant("1")))), null);
                  ListAdd(registerModuleBody.compound.statements, stmt);
               }
               else if(def.type == classFixedClassDef)
               {
                  stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(
                     MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("fixed")), '=',
                        MkExpConstant("1")))), null);
                  ListAdd(registerModuleBody.compound.statements, stmt);
                  if(regClass)
                     regClass.fixed = true;
               }
               else if(def.type == designerDefaultPropertyClassDef)
               {
                  stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(
                     MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("defaultProperty")), '=',
                        MkExpString(QMkString(def.defaultProperty.string))))), null);
                  ListAdd(registerModuleBody.compound.statements, stmt);
               }
               else if(def.type == classPropertyValueClassDef)
               {
                  OldList * args = MkList();
                  ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
                  ListAdd(args, MkExpString(QMkString(def.id.string)));
                  ListAdd(args, MkExpCast(MkTypeName(MkListOne(MkSpecifier(INT64)), null), def.initializer.exp));

                  def.initializer.exp = null;

                  stmt = MkExpressionStmt(MkListOne(
                     MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eClass_SetProperty")), args)));

                  ListAdd(registerModuleBody.compound.statements, stmt);
               }
            }
         }
      }
   }
}

public void ProcessClassDefinitions()
{
   External external, next;

   CreateRegisterModuleBody();
   if(ast)
   {
      // (Need to do those things after in case something is not yet defined)
      for(external = ast->first; external; external = next)
      {
         next = external.next;
         curExternal = external;
         if(external.type == classExternal)
         {
            ClassDefinition _class = external._class;
            if(_class.definitions)
            {
               ProcessClass(normalClass, _class.definitions, _class.symbol, _class.baseSpecs, null, ast, external, _class.declMode);
            }
            if(inCompiler)
            {
               ast->Remove(external);
               FreeExternal(external);
            }
         }
         else if(external.type == functionExternal)
         {
            bool setStaticMethod = false;
            // Mark
            if(external.symbol && !external.symbol.type.thisClass && !external.symbol.type.staticMethod)
            {
               // TOCHECK: Where do we actually need this to be set?
               external.symbol.type.staticMethod = true;
               setStaticMethod = true;
            }

            if(inCompiler)
            {
               FunctionDefinition function = external.function;
               Statement stmt;
               OldList * args;

               if(!strcmp(function.declarator.symbol.string, "__on_register_module"))
               {
                  ListAdd(registerModuleBody.compound.statements, function.body);
                  function.body.compound.context.parent = registerModuleBody.compound.context;
                  ast->Remove(external);
                  function.body = null;
                  FreeExternal(external);
                  continue;
               }

               if(function.declMode != privateAccess && function.declMode != publicAccess) continue;

               args = MkList();

               CreateRegisterModuleBody();

               // Identifier
               {
                  char * string = QMkString(function.declarator.symbol.string);
                  ListAdd(args, MkExpString(string));
                  delete string;
               }

               // Type
               {
                  char * string;
                  char type[1024] = "";
                  // We don't want functions to be marked as static methods
                  if(setStaticMethod)
                     function.declarator.symbol.type.staticMethod = false;
                  PrintType(function.declarator.symbol.type, type, true, true);
                  if(setStaticMethod)
                     function.declarator.symbol.type.staticMethod = true;
                  string = QMkString(type);
                  ListAdd(args, MkExpString(string));
                  delete string;
               }

               // Function
               {
                  ListAdd(args, MkExpIdentifier(MkIdentifier(function.declarator.symbol.string)));
               }

               // Module
               ListAdd(args, MkExpIdentifier(MkIdentifier("module")));

               // Declaration Mode
               switch(function.declMode)
               {
                  case staticAccess:
                     ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                     break;
                  case privateAccess:
                     ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                     break;
                  case publicAccess:
                  default:
                     ListAdd(args, MkExpIdentifier(MkIdentifier(buildingECERECOMModule ? "baseSystemAccess" : "publicAccess")));
                     break;
               }

               stmt = MkExpressionStmt(MkListOne(
                  MkExpCall((MkExpIdentifier(MkIdentifier("eSystem_RegisterFunction"))), args)));

               ListAdd(registerModuleBody.compound.statements, stmt);
            }
         }
         else if(external.type == declarationExternal)
         {
            Declaration declaration = external.declaration;

            if(external.symbol)
            {
               if(external.symbol.type && external.symbol.type.kind == functionType && !external.symbol.type.thisClass)
                  external.symbol.type.staticMethod = true;
            }

            if(external.symbol && declaration.type == initDeclaration)
            {
               if(declaration.specifiers)
               {
                  Specifier specifier;
                  bool removeExternal = false;
               
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
                           else 
                              classType = structClass;

                           removeExternal = true;
                           // Transfer Context over to Symbol
                           symbol.ctx = specifier.ctx;
                           specifier.ctx = null;

                           ProcessClass(classType, specifier.definitions, symbol, specifier.baseSpecs, specifier.list,ast, external, declaration.declMode);
                        }
                     }
                  }               
                  if(inCompiler && removeExternal)
                  {
                     ast->Remove(external);
                     FreeExternal(external);
                  }
               }
            }
            else if(declaration.type == defineDeclaration)
            {
               if(inCompiler && declaration.declMode != staticAccess)
               {
                  Statement stmt;
                  OldList * args = MkList();

                  CreateRegisterModuleBody();

                  // Identifier
                  {
                     char * string = QMkString(declaration.id.string);
                     ListAdd(args, MkExpString(string));
                     delete string;
                  }

                  // Expression
                  {
                     char * string;
                     char type[1024] = "";
                     PrintExpression(declaration.exp, type);
                     string = QMkString(type);
                     ListAdd(args, MkExpString(string));
                     delete string;
                  }

                  // Module
                  ListAdd(args, MkExpIdentifier(MkIdentifier("module")));

                  // Declaration Mode
                  switch(declaration.declMode)
                  {
                     case staticAccess:
                        ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
                        break;
                     case privateAccess:
                        ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
                        break;
                     case publicAccess:
                     default:
                        ListAdd(args, MkExpIdentifier(MkIdentifier(buildingECERECOMModule ? "baseSystemAccess" : "publicAccess")));
                        break;
                  }

                  stmt = MkExpressionStmt(MkListOne(
                     MkExpCall((MkExpIdentifier(MkIdentifier("eSystem_RegisterDefine"))), args)));

                  ListAdd(registerModuleBody.compound.statements, stmt);
               }
            }
         }
      }
   }
}
