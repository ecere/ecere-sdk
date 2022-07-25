public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA"   // For FieldValue

import "expressions"

enum ECCSSFunctionIndex : int
{
   unresolved = -1,
   // Text manipulation
   strupr = 1,
   strlwr,
   subst,
   format,
   pow
};

static int strncpymax(String output, const String input, int count, int max)
{
   int copied = Min(count, Max(0, max - 1));
   if(copied)
   {
      memcpy(output, input, copied);
      output[copied] = 0;
   }
   return copied;
}

static String formatValues(const String format, int numArgs, const FieldValue * values)
{
   char output[1024];
   int totalLen = 0;
   int formatLen = format ? strlen(format) : 0;
   const String start = format;
   int arg = 0;
   const FieldValue * value = &values[arg];

   output[0] = '\0';

   while(true)
   {
      String nextArg = strchr(start, '%');
      if(nextArg)
      {
         if(nextArg[1] == '%')
         {
            totalLen += strncpymax(output + totalLen, start, (int)(nextArg+1 - start), sizeof(output) - totalLen);
            start = nextArg + 2;
         }
         else
         {
            bool valid = true;
            FieldType type = integer;
            String s = nextArg + 1;
            bool argWidth = false, argPrecision = false;
            int width = 0, precision = 0;

            totalLen += strncpymax(output + totalLen, start, (int)(nextArg - start), sizeof(output) - totalLen);

            while(true)
            {
               bool done = false;
               switch(*s)
               {
                  case '-': case '+': case '#': case ' ': case '0':
                     s++;
                     break;
                  default:
                     done = true;
               }
               if(done) break;
            }
            if(*s == '*')
            {
               argWidth = true;
               if(arg < numArgs)
               {
                  switch(value->type.type)
                  {
                     default:
                     case integer: width = (int)value->i; break;
                     case text:    width = strtol(value->s, null, 0); break;
                     case real:    width = (int)value->r; break;
                  }
                  value = &values[++arg];
               }
            }
            else
               strtol(s, &s, 10);

            if(*s == '.')
            {
               s++;
               if(*s == '*')
               {
                  argPrecision = true;
                  if(arg < numArgs)
                  {
                     switch(value->type.type)
                     {
                        default:
                        case integer: precision = (int)value->i; break;
                        case text:    precision = strtol(value->s, null, 0); break;
                        case real:    precision = (int)value->r; break;
                     }
                     value = &values[++arg];
                  }
               }
               else
                  strtol(s, &s, 10);
            }

            switch(*s)
            {
               case 'c': case 'd': case 'i': case 'o': case 'u': case 'x': case 'X':
                  type = integer;
                  s++;
                  break;
               case 'f': case 'F': case 'e': case 'E': case 'g': case 'G':
                  type = real;
                  s++;
                  break;
               case 's':
                  type = text;
                  s++;
                  break;
               default:
                  valid = false;
            }
            start = s;

            if(valid && arg < numArgs)
            {
               char argFormat[256];
               memcpy(argFormat, nextArg, (int)(s - nextArg));
               argFormat[s - nextArg] = '\0';

               if(type == text && value->type.type == text && argFormat[0] == '%' && argFormat[1] == 's')
               {
                  if(value->s)
                     totalLen += strncpymax(output + totalLen, value->s, strlen(value->s), sizeof(output) - totalLen);
               }
               else
               {
                  char argString[1024];
                  int numArgs = 0;
                  switch(type)
                  {
                     case integer:
                     {
                        if(value->type.type != nil)
                        {
                           int intValue;
                           switch(value->type.type)
                           {
                              default:
                              case integer: intValue = (int)value->i; break;
                              case real:    intValue = (int)value->r; break;
                              case text:    intValue = value->s ? strtol(value->s, null, 0) : 0; break;
                           }
                           if(argWidth && argPrecision)
                              numArgs = sprintf(argString, argFormat, width, precision, intValue);
                           else if(argWidth)
                              numArgs = sprintf(argString, argFormat, width, intValue);
                           else if(argPrecision)
                              numArgs = sprintf(argString, argFormat, precision, intValue);
                           else
                              numArgs = sprintf(argString, argFormat, intValue);
                        }
                        else
                           argString[0] = '\0';
                        break;
                     }
                     case real:
                     {
                        if(value->type.type != nil)
                        {
                           double doubleValue;
                           switch(value->type.type)
                           {
                              default:
                              case integer: doubleValue = (double)value->i; break;
                              case real:    doubleValue = value->r; break;
                              case text:    doubleValue = value->s ? strtod(value->s, null) : 0; break;
                           }
                           if(argWidth && argPrecision)
                              numArgs = sprintf(argString, argFormat, width, precision, doubleValue);
                           else if(argWidth)
                              numArgs = sprintf(argString, argFormat, width, doubleValue);
                           else if(argPrecision)
                              numArgs = sprintf(argString, argFormat, precision, doubleValue);
                           else
                              numArgs = sprintf(argString, argFormat, doubleValue);
                        }
                        else
                           argString[0] = '\0';
                        break;
                     }
                     case text:
                     {
                        char temp[100];
                        const String strValue;
                        switch(value->type.type)
                        {
                           default:
                           case integer: strValue = (sprintf(temp, FORMAT64D, value->i), temp); break;
                           case real:    strValue = value->r.OnGetString(temp, null, null); break;
                           case text:    strValue = value->s ? value->s : ""; break;
                           case nil:     strValue = ""; break;
                        }
                        if(argWidth && argPrecision)
                           numArgs = sprintf(argString, argFormat, width, precision, strValue);
                        else if(argWidth)
                           numArgs = sprintf(argString, argFormat, width, strValue);
                        else if(argPrecision)
                           numArgs = sprintf(argString, argFormat, precision, strValue);
                        else
                           numArgs = sprintf(argString, argFormat, strValue);
                        break;
                     }
                  }
                  if(numArgs > 0)
                     totalLen += strncpymax(output + totalLen, argString, numArgs, sizeof(output) - totalLen);
               }

               value = &values[++arg];
            }
         }
      }
      else
      {
         totalLen += strncpymax(output + totalLen, start, (int)(formatLen - (start - format)), sizeof(output) - totalLen);
         break;
      }
   }
   return CopyString(output);
}

