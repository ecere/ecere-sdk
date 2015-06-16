import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

extern External curExternal;

public void FullClassNameCat(char * output, const char * className, bool includeTemplateParams)
{
   int c;
   char ch;
   int len;
   /*
   if(!strchr(className, ':'))
   {
      output[len++] = '_';
      output[len++] = '_';
   }
   */
   //if(strchr(className, ':'))
   for(c = 0; (ch = className[c]) && ch != '<'; c++)
   {
      if(ch == ':')
      {
         strcat(output, "__ecereNameSpace__");
         break;
      }
   }

   len = strlen(output);

   c = 0;
   if(!strncmp(className, "const ", 6)) c += 6;

   for(; (ch = className[c]); c++)
   {
      if(ch == ':')
         output[len++] = '_';
      else if(ch == ' ')
         output[len++] = '_';
      else if(ch == '*')
      {
         output[len++] = '_';
         output[len++] = 'P';
         output[len++] = 'T';
         output[len++] = 'R';
         output[len++] = '_';
      }
      else if(ch == '=')
      {
         output[len++] = '_';
         output[len++] = 'E';
         output[len++] = 'Q';
         output[len++] = 'U';
         output[len++] = '_';
      }
      else if(ch == '<')
      {
         if(!includeTemplateParams) break;
         if(!strncmp(className + c + 1, "const ", 6)) c += 6;
         output[len++] = '_';
         output[len++] = 'T';
         output[len++] = 'P';
         output[len++] = 'L';
         output[len++] = '_';
      }
      else if(ch == '>')
      {
         output[len++] = '_';
      }
      else if(ch == ',')
      {
         if(!strncmp(className + c + 1, "const ", 6)) c += 6;
         output[len++] = '_';
      }
      else
         output[len++] = ch;
   }
   output[len++] = 0;
}

static void AddSimpleBaseMembers(External external, OldList list, Class _class, Class topClass)
{
   if(_class.type != systemClass)
      AddMembers(external, list, _class, false, null, topClass, null);
}

static bool NameSpaceContained(NameSpace * ns, NameSpace * parent)
{
   if(ns == parent)
      return true;
   else if(ns->parent)
      return NameSpaceContained(ns->parent, parent);
   else
      return false;
}

static void CheckPublicClass(Symbol classSym, AccessMode access, const char * word)
{
   Class regClass = classSym ? classSym.registered : null;
   if(regClass)
   {
      if(regClass.templateClass)
         regClass = regClass.templateClass;
      // TODO: Will need to add checks for template parameter classes
      if(classSym.isStatic && access != staticAccess)
      {
         Compiler_Error($"Non-static %s making use of a static class\n", word);
      }
      else if(access == publicAccess)
      {
         if(!NameSpaceContained(regClass.nameSpace, regClass.module.application.systemNameSpace))
         {
            if(NameSpaceContained(regClass.nameSpace, regClass.module.privateNameSpace) || !ModuleAccess(privateModule, regClass.module))
               Compiler_Error($"Public %s making use of a private class\n", word);
         }
      }
   }
}

static void CheckPublicTypeName(TypeName type, AccessMode access)
{
   if(type.qualifiers)
   {
      Specifier spec;
      for(spec = type.qualifiers->first; spec; spec = spec.next)
      {
         // Only check for classes here...
         // Skip structs etc. for now
         if(spec.type == nameSpecifier)
         {
            Symbol classSym = spec.symbol; // FindClass(spec.name);
            CheckPublicClass(classSym, access, "define");
         }
      }
   }
}

static void CheckPublicInitializer(Initializer init, AccessMode access)
{
   switch(init.type)
   {
      case expInitializer:
         CheckPublicExpression(init.exp, access);
         break;
      case listInitializer:
      {
         Initializer i;
         for(i = init.list->first; i; i = i.next)
            CheckPublicInitializer(i, access);
         break;
      }
   }
}

static void CheckPublicExpression(Expression exp, AccessMode access)
{
   if(exp)
   {
      switch(exp.type)
      {
         case identifierExp:
            break;
         case constantExp:
            break;
         case stringExp:
            break;
         case opExp:
            if(exp.op.exp1)
               CheckPublicExpression(exp.op.exp1, access);
            if(exp.op.exp2)
               CheckPublicExpression(exp.op.exp2, access);
            break;
         case bracketsExp:
         {
            Expression e;
            for(e = exp.list->first; e; e = e.next)
               CheckPublicExpression(e, access);
            break;
         }
         case indexExp:
         {
            Expression e;
            CheckPublicExpression(exp.index.exp, access);
            for(e = exp.index.index->first; e; e = e.next)
               CheckPublicExpression(e, access);
            break;
         }
         case callExp:
         {
            Expression e;
            CheckPublicExpression(exp.call.exp, access);
            if(exp.call.arguments)
            {
               for(e = exp.call.arguments->first; e; e = e.next)
                  CheckPublicExpression(e, access);
            }
            break;
         }
         case memberExp:
         {
            CheckPublicExpression(exp.member.exp, access);
            break;
         }
         case pointerExp:
         {
            CheckPublicExpression(exp.member.exp, access);
            break;
         }
         case typeSizeExp:
            CheckPublicTypeName(exp.typeName, access);
            break;
         case castExp:
         {
            CheckPublicTypeName(exp.cast.typeName, access);
            if(exp.cast.exp)
               CheckPublicExpression(exp.cast.exp, access);
            break;
         }
         case conditionExp:
         {
            Expression e;
            CheckPublicExpression(exp.cond.cond, access);
            for(e = exp.cond.exp->first; e; e = e.next)
               CheckPublicExpression(e, access);
            CheckPublicExpression(exp.cond.elseExp, access);
            break;
         }
         case newExp:
         case new0Exp:
            CheckPublicExpression(exp._new.size, access);
            break;
         case renewExp:
         case renew0Exp:
            CheckPublicExpression(exp._renew.size, access);
            CheckPublicExpression(exp._renew.exp, access);
            break;
         case instanceExp:
         {
            MembersInit members;
            CheckPublicClass(exp.instance._class.symbol /*FindClass(exp.instance._class.name)*/, access, "define");
            for(members = exp.instance.members->first; members; members = members.next)
            {
               if(members.type == dataMembersInit)
               {
                  MemberInit member;
                  for(member = members.dataMembers->first; member; member = member.next)
                  {
                     CheckPublicInitializer(member.initializer, access);
                  }
               }
            }
            break;
         }
      }
   }
}

