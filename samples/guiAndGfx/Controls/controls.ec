import "ecere"

class ControlsSample : Window
{
   text = "Common Controls Sample";
   borderStyle = fixed;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = { 280, 100 };

   Button button1
   {
      this, caption = "Push Me", altP, isDefault = true, position = { 32, 40 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         MessageBox { text = "Hello, World!!", contents = editBox1.contents }.Modal();
         return true;
      }
   };
   EditBox editBox1 { this, caption = "EditBox 1", altE, size = { 78, 19 }, position = { 112, 40 }, contents = "contents" };
   Label label1 { parent = this, size = { 45, 13 }, position = { 120, 16 }, labeledWindow = editBox1 };
}
ControlsSample controlsSample {};
