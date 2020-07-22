import "ecdefs"

/****  FREEING  ****/

void FreeList(OldList list, void (* FreeFunction)(void *))
{
   if(list != null)
   {
      Item item;
      while((item = list.first))
      {
         list.Remove(item);
         FreeFunction(item);
      }
      delete list;
   }
}

public void FreeType(Type type)
{
   if(type)
   {
      type.refCount--;
      if(type.refCount <= 0)
      {
         switch(type.kind)
         {
            case enumType:
            {
               NamedLink64 member, next;
               delete type.enumName;
               for(member = type.members.first; member; member = next)
               {
                  next = member.next;
                  type.members.Remove(member);
                  delete member.name;
                  delete member;
               }
               break;
            }
            case structType:
            case unionType:
            {
               Type member, next;
               delete type.enumName;
               for(member = type.members.first; member; member = next)
               {
                  next = member.next;
                  // Remove from list only when reaching last reference
                  // (The list is copied)
                  if(member.refCount == 1)
                     type.members.Remove(member);
                  FreeType(member);
               }
               break;
            }
            case functionType:
            {
               Type param, next;
               if(type.returnType)
                  FreeType(type.returnType);
               for(param = type.params.first; param; param = next)
               {
                  next = param.next;
                  // WARNING: Don't unlink these as they might be reused
                  // type.params.Remove(param);
                  FreeType(param);
               }
               break;
            }
            case arrayType:
               if(type.freeExp && type.arraySizeExp)
                  FreeExpression(type.arraySizeExp);
            case pointerType:
               if(type.type)
                  FreeType(type.type);
               break;
         }
         delete type.name;
         delete type.typeName;
         delete type;
      }
   }
}

void FreeSymbol(Symbol symbol)
{
   OldLink link;

   if(symbol.propCategory)
      FreeExpression(symbol.propCategory);

   FreeType(symbol.type);

   while((link = symbol.templatedClasses.first))
      symbol.templatedClasses.Delete(link);

   delete symbol.string;

   if(symbol.templateParams)
      FreeList(symbol.templateParams, FreeTemplateParameter);

   // Used to be in ClassDefinition
   delete symbol.constructorName;
   delete symbol.structName;
   delete symbol.className;
   delete symbol.destructorName;
   delete symbol.shortName;
   if(symbol.ctx)
   {
      FreeContext(symbol.ctx);
      delete symbol.ctx;
   }
   delete symbol;
}

void FreeMethodImport(MethodImport imp)
{
   delete imp.name;
}

void FreePropertyImport(MethodImport imp)
{
   delete imp.name;
}

void FreeClassImport(ClassImport imp)
{
   delete imp.name;
   imp.methods.Free(FreeMethodImport);
   imp.properties.Free(FreePropertyImport);
}

void FreeFunctionImport(ClassImport imp)
{
   delete imp.name;
}

public void FreeModuleImport(ModuleImport imp)
{
   delete imp.name;
   imp.classes.Free(FreeClassImport);
   imp.functions.Free(FreeFunctionImport);
}

public void FreeModuleDefine(Definition def)
{
   delete def.name;
}

public void FreeExcludedSymbols(OldList excludedSymbols)
{
   Symbol symbol;

   while((symbol = excludedSymbols.first))
   {
      excludedSymbols.Remove(symbol);
      FreeSymbol(symbol);
   }
}

public void FreeTemplateArgument(TemplateArgument arg)
{
   switch(arg.type)
   {
      case expression:
         if(arg.expression)
            FreeExpression(arg.expression);
         break;
      case identifier:
         if(arg.identifier)
            FreeIdentifier(arg.identifier);
         break;
      case type:
         if(arg.templateDatatype)
            FreeTemplateDataType(arg.templateDatatype);
         break;
   }
   if(arg.name)
      FreeIdentifier(arg.name);
   delete arg;
}

public void FreeTemplateDataType(TemplateDatatype type)
{
   if(type.decl)
      FreeDeclarator(type.decl);
   if(type.specifiers)
      FreeList(type.specifiers, FreeSpecifier);
   delete type;
}

