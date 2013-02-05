import "ecdefs"

#define YYLTYPE Location

#include "grammar.h"

int outputLine;

bool memoryGuard = false;
public void SetMemoryGuard(bool b) { memoryGuard = b; } public bool GetMemoryGuard() { return memoryGuard; }

static void OutputIdentifier(Identifier id, File f)
{
   if(id)
   {
      /*
      TODO: Name Space Fix ups
      if(id.nameSpace && id.nameSpace->name)
      {
         f.Puts(id.nameSpace->name);
      }
      else */if(id._class)
      {
         if(id._class.type == templateTypeSpecifier)
         {
            if(id._class.templateParameter && id._class.templateParameter.identifier && id._class.templateParameter.identifier.string)
               f.Puts(id._class.templateParameter.identifier.string);
         }
         else
         {
            if(id._class.name)
            {
               if(!strcmp(id._class.name, "class"))
                  f.Puts("typed_object");
               else
                  f.Puts(id._class.name);
            }
         }
         f.Puts("::");
      }
   }
   f.Puts((id && id.string) ? id.string : "(null identifier)");
}

static void OutputOperator(int op, File f)
{
   switch(op)
   {
      case INC_OP: f.Puts("++"); break;
      case DEC_OP: f.Puts("--");break;
      case SIZEOF: f.Puts("sizeof "); break;
      case LEFT_OP: f.Puts("<<"); break;
      case RIGHT_OP: f.Puts(">>"); break;
      case LE_OP: f.Puts("<="); break;
      case GE_OP: f.Puts(">="); break;
      case EQ_OP: f.Puts("=="); break;
      case NE_OP: f.Puts("!="); break;
      case AND_OP: f.Puts("&&"); break;
      case OR_OP: f.Puts("||"); break;
	   case MUL_ASSIGN: f.Puts("*="); break;
	   case DIV_ASSIGN: f.Puts("/="); break;
	   case MOD_ASSIGN: f.Puts("%="); break;
	   case ADD_ASSIGN: f.Puts("+="); break;
	   case SUB_ASSIGN: f.Puts("-="); break;
	   case LEFT_ASSIGN: f.Puts("<<="); break;
	   case RIGHT_ASSIGN: f.Puts(">>="); break;
	   case AND_ASSIGN: f.Puts("&="); break;
	   case XOR_ASSIGN: f.Puts("^="); break;
	   case OR_ASSIGN: f.Puts("|="); break;
      case '&': case '*': case '+': case '-': case '~': case '!': case '/': case '%':
      case '<': case '>': case '|': case '^': case '=':
         f.Putc((char)op);
         break;
      case DELETE: f.Puts("delete "); break;
   }
}

public void OutputTypeName(TypeName type, File f)
{
   /*if(type.typedObject) 
   {
      //f.Puts("Class * class, void *");
      f.Puts("class");
   }
   else */if(type.qualifiers)
   {
      Specifier spec;
      for(spec = type.qualifiers->first; spec; spec = spec.next)
      {
         OutputSpecifier(spec, f);
         if(spec.next) f.Puts(" ");
      }
   }
   if(type.declarator) 
   {
      f.Puts(" ");
      OutputDeclarator(type.declarator, f);
   }

   if(/*!type.typedObject && */!type.qualifiers && !type.declarator)
      f.Puts("...");

}

