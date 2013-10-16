import "ide"

//extern Class thisClass;
extern Class insideClass;
extern Expression ctxInsideExp;
extern ClassFunction insideFunction;
extern ClassDef insideDef;
extern bool insideInstance;
static bool allocedDummyExp;

static Class currentClass;
static bool isAfterEqual;

static bool InsideIncl(Location loc, int line, int charPos)
{
   return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos <= charPos)) &&
          (loc.end.line > line || (loc.end.line == line && loc.end.charPos >= charPos));
}

static bool Inside(Location loc, int line, int charPos)
{
   return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos < charPos)) &&
          (loc.end.line > line || (loc.end.line == line && loc.end.charPos > charPos));
}

static bool InsideEndIncl(Location loc, int line, int charPos)
{
   return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos < charPos)) &&
          (loc.end.line > line || (loc.end.line == line && loc.end.charPos >= charPos));
}

static Identifier FindCtxSpecifier(Specifier spec, int line, int charPos)
{
   Identifier idResult;
   switch(spec.type)
   {
      case enumSpecifier:
      case structSpecifier:
      case unionSpecifier:
      {
         if(spec.definitions)
         {
            ClassDef def;
            for(def = spec.definitions->first; def; def = def.next)
            {
               // TODO: Should use the FindCtxClassDef function here right?

               //if(def.type == ClassDefDeclaration && def.decl && def.decl.type == DeclarationStruct)
               //   ProcessDeclaration(def.decl);
               switch(def.type)
               {
                  case declarationClassDef:
                     if(InsideIncl(&def.decl.loc, line, charPos))
                     {
                        idResult = FindCtxDeclaration(def.decl, line, charPos);
                        if(idResult)
                           return idResult;
                     }
                     break;
                  case defaultPropertiesClassDef:
                  {
                     MemberInit init;
                     for(init = def.defProperties->first; init; init = init.next)
                     {
                        if(InsideIncl(&init.realLoc, line, charPos))
                        {
                           Class oldThisClass = GetThisClass();
                           Context oldTopContext = GetTopContext();
                           SetThisClass(currentClass);
                           idResult = FindCtxMemberInit(init, line, charPos);
                           if(idResult)
                              return idResult;
                           SetThisClass(oldThisClass);
                        }
                     }
                     break;
                  }
                  case functionClassDef:
                     if(InsideIncl(&def.function.loc, line, charPos))
                     {
                        idResult = FindCtxClassFunction(def.function, line, charPos);

                        if(idResult)
                           return idResult;
                     }
                     break;
                  case propertyClassDef:
                     if(def.propertyDef)
                     {
                        if(InsideIncl(&def.propertyDef.loc, line, charPos))
                        {
                           idResult = FindCtxProperty(def.propertyDef, line, charPos);
                           if(idResult)
                              return idResult;
                        }
                     }
                     break;
                  case propertyWatchClassDef:
                     if(def.propertyWatch && def.propertyWatch.compound && InsideIncl(&def.propertyWatch.compound.loc, line, charPos))
                     {
                        Class oldThisClass = GetThisClass();
                        Context oldTopContext = GetTopContext();
                        SetThisClass(currentClass);
                        idResult = FindCtxStatement(def.propertyWatch.compound, line, charPos);
                        if(idResult) return idResult;
                        SetThisClass(oldThisClass);
                     }
                     break;
               }
            }
         }
         break;
      }
   }
   return null;
}

Identifier FindCtxIdentifier(Identifier id, int line, int charPos)
{
   //if(id.loc.end.line == line && id.loc.end.charPos == charPos)
   //if(InsideIncl(&id.loc.end.line == line && id.loc.end.charPos == charPos)

   if(id.badID && InsideIncl(&id.badID.loc, line, charPos))
      return FindCtxIdentifier(id.badID, line, charPos);

   return id;
   //return null;
}

