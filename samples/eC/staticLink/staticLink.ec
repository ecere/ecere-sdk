#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };
   nativeDecorations = true;

   Button button1
   {
      this, text = "button1", position = { 192, 72 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {

         return true;
      }
   };
}

Form1 form1 { };
