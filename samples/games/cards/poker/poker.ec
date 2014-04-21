/****************************************************************************
   POKER Game Interface

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   poker.ec - Poker Main Window
****************************************************************************/
import "ecere"
import "player.ec"
import "widow.ec"
import "bet.ec"

static String cardsNames[] =
{
   ":ac.png", ":ad.png", ":ah.png", ":as.png",    ":2c.png", ":2d.png", ":2h.png", ":2s.png",    ":3c.png", ":3d.png", ":3h.png", ":3s.png",
   ":4c.png", ":4d.png", ":4h.png", ":4s.png",    ":5c.png", ":5d.png", ":5h.png", ":5s.png",    ":6c.png", ":6d.png", ":6h.png", ":6s.png",
   ":7c.png", ":7d.png", ":7h.png", ":7s.png",    ":8c.png", ":8d.png", ":8h.png", ":8s.png",    ":9c.png", ":9d.png", ":9h.png", ":9s.png",
   ":10c.png", ":10d.png", ":10h.png", ":10s.png",":jc.png", ":jd.png", ":jh.png", ":js.png",    ":qc.png", ":qd.png", ":qh.png", ":qs.png",
   ":kc.png", ":kd.png", ":kh.png", ":ks.png",    ":rb.png", ":rr.png"
};

static define CARD_WIDTH = 111;
static define CARD_HEIGHT = 150;

enum PokerHand { nothing, onePair, twoPair, threeOfAKind, straight, flush, fullHouse, fourOfAKind, straightFlush, royalFlush };

/*
ROYAL FLUSH        0.0002 %
STRAIGHT FLUSH     0.0012 %
FOUR OF A KIND     0.0240 %
FULL HOUSE         0.1441 %
FLUSH              0.1967 %
STRAIGHT           0.3532 %
THREE OF A KIND    2.1128 %
TWO PAIR           4.7539 %
ONE PAIR          42.2569 %
NOTHING           50.1570 %
*/

enum Facing { faceDown, faceUp };

static int lowHand[5] = { 4*0 + 1, 4*1, 4*2, 4*3, 4*5 };
static Player players[6];
static int deck[52], deckIndex;

static int numPlayers;
static int numPlayersLeft;
static char playerNames[6][20] =
{
   "Jerome",
   "Adam",
   "Jason",
   "Bruce",
   "Pete",
   "Daniel"
};
static Pointf positions[5][6] =
{
   {{ .50f, .82f }, { .50f, .18f }},
   {{ .50f, .82f }, { .18f, .18f },  { .82f, .18f}},
   {{ .50f, .82f }, { .18f, .50f },  { .50f, .18f},  { .82f, .50f}},
   {{ .50f, .82f }, { .18f, .50f },  { .50f, .18f},  { .82f, .50f}, { .82f, .50f}},
   {{ .25f, .82f }, { .18f, .50f },  { .25f, .18f},  { .75f, .18f}, { .82f, .50f}, { .75f, .82f}}
};

// --- Data Used by Child Window Classes ---
int currentBet;
int potMoney;
int widowNum = 0;
int widow[52];
bool gameOver = true;

define ANTE = 1;

class Poker : Window
{
   background = teal;
   hasMinimize = true, hasMaximize = true, hasClose = true;
   borderStyle = sizable;
   text = "ECERE Poker";
   size = Size { 986, 740 };

   Bitmap bitmapCards[52];
   Bitmap cardBack {};

   Widow widowWindow { this, opacity = 0, text = "Widow", borderStyle = sizable, anchor = Anchor { left = 0.375, top = 0.34, right = 0.375, bottom = 0.34 } };

   void DrawCard(Surface surface, int x, int y, int card)
   {
      Bitmap bitmap;
      if(card != -1)
         bitmap = bitmapCards[card];
      else
         bitmap = cardBack;
      surface.Blit(bitmap, x, y, 0,0, bitmap.width,bitmap.height);
   }

   // --- Poker Game Flow ---

   void CreatePlayers(int num)
   {
      int c;

      numPlayers = num;
      for (c = 0; c<numPlayers; c++)
      {
         char string[256];
         Pointf pos = positions[numPlayers - 2][c];

         sprintf(string, "%s (%d)", playerNames[c], c + 1);
         players[c] = Player { this, opacity = 0, text = string, anchor = Anchor { left = pos.x - 0.175, top = pos.y - 0.16, right = 1-(pos.x + 0.175), bottom = 1-(pos.y + 0.16) } };
         players[c].Create();
      }
      players[0].human = true;
   }

