import "ecere"

class ModuleTester : Window
{
   caption = $"Form1";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 632, 438 };

   Button button1
   {
      this, caption = $"button1", position = { 128, 112 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         // build module.epj first
         Module m = eModule_Load(__thisModule, "module", publicAccess);
         Class c = eSystem_FindClass(m, "HelloWindow");
         Window w = (Window)eInstance_New(c);
         w.Create();
         return true;
      }
   };
}

ModuleTester moduleTester {};