public void FreeTemplateParameter(TemplateParameter param)
{
   if(param.identifier)
   {
      FreeIdentifier(param.identifier);
   }
   if(param.type == type || param.type == expression)
   {
      if(param.dataType)
         FreeTemplateDataType(param.dataType);
   }
   if(param.defaultArgument)
      FreeTemplateArgument(param.defaultArgument);
   if(param.baseType)
      FreeType(param.baseType);
   delete param;
}

public void FreeTemplateType(TemplatedType type)
{
   /*if(type.ownParam)
   {
      FreeTemplateParameter(type.param);
   }*/
   delete type;
}

public void FreeContext(Context context)
{
   Symbol symbol;

   if(context == curContext)
      curContext = globalContext;

   while((symbol = (Symbol)context.types.root))
   {
      context.types.Remove((BTNode)symbol);
      FreeSymbol(symbol);
   }
   while((symbol = (Symbol)context.classes.root))
   {
      context.classes.Remove((BTNode)symbol);
      FreeSymbol(symbol);
   }
   while((symbol = (Symbol)context.symbols.root))
   {
      context.symbols.Remove((BTNode)symbol);
      FreeSymbol(symbol);
   }
   while((symbol = (Symbol)context.structSymbols.root))
   {
      context.structSymbols.Remove((BTNode)symbol);
      FreeSymbol(symbol);
   }
   while((symbol = (Symbol)context.templateTypes.root))
   {
      context.templateTypes.Remove((BTNode)symbol);
      FreeTemplateType((TemplatedType)symbol);
   }

   context.nextID = 0;
   context.simpleID = 0;
   context.parent = null;
}

void FreeEnumerator(Enumerator enumerator)
{
   if(enumerator.id)
      FreeIdentifier(enumerator.id);
   if(enumerator.attribs)
      FreeList(enumerator.attribs, FreeAttrib);
   if(enumerator.exp)
      FreeExpression(enumerator.exp);

   delete enumerator;
}

void FreeSpecifier(Specifier spec)
{
   if(spec)
   {
      FreeSpecifierContents(spec);
      delete spec;
   }
}

void FreeSpecifierContents(Specifier spec)
{
   switch(spec.type)
   {
      case nameSpecifier:
      //case classSpecifier:
         delete spec.name;
         if(spec.templateArgs)
         {
            FreeList(spec.templateArgs, FreeTemplateArgument);
            spec.templateArgs = null;
         }
         if(spec.nsSpec)
         {
            FreeSpecifier(spec.nsSpec);
            spec.nsSpec = null;
         }
         break;
      case extendedSpecifier:
         if(spec.extDecl)
         {
            FreeExtDecl(spec.extDecl);
            spec.extDecl = null;
         }
         break;
      case enumSpecifier:
         if(spec.baseSpecs)
         {
            FreeList(spec.baseSpecs, FreeSpecifier);
            spec.baseSpecs = null;
         }
         if(spec.id)
         {
            FreeIdentifier(spec.id);
            spec.id = null;
         }
         if(spec.list)
         {
            FreeList(spec.list, FreeEnumerator);
            spec.list = null;
         }
         if(spec.definitions)
         {
            FreeList(spec.definitions, FreeClassDef);
            spec.definitions = null;
         }
         break;
      case structSpecifier:
      case unionSpecifier:
         if(spec.id)
         {
            FreeIdentifier(spec.id);
            spec.id = null;
         }
         if(spec.definitions)
         {
            FreeList(spec.definitions, FreeClassDef);
            spec.definitions = null;
         }
         if(spec.baseSpecs)
         {
            FreeList(spec.baseSpecs, FreeSpecifier);
            spec.baseSpecs = null;
         }
         if(spec.extDeclStruct)
         {
            FreeExtDecl(spec.extDeclStruct);
            spec.extDeclStruct = null;
         }
         if(spec.ctx)
         {
            FreeContext(spec.ctx);
            delete spec.ctx;
         }
         break;
      case subClassSpecifier:
         if(spec._class)
         {
            FreeSpecifier(spec._class);
            spec._class = null;
         }
         break;
   }
}

public void FreeIdentifier(Identifier id)
{
   if(id.badID)
      FreeIdentifier(id.badID);
   delete id.string;
   if(id._class)
      FreeSpecifier(id._class);
   delete id;
}

