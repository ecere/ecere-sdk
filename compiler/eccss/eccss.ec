public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA"   // For FieldValue

import "expressions"

// For extending ECCSS with custom identifiers and styling properties
public struct ECCSSEvaluator
{
   subclass(ECCSSEvaluator) evaluatorClass;        // This is effectively adding a virtual function table...

   virtual Class resolve(const CMSSIdentifier identifier, int * fieldID, ExpFlags * flags) { return null; }
   virtual void compute(int fieldID, const CMSSIdentifier identifier, FieldValue value, ExpFlags * flags);
   virtual void evaluateMember(DataMember prop, CMSSExpression exp, const FieldValue parentVal, FieldValue value, ExpFlags * flags);
   virtual void ::applyStyle(void * object, StylesMask mSet, const FieldValue value);

   // NOTE: These are quite likely to get ridden of with more generic code...
   virtual String ::stringFromMask(StylesMask mask, Class c) { return null; }
   virtual StylesMask ::maskFromString(const String s, Class c) { return 0; }
   virtual Array<Instance> ::accessSubArray(void * obj, StylesMask mask) { return null; }
};

public class CMSSStyleSheet
{
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
   bool changeStyle(const String id, StylesMask mask, FieldValue value)
   {
      bool result = false;
      StylingRuleBlock block = findRule(mask, id);
      if(block)
      {
         CMSSMemberInit mInit = block.styles ? block.styles.findStyle(mask) : null;
         if(mInit)
         {
            delete mInit.initializer;
            mInit.initializer = CMSSInitExp { exp = CMSSExpConstant { constant = value } };
            result = true;
         }
         // NOTE check outside instead. The issue is the likely need to pass a class, and this complicates matters
         /*else
         {
            ECCSSEvaluator evaluator { };//ECCSSEEvaluator { };
            block.styles = { };
            //block.styles.addStyle(mask, value, evaluator);
         }*/
      }
      return result;
   }
   //NOTE this ignores selectors!
   bool addStyle(const String id, StylesMask mask, FieldValue value, Class c, ECCSSEvaluator evaluator)
   {
      bool result = false;
      StylingRuleBlock block = findRule(mask, id);
      if(block)
      {
         if(!block.styles) block.styles = { };
         result = block.styles.addStyle(mask, value, c, evaluator);
      }
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

   void write(const String path)
   {
      File f = FileOpen(path, write);
      if(list)
         list.print(f, 0, 0);
      delete f;
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

   CMSSMemberInit findStyle(StylesMask mask)
   {
      // unbound sheet currently doesn't have mask set...
      // if(mask & this.mask)
      {
         for(e : this)
         {
            CMSSMemberInit mInit = e.findStyle(mask);
            if(mInit) return mInit;
         }
      }
      return null;
   }

   void removeStyle(StylesMask mask)
   {
      for(e : this)
      {
         e.removeStyle(mask);
      }
   }

   bool addStyle(StylesMask mask, FieldValue value, Class c, ECCSSEvaluator evaluator)
   {
      bool result = false;
      CMSSMemberInitList mList { };
      this.Add(mList);
      result = mList.addStyle(mask, value, c, evaluator);
      return result;
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

   StylesMask apply(void * object, StylesMask m, ECCSSEvaluator evaluator, ExpFlags * flg)
   {
      Iterator<StylingRuleBlock> it { list };
      while(it.Prev())
      {
         StylingRuleBlock block = it.data;
         StylesMask bm = block.mask & m;
         if(bm)
            m = block.apply(object, m, evaluator, flg);
      }
      return m;
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
            CMSSMemberInit mInit = m;
            if(mInit.initializer._class == class(CMSSInitExp))
            {
               CMSSInitExp initExp = (CMSSInitExp)mInit.initializer;
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
                     *(int *)((byte *)object + mInit.offset) = val.type.type == integer ? (int)val.i : val.type.type == real ? (int)val.r : 0;
                  else if(destType == class(int64))
                     *(int64 *)((byte *)object + mInit.offset) = val.type.type == integer ? (int64)val.i : val.type.type == real ? (int64)val.r : 0;
                  else if(destType == class(double))
                     *(double *)((byte *)object + mInit.offset) = val.type.type == integer ? (double)val.i : val.type.type == real ? val.r : 0;
                  else if(destType == class(float))
                     *(float *)((byte *)object + mInit.offset) = val.type.type == integer ? (float)val.i : val.type.type == real ? (float)val.r : 0;
                  else if(destType == class(String))
                  {
                     *(String *)((byte *)object + mInit.offset) =
                        (val.type.type == text)    ? CopyString(val.s)  :
                        (val.type.type == real)    ? PrintString(val.r) :
                        (val.type.type == integer) ? PrintString(val.i) : null;
                  }
                  else if((destType.type == noHeadClass || destType.type == normalClass) && exp._class == class(CMSSExpInstance)) //destType is inappropriate here
                  {
                     //CMSSExpInstance i = (CMSSExpInstance)exp;
                     *(Instance *)((byte *)object + mInit.offset) = (Instance)val.i;
                     //*(Instance *)((byte *)object + mInit.offset) = createGenericInstance(i, cache, recordID, scale, time, flg);

                     //if we're freeing these Instances later, is it then the case that
                     //we give CMSSExpInstance this instData member and free it in destructor
                  }
                  else if(destType.type == structClass && exp._class == class(CMSSExpInstance))
                  {
                     memcpy((byte *)object + mInit.offset, (void *)(uintptr)val.i, destType.structSize);
                  }
                  else if(destType.type == enumClass)    //assuming default of 32 bit
                  {
                     *(int *)((byte *)object + mInit.offset) = val.type.type == integer ? (int)val.i : val.type.type == real ? (int)val.r : 0;
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

   // Returns first rule block intersecting mask and containing name
   StylingRuleBlock findRule(StylesMask mask, const String name)
   {
      if(id && id.string && name && strcmpi(id.string, name))
         return null;

      // unbound sheet currently doesn't have mask set...
      // if(!(this.mask & mask)) return null;

      if(styles && styles.GetCount())
      {
         //return this;
         for(s : styles)
         {
            for(m : s)
            {
               CMSSMemberInit mInit = m;
               //Class c = mInit.dataMember ? mInit.dataMember._class : null;
               StylesMask sm = mInit.stylesMask;
               if(sm & mask) return this;

               /*if(mInit.identifiers)
               {
                  String id = null;
                  for(i : mInit.identifiers)
                  {
                     // FIXME: hardcoded...
                     if(i.string && !strcmpi(i.string, "opacity"))
                        return this;

                     String s = id ? PrintString(id, ".", i.string) : CopyString(i.string);
                     delete id;
                     id = s;
                  }
                  //if(stringFromMask(sm, c) || maskFromString(id, c)) return this;
               }*/
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
      // NOTE this is the rule created from getstylingruleex with unset style
      if(!styles && id && id.string && name && !strcmpi(id.string, name)) return this;
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
            ExpFlags flags = e.compute(value, evaluator, preprocessing);
            if(flags.resolved)
            {
               e = simplifyResolved(value, e);
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
               member.precompute(stylesClass, 0, null, evaluator);  // TODO: Consider these flags
            }
         }
      }

      if(nestedRules)
      {
         for(b : nestedRules)
         {
            b.resolve(evaluator, stylesClass);
         }
      }
      result = true;

      return result;
   }

   bool changeStyle(StylesMask mask, FieldValue value)
   {
      bool result = false;
      if(this)
      {
         CMSSMemberInit mInit = styles ? styles.findStyle(mask) : null;
         if(mInit)
         {
            delete mInit.initializer;
            mInit.initializer = CMSSInitExp { exp = CMSSExpConstant { constant = value } };
            result = true;
         }
      }
      return result;
   }

   bool addStyle(StylesMask mask, FieldValue value, Class c, ECCSSEvaluator evaluator)
   {
      bool result = false;
      if(this)
      {
         if(!styles) styles = { };
         result = styles.addStyle(mask, value, c, evaluator);
      }
      return result;
   }

   void removeStyle(StylesMask mask)
   {
      if(this)
      {
         styles.removeStyle(mask);
      }
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

   // TOCHECK: Both mask and flags must be returned?
   private static StylesMask apply(void * object, StylesMask m, ECCSSEvaluator evaluator, ExpFlags * flg)
   {
      ExpFlags flags = 0;
      bool apply = true;

      if(selectors)
      {
         // TODO: Per-record flags for selectors?
         for(s : selectors)
         {
            FieldValue value { };
            CMSSExpression e = s.exp;
            ExpFlags sFlags = e.compute(value, evaluator, runtime);
            flags |= sFlags;

            if(!sFlags.resolved || !value.i)
               apply = false;
            //callAgain = flags.callAgain;
         }
         *flg |= flags;
      }

      if(apply)
      {
         if(nestedRules) m = nestedRules.apply(object, m, evaluator, flg);
         if(m)
         {
            Iterator<CMSSMemberInitList> itStyle { styles };
            while(itStyle.Prev())
            {
               Iterator<CMSSMemberInit> itMember { itStyle.data };
               while(itMember.Prev())
               {
                  CMSSMemberInit member = itMember.data;
                  CMSSInitExp initExp = member.initializer && member.initializer._class == class(CMSSInitExp) ? (CMSSInitExp)member.initializer : null;
                  CMSSExpression e = initExp.exp;
                  StylesMask sm = member.stylesMask;
                  if(sm & m)
                  {
                     applyStyle(object, sm & m, evaluator, e, flg);
                     m &= ~sm;
                  }
               }
            }
         }
      }
      return m;
   }

   private static void ::applyStyle(void * object, StylesMask mSet, ECCSSEvaluator evaluator, CMSSExpression e, ExpFlags * flg)
   {
      CMSSExpInstance inst = e._class == class(CMSSExpInstance) ? (CMSSExpInstance)e : null;
      CMSSExpArray arr = e._class == class(CMSSExpArray) ? (CMSSExpArray)e : null;
      if(inst)
         applyInstanceStyle(object, mSet, inst, evaluator, flg);
      else if(arr)
      {
         if(evaluator != null)
         {
            // TODO: Do this in a more generic manner
            Array<Instance> array = evaluator.evaluatorClass.accessSubArray(object, mSet);
            if(array)
               for(e : arr.elements; e._class == class(CMSSExpInstance))
                  array.Add(createGenericInstance((CMSSExpInstance)e, evaluator, flg));
         }
      }
      else
      {
         FieldValue value { };
         ExpFlags mFlg = e.compute(value, evaluator, runtime);
         Class destType = e.destType;
         if(mFlg.resolved && destType && e.expType != destType)
         {
            if(destType == class(float) || destType == class(double))
               convertFieldValue(value, real, value);
            else if(destType == class(String))
               convertFieldValue(value, text, value);
            else if(destType == class(int64) || destType == class(int) || destType == class(uint64) || destType == class(uint))
               convertFieldValue(value, integer, value);
         }
         evaluator.evaluatorClass.applyStyle(object, mSet, value);
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
            CMSSInstInitMember member = (CMSSInstInitMember)i;
            for(m : member.members)
            {
               CMSSMemberInit mInit = m;
               if(mInit.initializer._class == class(CMSSInitExp))
               {
                  CMSSInitExp initExp = (CMSSInitExp)mInit.initializer;
                  StylesMask sm = mInit.stylesMask;
                  if(sm & mask)
                  {
                     applyStyle(object, sm & mask, evaluator, initExp.exp, flg);
                     mask &= ~sm;
                  }
               }
            }
         }
      }
   }
};
