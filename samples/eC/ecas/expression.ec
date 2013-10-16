public import "ecere"
import "misc"

#include <stdio.h>

public:

enum CASCharFlag {letter, end, white, number, op};

class CASCharFlags : CharFlags {
   CASCharFlags() {
      flags[0] = (byte)CASCharFlag::end;
      Set("\t\n\v\f\r ", CASCharFlag::white);
      Set("0123456789.", CASCharFlag::number);
      Set("!%&()*+,-/:;<=>?@[\\]^{|}~", CASCharFlag::op);
   }
};

CASCharFlags cascharflags {};

enum ExpressionType {null=0, i, f, c, v, openfunction, function, openparenthesis, parenthesis, prefix, postfix, binary};
   //i means integer
   //f means floating point
   //c means constant
   //v means variable

enum ExpressionClass {nullary=0, prefix, postfix, binary, vallary, nary};
//I define a vallary operator as one that binds a single expression on both sides (e.g. (), [], {}, "")
//An nary operator is one that binds an array of expressions on both sides (e.g. sum(3,4,5))

ExpressionClass expression_class[ExpressionType] = {
   nullary, nullary, nullary, nullary, nullary, prefix, nary, prefix, vallary, prefix, postfix, binary
};
//function and parenthesis are weird classes.  They are considered nullary, but they do contain data:
//  function's arguments are in the Array<Expression> arg
//  parenthesis's argument is in b, just like the prefix it was before

enum PrefixOperator {root=0, positive, negative};
int prefix_op_order[PrefixOperator] = {
   0, 4,4
};
const char *prefix_op_string[PrefixOperator] = {
   "root", "+", "-"
};

enum PostfixOperator {factorial=0};
int postfix_op_order[PostfixOperator] = {
   6
};
const char *postfix_op_string[PostfixOperator] = {
   "!"
};

//A lot of CAS operations may weed out operators like subtract, but it is included to make it possible to maniuplate the expression for readability, etc.
enum BinaryOperator {add, subtract, multiply, divide, power, equals, comma};
int binary_op_order[BinaryOperator] = {
   3,3, 4,4, 5, 2, 1
};
const char *binary_op_string[BinaryOperator] = {
   "+", "-", "*", "/", "^", "=", ","
};

enum ParenthesisType {parenthesis, brackets, braces};
const char *parenthesis_type_string[ParenthesisType] = {
   "()", "[]", "{}"
};

enum CASFunction {sum, product, polynomial, exp, ln, sin, cos, tan, arcsin, arccos, arctan};

const char *function_string[CASFunction] = {
   "sum", "product", "polynomial", "exp", "ln", "sin", "cos", "tan", "arcsin", "arccos", "arctan"
};

class CASFunctionDefinition {
   virtual bool Expression::Sanitize(void) {
      return true;
   }
   virtual void Expression::Simplify(void);
};

bool Expression::SanitizeSingleArgument(void) {
   if (arg.size != 1)
      return false;
   return true;
}

class FunctionList : Dictionary {
   Array<CASFunctionDefinition> f {};
   FunctionList() {
      CASFunction i;
      for (i=0; i<CASFunction::enumSize; i++)
         array.Add(StrDup(function_string[i]));
      f.size = CASFunction::enumSize;
      f[CASFunction::sum] = {

      };
      f[CASFunction::product] = {

      };
      f[CASFunction::polynomial] = {

      };
      f[CASFunction::exp] = {
         bool Expression::Sanitize()
         {
            Expression right;
            if (arg.size != 1)
               return false;
            right = arg[0];
            delete arg;
            type = binary;
            binary.op = power;
            a = {type=c, mom=this, c=e};
            b = right;
            return true;
         }
      };
      f[CASFunction::ln] = {
         Sanitize = SanitizeSingleArgument;

      };
      f[CASFunction::sin] = {
         Sanitize = SanitizeSingleArgument;

      };
      f[CASFunction::cos] = {
         Sanitize = SanitizeSingleArgument;

      };
      f[CASFunction::tan] = {
         Sanitize = SanitizeSingleArgument;

      };
      f[CASFunction::arcsin] = {
         Sanitize = SanitizeSingleArgument;

      };
      f[CASFunction::arccos] = {
         Sanitize = SanitizeSingleArgument;

      };
      f[CASFunction::arctan] = {
         Sanitize = SanitizeSingleArgument;

      };
   }
   //these functions check to make sure the input is a function of correct range before executing
   bool Sanitize(Expression expr) {
      bool ret = false;
      if (expr.type==function && expr.function.func<f.size)
         ret = f[expr.function.func].Sanitize(expr);
      return ret;
   }
   void Simplify(Expression expr) {
      if (expr.type==function && expr.function.func<f.size)
         f[expr.function.func].Simplify(expr);
   }
};

