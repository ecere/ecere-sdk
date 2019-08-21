public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA" // For FieldValue

public import "lexing"
public import "astNode"
public import "eccss"

default:
extern int __ecereVMethodID_class_OnGetDataFromString;
static __attribute__((unused)) void dummy() { int a; a.OnGetDataFromString(null); }
private:

#define BINARY(o, name, m, t)                                        \
   static bool name(FieldValue value, const FieldValue val1, const FieldValue val2)   \
   {                                                                    \
      value.m = val1.m o val2.m;                               \
      value.type = { type = t };                                     \
      return true;                                                \
   }

#define BINARY_DIVIDEINT(o, name, m, t) \
   static bool name(FieldValue value, const FieldValue val1, const FieldValue val2)   \
   {                                                                 \
      value.m = (val2.m ? ((val1.m o val2.m)) : 0);             \
      value.type = { type = t };                                     \
      return true;                                                \
   }


#define BINARY_LOGICAL(o, name, m, t)                                        \
   static bool name(FieldValue value, const FieldValue val1, const FieldValue val2)   \
   {                                                                    \
      value.i = val1.m o val2.m;                               \
      value.type = { type = integer };                                     \
      return true;                                                \
   }

#define UNARY(o, name, m, t) \
   static bool name(FieldValue value, const FieldValue val1)                \
   {                                                              \
      value.m = (o val1.m);                                   \
      value.type = { type = t };                                     \
      return true;                                                \
   }

#define UNARY_LOGICAL(o, name, m, t) \
   static bool name(FieldValue value, const FieldValue val1)                \
   {                                                              \
      value.i = (o val1.m);                                   \
      value.type = { type = integer };                                     \
      return true;                                                \
   }