static void CheckPublicDataType(Type type, AccessMode access, const char * word)
{
   if(type)
   {
      switch(type.kind)
      {
         case classType:
         {
            CheckPublicClass(type._class, access, word);
            break;
         }
         case structType:
         case unionType:
         {
            // Do we want to overlook these C constructs when doing checks? Most likely... Recursion nightmare.
            /*
            Type member;
            Symbol typeSym;
            if(type.enumName)
            {
               typeSym = FindSymbol(type.enumName, globalContext, globalContext, true, false);
               if(typeSym) type = typeSym.type;
            }
            for(member = type.members.first; member; member = member.next)
               CheckPublicDataType(member, access, word);
            */
            break;
         }
         case functionType:
         {
            Type param;
            CheckPublicDataType(type.returnType, access, word);
            for(param = type.params.first; param; param = param.next)
               CheckPublicDataType(param, access, word);
            CheckPublicClass(type.thisClass, access, word);
            break;
         }
         case arrayType:
            CheckPublicDataType(type.arrayType, access, word);
            if(type.enumClass)
               CheckPublicClass(type.enumClass, access, word);
            break;
         case pointerType:
         {
            CheckPublicDataType(type.type, access, word);
            break;
         }
         case methodType:
         {
            // Where is this used? Needed?
            break;
         }
         case subClassType:
         {
            CheckPublicClass(type._class, access, word);
            break;
         }
      }
   }
}

static void CheckMembersDefinitions(Class regClass, DataMember member, OldList definitions, AccessMode access)
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

            yylloc = def.loc;
            if(decl.type == structDeclaration)
            {
               Declarator d;
               if(decl.declarators)
               {
                  for(d = decl.declarators->first; d; d = d.next)
                  {
                     Identifier declId = GetDeclId(d);
                     if(declId)
                     {
                        if(member)
                        {
                           BTNamedLink link = (BTNamedLink)member.membersAlpha.FindString(declId.string);
                           dataMember = link ? link.data : null;
                        }
                        else
                           dataMember = eClass_FindDataMember(regClass, declId.string, privateModule, null, null);
                        if(dataMember)
                           CheckPublicDataType(dataMember.dataType,  (def.memberAccess == privateAccess) ? privateAccess : access, $"class data member");
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
                           CheckMembersDefinitions(regClass, member, spec.definitions, (def.memberAccess == privateAccess) ? privateAccess : access);
                        }
                        else if(spec.definitions && spec.id)
                        {
                           if(member)
                           {
                              BTNamedLink link = (BTNamedLink)member.membersAlpha.FindString(spec.id.string);
                              dataMember = link ? link.data : null;
                           }
                           else
                              dataMember = eClass_FindDataMember(regClass, spec.id.string, privateModule, null, null);
                           if(dataMember)
                              CheckPublicDataType(dataMember.dataType,  (def.memberAccess == privateAccess) ? privateAccess : access, $"class data member");
                        }
                     }
                  }
               }
            }
            else if(decl.type == instDeclaration)
            {
               CheckPublicClass(decl.inst._class.symbol /*FindClass(decl.inst._class.name)*/, (def.memberAccess == privateAccess) ? privateAccess : access, $"class member instance");
            }
         }
      }
   }
}