// For extending ECCSS with custom identifiers and styling properties
public struct ECCSSEvaluator
{
   subclass(ECCSSEvaluator) evaluatorClass;        // This is effectively adding a virtual function table...

   virtual Class resolve(const CMSSIdentifier identifier, bool isFunction, int * id, ExpFlags * flags)
   {
      Class expType = null;
      if(isFunction)
      {
         ECCSSFunctionIndex fnIndex = unresolved;

         if(fnIndex.OnGetDataFromString(identifier.string))
         {
            *id = fnIndex;
            expType = class(GlobalFunction);
            flags->resolved = true;
         }
         else
            *id = ECCSSFunctionIndex::unresolved;
      }
      return expType;
   }
   virtual void compute(int id, const CMSSIdentifier identifier, bool isFunction, FieldValue value, ExpFlags * flags)
   {
      if(isFunction)
      {
         if(id != -1)
         {
            value = { type = { integer }, i = id };
            flags->resolved = true;
         }
      }
   }
   virtual void evaluateMember(DataMember prop, CMSSExpression exp, const FieldValue parentVal, FieldValue value, ExpFlags * flags);
   virtual Class resolveFunction(const FieldValue e, CMSSExpList args, ExpFlags * flags)
   {
      Class expType = null;

      if(e.type.type == integer)
      {
         ECCSSFunctionIndex fnIndex = (ECCSSFunctionIndex)e.i;
         switch(fnIndex)
         {
            case strlwr:
            case strupr:
            {
               if(args.list.count >= 1) args[0].destType = class(String);
               expType = class(String);
               break;
            }
            case subst:
            {
               if(args.list.count >= 1) args[0].destType = class(String);
               if(args.list.count >= 2) args[1].destType = class(String);
               if(args.list.count >= 3) args[2].destType = class(String);
               expType = class(String);
               break;
            }
            case format:
            {
               if(args.list.count >= 1) args[0].destType = class(String);
               expType = class(String);
               break;
            }
            case pow:
            {
               if(args.list.count >= 1) args[0].destType = class(double);
               if(args.list.count >= 2) args[1].destType = class(double);
               expType = class(double);
               break;
            }
         }
      }
      return expType;
   }
   virtual Class computeFunction(FieldValue value, const FieldValue e, const FieldValue * args, int numArgs, ExpFlags * flags)
   {
      Class expType = null;

      if(e.type.type == integer)
      {
         ECCSSFunctionIndex fnIndex = (ECCSSFunctionIndex)e.i;
         switch(fnIndex)
         {
            case strlwr:
            case strupr:
            {
               if(numArgs >= 1 && args[0].type.type == text)
               {
                  value.type = { type = text, mustFree = true };
                  value.s = CopyString(args[0].s);
                  if(fnIndex == strlwr)
                     strlwr(value.s);
                  else
                     strupr(value.s);
               }
               break;
            }
            case subst:
            {
               if(numArgs >= 3 && args[0].type.type == text && args[1].type.type == text && args[2].type.type == text)
               {
                  String n = SearchString(args[0].s, 0, args[1].s, false, false);
                  if(n)
                  {
                     int len = strlen(args[0].s);
                     int startLen = (uint)(n - args[0].s);
                     int replacedLen = strlen(args[1].s);
                     int replacingLen = strlen(args[2].s);
                     int remainingLen = len - startLen - replacedLen;
                     value.s = new char[startLen + replacingLen + 1];
                     memcpy(value.s, args[0].s, startLen);
                     memcpy(value.s + startLen, args[2].s, replacingLen);
                     memcpy(value.s + startLen + replacingLen, args[0].s + startLen + replacedLen, remainingLen);
                     value.s[startLen + replacingLen] = 0;
                  }
                  else
                     value.s = CopyString(args[0].s);
                  value.type = { text, true };
               }
               break;
            }
            case format:
            {
               if(numArgs >= 1 && args[0].type.type == text)
               {
                  value.type = { text, true };
                  value.s = formatValues(args[0].s, numArgs-1, &args[1]);
               }
               break;
            }
            case pow:
            {
               if(numArgs == 2 &&
                  (args[0].type.type == integer || args[0].type.type == real) &&
                  (args[1].type.type == integer || args[1].type.type == real))
               {
                  value.type = { real };
                  value.r = pow(
                     args[0].type.type == integer ? (double)args[0].i : args[0].r,
                     args[1].type.type == integer ? (double)args[1].i : args[1].r);
               }
               break;
            }
         }
      }
      return expType;
   }
   virtual void ::applyStyle(void * object, StylesMask mSet, const FieldValue value, int unit);