#define OPERATOR_ALL(macro, o, name) \
   macro(o, integer##name, i, integer) \
   macro(o, text##name, s, text) \
   macro(o, real##name, r, real)

#define OPERATOR_NUMERIC(macro, o, name) \
   macro(o, integer##name, i, integer) \
   macro(o, real##name, r, real)

#define OPERATOR_INT(macro, o, name) \
   macro(o, integer##name, i, integer)

#define OPERATOR_REAL(macro, o, name) \
   macro(o, real##name, r, real)

#define OPERATOR_TEXT(macro, o, name) \
   macro(o, text##name, s, text)

#define OPERATOR_TABLE_INT(type) \
    { type##Add, type##Sub, type##Mul, type##Div, type##DivInt, type##Mod, \
                          type##Neg, \
                          type##Not, \
                          type##Equ, type##Nqu, \
                          type##And, type##Or, \
                          type##Grt, type##Sma, type##GrtEqu, type##SmaEqu, \
                          null, null, null, null, null, null \
                        }

#define OPERATOR_TABLE_REAL(type) \
    { type##Add, type##Sub, type##Mul, type##Div, type##DivInt, type##Mod, \
                          type##Neg, \
                          type##Not, \
                          type##Equ, type##Nqu, \
                          type##And, type##Or, \
                          type##Grt, type##Sma, type##GrtEqu, type##SmaEqu, \
                          null, null, null, null, null, null \
                        }


#define OPERATOR_TABLE_TEXT(type) \
    { type##Add, null, null, null, null, null, null,  \
                          type##Not, \
                          type##Equ, type##Nqu, \
                          type##And, type##Or, \
                          type##Grt, type##Sma, type##GrtEqu, type##SmaEqu,  \
                          type##StrCnt, type##StrSrt, type##StrEnd, type##StrNotCnt, type##StrNotSrt, type##StrNotEnd     \
                        }

#define OPERATOR_TABLE_EMPTY(type) \
    { null, null, null, null, null, null, null,  \
                          null, \
                          null, null, \
                          null, null, \
                          null, null, null, null, \
                          null, null, null, null, null, null     \
}

static CMSSTokenType opPrec[][8] =
{
   { '*', '/', intDivide, '%' },
   { '+', '-' },
   { in },
   { '<', '>', smallerEqual, greaterEqual },
   { equal, notEqual, stringStartsWith, stringNotStartsW, stringEndsWith, stringNotEndsW, stringContains, stringNotContains },
   { and },
   { or }
};

static define numPrec = sizeof(opPrec) / sizeof(opPrec[0]);

static bool isPrecedence(CMSSTokenType this, int l)
{
   if(this)
   {
      int o;
      for(o = 0; o < sizeof(opPrec[0]) / sizeof(opPrec[0][0]); o++)
      {
         CMSSTokenType op = opPrec[l][o];
         if(this == op)
            return true;
         else if(!op)
            break;
      }
   }
   return false;
}

OpTable opTables[FieldType] =
{
   OPERATOR_TABLE_EMPTY(nil),
   OPERATOR_TABLE_INT(integer),
   OPERATOR_TABLE_REAL(real),
   OPERATOR_TABLE_TEXT(text)
};

public class ExpFlags : uint
{
public:
   bool resolved:1;
};

public enum ComputeType { preprocessing, runtime, other };

void * copyList(List list, CMSSNode copy(CMSSNode))
{
   List<CMSSNode> result = null;
   if(list)
   {
      result = eInstance_New(list._class);
      for(l : list)
         result.Add(copy((CMSSNode)l));
   }
   return result;
}

CMSSExpression simplifyResolved(FieldValue val, CMSSExpression e)
{
   // Handling some conversions here...
   Class destType = e.destType;
   if(destType && e.expType != destType)
   {
      if(destType == class(float) || destType == class(double))
         convertFieldValue(val, real, val);
      else if(destType == class(String))
         convertFieldValue(val, text, val);
      else if(destType == class(int64) || destType == class(int) || destType == class(uint64) || destType == class(uint))
         convertFieldValue(val, integer, val);
   }

   if(e._class != class(CMSSExpString) && e._class != class(CMSSExpConstant) && e._class != class(CMSSExpInstance) && e._class != class(CMSSExpArray))
   {
      CMSSExpression ne = (val.type.type == text) ? CMSSExpString { string = CopyString(val.s) } : CMSSExpConstant { constant = val };
      ne.destType = e.destType;
      ne.expType = e.expType;
      delete e;
      return ne;
   }
   else if(e._class == class(CMSSExpInstance))
   {
      Class c = e.destType;   // NOTE: At this point, expType should be set but is currently null?
      if(c && c.type == bitClass)
      {
         CMSSExpression ne = CMSSExpConstant { constant = val };
         ne.destType = e.destType;
         ne.expType = e.expType;
         delete e;
         return ne;
      }
   }
   return e;
}

CMSSExpression parseCMSSExpression(const String string)
{
   CMSSExpression e = null;
   if(string)
   {
      CMSSLexer lexer { };
      lexer.initString(string);
      e = CMSSExpression::parse(lexer);
      delete lexer;
   }
   return e;
}


public class CMSSIdentifier : CMSSNode
{
public:
   String string;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.Print(string);
   }

   CMSSIdentifier ::parse(CMSSLexer lexer)
   {
      lexer.readToken();
      return { string = CopyString(lexer.token.text) };
   }

   CMSSIdentifier copy()
   {
      CMSSIdentifier id { string = CopyString(string) };
      return id;
   }

   ~CMSSIdentifier()
   {
      delete string;
   }
};

// Expressions
public class CMSSExpression : CMSSNode
{
public:
   DataValue val;
   Class destType;
   Class expType;

   //virtual float compute();
   private virtual ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType);

   CMSSExpression ::parse(CMSSLexer lexer)
   {
      return CMSSExpConditional::parse(lexer);
   }
}

public class CMSSExpList : CMSSList<CMSSExpression>
{
public:
   CMSSExpList ::parse(CMSSLexer lexer)
   {
      return (CMSSExpList)CMSSList::parse(class(CMSSExpList), lexer, CMSSExpression::parse, ',');
   }

   CMSSExpList copy()
   {
      CMSSExpList e { };
      for(n : list)
         e.list.Add(n.copy());
      return e;
   }
}

static CMSSExpression parseSimplePrimaryExpression(CMSSLexer lexer)
{
   if(lexer.peekToken().type == constant)
      return CMSSExpConstant::parse(lexer);
   else if(lexer.nextToken.type == identifier)
   {
      CMSSExpIdentifier exp = CMSSExpIdentifier::parse(lexer);
      if(lexer.peekToken().type == '{')
      {
         CMSSSpecsList specs { };
         specs.Add(CMSSSpecName { name = exp.identifier.string });
         return CMSSExpInstance::parse(specs, lexer);
      }
      return exp;
   }
   else if(lexer.nextToken.type == stringLiteral)
      return CMSSExpString::parse(lexer);
   else if(lexer.nextToken.type == '{')
      return CMSSExpInstance::parse(null, lexer);
   else if(lexer.nextToken.type == '[')
      return CMSSExpArray::parse(lexer);
   else
      return null;
}

static CMSSExpression parsePrimaryExpression(CMSSLexer lexer)
{
   if(lexer.peekToken().type == '(')
   {
      CMSSExpBrackets exp { };
      lexer.readToken();
      exp.list = CMSSExpList::parse(lexer);
      if(lexer.peekToken().type == ')')
         lexer.readToken();
      return exp;
   }
   else
      return parseSimplePrimaryExpression(lexer);
}

static CMSSExpression parsePostfixExpression(CMSSLexer lexer)
{
   CMSSExpression exp = parsePrimaryExpression(lexer);
   while(true)
   {
      if(lexer.peekToken().type == '[')
         exp = CMSSExpIndex::parse(exp, lexer);
      else if(lexer.nextToken.type == '(')
         exp = CMSSExpCall::parse(exp, lexer);
      else if(lexer.nextToken.type == '.')
         exp = CMSSExpMember::parse(exp, lexer);
      else
         break;
   }
   return exp;
}

static CMSSExpression parseUnaryExpression(CMSSLexer lexer)
{
   lexer.peekToken();
   if(lexer.nextToken.type.isUnaryOperator)
   {
      lexer.readToken();
      return CMSSExpOperation { op = lexer.token.type, exp2 = parseUnaryExpression(lexer) };
   }
   else
      return parsePostfixExpression(lexer);
}

public class CMSSExpConstant : CMSSExpression
{
public:
   FieldValue constant;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.Print(constant);
   }

   CMSSExpConstant ::parse(CMSSLexer lexer)
   {
      CMSSToken token = lexer.readToken();
      //check token, if starts with quote or contains comma... parse to know type, integer string etc,... set i s or r
      // no text here, use cmssexpstring

      if(isdigit(token.text[0]))
      {
         int multiplier = 1;
         int len = strlen(token.text);

         if(token.text[len-1] == 'K') multiplier = 1000;
         else if(token.text[len-1] == 'M') multiplier = 1000000;

         if(strchr(token.text, '.'))
            return { constant = { r = strtod(token.text, null) * multiplier, type.type = real }  };
         else return { constant = { i = strtol(token.text, null, 0) * multiplier, type.type = integer}  };
      }
      return null;
   }

   CMSSExpConstant copy()
   {
      CMSSExpConstant e { constant = constant };
      return e;
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      value = constant;
      switch(value.type.type)
      {
         case real: expType = class(double);break;
         case integer: expType = class(int64);break;
      }
      return ExpFlags { resolved = true };
   }

   ~CMSSExpConstant()
   {
      if(constant.type.mustFree == true && constant.type.type == text )
         delete constant.s;
   }
}

public class CMSSExpString : CMSSExpression
{
public:
   String string;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.Print('\'', string, '\'');
   }

   CMSSExpString ::parse(CMSSLexer lexer)
   {
      int len;
      String s;
      lexer.readToken();
      len = strlen(lexer.token.text)-2;
      s = new char[len+1];
      memcpy(s, lexer.token.text+1, len);
      s[len] = 0;
      return { string = s };
   }
   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      value.s = string;
      value.type.type = text;
      return ExpFlags { resolved = true };
   }

   CMSSExpString copy()
   {
      CMSSExpString e { string = CopyString(string) };
      return e;
   }

   ~CMSSExpString()
   {
      delete string;
   }
}

public class CMSSExpIdentifier : CMSSExpression
{
public:
   CMSSIdentifier identifier;
   int fieldID;

   CMSSExpIdentifier copy()
   {
      CMSSExpIdentifier e { identifier = identifier.copy() };
      return e;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      identifier.print(out, indent, o);
   }

   CMSSExpIdentifier ::parse(CMSSLexer lexer)
   {
      return { identifier = CMSSIdentifier::parse(lexer) };
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      //Class c = destType ? destType : class(FieldValue); //filler
      //bool *(* onGetDataFromString)(Class, void *, const char *) = destType._vTbl[__ecereVMethodID_class_OnGetDataFromString];
      ExpFlags flags { };
      //bool (* onGetDataFromString)(void *, void *, const char *) = (void *)destType._vTbl[__ecereVMethodID_class_OnGetDataFromString];
      if(computeType == preprocessing && identifier.string)
      {
         if(!strcmp(identifier.string, "null"))
         {
            value.type.type = nil;
         }
         else if(destType && (destType.type == enumClass || destType == class(Color)))
         {
            //awaiting special code here
            //enum will be an int if not color
            bool (* onGetDataFromString)(void *, void *, const char *) = (void *)destType._vTbl[__ecereVMethodID_class_OnGetDataFromString];

            if(destType == class(Color))
            {
               Color color = 0;
               DefinedColor c = 0;
               if(c.class::OnGetDataFromString(identifier.string))
                  color = c;
               value.i = color;
            }
            else
                onGetDataFromString(destType, &value.i, identifier.string);

            //if(destType != class(Color)) value.i = strtol(identifier.string, null, 0);
            expType = destType;
            value.type.type = integer;
            flags.resolved = true;
         }
         else if(evaluator != null)
            expType = evaluator.evaluatorClass.resolve(evaluator, identifier, &fieldID, &flags);
         else
            value.type.type = nil;
      }
      else if(evaluator != null)
      {
         if(fieldID != -1)
            evaluator.evaluatorClass.compute(evaluator, fieldID, identifier, value, &flags);
         else if(expType)
            flags.resolved = true; // for viz.
      }
      else
         value.type.type = nil;
      return flags;
   }

   CMSSExpIdentifier()
   {
      fieldID = -1;
   }

   ~CMSSExpIdentifier()
   {
      delete identifier;
   }
}

public class CMSSExpOperation : CMSSExpression
{
public:
   CMSSTokenType op;
   CMSSExpression exp1, exp2;

   CMSSExpOperation copy()
   {
      CMSSExpOperation e { op = op, exp1 = exp1 ? exp1.copy() : null, exp2 = exp2 ? exp2.copy() : null };
      return e;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(exp1) { exp1.print(out, indent, o); if(exp2) out.Print(" "); }
      op.print(out, indent, o);
      if(exp2) { if(exp1) out.Print(" "); exp2.print(out, indent, o); }
   }

   CMSSExpression ::parse(int prec, CMSSLexer lexer)
   {
      CMSSExpression exp = (prec > 0) ? parse(prec-1, lexer) : parseUnaryExpression(lexer);
      while(isPrecedence(lexer.peekToken().type, prec))
         exp = CMSSExpOperation { exp1 = exp, op = lexer.readToken().type, exp2 = (prec > 0) ? parse(prec-1, lexer) : parseUnaryExpression(lexer) };
      return exp;
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType) //float
   {
      ExpFlags flags { };
      if(exp1 && exp2)
      {
         FieldValue val1 { };
         FieldValue val2 { };
         ExpFlags flags1, flags2;
         FieldType type;
         OpTable * tbl;

         // TODO: Review this (inheritance of parent expression dest type?)
         exp1.destType = destType;

         flags1 = exp1.compute(val1, evaluator, computeType);
         flags2 = exp2.compute(val2, evaluator, computeType);

         if(op >= stringStartsWith && op <= stringNotContains)
            type = text;
         else
            type = (val1.type.type == real || val2.type.type == real) ? real :
                   (val1.type.type == integer || val2.type.type == integer) ? integer : text;
         tbl = &opTables[type];

         flags = flags1 | flags2;

         if(val1.type.type != type)
            convertFieldValue(val1, type, val1);

         if(op == in)
         {
            CMSSExpList l = (CMSSExpList)exp2;
            if(l && l._class == class(CMSSExpBrackets))
            {
               l = ((CMSSExpBrackets)l).list;
            }
            if(l && l._class == class(CMSSExpList))
            {
               FieldValue v { };
               for(e : l.list)
               {
                  CMSSExpression ne = e;
                  FieldValue v2 { };
                  ExpFlags f2 = ne.compute(v2, evaluator, computeType);
                  if(flags1.resolved)
                  {
                     if(f2.resolved)
                     {
                        if(v2.type.type != type)
                           convertFieldValue(v2, type, v2);
                        if(v2.type.type == type)
                        {
                           tbl->Equ(v, val1, v2);
                           if(v.i)
                           {
                              value = v;
                              break;
                           }
                        }
                     }
                  }
                  else
                     flags |= f2;
               }
               flags.resolved = v.type.type != nil && v.i;
            }
            else
               flags.resolved = false;
         }
         else if(flags1.resolved && flags2.resolved)
         {
            if(val2.type.type != type)
               convertFieldValue(val2, type, val2);

            if(val1.type.type == val2.type.type)
            {
               switch(op)
               {
                  case multiply:             tbl->Mul       (value, val1, val2); break;
                  case divide:   if(val1.i)  tbl->Div       (value, val1, val2); break;
                  case minus:                tbl->Sub       (value, val1, val2); break;
                  case plus:                 tbl->Add       (value, val1, val2); break;
                  case modulo:               tbl->Mod       (value, val1, val2); break;
                  case equal:                tbl->Equ       (value, val1, val2); break;
                  case notEqual:             tbl->Nqu       (value, val1, val2); break;
                  case and:                  tbl->And       (value, val1, val2); break;
                  case or:                   tbl->Or        (value, val1, val2); break;
                  case greater:              tbl->Grt       (value, val1, val2); break;
                  case smaller:              tbl->Sma       (value, val1, val2); break;
                  case greaterEqual:         tbl->GrtEqu    (value, val1, val2); break;
                  case smallerEqual:         tbl->SmaEqu    (value, val1, val2); break;
                  case intDivide:            tbl->DivInt    (value, val1, val2); break;
                  case stringStartsWith:     tbl->StrSrt    (value, val1, val2); break;
                  case stringNotStartsW:     tbl->StrNotSrt (value, val1, val2); break;
                  case stringEndsWith:       tbl->StrEnd    (value, val1, val2); break;
                  case stringNotEndsW:       tbl->StrNotEnd (value, val1, val2); break;
                  case stringContains:       tbl->StrCnt    (value, val1, val2); break;
                  case stringNotContains:    tbl->StrNotCnt (value, val1, val2); break;
               }
               flags.resolved = value.type.type != nil;
            }
            else
               flags.resolved = false;
         }
         else
            flags.resolved = false;

         if(computeType == preprocessing && flags.resolved)
         {
            if(flags1.resolved && !flags2.resolved)
               exp1 = simplifyResolved(val1, exp1);
            else if(!flags1.resolved && flags2.resolved)
               exp2 = simplifyResolved(val2, exp2);
         }
      }
      else if(exp2)
      {
         FieldValue val2 { };
         ExpFlags flags2 = exp2.compute(val2, evaluator, computeType);
         OpTable * tbl = &opTables[val2.type.type];
         flags = flags2;
         if(flags2.resolved)
         {
            switch(op)
            {
               case '-': tbl->Neg(value, val2); break;
               case '!': tbl->Not(value, val2); break;
            }
         }
      }
      return flags;
   }

   ~CMSSExpOperation()
   {
      delete exp1;
      delete exp2;
   }
}

public class CMSSExpBrackets : CMSSExpression
{
public:
   CMSSExpList list;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.Print("(");
      if(list) list.print(out, indent, o);
      out.Print(")");
   }

   CMSSExpBrackets copy()
   {
      return CMSSExpBrackets { list = list.copy(); };
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags;
      //shouldn't this loop?
      if(list && list.lastIterator.data)
      {
         flags = list.lastIterator.data.compute(value, evaluator, computeType);
      }
      else flags = { };
      return flags;
   }

   ~CMSSExpBrackets()
   {
      delete list;
   }
}

public class CMSSExpConditional : CMSSExpression
{
public:
   CMSSExpression condition;
   CMSSExpList expList;
   CMSSExpression elseExp;

   CMSSExpConditional copy()
   {
      CMSSExpConditional e
      {
         condition = condition ? condition.copy() : null,
         expList = expList ? expList.copy() : null,
         elseExp = elseExp ? elseExp.copy() : null
      };
      return e;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(condition) condition.print(out, indent, o);
      out.Print(" ? ");
      if(expList) expList.print(out, indent, o);
      out.Print(" : ");
      if(elseExp)
         elseExp.print(out, indent, o);
   }

   CMSSExpression ::parse(CMSSLexer lexer)
   {
      CMSSExpression exp = CMSSExpOperation::parse(numPrec-1, lexer);
      if(lexer.peekToken().type == '?')
      {
         lexer.readToken();
         exp = CMSSExpConditional { condition = exp, expList = CMSSExpList::parse(lexer) };
         if(lexer.peekToken().type == ':')
         {
            lexer.readToken();
            ((CMSSExpConditional)exp).elseExp = CMSSExpConditional::parse(lexer);
         }
      }
      return exp;
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags = 0;
      FieldValue condValue { };
      ExpFlags flagsCond = condition.compute(condValue, evaluator, computeType);
      if(flagsCond.resolved)
      {
         if(condValue.i)
         {
            CMSSExpression last = expList.lastIterator.data;   // CMSS Only currently supports a single expression...
            if(last)
               flags = last.compute(value, evaluator, computeType);
         }
         else
            flags = elseExp.compute(value, evaluator, computeType);
         if(!flags.resolved)
            condition = simplifyResolved(condValue, condition);
          // TOOD: Support for replacing condition expression entirely eventually?
      }
      else
      {
         CMSSExpression last = expList.lastIterator.data;   // CMSS Only currently supports a single expression...
         FieldValue val1 { };
         FieldValue val2 { };
         ExpFlags flags1 = last ? last.compute(val1, evaluator, computeType) : 0;
         ExpFlags flags2 = elseExp ? elseExp.compute(val2, evaluator, computeType) : 0;

         flags = (flagsCond | flags1 | flags2) & ~ ExpFlags { resolved = true };
         if(flags1.resolved)
         {
            expList.TakeOut(last);
            expList.Free();
            expList.Add(simplifyResolved(val1, last));
         }
         if(flags2.resolved)
            elseExp = simplifyResolved(val2, elseExp);
      }
      return flags;
   }

   ~CMSSExpConditional()
   {
      delete condition;
      delete expList;
      delete elseExp;
   }
}

public class CMSSExpIndex : CMSSExpression
{
public:
   CMSSExpression exp;
   CMSSExpList index;

   CMSSExpIndex copy()
   {
      CMSSExpIndex e { exp = exp.copy(), index = index.copy() };
      return e;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(exp) exp.print(out, indent, o);
      out.Print("[");
      if(index) index.print(out, indent, o);
      out.Print("]");
   }

   CMSSExpIndex ::parse(CMSSExpression e, CMSSLexer lexer)
   {
      CMSSExpIndex exp;
      lexer.readToken();
      exp = CMSSExpIndex { exp = e, index = CMSSExpList::parse(lexer) };
      if(lexer.peekToken().type == ']')
         lexer.readToken();
      return exp;
   }
   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags { };
      //value = exp.compute;
      return flags;
   }

   ~CMSSExpIndex()
   {
      delete exp;
      delete index;
   }
}

public class CMSSExpMember : CMSSExpression
{
public:
   CMSSExpression exp;
   CMSSIdentifier member;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(exp) exp.print(out, indent, o);
      out.Print(".");
      if(member)
         member.print(out, indent, o);
   }

   CMSSExpMember copy()
   {
      CMSSExpMember e { exp = exp.copy(), member = member.copy() };
      return e;
   }

   CMSSExpMember ::parse(CMSSExpression e, CMSSLexer lexer)
   {
      lexer.readToken();
      return { exp = e, member = CMSSIdentifier::parse(lexer) };
   }
   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags { };
      FieldValue val { };
      ExpFlags expFlg = exp.compute(val, evaluator, computeType);
      if(expFlg.resolved && evaluator != null && exp.expType)
      {
         DataMember prop = eClass_FindDataMember(exp.expType, member.string, exp.expType.module, null, null);
         // This is not right, the type of the member is different...: expType = exp.expType;
         if(prop)
            evaluator.evaluatorClass.evaluateMember(evaluator, prop, exp, val, value, &flags);
      }
      return flags;
   }

   ~CMSSExpMember()
   {
      delete exp;
      delete member;
   }
}

