/****************************************************************************
   POKER Game Interface

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   widow.ec - Widow Window
****************************************************************************/
import "poker.ec"

class Widow : Window
{
   void OnRedraw(Surface surface)
   {
      Poker poker = (Poker) master;
      int c;
      for(c=0; c<widowNum; c++)
         poker.DrawCard(surface, c * 15, 0, POKER_Card(widow[c]));
      surface.SetForeground(red);
      surface.WriteTextf(10, 130, "POT MONEY: %.2f", potMoney / 2.0);
   }
}
