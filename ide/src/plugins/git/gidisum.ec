
// gidisum stands for git diff summarizer

import "ecere"

import "ide"

import "lexers"

ConsoleFile console { };

enum ContentType
{
   unset,
   commit,
   _first = commit,
   author,
   date,
   space,
   subject,
   diffCommand,
   index,
   filenameAddition,
   filenameRemoval,
   position,
   contextLine,
   additionLine,
   removalLine,
   _last = removalLine;
   // _last = doesNotExist; // compiler crash after "error: could not resolve value doesNotExist for enum ContentType in precompiler" message

   bool isDiffFileSectionStart()
   {
      switch(this)
      {
         case diffCommand:
         case index:
         case filenameAddition:
         case filenameRemoval:
            return true;
      }
      return false;
   }

   bool isDiffFileSectionContent()
   {
      switch(this)
      {
         case position:
         case contextLine:
         case additionLine:
         case removalLine:
            return true;
      }
      return false;
   }

   bool isDiffLinesSectionStart()
   {
      switch(this)
      {
         case position:
            return true;
      }
      return false;
   }

   bool isDiffLinesSectionContent()
   {
      switch(this)
      {
         case contextLine:
         case additionLine:
         case removalLine:
            return true;
      }
      return false;
   }

   bool isDiffContent()
   {
      switch(this)
      {
         case contextLine:
         case additionLine:
         case removalLine:
            return true;
      }
      return false;
   }
};

Map<ContentType, const String> channelCodes
{ [
   { commit,            "CMT" },
   { author,            "AUT" },
   { date,              "DTE" },
   { subject,           "SBJ" },
   { diffCommand,       "DFC" },
   { index,             "IDX" },
   { filenameAddition,  "FAD" },
   { filenameRemoval,   "FRM" },
   { position,          "POS" },
   { contextLine,       "CTX" },
   { additionLine,      "ADL" },
   { removalLine,       "RML" },
   { unset,             "   " }
] };

enum ContentState : ContentType { exit = 800, error = 900 };

struct RevContentLine
{
   ContentType type;
   uint lineNumber;
   String string;
   // these fields are only used by some of the content types
   // far from optimal but we don't care
   String altered;
   String noLineNums;
};

enum SummarizedBy
{
   unset,
   file,
   revision,
};

enum DiffChangeType
{
   unset,
   change,
   insertion,
   deletion,
};

class LineRef : uint;
class SectionRef : uint;
class FileRef : uint;

struct SectionReference
{
   FileRef fref;
   SectionRef sref;
};

struct LocalChangeReference
{
   uint ndel; // number of deletions (deleted lines)
   uint nins; // number of insertions (added lines)
   LineRef lref;
   property DiffChangeType changeType { get { return ndel ? nins ? change : deletion : nins ? insertion : unset; } }
   property bool isBalanced { get { return ndel == nins; } }
};

struct FileChangeReference : LocalChangeReference
{
   SectionRef sref;
};

struct GlobalChangeReference : FileChangeReference
{
   FileRef fref;
};

struct DiffChange
{
   LocalChangeReference reference;
   SummarizedBy summarized;
   Summary summary;
   property DiffChangeType type { get { return reference.changeType; } }
   property bool isBalanced { get { return reference.isBalanced; } }
};

class DiffChanges : Array<DiffChange> { }

class DiffSection
{
   Contents lines { };
   DiffChanges changes { };
   SummarizedBy summarized;
}

class DiffSections : Array<DiffSection> { }

enum SummaryType : DiffChangeType
{
   identifierRename,
   valueChange
   // _last = identifierRename
};

enum ChangeTokenType
{
   unset,
   deletion,
   insertion
};

class ChangeToken
{
public:
   ChangeTokenType type;
   const char * str;
   uint len;
}

class Summary
{
   // bool withContext; // always false for now
   SummaryType type;
   // Summary subSummary; // if higher level summary can't be generalized then act on sub summaries aka lower level summaries
   Array<ChangeToken> changeTokens { };

   int OnCompare(Summary b)
   {
      if(b.type < type)
         return -1;
      else if(b.type > type)
         return 1;
      else
      {
         if(b.changeTokens.count < changeTokens.count)
            return -1;
         else if(b.changeTokens.count > changeTokens.count)
            return 1;
         else
         {
            int i;
            for(i = 0; 1 < changeTokens.count; ++i)
            {
               ChangeToken cta = changeTokens[i];
               ChangeToken ctb = b.changeTokens[i];
               if(cta.type < ctb.type)
                  return -1;
               else if(cta.type > ctb.type)
                  return 1;
               else
               {
                  int cmp = strncmp(cta.str, ctb.str, Min(cta.len, ctb.len));
                  if(cmp == 0)
                  {
                     if(cta.len < ctb.len)
                        return -1;
                     else if(cta.len > ctb.len)
                        return 1;
                  }
                  else
                     return cmp;
               }
            }
         }
      }
      return 0;
   }
}