public class CMSSExpCall : CMSSExpression
{
public:
   CMSSExpression exp;
   CMSSExpList arguments;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(exp) exp.print(out, indent, o);
      out.Print("(");
      if(arguments) arguments.print(out, indent, o);
      out.Print(")");
   }

   CMSSExpCall copy()
   {
      CMSSExpCall e { exp = exp.copy(), arguments = arguments.copy() };
      return e;
   }

   CMSSExpCall ::parse(CMSSExpression e, CMSSLexer lexer)
   {
      CMSSExpCall exp;
      lexer.readToken();
      exp = CMSSExpCall { exp = e, arguments = CMSSExpList::parse(lexer) };
      if(lexer.peekToken().type == ')')
         lexer.readToken();
      return exp;
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags { };
      //how to map exp to functions?
      return flags;
   }

   ~CMSSExpCall()
   {
      delete exp;
      delete arguments;
   }
}

public class CMSSExpArray : CMSSExpression
{
public:
   CMSSList<CMSSExpression> elements;
   StylesMask stylesMask;

   CMSSExpArray copy()
   {
      CMSSExpArray e { elements = elements.copy() };
      return e;
   }

   CMSSExpArray ::parse(CMSSLexer lexer)
   {
      CMSSExpArray exp { };
      lexer.readToken();
      exp.elements = (CMSSList<CMSSExpression>)CMSSList::parse(class(CMSSList<CMSSExpression>), lexer, CMSSExpression::parse, ',');
      if(lexer.peekToken().type == ']')
         lexer.readToken();
      return exp;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.Print("[ ");
      if(elements) elements.print(out, indent, o);
      out.Print(" ]");
   }
   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags { };
      //do we simplifyResolved?
      //bool resolved = true;
      for(e : elements)
      {
         FieldValue v { };
         ExpFlags flg;
         if(destType)
         {
            ClassTemplateArgument a = destType.templateArgs[0];

            e.destType = a.dataTypeClass;
            //.if(e._class == class(CMSSExpInstance))
               //((CMSSExpInstance)e).stylesMask = stylesMask;
            flg = e.compute(v, evaluator, computeType);
            flags |= flg;
            //if(!flg.resolved) resolved = false;
         }
         else
            PrintLn("ERROR: null destination type!");
      }
      //if(!resolved) flags.resolved = false;
      flags.resolved = false;
      return flags;
   }


   ~CMSSExpArray()
   {
      delete elements;
   }
}

