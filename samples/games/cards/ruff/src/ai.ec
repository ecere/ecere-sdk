import "ruff.ec"

/*
int AI_ComputeBet(Player player)
{
   int c, kind;
   Kind trump = none;
   int numberOfKind[4] = { 0 }, high[4] = { 0 };
   int bet = 0;
   RuffGame * game = player.game;
   Round * round = &game->rounds[game->round];
   static const int betTable[10][25]=
   {
      {40,40,40,40,40,40,40,40,40,40,40,40,40,40,40, 40,40,40,40,40,40,40,40,40,40},
      {40,40,40,40,40,40,40,40,40,40,40,40,40,40,40, 40,40,40,40,40,40,40,40,40,40},
      {40,40,40,40,40,40,40,40,40,40,40,40,40,40,40, 40,40,40,40,40,40,40,40,40,40},
      {40,40,40,40,40,45,45,45,45,45,45,45,45,45,45, 45,45,45,45,45,45,45,45,45,45},
      {40,40,40,40,40,45,50,50,50,50,50,50,50,50,50, 50,50,50,50,50,50,50,50,50,50},
      {40,40,40,40,40,45,50,55,60,60,60,60,60,60,60, 60,60,60,60,60,60,60,60,60,60},
      {40,40,40,40,40,45,50,55,60,65,70,70,70,70,70, 70,70,70,70,70,70,70,70,70,70},
      {40,40,40,40,40,45,50,55,60,65,70,75,80,85,85, 85,85,85,85,85,85,85,85,85,85},
      {40,40,40,40,40,45,50,55,60,65,70,75,80,85,90, 95,95,95,95,95,95,95,95,95,95},
      {100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100}
   };
   int highTotal;

   for(c=0; c<9; c++)
   {
      Card * card = &player.cards[c];

      numberOfKind[card->kind] ++;
      switch(card->number)
      {
         case Ace:   high[card->kind] += 3; break;
         case King:  high[card->kind] += 2; break;
         case Queen: high[card->kind] += 1; break;
      }
   }
   highTotal = high[0] + high[1] + high[2] + high[3];

   for(kind=0; kind<4; kind++)
   {
      if(betTable[numberOfKind[kind]][highTotal] > bet)
      {
         trump = kind;
         bet = betTable[numberOfKind[kind]][highTotal];
      }
      else if(betTable[numberOfKind[kind]][highTotal] == bet && kind)
      {
			if(trump == none || (numberOfKind[kind] > numberOfKind[trump] && high[kind] > high[trump]))
			{
				trump = kind;
            bet = betTable[numberOfKind[kind]][highTotal];
	      }
      }
   }

   // Check if we're going to pass...
   if(bet <= round->bet.howMuch && (player.id != round->shuffle || bet != round->bet.howMuch))
      bet = 0;

   player.trump = trump;

   return bet;
}
*/

