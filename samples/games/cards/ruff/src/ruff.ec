import "ecere"

import "ai.ec"
import "server.ec"
import "scores.ec"
import "setup.ec"
import "bet.ec"
import "trump.ec"

enum Kind : byte { clubs, diamonds, hearts, spades, none = 0xFF };
enum Number : byte { _5, _7, _8, _9, _10, jack, queen, king, ace };

struct Card // class Card : uint16
{
   Number number;
   Kind kind;
} Card;

enum PlayerPosition : byte { bottom, left, top, right, none = 0xFF };

// For selectedCard
define None = 0xFF;

define RUFF = 0xFF;

enum PlayerType { local = 1, remotePlayer, ai };

struct Bet
{
   PlayerPosition player;
   // Range: 40-100, 0xFF: "ruff"
   int howMuch;
   Kind trump;
};

struct Round
{
	PlayerPosition shuffle;
	Bet bet;
	int scores[2];
};

struct Player
{
   RuffGame * game;
   PlayerPosition id;
   PlayerType type;
   Socket socket;
   Ruff ruff;

   // Cards in hand
   Card cards[11];
   // Name of the player
   char name[20];

   // AI Player
   bool left[4][9];
   bool trumpLeft[4];
   Kind trump;
};

define MAXROUNDS = 256;

define LT_RED  = Color { 255, 85, 85 };
define LT_BLUE = Color { 85, 85, 255 };

struct RuffGame
{
   Player players[4];

   Round rounds[MAXROUNDS];
   int round;
   int cardSet;   // Which of the 9 cards we're at in this round
   PlayerPosition turn;  // Which player whose turn it is to play
   PlayerPosition start; // Which player put the first card out of 4
   bool betting;
   bool gameStarted;

   Card played[4];
};

define NUMCARDS = 36;

int RUFF_FirstValidCard(RuffGame * game, Player * player)
{
	int c;
	for(c=0; c<9; c++)
		if(RUFF_Legal(game, player, c))
			return c;
   return 0;
}

enum MessageType : byte
{
   S2C_WELCOME        = 1,
   S2C_PLAYERINFO     = 2,
   S2C_CARDPLAYED     = 3,
   S2C_STARTGAME      = 4,
   S2C_STOPGAME       = 5,
   S2C_BET            = 6,
   S2C_TRUMP          = 7,
   S2C_ENDOFROUND     = 8,
   S2C_REQBET         = 9,
   S2C_REQTRUMP       = 10,
   S2C_REQCARD        = 11,
   S2C_REQACK         = 12,
   S2C_NEWROUND       = 13,
   S2C_STARTHAND      = 14,
   C2S_PLAYERNAME     = 20,
   C2S_PLACEBET       = 21,
   C2S_CHOSETRUMP     = 22,
   C2S_PLAYCARD       = 23,
   C2S_ACK4CARDS      = 24
};

struct Message
{
   uint size;
   MessageType type;
};

// SERVER TO CLIENT ( ** SETUP ** )
struct S2CWelcome : Message
{
   int id;
};

struct S2CPlayerInfo : Message
{
   int id;
   byte name[1];
};

struct S2CCardPlayed : Message
{
   int id;
   Kind kind;
   Number number;
};

struct S2CBet : Message
{
   int who;
   int howMuch;
};

struct S2CTrump : Message
{
   int trump;
};

struct S2CEndOfRound : Message
{
   int score0, score1;
};

struct S2CReqAck : Message
{
   int winner;
   int scores0, scores1;
};

struct S2CNewRound : Message
{
   int round;
   int shuffle;
   Card cards[9];
};

struct S2CStartHand : Message
{
   int start;
   int scores[2];
};

// CLIENT TO SERVER ( ** SETUP ** )

struct C2SPlayerName : Message
{
   byte name[1];
};

struct C2SPlaceBet : Message
{
   int bet;
};

struct C2SChoseTrump : Message
{
   int trump;
};