public void OutputExpression(Expression exp, File f)
{
   switch(exp.type)
   {
      case classExp:
         f.Puts("class(");
         if(exp._classExp.specifiers)
         {
            Specifier spec;
            for(spec = exp._classExp.specifiers->first; spec; spec = spec.next)
            {
               OutputSpecifier(spec, f);
               if(spec.next) f.Puts(" ");
            }
            if(exp._classExp.decl) 
            {
               f.Puts(" ");
               OutputDeclarator(exp._classExp.decl, f);
            }
            f.Puts(")");
         }
         break;
      case extensionCompoundExp:
         f.Puts("__extension__ (");
         OutputStatement(exp.compound, f);
         f.Puts(")");
         break;
      case newExp:
         f.Puts("new ");
         f.Puts(" ");
         OutputTypeName(exp._renew.typeName, f);
         f.Puts("[");
         OutputExpression(exp._renew.size, f);
         f.Puts("]");
         break;
      case new0Exp:
         f.Puts("new0 ");
         f.Puts(" ");
         OutputTypeName(exp._renew.typeName, f);
         f.Puts("[");
         OutputExpression(exp._renew.size, f);
         f.Puts("]");
         break;
      case renewExp:
         f.Puts("renew ");
         OutputExpression(exp._renew.exp, f);
         f.Puts(" ");
         OutputTypeName(exp._renew.typeName, f);
         f.Puts("[");
         OutputExpression(exp._renew.size, f);
         f.Puts("]");
         break;
      case renew0Exp:
         f.Puts("renew0 ");
         OutputExpression(exp._renew.exp, f);
         f.Puts(" ");
         OutputTypeName(exp._renew.typeName, f);
         f.Puts("[");
         OutputExpression(exp._renew.size, f);
         f.Puts("]");
         break;
      case identifierExp:
         if(exp.identifier)
            OutputIdentifier(exp.identifier, f);
         break;
      case instanceExp:
         if(exp.instance)
            OutputInstance(exp.instance, f);
         break;
      case constantExp:
         if(exp.constant)
            f.Puts(exp.constant);
         else
            printf("");
         break;
      case stringExp:
         if(exp.string)
            f.Puts(exp.string);
         break;
      case opExp:
         if(exp.op.exp1)
         {
            OutputExpression(exp.op.exp1, f);
            if(exp.op.exp2)
               f.Puts(" ");
         }
         OutputOperator(exp.op.op, f);
         if(exp.op.exp2)
         {
            if(exp.op.exp1 || (exp.op.exp2.type == opExp && !exp.op.exp2.op.exp1 && exp.op.exp2.op.op == exp.op.op))
               f.Puts(" ");
            OutputExpression(exp.op.exp2, f);
         }
         break;
      case extensionExpressionExp: 
      case bracketsExp:
      {
         Expression expression;
         if(exp.type == extensionExpressionExp)
            f.Puts("__extension__ (");
         f.Puts("(");
         if(exp.list)
         {
            for(expression = exp.list->first; expression; expression = expression.next)
            {
               OutputExpression(expression, f);
               if(expression.next) f.Puts(", ");
            }
         }
         f.Puts(")");
         break;
      }
      case indexExp:
      {
         Expression expression;
         if(exp.index.exp)
            OutputExpression(exp.index.exp, f);
         f.Puts("[");
         if(exp.index.index)
            for(expression = exp.index.index->first; expression; expression = expression.next)
            {
               OutputExpression(expression, f);
               if(expression.next) f.Puts(", ");
            }
         f.Puts("]");
         break;
      }
      case callExp:
      {
         OutputExpression(exp.call.exp, f);
         f.Puts("(");
         if(exp.call.arguments)
         {
            Expression expression;
            for(expression = exp.call.arguments->first; expression; expression = expression.next)
            {
               OutputExpression(expression, f);
               if(expression.next) f.Puts(", ");
            }
         }
         f.Puts(")");
         break;
      }
      case memberExp:
         if(exp.member.exp)
            OutputExpression(exp.member.exp, f);
         f.Puts(".");
         if(exp.member.member)
            OutputIdentifier(exp.member.member, f);
         break;
      case pointerExp:
         OutputExpression(exp.member.exp, f);
         f.Puts("->");
         OutputIdentifier(exp.member.member, f);
         break;
      case typeSizeExp:
         f.Puts("sizeof(");
         OutputTypeName(exp.typeName, f);
         f.Puts(")");
         break;
      case typeAlignExp:
         f.Puts("__alignof__(");
         OutputTypeName(exp.typeName, f);
         f.Puts(")");
         break;
      case extensionInitializerExp:
         f.Puts("__extension__ (");
         if(exp.initializer.typeName)
            OutputTypeName(exp.initializer.typeName, f);
         f.Puts(")");
         if(exp.initializer.initializer)
            OutputInitializer(exp.initializer.initializer, f);
         break;
      case castExp:
         f.Puts("(");
         OutputTypeName(exp.cast.typeName, f);
         f.Puts(")");
         if(exp.cast.exp)
            OutputExpression(exp.cast.exp, f);
         break;
      case conditionExp:
         OutputExpression(exp.cond.cond, f);
         f.Puts(" ? ");
         {
            Expression expression;
            for(expression = exp.cond.exp->first; expression; expression = expression.next)
            {
               OutputExpression(expression, f);
               if(expression.next) f.Puts(", ");
            }
         }
         f.Puts(" : ");
         OutputExpression(exp.cond.elseExp, f);
         break;
      case vaArgExp:
         f.Puts("__builtin_va_arg(");
         OutputExpression(exp.vaArg.exp, f);
         f.Puts(", ");
         OutputTypeName(exp.vaArg.typeName, f);
         f.Puts(")");
         break;
      case arrayExp:
         f.Puts("[");
         if(exp.list)
         {
            Expression expression;
            for(expression = exp.list->first; expression; expression = expression.next)
            {
               OutputExpression(expression, f);
               if(expression.next) f.Puts(", ");
            }
         }
         f.Puts("]");
         break;
   }
}

static void OutputAsmField(AsmField field, File f)
{
   f.Puts(field.command);
   if(field.expression)
   {
      f.Puts("(");
      OutputExpression(field.expression, f);
      f.Puts(")");
   }
}