class CASDictionary : struct {
   Dictionary v {};
   FunctionList f {};
};

enum CASConstant {i, e, pi};

const char *constant_string[CASConstant] = {
   "𝑖", "ℯ", "π"
};

class ExprChildWalker {
public:
   Expression expr;
   Expression user0, user1, user2;

   void Go(void) {
      switch (expr.ExprClass()) {
         case prefix:
         case vallary:
            On(&expr.b);
            break;
         case postfix:
            On(&expr.a);
            break;
         case binary:
            if (On(&expr.a))
               On(&expr.b);
            break;
         case nary:
            for (iter:expr.arg) {
               if (!On(&iter))
                  break;
            }
            break;
      }
   }
   //return false to end iteration
   virtual bool On(Expression *e);
};

class Expression : struct {
public:
   ExpressionType type;
   Expression mom; //easier to type than "parent" :)

   //tags
   bool constant:1, approx:1;
   void ClearTags(void) {
      constant = false;
      approx = false;
   }

   union {
      long long i;
      long double f;
      CASConstant c;
      uint v;
      struct {
         CASFunction func;
      } function;
      struct {
         ParenthesisType type;
      } parenthesis; //also used for openparenthesis
      struct {
         PrefixOperator op;
      } prefix;
      struct {
         PostfixOperator op;
      } postfix;
      struct {
         BinaryOperator op;
      } binary;
   };
   union {
      struct {
         Expression a; //binary left child or postfix child
         Expression b; //binary right child, prefix child, or vallary child
      };
      Array<Expression> arg; //only for nary operators (e.g. functions)
   };

   void DebugPrint(File out, CASDictionary dict, uint spacelevel, Expression correctMom) {
      uint d = spacelevel;
      char tagstr[16];
      while (d--)
         out.Putc(' ');
      if (this==null) {
         out.Printf("null pointer\n");
         return;
      }
      if (mom != correctMom)
         out.Printf("Incorrectly parented to %p instead of %p ", mom, correctMom);
      memset(tagstr, '-', 2);
      tagstr[2] = 0;
      if (constant)
         tagstr[0] = 'c';
      if (approx)
         tagstr[1] = 'a';
      out.Printf("%s  ", tagstr);
      switch (type) {
         case null:
            out.Printf("nothing\n");
            break;
         case i:
            //out.PrintLn(i);
            out.Printf("%lld\n", i);
            break;
         case f:
            //out.PrintLn(f);
            out.Printf("%.15Lg\n", (long double)f);
            break;
         case c:
            out.Printf("%s (constant)\n", c<CASConstant::enumSize ? constant_string[c] : "Invalid constant");
            break;
         case v:
            out.Printf("%s\n", dict.v.name(v));
            break;
         case openfunction:
            out.Printf("%s(\n", dict.f.name(function.func));
            b.DebugPrint(out, dict, spacelevel+2, this);
            break;
         case function:
            out.Printf("%s()\n", dict.f.name(function.func));
            for (iter:arg)
               iter.DebugPrint(out, dict,spacelevel+2, this);
            break;
         case openparenthesis:
            out.Printf("%c\n", OpString()[0]);
            b.DebugPrint(out, dict, spacelevel+2, this);
            break;
         case parenthesis:
            out.Printf("%s\n", OpString());
            b.DebugPrint(out, dict, spacelevel+2, this);
            break;
         case prefix:
            out.Printf("%s\n", OpString());
            b.DebugPrint(out, dict, spacelevel+2, this);
            break;
         case postfix:
            out.Printf("%s\n", OpString());
            a.DebugPrint(out, dict, spacelevel+2, this);
            break;
         case binary:
            out.Printf("%s\n", OpString());
            a.DebugPrint(out, dict, spacelevel+2, this);
            b.DebugPrint(out, dict, spacelevel+2, this);
            break;
      }
   }

