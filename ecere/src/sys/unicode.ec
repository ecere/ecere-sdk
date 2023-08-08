namespace sys;

import "File"

public int UTF8toISO8859_1(const char * source, char * dest, int max)
{
   unichar ch;
   int nb;
   int c;
   int d = 0;
   for(c = 0; (ch = UTF8GetChar(source + c, &nb)) && d < max-1; c += nb)
   {
      if(ch < 256)
         dest[d] = (byte)ch;
      else
         dest[d] = '?';
      d++;
   }
   dest[d] = 0;
   return d;
}

public uint16 * UTF8toUTF16Len(const char * source, int byteCount, int * wordCount)
{
   if(source)
   {
      uint16 * dest = new uint16[byteCount + 1];
      int c;
      int d = 0;
      bool error = false;
      for(c = 0; c<byteCount && source[c];)
      {
         byte ch = source[c];
         unichar codePoint = 0;
         int numBytes = 1;
         int i;
         byte mask = 0x7F;
         if(ch & 0x80 && ch & 0x40)
         {
            numBytes++;
            mask >>= 2;
            if(ch & 0x20)
            {
               numBytes++;
               mask >>= 1;
               if(ch & 0x10)
               {
                  if(ch & 0x08)
                     error = true;
                  else
                  {
                     numBytes++;
                     mask >>= 1;
                  }
               }
            }
         }
         for(i = 0; i<numBytes; i++, c++)
         {
            if(c >= byteCount || !(ch = source[c]))
            {
               error = true;
               break;
            }
            codePoint <<= 6;
            codePoint |= ch & mask;
            mask = 0x3F;

            if(i > 1)
            {
               if(!(ch & 0x80) || (ch & 0x40))
               {
                  error = true;
                  break;
               }
            }
         }
         if(i < numBytes)
            error = true;
         if(codePoint > 0x10FFFF || (codePoint >= 0xD800 && codePoint <= 0xDFFF) ||
           (codePoint < 0x80 && numBytes > 1) ||
           (codePoint < 0x800 && numBytes > 2) ||
           (codePoint < 0x10000 && numBytes > 3))
            error = true;
         if(error)
         {
            c = byteCount;
            d = 0;
            break;
         }

         if(codePoint > 0xFFFF)
         {
            uint16 lead = (uint16)(LEAD_OFFSET + (codePoint >> 10));
            uint16 trail = (uint16)(0xDC00 | (codePoint & 0x3FF));

            dest[d++] = lead;
            dest[d++] = trail;
         }
         else
         {
            dest[d++] = (uint16)codePoint;
         }
      }
      *wordCount = d + byteCount - c;
      dest[d] = 0;
      return dest;
   }
   *wordCount = 0;
   return null;
}

public int UTF8toUTF16BufferLen(const char * source, uint16 * dest, int max, int len)
{
   if(source)
   {
      int c;
      int d = 0;
      for(c = 0; c < len && source[c];)
      {
         byte ch = source[c];
         unichar codePoint = 0;
         int numBytes = 1;
         int i;
         byte mask = 0x7F;
         if(ch & 0x80 && ch & 0x40)
         {
            mask >>= 2;
            numBytes++;
            if(ch & 0x20)
            {
               numBytes++;
               mask >>= 1;
               if(ch & 0x10)
               {
                  numBytes++;
                  mask >>= 1;
               }
            }
         }
         for(i = 0; i<numBytes; i++)
         {
            codePoint <<= 6;
            codePoint |= source[c++] & mask;
            mask = 0x3F;
         }

         if(codePoint > 0xFFFF)
         {
            uint16 lead = (uint16)(LEAD_OFFSET + (codePoint >> 10));
            uint16 trail = (uint16)(0xDC00 | (codePoint & 0x3FF));
            if(d >= max - 1) break;
            dest[d++] = lead;
            dest[d++] = trail;
         }
         else
         {
            if(d >= max) break;
            dest[d++] = (uint16)codePoint;
         }
      }
      dest[d] = 0;
      return d;
   }
   return 0;
}

public int UTF16BEtoUTF8Buffer(const uint16 * source, byte * dest, int max)
{
   int c;
   int d = 0;
   uint16 u16;
   for(c = 0; (u16 = ((source[c] & 0xFF00) >> 8) | ((source[c] & 0x00FF) << 8)); c++)
   {
      unichar ch;
      if(u16 < 0xD800 || u16 > 0xDBFF)
      {
         // TOFIX: PRECOMP ERROR IF NO BRACKETS
         ch = (unichar)u16;
      }
      else
      {
         // TOFIX: PRECOMP ERROR IF NO BRACKETS
         ch = ((unichar)u16 << 10) + source[c++] + SURROGATE_OFFSET;
      }

      if(ch < 0x80)
      {
         if(d + 1 >= max) break;
         dest[d++] = (char)ch;
      }
      else if(ch < 0x800)
      {
         if(d + 2 >= max) break;
         dest[d++] = (byte)(0xC0 | ((ch & 0x7C0) >> 6));
         dest[d++] = (byte)(0x80 | (ch & 0x03F));
      }
      else if(ch < 0x10000)
      {
         if(d + 3 >= max) break;
         dest[d++] = (byte)(0xE0 | ((ch & 0xF000) >> 12));
         dest[d++] = (byte)(0x80 | ((ch & 0xFC0) >> 6));
         dest[d++] = (byte)(0x80 | (ch & 0x03F));
      }
      else
      {
         if(d + 4 >= max) break;
         dest[d++] = (byte)(0xF0 | ((ch & 0x1C0000) >> 18));
         dest[d++] = (byte)(0x80 | ((ch & 0x3F000) >> 12));
         dest[d++] = (byte)(0x80 | ((ch & 0xFC0) >> 6));
         dest[d++] = (byte)(0x80 | (ch & 0x03F));
      }
   }
   dest[d] = 0;
   return d;
}