int AI_ComputeBet(Player player)
{
   int c;
   Kind kind;
   Kind trump = none;
   int numberOfKind[4] = { 0 }, high[4] = { 0 };
   int bet = 0;
   RuffGame * game = player.game;
   Round * round = &game->rounds[game->round];
   static const int betTable[67] =
   {
        0,  0,  0,  0,  0,  0,  0,  0,
        0,  0,  0,  0,  0,  0,  0,  0,
        5,  5,  5, 10, 10, 15, 15, 15,
       20, 20, 20, 25, 25, 25, 30, 30,
       30, 35, 35, 35, 40, 40, 40, 45,
       45, 45, 50, 50, 50, 55, 55, 55,
       60, 60, 60, 65, 65, 65, 70, 70,
       70, 75, 75, 75, 80, 80, 80, 85,
       90, 95, 100
   };
   static const int kindTable[37] =
   {
      0,
      5, 5, 10, 10, 10, 15,
      15, 15, 20, 20, 20, 25,
      25, 25, 30, 30, 30, 35,
      35, 35, 40, 40, 40, 45,
      50, 55, 60, 65, 70, 75,
      80, 85, 90, 95, 100, 100
   };

   int highTotal;
   int kindScore;

   for(c=0; c<9; c++)
   {
      Card * card = &player.cards[c];

      numberOfKind[card->kind] ++;
      high[card->kind] += card->number;
   }
   highTotal = high[0] + high[1] + high[2] + high[3];

   for(kind=0; kind<(Kind)4; kind++)
   {
      if(numberOfKind[kind] >= 3 &&
         (trump == none || high[kind] > high[trump] || (high[kind] == high[trump] && numberOfKind[kind] > numberOfKind[trump])))
         trump = kind;
   }

   kindScore = kindTable[high[trump]];
   switch(numberOfKind[trump])
   {
      case 3: kindScore = Min(kindScore, 20); break;
      case 4: kindScore = Min(kindScore, 40); break;
      case 5: kindScore = Min(kindScore, 50); break;
      case 6: kindScore = Min(kindScore, 60); break;
      case 7: kindScore = Min(kindScore, 70); break;
      case 8: kindScore = Min(kindScore, 80); break;
   }

   if(trump == none || betTable[highTotal] > betTable[highTotal - high[trump]] + kindScore)
   {
      trump = none;
      bet = betTable[highTotal];
   }
   else
      bet = betTable[highTotal - high[trump]] + kindTable[high[trump]];

   bet = Min(bet, 100);
   if(bet < 40) bet = 0;

   // Check if we're going to pass...
   if(bet <= round->bet.howMuch && (player.id != round->shuffle || bet != round->bet.howMuch))
      bet = 0;
   else if(player.id == round->shuffle)
      bet = round->bet.howMuch ? round->bet.howMuch : 40;

   player.trump = trump;

   return bet;
}

void AI_RequestBet(Player player)
{
   Player_PlaceBet(player, AI_ComputeBet(player));
}

void AI_RequestTrump(Player player)
{
   Player_ChoseTrump(player, player.trump);
}

static bool CardMaster(Player player, Card card)
{
   Number c;
   for(c = ace; c > card.number; c--)
      if(player.left[card.kind][c])
         return false;
   return true;
}

static bool DoesNotMakeNude(Player player, Card whichCard)
{
   int c;

   for(c=0; c<9; c++)
   {
      Card * card = &player.cards[c];
      if(card->kind == whichCard.kind &&
         card->number != whichCard.number &&
         card->number != ace &&
         card->number != _10 &&
         card->number != _5)
         return true;
   }
   return false;
}

static bool AloneInKind(Player player, Card whichCard)
{
   int c;
   for(c=0; c<9; c++)
   {
      Card * card = &player.cards[c];
      if(card->kind == whichCard.kind && card->number != whichCard.number)
          return false;
   }
   return true;
}

enum TrumpFlag { AnyCard, NoTrump, PutTrump, Alone, DontNudify };

static int Discard(Player player, char * numbers, TrumpFlag trumpFlag)
{
   RuffGame * game = player.game;
   Round * round = &game->rounds[game->round];
   Kind trump = round->bet.trump;
   Kind kindRequested = game->played[game->start].kind;
   int card;
   for(card = 0; numbers[card]; card++)
   {
      Number number;
      int c;

      switch(numbers[card])
      {
         case '5': number = _5; break;    // AUTOCOMPLETE BUG ON number =
         case '7': number = _7; break;
         case '8': number = _8; break;
         case '9': number = _9; break;
         case 'T': number = _10; break;
         case 'J': number = jack; break;
         case 'Q': number = queen; break;
         case 'K': number = king; break;
         case 'A': number = ace; break;
      }
      for(c=0; c<9; c++)
      {
         Card * card = &player.cards[c];
         if(card->number == number && RUFF_Legal(game, player, c))
         {
            switch(trumpFlag)
            {
               case AnyCard: return c;
               case NoTrump:
                  if(trump == kindRequested || card->kind != trump)
                     return c;
                  break;
               case PutTrump:
                  if(card->kind == trump)
                     return c;
                  break;
               case Alone:
                  if(AloneInKind(player,card))
                     return c;
                  break;
               case DontNudify:
                  if(DoesNotMakeNude(player,card))
                     return c;
                  break;
            }
         }
      }
   }
   return None;
}

