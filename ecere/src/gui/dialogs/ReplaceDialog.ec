namespace gui::dialogs;

import "Window"

#define ID_REPLACE   1

public class ReplaceDialog : Window
{
   hasClose = true;
   tabCycle = true;
   borderStyle = fixed;
   background = activeBorder;
   minClientSize = { 432, 144 };
   text = $"Replace";
  
public:
   property EditBox editBox
   {
      set
      {
         int x1, y1, x2, y2;

         editBox = value;

         // Selection Only Default Check / Disabled
         if(value)
            value.GetSelPos(null, &y1, &x1, null, &y2, &x2, true);
         if(!editBox || (x1 == x2 && y1 == y2))
            selection.disabled = true;
         if(y1 == y2 || !editBox)
            wholeFile.checked = true;
         else
            selection.checked = true;

         if(value && y1 == y2 && x1 != x2)
         {
            char * selection = new char[value.SelSize() + 1];
            value.GetSel(selection, false);
            findWhat.contents = selection;

            findNext.disabled = !selection[0];
            replace.disabled = !selection[0];
            replaceAll.disabled = !selection[0];

            delete selection;
            replace.isDefault = true;
         }
      }
   };
   property char * searchString
   {
      set
      {
         findWhat.contents = value;
         findNext.disabled = !value || !value[0];
         replace.disabled = !value || !value[0];
         replaceAll.disabled = !value || !value[0];
      }
      get { return findWhat.contents; }
   };
   property char * replaceString { set { replaceWith.contents = replaceString; } get { return replaceWith.contents; } }
   property bool wholeWord { set { wholeWord.checked = value; } get { return wholeWord.checked; } };
   property bool matchCase { set { matchCase.checked = value; } get { return matchCase.checked; } };

private:

   bool FindClicked(Button control, int x, int y, Modifiers mods)
   {
      EditBoxFindResult findResult;
      int lastX, lastY;
      EditLine lastLine;
      EditLine line1, line2;
      int sel1X, sel1Y, sel2X, sel2Y;

      bool selectionOnly = selection.checked;
      bool wholeWord = this.wholeWord.checked;
      bool matchCase = this.matchCase.checked;
      char * searchString = findWhat.contents;
      char * replaceString = replaceWith.contents;

      if(!editBox) return false;
      if(!continued)
      {
         wrapped = 0;
         entriesReplaced = entriesFound = 0;

         // If in selection mode, the end of the selection is the end point of the replace
         if(selectionOnly)
            editBox.GetSelPos(null, null, null,
               &line, &this.y, &this.x, true);
         // If in whole file mode, the starting position is the end of the replace
         else
            editBox.GetSelPos(
               null, &this.y, &this.x, 
               null, null, null, true);
      }

      editBox.GetSelPos(&line1, &sel1Y, &sel1X, &line2, &sel2Y, &sel2X, true);
      // Invert Selection
      if(sel1X != sel2X || sel1Y != sel2Y)
         editBox.Select(line2, sel2Y, sel2X, line1, sel1Y, sel1X);

      lastX = editBox.column;
      lastY = editBox.lineNumber;
      lastLine = editBox.line;

      if(selectionOnly)
         findResult = editBox.FindInSelection(searchString, wholeWord, matchCase, line, this.y, this.x);
      else
         findResult = editBox.Find(searchString, wholeWord, matchCase, true);

      if(findResult)
      {
         int newSel1X, newSel1Y, newSel2X, newSel2Y;
         editBox.GetSelPos(null, &newSel1Y, &newSel1X, null, &newSel2Y, &newSel2X, true);
         if(newSel1X == sel1X && newSel1Y == sel1Y && newSel2X == sel2X && newSel2Y == sel2Y)
         {
            if(control.id == ID_REPLACE)   // Replace
            {
               if(this.y == sel1Y && sel1X <= this.x)
                  this.x += strlen(replaceString) - (newSel2X - newSel1X);
               editBox.PutS(replaceString);
               editBox.UpdateDisplay();

               entriesReplaced++;
            }
            if(selectionOnly)
               findResult = editBox.FindInSelection(searchString, wholeWord, matchCase, line, this.y, this.x);
            else
               findResult = editBox.Find(searchString, wholeWord, matchCase, true);

            entriesFound++;
         }
      }
      // Reselect text in proper order if no search result
      else if(sel1X != sel2X || sel1Y != sel2Y)
         editBox.Select(line1, sel1Y, sel1X, line2, sel2Y, sel2X);

      // Only for whole file search...
      if(findResult == wrapped) wrapped++;
      if(findResult != notFound && wrapped)
      {
         int curX, curY;
         editBox.GetSelPos(null, &curY, &curX, null, null, null, true);
         if(wrapped == 2 ||
            curY > this.y || (curY == this.y && curX >= this.x))
         {
            editBox.GoToPosition(lastLine, lastY, lastX);
            findResult = notFound;
         }
      }

      if(findResult == notFound)
      {
         if(entriesFound)
         {
            char contents[1024];
            sprintf(contents, $"%d occurences found, %d replaced", entriesFound, entriesReplaced);
            MessageBox { type = ok, master = this, text = $"Search Finished", contents = contents }.Modal();
         }
         else
            MessageBox { type = ok, master = this, text = $"Search Finished", contents = $"Search string not found." }.Modal();
         continued = false;

         selection.disabled = true;
         wholeFile.checked = true;
         findNext.isDefault = true;
      }
      else
      {
         continued = true;
         replace.isDefault = true;
      }
      // findWhat.Activate();
      return false; //true;
   }

