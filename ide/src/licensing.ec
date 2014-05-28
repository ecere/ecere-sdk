#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

class LicenseTab : Tab
{
   // opacity = 0;
   font = { "Courier New", 10 };
   EditBox editBox
   {
      this,
      multiLine = true;
      hasHorzScroll = true;
      hasVertScroll = true;
      borderStyle = deep;
      anchor = { 10, 10, 10, 10 };
      readOnly = true;
      noCaret = true;
   };
   property const char * sourceFile
   {
      set
      {
         File f = FileOpen(value, read);
         if(f)
         {
            editBox.Load(f);
            delete f;
         }
      }
   }
}

class LicensesForm : Window
{
   caption = $"License Agreements";
   background = formColor;
   borderStyle = sizable;
   hasClose = true;
   minClientSize = { 940, 556 };

   TabControl tabControl
   {
      this,
      opacity = 0,
      anchor = { 10, 60, 10, 40 };
   };
   Label label1
   {
      this, anchor = { top = 16 }, font = { "Tahoma", 10, true };
      caption = $"This program is based on these free open source software components.";
   };
   Label label2
   {
      this, anchor = { top = 32 }, font = { "Tahoma", 10, true };
      caption = $"By using it you agree to the terms and conditions of their individual licenses.";
   };
   LicenseTab ecereTab
   {
      caption = "Ecere SDK";
      sourceFile = ":licenses/LICENSE";
      tabControl = tabControl;
   };
   LicenseTab pngTab
   {
      caption = "libpng";
      sourceFile = ":licenses/png.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab jpgTab
   {
      caption = "libjpg";
      sourceFile = ":licenses/jpg.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab freetypeTab
   {
      caption = "FreeType";
      sourceFile = ":licenses/freetype.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab harfbuzzTab
   {
      caption = "HarfBuzz";
      sourceFile = ":licenses/harfbuzz.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab gifTab
   {
      caption = "ungif";
      sourceFile = ":licenses/ungif.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab zlibTab
   {
      caption = "zlib";
      sourceFile = ":licenses/zlib.README";
      tabControl = tabControl;
   };
   LicenseTab sqliteTab
   {
      caption = "SQLite";
      sourceFile = ":licenses/sqlite.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab ffiTab
   {
      caption = "libffi";
      sourceFile = ":licenses/ffi.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab tango
   {
      caption = "Tango Icons";
      sourceFile = ":licenses/tango.COPYING";
      tabControl = tabControl;
   };
   LicenseTab upxTab
   {
      caption = "UPX";
      sourceFile = ":licenses/upx.LICENSE";
      tabControl = tabControl;
   };
#if defined(__WIN32__)
   LicenseTab gccTab
   {
      caption = "GCC, GDB";
      sourceFile = ":licenses/tdm-gcc.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab w64Tab
   {
      caption = "MinGW-w64";
      sourceFile = ":licenses/MinGW-w64.LICENSE";
      tabControl = tabControl;
   };
#endif
/*   Button ok
   {
      this;
      caption = "OK";
      anchor = { bottom = 10 };
      size = { 80, 22 };
      isDefault = true;
      NotifyClicked = ButtonCloseDialog;
   };
*/
   Button dontAgreeButton
   {
      this;
      caption = $"I don't agree";
      minClientSize = { 100, 20 };
      anchor = { bottom = 10, right = 14 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((GuiApplication)__thisModule).desktop.Destroy(0);
         return true;
      }
   };
   Button agreeButton
   {
      this;
      caption = $"I agree";
      font = { "Verdana", 10, bold = true };
      isDefault = true;
      minClientSize = { 80, 21 };
      anchor = { bottom = 10 };
      NotifyClicked = ButtonCloseDialog;
   };
}