struct C2SPlayCard : Message
{
   int card;
};


// CLIENT TO SERVER
void Player_PlaceBet(Player player, int bet)
{
   if(player.socket)
   {
      C2SPlaceBet placeBet { sizeof(C2SPlaceBet), C2S_PLACEBET, bet };
      player.socket.Send(placeBet, sizeof(placeBet));
   }
   else
      Server_PlaceBet(player.game, player, bet);
}

void Player_ChoseTrump(Player player, Kind trump)
{
   if(player.socket)
   {
      C2SChoseTrump choseTrump { sizeof(C2SChoseTrump), C2S_CHOSETRUMP, trump };
      player.socket.Send(choseTrump, sizeof(choseTrump));
   }
   else
      Server_ChoseTrump(player.game, player, trump);
}

void Player_PlayCard(Player player, int card)
{
   Ruff ruff = player.ruff;

   ruff.selectedCard = None;
   if(player.socket)
   {
      C2SPlayCard playCard { sizeof(C2SPlayCard), C2S_PLAYCARD, card };
      player.socket.Send(playCard, sizeof(playCard));

      player.cards[card].kind = none;
   }
   else
      Server_PlayCard(player.game, player, card);
}

void Player_Ack4Cards(Player player, PlayerPosition winner, int scores0, int scores1)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   // ruff.waitingAck = false;

   ruff.lastWinner = winner;
   ruff.lastStart = game->start;
   if(game->played[0].kind != none)
   {
      CopyBytes(ruff.lastPlayed,game->played, sizeof(Card) * 4);
      FillBytes(game->played, None, sizeof(Card) * 4);
   }

   if(player.socket)
   {
      // Message msg { sizeof(Message), C2S_ACK4CARDS };
      // player.socket.Send(, &msg, sizeof(msg));

      game->rounds[game->round].scores[0] = scores0;
      game->rounds[game->round].scores[1] = scores1;
      ruff.Update(null);
      ruff.scores.Update(null);
   }
}

void Player_SetName(Player player, char * name)
{
   Ruff ruff = player.ruff;
   if(player.socket)
   {
      C2SPlayerName * playerName = (C2SPlayerName *)new byte[sizeof(C2SPlayerName) + strlen(name)];
      playerName->type = C2S_PLAYERNAME;
      playerName->size = sizeof(C2SPlayerName) + strlen(name);
      strcpy(playerName->name, name);
      player.socket.Send(playerName, playerName->size);
      delete playerName;
   }
   else
      Server_SetName(player.game, player, name);
}

// SERVER TO CLIENT : Informations
void Player_InformPlayerInfo(Player player, PlayerPosition who, char *name)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   strcpy(game->players[who].name, name);
   ruff.Update(null);
   ruff.scores.Update(null);

   switch(player.type)
   {
      case remotePlayer:
      {
         if(player.socket)
         {
            S2CPlayerInfo * playerInfo = (S2CPlayerInfo *)new byte[sizeof(S2CPlayerInfo) + strlen(name)];
            playerInfo->type = S2C_PLAYERINFO;
            playerInfo->size = sizeof(S2CPlayerInfo) + strlen(name);
            playerInfo->id = who;
            strcpy(playerInfo->name, name);
            player.socket.Send(playerInfo, playerInfo->size);
            delete playerInfo;
         }
         break;
      }
   }
}

void Player_InformStartGame(Player player)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   int c;
   for(c = 0; c<11; c++)
      player.cards[c].kind = none;
   for(c = 0; c<4; c++)
      game->played[c].kind = none;

   ruff.lastWinner = none;
   ruff.lastStart = none;
   ruff.lastPlayed[0].kind = ruff.lastPlayed[1].kind =
   ruff.lastPlayed[2].kind = ruff.lastPlayed[3].kind = none;
   game->gameStarted = true;
   
   ruff.setup.EnableButtons();
   ruff.Update(null);
   ruff.scores.Update(null);

   ruff.selectedCard = None;
   game->round = 0;

   switch(player.type)
   {
      case local:
      {
         ruff.playedPlayer = player.id;
         break;
      }
      case remotePlayer:
      {
         Message startGame { sizeof(Message), S2C_STARTGAME };
         player.socket.Send(startGame, sizeof(startGame));
         break;
      }
   }
   ruff.Activate();
}