static void OutputStatement(Statement stmt, File f)
{
   char name[MAX_FILENAME] = "";
   char origName[MAX_FILENAME] = "";

   /*
   if(sourceFile)
      eString_GetLastDirectory(sourceFile, name);
   */

   if(inCompiler)
   {
      if(yylloc.start.included)
      {
         //GetWorkingDir(name, sizeof(name));
         PathCat(name, GetIncludeFileFromID(yylloc.start.included));
      }
      else if(sourceFile)
      {
         //GetWorkingDir(name, sizeof(name));
         PathCat(name, sourceFile);
      }
      ChangeCh(name, '\\', '/');

      //GetWorkingDir(origName, sizeof(origName));
      PathCat(origName, outputFile);
      ChangeCh(origName, '\\', '/');
   }


   if(inCompiler && outputLineNumbers && stmt.loc.start.line) 
   {
      /*if(stmt.loc.start.line == 1)
         printf("bug");*/
      f.Printf("\n#line %d \"%s\"\n", stmt.loc.start.line, name);
      outputLine += 2;
   }

   switch(stmt.type)
   {
      case labeledStmt:
         OutputIdentifier(stmt.labeled.id, f);
         f.Puts(":\n");
         outputLine ++;
         OutputStatement(stmt.labeled.stmt, f);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            f.Puts("case ");
            OutputExpression(stmt.caseStmt.exp, f);
            f.Puts(":\n");
            outputLine ++;
         }
         else
         {
            f.Puts("default:\n");
            outputLine ++;
         }
         if(stmt.caseStmt.stmt)
            OutputStatement(stmt.caseStmt.stmt, f);
         break;
      case compoundStmt:
      {
         f.Puts("{\n");
         outputLine ++;
         if(stmt.compound.declarations)
         {
            Declaration decl;
            for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
            {
               OutputDeclaration(decl, f);

            }
         }
         if(stmt.compound.statements)
         {
            Statement statement;
            if(stmt.compound.declarations)
            {
               f.Puts("\n");
               outputLine ++;
            }
            for(statement = stmt.compound.statements->first; statement; statement = statement.next)
            {
               OutputStatement(statement, f);
               f.Puts("\n");
               outputLine ++;
            }
         }
         if(inCompiler && outputLineNumbers && stmt.loc.end.line) 
         {
            /*if(stmt.loc.end.line == 1)
               printf("bug");*/

            f.Printf("\n#line %d \"%s\"\n", stmt.loc.end.line, name);
            outputLine += 2;
         }

         f.Puts("}");
         break;
      }
      case expressionStmt:
      {
         if(stmt.expressions)
         {
            Expression exp;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               OutputExpression(exp, f);
               if(exp.next) f.Puts(", ");
            }
         }
         f.Puts(";");
         break;
      }
      case ifStmt:
      {
         Expression exp;
         f.Puts("if(");
         for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
         {
            OutputExpression(exp, f);
            if(exp.next) f.Puts(", ");
         }
         f.Puts(")\n");
         outputLine ++;
         if(stmt.ifStmt.stmt)
            OutputStatement(stmt.ifStmt.stmt, f);
         if(stmt.ifStmt.elseStmt)
         {
            f.Puts("\n");
            outputLine ++;
            f.Puts("else");
            if(stmt.ifStmt.elseStmt.type != ifStmt)
            {
               f.Puts("\n");
               outputLine ++;
            }
            else
               f.Puts(" ");
            OutputStatement(stmt.ifStmt.elseStmt, f);
         }
         break;
      }
      case switchStmt:
      {
         Expression exp;
         f.Puts("switch(");
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
         {
            OutputExpression(exp, f);
            if(exp.next) f.Puts(", ");
         }
         f.Puts(")\n");
         outputLine ++;
         OutputStatement(stmt.switchStmt.stmt, f);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         f.Puts("while(");
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
         {
            OutputExpression(exp, f);
            if(exp.next) f.Puts(", ");
         }
         f.Puts(")\n");
         outputLine ++;
         OutputStatement(stmt.whileStmt.stmt, f);
         break;
      }
      case doWhileStmt:
      {
         Expression exp;
         f.Puts("do\n");
         outputLine ++;
         OutputStatement(stmt.whileStmt.stmt, f);
         f.Puts("while(");
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
         {
            OutputExpression(exp, f);
            if(exp.next) f.Puts(", ");
         }
         f.Puts(");");
         break;
      }
      case forStmt:
      {
         Expression exp;
         f.Puts("for(");
         OutputStatement(stmt.forStmt.init, f);
         f.Puts(" ");
         OutputStatement(stmt.forStmt.check, f);
         f.Puts(" ");
         if(stmt.forStmt.increment)
         {
            // TESTING THIS HERE FOR FOR INCREMENT
            if(inCompiler && outputLineNumbers && stmt.loc.end.line) 
            {
               /*if(stmt.loc.end.line == 1)
                  printf("bug");*/

               f.Printf("\n#line %d \"%s\"\n", stmt.loc.end.line, name);
               outputLine += 2;
            }

            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               OutputExpression(exp, f);
               if(exp.next) f.Puts(", ");
            }
         }
         f.Puts(")\n");
         outputLine ++;
         OutputStatement(stmt.forStmt.stmt, f);
         break;
      }
      case gotoStmt:
      {
         f.Puts("goto ");
         OutputIdentifier(stmt.gotoStmt.id, f);
         f.Puts(";");
         break;
      }
      case continueStmt:
         f.Puts("continue;");
         break;
      case breakStmt:
         f.Puts("break;");
         break;
      case returnStmt:
      {
         Expression exp;

         if(inCompiler && memoryGuard)
         {
            Expression exp = stmt.expressions ? stmt.expressions->last : null;
            f.Printf("{ ");
            if(exp && exp.expType)
            {
               
               char string[1024] = "";
               OldList * specs = MkList();
               Declarator decl;
               TypeName typeName;
               if(exp.expType.kind == templateType)
               {
                  if(exp.expType.templateParameter.dataTypeString)
                     decl = SpecDeclFromString(exp.expType.templateParameter.dataTypeString, specs,
                        MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal")));
                  else if(exp.expType.templateParameter.dataType)
                  {
                     delete specs;
                     specs = CopyList(exp.expType.templateParameter.dataType.specifiers, CopySpecifier);
                     decl = PlugDeclarator(/*CopyDeclarator(*/exp.expType.templateParameter.dataType.decl/*)*/, 
                        MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal")));
                  }
                  else
                  {
                     ListAdd(specs, MkSpecifierName("uint64"));
                     decl = MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal"));
                  }
               }
               else
               {
                  PrintType(exp.expType, string, true, true);
                  decl = SpecDeclFromString(string, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal")));
               }

               typeName = MkTypeName(specs, decl);
               InstDeclPassTypeName(typeName, false);
               OutputTypeName(typeName, f);
               f.Printf(";");
               FreeTypeName(typeName);
            }
         }
         if(!memoryGuard)
            f.Puts("return ");
         else 
         {
            Expression exp = stmt.expressions ? stmt.expressions->last : null;
            if(exp && exp.expType)
               f.Printf("__ecereReturnVal = ");
         }

         if(stmt.expressions)
         {
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               OutputExpression(exp, f);
               if(exp.next) f.Puts(", ");
            }
         }
         f.Puts(";");

         if(inCompiler && memoryGuard)
         {
            Expression exp = stmt.expressions ? (Expression)stmt.expressions->last : null;
            f.Printf(" __ecereNameSpace__ecere__com__MemoryGuard_PopLoc();");
            if(exp && exp.expType)
               f.Printf("return __ecereReturnVal;");
            else
               f.Printf("return;");

            f.Printf("}");
         }

         break;
      }
      case asmStmt:
      {
         AsmField field;
         f.Puts("__asm__ ");
         if(stmt.asmStmt.spec)
            OutputSpecifier(stmt.asmStmt.spec, f);
         f.Puts("(");
         f.Puts(stmt.asmStmt.statements);

         if(stmt.asmStmt.inputFields || stmt.asmStmt.outputFields || stmt.asmStmt.clobberedFields)
         {
            f.Puts(":");
            if(stmt.asmStmt.inputFields)
            {
               for(field = stmt.asmStmt.inputFields->first; field; field = field.next)
               {
                  if(field.prev) f.Puts(",");
                  OutputAsmField(field, f);
               }
            }
         }
         if(stmt.asmStmt.outputFields || stmt.asmStmt.clobberedFields)
         {
            f.Puts(":");
            if(stmt.asmStmt.outputFields)
            {
               for(field = stmt.asmStmt.outputFields->first; field; field = field.next)
               {
                  if(field.prev) f.Puts(",");
                  OutputAsmField(field, f);
               }
            }
         }
         if(stmt.asmStmt.clobberedFields)
         {
            f.Puts(":");
            for(field = stmt.asmStmt.clobberedFields->first; field; field = field.next)
            {
               if(field.prev) f.Puts(",");
               OutputAsmField(field, f);
            }
         }
         f.Puts(");\n");
         break;
      }
   }

   if(inCompiler && outputLineNumbers && stmt.loc.start.line) 
   {
      f.Printf("\n#line %d \"%s\"\n", outputLine+2, origName);
      outputLine += 2;
   }
}

