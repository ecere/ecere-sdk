import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

static OldList * tableStatements, * indexStatements, * addFieldStatements/*, * findFieldStatements*/;
static int numIndexes;
static External addAfter;

static void ProcessSpecifier(Specifier spec)
{
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
               // TODO: Should use the ProcessClassDef function here right?

               //if(def.type == ClassDefDeclaration && def.decl && def.decl.type == DeclarationStruct)
               //   ProcessDeclaration(def.decl);
               switch(def.type)
               {
                  case declarationClassDef:
                     ProcessDeclaration(def.decl);
                     break;
                  case defaultPropertiesClassDef:
                  {
                     MemberInit init;
                     for(init = def.defProperties->first; init; init = init.next)
                     {
                        //Class oldThisClass = thisClass;
                        ProcessMemberInit(init);
                     }
                     break;
                  }
                  case functionClassDef:
                     ProcessClassFunction(def.function);
                     break;
                  case propertyClassDef:
                     if(def.propertyDef)
                     {
                        ProcessProperty(def.propertyDef);
                     }
                     break;
                  case propertyWatchClassDef:
                     if(def.propertyWatch && def.propertyWatch.compound)
                     {
                        ProcessStatement(def.propertyWatch.compound);
                     }
                     break;
                  case classPropertyValueClassDef:
                     if(def.initializer)
                        ProcessInitializer(def.initializer);
                     break;
               }
            }
         }
         break;
      }
   }
}

static void ProcessIdentifier(Identifier id)
{

}

