import "chess.ec"

class ConnectDialog : Window
{
   minClientSize = Size { 300, 100 };
   tabCycle = true, background = activeBorder, hasClose = true, caption = "Connect to server";

   Button ok
   {
      parent = this, bevel = true, isDefault = true, caption = "OK",
      size = Size { w = 80 }, anchor = Anchor { horz = -48, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((Chess)master).Connect(address.line.text);
         Destroy(0);
         return true;
      }
   };

   Button cancel
   {
      parent = this, bevel = true, caption = "Cancel", size = Size { w = 80 }, hotKey = escape;
      anchor = Anchor { horz = 48, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return false;
      }
   };

   EditBox address
   {
      parent = this, textHorzScroll = true, size = Size { w = 200 }, anchor = Anchor { top = 10 },
      line.text = "localhost"
   };
}