void FreeTypeName(TypeName typeName)
{
   if(typeName.qualifiers)
      FreeList(typeName.qualifiers, FreeSpecifier);
   if(typeName.declarator)
      FreeDeclarator(typeName.declarator);
   if(typeName.bitCount)
      FreeExpression(typeName.bitCount);

   delete typeName;
}

public void FreeExpContents(Expression exp)
{
   _FreeExpression(exp, false);
}

public void FreeExpression(Expression exp)
{
   _FreeExpression(exp, true);
}

static void _FreeExpression(Expression exp, bool freePointer)
{
#ifdef _DEBUG
   char debugExpString[4096];
   debugExpString[0] = '\0';
   PrintExpression(exp, debugExpString);
#endif
   switch(exp.type)
   {
      case newExp:
      case new0Exp:
         FreeExpression(exp._new.size);
         FreeTypeName(exp._new.typeName);
         break;
      case renewExp:
      case renew0Exp:
         FreeExpression(exp._renew.exp);
         FreeExpression(exp._renew.size);
         FreeTypeName(exp._renew.typeName);
         break;
      case constantExp:
         delete exp.constant;
         break;
      case identifierExp:
         if(exp.identifier)
            FreeIdentifier(exp.identifier);
         break;
      case instanceExp:
         if(exp.instance)
         {
            FreeInstance(exp.instance);
            exp.instance = null;
         }
         break;
      case stringExp:
         delete exp.string;
         break;
      case opExp:
         if(exp.op.exp1)
            FreeExpression(exp.op.exp1);
         if(exp.op.exp2)
            FreeExpression(exp.op.exp2);
         break;
      case bracketsExp:
      {
         FreeList(exp.list, FreeExpression);
         break;
      }
      case indexExp:
      {
         if(exp.index.exp)
            FreeExpression(exp.index.exp);
         if(exp.index.index)
            FreeList(exp.index.index, FreeExpression);
         break;
      }
      case callExp:
      {
         if(exp.call.exp)
            FreeExpression(exp.call.exp);
         if(exp.call.arguments)
            FreeList(exp.call.arguments, FreeExpression);
         break;
      }
      case memberExp:
      case pointerExp:
         if(exp.member.exp)
            FreeExpression(exp.member.exp);
         if(exp.member.member)
            FreeIdentifier(exp.member.member);
         break;
      case typeSizeExp:
         FreeTypeName(exp.typeName);
         break;
      case typeAlignExp:
         FreeTypeName(exp.typeName);
         break;
      case offsetOfExp:
         if(exp.offset.typeName)
            FreeTypeName(exp.offset.typeName);
         if(exp.offset.id)
            FreeIdentifier(exp.offset.id);
         break;
      case castExp:
         if(exp.cast.exp)
            FreeExpression(exp.cast.exp);
         FreeTypeName(exp.cast.typeName);
         break;
      case conditionExp:
      {
         if(exp.cond.cond)
            FreeExpression(exp.cond.cond);
         if(exp.cond.exp)
            FreeList(exp.cond.exp, FreeExpression);
         if(exp.cond.elseExp)
            FreeExpression(exp.cond.elseExp);
         break;
      }
      case extensionCompoundExp:
      {
         if(exp.compound)
            FreeStatement(exp.compound);
         break;
      }
      case extensionExpressionExp:
      {
         if(exp.list)
            FreeList(exp.list, FreeExpression);
         break;
      }
      case extensionInitializerExp:
      {
         if(exp.initializer.typeName)
            FreeTypeName(exp.initializer.typeName);
         if(exp.initializer.initializer)
            FreeInitializer(exp.initializer.initializer);
         break;
      }
      case dummyExp:
         break;
      case classExp:
         if(exp._classExp.specifiers)
            FreeList(exp._classExp.specifiers, FreeSpecifier);
         if(exp._classExp.decl)
            FreeDeclarator(exp._classExp.decl);
         break;
      case dbfieldExp:
      case dbindexExp:
      case dbtableExp:
         if(exp.db.id)
            FreeIdentifier(exp.db.id);
         delete exp.db.table;
         break;
      case dbopenExp:
         /*
         if(exp.call.arguments)
            FreeList(exp.call.arguments, FreeExpression);
         */
         if(exp.dbopen.ds)
            FreeExpression(exp.dbopen.ds);
         if(exp.dbopen.name)
            FreeExpression(exp.dbopen.name);
         break;
      case vaArgExp:
         if(exp.vaArg.exp)
            FreeExpression(exp.vaArg.exp);
         if(exp.vaArg.typeName)
            FreeTypeName(exp.vaArg.typeName);
         break;
      case arrayExp:
         if(exp.list)
            FreeList(exp.list, FreeExpression);
         break;
      case classSizeExp:
         if(exp._class)
            FreeSpecifier(exp._class);
         break;
      case classDataExp:
         if(exp.classData.id)
            FreeIdentifier(exp.classData.id);
            break;
      case symbolErrorExp:
         if(exp.identifier)
            FreeIdentifier(exp.identifier);
         break;
      case memoryErrorExp:
         delete exp.constant;
         break;
      case memberPropertyErrorExp:
      case memberSymbolErrorExp:
         if(exp.member.exp)
            FreeExpression(exp.member.exp);
         if(exp.member.member)
            FreeIdentifier(exp.member.member);
         break;
      case functionCallErrorExp:
         if(exp.call.exp)
            FreeExpression(exp.call.exp);
         if(exp.call.arguments)
            FreeList(exp.call.arguments, FreeExpression);
         break;
      case dereferenceErrorExp:
      case unknownErrorExp:
      case noDebuggerErrorExp:
         break;
   }
   if(freePointer)
   {
      if(exp.expType)
         FreeType(exp.expType);
      if(exp.destType)
         FreeType(exp.destType);
      delete exp;
   }
}