enum LineBreakClass
{
   OP, CL, QU, GL, NS, EX, SY, IS, PR, PO,
   NU, AL, ID, IN, HY, BA, BB, B2, ZW, CM,
   WJ, H2, H3, JL, JV, JT, SA, SG, SP, CR,
   LF, BK
};

public enum CharCategory
{
   none = 0,

   Mn = 1, markNonSpacing       = 1,
   Mc = 2, markSpacing          = 2,
   Me = 3, markEnclosing        = 3,

   Nd = 4, numberDecimalDigit   = 4,
   Nl = 5, numberLetter         = 5,
   No = 6, numberOther          = 6,

   Zs = 7, separatorSpace       = 7,
   Zl = 8, separatorLine        = 8,
   Zp = 9, separatorParagraph   = 9,

   Cc = 10, otherControl         = 10,
   Cf = 11, otherFormat          = 11,
   Cs = 12, otherSurrogate       = 12,
   Co = 13, otherPrivateUse      = 13,
   Cn = 14, otherNotAssigned     = 14,

   Lu = 15, letterUpperCase      = 15,
   Ll = 16, letterLowerCase      = 16,
   Lt = 17, letterTitleCase      = 17,
   Lm = 18, letterModifier       = 18,
   Lo = 19, letterOther          = 19,

   Pc = 20, punctuationConnector = 20,
   Pd = 21, punctuationDash      = 21,
   Ps = 22, punctuationOpen      = 22,
   Pe = 23, punctuationClose     = 23,
   Pi = 24, punctuationInitial   = 24,
   Pf = 25, punctuationFinal     = 25,
   Po = 26, punctuationOther     = 26,

   Sm = 27, symbolMath           = 27,
   Sc = 28, symbolCurrency       = 28,
   Sk = 29, symbolModifier       = 29,
   So = 30, symbolOther          = 30
};

public class CharCategories : uint
{
public:
   bool none:1;
   bool markNonSpacing:1, markSpacing:1, markEnclosing:1;
   bool numberDecimalDigit:1, numberLetter:1, numberOther:1;
   bool separatorSpace:1,separatorLine:1,separatorParagraph:1;
   bool otherControl:1,otherFormat:1,otherSurrogate:1,otherPrivateUse:1,otherNotAssigned:1;
   bool letterUpperCase:1, letterLowerCase:1, letterTitleCase:1, letterModifier:1, letterOther:1;
   bool punctuationConnector:1, punctuationDash:1, punctuationOpen:1, punctuationClose:1, punctuationInitial:1, punctuationFinal:1, punctuationOther:1;
   bool symbolMath:1, symbolCurrency:1, symbolModifier:1, symbolOther:1;
};

public enum PredefinedCharCategories : CharCategories
{
   none = CharCategories { none = true },
   marks = CharCategories { markNonSpacing = true, markSpacing = true, markEnclosing = true },
   numbers = CharCategories { numberDecimalDigit = true, numberLetter = true, numberOther = true },
   separators = CharCategories { separatorSpace = true, separatorLine = true, separatorParagraph = true },
   others = CharCategories { otherControl = true, otherFormat = true, otherSurrogate = true, otherPrivateUse = true, otherNotAssigned = true },
   letters = CharCategories { letterUpperCase = true, letterLowerCase = true, letterTitleCase = true, letterModifier = true, letterOther = true },
   punctuation = CharCategories { punctuationConnector = true, punctuationDash = true, punctuationOpen = true, punctuationClose = true, punctuationInitial = true,
                     punctuationFinal = true, punctuationOther = true },
   symbols = CharCategories { symbolMath = true, symbolCurrency = true, symbolModifier = true, symbolOther = true },
   connector = CharCategories { punctuationConnector = true }
};

public bool GetAlNum(const char ** input, char * string, int max)
{
   int c = 0;
   unichar ch;
   int nb = 1;
   bool result = true;
   const char * buffer = *input;
   if(!buffer[0]) { string[0]=0; return false; }

   // Eat all left spacing, leave last char in ch
   for(;;)
   {
#if defined(ECERE_NOUNICODE) || defined(ECERE_BOOTSTRAP)
      ch = *buffer;
#else
      ch = UTF8GetChar(buffer, &nb);
#endif
      if(!ch) { result = false; break; }

#if defined(ECERE_NOUNICODE) || defined(ECERE_BOOTSTRAP)
      if(isalnum(ch))
#else
      if(CharMatchCategories(ch, numbers|letters))
#endif
         break;
      else
         buffer += nb;
   }
   if(result)
   {
      while(c < max-1)
      {
         int i;
         for(i = 0; i < nb && c < max-1; i++)
            string[c++] = *(buffer++);

#if defined(ECERE_NOUNICODE) || defined(ECERE_BOOTSTRAP)
         ch = *buffer;
#else
         ch = UTF8GetChar(buffer, &nb);
#endif
         if(!ch) break; // End of input string

#if defined(ECERE_NOUNICODE) || defined(ECERE_BOOTSTRAP)
         if(!isalnum(ch))
#else
         if(!CharMatchCategories(ch, numbers|letters))
#endif
            // End of this alpha numeric word
            break;
      }
      string[c]=0;
   }
   *input = buffer;
   return result;
}

public class UnicodeDecomposition : uint32 { public: bool canonical:1, compat:1, fraction:1, font:1, noBreak:1, initial:1, final:1, medial:1, isolated:1, circle:1, square:1, sub:1, super:1, small:1, vertical:1, wide:1, narrow:1; };

static struct Range
{
   uint start, end;
   CharCategory category;
};

