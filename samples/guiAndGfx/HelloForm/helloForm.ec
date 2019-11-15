import IMPORT_STATIC "ecere"

class HelloForm : Window
{
   text = "My First eC Application";
#if 0
   borderStyle = sizable;
   size = { 280, 100 };
   hasClose = true;

   Label label
   {
      this, position = { 10, 10 }, font = { "Arial", 30 },
      text = "Hello, World!!"
   };
#else
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
#endif // 0
};

HelloForm hello { };
