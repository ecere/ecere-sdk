import "ide"

//extern Class thisClass;
extern Class insideClass;
extern Type instanceType;
extern char * instanceName;
extern Expression paramsInsideExp;
extern int paramsID;
extern Type functionType;

static bool insideParams;
static Class currentClass;
static bool isAfterEqual;
static bool allocedDummyExp;

static bool InsideIncl(Location loc, int line, int charPos)
{
   /*
   return (loc.start.line < line || (loc.start.line == line && loc.start.charPos <= charPos)) &&
          (loc.end.line > line || (loc.end.line == line && loc.end.charPos >= charPos));
          */
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

Identifier FindParamsIdentifier(Identifier id, int line, int charPos)
{
   //if(id.loc.end.line == line && id.loc.end.charPos == charPos)
   //if(InsideIncl(&id.loc.end.line == line && id.loc.end.charPos == charPos)
   return id;
   return null;
}

Identifier FindParamsExpression(Expression exp, int line, int charPos)
{
   Identifier idResult = null;
   Expression oldExp = paramsInsideExp;

   paramsInsideExp = exp;
   switch(exp.type)
   {
      case newExp:
         if(InsideIncl(&exp._new.size.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp._new.size, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case renewExp:
         if(InsideIncl(&exp._renew.exp.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp._renew.exp, line, charPos);
            if(idResult) return idResult;
         }
         if(InsideIncl(&exp._renew.size.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp._renew.size, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case identifierExp:
      case constantExp:
         idResult = FindParamsIdentifier(exp.identifier, line, charPos);
         if(idResult) return idResult;
         //return (void *)-1;
         break;
      case instanceExp:
         if(InsideIncl(&exp.instance.loc, line, charPos))
         {
            idResult = FindParamsInstance(exp.instance, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case stringExp:
         break;
      case opExp:
         if(exp.op.exp1)
         {
            if(InsideIncl(&exp.op.exp1.loc, line, charPos))
            {
               idResult = FindParamsExpression(exp.op.exp1, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(exp.op.exp2)
         {
            // Changed this here, assuming this was changed first in findCtx and not needed here...
            // Bug when "a = atoi()" parameters popup dissappear when on the a of atoi
            if(InsideIncl(&exp.op.exp2.loc, line, charPos))
            //if(InsideEndIncl(&exp.op.exp2.loc, line, charPos))
            {
               idResult = FindParamsExpression(exp.op.exp2, line, charPos);
               if(idResult) return idResult;
            }
            paramsInsideExp = exp.op.exp2;
         }
         break;
      case bracketsExp:
      {
         Expression expression;

         for(expression = exp.list->first; expression; expression = expression.next)
         {
            if(InsideIncl(&expression.loc, line, charPos))
            {
               idResult = FindParamsExpression(expression, line, charPos);
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
            idResult = FindParamsExpression(exp.index.exp, line, charPos);
            if(idResult) return idResult;
         }

         for(expression = exp.index.index->first; expression; expression = expression.next)
         {
            if(InsideIncl(&expression.loc, line, charPos))
            {
               idResult = FindParamsExpression(expression, line, charPos);
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
            idResult = FindParamsExpression(exp.call.exp, line, charPos);
            // Check for type here?
            if(!functionType && !instanceType)
            {
               functionType = type;
               if(paramsInsideExp == exp.call.exp)
                  paramsInsideExp = exp;
            }
            if(idResult) return idResult;
         }

         if(exp.call.argLoc.start.line > line || (line == exp.call.argLoc.start.line && exp.call.argLoc.start.charPos >= charPos))
            arg = -1;
         else
            arg = 0;

         if(exp.call.arguments)
         {
            Expression expression;

            for(expression = exp.call.arguments->first; expression; expression = expression.next)
            {
               if(InsideIncl(&expression.loc, line, charPos) || (expression.loc.end.line > line || (line == expression.loc.end.line && expression.loc.end.charPos > charPos)))
               {
                  idResult = FindParamsExpression(expression, line, charPos);
                  insideParams = true;
                  // TOCHECK: Verify && vs || priority here
                  if((functionType && paramsID != -1) || instanceType)
                     return (void *)-1;
                  break;
               }
               if(expression.next)
                  arg++;
            }

            if(exp.call.argLoc.end.line < line || (line == exp.call.argLoc.end.line && exp.call.argLoc.end.charPos <= charPos))
               arg = -1;
            else if(arg > -1)
               insideParams = true;

            if(type && (type.kind == functionType || type.kind == methodType))
            {
               int c;
               Type param;
               if(type.kind == methodType)
                  type = type.method.dataType;

               paramsInsideExp = exp;
               functionType = type;
               paramsID = arg;

               for(param = type.params.first, c = 0; c<arg && param; c++, param = (param.kind == ellipsisType ? param : param.next));
               if(!param) paramsID = -1;
            }
            return (void *)-1;
         }
         break;
      }
      case memberExp:
         if(InsideIncl(&exp.member.exp.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp.member.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case pointerExp:
         if(InsideIncl(&exp.member.exp.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp.member.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case typeSizeExp:
         break;
      case castExp:
         if(InsideIncl(&exp.cast.exp.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp.cast.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case conditionExp:
         if(Inside(&exp.cond.cond.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp.cond.cond, line, charPos);
            if(idResult) return idResult;
         }

         {
            Expression expression;
            for(expression = exp.cond.exp->first; expression; expression = expression.next)
            {
               if(InsideIncl(&expression.loc, line, charPos))
               {
                  idResult = FindParamsExpression(expression, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(InsideIncl(&exp.cond.elseExp.loc, line, charPos))
         {
            idResult = FindParamsExpression(exp.cond.elseExp, line, charPos);
            if(idResult) return idResult;
         }
         break;
   }
   paramsInsideExp = oldExp;
   return null;
}

static Identifier FindParamsStatement(Statement stmt, int line, int charPos)
{
   Identifier idResult;

   switch(stmt.type)
   {
      case labeledStmt:
         if(InsideIncl(&stmt.labeled.stmt.loc, line, charPos))
            return FindParamsStatement(stmt.labeled.stmt, line, charPos);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            if(InsideIncl(&stmt.caseStmt.exp.loc, line, charPos))
               return FindParamsExpression(stmt.caseStmt.exp, line, charPos);
         }

         if(stmt.caseStmt.stmt)
         {
            if(InsideIncl(&stmt.caseStmt.stmt.loc, line, charPos))
               return FindParamsStatement(stmt.caseStmt.stmt, line, charPos);
         }
         break;
      case badDeclarationStmt:
      {
         Declaration decl = stmt.decl;
         if(InsideIncl(&decl.loc, line, charPos))
         {
            idResult = FindParamsDeclaration(decl, line, charPos);
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
                  idResult = FindParamsDeclaration(decl, line, charPos);
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
                  idResult = FindParamsStatement(statement, line, charPos);
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
                  idResult = FindParamsExpression(exp, line, charPos);
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
               idResult = FindParamsExpression(exp, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.ifStmt.stmt)
         {
            if(InsideIncl(&stmt.ifStmt.stmt.loc, line, charPos))
            {
               idResult = FindParamsStatement(stmt.ifStmt.stmt, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.ifStmt.elseStmt)
         {
            if(InsideIncl(&stmt.ifStmt.elseStmt.loc, line, charPos))
               return FindParamsStatement(stmt.ifStmt.elseStmt, line, charPos);
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
               idResult = FindParamsExpression(exp, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.switchStmt.stmt && InsideIncl(&stmt.switchStmt.stmt.loc, line, charPos))
            return FindParamsStatement(stmt.switchStmt.stmt, line, charPos);
         break;
      }
      case whileStmt:
      {
         if(stmt.whileStmt.exp)
         {
            Expression exp;
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindParamsExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(stmt.whileStmt.stmt && InsideIncl(&stmt.whileStmt.stmt.loc, line, charPos))
            return FindParamsStatement(stmt.whileStmt.stmt, line, charPos);
         break;
      }
      case doWhileStmt:
      {
         Expression exp;

         if(stmt.doWhile.stmt && InsideIncl(&stmt.doWhile.stmt.loc, line, charPos))
         {
            idResult = FindParamsStatement(stmt.doWhile.stmt, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.doWhile.exp)
         {
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindParamsExpression(exp, line, charPos);
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
            idResult = FindParamsStatement(stmt.forStmt.init, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.forStmt.check && InsideIncl(&stmt.forStmt.check.loc, line, charPos))
         {
            idResult = FindParamsStatement(stmt.forStmt.check, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = FindParamsExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }

         if(stmt.forStmt.stmt)
            return FindParamsStatement(stmt.forStmt.stmt, line, charPos);
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
                  idResult = FindParamsExpression(exp, line, charPos);
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
            idResult = FindParamsExpression(stmt._watch.watcher, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.object && InsideIncl(&stmt._watch.object.loc, line, charPos))
         {
            idResult = FindParamsExpression(stmt._watch.object, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(InsideIncl(&_watch.loc, line, charPos))
               {
                  idResult = FindParamsIdentifier(_watch, line, charPos);
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
            idResult = FindParamsExpression(stmt._watch.watcher, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.object && InsideIncl(&stmt._watch.object.loc, line, charPos))
         {
            idResult = FindParamsExpression(stmt._watch.object, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(_watch.compound && InsideIncl(&_watch.compound.loc, line, charPos))
               {
                  idResult = FindParamsStatement(_watch.compound, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
   }
   return null;
}

static Identifier FindParamsInitializer(Initializer initializer, int line, int charPos)
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
               idResult = FindParamsInitializer(init, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case expInitializer:
         if(InsideIncl(&initializer.exp.loc, line, charPos))
            return FindParamsExpression(initializer.exp, line, charPos);

         {
            paramsInsideExp = initializer.exp;
            return (void *)-1;
         }
         break;
   }
   return null;
}

static Identifier FindParamsInitDeclarator(InitDeclarator decl, int line, int charPos)
{
   if(decl.initializer && InsideIncl(&decl.initializer.loc, line, charPos))
      return FindParamsInitializer(decl.initializer, line, charPos);
   return null;
}

static Identifier FindParamsSpecifier(Specifier spec, int line, int charPos)
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
               // TODO: Should use FindParamsClassDef here right?

               //if(def.type == ClassDefDeclaration && def.decl && def.decl.type == DeclarationStruct)
               //   ProcessDeclaration(def.decl);
               switch(def.type)
               {
                  case declarationClassDef:
                     if(InsideIncl(&def.decl.loc, line, charPos))
                     {
                        idResult = FindParamsDeclaration(def.decl, line, charPos);
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
                           idResult = FindParamsMemberInit(init, line, charPos);
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
                        idResult = FindParamsClassFunction(def.function, line, charPos);

                        if(idResult)
                           return idResult;
                     }
                     break;
                  case propertyClassDef:
                     if(def.propertyDef)
                     {
                        if(InsideIncl(&def.propertyDef.loc, line, charPos))
                        {
                           idResult = FindParamsProperty(def.propertyDef, line, charPos);
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
                        idResult = FindParamsStatement(def.propertyWatch.compound, line, charPos);
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

static Identifier FindParamsDeclaration(Declaration decl, int line, int charPos)
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
                  idResult = FindParamsSpecifier(spec, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case initDeclaration:
      {
         InitDeclarator d;
         // Need to loop through specifiers to look for :: completion
         if(decl.specifiers)
         {
            Specifier s;

            for(s = decl.specifiers->first; s; s = s.next)
            {
               if(InsideIncl(&s.loc, line, charPos))
               {
                  idResult = FindParamsSpecifier(s, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }

         if(decl.declarators && decl.declarators->first)
         {
            for(d = decl.declarators->first; d; d = d.next)
            {
               if(InsideIncl(&d.loc, line, charPos))
               {
                  idResult = FindParamsInitDeclarator(d, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case instDeclaration:
         if(InsideIncl(&decl.inst.loc, line, charPos))
            return FindParamsInstance(decl.inst, line, charPos);
         break;
   }
   return null;
}

static Identifier FindParamsFunction(FunctionDefinition func, int line, int charPos)
{
   if(func.body && Inside(&func.body.loc, line, charPos))
   {
      Identifier idResult;

      Identifier id = GetDeclId(func.declarator);
      Symbol symbol = func.declarator.symbol;
      Type type = symbol.type;
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();

      idResult = FindParamsStatement(func.body, line, charPos);
      if(idResult)
         return idResult;

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Identifier FindParamsMemberInit(MemberInit init, int line, int charPos)
{
   Identifier idResult;
   if(init.initializer && InsideIncl(&init.initializer.loc, line, charPos))
   {
      idResult = FindParamsInitializer(init.initializer, line, charPos);
      if(idResult)
      {
         if(init.identifiers && init.identifiers->first)
            isAfterEqual = true;
         return idResult;
      }
   }
   if(init.identifiers && init.identifiers->first && InsideIncl(&((Identifier)init.identifiers->first).loc, line, charPos))
   {
      idResult = FindParamsIdentifier(init.identifiers->first, line, charPos);
      if(idResult)
         return idResult;
   }
   if(init.initializer && Inside(&init.initializer.loc, line, charPos))
   {
      if(init.identifiers && init.identifiers->first)
         isAfterEqual = true;

      if(init.initializer.type == expInitializer)
      {
         paramsInsideExp = init.initializer.exp;
         return (void *)-1;
      }
   }
   return null;
}

static Identifier FindParamsInstance(Instantiation inst, int line, int charPos)
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
                  idResult = FindParamsMemberInit(memberInit, line, charPos);

               if(InsideIncl(&memberInit.realLoc, line, charPos) || (memberInit.realLoc.end.line > line || (line == memberInit.realLoc.end.line && memberInit.realLoc.end.charPos > charPos)))
               {
                  if(memberInit.identifiers && memberInit.identifiers->first && InsideIncl(&memberInit.loc, line, charPos) && !dataMember)
                     insideBrackets = false;
                  break;
               }
               else if((!memberInit.identifiers || !memberInit.identifiers->first || curMember) && (memberInit.next || !Inside(&init.loc, line, charPos)))
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
               idResult = FindParamsClassFunction(init.function, line, charPos);
            }

            if(Inside(&init.loc, line, charPos))
               break;
         }

         if((init.loc.end.line > line || (line == init.loc.end.line && init.loc.end.charPos > charPos)))
            break;
      }
   }
   if(!insideParams && sym && sym.registered && InsideIncl(&inst.insideLoc, line, charPos) && insideBrackets && !insideSomething)
   {
      if(dataMember && !method)
      {
         if(!dataMember.dataType)
            dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
         paramsInsideExp = MkExpDummy();
         allocedDummyExp = true;
         paramsInsideExp.destType = dataMember.dataType;
         if(paramsInsideExp.destType) paramsInsideExp.destType.refCount++;

         functionType = null;
         instanceType = paramsInsideExp.destType;
         instanceName = dataMember.name;
         insideParams = true;
      }
   }

   if(!insideParams && sym && sym.registered && InsideIncl(&inst.insideLoc, line, charPos) && !insideSomething && insideBrackets)
   {
      if(method)
      {
         paramsInsideExp = MkExpDummy();
         allocedDummyExp = true;
         paramsInsideExp.destType = method.dataType;
         if(paramsInsideExp.destType) paramsInsideExp.destType.refCount++;

         functionType = null;
         instanceType = paramsInsideExp.destType;
         instanceName = method.name;
      }
      insideParams = true;
   }

   if(sym && !insideSomething && InsideIncl(&inst.insideLoc, line, charPos))
   {
      if(!isAfterEqual && !insideClass)
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

static Identifier FindParamsClassFunction(ClassFunction func, int line, int charPos)
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

      idResult = FindParamsStatement(func.body, line, charPos);
      if(idResult)
         return idResult;

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Identifier FindParamsProperty(PropertyDef def, int line, int charPos)
{
   Identifier result;
   if(def.getStmt && Inside(&def.getStmt.loc, line, charPos))
   {
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass(currentClass);
      result = FindParamsStatement(def.getStmt, line, charPos);
      if(result) return result;
      SetThisClass(oldThisClass);
   }
   if(def.setStmt && Inside(&def.setStmt.loc, line, charPos))
   {
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass(currentClass);
      result = FindParamsStatement(def.setStmt, line, charPos);
      if(result) return result;
      SetThisClass(oldThisClass);
   }
   return null;
}

static Identifier FindParamsClassDef(ClassDef def, int line, int charPos)
{
   Identifier idResult;
   switch(def.type)
   {
      case declarationClassDef:
         if(Inside(&def.decl.loc, line, charPos))
         {
            idResult = FindParamsDeclaration(def.decl, line, charPos);
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
               idResult = FindParamsMemberInit(init, line, charPos);
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
            idResult = FindParamsClassFunction(def.function, line, charPos);
            if(idResult)
               return idResult;
         }
         break;
      case propertyClassDef:
         if(def.propertyDef)
         {
            if(Inside(&def.propertyDef.loc, line, charPos))
            {
               idResult = FindParamsProperty(def.propertyDef, line, charPos);
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
            idResult = FindParamsStatement(def.propertyWatch.compound, line, charPos);
            if(idResult) return idResult;
            SetThisClass(oldThisClass);
         }
         break;
   }
   return null;
}

static Identifier FindParamsClass(ClassDefinition _class, int line, int charPos)
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

            idResult = FindParamsClassDef(def, line, charPos);
            if(idResult)
               return idResult;
         }
      }
   }
   if(!insideSomething)
   {
      insideClass = _class.symbol.registered;
      return (void *)-1;
   }
   return null;
}

Identifier FindParamsTree(OldList ast, int line, int charPos)
{
   Identifier idResult;
   External external;

   if(allocedDummyExp)
   {
      FreeExpression(paramsInsideExp);
      allocedDummyExp = false;
   }

   insideClass = null;
   paramsInsideExp = null;
   SetThisClass(null);
   paramsID = -1;
   functionType = null;
   instanceType = null;
   instanceName = null;
   insideParams = false;
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
                  idResult = FindParamsFunction(external.function, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1) ? null : idResult;
               }
               break;
            case declarationExternal:
               if(InsideIncl(&external.loc, line, charPos))
               {
                  idResult = FindParamsDeclaration(external.declaration, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1) ? null : idResult;
               }
               break;
            case classExternal:
               if(Inside(&external._class.loc, line, charPos))
               {
                  currentClass = external._class.symbol.registered;
                  idResult = FindParamsClass(external._class, line, charPos);
                  currentClass = null;
                  if(idResult)
                     return (idResult == (void *)-1) ? null : idResult;
               }
               break;
         }
      }
   }
   return null;
}

void FindParams_Terminate()
{
   if(allocedDummyExp)
   {
      FreeExpression(paramsInsideExp);
      allocedDummyExp = false;
   }
}