class SummaryInfo
{
   GlobalChangeReference changeRef;
   AVLTree<FileRef> files;

}

class Summaries : Map<Summary, SummaryInfo> { }

#if 0
static const char * pyExtensions[] = { "py", null };
static const char * zigExtensions[] = { "zig", null };
static const char * swiftExtensions[] = { "swift", null };
static const char * rsExtensions[] = { "rs", null };
static const char * goExtensions[] = { "go", null };
static const char * phpExtensions[] = { "php", null };
static const char * jsExtensions[] = { "js", null };
static const char * glslExtensions[] = { "frag", "glsl", "vert", null };
static const char * cssExtensions[] = { "css", null };
static const char * bisonExtensions[] = { "y", "l", null };
static const char * shExtensions[] = { "sh", null };
static const char * batExtensions[] = { "bat", null };
static const char * xmlExtensions[] = { "xml", "xsd", "html", "htm", "xhtml", "gml", "sld", "kml", "dae", "svg", null };
static const char * econExtensions[] = { "econ", "json", "geoecon", "geojson", "topojson", "epj", "ews", "cmss", null };
static const char * diffExtensions[] = { "diff", "patch", null };
static const char * sqlExtensions[] = { "sql", null };
#endif // 0

static const char * noExtensions[] = { null };
static const char * makeExtensions[] = { "Makefile", "mk", "cf", null };
static const char * clikeExtensions[] =
{
   "c", "h",
   "cxx", "hxx", "cpp", "hpp", "cc", "hh", "inl",
   "ec", "eh",
   "m", "mm",
   "java",
   "cs",
   null
};
static const char ** modesExtensions[] = { noExtensions, makeExtensions, clikeExtensions, null };

public enum DiffFileType
{
   basic,
   // shell,
   // json,
   // xml,
   make,
   clike,
   _last = clike;

   // note: obscure, need a get and a set for conversion properties to work?
   property const char *
   {
      get { return ""; }
      set
      {
         const char * ext = value;
         DiffFileType type;
         for(type = basic; type <= _last; type++)
         {
            const char ** extensions;
            extensions = modesExtensions[type];
            if(extensions)
            {
               int c;
               for(c = 0; extensions[c] && extensions[c][0]; c++)
                  if(!strcmp(extensions[c], ext))
                     return type;
            }
         }
         return basic;
      }
   }

   /*
   bool OnGetDataFromString(const char * string)
   {
      this = string;
      return true; // this != basic
   }
   */
};

class DiffFile
{
   const String fileName;
   DiffFileType fileType;
   DiffSections sections { };
   Contents lines { };
   Summaries summaries { };
}

class Contents : Array<RevContentLine>
{
   void OnFree()
   {
      for(e : this)
      {
         RevContentLine rcl = e;
         delete rcl.string;
         delete rcl.altered;
         delete rcl.noLineNums;
      }
      Array::OnFree();
   }
}

class DiffFiles : Array<DiffFile> { }

class RevisionContent
{
   Contents headerLines { };
   Contents subjectLines { };
   // Contents lines { };
   DiffFiles files { };
   Summaries summaries { };
}

