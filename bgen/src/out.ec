import "ecere"

import "DynamicString"
import "miscTypes"

import "str"

// bindings section comment
const char * bscv1; // value 1
const char * bscv2; // value 2
//const char * _lib = "library";
const char * _lm = "module"; // "library / module";
const char * _ns = "namespace";
const char * _cl = "class";
// slash chars
#define sc slashes
void bigCommentLibrary(DynamicString out, const char * s)//, const char * tag)
{
   int len = strlen(s);
   //out.printxln("");
   out.printxln(sc(80, 0),                                          " ", sc(24, 0));
   out.printxln(sc(80, 0),                                          " ", sc(24, 0));
   out.printxln(sc(4, 0), spaces(72, 0),                  sc(4, 0), " ", sc(24, 0));
   out.printxln(sc(4, 0), "    ", s, spaces(72, len + 4), sc(4, 0), " ", sc(24, 0));
   out.printxln(sc(4, 0), spaces(72, 0),                  sc(4, 0), " ", sc(24, 0));
   out.printxln(sc(80, 0),                                          " ", sc(24, 0));
   out.printxln(sc(80, 0),                                          " ", sc(24, 0));
   out.printxln("");
/*
   int len = strlen(s);
   int gapB = 38 - (int)(len / 2);
   int gapA = 76 - len - gapB;
   out.printxln("/-*");
   out.printxln("");
   out.printxln(sharps(2, 0), sharps(76, 0),                       sharps(2, 0));
   out.printxln(sharps(2, 0), spaces(gapA, 0), s, spaces(gapB, 0), sharps(2, 0));
   out.printxln(sharps(2, 0), sharps(76, 0),                       sharps(2, 0));
   out.printxln("");
   out.printxln("*-/");

   out.printxln("");
   out.printxln("");
   out.printxln("");

   out.printxln(slashes(2, 0), slashes(48, 0),                                "  ", slashes(26, strlen(_lib)), " ", _lib, " ", slashes(2, 0));
   out.printxln(slashes(2, 0), "    ", s, "    ", slashes(48, strlen(s) + 8), "  ", slashes(26, strlen(_lib)), " ", _lib, " ", slashes(2, 0));
   out.printxln(slashes(2, 0), slashes(48, 0),                                "  ", slashes(26, strlen(_lib)), " ", _lib, " ", slashes(2, 0));
*/
}
//const char * _ns = "namespace";
void bigCommentSection(DynamicString out, const char * s)//, const char * tag)
{
   int len = strlen(s);
   out.printxln("");
   out.printxln(sc(70, len), " ", s, " ", sc(8, 0), " ", sc(16, 0));
   out.printxln(sc(80, 0),                          " ", sc(16, 0));
   out.printxln(sc(80, 0),                          " ", sc(16, 0));
   out.printxln("");
}
// bindings section comment
void section_comment_hdr(File out, const char * s)
{
   out.Print(slashes(2, 0), " ", s, " ", slashes(24, strlen(s)));
}

void section_comment_msg(File out, const char * s)
{
   char * t = CopyString(s);
   ChangeCh(t, ':', '|');
   out.Print(" ", slashes(8, 0), "  ", t, "  ", slashes(60, 2 + strlen(t) + 2));
   delete t;
}

void section_comment_msg_line(File out)
{
   out.Print(" ", slashes(4 + 64, 0));
}

void section_comment_ftr(File out)
{
   out.Print(" ", slashes(32, 0));
}

void sectionComment_hdr(DynamicString out, const char * s)
{
   out.concatx(slashes(2, 0), " ", s, " ", slashes(24, strlen(s)));
}

void sectionComment_msg(DynamicString out, const char * s)
{
   char * t = CopyString(s);
   ChangeCh(t, ':', '|');
   out.concatx(" ", slashes(8, 0), "  ", t, "  ", slashes(60, 2 + strlen(t) + 2));
   delete t;
}

void sectionComment_msg_line(DynamicString out)
{
   out.concatx(" ", slashes(4 + 64, 0));
}

void sectionComment_ftr(DynamicString out)
{
   out.concatx(" ", slashes(32, 0));
}

void sourceFileProcessToDynamicString(DynamicString out, const char * pathToFile, Map<String, String> vars, bool noComments)
{
   File f = FileOpen(pathToFile, read);
   if(f)
   {
      char line[4096];
      while(f.GetLine(line, sizeof(line)))
      {
         char * comment = strstr(line, "#//");
         if(comment)
         {
            while(comment > line && isspace(*(comment - 1))) comment--;
            *comment = 0;
         }
         if(noComments)
         {
            char * s = strstr(line, "//");
            comment = (comment && (!s || comment < s)) ? comment : s;
            if(comment)
            {
               while(comment > line && isspace(*(comment - 1))) comment--;
               *comment = 0;
            }
         }
         if(line[0] && vars)
         {
            char * end, * search, * open, * close;
            end = search = line;
            while(*end && (open = strstr(search, "#(")) && (close = strstr(open + 2, ")#")) && (search = open + 2))
            {
               if(close - open > 2)
               {
                  char * val;
                  *close = 0;
                  if((val = vars[open + 2]))
                  {
                     char * part = end;
                     *open = 0;
                     out.print(part);
                     out.print(val);
                     end = search = close + 2;
                  }
                  else
                     *close = ')';
               }
            }
            out.println(end);
         }
         else if(line[0] || !comment)
            out.println(line);
      }
      delete f;
   }
}

// there should be at least a partial common interface between a file and a string class
// the sourceFileProcessToFile function is a essentially duplicate of sourceFileProcessToDynamicString function
void sourceFileProcessToFile(File out, const char * pathToFile, Map<String, String> vars, bool noComments)
{
   File f = FileOpen(pathToFile, read);
   if(f)
   {
      char line[4096];
      while(f.GetLine(line, sizeof(line)))
      {
         char * comment = strstr(line, "#//");
         if(comment)
         {
            while(comment > line && isspace(*(comment - 1))) comment--;
            *comment = 0;
         }
         if(noComments)
         {
            char * s = strstr(line, "//");
            comment = (comment && (!s || comment < s)) ? comment : s;
            if(comment)
            {
               while(comment > line && isspace(*(comment - 1))) comment--;
               *comment = 0;
            }
         }
         if(line[0] && vars)
         {
            char * end, * search, * open, * close;
            end = search = line;
            while(*end && (open = strstr(search, "#(")) && (close = strstr(open + 2, ")#")) && (search = open + 2))
            {
               if(close - open > 2)
               {
                  char * val;
                  *close = 0;
                  if((val = vars[open + 2]))
                  {
                     char * part = end;
                     *open = 0;
                     out.Print(part);
                     out.Print(val);
                     end = search = close + 2;
                  }
                  else
                     *close = ')';
               }
            }
            out.PrintLn(end);
         }
         else if(line[0] || !comment)
            out.PrintLn(line);
      }
      delete f;
   }
}