static void OutputPointer(Pointer ptr, File f)
{
   f.Puts("*");
   if(ptr.qualifiers)
   {
      Specifier spec;
      f.Puts(" ");
      for(spec = ptr.qualifiers->first; spec; spec = spec.next)
      {
         OutputSpecifier(spec, f);
         if(spec.next) f.Puts(" ");
      }
   }
   if(ptr.pointer)
   {
      OutputPointer(ptr.pointer, f);
   }
}

static void OutputDeclarator(Declarator decl, File f)
{
   switch(decl.type)
   {
      case structDeclarator:
         if(decl.declarator)
         {
            OutputDeclarator(decl.declarator, f);
         }
         if(decl.structDecl.exp)
         {
            f.Puts(" : ");
            OutputExpression(decl.structDecl.exp, f);
         }
         if(decl.structDecl.posExp)
         {
            f.Puts(" : ");
            OutputExpression(decl.structDecl.posExp, f);
         }
         if(decl.structDecl.attrib)
         {
            f.Puts(" ");
            OutputAttrib(decl.structDecl.attrib, f);
         }
         break;
      case identifierDeclarator:
         OutputIdentifier(decl.identifier, f);
         break;
      case bracketsDeclarator:
         f.Puts("(");
         OutputDeclarator(decl.declarator, f);
         f.Puts(")");
         break;
      case extendedDeclarator:
         if(decl.extended.extended) OutputExtDecl(decl.extended.extended, f);
         f.Puts(" ");
         OutputDeclarator(decl.declarator, f);
         break;
      case extendedDeclaratorEnd:
         OutputDeclarator(decl.declarator, f);
         f.Puts(" ");
         if(decl.extended.extended)
            OutputExtDecl(decl.extended.extended, f);
         break;
      case arrayDeclarator:
         if(decl.declarator)
         {
            OutputDeclarator(decl.declarator, f);
         }
         f.Puts("[");
         if(decl.array.exp)
         {
            // Hacked this here
            ProcessExpressionType(decl.array.exp);
            ComputeExpression(decl.array.exp);

            OutputExpression(decl.array.exp, f);
         }
         else if(decl.array.enumClass)
         {
            Symbol _class = decl.array.enumClass.symbol; // FindClass(decl.array.enumClass.name);
            if(_class && _class.registered)
            {
               f.Printf("%d", eClass_GetProperty(_class.registered, "enumSize"));
            }            
         }
         f.Puts("]");
         break;
      case functionDeclarator:
      {
         TypeName param;

         if(decl.declarator)
            OutputDeclarator(decl.declarator, f);
         f.Puts("(");
         if(decl.function.parameters && decl.function.parameters->first)
         {
            for(param = decl.function.parameters->first; param; param = param.next)
            {
               OutputTypeName(param, f);
               if(param.next)
                  f.Puts(", ");
            }
         }
         f.Puts(")");
         break;
      }
      case pointerDeclarator:
         if(decl.pointer.pointer) OutputPointer(decl.pointer.pointer, f);
         if(decl.declarator) 
         {
            f.Puts(" ");
            OutputDeclarator(decl.declarator, f);
         }
         break;
   }
}

