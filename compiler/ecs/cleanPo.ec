import "ecere"
import "ec"
import "ecere"

public struct CommentStringsPair
{
   List<String> comments;
   String string;
};

enum PoStringMode { none, id, ctxt, str };

class PoFile
{
   Map<ContextStringPair, CommentStringsPair> intlStrings { };

   bool Load(const String fileName)
   {
      bool result = false;
      File f = FileOpen(fileName, read);
      if(f)
      {
         static char line[65536];
         MapIterator<ContextStringPair, CommentStringsPair> it { map = intlStrings };
         List<String> comments { };
         String msgid = null, msgstr = null, msgctxt = null;
         PoStringMode inString = 0;
         int stringLen;
         while(!f.Eof())
         {
            if(f.GetLine(line, sizeof(line)))
            {
               int len;
               TrimLSpaces(line, line);
               if(line[0] == '#')
               {
                  comments.Add(CopyString(line));
               }
               else if(strstr(line, "msgid \"") == line)
               {
                  delete msgid;
                  msgid = CopyString(line + 7);
                  len = strlen(msgid);
                  stringLen = 0;
                  if(len) { msgid[len-1] = 0; stringLen += len-1; }
                  inString = id;
               }
               else if(strstr(line, "msgctxt \"") == line)
               {
                  delete msgctxt;
                  msgctxt = CopyString(line + 9);
                  len = strlen(msgctxt);
                  stringLen = 0;
                  if(len) { msgctxt[len-1] = 0; stringLen += len-1; }
                  inString = ctxt;
               }
               else if(strstr(line, "msgstr \"") == line)
               {
                  delete msgstr;
                  msgstr = CopyString(line + 8);
                  len = strlen(msgstr);
                  stringLen = 0;
                  if(len) { msgstr[len-1] = '\0'; stringLen += len-1; }
                  inString = str;
               }
               else if(inString && line[0] == '\"')
               {
                  len = strlen(line);
                  if(len > 1)
                  {
                     char ** s;
                     switch(inString)
                     {
                        case id: s = &msgid; break;
                        case ctxt: s = &msgctxt; break;
                        case str: s = &msgstr; break;
                     }
                     *s = renew *s byte[stringLen + len + 1];
                     memcpy(*s + stringLen, line+1, len-2);
                     stringLen += len-2;
                     (*s)[stringLen] = '\0';
                  }
               }
               else if(msgid && msgstr)
               {
                  ContextStringPair pair { msgid, msgctxt };
                  if(!it.Index(pair, false))
                  {
                     intlStrings[pair] = { comments, msgstr };
                     msgid = null;
                     msgctxt = null;
                     msgstr = null;
                     comments = { };
                  }
                  else
                  {
                     for(s : comments)
                        it.data.comments.Add(s);
                     comments.RemoveAll();
                  }

                  delete msgid;
                  delete msgctxt;
                  delete msgstr;
                  inString = 0;
                  stringLen = 0;
               }
            }
         }
         comments.Free();
         delete comments;
         delete f;
         result = true;
      }
      return result;
   }

   void Save(const String fileName)
   {
      File potFile = FileOpen(fileName, write);
      if(potFile)
      {
         for(i : intlStrings)
         {
            ContextStringPair pair = &i;
            CommentStringsPair data = i;
            for(s : data.comments)
            {
               potFile.Printf(s);
               potFile.Puts("\n");
            }

            potFile.Puts("msgid \""); potFile.Puts(pair.string); potFile.Puts("\"\n");
            if(pair.context)
            {
               potFile.Puts("msgctxt \""); potFile.Puts(pair.context); potFile.Puts("\"\n");
            }
            potFile.Puts("msgstr \""); potFile.Puts(data.string); potFile.Puts("\"\n");
            potFile.Puts("\n");
         }
         intlStrings.Free();
         delete intlStrings;
         delete potFile;
      }
   }

   void CleanEmpty()
   {
      MapIterator<ContextStringPair, CommentStringsPair> it { map = intlStrings };
      while(it.Next())
      {
         if(it.key.string && !it.data.string[0])
            it.Remove();
      }
   }

   ~PoFile()
   {
      intlStrings.Free();
   }
}

class CleanPoApp : Application
{
   void Main()
   {
      if(argc > 2)
      {
         PoFile po { };
         if(po.Load(argv[1]))
         {
            po.CleanEmpty();
            po.Save(argv[2]);
         }
      }
   }
}
