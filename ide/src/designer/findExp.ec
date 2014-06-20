import "ide"

//extern Class thisClass;

static Class currentClass;

static bool Inside(Location loc, int line, int charPos)
{
   return !loc.start.included && (loc.start.line < line || (loc.start.line == line && loc.start.charPos <= charPos)) &&
          (loc.end.line > line || (loc.end.line == line && loc.end.charPos >= charPos));
}

Expression FindExpExpression(Expression exp, int line, int charPos)
{
   Expression expResult;
   switch(exp.type)
   {
      case newExp:
         if(exp._new.size && Inside(&exp._new.size.loc, line, charPos))
         {
            expResult = FindExpExpression(exp._new.size, line, charPos);
            if(expResult) return expResult;
         }
         break;
      case renewExp:
         if(exp._renew.exp && Inside(&exp._renew.exp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp._renew.exp, line, charPos);
            if(expResult) return expResult;
         }
         if(exp._renew.size && Inside(&exp._renew.size.loc, line, charPos))
         {
            expResult = FindExpExpression(exp._renew.size, line, charPos);
            if(expResult) return expResult;
         }
         break;
      case identifierExp:

         break;
      case instanceExp:
         if(exp.instance && Inside(&exp.instance.loc, line, charPos))
         {
            expResult = FindExpInstance(exp.instance, line, charPos);
            if(expResult) return expResult;
         }
         break;
      case constantExp:
         break;
      case stringExp:
         break;
      case opExp:
         if(exp.op.exp1)
         {
            if(Inside(&exp.op.exp1.loc, line, charPos))
            {
               expResult = FindExpExpression(exp.op.exp1, line, charPos);
               if(expResult) return expResult;
            }
         }
         if(exp.op.exp2)
         {
            if(Inside(&exp.op.exp2.loc, line, charPos))
            {
               expResult = FindExpExpression(exp.op.exp2, line, charPos);
               if(expResult) return expResult;
            }
         }
         break;
      case bracketsExp:
      {
         Expression expression;

         for(expression = exp.list ? exp.list->first : null; expression; expression = expression.next)
         {
            if(Inside(&expression.loc, line, charPos))
            {
               expResult = FindExpExpression(expression, line, charPos);
               if(expResult) return expResult;
            }
         }
         break;
      }
      case indexExp:
      {
         Expression expression;
         if(exp.index.exp && Inside(&exp.index.exp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.index.exp, line, charPos);
            if(expResult) return expResult;
         }

         for(expression = exp.index.index->first; expression; expression = expression.next)
         {
            if(Inside(&expression.loc, line, charPos))
            {
               expResult = FindExpExpression(expression, line, charPos);
               if(expResult) return expResult;
            }
         }
         break;
      }
      case callExp:
      {
         if(exp.call.exp && Inside(&exp.call.exp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.call.exp, line, charPos);
            if(expResult) return expResult;
         }

         if(exp.call.arguments)
         {
            Expression expression;
            for(expression = exp.call.arguments->first; expression; expression = expression.next)
            {
               if(Inside(&expression.loc, line, charPos))
               {
                  expResult = FindExpExpression(expression, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         break;
      }
      case memberExp:
         if(exp.member.exp && Inside(&exp.member.exp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.member.exp, line, charPos);
            if(expResult) return expResult;
         }
         //else if(!exp.member.member || (line < exp.member.member.loc.start.line || (line == exp.member.member.loc.start.line && charPos <= exp.member.member.loc.start.charPos)))
         else if(!exp.member.member || (line < exp.member.member.loc.end.line || (line == exp.member.member.loc.end.line && charPos <= exp.member.member.loc.end.charPos)))
         {
            return exp;
         }
         break;
      case pointerExp:
         if(exp.member.exp && Inside(&exp.member.exp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.member.exp, line, charPos);
            if(expResult) return expResult;
         }
         else if(!exp.member.member || (line < exp.member.member.loc.start.line || (line == exp.member.member.loc.start.line && charPos <= exp.member.member.loc.start.charPos)))
         {
            return exp;
         }
         break;
      case typeSizeExp:
         break;
      case castExp:
         if(exp.cast.exp && Inside(&exp.cast.exp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.cast.exp, line, charPos);
            if(expResult) return expResult;
         }
         break;
      case conditionExp:
         if(exp.cond.cond && Inside(&exp.cond.cond.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.cond.cond, line, charPos);
            if(expResult) return expResult;
         }

         if(exp.cond.exp)
         {
            Expression expression;
            for(expression = exp.cond.exp->first; expression; expression = expression.next)
            {
               if(Inside(&expression.loc, line, charPos))
               {
                  expResult = FindExpExpression(expression, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         if(exp.cond.elseExp && Inside(&exp.cond.elseExp.loc, line, charPos))
         {
            expResult = FindExpExpression(exp.cond.elseExp, line, charPos);
            if(expResult) return expResult;
         }
         break;
   }

   if(exp.loc.end.line == line && exp.loc.end.charPos == charPos)
      return exp;

   return null;
}

static Expression FindExpStatement(Statement stmt, int line, int charPos)
{
   Expression expResult;

   switch(stmt.type)
   {
      case labeledStmt:
         if(stmt.labeled.stmt && Inside(&stmt.labeled.stmt.loc, line, charPos))
            return FindExpStatement(stmt.labeled.stmt, line, charPos);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            if(Inside(&stmt.caseStmt.exp.loc, line, charPos))
               return FindExpExpression(stmt.caseStmt.exp, line, charPos);
         }

         if(stmt.caseStmt.stmt)
         {
            if(Inside(&stmt.caseStmt.stmt.loc, line, charPos))
               return FindExpStatement(stmt.caseStmt.stmt, line, charPos);
         }
         break;
      case badDeclarationStmt:
      {
         Declaration decl = stmt.decl;
         if(decl && Inside(&decl.loc, line, charPos))
         {
            expResult = FindExpDeclaration(decl, line, charPos);
            if(expResult) return expResult;
         }
         break;
      }
      case compoundStmt:
      {
         Context prevContext = GetCurrentContext();
         if(!stmt.compound.isSwitch)
            SetCurrentContext(stmt.compound.context);
         if(stmt.compound.declarations)
         {
            Declaration decl;
            for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
            {
               if(Inside(&decl.loc, line, charPos))
               {
                  expResult = FindExpDeclaration(decl, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         if(stmt.compound.statements)
         {
            Statement statement;
            for(statement = stmt.compound.statements->first; statement; statement = statement.next)
            {
               if(Inside(&statement.loc, line, charPos))
               {
                  expResult = FindExpStatement(statement, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         SetCurrentContext(prevContext);
         break;
      }
      case expressionStmt:
      {
         if(stmt.expressions)
         {
            Expression exp;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
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
            if(Inside(&exp.loc, line, charPos))
            {
               expResult = FindExpExpression(exp, line, charPos);
               if(expResult) return expResult;
            }
         }
         if(stmt.ifStmt.stmt)
         {
            if(Inside(&stmt.ifStmt.stmt.loc, line, charPos))
            {
               expResult = FindExpStatement(stmt.ifStmt.stmt, line, charPos);
               if(expResult) return expResult;
            }
         }
         if(stmt.ifStmt.elseStmt)
         {
            if(Inside(&stmt.ifStmt.elseStmt.loc, line, charPos))
               return FindExpStatement(stmt.ifStmt.elseStmt, line, charPos);
         }
         break;
      }
      case switchStmt:
      {
         Expression exp;
         for(exp = stmt.switchStmt.exp ? stmt.switchStmt.exp->first : null; exp; exp = exp.next)
         {
            if(Inside(&exp.loc, line, charPos))
            {
               expResult = FindExpExpression(exp, line, charPos);
               if(expResult) return expResult;
            }
         }
         if(stmt.switchStmt.stmt && Inside(&stmt.switchStmt.stmt.loc, line, charPos))
            return FindExpStatement(stmt.switchStmt.stmt, line, charPos);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         if(stmt.whileStmt.exp)
         {
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         if(stmt.whileStmt.stmt && Inside(&stmt.whileStmt.stmt.loc, line, charPos))
            return FindExpStatement(stmt.whileStmt.stmt, line, charPos);
         break;
      }
      case doWhileStmt:
      {
         Expression exp;

         if(stmt.whileStmt.stmt && Inside(&stmt.whileStmt.stmt.loc, line, charPos))
         {
            expResult = FindExpStatement(stmt.whileStmt.stmt, line, charPos);
            if(expResult) return expResult;
         }

         if(stmt.switchStmt.exp)
         {
            for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
            {
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         break;
      }
      case forStmt:
      {
         Expression exp;

         if(stmt.forStmt.init && Inside(&stmt.forStmt.init.loc, line, charPos))
         {
            expResult = FindExpStatement(stmt.forStmt.init, line, charPos);
            if(expResult) return expResult;
         }

         if(stmt.forStmt.check && Inside(&stmt.forStmt.check.loc, line, charPos))
         {
            expResult = FindExpStatement(stmt.forStmt.check, line, charPos);
            if(expResult) return expResult;
         }

         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }

         if(stmt.forStmt.stmt)
            return FindExpStatement(stmt.forStmt.stmt, line, charPos);
         break;
      }
      case forEachStmt:
      {
         Expression exp;

         if(stmt.forEachStmt.exp)
         {
            for(exp = stmt.forEachStmt.exp->first; exp; exp = exp.next)
            {
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }

         if(stmt.forEachStmt.filter)
         {
            for(exp = stmt.forEachStmt.filter->first; exp; exp = exp.next)
            {
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }

         if(stmt.forEachStmt.stmt)
            return FindExpStatement(stmt.forEachStmt.stmt, line, charPos);
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
               if(Inside(&exp.loc, line, charPos))
               {
                  expResult = FindExpExpression(exp, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         break;
      case fireWatchersStmt:
      case stopWatchingStmt:
      {
         if(stmt._watch.watcher && Inside(&stmt._watch.watcher.loc, line, charPos))
         {
            expResult = FindExpExpression(stmt._watch.watcher, line, charPos);
            if(expResult) return expResult;
         }
         if(stmt._watch.object && Inside(&stmt._watch.object.loc, line, charPos))
         {
            expResult = FindExpExpression(stmt._watch.object, line, charPos);
            if(expResult) return expResult;
         }
         break;
      }
      case watchStmt:
      {
         PropertyWatch _watch;
         if(stmt._watch.watcher && Inside(&stmt._watch.watcher.loc, line, charPos))
         {
            expResult = FindExpExpression(stmt._watch.watcher, line, charPos);
            if(expResult) return expResult;
         }
         if(stmt._watch.object && Inside(&stmt._watch.object.loc, line, charPos))
         {
            expResult = FindExpExpression(stmt._watch.object, line, charPos);
            if(expResult) return expResult;
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(_watch.compound && Inside(&_watch.compound.loc, line, charPos))
               {
                  expResult = FindExpStatement(_watch.compound, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         break;
      }
   }
   return null;
}

static Expression FindExpInitializer(Initializer initializer, int line, int charPos)
{
   switch(initializer.type)
   {
      case listInitializer:
      {
         Initializer init;
         Expression expResult;

         for(init = initializer.list ? initializer.list->first : null; init; init = init.next)
         {
            if(Inside(&init.loc, line, charPos))
            {
               expResult = FindExpInitializer(init, line, charPos);
               if(expResult) return expResult;
            }
         }
         break;
      }
      case expInitializer:
         if(initializer.exp && Inside(&initializer.exp.loc, line, charPos))
            return FindExpExpression(initializer.exp, line, charPos);
         break;
   }
   return null;
}

static Expression FindExpInitDeclarator(InitDeclarator decl, int line, int charPos)
{
   if(decl.initializer && Inside(&decl.initializer.loc, line, charPos))
      return FindExpInitializer(decl.initializer, line, charPos);
   return null;
}

static Expression FindExpSpecifier(Specifier spec, int line, int charPos)
{
   Expression expResult;
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
               // TODO: Should use FindExpClassDef here right?

               //if(def.type == ClassDefDeclaration && def.decl && def.decl.type == DeclarationStruct)
               //   ProcessDeclaration(def.decl);
               switch(def.type)
               {
                  case declarationClassDef:
                     if(def.decl && Inside(&def.decl.loc, line, charPos))
                     {
                        expResult = FindExpDeclaration(def.decl, line, charPos);
                        if(expResult)
                           return expResult;
                     }
                     break;
                  case defaultPropertiesClassDef:
                  {
                     MemberInit init;
                     for(init = def.defProperties ? def.defProperties->first : null; init; init = init.next)
                     {
                        if(Inside(&init.realLoc, line, charPos))
                        {
                           Class oldThisClass = GetThisClass();
                           Context oldTopContext = GetTopContext();
                           SetThisClass(currentClass);
                           expResult = FindExpMemberInit(init, line, charPos);
                           if(expResult)
                              return expResult;
                           SetThisClass(oldThisClass);
                           SetTopContext(oldTopContext);
                        }
                     }
                     break;
                  }
                  case functionClassDef:
                     if(def.function && Inside(&def.function.loc, line, charPos))
                     {
                        expResult = FindExpClassFunction(def.function, line, charPos);

                        if(expResult)
                           return expResult;
                     }
                     break;
                  case propertyClassDef:
                     if(def.propertyDef)
                     {
                        if(Inside(&def.propertyDef.loc, line, charPos))
                        {
                           expResult = FindExpProperty(def.propertyDef, line, charPos);
                           if(expResult)
                              return expResult;
                        }
                     }
                     break;
                  case propertyWatchClassDef:
                     if(def.propertyWatch && def.propertyWatch.compound && Inside(&def.propertyWatch.compound.loc, line, charPos))
                     {
                        Class oldThisClass = GetThisClass();
                        Context oldTopContext = GetTopContext();
                        SetThisClass(currentClass);
                        expResult = FindExpStatement(def.propertyWatch.compound, line, charPos);
                        if(expResult) return expResult;
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

static Expression FindExpDeclaration(Declaration decl, int line, int charPos)
{
   Expression expResult;

   switch(decl.type)
   {
      case structDeclaration:
      {
         Specifier spec;
         if(decl.specifiers)
         {
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               if(Inside(&spec.loc, line, charPos))
               {
                  expResult = FindExpSpecifier(spec, line, charPos);
                  if(expResult) return expResult;
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
               if(Inside(&s.loc, line, charPos))
               {
                  expResult = FindExpSpecifier(s, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }

         if(decl.declarators && decl.declarators->first)
         {
            for(d = decl.declarators->first; d; d = d.next)
            {
               if(Inside(&d.loc, line, charPos))
               {
                  expResult = FindExpInitDeclarator(d, line, charPos);
                  if(expResult) return expResult;
               }
            }
         }
         break;
      }
      case instDeclaration:
         if(decl.inst && Inside(&decl.inst.loc, line, charPos))
            return FindExpInstance(decl.inst, line, charPos);
         break;
   }
   return null;
}

static Expression FindExpFunction(FunctionDefinition func, int line, int charPos)
{
   if(func.body && Inside(&func.body.loc, line, charPos))
   {
      Expression result;

      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();

      result = FindExpStatement(func.body, line, charPos);
      if(result)
         return result;

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Expression FindExpMemberInit(MemberInit init, int line, int charPos)
{
   if(init.initializer && Inside(&init.initializer.loc, line, charPos))
      return FindExpInitializer(init.initializer, line, charPos);
   return null;
}

static Expression FindExpMembersInit(MembersInit init, int line, int charPos)
{
   Expression expResult;
   switch(init.type)
   {
      case dataMembersInit:
      {
         MemberInit member;
         for(member = init.dataMembers ? init.dataMembers->first : null; member; member = member.next)
         {
            if(Inside(&member.loc, line, charPos))
            {
               expResult = FindExpMemberInit(member, line, charPos);
               if(expResult) return expResult;
            }
         }
         break;
      }
      case methodMembersInit:
         if(init.function && Inside(&init.function.loc, line, charPos))
            return FindExpClassFunction(init.function, line, charPos);
         break;
   }
   return null;
}

static Expression FindExpInstance(Instantiation inst, int line, int charPos)
{
   Expression expResult;
   if(inst.members)
   {
      MembersInit init;
      for(init = inst.members->first; init; init = init.next)
      {
         if(Inside(&init.loc, line, charPos))
         {
            expResult = FindExpMembersInit(init, line, charPos);
            if(expResult) return expResult;
         }
      }
   }
   return null;
}

static Expression FindExpClassFunction(ClassFunction func, int line, int charPos)
{
   if(func.body && Inside(&func.body.loc, line, charPos))
   {
      Expression result;

      Symbol symbol = func.declarator ? func.declarator.symbol : null;
      Type type = symbol?symbol.type:null;
      Class oldThisClass = GetThisClass();
      Context oldTopContext = GetTopContext();
      SetThisClass((type && type.thisClass) ? type.thisClass.registered : currentClass);

      result = FindExpStatement(func.body, line, charPos);
      if(result)
         return result;

      SetThisClass(oldThisClass);
      SetTopContext(oldTopContext);
   }
   return null;
}

static Expression FindExpProperty(PropertyDef def, int line, int charPos)
{
   Expression result;
   if(def.getStmt  && Inside(&def.getStmt.loc, line, charPos))
   {
      result = FindExpStatement(def.getStmt, line, charPos);
      if(result) return result;
   }
   if(def.setStmt && Inside(&def.setStmt.loc, line, charPos))
   {
      result = FindExpStatement(def.setStmt, line, charPos);
      if(result) return result;
   }
   return null;
}

static Expression FindExpClassDef(ClassDef def, int line, int charPos)
{
   Expression expResult;
   switch(def.type)
   {
      case declarationClassDef:
         if(def.decl && Inside(&def.decl.loc, line, charPos))
         {
            expResult = FindExpDeclaration(def.decl, line, charPos);
            if(expResult)
               return expResult;
         }
         break;
      case defaultPropertiesClassDef:
      {
         MemberInit init;
         for(init = def.defProperties ? def.defProperties->first : null; init; init = init.next)
         {
            if(Inside(&init.loc, line, charPos))
            {
               expResult = FindExpMemberInit(init, line, charPos);
               if(expResult)
                  return expResult;
            }
         }
         break;
      }
      case functionClassDef:
         if(def.function && Inside(&def.function.loc, line, charPos))
         {
            expResult = FindExpClassFunction(def.function, line, charPos);
            if(expResult)
               return expResult;
         }
         break;
      case propertyClassDef:
         if(def.propertyDef)
         {
            if(Inside(&def.propertyDef.loc, line, charPos))
            {
               expResult = FindExpProperty(def.propertyDef, line, charPos);
               if(expResult)
                  return expResult;
            }
         }
         break;
      case propertyWatchClassDef:
         if(def.propertyWatch && def.propertyWatch.compound && Inside(&def.propertyWatch.compound.loc, line, charPos))
         {
            expResult = FindExpStatement(def.propertyWatch.compound, line, charPos);
            if(expResult) return expResult;
         }
         break;
   }
   return null;
}

static Expression FindExpClass(ClassDefinition _class, int line, int charPos)
{
   Expression expResult;
   if(_class.definitions)
   {
      ClassDef def;
      for(def =_class.definitions->first; def; def = def.next)
      {
         if(Inside(&def.loc, line, charPos))
         {
            expResult = FindExpClassDef(def, line, charPos);
            if(expResult)
               return expResult;
         }
      }
   }
   return null;
}

Expression FindExpTree(OldList ast, int line, int charPos)
{
   Expression expResult;
   External external;
   SetThisClass(null);
   SetTopContext(GetGlobalContext());
   if(ast != null)
   {
      for(external = ast.first; external; external = external.next)
      {
         if(Inside(&external.loc, line, charPos))
         {
            switch(external.type)
            {
               case functionExternal:
                  if(external.function)
                  {
                     expResult = FindExpFunction(external.function, line, charPos);
                     if(expResult)
                        return expResult;
                  }
                  break;
               case declarationExternal:
                  if(external.declaration)
                  {
                     expResult = FindExpDeclaration(external.declaration, line, charPos);
                     if(expResult)
                        return expResult;
                  }
                  break;
               case classExternal:
                  if(external._class)
                  {
                     currentClass = external._class.symbol.registered;
                     expResult = FindExpClass(external._class, line, charPos);
                     currentClass = null;
                     if(expResult)
                        return expResult;
                  }
                  break;
            }
         }
      }
   }
   return null;
}
