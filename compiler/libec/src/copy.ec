import "ecdefs"

Identifier CopyIdentifier(Identifier id)
{
   if(id)
   {
      Identifier copy = MkIdentifier(id.string);
      // TODO: Name Space Fix ups
      // copy.nameSpace = id.nameSpace;
      copy._class = id._class ? CopySpecifier(id._class) : null;
      copy.classSym = id.classSym;
      return copy;
   }
   return null;
}

static Pointer CopyPointer(Pointer ptr)
{
   if(ptr)
   {
      OldList * list = MkList();
      Specifier spec;
      if(ptr.qualifiers)
      {
         for(spec = ptr.qualifiers->first; spec; spec = spec.next)
            ListAdd(list, CopySpecifier(spec));
      }
      return MkPointer(list, CopyPointer(ptr.pointer));
   }
   return null;
}

static Initializer CopyInitializer(Initializer initializer)
{
   Initializer copy = null;;
   if(initializer && initializer.type == expInitializer)
      copy = MkInitializerAssignment(CopyExpression(initializer.exp));
   else if(initializer && initializer.type == listInitializer)
      copy = MkInitializerList(CopyList(initializer.list, CopyInitializer));
   if(copy)
   {
      copy.loc = initializer.loc;
      if(initializer.id)
         copy.id = CopyIdentifier(initializer.id);
      copy.isConstant = initializer.isConstant;
   }
   return copy;
}

static MemberInit CopyMemberInit(MemberInit member)
{
   return MkMemberInit(CopyList(member.identifiers, CopyIdentifier), CopyInitializer(member.initializer));
}

static MembersInit CopyMembersInit(MembersInit members)
{
   OldList * list = null;
   switch(members.type)
   {
      /*case methodMembersInit:
         return MkMembersInitMethod(CopyClassFunction(
         */
      case dataMembersInit:
      {
         if(members)
         {
            MemberInit member;

            list = MkList();

            for(member = members.dataMembers->first; member; member = member.next)
               ListAdd(list, CopyMemberInit(member));

         }
      }
   }
   return MkMembersInitList(list);
}

static Instantiation CopyInstantiation(Instantiation inst)
{
   Instantiation copy;
   OldList * list = MkList();
   MembersInit member;
   if(inst.members)
   {
      for(member = inst.members->first; member; member = member.next)
         ListAdd(list, CopyMembersInit(member));
   }
   copy = MkInstantiation(CopySpecifier(inst._class), CopyExpression(inst.exp), list);
   copy.data = inst.data;
   if(inst.data)
   {
      Symbol classSym = FindClass(inst._class.name);
      Class _class = classSym ? classSym.registered : null;
      if(_class)
      {
         if(_class.type == normalClass)
            ((Instance)copy.data)._refCount++;
      }
   }

   copy.loc = inst.loc;
   copy.isConstant = inst.isConstant;
   return copy;
}

Expression MoveExpContents(Expression exp)
{
   Expression newExp { };
   *newExp = *exp;
   newExp.prev = null;
   newExp.next = null;
   newExp.destType = null;
   if(exp.expType)
      exp.expType.refCount++;
   return newExp;
}

