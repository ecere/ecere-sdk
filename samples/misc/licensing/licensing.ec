import "ecere"
import "LicensesDialog"

// This is a method you can use to respect Ecere's software license
// agreements when distributing software based on Ecere SDK either
// freely or commercially.
//
// Other software licenses used in your applications or those that
// are part of Ecere SDK can also be displayed in order to comply
// with each license's terms.
//
// V2 of this sample shows how you to display additional licenses.
//

// TODO:
//  - add missing licenses
//  - implement method to show only the license you've choosen to
//    use in your application. i.e.: which flavor of ecere you're
//    using.


#ifdef SAMPLE_V2
class MyLicensesDialog : LicensesDialog
{
   LicenseTab myLicense { tabControl = tabControl, text = "MyApp", sourceFile = ":licenses/myapp.LICENSE" };
}
#endif

class MyAppAboutDialog : Window
{
   text = "Application About Dialog";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };
   nativeDecorations = true;

   Button licensingBtn
   {
      this, position = { 40, 300 }; hotKey = l; text = "Software Licenses";
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
#ifdef SAMPLE_V2
         MyLicensesDialog { }.Modal();
#else
         LicensesDialog { }.Modal();
#endif
         return true;
      }
   };
}

MyAppAboutDialog myAppAboutDialog {};