   void Shuffle()
   {
      int c;

      POKER_ShuffleDeck(deck);
      deckIndex = 0;
      numPlayersLeft = numPlayers;
      for(c = 0; c<numPlayers; c++)
      {
         players[c].numDown = players[c].numUp = 0;
         players[c].folded = false;
         players[c].winner = false;
      }
      widowNum = 0;
      gameOver = false;
   }

   void Deal(Facing up, int howMany)
   {
      int c;
      int p;

      for(c = 0; c<howMany; c++)
         for(p = 0; p<numPlayers; p++)
         {
            Player player = players[p];
            if(!player.folded)
            {
               if(up)
               {
                  player.up[player.numUp++] = deck[deckIndex++];
                  POKER_SortCards(player.up, player.numUp);
               }
               else
               {
                  player.down[player.numDown++] = deck[deckIndex++];
                  POKER_SortCards(player.down, player.numDown);
               }
            }
         }
      Update(null);
   }

   void DealWidow(int howMany)
   {
      int c;
      for(c = 0; c<howMany; c++)
         widow[widowNum++] = deck[deckIndex++];
      POKER_SortCards(widow, widowNum);
      Update(null);
   }

   void Ante()
   {
      int c;
      for(c = 0; c<numPlayers; c++)
      {
         if(players[c].money >= ANTE)
         {
            players[c].money -= ANTE;
            potMoney += ANTE;
         }
         else
            players[c].folded = true;
      }
      Update(null);
   }

   void BettingRound(int firstBet)
   {
      int p;
      int numBets = 0;

      if(!created) return;

      if(numPlayersLeft >= 2)
      {
         currentBet = 0;
         for(p = 0; p<numPlayers; p++)
            players[p].thisBet = 0;

         for(p = firstBet;; p++)
         {
            Player player;
            char string[64];
            Bet bet;

            if(p == numPlayers) p = 0;
            player = players[p];
            if(player.folded) continue;

            if(currentBet && player.thisBet == currentBet) break;

            sprintf(string, "Your bet, %s?", playerNames[p]);
            bet = Bet { parent = this, thisBet = &player.thisBet, text = string };
            bet.Create();
            eInstance_IncRef(bet);
            while(bet.created)
            {
               app.UpdateDisplay();
               if(!app.ProcessInput(true))
                  app.Wait();
            }
            eInstance_DecRef(bet);

            if(!created) return;

            //player.thisBet = 0;

            if(player.thisBet < currentBet)
            {
               player.folded = true;
               numPlayersLeft--;
               if(numPlayersLeft < 2)
                  break;
               numBets = 0;
            }
            else if(player.thisBet > currentBet)
            {
               currentBet = player.thisBet;
               numBets = 0;
            }
            else
               numBets++;
            potMoney += player.thisBet;
            player.money -= player.thisBet;
            Update(null);

            if(!currentBet && numBets >= numPlayersLeft)
               break;
         }
      }
   }

   void WinMoney(int numHand, int numWidow)
   {
      int p;
      int numWinners = 0;
      int bestHand[5] = { lowHand[0], lowHand[1], lowHand[2], lowHand[3], lowHand[4] };

      if(!created) return;

      for(p=0; p<numPlayers; p++)
      {
         int cards[16];
         int c;
         Player player = players[p];

         if(player.folded) continue;

         for(c = 0;; c++)
         {
            if(c < player.numDown)
               cards[c] = player.down[c];
            else if(c - player.numDown < player.numUp)
               cards[c] = player.up[c - player.numDown];
            else
               break;
         }
         CopyBytesBy4(player.bestHand, lowHand, 5);
         POKER_BestHand(cards, widow, c, widowNum, numHand, numWidow, player.bestHand);
         player.handType = POKER_HandType(player.bestHand);
      }

      for(p=0; p<numPlayers; p++)
      {
         int c;
         Player player = players[p];
         if(player.folded) continue;

         switch(POKER_Compare(bestHand, player.bestHand))
         {
            case 0:
               numWinners ++;
               player.winner = true;
               break;
            case 1:
               for(c=0; c<numPlayers; c++)
                  players[c].winner = false;
               numWinners = 1;
               CopyBytesBy4(bestHand, player.bestHand, 5);
               player.winner = true;
               break;
         }
      }
      for(p=0; p<numPlayers; p++)
      {
         Player player = players[p];
         if(player.folded) continue;
         if(POKER_Compare(player.bestHand, bestHand) == 0)
            player.money += potMoney / numWinners;
      }
      if(numWinners)
      {
         potMoney -= (potMoney / numWinners) * numWinners;
      }
      gameOver = true;
      Update(null);
   }