void FreePointer(Pointer pointer)
{
   if(pointer.pointer)
      FreePointer(pointer.pointer);
   if(pointer.qualifiers)
      FreeList(pointer.qualifiers, FreeSpecifier);
   delete pointer;
}

void FreeAttrib(Attrib attr)
{
   if(attr.attribs)
      FreeList(attr.attribs, FreeAttribute);
   delete attr;
}

void FreeAttribute(Attribute attr)
{
   delete attr.attr;
   if(attr.exp)
      FreeExpression(attr.exp);
   delete attr;
}

void FreeExtDecl(ExtDecl extDecl)
{
   if(extDecl.type == extDeclAttrib && extDecl.attr)
      FreeAttrib(extDecl.attr);
   else if(extDecl.type == extDeclString)
      delete extDecl.s;
   else if(extDecl.type == extDeclMultiAttrib && extDecl.multiAttr)
      FreeList(extDecl.multiAttr, FreeAttrib);
   delete extDecl;
}

void FreeDeclarator(Declarator decl)
{
   if(decl.declarator)
      FreeDeclarator(decl.declarator);

   switch(decl.type)
   {
      case structDeclarator:
         if(decl.structDecl.exp)
            FreeExpression(decl.structDecl.exp);
         if(decl.structDecl.posExp)
            FreeExpression(decl.structDecl.posExp);
         if(decl.structDecl.attrib)
            FreeAttrib(decl.structDecl.attrib);
         break;
      case identifierDeclarator:
         FreeIdentifier(decl.identifier);
         break;
      case bracketsDeclarator:
         break;
      case arrayDeclarator:
         if(decl.array.exp)
            FreeExpression(decl.array.exp);
         if(decl.array.enumClass)
            FreeSpecifier(decl.array.enumClass);
         break;
      case functionDeclarator:
         FreeList(decl.function.parameters, FreeTypeName);
         break;
      case pointerDeclarator:
         if(decl.pointer.pointer)
            FreePointer(decl.pointer.pointer);
         break;
      case extendedDeclarator:
      case extendedDeclaratorEnd:
         if(decl.extended.extended)
            FreeExtDecl(decl.extended.extended);
         break;
   }
   delete decl;
}

void FreePropertyWatch(PropertyWatch watcher)
{
   if(watcher.properties)
      FreeList(watcher.properties, FreeIdentifier);
   if(watcher.compound)
      FreeStatement(watcher.compound);
   delete watcher;
}

void FreeAsmField(AsmField field)
{
   if(field.expression)
      FreeExpression(field.expression);
   if(field.symbolic)
      FreeIdentifier(field.symbolic);
   delete field.command;
   delete field;
}