void Player_InformStopGame(Player player)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   game->gameStarted = false;
   ruff.trump.Destroy(0);
   ruff.bet.Destroy(0);

   ruff.setup.EnableButtons();
   ruff.Update(null);
   ruff.scores.Update(null);

   switch(player.type)
   {
      case remotePlayer:
      {
         if(player.socket)
         {
            Message stopGame { sizeof(Message), S2C_STOPGAME };
            player.socket.Send(stopGame, sizeof(stopGame));
         }
         break;
      }
   }
}

void Player_InformNewRound(Player player, int r, PlayerPosition shuffle, Card * cards)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   int c;
   Round * round;
   for(c = 0; c<9; c++)
      player.cards[c] = cards[c];
   game->round = r;
   game->betting = true;

   round = &game->rounds[game->round];
   round->bet.howMuch = 0;
   round->bet.trump = none;
   round->bet.player = none;
   round->shuffle = shuffle;
   round->scores[0] = round->scores[1] = 0;

   switch(player.type)
   {
      case local:
      {
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      }
      case ai:
      {
         AI_InformNewRound(player, r, shuffle, cards);
         break;
      }
      case remotePlayer:
      {
         S2CNewRound newRound { sizeof(S2CNewRound), S2C_NEWROUND, r, shuffle };
         CopyBytes(newRound.cards, cards, sizeof(newRound.cards));
         player.socket.Send(newRound, sizeof(newRound));
         break;
      }
   }
}

void Player_InformBet(Player player, PlayerPosition who, int howMuch)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;
   Round * round = &game->rounds[game->round];

   switch(player.type)
   {
      case local:
      {
         if(howMuch)
         {
            round->bet.player = who;
            round->bet.howMuch = howMuch;
         }
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      }
      case ai:
      {
         AI_InformBet(player, who, howMuch);
         break;
      }
      case remotePlayer:
      {
         S2CBet bet { sizeof(S2CBet), S2C_BET, who, howMuch };
         player.socket.Send(bet, sizeof(bet));
         break;
      }
   }
}

void Player_InformTrump(Player player, Kind trump)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;
   Round * round = &game->rounds[game->round];
   game->betting = false;
   switch(player.type)
   {
      case local:
      {
         round->bet.trump = trump;
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      }
      case ai:
      {
         AI_InformTrump(player, trump);
         break;
      }
      case remotePlayer:
      {
         S2CTrump informTrump { sizeof(S2CTrump), S2C_TRUMP, trump };
         player.socket.Send(informTrump, sizeof(informTrump));
         break;
      }
   }
}

void Player_InformStartHand(Player player, PlayerPosition start)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case local:
      {
         ruff.Update(null);
         ruff.scores.Update(null);
         game->start = start;
         break;
      }
      case remotePlayer:
      {
         S2CStartHand startHand { sizeof(S2CStartHand), S2C_STARTHAND, start };
         player.socket.Send(startHand, sizeof(startHand));
         break;
      }
   }
}

void Player_InformCardPlayed(Player player, int who, Kind kind, Number number)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case local:
      {
         game->played[who].kind = kind;
         game->played[who].number = number;
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      }
      case ai:
      {
         AI_InformCardPlayed(player, who, kind, number);
         break;
      }
      case remotePlayer:
      {
         S2CCardPlayed cardPlayed { sizeof(S2CCardPlayed), S2C_CARDPLAYED, who, kind, number };
         player.socket.Send(cardPlayed, sizeof(cardPlayed));
         break;
      }
   }
}