   void Free(void) {
      ExprChildWalker w {this;
         bool On(Expression *e) {
            e->Clear();
            if (*e)
               e->mom = null;
            delete *e;
            return true;
         }
      };
      w.Go();
      if (ExprClass()==nary)
         delete arg;
      delete w;
   }
   void Clear(void) { //keeps parent the same
      if (this) {
         Free();
         type = null;
      }
   }
   //sort of like delete this, but does not affect anything else but this block
   //Note:  Make sure that arg array is taken care of if this is an nary
   void Delete(void) {
      if (this) {
         type = null;
         mom = null;
         delete this;
      }
   }
   ~Expression() {
      if (this) {
         Elope(null);
         Free();
      }
   }
   //Copy() makes a copy of this Expression that makes no references to this expression
   Expression Copy(Expression newMom) {
      Expression ret {mom=newMom};
      if (!this)
         return ret;
      memcpy(ret, this, sizeof(class Expression));
      ret.mom = newMom;
      switch (ExprClass()) {
         case prefix:
         case vallary:
            ret.b = b.Copy(ret);
            break;
         case postfix:
            ret.a = a.Copy(ret);
            break;
         case binary:
            ret.a = a.Copy(ret);
            ret.b = b.Copy(ret);
            break;
         case nary: {
            uint i,e;
            e = arg.size;
            ret.arg = {size=e};
            for (i=0; i<e; i++)
               ret.arg[i] = arg[i].Copy(ret);
         }
            break;
      }
      return ret;
   }

   //collect terms in this expression separated by the binary operator op
   //e.g. separate x^2+3x+1 by plus into [x^2, 3x, 1]
   //Will separate (x^2+3x+1)/2 by plus into [(x^2+3x+1)/2]
   //If newMom is not null, all binary operator nodes involved in the array will be freed, and each node will be parented to newMom
   void CollectTerms(BinaryOperator op, Array<Expression> out, Expression newMom) {
      if (!this)
         return;
      if (type==binary && binary.op==op) {
         a.CollectTerms(op, out, newMom);
         b.CollectTerms(op, out, newMom);
         if (newMom) {
            a=null;
            b=null;
            delete this;
         }
      } else {
         if (newMom)
            mom = newMom;
         out.Add(this);
      }
   }
   //only reparents the top level
   void ReparentChildren(void) {
      ExprChildWalker w {this;
         bool On(Expression *e)
         {
            e->mom = expr;
            return true;
         }
      };
      w.Go();
      delete w;
   }
   //relinks the parent to this child
   //Old is the former pointer to the child
   void Rechild(Expression old) {
      SwapChild(mom, old, this);
   }
   //disconnects this from parent without deleting it, and sets in its place newChild
   void Elope(Expression newChild) {
      SwapChild(mom, this, newChild);
      if (newChild)
         newChild.mom = mom;
   }
   //disconnects this expression from its parent and relinks its children to the parent
   //Currently, this only works with unary (prefix/postfix/vallary) operators
   void Unlink(void) {
      if (!this) {
         fprintf(stderr, "BUG:  Attempted to unlink null node; ignoring.\n");
         return;
      }
      if (!mom) {
         fprintf(stderr, "BUG:  Attempted to unlink root node; ignoring.\n");
         return;
      }
      switch (ExprClass()) {
         case prefix:
         case vallary:
            Elope(b);
            Delete();
            break;
         case postfix:
            Elope(a);
            Delete();
            break;
         default:
            fprintf(stderr, "BUG:  Attempted to call Unlink on non-unary node.\n");
      }
   }