   // NOTE: These are quite likely to get ridden of with more generic code...
   virtual const String ::stringFromMask(StylesMask mask, Class c) { return null; }
   virtual StylesMask ::maskFromString(const String s, Class c) { return 0; }
   virtual Array<Instance> ::accessSubArray(void * obj, StylesMask mask) { return null; }
};

public class CMSSStyleSheet
{
   ~CMSSStyleSheet()
   {
      if(list) list.Free(), delete list;
   }

public:
   StylingRuleBlockList list;

   // Returns first rule block intersecting mask and containing name
   StylingRuleBlock findRule(StylesMask mask, const String name)
   {
      if(this && list)
      {
         for(b : list)
         {
            StylingRuleBlock block = b.findRule(mask, name);
            if(block)
               return block;
         }
      }
      return null;
   }

   //NOTE this ignores selectors!
   bool changeStyle(const String layerID, StylesMask mask, const FieldValue value, Class stylesClass, ECCSSEvaluator evaluator,
      bool isNested, Class unitClass)
   {
      bool result = false;
      StylingRuleBlock block = findRule(mask, layerID);
      if(!block)
      {
         block = { id = { string = CopyString(layerID) } };
         if(!list) list = { };
         list.Add(block);
      }
      block.changeStyle(mask, value, stylesClass, evaluator, false, unitClass);
      return result;
   }

   //NOTE this ignores selectors!
   void removeStyle(const String id, StylesMask mask)
   {
      StylingRuleBlock block = findRule(mask, id);
      if(block)
      {
         block.styles.removeStyle(mask);
      }
   }

   CMSSStyleSheet bind(ECCSSEvaluator evaluator, Class stylesClass, const String name)
   {
      CMSSStyleSheet result = null;
      if(this && list)
      {
         for(b : list)
         {
            StylingRuleBlock block = b.bind(evaluator, stylesClass, name);
            if(block)
            {
               if(!result) result = { list = { } };
               result.list.Add(block);
            }
         }
      }
      return result;
   }

   bool resolve(ECCSSEvaluator evaluator, Class stylesClass)
   {
      bool result = false;
      if(this && list)
      {
         for(b : list)
         {
            result = b.resolve(evaluator, stylesClass);
            if(!result) break;
         }
      }
      return result;
   }

   bool write(const String path)
   {
      bool result = false;
      File f = FileOpen(path, write);
      if(f)
      {
         result = writeFile(f);
         delete f;
      }
      return result;
   }

   bool writeFile(File f)
   {
      if(list)
         list.print(f, 0, { skipEmptyBlocks = true });
      return true;
   }

   CMSSStyleSheet ::loadFile(File f)
   {
      StylingRuleBlockList list = null;
      if(f)
      {
         CMSSLexer lexer { };
         lexer.initFile(f);
         list = StylingRuleBlockList::parse(lexer);
         delete lexer;
      }
      return CMSSStyleSheet { list = list ? list : { } };
   }

   CMSSStyleSheet ::load(const String fileName)
   {
      CMSSStyleSheet result = null;
      File f = fileName ? FileOpen(fileName, read) : null;
      if(f)
      {
         result = loadFile(f);
         delete f;
      }
      return result;
   }

   CMSSStyleSheet ::loadString(const String s)
   {
      CMSSStyleSheet result = null;
      if(s)
      {
         TempFile tmp { buffer = (byte *)s, size = strlen(s) };
         result = loadFile(tmp);
         tmp.StealBuffer();
         delete tmp;
      }
      return result;
   }

   CMSSStyleSheet copy()
   {
      CMSSStyleSheet sheet { list = list.copy() };
      return sheet;
   }
}

public class StylesMask : uint64 { bool bitMember:1:63; } // Just to force this to be a bit class...

// This is a semi-colon-separated list
public class StylesList : CMSSInstInitList
{
public:
   StylesList ::parse(CMSSLexer lexer)
   {
      StylesList list = null;
      while(true)
      {
         CMSSMemberInitList e = CMSSMemberInitList::parse(lexer);
         if(e)
         {
            if(!list) list = StylesList { };
            list.Add(e);
         }
         else
            break;
         lexer.peekToken();
         if(lexer.nextToken.type == '#' || lexer.nextToken.type == '[' ||
            lexer.nextToken.type == '{' || lexer.nextToken.type == '}' || !lexer.nextToken.type)
            break;
      }
      return list;
   }
}

public class StylingRuleSelector : CMSSNode
{
public:
   CMSSExpression exp;

   ~StylingRuleSelector()
   {
      delete exp;
   }

   StylingRuleSelector ::parse(CMSSLexer lexer)
   {
      StylingRuleSelector selector = null;
      CMSSExpression e;
      if(lexer.peekToken().type == '[')
         lexer.readToken();
      e = CMSSExpression::parse(lexer);
      if(e)
         selector = { exp = e };
      if(lexer.peekToken().type == ']')
         lexer.readToken();
      return selector;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.Print("[");
      exp.print(out, indent, o);
      out.Print("]");
   }
   StylingRuleSelector copy()
   {
      StylingRuleSelector s = null;
      if(this)
      {
         s = eInstance_New(_class);
         incref s;
         s.exp = exp.copy();
      }
      return s;
   }
}

public class SelectorList : CMSSList<StylingRuleSelector>
{
public:
   SelectorList ::parse(CMSSLexer lexer)
   {
      SelectorList list = null;
      while(true)
      {
         StylingRuleSelector e = StylingRuleSelector::parse(lexer);
         if(e)
         {
            if(!list) list = SelectorList { };
            list.Add(e);
         }
         else
            break;
         lexer.peekToken();
         if(lexer.nextToken.type == '#' || lexer.nextToken.type == '{' || lexer.nextToken.type == '}' || !lexer.nextToken.type)
            break;
      }
      return list;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      CMSSList::print(out, indent, o);
   }

