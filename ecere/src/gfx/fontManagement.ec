import "File"

namespace gfx;

#if defined(__WIN32__)
   #define WIN32_LEAN_AND_MEAN
   #define String String_
   #define Size Size_
   #define Alignment Alignment_
   #include <windows.h>
   #undef String
   #undef Size
   #undef Alignment
#elif !defined(ECERE_NOTRUETYPE) && !defined(ECERE_NOFONTCONFIG)
   #define set _set
   #include <fontconfig/fontconfig.h>
   static FcConfig * fcConfig;
   #undef set
#endif

#if defined(__WIN32__) && !defined(ECERE_NOTRUETYPE) && !defined(__UWP__)
struct FontData
{
   char fileName[MAX_FILENAME];
   FontFlags flags;
   bool forgive;
};

static int CALLBACK MyFontProc(ENUMLOGFONTEX * font, NEWTEXTMETRICEX *lpntme, int fontType, LPARAM lParam)
{
   //if(fontType == TRUETYPE_FONTTYPE)
   {
      FontData * fontData = (FontData *) lParam;
      char * fileName = fontData->fileName;
      HKEY key;
      int weight = (fontData->flags.bold) ? FW_BOLD : FW_NORMAL;
      int italic = (fontData->flags.italic) ? 1 : 0;
      if((fontData->forgive || weight == font->elfLogFont.lfWeight) && italic == (font->elfLogFont.lfItalic != 0))
      {
         if(!RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts",0,KEY_READ,&key) ||
            !RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Fonts",0,KEY_READ,&key))
         {
            int value = 0;
            while(true)
            {
               char entryName[1024];
               char fontFileName[1024];
               DWORD type;
               DWORD size = 1024;
               DWORD sizeFileName = 1024;
               char * occurrence;
               if(RegEnumValue(key, value++, entryName, &size, null, (PDWORD)&type, (LPBYTE)fontFileName, &sizeFileName) != ERROR_SUCCESS)
                  break;
               if((occurrence = SearchString(entryName, 0, (const char *)font->elfFullName, false, false)))
               {
                  int c;
                  for(c = (int)(occurrence - entryName) - 1; c >= 0; c--)
                  {
                     char ch = entryName[c];
                     if(ch == '&') { c = -1; break; }
                     else if(ch != ' ') break;
                  }
                  if(c >= 0) continue;
                  for(c = (int)(occurrence - entryName) + strlen((char *)font->elfFullName); ; c++)
                  {
                     char ch = entryName[c];
                     if(ch == 0 || ch == '&' || ch == '(') { c = -1; break; }
                     else if(ch != ' ') break;
                  }

                  if(atoi(entryName + c))
                     c = -1;
                  if(c >= 0) continue;

                  strcpy(fileName, fontFileName);
                  RegCloseKey(key);
                  return 0;
               }
            }
            RegCloseKey(key);
            return 1;
         }
      }
   }
   return 1;
}
#endif

public class FaceInfo : struct
{
public:
   String fileName;
   bool fakeItalic;
   int fontID;

   ~FaceInfo() { delete fileName; }
}

public Array<FaceInfo> ResolveFont(const String faceName, float size, FontFlags flags)
{
   Array<FaceInfo> fileNames { };
#if !defined(ECERE_NOTRUETYPE)
   char fileName[MAX_LOCATION];
   bool fakeItalic = flags.italic;
   int fontID = 0;
#if !defined(__WIN32__)
   File linkCfg;
#endif
   const char * ecereFonts = getenv("ECERE_FONTS");
   if(!ecereFonts) ecereFonts = "<:ecere>";
#if !defined(__WIN32__)
   {
      char linkCfgPath[MAX_LOCATION];

      strcpy(linkCfgPath, ecereFonts);
      PathCat(linkCfgPath, "linking.cfg");
      linkCfg = FileOpen(linkCfgPath, read);
   }
#endif

#if defined(__ANDROID__)
   if(SearchString(faceName, 0, "Arial", false, false))
      faceName = flags.bold ? "/sdcard/fonts/Arial-Unicode-Bold.ttf" : "/sdcard/fonts/Arial-Unicode-Regular.ttf";
#elif defined(__EMSCRIPTEN__)

#if defined(_DEBUG)
   PrintLn("Resolving font ", faceName, " with flags: ", flags, ", size: ", size);
#endif
   if(SearchString(faceName, 0, "Arial", false, false) || SearchString(faceName, 0, "Lucida", false, false))
      faceName = flags.bold ? ":fonts/Arial-Unicode-Bold.ttf" : ":fonts/Arial-Unicode-Regular.ttf";
   else if(SearchString(faceName, 0, "NotoSansJP", false, false) || SearchString(faceName, 0, "Tahoma", false, false))
      faceName = ":fonts/NotoSansJP.ttf";
#endif
   strcpy(fileName, faceName);

   if(!FileExists(fileName))
   {
      strcpy(fileName, ecereFonts);
      PathCat(fileName, faceName);
      if(flags.bold && flags.italic) strcat(fileName, "bi");
      else if(flags.bold) strcat(fileName, "bd");
      else if(flags.italic) strcat(fileName, "i");
      strcat(fileName, ".ttf");
      strlwr(fileName);
      fakeItalic = false;

      if(flags.italic && !FileExists(fileName))
      {
         strcpy(fileName, ecereFonts);
         PathCat(fileName, faceName);
         if(flags.bold) strcat(fileName, "bd");
         strcat(fileName, ".ttf");
         strlwr(fileName);
         fakeItalic = true;
      }

      // Search in current working directory
      if(!FileExists(fileName))
      {
         strcpy(fileName, faceName);
         if(flags.bold && flags.italic) strcat(fileName, "bi");
         else if(flags.bold) strcat(fileName, "bd");
         else if(flags.italic) strcat(fileName, "i");
         strcat(fileName, ".ttf");
         strlwr(fileName);
         fakeItalic = false;

         if(flags.italic && !FileExists(fileName))
         {
            strcpy(fileName, faceName);
            if(flags.bold) strcat(fileName, "bd");
            strcat(fileName, ".ttf");
            strlwr(fileName);
            fakeItalic = true;
         }
      }

#if defined(__WIN32__) && !defined(__UWP__)
      if(!FileExists(fileName))
      {
         FontData fontData = { { 0 } };
         LOGFONT logFont = { 0 };
         HDC hdc = GetDC(0);

         fakeItalic = false;

         logFont.lfCharSet = DEFAULT_CHARSET;
         strcpy(logFont.lfFaceName, faceName);
         fontData.flags = flags;

         EnumFontFamiliesEx(hdc, &logFont, (void *)MyFontProc, (LPARAM)&fontData, 0);
         if(!fontData.fileName[0] && flags.bold)
         {
            fontData.forgive = true;
            EnumFontFamiliesEx(hdc, &logFont, (void *)MyFontProc, (LPARAM)&fontData, 0);
         }
         if(!fontData.fileName[0])
         {
            // Fake italic
            fontData.flags.italic = false;
            EnumFontFamiliesEx(hdc, &logFont, (void *)MyFontProc, (LPARAM)&fontData, 0);
            fakeItalic = true;
         }

         if(fontData.fileName[0])
         {
            GetWindowsDirectory(fileName, MAX_LOCATION);
            PathCat(fileName, "fonts");
            PathCat(fileName, fontData.fileName);
         }
         ReleaseDC(0, hdc);
      }
#elif !defined(ECERE_NOFONTCONFIG)
      {
         char * fileName2;
         FcResult result = 0;
         FcPattern * pattern;
         FcPattern * matched;
         char * family;
         unichar testChar = 0;
         FcCharSet * charSet;
         if(!fcConfig)
            fcConfig = FcInitLoadConfigAndFonts();

         charSet = FcCharSetCreate();

         if(!strcmpi(faceName, "Mangal"))
         {
            testChar = 0x905;
         }

         if(testChar)
            FcCharSetAddChar(charSet, testChar);

         pattern = FcPatternBuild(null,
                         //FC_SOURCE, FcTypeString, "freetype",
                         FC_FAMILY, FcTypeString, faceName,
                         //FC_SCALABLE, FcTypeBool, 1,
                         FC_SIZE, FcTypeDouble, (double)size,
                         FC_WEIGHT, FcTypeInteger, flags.bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM /*FC_WEIGHT_LIGHT*/,
                         FC_SLANT, FcTypeInteger, flags.italic ? FC_SLANT_ITALIC : FC_SLANT_ROMAN,
                         testChar ? FC_CHARSET : 0,FcTypeCharSet, charSet,
                         null);
         FcDefaultSubstitute(pattern);
         FcConfigSubstitute(fcConfig, pattern, FcMatchPattern); //FcMatchFont);

         matched = FcFontMatch (0, pattern, &result);
         // printf("Locating %s\n", faceName);
         if(matched)
         {
            FcPatternGetString(matched, FC_FAMILY, 0, (FcChar8 **)&family);
            //printf("Fontconfig returned %s\n", family);
         }
         if(matched && (result == FcResultMatch /*|| result == FcResultNoId*/) /*&& !strcmpi(family, faceName)*/)
         {
            double fontSize;
            FcPatternGetString (matched, FC_FILE, 0, (FcChar8 **)&fileName2);
            FcPatternGetInteger(matched, FC_INDEX, 0, &fontID);
            FcPatternGetDouble(matched, FC_SIZE, 0, &fontSize);
            strcpy(fileName, fileName2);
            // size = (float)fontSize;

            //printf("Matched to %s, %f\n", fileName, size);
         }
         else
         {
            //printf("Could not find a match for %s, %f, %s %s (%d)\n", faceName, size, flags.bold ? "bold" : "", flags.italic ? "italic" : "", (int)result);
         }
         if(pattern) FcPatternDestroy(pattern);
         if(matched) FcPatternDestroy(matched);
         if(charSet) FcCharSetDestroy(charSet);
      }
#endif
   }

   if(!FileExists(fileName))
      ChangeExtension(fileName, "otf", fileName);
   if(!FileExists(fileName))
      ChangeExtension(fileName, "ttc", fileName);

   //if(FileExists(fileName))
   {
      char links[1024] = "";
      int linksPos = 0;
#if defined(__WIN32__) && !defined(__UWP__)
      HKEY key;
      links[0] = 0;
      if(!RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\FontLink\\SystemLink",0,KEY_READ,&key) ||
         !RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\FontLink\\SystemLink",0,KEY_READ,&key))
      {
         // int value = 0;
         DWORD type;
         DWORD size = 1024;
         RegQueryValueEx(key, faceName, null, &type, (LPBYTE)links, &size);
         memset(links + size, 0, 1024 - size);
         RegCloseKey(key);
      }
#elif !defined(__UWP__)
      links[0] = 0;
      if(linkCfg)
      {
         char line[512];
         while(linkCfg.GetLine(line, sizeof(line)))
         {
            int len = strlen(faceName);
            if(line[0] == '[' && !strncasecmp(line + 1, faceName, len) && line[len + 1] == ']')
            {
               while(linkCfg.GetLine(line, sizeof(line)))
               {
                  TrimLSpaces(line, line);
                  if(!line[0] || line[0] == '[')
                     break;
                  len = strlen(line);
                  memcpy(links + linksPos, line, len);
                  linksPos += len;
                  links[linksPos] = 0;
                  linksPos++;
               }
            }
         }
         linksPos = 0;
      }
#endif
      while(true)
      {
         if(FileExists(fileName))
         {
            FaceInfo faceInfo
            {
               fileName = CopyString(fileName),
               fakeItalic = fakeItalic,
               fontID = fontID
            };
            fileNames.Add(faceInfo);
         }
         {
            int c;
            char ch;
            char fontName[1024];
            if(!links[linksPos]) break;
            for(c = 0; (ch = links[linksPos + c]); c++)
            {
               fontName[c] = ch;
               if(ch == ',') break;
            }
            fontName[c] = 0;
            if(fontName[0] || ch == ',')
            {
#if defined(__WIN32__) && !defined(__UWP__)
               GetWindowsDirectory(fileName, MAX_LOCATION);
               PathCat(fileName, "fonts");
               PathCat(fileName, fontName);
#elif !defined(ECERE_NOFONTCONFIG)
               if(getenv("ECERE_FONTS"))
               {
                  strcpy(fileName, ecereFonts);
                  PathCat(fileName, fontName);
               }
               else
               {
                  {
                     char * fileName2;
                     FcResult result = 0;
                     FcPattern * pattern;
                     FcPattern * matched;
                     char * family;
                      pattern = FcPatternBuild(null,
                                     //FC_SOURCE, FcTypeString, "freetype",
                                     //FC_SCALABLE, FcTypeBool, 1,
                                     FC_FAMILY, FcTypeString, links + linksPos + c + 1,
                                     FC_SIZE, FcTypeDouble, (double)size,
                                     FC_WEIGHT, FcTypeInteger, flags.bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM /*FC_WEIGHT_LIGHT*/,
                                     FC_SLANT, FcTypeInteger, flags.italic ? FC_SLANT_ITALIC : FC_SLANT_ROMAN,
                                     null);
                     FcDefaultSubstitute(pattern);
                     FcConfigSubstitute(fcConfig, pattern, FcMatchPattern); //FcMatchFont);

                     //printf("Locating %s\n", links + linksPos + c + 1);
                     matched = FcFontMatch (0, pattern, &result);
                     if(matched)
                     {
                        FcPatternGetString(matched, FC_FAMILY, 0, (FcChar8 **)&family);
                        // printf("Fontconfig returned %s\n", family);
                     }
                     if(matched && (result == FcResultMatch /*|| result == FcResultNoId*/) &&
                        FcPatternGetString(matched, FC_FAMILY, 0, (FcChar8 **)&family) == FcResultMatch /*&& !strcmpi(family, links + linksPos + c + 1)*/)
                     {
                        double fontSize;
                        FcPatternGetString (matched, FC_FILE, 0, (FcChar8 **)&fileName2);
                        FcPatternGetInteger(matched, FC_INDEX, 0, &fontID);
                        FcPatternGetDouble(matched, FC_SIZE, 0, &fontSize);
                        strcpy(fileName, fileName2);
                        //size = (float)fontSize;
                        // printf("Matched to %s, %f\n", fileName, size);
                     }
                     else
                     {
                        // printf("Could not find a match for %s, %f, %s %s (%d)\n", links + linksPos + c + 1, size, flags.bold ? "bold" : "", flags.italic ? "italic" : "", (int)result);
                     }
                     if(pattern) FcPatternDestroy(pattern);
                     if(matched) FcPatternDestroy(matched);
                  }
               }
#endif

            }
            linksPos += c;
            while(links[linksPos] && links[linksPos] != ',') linksPos++;
            linksPos++;
         }
      }
   }

#if !defined(__WIN32__)
   delete linkCfg;
#endif

#endif
   if(!fileNames.count)
      delete fileNames;
   return fileNames;
}

import "AVLTree"

public struct FontInfo
{
   bool fixedPitch;
   bool defaultOrAnsiCharSet;
};

#if defined(__WIN32__) && !defined(__UWP__)
static int CALLBACK fontLister(ENUMLOGFONTEXW * font, NEWTEXTMETRICEX *lpntme, int fontType, LPARAM lParam)
{
   // const String faceName = font->elfLogFont.lfFaceName;
   uint16 * faceName = font->elfLogFont.lfFaceName;
   String s = UTF16toUTF8(faceName);
   if(s[0] != '@')
   {
      Map<String, FontInfo> fonts = (Map<String, FontInfo>)lParam;
      MapIterator<String, FontInfo> it { map = fonts };
      if(!it.Index(s, true))
         it.data = { (font->elfLogFont.lfPitchAndFamily & 3) == FIXED_PITCH, defaultOrAnsiCharSet = (font->elfLogFont.lfCharSet == ANSI_CHARSET || font->elfLogFont.lfCharSet == DEFAULT_CHARSET) };
   }
   delete s;
   return 1;
}
#endif

public Map<String, FontInfo> ListAvailableFonts()
{
   Map<String, FontInfo> fonts { };

#if defined(__WIN32__) && !defined(__UWP__)
   LOGFONTW logFont = { 0 };
   HDC hdc = GetDC(0);
   logFont.lfCharSet = DEFAULT_CHARSET;

   EnumFontFamiliesExW(hdc, &logFont, (void *)fontLister, (LPARAM)fonts, 0);

   ReleaseDC(0, hdc);
#elif !defined(ECERE_NOFONTCONFIG)
   int i;
   FcPattern * pattern;
   FcObjectSet * objectSet;
   FcFontSet * fontSet;

   if(!fcConfig)
      fcConfig = FcInitLoadConfigAndFonts();

   pattern = FcPatternCreate();
   objectSet = FcObjectSetBuild(FC_FAMILY, FC_SPACING, FC_CHARSET, null);
   fontSet = FcFontList(fcConfig, pattern, objectSet);
   if(fontSet)
   {
      MapIterator<String, FontInfo> it { map = fonts };
      for(i = 0; i < fontSet->nfont; i++)
      {
         FcPattern * font = fontSet->fonts[i];
         String family = null;
         int spacing = 0;
         FcCharSet * charSet = null;

         FcPatternGetString(font, FC_FAMILY, 0, (byte **)&family);
         FcPatternGetInteger(font, FC_SPACING, 0, &spacing);
         FcPatternGetCharSet(font, FC_CHARSET, 0, &charSet);

         if(family && !it.Index(family, true))
         {
            it.data =
            {
               fixedPitch = spacing == FC_MONO,
               defaultOrAnsiCharSet =
                  FcCharSetHasChar(charSet, '[') && FcCharSetHasChar(charSet, '{') &&
                  FcCharSetHasChar(charSet, 'a') && FcCharSetHasChar(charSet, 'Z');
            };
         }
      }
   }
   if(pattern) FcPatternDestroy(pattern);
   if(fontSet) FcFontSetDestroy(fontSet);
#endif
   return fonts;
}

public FaceInfo ResolveCharFont(const String faceName, float size, FontFlags flags, const String lang, unichar testChar)
{
   FaceInfo info = null;
#if !defined(__WIN32__) && !defined(ECERE_NOFONTCONFIG)
   int fontID = 0;
   double fontSize = size;
   FcResult result = 0;
   FcPattern * pattern;
   FcPattern * matched;
   FcCharSet * charSet = FcCharSetCreate();
   String family;
   String fileName = null;

   FcCharSetAddChar(charSet, testChar);
   //printf("Loading with char %x\n", testChar);

   pattern = FcPatternBuild(null,
                   //FC_SOURCE, FcTypeString, "freetype",
                   //FC_SCALABLE, FcTypeBool, 1,
                   FC_FAMILY, FcTypeString, faceName,
                   FC_SIZE, FcTypeDouble, (double)size,
                   FC_WEIGHT, FcTypeInteger, flags.bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM,
                   FC_SLANT, FcTypeInteger, flags.italic ? FC_SLANT_ITALIC : FC_SLANT_ROMAN,
                   FC_CHARSET,FcTypeCharSet, charSet,
                   lang ? FC_LANG : 0, FcTypeString, lang,
                   null);
   FcDefaultSubstitute(pattern);
   FcConfigSubstitute(fcConfig, pattern, FcMatchPattern); //FcMatchFont);

   //printf("Locating %s for script %d\n", faceName, curScript);
   matched = FcFontMatch (0, pattern, &result);
   if(matched)
   {
      FcPatternGetString(matched, FC_FAMILY, 0, (FcChar8 **)&family);
      //printf("Fontconfig returned %s\n", family);
   }
   if(matched && (result == FcResultMatch) && FcPatternGetString(matched, FC_FAMILY, 0, (FcChar8 **)&family) == FcResultMatch)
   {
      FcPatternGetString (matched, FC_FILE, 0, (FcChar8 **)&fileName);
      FcPatternGetInteger(matched, FC_INDEX, 0, &fontID);
      FcPatternGetDouble(matched, FC_SIZE, 0, &fontSize);
      // printf("\nMatched to %s, %f\n", fileName, fontSize);

      info =
      {
         fileName = CopyString(fileName);
         fontID = fontID
      };
   }
   else
   {
      //printf("Could not find a match for %s, %f, %s %s (%d)\n", faceName, size, flags.bold ? "bold" : "", flags.italic ? "italic" : "", (int)result);
   }
   if(pattern) FcPatternDestroy(pattern);
   if(matched) FcPatternDestroy(matched);
   if(charSet) FcCharSetDestroy(charSet);
#elif defined(__WIN32__) && !defined(ECERE_NOFONTCONFIG)
   {
      // Fall back to Arial Unicode MS
      char fileName[MAX_LOCATION];
      GetWindowsDirectory(fileName, MAX_LOCATION);
      PathCat(fileName, "fonts/arialuni.ttf");
      info = { fileName = CopyString(fileName) };
   }
#endif
   return info;
}
