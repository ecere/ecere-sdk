public import "ecere"

#define MAX_TAG_LEN  2048

enum WordStatus
{
   None,
   Normal,
   Quoted
};

static WordStatus GetKeyWordEx(char ** input, char * keyWord, int maxSize, bool treatEqual)
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
   return (c > 0) ? (wasQuoted ? Quoted : Normal) : None;
}

static WordStatus GetKeyWord(char ** input, char * keyWord, int maxSize)
{
   return GetKeyWordEx(input, keyWord, maxSize, true);
}

#define CHARBUFSIZE  65536

class XMLParser
{
   virtual void ProcessKeyword(char * keyWord);
   virtual void ProcessCharacterData(char * data);

   char keyWord[1024];
   char * string;
   int xmlDepth;
   bool closingTag;
   bool openingTag;

   bool GetWord()
   {
      if(string && string[0])
      {
         GetKeyWord(&string, keyWord, sizeof(keyWord));
         return true;
      }
      return false;
   }

   bool Parse(char * inputString, int count)
   {
      bool insideTag = false;
      char tag[MAX_TAG_LEN];
      int tagLen;
      bool commented = false;
      byte lastCh = ' ';
      int stringPos;
      byte characterData[CHARBUFSIZE];
      int charLen = 0;
      int oldDepth = xmlDepth;
      tag[0] = 0;
      
      closingTag = false;
      
      // Preparse to check for completeness
      for(stringPos = 0; stringPos < count; stringPos++)
      {
         byte ch = inputString[stringPos];
      
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
            if(ch == '/' && lastCh == '<')
               closingTag = true;

            if(ch == '<')
            {
               insideTag++;
               openingTag = true;
            }
            else if(ch == '>')
            {
               if(closingTag)
                  xmlDepth--;
               else if(lastCh != '?' && lastCh != '/' && tag[0] != '!')
                  xmlDepth++;
               else
               {
                  closingTag = true;
                  openingTag = true;
               }

               insideTag--;
               if(!insideTag)
                  tag[tagLen] = '\0';
               else
               {
                  tag[tagLen++] = ch;
                  tag[tagLen] = '\0';
               }
               closingTag = false;
            }
            else if(ch != '/' || lastCh != '<')
            {
               tag[tagLen++] = ch;
               tag[tagLen] = '\0';
            }
            else
               openingTag = false;
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
               openingTag = true;
               insideTag = true;
               tagLen = 0;
            }
         }
         lastCh = ch;
      }
      if(xmlDepth > 1 || insideTag || commented)
      {
         xmlDepth = oldDepth;
         return false;
      }

      xmlDepth = oldDepth;
      commented = false;
      lastCh = ' ';
      charLen = 0;
      insideTag = false;
      closingTag = false;
      openingTag = false;
      tag[0] = 0;

      // Parse entire file
      for(stringPos = 0; stringPos < count; stringPos++)
      {
         byte ch = inputString[stringPos];
      
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
            if(ch == '/' && lastCh == '<')
               closingTag = true;
            if(ch == '<')
            {
               insideTag++;
               openingTag = true;
            }
            else if(ch == '>')
            {
               if(closingTag)
                  xmlDepth--;
               else if(lastCh != '?' && lastCh != '/' && tag[0] != '!')
                  xmlDepth++;
               else
               {
                  closingTag = true;
                  openingTag = true;
               }

               insideTag--;
               if(!insideTag)
               {
                  tag[tagLen] = '\0';
                  insideTag = false;

                  string = tag;

                  if(GetKeyWord(&string, keyWord, sizeof(keyWord)))
                  {
                     ProcessKeyword(keyWord);
                  }
               }
               else
               {
                  tag[tagLen++] = ch;
                  tag[tagLen] = '\0';
               }
               closingTag = false;
            }
            else if(ch != '/' || lastCh != '<')
            {
               tag[tagLen++] = ch;
               tag[tagLen] = '\0';
            }
            else
               openingTag = false;
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
            if(ch == '<' || charLen == CHARBUFSIZE - 1)
            {
               ProcessCharacterData(characterData);
               charLen = 0;               
            }
            if(ch == '<')
            {
               openingTag = true;
               insideTag = true;
               tagLen = 0;
            }
            else
            {
               characterData[charLen++] = ch;
               characterData[charLen] = 0;
            }
         }
         lastCh = ch;
      }
      return true;
   }
}
