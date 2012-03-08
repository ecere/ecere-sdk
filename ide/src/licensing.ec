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
   property char * sourceFile
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
   text = "License Agreements";
   background = formColor;
   hasClose = true;
   borderStyle = sizable;
   size = { 820, 580 };
   nativeDecorations = true;

   TabControl tabControl
   {
      this,
      opacity = 0,
      anchor = { 10, 60, 10, 40 };
   };
   Label label1
   {
      this, anchor = { top = 16 }, font = { "Tahoma", 10, true };
      text = "This program is based on these free open source software components.";
   };
   Label label2
   {
      this, anchor = { top = 32 }, font = { "Tahoma", 10, true };
      text = "By using it you agree to the terms and conditions of their individual licenses.";
   };
   LicenseTab ecereTab
   {
      text = "Ecere SDK";
      sourceFile = ":licenses/LICENSE";
      tabControl = tabControl;
   };
   LicenseTab pngTab
   {
      text = "libpng";
      sourceFile = ":licenses/png.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab jpgTab
   {
      text = "libjpg";
      sourceFile = ":licenses/jpg.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab freetypeTab
   {
      text = "FreeType";
      sourceFile = ":licenses/freetype.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab harfbuzzTab
   {
      text = "HarfBuzz";
      sourceFile = ":licenses/harfbuzz.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab gifTab
   {
      text = "ungif";
      sourceFile = ":licenses/ungif.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab zlibTab
   {
      text = "zlib";
      sourceFile = ":licenses/zlib.README";
      tabControl = tabControl;
   };
   LicenseTab sqliteTab
   {
      text = "SQLite";
      sourceFile = ":licenses/sqlite.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab tango
   {
      text = "Tango Icons";
      sourceFile = ":licenses/tango.COPYING";
      tabControl = tabControl;
   };
   LicenseTab upxTab
   {
      text = "UPX";
      sourceFile = ":licenses/upx.LICENSE";
      tabControl = tabControl;
   };
   LicenseTab gplTab
   {
      text = "GCC, GDB";
      sourceFile = ":licenses/gpl.LICENSE";
      tabControl = tabControl;
   };
   Button ok
   {
      this;
      text = "OK";
      anchor = { bottom = 10 };
      size = { 80, 22 };
      isDefault = true;
      NotifyClicked = ButtonCloseDialog;
   };
}