void FreeStatement(Statement stmt)
{
   switch(stmt.type)
   {
      case asmStmt:
      {
         if(stmt.asmStmt.spec)
            FreeSpecifier(stmt.asmStmt.spec);
         if(stmt.asmStmt.inputFields)
            FreeList(stmt.asmStmt.inputFields, FreeAsmField);
         if(stmt.asmStmt.outputFields)
            FreeList(stmt.asmStmt.outputFields, FreeAsmField);
         if(stmt.asmStmt.clobberedFields)
            FreeList(stmt.asmStmt.clobberedFields, FreeAsmField);
         delete stmt.asmStmt.statements;
         break;
      }
      case labeledStmt:
         if(stmt.labeled.stmt)
            FreeStatement(stmt.labeled.stmt);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
            FreeExpression(stmt.caseStmt.exp);
         if(stmt.caseStmt.stmt)
            FreeStatement(stmt.caseStmt.stmt);
         break;
      case badDeclarationStmt:
         if(stmt.decl)
            FreeDeclaration(stmt.decl);
         break;
      case compoundStmt:
      {
         if(stmt.compound.declarations)
            FreeList(stmt.compound.declarations, FreeDeclaration);
         if(stmt.compound.statements)
            FreeList(stmt.compound.statements, FreeStatement);
         if(stmt.compound.context)
         {
            FreeContext(stmt.compound.context);
            delete stmt.compound.context;
         }
         break;
      }
      case expressionStmt:
      {
         if(stmt.expressions)
            FreeList(stmt.expressions, FreeExpression);
         break;
      }
      case ifStmt:
      {
         if(stmt.ifStmt.exp)
            FreeList(stmt.ifStmt.exp, FreeExpression);
         if(stmt.ifStmt.stmt)
            FreeStatement(stmt.ifStmt.stmt);
         if(stmt.ifStmt.elseStmt)
            FreeStatement(stmt.ifStmt.elseStmt);
         break;
      }
      case switchStmt:
      {
         if(stmt.switchStmt.exp)
            FreeList(stmt.switchStmt.exp, FreeExpression);
         if(stmt.switchStmt.stmt)
            FreeStatement(stmt.switchStmt.stmt);
         break;
      }
      case whileStmt:
      {
         if(stmt.whileStmt.exp)
            FreeList(stmt.whileStmt.exp, FreeExpression);
         if(stmt.whileStmt.stmt)
            FreeStatement(stmt.whileStmt.stmt);
         break;
      }
      case doWhileStmt:
      {
         if(stmt.doWhile.stmt)
            FreeStatement(stmt.doWhile.stmt);

         if(stmt.doWhile.exp)
            FreeList(stmt.doWhile.exp, FreeExpression);
         break;
      }
      case forStmt:
      {
         if(stmt.forStmt.init)
            FreeStatement(stmt.forStmt.init);

         if(stmt.forStmt.check)
            FreeStatement(stmt.forStmt.check);

         if(stmt.forStmt.increment)
            FreeList(stmt.forStmt.increment, FreeExpression);
         if(stmt.forStmt.stmt)
            FreeStatement(stmt.forStmt.stmt);
         break;
      }
      case forEachStmt:
      {
         if(stmt.forEachStmt.id)
            FreeIdentifier(stmt.forEachStmt.id);
         if(stmt.forEachStmt.exp)
            FreeList(stmt.forEachStmt.exp, FreeExpression);
         if(stmt.forEachStmt.filter)
            FreeList(stmt.forEachStmt.filter, FreeExpression);
         if(stmt.forEachStmt.stmt)
            FreeStatement(stmt.forEachStmt.stmt);
         break;
      }
      case gotoStmt:
         break;
      case continueStmt:
         break;
      case breakStmt:
         break;
      case returnStmt:
         if(stmt.expressions)
            FreeList(stmt.expressions, FreeExpression);
         break;
      case watchStmt:
      case fireWatchersStmt:
      case stopWatchingStmt:
      {
         if(stmt._watch.watcher)
            FreeExpression(stmt._watch.watcher);
         if(stmt._watch.object)
            FreeExpression(stmt._watch.object);
         if(stmt._watch.watches)
            FreeList(stmt._watch.watches, (stmt.type == watchStmt) ? (void *)FreePropertyWatch : (void *)FreeIdentifier);
         break;
      }
   }
   delete stmt;
}