   //Note that FromString likes to toy with the string, but anything done to the string will be undone.
   bool FromString(char *str, CASDictionary dictionary) {
      ExpressionFromString(this, str, dictionary);
      return Sanitize(this, dictionary);
   }
   char *ToString(void) {

   }
   const char *OpString(void) {
      if (type==prefix && prefix.op<PrefixOperator::enumSize)
         return prefix_op_string[prefix.op];
      else if (type==postfix && postfix.op<PostfixOperator::enumSize)
         return postfix_op_string[postfix.op];
      else if (type==binary && binary.op<BinaryOperator::enumSize)
         return binary_op_string[binary.op];
      else if ((type==openparenthesis || type==parenthesis) && parenthesis.type<ParenthesisType::enumSize)
         return parenthesis_type_string[parenthesis.type];
      else
         return "??";
   }
   int OpOrder(void) {
      if (type==binary && binary.op<BinaryOperator::enumSize)
         return binary_op_order[binary.op];
      else if (type==prefix && prefix.op<PrefixOperator::enumSize)
         return prefix_op_order[prefix.op];
      else if (type==postfix && postfix.op<PostfixOperator::enumSize)
         return postfix_op_order[postfix.op];
      else if (type==openfunction) {
         if (b && b.type==parenthesis && b.parenthesis.type==parenthesis)
            return 1000; //arbitrary number larger than any other order
         else
            return binary_op_order[power];
      }
      else if (type==openparenthesis)
         return 0; //yes, this should be the lowest, not highest, operator
      else
         return -1; //error
   }
   ExpressionClass ExprClass(void) {
      if (type<ExpressionType::enumSize)
         return expression_class[type];
      else
         return nullary;
   }
   void Simplify(CASDictionary dict) {

   }
};

void SwapChild(Expression mom, Expression oldChild, Expression newChild) {
   ExprChildWalker w;
   if (!mom)
      return;
   w = {mom, user0=oldChild, user1=newChild;
      bool On(Expression *e) {
         if (*e==user0) {
            *e = user1;
            return false;
         }
         return true;
      }
   };
   w.Go();
   delete w;
}

class ExpressionTree : struct {
public:
   CASDictionary dict;
   Expression root {type=prefix, prefix.op=root};
   Expression p; //pointer to most recently added token
   File err {output=stderr};
   bool closeerrfiles;

   p = root;

   ~ExpressionTree() {
      if (!closeerrfiles) {
         err.input = null;
         err.output = null;
      }
   }

