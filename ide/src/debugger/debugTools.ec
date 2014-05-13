import "ide"

static void CarryExpressionError(Expression exp, Expression expError)
{
   Expression temp { };

   // This function assumes that expError is contained within exp,
   // and therefore these types will be freed when freeing the old contents
   // of the expression we're carying into.

   if(expError.destType) expError.destType.refCount++;
   if(expError.expType) expError.expType.refCount++;

   *temp = *expError;

   // -- Careful: this could be problematic as FreeExpContents will free the contents of expError
   // Nulling things that may be freed now, but this is all overly messy/complex
   switch(expError.type)
   {
      case symbolErrorExp:
         expError.identifier = null;
         break;
      case memoryErrorExp:
         expError.constant = null;
         break;
      case memberPropertyErrorExp:
      case memberSymbolErrorExp:
         expError.member.exp = null;
         expError.member.member = null;
         break;
   }

   /*
   Identifier identifier = expError.identifier;
   expError.identifier = null;
   FreeExpContents(exp);
   exp.identifier = identifier;
   exp.type = expError.type;
   */
   if(exp.expType) FreeType(exp.expType);
   if(exp.destType) FreeType(exp.destType);
   FreeExpContents(exp);
   *exp = *temp; //*expError;
   delete temp;
   // memset(expError, 0, sizeof(class Expression));
}

static char GetGdbFormatChar(Type type)
{
//          x : Regard the bits of the value as an integer, and print the integer in hexadecimal.
//          d : Print as integer in signed decimal.
//          u : Print as integer in unsigned decimal.
//          o : Print as integer in octal.
//          t : Print as integer in binary. The letter `t' stands for "two". (4)
//          a : Print as an address, both absolute in hexadecimal and as an offset from the nearest preceding symbol. You can use this format used to discover where (in what function) an unknown address is located:
//          c : Regard as an integer and print it as a character constant. This prints both the numerical value and its character representation. The character representation is replaced with the octal escape `\nnn' for characters outside the 7-bit ASCII range.
//          f : Regard the bits of the value as a floating point number and print using typical floating point syntax.
   if(!type)
      return 'x';

   switch(type.kind)
   {
      case charType:
         //return 'c';
      case shortType:
      case intType:
      case longType:
      case int64Type:
         if(type.isSigned)
            return 'd';
         else
            return 'u';
      case floatType:
         return 'f';
      case doubleType:
         return 'f';
      case structType:
      case unionType:
      case functionType:
      case arrayType:
         // return 'u';
         return 0;
      case ellipsisType:
      case enumType:
      case methodType:
      case vaListType:
      // case TypeTypedObject, TypeAnyObject, TypeClassPointer:
      case dummyType:
         break;
      case classType:
      case pointerType:
         return 'x';
   }
   return 'x';
}

/*static */bool ExpressionIsError(Expression exp)
{
   return (exp.type == dereferenceErrorExp || exp.type == symbolErrorExp ||
         exp.type == memberSymbolErrorExp || exp.type == memoryErrorExp || exp.type == unknownErrorExp ||
         exp.type == noDebuggerErrorExp || exp.type == memberPropertyErrorExp);
}

