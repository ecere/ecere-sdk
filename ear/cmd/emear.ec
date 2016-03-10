import "ecere"

class EarApp : Application
{
   void Main()
   {
      if(argc > 2)
      {
         const String s = argv[2];
         if(SearchString(s, 0, ".html", false, true))
         {
            char f[MAX_LOCATION];
            char command[16384];
            int i;
            // ChangeExtension(s, "earres", f);
            StripLastDirectory(s, f);
            PathCat(f, "resources.ear");

            sprintf(command, "ear aw %s", f);
            for(i = 3; i < argc; i++)
            {
               bool quote = false;
               strcat(command, " ");
               if(!argv[i][0] || strchr(argv[i], ' '))
                  quote = true;
               if(quote) strcat(command, "\"");
               strcat(command, argv[i]);
               if(quote) strcat(command, "\"");
            }
            {
               DualPipe p = DualPipeOpen(0, command);
               p.Wait();
            }
         }
      }
   }
}
