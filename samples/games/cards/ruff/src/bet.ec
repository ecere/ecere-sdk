import "ruff.ec"

class BetDialog : Window
{
   background = activeBorder;
   tabCycle = true;
   hasClose = true;
   size = Size { 160 }, clientSize.h = 80;

   Button bet
   {
      this, isDefault = true, text = "Bet", hotKey = altB;
      size = Size { 40, 20 };
      anchor = Anchor { horz = -20, top = 40 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         RuffGame * game = &((Ruff)master).game;
         Round * round = &game->rounds[game->round];

         int bet = atoi(edit.contents);
         if(bet >= 40 && bet <= 100 && !(bet%5) && bet >= round->bet.howMuch &&
            (game->turn == round->shuffle || bet > round->bet.howMuch))
            Destroy(bet);
         return true;
      }
   };

   Button pass
   {
      this, text = "Pass", hotKey = altP;
      anchor = Anchor { horz = 20, top = 40 };
      size = Size { 40, 20 };
      NotifyClicked = ButtonCloseDialog;
   };

   EditBox edit { this, size = Size { 80, 20 }, anchor = Anchor { top = 10 }; };

   bool OnPostCreate()
   {
      edit.Activate();
      return true;
   }

   bool OnCreate()
   {
      RuffGame * game = &((Ruff)master).game;
      Round * round = &game->rounds[game->round];

      edit.Clear();
      pass.disabled = false;
      if(game->turn == round->shuffle)
      {
         if(!round->bet.howMuch)
         {
            edit.Printf("%d", 40);
            pass.disabled = true;
         }
         else
            edit.Printf("%d", round->bet.howMuch);
      }
      else
      {
         if(round->bet.howMuch)
         {
            if(round->bet.howMuch < 100)
               edit.Printf("%d", round->bet.howMuch + 5);
         }
         else
            edit.Printf("%d", 40);
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape:
            if(!pass.disabled)
            {
               pass.NotifyClicked(this, pass, 0, 0, key.modifiers);
               return false;
            }
            break;
      }
      return true;
   }
}
