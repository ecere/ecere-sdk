#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class LicenseBox : Window
{
   text = $"Ecere SDK License Agreement";
   size = { 640, 480 };
   hasClose = true;
   borderStyle = sizable;
   background = activeBorder;
   tabCycle = true;
   font = { "Verdana", 10 };
   
   EditBox editBox
   {
      this,
      multiLine = true;
      hasHorzScroll = true;
      hasVertScroll = true;
      borderStyle = deep;
      anchor = { 10, 10, 10, 40 };
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
   Button dontAgreeButton
   {
      this;
      text = $"I don't agree";
      size = { 100, 22 };
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
      text = $"I agree";
      isDefault = true;
      size = { 80, 23 };
      anchor = { bottom = 10 };
      NotifyClicked = ButtonCloseDialog;
   };
}