static void ProcessClass(ClassType classType, OldList definitions, Symbol symbol, OldList baseSpecs, OldList enumValues, Location loc, OldList defs, void * after, OldList initDeclarators, ExtDecl extDecl)
{
   char structName[1024];
   char className[1024];
   char constructorName[1024];
   char destructorName[1024];
   Class regClass;
   ClassFunction destructor = null, constructor = null;
   //bool redefinition = false;
   bool isUnion = classType == unionClass;

   External external = null;

   ClassDef def;
   OldList * list = null;
   OldList * classDataList = null;

   if(inCompiler)
   {
      list = MkList();
      classDataList = MkList();
   }

   /*
      TODO: Analyze This
   if(symbol.exclude)
   {
      if(inCompiler)
         return;
      else
         redefinition = true;
   }
   */
   regClass = eSystem_FindClass(privateModule, symbol.string);
   if(!regClass)
      return;  // TODO: Notify of an error?
   classType = regClass.type;

   // PUBLISHING CHECK ON BASE CLASS
   if(inCompiler && regClass.base)  // The base check saves a crash trying to inherit from itself
   {
      yylloc = loc;

      if(!NameSpaceContained(regClass.nameSpace, &regClass.module.privateNameSpace) && regClass.inheritanceAccess == publicAccess)
      {
         if(!regClass.base.symbol)
            regClass.base.symbol = FindClass(regClass.base.fullName);
         CheckPublicClass(regClass.base.symbol, publicAccess, $"class");
      }
      else if(!symbol.isStatic && regClass.base)
      {
         if(!regClass.base.symbol)
            regClass.base.symbol = FindClass(regClass.base.fullName);
         CheckPublicClass(regClass.base.symbol, privateAccess, $"class");
      }
   }

   /*
   if(NameSpaceContained(regClass.nameSpace, &regClass.module.privateNameSpace))
   {
      if(regClass.inheritanceAccess == publicAccess &&
         (regClass.base.nameSpace == &regClass.base.module.privateNameSpace || !ModuleAccess(privateModule, regClass.base.module)))
         Compiler_Error($"Public class publicly inheriting off private base class\n");
   }
   else if(!symbol.isStatic)
   {
      Symbol baseSym = FindClass(regClass.base.fullName);
      if(baseSym && baseSym.isStatic)
         Compiler_Error($"Non-static class inheriting off static base class\n");
   }
   */

   /*
   MOVED ENUM VALUES TO PASS1

   if(classType == enumClass && enumValues)
   {
      Enumerator e;
      for(e = enumValues.first; e; e = e.next)
      {
         if(e.exp)
         {
            Type destType
            {
               kind = TypeInt;
               refCount = 1;
            };
            e.exp.destType = destType;

            ProcessExpressionType(e.exp);
            ComputeExpression(e.exp);
            if(e.exp.isConstant && e.exp.type == ExpConstant)
            {
               int value;
               value = strtol(e.exp.string, null, 0);
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
   */

   // ACCESS OVERRIDING CODE
   if(definitions != null)
   {
      for(def = definitions.first; def; def = def.next)
      {
         if(def.type == accessOverrideClassDef)
         {
            DataMember member;
            Property prop;
            Method method;
            if((prop = eClass_FindProperty(regClass, def.id.string, privateModule)))
            {
               eClass_AddProperty(regClass, def.id.string, null, null, null, def.memberAccess);
            }
            else if((member = eClass_FindDataMember(regClass, def.id.string, privateModule, null, null)))
            {
               eClass_AddDataMember(regClass, def.id.string, null, 0, 0, def.memberAccess);
            }
            else if((method = eClass_FindMethod(regClass, def.id.string, privateModule)))
            {
               eClass_AddMethod(regClass, def.id.string, null, null, def.memberAccess);
            }
            else
            {
               yylloc = def.loc;
               Compiler_Error($"Couldn't find member %s to override\n", def.id.string);
            }
         }
      }
   }

   if(inCompiler)
   {
      external = MkExternalDeclaration(null);
      defs.Insert(after, external);
      curExternal = external;
      curExternal.symbol = symbol;
   }

   if((classType == structClass || classType == noHeadClass) && inCompiler)
   {
      AddSimpleBaseMembers(external, list, regClass.base, regClass);
   }

   // First check if there's any declaration or instantiations, we'll need a struct
   if(definitions != null)
   {
      if(inCompiler)
      {
         if(!NameSpaceContained(regClass.nameSpace, &regClass.module.privateNameSpace))
            CheckMembersDefinitions(regClass, null, definitions, publicAccess);
         else if(!symbol.isStatic)
            CheckMembersDefinitions(regClass, null, definitions, privateAccess);
      }
      for(def = definitions.first; def; def = def.next)
      {
         yylloc = def.loc;
         if(def.type == declarationClassDef)
         {
            Declaration decl = def.decl;
            yylloc = decl.loc;

            if(decl.type == structDeclaration)
            {
               if(inCompiler && classType != bitClass)
               {
                  ListAdd(list, MkClassDefDeclaration(decl));

                  // Take it out from here...
                  def.decl = null;
               }
            }
            else if(decl.type == instDeclaration)
            {
               Instantiation inst = decl.inst;
               Expression exp = inst.exp;
               Symbol classSym;
               if(exp)
               {
                  // Eventually support multiple instance creations in the same ';'
                  OldList * specifiers = MkList();
                  Declarator d;

                  ListAdd(specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                  d = MkDeclaratorIdentifier(MkIdentifier(exp.identifier.string));

                  if(inCompiler)
                  {
                     OldList * declarators = MkList();
                     ListAdd(declarators, d);

                     decl = MkStructDeclaration(specifiers, declarators, null);
                     ListAdd(list, MkClassDefDeclaration(decl));

                     // Add the this pointer to the instance expression
                     exp.type = memberExp;
                     exp.member.member = exp.identifier;
                     exp.member.exp = QMkExpId("this");
                     exp.member.memberType = dataMember;
                     exp.member.thisPtr = true;
                  }
                  else
                  {
                     FreeDeclarator(d);
                     FreeList(specifiers, FreeSpecifier);
                  }
               }

               // Check if it is a simple class
               // If it is, we only need a constructor if there is data set,
               // and we don't need a destructor
               classSym = inst._class.symbol; // FindClass(inst._class.name);
               if(classSym && classSym.registered &&
                  (classSym.registered.type == structClass ||
                   classSym.registered.type == bitClass ||
                   classSym.registered.type == unitClass))
               {
                  if(inst.members && inst.members->count)
                     symbol.needConstructor = true;
               }
               else
               {
                  symbol.needConstructor = true;
                  symbol.needDestructor = true;
               }
            }
         }
         else if(def.type == classDataClassDef)
         {
            Declaration decl = def.decl;

            if(decl.type == structDeclaration)
            {
               if(inCompiler && classType != bitClass)
               {
                  ListAdd(classDataList, MkClassDefDeclaration(decl));

                  // Take it out from here...
                  def.decl = null;
               }
            }
         }
         else if(def.type == defaultPropertiesClassDef)
            symbol.needConstructor = true;
         else if(def.type == propertyWatchClassDef)
            symbol.needConstructor = true;
         else if(def.type == functionClassDef)
         {
            ClassFunction func = def.function;
            if(func.isDestructor)
            {
               if(destructor)
               {
                  yylloc = loc;
                  Compiler_Error($"redefinition of destructor for class %s\n", symbol.string);
               }
               else
               {
                  symbol.needDestructor = true;
                  destructor = func;
                  if(!inCompiler && func.body)
                  {
                     // Add this to the context
                     Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassType(regClass.fullName);
                     };
                     func.body.compound.context.symbols.Add((BTNode)thisSymbol);
                  }
               }
            }
            if(func.isConstructor)
            {
               if(constructor)
               {
                  yylloc = loc;
                  Compiler_Error($"redefinition of constructor for class %s\n", symbol.string);
               }
               else
               {
                  symbol.needConstructor = true;
                  constructor = func;

                  if(!inCompiler && func.body)
                  {
                     // Add this to the context
                     Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassType(regClass.fullName);
                     };
                     func.body.compound.context.symbols.Add((BTNode)thisSymbol);
                  }
               }
            }
         }
      }
   }

   if(inCompiler)
   {
      external.symbol = null;

      if(list->count)
      {
         // We need a struct
         OldList * specs = MkList(), * declarators = (initDeclarators != null) ? initDeclarators : MkList();
         initDeclarators = null;

         // TESTING THIS HERE INSTEAD:
         strcpy(structName, symbol.string);
         symbol.structName = CopyString(structName);

         {
            Specifier spec = MkStructOrUnion(structSpecifier, MkIdentifier(structName),
               isUnion ? MkListOne(MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkStructOrUnion(unionSpecifier, null, list)), null, null))) : list);
            spec.extDeclStruct = extDecl;
            ListAdd(specs, spec);
         }

         external.symbol = symbol;
         if(symbol.structExternal)
         {
            for(e : symbol.structExternal.incoming)
               external.CreateUniqueEdge(e.from, e.breakable);
            for(e : symbol.structExternal.outgoing)
               e.to.CreateUniqueEdge(external, e.breakable);
            ast->Remove(symbol.structExternal);
            FreeExternal(symbol.structExternal);
         }
         symbol.structExternal = external;

         external.declaration = MkDeclaration(specs, declarators);
         after = external;

         symbol.declaredStruct = true;
      }
      else
      {
         curExternal = external.prev;
         defs.Remove(external);
         FreeExternal(external);
         delete list;
      }

      if(classDataList->count)
      {
         // We need a struct
         char classDataStructName[1024];
         OldList * specs = MkList();
         External external;

         strcpy(classDataStructName, "__ecereClassData_");
         FullClassNameCat(classDataStructName, symbol.string, false);

         declMode = structDeclMode = defaultAccess;
         ListAdd(specs, MkStructOrUnion(structSpecifier, MkIdentifier(classDataStructName), classDataList));
         external = MkExternalDeclaration(MkDeclaration(specs, null));
         defs.Insert(after, external);
         after = external;
         symbol.classData = true;
      }
      else
         delete classDataList;
   }

   if(inCompiler)
   {
      // Class
      {
         OldList * specs = MkList(), * declarators = MkList();
         strcpy(className, "__ecereClass_");
         FullClassNameCat(className, symbol.string, true);

         symbol.className = CopyString(className);

         if(!strstr(sourceFile, ".main.ec"))
            ListAdd(specs, MkSpecifier(STATIC));
         ListAdd(specs, MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null));
         ListAdd(declarators, MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null),
            MkDeclaratorIdentifier(MkIdentifier(className))), null));

         symbol.pointerExternal = MkExternalDeclaration(MkDeclaration(specs, declarators));
         DeclareStruct(symbol.pointerExternal, "ecere::com::Class", false, true);

         defs.Insert(after, symbol.pointerExternal);
         after = symbol.methodExternal;
      }

      // Build the destructor
      if(symbol.needDestructor)
      {
         ClassFunction function;
         OldList * specs = MkList();
         Declarator decl;
         Statement body;
         Context context;
         OldList * declarations = null, * statements;

         strcpy(destructorName, "__ecereDestructor_");
         FullClassNameCat(destructorName, symbol.string, false);

         symbol.destructorName = CopyString(destructorName);

         ListAdd(specs, MkSpecifier(VOID));

         context = PushContext();

         statements = MkList();

         if(definitions != null)
         {
            for(def = definitions.first; def; def = def.next)
            {
               // Get rid of stuff
               if(def.type == declarationClassDef && def.decl && def.decl.type == instDeclaration)
               {
                  Instantiation inst = def.decl.inst;
                  Symbol classSym = inst._class.symbol;
                  /*if(!classSym)
                     classSym = inst._class.symbol = FindClass(inst._class.name);*/
                  if(inst.exp && (!classSym || !classSym.registered || classSym.registered.type == normalClass))
                  {
                     /*  FIX a DecRef declaration problem...
                     // Decrement counter if it isn't a simple class
                     ListAdd(statements,
                        MkExpressionStmt(MkListOne(MkExpCall(
                           MkExpIdentifier(MkIdentifier("ecere::com::eInstance_DecRef")),
                           MkListOne(CopyExpression(inst.exp))))));
                     */
                     Expression exp = MkExpOp(null, DELETE, CopyExpression(inst.exp));
                     ListAdd(statements, MkExpressionStmt(MkListOne(exp)));
                  }
                  if(inst.exp && (!classSym || !classSym.registered || classSym.registered.type == noHeadClass))
                  {
                     Expression exp = MkExpOp(null, DELETE, CopyExpression(inst.exp));
                     ListAdd(statements, MkExpressionStmt(MkListOne(exp)));
                  }
               }
            }
         }

         if(destructor && destructor.body)
         {
            /*
            declarations = destructor.body.compound.declarations;
            if(destructor.body.compound.statements)
            {
               Statement stmt;
               while(stmt = destructor.body.compound.statements.first)
               {
                  destructor.body.compound.statements->Remove(stmt);
                  statements->Add(stmt);
               }
            }
            */
            // statements->Add(destructor.body);
            statements->Insert(null, destructor.body);
            destructor.body.compound.context.parent = context;
            destructor.body = null;
         }

         body = MkCompoundStmt(declarations, statements);
         PopContext(context);
         body.compound.context = context;

         decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(destructorName)), null);

         decl.symbol = Symbol { };
         excludedSymbols->Add(decl.symbol);

         function = MkClassFunction(specs, null, decl, null);
         ProcessClassFunctionBody(function, body);
         function.dontMangle = true;
         definitions.Insert(null, MkClassDefFunction(function));
      }

      // Build the constructor

      if(symbol.needConstructor && inCompiler)
      {
         ClassFunction function;
         OldList * specs = MkList();
         Declarator decl;
         Statement body;
         Context context;
         OldList * declarations = null, * statements;

         strcpy(constructorName, "__ecereConstructor_");
         FullClassNameCat(constructorName, symbol.string, false);

         symbol.constructorName = CopyString(constructorName);

         ListAdd(specs, MkSpecifierName/*MkClassName*/("bool"));

         context = PushContext();

         statements = MkList();

         if(definitions != null)
         {
            for(def = definitions.first; def; def = def.next)
            {
               if(def.type == declarationClassDef && def.decl && def.decl.type == instDeclaration)
               {
                  Instantiation inst = def.decl.inst;
                  Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
                  /*if(!classSym)
                     classSym = inst._class.symbol = FindClass(inst._class.name);*/

                  if(inst.exp && (!classSym || !classSym.registered || classSym.registered.type == normalClass || classSym.registered.type == noHeadClass))
                  {
                     Instantiation newInst { };
                     *newInst = *inst;
                     newInst.members = null;
                     newInst.exp = CopyExpression(inst.exp);
                     newInst._class = CopySpecifier(inst._class);

                     ListAdd(statements,
                        MkExpressionStmt(MkListOne(MkExpInstance(newInst))));
                     inst.built = true;
                  }

                  // Increment counter if it isn't a simple class
                  if(inst.exp && (!classSym || !classSym.registered || classSym.registered.type == normalClass))
                  {
                     ListAdd(statements,
                        MkExpressionStmt(MkListOne(MkExpCall(
                           MkExpIdentifier(MkIdentifier("ecere::com::eInstance_IncRef")),
                           MkListOne(CopyExpression(inst.exp))))));
                  }
               }
            }

            for(def = definitions.first; def; def = def.next)
            {
               // Add the default data properties/members
               if(def.type == defaultPropertiesClassDef && def.defProperties)
               {
                  MemberInit propertyDef;
                  for(propertyDef = def.defProperties->first; propertyDef; propertyDef = propertyDef.next)
                  {
                     Expression memberExp;
                     Identifier id = propertyDef.identifiers->first;
                     if(id)
                     {
                        memberExp = MkExpMember(MkExpIdentifier(MkIdentifier("this")), id);
                        for(id = id.next; id; id = id.next)
                           memberExp = MkExpMember(memberExp, id);

                        // ASSUME: No list initializers here
                        ListAdd(statements,
                           MkExpressionStmt(MkListOne(MkExpOp(memberExp, '=',
                              (propertyDef.initializer && propertyDef.initializer.type == expInitializer ? propertyDef.initializer.exp : null)))));

                     }
                     // Take it out of there...
                     if(propertyDef.initializer)
                     {
                        if(propertyDef.initializer.type == expInitializer)
                           propertyDef.initializer.exp = null;
                        FreeInitializer(propertyDef.initializer);
                     }
                     propertyDef.initializer = null;
                     propertyDef.identifiers->Clear();
                  }
               }
            }
            for(def = definitions.first; def; def = def.next)
            {
               // Instanciate stuff
               if(def.type == declarationClassDef && def.decl && def.decl.type == instDeclaration)
               {
                  Instantiation inst = def.decl.inst;
                  Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
                  /*if(!classSym)
                     classSym = inst._class.symbol = FindClass(inst._class.name);*/

                  if(inst.exp || (!classSym || !classSym.registered || classSym.registered.type == normalClass || classSym.registered.type == noHeadClass))
                  {
                     // Only needed here if members are set...
                     if(!(inst.exp && (!classSym || !classSym.registered || classSym.registered.type == normalClass || classSym.registered.type == noHeadClass)) || (inst.members && inst.members->count))
                     {
                        // Is it safe to take it out here?
                        def.decl.inst = null;

                        ListAdd(statements,
                           MkExpressionStmt(MkListOne(MkExpInstance(inst))));
                     }
                  }
               }
            }
         }

         if(constructor && constructor.body)
         {
            /*
            declarations = constructor.body.compound.declarations;

            if(constructor.body.compound.declarations)
            {
               Declaration decl;
               while(decl = constructor.body.compound.declarations.first)
               {
                  constructor.body.compound.declarations->Remove(decl);
                  declarations->Add(decl);
               }
            }

            // We want to keep the context here...
            if(constructor.body.compound.statements)
            {
               Statement stmt;
               while(stmt = constructor.body.compound.statements.first)
               {
                  constructor.body.compound.statements->Remove(stmt);
                  statements->Add(stmt);
               }
            }
            */
            statements->Add(constructor.body);
            constructor.body.compound.context.parent = context;
            constructor.body = null;
         }

         ListAdd(statements, MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("true")))));
         body = MkCompoundStmt(declarations, statements);
         PopContext(context);
         body.compound.context = context;

         decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(constructorName)), null);

         decl.symbol = Symbol { };
         excludedSymbols->Add(decl.symbol);

         function = MkClassFunction(specs, null, decl, null);
         ProcessClassFunctionBody(function, body);
         function.dontMangle = true;
         if(definitions != null)
            definitions.Insert(null, MkClassDefFunction(function));
      }
   }

   // list = null;   // Why was this here?

   // Do the functions
   if(definitions != null)
   {
      for(def = definitions.first; def; def = def.next)
      {
         if(def.type == propertyClassDef && def.propertyDef)
         {
            PropertyDef propertyDef = def.propertyDef;
            ClassDef after = def;
            ClassDef newDef;

            if(inCompiler)
            {
               yylloc = propertyDef.loc;
               if(!NameSpaceContained(regClass.nameSpace, &regClass.module.privateNameSpace) && def.memberAccess == publicAccess)
                  CheckPublicDataType(propertyDef.symbol.type, publicAccess, "class property");
               else if(!symbol.isStatic)
                  CheckPublicDataType(propertyDef.symbol.type, privateAccess, "class property");
            }

            {
               // Commented this out...  Why exactly?
               //if(inCompiler)
               {
                  ClassFunction func;
                  Declarator decl;
                  char name[1024];
                  OldList * params;
                  if(propertyDef.getStmt && propertyDef.id)
                  {
                     strcpy(name, "__ecereProp_");
                     FullClassNameCat(name, symbol.string, false);
                     strcat(name, "_Get_");
                     // strcat(name, propertyDef.id.string);
                     FullClassNameCat(name, propertyDef.id.string, true);

                     params = MkList();

                     // decl = MkDeclaratorFunction(PlugDeclarator(propertyDef.declarator, MkDeclaratorIdentifier(MkIdentifier(name))), params);

                     if(propertyDef.symbol.type && propertyDef.symbol.type.kind == TypeKind::classType && propertyDef.symbol.type._class && propertyDef.symbol.type._class.registered &&
                        propertyDef.symbol.type._class.registered.type == structClass)
                     {
                        ListAdd(params, MkTypeName(CopyList(propertyDef.specifiers, CopySpecifier), MkDeclaratorIdentifier(MkIdentifier("value"))));
                        decl = PlugDeclarator(propertyDef.declarator, MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params));

                        func = MkClassFunction(MkListOne(MkSpecifier(VOID)), null, decl, null);

                        // Take it out here...
                        //propertyDef.specifiers = null;
                     }
                     else
                     {
                        decl = PlugDeclarator(propertyDef.declarator, MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params));

                        func = MkClassFunction(CopyList(propertyDef.specifiers, CopySpecifier),
                           null, decl, null);
                     }

                     ProcessClassFunctionBody(func, propertyDef.getStmt);
                     func.declarator.symbol = propertyDef.symbol;
                     //func.declarator.propSymbol = propertyDef.symbol;
                     propertyDef.symbol.externalGet = (External)func;

                     func.dontMangle = true;
                     newDef = MkClassDefFunction(func);
                     definitions.Insert(after, newDef);
                     after = newDef;

                     if(inCompiler)
                        propertyDef.getStmt = null;
                     else
                        func.body = null;
                  }
                  if(propertyDef.setStmt && propertyDef.id)
                  {
                     OldList * specifiers = MkList();

                     strcpy(name, "__ecereProp_");
                     FullClassNameCat(name, symbol.string, false);
                     strcat(name, "_Set_");
                     //strcat(name, propertyDef.id.string);
                     FullClassNameCat(name, propertyDef.id.string, true);

                     params = MkList();

                     ListAdd(params, MkTypeName(CopyList(propertyDef.specifiers, CopySpecifier),
                        PlugDeclarator(propertyDef.declarator,
                           MkDeclaratorIdentifier(MkIdentifier("value")))));

                     // Add const to DB table rows properties Set
                     if(propertyDef.isDBProp)
                     {
                        Specifier spec;
                        OldList * specs = ((TypeName)params->last).qualifiers;

                        for(spec = specs->first; spec; spec = spec.next)
                           if(spec.type == baseSpecifier && spec.specifier == CONST)
                              break;
                        if(!spec)
                           specs->Insert(null, MkSpecifier(CONST));
                     }

                     decl = MkDeclaratorFunction(
                        MkDeclaratorIdentifier(MkIdentifier(name)), params);

                     {
                        bool isConversion = propertyDef.symbol._property && propertyDef.symbol._property.conversion;
                        bool useVoid = false;
                        switch(regClass.type)
                        {
                           case structClass: case unionClass:  useVoid = true; break;
                           case noHeadClass: case normalClass: useVoid = !isConversion; break;
                           default:
                              useVoid = !isConversion;
                              if(useVoid && !propertyDef.isDBProp)
                                 Compiler_Warning($"set defined on type without storage for non-conversion property\n");
                        }
                        ListAdd(specifiers, useVoid ? MkSpecifier(VOID) : MkSpecifierName(regClass.fullName));
                     }

                     func = MkClassFunction(specifiers, null, decl, null);
                     ProcessClassFunctionBody(func, propertyDef.setStmt);
                     func.dontMangle = true;
                     func.declarator.symbol = propertyDef.symbol;
                     propertyDef.symbol.externalSet = (External)func;
                     if(!propertyDef.conversion && regClass.type == normalClass)
                        func.propSet = propertyDef.symbol;

                     newDef = MkClassDefFunction(func);
                     definitions.Insert(after, newDef);
                     after = newDef;

                     if(inCompiler)
                        propertyDef.setStmt = null;
                     else
                        func.body = null;
                  }
                  if(propertyDef.issetStmt && propertyDef.id)
                  {
                     OldList * specifiers = MkList();

                     strcpy(name, "__ecereProp_");
                     FullClassNameCat(name, symbol.string, false);
                     strcat(name, "_IsSet_");
                     //strcat(name, propertyDef.id.string);
                     FullClassNameCat(name, propertyDef.id.string, true);

                     params = MkList();

                     decl = MkDeclaratorFunction(
                        MkDeclaratorIdentifier(MkIdentifier(name)), params);

                     ListAdd(specifiers, MkSpecifierName("bool"));

                     func = MkClassFunction(specifiers, null, decl, null);
                     ProcessClassFunctionBody(func, propertyDef.issetStmt);
                     func.dontMangle = true;
                     func.declarator.symbol = propertyDef.symbol;
                     //func.declarator.propSymbol = propertyDef.symbol;
                     propertyDef.symbol.externalIsSet = (External)func;

                     /*

                     func.declarator.symbol = Symbol { id = propertyDef.symbol,id + 1, external = (External)func };
                     */

                     newDef = MkClassDefFunction(func);
                     definitions.Insert(after, newDef);
                     after = newDef;

                     if(inCompiler)
                        propertyDef.issetStmt = null;
                     else
                        func.body = null;
                  }
                  if(propertyDef.id && inCompiler)
                  {
                     // Had to put this here because not all properties go through DeclareProperty
                     Property prop = eClass_FindProperty(symbol.registered, propertyDef.id.string, privateModule);

                     Declaration decl;
                     External external;
                     OldList * specifiers = MkList();
                     specifiers->Insert(null, MkSpecifier(STATIC));
                     specifiers->Add(MkSpecifierExtended(MkExtDeclAttrib(MkAttrib(ATTRIB, MkListOne(MkAttribute(CopyString("unused"), null))))));

                     ListAdd(specifiers, MkSpecifierName("Property"));
                     strcpy(name, "__ecereProp_");
                     FullClassNameCat(name, symbol.string, false);
                     strcat(name, "_");
                     //strcat(name, propertyDef.id.string);
                     FullClassNameCat(name, propertyDef.id.string, true);

                     {
                        OldList * list = MkList();
                        ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), null));

                        strcpy(name, "__ecerePropM_");
                        FullClassNameCat(name, symbol.string, false);
                        strcat(name, "_");
                        //strcat(name, propertyDef.id.string);
                        FullClassNameCat(name, propertyDef.id.string, true);

                        ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), null));
                        decl = MkDeclaration(specifiers, list);
                     }
                     external = MkExternalDeclaration(decl);
                     ast->Insert(curExternal ? curExternal.prev : null, external);
                     external.symbol = propertyDef.symbol;

                     // Setting it in the Property as well here to prevent DeclareProperty to declare it a second time...
                     propertyDef.symbol.externalPtr = external;

                     if(inCompiler && prop && prop.symbol)
                        ((Symbol)prop.symbol).externalPtr = external;
                  }
               }
            }
         }
         else if(def.type == classPropertyClassDef && def.propertyDef)
         {
            PropertyDef propertyDef = def.propertyDef;
            ClassDef after = def;
            ClassDef newDef;
            {
               if(inCompiler)
               {
                  yylloc = propertyDef.loc;

                  if(!NameSpaceContained(regClass.nameSpace, &regClass.module.privateNameSpace))
                     CheckPublicDataType(propertyDef.symbol.type, publicAccess, "classwide property");
                  else if(!symbol.isStatic)
                     CheckPublicDataType(propertyDef.symbol.type, privateAccess, "classwide property");
               }

               // Commented this out...  Why exactly?
               //if(inCompiler)
               {
                  ClassFunction func;
                  Declarator decl;
                  char name[1024];
                  OldList * params;
                  if(propertyDef.getStmt && propertyDef.id)
                  {
                     Declarator declId;

                     sprintf(name, "class::__ecereClassProp_");
                     FullClassNameCat(name, symbol.string, false);
                     strcat(name, "_Get_");
                     strcat(name, propertyDef.id.string);

                     params = MkList();

                     declId = MkDeclaratorIdentifier(MkIdentifier(name));

                     // Class properties returns a uint64 even for struct types
                     /*if(propertyDef.symbol.type && propertyDef.symbol.type.kind == TypeKind::classType && propertyDef.symbol.type._class && propertyDef.symbol.type._class.registered &&
                        propertyDef.symbol.type._class.registered.type == structClass)
                     {
                        // ListAdd(params, MkTypeName(CopyList(propertyDef.specifiers, CopySpecifier), MkDeclaratorIdentifier(MkIdentifier("value"))));
                        //decl = PlugDeclarator(propertyDef.declarator, MkDeclaratorFunction(declId, params));
                        decl = MkDeclaratorFunction(declId, params);
                        ListAdd(params, MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorIdentifier(MkIdentifier("_value"))));

                        func = MkClassFunction(MkListOne(MkSpecifier(VOID)), null, decl, null);
                        {
                           Declarator ptrDecl;
                           Statement body = propertyDef.getStmt;
                           decl = PlugDeclarator(propertyDef.declarator, MkDeclaratorFunction(declId, params));
                           if(!body.compound.declarations)
                              body.compound.declarations = MkList();
                           ListAdd(body.compound.declarations,
                              MkDeclaration(CopyList(propertyDef.specifiers, CopySpecifier), MkListOne(MkInitDeclarator(
                                 ptrDecl = MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(MkIdentifier("value"))), MkInitializerAssignment(MkExpCast(MkTypeName(CopyList(propertyDef.specifiers, CopySpecifier), CopyDeclarator(propertyDef.declarator)),
                                    MkExpIdentifier(MkIdentifier("_value"))))))));
                           {
                              Symbol sym = ptrDecl.symbol;
                              sym.isParam = true;
                              FreeType(sym.type);
                              sym.type = ProcessType(propertyDef.specifiers, propertyDef.declarator);
                           }
                        }
                     }
                     else
                     */
                     {
                        //decl = PlugDeclarator(propertyDef.declarator, MkDeclaratorFunction(declId, params));
                        decl = MkDeclaratorFunction(declId, params);
                        //func = MkClassFunction(CopyList(propertyDef.specifiers, CopySpecifier), null, decl, null);
                        func = MkClassFunction(MkListOne(MkSpecifierName("uint64")), null, decl, null);
                     }

                     ProcessClassFunctionBody(func, propertyDef.getStmt);
                     func.declarator.symbol = propertyDef.symbol;
                     propertyDef.symbol.externalGet = (External)func;

                     func.dontMangle = true;

                     newDef = MkClassDefFunction(func);
                     definitions.Insert(after, newDef);
                     after = newDef;

                     decl = PlugDeclarator(propertyDef.declarator, MkDeclaratorFunction(null , null));
                     func.type = ProcessType(propertyDef.specifiers, decl);
                     FreeDeclarator(decl);

                     if(func.type.returnType.kind == TypeKind::classType && func.type.returnType._class && func.type.returnType._class.registered && func.type.returnType._class.registered.type == structClass)
                        func.type.returnType.byReference = true;

                     // Leverage the fact that templated types are also boxed in a 64 bit integer
                     func.type.returnType.passAsTemplate = true;

                     if(inCompiler)
                        propertyDef.getStmt = null;
                     else
                        func.body = null;
                  }
                  if(propertyDef.setStmt && propertyDef.id)
                  {
                     Context prevCurContext;
                     OldList * specifiers = MkList();
                     Statement body = propertyDef.setStmt;
                     Declarator ptrDecl;
                     Expression e;

                     strcpy(name, "class::__ecereClassProp_");
                     FullClassNameCat(name, symbol.string, false);
                     strcat(name, "_Set_");
                     strcat(name, propertyDef.id.string);

                     params = MkList();
                     /*
                     ListAdd(params, MkTypeName(CopyList(propertyDef.specifiers, CopySpecifier),
                        PlugDeclarator(propertyDef.declarator,
                           MkDeclaratorIdentifier(MkIdentifier("value")))));
                     */

                     prevCurContext = curContext;
                     curContext = body.compound.context;

                     ListAdd(params, MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorIdentifier(MkIdentifier("_value"))));

                     decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params);
                     if(!body.compound.declarations)
                        body.compound.declarations = MkList();

                     if(propertyDef.symbol.type && propertyDef.symbol.type.kind == TypeKind::classType && propertyDef.symbol.type._class && propertyDef.symbol.type._class.registered &&
                        propertyDef.symbol.type._class.registered.type == structClass)
                        ptrDecl = MkDeclaratorPointer(MkPointer(null, null), PlugDeclarator(propertyDef.declarator, MkDeclaratorIdentifier(MkIdentifier("value"))));
                     else
                        ptrDecl = PlugDeclarator(propertyDef.declarator, MkDeclaratorIdentifier(MkIdentifier("value")));


                     e = MkExpIdentifier(MkIdentifier("_value"));
                     if(propertyDef.symbol.type.isPointerType)
                        e = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), e);

                     ListAdd(body.compound.declarations,
                        MkDeclaration(CopyList(propertyDef.specifiers, CopySpecifier), MkListOne(MkInitDeclarator(ptrDecl,
                              MkInitializerAssignment(MkExpCast(MkTypeName(CopyList(propertyDef.specifiers, CopySpecifier), CopyDeclarator(propertyDef.declarator)),
                              e))))));

                     curContext = prevCurContext;

                     {
                        Symbol sym = ptrDecl.symbol;
                        sym.isParam = true;
                        FreeType(sym.type);
                        sym.type = ProcessType(propertyDef.specifiers, propertyDef.declarator);
                     }
                     ListAdd(specifiers, MkSpecifier(VOID));

                     func = MkClassFunction(specifiers, null, decl, null);
                     ProcessClassFunctionBody(func, propertyDef.setStmt);
                     func.dontMangle = true;
                     func.declarator.symbol = propertyDef.symbol;
                     propertyDef.symbol.externalSet = (External)func;

                     newDef = MkClassDefFunction(func);
                     definitions.Insert(after, newDef);
                     after = newDef;

                     if(inCompiler)
                        propertyDef.setStmt = null;
                     else
                        func.body = null;

                  }
               }
            }
         }
         else if(def.type == functionClassDef && def.function.declarator)
         {
            ClassFunction func = def.function;

            func._class = regClass;
            // Add ecereMethod_[class]_ to the declarator
            if(!func.dontMangle)
            {
               Declarator funcDecl = GetFuncDecl(func.declarator);
               Identifier id = GetDeclId(funcDecl);
               Method method;

               if(!funcDecl.function.parameters || !funcDecl.function.parameters->first)
               {
                  if(!funcDecl.function.parameters)
                     funcDecl.function.parameters = MkList();
                  ListAdd(funcDecl.function.parameters, MkTypeName(MkListOne(MkSpecifier(VOID)), null));
               }

               method = eClass_FindMethod(regClass, id.string, privateModule);

               FreeSpecifier(id._class);
               id._class = null;
               if(inCompiler && method)
               {
                  char * newId = new char[strlen(id.string) + strlen("__ecereMethod___ecereNameSpace__") + strlen(symbol.string) + 2];
                  newId[0] = '\0';

                  ProcessMethodType(method);
                  yylloc = def.loc;
                  if(!NameSpaceContained(regClass.nameSpace, &regClass.module.privateNameSpace) && method.memberAccess == publicAccess)
                     CheckPublicDataType(method.dataType, publicAccess, "class method");
                  /* HAVE TO RELAX THIS SINCE static CAN'T QUALIFY METHODS YET... (Conflict with C++ static meaning)
                  else if(!symbol.isStatic)
                     CheckPublicDataType(method.dataType, privateAccess, "class method");
                  */

                  strcpy(newId, "__ecereMethod_");
                  FullClassNameCat(newId, symbol.string, false);
                  strcat(newId, "_");
                  strcat(newId, id.string);

                  delete id.string;

                  id.string = newId;

                  if(method.type != virtualMethod)
                  {
                     if(method.symbol)
                     {
                        delete ((Symbol)method.symbol).string;
                        ((Symbol)method.symbol).string = CopyString(newId);
                     }
                  }
               }
            }
         }
      }
   }

   if(initDeclarators != null)
      FreeList(initDeclarators, FreeInitDeclarator);
}

