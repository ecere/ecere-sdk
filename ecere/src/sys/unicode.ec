namespace sys;

import "File"

public int UTF8toISO8859_1(char * source, char * dest, int max)
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

public uint16 * UTF8toUTF16Len(char * source, int byteCount, int * wordCount)
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
            uint16 trail = 0xDC00 + (uint16)(codePoint & 0x3FF);

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

public int UTF8toUTF16BufferLen(char * source, uint16 * dest, int max, int len)
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
            uint16 trail = 0xDC00 + (uint16)(codePoint & 0x3FF);
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

public int UTF16BEtoUTF8Buffer(uint16 * source, byte * dest, int max)
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
   punctuation = CharCategories { punctiationConnector = true, punctuationDash = true, punctuationOpen = true, punctuationClose = true, punctuationInitial = true, 
                     punctuationFinal = true, punctuationOther = true },
   symbols = CharCategories { symbolMath = true, symbolCurrency = true, symbolModifier = true, symbolOther = true },
   connector = CharCategories { punctuationConnector = true },
};

public bool GetAlNum(char ** input, char * string, int max)
{
   int c = 0;
   unichar ch;
   int nb = 1;
   bool result = true;
   char * buffer = *input;
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

static int CompareRange(BinaryTree tree, Range a, Range b)
{
   if(a.start > b.end)
      return 1;
   else if(a.end < b.start)
      return -1;
   else
      return 0;
}

static void FreeRange(Range range)
{
   delete range;
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

   UnicodeDatabase()
   {
      File f = FileOpen("<:ecere>unicode/derivedGeneralCategoryStripped.txt", read);
      if(f)
      {
         char line[1024];
         while(f.GetLine(line, 1024))
         {
            if(line[0] && line[0] != '#')
            {
               char * endPtr;
               uint start = strtoul(line, &endPtr, 16);
               if(endPtr)
               {
                  uint end = (endPtr && *endPtr == '.') ? strtoul(endPtr + 2, &endPtr, 16) : start;
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
