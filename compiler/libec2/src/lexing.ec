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
         out.Print((char)this);
      else
      {
         switch(this)
         {
            case _void: out.Print("void"); break;
            case _char: out.Print("char"); break;
            case _short: out.Print("short"); break;
            case _int: out.Print("int"); break;
            case _long: out.Print("long"); break;
            case _int64: out.Print("int64"); break;
            case _unsigned: out.Print("unsigned"); break;
            case _signed: out.Print("signed"); break;
            case _float: out.Print("float"); break;
            case _double: out.Print("double"); break;
            case _typedef: out.Print("typedef"); break;
            case _extern: out.Print("extern"); break;
            case _static: out.Print("static"); break;
            case _auto: out.Print("auto"); break;
            case _register: out.Print("register"); break;
            case _uint: out.Print("uint"); break;
            case _const: out.Print("const"); break;
            case _volatile: out.Print("volatile"); break;
            case _valist: out.Print("va_list"); break;
            case thisClass: out.Print("thisclass"); break;
            case typedObject: out.Print("typed_object"); break;
            case anyObject: out.Print("any_object"); break;
            case _struct: out.Print("struct"); break;
            case _union: out.Print("union"); break;
            case _enum: out.Print("enum"); break;
            case _class: out.Print("class"); break;

            case _typeof: out.Print("typeof"); break;
            case subClass: out.Print("subclass"); break;

            case incOp: out.Print("++"); break;
            case decOp: out.Print("--"); break;
            case sizeOf: out.Print("sizeof "); break;
            case leftOp: out.Print("<<"); break;
            case rightOp: out.Print(">>"); break;
            case leOp: out.Print("<="); break;
            case geOp: out.Print(">="); break;
            case eqOp: out.Print("=="); break;
            case neOp: out.Print("!="); break;
            case andOp: out.Print("&&"); break;
            case orOp: out.Print("||"); break;
            case mulAssign: out.Print("*="); break;
            case divAssign: out.Print("/="); break;
            case modAssign: out.Print("%="); break;
            case addAssign: out.Print("+="); break;
            case subAssign: out.Print("-="); break;
            case leftAssign: out.Print("<<="); break;
            case rightAssign: out.Print(">>="); break;
            case andAssign: out.Print("&="); break;
            case xorAssign: out.Print("^="); break;
            case orAssign: out.Print("|="); break;
         }
      }
   }
};

class Token
{
public:
   property TokenType2 type { get { return this ? type : 0; } };
private:
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
         out.PrintLn((char)token.type);
      else
         out.PrintLn(token.type, " (", token.text, ")");
   }
}

File out;
public void initParser(File input, File output)
{
   SetFileInput(input);
   out = output;
   resetScanner();
   delete token;
   delete nextToken;
   tokenStack.size = 0;
   stackPos = 0;
   ambiguous = 0;
}
