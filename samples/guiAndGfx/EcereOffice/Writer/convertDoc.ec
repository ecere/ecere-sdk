import "ecere"
import "ewd"

class App : Application
{
   void Main()
   {
      char inExt[MAX_EXTENSION] = "html";
      char outExt[MAX_EXTENSION] = "";
      File in, out;

      if(argc > 1)
      {
         GetExtension(argv[1], inExt);
         in = FileOpen(argv[1], read);
      }
      else
         in = ConsoleFile { };

      if(argc > 2)
      {
         GetExtension(argv[2], outExt);
         out = FileOpen(argv[2], write);
      }
      else
         out = ConsoleFile { };

      if(in && out)
      {
         if(!strcmpi(inExt, "html") && (!outExt[0]|| !strcmpi(outExt, "ewd")))
            html2ewd(in, out);
         else if(!strcmpi(inExt, "ewd") && (!outExt[0] || !strcmpi(outExt, "html")))
            ewd2html(in, out, true);
      }

      delete in;
      delete out;
   }
}