   void printSep(File out)
   {

   }
}

public class StylingRuleBlockList : CMSSList<StylingRuleBlock>
{
   // TODO: Optimization Maps per re-used attributes of values -> relevant nested rules

public:
   StylingRuleBlockList ::parse(CMSSLexer lexer)
   {
      return (StylingRuleBlockList)CMSSList::parse(class(StylingRuleBlockList), lexer, StylingRuleBlock::parse, 0);
   }
   StylesMask mask;

   void print(File out, int indent, CMSSOutputOptions o)
   {
      CMSSList::print(out, indent, o);
   }

   void printSep(File out)
   {
   }

   StylesMask apply(void * object, StylesMask m, ECCSSEvaluator evaluator, ExpFlags * flg)
   {
      Link it = list.last;
      //Iterator<StylingRuleBlock> it { list };
      while(m && it) //it.Prev())
      {
         StylingRuleBlock block = (StylingRuleBlock)(uint64)it.data;
         StylesMask bm = block.mask & m;
         if(bm)
            m = block.apply(object, m, evaluator, flg, false);
         it = it.prev;
      }
      return m;
   }

   StylesMask apply2(void * object, StylesMask m, ECCSSEvaluator evaluator, ExpFlags * flg, StylesMask * fm)
   {
      Link it = list.last;
      //Iterator<StylingRuleBlock> it { list };
      while(m && it) //it.Prev())
      {
         StylingRuleBlock block = (StylingRuleBlock)(uint64)it.data;
         StylesMask bm = block.mask & m;
         if(bm)
            m = block.apply2(object, m, evaluator, flg, false, fm);
         it = it.prev;
      }
      return m;
   }
}

private Instance createGenericInstance(CMSSExpInstance inst, ECCSSEvaluator evaluator, ExpFlags * flg)
{
   CMSSSpecName specName = inst.instance ? (CMSSSpecName)inst.instance._class : null;
   Class c = specName ? eSystem_FindClass(specName._class.module, specName.name) : inst.destType;
   Instance instance = c && c.structSize ? eInstance_New(c) : null;
   if(instance)
      setGenericInstanceMembers(instance, inst, evaluator, flg, c);
   return instance;
}

private void setGenericBitMembers(CMSSExpInstance expInst, uint64 * bits, ECCSSEvaluator evaluator, ExpFlags * flg, Class stylesClass)
{
   if(expInst)
   {
      for(i : expInst.instance.members)
      {
         CMSSMemberInitList members = i;
         for(m : members)
         {
            CMSSMemberInit mInit = m;
            if(mInit.initializer)
            {
               CMSSExpression exp = mInit.initializer;
               Class destType = exp.destType;
               if(destType)
               {
                  FieldValue val { };
                  ExpFlags flag = exp.compute(val, evaluator, runtime, stylesClass);
                  BitMember member = (BitMember)mInit.dataMember;

                  *bits |= (val.i << member.pos) & member.mask;

                  *flg |= flag;
               }
               else
               {
                  // PrintLn("null destType ?");
               }
            }
         }
      }
   }
}

