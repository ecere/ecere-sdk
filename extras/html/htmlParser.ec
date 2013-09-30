import "HTMLView"

#define MAX_TAG_LEN     256
#define MAX_SYMBOL_LEN  256

#define WORD_NONE    0
#define WORD_NORMAL  1
#define WORD_QUOTED  2

#define FONT_BOLD       0x00000001
#define FONT_ITALIC     0x00000002
#define FONT_UNDERLINE  0x00000004

class Block : struct
{
   Block prev, next;
   BlockType type;
   char * text;
   char * face;
   float size;
   FontEntry /*void * */font;
   int textLen;
   OldList subBlocks;
   Block parent;
   char * src;
   char * href;
   char * value;
   char * action;
   char * name;
   char * anchor;

   // Picture
   ImageEntry imageEntry;
   OldLink entryPtr;
   Bitmap bitmap;

   ColorAlpha bgColor;
   ColorAlpha textColor;
   Block prevFont;
   int w, h;
   uint attribs;
   InputType inputType;
   Window window;

   // Tables
   // Cells:
   int span, rowSpan;
   int width, height;
   int pWidth, pHeight;
   int minW;      // Minimum column width
   int lineW;     // Minimum column width for lines to fit on one row
   HorizontalAlignment halign;
   VerticalAlignment valign;
   OldList columns;
   bool noWrap;
   int cellPadding;

   int startY, startX;

   ~Block()
   {
      Block child;

      delete src;
      delete href;
      delete text;
      delete face;
      delete anchor;
      delete value;
      delete action;
      delete name;
      columns.Free(null);

      if(window)
      {
         window.Destroy(0);
         delete window;
      }

      if(entryPtr)
      {
         imageEntry.bitmapPtrs.Remove(entryPtr);
         delete entryPtr;
      }

      while(child = subBlocks.first)
      {
         subBlocks.Remove(child);
         delete child;
      }
   }

   void ClearEntries()
   {
      Block child;
      entryPtr = null;
      for(child = subBlocks.first; child; child = child.next)
      {
         child.ClearEntries();
      }
   }
};

String ParseURL(String input)
{
   int c;
   char ch;
   int len = strlen(input);
   String output = new char[len+1];
   len = 0;
   for(c = 0; (ch = input[c]); c++)
   {
      if(ch == '%' && isalnum(input[c+1]) && isalnum(input[c+2]))
      {
         char hex[3] = { input[c+1], input[c+2], 0 };
         char * end;
         int v = (int)strtoul(hex, &end, 16);
         if(v && end == hex + 2)
         {
            output[len++] = (char)v;
            c += 2;
            continue;
         }
      }
      output[len++] = ch;
   }
   output[len++] = 0;
   return renew output char[len];
}

/*static */bool GetKeyWordEx(char ** input, char * keyWord, int maxSize, bool treatEqual, bool acceptSingleQuote)
{
   char * string = *input;
   char ch;
   int c = 0;
   bool quoted = false, start = true, wasQuoted = false;
   char quoteChar = 0;

   for(; (ch = *string); string++)
   {
      if(!quoted && wasQuoted)
         break;

      if((ch == ' ' || ch == '\t') && !quoted) 
      {
         if(!start) break;
      }
      else
      {
         if(!quoted && ((ch == ',' || (treatEqual && ch == '=')) || ch == '>') )
            break;
         else if((ch == '\"' || (acceptSingleQuote && ch == '\'')) && (!quoteChar || quoteChar == ch))
         {
            if(!wasQuoted)
               quoteChar = ch;
            quoted ^= true;
            wasQuoted = true;
            start = false;
         }
         else if(ch != '\r' && ch != '\n')
         {
            if(c < maxSize) 
               keyWord[c++] = ch;
            start = false;
         }
      }
   }
   for(;*string == '>' || *string == ',' || *string == ' ' || *string == '=' || *string == '\t' || *string == '\r' || *string == '\n'; string++);
   keyWord[c] = '\0';
   *input = string;
   return (c > 0) ? (wasQuoted ? WORD_QUOTED : WORD_NORMAL) : WORD_NONE;
}

