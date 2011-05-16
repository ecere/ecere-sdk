/*
// CLIENT TO SERVER
void Player_PlaceBet(Player * player, int bet)
{
   if(player.socket)
   {
      C2SPlaceBet placeBet = { { sizeof(C2SPlaceBet), C2S_PLACEBET }, bet };
      eSocket_Send(player.socket, &placeBet, sizeof(placeBet));
   }
   else
      Server_PlaceBet(player.game, player, bet);
}

void Player_ChoseTrump(Player * player, int trump)
{
   if(player.socket)
   {
      C2SChoseTrump choseTrump = { { sizeof(C2SChoseTrump), C2S_CHOSETRUMP }, trump };
      eSocket_Send(player.socket, &choseTrump, sizeof(choseTrump));
   }
   else
      Server_ChoseTrump(player.game, player, trump);
}

void Player_PlayCard(Player * player, int card)
{
   Window * window = player.window;
   Ruff * ruff = window.data;

   selectedCard = None;
   if(player.socket)
   {
      C2SPlayCard playCard = { { sizeof(C2SPlayCard), C2S_PLAYCARD }, card };
      eSocket_Send(player.socket, &playCard, sizeof(playCard));

      player.cards[card].kind = None;
   }
   else
      Server_PlayCard(player.game, player, card);
}

void Player_Ack4Cards(Player * player, int winner, int scores0, int scores1)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &Card *game;

   // ruff.waitingAck = false;

   ruff.lastWinner = winner;
   ruff.lastStart = game.start;
   if(game.played[0].kind != None)
   {
      memcpy(ruff.lastPlayed,game.played, sizeof(Card) * 4);
      memset(game.played,None, sizeof(Card) * 4);
   }

   if(player.socket)
   {
      // Message msg = { sizeof(Message), C2S_ACK4CARDS };
      // eSocket_Send(player.socket, &msg, sizeof(msg));

      game.rounds[game.round].scores[0] = scores0;
      game.rounds[game.round].scores[1] = scores1;
      eWindow_Update(window, null);
      eWindow_Update(ruff.scores, null);
   }
}

void Player_SetName(Player * player, char * name)
{
   Window * window = player.window;
   if(player.socket)
   {
      C2SPlayerName * playerName = malloc(sizeof(C2SPlayerName) + strlen(name));
      playerName.msg.type = C2S_PLAYERNAME;
      playerName.msg.size = sizeof(C2SPlayerName) + strlen(name);
      strcpy(playerName.name, name);
      eSocket_Send(player.socket, playerName, playerName.msg.size);
      free(playerName);
   }
   else
      Server_SetName(player.game, player, name);
}

// SERVER TO CLIENT : Informations
void Player_InformPlayerInfo(Player * player, int who, char *name)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   strcpy(game.players[who].name, name);
   eWindow_Update(window, null);
   eWindow_Update(ruff.scores, null);

   switch(player.type)
   {
      case Remote:
      {
         if(player.socket)
         {
            S2CPlayerInfo * playerInfo = malloc(sizeof(S2CPlayerInfo) + strlen(name));
            playerInfo.msg.type = S2C_PLAYERINFO;
            playerInfo.msg.size = sizeof(S2CPlayerInfo) + strlen(name);
            playerInfo.id = who;
            strcpy(playerInfo.name, name);
            eSocket_Send(player.socket, playerInfo, playerInfo.msg.size);
            free(playerInfo);
         }
         break;
      }
   }
}

void Player_InformStartGame(Player * player)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   int c;
   for(c = 0; c<11; c++)
      player.cards[c].kind = None;
   for(c = 0; c<4; c++)
      game.played[c].kind = None;

   ruff.lastWinner = None;
   ruff.lastStart = None;
   ruff.lastPlayed[0].kind = ruff.lastPlayed[1].kind =
   ruff.lastPlayed[2].kind = ruff.lastPlayed[3].kind = None;
   game.gameStarted = true;
   
   Setup_EnableButtons(ruff.setup);
   eWindow_Update(window, null);
   eWindow_Update(ruff.scores, null);

   ruff.selectedCard = None;
   game.round = 0;

   switch(player.type)
   {
      case Local:
      {
         ruff.playedPlayer = player.id;
         break;
      }
      case Remote:
      {
         Message startGame = { sizeof(Message), S2C_STARTGAME };
         eSocket_Send(player.socket, &startGame, sizeof(startGame));
         break;
      }
   }
   eWindow_Activate(window);
}

void Player_InformStopGame(Player * player)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   game.gameStarted = false;
   eWindow_Destroy(ruff.trump, 0);
   eWindow_Destroy(ruff.bet, 0);

   Setup_EnableButtons(ruff.setup);
   eWindow_Update(window, null);
   eWindow_Update(ruff.scores, null);

   switch(player.type)
   {
      case Remote:
      {
         if(player.socket)
         {
            Message stopGame = { sizeof(Message), S2C_STOPGAME };
            eSocket_Send(player.socket, &stopGame, sizeof(stopGame));
         }
         break;
      }
   }
}

void Player_InformNewRound(Player * player, int r, int shuffle, Card * cards)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   int c;
   Round * round;
   for(c = 0; c<9; c++)
      player.cards[c] = cards[c];
   game.round = r;
   game.betting = true;

   round = &game.rounds[game.round];
   round.bet.howMuch = 0;
   round.bet.trump = None;
   round.bet.player = None;
   round.shuffle = shuffle;
   round.scores[0] = round.scores[1] = 0;

   switch(player.type)
   {
      case Local:
      {
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      }
      case AI:
      {
         AI_InformNewRound(player, r, shuffle, cards);
         break;
      }
      case Remote:
      {
         S2CNewRound newRound = { { sizeof(S2CNewRound), S2C_NEWROUND }, r, shuffle };
         memcpy(newRound.cards, cards, sizeof(newRound.cards));
         eSocket_Send(player.socket, &newRound, sizeof(newRound));
         break;
      }
   }
}

void Player_InformBet(Player * player, int who, int howMuch)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;
   Round * round = &game.rounds[game.round];

   switch(player.type)
   {
      case Local:
      {
         if(howMuch)
         {
            round.bet.player = who;
            round.bet.howMuch = howMuch;
         }
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      }
      case AI:
      {
         AI_InformBet(player, who, howMuch);
         break;
      }
      case Remote:
      {
         S2CBet bet = { { sizeof(S2CBet), S2C_BET}, who, howMuch };
         eSocket_Send(player.socket, &bet, sizeof(bet));
         break;
      }
   }
}

void Player_InformTrump(Player * player, int trump)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;
   Round * round = &game.rounds[game.round];
   game.betting = false;
   switch(player.type)
   {
      case Local:
      {
         round.bet.trump = trump;
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      }
      case AI:
      {
         AI_InformTrump(player, trump);
         break;
      }
      case Remote:
      {
         S2CTrump informTrump = { { sizeof(S2CTrump), S2C_TRUMP}, trump };
         eSocket_Send(player.socket, &informTrump, sizeof(informTrump));
         break;
      }
   }
}

void Player_InformStartHand(Player * player, int start)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case Local:
      {
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         game.start = start;
         break;
      }
      case Remote:
      {
         S2CStartHand startHand = { { sizeof(S2CStartHand), S2C_STARTHAND}, start };
         eSocket_Send(player.socket, &startHand, sizeof(startHand));
         break;
      }
   }
}

void Player_InformCardPlayed(Player * player, int who, int kind, int number)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case Local:
      {
         game.played[who].kind = kind;
         game.played[who].number = number;
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      }
      case AI:
      {
         AI_InformCardPlayed(player, who, kind, number);
         break;
      }
      case Remote:
      {
         S2CCardPlayed cardPlayed = { { sizeof(S2CCardPlayed), S2C_CARDPLAYED}, who, kind, number };
         eSocket_Send(player.socket, &cardPlayed, sizeof(cardPlayed));
         break;
      }
   }
}

void Player_InformEndOfRound(Player * player, int score0, int score1)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;
   switch(player.type)
   {
      case Local:
      {
         Round * round = &game.rounds[game.round];
         round.scores[0] = score0;
         round.scores[1] = score1;
         break;
      }
      case AI:
      {
         AI_InformEndOfRound(player, score0, score1);
         break;
      }
      case Remote:
      {
         S2CEndOfRound endOfRound = { { sizeof(S2CEndOfRound), S2C_ENDOFROUND}, score0, score1 };
         eSocket_Send(player.socket, &endOfRound, sizeof(endOfRound));
         break;
      }
   }
   eWindow_Update(window, null);
   eWindow_Update(ruff.scores, null);
}

// SERVER TO CLIENT : Requests
void Player_RequestBet(Player * player)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case Local:
      {
         char temp[256];

         game.turn = player.id;
         ruff.playedPlayer = player.id;
         ruff.selectedCard = None;

         sprintf(temp, "Your bet, %s?", player.name);
         ruff.bet = eWindow_Create("Bet", 0, ES_CAPTION, window, temp,
            A_CENTER|50, A_CENTER|50, 160, A_CLIENT|80, ID_BET, &ruff.game, 0, null, 0);
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      }
      case AI:
      {
         AI_RequestBet(player);
         break;
      }
      case Remote:
      {
         Message reqBet = { sizeof(Message), S2C_REQBET };
         eSocket_Send(player.socket, &reqBet, sizeof(reqBet));
         break;
      }
   }
}

void Player_RequestTrump(Player * player)
{
   Window * window = player.window;
   Ruff * ruff = window.data;

   switch(player.type)
   {
      case Local:
      {
         char temp[256];

         ruff.playedPlayer = player.id;
         ruff.selectedCard = None;

         sprintf(temp, "Chose your trump, %s?", player.name);
         ruff.trump = eWindow_Create("Trump", 0, ES_CAPTION, window, temp,
            A_CENTER|50, A_CENTER|50, 200, 150, ID_TRUMP, &ruff.game, 0, null, 0);
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      }
      case AI:
         AI_RequestTrump(player);
         break;
      case Remote:
      {
         Message reqTrump = { sizeof(Message), S2C_REQTRUMP };
         eSocket_Send(player.socket, &reqTrump, sizeof(reqTrump));
         break;
      }
   }
}

void Player_RequestCard(Player * player)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case Local:
         ruff.playedPlayer = player.id;
         game.turn = player.id;
         ruff.selectedCard = RUFF_FirstValidCard(&ruff.game, player);
         eWindow_Update(window, null);
         eWindow_Update(ruff.scores, null);
         break;
      case AI:
         AI_RequestCard(player);
         break;
      case Remote:
      {
         Message reqCard = { sizeof(Message), S2C_REQCARD };
         eSocket_Send(player.socket, &reqCard, sizeof(reqCard));
         break;
      }
   }
}

void Player_Request4CardsAck(Player * player, int winner, int scores0, int scores1)
{
   Window * window = player.window;
   Ruff * ruff = window.data;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case Local:
         // ruff.waitingAck = true;
         Player_Ack4Cards(player, winner, scores0, scores1);
         break;
      case AI:
         // ruff.waitingAck = true;
         break;
      case Remote:
      {
         S2CReqAck reqAck = { { sizeof(S2CReqAck), S2C_REQACK }, winner, scores0, scores1 };
         eSocket_Send(player.socket, &reqAck, sizeof(reqAck));
         break;
      }
   }
}
*/         
