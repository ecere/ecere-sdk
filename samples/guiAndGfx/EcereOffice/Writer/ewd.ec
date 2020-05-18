// ******** Ecere Writer Document format ****************

import "ecere"
import "htmlParser"

#include "ccstr.h"

// Currently here for lack of another better low dependency place...
public int printDoubleDec(double value, int numDec, char * s, int size)
{
   int l = ccStrPrintDouble(s, size, numDec, value);
   if(strchr(s, '.'))
   {
      while(l > 1 && (s[l-1] == '0' || s[l-1] == '.') && (s[l-2] == '.' || isdigit(s[l-2])))
      {
         l--;
         if(s[l] == '.') break;
      }
      s[l] = 0;
   }
   return l;
}

bool html2ewd(File f, File out)
{
   bool result = false;
   HTMLFile html { };

   if(html.Parse(f))
      result = writeEWD(html, out);
   delete html;
   return result;
}

bool ewd2html(File f, File out, bool htmlExport)
{
   bool result = true;
   bool inFont = false;
   bool bold = false, italic = false;
   Color textColor = black;
   char textColorHex[10];
   int fontSize = 3;
   char face[256];
   bool fontChanged = !htmlExport;
   bool italicWasOn = false;
   bool boldWasOn = false;
   char ch;
   bool lastIsSpace = false;

   strcpy(face, "Times New Roman"); // TODO: make this a define? html.defaultFont.face);

   out.PrintLn("<html><body>");

   while(f.Getc(&ch))
   {
      bool outputChar = false;
      if(ch == '\\' || ch == '*' || ch == '_')
      {
         char control;
         if(ch == '\\')
         {
            if(f.Getc(&control))
            {
               switch(control)
               {
                  case 'n':
                     out.PrintLn("<BR>");
                     break;
                  case 'f':
                  {
                     int i = 0;
                     bool quoted = false;

                     f.Getc(&ch);
                     if(ch == '\"')
                        quoted = true;
                     else
                        f.Seek(-1, current);

                     while(i < 255 && f.Getc(&ch))
                     {
                        if((quoted && ch == '\"') || (!quoted && !isalnum(ch)))
                        {
                           if(!quoted)
                              f.Seek(-1, current);
                           break;
                        }
                        else
                           face[i++] = ch;
                     }
                     face[i] = 0;

                     fontChanged = true;
                     break;
                  }
                  case 'c':
                  {
                     char color[7];
                     int i = 0;

                     while(i < 6 && f.Getc(&ch))
                     {
                        if(isdigit(ch) || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F'))
                           color[i++] = ch;
                        else
                        {
                           f.Seek(-1, current);
                           break;
                        }
                     }
                     color[i] = 0;
                     textColor = strtol(color, null, 16);
                     sprintf(textColorHex, "%06X", textColor);

                     fontChanged = true;
                     break;
                  }
                  case 's':
                  {
                     char number[32];
                     int i = 0;
                     double size;

                     #define NUM_FONT_SIZES  7
                     static float fontSizes[NUM_FONT_SIZES] = { 7.5f, 10, 12, 13.5f, 18, 24, 36 };

                     while(i < 31 && f.Getc(&ch))
                     {
                        if(ch == '.' || isdigit(ch))
                           number[i++] = ch;
                        else
                        {
                           f.Seek(-1, current);
                           break;
                        }
                     }
                     number[i] = 0;
                     size = strtod(number, null);

                     for(i = 1; i <= NUM_FONT_SIZES; i++)
                     {
                        if(fabs(size - fontSizes[i-1]) < fabs(size - fontSizes[fontSize]))
                           fontSize = i;
                     }

                     fontChanged = true;
                     break;
                  }
                  default:
                     ch = control;
                     outputChar = true;
                     break;
               }
            }
         }
         else if(ch == '*')
            bold ^= true;
         else if(ch == '_')
            italic ^= true;
      }
      else
         outputChar = true;

      if(outputChar)
      {
         if(ch != '\n') //!isspace(ch))
         {
            if(fontChanged || (!htmlExport && (boldWasOn != bold || italicWasOn != italic)))
            {
               if(italicWasOn) out.Print("</em>");
               if(boldWasOn) out.Print("</b>");
               if(inFont) out.Print("</font>");
               sprintf(textColorHex, "%06X", textColor);
               out.Print("<font face='", face, "' size='", fontSize, "' color='#", textColorHex, "'>");
               inFont = true;
               if(bold) out.Print("<b>");
               if(italic) out.Print("<em>");
            }
            else if(italicWasOn != italic)
            {
               out.Print("<", italic  ? "" : "/", "em>");
            }
            else if(boldWasOn != bold)
            {
               if(italicWasOn) out.Print("</em>");
               out.Print("<", bold ? "" : "/", "b>");
               if(italic) out.Print("<em>");
            }

            fontChanged = false;
            boldWasOn = bold;
            italicWasOn = italic;
         }
         switch(ch)
         {
            case '<': out.Puts("&lt;"); break;
            case '>': out.Puts("&gt;"); break;
            case ' ':
               if(lastIsSpace)
               {
                  out.Puts("&nbsp;");
                  break;
               }
               else
                  lastIsSpace = true;
            default:
               out.Putc(ch);
         }
         if(ch != ' ')
            lastIsSpace = false;
      }
   }

   if(italic) out.Print("</em>");
   if(bold) out.Print("</b>");
   if(inFont) out.Print("</font>");

   out.PrintLn("\n</body></html>");
   return result;
}

bool writeEWD(HTMLFile html, File f)
{
   bool result = true;
   Block block = html.body;
   Block font = html.defaultFont;
   ColorAlpha color = black;
   char face[256];
   double size = 10;
   bool bold = false, italic = false;

   strcpy(face, font.face);

   while(block)
   {
      switch(block.type)
      {
         case FONT:
            font = block;
            break;
         case BR:
            f.Puts("\\n\n");
            break;
         case TEXT:
         {
            const char * text = block.text;

            if(text[0])
            {
               int i, start = 0;

               if(!(font.attribs & 2) && italic)
                  f.Puts("_"), italic = false;
               if(!(font.attribs & 1) && bold)
                  f.Puts("*"), bold = false;

               if(strcmpi(font.face, face))
               {
                  f.Puts("\\f\"");
                  f.Puts(font.face);
                  f.Puts("\"");
                  strcpy(face, font.face);
               }
               if(font.size != size)
               {
                  char tmp[32];
                  f.Puts("\\s");
                  printDoubleDec(font.size, 2, tmp, 32);
                  f.Puts(tmp);
                  size = font.size;
               }
               if(font.textColor != color)
               {
                  f.Puts("\\c");
                  color = font.textColor;
                  f.Printf("%06X", color.color);
               }
               if((font.attribs & 1) && !bold)
                  f.Puts("*"), bold = true;
               if((font.attribs & 2) && !italic)
                  f.Puts("_"), italic = true;

               for(i = 0;; i++)
               {
                  char ch = text[i];
                  if(!ch || (ch == '\\' || ch == '*' || ch == '_'))
                  {
                     if(i > start)
                     {
                        f.Write(text + start, 1, i - start);
                        start = i+1;
                     }
                     if(!ch)
                        break;
                     else
                     {
                        f.Putc('\\');
                        f.Putc(ch);
                     }
                  }
               }
            }
            break;
         }
      }

      if(block.subBlocks.first)
         block = block.subBlocks.first;
      else
      {
         if(block.type == FONT)
         {
            font = block.parent;
            while(font && font.type != FONT) font = font.parent;
            if(!font) font = html.defaultFont;
         }

         if(block.next)
            block = block.next;
         else
         {
            block = block.parent;
            if(block && block.type == FONT)
            {
               font = block.parent;
               while(font && font.type != FONT) font = font.parent;
               if(!font) font = html.defaultFont;
            }
            while(block && !block.next)
            {
               if(block && block.type == FONT)
               {
                  font = block.parent;
                  while(font && font.type != FONT) font = font.parent;
                  if(!font) font = html.defaultFont;
               }
               block = block.parent;
            }
            if(block) block = block.next;
         }
      }
   }
   return result;
}