static void ProcessExpression(Expression exp)
{
   switch(exp.type)
   {
      case newExp:
         ProcessExpression(exp._new.size);
         break;
      case renewExp:
         ProcessExpression(exp._renew.exp);
         ProcessExpression(exp._renew.size);
         break;
      case constantExp:
         break;
      case identifierExp:
         ProcessIdentifier(exp.identifier);
         break;
      case instanceExp:
         ProcessInstance(exp.instance);
         break;
      case stringExp:
         break;
      case opExp:
         if(exp.op.exp1)
         {
            ProcessExpression(exp.op.exp1);
         }
         if(exp.op.exp2)
         {
            ProcessExpression(exp.op.exp2);
         }
         break;
      case bracketsExp:
      {
         Expression expression;
         for(expression = exp.list->first; expression; expression = expression.next)
         {
            ProcessExpression(expression);
         }
         break;
      }
      case indexExp:
      {
         Expression expression;
         ProcessExpression(exp.index.exp);

         for(expression = exp.index.index->first; expression; expression = expression.next)
         {
            ProcessExpression(expression);
         }
         break;
      }
      case callExp:
      {
         ProcessExpression(exp.call.exp);

         if(exp.call.arguments)
         {
            Expression expression;

            for(expression = exp.call.arguments->first; expression; expression = expression.next)
            {
               ProcessExpression(expression);
            }
         }
         break;
      }
      case memberExp:
         ProcessExpression(exp.member.exp);
         break;
      case pointerExp:
         ProcessExpression(exp.member.exp);
         break;
      case typeSizeExp:
         break;
      case castExp:
         ProcessExpression(exp.cast.exp);
         break;
      case conditionExp:
         ProcessExpression(exp.cond.cond);

         {
            Expression expression;
            for(expression = exp.cond.exp->first; expression; expression = expression.next)
            {
               ProcessExpression(expression);
            }
         }
         ProcessExpression(exp.cond.elseExp);
         break;
      case dummyExp:
         break;
      case dbfieldExp:
      {
         char tableName[1024];
         char name[1024 + 1024 + 16];
         int len = strlen(exp.db.table);
         memcpy(tableName, exp.db.table+1, len-2);
         tableName[len-2] = 0;
         ChangeCh(tableName, ' ', '_');
         sprintf(name, "__ecereDBField_%s_%s", tableName, exp.db.id.string);
         FreeExpContents(exp);
         exp.type = identifierExp;
         exp.identifier = MkIdentifier(name);
         break;
      }
      case dbtableExp:
      {
         char tableName[1024];
         char name[1024 + 15];
         int len = strlen(exp.db.table);
         memcpy(tableName, exp.db.table+1, len-2);
         tableName[len-2] = 0;
         ChangeCh(tableName, ' ', '_');
         sprintf(name, "__ecereDBTable_%s", tableName);
         FreeExpContents(exp);
         exp.type = identifierExp;
         exp.identifier = MkIdentifier(name);
         break;
      }
      case dbindexExp:
      {
         char tableName[1024];
         char name[1024 + 1024 + 16];
         int len = strlen(exp.db.table);
         memcpy(tableName, exp.db.table+1, len-2);
         tableName[len-2] = 0;
         ChangeCh(tableName, ' ', '_');
         sprintf(name, "__ecereDBIndex_%s_%s", tableName, exp.db.id.string);
         FreeExpContents(exp);
         exp.type = identifierExp;
         exp.identifier = MkIdentifier(name);
         break;
      }
      case dbopenExp:
      {
         if(tableStatements)
         {
            Statement databaseOpenStmt = MkCompoundStmt(MkList(), MkList());
            Statement compound/*, compound2*/;
            Statement ifDBStmt;
            OldList * args;
            char numIndexesString[16];

            databaseOpenStmt.compound.context = Context { parent = curContext };

            databaseOpenStmt.compound.declarations->Add(MkDeclaration(MkListOne(MkSpecifierName("Database")),
               MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("db")), null))));

            // bool createNow = false;
            /*databaseOpenStmt.compound.declarations->Add(MkDeclaration(MkListOne(MkSpecifierName("bool")),
               MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("createNow")), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("false")))))));*/

            // static bool initialized = false;
            args = MkList();
            args->Add(MkSpecifier(STATIC));
            args->Add(MkSpecifierName("bool"));
            databaseOpenStmt.compound.declarations->Add(MkDeclaration(args,
               MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("initialized")), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("false")))))));

            // Assuming we're in a function where we can return 0 (Typically a DataBase InitSchema() or an Application constructor)
            // if(initialized) return 0;
            databaseOpenStmt.compound.statements->Add(MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("initialized"))), MkReturnStmt(MkListOne(MkExpConstant("0"))), null));

            // initialized = true;
            databaseOpenStmt.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("initialized")), '=', MkExpIdentifier(MkIdentifier("true"))))));

            // db = ds.OpenDatabase("med", no);
            args = MkList();
            args->Add(CopyExpression(exp.dbopen.name));
            args->Add(MkExpIdentifier(MkIdentifier("no")));
            databaseOpenStmt.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("db")), '=',
               MkExpCall(MkExpMember(CopyExpression(exp.dbopen.ds), MkIdentifier("OpenDatabase")), args)))));

            /*if(!db)
            {
               db = ds.OpenDatabase("med", create);
               createNow = true;
            }
            */
            databaseOpenStmt.compound.statements->Add(MkIfStmt(MkListOne(MkExpOp(null, '!', MkExpIdentifier(MkIdentifier("db")))),
               compound = MkCompoundStmt(null, MkList()), null));
            compound.compound.context = Context { parent = databaseOpenStmt.compound.context };

            args = MkList();
            args->Add(exp.dbopen.name);
            args->Add(MkExpIdentifier(MkIdentifier("create")));
            compound.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("db")), '=',
               MkExpCall(MkExpMember(exp.dbopen.ds, MkIdentifier("OpenDatabase")), args)))));
            /*compound.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("createNow")), '=',
               MkExpIdentifier(MkIdentifier("true")))));*/

            exp.dbopen.name = null;
            exp.dbopen.ds = null;

            // if(db)
            databaseOpenStmt.compound.statements->Add(MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("db"))),
               ifDBStmt = MkCompoundStmt(MkList(), MkList()), null));

            ifDBStmt.compound.context = Context { parent = databaseOpenStmt.compound.context };

            // FieldIndex indexes[numIndexes] = { null };
            sprintf(numIndexesString, "%d", numIndexes);
            ifDBStmt.compound.declarations->Add(MkDeclaration(MkListOne(MkSpecifierName("FieldIndex")), MkListOne(MkInitDeclarator(MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier("indexes")),
               MkExpConstant(numIndexesString)), MkInitializerList(MkListOne(MkInitializerList(MkListOne(MkInitializerAssignment(MkExpIdentifier(MkIdentifier("null")))))))))));

            // db.Begin();
            ifDBStmt.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("db")), MkIdentifier("Begin")), MkList()))));

            ifDBStmt.compound.statements->Add(compound = MkCompoundStmt(null, tableStatements));
            compound.compound.context = Context { parent = ifDBStmt.compound.context };
            /*
            ifDBStmt.compound.statements->Add(MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("createNow"))),
               (compound = MkCompoundStmt(null, addFieldStatements), compound.compound.context = Context { parent = ifDBStmt.compound.context }, compound),
               (compound2 = MkCompoundStmt(null, findFieldStatements), compound2.compound.context = Context { parent = ifDBStmt.compound.context }, compound2)));
            */
            ifDBStmt.compound.statements->Add(
               (compound = MkCompoundStmt(null, addFieldStatements), compound.compound.context = Context { parent = ifDBStmt.compound.context }, compound)
               );

            ifDBStmt.compound.statements->Add(compound = MkCompoundStmt(null, indexStatements));
            compound.compound.context = Context { parent = ifDBStmt.compound.context };

            // db.Commit();
            ifDBStmt.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("db")), MkIdentifier("Commit")), MkList()))));

            // TODO: Don't make use of extension
            exp.type = extensionCompoundExp;
            exp.compound = databaseOpenStmt;

            databaseOpenStmt.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier("db")))));

            tableStatements = null;
         }
         else
         {
            FreeExpContents(exp);
            Compiler_Error($"No database table defined in this module or database_open already used.\n");
            exp.type = dummyExp;
         }
         break;
      }
   }
}

