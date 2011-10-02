import "File"
import "Map"

Map<String, Map<String, String>> domainMaps;
Map<String, String> curDomainMap;

#define SWAP_DWORD(dword) ((((unsigned int)(dword) & 0x000000ff) << 24) \
                         | (((unsigned int)(dword) & 0x0000ff00) <<  8) \
                         | (((unsigned int)(dword) & 0x00ff0000) >>  8) \
                         | (((unsigned int)(dword) & 0xff000000) >> 24))

public void bind_textdomain_codeset (char * domain, char * codeSet)
{
   // Always using UTF-8
}

public void bindtextdomain(char * domain, char * localeDir)
{
   File f;
   char fileName[MAX_LOCATION];

   char lcAll[256];
   char language[256];
   char lang[256];
   char lcMessages[256];
   char * locale = null;

   if(GetEnvironment("LANGUAGE", language, sizeof(language)))
      locale = language;
   else if(GetEnvironment("LC_ALL", lcAll, sizeof(lcAll)))
      locale = lcAll;
   else if(GetEnvironment("LC_MESSAGES", lcMessages, sizeof(lcMessages)))
      locale = lcMessages;
   else if(GetEnvironment("LANG", lang, sizeof(lang)))
      locale = lang;

   if(locale)
   {
      char * dot;
      strcpy(language, locale);
      dot = strstr(language, ".");
      if(dot) *dot = 0;
      locale = language;
   }

   strcpy(fileName, localeDir);
   PathCat(fileName, locale);
   PathCat(fileName, "LC_MESSAGES");
   PathCat(fileName, domain);
   ChangeExtension(fileName, "mo", fileName);
   f = FileOpenBuffered(fileName, read);
   if(f)
   {
      uint magic = 0;
      f.Read(&magic, sizeof(uint), 1);
      if(magic == 0x950412de || magic == 0xde120495)
      {
         Map<String, String> textMap;
         bool swap = magic != 0x950412de;
         uint revision = 0;
         uint numStrings = 0;
         uint origStrings = 0, transStrings = 0;
         uint hashingSize = 0, hashingOffset = 0;
         int c;
         f.Read(&revision, sizeof(uint), 1);       if(swap) SWAP_DWORD(revision);
         f.Read(&numStrings, sizeof(uint), 1);     if(swap) SWAP_DWORD(numStrings);
         f.Read(&origStrings, sizeof(uint), 1);    if(swap) SWAP_DWORD(origStrings);
         f.Read(&transStrings, sizeof(uint), 1);   if(swap) SWAP_DWORD(transStrings);
         f.Read(&hashingSize, sizeof(uint), 1);    if(swap) SWAP_DWORD(hashingSize);
         f.Read(&hashingOffset, sizeof(uint), 1);  if(swap) SWAP_DWORD(hashingOffset);
         
         if(!domainMaps)
            domainMaps = { };
         {
            MapIterator<String, String> it { map = domainMaps };
            if(it.Find(domain))
               delete it.data;
            // TOFIX: delete domainMaps[domain];
         }
         domainMaps[domain] = textMap = { };
         for(c = 0; c < numStrings; c++)
         {
            uint len = 0, offset = 0;
            char * original = null, * translated = null;

            f.Seek(origStrings + c*2*sizeof(uint), start);
            f.Read(&len, sizeof(uint), 1);      if(swap)SWAP_DWORD(len);
            f.Read(&offset, sizeof(uint), 1);   if(swap)SWAP_DWORD(offset);
            f.Seek(offset, start);

            original = new byte[len + 1];
            f.Read(original, 1, len + 1);

            f.Seek(transStrings + c*2*sizeof(uint), start);
            f.Read(&len, sizeof(uint), 1);      if(swap)SWAP_DWORD(len);
            f.Read(&offset, sizeof(uint), 1);   if(swap)SWAP_DWORD(offset);
            f.Seek(offset, start);

            translated = new byte[len + 1];
            f.Read(translated, 1, len + 1);

            if(len)
               textMap[original] = translated;
            else
               delete translated;
            delete original;
         }
      }
      else
      {
         // Failure
         printf("Invalid format while loading %s\n", fileName);
      }
      delete f;
   }
}

public void textdomain(char * domain)
{
   curDomainMap = domainMaps[domain];
}

public char * gettext(char * string)
{
   return curDomainMap ? curDomainMap[string] : string;
}

public char * dgettext(char * domain, char * string)
{
   Map<String, String> textMap = domainMaps[domain];
   return textMap ? textMap[string] : string;
}     