bool summarizeGitDiff(const char * path)
{
   bool result = true;
   Array<String> lines = getFileLines(path);

   /*
   CLikeTokens t = ampersand;
   const char * st = t;
   PrintLn(st);
   debugBreakpoint();
   */

   if(lines)
   {
      RevisionContent rc { };
      DiffFile df = null;
      DiffSection ds = null;
      ContentState state = commit;
      DiffChangeType dct = unset;
      uint lref = 0;
      uint ndel = 0;
      uint nins = 0;
      uint i = 0;
      for(i = 0; i < lines.count; ++i)
      {
         const String s = "";
         String line = lines[i];
         switch(state)
         {
            case commit:
               if((s = "commit ") && !strncmp(line, s, strlen(s)))
               {
                  ; // todo: parse the commit, store the hash? idk
                  rc.headerLines.Add({ commit, i + 1, line });
                  state = author;
               }
               else
               {
                  console.PrintLn("error: unknown revision content, expecting commit");
                  state = exit;
                  result = false;
               }
               break;
            case author:
               if((s = "Author: ") && !strncmp(line, s, strlen(s)))
               {
                  ; // todo: parse the author, store it? idk
                  rc.headerLines.Add({ author, i + 1, line });
                  state = date;
               }
               else
               {
                  console.PrintLn("error: unknown revision content, expecting author");
                  state = exit;
                  result = false;
               }
               break;
            case date:
               if(line[0] == '\0')
                  rc.headerLines.Add({ space, i + 1, line });
               else if((s = "Date: ") && !strncmp(line, s, strlen(s)))
               {
                  ; // todo: parse the author, store it? idk
                  rc.headerLines.Add({ author, i + 1, line });
                  state = subject;
               }
               else
               {
                  console.PrintLn("error: unknown revision content, expecting date");
                  state = exit;
                  result = false;
               }
               break;
            case subject:
               if(line[0] == '\0')
                  rc.subjectLines.Add({ space, i + 1, line });
               else if((s = "diff --git ") && !strncmp(line, s, strlen(s)))
               {
                  state = diffCommand;
                  i--;
               }
               else
                  rc.subjectLines.Add({ subject, i + 1, line });
               break;
            case diffCommand:
            {
               if((s = " ") && !strncmp(line, s, strlen(s)))
               {
                  if(dct != unset)
                  {
                     LocalChangeReference reference { ndel, nins, lref };
                     // if(lref) ; // dummy warning silencer // warning: variable ‘lref’ set but not used [-Wunused-but-set-variable] -- even though it is used? -- no longer occurs :S
                     ds.changes.Add({ /*dct, */reference });
                     if(dct != reference.changeType) debugBreakpoint();
                     dct = unset;
                     ndel = 0;
                     nins = 0;
                  }
                  ds.lines.Add({ contextLine, i + 1, line });
               }
               else if((s = "+++ ") && !strncmp(line, s, strlen(s)))
                  df.lines.Add({ filenameAddition, i + 1, line, altered = CopyString("+++ ######## REDACTED FILENAME") });
               else if((s = "--- ") && !strncmp(line, s, strlen(s)))
                  df.lines.Add({ filenameRemoval, i + 1, line, altered = CopyString("--- ######## REDACTED FILENAME") });
               // todo: proper 3-way diff detection without the false positives?
               /*
               else if((s = "++") && !strncmp(line, s, strlen(s)))
               {
                  console.PrintLn("error: unwanted 3-way diff revision content, we don't want ++ lines -- line(", i + 1, "): ", i + 1, line);
                  //state = exit;
                  //result = false;
                  ds.lines.Add({ additionLine, i + 1, line });
               }
               else if((s = "--") && !strncmp(line, s, strlen(s)))
               {
                  console.PrintLn("error: unwanted 3-way diff revision content, we don't want -- lines");
                  //state = exit;
                  //result = false;
                  ds.lines.Add({ removalLine, i + 1, line });
               }
               */
               else if((s = "+") && !strncmp(line, s, strlen(s)))
               {
                  ++nins;
                  if(dct == unset)
                  {
                     dct = insertion;
                     lref = ds.lines.count;
                  }
                  else if(dct == insertion || dct == change)
                     ;
                  else if(dct == deletion)
                     dct = change;
                  else debugBreakpoint();
                  ds.lines.Add({ additionLine, i + 1, line });
               }
               else if((s = "-") && !strncmp(line, s, strlen(s)))
               {
                  ++ndel;
                  if(dct == unset)
                  {
                     dct = deletion;
                     lref = ds.lines.count;
                  }
                  else if(dct != deletion) debugBreakpoint();
                  ds.lines.Add({ removalLine, i + 1, line });
               }
               else if((s = "index ") && !strncmp(line, s, strlen(s)))
                  df.lines.Add({ index, i + 1, line });
               else if((s = "@@") && !strncmp(line, s, strlen(s)))
               {
                  ds = { };
                  df.sections.Add(ds);
                  ds.lines.Add({ position, i + 1, line, altered = CopyString("@@ ######## @@  REDACTED LOCATION"), noLineNums = getPosWithoutLineNums(line) });
               }
               else if((s = "diff --git ") && !strncmp(line, s, strlen(s)))
               {
                  if((s = strstr(line + strlen(s), " b/")))
                  {
                     const String path = s + 3;
                     DiffFileType type = basic;
                     {
                        char name[MAX_FILENAME];
                        char ext[MAX_EXTENSION];
                        GetLastDirectory(path, name);
                        GetExtension(name, ext);
                        if(ext[0])
                           type = (String)ext;
                        if(type == basic && strstr(name, "Makefile") == name)
                           type = make;
                     // if(!type)
                     //    type = config;
                     }
                     df = { fileName = path, fileType = type };
                     rc.files.Add(df);
                     df.lines.Add({ diffCommand, i + 1, line });
                  }
                  else debugBreakpoint();
               }
               break;
            }
            case exit:
               break;
         }
         lines[i] = null;
      }
      lines.Free();
      delete lines;
      processDiffs(rc);
   }
   return result;
}

