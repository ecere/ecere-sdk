/****************************************************************************
   POKER Game Interface

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   player.ec - Poker Player Window
****************************************************************************/
import "poker.ec"
import "pokerUtils.ec"

static char handTypes[10][20] = 
{
   "NOTHING",
   "ONE PAIR",
   "TWO PAIRS",
   "THREE OF A KIND",
   "STRAIGHT",
   "FLUSH",
   "FULL HOUSE",
   "FOUR OF A KIND",
   "STRAIGHT FLUSH",
   "ROYAL FLUSH"
};

class Player : Window
{
   borderStyle = sizable;

   bool human;
   int numUp, numDown;
   int money;
   int up  [52];
   int down[52];
   int thisBet;
   bool folded;
   int bestHand[5];
   int handType;
   bool winner;

   Player()
   {
      money = 40 * 2;
   }

   void OnRedraw(Surface surface)
   {
      Poker poker = (Poker)master;
      int c;

      for(c=0; c<numDown; c++)
      {
         poker.DrawCard(surface, c*15, 0, (human || gameOver && !folded) ? POKER_Card(down[c]) : -1);
      }
      POKER_HandType(bestHand);
      for(c=0; c<numUp; c++)
         poker.DrawCard(surface, c*15, 40, folded ? -1 : POKER_Card(up[c]));
      if(folded)
      {
         surface.SetForeground(blue);
         surface.WriteTextf(10, 130, "FOLDED");
      }
      else if(gameOver)
      {
         surface.SetForeground(red);
         if(winner) 
            surface.WriteTextf(10, 130, "WINNER");
         surface.SetForeground(blue);
         surface.WriteTextf(80, 130, "%s", handTypes[handType]);
      }
      surface.SetForeground(white);
      surface.WriteTextf(110, 110, "$%.2f", money / 2.0);
   }
}