public class CMSSExpInstance : CMSSExpression
{
public:
   CMSSInstantiation instance;
   StylesMask stylesMask;

   CMSSExpInstance ::parse(CMSSSpecsList specs, CMSSLexer lexer)
   {
      return { instance = CMSSInstantiation::parse(specs, lexer) };
   }

   CMSSExpInstance copy()
   {
      CMSSExpInstance e { instance = instance.copy() };
      return e;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(instance) instance.print(out, indent, o);
   }

   ExpFlags compute(FieldValue value, ECCSSEvaluator evaluator, ComputeType computeType)
   {
      ExpFlags flags = 0; //can an instance be resolved entirely to a constant?

      if(computeType == preprocessing)
      {
         CMSSSpecName specName = (CMSSSpecName)instance._class;
         Class c = specName ? eSystem_FindClass(specName._class.module, specName.name) : destType;
         int memberID = 0;
         for(inst : instance.members)
         {
            CMSSInstInitMember member = (CMSSInstInitMember)inst;
            for(m : member.members)
               flags |= m.precompute(c, stylesMask, &memberID, evaluator);
         }
         if(flags.resolved && c && c.type == bitClass)
         {
            value.type = { integer };
            value.i = 0;
            setGenericBitMembers(this, (uint64 *)&value.i, evaluator, &flags);
         }
         expType = c;
      }
      else if(computeType == runtime)
      {
         value.i = (int64)(intptr)createGenericInstance(this, evaluator, &flags);
         if(!flags)
            flags.resolved = true;
      }
      return flags;
   }

