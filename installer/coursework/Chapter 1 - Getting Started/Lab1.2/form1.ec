import "ecere"

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Button button1
   {
      this, text = "button1", position = { 240, 176 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         MessageBox { contents = "Hello, world!" }.Modal();
         return true;
      }
   };
}

Form1 form1 {};