static bool GetKeyWord(char ** input, char * keyWord, int maxSize)
{
   return GetKeyWordEx(input, keyWord, maxSize, true, false);
}

static char * GetString(char * string, char * what, int count)
{
   int wc, sc;

   for(sc = 0; (!count && string[sc]) || sc<count; sc++)
   {
      if(string[sc] != ' ' && string[sc] != '\"')
         break;
   }
   
   for(wc = 0; what[wc]; wc++, sc++)
   {
      if((count && sc >= count) || (string[sc] != what[wc] && tolower(string[sc]) != tolower(what[wc])))
         return null;
   }
   return string + sc;
}

#include <stdio.h>

String EncodeString(String input, int * lenPtr)
{
   if(UTF8Validate(input))
   {
      return CopyString(input);
   }
   else
   {
      int len = strlen(input);
      String s = new char[len*4+1];
      len = ISO8859_1toUTF8(input, s, len*4);
      if(lenPtr) *lenPtr = len;
      return renew s char[len+1];
   }
}

class HTMLFile
{
   Block block {};
   Block defaultFont { };

   Block body;
   Block titleBlock;
   ColorAlpha background { 255, white };
   String baseHRef;
   //Button defaultButton;

   Block ::AddBlock(Block parent, BlockType type)
   {
      Block block = Block { parent = parent, type = type };
      parent.subBlocks.Add(block);
      return block;
   }

   ~HTMLFile()
   {
      delete baseHRef;
   }