   ~CMSSExpInstance()
   {
      delete instance;
      //delete Instance here
   }
}

public class CMSSInstanceInit : CMSSNode
{
public:
   CMSSInstanceInit ::parse(CMSSLexer lexer)
   {
      return CMSSInstInitMember::parse(lexer);
   }
}

public class CMSSInstInitMember : CMSSInstanceInit
{
public:
   CMSSMemberInitList members;

   CMSSInstInitMember ::parse(CMSSLexer lexer)
   {
      CMSSMemberInitList list = CMSSMemberInitList::parse(lexer);
      return list ? { members = list } : null;
   }

   CMSSInstInitMember copy()
   {
      CMSSInstInitMember i { members = members.copy() };
      return i;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(members) members.print(out, indent, o);
   }

   ~CMSSInstInitMember()
   {
      delete members;
   }
}

public class CMSSInstInitList : CMSSList<CMSSInstanceInit>
{
public:
   CMSSInstInitList ::parse(CMSSLexer lexer)
   {
      return (CMSSInstInitList)CMSSList::parse(class(CMSSInstInitList), lexer, CMSSInstanceInit::parse, 0);
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      CMSSList::print(out, indent, o);
   }
}

public class CMSSInstantiation : CMSSNode
{
public:
   CMSSSpecifier _class;

   CMSSInstInitList members;

   CMSSInstantiation ::parse(CMSSSpecsList specs, CMSSLexer lexer)
   {
      CMSSInstantiation inst { };
      if(specs && specs[0])
         inst._class = specs[0];
      lexer.readToken();
      inst.members = CMSSInstInitList::parse(lexer);
      if(lexer.peekToken().type == '}')
         lexer.readToken();
      return inst;
   }

   CMSSInstantiation copy()
   {
      CMSSInstantiation o { _class = _class ? _class.copy() : null, members = members ? members.copy() : null };
      return o;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      bool multiLine = false;

      if(_class) { _class.print(out, indent, o); if(!multiLine) out.Print(" "); }
      if(multiLine)
      {
         out.PrintLn("");
         printIndent(indent, out);
      }
      out.Print("{");
      if(multiLine)
      {
         out.PrintLn("");
         indent++;
      }
      if(members && members[0])
      {
         if(multiLine)
         {
            Iterator<CMSSInstanceInit> it { members };
            while(it.Next())
            {
               CMSSInstanceInit init = it.data;
               printIndent(indent, out);
               init.print(out, indent, o);
               if(init._class == class(CMSSInstInitMember))
                  out.Print(";");
               out.PrintLn("");
            }
         }
         else
         {
            out.Print(" ");
            members.print(out, indent, o);
            out.Print(" ");
         }
      }
      else
         out.Print(" ");
      if(multiLine)
      {
         indent--;
         printIndent(indent, out);
      }
      out.Print("}");
   }


   ~CMSSInstantiation()
   {
      delete _class;

      delete members;
   }
};

public class CMSSMemberInit : CMSSNode
{
public:
   List<CMSSIdentifier> identifiers;
   CMSSInitializer initializer;

   CMSSTokenType assignType;
   Class destType;
   Class expType; //test
   StylesMask stylesMask;
   DataMember dataMember;
   uint offset;

   CMSSMemberInit ::parse(CMSSLexer lexer)
   {
      List<CMSSIdentifier> identifiers = null;
      CMSSInitializer initializer = null;
      CMSSTokenType assignType = '=';
      if(lexer.peekToken().type == identifier)
      {
         int a = lexer.pushAmbiguity();
         while(true)
         {
            CMSSIdentifier id = CMSSIdentifier::parse(lexer);
            if(id)
            {
               if(!identifiers) identifiers = { };
               identifiers.Add(id);
               if(lexer.peekToken().type != '.')
                  break;
               else
                  lexer.readToken();
            }
         }
         if(lexer.peekToken().type == '=' || lexer.nextToken.type == addAssign)
         {
            assignType = lexer.nextToken.type;
            lexer.clearAmbiguity();
            lexer.readToken();
         }
         else
         {
            identifiers.Free();
            delete identifiers;
            lexer.popAmbiguity(a);
         }
      }
      initializer = CMSSInitExp::parse(lexer);
      return (identifiers || initializer) ?
         CMSSMemberInit { identifiers = (void *)identifiers, initializer = initializer, assignType = assignType } : null;
   }

   CMSSNode copy()
   {
      CMSSMemberInit memberInit
      {
         assignType = assignType, initializer = initializer.copy(), identifiers = copyList(identifiers,
            (void *)CMSSIdentifier::copy)
      };
      return memberInit;
   }