static struct RangeCC
{
   uint start, end;
   uint cclass;
};

static struct CaseFoldingKey
{
   unichar codePoint;
   unichar character[3];
};

static struct DecompKey
{
   unichar codePoint;
   unichar character[2];
};

static struct CompatDecompKey
{
   unichar codePoint;
   unichar character[18];
   UnicodeDecomposition type;
};

static struct CompositionKey
{
   unichar codePoint1;
   unichar codePoint2;
   unichar composed;
};

static int CompareRange(BinaryTree tree, Range a, Range b)
{
   if(a.start > b.end)
      return 1;
   else if(a.end < b.start)
      return -1;
   else
      return 0;
}

static int CompareRangeCC(BinaryTree tree, RangeCC a, RangeCC b)
{
   if(a.start > b.end)
      return 1;
   else if(a.end < b.start)
      return -1;
   else
      return 0;
}

static int CompareCFKey(BinaryTree tree, CaseFoldingKey a, CaseFoldingKey b)
{
   if(a.codePoint > b.codePoint)
      return 1;
   else if(a.codePoint < b.codePoint)
      return -1;
   else
      return 0;
}

static int CompareDecompKey(BinaryTree tree, DecompKey a, DecompKey b)
{
   if(a.codePoint > b.codePoint)
      return 1;
   else if(a.codePoint < b.codePoint)
      return -1;
   else
      return 0;
}

static int CompareCompatDecompKey(BinaryTree tree, CompatDecompKey a, CompatDecompKey b)
{
   if(a.codePoint > b.codePoint)
      return 1;
   else if(a.codePoint < b.codePoint)
      return -1;
   else
      return 0;
}

static int CompareCompositionKey(BinaryTree tree, CompositionKey a, CompositionKey b)
{
   if(a.codePoint1 > b.codePoint1)
      return 1;
   else if(a.codePoint1 < b.codePoint1)
      return -1;
   else if(a.codePoint2 > b.codePoint2)
      return 1;
   else if(a.codePoint2 < b.codePoint2)
      return -1;
   else return 0;
}

static void FreeRange(Range range)
{
   delete range;
}

static void FreeRangeCC(RangeCC range)
{
   delete range;
}

static void FreeCaseFoldingKey(CaseFoldingKey key)
{
   //int i;
   //for(i = 0; i < 3; i++)
      //delete key.character[i];
   delete key;
}

static void FreeDecompKey(DecompKey key)
{
   //int i;
   //for(i = 0; i < 2; i++)
      //delete key.character[i];
   delete key;
}

static void FreeCompatDecompKey(CompatDecompKey key)
{
   delete key;
}

static void FreeCompositionKey(CompositionKey key)
{
   delete key;
}

static CharCategory asciiCategories[] =
{
   Cc, Cc, Cc, Cc, Cc, Cc, Cc, Cc,
   Cc, Cc, Cc, Cc, Cc, Cc, Cc, Cc,
   Cc, Cc, Cc, Cc, Cc, Cc, Cc, Cc,
   Cc, Cc, Cc, Cc, Cc, Cc, Cc, Cc,
   Zs, Po, Po, Po, Sc, Po, Po, Po,
   Ps, Pe, Po, Sm, Cs, Pd, Po, Po,
   Nd, Nd, Nd, Nd, Nd, Nd, Nd, Nd,
   Nd, Nd, Po, Po, Sm, Sm, Sm, Po,
   Po, Lu, Lu, Lu, Lu, Lu, Lu, Lu,
   Lu, Lu, Lu, Lu, Lu, Lu, Lu, Lu,
   Lu, Lu, Lu, Lu, Lu, Lu, Lu, Lu,
   Lu, Lu, Lu, Ps, Po, Pe, Sk, Pc,
   Sk, Ll, Ll, Ll, Ll, Ll, Ll, Ll,
   Ll, Ll, Ll, Ll, Ll, Ll, Ll, Ll,
   Ll, Ll, Ll, Ll, Ll, Ll, Ll, Ll,
   Ll, Ll, Ll, Ps, Sm, Pe, Sm, Cc
};

static class UnicodeDatabase
{
   BinaryTree categories
   {
      CompareKey = (void *)CompareRange;
      FreeKey = (void *)FreeRange;
   };

   BinaryTree combiningClasses
   {
      CompareKey = (void *)CompareRangeCC;
      FreeKey = (void *)FreeRangeCC;
   };

   BinaryTree decompositionMappings
   {
      CompareKey = (void *)CompareDecompKey;
      FreeKey = (void *)FreeDecompKey;
   };

   BinaryTree compositionMappings
   {
      CompareKey = (void *)CompareCompositionKey;
      FreeKey = (void *)FreeCompositionKey;
   };

   BinaryTree compatibilityDecompMappings
   {
      CompareKey = (void *)CompareCompatDecompKey;
      FreeKey = (void *)FreeCompatDecompKey;
   };

   BinaryTree caseFoldings
   {
      CompareKey = (void *)CompareCFKey;
      FreeKey = (void *)FreeCaseFoldingKey;
   };

   BinaryTree compositionExclusions
   {
      CompareKey = (void *)CompareRange;
      FreeKey = (void *)FreeRange;
   };

