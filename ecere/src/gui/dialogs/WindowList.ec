namespace gui::dialogs;

import "Window"

public class WindowList : Window
{
public:
   minClientSize = { 300, 300 };
   text = $"Windows";
   tabCycle = true;
   borderStyle = sizable;
   hasClose = true;
   background = activeBorder;

private:
   bool OnCreate()
   {
      master.ListChildren(listBox);
      return true;
   }

   Button ok
   {
      this, isDefault = true, text = $"OK", anchor = { horz = -45, bottom = 10 }, size = { 80 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(listBox.GetTag());
         return true;
      }
   };

   Button cancel
   {
      this, text = $"Cancel", anchor = { horz = 45, bottom = 10 }, size = { 80 }, hotKey = escape;
      NotifyClicked = ButtonCloseDialog;
   };

   ListBox listBox
   {
      this, borderStyle = deep, text = $"Select a Window to Activate...", anchor = { left = 10, right = 10, top = 30, bottom = 40 }, hotKey = altW;

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         return ok.NotifyClicked(this, ok, x, y, mods);
      }
   };    

   Label label
   {
      this, position = { 10, 10 }, labeledWindow = listBox;
   };
};