   private ExpFlags precompute(Class c, StylesMask targetStylesMask, int * memberID, ECCSSEvaluator evaluator)
   {
      ExpFlags flags = 0;
      String identifierStr = targetStylesMask ? evaluator.evaluatorClass.stringFromMask(targetStylesMask, c) : null;
      //DataMember dataMember = null;
      Class inheritClass = c;
      dataMember = null;
      if(identifiers && identifiers.first)
      {
         for(i : identifiers)
         {
            String s = identifierStr ? PrintString(identifierStr, ".", i.string) : CopyString(i.string);
            delete identifierStr;
            identifierStr = s;
            dataMember = eClass_FindDataMember(inheritClass, i.string, inheritClass.module, null, null);
            if(dataMember)
            {
               if(!dataMember.dataTypeClass)
                  dataMember.dataTypeClass = destType = eSystem_FindClass(dataMember._class.module, dataMember.dataTypeString);
               else
                  destType = dataMember.dataTypeClass;
               inheritClass = dataMember.dataTypeClass;
            }
         }
      }
      else if(memberID)
      {
         //want the member from label's inhereted MGE here
         Class baseClass;
         Array<Class> bases { };
         int mid = 0;
         for(baseClass = c; baseClass; baseClass = baseClass.inheritanceAccess == publicAccess ? baseClass.base : null)
         {
            if(baseClass.isInstanceClass || !baseClass.base)
               break;
            bases.Insert(null, baseClass);
         }

         for(baseClass : bases)
         {
            for(dataMember = baseClass.membersAndProperties.first; dataMember; dataMember = dataMember.next)
            {
               if(dataMember.memberAccess == publicAccess)
               {
                  if(mid == *memberID)
                     break;
                  mid++;
               }
            }
            if(dataMember)
            {
               String s = identifierStr ? PrintString(identifierStr, ".", dataMember.name) : CopyString(dataMember.name);
               delete identifierStr;
               identifierStr = s;

               if(!dataMember.dataTypeClass)
                  dataMember.dataTypeClass = destType = eSystem_FindClass(dataMember._class.module, dataMember.dataTypeString);
               else
                  destType = dataMember.dataTypeClass;
               (*memberID)++;
               break; //?
            }
         }
      }
      if(dataMember)
      {
         eClass_FindDataMemberAndOffset(dataMember._class, dataMember.name, &offset, dataMember._class.module, null, null);
         offset = computeMemberOffset(dataMember, offset);
         this.dataMember = dataMember;

         //PrintLn(dataMember.name);
         //PrintLn(dataMember._class.name);
         stylesMask = identifierStr ? evaluator.evaluatorClass.maskFromString(identifierStr, dataMember._class) : 0;
         if(initializer._class == class(CMSSInitExp))
         {
            CMSSInitExp initExp = (CMSSInitExp)initializer;
            CMSSExpression e = initExp.exp;
            if(e)
            {
               FieldValue val { };
               e.destType = destType;
               if(e._class == class(CMSSExpInstance))
                  ((CMSSExpInstance)e).stylesMask = stylesMask;
               else if(e._class == class(CMSSExpArray))
                  ((CMSSExpArray)e).stylesMask = stylesMask;

               flags = e.compute(val, evaluator, preprocessing);
               if(flags.resolved)
                  initExp.exp = simplifyResolved(val, e);
            }
         }
      }
      expType = inheritClass;//test
      return flags;
   }

   uint computeMemberOffset(DataMember dataMember, uint offset)
   {
      if(dataMember._class.type == normalClass || dataMember._class.type == noHeadClass)
      {
         int add = dataMember._class.base.structSize;
         if( dataMember._class.structAlignment && dataMember._class.base.structSize % dataMember._class.structAlignment) //Don't do mod 0
            add += dataMember._class.structAlignment - dataMember._class.base.structSize % dataMember._class.structAlignment;
         offset += add;
      }
      return offset;
      //destType == class(int64)  .. destType == class(double)
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(identifiers)
      {
         Iterator<CMSSIdentifier> it { identifiers };
         while(it.Next())
         {
            it.data.print(out, indent, o);
            if(identifiers.GetNext(it.pointer))
               out.Print(".");
         }
         out.Print(" ");
         assignType.print(out, indent, o);
         out.Print(" ");
      }
      if(initializer)
         initializer.print(out, indent, o);
   }

   ~CMSSMemberInit()
   {
      delete identifiers;
      delete initializer;
   }
};

public class CMSSMemberInitList : CMSSList<CMSSMemberInit>
{
public:
   //StyleMaskCMSS styleMask;
   Class destType;
   CMSSMemberInitList ::parse(CMSSLexer lexer)
   {
      CMSSMemberInitList list = (CMSSMemberInitList)CMSSList::parse(class(CMSSMemberInitList), lexer, CMSSMemberInit::parse, ',');
      if(lexer.peekToken().type == ';')
         lexer.readToken();
      return list;
   }

   CMSSMemberInit findStyle(StylesMask mask)
   {
      // unbound sheet currently doesn't have mask set...
      //if(mask & stylesMask)
      {
         for(e : this)
         {
            CMSSMemberInit mInit = e;
            Class c = mInit.dataMember ? mInit.dataMember._class : null;
            StylesMask sm = mInit.stylesMask;
            if(mInit.stylesMask & mask)
               return mInit;
            /*if(mInit.identifiers)
            {
               String id = null;
               for(i : mInit.identifiers)
               {
                  // FIXME: hardcoded...
                  if(i.string && !strcmpi(i.string, "opacity"))
                     return mInit;

                  String s = id ? PrintString(id, ".", i.string) : CopyString(i.string);
                  delete id;
                  id = s;
               }

               //if(stringFromMask(sm, c) || maskFromString(id, c)) return mInit;
               if(c == class(ShapeStyle) || c == class(Fill) || c == class(Stroke))
                  if(sm & mask)
                     return mInit;
               else if(c == class(TextStyle) || c == class(GEFont) || c == class(Outline))
                  if(sm & mask)
                     return mInit;

               else if(c == class(ImageStyle) || c == class(Image))
                  if(sm & mask)
                     return mInit;

               else if(c == class(GraphicalStyle) || c == class(GeoSymbolizer))
                  if(sm & mask)
                     return mInit;
               else if(c == class(CMSSLabel) || c == class(Marker))
                  if(sm & mask)
                     return mInit;
            }*/
         }
      }
      return null;
   }

   void removeStyle(StylesMask mask)
   {
      Iterator<CMSSMemberInit> it { this };
      while(it.Next())
      {
         CMSSMemberInit mInit = it.data;
         //CMSSMemberInit mInit = e;
         Class c = mInit.dataMember ? mInit.dataMember._class : null;
         StylesMask sm = mInit.stylesMask;
         if(mInit.stylesMask & mask)
         {
            it.Remove();
            delete mInit;
         }
      }
   }

   bool addStyle(StylesMask mask, FieldValue value, Class c, ECCSSEvaluator evaluator)
   {
      bool result = false;
      CMSSInitExp initExp { exp = CMSSExpConstant { constant = value } };
      CMSSMemberInit mInitSub { initializer = initExp, assignType = equal };
      CMSSExpInstance inst = null; //{ instance = { members = { } } }
      CMSSInitExp initExpTop = null;//{ exp = inst };
      CMSSMemberInit mInitTop = null;//{ initializer = initExpTop, assignType = equal }
      CMSSInstInitMember instInitMember { members = { [ mInitSub ] } };

      char * identifierStr = mask ? evaluator.evaluatorClass.stringFromMask(mask, c) : null;

      String prefix = null;
      if(identifierStr && identifierStr[0])
      {
         int size;
         char * pch = strchr(identifierStr, '.');
         size = pch ? pch - identifierStr + 1 : 0;
         if(size)
         {
            prefix = new char[size];
            strncpy(prefix, identifierStr, size - 1);
            prefix[size - 1] = '\0';
         }
      }

      if(identifierStr)
      {
         mInitSub.identifiers = { };
         mInitSub.identifiers.Add(CMSSIdentifier { string = CopyString(identifierStr) });
      }

      // NOTE no instance necessary for GraphicalStyle
      if(c && c.name && !strcmp(c.name, "GraphicalStyle")) this.Add(mInitSub);
      else // NOTE we want to search for existing instance here
      {
         if(this[0] && prefix)
         {
            for(m : this)
            {
               CMSSMemberInit mm = m;
               if(mm.identifiers && !strcmp(mm.identifiers[0].string, prefix))
               {  mInitTop = mm; inst = (CMSSExpInstance)((CMSSInitExp)mInitTop).exp; break; }
            }
            inst.instance.members.Add(instInitMember);
         }
         if(!mInitTop)
         {
            inst = { instance = { members = { } } };
            inst.instance.members.Add(instInitMember);
            initExpTop = { exp = inst };
            mInitTop = { initializer = initExpTop, assignType = equal };
            if(prefix)
            {
               mInitTop.identifiers = { };
               mInitTop.identifiers.Add(CMSSIdentifier { string = CopyString(prefix) } );
               delete prefix;
            }
         }

         this.Add(mInitTop);
      }
      return result;
   }
}

