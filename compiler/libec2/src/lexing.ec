public import "ecere"
public import "ec"

public enum TokenType
{
   IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261,PTR_OP = 262,INC_OP = 263,DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270,
   AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281,
   OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295,
   UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309,
   SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323,
   SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336,
   TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347,
   CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356,
   NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366;

   property char { }

   property bool isSpecifier
   {
      get
      {
         return isQualifier || this == CHAR || this == SHORT || this == INT || this == UINT || this == INT64 || this == LONG || this == SIGNED ||
                this == UNSIGNED || this == FLOAT || this == DOUBLE || this == VOID ||
                this == VALIST || this == THISCLASS || this == TYPED_OBJECT || this == ANY_OBJECT ||
                this == TYPEDEF || this == STRUCT || this == UNION || this == ENUM ||
                this == TYPEOF || this == SUBCLASS;
      }
   }

   property bool isQualifier
   {
      get
      {
         return this == EXTERN || this == STATIC || this == AUTO || this == REGISTER || this == CONST || this == VOLATILE;
      }
   }

   property bool isUnaryOperator
   {
      get
      {
         return this == '&' || this == '*' || this == '+' || this == '-' || this == '~' || this == '!' || this == DELETE || this == _INCREF;
      }
   }

   property bool isAssignmentOperator
   {
      get
      {
   	  return this == '='|| this == MUL_ASSIGN || this == DIV_ASSIGN || this == MOD_ASSIGN ||
               this == ADD_ASSIGN || this == SUB_ASSIGN || this == LEFT_ASSIGN || this == RIGHT_ASSIGN ||
               this == AND_ASSIGN || this == XOR_ASSIGN || this == OR_ASSIGN;
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
            case VOID: Print("void"); break;
            case CHAR: Print("char"); break;
            case SHORT: Print("short"); break;
            case INT: Print("int"); break;
            case LONG: Print("long"); break;
            case INT64: Print("int64"); break;
            case UNSIGNED: Print("unsigned"); break;
            case SIGNED: Print("signed"); break;
            case FLOAT: Print("float"); break;
            case DOUBLE: Print("double"); break;
            case TYPEDEF: Print("typedef"); break;
            case EXTERN: Print("extern"); break;
            case STATIC: Print("static"); break;
            case AUTO: Print("auto"); break;
            case REGISTER: Print("register"); break;
            case UINT: Print("uint"); break;
            case CONST: Print("const"); break;
            case VOLATILE: Print("volatile"); break;
            case VALIST: Print("va_list"); break;
            case THISCLASS: Print("thisclass"); break;
            case TYPED_OBJECT: Print("typed_Object"); break;
            case ANY_OBJECT: Print("any_object"); break;
            case STRUCT: Print("struct"); break;
            case UNION: Print("union"); break;
            case ENUM: Print("enum"); break;

            case TYPEOF: Print("typeof"); break;
            case SUBCLASS: Print("subclass"); break;

            case INC_OP: Print("++"); break;
            case DEC_OP: Print("--"); break;
            case SIZEOF: Print("sizeof "); break;
            case LEFT_OP: Print("<<"); break;
            case RIGHT_OP: Print(">>"); break;
            case LE_OP: Print("<="); break;
            case GE_OP: Print(">="); break;
            case EQ_OP: Print("=="); break;
            case NE_OP: Print("!="); break;
            case AND_OP: Print("&&"); break;
            case OR_OP: Print("||"); break;
      	   case MUL_ASSIGN: Print("*="); break;
      	   case DIV_ASSIGN: Print("/="); break;
      	   case MOD_ASSIGN: Print("%="); break;
      	   case ADD_ASSIGN: Print("+="); break;
      	   case SUB_ASSIGN: Print("-="); break;
      	   case LEFT_ASSIGN: Print("<<="); break;
      	   case RIGHT_ASSIGN: Print(">>="); break;
      	   case AND_ASSIGN: Print("&="); break;
      	   case XOR_ASSIGN: Print("^="); break;
      	   case OR_ASSIGN: Print("|="); break;
         }
      }
   }
};

class Token
{
   TokenType type;
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
         nextToken = { _refCount = 1 };
         nextToken.type = (TokenType)LexEc();
         nextToken.text = CopyString(GetYYText());
         if(ambiguous)
         {
            stackPos++;
            tokenStack.Add(nextToken);
            incref nextToken;
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
