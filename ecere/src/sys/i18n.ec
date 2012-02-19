#ifndef ECERE_COM_MODULE
import "File"
#endif
import "Map"

#if defined(ECERE_BOOTSTRAP) || defined(ECERE_STATIC)
#define dllexport
#if !defined(ECERE_BOOTSTRAP)
#define stdcall
#endif
#endif

#ifndef ECERE_BOOTSTRAP
#define FileOpen FileOpenBuffered
#endif

static Map<String, Map<String, String>> moduleMaps { };

#define SWAP_DWORD(dword) ((((unsigned int)(dword) & 0x000000ff) << 24) \
                         | (((unsigned int)(dword) & 0x0000ff00) <<  8) \
                         | (((unsigned int)(dword) & 0x00ff0000) >>  8) \
                         | (((unsigned int)(dword) & 0xff000000) >> 24))

public dllexport void LoadTranslatedStrings(Module module, char * name)
{
#ifndef ECERE_COM_MODULE
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

   if(module.name)
      sprintf(fileName, "<:%s>locale/%s/LC_MESSAGES/%s.mo", module.name, locale, name);
   else
      sprintf(fileName, ":locale/%s/LC_MESSAGES/%s.mo", locale, name);
   f = FileOpen(fileName, read);
   if(!f)
   {
      sprintf(fileName, "locale/%s/LC_MESSAGES/%s.mo", locale, name);
      f = FileOpen(fileName, read);
   }
   if(!f)
   {
      sprintf(fileName, "/usr/share/locale/%s/LC_MESSAGES/%s.mo", locale, name);
      f = FileOpen(fileName, read);
   }
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
         
         if(!moduleMaps)
            moduleMaps = { };
         {
            MapIterator<String, Map<String, String>> it { map = moduleMaps };
            if(it.Index(module.name, false))
               delete it.data;
            // TOFIX: delete moduleMaps[module];
         }
         moduleMaps[module.name] = textMap = { };
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
            {
               MapIterator<String, String> it { map = textMap };
               // TOFIX: Memory leak if the add fails
               if(it.Index(original, false))
                  delete translated;
               else
                  textMap[original] = translated;
            }
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
#endif
}

public dllexport void UnloadTranslatedStrings(Module module)
{
   MapIterator<String, Map<String, String>> it { map = moduleMaps };
   if(it.Index(module.name, false))
   {
      it.data.Free();
      moduleMaps.Delete(it.pointer);
   }
}

public dllexport char * GetTranslatedString(Module module, char * string, char * stringAndContext)
{
   Map<String, String> textMap = moduleMaps ? moduleMaps[module.name] : null;
   char * result = textMap ? textMap[stringAndContext ? stringAndContext : string] : string;
   return (result && result[0]) ? result : string;
}