private void setGenericInstanceMembers(Instance object, CMSSExpInstance expInst, ECCSSEvaluator evaluator, ExpFlags * flg, Class stylesClass)
{
   if(expInst && expInst.instance)
   {
      for(i : expInst.instance.members)
      {
         CMSSMemberInitList members = i;
         for(m : members)
         {
            CMSSMemberInit mInit = m;
            if(mInit.initializer)
            {
               CMSSExpression exp = mInit.initializer;
               Class destType = exp.destType;
               if(destType)
               {
                  FieldValue val { };
                  ExpFlags flag = exp.compute(val, evaluator, runtime, stylesClass);
                  if(stylesClass && stylesClass == class(DateTime) && val.type.type == text)
                  {
                     ((DateTime *)object)->OnGetDataFromString(val.s);
                     return;
                  }

                  if(mInit.dataMember && mInit.dataMember.isProperty)
                  {
                     Property prop = (Property)mInit.dataMember;

                     if(!prop.Set);
                     else if(destType == class(int) || destType == class(bool) || destType == class(Color) ||
                        ((destType.type == enumClass || destType.type == bitClass) && destType.typeSize == sizeof(int)))
                     {
                        void (* setInt)(void * o, int v) = (void *)prop.Set;
                        setInt(object, val.type.type == integer ? (int)val.i : val.type.type == real ? (int)val.r : 0);
                     }
                     else if(destType == class(int64) ||
                        ((destType.type == enumClass || destType.type == bitClass) && destType.typeSize == sizeof(int64)))
                     {
                        void (* setInt64)(void * o, int64 v) = (void *)prop.Set;
                        setInt64(object, val.type.type == integer ? (int64)val.i : val.type.type == real ? (int64)val.r : 0);
                     }
                     else if(destType == class(double))
                     {
                        void (* setDouble)(void * o, double v) = (void *)prop.Set;
                        setDouble(object, val.type.type == integer ? (double)val.i : val.type.type == real ? val.r : 0);
                     }
                     else if(destType == class(float))
                     {
                        void (* setFloat)(void * o, float v) = (void *)prop.Set;
                        setFloat(object, val.type.type == integer ? (float)val.i : val.type.type == real ? (float)val.r : 0);
                     }
                     else if(destType == class(String))
                     {
                        void (* setString)(void * o, String v) = (void *)prop.Set;
                        String s =
                           (val.type.type == text)    ? (val.type.mustFree ? val.s : CopyString(val.s)) :
                           (val.type.type == real)    ? PrintString(val.r) :
                           (val.type.type == integer) ? PrintString(val.i) : null;
                        setString(object, s);
                        delete s;
                     }
                     else if((destType.type == noHeadClass || destType.type == normalClass) && exp._class == class(CMSSExpInstance))
                     {
                        void (* setInstance)(void * o, void * v) = (void *)prop.Set;
                        setInstance(object,  (Instance)(uintptr)val.i);

                        if(destType.type == normalClass)
                           ; //eInstance_DecRef((Instance)(uintptr)val.i);
                        else if(destType.type == noHeadClass)
                        {
                           // TODO: base classes destructors?
                           /*
                           if(destType.Destructor)
                              destType.Destructor((void *)(uintptr)val.i);
                           eSystem_Delete((void *)(uintptr)val.i);
                           */
                        }

                        //if we're freeing these Instances later, is it then the case that
                        //we give CMSSExpInstance this instData member and free it in destructor
                     }
                     else if(destType.type == structClass && exp._class == class(CMSSExpInstance))
                     {
                        void (* setInstance)(void * o, void * v) = (void *)prop.Set;
                        setInstance(object,  (void *)(uintptr)val.i);
                     }
                     else if((destType.type == noHeadClass || destType.type == normalClass) && exp._class == class(CMSSExpArray))
                     {
                        void (* setInstance)(void * o, void * v) = (void *)prop.Set;
                        CMSSExpArray arrayExp = (CMSSExpArray) exp;
                        Array<Instance> array { size = (arrayExp.elements ? arrayExp.elements.GetCount() : 0) };
                        Iterator<CMSSExpression> it { arrayExp.elements };
                        int j = 0;

                        // NOTE: Currently only supporting array of instances...
                        while(it.Next())
                        {
                           CMSSExpression e = it.data;
                           if(e._class == class(CMSSExpInstance))
                           {
                              CMSSExpInstance instExp = (CMSSExpInstance)e;
                              /*Instance a = instExp.instData;
                              Class c = instExp.expType;
                              if(c && c.type == normalClass)
                                 a._refCount++;
                              */
                              array[j] = instExp.instData;
                           }
                           j++;
                        }

                        setInstance(object, (Instance)(uintptr)array);

                        // delete array;
                     }
                     else if(flag.resolved) //!flag.callAgain && !flag.record)  //flag.resolved) //
                     {
                        /*ConsoleFile con { };
                        exp.print(con, 0,0);
                        */
   #ifdef _DEBUG
                        PrintLn("Unexpected!");
   #endif
                     }
                  }
                  else
                  {
                     if(destType == class(int) || destType == class(bool) || destType == class(Color) ||
                        ((destType.type == enumClass || destType.type == bitClass) && destType.typeSize == sizeof(int)))
                        *(int *)((byte *)object + mInit.offset) = val.type.type == integer ? (int)val.i : val.type.type == real ? (int)val.r : 0;
                     else if(destType == class(int64) ||
                        ((destType.type == enumClass || destType.type == bitClass) && destType.typeSize == sizeof(int64)))
                        *(int64 *)((byte *)object + mInit.offset) = val.type.type == integer ? (int64)val.i : val.type.type == real ? (int64)val.r : 0;
                     // TODO: Better units handling
                     else if(destType == class(double) || destType == class(Radians) || destType == class(Meters))
                        *(double *)((byte *)object + mInit.offset) = val.type.type == integer ? (double)val.i : val.type.type == real ? val.r : 0;
                     else if(destType == class(Degrees))
                     {
                        *(double *)((byte *)object + mInit.offset) =
                           Pi / 180 * (val.type.type == integer ? (double)val.i : val.type.type == real ? val.r : 0);
                     }
                     else if(destType == class(float))
                        *(float *)((byte *)object + mInit.offset) = val.type.type == integer ? (float)val.i : val.type.type == real ? (float)val.r : 0;
                     else if(destType == class(String))
                     {
                        *(String *)((byte *)object + mInit.offset) =
                           (val.type.type == text)    ? (val.type.mustFree ? val.s : CopyString(val.s))  :
                           (val.type.type == real)    ? PrintString(val.r) :
                           (val.type.type == integer) ? PrintString(val.i) : null;
                     }
                     else if((destType.type == noHeadClass || destType.type == normalClass) && exp._class == class(CMSSExpInstance))
                     {
                        // TOFIX: We should probably be deleting existance value here?

                        *(Instance *)((byte *)object + mInit.offset) = (Instance)(uintptr)val.i;
                     }
                     else if(destType.type == structClass && exp._class == class(CMSSExpInstance))
                     {
                        memcpy((byte *)object + mInit.offset, (void *)(uintptr)val.i, destType.structSize);
                     }
                     else if(flag.resolved) //!flag.callAgain && !flag.record)  //flag.resolved) //
                     {
                        /*ConsoleFile con { };
                        exp.print(con, 0,0);
                        */
   #ifdef _DEBUG
                        PrintLn("Unexpected!");
   #endif
                     }
                  }
                  *flg |= flag;
               }
               else
               {
                  // PrintLn("null destType ?");
               }
            }
         }
      }
   }
}

