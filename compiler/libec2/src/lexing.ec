public import "ecere"
public import "ec"

public enum TokenType2 : TokenType
{
   dummy;

   property char { }

   property bool isSpecifier
   {
      get
      {
         return isQualifier || this == _char || this == _short || this == _int || this == _uint || this == _int64 || this == _long || this == _signed ||
                this == _unsigned || this == _float || this == _double || this == _void ||
                this == _valist || this == thisClass || this == typedObject || this == anyObject ||
                this == _typedef || this == _struct || this == _class || this == _union || this == _enum ||
                this == _typeof || this == subClass;
      }
   }

   property bool isQualifier
   {
      get
      {
         return this == _extern || this == _static || this == _auto || this == _register || this == _const || this == _volatile;
      }
   }

   property bool isUnaryOperator
   {
      get
      {
         return this == '&' || this == '*' || this == '+' || this == '-' || this == '~' || this == '!' || this == _delete || this == _incref;
      }
   }

   property bool isAssignmentOperator
   {
      get
      {
        return this == '='|| this == mulAssign || this == divAssign || this == modAssign ||
               this == addAssign || this == subAssign || this == leftAssign || this == rightAssign ||
               this == andAssign || this == xorAssign || this == orAssign;
      }
   }

   void print()
   {
      if(this < 256)
         Print((char)this);
      else
      {
         switch(this)
         {
            case _void: Print("void"); break;
            case _char: Print("char"); break;
            case _short: Print("short"); break;
            case _int: Print("int"); break;
            case _long: Print("long"); break;
            case _int64: Print("int64"); break;
            case _unsigned: Print("unsigned"); break;
            case _signed: Print("signed"); break;
            case _float: Print("float"); break;
            case _double: Print("double"); break;
            case _typedef: Print("typedef"); break;
            case _extern: Print("extern"); break;
            case _static: Print("static"); break;
            case _auto: Print("auto"); break;
            case _register: Print("register"); break;
            case _uint: Print("uint"); break;
            case _const: Print("const"); break;
            case _volatile: Print("volatile"); break;
            case _valist: Print("va_list"); break;
            case thisClass: Print("thisclass"); break;
            case typedObject: Print("typed_Object"); break;
            case anyObject: Print("any_object"); break;
            case _struct: Print("struct"); break;
            case _union: Print("union"); break;
            case _enum: Print("enum"); break;
            case _class: Print("class"); break;

            case _typeof: Print("typeof"); break;
            case subClass: Print("subclass"); break;

            case incOp: Print("++"); break;
            case decOp: Print("--"); break;
            case sizeOf: Print("sizeof "); break;
            case leftOp: Print("<<"); break;
            case rightOp: Print(">>"); break;
            case leOp: Print("<="); break;
            case geOp: Print(">="); break;
            case eqOp: Print("=="); break;
            case neOp: Print("!="); break;
            case andOp: Print("&&"); break;
            case orOp: Print("||"); break;
            case mulAssign: Print("*="); break;
            case divAssign: Print("/="); break;
            case modAssign: Print("%="); break;
            case addAssign: Print("+="); break;
            case subAssign: Print("-="); break;
            case leftAssign: Print("<<="); break;
            case rightAssign: Print(">>="); break;
            case andAssign: Print("&="); break;
            case xorAssign: Print("^="); break;
            case orAssign: Print("|="); break;
         }
      }
   }
};

class Token
{
   TokenType2 type;
   String text;
   ~Token()
   {
      delete text;
   }
}

Token token, nextToken;

int ambiguous, stackPos;
Array<Token> tokenStack { minAllocSize = 256 };

Token readToken()
{
   if(!nextToken) peekToken();
   delete token;
   token = nextToken;
   nextToken = null;
   return token;
}

Token peekToken()
{
   if(!nextToken)
   {
      if(stackPos < tokenStack.count)
      {
         nextToken = tokenStack[stackPos++];
         incref nextToken;
         if(!ambiguous && stackPos == tokenStack.count)
         {
            tokenStack.Free();
            stackPos = 0;
         }
      }
      else
      {
         TokenType2 type = (TokenType2)LexEc();
         if(type)
         {
            nextToken = { _refCount = 1, type = type, text = CopyString(GetYYText()) };
            if(ambiguous)
            {
               stackPos++;
               tokenStack.Add(nextToken);
               incref nextToken;
            }
         }
      }
   }
   return nextToken;
}

int pushAmbiguity()
{
   if(!ambiguous && nextToken && stackPos == tokenStack.count)
   {
      stackPos++;
      tokenStack.Add(nextToken);
      incref nextToken;
   }
   ambiguous++;
   return stackPos - (nextToken ? 1 : 0);
}

void clearAmbiguity()
{
   if(!--ambiguous && stackPos > 0)
   {
      int i;
      for(i = 0; i < stackPos; i++)
         delete tokenStack[i];
      if(tokenStack.size > stackPos)
         memmove(tokenStack.array, tokenStack.array + stackPos, (tokenStack.size - stackPos) * sizeof(Token));
      tokenStack.size -= stackPos;
      stackPos = 0;
   }
}

void popAmbiguity(int i)
{
   delete token;
   delete nextToken;

   stackPos = i;
   clearAmbiguity();
   token = null;
   nextToken = null;
}

public void lexAll()
{
   while(readToken())
   {
      if(token.type < 256)
         PrintLn((char)token.type);
      else
         PrintLn(token.type, " (", token.text, ")");
   }
}

public void initParser(File f)
{
   SetFileInput(f);
   delete token;
   delete nextToken;
   tokenStack.size = 0;
   stackPos = 0;
   ambiguous = 0;
}
