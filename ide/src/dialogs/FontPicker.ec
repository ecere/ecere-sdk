import "ide"

Array<float> sizes { [ 6, 7, 8.25f, 9, 10, 10.5f, 11, 12, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30, 32, 36, 40, 44, 48, 54, 60, 66, 72, 80, 88, 96 ] };

Array<const String> fonts
{ [
   "Bitstream Vera Sans Mono",
   "Consolas",
   "Courier New",
   "DejaVu Sans Mono",
   "Lucida Console",
   "Monaco",
   "Monoid",
   "OCR-A II",
   "OCR B MT"

   // "Terminal"
] };

const String sampleText = //"The Quick Brown Fox Jumps Over The Lazy Dog";
   "import \"ecere\"\n"
   "\n"
   "class HelloForm : Window\n"
   "{\n"
   "   caption = $\"My First eC Application\";\n"
   "   borderStyle = sizable;\n"
   "   size = { 280, 100 };\n"
   "   hasClose = true;\n"
   "   displayDriver = \"OpenGL\";\n"
   "\n"
   "   bool OnKeyDown(Key key, unichar ch)\n"
   "   {\n"
   "\n"
   "      return true;\n"
   "   }\n"
   "\n"
   "   Label label\n"
   "   {\n"
   "      this, position = { 10, 10 }, font = { \"Arial\", 30 },\n"
   "      caption = $\"Hello, World!!\"\n"
   "   };\n"
   "};\n"
   "\n"
   "HelloForm hello { };\n";

Array<FontResource> fontResources { };

class DisplayedFace : FontResource
{
   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {
      surface.font = font;
      faceName.OnDisplay(surface, x, y, width, fieldData, alignment, displayFlags);
   }
};

class FontPicker : Window
{
   opacity = 0;
   /*
   background = formColor;
   caption = $"Font Picker";
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 664, 426 };
   anchor = { horz = 9, vert = -26 };
   */
   virtual bool Window::NotifyChanged();

   property float fontSize
   {
      get { return curFont.size; }
   }
   property const String faceName
   {
      get { return curFont.faceName; }
   }

   IDEColorScheme colorScheme;

   FontResource curFont { "Consolas", 12};
   DataField dfSize { class(float) };
   DropBox dbSize
   {
      this, size = { 56, 24 }, anchor = { left = 4, bottom = 4 };

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         curFont.size = row.GetData(dfSize);
         for(f : fontResources)
         {
            RemoveResource(f);
            f.size = Min(20, curFont.size);
            AddResource(f);
         }
         listFonts.font = fontResources[0];
         OnLoadGraphics();
         listFonts.OnLoadGraphics();
         listFonts.size = listFonts.size; // Fix for scrollbar?
         listFonts.Update(null);
         sample.font = curFont;

         modifiedDocument = true;
         NotifyChanged(master);
         return true;
      }
   };
   Button cbFixedPitch
   {
      this, isCheckbox = true, caption = $"Fixed pitch only", anchor = { left = 68, bottom = 8 };
      checked = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ideSettings.showFixedPitchFontsOnly = button.checked;
         OnDestroy();
         OnCreate();
         return true;
      }
   };
   EditBox sample
   {
      this, anchor = { left = 0.439024, top = 16, right = 4, bottom = 8 }, font = curFont;
      textVertScroll = true;
      hasVertScroll = true;
      hasHorzScroll = true;
      freeCaret = true;

      syntaxHighlighting = true;
      multiLine = true;
      contents = sampleText;
   };
   ListBox listFonts
   {
      this, anchor = { left = 4, top = 16, right = 0.591463, bottom = 30 }, alwaysHighLight = true;
      hasVertScroll = true;
      dontHideScroll = true;

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(row)
         {
            FontResource fr = row.GetData(dfFace);
            curFont.faceName = fr.faceName;

            modifiedDocument = true;
            NotifyChanged(master);
         }
         sample.font = curFont;
         return true;
      }
   };
   DataField dfFace { class(DisplayedFace) };

   bool OnLoadGraphics()
   {
      int maxH = 12 + 5;
      float size = dbSize.GetData(dfSize);
      int maxSize = (int)(size * 96 / 72 * 2);
      for(f : fontResources)
      {
         Font font = f.font;
         int h;
         // const String n = f.faceName;
         displaySystem.FontExtent(font, "W", 1, null, &h);
         h += 5;

         //h = font.ascent + font.descent + 5;
         if(h > maxSize) h = maxSize;
         maxH = Max(maxH, h);
      }
      listFonts.rowHeight = maxH;
      return true;
   }

   FontPicker()
   {
      dbSize.AddField(dfSize);
      for(s : sizes)
      {
         DataRow row = dbSize.AddRow();
         row.SetData(dfSize, s);
         if(s == curFont.size)
            dbSize.currentRow = row;
      }
      listFonts.AddField(dfFace);
   }

   void OnDestroy()
   {
      for(f : fontResources)
         RemoveResource(f);
      listFonts.Clear();
      fontResources.RemoveAll();
   }

   void SelectColorScheme(IDEColorScheme colorScheme)
   {
      this.colorScheme = colorScheme;
      sample.syntaxColorScheme = colorScheme.syntaxColors;
      sample.selectionColor = colorScheme.selectionColor;
      sample.selectionText = colorScheme.selectionText,
      sample.background = colorScheme.codeEditorBG;
      sample.foreground = colorScheme.codeEditorFG;
   }

   bool OnCreate()
   {
      Map<String, FontInfo> fonts = ListAvailableFonts();
      DataRow sRow;
      float fontSize;
      bool fixedPitchOnly = ideSettings.showFixedPitchFontsOnly;

      colorScheme = ::colorScheme;

      sample.syntaxColorScheme = colorScheme.syntaxColors;
      sample.selectionColor = colorScheme.selectionColor;
      sample.selectionText = colorScheme.selectionText,
      sample.background = colorScheme.codeEditorBG;
      sample.foreground = colorScheme.codeEditorFG;

      curFont.faceName = ideSettings.codeEditorFont;
      curFont.size = fontSize = ideSettings.codeEditorFontSize;

      cbFixedPitch.checked = fixedPitchOnly;
      fontResources.minAllocSize = fonts.GetCount();

      for(sRow = dbSize.firstRow; sRow; sRow = sRow.next)
      {
         float s = sRow.GetData(dfSize);
         if(fontSize - s < 0.5 || s > fontSize)
         {
            dbSize.currentRow = sRow;
            break;
         }
      }

      for(f : fonts; f.defaultOrAnsiCharSet && (!fixedPitchOnly || f.fixedPitch))
      {
         FontResource fr { &f, curFont.size, window = this };
         DataRow row = listFonts.AddRow();
         incref fr;
         row.SetData(dfFace, fr);
         if(!strcmp(&f, curFont.faceName))
            listFonts.currentRow = row;
         fontResources.Add(fr);
      }
      delete fonts;
      return true;
   }
}

//FontPicker fontPicker { };

/*
Color selectionColor = lightYellow;
Color selectionText = Color { 30, 40, 50 };
Color viewsBackground = Color { 30, 40, 50 };
Color viewsText = lightGray;
Color outputBackground = black;
Color outputText = lime;
Color projectViewBackground = Color { 30, 40, 50 };
Color projectViewText = lightGray;
Color codeEditorBG = black;
Color codeEditorFG = ivory;
Color marginColor = Color {24, 24, 24};
Color selectedMarginColor = Color {64, 64, 64};
Color lineNumbersColor = Color {160, 160, 160};
*/