void FreeInitializer(Initializer initializer)
{
   switch(initializer.type)
   {
      case listInitializer:
         FreeList(initializer.list, FreeInitializer);
         break;
      case expInitializer:
         if(initializer.exp)
            FreeExpression(initializer.exp);
         break;
   }
   if(initializer.id)
      FreeIdentifier(initializer.id);
   delete initializer;
}

void FreeInitDeclarator(InitDeclarator decl)
{
   if(decl.declarator)
      FreeDeclarator(decl.declarator);
   if(decl.initializer)
      FreeInitializer(decl.initializer);
   delete decl;
}

void FreeDeclaration(Declaration decl)
{
   if(decl.symbol && !decl.symbol.type)
   {
      //FreeSymbol(decl.symbol);
   }
   switch(decl.type)
   {
      case structDeclaration:
      {
         if(decl.specifiers)
            FreeList(decl.specifiers, FreeSpecifier);
         if(decl.declarators)
            FreeList(decl.declarators, FreeDeclarator);
         if(decl.extStorage)
            FreeSpecifier(decl.extStorage);
         break;
      }
      case initDeclaration:
      {
         if(decl.specifiers)
            FreeList(decl.specifiers, FreeSpecifier);
         if(decl.declarators)
            FreeList(decl.declarators, FreeInitDeclarator);
         break;
      }
      case instDeclaration:
         if(decl.inst)
            FreeInstance(decl.inst);
         break;
      case defineDeclaration:
      {
         if(decl.exp)
            FreeExpression(decl.exp);
         if(decl.id)
            FreeIdentifier(decl.id);
         break;
      }
   }
   delete decl;
}

void FreeFunction(FunctionDefinition func)
{
   if(func.body)
      FreeStatement(func.body);
   if(func.declarator)
      FreeDeclarator(func.declarator);
   if(func.specifiers)
      FreeList(func.specifiers, FreeSpecifier);
   if(func.declarations)
      FreeList(func.declarations, FreeDeclaration);

   if(func.type)
      FreeType(func.type);

   delete func;
}

void FreeMemberInit(MemberInit init)
{
   if(init.initializer)
      FreeInitializer(init.initializer);
   if(init.identifiers)
      FreeList(init.identifiers, FreeIdentifier);
   delete init;
}

void FreeMembersInit(MembersInit init)
{
   if(init.type == dataMembersInit && init.dataMembers)
      FreeList(init.dataMembers, FreeMemberInit);

   if(init.type == methodMembersInit && init.function)
   {
      FreeClassFunction(init.function);
   }
   delete init;
}

public void FreeInstance(Instantiation inst)
{
   if(inst.members)
   {
      FreeList(inst.members, FreeMembersInit);
   }

   if(inst.exp)
      FreeExpression(inst.exp);

   if(inst.data)
   {
      Symbol classSym = FindClass(inst._class.name);
      Class _class = classSym ? classSym.registered : null;
      if(_class)
      {
         if(_class.type == normalClass)
         {
            Instance instance = (Instance)inst.data;
            delete instance;
         }
         else if(_class.type == noHeadClass)
         {
            if(_class.Destructor)
               _class.Destructor((Instance)inst.data);
            delete inst.data;
         }
         else if(_class.type == structClass)
         {
            delete inst.data;
         }
      }
      else
      {
         Instance instance = (Instance)inst.data;
         delete instance;
      }
   }

   if(inst._class)
      FreeSpecifier(inst._class);

   // Free symbol?
   // Free data;

   delete inst;
}

public void FreeClassFunction(ClassFunction func)
{
   // Tricky Stuff...
   if(func.declarator && func.declarator.symbol)
   {
      //FreeSymbol(func.declarator.symbol);
   }

   if(func.type)
      FreeType(func.type);

   if(func.body)
      FreeStatement(func.body);
   if(func.declarator)
      FreeDeclarator(func.declarator);
   if(func.specifiers)
      FreeList(func.specifiers, FreeSpecifier);
   if(func.declarations)
      FreeList(func.declarations, FreeDeclaration);

   func.attached.Free(null);

   delete func;
}