public class CMSSInitializer : CMSSNode
{
public:
   CMSSInitializer ::parse(CMSSLexer lexer)
   {
      if(lexer.peekToken().type == '{')
      {
         CMSSInitList init;
         lexer.readToken();
         init = CMSSInitList::parse(lexer);
         if(lexer.peekToken().type == '}') lexer.readToken();
         return init;
      }
      else
         return CMSSInitExp::parse(lexer);
   }
};

public class CMSSInitExp : CMSSInitializer
{
public:
   CMSSExpression exp;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(exp)
         exp.print(out, indent, o);
   }

   CMSSNode copy()
   {
      CMSSInitExp ie { exp = exp.copy() };
      return ie;
   }

   CMSSInitExp ::parse(CMSSLexer lexer)
   {
      CMSSExpression exp = CMSSExpression::parse(lexer);
      return exp ? CMSSInitExp { exp = exp } : null;
   }

   ~CMSSInitExp()
   {
      delete exp;
   }
};

public class CMSSInitList : CMSSInitializer
{
public:
   CMSSList<CMSSInitializer> list;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(list)
      {
         out.Print("{ ");
         list.print(out, indent, o);
         out.Print(" }");
      }
   }

   CMSSInitList ::parse(CMSSLexer lexer)
   {
      CMSSList<CMSSInitializer> list = (CMSSList<CMSSInitializer>)CMSSList::parse(class(CMSSList<CMSSInitializer>), lexer, CMSSInitializer::parse, ',');
      return list ? { list = (void *)list } : null;
   }

   ~CMSSInitList()
   {
      list.Free();
      delete list;
   }
};

public class CMSSSpecifier : CMSSNode
{
public:
};

public class CMSSSpecsList : CMSSList<CMSSSpecifier>
{
public:
   void printSep(File out)
   {
      out.Print(" ");
   }

   CMSSSpecsList ::parse(bool identifiers, CMSSLexer lexer)
   {
      CMSSSpecsList specs = null;
      bool gotSpec = false;
      while(true)
      {
         lexer.peekToken();
         if(identifiers && lexer.nextToken.type == identifier)
         {
            bool isType = false;
            if(isType || !gotSpec)
            {
               lexer.readToken();
               if(!specs) specs = { };
               specs.Add(CMSSSpecName { name = CopyString(lexer.token.text) });
               gotSpec = true;
            }
            else
               break;
         }
         else
            break;
      }
      return specs;
   }
}

public class CMSSSpecName : CMSSSpecifier
{
public:
   String name;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      if(name) out.Print(name);
   }

   CMSSSpecName copy()
   {
      CMSSSpecName spec { name = CopyString(name) };
      return spec;
   }

   ~CMSSSpecName()
   {
      delete name;
   }
}

struct OpTable
{
public:
   // binary arithmetic
   bool (* Add)(FieldValue, const FieldValue, const FieldValue);
   bool (* Sub)(FieldValue, const FieldValue, const FieldValue);
   bool (* Mul)(FieldValue, const FieldValue, const FieldValue);
   bool (* Div)(FieldValue, const FieldValue, const FieldValue);
   bool (* DivInt)(FieldValue, const FieldValue, const FieldValue);
   bool (* Mod)(FieldValue, const FieldValue, const FieldValue);

   // unary arithmetic
   bool (* Neg)(FieldValue, const FieldValue);

   // unary arithmetic increment and decrement
   //bool (* Inc)(FieldValue, FieldValue);
   //bool (* Dec)(FieldValue, FieldValue);

   // binary arithmetic assignment
   /*bool (* Asign)(FieldValue, FieldValue, FieldValue);
   bool (* AddAsign)(FieldValue, FieldValue, FieldValue);
   bool (* SubAsign)(FieldValue, FieldValue, FieldValue);
   bool (* MulAsign)(FieldValue, FieldValue, FieldValue);
   bool (* DivAsign)(FieldValue, FieldValue, FieldValue);
   bool (* ModAsign)(FieldValue, FieldValue, FieldValue); */

   // binary bitwise
   /*bool (* BitAnd)(FieldValue, FieldValue, FieldValue);
   bool (* BitOr)(FieldValue, FieldValue, FieldValue);
   bool (* BitXor)(FieldValue, FieldValue, FieldValue);
   bool (* LShift)(FieldValue, FieldValue, FieldValue);
   bool (* RShift)(FieldValue, FieldValue, FieldValue);
   bool (* BitNot)(FieldValue, FieldValue);   */

   // binary bitwise assignment
  /* bool (* AndAsign)(FieldValue, FieldValue, FieldValue);
   bool (* OrAsign)(FieldValue, FieldValue, FieldValue);
   bool (* XorAsign)(FieldValue, FieldValue, FieldValue);
   bool (* LShiftAsign)(FieldValue, FieldValue, FieldValue);
   bool (* RShiftAsign)(FieldValue, FieldValue, FieldValue);*/

   // unary logical negation
   bool (* Not)(FieldValue, const FieldValue);

   // binary logical equality
   bool (* Equ)(FieldValue, const FieldValue, const FieldValue);
   bool (* Nqu)(FieldValue, const FieldValue, const FieldValue);

   // binary logical
   bool (* And)(FieldValue, const FieldValue, const FieldValue);
   bool (* Or)(FieldValue, const FieldValue, const FieldValue);

   // binary logical relational
   bool (* Grt)(FieldValue, const FieldValue, const FieldValue);
   bool (* Sma)(FieldValue, const FieldValue, const FieldValue);
   bool (* GrtEqu)(FieldValue, const FieldValue, const FieldValue);
   bool (* SmaEqu)(FieldValue, const FieldValue, const FieldValue);

   // text specific
   bool (* StrCnt)(FieldValue, const FieldValue, const FieldValue);
   bool (* StrSrt)(FieldValue, const FieldValue, const FieldValue);
   bool (* StrEnd)(FieldValue, const FieldValue, const FieldValue);
   bool (* StrNotCnt)(FieldValue, const FieldValue, const FieldValue);
   bool (* StrNotSrt)(FieldValue, const FieldValue, const FieldValue);
   bool (* StrNotEnd)(FieldValue, const FieldValue, const FieldValue);
};