static void OutputEnumerator(Enumerator enumerator, File f)
{
   OutputIdentifier(enumerator.id, f);
   if(enumerator.exp)
   {
      f.Puts(" = ");
      OutputExpression(enumerator.exp, f);
   }
}

static void OutputAttribute(Attribute attr, File f)
{
   if(attr.attr)
      f.Puts(attr.attr);
   if(attr.exp)
   {
      f.Puts(" ");
      OutputExpression(attr.exp, f);
   }
}

static void OutputAttrib(Attrib attr, File f)
{
   switch(attr.type)
   {
      case ATTRIB:      f.Puts("__attribute__(("); break;
      case __ATTRIB:    f.Puts("__attribute((");  break;
      case ATTRIB_DEP:  f.Puts("__attribute_deprecated__(("); break;
   }
   
   if(attr.attribs)
   {
      Attribute attrib;
      for(attrib = attr.attribs->first; attrib; attrib = attrib.next)
      {
         if(attrib.prev) f.Puts(" ");
         OutputAttribute(attrib, f);
      }
   }
   f.Puts("))"); 
}

static void OutputExtDecl(ExtDecl extDecl, File f)
{
   if(extDecl.type == extDeclString && extDecl.s)
      f.Puts(extDecl.s);
   else if(extDecl.type == extDeclAttrib)
      OutputAttrib(extDecl.attr, f);
}

