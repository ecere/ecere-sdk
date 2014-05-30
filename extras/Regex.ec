
#define __restrict
#ifndef __restrict_arr
#define __restrict_arr
#endif

#define uint _uint
#ifdef __WIN32__
#include <sys/types.h>
#endif
#include <regex.h>
#undef uint

#ifdef BUILDING_ECERE_COM
namespace sys;
import "instance"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

public class Regex : struct
{
public:
   property String regex
   {
      set
      {
         if((value || regex) && (value != regex || strcmp(value, regex)))
         {
            if(value)
            {
               delete regex;
               regex = CopyString(value);
               Compile();
            }
            else
               Free();
         }

      }
      get { return regex; }
   }

   property bool caseInsensitive
   {
      set
      {
         if(value != ((compileFlags & REG_ICASE) != 0))
         {
            value ? (compileFlags |= REG_ICASE) : (compileFlags &= ~REG_ICASE);
            if(regex)
               Compile();
         }
      }
      get { return (compileFlags & REG_ICASE) != 0; }
   }

   property bool newLineException
   {
      set
      {
         //if(value != ((compileFlags & REG_NEWLINE) != 0))
         if(value != ((compileFlags & REG_EXTENDED)))
         {
            value ? (compileFlags |= REG_NEWLINE) : (compileFlags &= ~REG_NEWLINE);
            if(regex)
               Compile();
         }
      }
      get { return (compileFlags & REG_NEWLINE) != 0; }
   }

   property bool lineStartException
   {
      set
      {
         if(value != ((executeFlags & REG_NOTBOL) != 0))
            value ? (executeFlags |= REG_NOTBOL) : (executeFlags &= ~REG_NOTBOL);
      }
      get { return (executeFlags & REG_NOTBOL) != 0; }
   }

   property bool lineEndException
   {
      set
      {
         if(value != ((executeFlags & REG_NOTEOL) != 0))
            value ? (executeFlags |= executeFlags | REG_NOTEOL) : (executeFlags &= ~REG_NOTEOL);
      }
      get { return (executeFlags & REG_NOTEOL) != 0; }
   }

   property bool extendedSyntax
   {
      set
      {
         if(value != ((compileFlags & REG_EXTENDED) != 0))
         {
            value ? (compileFlags |= REG_EXTENDED) : (compileFlags &= ~REG_EXTENDED);
            if(regex)
               Compile();
         }
      }
      get { return (compileFlags & REG_EXTENDED) != 0; }
   }

   property bool valid { get { return valid; } }

   property int maxMatchCount
   {
      set
      {
         if(value != maxMatchCount)
         {
            maxMatchCount = value > 0 ? value : 1;
            delete matches;
            matches = new regmatch_t[maxMatchCount];
         }
      }
      get { return maxMatchCount; }
   }

   property int matchCount { get { return matchCount; } }

   char * Match(const String string)
   {
      if(valid)
      {
         int c;
         int result;
         result = regexec(&compiledRegex, string, maxMatchCount, matches, executeFlags);
         if(result == 0) // != REG_NOMATCH
         {
            for(c = 0; c < maxMatchCount; c++)
            {
               if(matches[c].rm_so == -1)
               {
                  matchCount = c;
                  break;
               }
            }
            if(c == maxMatchCount)
               matchCount = maxMatchCount;
            return (char *)string + matches[0].rm_so;
         }
         else
            matchCount = 0;
      }
      return null;
   }

   int GetMatchStartOffset(int matchPos)
   {
      return matches[matchPos].rm_so;
   }

   int GetMatchEndOffset(int matchPos)
   {
      return matches[matchPos].rm_eo;
   }

private:
   bool valid;
   int compileFlags;
   int executeFlags;
   int matchCount;
   int maxMatchCount;
   regex_t compiledRegex;
   regmatch_t * matches;

   ~Regex()
   {
      Free();
   }

   void Free()
   {
      delete matches;
      delete regex;
      regfree(&compiledRegex);
      valid = false;
   }

   void Compile()
   {
      int result;
      regfree(&compiledRegex);
      // compileFlags -- REG_NOSUB --  no substring addressing of matches -- nmatch and pmatch in regexec(...) are ignored if used
      result = regcomp(&compiledRegex, regex, compileFlags/* | REG_NOSUB*/);
      valid = result == 0;
      if(valid && !maxMatchCount)
         property::maxMatchCount = 1;

      // TODO: handle errors?
      // size_t regerror(int errcode, const regex_t *preg, char *errbuf, size_t errbuf_size);
      // REG_BADBR      Invalid use of back reference operator.
      // REG_BADPAT     Invalid use of pattern operators such as group or list.
      // REG_BADRPT     Invalid use of repetition operators such as using '*' as the first character.
      // REG_EBRACE     Un-matched brace interval operators.
      // REG_EBRACK     Un-matched bracket list operators.
      // REG_ECOLLATE   Invalid collating element.
      // REG_ECTYPE     Unknown character class name.
      // REG_EEND       Non specific error. This is not defined by POSIX.2.
      // REG_EESCAPE    Trailing backslash.
      // REG_EPAREN     Un-matched parenthesis group operators.
      // REG_ERANGE     Invalid use of the range operator, eg. the ending point of the range occurs prior to the starting point.
      // REG_ESIZE      Compiled regular expression requires a pattern buffer larger than 64Kb. This is not defined by POSIX.2.
      // REG_ESPACE     The regex routines ran out of memory.
      // REG_ESUBREG    Invalid back reference to a subexpression.
   }

   String regex;
}