void FreeProperty(PropertyDef def)
{
   if(def.specifiers)
      FreeList(def.specifiers, FreeSpecifier);
   if(def.declarator)
      FreeDeclarator(def.declarator);
   if(def.id)
      FreeIdentifier(def.id);
   if(def.getStmt)
      FreeStatement(def.getStmt);
   if(def.setStmt)
      FreeStatement(def.setStmt);
   if(def.issetStmt)
      FreeStatement(def.issetStmt);
   if(def.category)
      FreeExpression(def.category);

   /*
   if(def.getFunction)
      FreeFunction(def.getFunction);
   if(def.setFunction)
      FreeFunction(def.setFunction);
   */
   if(def.symbol)
   {
      // FreeSymbol(def.symbol);
   }

   delete def;
}

void FreeClassDef(ClassDef def)
{
   switch(def.type)
   {
      case declarationClassDef:
         if(def.decl)
            FreeDeclaration(def.decl);
         break;
      case defaultPropertiesClassDef:
      {
         FreeList(def.defProperties, FreeMemberInit);
         break;
      }
      case functionClassDef:
         if(def.function)
            FreeClassFunction(def.function);
         break;
      case propertyClassDef:
         if(def.propertyDef)
            FreeProperty(def.propertyDef);
         break;
      case classPropertyClassDef:
         if(def.propertyDef)
            FreeProperty(def.propertyDef);
         break;
      case accessOverrideClassDef:
         break;
      case classDataClassDef:
      {
         if(def.decl)
            FreeDeclaration(def.decl);
         break;
      }
      case classDesignerClassDef:
      {
         delete def.designer;
         break;
      }
      case classFixedClassDef:
         break;
      case classNoExpansionClassDef:
         break;
      case classPropertyValueClassDef:
         if(def.id)
            FreeIdentifier(def.id);
         if(def.initializer)
            FreeInitializer(def.initializer);
         break;
      case designerDefaultPropertyClassDef:
      {
         if(def.defaultProperty)
            FreeIdentifier(def.defaultProperty);
         break;
      }
      case memberAccessClassDef:
         break;
      case propertyWatchClassDef:
      {
         if(def.propertyWatch)
            FreePropertyWatch(def.propertyWatch);
         break;
      }
   }
   delete def;
}

void FreeClass(ClassDefinition _class)
{
   if(_class.definitions)
      FreeList(_class.definitions, FreeClassDef);
   if(_class._class)
      FreeSpecifier(_class._class);
   if(_class.baseSpecs)
      FreeList(_class.baseSpecs, FreeSpecifier);

   delete _class;
}

void FreeDBIndexItem(DBIndexItem item)
{
   if(item.id)
      FreeIdentifier(item.id);
   delete item;
}

void FreeDBTableEntry(DBTableEntry entry)
{
   if(entry.id)
      FreeIdentifier(entry.id);
   switch(entry.type)
   {
      case fieldEntry:
         if(entry.dataType)
            FreeTypeName(entry.dataType);
         if(entry.name)
            delete entry.name;
         break;
      case indexEntry:
         if(entry.items)
            FreeList(entry.items, FreeDBIndexItem);
         break;
   }
   delete entry;
}

void FreeDBTable(DBTableDef table)
{
   if(table.definitions)
      FreeList(table.definitions, FreeDBTableEntry);
   /*if(table.symbol)
      FreeIdentifier(table.symbol);*/
   if(table.name)
      delete table.name;
   delete table;
}

void FreeExternal(External external)
{
   TopoEdge e;
   if(external.incoming)
   {
      while((e = external.incoming.first))
      {
         e.from.outgoing.Remove((IteratorPointer)e);
         external.incoming.Remove((IteratorPointer)e);
         delete e;
      }
   }
   if(external.outgoing)
   {
      while((e = external.outgoing.first))
      {
         e.to.incoming.Remove((IteratorPointer)e);
         external.outgoing.Remove((IteratorPointer)e);
         if(!e.breakable)
            e.to.nonBreakableIncoming--;
         delete e;
      }
   }
   switch(external.type)
   {
      case functionExternal:
         if(external.function)
            FreeFunction(external.function);
         break;
      case declarationExternal:
         if(external.declaration)
            FreeDeclaration(external.declaration);
         break;
      case classExternal:
         if(external._class)
            FreeClass(external._class);
         break;
      case importExternal:
         delete external.importString;
         break;
      case nameSpaceExternal:
         FreeIdentifier(external.id);
         break;
      case dbtableExternal:
         if(external.table)
            FreeDBTable(external.table);
         break;
      case pragmaExternal:
         delete external.pragma;
         break;
   }
   delete external;
}