   UnicodeDatabase()
   {
      File f = FileOpen("<:ecere>unicode/derivedGeneralCategoryStripped.txt", read);
      File combiningClassFile, caseFoldingFile, decompFile, compatFile;
      if(f)
      {
         char line[1024];
         while(f.GetLine(line, 1024))
         {
            if(line[0] && line[0] != '#')
            {
               char * endPtr;
               uint start = (uint)strtoul(line, &endPtr, 16);
               if(endPtr)
               {
                  uint end = (endPtr && *endPtr == '.') ? (uint)strtoul(endPtr + 2, &endPtr, 16) : start;
                  if(endPtr)
                  {
                     endPtr = strchr(endPtr, ';');
                     if(endPtr)
                     {
                        CharCategory category = none;
                        endPtr += 2;
                        switch(*endPtr)
                        {
                           case 'C':
                              switch(endPtr[1])
                              {
                                 case 'n': category = Cn; break;
                                 case 'c': category = Cc; break;
                                 case 'f': category = Cf; break;
                                 case 'o': category = Co; break;
                                 case 's': category = Cs; break;
                              }
                              break;
                           case 'L':
                              switch(endPtr[1])
                              {
                                 case 'u': category = Lu; break;
                                 case 'l': category = Ll; break;
                                 case 't': category = Lt; break;
                                 case 'm': category = Lm; break;
                                 case 'o': category = Lo; break;
                              }
                              break;
                           case 'M':
                              switch(endPtr[1])
                              {
                                 case 'n': category = Mn; break;
                                 case 'e': category = Me; break;
                                 case 'c': category = Mc; break;
                              }
                              break;
                           case 'Z':
                              switch(endPtr[1])
                              {
                                 case 's': category = Zs; break;
                                 case 'l': category = Zl; break;
                                 case 'p': category = Zp; break;
                              }
                              break;
                           case 'P':
                              switch(endPtr[1])
                              {
                                 case 'd': category = Pd; break;
                                 case 's': category = Ps; break;
                                 case 'e': category = Pe; break;
                                 case 'c': category = Pc; break;
                                 case 'o': category = Po; break;
                                 case 'i': category = Pi; break;
                                 case 'f': category = Pf; break;
                              }
                              break;
                           case 'S':
                              switch(endPtr[1])
                              {
                                 case 'm': category = Sm; break;
                                 case 'c': category = Sc; break;
                                 case 'k': category = Sk; break;
                                 case 'o': category = So; break;
                              }
                              break;
                           case 'N':
                              switch(endPtr[1])
                              {
                                 case 'd': category = Nd; break;
                                 case 'l': category = Nl; break;
                                 case 'o': category = No; break;
                              }
                              break;
                        }
                        if(category)
                        {
                           Range range { start, end, category };
                           BTNode node { key = (uintptr) &range };
                           if(categories.Add(node))
                           {
                              node.key = (uintptr)new Range[1];
                              *(Range *)node.key = range;
                           }
                           else
                              delete node;
                        }
                     }
                  }
               }
            }
         }
         delete f;
         /*
         f = FileOpen("DerivedGeneralCategoryStripped.txt", write);
         if(f)
         {
            BTNode node;
            for(node = categories.first; node; node = node.next)
            {
               Range * range = (Range *)node.key;
               char string[64];
               int len, c;

               if(range->end > range->start)
                  sprintf(string, "%04x..%04x", range->start, range->end);
               else
                  sprintf(string, "%04x", range->start);
               len = strlen(string);
               for(c = len; c<14; c++)
                  string[len++] = ' ';
               string[len++] = ';';
               string[len++] = ' ';
               range->category.OnGetString(string + len, null, null);
               len += 2;
               string[len++] = '\n';
               string[len] = '\0';
               f.Puts(string);
            }
            delete f;
         }
         */
      }

      combiningClassFile = FileOpen("<:ecere>unicode/derivedCombiningClassStripped.txt", read);
      if(combiningClassFile)
      {
         char line[1024];
         while(combiningClassFile.GetLine(line, 1024))
         {
            if(line[0] && line[0] != '#')
            {
               char * endPtr;
               uint start = (uint)strtoul(line, &endPtr, 16);
               if(endPtr)
               {
                  uint end = (endPtr && *endPtr == '.') ? (uint)strtoul(endPtr + 2, &endPtr, 16) : start;
                  if(endPtr)
                  {
                     endPtr = strchr(endPtr, ';');
                     if(endPtr)
                     {
                        uint cclass = 0;
                        endPtr += 2;
                        cclass = strtol(endPtr, null, 0);
                        if(cclass)
                        {
                           RangeCC range { start, end, cclass };
                           BTNode node { key = (uintptr) &range };
                           if(combiningClasses.Add(node))
                           {
                              RangeCC * rangePtr = new RangeCC[1];
                              *rangePtr = range;
                              node.key = (uintptr)rangePtr;
                           }
                           else
                              delete node;
                        }
                     }
                  }
               }
            }
         }
         delete combiningClassFile;
      }

      caseFoldingFile = FileOpen("<:ecere>unicode/caseFoldingStripped.txt", read);
      if(caseFoldingFile)
      {
         char line[1024];
         while(caseFoldingFile.GetLine(line, 1024))
         {
            if(line[0] && line[0] != '#')
            {
               char * endPtr;
               unichar codePoint = (uint)strtoul(line, &endPtr, 16);
               if(endPtr)
               {
                  if(endPtr)
                  {
                     endPtr = strchr(endPtr, ';');
                     if(endPtr)
                     {
                        //CaseFolding caseFolding = none;
                        bool isSingleChar = true;
                        endPtr += 2;
                        switch(*endPtr)
                        {
                           case 'C':
                              break;
                           case 'F':
                              isSingleChar = false; // what do we do with this
                              break;
                        }
                        endPtr = strchr(endPtr, ';');
                        if(endPtr)
                        {
                           unichar caseFolding[3] = { 0, 0, 0 };
                           int cnt = 1;
                           endPtr += 2;
                           caseFolding[0] = strtol(endPtr, null, 16);
                           if(!isSingleChar)
                           {
                              while(true)
                              {
                                 endPtr = strchr(endPtr, ' ');
                                 if(endPtr)
                                 {
                                    uint cf;
                                    endPtr += 1;
                                    cf = strtol(endPtr, null, 16);
                                    if(cf)
                                       caseFolding[cnt++] = cf;
                                 }
                                 else
                                    break;
                              }
                           }
                           {
                              CaseFoldingKey k { codePoint };
                              BTNode node;
                              k.character[0] = caseFolding[0], k.character[1] = caseFolding[1], k.character[2] = caseFolding[2];
                              node = { key = (uintptr)&k };
                              if(caseFoldings.Add(node))
                              {
                                 CaseFoldingKey * cfPtr = new CaseFoldingKey[1];
                                 *cfPtr = k;
                                 node.key = (uintptr)cfPtr;
                              }
                              else
                                 delete node;
                           }
                        }
                     }
                  }
               }
            }
         }
         delete caseFoldingFile;
      }

      decompFile = FileOpen("<:ecere>unicode/decompositionMappings.txt", read);
      if(decompFile)
      {
         char line[1024];
         while(decompFile.GetLine(line, 1024))
         {
            if(line[0] && line[0] != '#')
            {
               char * endPtr;
               unichar codePoint = (uint)strtoul(line, &endPtr, 16);
               if(endPtr)
               {
                  endPtr = strchr(endPtr, ';');
                  if(endPtr)
                  {
                     unichar dMapping[2] = { 0 };
                     endPtr++;
                     dMapping[0] = strtol(endPtr, null, 16);
                     //while(true)
                     {
                        //endPtr += 2;
                        endPtr = strchr(endPtr, ' ');
                        if(endPtr)
                        {
                           uint dm = strtol(endPtr, null, 16);
                           dMapping[1] = dm;
                        }
                     }
                     if(dMapping[0] > 0)
                     {
                        {
                           DecompKey k { codePoint };
                           BTNode node;
                           k.character[0] = dMapping[0], k.character[1] = dMapping[1];
                           node = { key = (uintptr) &k };
                           if(decompositionMappings.Add(node))
                           {
                              DecompKey * cfPtr = new DecompKey[1];
                              *cfPtr = k;
                              node.key = (uintptr)cfPtr;
                           }
                           else
                              delete node;
                        }
                        {
                           CompositionKey k { dMapping[0], dMapping[1], codePoint };
                           BTNode node;
                           node = { key = (uintptr) &k };
                           if(compositionMappings.Add(node))
                           {
                              CompositionKey * cfPtr = new CompositionKey[1];
                              *cfPtr = k;
                              node.key = (uintptr)cfPtr;
                           }
                           else
                              delete node;
                        }
                     }
                  }
               }
            }
         }
         delete decompFile;
      }
      compatFile = FileOpen("<:ecere>unicode/compatibilityDecompositionMappings.txt", read);
      if(compatFile)
      {
         char line[1024];
         while(compatFile.GetLine(line, 1024))
         {
            if(line[0] && line[0] != '#')
            {
               char * endPtr;
               unichar codePoint = (uint)strtoul(line, &endPtr, 16);
               if(endPtr)
               {
                  endPtr = strchr(endPtr, ';');
                  if(endPtr)
                  {
                     unichar dMapping[18] = { 0 };
                     UnicodeDecomposition type = 0;
                     int i = 0;
                     endPtr++;
                     if(*endPtr == '<')
                     {
                        endPtr++;
                        switch(*endPtr)
                        {
                           case 'c':
                              switch(endPtr[1])
                              {
                                 case 'o': { type.compat = true; endPtr +=8; break; }
                                 case 'i': { type.circle = true; endPtr +=8; break; }
                              }
                              break;
                           case 'f':
                              switch(endPtr[1])
                              {
                                 case 'r': { type.fraction = true; endPtr +=10; break; }
                                 case 'o': { type.font = true; endPtr +=6; break; }
                                 case 'i': { type.final = true; endPtr +=7; break; }
                              }
                              break;
                           case 'i':
                              switch(endPtr[1])
                              {
                                 case 'n': { type.initial = true; endPtr +=9; break; }
                                 case 's': { type.isolated = true; endPtr +=10; break; }
                              }
                              break;
                           case 'm': { type.medial = true; endPtr +=8; break; }
                           case 'n':
                              switch(endPtr[1])
                              {
                                 case 'a': { type.narrow = true; endPtr +=8; break; }
                                 case 'o': { type.noBreak = true; endPtr +=9; break; }
                              }
                              break;
                           case 's':
                              switch(endPtr[1])
                              {
                                 case 'q': { type.square = true; endPtr +=8; break; }
                                 case 'm': { type.small = true; endPtr +=7; break; }
                                 case 'u':
                                 {
                                    if(endPtr[2] == 'b')
                                    {
                                       type.sub = true;
                                       endPtr +=5;
                                    }
                                    else
                                    {
                                       type.super = true;
                                       endPtr +=7;
                                    }
                                    break;
                                 }
                              }
                              break;
                           case 'v': { type.vertical = true; endPtr +=10; break; }
                           case 'w': { type.wide = true; endPtr +=6; break; }
                        }
                     }
                     else
                        type.canonical = true;
                     dMapping[0] = strtol(endPtr, null, 16);
                     while(true)
                     {
                        //endPtr += 2;
                        endPtr = strchr(endPtr, ' ');
                        if(endPtr)
                        {
                           uint dm;
                           endPtr++;
                           dm = strtol(endPtr, null, 16);
                           dMapping[++i] = dm;
                        }
                        else
                           break;
                     }
                     if(dMapping[0] > 0)
                     {
                        CompatDecompKey k { codePoint, type = type };
                        BTNode node;
                        int i = 0;
                        for(i = 0; i < 18; i++)
                           k.character[i] = dMapping[i];
                        node = { key = (uintptr) &k };
                        if(compatibilityDecompMappings.Add(node))
                        {
                           CompatDecompKey * cfPtr = new CompatDecompKey[1];
                           *cfPtr = k;
                           node.key = (uintptr)cfPtr;
                        }
                        else
                           delete node;
                     }
                  }
               }
            }
         }
         delete compatFile;
      }

      // FIXME: Set up a file from CompositionExclusions.txt
      for(c : [
         0x0958, 0x0959, 0x095A, 0x095B, 0x095C, 0x095D, 0x095E, 0x095F,
         0x09DC, 0x09DD, 0x09DF, 0x0A33, 0x0A36, 0x0A59, 0x0A5A, 0x0A5B, 0x0A5E,
         0x0B5C, 0x0B5D, 0x0F43, 0x0F4D, 0x0F52, 0x0F57, 0x0F5C, 0x0F69, 0x0F76,
         0x0F78, 0x0F93, 0x0F9D, 0x0FA2, 0x0FA7, 0x0FAC, 0x0FB9, 0xFB1D, 0xFB1F,
         0xFB2A, 0xFB2B, 0xFB2C, 0xFB2D, 0xFB2E, 0xFB2F, 0xFB30, 0xFB31, 0xFB32,
         0xFB33, 0xFB34, 0xFB35, 0xFB36, 0xFB38, 0xFB39, 0xFB3A, 0xFB3B, 0xFB3C,
         0xFB3E, 0xFB40, 0xFB41, 0xFB43, 0xFB44, 0xFB46, 0xFB47, 0xFB48, 0xFB49,
         0xFB4A, 0xFB4B, 0xFB4C, 0xFB4D, 0xFB4E, 0x2ADC,
         0x1D15E, 0x1D15F, 0x1D160, 0x1D161, 0x1D162, 0x1D163, 0x1D164,
         0x1D1BB, 0x1D1BC, 0x1D1BD, 0x1D1BE, 0x1D1BF, 0x1D1C0, 0x0340, 0x0341, 0x0343, 0x0374, 0x037E,
         0x0387, 0x1F71, 0x1F73, 0x1F75, 0x1F77, 0x1F79, 0x1F7B, 0x1F7D, 0x1FBB, 0x1FBE, 0x1FC9, 0x1FCB,
         0x1FD3, 0x1FDB, 0x1FE3, 0x1FEB, 0x1FEE, 0x1FEF, 0x1FF9, 0x1FFB, 0x1FFD, 0x2000, 0x2001, 0x2126,
         0x212A, 0x212B, 0x2329, 0x232A, 0xFA10, 0xFA12, 0xFA20, 0xFA22, 0xFA25, 0xFA26, 0x0344, 0x0F73,
         0x0F75, 0x0F81
      ])
         addRange(compositionExclusions, { c, c });
      addRange(compositionExclusions, { 0xF900, 0xFA0D });
      addRange(compositionExclusions, { 0xFA15, 0xFA1E });
      addRange(compositionExclusions, { 0xFA2A, 0xFA6D });
      addRange(compositionExclusions, { 0xFA70, 0xFAD9 });
      addRange(compositionExclusions, { 0x2D800, 0x2DA1D });
   }