   bool Parse(File f)
   {
      bool result = true;
      bool insideTag = false;
      char tag[MAX_TAG_LEN];
      char symbol[MAX_SYMBOL_LEN];
      int tagLen = 0;
      Block block = this.block, subBlock;
      char * text;
      int textLen = 0;
      bool insideSymbol = false;
      int symbolLen = 0;
      int insideScript = 0, insideStyle = 0;
      bool commented = false;
      byte lastCh = ' ';
      bool code = false;
      bool quoted = false;
      bool lastBR = true;

      Block fontBlock = defaultFont;
      fontBlock.type = FONT;
      fontBlock.face = CopyString("Times New Roman");

      /*
      fontBlock.attribs = FONT_UNDERLINE|FONT_BOLD;
      fontBlock.size = 12;
      fontBlock.textColor = LT_BLUE|0xFF000000;
      */
      
      fontBlock.textColor = black;
      fontBlock.size = 10;

      /*fontBlock.font = FontEntry { size = fontBlock.size, attribs = fontBlock.attribs, face = CopyString(fontBlock.face) };
      fontCache.Add(fontBlock.font);*/

      background = white;
      
      text = new char[32768*4];

      block.font = fontBlock.font;
      body = block;
      
      // Parse entire file
      while(!f.Eof() && block)
      {
         byte ch = 0;
         
         f.Getc(&ch);
#ifdef _DEBUG
         //fwrite(&ch, 1, 1, stdout);
#endif
         if(commented)
         {
            if((ch == '-' && tagLen < 2) || (ch == '>' && tagLen == 2))
            {
               tag[tagLen++] = ch;
               tag[tagLen] = '\0';
               if(!strcmp(tag,  "-->"))
               {
                  commented = false;
               }
            }
            else
               tagLen = 0;
         }
         else if(insideTag)
         {
            if(ch == '\"')
               quoted ^= true;
            if(ch == '<' && !quoted && !insideScript && !insideStyle)
            {
               insideTag++;
            }
            /*else */if(ch == '>' && !quoted)
            {
               insideTag--;
               if(!insideTag)
               {
                  char keyWord[1024];
                  char * string;

                  tag[tagLen] = '\0';
                  insideTag = false;

                  string = tag;

                  if(GetKeyWord(&string, keyWord, sizeof(keyWord)))
                  {
                     if(!strcmpi(keyWord, "object"))
                     {
                        subBlock = AddBlock(block, IMAGE);
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));
                           if(!strcmpi(keyWord, "width"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              subBlock.w = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "height"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              subBlock.h = atoi(keyWord);
                           }
                        }
                     }
                     else if(!strcmpi(keyWord, "img"))
                     {
                        lastBR = false;
                        subBlock = AddBlock(block, IMAGE);
                        subBlock.valign = bottom;
                        subBlock.halign = middle;
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));
                           if(!strcmpi(keyWord, "src"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, false);
                              delete subBlock.src;
                              subBlock.src = keyWord[0] ? CopyString(keyWord) : null;
                           }
                           else if(!strcmpi(keyWord, "width"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(strstr(keyWord, "%"))
                                 subBlock.pWidth = atoi(keyWord);
                              else
                                 subBlock.width = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "height"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(strstr(keyWord, "%"))
                                 subBlock.pHeight = atoi(keyWord);
                              else
                                 subBlock.height = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "valign"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(!strcmpi(keyWord, "middle") || !strcmpi(keyWord, "center") )
                              {
                                 subBlock.valign = middle;
                              }
                           }
                           else if(!strcmpi(keyWord, "align"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(!strcmpi(keyWord, "middle") || !strcmpi(keyWord, "center") )
                              {
                                 subBlock.halign = middle;
                              }
                              else if(!strcmpi(keyWord, "left"))
                              {
                                 subBlock.halign = left;
                              }
                              else if(!strcmpi(keyWord, "right"))
                              {
                                 subBlock.halign = right;
                              }
                              else if(!strcmpi(keyWord, "top"))
                              {
                                 subBlock.valign = top;
                              }
                              else if(!strcmpi(keyWord, "bottom"))
                              {
                                 subBlock.valign = bottom;
                              }
                           }
                        }
                     }
                     else if(!strcmpi(keyWord, "title"))
                     {
                        block = AddBlock(block, TITLE);
                        titleBlock = block;
                     }
                     else if(!strcmpi(keyWord, "body"))
                     {
                        block = AddBlock(block, BODY);
                        body = block;
                        lastCh = ' ';

                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));
                           if(!strcmpi(keyWord, "bgcolor"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              background = !strcmpi(keyWord, "#fff") ?  white : strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16);
                              if(keyWord[0] != '#' || strlen(keyWord) <= 7)
                                 background |= 0xFF000000;
                           }
                           else if(!strcmpi(keyWord, "text"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              fontBlock.textColor = 
                                 block.textColor = 0xFF000000 | strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16);
                           }
                        }
                     }
                     else if(!strcmpi(keyWord, "br") || (!lastBR && (!strcmpi(keyWord, "div") || !strcmpi(keyWord, "li"))))
                     {
                        if(!lastBR || (lastCh && lastCh != ' '))
                        {
                           subBlock = AddBlock(block, BR);
                           lastCh = ' ';
                           lastBR = true;
                        }
                     }
                     else if(!strcmpi(keyWord, "/ul"))
                     {
                        lastBR = false;
                     }
                     else if(!strcmpi(keyWord, "/ul"))
                     {
                        lastBR = false;
                     }
                     else if(!strcmpi(keyWord, "/div"))
                     {
                        if(!lastBR)
                        {
                           subBlock = AddBlock(block, BR);
                           lastBR = true;
                        }
                        else
                           lastBR = false;
                     }
                     else if(!strcmpi(keyWord, "code"))
                     {
                        code = true;
                     }
                     else if(!strcmpi(keyWord, "/code"))
                     {
                        code = false;
                     }
                     else if(!strcmpi(keyWord, "p"))
                     {
                     }
                     else if(!strcmpi(keyWord, "font") || !strcmpi(keyWord, "b") || !strcmpi(keyWord, "i") 
                        || !strcmpi(keyWord, "strong") || !strcmpi(keyWord, "em") || 
                        !strcmpi(keyWord, "h1") || !strcmpi(keyWord, "h2") || !strcmpi(keyWord, "h3"))
                     {
                        if((!strcmpi(keyWord, "h1") || !strcmpi(keyWord, "h2") || !strcmpi(keyWord, "h3")))
                        {
                           if(!lastBR || (lastCh && lastCh != ' '))
                           {
                              if(!lastBR)
                                 subBlock = AddBlock(block, BR);
                              subBlock = AddBlock(block, BR);
                              lastBR = true;
                           }
                           lastCh = ' ';
                        }
                        subBlock = AddBlock(block, FONT);
                        subBlock.attribs = fontBlock.attribs;
                        if(!strcmpi(keyWord, "font"))
                        {
                           for(;string[0];)
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));

