#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

class LicenseTab : Tab
{
   // opacity = 0;
   font = { "Verdana", 10 };
   EditBox editBox
   {
      this,
      multiLine = true;
      hasHorzScroll = true;
      hasVertScroll = true;
      borderStyle = none;
      anchor = { 4, 4, 4, 4 };
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

class LicensesDialog : Window
{
   text = "License Agreements";
   background = formColor;
   hasClose = true;
   borderStyle = sizable;
   size = { 700, 400 };
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
   LicenseTab ecereTab { tabControl = tabControl, text = "Ecere SDK", sourceFile = ":licenses/ecere.LICENSE" };
   LicenseTab pngTab { tabControl = tabControl, text = "libpng", sourceFile = ":licenses/png.LICENSE" };
   LicenseTab zlibTab { tabControl = tabControl, text = "zlib", sourceFile = ":licenses/zlib.README" };
   LicenseTab tango { tabControl = tabControl, text = "TangoIcons", sourceFile = ":licenses/tango.COPYING" };
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
