#ifdef ECERE_STATIC
import static "ec"
#else
import "ec"
#endif

//extern Class thisClass;
static Class currentClass;

static bool InsideIncl(Location loc, int line, int charPos)
{
   //return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos <= charPos)) &&
   //       (loc.end.line > line || (loc.end.line == line && loc.end.charPos >= charPos));
   return !loc.start.included && loc.start.line <= line && loc.end.line >= line;
}
/*
static bool Inside(Location loc, int line, int charPos)
{
   //return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos < charPos)) &&
   //       (loc.end.line > line || (loc.end.line == line && loc.end.charPos > charPos));
   return !loc.start.included && loc.start.line < line &&  loc.end.line > line;
}*/

static bool InsideEndIncl(Location loc, int line, int charPos)
{
   //return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos < charPos)) &&
   //       (loc.end.line > line || (loc.end.line == line && loc.end.charPos >= charPos));
   return !loc.start.included && loc.start.line < line &&  loc.end.line >= line;
}

static Identifier DebugFindCtxSpecifier(Specifier spec, int line, int charPos)
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
               // TODO: Should use DebugFindCtxClassDef here right?

               //if(def.type == ClassDefDeclaration && def.decl && def.decl.type == DeclarationStruct)
               //   ProcessDeclaration(def.decl);
               switch(def.type)
               {
                  case declarationClassDef:
                     if(def.decl && InsideIncl(&def.decl.loc, line, charPos))
                     {
                        idResult = DebugFindCtxDeclaration(def.decl, line, charPos);
                        if(idResult)
                           return idResult;
                     }
                     break;
                  case defaultPropertiesClassDef:
                  {
                     MemberInit init;
                     for(init = def.defProperties ? def.defProperties->first : null; init; init = init.next)
                     {
                        if(InsideIncl(&init.realLoc, line, charPos))
                        {
                           Class oldThisClass = GetThisClass();
                           Context oldTopContext = GetTopContext();
                           SetThisClass(currentClass);
                           idResult = DebugFindCtxMemberInit(init, line, charPos);
                           if(idResult)
                              return idResult;
                           SetThisClass(oldThisClass);
                           SetTopContext(oldTopContext);
                        }
                     }
                     break;
                  }
                  case functionClassDef:
                     if(def.function && InsideIncl(&def.function.loc, line, charPos))
                     {
                        idResult = DebugFindCtxClassFunction(def.function, line, charPos);

                        if(idResult)
                           return idResult;
                     }
                     break;
                  case propertyClassDef:
                     if(def.propertyDef)
                     {
                        if(InsideIncl(&def.propertyDef.loc, line, charPos))
                        {
                           idResult = DebugFindCtxProperty(def.propertyDef, line, charPos);
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
                        idResult = DebugFindCtxStatement(def.propertyWatch.compound, line, charPos);
                        if(idResult) return idResult;
                        SetThisClass(oldThisClass);
                        SetTopContext(oldTopContext);
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


Identifier DebugFindCtxIdentifier(Identifier id, int line, int charPos)
{
   //if(id.loc.end.line == line && id.loc.end.charPos == charPos)
   //if(InsideIncl(&id.loc.end.line == line && id.loc.end.charPos == charPos)

   if(id.badID && InsideIncl(&id.badID.loc, line, charPos))
      return DebugFindCtxIdentifier(id.badID, line, charPos);

   return id;
   //return null;
}

Identifier DebugFindCtxExpression(Expression exp, int line, int charPos)
{
   Identifier idResult = null;

   switch(exp.type)
   {
      case newExp:
         if(exp._new.size && InsideIncl(&exp._new.size.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp._new.size, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case renewExp:
         if(exp._renew.exp && InsideIncl(&exp._renew.exp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp._renew.exp, line, charPos);
            if(idResult) return idResult;
         }
         if(exp._renew.size && InsideIncl(&exp._renew.size.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp._renew.size, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case constantExp:
         return (void *)-2;
      case identifierExp:
         if(exp.identifier)
         {
            idResult = DebugFindCtxIdentifier(exp.identifier, line, charPos);
            if(idResult) return idResult;
         }
         //return (void *)-1;
         break;
      case instanceExp:
         if(exp.instance && InsideIncl(&exp.instance.loc, line, charPos))
         {
            idResult = DebugFindCtxInstance(exp.instance, line, charPos);
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
               idResult = DebugFindCtxExpression(exp.op.exp1, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(exp.op.exp2)
         {
            // Why was this done?
            //if(InsideIncl(&exp.op.exp2.loc, line, charPos))
            if(InsideEndIncl(&exp.op.exp2.loc, line, charPos))
            {
               idResult = DebugFindCtxExpression(exp.op.exp2, line, charPos);
               if(idResult) return idResult;
            }
            //return (void *)-1;
            return (void *)-2;
         }
         break;
      case bracketsExp:
      {
         Expression expression;

         for(expression = exp.list ? exp.list->first : null; expression; expression = expression.next)
         {
            if(InsideIncl(&expression.loc, line, charPos))
            {
               idResult = DebugFindCtxExpression(expression, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case indexExp:
      {
         Expression expression;
         if(exp.index.exp && InsideIncl(&exp.index.exp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.index.exp, line, charPos);
            if(idResult) return idResult;
         }

         for(expression = exp.index.index ? exp.index.index->first : null; expression; expression = expression.next)
         {
            if(InsideIncl(&expression.loc, line, charPos))
            {
               idResult = DebugFindCtxExpression(expression, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case callExp:
      {
         int arg;
         if(exp.call.exp && InsideIncl(&exp.call.exp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.call.exp, line, charPos);
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
                  if(InsideIncl(&expression.loc, line, charPos))
                     idResult = DebugFindCtxExpression(expression, line, charPos);

                  // Break
                  break;
               }
               arg++;
            }


            if(idResult)
               return idResult;
         }
         break;
      }
      case memberExp:
         if(exp.member.exp && InsideIncl(&exp.member.exp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.member.exp, line, charPos);
            if(idResult) return idResult;
         }
         if(exp.addedThis)
            return exp.member.member; //(void *)-1;

         break;
      case pointerExp:
         if(exp.member.exp && InsideIncl(&exp.member.exp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.member.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case typeSizeExp:
         break;
      case castExp:
         if(exp.cast.exp && InsideIncl(&exp.cast.exp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.cast.exp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case conditionExp:
         if(exp.cond.cond && InsideIncl(&exp.cond.cond.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.cond.cond, line, charPos);
            if(idResult) return idResult;
         }

         {
            Expression expression;
            for(expression = exp.cond.exp ? exp.cond.exp->first : null; expression; expression = expression.next)
            {
               if(InsideIncl(&expression.loc, line, charPos))
               {
                  idResult = DebugFindCtxExpression(expression, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(exp.cond.elseExp && InsideIncl(&exp.cond.elseExp.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(exp.cond.elseExp, line, charPos);
            if(idResult) return idResult;
         }
         break;
      case dummyExp:
         return (void *)-2;
   }
   return (void *)-1;
}

static Identifier DebugFindCtxStatement(Statement stmt, int line, int charPos)
{
   Identifier idResult;

   switch(stmt.type)
   {
      case labeledStmt:
         if(stmt.labeled.stmt && InsideIncl(&stmt.labeled.stmt.loc, line, charPos))
            return DebugFindCtxStatement(stmt.labeled.stmt, line, charPos);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            if(InsideIncl(&stmt.caseStmt.exp.loc, line, charPos))
               return DebugFindCtxExpression(stmt.caseStmt.exp, line, charPos);
         }

         if(stmt.caseStmt.stmt)
         {
            if(InsideIncl(&stmt.caseStmt.stmt.loc, line, charPos))
               return DebugFindCtxStatement(stmt.caseStmt.stmt, line, charPos);
         }
         break;
      case badDeclarationStmt:
      {
         Declaration decl = stmt.decl;
         if(decl && InsideIncl(&decl.loc, line, charPos))
         {
            idResult = DebugFindCtxDeclaration(decl, line, charPos);
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
                  idResult = DebugFindCtxDeclaration(decl, line, charPos);
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
                  idResult = DebugFindCtxStatement(statement, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         return (void *)-1;
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
                  idResult = DebugFindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case ifStmt:
      {
         Expression exp;
         for(exp = stmt.ifStmt.exp ? stmt.ifStmt.exp->first : null; exp; exp = exp.next)
         {
            if(InsideIncl(&exp.loc, line, charPos))
            {
               idResult = DebugFindCtxExpression(exp, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.ifStmt.stmt)
         {
            if(InsideIncl(&stmt.ifStmt.stmt.loc, line, charPos))
            {
               idResult = DebugFindCtxStatement(stmt.ifStmt.stmt, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.ifStmt.elseStmt)
         {
            if(InsideIncl(&stmt.ifStmt.elseStmt.loc, line, charPos))
               return DebugFindCtxStatement(stmt.ifStmt.elseStmt, line, charPos);
         }
         break;
      }
      case switchStmt:
      {
         Expression exp;
         for(exp = stmt.switchStmt.exp ? stmt.switchStmt.exp->first : null; exp; exp = exp.next)
         {
            if(InsideIncl(&exp.loc, line, charPos))
            {
               idResult = DebugFindCtxExpression(exp, line, charPos);
               if(idResult) return idResult;
            }
         }
         if(stmt.switchStmt.stmt && InsideIncl(&stmt.switchStmt.stmt.loc, line, charPos))
            return DebugFindCtxStatement(stmt.switchStmt.stmt, line, charPos);
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
                  idResult = DebugFindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         if(stmt.whileStmt.stmt && InsideIncl(&stmt.whileStmt.stmt.loc, line, charPos))
            return DebugFindCtxStatement(stmt.whileStmt.stmt, line, charPos);
         break;
      }
      case doWhileStmt:
      {
         if(stmt.doWhile.stmt && InsideIncl(&stmt.doWhile.stmt.loc, line, charPos))
         {
            idResult = DebugFindCtxStatement(stmt.doWhile.stmt, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.doWhile.exp)
         {
            Expression exp;
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = DebugFindCtxExpression(exp, line, charPos);
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
            idResult = DebugFindCtxStatement(stmt.forStmt.init, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.forStmt.check && InsideIncl(&stmt.forStmt.check.loc, line, charPos))
         {
            idResult = DebugFindCtxStatement(stmt.forStmt.check, line, charPos);
            if(idResult) return idResult;
         }

         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               if(InsideIncl(&exp.loc, line, charPos))
               {
                  idResult = DebugFindCtxExpression(exp, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }

         if(stmt.forStmt.stmt)
            return DebugFindCtxStatement(stmt.forStmt.stmt, line, charPos);
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
                  idResult = DebugFindCtxExpression(exp, line, charPos);
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
            idResult = DebugFindCtxExpression(stmt._watch.watcher, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.object && InsideIncl(&stmt._watch.object.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(stmt._watch.object, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(InsideIncl(&_watch.loc, line, charPos))
               {
                  idResult = DebugFindCtxIdentifier(_watch, line, charPos);
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
            idResult = DebugFindCtxExpression(stmt._watch.watcher, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.object && InsideIncl(&stmt._watch.object.loc, line, charPos))
         {
            idResult = DebugFindCtxExpression(stmt._watch.object, line, charPos);
            if(idResult) return idResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(_watch.compound && InsideIncl(&_watch.compound.loc, line, charPos))
               {
                  idResult = DebugFindCtxStatement(_watch.compound, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
   }
   return null;
}

static Identifier DebugFindCtxInitializer(Initializer initializer, int line, int charPos)
{
   switch(initializer.type)
   {
      case listInitializer:
      {
         Initializer init;
         Identifier idResult;

         for(init = initializer.list ? initializer.list->first : null; init; init = init.next)
         {
            if(InsideIncl(&init.loc, line, charPos))
            {
               idResult = DebugFindCtxInitializer(init, line, charPos);
               if(idResult) return idResult;
            }
         }
         break;
      }
      case expInitializer:
         if(initializer.exp && InsideIncl(&initializer.exp.loc, line, charPos))
            return DebugFindCtxExpression(initializer.exp, line, charPos);

         {
            return (void *)-1;
         }
         break;
   }
   return null;
}

static Identifier DebugFindCtxInitDeclarator(InitDeclarator decl, int line, int charPos)
{
   if(decl.initializer && InsideIncl(&decl.initializer.loc, line, charPos))
      return DebugFindCtxInitializer(decl.initializer, line, charPos);
   return null;
}

static Identifier DebugFindCtxDeclaration(Declaration decl, int line, int charPos)
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
                  idResult = DebugFindCtxSpecifier(spec, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         /*Declarator d;
         if(decl.declarators && decl.declarators.first)
         {
            for(d = decl.declarators.first; d; d = d.next)
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
                  idResult = DebugFindCtxSpecifier(s, line, charPos);
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
                  idResult = DebugFindCtxInitDeclarator(d, line, charPos);
                  if(idResult) return idResult;
               }
            }
         }
         break;
      }
      case instDeclaration:
         if(decl.inst && InsideIncl(&decl.inst.loc, line, charPos))
            return DebugFindCtxInstance(decl.inst, line, charPos);
         break;
   }
   return null;
}

static Identifier DebugFindCtxFunction(FunctionDefinition func, int line, int charPos)
{
   if(func.body && InsideIncl(&func.body.loc, line, charPos))
   {
      Identifier idResult;

      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();

      idResult = DebugFindCtxStatement(func.body, line, charPos);
      if(idResult)
         return idResult;

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Identifier DebugFindCtxMemberInit(MemberInit init, int line, int charPos)
{
   Identifier idResult;
   if(init.initializer && InsideIncl(&init.initializer.loc, line, charPos))
   {
      idResult = DebugFindCtxInitializer(init.initializer, line, charPos);
      if(idResult)
      {
         return idResult;
      }
   }
   if(init.identifiers && init.identifiers->first && InsideIncl(&((Identifier)init.identifiers->first).loc, line, charPos))
   {
      idResult = DebugFindCtxIdentifier(init.identifiers->first, line, charPos);
      if(idResult)
         return (void *)-2; //idResult;
   }
   if(init.initializer && InsideIncl(&init.initializer.loc, line, charPos))
   {
      if(init.initializer.type == expInitializer)
      {
         return (void *)-1;
      }
   }
   return null;
}

static Identifier DebugFindCtxInstance(Instantiation inst, int line, int charPos)
{
   Identifier idResult = null;
   Class oldThisClass = GetThisClass();
   Symbol sym = inst._class ? FindClass(inst._class.name) : null;
   //bool insideSomething = false;
   bool insideBrackets;

   if(sym)
      SetThisClass(sym.registered);

   insideBrackets = !(inst.insideLoc.start.line > line || (line == inst.insideLoc.start.line && inst.insideLoc.start.charPos > charPos));

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
               if(!idResult && InsideIncl(&memberInit.realLoc, line, charPos))
                  idResult = DebugFindCtxMemberInit(memberInit, line, charPos);

               if(InsideIncl(&memberInit.realLoc, line, charPos) || (memberInit.realLoc.end.line > line || (line == memberInit.realLoc.end.line && memberInit.realLoc.end.charPos > charPos)))
               {
                  if(memberInit.identifiers && memberInit.identifiers->first && InsideIncl(&memberInit.loc, line, charPos))
                     insideBrackets = false;
                  break;
               }
               /*else if((!memberInit.identifiers || !memberInit.identifiers->first) && (memberInit.next || !InsideIncl(&init.loc, line, charPos)))
                  ;
               */
            }
         }

         if(InsideIncl(&init.loc, line, charPos))
         {
            /*if(InsideIncl(&init.loc, line, charPos))
               if(init.type == methodMembersInit)
                  insideSomething = true;*/

            if(init.type == methodMembersInit && InsideIncl(&init.function.loc, line, charPos))
            {
               idResult = DebugFindCtxClassFunction(init.function, line, charPos);
            }

            if(InsideIncl(&init.loc, line, charPos))
               break;
         }

         if((init.loc.end.line > line || (line == init.loc.end.line && init.loc.end.charPos > charPos)))
            break;
      }
   }
   if(idResult)
      return idResult;
   SetThisClass(oldThisClass);

   return (void *)-1;  // ?
}

static Identifier DebugFindCtxClassFunction(ClassFunction func, int line, int charPos)
{
   if(func.body && InsideIncl(&func.body.loc, line, charPos))
   {
      Identifier idResult;

      Symbol symbol = func.declarator ? func.declarator.symbol : null;
      Type type = symbol ? symbol.type : null;
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass((type && type.thisClass) ? type.thisClass.registered : currentClass);

      if(func.body)
      {
         idResult = DebugFindCtxStatement(func.body, line, charPos);
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
      return (void *)-1;
   }
   else if(!func.body && GetDeclId(func.declarator))
   {
      if(!GetThisClass())
         SetThisClass(currentClass);
      return (void *)-1;
   }
   return null;
}

static Identifier DebugFindCtxProperty(PropertyDef def, int line, int charPos)
{
   Identifier result;
   if(def.getStmt && InsideIncl(&def.getStmt.loc, line, charPos))
   {
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass(currentClass);
      result = DebugFindCtxStatement(def.getStmt, line, charPos);
      if(result) return result;
      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   if(def.setStmt && InsideIncl(&def.setStmt.loc, line, charPos))
   {
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass(currentClass);
      result = DebugFindCtxStatement(def.setStmt, line, charPos);
      if(result) return result;
      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Identifier DebugFindCtxClassDef(ClassDef def, int line, int charPos)
{
   Identifier idResult;
   switch(def.type)
   {
      case declarationClassDef:
         if(def.decl && InsideIncl(&def.decl.loc, line, charPos))
         {
            idResult = DebugFindCtxDeclaration(def.decl, line, charPos);
            if(idResult)
               return idResult;
         }
         break;
      case defaultPropertiesClassDef:
      {
         MemberInit init;
         for(init = def.defProperties ? def.defProperties->first : null; init; init = init.next)
         {
            if(InsideIncl(&init.realLoc, line, charPos))
            {
               Class oldThisClass = GetThisClass();
               Context oldTopContext = GetTopContext();
               SetThisClass(currentClass);
               idResult = DebugFindCtxMemberInit(init, line, charPos);
               if(idResult)
                  return idResult;
               SetThisClass(oldThisClass);
               SetTopContext(oldTopContext);
            }
         }
         break;
      }
      case functionClassDef:
         if(def.function && InsideIncl(&def.function.loc, line, charPos))
         {
            idResult = DebugFindCtxClassFunction(def.function, line, charPos);

            if(idResult)
               return idResult;
         }
         break;
      case propertyClassDef:
         if(def.propertyDef)
         {
            // TOCHECK: Missing thisClass here too?

            if(InsideIncl(&def.propertyDef.loc, line, charPos))
            {
               idResult = DebugFindCtxProperty(def.propertyDef, line, charPos);
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

            idResult = DebugFindCtxStatement(def.propertyWatch.compound, line, charPos);
            if(idResult)
               return idResult;
            SetThisClass(oldThisClass);
            SetTopContext(oldTopContext);
         }
         break;
   }
   return null;
}

static Identifier DebugFindCtxClass(ClassDefinition _class, int line, int charPos)
{
   Identifier idResult;
   bool insideSomething = false;
   if(_class.definitions)
   {
      ClassDef def;
      for(def = _class.definitions->first; def; def = def.next)
      {
         if(def.type == defaultPropertiesClassDef ? InsideIncl(&def.loc, line, charPos) : InsideIncl(&def.loc, line, charPos) )
         {
            if(def.type != defaultPropertiesClassDef)
               insideSomething = true;

            idResult = DebugFindCtxClassDef(def, line, charPos);
            if(idResult)
               return idResult;
         }
      }
   }
   if(!insideSomething)
   {
      return (void *)-1;
   }
   return null;
}

Identifier DebugFindCtxTree(OldList ast, int line, int charPos)
{
   Identifier idResult;
   External external;

   SetThisClass(null);
   SetTopContext(GetGlobalContext());
   if(ast != null)
   {
      for(external = ast.first; external; external = external.next)
      {
         switch(external.type)
         {
            case functionExternal:
               if(external.function && InsideIncl(&external.loc, line, charPos))
               {
                  idResult = DebugFindCtxFunction(external.function, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1 || idResult == (void *)-2) ? null : idResult;
               }
               break;
            case declarationExternal:
               if(external.declaration && InsideIncl(&external.loc, line, charPos))
               {
                  idResult = DebugFindCtxDeclaration(external.declaration, line, charPos);
                  if(idResult)
                     return (idResult == (void *)-1 || idResult == (void *)-2) ? null : idResult;
               }
               break;
            case classExternal:
               if(external._class && InsideIncl(&external._class.loc, line, charPos))
               {
                  currentClass = external._class.symbol.registered;
                  idResult = DebugFindCtxClass(external._class, line, charPos);
                  currentClass = null;
                  if(idResult)
                     return (idResult == (void *)-1 || idResult == (void *)-2) ? null : idResult;
               }
               break;
         }
      }
   }
   return null;
}
