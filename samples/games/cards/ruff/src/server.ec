import "ruff.ec"

bool RUFF_Legal(RuffGame game, Player player, int card)
{
   bool legal = false;
   if(player.cards[card].kind != none)
   {
      legal = true;
	   if(game.start != player.id)
      {
         int c;
         bool canSupply = false;
         Kind kind = game.played[game.start].kind;
		   for(c=0; c<9; c++)
			   if(player.cards[c].kind == kind)
            {
				   canSupply=true;
               break;
            }
	      if(canSupply && player.cards[card].kind != kind)
		      legal = false;
      }
   }
	return legal;
}

int RUFF_CardScore(RuffGame game, Kind kind, Number number)
{
   Round * round = &game.rounds[game.round];
   Kind setKind = game.played[game.start].kind;
   int score = 0;
   if(kind == setKind)
      score = 1 + number;
   else if(kind == round->bet.trump)
      score = 10 + number;
   return score;
}

PlayerPosition RUFF_HandWinner(RuffGame game, int * points, int * maxScore)
{
   PlayerPosition winner = none;
   PlayerPosition c;
   *points = 0;
   *maxScore = 0;

   for(c = 0; c<4; c++)
   {
      if(game.played[c].kind != none)
      {
         int score;

		   switch(game.played[c].number)
		   {
			   case _5: *points += 5;  break;
			   case _10: case ace: *points += 10; break;
		   }
         score = RUFF_CardScore(game, game.played[c].kind, game.played[c].number);
		   if(score >= *maxScore)
		   {
			   *maxScore = score;
			   winner = c;
		   }
      }
   }
   return winner;
}

static void Server_ShuffleDeck(Card * deck)
{
   int t;
   int count;

   RandomSeed((uint)(((uint64)(GetTime() * 1000)) & MAXDWORD));

   count = GetRandom(1000, 2000);
   for(t = 0; t<count; t++)
   {
      // cut the deck in 2
      Card cuts[2][NUMCARDS];
      int numCut[2];
      int indexCut[2] = {0,0};
      int cut = GetRandom(NUMCARDS / 4, NUMCARDS * 3 / 4);
      int c;

      for(c = 0; c<cut; c++)
         cuts[0][c] = deck[c];
      for(c = cut; c<NUMCARDS; c++)
         cuts[1][c - cut] = deck[c];

      numCut[0] = cut;
      numCut[1] = NUMCARDS - cut;

      // Mix the cards
      for(c = 0; c<NUMCARDS; c++)
      {
         int whichCut;

         if(indexCut[0] < numCut[0] && indexCut[1] < numCut[1])
            whichCut = GetRandom(0,1);
         else if(indexCut[0] < numCut[0])
            whichCut = 0;
         else if(indexCut[1] < numCut[1])
            whichCut = 1;

         deck[c] = cuts[whichCut][indexCut[whichCut]++];
      }
   }
}

static int CompareCards(const Card * card1, const Card * card2)
{
   if(card1->kind > card2->kind)
      return 1;
   else if(card1->kind < card2->kind)
      return -1;
   else if(card1->number < card2->number)
      return 1;
   else if(card1->number > card2->number)
      return -1;
   else
      return 0;
}

static void Server_Deal(RuffGame game)
{
   int c;
   Round * round = &game.rounds[game.round];
   static Card deck[NUMCARDS];

   // Initialize the deck
   for(c = 0; c<NUMCARDS; c++)
   {
      deck[c].kind = (Kind)(c / 9);
      deck[c].number = (Number)(c % 9);
   }

   Server_ShuffleDeck(deck);

   for(c=0; c<4; c++)
   {
      // Extra cards for ruff...
      game.players[c].cards[9].kind = none;
      game.players[c].cards[10].kind = none;
   }

   for(c = 0; c<NUMCARDS; c++)
   {
      Player * player = &game.players[(round->shuffle + c) % 4];
      player->cards[c / 4] = deck[c];
   }

   for(c = 0; c<4; c++)
      qsort(game.players[c].cards, 9, sizeof(Card), CompareCards);

   round->bet.howMuch = 0;
   round->bet.player = none;
   round->bet.trump = none;

   game.turn = game.start = (round->shuffle + 1) % 4;
   game.cardSet = 0;
   game.betting = true;
   round->scores[0] = round->scores[1] = 0;

   for(c = 0; c<4; c++)
      Player_InformNewRound(&game.players[c], game.round, round->shuffle, game.players[c].cards);

   Player_RequestBet(&game.players[game.turn]);
}

void Server_StartGame(RuffGame game)
{
   int c;

   // New Game
   RandomSeed((uint)(((uint64)(GetTime() * 1000)) & MAXDWORD));
   game.rounds[0].shuffle = (PlayerPosition)GetRandom(0, 3);
   game.round = 0;
   game.gameStarted = true;
   for(c = 0; c<4; c++)
      game.played[c].kind = none;

   for(c = 0; c<4; c++)
      Player_InformStartGame(&game.players[c]);
   Server_Deal(game);
}