static void OutputSpecifier(Specifier spec, File f)
{
   switch(spec.type)
   {
      case baseSpecifier:
         switch(spec.specifier)
         {
            // Storage Class
            case TYPEDEF:
               f.Puts("typedef");
               break;
            case EXTERN:
               f.Puts("extern");
               break;
            case STATIC:
               f.Puts("static");
               break;
            case AUTO:
               f.Puts("auto");
               break;
            case REGISTER:
               f.Puts("register");
               break;

            // Qualifier
            case CONST:
               f.Puts("const");
               break;
            case VOLATILE:
               f.Puts("volatile");
               break;

            // Type Specifier
            case VOID:
               f.Puts("void");
               break;
            case CHAR:
               f.Puts("char");
               break;
            case SHORT:
               f.Puts("short");
               break;
            case INT:
               f.Puts("int");
               break;
            case UINT:
               f.Puts("unsigned int");
               break;
            case INT64:
               //f.Puts("__int64");
               //f.Puts("int64");
               f.Puts("long long");
               break;
            case VALIST:
               f.Puts("__builtin_va_list");
               break;
            case LONG:
               f.Puts("long");
               break;
            case FLOAT:
               f.Puts("float");
               break;
            case DOUBLE:
               f.Puts("double");
               break;
            case SIGNED:
               f.Puts("signed");
               break;
            case UNSIGNED:
               f.Puts("unsigned");
               break;
            case TYPED_OBJECT:
               f.Puts("typed_object");
               break;
            case ANY_OBJECT:
               f.Puts("any_object");
               break;
            case CLASS:
               f.Puts("class");
               break;
            case THISCLASS:
               f.Puts("thisclass");
               break;
         }
         break;
      case extendedSpecifier:
         if(spec.extDecl)
            OutputExtDecl(spec.extDecl, f);
         break;
      case nameSpecifier:
      //case classSpecifier:
         if(spec.name && !strcmp(spec.name, "class"))
         {
            f.Puts("typed_object");
         }
         else
         {
            Symbol symbol = spec.symbol; // FindClass(spec.name);
            // WILL HAVE TO VERIFY THESE ELSEWHERE...
            if(!symbol && spec.name)
               symbol = FindClass(spec.name);
            if(symbol)
            {
               f.Puts(symbol.string ? symbol.string : "(null)");
            }
            else if(spec.name)
               f.Puts(spec.name);
         }
         break;
      case enumSpecifier:
      {
         f.Puts("enum");
         if(spec.id)
         {
            f.Puts(" ");
            OutputIdentifier(spec.id, f);
         }
         if(spec.list)
         {
            Enumerator enumerator;
            f.Puts("\n{\n");
            outputLine += 2;
            for(enumerator = spec.list->first; enumerator; enumerator = enumerator.next)
            {
               OutputEnumerator(enumerator, f);
               if(enumerator.next) f.Puts(", ");
            }
            f.Puts("\n}");
            outputLine ++;
         }
         break;
      }
      case structSpecifier:
      case unionSpecifier:
      {
         f.Puts((spec.type == structSpecifier) ? "struct" : "union");
         if(spec.id)
         {
            f.Puts(" ");
            OutputIdentifier(spec.id, f);
         }
         if(spec.definitions)
         {
            ClassDef def;
            f.Puts("\n{\n");
            outputLine += 2;
            for(def = spec.definitions->first; def; def = def.next)
            {
               //OutputDeclaration(decl, f);
               OutputClassDef(def, f);
            }
            f.Puts("} __attribute__ ((gcc_struct))");
         }
         break;
      }
      case typeOfSpecifier:
         f.Puts("__typeof(");
         OutputExpression(spec.expression, f);
         f.Puts(")");                  
         break;
      case subClassSpecifier:
         f.Puts("subclass(");
         OutputSpecifier(spec._class, f);
         f.Puts(")");                  
         break;
      case templateTypeSpecifier:
         OutputIdentifier(spec.templateParameter.identifier, f);
         break;
   }
}

static void OutputInitializer(Initializer initializer, File f)
{
   char name[MAX_FILENAME] = "";
   char origName[MAX_FILENAME] = "";

   /*
   if(sourceFile)
      eString_GetLastDirectory(sourceFile, name);
   */

   if(inCompiler)
   {
      if(yylloc.start.included)
      {
         //GetWorkingDir(name, sizeof(name));
         PathCat(name, GetIncludeFileFromID(yylloc.start.included));
      }
      else if(sourceFile)
      {
         //GetWorkingDir(name, sizeof(name));
         PathCat(name, sourceFile);
      }
      ChangeCh(name, '\\', '/');

      //GetWorkingDir(origName, sizeof(origName));
      PathCat(origName, outputFile);
      ChangeCh(origName, '\\', '/');
   }

   switch(initializer.type)
   {
      case listInitializer:
      {
         Initializer init;
         f.Puts("\n{\n");
         outputLine += 2;

         if(inCompiler && outputLineNumbers && initializer.loc.start.line) 
         {
            /*if(initializer.loc.start.line == 1)
               printf("bug");*/

            f.Printf("\n#line %d \"%s\"\n", initializer.loc.start.line, name);
            outputLine += 2;
         }

         for(init = initializer.list->first; init; init = init.next)
         {
            OutputInitializer(init, f);
            if(init.next) f.Puts(", ");
         }
         f.Puts("\n}");

         if(inCompiler && outputLineNumbers && initializer.loc.start.line) 
         {
            /*if(initializer.loc.start.line == 1)
               printf("bug");*/

            f.Printf("\n#line %d \"%s\"\n", initializer.loc.start.line, name);
            outputLine += 2;
         }

         outputLine ++;
         break;
      }
      case expInitializer:
         if(initializer.exp)
            OutputExpression(initializer.exp, f);
         break;
   }
}

static void OutputInitDeclarator(InitDeclarator decl, File f)
{
   OutputDeclarator(decl.declarator, f);
   if(decl.initializer)
   {
      f.Puts(" = ");
      OutputInitializer(decl.initializer, f);
   }
}