   // --- Poker Games Definitions ---

   /*
   TEXAS HOLDEM - The most popular poker game in Blackhawk. A variation of 7-Card
   Stud where every player gets dealt 2 cards face down and there is a community
   board of 5 cards. Players Ise the 2 cards in their hand plus the 5 community
   cards to make the best possible 5 card hand. A dealers button moves around the
   table each hand. The player to the left of the dealer button is dealt the
   first card. Also the person to the left of the button has to post a blind.
   There is a betting round after the players receive their first 2 cards. Then the
   dealer places 3 cards on the board (the flop) and there is a betting round. Then
   the dealer places another card on the board (the turn) and there is another
   betting round. Then the dealer places the final card (the river) on the board
   and there is a final betting round. Games may have 1 blind or 2 blinds. Games
   vary from $2-5 betting to straight $5 betting.
   */
   void TexasHoldem()
   {
      Shuffle();
      Ante();
      Deal(faceDown, 2);
      BettingRound(0);
      DealWidow(3);
      BettingRound(0);
      DealWidow(1);
      BettingRound(0);
      DealWidow(1);
      BettingRound(0);
      WinMoney(2, 5);
   }

   /*
   OMAHA - A games similar to Texas Holdem except the players are dealt 4 cards
   face down. There is a board of 5 community cards and you must Ise 2 cards out
   of your hand to make the best possible hand. The game may be played straight
   high or high/lowHand. There is a dealer button that moves around the table each
   hand and the player that has the dealers button may choose to play the game
   straight high or high/lowHand. The player to the left of the dealer button has
   to post a small blind of $1 and the person to his/her left has to post the
   large blind of $2. To qualify for a lowHand hand, the player must have 5 cards
   that are 8 or lowHander. There is a betting round after the players receive their
   4 cards. Then the dealer places 3 cards on the board (the flop). After the
   betting round, the dealer places another card on the board (the turn) and there
   is another betting round. Then the dealer places the last card (the river) on
   the board and there is a final betting round. The betting limits are Isually
   $2-$5.
   */
   void OmahaHoldem()
   {
      Shuffle();
      Ante();
      Deal(faceDown, 4);
      BettingRound(0);
      DealWidow(3);
      BettingRound(0);
      DealWidow(1);
      BettingRound(0);
      DealWidow(1);
      BettingRound(0);
      WinMoney(2, 3);
   }

   void SevenCardStud()
   {
      Shuffle();
      Ante();
      Deal(faceDown, 2);
      Deal(faceUp, 1);
      BettingRound(0);
      Deal(faceUp, 1);
      BettingRound(0);
      Deal(faceUp, 1);
      BettingRound(0);
      Deal(faceUp, 1);
      BettingRound(0);
      Deal(faceDown, 1);
      BettingRound(0);
      WinMoney(5, 0);
   }

   // --- Poker Window Class ---
   bool OnLoadGraphics()
   {
      int i;
      cardBack.LoadT(":back.png",null,displaySystem);
      for(i = 0; i < 52; i++)
      {
         bitmapCards[i] = Bitmap {};
         bitmapCards[i].LoadT(cardsNames[i], null, displaySystem);
      }
      return true;
   }

   void OnUnloadGraphics()
   {
      int i;
      for(i=0;i<52;i++)
         delete bitmapCards[i];
      cardBack.Free();
   }

   bool OnPostCreate()
   {
      potMoney = 0;
      CreatePlayers(6);
      return true;
   }

   bool OnClose(bool parentClosing)
   {
      if(MessageBox { type = yesNo, text = "Exit", contents = "Quit?" }.Modal() == yes)
         return true;
      return false;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(!gameOver) return false;
      switch(key)
      {
         case f1: TexasHoldem(); break;
         case f2: OmahaHoldem(); break;
         case f3: SevenCardStud();   break;
      }
      return true;
   }
}

PokerApp app;

class PokerApp : GuiApplication
{
   Poker { };
   appName = "Poker Master";

   bool Init()
   {
      int c;
      // Initialize Card Deck
      RandomSeed((int)(GetTime() * 1000));
      for(c = 0; c<52; c++)
         deck[c] = c;

      app = this;
      return true;
   }
}