static void ProcessStatement(Statement stmt)
{
   switch(stmt.type)
   {
      case labeledStmt:
         ProcessStatement(stmt.labeled.stmt);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            ProcessExpression(stmt.caseStmt.exp);
         }

         if(stmt.caseStmt.stmt)
         {
            ProcessStatement(stmt.caseStmt.stmt);
         }
         break;
      case badDeclarationStmt:
      {
         ProcessDeclaration(stmt.decl);
         break;
      }
      case compoundStmt:
      {
         Context oldContext = curContext;
         curContext = stmt.compound.context;
         if(stmt.compound.declarations)
         {
            Declaration decl;
            for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
            {
               ProcessDeclaration(decl);
            }
         }
         if(stmt.compound.statements)
         {
            Statement statement;
            for(statement = stmt.compound.statements->first; statement; statement = statement.next)
            {
               ProcessStatement(statement);
            }
         }
         curContext = oldContext;
         break;
      }
      case expressionStmt:
      {
         if(stmt.expressions)
         {
            Expression exp;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         break;
      }
      case ifStmt:
      {
         Expression exp;
         for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
         {
            ProcessExpression(exp);
         }
         if(stmt.ifStmt.stmt)
         {
            ProcessStatement(stmt.ifStmt.stmt);
         }
         if(stmt.ifStmt.elseStmt)
         {
            ProcessStatement(stmt.ifStmt.elseStmt);
         }
         break;
      }
      case switchStmt:
      {
         Expression exp;
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
         {
            ProcessExpression(exp);
         }
         ProcessStatement(stmt.switchStmt.stmt);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         if(stmt.whileStmt.exp)
         {
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         if(stmt.whileStmt.stmt)
            ProcessStatement(stmt.whileStmt.stmt);
         break;
      }
      case doWhileStmt:
      {
         ProcessStatement(stmt.doWhile.stmt);

         if(stmt.doWhile.exp)
         {
            Expression exp;
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         break;
      }
      case forStmt:
      {
         Expression exp;

         if(stmt.forStmt.init)
         {
            ProcessStatement(stmt.forStmt.init);
         }

         if(stmt.forStmt.check)
         {
            ProcessStatement(stmt.forStmt.check);
         }

         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }

         if(stmt.forStmt.stmt)
            ProcessStatement(stmt.forStmt.stmt);
         break;
      }
      case forEachStmt:
      {
         Expression exp;

         for(exp = stmt.forEachStmt.exp ? stmt.forEachStmt.exp->first : null; exp; exp = exp.next)
            ProcessExpression(exp);

         for(exp = stmt.forEachStmt.filter ? stmt.forEachStmt.filter->first : null; exp; exp = exp.next)
            ProcessExpression(exp);

         if(stmt.forEachStmt.stmt)
            ProcessStatement(stmt.forEachStmt.stmt);
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
               ProcessExpression(exp);
            }
         }
         break;
      case fireWatchersStmt:
      case stopWatchingStmt:
      {
         Identifier _watch;
         if(stmt._watch.watcher)
         {
            ProcessExpression(stmt._watch.watcher);
         }
         if(stmt._watch.object)
         {
            ProcessExpression(stmt._watch.object);
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               ProcessIdentifier(_watch);
            }
         }
         break;
      }
      case watchStmt:
      {
         PropertyWatch _watch;
         if(stmt._watch.watcher)
         {
            ProcessExpression(stmt._watch.watcher);
         }
         if(stmt._watch.object)
         {
            ProcessExpression(stmt._watch.object);
         }
         if(stmt._watch.watches)
         {
            for(_watch = stmt._watch.watches->first; _watch; _watch = _watch.next)
            {
               if(_watch.compound)
               {
                  ProcessStatement(_watch.compound);
               }
            }
         }
         break;
      }
   }
}