void Player_InformEndOfRound(Player player, int score0, int score1)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;
   switch(player.type)
   {
      case local:
      {
         Round * round = &game->rounds[game->round];
         round->scores[0] = score0;
         round->scores[1] = score1;
         break;
      }
      case ai:
      {
         AI_InformEndOfRound(player, score0, score1);
         break;
      }
      case remotePlayer:
      {
         S2CEndOfRound endOfRound { sizeof(S2CEndOfRound), S2C_ENDOFROUND, score0, score1 };
         player.socket.Send(endOfRound, sizeof(endOfRound));
         break;
      }
   }
   ruff.Update(null);
   ruff.scores.Update(null);
}

// SERVER TO CLIENT : Requests
void Player_RequestBet(Player player)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case local:
      {
         char temp[256];

         game->turn = player.id;
         ruff.playedPlayer = player.id;
         ruff.selectedCard = None;

         sprintf(temp, "Your bet, %s?", player.name);
         ruff.bet.text = temp;
         ruff.bet.visible = true;
         ruff.bet.Create();
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      }
      case ai:
      {
         AI_RequestBet(player);
         break;
      }
      case remotePlayer:
      {
         Message reqBet { sizeof(Message), S2C_REQBET };
         player.socket.Send(reqBet, sizeof(reqBet));
         break;
      }
   }
}

void Player_RequestTrump(Player player)
{
   Ruff ruff = player.ruff;

   switch(player.type)
   {
      case local:
      {
         char temp[256];

         ruff.playedPlayer = player.id;
         ruff.selectedCard = None;

         sprintf(temp, "Chose your trump, %s?", player.name);
         ruff.trump.text = temp;
         ruff.trump.Create();
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      }
      case ai:
         AI_RequestTrump(player);
         break;
      case remotePlayer:
      {
         Message reqTrump { sizeof(Message), S2C_REQTRUMP };
         player.socket.Send(reqTrump, sizeof(reqTrump));
         break;
      }
   }
}

void Player_RequestCard(Player player)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case local:
         ruff.playedPlayer = player.id;
         game->turn = player.id;
         ruff.selectedCard = RUFF_FirstValidCard(game, player);
         ruff.Update(null);
         ruff.scores.Update(null);
         break;
      case ai:
         AI_RequestCard(player);
         break;
      case remotePlayer:
      {
         Message reqCard { sizeof(Message), S2C_REQCARD };
         player.socket.Send(reqCard, sizeof(reqCard));
         break;
      }
   }
}

void Player_Request4CardsAck(Player player, PlayerPosition winner, int scores0, int scores1)
{
   Ruff ruff = player.ruff;
   RuffGame * game = &ruff.game;

   switch(player.type)
   {
      case local:
         // ruff.waitingAck = true;
         Player_Ack4Cards(player, winner, scores0, scores1);
         break;
      case ai:
         // ruff.waitingAck = true;
         break;
      case remotePlayer:
      {
         S2CReqAck reqAck { sizeof(S2CReqAck), S2C_REQACK, winner, scores0, scores1 };
         player.socket.Send(reqAck, sizeof(reqAck));
         break;
      }
   }
}


class Ruff : Window
{
   text = "The Ruff Card Game";
   borderStyle = sizable;
   hasMaximize = true, hasMinimize = true, hasClose = true;
   anchor = Anchor { horz = -0.1, vert = -0.1 };
   size = Size { 620, 460 };
   background = Color { 0, 128, 0 };

   // State of the game
   RuffGame game;

   // Windows
   Scores scores
   {
      master = this
   };
   Setup setup
   {
      master = this
   };

   BetDialog bet
   {
      parent = this,
      font = FontResource { "Tahoma", 8.25f },
      anchor = Anchor { horz = 25, vert = 55 },
      autoCreate = false;
      void NotifyDestroyed(Window window, DialogResult result)
      {
         Player * player = &game.players[playedPlayer];
         if(game.gameStarted)
            Player_PlaceBet(player, result);
      }
   };