public class StylingRuleBlock : CMSSNode
{
   class_no_expansion;
public:
   StylingRuleBlockList nestedRules;
   SelectorList selectors;
   CMSSIdentifier id;
   StylesList styles;
   StylesMask mask;

   StylingRuleBlock ::parse(CMSSLexer lexer)
   {
      lexer.peekToken();

      if(lexer.nextToken.type == '[' || lexer.nextToken.type == '#' || lexer.nextToken.type == '{')
      {
         StylingRuleBlock block { };

         if(lexer.peekToken().type == '#')
         {
            lexer.readToken();
            if(lexer.peekToken().type == identifier)
               block.id = CMSSIdentifier::parse(lexer);
         }

         if(lexer.peekToken().type == '[')
            block.selectors = SelectorList::parse(lexer);

         if(lexer.peekToken().type == '{')
            lexer.readToken();

         if(lexer.peekToken().type == identifier)
            block.styles = StylesList::parse(lexer);

         lexer.peekToken();
         if(lexer.nextToken.type == '[' || lexer.nextToken.type == '#' || lexer.nextToken.type == '{')
            block.nestedRules = StylingRuleBlockList::parse(lexer);

         if(lexer.peekToken().type == '}')
            lexer.readToken();
         return block;
      }
      return null;
   }

   // Returns first rule block intersecting mask and containing name
   StylingRuleBlock findRule(StylesMask mask, const String name)
   {
      if(id && id.string && name && strcmpi(id.string, name))
         return null;

      if(styles && styles.GetCount())
      {
         for(s : styles)
         {
            for(m : s)
            {
               CMSSMemberInit mInit = m;
               StylesMask sm = mInit.stylesMask;
               if(sm & mask)
                  return this;
            }
         }
      }

      if(nestedRules)
      {
         for(b : nestedRules)
         {
            StylingRuleBlock block = b.findRule(mask, name);
            if(block)
               return b;
         }
      }

      return null;
   }

   private StylingRuleBlock bind(ECCSSEvaluator evaluator, Class stylesClass, const String name)
   {
      StylingRuleBlock result = null;
      bool keep = true;
      SelectorList newSelectors = null;

      // Layer ID filter
      if(id && id.string && name && strcmpi(id.string, name))
         keep = false;

      // Selector expressions filter
      if(keep && selectors)
      {
         // TODO: Per-record flags for selectors?
         for(s : selectors)
         {
            FieldValue value { };
            CMSSExpression e = s.exp.copy();
            ExpFlags flags = e.compute(value, evaluator, preprocessing, stylesClass);
            if(flags.resolved)
            {
               e = simplifyResolved(value, e);
               delete e; // NOTE: viz.sd operations were being deleted when resolved
               if(!value.i)
               {
                  keep = false;
                  break;
               }
            }
            else
            {
               if(!newSelectors) newSelectors = { };
               newSelectors.Add(StylingRuleSelector { exp = e });
            }
         }
         if(!keep) delete newSelectors;
      }

      if(keep)
      {
         StylingRuleBlock block { selectors = newSelectors };
         StylesMask mask = 0;
         if(id) block.id = { string = CopyString(id.string) };
         if(styles)
         {
            StylesList newStyles { };
            for(s : styles)
            {
               CMSSMemberInitList style = s;
               CMSSMemberInitList newStyle { };
               for(m : style)
               {
                  CMSSMemberInit member = m.copy();
                  /*ExpFlags flags = */member.precompute(stylesClass, stylesClass, 0, null, evaluator);  // TODO: Consider these flags
                  newStyle.Add(member);
                  newStyles.mask |= member.stylesMask;
               }
               newStyles.Add(newStyle);
            }
            block.styles = newStyles;
            mask |= newStyles.mask;
         }

         if(nestedRules)
         {
            for(b : nestedRules)
            {
               StylingRuleBlock nb = b.bind(evaluator, stylesClass, name);
               if(nb)
               {
                  if(!block.nestedRules) block.nestedRules = { };
                  block.nestedRules.Add(nb);
                  block.nestedRules.mask |= nb.mask;
               }
            }
            if(block.nestedRules) mask |= block.nestedRules.mask;
         }
         block.mask = mask;
         result = block;
      }
      return result;
   }

   private bool resolve(ECCSSEvaluator evaluator, Class stylesClass)
   {
      bool result = false;
      if(selectors)
      {
         // TODO: Per-record flags for selectors?
         for(s : selectors)
         {
            FieldValue value { };
            CMSSExpression e = s.exp;
            ExpFlags flags = e.compute(value, evaluator, preprocessing, stylesClass);
            if(flags.resolved)
            {
               e = simplifyResolved(value, e);
               s.exp = e;
               //delete e; // NOTE: viz.sd operations were being deleted when resolved
            }
         }
      }

      if(styles)
      {
         for(s : styles)
         {
            CMSSMemberInitList style = s;
            for(m : style)
            {
               CMSSMemberInit member = m;
               // passing stylesClass here just passes irrelevant GeoSymbolizer class, but the others are not yet bound
               member.precompute(stylesClass, stylesClass, 0, null, evaluator);  // TODO: Consider these flags
               styles.mask |= member.stylesMask;
            }
         }
         this.mask |= styles.mask;
      }

      if(nestedRules)
      {
         for(b : nestedRules)
         {
            b.resolve(evaluator, stylesClass);
            nestedRules.mask |= b.mask;
         }
         mask |= nestedRules.mask;
      }
      result = true;

      return result;
   }