   // Any      UNUSED CODE???
   bool EditBoxChanged(EditBox control)
   {
      if(continued)
      {
         selection.disabled = true;
         wholeFile.checked = true;
         continued = false;
         findNext.isDefault = true;
      }
      return true;
   }

   // Find what only
   bool OtherClicked(Button control, int x, int y, Modifiers mods)
   {
      if(continued)
      {
         selection.disabled = true;
         wholeFile.checked = true;
         continued = false;
         findNext.isDefault = true;
      }
      return true;
   }

   EditBox editBox;
   int x,y;
   EditLine line;
   int wrapped;
   bool continued;
   int entriesFound, entriesReplaced;

   EditBox replaceWith
   {
      this, text = $"Replace with:", anchor = { left = 124, top = 35, right = 120 }, size.h = 20, hotKey = altP;
   };

   Label replaceWithLabel
   {
      this, position = { 10, 35 }, labeledWindow = replaceWith
   };

   Button wholeWord
   {
      this, isCheckbox = true, text = $"Whole word only", position = { 10, 65 }, hotKey = altW;
      NotifyClicked = OtherClicked;
   };

   Button matchCase
   {
      this, isCheckbox = true, text = $"Match case", position = { 10, 85 }, hotKey = altC;
      NotifyClicked = OtherClicked;
   };

   Button selection
   {
      this, isRadio = true, text = $"Selection", position = { 180, 85 }, hotKey = altS;
      NotifyClicked = OtherClicked;
   };

   Button wholeFile
   {
      this, isRadio = true, text = $"Whole File", position = { 180, 105 }, hotKey = altH, checked = true;
      NotifyClicked = OtherClicked;
   };

   Label replaceInLabel
   {
      this, text = $"Replace In", position = { 180, 65 }
   };

   Button findNext
   {
      this, isDefault = true, keyRepeat = true, text = $"Find Next", anchor = { top = 10, right = 10 }, size = { 100 }, hotKey = altF, disabled = true;
      NotifyClicked = FindClicked;
   };

   Button replace
   {
      this, keyRepeat = true, text = $"Replace", anchor = { top = 42, right = 10 }, size = { 100 }, hotKey = altR, id = ID_REPLACE, disabled = true;
      NotifyClicked = FindClicked;
   };