void processDiffs(RevisionContent rc)
{
   FileRef fref = 0;
   Lexer lexer { };
   LexRules rmk;
   LexRules rcl;
   LexRules rnc;
   LexProgram pmk;
   LexProgram pcl;
   LexProgram pnc;
   pmk = rmk = LexRulesMakefile { };
   pcl = rcl = LexRulesOldCLike { };
   pnc = rnc = LexRulesCLike { };
   // pcl.print(console);
   for(f : rc.files)
   {
      SectionRef sref = 0;
      DiffFile df = f;
      switch(df.fileType)
      {
         case make:
            lexer.program = pmk;
            break;
         case clike:
            lexer.program = pnc/*pcl*/;
            break;
         case basic:
         default:
            lexer.program = pmk; // todo: some other lexer program for basic files
            break;
      }
      for(s : df.sections)
      {
         uint cref = 0;
         DiffSection ds = s;
         for(c : ds.changes)
         {
            DiffChange dc = c;
            ChangeTokenType ctt;
            switch(dc.type)
            {
               case deletion:
                  ctt = deletion;
                  break;
               case insertion:
                  ctt = insertion;
                  break;
               default:
                  ctt = unset;
                  break;
            }
            switch(dc.type)
            {
               case unset:
                  debugBreakpoint();
                  break;
               case deletion:
               case insertion:
               {
                  uint limit = dc.reference.lref + dc.reference.ndel + dc.reference.nins;
                  uint len = 0;
                  LineRef lref;
                  dc.summary = { };
                  dc.summary.type = dc.type;
                  for(lref = dc.reference.lref; lref < limit; ++lref)
                  {
                     const String line = ds.lines[lref].string + 1;
                     len += strlen(line);
                  }
                  {
                     byte * b = new char[len + 1];
                     char * d = (char *)b;
                     for(lref = dc.reference.lref; lref < limit; ++lref)
                     {
                        const String line = ds.lines[lref].string + 1;
                        uint len = strlen(line);
                        strncpy(d, line, len);
                        d += len;
                     }
                     b[len] = 0;
                     lexer.in = (char *)b;
                     lexer.inlen = len;
                     {
                        Encoding enc = utf8; // passed but not even used anyway
                        // uint lc = lexer.linecount();
                        lexer.tokenize(enc);
                        Print("");
                        for(t : lexer.pile)
                        {
                           Token token = t;
                           const String s = pcl.reverseTokens[token.id];
                           if(token.id && s) ; // warning silencer
                           
                           dc.summary.changeTokens.Add({ ctt, token.strp, token.len });
                        }
                        PrintLn(lexer.in);
                        lexer.print(console, true);
                        /*
                        if(lexer.test())
                        {
                           PrintLn("ok");
                        }
                        else
                        {
                           PrintLn("crap");
                        }
                        */
                     }
                     lexer.reset();
                     lexer.clear();
                  }
                  break;
               }
               case change:
                  if(dc.isBalanced)
                  {
                  }
                  else
                  {
                  }
                  break;
            }
            // change.
            /*
            switch(rcl.type)
            {
               case contextLine:
                  // for now we don't care
                  break;
               case additionLine:
               case removalLine:
                  break;
            }
            */
            ++cref;
         }
         ++sref;
      }
      ++fref;
   }
   lexer.program = null;
   lexer.clear();
   delete lexer;
   delete pcl;
   delete rcl;

}

String getPosWithoutLineNums(const String line)
{
   char * rest = strstr(line + 3, "@@");
   if(!rest)
      PrintLn("ERROR @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ERROR");
   return PrintString("@@ ######## @@", rest ? rest + 2 : "");
}

Array<String> getFileLines(const char * path)
{
   File f = FileOpen(path, read);
   if(f)
   {
      uint count = 0;
      Array<String> lines { };
      while(!f.eof)
      {
         char line[8192];
         count++;
         line[0] = '\0';
         if(f.GetLine(line, sizeof(line)))
            lines.Add(CopyString(line));
      }
      if(count)
         return lines;
      delete lines;
      delete f;
   }
   return null;
}