   // e must be the string terminator, and the string must be zero-terminated as well
   void PushInteger(const char *s, const char *e) {
      ReadULLError rerror;
      Expression var {type=i};
      unsigned long long n = ReadULL_Valid(s, e, NB_Dec, &rerror);
      var.i = (long long)n;
      if (rerror==overflow || n>=(((unsigned long long)-1)>>1)+1)
         err.Printf("Number %s too big; using %lld\n", s, var.i);
      push(var, false);
   }
   void PushFloat(const char *s) {
      Expression var {type=f};
      long double n = (long double)atof(s); //TODO:  Use something that won't truncate the result
      var.f = n;
      push(var, false);
   }
   void PushConstant(CASConstant con) {
      Expression var {type=c, c=con};
      push(var, false);
   }
   void PushVariable(const char *s) {
      Expression var {type=v, v=dict.v.lookup(s, true)};
      push(var, false);
   }
   void PushFunction(CASFunction f) {
      Expression var {type=openfunction, function.func=f};
      push(var, false);
   }
   void PushOperator(const char *s) {
      Expression op {type=binary};
      Expression w;
      ExpressionClass pc;
      int order;
      if (s[1]==0) { //single-character operator
         switch (*s) {
            case '+':
            case '-':
               pc = p.ExprClass();
               if (pc==prefix || pc==binary) {
                  op.type = prefix;
                  op.prefix.op = *s=='+' ? positive : negative;
               } else {
                  op.binary.op = *s=='+' ? add : subtract;
               }
               break;
            case '*':
               op.binary.op = multiply;
               break;
            case '/':
               op.binary.op = divide;
               break;
            case '^':
               op.binary.op = power;
               break;
            case '=':
               op.binary.op = equals;
               break;
            case ',':
               op.binary.op = comma;
               break;
            case '(': //we will push a "prefix" openparenthesis like any other prefix op
               op.type = openparenthesis;
               op.parenthesis.type = parenthesis;
               break;
            case '[':
               op.type = openparenthesis;
               op.parenthesis.type = brackets;
               break;
            case '{':
               op.type = openparenthesis;
               op.parenthesis.type = braces;
               break;
            case ')': //we will close the soonest openparenthesis and continue from there
            case ']':
            case '}': {
               ParenthesisType type = (*s==')' ? parenthesis : *s==']' ? brackets : braces);
               delete op;
               w = p;
               for (;;) {
                  if (w.type==openfunction)
                     closeFunction(w);
                  else if (w.type==openparenthesis) {
                     if (w.parenthesis.type==type) {
                        p = w;
                        p.type = parenthesis;
                        return;
                     } else
                        err.Printf("End %c appeared after start %c; disregarding.\n", *s, w.OpString()[1]);
                  } else if (!w.mom || (w.type==prefix && w.prefix.op==root)) {
                     err.Printf("End parenthesis missing beginning parenthesis; ignoring.\n");
                     return;
                  }
                  w = w.mom;
               }
               break;
            }
            case '!':
               op.type = postfix;
               op.postfix.op = factorial;
               break;
            default:
               op.type = null;
         }
      } else
         op.type = null;
      if (op.type==null) {
         err.Printf("Operator '%s' unrecognized; ignoring.\n", s);
         delete op;
         return;
      }
      push(op, false);
   }
private:
   void push(Expression expr, bool implicit) {
      ExpressionClass c = expr.ExprClass();
      ExpressionClass pc = p.ExprClass();
      if (c==nullary || c==prefix) {
         if (pc==nullary || pc==postfix || pc==vallary || pc==nary)
            push({type=binary, binary.op=multiply}, true); //implicit multiply (e.g. 7a -> 7*a)
         p.b = expr;
         expr.mom = p;
         p = expr;
      } else {
         int order;
         Expression w;
         if (pc==prefix || pc==binary) {
            err.Printf("%s operator %s following operator %s; ignoring.\n", c==postfix ? "Postfix" : "Binary", expr.OpString(), p.OpString());
            delete expr;
            return;
         }
         order = expr.OpOrder();
         if (order<0) {
            err.Printf("BUG:  %s operator has invalid order; ignoring.\n", c==postfix ? "Postfix" : "Binary");
            delete expr;
            return;
         }
         //An AB operator is defined as a postfix or binary operator
         //For any binary operators that associate right-to-left, increment order so they can overtake sooner
         //Believe it or not, equals associates right-to-left (at least in C it does)
         if (expr.type==binary && (expr.binary.op==power || expr.binary.op==equals))
            order++;
         //We will walk up the tree with this AB operator until we find a w such that w.mom.order < op.order
         //If we reach the root node, that's a bug because the root node should have an order of 0
         w = p;
         for (;;) {
            int worder;
            if (!w.mom) {
               err.Printf("BUG:  Expression tree ended too soon while handling binary operator; ignoring.\n");
               delete expr;
               return;
            }
            worder = w.mom.OpOrder();
            if (worder<0) {
               err.Printf("BUG:  Bad parent encountered while handling postfix/binary operator.\n");
               delete expr;
               return;
            }
            if (implicit && expr.type==binary && expr.binary.op==multiply && w.mom.type==openfunction) {
               //this makes it so sin 3x will be sin(3x), while sin 3*x will be (sin 3)*x
               if (worder == binary_op_order[power])
                  break;
            } else if (order > worder)
               break;
            w = w.mom;
            if (w.type==openfunction)
               closeFunction(w);
         }
         //We will take w, make it op's left child, and put op where w was.
         expr.a = w;
         expr.mom = w.mom;
         w.mom = expr;
         expr.mom.b = expr;
         p = expr;
      }
   }
   //closes f (should only be called if f is an openfunction)
   void closeFunction(Expression f) {
      Expression child = f.b;
      if (child && child.type==parenthesis && child.parenthesis.type==parenthesis) {
         //remove the first set of parenthesis
         //if more sets of parenthesis surround this, the user really meant to have them there
         Expression tmp = child.b;
         child.b = null;
         delete f.b;
         child = f.b = tmp;
      }
      //Turn this from an openfunction into a function
      f.b = null;
      f.Free();
      f.type = function;
      f.arg = {};
         //note that f.function.func persists because Free() did not clear that
      //Collect all comma-delimited arguments into the arg array
      child.CollectTerms(comma, f.arg, f);
   }
   void finalize(void) {
      Expression w = p;
      while (w) {
         if (w.type==openfunction)
            closeFunction(w);
         w = w.mom;
      }
   }
};