   Button replaceAll
   {
      this, text = $"Replace All", anchor = { top = 75, right = 10 }, size = { 100 }, hotKey = altA, disabled = true;

      bool NotifyClicked(Button control, int x, int y, Modifiers mods)
      {
         int searchLen, replaceLen;
         EditLine line1, line2;
         int sel1X, sel1Y, sel2X, sel2Y;

         bool selectionOnly = selection.checked;
         bool wholeWord = this.wholeWord.checked;
         bool matchCase = this.matchCase.checked;
         char * searchString = findWhat.contents;
         char * replaceString = replaceWith.contents;

         if(!editBox) return false;
         if(!continued)
         {
            wrapped = 0;
            entriesReplaced = entriesFound = 0;

            // If in selection mode, the end of the selection is the end point of the replace
            if(selectionOnly)
               editBox.GetSelPos(null, null, null,
                  &line, &this.y, &this.x, true);
            // If in whole file mode, the starting position is the end of the replace
            else
               editBox.GetSelPos( 
                  null, &this.y, &this.x, 
                  null, null, null, true);
         }

         // Invert Selection to find the word again
         editBox.GetSelPos(
            &line1, &sel1Y, &sel1X, &line2, &sel2Y, &sel2X, true);
         if(sel1X != sel2X || sel1Y != sel2Y)
            editBox.Select(line2, sel2Y, sel2X, line1, sel1Y, sel1X);

         searchLen = strlen(searchString);
         replaceLen = strlen(replaceString);

         for(;;)
         {
            int lastX = editBox.column;
            int lastY = editBox.lineNumber;
            int curX, curY;
            EditLine lastLine = editBox.line;
            EditBoxFindResult findResult;

            if(selectionOnly)
               findResult = editBox.FindInSelection(searchString, 
                               wholeWord, matchCase,
                               line, this.y, this.x);
            else
               findResult = editBox.Find(searchString, wholeWord, matchCase, true);

            if(findResult == notFound) break;
            if(findResult == wrapped) wrapped++;

            editBox.GetSelPos(null, &curY, &curX, null, null, null, true);

            if(wrapped)
            {
               if(wrapped == 2 || curY > this.y || (curY == this.y && curX >= this.x))
               {
                  editBox.GoToPosition(lastLine, lastY, lastX);
                  break;
               }
            }
            if(this.y == curY && curX <= this.x)
               this.x += replaceLen - searchLen;
            editBox.PutS(replaceString);

            entriesReplaced++;
            entriesFound++;
         }
         if(!entriesFound)
         {
            MessageBox { type = ok, master = this, text = $"Search Finished", contents = $"Search string not found." }.Modal();

            // Reselect text in proper order if no search result
            if(selectionOnly && (sel1X != sel2X || sel1Y != sel2Y))
               editBox.Select(line1, sel1Y, sel1X, line2, sel2Y, sel2X);
         }
         else
         {
            char contents[1024];
            sprintf(contents, $"%d occurences found, %d replaced", entriesFound, entriesReplaced);
            MessageBox { type = ok, master = this, text = $"Search Finished", contents = contents }.Modal();
         }

         selection.disabled = true;
         wholeFile.checked = true;
         continued = false;
         findNext.isDefault = true;
         return true;
      }
   };

   Button cancel
   {
      this, text = $"Cancel", anchor = { top = 106, right = 10 }, size = { 100 }, hotKey = escape, NotifyClicked = ButtonCloseDialog;
   };

   EditBox findWhat
   {
      this, text = $"Find what:", anchor = { left = 124, top = 10, right = 120 }, size.h = 20, hotKey = altN;

      void NotifyUpdate(EditBox control)
      {
         bool disabled = findWhat.contents[0] ? false : true;
         findNext.disabled = disabled;
         replace.disabled = disabled;
         replaceAll.disabled = disabled;
      }
   };

   Label findWhatLabel { this, labeledWindow = findWhat, position = { 10, 10 } };

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
