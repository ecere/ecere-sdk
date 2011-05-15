namespace gui::dialogs;

import "Window"

public class GoToDialog : Window
{
   text = "Go To Line...";
   minClientSize = { 300, 80 };
   hasClose = true;
   tabCycle = true;
   background = activeBorder;

public:
   property int line { set { if(value) lineBox.Printf("%d", value); else lineBox.Clear(); } get { return line; } };
   property EditBox editBox { set { editBox = value; } get { return editBox; } };

private:
   int line;
   EditBox editBox;

   bool OnPostCreate()
   {
      lineBox.Activate();
      return true;
   }

   Button goTo
   {
      this, isDefault = true, text = "Go To", hotKey = altG, anchor = { right = 10, top = 10 }, size = { 80 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         line = atoi(lineBox.contents);
         if(!editBox || !editBox.GoToLineNum(line - 1))
            MessageBox { type = ok, master = this, text = "Go To", contents = "No such line." }.Modal();
         else
            Destroy(0);
         return true;
      }
   };

   Button close
   {
      this, text = "Close", hotKey = escape, anchor = { right = 10, top = 45 }, size = { 80 };
      NotifyClicked = ButtonCloseDialog;
   };
   
   EditBox lineBox
   {
      this, text = "Line number:", anchor = { left = 120, right = 100, top = 10 }, size.h = 20, hotKey = altL;
      
      void NotifyUpdate(EditBox editBox)
      {
         goTo.disabled = atoi(lineBox.contents) ? false : true;
      }
   };

   Label label { this, labeledWindow = lineBox, position = { 10, 10 } };
}