/*static */public Expression CopyExpression(Expression exp)
{
   Expression result = null;
   if(exp)
      switch(exp.type)
      {
         case dummyExp:
            result = MkExpDummy();
            break;
         case identifierExp:
            result = MkExpIdentifier(CopyIdentifier(exp.identifier));
            break;
         case instanceExp:
            result = MkExpInstance(CopyInstantiation(exp.instance));
            break;
         case constantExp:
            result = MkExpConstant(exp.string);
            break;
         case stringExp:
            result = MkExpString(exp.string);
            break;
         case opExp:
            result = MkExpOp(CopyExpression(exp.op.exp1), exp.op.op, CopyExpression(exp.op.exp2));
            break;
         case bracketsExp:
         {
            OldList * list = MkList();
            Expression e;
            for(e = exp.list->first; e; e = e.next)
               ListAdd(list, CopyExpression(e));
            result = MkExpBrackets(list);
            break;
         }
         case indexExp:
         {
            OldList * list = MkList();
            Expression e;
            for(e = exp.index.index->first; e; e = e.next)
               ListAdd(list, CopyExpression(e));
            result = MkExpIndex(CopyExpression(exp.index.exp), list);
            break;
         }
         case callExp:
         {
            OldList * list = MkList();
            Expression arg;
            if(exp.call.arguments)
            {
               for(arg = exp.call.arguments->first; arg; arg = arg.next)
                  ListAdd(list, CopyExpression(arg));
            }
            result = MkExpCall(CopyExpression(exp.call.exp), list);
            break;
         }
         case memberExp:
            result = MkExpMember(CopyExpression(exp.member.exp),
               CopyIdentifier(exp.member.member));
            result.member.memberType = exp.member.memberType;
            result.member.thisPtr = exp.member.thisPtr;
            break;
         case pointerExp:
            result = MkExpPointer(CopyExpression(exp.member.exp),
               CopyIdentifier(exp.member.member));
            break;
         case typeSizeExp:
            result = MkExpTypeSize(CopyTypeName(exp.typeName));
            break;
         case typeAlignExp:
            result = MkExpTypeAlign(CopyTypeName(exp.typeName));
            break;
         case offsetOfExp:
            result = MkExpOffsetOf(CopyTypeName(exp.typeName), CopyIdentifier(exp.identifier));
            break;
         case castExp:
            result = MkExpCast(CopyTypeName(exp.cast.typeName), CopyExpression(exp.cast.exp));
            break;
         case conditionExp:
         {
            OldList * list = MkList();
            Expression e;
            for(e = exp.cond.exp->first; e; e = e.next)
               ListAdd(list, CopyExpression(e));
            result = MkExpCondition(CopyExpression(exp.cond.cond), list,
               CopyExpression(exp.cond.elseExp));
            break;
         }
         case vaArgExp:
            result = MkExpVaArg(CopyExpression(exp.vaArg.exp), CopyTypeName(exp.vaArg.typeName));
            break;
         case extensionCompoundExp:
            result = MkExpExtensionCompound(CopyStatement(exp.compound));
            break;
         case extensionInitializerExp:
            result = MkExpExtensionInitializer(CopyTypeName(exp.initializer.typeName), CopyInitializer(exp.initializer.initializer));
            break;
         case classExp:
            result = MkExpClass(CopyList(exp._classExp.specifiers, CopySpecifier), CopyDeclarator(exp._classExp.decl));
            break;
      }
   if(result)
   {
      result.expType = exp.expType;
      if(exp.expType) exp.expType.refCount++;
      result.destType = exp.destType;
      if(exp.destType) exp.destType.refCount++;
      result.loc = exp.loc;
      result.isConstant = exp.isConstant;
      result.byReference = exp.byReference;
      result.opDestType = exp.opDestType;
      result.usedInComparison = exp.usedInComparison;
      result.needTemplateCast = exp.needTemplateCast;
      result.parentOpDestType = exp.parentOpDestType;
   }

   return result;
}

// WARNING: NOT COPYING CONTEXT
static Statement CopyStatement(Statement stmt)
{
   Statement result = null;
   if(stmt)
   {
      switch(stmt.type)
      {
         case compoundStmt:
            result = MkCompoundStmt(CopyList(stmt.compound.declarations, CopyDeclaration), CopyList(stmt.compound.statements, CopyStatement));
            result.compound.context = Context { };
            break;
         case expressionStmt:
            result = MkExpressionStmt(CopyList(stmt.expressions, CopyExpression));
            break;
         case badDeclarationStmt:
            result = MkBadDeclStmt(CopyDeclaration(stmt.decl));
            break;
      }
   }
   if(result)
   {
      result.loc = stmt.loc;
   }
   return result;
}

static Enumerator CopyEnumerator(Enumerator enumerator)
{
   return MkEnumerator(CopyIdentifier(enumerator.id), CopyExpression(enumerator.exp), CopyList(enumerator.attribs, CopyAttrib));
}

ClassDef CopyClassDef(ClassDef def)
{
   switch(def.type)
   {
      case functionClassDef:
         return null; //return MkClassDefFunction(CopyClassFunction(def.function));
      case defaultPropertiesClassDef:
         return null; //return MkClassDefDefaultProperty(CopyList(def.defProperties, CopyDefaultProperty));
      case declarationClassDef:
         return MkClassDefDeclaration(CopyDeclaration(def.decl));
      case propertyClassDef:
         return null; //return MkClassDefProperty(CopyProperty(def.propertyDef));
   }
   return null;
}

Specifier CopySpecifier(Specifier spec)
{
   if(spec)
      switch(spec.type)
      {
         case baseSpecifier:
            return MkSpecifier(spec.specifier);
         case enumSpecifier:
         {
            Identifier id = CopyIdentifier(spec.id);
            OldList * list = MkList();
            Enumerator enumerator;
            if(spec.list)
            {
               for(enumerator = spec.list->first; enumerator; enumerator = enumerator.next)
                  ListAdd(list, CopyEnumerator(enumerator));
            }
            return MkEnum(id, list);
         }
         case structSpecifier:
         case unionSpecifier:
         {
            Identifier id = CopyIdentifier(spec.id);
            OldList * list = null;
            ClassDef def;
            Specifier s;
            if(spec.definitions)
            {
               list = MkList();
               if(spec.list)
               {
                  for(def = spec.list->first; def; def = def.next)
                     ListAdd(list, CopyClassDef(def));
               }
            }
            s = MkStructOrUnion(spec.type, id, list);
            s.extDeclStruct = CopyExtDecl(spec.extDeclStruct);
            return s;
         }
         case nameSpecifier:
         {
            Specifier copy { type = nameSpecifier, name = CopyString(spec.name), symbol = spec.symbol, templateArgs = null /*CopyList(spec.templateArgs, CopyTemplateArgument)*/ };
            return copy;
            // return _MkSpecifierName(spec.name, spec.symbol, spec.templateArgs);
         }
         case subClassSpecifier:
            return MkSpecifierSubClass(CopySpecifier(spec._class));
         case templateTypeSpecifier:
            return { loc = spec.loc, type = templateTypeSpecifier, templateParameter = spec.templateParameter };
   /*      case classSpecifier:
            return MkClassName(spec.name);
   */
         case extendedSpecifier:
            return MkSpecifierExtended(CopyExtDecl(spec.extDecl));
      }
   return null;
}