   CMSSExpression getStyle(StylesMask mask)
   {
      return styles ? styles.getStyle(mask) : null;
   }


   void setStyle(Class c, const String idString, StylesMask msk, bool createSubInstance, CMSSExpression expression,
      ECCSSEvaluator evaluator, Class stylesClass)
   {
      if(msk)
      {
         if(!styles) styles = { };
         styles.setMember2(c, idString, msk, createSubInstance, expression, evaluator, stylesClass);
         mask |= msk;
      }
   }

   // NOTE: isNested means this is a nested rule, and we want to set top.sub = as opposed to top = { sub = }
   bool changeStyle(StylesMask msk, const FieldValue value, Class c, ECCSSEvaluator evaluator, bool isNested, Class unitClass)
   {
      if(msk)
      {
         if(!styles) styles = { };
         if(styles.changeStyle(msk, value, c, evaluator, isNested, unitClass))
         {
            mask |= msk;
            return true;
         }
      }
      return false;
   }

   void removeStyle(StylesMask msk)
   {
      if(this)
      {
         styles.removeStyle(msk);
      }
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      const char * ln = o.dbgOneLiner ? " " : "\n";

      if(o.skipEmptyBlocks &&
         (!styles || !styles.list.first) &&
         (!nestedRules || !nestedRules.list.count))
         return;

      out.Print(ln);
      if(!o.dbgOneLiner) printIndent(indent, out);
      if(id)
      {
         out.Print("#");
         id.print(out, indent, o);
      }

      if(selectors)
         selectors.print(out, indent, o);

      if(id || selectors)
      {
         out.Print(ln);
         if(!o.dbgOneLiner) printIndent(indent, out);
      }
      out.Print("{", ln);
      indent++;

      if(styles)
      {
         Iterator<CMSSMemberInitList> it { styles };
         while(it.Next())
         {
            CMSSMemberInitList list = it.data;

            if(!o.dbgOneLiner) printIndent(indent, out);
            list.print(out, indent, o);
            out.Print(";", ln);
         }
      }
      if(nestedRules)
         nestedRules.print(out, indent, o);

      indent--;
      if(!o.dbgOneLiner) printIndent(indent, out);

      out.Print("}", ln);
   }

   void debugPrintRule(File out, const String name)
   {
      out.Print("   ", name, " @", this ? "" : "0x0", (uintptr)this, ": ");
      if(this) print(out, 32, { dbgOneLiner = true });
      out.PrintLn("");
   }

   ~StylingRuleBlock()
   {
      delete selectors;
      delete id;
      delete styles;
      delete nestedRules;
   }

   StylingRuleBlock copy()
   {
      StylingRuleBlock b = null;

      if(this)
      {
         b = eInstance_New(_class);
         incref b;
         b.mask = mask;
         b.id = (id && id.string) ? { string = CopyString(id.string) } : null;
         if(nestedRules)
         {
            b.nestedRules = { mask = nestedRules.mask };
            for(n : nestedRules)
               b.nestedRules.Add(n.copy());
         }
         if(selectors)
         {
            b.selectors = { };
            for(n : selectors)
               b.selectors.Add(n.copy());
         }
         if(styles)
         {
            b.styles = { mask = styles.mask };
            for(n : styles)
               b.styles.Add(n.copy());
         }
      }
      return b;
   }

   // This should return the mask of symbolization properties which could be different based on exp flags...
   private StylesMask apply2(void * object, StylesMask m, ECCSSEvaluator evaluator, ExpFlags * flg, bool ignoreSelectors, StylesMask * fm)
   {
      StylesMask result = m;
      ExpFlags flags = 0;
      bool apply = true;
      bool neverHappening = false;

      if(selectors && !ignoreSelectors)
      {
         Link s;
         for(s = selectors.list.first; s; s = s.next)
         {
            StylingRuleSelector sel = (StylingRuleSelector)(uintptr)s.data;
            FieldValue value { };
            CMSSExpression e = sel.exp;
            ExpFlags sFlags = e.compute(value, evaluator, runtime, null);
            flags |= sFlags;

            if(sFlags.resolved /* == ExpFlags { resolved = true }*/ && !value.i)
               neverHappening = true;

            if(!sFlags.resolved || !value.i)
               apply = false;
         }
         *flg |= flags;
      }

      if(apply || (!neverHappening && (flags & ~ ExpFlags { resolved = true })))
      {
         StylesMask nfm = 0;
         if(nestedRules)
         {
            m = nestedRules.apply2(apply ? object : null, m, evaluator, flg, &nfm);
            if(apply)
               result = m;
            if(fm)
               *fm |= nfm;
         }
         if(m)
         {
            Link itStyle = styles ? styles.list.last : null;
            while(itStyle)
            {
               CMSSMemberInitList initList = (CMSSMemberInitList)(uintptr)itStyle.data;
               Link itMember = initList.list.last;
               while(itMember)
               {
                  CMSSMemberInit member = (CMSSMemberInit)itMember.data;
                  CMSSExpression e = member.initializer;
                  StylesMask sm = member.stylesMask;
                  ExpFlags f = 0;
                  if(apply)
                  {
                     if(sm & m)
                     {
                        applyStyle(object, sm & m, evaluator, e, &f);
                        *flg |= f;
                        m &= ~sm;
                        result = m;
                     }
                  }
                  else
                  {
                     FieldValue value { };
                     f = e.compute(value, evaluator, runtime, e.destType);
                  }
                  if(fm && (f | flags) & ~ExpFlags { resolved = true })
                     *fm |= sm;
                  itMember = itMember.prev;
               }
               itStyle = itStyle.prev;
            }
         }
      }
      return result;
   }

