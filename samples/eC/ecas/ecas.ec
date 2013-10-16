// ecas -- By Joey Adams
import "ecere"
import "expression"

class Form1 : Window
{
   text = "Simple Parser";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };
   anchor = { horz = -3, vert = -4 };

   bool OnCreate(void)
   {

      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if (ch=='\r')
         DoParse(true);

      return true;
   }

   void DoParse(bool simplify) {
      EditBoxStream s;
      CASDictionary dict {};
      Expression expr {};
      Expression exprCopy;
      outputTree.Clear();
      s = {editBox=outputTree};
      if (expr.FromString(inputString.contents, dict)) {
         statusLabel.SetText("Parse successful");
         if (simplify)
            expr.Simplify(dict);
      }
      else
         statusLabel.SetText("Invalid expression");
      expr.DebugPrint(s, dict, 0, null);
      s.Printf("\nCopy:\n");
      exprCopy = expr.Copy(null);
      delete expr;
      exprCopy.DebugPrint(s, dict, 0, null);
      delete s;
      delete dict;
      delete exprCopy;
   }

   Button parseButton
   {
      this, text = "Parse", size = { 75, 30 }, position = { 10, 40 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DoParse(false);
         return true;
      }
   };
   Button simplifyButton
   {
      this, text = "Simplify", size = { 75, 30 }, position = { 90, 40 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DoParse(true);
         return true;
      }
   };

   bool TypeButton(Button button, int x, int y, Modifiers mods) {
      inputString.Activate();
      inputString.Deselect();
      inputString.AddS(button.text);
      inputString.Update(null);
   }
   Label statusLabel { this, size = { 274, 21 }, position = { 250, 45 } };
   Button ebutton { this, text = constant_string[e], NotifyClicked = TypeButton, size = { 20, 20 }, position = { 170, 45 } };
   Button ibutton { this, text = constant_string[i], NotifyClicked = TypeButton, size = { 20, 20 }, position = { 195, 45 } };
   Button pibutton { this, text = constant_string[pi], NotifyClicked = TypeButton, size = { 20, 20 }, position = { 220, 45 } };
   EditBox outputTree { this, font = { "Courier New", 10 }, size = { 286, 219 }, position = { 10, 80 }, hasHorzScroll = true, true, readOnly = true, true };
   EditBox inputString { this, text = "inputString", size = { 350, 19 }, position = { 10, 10 } };

   void OnResize(int width, int height)
   {
      inputString.size.w = clientSize.w-20;
      //parseButton.position.x = (clientSize.w-parseButton.size.w)/2;
      statusLabel.size.w = clientSize.w-statusLabel.position.x-10;
      outputTree.size.w = clientSize.w-20;
      outputTree.size.h = clientSize.h-outputTree.position.y-10;
   }
}

Form1 form1 {};