                              if(!strcmpi(keyWord, "face"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 delete subBlock.face;
                                 subBlock.face = CopyString(keyWord);
                              }
                              else if(!strcmpi(keyWord, "size"))
                              {
                                 #define NUM_FONT_SIZES  7
                                 static float fontSizes[NUM_FONT_SIZES] = { 7.5f, 10, 12, 13.5f, 18, 24, 36 };
                                 int size;
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 size = atoi(keyWord);
                                 if(keyWord[0] == '+')
                                 {
                                    int c;
                                    int numTimes = atoi(keyWord+1);
                                    for(c = 0; c<NUM_FONT_SIZES-1; c++)
                                       if(fontSizes[c] > fontBlock.size)
                                       {
                                          numTimes--;
                                          if(!numTimes) break;
                                       }
                                    subBlock.size = fontSizes[c];
                                 }
                                 else if(keyWord[0] == '-')
                                 {
                                    int c;
                                    int numTimes = atoi(keyWord+1);
                                    for(c = NUM_FONT_SIZES-1; c>0; c--)
                                       if(fontSizes[c] < fontBlock.size)
                                       {
                                          numTimes--;
                                          if(!numTimes) break;
                                       }
                                    subBlock.size = fontSizes[c];
                                 }
                                 else if(size && size < NUM_FONT_SIZES)
                                 {
                                    subBlock.size = fontSizes[size-1];
                                 }

                              }
                              else if(!strcmpi(keyWord, "color"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 subBlock.textColor = 
                                    0xFF000000 | strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16);
                              }
                           }
                        }
                        else
                        {
                           if(!strcmpi(keyWord, "b") || !strcmpi(keyWord, "strong"))
                              subBlock.attribs |= FONT_BOLD;
                           else if(!strcmpi(keyWord, "i") || !strcmpi(keyWord, "em"))
                              subBlock.attribs |= FONT_ITALIC;
                           else if(!strcmpi(keyWord, "h1"))
                              subBlock.size = 20;
                           else if(!strcmpi(keyWord, "h2"))
                              subBlock.size = 16;
                           else if(!strcmpi(keyWord, "h3"))
                              subBlock.size = 14;
                        }

                        if(!subBlock.face) subBlock.face = CopyString(fontBlock.face);
                        if(!subBlock.size) subBlock.size = fontBlock.size;
                        if(!subBlock.textColor) subBlock.textColor = fontBlock.textColor;

                        subBlock.prevFont = fontBlock;
                        fontBlock = subBlock;
                        block = subBlock;
                     }
                     else if(!strcmpi(keyWord, "/font") ||
                             !strcmpi(keyWord, "/b") ||
                             !strcmpi(keyWord, "/strong") ||
                             !strcmpi(keyWord, "/em") ||
                             !strcmpi(keyWord, "/i") ||
                             !strcmpi(keyWord, "/h1") ||
                             !strcmpi(keyWord, "/h2") ||
                             !strcmpi(keyWord, "/h3"))
                     {
                        /*while(block.type != FONT && block.parent && block.parent.type != BODY)
                           block = block.parent;*/
                        if(block.type == FONT || block.type == ANCHOR)
                        {
                           fontBlock = block.prevFont;
                           block = block.parent;
                        }
                        if(!lastBR && (!strcmpi(keyWord, "/h1") || !strcmpi(keyWord, "/h2") || !strcmpi(keyWord, "/h3")))
                        {
                           subBlock = AddBlock(block, BR);
                           lastBR = true;
                        }
                     }
                     else if(!strcmpi(keyWord, "a"))
                     {
                        int textDecoration = 0;
                        Block anchor { type = ANCHOR, parent = block };

                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "name"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, false);
                              delete anchor.anchor;
                              anchor.anchor = CopyString(keyWord);
                           }
                           else if(!strcmpi(keyWord, "href"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, true);
                              delete anchor.href;
                              anchor.href = CopyString(keyWord);
                              if(!textDecoration)
                                 textDecoration = 1;
                           }
                           else if(!strcmpi(keyWord, "style"))
                           {
                              //for(;string[0];)
                              {
                                 GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, false);
                                 if(strstr(keyWord, "text-decoration:") && strstr(keyWord, "none;"))
                                    textDecoration = 2;
                              }
                           }
                        }

                        if(anchor.href && (/*lastBR || */isalnum(lastCh)))
                        {
                           subBlock = AddBlock(block, TEXT);
                           subBlock.text = CopyString("  ");
                           subBlock.textLen = 2;
                           subBlock.prevFont = fontBlock;
                        }
                        subBlock = anchor;
                        block.subBlocks.Add(subBlock);

                        subBlock.attribs = fontBlock.attribs | FONT_BOLD;
                        delete subBlock.face;
                        subBlock.face = CopyString(fontBlock.face);
                        subBlock.size = fontBlock.size;
                        subBlock.textColor = Color { 85,85,255 };
                        subBlock.prevFont = fontBlock;
                        if(textDecoration == 1) subBlock.attribs |= FONT_UNDERLINE;
                        fontBlock = subBlock;
                        block = subBlock;

                        lastCh = 0;
                     }
                     /*else if(!strcmpi(keyWord, "/span"))
                     {
                        if(isalnum(lastCh))
                        {
                           subBlock = AddBlock(block, TEXT);
                           subBlock.text = CopyString("  ");
                           subBlock.textLen = 2;
                           subBlock.prevFont = block.parent.prevFont;
                        }
                        lastCh = 0;
                     }*/
                     else if(!strcmpi(keyWord, "/a"))
                     {
                        if(block.type == ANCHOR)
                        {
                           fontBlock = block.prevFont;
                           block = block.parent;
                        }
                     }
                     else if(!strcmpi(keyWord, "script"))
                     {
                        insideScript++;
                     }
                     else if(!strcmpi(keyWord, "/script"))
                     {
                        if(insideScript)
                           insideScript--;
                     }
                     else if(!strcmpi(keyWord, "style"))
                     {
                        insideStyle++;
                     }
                     else if(!strcmpi(keyWord, "/style"))
                     {
                        if(insideStyle)
                           insideStyle--;
                     }
                     else if(!strcmpi(keyWord, "input") || !strcmpi(keyWord, "button"))
                     {
                        subBlock = AddBlock(block, INPUT);
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "type"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), true, true);
                              if(!strcmpi(keyWord, "text"))
                              {
                                 subBlock.inputType = InputType::text;
                              }
                              else if(!strcmpi(keyWord, "submit") || !strcmpi(keyWord, "image"))
                              {
                                 subBlock.inputType = submit;
                              }
                              else if(!strcmpi(keyWord, "radio"))
                              {
                                 subBlock.inputType = radio;
                              }
                              else if(!strcmpi(keyWord, "checkbox"))
                              {
                                 subBlock.inputType = checkbox;
                              }
                              else if(!strcmpi(keyWord, "hidden"))
                              {
                                 subBlock.inputType = hidden;
                              }
                              delete subBlock.href;
                              subBlock.href = CopyString(keyWord);
                           }
                           else if(!strcmpi(keyWord, "size"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              subBlock.size = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "maxlength"))
                           {
                              int maxlength;
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              maxlength = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "value"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, true);
                              delete subBlock.value;
                              subBlock.value = EncodeString(keyWord, null);
                           }
                           else if(!strcmpi(keyWord, "name"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              delete subBlock.name;
                              subBlock.name = CopyString(keyWord);
                           }
                           else if(!strcmpi(keyWord, "src"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, false);
                              delete subBlock.src;
                              subBlock.src = keyWord[0] ? CopyString(keyWord) : null;
                           }
                        }
                     }
                     else if(!strcmpi(keyWord, "form"))
                     {
                        subBlock = AddBlock(block, FORM);
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "action"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, false);
                              delete subBlock.action;
                              subBlock.action = CopyString(keyWord);
                           }
                        }
                        block = subBlock;
                     }
                     else if(!strcmpi(keyWord, "/form"))
                     {
                        if(block.type == FORM)
                        {
                           block = block.parent;
                        }
                     }
                     else if(!strcmpi(keyWord, "center"))
                     {
                        subBlock = AddBlock(block, CENTER);
                        block = subBlock;
                     }
                     else if(!strcmpi(keyWord, "/center"))
                     {
                        if(block.type == CENTER)
                        {
                           block = block.parent;
                        }
                     }
                     else if(!strcmpi(keyWord, "base"))
                     {
                        while(string[0])
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "href"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false, true);
                              delete baseHRef;
                              baseHRef = ParseURL(keyWord);
                           }
                        }
                     }
                     else if(!strcmpi(keyWord, "table"))
                     {
                        lastCh = ' ';
                        subBlock = AddBlock(block, TABLE);
                        subBlock.cellPadding = 4;
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "width"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(strstr(keyWord, "%"))
                                 subBlock.pWidth = atoi(keyWord);
                              else
                                 subBlock.width = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "height"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(strstr(keyWord, "%"))
                                 subBlock.pHeight = atoi(keyWord);
                              else
                                 subBlock.height = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "cellpadding"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              subBlock.cellPadding = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "background"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              delete subBlock.src;
                              subBlock.src = CopyString(keyWord);
                           }
                           else if(!strcmpi(keyWord, "bgcolor"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              subBlock.bgColor = !strcmpi(keyWord, "#fff") ? white : (0xFF000000 | strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16));
                           }
                           else if(!strcmpi(keyWord, "align"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(!strcmpi(keyWord, "middle") || !strcmpi(keyWord, "center") )
                              {
                                 subBlock.halign = middle;
                              }
                              else if(!strcmpi(keyWord, "left"))
                              {
                                 subBlock.halign = left;
                              }
                              else if(!strcmpi(keyWord, "right"))
                              {
                                 subBlock.halign = right;
                              }
                           }
                        }

                        block = subBlock;
                     }
                     else if(!strcmpi(keyWord, "/table"))
                     {
                        if(block.type == TD)
                        {
                           block = block.parent;
                           lastCh = 0;//' ';
                        }
                        if(block.type == TR)
                        {
                           block = block.parent;
                           lastCh = 0;//' ';
                        }
                        if(block.type == TABLE)
                        {
                           block = block.parent;
                           lastCh = 0;//' ';
                        }
                     }
                     else if(!strcmpi(keyWord, "tr"))
                     {
                        if(block.type == TD)
                        {
                           block = block.parent;
                           lastCh = ' ';
                        }
                        if(block.type == TR)
                        {
                           block = block.parent;
                           lastCh = ' ';
                        }

                        subBlock = AddBlock(block, TR);

                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));
                           /*
                           if(!strcmpi(keyWord, "height"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              subBlock.height = atoi(keyWord);
                           }
                           */
                           if(!strcmpi(keyWord, "align"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(!strcmpi(keyWord, "middle") || !strcmpi(keyWord, "center") )
                              {
                                 subBlock.valign = middle;
                              }
                              else if(!strcmpi(keyWord, "top"))
                              {
                                 subBlock.valign = top;
                              }
                              else if(!strcmpi(keyWord, "bottom"))
                              {
                                 subBlock.valign = bottom;
                              }
                           }
                        }
                        block = subBlock;
                     }
                     else if(!strcmpi(keyWord, "/tr"))
                     {
                        if(block.type == TD)
                        {
                           block = block.parent;
                           lastCh = ' ';
                        }
                        if(block.type == TR)
                        {
                           block = block.parent;
                           lastCh = ' ';
                        }
                     }
                     else if(!strcmpi(keyWord, "td"))
                     {
                        while(block && block.type != TR && block.type != TABLE)
                        {
                           if(block == fontBlock)
                              fontBlock = block.prevFont;
                           block = block.parent;
                           lastCh = ' ';
                        }
                        if(block)
                        {
                           if(block.type == TABLE)
                           {
                              block = AddBlock(block, TR);
                           }
                           subBlock = AddBlock(block, TD);
                           subBlock.span = subBlock.rowSpan = 1;
                           subBlock.valign = block.valign;
                           subBlock.halign = block.halign;

                           for(;string[0];)
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));

                              if(!strcmpi(keyWord, "width"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 if(strstr(keyWord, "%"))
                                    subBlock.pWidth = atoi(keyWord);
                                 else
                                    subBlock.width = atoi(keyWord);
                              }
                              else if(!strcmpi(keyWord, "height"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 if(strstr(keyWord, "%"))
                                    subBlock.pHeight = atoi(keyWord);
                                 else
                                    subBlock.height = atoi(keyWord);
                              }
                              else if(!strcmpi(keyWord, "colspan"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 subBlock.span = atoi(keyWord);
                              }
                              else if(!strcmpi(keyWord, "cellpadding"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 subBlock.cellPadding = atoi(keyWord);
                              }
                              else if(!strcmpi(keyWord, "rowspan"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 subBlock.rowSpan = atoi(keyWord);
                              }
                              else if(!strcmpi(keyWord, "nowrap"))
                              {
                                 subBlock.noWrap = true;
                              }
                              else if(!strcmpi(keyWord, "background"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 delete subBlock.src;
                                 subBlock.src = CopyString(keyWord);
                              }
                              else if(!strcmpi(keyWord, "bgcolor"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 subBlock.bgColor = !strcmpi(keyWord, "#fff") ? white : (0xFF000000 |strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16));
                              }
                              else if(!strcmpi(keyWord, "valign"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 if(!strcmpi(keyWord, "middle") || !strcmpi(keyWord, "center") )
                                 {
                                    subBlock.valign = middle;
                                 }
                                 else if(!strcmpi(keyWord, "top"))
                                 {
                                    subBlock.valign = top;
                                 }
                                 else if(!strcmpi(keyWord, "bottom"))
                                 {
                                    subBlock.valign = bottom;
                                 }
                              }
                              else if(!strcmpi(keyWord, "align"))
                              {
                                 GetKeyWord(&string, keyWord, sizeof(keyWord));
                                 if(!strcmpi(keyWord, "middle") || !strcmpi(keyWord, "center") )
                                 {
                                    subBlock.halign = middle;
                                 }
                                 else if(!strcmpi(keyWord, "left"))
                                 {
                                    subBlock.halign = left;
                                 }
                                 else if(!strcmpi(keyWord, "right"))
                                 {
                                    subBlock.halign = right;
                                 }
                              }
                           }
                           block = subBlock;
                        }
                     }
                     else if(!strcmpi(keyWord, "/td"))
                     {
                        if(block.type == TD)
                        {
                           block = block.parent;
                           lastCh = 0;//' ';
                        }
                     }
                     else if(!strcmpi(keyWord, "/html"))
                        break;
                  }
               }
               else
               {
                  if(tagLen < MAX_TAG_LEN-1)
                  {
                     tag[tagLen++] = ch;
                     tag[tagLen] = '\0';
                  }
               }
            }
            else
            {
               if((insideScript || insideStyle) && !tagLen && ch != '/')
               {
                  insideTag = false;
               }
               else
               {
                  if(tagLen < MAX_TAG_LEN-1)
                  {
                     tag[tagLen++] = ch;
                     tag[tagLen] = '\0';
                  }
               }
            }
            if(!strcmp(tag, "!--"))
            {
               commented = true;
               insideTag = false;
               tagLen = 0;
               tag[tagLen] = '\0';
            }
         }
         else
         {
            if(ch == '<')
            {
               if(!insideScript && !insideStyle)
               {
                  if(textLen)
                  {
                     if(block.type == TABLE)
                     {
                        subBlock = AddBlock(block, TR);
                        block = subBlock;
                     }
                     if(block.type == TR)
                     {
                        subBlock = AddBlock(block, TD);
                        subBlock.span = subBlock.rowSpan = 1;
                        subBlock.valign = block.valign;
                        subBlock.halign = block.halign;
                        block = subBlock;
                     }

                     subBlock = AddBlock(block, TEXT);
                     delete subBlock.text;
                     subBlock.text = EncodeString(text, &textLen);
                     subBlock.textLen = textLen;
                     if(block.type != TITLE)
                        lastBR = false;

                     textLen = 0;
                     text[0] = '\0';
                  }
               }

               insideTag = true;
               tagLen = 0;
            }
            else if(ch != '\n' && ch != '\r' && ch != '\t' && !insideScript && !insideStyle)
            {
               if(insideSymbol)
               {
                  if(ch == ';')
                  {
                     unichar unicode = 0;
                     char utf8[5];
                     if(symbol[0] == '#' && symbol[1] == 'x')
                        unicode = strtol(symbol+2, null, 16);
                     else if(!strcmpi(symbol, "nbsp")) 
                        unicode = ' ';
                     else if(!strcmpi(symbol, "copy")) 
                        unicode ='©';
                     else if(!strcmpi(symbol, "raquo")) 
                        unicode = '»';
                     else if(!strcmpi(symbol, "eacute"))
                        unicode = 'é';
                     else if(!strcmpi(symbol, "egrave"))
                        unicode = 'è';
                     else if(!strcmpi(symbol, "ecirc"))
                        unicode = 'ê';
                     else if(!strcmpi(symbol, "agrave"))
                        unicode = 'à';
                     else if(!strcmpi(symbol, "acirc"))
                        unicode = 'â';
                     else if(!strcmpi(symbol, "ocirc"))
                        unicode = 'ô';
                     if(unicode)
                     {
                        int len = UTF32toUTF8Len(&unicode, 1, utf8, 5);
                        int c;
                        for(c = 0; c<len; c++)
                           text[textLen++] = utf8[c];
                        lastCh = 0;
                     }
                     text[textLen] = '\0';
                     insideSymbol = false;
                  }
                  else if(ch == ' ')
                  {
                     // Give up... Treat it as text
                     text[textLen++] = '&';
                     CopyBytes(text + textLen, symbol, symbolLen);
                     textLen += symbolLen;
                     lastCh = text[textLen++] = ' ';
                     text[textLen] = '\0';
                     insideSymbol = false;
                  }
                  else
                  {
                     if(symbolLen < MAX_SYMBOL_LEN-1)
                     {
                        symbol[symbolLen++] = ch;
                        symbol[symbolLen] = '\0';
                     }
                  }
               }
               else
               {
                  if(ch == '&')
                  {
                     insideSymbol = true;
                     symbol[0] = '\0';
                     symbolLen = 0;
                  }
                  else
                  {
                     if(ch != ' ' || lastCh != ' ' || code)
                     // if(ch != ' ' || (textLen && text[textLen-1] !=' '))
                     {
                        lastCh = ch;
                        text[textLen++] = ch;
                        text[textLen] = '\0';
                     }
                  }
               }
            }
            else if(ch == '\n' && code)
            {
               //printf("%d\n", textLen);
               //puts(text);

               subBlock = AddBlock(block, TEXT);
               delete subBlock.text;
               subBlock.text = EncodeString(text, &textLen);
               subBlock.textLen = textLen;
               textLen = 0;
               text[0] = '\0';
               subBlock = AddBlock(block, BR);               
            }
         }
      }
      delete text;
      /*while(!f.Eof())
      {
         byte ch = 0;
         f.Getc(&ch);
      }*/
      return result;
   }

   property String title
   {
      get
      {
         if(titleBlock && titleBlock.subBlocks.first && ((Block)titleBlock.subBlocks.first).type == TEXT)
         {
            Block t = titleBlock.subBlocks.first;
            return t.text;            
         }
         return null;
      }
   }
}