void AI_RequestCard(Player player)
{
   RuffGame * game = player.game;
   Round * round = &game->rounds[game->round];
   int cardPlayed = None;
   Kind trump = round->bet.trump;
   Kind kindRequested = game->played[game->start].kind;
   PlayerPosition partner = (player.id + 2) % 4;
   bool trumpLeft = player.trumpLeft[(player.id+1) % 4] || player.trumpLeft[(player.id+3) % 4];
   int maxScore, points;
   PlayerPosition winner = RUFF_HandWinner(game, &points, &maxScore);
   // Master if ignoring cards in my hands
   bool master = (winner != none) ? CardMaster(player, &game->played[winner]) : false;
   Kind winnerKind = game->played[winner].kind;
   bool plus = false;
   int turn = game->turn - game->start;
   int c;

   // Count the remaining trump
   if(trump != none)
   {
      int count = 0;
      for(c = 0; c<9; c++)
         if(!player.left[trump][c])
            count++;
      if(count == 9) trumpLeft = false; // AUTOCOMPLETE BUG ON = IF ONLY } AFTER
   }

   if(turn < 0) turn += 4;

   // Can I beat it?
   {
      int c;
      for(c = 0; c<9; c++)
      {
         Card * card = &player.cards[c];
		   int score = RUFF_CardScore(game, card->kind, card->number);
         if(score > maxScore && RUFF_Legal(game, player, c) && card->kind == kindRequested)
         {
            plus = true;
            break;
         }
      }
   }

   /*
   Logf("Player %d thinking:\n", player.id);
   Logf("   round = %d, turn = %d, partner = %d, winner = %d, trumpLeft = %d, maxScore = %d, master = %d, plus = %d\n",
      game->round, turn, partner, winner, trumpLeft, maxScore, master, plus);
   */

   switch(turn)
   {
      case 0:
         if(player.id == round->bet.player && trumpLeft)
         {
            // J'ai pris alors je fais tomber l'atout
            // if((cardPlayed = Discard(player, "AKQJ9875T", PutTrump)) != None) break;
            if((cardPlayed = Discard(player, "AKQJ987", PutTrump)) != None) break;
         }
         // Je mets ma plus grosse carte (pas des points)
         if((cardPlayed = Discard(player, "AKQJ9875T", NoTrump)) != None) break;
         // Je n'ai pas d'atout alors je mets ma plus grosse carte (pas des points)
         if((cardPlayed = Discard(player, "AKQJ9875T", AnyCard)) != None) break;
         break;
      case 1:
         // Je peux battre la carte sur la table alors je la bats
         if(plus)
         {
            if((cardPlayed = Discard(player, "AKQJ9875T", NoTrump)) != None) break;
         }
         // Je ne peux pas battre la carte alors j'essaie de couper ou je mets ma plus petite carte
         else
         {
            if(winnerKind != trump)
            {
               if((cardPlayed = Discard(player, "789JQKT5A", PutTrump)) != None) break;
            }
            if((cardPlayed = Discard(player, "789J", Alone)) != None) break;
            if((cardPlayed = Discard(player, "789J", DontNudify)) != None) break;
            if((cardPlayed = Discard(player, "789JQ5KTA", AnyCard)) != None) break;
         }
         break;
      case 2:
         // Mon partner est maitre alors je lui donne des points
         if(winner == partner && master)
         {
            if((cardPlayed = Discard(player, "T5", NoTrump)) != None) break;
            if((cardPlayed = Discard(player, "T5", AnyCard)) != None) break;

            if((cardPlayed = Discard(player, "789JQ", NoTrump)) != None) break;

            if((cardPlayed = Discard(player, "789JQ", AnyCard)) != None) break;

            if((cardPlayed = Discard(player, "KA", NoTrump)) != None) break;
            if((cardPlayed = Discard(player, "KA", AnyCard)) != None) break;
         }
         // Je peux battre la carte sur la table alors je la bats
         else if(plus)
         {
            if((cardPlayed = Discard(player, "AKQJ9875T", NoTrump)) != None) break;
         }
         // Je ne peux pas battre la carte alors j'essaie de couper ou je mets ma plus petite carte
         else
         {
            if(winnerKind != trump)
            {
               if((cardPlayed = Discard(player, "T5789JQKA", PutTrump)) != None) break;
            }
            if((cardPlayed = Discard(player, "789J", Alone)) != None) break;
            if((cardPlayed = Discard(player, "789J", DontNudify)) != None) break;
            if((cardPlayed = Discard(player, "789JQ5KTA", AnyCard)) != None) break;
         }
         break;
      case 3:
         // Mon partner remporte alors je lui donne des points
         if(winner == partner)
         {
            if((cardPlayed = Discard(player, "T5", NoTrump)) != None) break;
            if((cardPlayed = Discard(player, "T5", AnyCard)) != None) break;

            if((cardPlayed = Discard(player, "789JQ", NoTrump)) != None) break;
            if((cardPlayed = Discard(player, "789JQ", AnyCard)) != None) break;

            if((cardPlayed = Discard(player, "KA", NoTrump)) != None) break;
            if((cardPlayed = Discard(player, "KA", AnyCard)) != None) break;
         }
         // Je peux battre la carte sur la table alors je la bats
         else if(plus)
         {
            if((cardPlayed = Discard(player, "AKQJ9875T", NoTrump)) != None) break;
         }
         // Je ne peux pas battre la carte alors j'essaie de couper ou je mets ma plus petite carte
         else
         {
            if(winnerKind != trump)
            {
               if((cardPlayed = Discard(player, "T5789JQKA", PutTrump)) != None) break;
            }
            if((cardPlayed = Discard(player, "789J", Alone)) != None) break;
            if((cardPlayed = Discard(player, "789J", DontNudify)) != None) break;

            if((cardPlayed = Discard(player, "789JQ5KTA", AnyCard)) != None) break;
         }
         break;
   }
   Player_PlayCard(player, cardPlayed);
}