static void ProcessInitializer(Initializer initializer)
{
   switch(initializer.type)
   {
      case listInitializer:
      {
         Initializer init;

         for(init = initializer.list->first; init; init = init.next)
         {
            ProcessInitializer(init);
         }
         break;
      }
      case expInitializer:
         ProcessExpression(initializer.exp);
         break;
   }
}

static void ProcessInitDeclarator(InitDeclarator decl)
{
   if(decl.initializer)
      ProcessInitializer(decl.initializer);
}

static void ProcessDeclaration(Declaration decl)
{
   switch(decl.type)
   {
      case structDeclaration:
      {
         Specifier spec;
         if(decl.specifiers)
         {
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               ProcessSpecifier(spec);
            }
         }
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
               ProcessSpecifier(s);
            }
         }

         if(decl.declarators && decl.declarators->first)
         {
            InitDeclarator d;
            for(d = decl.declarators->first; d; d = d.next)
            {
               ProcessInitDeclarator(d);
            }
         }
         break;
      }
      case instDeclaration:
         ProcessInstance(decl.inst);
         break;
   }
}

static void ProcessFunction(FunctionDefinition func)
{
   if(func.body)
   {
      ProcessStatement(func.body);
   }
}

static void ProcessMemberInit(MemberInit init)
{
   if(init.initializer)
   {
      ProcessInitializer(init.initializer);
   }
}

static void ProcessInstance(Instantiation inst)
{
   if(inst.members)
   {
      MembersInit init;
      MemberInit memberInit;
      for(init = inst.members->first; init; init = init.next)
      {
         if(init.type == dataMembersInit && init.dataMembers)
         {
            for(memberInit = init.dataMembers->first; memberInit; memberInit = memberInit.next)
            {
               ProcessMemberInit(memberInit);
            }
         }

         if(init.type == methodMembersInit)
         {
            ProcessClassFunction(init.function);
         }
      }
   }
}

static void ProcessClassFunction(ClassFunction func)
{
   if(func.body)
   {
      ProcessStatement(func.body);
   }
}

static void ProcessProperty(PropertyDef def)
{
   if(def.getStmt)
   {
      ProcessStatement(def.getStmt);
   }
   if(def.setStmt)
   {
      ProcessStatement(def.setStmt);
   }
}

static void ProcessClassDef(ClassDef def)
{
   switch(def.type)
   {
      case declarationClassDef:
         ProcessDeclaration(def.decl);
         break;
      case defaultPropertiesClassDef:
      {
         MemberInit init;
         for(init = def.defProperties->first; init; init = init.next)
         {
            ProcessMemberInit(init);
         }
         break;
      }
      case classPropertyValueClassDef:
         if(def.initializer)
            ProcessInitializer(def.initializer);
         break;
      case functionClassDef:
         ProcessClassFunction(def.function);
         break;
      case propertyClassDef:
         if(def.propertyDef)
         {
            ProcessProperty(def.propertyDef);
         }
         break;
      case propertyWatchClassDef:
         if(def.propertyWatch && def.propertyWatch.compound)
         {
            ProcessStatement(def.propertyWatch.compound);
         }
         break;
   }
}

static void ProcessClass(ClassDefinition _class)
{
   if(_class.definitions)
   {
      ClassDef def;
      for(def = _class.definitions->first; def; def = def.next)
      {
         ProcessClassDef(def);
      }
   }
}