public void PreProcessClassDefinitions()
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
            if(_class.definitions)
            {
               ProcessClass(normalClass, _class.definitions, _class.symbol, _class.baseSpecs, null, _class.loc, ast, external.prev, null, null);
            }
         }
         else if(external.type == declarationExternal)
         {
            Declaration declaration = external.declaration;
            if(declaration && declaration.type == initDeclaration)
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
                           OldList * initDeclarators = null;
                           ExtDecl extDecl = specifier.extDeclStruct;
                           specifier.extDeclStruct = null;
                           if(inCompiler)
                           {
                              // Give the declarators away to ProcessClass
                              // It will include the declarators in the class if appropriate, otherwise free them
                              initDeclarators = declaration.declarators;
                              declaration.declarators = null;
                           }
                           ProcessClass((specifier.type == unionSpecifier) ? unionClass : normalClass, specifier.definitions,
                              symbol, specifier.baseSpecs, specifier.list, specifier.loc, ast, external.prev,
                              initDeclarators, extDecl);
                        }
                     }
                  }
               }
            }
            else if(declaration && inCompiler && declaration.type == defineDeclaration)
            {
               yylloc = declaration.loc;
               if(declaration.declMode == publicAccess)
                  CheckPublicExpression(declaration.exp, publicAccess);
               else if(declaration.declMode != staticAccess)
                  CheckPublicExpression(declaration.exp, privateAccess);
            }
         }
         else if(external.type == importExternal)
         {
            //ImportModule(external._import);
         }
         else if(inCompiler && external.type == functionExternal)
         {
            yylloc = external.function.loc;
            if(!external.function.type)
               external.function.type = ProcessType(external.function.specifiers, external.function.declarator);
            if(external.function.declMode == publicAccess)
               CheckPublicDataType(external.function.type, publicAccess, "function");
            else if(external.function.declMode != staticAccess)
               CheckPublicDataType(external.function.type, privateAccess, "function");
         }
      }
   }
}