public void FreeASTTree(OldList ast)
{
   if(ast != null)
   {
      External external;
      while((external = ast.first))
      {
         ast.Remove(external);
         FreeExternal(external);
      }
      delete ast;
   }
}

static void FreeDataMember(DataMember parentMember)
{
   DataMember dataMember;

   for(dataMember = parentMember.members.first; dataMember; dataMember = dataMember.next)
   {
      if(dataMember.type == structMember || dataMember.type == unionMember)
         FreeDataMember(dataMember);

      if(dataMember.dataType)
      {
         FreeType(dataMember.dataType);
         dataMember.dataType = null;
      }
   }
}

static void FreeClassProperties(ClassProperty classProp)
{
   if(classProp.left) FreeClassProperties(classProp.left);
   if(classProp.right) FreeClassProperties(classProp.right);
   if(classProp.dataType)
   {
      FreeType(classProp.dataType);
      classProp.dataType = null;
   }
}

void FreeModuleData(Module module)
{
   Class _class;
   GlobalFunction function;

   // Unload classes
   for(_class = module.classes.first; _class; _class = _class.next)
   {
      DataMember dataMember;
      Method method;
      ClassTemplateParameter param;

      if(_class.templateClass) continue;

      if(_class.dataType)
      {
         FreeType(_class.dataType);
         _class.dataType = null;
      }
      for(dataMember = _class.membersAndProperties.first; dataMember; dataMember = dataMember.next)
      {
         if(dataMember.isProperty)
         {
            Property prop = (Property)dataMember;
            if(prop.symbol)
            {
               FreeSymbol(prop.symbol);
            }
         }
         else
         {
            if(dataMember.type == structMember || dataMember.type == unionMember)
               FreeDataMember(dataMember);
         }
         if(dataMember.dataType)
         {
            FreeType(dataMember.dataType);
            dataMember.dataType = null;
         }
      }
      for(dataMember = _class.conversions.first; dataMember; dataMember = dataMember.next)
      {
         Property prop = (Property) dataMember;
         if(prop.symbol)
         {
            FreeSymbol(prop.symbol);
         }
         if(prop.dataType)
         {
            FreeType(prop.dataType);
            prop.dataType = null;
         }
      }
      if(_class.classProperties.first)
         FreeClassProperties((ClassProperty)_class.classProperties.first);
      for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
      {
         if(method.dataType)
         {
            FreeType(method.dataType);
            method.dataType = null;
         }

         if(method.symbol)
         {
            FreeSymbol(method.symbol);
         }
      }
      for(param = _class.templateParams.first; param; param = param.next)
      {
         if(param.param)
         {
            FreeTemplateParameter(param.param);
            param.param = null;
         }
      }
   }

   for(function = module.functions.first; function; function = function.next)
   {
      if(function.dataType)
         FreeType(function.dataType);
      if(function.symbol)
         FreeSymbol(function.symbol);
   }

   // Free the extra module instance on closing the last code editor using it
   if(!inCompiler)
   {
      MapIterator <String, List<Module> > mapIt { map = loadedModules };
      while(mapIt.Next())
      {
         List<Module> list = mapIt.data;
         Iterator<Module> it { list };
         bool found = false;
         while(it.Next())
         {
            if(it.data == module)
            {
               list.Remove(it.pointer);
               found = true;
               break;
            }
         }
         if(found)
         {
            if(list.count == 1)
            {
               // Unload the initial module that we loaded for safe sharing
               Module mod = list[0];
               list.Remove(list.GetFirst());
               loadedModules.Remove(mapIt.pointer);
               delete list;
               eModule_Unload(__thisModule.application, mod);
            }
            break;
         }
      }
   }
}

public void FreeTypeData(Module privateModule)
{
   Module m;
   for(m = privateModule.application.allModules.last; m; m = m.prev)
   {
      FreeModuleData(m);
   }
   FreeModuleData(privateModule);
}
