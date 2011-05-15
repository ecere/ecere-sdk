import "HTMLView"

#define MAX_TAG_LEN  204800
#define MAX_SYMBOL_LEN  1000

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

static bool GetKeyWordEx(char ** input, char * keyWord, int maxSize, bool treatEqual)
{
   char * string = *input;
   char ch;
   int c = 0;
   bool quoted = false, start = true, wasQuoted = false;

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
         else if(ch == '\"' /*|| ch == '\''*/)
         {
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
   return GetKeyWordEx(input, keyWord, maxSize, true);
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

static Block AddBlock(Block parent, BlockType type)
{
   Block block = Block { parent = parent, type = type };
   parent.subBlocks.Add(block);
   return block;
}

#include <stdio.h>

class HTMLFile
{
   Block block {};
   Block defaultFont { };

   Block body;
   ColorAlpha background { 255, white };
   //Button defaultButton;

   bool Parse(File f)
   {
      bool insideTag = false;
      char tag[MAX_TAG_LEN];
      char symbol[MAX_SYMBOL_LEN];
      int tagLen;
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

      fontBlock.font = FontEntry { size = fontBlock.size, attribs = fontBlock.attribs, face = CopyString(fontBlock.face) };
      fontCache.Add(fontBlock.font);

      background = white;
      
      text = new char[32768*4];

      body = block;
      
      // Parse entire file
      while(!f.Eof() && block)
      {
         byte ch = 0;
         
         f.Getc(&ch);
         //fwrite(&ch, 1, 1, stdout);
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
            if(ch == '<' && !quoted)
               insideTag++;
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
                        subBlock = AddBlock(block, IMAGE);
                        subBlock.valign = bottom;
                        subBlock.halign = middle;
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));
                           if(!strcmpi(keyWord, "src"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false);
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
                              background = strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16);
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
                     else if(!strcmpi(keyWord, "br"))
                     {
                        subBlock = AddBlock(block, BR);
                        lastCh = ' ';
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
                        if(block.type == FONT)
                        {
                           fontBlock = block.prevFont;
                           block = block.parent;
                        }
                     }
                     else if(!strcmpi(keyWord, "a"))
                     {
                        int textDecoration = 0;
                        subBlock = AddBlock(block, ANCHOR);
                        subBlock.attribs = fontBlock.attribs;

                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "name"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false);
                              delete subBlock.anchor;
                              subBlock.anchor = CopyString(keyWord);
                           }
                           else if(!strcmpi(keyWord, "href"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false);
                              delete subBlock.href;
                              subBlock.href = CopyString(keyWord);
                              if(!textDecoration)
                                 textDecoration = 1;
                           }
                           else if(!strcmpi(keyWord, "style"))
                           {
                              //for(;string[0];)
                              {
                                 GetKeyWordEx(&string, keyWord, sizeof(keyWord), false);
                                 if(strstr(keyWord, "text-decoration:") && strstr(keyWord, "none;"))
                                    textDecoration = 2;
                              }
                           }
                        }
                        subBlock.attribs |= FONT_BOLD;
                        if(textDecoration == 1) subBlock.attribs |= FONT_UNDERLINE;
                        delete subBlock.face;
                        subBlock.face = CopyString(fontBlock.face);
                        subBlock.size = fontBlock.size;
                        subBlock.textColor = Color { 85,85,255 };
                        subBlock.prevFont = fontBlock;
                        fontBlock = subBlock;
                        block = subBlock;
                     }
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
                     else if(!strcmpi(keyWord, "input"))
                     {
                        subBlock = AddBlock(block, INPUT);
                        for(;string[0];)
                        {
                           GetKeyWord(&string, keyWord, sizeof(keyWord));

                           if(!strcmpi(keyWord, "type"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              if(!strcmpi(keyWord, "text"))
                              {
                                 subBlock.inputType = InputType::text;
                              }
                              else if(!strcmpi(keyWord, "submit"))
                              {
                                 subBlock.inputType = submit;
                              }
                              else if(!strcmpi(keyWord, "radio"))
                              {
                                 subBlock.inputType = radio;
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
                              int size;
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              size = atoi(keyWord);
                           }
                           else if(!strcmpi(keyWord, "value"))
                           {
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false);
                              delete subBlock.value;
                              subBlock.value = CopyString(keyWord);
                           }
                           else if(!strcmpi(keyWord, "name"))
                           {
                              GetKeyWord(&string, keyWord, sizeof(keyWord));
                              delete subBlock.name;
                              subBlock.name = CopyString(keyWord);
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
                              GetKeyWordEx(&string, keyWord, sizeof(keyWord), false);
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
                              subBlock.bgColor = 0xFF000000 | strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16);
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
                           lastCh = ' ';
                        }
                        if(block.type == TR)
                        {
                           block = block.parent;
                           lastCh = ' ';
                        }
                        if(block.type == TABLE)
                        {
                           block = block.parent;
                           lastCh = ' ';
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
                                 subBlock.bgColor = 0xFF000000 | strtol((keyWord[0] == '#') ? (keyWord+1) : keyWord, null, 16);
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
                           lastCh = ' ';
                        }
                     }
                     else if(!strcmpi(keyWord, "/html"))
                        break;
                  }
               }
               else
               {
                  tag[tagLen++] = ch;
                  tag[tagLen] = '\0';
               }
            }
            else
            {
               tag[tagLen++] = ch;
               tag[tagLen] = '\0';
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
                  subBlock.text = CopyString(text);
                  subBlock.textLen = textLen;


                  textLen = 0;
                  text[0] = '\0';

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
                     if(!strcmpi(symbol, "nbsp")) 
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
                     symbol[symbolLen++] = ch;
                     symbol[symbolLen] = '\0';
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
               subBlock.text = CopyString(text);
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
      return true;
   }
}