static void OutputDeclaration(Declaration decl, File f)
{
   Specifier spec;
   char origName[MAX_FILENAME] = "";

   switch(decl.type)
   {
      case initDeclaration:
      {
         InitDeclarator d;

         //GetWorkingDir(origName, sizeof(origName));
         if(inCompiler)
         {
            PathCat(origName, outputFile);
            ChangeCh(origName, '\\', '/');
         }

         if(decl.declarators && decl.declarators->first)
         {
            for(d = decl.declarators->first; d; d = d.next)
               if(d.initializer)
               {
                  char name[MAX_FILENAME] = "";
                  /*
                  if(sourceFile)
                     GetLastDirectory(sourceFile, name);
                  */

                  if(yylloc.start.included)
                  {
                     //GetWorkingDir(name, sizeof(name));
                     PathCat(name, GetIncludeFileFromID(yylloc.start.included));
                  }
                  else if(sourceFile)
                  {
                     //GetWorkingDir(name, sizeof(name));
                     PathCat(name, sourceFile);
                  }
                  ChangeCh(name, '\\', '/');

                  if(inCompiler && outputLineNumbers && decl.loc.start.line) 
                  {
                     /*if(decl.loc.start.line == 1)
                        printf("bug");*/

                     f.Printf("\n#line %d \"%s\"\n", decl.loc.start.line, name);
                     outputLine += 2;
                  }
                  break;
               }
         }

         if(decl.specifiers)
         {
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               OutputSpecifier(spec, f);
               if(spec.next) f.Puts(" ");
            }
         }
         if(decl.declarators && decl.declarators->first)
         {
            f.Puts(" ");

            for(d = decl.declarators->first; d; d = d.next)
            {
               OutputInitDeclarator(d, f);
               if(d.next) f.Puts(", ");
            }   
         }
         break;
      }
      case structDeclaration:
      {
         if(decl.specifiers)
         {
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               OutputSpecifier(spec, f);
               if(spec.next) f.Puts(" ");
            }
         }
         if(decl.declarators)
         {
            Declarator d;
            f.Puts(" ");

            for(d = decl.declarators->first; d; d = d.next)
            {
               OutputDeclarator(d, f);
               if(d.next) f.Puts(", ");
            }   
         }
         if(decl.extStorage)
         {
            f.Puts(" ");
            OutputSpecifier(decl.extStorage, f);
         }
         break;
      }
      case instDeclaration:
         if(decl.inst)
         {
            OutputInstance(decl.inst, f);
         }
         break;
      case defineDeclaration:
         return; // Skip semicolon
   }
   f.Puts(";\n");
   outputLine ++;
   if(inCompiler && outputLineNumbers && decl.loc.start.line && decl.type == initDeclaration) 
   {
      f.Printf("\n#line %d \"%s\"\n", outputLine+2, origName);
      outputLine += 2;
   }
}

static FunctionDefinition curFunction;

static void OutputFunction(FunctionDefinition func, File f)
{
   FunctionDefinition oldFunc = curFunction;
   curFunction = func;
   if(func.specifiers) 
   {
      Specifier spec;
      for(spec = func.specifiers->first; spec; spec = spec.next)
      {
         OutputSpecifier(spec, f);
         if(spec.next) f.Puts(" ");
      }
      f.Puts(" ");
   }
   if(func.declarator) OutputDeclarator(func.declarator, f);
   f.Puts("\n");
   outputLine ++;
   if(func.declarations)
   {
      Declaration decl;
      for(decl = func.declarations->first; decl; decl = decl.next)
      {
         OutputDeclaration(decl, f);
      }
      f.Puts("\n");
      outputLine ++;
   }
   if(func.body)
   {
      if(inCompiler && memoryGuard)
      {
         char name[1024] = "";
         Identifier id = GetDeclId(func.declarator);

         if(yylloc.start.included)
         {
            //GetWorkingDir(name, sizeof(name));
            PathCat(name, GetIncludeFileFromID(yylloc.start.included));
         }
         else if(sourceFile)
         {
            //GetWorkingDir(name, sizeof(name));
            PathCat(name, sourceFile);
         }
         ChangeCh(name, '\\', '/');

         f.Printf("{\n");
         f.Printf("   __ecereNameSpace__ecere__com__MemoryGuard_PushLoc(\"%s:%s\");\n", name, id.string);
         outputLine += 2;
      }
      OutputStatement(func.body, f);
      if(inCompiler && memoryGuard)
      {
         f.Printf("   __ecereNameSpace__ecere__com__MemoryGuard_PopLoc();\n");
         f.Printf("}\n");
         outputLine += 2;
      }
      f.Puts("\n");
      outputLine ++;
   }
   curFunction = oldFunc;
}

static void OutputMemberInit(MemberInit init, File f)
{
   if(init.identifiers)
   {
      if(init.identifiers->count > 1)
      {
         Identifier id;
         //f.Puts("[");
         for(id = init.identifiers->first; id; id = id.next)
         {
            OutputIdentifier(id, f);
            if(id.next)
               f.Puts(".");
         }
         //f.Puts("]");
      }
      else if(init.identifiers->first)
         OutputIdentifier(init.identifiers->first, f);
      f.Puts(" = ");
   }
   if(init.initializer)
      OutputInitializer(init.initializer, f);
}

