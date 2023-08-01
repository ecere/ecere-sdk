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

   BinaryTree caseFoldings
   {
      CompareKey = (void *)CompareCFKey;
      FreeKey = (void *)FreeCaseFoldingKey;
   };

   UnicodeDatabase()
   {
      File f = FileOpen("<:ecere>unicode/derivedGeneralCategoryStripped.txt", read);
      File combiningClassFile, caseFoldingFile, decompFile;
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
                  }
               }
            }
         }
         delete decompFile;
      }
   }
   ~UnicodeDatabase()
   {
      categories.Free();
   }
};

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
   if(node)
   {
      mapping[0] = ((DecompKey *)node.key)->character[0];
      mapping[1] = ((DecompKey *)node.key)->character[1];
      result = true;
   }
   else
      mapping[0] = 0, mapping[1] = 0;
   return result;
}

// Recursively replace by decompositionmapping then bubble-sort sequences of non-0 combining chars
public String accenti(const String string)
{
   String result = null;
   String normal = null;
   normal = normalizeNFD(string);
   result = stripCategory(normal, Mn);
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

static void reorderCanonical(Array<unichar> canonicalOrdered)
{
   int i, start = -1;
   int count = canonicalOrdered.count;

   for(i = 0; i <= count; i++)
   {
      uint a = i == count ? 0 : GetCombiningClass(canonicalOrdered[i]);

      if(!a)
      {
         if(start != -1 && i - start)
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

public String normalizeNFD(const String string)
{
   unichar ch;
   int nb, i;
   Array<unichar> canonicalOrdered { };
   String result;

   for(i = 0; (ch = UTF8GetChar(string + i, &nb)); i += nb)
      decompose(ch, canonicalOrdered);

   reorderCanonical(canonicalOrdered);

   result = new char[canonicalOrdered.count * 4 + 1];
   UTF32toUTF8Len(canonicalOrdered.array, canonicalOrdered.count, result, canonicalOrdered.count * 4);
   delete canonicalOrdered;
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

static void decompose(unichar input, Array<unichar> co)
{
   bool result = false;
   unichar decompMapping[2];
   int i;

   if(input >= 0xAC00 && input <= 0xD7B0)
      hangulGetMappings(input, co);
   else
   {
      GetDecompositionMapping(input, decompMapping);
      for(i = 0; i < 2; i++)
      {
         unichar ch = decompMapping[i];
         if(ch)
         {
            decompose(ch, co);
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
