#include "debug.eh"

import "ecere"

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
void bigCommentLibrary(ZString out, const char * s)//, const char * tag)
{
   int len = strlen(s);
   //out.concatx(ln);
   out.concatx(sc(80, 0),                                          " ", sc(24, 0), ln);
   out.concatx(sc(80, 0),                                          " ", sc(24, 0), ln);
   out.concatx(sc(4, 0), spaces(72, 0),                  sc(4, 0), " ", sc(24, 0), ln);
   out.concatx(sc(4, 0), "    ", s, spaces(72, len + 4), sc(4, 0), " ", sc(24, 0), ln);
   out.concatx(sc(4, 0), spaces(72, 0),                  sc(4, 0), " ", sc(24, 0), ln);
   out.concatx(sc(80, 0),                                          " ", sc(24, 0), ln);
   out.concatx(sc(80, 0),                                          " ", sc(24, 0), ln);
   out.concatx(ln);
/*
   int len = strlen(s);
   int gapB = 38 - (int)(len / 2);
   int gapA = 76 - len - gapB;
   out.concatx("/-*", ln);
   out.concatx(ln);
   out.concatx(sharps(2, 0), sharps(76, 0),                       sharps(2, 0), ln);
   out.concatx(sharps(2, 0), spaces(gapA, 0), s, spaces(gapB, 0), sharps(2, 0), ln);
   out.concatx(sharps(2, 0), sharps(76, 0),                       sharps(2, 0), ln);
   out.concatx(ln);
   out.concatx("*-/", ln);

   out.concatx(ln);
   out.concatx(ln);
   out.concatx(ln);

   out.concatx(slashes(2, 0), slashes(48, 0),                                "  ", slashes(26, strlen(_lib)), " ", _lib, " ", slashes(2, 0), ln);
   out.concatx(slashes(2, 0), "    ", s, "    ", slashes(48, strlen(s) + 8), "  ", slashes(26, strlen(_lib)), " ", _lib, " ", slashes(2, 0), ln);
   out.concatx(slashes(2, 0), slashes(48, 0),                                "  ", slashes(26, strlen(_lib)), " ", _lib, " ", slashes(2, 0), ln);
*/
}
//const char * _ns = "namespace";
void bigCommentSection(ZString out, const char * s)//, const char * tag)
{
   int len = strlen(s);
   out.concatx(ln);
   out.concatx(sc(70, len), " ", s, " ", sc(8, 0), " ", sc(16, 0), ln);
   out.concatx(sc(80, 0),                          " ", sc(16, 0), ln);
   out.concatx(sc(80, 0),                          " ", sc(16, 0), ln);
   out.concatx(ln);
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

void sectionComment_hdr(ZString out, const char * s)
{
   out.concatx(slashes(2, 0), " ", s, " ", slashes(24, strlen(s)));
}

void sectionComment_msg(ZString out, const char * s)
{
   char * t = CopyString(s);
   ChangeCh(t, ':', '|');
   out.concatx(" ", slashes(8, 0), "  ", t, "  ", slashes(60, 2 + strlen(t) + 2));
   delete t;
}

void sectionComment_msg_line(ZString out)
{
   out.concatx(" ", slashes(4 + 64, 0));
}

void sectionComment_ftr(ZString out)
{
   out.concatx(" ", slashes(32, 0));
}

bool sourceFileProcessToZedString(ZString out, const char * pathToFile, Map<String, String> vars, bool noComments, bool quiet)
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
            bool skipNewLine = false;
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
                     out.concat(part);
                     out.concat(val);
                     end = search = close + 2;
                     skipNewLine = open == line && end[0] == '\0' && strchr(val, '\n');
                  }
                  else
                     *close = ')';
               }
            }
            if(!skipNewLine)
               out.concatx(end, ln);
         }
         else if(line[0] || !comment)
            out.concatx(line, ln);
      }
      delete f;
      return true;
   }
   else if(!quiet)
      Print("warning: sourceFileProcessToZedString was unable to open ", pathToFile);
   return false;
}

// there should be at least a partial common interface between a file and a string class
// the sourceFileProcessToFile function is a essentially duplicate of sourceFileProcessToZedString function
bool sourceFileProcessToFile(File out, File in, const char * pathToFile, Map<String, String> vars, bool noComments, bool quiet)
{
   File f = in ? in : FileOpen(pathToFile, read);
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
            bool skipNewLine = false;
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
                     skipNewLine = open == line && end[0] == '\0' && strchr(val, '\n');
                  }
                  else
                     *close = ')';
               }
            }
            if(!skipNewLine)
               out.PrintLn(end);
         }
         else if(line[0] || !comment)
            out.PrintLn(line);
      }
      delete f;
      return true;
   }
   else if(!quiet)
      Print("warning: sourceFileProcessToFile was unable to open ", pathToFile);
   return false;
}