static void ProcessDBTable(DBTableDef table)
{
   OldList * rowClassDefs = MkList(), * idClassDefs = null;
   char tableName[1024];
   char rowClassName[1024 + 3];
   int len = strlen(table.name);
   bool indexed = false;
   char tableID[1024 + 15];
   char nameField[1024];
   OldList * args;
   OldList * members;
   if(table.symbol)
      idClassDefs = MkList();

   nameField[0] = 0;
   memcpy(tableName, table.name+1, len-2);
   tableName[len-2] = 0;
   ChangeCh(tableName, ' ', '_');

   sprintf(tableID, "__ecereDBTable_%s", tableName);

   sprintf(rowClassName, "Row%s", tableName);
   ChangeCh(rowClassName, ' ', '_');

   if(!tableStatements)
   {
      tableStatements = MkList();
      indexStatements = MkList();
      addFieldStatements = MkList();
      // findFieldStatements = MkList();
   }


   {
      External external;
      external = MkExternalDeclaration(MkDeclaration(
         MkListOne(MkSpecifierName("Table")),
         MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(tableID)), null))));
      external.declaration.declMode = table.declMode;
      ast->Insert(addAfter, external);

      // tClasses          = db.OpenTable("Classes",        { tableRows, create });
      args = MkList();
      tableStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(tableID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("db")), MkIdentifier("OpenTable")),
         args)))));
      args->Add(MkExpString(table.name));
      members = MkList();
      args->Add(MkExpInstance(MkInstantiation(null, null, MkListOne(MkMembersInitList(members)))));
      members->Add(MkMemberInit(null, MkInitializerAssignment(MkExpIdentifier(MkIdentifier("tableRows")))));
      members->Add(MkMemberInit(null, MkInitializerAssignment(MkExpIdentifier(MkIdentifier("create")))));
   }

   // Row Class
   {
      ClassDefinition _class;
      ClassDef def;
      External external;
      OldList * inheritanceSpecs = MkList();
      inheritanceSpecs->Add(MkSpecifier(PRIVATE));
      inheritanceSpecs->Add(MkSpecifierName("Row"));
      PushContext();
      _class = MkClass(DeclClass(null, rowClassName), inheritanceSpecs, rowClassDefs);
      PopContext(curContext);

      def = MkClassDefDefaultProperty(MkListOne(MkMemberInitExp(MkExpIdentifier(MkIdentifier("tbl")), MkInitializerAssignment(MkExpIdentifier(MkIdentifier(tableID))))));
      rowClassDefs->Add(def);

      _class.declMode = table.declMode;
      external = MkExternalClass(_class);
      ast->Insert(addAfter, external);
      addAfter = external;
   }

   if(table.definitions)
   {
      DBTableEntry entry;

      for(entry = table.definitions->first; entry; entry = entry.next)
      {
         switch(entry.type)
         {
            case fieldEntry:
            {
               bool isIndex = false;
               char fieldID[1024 + 1024 + 16];
               OldList * args;
               Specifier spec = entry.dataType.qualifiers ? (Specifier)entry.dataType.qualifiers->first : null;

               sprintf(fieldID, "__ecereDBField_%s_%s", tableName, entry.id.string);

               if(idClassDefs)
               {
                  if(!nameField[0] && spec.type == nameSpecifier && (!strcmp(spec.name, "String") || !strcmp(spec.name, "ecere::com::CIString")))
                  {
                     // strcpy(nameField, entry.name);
                     strcpy(nameField, entry.id.string);
                  }
                  if(!indexed && spec.type == nameSpecifier && !strcmp(spec.name, table.symbol.string))
                  {
                     Statement rowSet = MkCompoundStmt(MkList(), MkList());
                     char name[1024];
                     ClassDef def;

                     numIndexes = Max(numIndexes, 1);
                     isIndex = true;
                     indexed = true;
                     sprintf(name, "_%s", entry.id.string);
                     curContext = rowSet.compound.context = Context { parent = globalContext };

                     // Find(fieldSECid, middle, nil, value);
                     rowSet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("Find")),
                        args = MkList()))));
                     args->Add(MkExpIdentifier(MkIdentifier(fieldID)));
                     args->Add(MkExpIdentifier(MkIdentifier("middle")));
                     args->Add(MkExpIdentifier(MkIdentifier("nil")));
                     args->Add(MkExpIdentifier(MkIdentifier("value")));

                     curContext = globalContext;

                     def = MkClassDefProperty(MkProperty(
                        CopyList(entry.dataType.qualifiers, CopySpecifier), CopyDeclarator(entry.dataType.declarator),
                           MkIdentifier(name), rowSet, null));
                     def.propertyDef.isDBProp = true;
                     def.memberAccess = publicAccess;
                     rowClassDefs->Add(def);
                  }
               }
               if(rowClassDefs)
               {
                  Statement rowSet = MkCompoundStmt(MkList(), MkList()), rowGet = MkCompoundStmt(MkList(), MkList());
                  ClassDef def;

                  curContext = rowGet.compound.context = Context { parent = globalContext };

                  // *** GET ***
                  // Contact d = null;
                  if(spec.type == nameSpecifier && spec.symbol && spec.symbol.registered && spec.symbol.registered.type == structClass)
                  {
                     rowGet.compound.declarations->Add(MkDeclarationInst(MkInstantiation(MkSpecifierName(spec.name), MkExpIdentifier(MkIdentifier("d")), null)));
                  }
                  else
                  {
                     Expression exp;
                     rowGet.compound.declarations->Add(MkDeclaration(CopyList(entry.dataType.qualifiers, CopySpecifier),
                        MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("d")), MkInitializerAssignment(exp = MkExpConstant("0"))))));
                     exp.destType = Type { kind = intType, refCount = 1 };
                  }

                  // GetData(fieldCNTid, d);
                  rowGet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("GetData")),
                     args = MkList()))));
                  args->Add(MkExpIdentifier(MkIdentifier(fieldID)));
                  /*if(spec.type == nameSpecifier && spec.symbol && spec.symbol.registered && spec.symbol.registered.type == structClass)
                     args->Add(MkExpIdentifier(MkIdentifier("value")));
                  else*/
                     args->Add(MkExpIdentifier(MkIdentifier("d")));

                  // return d;
                  if(spec.type == nameSpecifier && spec.symbol && spec.symbol.registered && spec.symbol.registered.type == structClass)
                  {
                     rowGet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("value")), '=',
                        MkExpIdentifier(MkIdentifier("d"))))));
                  }
                  else
                     rowGet.compound.statements->Add(MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("d")))));

                  // *** SET ***
                  curContext = rowSet.compound.context = Context { parent = globalContext };

                  // SetData(fieldCNTid, value);
                  rowSet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("SetData")),
                     args = MkList()))));
                  args->Add(MkExpIdentifier(MkIdentifier(fieldID)));
                  args->Add(MkExpIdentifier(MkIdentifier("value")));

                  curContext = globalContext;
                  def = MkClassDefProperty(MkProperty(CopyList(entry.dataType.qualifiers, CopySpecifier), entry.dataType.declarator, CopyIdentifier(entry.id), rowSet, rowGet));
                  def.propertyDef.isDBProp = true;
                  def.memberAccess = publicAccess;
                  rowClassDefs->Add(def);
               }
               {
                  External external;

                  external = MkExternalDeclaration(MkDeclaration(
                     MkListOne(MkSpecifierName("Field")),
                     MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(fieldID)), null))));
                  ast->Add(external);
                  external.declaration.declMode = table.declMode;

                  // fieldCLSname      = tClasses.AddField("name", class(String), 0 );
                  args = MkList();
                  addFieldStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(fieldID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("FindField")),
                     args)))));
                  args->Add(MkExpString(entry.name));

                  args = MkList();
                  addFieldStatements->Add(
                     MkIfStmt(MkListOne(MkExpOp(null, '!', MkExpIdentifier(MkIdentifier(fieldID)))),
                        MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(fieldID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("AddField")),
                     args)))), null));
                  args->Add(MkExpString(entry.name));
                  args->Add(MkExpClass(CopyList(entry.dataType.qualifiers, CopySpecifier), CopyDeclarator(entry.dataType.declarator)));
                  args->Add(MkExpConstant("0"));

                  // fieldCLSname      = tClasses.FindField("name");
                  /*
                  args = MkList();
                  findFieldStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(fieldID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("FindField")),
                     args)))));
                  args->Add(MkExpString(entry.name));
                  */
               }
               if(isIndex)
               {
                  // indexes[0].field = fieldCLSid;
                  indexStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")),
                     MkListOne(MkExpConstant("0"))), MkIdentifier("field")),  '=', MkExpIdentifier(MkIdentifier(fieldID))))));

                  // indexes[0].order = ascending;
                  indexStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")),
                     MkListOne(MkExpConstant("0"))), MkIdentifier("order")),  '=', MkExpIdentifier(MkIdentifier("ascending"))))));

                  // tClasses.Index(1, indexes);
                  args = MkList();
                  indexStatements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("Index")), args))));
                  args->Add(MkExpConstant("1"));
                  args->Add(MkExpIdentifier(MkIdentifier("indexes")));
               }
               break;
            }
         }
      }
   }

   // ID Class
   if(table.symbol)
   {
      ClassDefinition _class;
      External external;
      ClassDef def;
      Expression exp;

      PushContext();
      _class = MkClass(table.symbol, MkListOne(MkSpecifierName("Id")), idClassDefs);
      PopContext(curContext);
      _class.declMode = table.declMode;
      external = MkExternalClass(_class);
      ast->Insert(addAfter, external);
      addAfter = external;

      def = MkClassDefClassPropertyValue(MkIdentifier("table"), MkInitializerAssignment(exp = MkExpOp(null, '&', MkExpDBTable(CopyString(table.name)))));
      ProcessExpression(exp);
      idClassDefs->Add(def);
      if(nameField[0])
      {
         def = MkClassDefClassPropertyValue(MkIdentifier("nameField"), MkInitializerAssignment(exp = MkExpOp(null, '&', MkExpDBField(CopyString(table.name), MkIdentifier(nameField)))));
         ProcessExpression(exp);
         idClassDefs->Add(def);
      }
      // indexed = true;
   }

   if(table.definitions)
   {
      DBTableEntry entry;

      for(entry = table.definitions->first; entry; entry = entry.next)
      {
         switch(entry.type)
         {
            case fieldEntry:
            {
               char fieldID[1024 + 1024 + 16];
               OldList * args;
               Specifier spec = entry.dataType.qualifiers ? (Specifier)entry.dataType.qualifiers->first : null;

               sprintf(fieldID, "__ecereDBField_%s_%s", tableName, entry.id.string);

               if(idClassDefs && spec)
               {
                  Statement idSet = MkCompoundStmt(MkList(), MkList()), idGet = MkCompoundStmt(MkList(), MkList());
                  ClassDef def;

                  curContext = idGet.compound.context = Context { parent = globalContext };

                  // *** GET ***
                  // RowContacts r { this };
                  idGet.compound.declarations->Add(MkDeclarationInst(MkInstantiation(MkSpecifierName(rowClassName), MkExpIdentifier(MkIdentifier("r")),
                     MkListOne(MkMembersInitList(MkListOne(MkMemberInit(null, MkInitializerAssignment(MkExpIdentifier(MkIdentifier("this"))))))))));

                  // Contact d = null;
                  if(spec.type == nameSpecifier && spec.symbol && spec.symbol.registered && spec.symbol.registered.type == structClass)
                  {
                     idGet.compound.declarations->Add(MkDeclarationInst(MkInstantiation(MkSpecifierName(spec.name), MkExpIdentifier(MkIdentifier("d")), null)));
                  }
                  else
                  {
                     Expression exp;
                     idGet.compound.declarations->Add(MkDeclaration(CopyList(entry.dataType.qualifiers, CopySpecifier),
                        MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("d")), MkInitializerAssignment(exp = MkExpConstant("0"))))));
                     exp.destType = Type { kind = intType, refCount = 1 };
                  }

                  // r.GetData(fieldCNTid, d);
                  idGet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("r")), MkIdentifier("GetData")),
                     args = MkList()))));
                  args->Add(MkExpIdentifier(MkIdentifier(fieldID)));
                  /*if(spec.type == nameSpecifier && spec.symbol && spec.symbol.registered && spec.symbol.registered.type == structClass)
                     args->Add(MkExpIdentifier(MkIdentifier("value")));
                  else*/
                     args->Add(MkExpIdentifier(MkIdentifier("d")));

                  // delete r;
                  idGet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(null, DELETE, MkExpIdentifier(MkIdentifier("r"))))));

                  // return d;
                  if(spec.type == nameSpecifier && spec.symbol && spec.symbol.registered && spec.symbol.registered.type == structClass)
                  {
                     idGet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("value")), '=',
                        MkExpIdentifier(MkIdentifier("d"))))));
                  }
                  else
                     idGet.compound.statements->Add(MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("d")))));

                  // *** SET ***
                  curContext = idSet.compound.context = Context { parent = globalContext };

                  // RowContacts r { this };

                  idSet.compound.declarations->Add(MkDeclarationInst(MkInstantiation(MkSpecifierName(rowClassName), MkExpIdentifier(MkIdentifier("r")),
                     MkListOne(MkMembersInitList(MkListOne(MkMemberInit(null, MkInitializerAssignment(MkExpIdentifier(MkIdentifier("this"))))))))));

                  // r.SetData(fieldCNTid, value);
                  idSet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("r")), MkIdentifier("SetData")),
                     args = MkList()))));
                  args->Add(MkExpIdentifier(MkIdentifier(fieldID)));
                  args->Add(MkExpIdentifier(MkIdentifier("value")));

                  // delete r;
                  idSet.compound.statements->Add(MkExpressionStmt(MkListOne(MkExpOp(null, DELETE, MkExpIdentifier(MkIdentifier("r"))))));

                  curContext = globalContext;

                  def = MkClassDefProperty(MkProperty(
                     CopyList(entry.dataType.qualifiers, CopySpecifier), CopyDeclarator(entry.dataType.declarator),
                        CopyIdentifier(entry.id), idSet, idGet));
                  def.propertyDef.isDBProp = true;
                  def.memberAccess = publicAccess;
                  idClassDefs->Add(def);
               }

               /*
               entry.dataType.qualifiers = null;
               entry.dataType.declarator = null;
               entry.id = null;
               */
               break;
            }
            case indexEntry:
            {
               if(entry.items && entry.items->count)
               {
                  char indexID[1024 + 1024 + 16];
                  DBIndexItem item;
                  int c;
                  bool needTable = false;
                  char num[16];
                  if(entry.id || indexed)
                  {
                     if(entry.id || entry.items->count == 1)
                     {
                        External external;
                        Identifier id = entry.id ? entry.id : ((DBIndexItem)entry.items->first).id;
                        sprintf(indexID, "__ecereDBIndex_%s_%s", tableName, id.string);
                        external = MkExternalDeclaration(MkDeclaration(
                           MkListOne(MkSpecifierName("Table")),
                           MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(indexID)), null))));
                        ast->Add(external);
                        external.declaration.declMode = table.declMode;
                        needTable = true;
                     }
                     else
                        Compiler_Error($"Multiple field index requires a name\n");
                  }
                  else
                  {
                     indexed = true;
                     strcpy(indexID, tableID);
                  }

                  for(c = 0, item = entry.items->first; item; item = item.next, c++)
                  {
                     char fieldID[1024 + 1024 + 16];
                     // indexes[c].field = fieldCLSid;
                     sprintf(num, "%d", c);
                     sprintf(fieldID, "__ecereDBField_%s_%s", tableName, item.id.string);

                     indexStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")),
                        MkListOne(MkExpConstant(num))), MkIdentifier("field")),  '=', MkExpIdentifier(MkIdentifier(fieldID))))));
                     indexStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")),
                        MkListOne(MkExpConstant(num))), MkIdentifier("order")),  '=', MkExpIdentifier(MkIdentifier((item.order == ascending) ? "ascending" : "descending"))))));
                  }
                  sprintf(num, "%d", c);
                  numIndexes = Max(numIndexes, c);
                  if(needTable)
                  {
                     // index          = db.OpenTable("Classes",        { tableRows });
                     args = MkList();
                     indexStatements->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(indexID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("db")), MkIdentifier("OpenTable")),
                        args)))));
                     args->Add(MkExpString(table.name));
                     members = MkList();
                     args->Add(MkExpInstance(MkInstantiation(null, null, MkListOne(MkMembersInitList(members)))));
                     members->Add(MkMemberInit(null, MkInitializerAssignment(MkExpIdentifier(MkIdentifier("tableRows")))));
                  }
                  // tClasses.Index(1, indexes);
                  args = MkList();
                  indexStatements->Add(MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(indexID)), MkIdentifier("Index")), args))));
                  args->Add(MkExpConstant(num));
                  args->Add(MkExpIdentifier(MkIdentifier("indexes")));
               }
               break;
            }
         }
      }
   }
}

public void ProcessDBTableDefinitions()
{
   External external;
   addAfter = null;

   curContext = globalContext;
   if(inCompiler)
      PrePreProcessClassDefinitions();

   DeclClass(null, "Field");
   DeclClass(null, "Table");
   DeclClass(null, "Row");
   DeclClass(null, "Id");
   numIndexes = 0;
   if(ast != null)
   {
      for(external = ast->first; external; external = external.next)
      {
         curExternal = external;

         addAfter = external.prev;
         switch(external.type)
         {
            case dbtableExternal:
               ProcessDBTable(external.table);
               break;
         }
      }

      for(external = ast->first; external; external = external.next)
      {
         curExternal = external;

         addAfter = external.prev;

         switch(external.type)
         {
            case functionExternal:
               ProcessFunction(external.function);
               break;
            case declarationExternal:
               ProcessDeclaration(external.declaration);
               break;
            case classExternal:
               ProcessClass(external._class);
               break;
         }
      }
   }
   curContext = globalContext;
}