TypeName CopyTypeName(TypeName typeName)
{
   OldList * list = null;
   TypeName copy;

   if(typeName.qualifiers)
   {
      Specifier spec;
      list = MkList();
      for(spec = typeName.qualifiers->first; spec; spec = spec.next)
         ListAdd(list, CopySpecifier(spec));
   }
   copy = MkTypeName(list, CopyDeclarator(typeName.declarator));
   copy.classObjectType = typeName.classObjectType;
   //copy.typedObject = typeName.typedObject;
   //copy.byReference = typeName.byReference;
   return copy;
}

ExtDecl CopyExtDecl(ExtDecl extDecl)
{
   if(extDecl)
   {
      if(extDecl.type == extDeclAttrib)
         return MkExtDeclAttrib(CopyAttrib(extDecl.attr));
      else if(extDecl.type == extDeclString)
         return MkExtDeclString(CopyString(extDecl.s));
      else if(extDecl.type == extDeclMultiAttrib)
         return MkExtDeclMultiAttrib(CopyList(extDecl.multiAttr, CopyAttrib));
   }
   return null;
}

Attribute CopyAttribute(Attribute attrib)
{
   if(attrib)
      return MkAttribute(CopyString(attrib.attr), CopyExpression(attrib.exp));
   return null;
}

Attrib CopyAttrib(Attrib attrib)
{
   if(attrib)
      return MkAttrib(attrib.type, CopyList(attrib.attribs, CopyAttribute));
   return null;
}

Declarator CopyDeclarator(Declarator declarator)
{
   if(declarator)
   {
      switch(declarator.type)
      {
         case structDeclarator:
         {
            Declarator decl = MkStructDeclarator(CopyDeclarator(declarator.declarator),
               CopyExpression(declarator.structDecl.exp));
            if(declarator.structDecl.attrib)
               decl.structDecl.attrib = CopyAttrib(declarator.structDecl.attrib);
            return decl;
         }
         case identifierDeclarator:
            return MkDeclaratorIdentifier(CopyIdentifier(declarator.identifier));
         case bracketsDeclarator:
            return MkDeclaratorBrackets(CopyDeclarator(declarator.declarator));
         case arrayDeclarator:
            if(declarator.array.enumClass)
               return MkDeclaratorEnumArray(CopyDeclarator(declarator.declarator),
                  CopySpecifier(declarator.array.enumClass));
            else
               return MkDeclaratorArray(CopyDeclarator(declarator.declarator),
                  CopyExpression(declarator.array.exp));
         case functionDeclarator:
         {
            OldList * parameters = MkList();
            TypeName param;
            if(declarator.function.parameters)
            {
               for(param = declarator.function.parameters->first; param; param = param.next)
                  ListAdd(parameters, CopyTypeName(param));
            }
            return MkDeclaratorFunction(CopyDeclarator(declarator.declarator), parameters);
         }
         case pointerDeclarator:
            return MkDeclaratorPointer(CopyPointer(declarator.pointer.pointer),
               CopyDeclarator(declarator.declarator));
         case extendedDeclarator:
            return MkDeclaratorExtended(CopyExtDecl(declarator.extended.extended), CopyDeclarator(declarator.declarator));
         case extendedDeclaratorEnd:
            return MkDeclaratorExtendedEnd(CopyExtDecl(declarator.extended.extended), CopyDeclarator(declarator.declarator));
      }
   }
   return null;
}

InitDeclarator CopyInitDeclarator(InitDeclarator initDecl)
{
   return MkInitDeclarator(CopyDeclarator(initDecl.declarator), CopyInitializer(initDecl.initializer));
}

Declaration CopyDeclaration(Declaration decl)
{
   if(decl.type == initDeclaration)
   {
      return MkDeclaration(CopyList(decl.specifiers, CopySpecifier), CopyList(decl.declarators, CopyInitDeclarator));
   }
   else
   {
      OldList * specifiers = MkList(), * declarators = MkList();
      Specifier spec;
      Declarator declarator;
      for(spec = decl.specifiers->first; spec; spec = spec.next)
         ListAdd(specifiers, CopySpecifier(spec));
      if(decl.declarators)
      {
         for(declarator = decl.declarators->first; declarator; declarator = declarator.next)
            ListAdd(declarators, CopyDeclarator(declarator));
      }
      return MkDeclaration(specifiers, declarators);
   }
}

OldList * CopyList(OldList * source, void * (*CopyFunction)(void *))
{
   OldList * list = null;
   if(source)
   {
      Item item;
      list = MkList();
      for(item = source->first; item; item = item.next)
         ListAdd(list, CopyFunction(item));
   }
   return list;
}