void ExpressionFromString(Expression expr, char *str, CASDictionary dictionary) {
   ExpressionTree tree {dictionary};
   char *s, *p, *e; //token start and end
   CASCharFlag flag;
   CASCharFlags cf = cascharflags;
   char borrow;

   expr.Free();

   s = str;
   e = s;
   while (*s) {
      for (;;) //for loop is used so multiple character types that merge into one token can be implemented in the future
      { //grab the next token
         byte f = cf.flags[(byte)*e++];
         while (cf.flags[(byte)*e]==f) e++;
         flag = (CASCharFlag)f;
         break;
      }
      p = s;
      switch (flag) {
         case letter: {
            uint f;
            uint i;
            int charlen;
            char borrow2;
            borrow = *e;
            *e = 0;
            f = dictionary.f.lookup(s, false);
            if (f != (uint)-1)
               tree.PushFunction((CASFunction)f);
            else do {
               unsigned char c;
               uint con = (uint)-1;
               UTF8GetChar(p, &charlen);
               p += charlen;
               borrow2 = *p;
               *p = 0;
               for (i=0; i<CASConstant::enumSize; i++) {
                  if (!strcmp(s, constant_string[(CASConstant)i])) {
                     con = i;
                     break;
                  }
               }
               if (con != (uint)-1)
                  tree.PushConstant((CASConstant)con);
               else
                  tree.PushVariable(s);
               *p = borrow2;
               s = p;
            } while (s<e);
            *e = borrow;
         }
            break;
         case number:
            borrow = *e;
            *e = 0;
            if (strchr(s, '.'))
               tree.PushFloat(s);
            else
               tree.PushInteger(s, e);
            *e = borrow;
            break;
         case op:
            //This only lexes one-character operators
            do {
               borrow = p[1];
               p[1] = 0;
               tree.PushOperator(p);
               p[1] = borrow;
               p++;
            } while (p<e);
            break;
      }
      s = e;
   }
   tree.finalize();
   memcpy(expr, tree.root, sizeof(class Expression));
   if (expr.b)
      expr.b.mom = expr;
   tree.root = null;
   delete tree;
}

//This function walks the tree to make sure it is valid:
//    no null expressions
//    no open parenthesis/functions
//    correct number of arguments for core functions (TODO)
//While it's at it, it tags every expression in the tree
//It also converts exp(foo) to e^foo (TODO)
//returns true if the expression is valid and not empty
bool Expression::Sanitize(CASDictionary dict) {
   if (!this || this.type==null)
      return false;
   ClearTags();
   #define S(x) {if (!Sanitize(x, dict)) return false;}
   switch (ExprClass()) {
      case prefix:
         if (type==openparenthesis || type==openfunction)
            return false;
         S(b);
         if (b.constant)
            constant = true;
         if (b.approx)
            approx = true;
         break;
      case vallary:
         S(b);
         if (type==parenthesis && parenthesis.type==parenthesis)
            Unlink();
         else {
            if (b.constant)
               constant = true;
            if (b.approx)
               approx = true;
         }
         break;
      case postfix:
         S(a);
         if (a.constant)
            constant = true;
         if (a.approx)
            approx = true;
         break;
      case binary:
         S(a);
         S(b);
         if (a.constant && b.constant)
            constant = true;
         if (a.approx || b.approx)
            approx = true;
         break;
      case nary:
         constant = true;
         approx = false;
         for (iter:arg) {
            S(iter);
            if (!iter.constant)
               constant = false;
            if (iter.approx)
               approx = true;
         }
         if (!dict.f.Sanitize(this))
            return false;
         break;
      case nullary:
         if (type!=v)
            constant = true;
         if (type==f)
            approx = true;
         break;
   }
   #undef S
   return true;
}