void Server_StopGame(RuffGame game)
{
  int c;

   // New Game
   game.gameStarted = false;

   for(c = 0; c<4; c++)
      Player_InformStopGame(&game.players[c]);
}

void Server_PlaceBet(RuffGame game, Player player, int bet)
{
   Round * round = &game.rounds[game.round];
   if(!bet ||
      (bet >= 40 && bet <= 100 && !(bet%5) && bet >= round->bet.howMuch &&
      (round->shuffle == player.id || bet > round->bet.howMuch)))
   {
      int c;

      if(bet || (!round->bet.howMuch && round->shuffle == player.id))
      {
         round->bet.howMuch = bet;
         round->bet.player = game.turn;
      }
      game.turn = (game.turn + 1) % 4;

      for(c = 0; c<4; c++)
         Player_InformBet(&game.players[c], player.id, bet);

      if(game.turn == game.start)
      {
         game.turn = game.start = round->bet.player;
         Player_RequestTrump(&game.players[game.turn]);
      }
      else
         Player_RequestBet(&game.players[game.turn]);
   }
   else
      Player_RequestBet(player);
}

void Server_ChoseTrump(RuffGame game, Player player, Kind trump)
{
   Round * round = &game.rounds[game.round];
   if(trump >= 0 || trump < 4 || trump == none)
   {
      int c;

      round->bet.trump = trump;

      for(c = 0; c<4; c++)
         Player_InformTrump(&game.players[c], trump);

      for(c = 0; c<4; c++)
         Player_InformStartHand(&game.players[c], game.start);
      for(c = 0; c<4; c++)
         game.played[c].kind = none;

      game.betting = false;
      Player_RequestCard(&game.players[game.turn]);
   }
   else
      Player_RequestTrump(player);
}

void Server_Ack4Cards(RuffGame game, Player player)
{
   Round * round = &game.rounds[game.round];
   int c;
   int totalScores[2] = { 0 };

   game.cardSet++;

   // End of round
   if(game.cardSet == 9)
   {
      for(c = 0; c<game.round; c++)
      {
         totalScores[0] += game.rounds[c].scores[0];
         totalScores[1] += game.rounds[c].scores[1];
      }

      for(c = 0; c<2; c++)
      {
         if((int)round->bet.player % 2 == c && round->scores[c] < round->bet.howMuch)
            round->scores[c] = -round->bet.howMuch;
         totalScores[c] += round->scores[c];
      }

      for(c = 0; c<4; c++)
         Player_InformEndOfRound(&game.players[c], round->scores[0], round->scores[1]);

      game.round++;
      game.betting = true;

      if((totalScores[0] < 500 && totalScores[1] < 500) || totalScores[0] == totalScores[1])
      {
         game.rounds[game.round].shuffle = (round->shuffle + 1) % 4;
         Server_Deal(game);
      }
      else
      {
         for(c = 0; c<4; c++)
            Player_InformNewRound(&game.players[c], game.round, game.rounds[game.round].shuffle,
            game.players[c].cards);
      }
   }
   else
   {
      for(c = 0; c<4; c++)
         Player_InformStartHand(&game.players[c], game.start);
      for(c = 0; c<4; c++)
         game.played[c].kind = none;

      Player_RequestCard(&game.players[game.turn]);
   }
}

void Server_PlayCard(RuffGame game, Player player, int card)
{
   if(player.id == game.turn && RUFF_Legal(game, player, card))
   {
      int c;
      Card theCard = player.cards[card];

      for(c = 0; c<4; c++)
         Player_InformCardPlayed(&game.players[c], player.id,
            theCard.kind, theCard.number);

      game.played[player.id] = theCard;
      player.cards[card].kind = none;
      game.turn = (player.id + 1) % 4;

      // End of set of 4 cards
      if(game.turn == game.start)
      {
         Round * round = &game.rounds[game.round];
         int points, maxScore;
         PlayerPosition winner;
         winner = RUFF_HandWinner(game, &points, &maxScore);
         round->scores[winner%2] += points;

         for(c = 0; c<4; c++)
            Player_Request4CardsAck(&game.players[c], winner, round->scores[0], round->scores[1]);

         game.turn = game.start = winner;

         Server_Ack4Cards(player.game, &game.players[0]);
      }
      else
         Player_RequestCard(&game.players[game.turn]);
   }
   else
      Player_RequestCard(player);
}

void Server_SetName(RuffGame game, Player player, const char * name)
{
   int c;
   strcpy(player.name, name);
   for(c = 0; c<4; c++)
      Player_InformPlayerInfo(&game.players[c], player.id, name);
}