   ~UnicodeDatabase()
   {
      categories.Free();
      combiningClasses.Free();
      decompositionMappings.Free();
      caseFoldings.Free();
      compositionMappings.Free();
      compatibilityDecompMappings.Free();
      compositionExclusions.Free();
   }
};

static void addRange(BinaryTree tree, Range r)
{
   BTNode node { key = (uintptr)(void *)r };
   if(tree.Add(node))
   {
      node.key = (uintptr)new Range[1];
      *(Range *)node.key = r;
   }
   else
      delete node;
}


static UnicodeDatabase dataBase { };

public CharCategory GetCharCategory(unichar ch)
{
   if(ch < 128)
      return asciiCategories[ch];
   else
   {
      CharCategory category = none;
      Range range { ch, ch };
      BTNode node = dataBase.categories.Find((uintptr) &range);
      if(node)
         category = ((Range *)node.key)->category;
      return category;
   }
}

public bool CharMatchCategories(unichar ch, CharCategories categories)
{
   bool result = false;
   CharCategory category = GetCharCategory(ch);
   switch(category)
   {
      case none:                 result = categories.none;                 break;
      case markNonSpacing:       result = categories.markNonSpacing;       break;
      case markSpacing:          result = categories.markSpacing;          break;
      case markEnclosing:        result = categories.markEnclosing;        break;

      case numberDecimalDigit:   result = categories.numberDecimalDigit;   break;
      case numberLetter:         result = categories.numberLetter;         break;
      case numberOther:          result = categories.numberOther;          break;

      case separatorSpace:       result = categories.separatorSpace;       break;
      case separatorLine:        result = categories.separatorLine;        break;
      case separatorParagraph:   result = categories.separatorParagraph;   break;

      case otherControl:         result = categories.otherControl;         break;
      case otherFormat:          result = categories.otherFormat;          break;
      case otherSurrogate:       result = categories.otherSurrogate;       break;
      case otherPrivateUse:      result = categories.otherPrivateUse;      break;
      case otherNotAssigned:     result = categories.otherNotAssigned;     break;

      case letterUpperCase:      result = categories.letterUpperCase;      break;
      case letterLowerCase:      result = categories.letterLowerCase;      break;
      case letterTitleCase:      result = categories.letterTitleCase;      break;
      case letterModifier:       result = categories.letterModifier;       break;
      case letterOther:          result = categories.letterOther;          break;

      case punctuationConnector: result = categories.punctuationConnector; break;
      case punctuationDash:      result = categories.punctuationDash;      break;
      case punctuationOpen:      result = categories.punctuationOpen;      break;
      case punctuationClose:     result = categories.punctuationClose;     break;
      case punctuationInitial:   result = categories.punctuationInitial;   break;
      case punctuationFinal:     result = categories.punctuationFinal;     break;
      case punctuationOther:     result = categories.punctuationOther;     break;

      case symbolMath:           result = categories.symbolMath;           break;
      case symbolCurrency:       result = categories.symbolCurrency;       break;
      case symbolModifier:       result = categories.symbolModifier;       break;
      case symbolOther:          result = categories.symbolOther;          break;
   }
   return result;
}

