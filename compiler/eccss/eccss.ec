public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA"   // For FieldValue

import "expressions"

// For extending ECCSS with custom identifiers and styling properties
public struct ECCSSEvaluator
{
   subclass(ECCSSEvaluator) evaluatorClass;        // This is effectively adding a virtual function table...

   virtual Class resolve(const CMSSIdentifier identifier, int * fieldID, ExpFlags * flags);
   virtual void compute(int fieldID, const CMSSIdentifier identifier, FieldValue value, ExpFlags * flags);
   virtual void evaluateMember(DataMember prop, CMSSExpression exp, const FieldValue parentVal, FieldValue value, ExpFlags * flags);

   // NOTE: These are quite likely to change...
   virtual String ::stringFromMask(StylesMask mask);
   virtual StylesMask ::maskFromString(const String s);
   virtual void ::setMember(void * obj, StylesMask mSet, CMSSExpConstant c);
   virtual Array<Instance> ::accessSubArray(void * obj, StylesMask mask);
};

public class CMSSStyleSheet
{
public:
   StylingRuleBlockList list;

   private CMSSStyleSheet bind(ECCSSEvaluator evaluator, Class stylesClass, const String name)
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

   void write(const String path)
   {
      File f = FileOpen(path, write);
      if(list)
         list.print(f, 0, 0);
      delete f;
   }

   CMSSStyleSheet ::load(const String fileName)
   {
      StylingRuleBlockList list = null;
      File f = fileName ? FileOpen(fileName, read) : null;
      if(f)
      {
         CMSSLexer lexer { };
         lexer.initFile(f);
         list = StylingRuleBlockList::parse(lexer);
         delete lexer;
         delete f;
      }

      return list ? CMSSStyleSheet { list = list } : null;
   }
}

public class StylesMask : uint64 { bool bitMember:1:63; } // Just to force this to be a bit class...

public class StylesList : CMSSList<CMSSMemberInitList>
{
   StylesMask mask;
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
   StylingRuleSelector ::parse(CMSSLexer lexer)
   {
      StylingRuleSelector selector { };
      if(lexer.peekToken().type == '[')
         lexer.readToken();
      selector.exp = CMSSExpression::parse(lexer);
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
}

private Instance createGenericInstance(CMSSExpInstance inst, ECCSSEvaluator evaluator, ExpFlags * flg)
{
   CMSSSpecName specName = (CMSSSpecName)inst.instance._class;
   Class c = specName ? eSystem_FindClass(specName._class.module, specName.name) : inst.destType;
   Instance instance = eInstance_New(c);
   setGenericInstanceMembers(instance, inst, evaluator, flg);
   return instance;
}

private void setGenericBitMembers(CMSSExpInstance expInst, uint64 * bits, ECCSSEvaluator evaluator, ExpFlags * flg)
{
   if(expInst)
   {
      for(i : expInst.instance.members)
      {
         CMSSInstInitMember member = (CMSSInstInitMember)i;
         for(m : member.members)
         {
            CMSSMemberInit mInit = m;
            if(mInit.initializer._class == class(CMSSInitExp))
            {
               CMSSInitExp initExp = (CMSSInitExp)mInit.initializer;
               CMSSExpression exp = initExp.exp;
               Class destType = exp.destType;
               if(destType)
               {
                  FieldValue val { };
                  ExpFlags flag = exp.compute(val, evaluator, runtime);
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

private void setGenericInstanceMembers(Instance object, CMSSExpInstance expInst, ECCSSEvaluator evaluator, ExpFlags * flg)
{
   if(expInst)
   {
      for(i : expInst.instance.members)
      {
         CMSSInstInitMember member = (CMSSInstInitMember)i;
         for(m : member.members)
         {
            CMSSMemberInit minit = m;
            if(minit.initializer._class == class(CMSSInitExp))
            {
               CMSSInitExp initExp = (CMSSInitExp)minit.initializer;
               CMSSExpression exp = initExp.exp;
               Class destType = exp.destType;
               if(destType)
               {
                  // Class c = exp._class;
                  FieldValue val { };
                  /*if(destType && !strcmp(destType.name, "GEFont"))
                     printf("here");*/
                  ExpFlags flag = exp.compute(val, evaluator, runtime); //-1

                  if(destType == class(int) || destType == class(bool) || destType == class(Color))
                     *(int *)((byte *)object + minit.offset) = val.type.type == integer ? (int)val.i : val.type.type == real ? (int)val.r : 0;
                  else if(destType == class(int64))
                     *(int64 *)((byte *)object + minit.offset) = val.type.type == integer ? (int64)val.i : val.type.type == real ? (int64)val.r : 0;
                  else if(destType == class(double))
                     *(double *)((byte *)object + minit.offset) = val.type.type == integer ? (double)val.i : val.type.type == real ? val.r : 0;
                  else if(destType == class(float))
                     *(float *)((byte *)object + minit.offset) = val.type.type == integer ? (float)val.i : val.type.type == real ? (float)val.r : 0;
                  else if(destType == class(String) && val.type.type == text)
                     *(String *)((byte *)object + minit.offset) = CopyString(val.s);
                  else if((destType.type == noHeadClass || destType.type == normalClass) && exp._class == class(CMSSExpInstance)) //destType is inappropriate here
                  {
                     //CMSSExpInstance i = (CMSSExpInstance)exp;
                     *(Instance *)((byte *)object + minit.offset) = (Instance)val.i;
                     //*(Instance *)((byte *)object + minit.offset) = createGenericInstance(i, cache, recordID, scale, time, flg);

                     //if we're freeing these Instances later, is it then the case that
                     //we give CMSSExpInstant this instData member and free it in destructor
                  }
                  else if(destType.type == structClass && exp._class == class(CMSSExpInstance))
                  {
                     memcpy((byte *)object + minit.offset, (void *)(uintptr)val.i, destType.structSize);
                  }
                  else if(destType.type == enumClass)    //assuming default of 32 bit
                  {
                     *(int *)((byte *)object + minit.offset) = val.type.type == integer ? (int)val.i : val.type.type == real ? (int)val.r : 0;
                  }
                  else if(flag.resolved) //!flag.callAgain && !flag.record)  //flag.resolved) //
                  {
                     /*ConsoleFile con { };
                     exp.print(con, 0,0);
                     PrintLn("Unexpected!");
                     */
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
            ExpFlags flags = e.compute(value, evaluator, preprocessing);
            if(flags.resolved)
            {
               e = simplifyResolved(value, e);
               delete e;
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
                  /*ExpFlags flags = */member.precompute(stylesClass, 0, null, evaluator);  // TODO: Consider these flags
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
            mask |= block.nestedRules.mask;
         }
         block.mask = mask;
         result = block;
      }
      return result;
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      out.PrintLn("");
      printIndent(indent, out);
      if(id)
      {
         out.Print("#");
         id.print(out, indent, o);
      }

      if(selectors)
         selectors.print(out, indent, o);

      if(id || selectors)
      {
         out.PrintLn("");
         printIndent(indent, out);
      }
      out.PrintLn("{");
      indent++;

      if(styles)
      {
         Iterator<CMSSMemberInitList> it { styles };
         while(it.Next())
         {
            CMSSMemberInitList list = it.data;

            printIndent(indent, out);
            list.print(out, indent, o);
            out.PrintLn(";");
         }
      }
      if(nestedRules)
         nestedRules.print(out, indent, o);

      indent--;
      printIndent(indent, out);

      out.PrintLn("}");
   }

   ~StylingRuleBlock()
   {
      delete selectors;
      delete id;
      delete styles;
      delete nestedRules;
   }
};