   // TOCHECK: Both mask and flags must be returned?
   public /*private static*/ StylesMask apply(void * object, StylesMask m, ECCSSEvaluator evaluator, ExpFlags * flg, bool ignoreSelectors)
   {
      ExpFlags flags = 0;
      bool apply = true;

      if(selectors && !ignoreSelectors)
      {
         Link s;
         // TODO: Per-record flags for selectors?
         for(s = selectors.list.first; s; s = s.next)
         {
            StylingRuleSelector sel = (StylingRuleSelector)(uintptr)s.data;
            FieldValue value { };
            CMSSExpression e = sel.exp;
            ExpFlags sFlags = e.compute(value, evaluator, runtime, null);
            flags |= sFlags;

            if(!sFlags.resolved || !value.i)
               apply = false;
            //callAgain = flags.callAgain;
         }
         *flg |= flags;
      }

      if(apply)
      {
         if(nestedRules)
            m = nestedRules.apply(object, m, evaluator, flg);
         if(m)
         {
            //Iterator<CMSSMemberInitList> itStyle { styles };
            Link itStyle = styles ? styles.list.last : null;
            while(itStyle) //.Prev())
            {
               CMSSMemberInitList initList = (CMSSMemberInitList)(uintptr)itStyle.data;
               //Iterator<CMSSMemberInit> itMember { itStyle.data };
               Link itMember = initList.list.last;
               while(itMember) //.Prev())
               {
                  CMSSMemberInit member = (CMSSMemberInit)itMember.data;
                  CMSSExpression e = member.initializer;
                  StylesMask sm = member.stylesMask;
                  if(sm & m)
                  {
                     applyStyle(object, sm & m, evaluator, e, flg);
                     m &= ~sm;
                  }
                  itMember = itMember.prev;
               }
               itStyle = itStyle.prev;
            }
         }
      }
      return m;
   }

   private static void ::applyStyle(void * object, StylesMask mSet, ECCSSEvaluator evaluator, CMSSExpression e, ExpFlags * flg)
   {
      CMSSExpInstance inst = e && e._class == class(CMSSExpInstance) ? (CMSSExpInstance)e : null;
      CMSSExpArray arr = e && e._class == class(CMSSExpArray) ? (CMSSExpArray)e : null;
      int unit = 0;

      if(inst && inst.instance)
      {
         CMSSSpecName spec = (CMSSSpecName)inst.instance._class;
         String n = spec ? spec.name : null;
         if(n && !strcmpi(n, "Meters"))     // TODO: make this generic
         {
            unit = 1; // meters
            e = null;
            for(i : inst.instance.members)
            {
               CMSSMemberInitList members = i;
               for(m : members)
               {
                  CMSSMemberInit mInit = m;
                  if(mInit.initializer)
                  {
                     e = mInit.initializer;
                     if(!e.destType) e.destType = class(double);
                     break;
                  }
               }
               if(e) break;
            }
            inst = null;
         }
         else if(object)
            applyInstanceStyle(object, mSet, inst, evaluator, flg);
      }

      if(arr)
      {
         if(evaluator != null)
         {
            // TODO: Do this in a more generic manner
            Array<Instance> array = object ? evaluator.evaluatorClass.accessSubArray(object, mSet) : null;
            if(array)
               for(e : arr.elements; e._class == class(CMSSExpInstance))
                  array.Add(createGenericInstance((CMSSExpInstance)e, evaluator, flg));
            else
            {
               // New more generic approach for colormaps etc. with blob, which could eventually work for GEs as well?
               FieldValue value { };
               ExpFlags mFlg = e.compute(value, evaluator, runtime, e.destType); // TODO: Review stylesClass here?
               if(object)
                  evaluator.evaluatorClass.applyStyle(object, mSet, value, unit);
               *flg |= mFlg;
            }
         }
      }
      else if(e && !inst)
      {
         FieldValue value { };
         ExpFlags mFlg = e.compute(value, evaluator, runtime, e.destType); // TODO: Review stylesClass here?
         Class destType = e.destType;
         Class expType = e.expType;
         if(mFlg.resolved && destType && expType != destType)
         {
            if(destType == class(float) || destType == class(double))
               convertFieldValue(value, {real}, value);
            else if(destType == class(String))
               convertFieldValue(value, {text}, value);
            else if(destType == class(int64) || destType == class(int) || destType == class(uint64) || destType == class(uint))
               convertFieldValue(value, {integer}, value);
         }
         if(object)
            evaluator.evaluatorClass.applyStyle(object, mSet, value, unit);
         *flg |= mFlg;
      }
   }

   private static void ::applyInstanceStyle(void * object, StylesMask mask, CMSSExpInstance inst,
      ECCSSEvaluator evaluator, ExpFlags * flg)
   {
      if(inst)
      {
         for(i : inst.instance.members)
         {
            CMSSMemberInitList members = i;
            for(m : members)
            {
               CMSSMemberInit mInit = m;
               if(mInit.initializer)
               {
                  StylesMask sm = mInit.stylesMask;
                  if(sm & mask)
                  {
                     applyStyle(object, sm & mask, evaluator, mInit.initializer, flg);
                     mask &= ~sm;
                  }
               }
            }
         }
      }
   }
};