public uint GetCombiningClass(uint cc)
{
   uint cclass = 0;
   RangeCC range { cc, cc };
   BTNode node = dataBase.combiningClasses.Find((uintptr) &range);
   if(node)
      cclass = ((RangeCC *)node.key)->cclass;
   return cclass;
}

public void GetCaseFolding(uint cf, unichar caseFolding[3])
{
   CaseFoldingKey key { cf };
   BTNode node = dataBase.caseFoldings.Find((uintptr) &key);
   if(node)
   {
      caseFolding[0] = ((CaseFoldingKey *)node.key)->character[0];
      caseFolding[1] = ((CaseFoldingKey *)node.key)->character[1];
      caseFolding[2] = ((CaseFoldingKey *)node.key)->character[2];
   }
}

public bool GetDecompositionMapping(unichar ch, unichar * mapping)
{
   bool result = false;
   DecompKey key { ch };
   BTNode node = dataBase.decompositionMappings.Find((uintptr) &key);
   int i;
   if(node)
   {
      mapping[0] = ((DecompKey *)node.key)->character[0];
      mapping[1] = ((DecompKey *)node.key)->character[1];
      for(i = 2; i < 7; i++)
         mapping[i] = 0;
      result = true;
   }
   else
   {
      for(i = 0; i < 7; i++)
         mapping[i] = 0;
   }
   return result;
}