void DebugComputeExpression(Expression exp)
{
#ifdef _DEBUG
   char expString[1024] = "";
   //char temp[1024];
   //if(inCompiler)
      PrintExpression(exp, expString);
   // printf("%s (exp.type = %s)\n", expString, exp.type.OnGetString(temp, null, null));
#endif
   switch(exp.type)
   {
      case identifierExp:
      {
         Expression prev = exp.prev, next = exp.next;
         char * evaluation = null;
         ExpressionType evalError = dummyExp;
         Expression expNew;
         TypeKind kind = dummyType;
         Type dataType = exp.expType;

         char temp[1024];
         uint64 address;
         bool hasAddress;
         bool isPointer = false;

         if(dataType && dataType.kind == classType && dataType._class.registered)
         {
            Class _class = dataType._class.registered;
            if(_class.type == bitClass || _class.type == unitClass || _class.type == enumClass)
            {
               if(!_class.dataType)
                  _class.dataType = ProcessTypeString(_class.dataTypeString, false);
               dataType = _class.dataType;
            }
            else if(_class.type == normalClass || _class.type == noHeadClass || _class.type == systemClass) // Added systemClass here for Instance
            {
               isPointer = true;
            }
         }
         else if(dataType && dataType.kind == classType && !dataType._class.registered)
            isPointer = true;
         if(dataType)
            kind = dataType.kind;
         else
            exp.type = symbolErrorExp;
         temp[0] = '\0';
         switch(kind)
         {
            case intPtrType: case intSizeType: case _BoolType:
            case charType: case shortType: case intType: case int64Type: case longType: case floatType: case doubleType:
            case enumType:
            case arrayType:
            case structType:
            case pointerType:
            case unionType:
               sprintf(temp, "&%s", exp.identifier.string);
               break;
            case classType:
               if(exp.byReference && dataType._class && dataType._class.registered && dataType._class.registered.type == structClass)
               // if(!dataType._class || !dataType._class.registered || dataType._class.registered.type != structClass || exp.byReference)
                  strcpy(temp, exp.identifier.string);
               else
                  sprintf(temp, "&%s", exp.identifier.string);
               break;
            case functionType:
            case ellipsisType:
            case methodType:
            case vaListType:
            // case TypeTypedObject, TypeAnyObject, TypeClassPointer:
            case dummyType:
               break;
         }
         if(temp[0])
         {
            evaluation = Debugger::EvaluateExpression(temp, &evalError);
            if(evaluation)
            {
               address = _strtoui64(evaluation, null, 0);
               //delete evaluation;
               //evaluation = null;
            }
            else
               address = 0;
            hasAddress = true;
         }
         else
            hasAddress = false;

         if(evalError == dummyExp)
         {
            switch(kind)
            {
               case charType:
                  delete evaluation;
                  evaluation = Debugger::EvaluateExpression(exp.identifier.string, &evalError);
                  if(evaluation)
                  {
                     //int c, len;
                     char * temp;
                     temp = strstr(evaluation, " '");
                     //len = strlen(temp);
                     if(temp)
                        temp[0] = '\0';
                     {/*
                        for(c = 0; c < len; c++)
                           temp[c] = ' ';
                        eString_TrimRSpaces(evaluation, evaluation);
                     */}
                  }
                  break;
               case shortType:
               case intType:
               case longType:
               case intPtrType:
               case intSizeType:
               case _BoolType:
               case int64Type:
               case floatType:
               case doubleType:
               case enumType:
               case pointerType:
                  delete evaluation;
                  evaluation = Debugger::EvaluateExpression(exp.identifier.string, &evalError);
                  if(evaluation)
                  {
                     if(kind == pointerType)
                     {
                        uint64 value;
                        value = _strtoui64(evaluation, null, 0);
                        delete evaluation;
                        evaluation = PrintHexUInt64(value);
                     }
                  }
                  break;
               case classType:
                  if(isPointer)
                  {
                     int size;
                     char format;
                     delete evaluation;
                     //evaluation = Debugger::EvaluateExpression(exp.identifier.string, &evalError);
                     size = ComputeTypeSize(exp.expType); //exp.expType.arrayType.size;
                     format = GetGdbFormatChar(exp.expType);
                     evaluation = Debugger::ReadMemory(address, size, format, &evalError);
                     if(evaluation)
                        StripQuotes(evaluation, evaluation);
                  }
                  break;
               case structType:
               case unionType:
               case functionType:
                  //evaluation = Debugger::EvaluateExpression(exp.identifier.string, &evalError);
                  delete evaluation;
                  break;
               case arrayType:
               {
                  // for classType  --> if(_class.type == structClass) ?
                  //char temp[1024];
                  //sprintf(temp, "&%s", exp.identifier.string);
                  //evaluation = Debugger::EvaluateExpression(temp, &evalError);
                  break;
               }
               case ellipsisType:
               case methodType:
               case vaListType:
               // case TypeTypedObject, TypeAnyObject, TypeClassPointer:
               case dummyType:
                  delete evaluation;
                  evaluation = Debugger::EvaluateExpression(exp.identifier.string, &evalError);
                  break;
            }
         }
         switch(evalError)
         {
            case dummyExp:
               if(evaluation)
               {
                  // Going back to parsing the expression string so as to catch inf/-inf/nan/-nan etc.
                  expNew = ParseExpressionString(evaluation);
                  //expNew = MkExpConstant(evaluation);
                  //printf("Evaluation = %s\n", evaluation);
                  delete evaluation;
                  expNew.destType = exp.expType;

                  // WHY EXACTLY MUST WE PROCESS THIS EXPRESSION TYPE AGAIN ? ADDED THIS FOR 0x00000000
                  if(exp.expType && (exp.expType.kind == pointerType || exp.expType.kind == classType) && expNew.destType)
                  {
                     expNew.expType = expNew.destType;
                     expNew.destType.refCount++;
                  }
                  else
                     ProcessExpressionType(expNew);
                  FreeType(exp.destType);
                  FreeExpContents(exp);

                  DebugComputeExpression(expNew);
                  expNew.prev = prev;
                  expNew.next = next;
                  expNew.isConstant = true;
                  expNew.address = address;
                  expNew.hasAddress = hasAddress;
                  *exp = *expNew;
                  delete expNew;
               }
               else
               {
                  // Unhandled code path, evaluation is null
                  FreeExpContents(exp);
                  exp.type = unknownErrorExp;
               }
               break;
            case symbolErrorExp:
               // Keep the identifier
               exp.type = evalError;
               break;
            default:
               FreeExpContents(exp);
               exp.type = evalError;
               break;
         }
         break;
      }
      case instanceExp:
      {
         ComputeInstantiation(exp);
         break;
      }
      /*
      case constantExp:
         break;
      */
      case opExp:
      {
         Expression expError = null;
         Expression exp1, exp2 = null;
         Operand op1 = { 0 }, op2 = { 0 };

         /*
         if(exp.op.op == '&' || exp.op.op == '*')
         {
            if(!exp.op.exp1 && exp.op.exp2)
            {
               if(exp.op.exp2.type == identifierExp)
               {
                  Expression prev = exp.prev, next = exp.next;
                  char * evaluation = null;
                  ExpressionType evalError = dummyExp;
                  Expression expNew;
                  char temp[1024];
                  sprintf(temp, "%c%s", exp.op.op, exp.op.exp2.identifier.string);
                  evaluation = Debugger::EvaluateExpression(temp, &evalError);
                  if(evalError != dummyExp)
                  {
                     exp.type = evalError;
                     exp.constant = CopyString("");
                  }
                  else if(evaluation)
                  {
                     expNew = ParseExpressionString(evaluation);
                     delete evaluation;
                     expNew.destType = exp.expType;
                     FreeType(exp.destType);
                     FreeExpContents(exp);
                     ProcessExpressionType(expNew);
                     DebugComputeExpression(expNew);
                     expNew.prev = prev;
                     expNew.next = next;
                     expNew.isConstant = true;
                     *exp = *expNew;
                     delete expNew;
                  }
                  else
                     exp.type = ExpUnknownError;
                  break;
               }
               //else
               {
                  uint64 address;
                  int size;
                  char format;
                  if(exp.op.op == '*')
                  {
                  DebugComputeExpression(exp.op.exp2);
                  size = ComputeTypeSize(exp.op.exp2.expType);
                  format = GetGdbFormatChar(exp.op.exp2.expType);
                  GetInt(exp.op.exp2, &address);
                  //sprintf(temp, "%c%s", exp.op.op, exp.op.exp2.constant);
                  evaluation = Debug_ReadMemory(address, size, format, &evalError);
                  }
                  else
                     evalError = ExpUnknownError;
               }
            }
         }
         */

         // We don't care about operations with only exp2 (INC_OP, DEC_OP...)
         if(exp.op.exp2)
         {
            Expression e = exp.op.exp2;

            while((e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp) && e.list)
            {
               if(e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp)
               {
                  if(e.type == extensionCompoundExp)
                     e = ((Statement)e.compound.compound.statements->last).expressions->last;
                  else
                     e = e.list->last;
               }
            }
            if(exp.op.op == TokenType::sizeOf && e && e.expType)
            {
               if(e.type == stringExp && e.string)
               {
                  char * string = e.string;
                  int len = strlen(string);
                  char * tmp = new char[len-2+1];
                  len = UnescapeString(tmp, string + 1, len - 2);
                  delete tmp;
                  FreeExpContents(exp);
                  exp.type = constantExp;
                  exp.constant = PrintUInt(len + 1);
               }
               else
               {
                  Type type = e.expType;
                  type.refCount++;
                  FreeExpContents(exp);
                  exp.type = constantExp;
                  exp.constant = PrintUInt(ComputeTypeSize(type));
                  FreeType(type);
               }
               break;
            }
            else
            {
               DebugComputeExpression(exp.op.exp2);
               if(ExpressionIsError(exp.op.exp2))
                  expError = exp.op.exp2;
            }
         }
         if(!expError)
         {
            if(exp.op.exp1)
            {
               DebugComputeExpression(exp.op.exp1);
               if(ExpressionIsError(exp.op.exp1))
                  expError = exp.op.exp1;
               else
               {
                  if(exp.op.exp2)
                  {
                     if(ExpressionIsError(exp.op.exp2))
                        expError = exp.op.exp2;
                     else
                     {
                        exp1 = exp.op.exp1;
                        exp2 = exp.op.exp2;
                        op1 = GetOperand(exp1);
                        if(op1.type) op1.type.refCount++;
                        op2 = GetOperand(exp2);
                        if(op2.type) op2.type.refCount++;
                     }
                  }
               }
            }
            else if(exp.op.exp2)
            {
               if(ExpressionIsError(exp.op.exp2))
                  expError = exp.op.exp2;
               else
               {
                  exp1 = exp.op.exp2;
                  if(exp.op.op == '&' || exp.op.op == '*')
                  {
                     Expression prev = exp1.prev, next = exp1.next;
                     Expression expNew;
                     ExpressionType evalError = dummyExp;
                     char * evaluation = null;
                     if(exp.op.op == '&')
                     {
                        if(exp1.hasAddress)
                        {
                           char * temp;
                           //sprintf(temp, "%u", exp1.address);
                           temp = PrintHexUInt64(exp1.address);
                           expNew = ParseExpressionString(temp);
                           delete temp;
                           //expNew.address = exp1.address;
                           expNew.expType = exp.expType;
                           /*
                           expNew.destType = exp.expType;
                           expNew.destType.refCount++;
                           */
                           FreeType(exp.destType);
                           FreeExpContents(exp);
                           ProcessExpressionType(expNew);
                           DebugComputeExpression(expNew);
                           expNew.prev = prev;
                           expNew.next = next;
                           expNew.isConstant = true;
                           *exp = *expNew;
                           delete expNew;
                        }
                        else
                           exp1.address = 0;
                     }
                     else if(exp.op.op == '*')
                     {
                        // TODO: Common pathway for * and [ ]
                        if(!exp.expType)
                        {
                           delete evaluation;
                           FreeExpContents(exp1);
                           exp1.type = dereferenceErrorExp;
                           expError = exp1;
                        }
                        else
                        {
                           uint64 address = 0;
                           int size;
                           char format;
                           Expression e = exp1;
                           uint offset = 0;
                           bool gotAddress = false;

                           while(((e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp) && e.list) || e.type == castExp)
                           {
                              if(e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp)
                              {
                                 if(e.type == extensionCompoundExp)
                                    e = ((Statement)e.compound.compound.statements->last).expressions->last;
                                 else
                                    e = e.list->last;
                              }
                              else if(e.type == castExp)
                                 e = e.cast.exp;
                           }

                           if(e.expType.kind == structType)
                           {
                              address = exp1.address;
                              gotAddress = true;
                           }
                           else
                              gotAddress = GetUInt64(e, &address);
                           size = ComputeTypeSize(exp.expType); //exp.expType.arrayType.size;
                           if(exp.expType && exp.expType.type && exp.expType.kind == arrayType)
                              // For multilevels arrays
                              format = 'x';
                           else
                              format = GetGdbFormatChar(exp.expType);
                           while(e.type == opExp && e.op.op == '+' && e.op.exp1 && e.op.exp2)
                           {
                              Expression e1 = e.op.exp1, e2 = e.op.exp2;
                              while(((e1.type == bracketsExp || e1.type == extensionExpressionExp || e1.type == extensionCompoundExp) && e1.list) || e1.type == castExp)
                              {
                                 if(e1.type == bracketsExp || e1.type == extensionExpressionExp || e1.type == extensionCompoundExp)
                                 {
                                    if(e1.type == extensionCompoundExp)
                                       e1 = ((Statement)e1.compound.compound.statements->last).expressions->last;
                                    else
                                       e1 = e1.list->last;
                                 }
                                 else if(e1.type == castExp)
                                    e1 = e1.cast.exp;
                              }
                              while(((e2.type == bracketsExp || e2.type == extensionExpressionExp || e2.type == extensionCompoundExp) && e2.list) || e2.type == castExp)
                              {
                                 if(e2.type == bracketsExp || e2.type == extensionExpressionExp || e2.type == extensionCompoundExp)
                                 {
                                    if(e2.type == extensionCompoundExp)
                                       e2 = ((Statement)e2.compound.compound.statements->last).expressions->last;
                                    else
                                       e2 = e2.list->last;
                                 }
                                 else if(e2.type == castExp)
                                    e2 = e2.cast.exp;
                              }

                              if((e1.type == stringExp || e1.type == opExp) && e.op.exp2.isConstant && e.op.exp2.expType && e.op.exp2.expType.kind == intType)
                              {
                                 offset += strtol(e.op.exp2.constant, null, 0);
                                 e = e1;
                              }
                              else if((e2.type == stringExp || e2.type == opExp) && e.op.exp1.isConstant && e.op.exp1.expType && e.op.exp1.expType.kind == intType)
                              {
                                 offset += strtol(e.op.exp1.constant, null, 0);
                                 e = e2;
                              }
                              else
                                  break;
                           }

                           if(e.type == stringExp)
                           {
                              char * tmp = null;
                              String string = e.string;
                              bool valid = false;
                              Type expType = exp1.expType.type;
                              if(expType) expType.refCount++;

                              if(string)
                              {
                                 int len = string ? strlen(string) : 0;
                                 tmp = new char[len-2+1];
                                 len = UnescapeString(tmp, string + 1, len - 2);
                                 if(len >= 0 && offset * size + size-1 <= len)
                                    valid = true;
                              }

                              FreeExpContents(exp);
                              if(!valid)
                                 exp.type = dereferenceErrorExp;
                              else if(expType)
                              {
                                 exp.type = constantExp;
                                 exp.isConstant = true;
                                 switch(expType.kind)
                                 {
                                    case charType:   exp.constant = expType.isSigned ? PrintChar(((char *)tmp)[offset]) : PrintUChar(((byte *)tmp)[offset]); break;
                                    case shortType:  exp.constant = expType.isSigned ? PrintShort(((short *)tmp)[offset]) : PrintUShort(((uint16 *)tmp)[offset]); break;
                                    case intType:    exp.constant = expType.isSigned ? PrintInt(((int *)tmp)[offset]) : PrintUInt(((uint *)tmp)[offset]); break;
                                    case int64Type:  exp.constant = expType.isSigned ? PrintInt64(((int64 *)tmp)[offset]) : PrintUInt64(((uint64 *)tmp)[offset]); break;
                                    case floatType:  exp.constant = PrintFloat(((float *)tmp)[offset]); break;
                                    case doubleType: exp.constant = PrintDouble(((double *)tmp)[offset]); break;
                                    default:
                                       exp.type = unknownErrorExp;
                                 }
                              }
                              else
                                 exp.type = unknownErrorExp;
                              FreeType(expType);
                              delete tmp;
                           }
                           else if(gotAddress && exp.expType.kind == arrayType)
                           {
                              FreeExpContents(exp);
                              exp.type = constantExp;
                              exp.isConstant = true;
                              exp.constant = PrintHexUInt64(address);
                              exp.address = address;
                              exp.hasAddress = true;
                           }
                           else if(gotAddress && format)
                           {
                              evaluation = Debugger::ReadMemory(address, size, format, &evalError);
                              switch(evalError)
                              {
                                 case dummyExp:
                                    if(evaluation)
                                    {
                                       expNew = ParseExpressionString(evaluation);
                                       expNew.address = address;
                                       expNew.hasAddress = true;
                                       delete evaluation;
                                       expNew.destType = exp.expType;
                                       FreeType(exp.destType);
                                       FreeExpContents(exp);
                                       ProcessExpressionType(expNew);
                                       DebugComputeExpression(expNew);
                                       expNew.prev = prev;
                                       expNew.next = next;
                                       expNew.isConstant = true;
                                       *exp = *expNew;
                                       delete expNew;
                                    }
                                    else
                                    {
                                       // Unhandled code path, evaluation is null
                                       FreeExpContents(exp);
                                       exp.type = unknownErrorExp;
                                    }
                                    break;
                                 case memoryErrorExp:
                                    delete evaluation;
                                    FreeExpContents(exp1);
                                    exp1.type = evalError;
                                    exp1.constant = PrintHexUInt64(address);
                                    expError = exp1;
                                    break;
                                 default:
                                    delete evaluation;
                                    FreeExpContents(exp1);
                                    exp1.type = evalError;
                                    expError = exp1;
                                    break;
                              }
                           }
                           else
                           {
                              FreeExpContents(exp1);
                              exp1.type = unknownErrorExp;  // Not supported yet, generate error to fallback to GDB printout
                              expError = exp1;
                           }
                        }
                     }
                  }
                  else
                     op1 = GetOperand(exp1);
                  if(op1.type) op1.type.refCount++;
               }
            }
         }
         if(expError)
            CarryExpressionError(exp, expError);
         else if(exp.type == opExp)
         {
            if(exp1 && exp2 && exp1.expType && exp2.expType &&
               ((exp1.expType.kind == pointerType || exp1.expType.kind == arrayType) ||
                (exp2.expType.kind == pointerType || exp2.expType.kind == arrayType)))
            {
               bool valid = false;
               // TODO: Support 1 + pointer
               if((exp.op.op == '+' || exp.op.op == '-') && exp2.expType && op2.type && op2.type.kind == intType)
               {
                  Expression e = exp1;
                  while(((e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp) && e.list) || e.type == castExp)
                  {
                     if(e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp)
                     {
                        if(e.type == extensionCompoundExp)
                           e = ((Statement)e.compound.compound.statements->last).expressions->last;
                        else
                           e = e.list->last;
                     }
                     else if(e.type == castExp)
                        e = e.cast.exp;
                  }

                  if(e.type == stringExp)
                  {
                     uint64 offset = (exp.op.op == '+') ? op2.i64 : -op2.i64;
                     String newString = null;
                     if(e.string)
                     {
                        int len = strlen(e.string) - 2;
                        char * tmp = OffsetEscapedString(e.string + 1, len, (int)offset);
                        if(tmp)
                        {
                           len -= tmp - (e.string + 1);
                           newString = new char[2 + len];
                           newString[0] = '\"';
                           memcpy(newString + 1, tmp, len);
                           newString[1 + len] = '\"';
                           newString[1 + len + 1] = 0;
                        }
                     }
                     valid = true;
                     FreeExpContents(exp);
                     if(newString)
                     {
                        exp.type = stringExp;
                        exp.string = newString;
                     }
                     else
                        exp.type = dereferenceErrorExp;
                  }
                  else if(op1.type)
                  {
                     // TODO: Do pointer operations
                     if(exp1.expType && exp1.expType.type)
                     {
                        uint size = ComputeTypeSize(exp1.expType.type);
                        if(size)
                        {
                           valid = true;
                           op1.ui64 /= exp1.expType.type.size;
                           CallOperator(exp, exp1, exp2, op1, op2);
                           if(exp.type == constantExp)
                           {
                              exp.address = _strtoui64(exp.constant, null, 0);
                              exp.address *= size;
                              if(op1.type.kind == arrayType)
                                 exp.hasAddress = true;
                           }
                        }
                     }
                  }
               }
               if(!valid)
               {
                  FreeExpContents(exp);
                  exp.type = unknownErrorExp;   // We should have an invalid operands error
               }
            }
            else
            {
               if(!exp2 && exp1 && exp1.type == constantExp && exp1.constant && !strcmp(exp1.constant, "nan") && exp.op.op == '-')
               {
                  FreeExpContents(exp);
                  exp.constant = CopyString("-nan");
                  exp.type = constantExp;
               }
               else
                  CallOperator(exp, exp1, exp2, op1, op2);
            }
            FreeType(op1.type);
            FreeType(op2.type);
            if(exp.type == constantExp)
               exp.isConstant = true;
         }
         break;
      }
      case bracketsExp:
      {
         Expression e, n;
         //for(
         //   e = (*exp.list).first, n = e ? e.next : null;
         //   e;
         //   e = n, n = n?(n.next) : null)

         for(e = exp.list->first; e; e = n)
         {
            n = e.next;
            if(!n)
            {
               OldList * list = exp.list;
               DebugComputeExpression(e);
               //if(ExpressionIsError(e)) //.type == ExpSymbolError
               //   CarryExpressionError(exp, e);
               //FreeExpContents(exp);
               FreeType(exp.expType);
               FreeType(exp.destType);
               *exp = *e;
               delete e;
               delete list;
            }
            else
            {
               FreeExpression(e);
            }
         }
         break;
      }
      case indexExp:
      {
         int size;
         char format;
         Expression e;
         exp.isConstant = true;

         DebugComputeExpression(exp.index.exp);
         if(ExpressionIsError(exp.index.exp)) //.type == ExpSymbolError
            CarryExpressionError(exp, exp.index.exp);
         else
         {
            Expression prev = exp.prev, next = exp.next;
            char * evaluation = null;
            ExpressionType evalError = dummyExp;

            if(!exp.index.exp.isConstant)
               exp.isConstant = false;

            // int r[0]
            // 4 == size = ComputeTypeSize(exp.expType);
            // 0 == size = ComputeTypeSize(exp.expType.arrayType);
            // 4 == size = ComputeTypeSize(exp.index.exp.expType);
            // 0 == size = ComputeTypeSize(exp.index.exp.expType.arrayType);

            size = ComputeTypeSize(exp.expType);
            if(exp.expType && exp.expType.type && exp.expType.kind == arrayType)
               // For multilevels arrays
               format = 'x';
            else
               format = GetGdbFormatChar(exp.expType);

            for(e = exp.index.index->first; e; e = e.next)
            {
               DebugComputeExpression(e);
               if(ExpressionIsError(e)) //.type == ExpSymbolError
               {
                  CarryExpressionError(exp, e);
                  break;
               }
               if(!e.next)
               {
                  // Check if this type is int
               }
               if(!e.isConstant)
                  exp.isConstant = false;
            }
            if(!ExpressionIsError(exp))
            {
               // Is this necessary here? pass15 had done this already...
               if(exp.expType) FreeType(exp.expType);
               exp.expType = Dereference(exp.index.exp.expType);

               if(!exp.expType)
               {
                  delete evaluation;
                  FreeExpContents(exp);
                  exp.type = dereferenceErrorExp;
               }
               else if(exp.index.index && exp.index.index->last && ((Expression)exp.index.index->last) && ((Expression)exp.index.index->last).expType)
               {
                  Type type = ((Expression)exp.index.index->last).expType;
                  if(type.kind == intType || type.kind == charType || type.kind == shortType || type.kind == int64Type || type.kind == intPtrType ||
                     type.kind == intSizeType || type.kind == longType || type.kind == _BoolType || type.kind == enumType ||
                        (type.kind == classType && type._class && type._class.registered &&
                           type._class.registered.type == enumClass))
                  {
                     bool gotAddress = false;
                     uint64 address = 0, offset = 0;
                     Expression expNew, last = (Expression)exp.index.index->last;
                     Expression e = exp.index.exp;

                     while(((e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp) && e.list) || e.type == castExp)
                     {
                        if(e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp)
                        {
                           if(e.type == extensionCompoundExp)
                              e = ((Statement)e.compound.compound.statements->last).expressions->last;
                           else
                              e = e.list->last;
                        }
                        else if(e.type == castExp)
                           e = e.cast.exp;
                     }

                     //GetUInt(exp.index.exp, &address);

                     GetUInt64(last, &offset);

                     // TOFIX: Check if it has address: TESTING
                     if(exp.index.exp.hasAddress && exp.index.exp.expType.kind == arrayType)
                     {
                        address = exp.index.exp.address;
                        gotAddress = true;
                     }
                     else if(exp.index.exp.type == constantExp)
                        gotAddress = GetUInt64(exp.index.exp, &address);

                     while(e.type == opExp && e.op.op == '+' && e.op.exp1 && e.op.exp2)
                     {
                        Expression e1 = e.op.exp1, e2 = e.op.exp2;
                        while(((e1.type == bracketsExp || e1.type == extensionExpressionExp || e1.type == extensionCompoundExp) && e1.list) || e1.type == castExp)
                        {
                           if(e1.type == bracketsExp || e1.type == extensionExpressionExp || e1.type == extensionCompoundExp)
                           {
                              if(e1.type == extensionCompoundExp)
                                 e1 = ((Statement)e1.compound.compound.statements->last).expressions->last;
                              else
                                 e1 = e1.list->last;
                           }
                           else if(e1.type == castExp)
                              e1 = e1.cast.exp;
                        }
                        while(((e2.type == bracketsExp || e2.type == extensionExpressionExp || e2.type == extensionCompoundExp) && e2.list) || e2.type == castExp)
                        {
                           if(e2.type == bracketsExp || e2.type == extensionExpressionExp || e2.type == extensionCompoundExp)
                           {
                              if(e2.type == extensionCompoundExp)
                                 e2 = ((Statement)e2.compound.compound.statements->last).expressions->last;
                              else
                                 e2 = e2.list->last;
                           }
                           else if(e2.type == castExp)
                              e2 = e2.cast.exp;
                        }

                        if((e1.type == stringExp || e1.type == opExp) && e.op.exp2.isConstant && e.op.exp2.expType && e.op.exp2.expType.kind == intType)
                        {
                           offset += strtol(e.op.exp2.constant, null, 0);
                           e = e1;
                        }
                        else if((e2.type == stringExp || e2.type == opExp) && e.op.exp1.isConstant && e.op.exp1.expType && e.op.exp1.expType.kind == intType)
                        {
                           offset += strtol(e.op.exp1.constant, null, 0);
                           e = e2;
                        }
                        else
                            break;
                     }

                     //size = ComputeTypeSize(exp.expType.arrayType); //exp.expType.arrayType.size;
                     address += offset * size;

                     if(e.type == stringExp)
                     {
                        char * tmp = null;
                        String string = e.string;
                        bool valid = false;
                        Type expType = exp.index.exp.expType.type;
                        if(expType) expType.refCount++;

                        if(string)
                        {
                           int len = string ? strlen(string) : 0;
                           tmp = new char[len-2+1];
                           len = UnescapeString(tmp, string + 1, len - 2);
                           if(len >= 0 && offset * size + size-1 <= len)
                              valid = true;
                        }

                        FreeExpContents(exp);
                        if(!valid)
                           exp.type = dereferenceErrorExp;
                        else if(expType)
                        {
                           exp.type = constantExp;
                           exp.isConstant = true;
                           switch(expType.kind)
                           {
                              case charType:   exp.constant = expType.isSigned ? PrintChar(((char *)tmp)[offset]) : PrintUChar(((byte *)tmp)[offset]); break;
                              case shortType:  exp.constant = expType.isSigned ? PrintShort(((short *)tmp)[offset]) : PrintUShort(((uint16 *)tmp)[offset]); break;
                              case intType:    exp.constant = expType.isSigned ? PrintInt(((int *)tmp)[offset]) : PrintUInt(((uint *)tmp)[offset]); break;
                              case int64Type:  exp.constant = expType.isSigned ? PrintInt64(((int64 *)tmp)[offset]) : PrintUInt64(((uint64 *)tmp)[offset]); break;
                              case floatType:  exp.constant = PrintFloat(((float *)tmp)[offset]); break;
                              case doubleType: exp.constant = PrintDouble(((double *)tmp)[offset]); break;
                              default:
                                 exp.type = unknownErrorExp;
                           }
                        }
                        else
                           exp.type = unknownErrorExp;
                        FreeType(expType);
                        delete tmp;
                     }
                     else if(gotAddress && exp.expType.kind == arrayType)
                     {
                        FreeExpContents(exp);
                        exp.type = constantExp;
                        exp.isConstant = true;
                        exp.constant = PrintHexUInt64(address);
                        exp.address = address;
                        exp.hasAddress = true;
                     }
                     else if(gotAddress)
                     {
                        evaluation = Debugger::ReadMemory(address, size, format, &evalError);
                        switch(evalError)
                        {
                           case dummyExp:
                              if(evaluation)
                              {
                                 expNew = ParseExpressionString(evaluation);
                                 delete evaluation;
                                 expNew.destType = exp.expType;
                                 FreeType(exp.destType);
                                 FreeExpContents(exp);
                                 ProcessExpressionType(expNew);
                                 DebugComputeExpression(expNew);

                                 // TOFIX: Only for Array Types
                                 expNew.address = address;

                                 expNew.hasAddress = true;
                                 expNew.prev = prev;
                                 expNew.next = next;
                                 expNew.isConstant = true;
                                 *exp = *expNew;
                                 delete expNew;
                              }
                              else
                              {
                                 // Unhandled code path, evaluation is null
                                 FreeExpContents(exp);
                                 exp.type = unknownErrorExp;
                              }
                              break;
                           case memoryErrorExp:
                              delete evaluation;
                              FreeExpContents(exp);
                              exp.type = evalError;
                              exp.constant = PrintHexUInt64(address);
                              break;
                           default:
                              delete evaluation;
                              FreeExpContents(exp);
                              exp.type = evalError;
                              break;
                        }
                     }
                     else
                     {
                        FreeExpContents(exp);
                        exp.type = unknownErrorExp;
                     }
                  }
               }
            }
         }
         break;
      }
      case callExp:
      {
         Expression callExp = exp.call.exp;
         Identifier id = (callExp && callExp.type == identifierExp) ? callExp.identifier : null;
         if(id && id.string)
         {
            if(!strcmp(id.string, "nan") || !strcmp(id.string, "inf"))
            {
               String s = id.string;
               id.string = null;
               FreeExpContents(exp);
               exp.type = constantExp;
               exp.constant = s;
            }
         }
         break;
      }
      case memberExp:
      {
         Expression memberExp = exp.member.exp;
         Identifier memberID = exp.member.member;
         //Class _class;
         Property prop = null;
         DataMember member = null;
         Class convertTo = null;
         uint offset = 0;  // THIS WASN'T INITIALIZED... IS IT ALWAYS SET?

         Type type; // = memberExp.expType;
         DebugComputeExpression(memberExp);
         type = memberExp.expType;
         if(ExpressionIsError(memberExp))
            CarryExpressionError(exp, memberExp);
         else if(type)
         {
            // _class = (memberID && memberID.classSym) ? memberID.classSym.registered : ((type.kind == classType && type._class) ? type._class.registered : null);
            Class _class = (exp.member.member && exp.member.member.classSym) ? exp.member.member.classSym.registered : (((type.kind == classType || type.kind == subClassType) && type._class) ? type._class.registered : null);
            if(!_class)
            {
               char string[256] = "";
               Symbol classSym;
               PrintTypeNoConst(type, string, false, true);
               classSym = FindClass(string);
               _class = classSym ? classSym.registered : null;
            }

            if(memberID && _class)
            {
               /*
               prop = eClass_FindProperty(_class, memberID.string);
               if(!prop)
                  member = eClass_FindDataMember(_class, memberID.string);
               */
               // member = eClass_FindDataMember(_class, memberID.string);
               member = eClass_FindDataMemberAndOffset(_class, memberID.string, &offset, _class.module.application, null, null);
               if(!member)
                  prop = eClass_FindProperty(_class, memberID.string, _class.module.application);
            }
            if(!prop && !member && _class && memberID)
            {
               Symbol classSym = FindClass(memberID.string);
               convertTo = _class;
               _class = classSym ? classSym.registered : null;
               if(_class)
                  prop = eClass_FindProperty(_class, convertTo.name, _class.module.application);
            }

            //DebugComputeExpression(memberExp);
            if(ExpressionIsError(memberExp))
               CarryExpressionError(exp, memberExp);
            else
            {
               if(exp.member.memberType == methodMember)
               {
                  FreeExpContents(exp);
                  exp.type = unknownErrorExp;
               }
               else if(prop)
               {
                  bool supported = false;
                  if(prop.compiled)
                  {
                     Type type = prop.dataType;
                     // TODO: Assuming same base type for units...
                     if(_class.type == unitClass)
                     {
                        if(type.kind == classType)
                        {
                           Class _class = type._class.registered;
                           if(_class.type == unitClass)
                           {
                              if(!_class.dataType)
                                 _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                              type = _class.dataType;
                           }
                        }
                        switch(type.kind)
                        {
                           case floatType:
                           {
                              float value;
                              float (*Get)(float) = (void *)prop.Get;
                              GetFloat(memberExp, &value);
                              exp.constant = PrintFloat(Get ? Get(value) : value);
                              exp.type = constantExp;
                              supported = true;
                              break;
                           }
                           case doubleType:
                           {
                              double value;
                              double (*Get)(double);
                              GetDouble(memberExp, &value);

                              if(convertTo)
                                 Get = (void *)prop.Set;
                              else
                                 Get = (void *)prop.Get;
                              exp.constant = PrintDouble(Get ? Get(value) : value);
                              exp.type = constantExp;
                              supported = true;
                              break;
                           }
                        }
                     }
                     else
                     {
                        if(convertTo)
                        {
                           Expression value = memberExp;
                           Type type = prop.dataType;
                           if(_class.type == structClass)
                           {
                              switch(type.kind)
                              {
                                 case classType:
                                 {
                                    Class propertyClass = type._class.registered;
                                    if(propertyClass.type == structClass && value.type == instanceExp)
                                    {
                                       void (*Set)(void *, void *) = (void *)prop.Set;
                                       exp.instance = Instantiation
                                       {
                                          data = new0 byte[_class.structSize];
                                          _class = MkSpecifierName/*MkClassName*/(_class.name);
                                          loc = exp.loc;
                                          exp.type = instanceExp;
                                       };
                                       Set(exp.instance.data, value.instance.data);
                                       PopulateInstance(exp.instance);
                                       supported = true;
                                    }
                                    break;
                                 }
                                 case intType:
                                 {
                                    int intValue;
                                    void (*Set)(void *, int) = (void *)prop.Set;

                                    exp.instance = Instantiation
                                    {
                                       data = new0 byte[_class.structSize];
                                       _class = MkSpecifierName/*MkClassName*/(_class.name);
                                       loc = exp.loc;
                                    };
                                    exp.type = instanceExp;

                                    GetInt(value, &intValue);

                                    Set(exp.instance.data, intValue);
                                    PopulateInstance(exp.instance);
                                    supported = true;
                                    break;
                                 }
                                 case int64Type:
                                 {
                                    int64 intValue;
                                    void (*Set)(void *, int64) = (void *)prop.Set;

                                    exp.instance = Instantiation
                                    {
                                       data = new0 byte[_class.structSize];
                                       _class = MkSpecifierName/*MkClassName*/(_class.name);
                                       loc = exp.loc;
                                    };
                                    exp.type = instanceExp;

                                    GetInt64(value, &intValue);

                                    Set(exp.instance.data, intValue);
                                    PopulateInstance(exp.instance);
                                    supported = true;
                                    break;
                                 }
                                 case doubleType:
                                 {
                                    double doubleValue;
                                    void (*Set)(void *, double) = (void *)prop.Set;

                                    exp.instance = Instantiation
                                    {
                                       data = new0 byte[_class.structSize];
                                       _class = MkSpecifierName/*MkClassName*/(_class.name);
                                       loc = exp.loc;
                                    };
                                    exp.type = instanceExp;

                                    GetDouble(value, &doubleValue);

                                    Set(exp.instance.data, doubleValue);
                                    PopulateInstance(exp.instance);
                                    supported = true;
                                    break;
                                 }
                              }
                           }
                           else if(_class.type == bitClass)
                           {
                              switch(type.kind)
                              {
                                 case classType:
                                 {
                                    Class propertyClass = type._class.registered;
                                    if(propertyClass.type == structClass && value.instance.data)
                                    {
                                       unsigned int (*Set)(void *) = (void *)prop.Set;
                                       unsigned int bits = Set(value.instance.data);
                                       exp.constant = PrintHexUInt(bits);
                                       exp.type = constantExp;
                                       supported = true;
                                       break;
                                    }
                                    else if(_class.type == bitClass)
                                    {
                                       unsigned int value;
                                       unsigned int (*Set)(unsigned int) = (void *)prop.Set;
                                       unsigned int bits;

                                       GetUInt(memberExp, &value);
                                       bits = Set(value);
                                       exp.constant = PrintHexUInt(bits);
                                       exp.type = constantExp;
                                       supported = true;
                                    }
                                 }
                              }
                           }
                        }
                        else
                        {
                           if(_class.type == bitClass)
                           {
                              uint value;
                              GetUInt(memberExp, &value);

                              switch(type.kind)
                              {
                                 case classType:
                                 {
                                    Class _class = type._class.registered;
                                    if(_class.type == structClass)
                                    {
                                       void (*Get)(unsigned int, void *) = (void *)prop.Get;

                                       exp.instance = Instantiation
                                       {
                                          data = new0 byte[_class.structSize];
                                          _class = MkSpecifierName/*MkClassName*/(_class.name);
                                          loc = exp.loc;
                                       };
                                       //exp.instance.fullSet = true;
                                       exp.type = instanceExp;
                                       Get(value, exp.instance.data);
                                       PopulateInstance(exp.instance);
                                       supported = true;
                                    }
                                    else if(_class.type == bitClass)
                                    {
                                       unsigned int (*Get)(unsigned int) = (void *)prop.Get;
                                       uint64 bits = Get(value);
                                       exp.constant = PrintHexUInt64(bits);
                                       exp.type = constantExp;
                                       supported = true;
                                    }
                                    break;
                                 }
                              }
                           }
                           else if(_class.type == structClass)
                           {
                              char * value = (memberExp.type == instanceExp ) ? memberExp.instance.data : null;
                              switch(type.kind)
                              {
                                 case classType:
                                 {
                                    Class _class = type._class.registered;
                                    if(_class.type == structClass && value)
                                    {
                                       void (*Get)(void *, void *) = (void *)prop.Get;

                                       exp.instance = Instantiation
                                       {
                                          data = new0 byte[_class.structSize];
                                          _class = MkSpecifierName/*MkClassName*/(_class.name);
                                          loc = exp.loc;
                                       };
                                       //exp.instance.fullSet = true;
                                       exp.type = instanceExp;
                                       Get(value, exp.instance.data);
                                       PopulateInstance(exp.instance);
                                       supported = true;
                                    }
                                    break;
                                 }
                              }
                           }
                           /*else
                           {
                              char * value = memberExp.instance.data;
                              switch(type.kind)
                              {
                                 case classType:
                                 {
                                    Class _class = type._class.registered;
                                    if(_class.type == normalClass)
                                    {
                                       void *(*Get)(void *) = (void *)prop.Get;

                                       exp.instance = Instantiation
                                       {
                                          data = Get(value, exp.instance.data);     ?????
                                          _class = MkSpecifierName(_class.name); //MkClassName(_class.name);
                                          loc = exp.loc;
                                       };
                                       exp.type = instanceExp;
                                    }
                                    break;
                                 }
                              }
                           }
                           */
                        }
                     }
                  }
                  if(!supported)
                  {
                     exp.type = memberPropertyErrorExp;
                     exp.isConstant = false;
                  }
               }
               else if(member)
               {
                  if(memberExp.hasAddress || memberExp.type == constantExp)
                  //if(memberExp.expType && memberExp.expType.kind == intType)  // && !exp.index.exp.expType.isSigned
                  {
                     if(_class.type == bitClass)
                     {
                        if(memberExp.type == constantExp)
                        {
                           // Unfinished business...
                           BitMember bitMember = (BitMember)member;
                           uint64 bits = 0;
                           GetUInt64(memberExp, &bits);
                           bits &= bitMember.mask;
                           bits >>= bitMember.pos;

                           FreeExpression(exp.member.exp);
                           FreeIdentifier(exp.member.member);

                           exp.constant = PrintUInt64(bits);

                           exp.isConstant = true;
                           exp.type = constantExp;
                           exp.hasAddress = false;
                        }
                     }
                     else
                     {
                        char * evaluation = null;
                        ExpressionType evalError = dummyExp;
                        bool gotAddress = false;
                        uint64 address = 0;
                        Expression prev = exp.prev, next = exp.next;
                        char format;
                        int size;
                        Expression expNew;
                        TypeKind kind = dummyType;
                        Type dataType = member.dataType;

                        if(!dataType)
                           dataType = member.dataType = ProcessTypeString(member.dataTypeString, false);

                        if(dataType.kind == classType && dataType._class.registered &&
                              (dataType._class.registered.type == enumClass || dataType._class.registered.type == bitClass || dataType._class.registered.type == unitClass))
                        {
                           if(dataType._class.registered.dataTypeString)
                              dataType._class.registered.dataType = ProcessTypeString(dataType._class.registered.dataTypeString, false);
                           dataType = dataType._class.registered.dataType;
                           if(!dataType)
                              dataType = ProcessTypeString("int", false);
                        }

                        size = ComputeTypeSize(member.dataType);

                        format = GetGdbFormatChar(dataType);
                        //if(memberExp.address)
                        {
                           //GetInt(memberExp, &address);
                           //offset = member.offset;

                           // TESTING NOHEAD HERE?
                           if(_class.type == normalClass || _class.type == noHeadClass || _class.type == systemClass)
                              offset += member._class.offset;

                           // VERIFY THIS: (trying to fix primitive.type)
                           // if(memberExp.type == constantExp)
                           if(memberExp.hasAddress && (_class.type != normalClass && _class.type != noHeadClass && _class.type != systemClass))
                           {
                              address = memberExp.address;
                              gotAddress = true;
                           }
                           else if(memberExp.type == constantExp)
                              gotAddress = GetUInt64(memberExp, &address);
                           else
                           {
                              gotAddress = GetUInt64(memberExp, &address);
                              //printf("Unhandled !!\n");

                              //printf("memberExp.hasAddress = %d\n", memberExp.hasAddress);
                              //printf("memberExp.type = %d\n", memberExp.type);
                              //printf("_class.name = %s, _class.type = %d\n", _class.name, _class.type);
                           }

                           address += offset;

                           if(!gotAddress)
                              exp.type = unknownErrorExp;
                           else if((dataType.kind == classType && dataType._class &&
                                 (!dataType._class.registered || dataType._class.registered.type == normalClass || dataType._class.registered.type == noHeadClass || dataType._class.registered.type == systemClass)) ||
                              (dataType.kind != classType && dataType.kind != arrayType && dataType.kind != structType && dataType.kind != unionType))
                           {
                              evaluation = Debugger::ReadMemory(address, size, format, &evalError);
                              if(evalError != dummyExp)
                              {
                                 exp.type = evalError;
                                 exp.constant = PrintHexUInt64(address);
                              }
                              else if(evaluation)
                              {
                                 //printf("evaluation = %s\n", evaluation);
                                 expNew = ParseExpressionString(evaluation);
                                 delete evaluation;
                                 expNew.destType = exp.expType;
                                 if(exp.expType)
                                    exp.expType.refCount++;
                                 //FreeType(memberExp.destType);
                                 FreeType(exp.expType);
                                 FreeType(exp.destType);
                                 FreeExpContents(exp);
                                 ProcessExpressionType(expNew);
                                 DebugComputeExpression(expNew);
                                 expNew.prev = prev;
                                 expNew.next = next;
                                 expNew.isConstant = true;
                                 expNew.address = address;
                                 expNew.hasAddress = true;
                                 *exp = *expNew;
                                 delete expNew;
                              }
                              else
                              {
                                 FreeExpContents(exp);
                                 exp.type = unknownErrorExp;
                              }
                           }
                           else
                           {
                              // TESTING THIS HERE...
                              exp.type = constantExp;
                              exp.constant = PrintHexUInt64(address);

                              exp.address = address;
                              exp.hasAddress = true;
                              exp.isConstant = true;
                           }
                        }
                     }
                     //else
                     //   exp.type = ExpUnknownError;

                     //FreeExpContents(exp);
                     //exp.constant = PrintUInt64(value);
                     //exp.type = constantExp;
                  }
               }
               else
               {
                  if(type && (type.kind == structType || type.kind == unionType))
                  {
                     uint offset = 0;
                     Type memberType = exp.member.member ? FindMemberAndOffset(type, exp.member.member.string, &offset) : null;
                     if(memberType)
                     {
                        char * evaluation = null;
                        ExpressionType evalError = dummyExp;
                        uint64 address = 0;
                        bool gotAddress = false;
                        Expression prev = exp.prev, next = exp.next;
                        char format;
                        int size = memberType.size;
                        Expression expNew;
                        Type dataType = memberType;
                        TypeKind kind = dummyType;

                        if(dataType.kind == classType && dataType._class.registered &&
                              (dataType._class.registered.type == enumClass || dataType._class.registered.type == bitClass || dataType._class.registered.type == unitClass))
                           dataType = dataType._class.registered.dataType;

                        format = GetGdbFormatChar(dataType);

                        if(memberExp.hasAddress)
                        {
                           address = memberExp.address;
                           gotAddress = true;
                        }
                        else if(memberExp.type == constantExp)
                           gotAddress = GetUInt64(memberExp, &address);

                        address += offset;

                        if(!gotAddress)
                        {
                           FreeExpContents(exp);
                           exp.type = unknownErrorExp;
                        }
                        else if((dataType.kind == classType && dataType._class &&
                              (!dataType._class.registered || dataType._class.registered.type == normalClass || dataType._class.registered.type == noHeadClass || dataType._class.registered.type == systemClass)) ||
                           (dataType.kind != classType && dataType.kind != arrayType && dataType.kind != structType && dataType.kind != unionType))
                        {
                           evaluation = Debugger::ReadMemory(address, size, format, &evalError);
                           if(evalError != dummyExp)
                           {
                              exp.type = evalError;
                              exp.constant = PrintHexUInt64(address);
                           }
                           else if(evaluation)
                           {
                              expNew = ParseExpressionString(evaluation);
                              delete evaluation;
                              expNew.destType = exp.expType;
                              if(exp.expType)
                                 exp.expType.refCount++;
                              //FreeType(memberExp.destType);
                              FreeType(exp.expType);
                              FreeType(exp.destType);
                              FreeExpContents(exp);
                              ProcessExpressionType(expNew);
                              DebugComputeExpression(expNew);
                              expNew.prev = prev;
                              expNew.next = next;
                              expNew.isConstant = true;
                              expNew.address = address;
                              expNew.hasAddress = true;
                              *exp = *expNew;
                              delete expNew;
                           }
                           else
                           {
                              FreeExpContents(exp);
                              exp.type = unknownErrorExp;
                           }
                        }
                        else
                        {
                           FreeExpContents(exp);

                           // TESTING THIS HERE...
                           exp.type = constantExp;
                           exp.constant = PrintHexUInt64(address);

                           exp.address = address;
                           exp.hasAddress = true;
                           exp.isConstant = true;
                        }
                     }
                     else
                        exp.type = memberSymbolErrorExp;
                  }
                  else
                     exp.type = memberSymbolErrorExp;
               }
            }

            //if(exp.type != memberExp)
            {
               //FreeExpression(memberExp);
               //FreeIdentifier(memberID);
            }
         }
         else
         {
            exp.type = memberSymbolErrorExp;
         }
         break;
      }
      case typeSizeExp:
      {
         Type type = ProcessType(exp.typeName.qualifiers, exp.typeName.declarator);
         FreeExpContents(exp);
         exp.constant = PrintUInt(ComputeTypeSize(type));
         exp.type = constantExp;
         FreeType(type);
         break;
      }
      case classSizeExp:
      {
         Symbol classSym = FindClass(exp._class.name);
         if(classSym && classSym.registered)
         {
            //exp.constant = PrintUInt(classSym.registered.size);
            //exp.type = constantExp;

            char className[1024];
            sprintf(className, "__ecereClass_%s", classSym.string);
            FreeExpContents(exp);
            exp.type = pointerExp;
            exp.member.exp = MkExpIdentifier(MkIdentifier(className));
            exp.member.member = MkIdentifier("size");
         }
         break;
      }
      case castExp:
      {
         DebugComputeExpression(exp.cast.exp);

         if(ExpressionIsError(exp.cast.exp)) //.type == ExpSymbolError
            CarryExpressionError(exp, exp.cast.exp);
         else
         {
            exp.hasAddress = exp.cast.exp.hasAddress;
            exp.address = exp.cast.exp.address;
            if(exp.cast.exp.type == constantExp && exp.expType)
            {
               Type type = exp.expType;
               if(type.kind == classType && type._class && type._class.registered)
               {
                  Class _class = type._class.registered;
                  if(_class.type == unitClass || _class.type == bitClass || _class.type == enumClass)
                  {
                     if(!_class.dataType)
                        _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                     type = _class.dataType;
                  }
               }

               switch(type.kind)
               {
                  case charType:
                     if(type.isSigned)
                     {
                        char value = 0;
                        if(GetChar(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintChar(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     else
                     {
                        unsigned char value = 0;
                        if(GetUChar(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintUChar(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     break;
                  case shortType:
                     if(type.isSigned)
                     {
                        short value = 0;
                        if(GetShort(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintShort(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     else
                     {
                        unsigned short value = 0;
                        if(GetUShort(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintUShort(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     break;
                  case intType:
                     if(type.isSigned)
                     {
                        int value = 0;
                        if(GetInt(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintInt(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     else
                     {
                        unsigned int value = 0;
                        if(GetUInt(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintUInt(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     break;
                  case int64Type:
                     if(type.isSigned)
                     {
                        int64 value = 0;
                        if(GetInt64(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintInt64(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     else
                     {
                        uint64 value = 0;
                        if(GetUInt64(exp.cast.exp, &value))
                        {
                           FreeExpContents(exp);
                           exp.constant = PrintUInt64(value);
                           exp.type = constantExp;
                           exp.isConstant = true;
                        }
                     }
                     break;
                  case pointerType:
                  case classType:
                  {
                     uint64 value = 0;
                     if(GetUInt64(exp.cast.exp, &value))
                     {
                        FreeExpContents(exp);
                        if(type.kind == pointerType || type.kind == classType)
                           exp.constant = PrintHexUInt64(value);
                        else
                           exp.constant = PrintUInt64(value);
                        exp.type = constantExp;
                        exp.isConstant = true;
                     }
                     break;
                  }
                  case floatType:
                  {
                     float value = 0;
                     if(exp.cast.exp.type == constantExp && exp.cast.exp.constant &&
                        (!strcmpi(exp.cast.exp.constant, "nan") ||
                        !strcmpi(exp.cast.exp.constant, "-nan") ||
                        !strcmpi(exp.cast.exp.constant, "inf") ||
                        !strcmpi(exp.cast.exp.constant, "-inf")))
                     {
                        String constant = exp.cast.exp.constant;
                        exp.cast.exp.constant = null;
                        FreeExpContents(exp);
                        exp.constant = constant;
                        exp.type = constantExp;
                        exp.isConstant = true;
                     }
                     else if(GetFloat(exp.cast.exp, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintFloat(value);
                        exp.type = constantExp;
                        exp.isConstant = true;
                     }
                     break;
                  }
                  case doubleType:
                  {
                     double value = 0;
                     if(exp.cast.exp.type == constantExp && exp.cast.exp.constant &&
                        (!strcmpi(exp.cast.exp.constant, "nan") ||
                        !strcmpi(exp.cast.exp.constant, "-nan") ||
                        !strcmpi(exp.cast.exp.constant, "inf") ||
                        !strcmpi(exp.cast.exp.constant, "-inf")))
                     {
                        String constant = exp.cast.exp.constant;
                        exp.cast.exp.constant = null;
                        FreeExpContents(exp);
                        exp.constant = constant;
                        exp.type = constantExp;
                        exp.isConstant = true;
                     }
                     else if(GetDouble(exp.cast.exp, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintDouble(value);
                        exp.type = constantExp;
                        exp.isConstant = true;
                     }
                     break;
                  }
               }
            }
         }
         break;
      }
      case conditionExp:
      {
         if(exp.cond.cond)
         {
            DebugComputeExpression(exp.cond.cond);

            if(ExpressionIsError(exp.cond.cond))
               CarryExpressionError(exp, exp.cond.cond);
            else if(exp.cond.cond.type == constantExp && exp.cond.cond.constant)
            {
               Expression e = null;
               if(strtol(exp.cond.cond.constant, null, 0))
               {
                  for(e = exp.cond.exp ? exp.cond.exp->first : null; e; e = e.next)
                  {
                     DebugComputeExpression(e);
                     if(!e.next) break;
                  }
                  if(e)
                  {
                     if(ExpressionIsError(e))
                     {
                        CarryExpressionError(exp, e);
                        e = null;
                     }
                     else
                        exp.cond.exp->Remove(e);
                  }
               }
               else
               {
                  e = exp.cond.elseExp;
                  if(e)
                  {
                     DebugComputeExpression(e);
                     if(ExpressionIsError(e))
                     {
                        CarryExpressionError(exp, e);
                        e = null;
                     }
                     else
                        exp.cond.elseExp = null;
                  }
               }
               if(e)
               {
                  FreeType(exp.expType);
                  FreeType(exp.destType);
                  e.prev = exp.prev;
                  e.next = exp.next;
                  FreeExpContents(exp);
                  *exp = *e;
                  delete e;
               }
               else if(!ExpressionIsError(exp))
               {
                  FreeExpContents(exp);
                  exp.type = unknownErrorExp;
               }
            }
            else
            {
               FreeExpContents(exp);
               exp.type = unknownErrorExp;
            }
         }
         else
         {
            FreeExpContents(exp);
            exp.type = unknownErrorExp;
         }
         break;
      }
   }
}