   TrumpDialog trump
   {
      parent = this,
      font = FontResource { "Tahoma", 8.25f },
      autoCreate = false;
      anchor = Anchor { horz = 25, vert = 55 };
      void NotifyDestroyed(Window window, DialogResult result)
      {
         Player * player = &game.players[playedPlayer];
         if(game.gameStarted)
            Player_ChoseTrump(player, (Kind)result);
      }
   };

   // Bitmaps
   Bitmap bitmapCards[52];
   Bitmap cardBack {};
   font = FontResource { "Comic Sans MS Bold", 16 };

   // Playing Interface
   Card lastPlayed[4];
   PlayerPosition playedPlayer;
   PlayerPosition lastWinner;
   PlayerPosition lastStart;
   int selectedCard;
   bool waitingAck;

   // CLIENT INTERFACE
   void OnRedraw(Surface surface)
   {
      Player * player = (playedPlayer != none) ? &game.players[playedPlayer] : null;
      Round * round = &game.rounds[game.round];
      PlayerPosition c;
      static const Point playedPos[] = { { 295, 325 }, { 172, 225 }, { 295, 125 }, { 417, 225 } };
      static const Point lastPlayedPos[] = { { 275, 305 }, { 152, 205 }, { 275, 105 }, { 397, 205 } };
      static const Point namePos[] = { { 200, 362 }, { 100, 257 }, { 440, 150 }, { 540, 257 } };

      if(game.gameStarted)
      {
         if(player)
         {
            int c;
            // The player's hand
            for(c=0; c<11; c++)
            {
   		      if(player->cards[c].kind != none)
   		      {
                  if(c != selectedCard)
                     RUFF_DrawCard(surface, c * 20 + player->cards[c].kind * 71, 20, &player->cards[c]);
   		      }
            }

            // The selected card
            if(selectedCard != None && player->cards[selectedCard].kind != none)
               RUFF_DrawCard(surface, 
                  selectedCard * 20 + player->cards[selectedCard].kind * 71, 0, 
                  &player->cards[selectedCard]);
         }

         // This round's bet and trump
         if(round->bet.howMuch)
         {
            surface.SetForeground((round->bet.player == playedPlayer) ? LT_RED : black);
            surface.CenterTextf(555,105,"%d",round->bet.howMuch);
            if(round->bet.trump != none)
            {
               Card card;
               card.kind = round->bet.trump;
               card.number = ace;
               RUFF_DrawCard(surface, 520, 0, &card);
            }
            surface.CenterTextf(555,128,game.players[round->bet.player].name);
         }

         // 4 Cards Played
         for(c = 0; c<4; c++)
         {
            if(lastPlayed[c].kind != none)
               RUFF_DrawCard(surface, lastPlayedPos[c].x, lastPlayedPos[c].y, &lastPlayed[c]);

            if(game.played[c].kind != none)
               RUFF_DrawCard(surface, playedPos[c].x, playedPos[c].y, &game.played[c]);
            else
               RUFF_DrawCard(surface, playedPos[c].x, playedPos[c].y, null);

            if(!game.betting && c == game.start)
            {
               surface.SetForeground(LT_RED);
               surface.CenterTextf(playedPos[c].x + 10, playedPos[c].y + 50, "S");
            }
            if(c == lastWinner)
            {
               surface.SetForeground(LT_BLUE);
               surface.CenterTextf(lastPlayedPos[c].x + 10, lastPlayedPos[c].y + 70, "W");
            }
            if(c == lastStart)
            {
               surface.SetForeground(LT_RED);
               surface.CenterTextf(lastPlayedPos[c].x + 10, lastPlayedPos[c].y + 50, "S");
            }
         }
      }

      for(c = 0; c<4; c++)
      {
         surface.SetForeground((playedPlayer == c) ? LT_RED : black);
         surface.CenterTextf(namePos[c].x, namePos[c].y,game.players[c].name);
      }
   }
   
   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(selectedCard != None && playedPlayer != none)
      {
         Player * player = &game.players[playedPlayer];
         int c;

         for(c=8; c>=0; c--)
         {
            int start = c * 20 + player->cards[c].kind * 71;
            if(y>=0 && y<96+20 && x>=start && x<start+71)
            {
   			   if(RUFF_Legal(game, player,c))
   				   selectedCard=c;
               break;
            }
         }
         Update(null);
      }
      else if(waitingAck)
      {
         Player * player = &game.players[game.turn];
         // Player_Ack4Cards(player);
      }
      return true;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      if(selectedCard != None && playedPlayer != none)
      {
         Player * player = &game.players[playedPlayer];
         int c;

         for(c=8; c>=0; c--)
         {
            int start = c * 20 + player->cards[c].kind * 71;
            if(y>=0 && y<96+20 && x>=start && x<start+71)
            {
   			   if(RUFF_Legal(game, player,c))
               {
   				   selectedCard = c;
                  Player_PlayCard(player, c);
               }
               break;
            }
         }
         Update(null);
      }
      return false;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(selectedCard != None && playedPlayer != none)
      {
         Player * player = &game.players[playedPlayer];
         switch((SmartKey)key)
         {
            case enter:
               Player_PlayCard(player, selectedCard);
               Update(null);
               break;
   		   case right:
            {
               int c;
   			   for(c=0; c<9; c++)
   			   {
   				   selectedCard++;
   				   if(selectedCard==9) selectedCard=0;
   				   if(RUFF_Legal(game, player, selectedCard))
   				   {
   					   Update(null);
   					   break;
   				   }
   			   }
   			   break;
            }
   		   case left:
            {
               int c;
   			   for(c=0; c<9; c++)
   			   {
   				   selectedCard--;
   				   if(selectedCard==-1) selectedCard=8;
   				   if(RUFF_Legal(game, player,selectedCard))
   				   {
   					   Update(null);
   					   break;
   				   }
   			   }
   			   break;
            }
         }
      }
      else if(waitingAck && (SmartKey)key == enter)
      {
         Player * player = &game.players[game.turn];
         // Player_Ack4Cards(player);
      }
      return true;
   }

   bool OnPostCreate()
   {
      playedPlayer = none;
      return true;
   }

   bool OnLoadGraphics()
   {
      Bitmap ptrCardLoad {};
      if(ptrCardLoad.Load(":cards.pcx",null,null))
      {
         int i;
         cardBack.LoadT(":ecereCard.png",null,displaySystem);      
         for(i=0;i<52;i++)
         {
            bitmapCards[i] = Bitmap {};
            bitmapCards[i].Allocate(null,ptrCardLoad.width, ptrCardLoad.height/52,0,pixelFormat8,true);
            CopyBytesBy4(bitmapCards[i].palette, ptrCardLoad.palette, 256);
            bitmapCards[i].Grab(ptrCardLoad,0,(ptrCardLoad.height/52)*i);
            bitmapCards[i].transparent = true;
            bitmapCards[i].MakeDD(displaySystem);  
         }
      }
      delete ptrCardLoad;
      return true;
   }

   void OnUnloadGraphics()
   {
      int i;
      for(i=0;i<52;i++)
         delete bitmapCards[i];
      cardBack.Free();
   }

   void RUFF_DrawCard(Surface surface, int x, int y, Card card)
   {
      Bitmap bitmap;
      static const int cardNo[9]=
      {
         // 5, 7, 8, 9,10,  J,  Q,  K, A
         4, 6, 7, 8, 9, 10, 11, 12, 0
      };
      
      if(card != null)
         bitmap = bitmapCards[cardNo[card.number] * 4 + card.kind];
      else
         bitmap = cardBack;

      surface.Blit(bitmap, x, y, 0,0, bitmap.width,bitmap.height);
   }
}

RuffApp app;

class RuffApp : GuiApplication
{
   Ruff ruff {};
   //fullScreen = true;
   bool Init()
   {
      app = this;
      return true;
   }
}