public bool GetCompatDecompositionMapping(unichar ch, unichar * mapping, UnicodeDecomposition type)
{
   bool result = false;
   CompatDecompKey key { ch };
   BTNode node = dataBase.compatibilityDecompMappings.Find((uintptr) &key);
   int i;
   int maxCount = (type == { canonical = true }) ? 2 : 18;
   if(node && ((CompatDecompKey *)node.key)->type & type)
   {
      for(i = 0; i < maxCount; i++)
         mapping[i] = ((CompatDecompKey *)node.key)->character[i];
      result = true;
   }
   else
   {
      for(i = 0; i < maxCount; i++)
         mapping[i] = 0;
   }
   return result;
}

public unichar GetCompositionMapping(unichar ch1, unichar ch2)
{
   // Leading and Vowel jamos combination
   if(ch1 >= 0x1100 && ch1 <= 0x1112 && ch2 >= 0x1161 && ch2 <= 0x1175)
   {
      uint l = ch1 - 0x1100;
      uint v = ch2 - 0x1161;
      return 0xAC00 + 28 * (l * 21 + v);
   }
   // Leading+Vowel jamo + Trailing jamo combination
   else if(ch1 >= 0xAC00 && ch1 <= 0xAC00 + 28 * (18 * 21 + 20) && ch2 >= 0x11A8 && ch2 <= 0x11C3 && !((ch1 - 0xAC00) % 28))
      return ch1 + (ch2 - 0x11A8) + 1;
   else
   {
      CompositionKey key { ch1, ch2 };
      BTNode node = dataBase.compositionMappings.Find((uintptr) &key);
      unichar ch = node ? ((CompositionKey *)node.key)->composed : 0;
      if(ch)
      {
         Range range { ch, ch };
         if(dataBase.compositionExclusions.Find((uintptr) &range))
            ch = 0;
      }
      return ch;
   }
}

// Recursively replace by decompositionmapping then bubble-sort sequences of non-0 combining chars
public String accenti(const String string)
{
   // TODO: Compatibility (NKFD) normalization instead?
   String normal = normalizeNFD(string);
   String result = stripCategory(normal, Mn);
   // TODO: diacritic folding
   // TODO: kana folding (katakana -> hiragana)
   delete normal;
   return result;
}

static void bubbleSortCombiningClasses(unichar * array, int count)
{
   int n = count;
   while(n > 1)
   {
      int i, nn = 0;
      for(i = 1; i < n; i++)
      {
         int j = i-1;
         unichar a = array[j], b = array[i];
         uint ca = GetCombiningClass(a), cb = GetCombiningClass(b);
         if(ca > cb)
         {
            array[i] = a, array[j] = b;
            nn = i;
         }
      }
      n = nn;
   }
}

static void composeCanonical(Array<unichar> array)
{
   if(array.count)
   {
      unichar curChar = array[0], starterCh = 0;
      int i = 0, j = 0, starterJ = -1;
      uint lastCombiningClass = GetCombiningClass(curChar);

      if(lastCombiningClass == 0) // This first character is a starter character
         starterCh = curChar, starterJ = j;

      for(i = 1; i < array.count; i++)
      {
         unichar nextChar = array[i], c = GetCompositionMapping(curChar, nextChar);

         if(c)
         {
            // Combining two consecutive characters
            int cc = GetCombiningClass(c);

            array[j] = curChar = c;
            if(cc == 0) // The newly composed character is our new starter character
               starterCh = curChar, starterJ = j, lastCombiningClass = 0;
         }
         else
         {
            uint cc = GetCombiningClass(nextChar);

            if(starterJ != -1 && starterJ != j && cc != lastCombiningClass)
            {
               // If we have a starter character and we did not keep a combining character
               // of the same class that did not compose to our left
               c = GetCompositionMapping(starterCh, nextChar);
               if(!c)
                  lastCombiningClass = cc; // This character did not combine --
                     // We will not attempt to combine any other character of the
                     // same combining class with that same starter character
            }
            if(c)
               // This character combines with our earlier starter character
               array[starterJ] = starterCh = c, lastCombiningClass = 0;
            else
            {
               // This character does not combine with any previous character
               array[++j] = curChar = nextChar;
               if(cc == 0) // We moved on to a new starter character
                  starterCh = curChar, starterJ = j-1, lastCombiningClass = 0;
            }
         }
      }
      array.count = j+1;
   }
}

