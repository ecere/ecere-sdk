namespace gfx;

import "Window"
#if !defined(ECERE_VANILLA)
import "fmFontManager"
#endif

public class FontResource : Resource
{
public:
   property const char * faceName { set { delete faceName; faceName = CopyString(value); } get { return this ? faceName : null; } };
   property float size { set { size = value; } get { return this ? size : 0; } };
   property bool bold { set { flags.bold = value; } get { return this ? flags.bold : false; } };
   property bool italic { set { flags.italic = value; } get { return this ? flags.italic : false; } };
   property bool underline { set { flags.underline = value; } get { return this ? flags.underline : false; } };
   property Font font { get { return this ? font : null; } };
   property Window window { set { if(value) { value.RemoveResource(this); value.AddResource(this); } }  };
   property float outlineSize { set { outlineSize = value; } get { return this ? outlineSize : 0; } };
   property float outlineFade { set { outlineFade = value; } get { return this ? outlineFade : 0; } };
#if !defined(ECERE_VANILLA)
   property FMFont fmFont { get { return this ? fmFont : null; } };
#endif

private:
   char * faceName;
   Font font;
   float size;
   FontFlags flags;
   DisplaySystem displaySystem;
   float outlineSize, outlineFade;
#if !defined(ECERE_VANILLA)
   FontManager fm;
   FMFont fmFont;
#endif

   void Load(FontResource copy, DisplaySystem displaySystem)
   {
      delete faceName;
      faceName = *&CopyString(copy.faceName);
      *&size = *&copy.size;
      *&flags = *&copy.flags;
      *&outlineSize = *&copy.outlineSize;
      *&outlineFade = *&copy.outlineFade;
      if(faceName && displaySystem)
      {
         this.displaySystem = displaySystem;
         font = displaySystem.LoadOutlineFont(faceName, size, flags, outlineSize, outlineFade);
      }
   }

#if !defined(ECERE_VANILLA)
   void LoadFM(FontResource copy, DisplaySystem displaySystem, FontManager fm)
   {
      Load(copy, displaySystem);
      if(fm)
      {
         this.fm = fm;
         fmFont = fm.getFont(this);
      }
   }
#endif

   void Reference(FontResource reference)
   {
      delete faceName;
      faceName = *&CopyString(reference.faceName);
      *&size = *&reference.size;
      *&flags = *&reference.flags;
      *&outlineSize = *&reference.outlineSize;
      *&outlineFade = *&reference.outlineFade;
      font = reference.font;
#if !defined(ECERE_VANILLA)
      fmFont = reference.fmFont;
#endif
   }

   void Dereference()
   {
      font = null;
#if !defined(ECERE_VANILLA)
      fmFont = null;
#endif
   }

   ~FontResource()
   {
      if(font && displaySystem)
         displaySystem.UnloadFont(font);
#if !defined(ECERE_VANILLA)
      if(fmFont && fm)
         fm.removeFont(fmFont);
#endif
      delete faceName;
   }

   void OnCopy(FontResource newData)
   {
      property::size = newData.size;
      property::faceName = newData.faceName;
      property::bold = newData.bold;
      property::outlineSize = newData.outlineSize;
      property::outlineFade = newData.outlineFade;
   }

/*
   Window OnEdit(Window window, Window master, int x, int y, int w, int h, void * userData)
   {
      Window editData = class::OnEdit(window, master, x + 24,y,w - 48,h, userData);
      Button browse
      {
         window, master = editData, inactive = true, text = "...", hotKey = F2,
         position = { Max(x + 24, x + w - 24), y }, size = { 24, h }
      };
      browse.Create();
      return editData;
   }

   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags flags)
   {
      char * string = this ? faceName : null;
      Font font = this ? font : null;
      if(!string) string = "(none)";
      surface.WriteTextDots(alignment, x + 24, y + 1, width - 24, string, strlen(string));
      surface.SetBackground(White);
      surface.Area(x - 4, y, x + 20, y + 15);

      surface.SetForeground(Black);
      surface.Rectangle(x-1, y + 1, x + 18, y + 14);
   }

   int OnCompare(FontResource font2)
   {
      int result = 0;
      if(this && font2)
      {
         char * string1 = faceName;
         char * string2 = font2.faceName;
         if(string1 && string2)
            result = strcmpi(string1, string2);
      }
      return result;
   }

   const char * OnGetString(char * string, void * fieldDat, bool * needClass)
   {
      if(this)
      {
         char * fileName = faceName;
         if(fileName)
            strcpy(string, fileName);
         else
            string[0] = '\0';
         return string;
      }
      return null;
   }

   bool OnGetDataFromString(const char * string)
   {
      this = (string && string[0]) ? FontResource { } : null;
      if(this)
         faceName = string;
   }
*/
};