void AI_InformNewRound(Player player, int round, PlayerPosition shuffle, Card * cards)
{
   // Reset the markers
   int c, kind;
   for(kind = 0; kind<4; kind++)
      for(c = 0; c<9; c++)
         player.left[kind][c] = true;
   player.trumpLeft[0] = player.trumpLeft[1] =
   player.trumpLeft[2] = player.trumpLeft[3] = true;

   for(c = 0; c<9; c++)
   {
      if(player.cards[c].kind != none)
         player.left[player.cards[c].kind][player.cards[c].number] = false;
   }
}

void AI_InformBet(Player player, int who, int howMuch)
{

}

void AI_InformTrump(Player player, Kind trump)
{

}

void AI_InformCardPlayed(Player player, int who, Kind kind, Number number)
{
   RuffGame * game = player.game;
   Round * round = &game->rounds[game->round];

   player.left[kind][number] = false;
   // Mark this player as not having trump anymore
   if(game->played[game->start].kind == round->bet.trump &&
      kind != round->bet.trump)
      player.trumpLeft[who] = false;
   // Assume no more trump if a 10 is discarded
   else if(game->played[game->start].kind == round->bet.trump && number == _10)
      player.trumpLeft[who] = false;
}

void AI_InformEndOfRound(Player player, int score0, int score1)
{

}