Identifier FindCtxExpression(Expression exp, int line, int charPos)
{
   Identifier idResult = null;
   Expression oldExp = ctxInsideExp;

   ctxInsideExp = exp;
   switch(exp.type)
   {
      case newExp:
         if(InsideIncl(&exp._new.size.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp._new.size, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case renewExp:
         if(InsideIncl(&exp._renew.exp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp._renew.exp, line, charPos);
            if(idResult) return idResult;
         }
         if(InsideIncl(&exp._renew.size.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp._renew.size, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case constantExp:
         return (void *)-2;
      case identifierExp:
         idResult = FindCtxIdentifier(exp.identifier, line, charPos);
         if(idResult) return idResult;
         //return (void *)-1;
         break;
      case instanceExp:
         if(InsideIncl(&exp.instance.loc, line, charPos))
         {
            idResult = FindCtxInstance(exp.instance, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case stringExp:
         return (void *)-2;
         //break;
      case opExp:
         if(exp.op.exp1)
         {
            if(InsideIncl(&exp.op.exp1.loc, line, charPos))
            {
               idResult = FindCtxExpression(exp.op.exp1, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(exp.op.exp2)
         {
            // Why was this done?
            //if(InsideIncl(&exp.op.exp2.loc, line, charPos))
            if(InsideEndIncl(&exp.op.exp2.loc, line, charPos))
            {
               idResult = FindCtxExpression(exp.op.exp2, line, charPos);
               if(idResult) return idResult;
            }
            ctxInsideExp = exp.op.exp2;
            //return (void *)-1;
            return (void *)-2;
         }
         break;
      case bracketsExp:
      {
         Expression expression;

         for(expression = exp.list->first; expression; expression = expression.next)
         {
            if(InsideIncl(&expression.loc, line, charPos))
            {
               idResult = FindCtxExpression(expression, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case indexExp:
      {
         Expression expression;
         if(InsideIncl(&exp.index.exp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.index.exp, line, charPos);
            if(idResult) return idResult;
         }

         for(expression = exp.index.index->first; expression; expression = expression.next)
         {
            if(InsideIncl(&expression.loc, line, charPos))
            {
               idResult = FindCtxExpression(expression, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case callExp:
      {
         int arg;
         Type type = exp.call.exp.expType;

         if(InsideIncl(&exp.call.exp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.call.exp, line, charPos);
            if(idResult) return idResult;
         }

         if(exp.call.argLoc.start.line > line || (line == exp.call.argLoc.start.line && exp.call.argLoc.start.charPos >= charPos))
            arg = -1;
         else
            arg = 0;

         if(exp.call.arguments)
         {
            Expression expression;

            ctxInsideExp = null;

            for(expression = exp.call.arguments->first; expression; expression = expression.next)
            {
               if(InsideIncl(&expression.loc, line, charPos) || (expression.loc.end.line > line || (line == expression.loc.end.line && expression.loc.end.charPos > charPos)))
               {
                  if(Inside(&expression.loc, line, charPos))
                     idResult = FindCtxExpression(expression, line, charPos);

                  // Break
                  break;
               }
               arg++;
            }


            if(!ctxInsideExp && /*ctxInsideExp == exp && */type && type.kind == functionType)
            {
               int c;
               Type param;

               for(param = type.params.first, c = 0; c<arg && param; c++, param = param.next);

               if(param && arg != -1)
               {
                  allocedDummyExp = true;
                  ctxInsideExp = MkExpDummy();
                  ctxInsideExp.destType = param;
                  if(param) param.refCount++;
                  return idResult ? idResult : (void *)-1;
               }
            }
            if(idResult)
               return idResult;
         }
         break;
      }
      case memberExp:
         if(InsideIncl(&exp.member.exp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.member.exp, line, charPos);
            if(idResult) return idResult;
         }
         if(exp.addedThis)
            return exp.member.member; //(void *)-1;

         break;
      case pointerExp:
         if(InsideIncl(&exp.member.exp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.member.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case typeSizeExp:
         break;
      case castExp:
         if(InsideIncl(&exp.cast.exp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.cast.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case conditionExp:
         if(Inside(&exp.cond.cond.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.cond.cond, line, charPos);
            if(idResult) return idResult;
         }

         {
            Expression expression;
            for(expression = exp.cond.exp->first; expression; expression = expression.next)
            {
               if(InsideIncl(&expression.loc, line, charPos))
               {
                  idResult = FindCtxExpression(expression, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(InsideIncl(&exp.cond.elseExp.loc, line, charPos))
         {
            idResult = FindCtxExpression(exp.cond.elseExp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case dummyExp:
         return (void *)-2;
   }

   if(exp.destType && !exp.destType.truth) // && !exp.addedThis)
      return (void *)-1;

   ctxInsideExp = oldExp;
   return null;
}

static Identifier FindCtxStatement(Statement stmt, int line, int charPos)
{
   Identifier idResult;

   switch(stmt.type)
   {
      case labeledStmt:
         if(InsideIncl(&stmt.labeled.stmt.loc, line, charPos))
            return FindCtxStatement(stmt.labeled.stmt, line, charPos);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            if(InsideIncl(&stmt.caseStmt.exp.loc, line, charPos))
               return FindCtxExpression(stmt.caseStmt.exp, line, charPos);
         }

         if(stmt.caseStmt.stmt)
         {
            if(InsideIncl(&stmt.caseStmt.stmt.loc, line, charPos))
               return FindCtxStatement(stmt.caseStmt.stmt, line, charPos);
         }
         break;
      case badDeclarationStmt:
      {
         Declaration decl = stmt.decl;
         if(InsideIncl(&decl.loc, line, charPos))
         {
            idResult = FindCtxDeclaration(decl, line, charPos);
            if(idResult) return idResult;
         }
         break;
      }
      case compoundStmt:
      {
         if(!stmt.compound.isSwitch)
            SetCurrentContext(stmt.compound.context);
         if(stmt.compound.declarations)
         {
            Declaration decl;
            for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
            {
               if(InsideIncl(&decl.loc, line, charPos))
               {
                  idResult = FindCtxDeclaration(decl, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(stmt.compound.statements)
         {
            Statement statement;
            for(statement = stmt.compound.statements->first; statement; statement = statement.next)
            {
               if(InsideIncl(&statement.loc, line, charPos))
               {
                  idResult = FindCtxStatement(statement, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         return (void *)-1;
         //curContext = stmt.compound.context.parent;
         //break;
      }
      case expressionStmt:
      {
         if(stmt.expressions)
         {
            Expression exp;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case ifStmt:
      {
         Expression exp;
         for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
         {
            if(InsideIncl(&exp.loc, line, charPos))
            {
               idResult = FindCtxExpression(exp, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.ifStmt.stmt)
         {
            if(InsideIncl(&stmt.ifStmt.stmt.loc, line, charPos))
            {
               idResult = FindCtxStatement(stmt.ifStmt.stmt, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.ifStmt.elseStmt)
         {
            if(InsideIncl(&stmt.ifStmt.elseStmt.loc, line, charPos))
               return FindCtxStatement(stmt.ifStmt.elseStmt, line, charPos);
         }
         break;
      }
      case switchStmt:
      {
         Expression exp;
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
         {
            if(InsideIncl(&exp.loc, line, charPos))
            {
               idResult = FindCtxExpression(exp, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(InsideIncl(&stmt.switchStmt.stmt.loc, line, charPos))
            return FindCtxStatement(stmt.switchStmt.stmt, line, charPos);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         if(stmt.whileStmt.exp)
         {
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(stmt.whileStmt.stmt && InsideIncl(&stmt.whileStmt.stmt.loc, line, charPos))
            return FindCtxStatement(stmt.whileStmt.stmt, line, charPos);
         break;
      }
      case doWhileStmt:
      {
         if(InsideIncl(&stmt.doWhile.stmt.loc, line, charPos))
         {
            idResult = FindCtxStatement(stmt.doWhile.stmt, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.doWhile.exp)
         {
            Expression exp;
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case forStmt:
      {
         Expression exp;

         if(stmt.forStmt.init && InsideIncl(&stmt.forStmt.init.loc, line, charPos))
         {
            idResult = FindCtxStatement(stmt.forStmt.init, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.forStmt.check && InsideIncl(&stmt.forStmt.check.loc, line, charPos))
         {
            idResult = FindCtxStatement(stmt.forStmt.check, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }

         if(stmt.forStmt.stmt)
            return FindCtxStatement(stmt.forStmt.stmt, line, charPos);
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
         {
            Expression exp;

            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      case fireWatchersStmt:
      case stopWatchingStmt:
      {
         Identifier _watch;
         if(stmt._watch.watcher && InsideIncl(&stmt._watch.watcher.loc, line, charPos))
         {
            idResult = FindCtxExpression(stmt._watch.watcher, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.object && InsideIncl(&stmt._watch.object.loc, line, charPos))
         {
            idResult = FindCtxExpression(stmt._watch.object, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(InsideIncl(&_watch.loc, line, charPos))
               {
                  idResult = FindCtxIdentifier(_watch, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case watchStmt:
      {
         PropertyWatch _watch;
         if(stmt._watch.watcher && InsideIncl(&stmt._watch.watcher.loc, line, charPos))
         {
            idResult = FindCtxExpression(stmt._watch.watcher, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.object && InsideIncl(&stmt._watch.object.loc, line, charPos))
         {
            idResult = FindCtxExpression(stmt._watch.object, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(_watch.compound && InsideIncl(&_watch.compound.loc, line, charPos))
               {
                  idResult = FindCtxStatement(_watch.compound, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
   }
   return null;
}

static Identifier FindCtxInitializer(Initializer initializer, int line, int charPos)
{
   switch(initializer.type)
   {
      case listInitializer:
      {
         Initializer init;
         Identifier idResult;

         for(init = initializer.list->first; init; init = init.next)
         {
            if(InsideIncl(&init.loc, line, charPos))
            {
               idResult = FindCtxInitializer(init, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case expInitializer:
         if(InsideIncl(&initializer.exp.loc, line, charPos))
            return FindCtxExpression(initializer.exp, line, charPos);

         {
            ctxInsideExp = initializer.exp;
            return (void *)-1;
         }
         break;
   }
   return null;
}

static Identifier FindCtxInitDeclarator(InitDeclarator decl, int line, int charPos)
{
   if(decl.initializer && InsideIncl(&decl.initializer.loc, line, charPos))
      return FindCtxInitializer(decl.initializer, line, charPos);
   return null;
}

static Identifier FindCtxDeclaration(Declaration decl, int line, int charPos)
{
   Identifier idResult;

   switch(decl.type)
   {
      case structDeclaration:
      {
         Specifier spec;
         if(decl.specifiers)
         {
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               if(InsideIncl(&spec.loc, line, charPos))
               {
                  idResult = FindCtxSpecifier(spec, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         /*Declarator d;
         if(decl.declarators && decl.declarators->first)
         {
            for(d = decl.declarators->first; d; d = d.next)
            {
               if(InsideIncl(&d.loc, line, charPos))
               {
                  if(d.type == DeclaratorStruct && d.declarator && d.declarator.type == DeclaratorIdentifier)
                     return d.declarator.identifier;
               }
            }
         }
         */
         break;
      }
      case initDeclaration:
      {
         // Need to loop through specifiers to look for :: completion
         if(decl.specifiers)
         {
            Specifier s;

            for(s = decl.specifiers->first; s; s = s.next)
            {
               if(InsideIncl(&s.loc, line, charPos))
               {
                  idResult = FindCtxSpecifier(s, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }

         if(decl.declarators && decl.declarators->first)
         {
            InitDeclarator d;
            for(d = decl.declarators->first; d; d = d.next)
            {
               if(InsideIncl(&d.loc, line, charPos))
               {
                  idResult = FindCtxInitDeclarator(d, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case instDeclaration:
         if(InsideIncl(&decl.inst.loc, line, charPos))
            return FindCtxInstance(decl.inst, line, charPos);
         break;
   }
   return null;
}

static Identifier FindCtxFunction(FunctionDefinition func, int line, int charPos)
{
   if(func.body && Inside(&func.body.loc, line, charPos))
   {
      Identifier idResult;

      Identifier id = GetDeclId(func.declarator);
      Symbol symbol = func.declarator.symbol;
      Type type = symbol.type;
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();

      idResult = FindCtxStatement(func.body, line, charPos);
      if(idResult)
         return idResult;

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Identifier FindCtxMemberInit(MemberInit init, int line, int charPos)
{
   Identifier idResult;
   if(init.initializer && InsideIncl(&init.initializer.loc, line, charPos))
   {
      idResult = FindCtxInitializer(init.initializer, line, charPos);
      if(idResult)
      {
         if(init.identifiers && init.identifiers->first)
            isAfterEqual = true;
         return idResult;
      }
   }
   if(init.identifiers && init.identifiers->first && InsideIncl(&((Identifier)init.identifiers->first).loc, line, charPos))
   {
      idResult = FindCtxIdentifier(init.identifiers->first, line, charPos);
      if(idResult)
         return (void *)-2; //idResult;
   }
   if(init.initializer && Inside(&init.initializer.loc, line, charPos))
   {
      if(init.identifiers && init.identifiers->first)
         isAfterEqual = true;

      if(init.initializer.type == expInitializer)
      {
         ctxInsideExp = init.initializer.exp;
         return (void *)-1;
      }
   }
   return null;
}

static Identifier FindCtxInstance(Instantiation inst, int line, int charPos)
{
   Identifier idResult = null;
   Class oldThisClass = GetThisClass();
   Symbol sym = inst._class ? FindClass(inst._class.name) : null;
   bool insideSomething = false;
   bool insideBrackets;
   Method method = null;

   Class curClass = null;
   DataMember curMember = null;
   DataMember dataMember = null;
   DataMember subMemberStack[256];
   int subMemberStackPos = 0;

   if(sym)
      SetThisClass(sym.registered);

   insideBrackets = !(inst.insideLoc.start.line > line || (line == inst.insideLoc.start.line && inst.insideLoc.start.charPos > charPos));
   if(insideBrackets)
   {
      // Start with first member
      eClass_FindNextMember(GetThisClass(), &curClass, &curMember, subMemberStack, &subMemberStackPos);
      dataMember = curMember;
   }

   if(inst.members)
   {
      MembersInit init;
      MemberInit memberInit;
      for(init = inst.members->first; init; init = init.next)
      {
         if(init.loc.start.line > line || (line == init.loc.start.line && init.loc.start.charPos > charPos))
            break;

         if(init.type == dataMembersInit && init.dataMembers && insideBrackets && sym)
         {
            for(memberInit = init.dataMembers->first; memberInit; memberInit = memberInit.next)
            {
               isAfterEqual = false;

               if(memberInit.identifiers && memberInit.identifiers->first)
               {
                  DataMember _subMemberStack[256];
                  int _subMemberStackPos = 0;
                  DataMember thisMember = eClass_FindDataMember(GetThisClass(), ((Identifier)memberInit.identifiers->first).string, GetPrivateModule(), _subMemberStack, &_subMemberStackPos);
                  if(!thisMember)
                  {
                     // WARNING: Brackets needed until precomp fix
                     thisMember = (DataMember)eClass_FindProperty(GetThisClass(), ((Identifier)memberInit.identifiers->first).string, GetPrivateModule());
                  }
                  if(thisMember)
                  {
                     method = null;
                     dataMember = thisMember;
                     if(thisMember.memberAccess == publicAccess)
                     {
                        curMember = thisMember;
                        curClass = thisMember._class;
                        memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                        subMemberStackPos = _subMemberStackPos;
                     }
                  }
                  else
                     method = eClass_FindMethod(GetThisClass(), ((Identifier)memberInit.identifiers->first).string, GetPrivateModule());
               }

               if(!idResult && InsideIncl(&memberInit.realLoc, line, charPos))
                  idResult = FindCtxMemberInit(memberInit, line, charPos);

               if(InsideIncl(&memberInit.realLoc, line, charPos) || (memberInit.realLoc.end.line > line || (line == memberInit.realLoc.end.line && memberInit.realLoc.end.charPos > charPos)))
               {
                  if(memberInit.identifiers && memberInit.identifiers->first && InsideIncl(&memberInit.loc, line, charPos) && !dataMember)
                     insideBrackets = false;
                  break;
               }
               else if((!memberInit.identifiers || !memberInit.identifiers->first || dataMember) && (memberInit.next || !Inside(&init.loc, line, charPos)))
               {
                  method = null;
                  eClass_FindNextMember(GetThisClass(), &curClass, &curMember, subMemberStack, &subMemberStackPos);
                  dataMember = curMember;
               }
            }
         }

         if(InsideIncl(&init.loc, line, charPos))
         {
            if(Inside(&init.loc, line, charPos))
               if(init.type == methodMembersInit)
                  insideSomething = true;

            if(init.type == methodMembersInit && Inside(&init.function.loc, line, charPos))
            {
               idResult = FindCtxClassFunction(init.function, line, charPos);
               if(init.function == insideFunction)
                  insideDef = (ClassDef)init; // Only using prev member of insideDef
            }

            if(Inside(&init.loc, line, charPos))
               break;
         }

         if((init.loc.end.line > line || (line == init.loc.end.line && init.loc.end.charPos > charPos)))
            break;
      }
   }
   if((!idResult || idResult != (Identifier)-1) && sym && sym.registered && InsideIncl(&inst.insideLoc, line, charPos) && insideBrackets && !insideSomething)
   {
      if(dataMember && !method)
      {
         if(!dataMember.dataType)
            dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
         allocedDummyExp = true;
         ctxInsideExp = MkExpDummy();
         ctxInsideExp.destType = dataMember.dataType;
         if(ctxInsideExp.destType) ctxInsideExp.destType.refCount++;
      }
   }

   if((!idResult || idResult != (Identifier)-1) && sym && sym.registered && InsideIncl(&inst.insideLoc, line, charPos) && !insideSomething && insideBrackets)
   {
      if(method)
      {
         allocedDummyExp = true;
         ctxInsideExp = MkExpDummy();
         ctxInsideExp.destType = method.dataType;
         if(ctxInsideExp.destType) ctxInsideExp.destType.refCount++;
      }
   }

   if(sym && !insideSomething && InsideIncl(&inst.insideLoc, line, charPos))
   {
      if(!isAfterEqual && !insideClass && (!idResult || idResult == (void *)-2))
         insideClass = sym.registered;

      if(isAfterEqual && currentClass)
         SetThisClass(currentClass);

      return idResult ? idResult : (void *) -1;
   }
   if(idResult)
      return idResult;

   SetThisClass(oldThisClass);

   return null;
}

static Identifier FindCtxClassFunction(ClassFunction func, int line, int charPos)
{
   if(func.body && Inside(&func.body.loc, line, charPos))
   {
      Identifier idResult;

      Identifier id = GetDeclId(func.declarator);
      Symbol symbol = func.declarator ? func.declarator.symbol : null;
      Type type = symbol ? symbol.type : null;
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass((type && type.thisClass) ? type.thisClass.registered : currentClass);

      if(func.body)
      {
         idResult = FindCtxStatement(func.body, line, charPos);
         if(idResult)
            return idResult;
      }

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   else if(!func.body && GetFuncDecl(func.declarator))
   {
      if(!GetThisClass())
         SetThisClass(currentClass);
      else
      {
         insideInstance = true;
         // Is this insideClass ever used?
         insideClass = GetThisClass(); //currentClass;
      }
      insideFunction = func;
      return (void *)-1;
   }
   else if(!func.body && GetDeclId(func.declarator))
   {
      if(!GetThisClass())
         SetThisClass(currentClass);
      else
      {
         insideInstance = true;

         // Has to be GetThisClass() to work...
         insideClass = GetThisClass();//currentClass;
      }
      return (void *)-1;
   }
   else
   {
      // TESTING THIS FOR HANDLING: bool ^bool NotifyClicked
      insideInstance = true;

      // Has to be GetThisClass() to work...
      insideClass = GetThisClass();//currentClass;
   }
   return null;
}

static Identifier FindCtxProperty(PropertyDef def, int line, int charPos)
{
   Identifier result;
   if(def.getStmt && Inside(&def.getStmt.loc, line, charPos))
   {
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass(currentClass);
      result = FindCtxStatement(def.getStmt, line, charPos);
      if(result) return result;
      SetThisClass(oldThisClass);
   }
   if(def.setStmt && Inside(&def.setStmt.loc, line, charPos))
   {
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass(currentClass);
      result = FindCtxStatement(def.setStmt, line, charPos);
      if(result) return result;
      SetThisClass(oldThisClass);
   }
   return null;
}

static Identifier FindCtxClassDef(ClassDef def, int line, int charPos)
{
   Identifier idResult;
   switch(def.type)
   {
      case declarationClassDef:
         if(InsideEndIncl(&def.decl.loc, line, charPos))
         {
            idResult = FindCtxDeclaration(def.decl, line, charPos);
            if(idResult)
               return idResult;
         }
         break;
      case defaultPropertiesClassDef:
      {
         MemberInit init;
         for(init = def.defProperties->first; init; init = init.next)
         {
            if(InsideIncl(&init.realLoc, line, charPos))
            {
               Class oldThisClass = GetThisClass();
               Context oldTopContext = GetTopContext();
               SetThisClass(currentClass);
               idResult = FindCtxMemberInit(init, line, charPos);
               if(idResult)
                  return idResult;
               SetThisClass(oldThisClass);
            }
         }
         break;
      }
      case functionClassDef:
         if(Inside(&def.function.loc, line, charPos))
         {
            idResult = FindCtxClassFunction(def.function, line, charPos);
            if(def.function == insideFunction)
               insideDef = def;

            if(idResult)
               return idResult;
         }
         break;
      case propertyClassDef:
         if(def.propertyDef)
         {
            if(Inside(&def.propertyDef.loc, line, charPos))
            {
               idResult = FindCtxProperty(def.propertyDef, line, charPos);
               if(idResult)
                  return idResult;
            }
         }
         break;
      case propertyWatchClassDef:
         if(def.propertyWatch && def.propertyWatch.compound && Inside(&def.propertyWatch.compound.loc, line, charPos))
         {
            Class oldThisClass = GetThisClass();
            Context oldTopContext = GetTopContext();
            SetThisClass(currentClass);
            idResult = FindCtxStatement(def.propertyWatch.compound, line, charPos);
            if(idResult) return idResult;
            SetThisClass(oldThisClass);
         }
         break;
   }
   return null;
}

static Identifier FindCtxClass(ClassDefinition _class, int line, int charPos)
{
   Identifier idResult;
   bool insideSomething = false;
   if(_class.definitions)
   {
      ClassDef def;
      for(def = _class.definitions->first; def; def = def.next)
      {
         if(def.type == defaultPropertiesClassDef ? InsideIncl(&def.loc, line, charPos) : Inside(&def.loc, line, charPos) )
         {
            if(def.type != defaultPropertiesClassDef)
               insideSomething = true;

            idResult = FindCtxClassDef(def, line, charPos);
            if(idResult)
               return idResult;
            else
               insideSomething = false;
         }
      }
   }
   if(!insideSomething && line > _class.blockStart.start.line || (line == _class.blockStart.start.line && charPos >= _class.blockStart.start.charPos) )
   {
      insideClass = _class.symbol.registered;
      return (void *)-1;
   }
   return null;
}

Identifier FindCtxTree(OldList ast, int line, int charPos)
{
   Identifier idResult;
   External external;

   if(allocedDummyExp)
   {
      FreeExpression(ctxInsideExp);
      allocedDummyExp = false;
   }

   insideClass = null;
   ctxInsideExp = null;
   SetThisClass(null);
   insideFunction = null;
   insideInstance = false;
   isAfterEqual = false;

   if(ast != null)
   {
      for(external = ast.first; external; external = external.next)
      {
         switch(external.type)
         {
            case functionExternal:
               if(Inside(&external.loc, line, charPos))
               {
                  idResult = FindCtxFunction(external.function, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1 || idResult == (void *)-2) ? null : idResult;
               }
               break;
            case declarationExternal:
               if(InsideIncl(&external.loc, line, charPos))
               {
                  idResult = FindCtxDeclaration(external.declaration, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1 || idResult == (void *)-2) ? null : idResult;
               }
               break;
            case classExternal:
               if(Inside(&external._class.loc, line, charPos))
               {
                  currentClass = external._class.symbol.registered;
                  idResult = FindCtxClass(external._class, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1 || idResult == (void *)-2) ? null : idResult;
                  currentClass = null;
               }
               break;
         }
      }
   }
   return null;
}

void FindCtx_Terminate()
{
   if(allocedDummyExp)
   {
      FreeExpression(ctxInsideExp);
      allocedDummyExp = false;
   }
}