static void reorderCanonical(Array<unichar> canonicalOrdered)
{
   int i, start = -1;
   int count = canonicalOrdered.count;

   for(i = 0; i <= count; i++)
   {
      uint a = i == count ? 0 : GetCombiningClass(canonicalOrdered[i]);

      if(!a)
      {
         if(start != -1 && i > start + 1)
         {
            #if 0
            int k;
            Print("Before: ");
            for(k = start; k < i; k++)
               Print((uintptr)canonicalOrdered[k], '(', GetCombiningClass(canonicalOrdered[k]), ") ");
            PrintLn("");
            #endif

            bubbleSortCombiningClasses(canonicalOrdered.array + start, i - start);

            #if 0
            Print("After: ");
            for(k = start; k < i; k++)
               Print((uintptr)canonicalOrdered[k], '(', GetCombiningClass(canonicalOrdered[k]), ") ");
            PrintLn("");
            #endif
         }
         start = -1;
      }
      else if(start == -1)
         start = i;
   }
}

public String normalizeNFD(const String string) // TODO: enum
{
   String result = normalize(string, { canonical = true }, false );
   return result;
}

public String normalizeNFKD(const String string) // TODO: enum
{
   String result = normalize(string, { true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true }, false );
   return result;
}

public String normalizeNFC(const String string) // TODO: enum
{
   String result = normalize(string, { canonical = true }, true );
   return result;
}

public String normalizeNFKC(const String string) // TODO: enum
{
   String result = normalize(string, { true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true }, true );
   return result;
}

public String normalize(const String string, UnicodeDecomposition type, bool compose) // TODO: enum
{
   unichar ch;
   int nb, i;
   Array<unichar> canonicalOrdered { };
   String result;

   for(i = 0; (ch = UTF8GetChar(string + i, &nb)); i += nb)
      decompose(ch, type, canonicalOrdered);

   reorderCanonical(canonicalOrdered);

   if(compose)
      composeCanonical(canonicalOrdered);

   result = new char[canonicalOrdered.count * 5 + 1];
   nb = UTF32toUTF8Len(canonicalOrdered.array, canonicalOrdered.count, result, canonicalOrdered.count * 5);
   delete canonicalOrdered;
   result = renew result char[nb+1];
   return result;
}

String stripCategory(const String string, CharCategory c)
{
   String result = null;
   int len = strlen(string);

   unichar ch;
   int nb, outPosition = 0, o;
   result = new char[len+1];
   for(o = 0; (ch = UTF8GetChar(string + o, &nb)); o += nb)
   {
      if(GetCharCategory(ch) != c) // markNonSpacing
         outPosition += UTF32toUTF8Len(&ch, 1, result + outPosition, 5);
   }
   result = renew result char[outPosition + 1];
   result[outPosition+1] = '\0';
   return result;
}

static void decompose(unichar input, UnicodeDecomposition type, Array<unichar> co)
{
   bool result = false;
   unichar decompMapping[18];
   int i;
   //int maxCount = (type & ~{ canonical = true }) ? 18 : 2;
   int maxCount = (type == { canonical = true }) ? 2 : 18;

   if(input >= 0xAC00 && input < 0xD7B0) //<=
      hangulGetMappings(input, co);
   else
   {
      GetCompatDecompositionMapping(input, decompMapping, type);
      for(i = 0; i < maxCount; i++)
      {
         unichar ch = decompMapping[i];
         if(ch)
         {
            decompose(ch, type, co);
            result = true;
         }
         else
            break;
      }
      if(!result)
         co.Add(input);
   }
}

//reference: http://www.unicode.org/versions/Unicode9.0.0/ch03.pdf
// https://stackoverflow.com/questions/41309402/breaking-down-a-hangul-syllable-into-letters-jamo
static void hangulGetMappings(unichar ch, Array<unichar> co)
{
   uint syllable = ch - 0xAC00;
   uint jamoT = syllable % 28, jamoV, jamoL;
   syllable /= 28;
   jamoV = syllable % 21;
   jamoL = syllable / 21;

   co.Add(0x1100 + jamoL);
   co.Add(0x1161 + jamoV);
   if(jamoT) co.Add(0x11A7 + jamoT);
}

public String casei(const String string)
{
   // case folding
   String result = null;
   int len = strlen(string);
   unichar ch;
   int nb = 1, o, outPosition = 0; //i = 0,
   result = new char[len * 3*4 + 1];

   for(o = 0; (ch = UTF8GetChar(string + o, &nb)); o += nb)
   {
      unichar caseFolding[3] = { 0, 0, 0};
      GetCaseFolding(ch, caseFolding);
      if(caseFolding[0] > 0)
         outPosition += UTF32toUTF8Len(&caseFolding[0], 1, result + outPosition, 5);
      else
         outPosition += UTF32toUTF8Len(&ch, 1, result + outPosition, 5);
         //result[i++] = caseFolding[0];
      if(caseFolding[1] > 0)
         outPosition += UTF32toUTF8Len(&caseFolding[1], 1, result + outPosition, 5);
      if(caseFolding[2] > 0)
         outPosition += UTF32toUTF8Len(&caseFolding[2], 1, result + outPosition, 5);
   }
   result = renew result char[outPosition+1];
   result[outPosition] = '\0';
   return result;
}