// binary arithmetic
OPERATOR_NUMERIC(BINARY, +, Add) //see textAdd for concat
OPERATOR_NUMERIC(BINARY, -, Sub)
OPERATOR_NUMERIC(BINARY, *, Mul)
OPERATOR_INT(BINARY_DIVIDEINT, /, Div)
OPERATOR_INT(BINARY_DIVIDEINT, /, DivInt)
OPERATOR_REAL(BINARY, /, Div)
OPERATOR_INT(BINARY_DIVIDEINT, %, Mod)

// unary arithmetic
OPERATOR_NUMERIC(UNARY, -, Neg)

// unary arithmetic increment and decrement
//OPERATOR_NUMERIC(UNARY, ++, Inc)   //increment of member 'i' in read-only object
//OPERATOR_NUMERIC(UNARY, --, Dec)


// binary arithmetic assignment
/*OPERATOR_ALL(BINARY, =, Asign)
OPERATOR_NUMERIC(BINARY, +=, AddAsign)
OPERATOR_NUMERIC(BINARY, -=, SubAsign)
OPERATOR_NUMERIC(BINARY, *=, MulAsign)
OPERATOR_INT(BINARY_DIVIDEINT, /=, DivAsign)
OPERATOR_REAL(BINARY_DIVIDEREAL, /=, DivAsign)
OPERATOR_INT(BINARY_DIVIDEINT, %=, ModAsign) */

// binary bitwise
/*OPERATOR_INT(BINARY, &, BitAnd)
OPERATOR_INT(BINARY, |, BitOr)
OPERATOR_INT(BINARY, ^, BitXor)
OPERATOR_INT(BINARY, <<, LShift)
OPERATOR_INT(BINARY, >>, RShift)*/

// unary bitwise
//OPERATOR_INT(UNARY, ~, BitNot)

// binary bitwise assignment
/*
OPERATOR_INT(BINARY, &=, AndAsign)
OPERATOR_INT(BINARY, |=, OrAsign)
OPERATOR_INT(BINARY, ^=, XorAsign)
OPERATOR_INT(BINARY, <<=, LShiftAsign)
OPERATOR_INT(BINARY, >>=, RShiftAsign)   */

// unary logical negation
OPERATOR_ALL(UNARY_LOGICAL, !, Not) //OPERATOR_ALL


// binary logical equality
OPERATOR_NUMERIC(BINARY_LOGICAL, ==, Equ)
OPERATOR_NUMERIC(BINARY_LOGICAL, !=, Nqu)

static bool textEqu(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.i = op1.s && op2.s ? !strcmpi(op1.s, op2.s) : !op1.s && !op2.s ? 1 : 0;
   return true;
}

static bool textNqu(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.i = op1.s && op2.s ? strcmpi(op1.s, op2.s) : !op1.s && !op2.s ? 0 : 1;
   return true;
}

// binary logical
OPERATOR_ALL(BINARY_LOGICAL, &&, And)
OPERATOR_ALL(BINARY_LOGICAL, ||, Or)

// binary logical relational
OPERATOR_NUMERIC(BINARY_LOGICAL, >, Grt)
OPERATOR_NUMERIC(BINARY_LOGICAL, <, Sma)
OPERATOR_NUMERIC(BINARY_LOGICAL, >=, GrtEqu)
OPERATOR_NUMERIC(BINARY_LOGICAL, <=, SmaEqu)

// text conditions
static bool textStrCnt(FieldValue result, const FieldValue val1, const FieldValue val2)
{

   result.i = SearchString(val1.s, 0, val2.s, false, false) != null;
   result.type = { type = integer };
   return true;
}

static bool textStrSrt(FieldValue result, const FieldValue val1, const FieldValue val2)
{
   int lenStr = strlen(val1.s), lenSub = strlen(val2.s);
   result.i = lenSub > lenStr ? 0 : !strncmp(val1.s, val2.s, lenSub);
   result.type = { type = integer };
   return true;
}

static bool textStrEnd(FieldValue result, const FieldValue val1, const FieldValue val2)
{
   int lenStr = strlen(val1.s), lenSub = strlen(val2.s);
   result.i = lenSub > lenStr ? 0 : !strcmp(val1.s + (lenStr-lenSub), val2.s);
   result.type = { type = integer };
   return true;
}

static bool textStrNotCnt(FieldValue result, const FieldValue val1, const FieldValue val2)
{

   result.i = !SearchString(val1.s, 0, val2.s, false, false);
   result.type = { type = integer };
   return true;
}

static bool textStrNotSrt(FieldValue result, const FieldValue val1, const FieldValue val2)
{
   int lenStr = strlen(val1.s), lenSub = strlen(val2.s);
   result.i = lenSub > lenStr ? 0 : strncmp(val1.s, val2.s, lenSub);
   result.type = { type = integer };
   return true;
}

static bool textStrNotEnd(FieldValue result, const FieldValue val1, const FieldValue val2)
{
   int lenStr = strlen(val1.s), lenSub = strlen(val2.s);
   result.i = lenSub > lenStr ? 0 : strcmp(val1.s + (lenStr-lenSub), val2.s);
   result.type = { type = integer };
   return true;
}

static bool textAdd(FieldValue result, const FieldValue val1, const FieldValue val2)
{
   result.s = PrintString(val1.s, val2.s);
   result.type = { type = text };
   return true;
}

static bool textGrt(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.i = strcmp(op1.s, op2.s) > 0;
   val.type = { type = integer };
   return true;
}

static bool textSma(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.i = strcmp(op1.s, op2.s) < 0;
   val.type = { type = integer };
   return true;
}

static bool textGrtEqu(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.i = strcmp(op1.s, op2.s) >= 0;
   val.type = { type = integer };
   return true;
}

static bool textSmaEqu(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.i = strcmp(op1.s, op2.s) <= 0;
   val.type = { type = integer };
   return true;
}

#include <float.h>

static bool realDivInt(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.r = (int)(op1.r / op2.r + FLT_EPSILON);
   val.type = { type = real };
   return true;
}

static bool realMod(FieldValue val, const FieldValue op1, const FieldValue op2)
{
   val.r = fmod(op1.r, op2.r);
   val.type = { type = real };
   return true;
}

public void convertFieldValue(const FieldValue src, FieldType type, FieldValue dest)
{
   if(src.type.type == text)
   {
      if(type == real)
      {
         dest.r = strtod(src.s, null);
         dest.type = { real };
      }
      else if(type == integer)
      {
         dest.i = strtoll(src.s, null, 0);
         dest.type = { integer };
      }
   }
   else if(src.type.type == integer)
   {
      if(type == real)
      {
         dest.r = (double)src.i;
         dest.type = { real };
      }
      else if(type == text)
      {
         dest.s = PrintString(src.s);
         dest.type = { text };
      }
   }
   else if(src.type.type == real)
   {
      if(type == integer)
      {
         dest.i = (int64)src.r;
         dest.type = { integer };
      }
      else if(type == text)
      {
         dest.s = PrintString(src.r);
         dest.type = { text, mustFree = true };
      }
   }
   else
      dest = { type = { nil } };
}
