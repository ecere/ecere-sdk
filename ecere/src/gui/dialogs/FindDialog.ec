namespace gui::dialogs;

import "Window"

public class FindDialog : Window
{
   text = "Find";
   hasClose = true;
   tabCycle = true;
   borderStyle = fixed;
   background = activeBorder;
   minClientSize = { 400, 112 };

public:
   property EditBox editBox { set { editBox = value; } };
   property char * searchString { set { findWhat.contents = value; } get { return findWhat.contents; } };
   property bool wholeWord { set { wholeWord.checked = value; } get { return wholeWord.checked; } };
   property bool matchCase { set { matchCase.checked = value; } get { return matchCase.checked; } };
   property bool searchUp { set { (value ? searchUp : searchDown).checked = true; } get { return searchUp.checked; } };

private:
   EditBox editBox;

   Button wholeWord
   {
      this, isCheckbox = true, text = "Whole word only", position = { 10, 40 }, hotKey = altW
   };

   Button matchCase
   {
      this, isCheckbox = true, text = "Match case", position = { 10, 60 }, hotKey = altC
   };
      
   Button searchUp
   {
      this, isRadio = true, text = "Up", position = { 220, 50 }, hotKey = altU
   };

   Button searchDown
   {
      this, isRadio = true, text = "Down", position = { 220, 70 }, hotKey = altD, checked = true;
   };

   Label directionLabel
   {
      this, text = "Direction", position = { 220, 35 }
   };

   Button findNext
   {
      this, keyRepeat = true, isDefault = true, text = "Find Next", anchor = { right = 10, top = 10 }, size = { 80 }, hotKey = altF;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         char * searchString = findWhat.contents;
         bool searchUp = this.searchUp.checked;
         bool wholeWord = this.wholeWord.checked;
         bool matchCase = this.matchCase.checked;

         if(!editBox || !editBox.Find(searchString, wholeWord, matchCase, !searchUp))
            MessageBox { type = ok, master = this, text = "Find", contents = "Search string not found." }.Modal();
         else
         {
            findWhat.Activate();
            Destroy(0);
         }
         return true;
      }
   };

   Button cancel
   {
      this, text = "Cancel", anchor = Anchor { right = 10, top = 45 }, size = { 80 }, hotKey = escape;
      
      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         findWhat.Activate();
         Destroy(0);
         return true;
      }
   };

   EditBox findWhat
   {
      this, text = "Find what:", anchor = { left = 100, right = 100, top = 10 }, size.h = 20, hotKey = altN;
   };

   Label findWhatLabel { this, position = { 10, 10 }, labeledWindow = findWhat };

   bool OnKeyHit(Key key, unichar ch)
   {
      if(ch)
      {
         findWhat.Activate();
         return findWhat.OnKeyHit(key, ch);
      }
      return true;
   }
}