static void OutputMembersInit(MembersInit init, File f)
{
   switch(init.type)
   {
      case dataMembersInit:
      {
         MemberInit member;
         if(init.dataMembers)
         {
            for(member = init.dataMembers->first; member; member = member.next)
            {
               OutputMemberInit(member, f);
               if(member.next) f.Puts(", ");
            }
         }
         break;
      }
      case methodMembersInit:
         OutputClassFunction(init.function, f);
         break;
   }
}

static void OutputInstance(Instantiation inst, File f)
{
   if(inst._class)
      OutputSpecifier(inst._class, f);
   if(inst.exp)
   {
      f.Puts(" ");
      OutputExpression(inst.exp, f);
   }
   if(inst.members && inst.members->count > 1)
   {
      f.Puts("\n{\n");
      outputLine += 2;
   }
   else if(inst.members)
      f.Puts(" { ");
   else
      f.Puts("{");
   if(inst.members)
   {
      MembersInit init;
      for(init = inst.members->first; init; init = init.next)
      {
         OutputMembersInit(init, f);
         if(init.type == dataMembersInit && init.next)
         {
            f.Puts(";\n");
            outputLine ++;
         }
      }
   }
   if(inst.members)
      f.Puts(" }");
   else
      f.Puts("}");
}

static void OutputClassFunction(ClassFunction func, File f)
{
   if(func.specifiers) 
   {
      Specifier spec;
      for(spec = func.specifiers->first; spec; spec = spec.next)
      {
         OutputSpecifier(spec, f);
         if(spec.next) f.Puts(" ");
      }
      f.Puts(" ");
   }
   /*if(func.class)
   {
      //if(func.class != (void *)-1)
      if(func.class)
         OutputSpecifier(func.class, f);
      f.Puts("::");
   }*/
   if(func.declarator) OutputDeclarator(func.declarator, f);
   f.Puts("\n");
   outputLine ++;
   if(func.declarations)
   {
      Declaration decl;
      for(decl = func.declarations->first; decl; decl = decl.next)
      {
         OutputDeclaration(decl, f);
      }
      f.Puts("\n");
      outputLine ++;
   }
   if(func.body)
   {
      OutputStatement(func.body, f);
      f.Puts("\n");
      outputLine ++;
   }
   else
      f.Puts(";");
}

static void OutputClassDef(ClassDef def, File f)
{
   switch(def.type)
   {
      case declarationClassDef:
         if(def.decl)
         {
            OutputDeclaration(def.decl, f);
            if(def.next && def.next.type != declarationClassDef)
            {
               f.Puts("\n");
               outputLine ++;
            }
         }
         break;
      case defaultPropertiesClassDef:
      {
         MemberInit init;
         for(init = def.defProperties->first; init; init = init.next)
         {
            OutputMemberInit(init, f);
            if(init.next) f.Puts(", ");
         }
         f.Puts(";\n\n");
         outputLine += 2;
         break;
      }
      case functionClassDef:
         OutputClassFunction(def.function, f);
         f.Puts("\n");
         outputLine ++;
         break;
   }
}

static void OutputClass(ClassDefinition _class, File f)
{
   f.Puts("class ");
   OutputSpecifier(_class._class, f);
   if(_class.baseSpecs)
   {
      Specifier spec;

      f.Puts(" : ");
      for(spec = _class.baseSpecs->first; spec; spec = spec.next)
      {
         OutputSpecifier(spec, f);
      }
   }
   if(_class.definitions)
   {
      ClassDef def;
      f.Puts("\n{\n");
      outputLine += 2;
      for(def = _class.definitions->first; def; def = def.next)
      {
         OutputClassDef(def, f);
      }
      f.Puts("}\n");
      outputLine ++;
   }
   else
      f.Puts(";");
}

public void OutputTree(OldList ast, File f)
{
   External external;

   outputLine = 26;

   for(external = ast.first; external; external = external.next)
   {
      switch(external.type)
      {
         case functionExternal: 
            OutputFunction(external.function, f); 
            f.Puts("\n");
            outputLine ++;
            break;
         case declarationExternal: 
            OutputDeclaration(external.declaration, f);
            f.Puts("\n");   
            outputLine ++;
            break;
         case classExternal: 
            OutputClass(external._class, f);
            f.Puts("\n");   
            outputLine ++;
            break;
      }
   }
}

public char * StringFromSpecDecl(OldList specs, Declarator decl)
{
   char * string;
   TypeName typeName { };
   File f = TempFile { };
   FileSize size;

   typeName.qualifiers = specs;
   typeName.declarator = decl;

   OutputTypeName(typeName, f);

   delete typeName;

   size = f.GetSize();
   string = new char[size + 1];
   f.Seek(0, start);
   f.Read(string, 1, size);
   string[size] = '\0';
   TrimRSpaces(string, string);

   delete f;

   return string;
}
