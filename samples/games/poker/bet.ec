/****************************************************************************
   POKER Game Interface

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   bet.ec - Poker Bet Window
****************************************************************************/
import "poker.ec"

class Bet : Window
{
   background = activeBorder;
   borderStyle = fixed;
   clientSize = Size { 140, 80 };

   int * thisBet;
   Button bet
   {
      this,
      text = "Bet",
      size = Size { 40, 20 },
      anchor = Anchor { horz = -20 };
      hotKey = b,
      isDefault = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         int theBet = (int) strtod(edit.contents, null) * 2;
         if(theBet > 0 && *thisBet + theBet >= currentBet)
         {
            *thisBet += theBet;
            Destroy(1);
         }
         return true;
      }
   };
   Button pass
   {
      this,
      text = currentBet ? "Fold" : "Pass",
      size = Size { 40, 20 },
      anchor = Anchor { horz = 20 },
      hotKey = currentBet ? f : p;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return true;
      }
   };

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == escape) Destroy(0);
      return true;
   }
   EditBox edit { this, anchor = Anchor { top = 10 }, size = Size { 80, 20 } };

   property int * thisBet { set { this.thisBet = value; } };

   void OnRedraw(Surface surface)
   {
      surface.SetForeground(red);
      surface.WriteTextf(0, 65, "$%.2f to you.", (currentBet - *thisBet) / 2.0);
   }
}
