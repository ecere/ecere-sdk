import "ruff.ec"

define RUFF_PORT = 3113;

// CLIENT IMPLEMENTATION
class ClientSocket : Socket
{
   Setup setup;
   int OnReceive(const byte * buffer, uint count)
   {
      RuffGame * game = &((Ruff)setup.master).game;

      if(count >= sizeof(Message))
      {
         Message * msg = (Message *)buffer;
         if(count >= msg->size)
         {
            switch(msg->type)
            {
               case S2C_WELCOME:
               {
                  S2CWelcome * welcome = (S2CWelcome *) msg;
                  Player * player = setup.player = &game->players[welcome->id];
                  int c;
                  strcpy(player->name, setup.playerName.contents);
                  player->socket = this;
                  for(c = 0; c<4; c++)
                  {
                     if(c != welcome->id)
                     {
                        game->players[c].type = remotePlayer;
                        setup.playerTypes[c].currentRow = setup.playerTypes[c].FindRow(PlayerType::remotePlayer);
                     }
                  }
                  player->type = local;
                  setup.playerTypes[welcome->id].currentRow = setup.playerTypes[welcome->id].FindRow(PlayerType::local);

                  Player_SetName(player, setup.playerName.contents);
                  break;
               }
               case S2C_PLAYERINFO:
               {
                  S2CPlayerInfo * playerInfo = (S2CPlayerInfo *) msg;
                  Player_InformPlayerInfo(setup.player, (PlayerPosition)playerInfo->id, playerInfo->name);
                  setup.playerNames[playerInfo->id].Clear();
                  setup.playerNames[playerInfo->id].contents = playerInfo->name;
                  break;
               }
               case S2C_STARTGAME:
               {
                  Player_InformStartGame(setup.player);
                  break;
               }
               case S2C_STOPGAME:
               {
                  Player_InformStopGame(setup.player);
                  break;
               }
               case S2C_NEWROUND:
               {
                  S2CNewRound * newRound = (S2CNewRound *) msg;
                  Player_InformNewRound(setup.player, newRound->round, (PlayerPosition)newRound->shuffle, newRound->cards);
                  break;
               }
               case S2C_BET:
               {
                  S2CBet * bet = (S2CBet *) msg;
                  Player_InformBet(setup.player, (PlayerPosition)bet->who, bet->howMuch);
                  break;
               }
               case S2C_TRUMP:
               {
                  S2CTrump * trump = (S2CTrump *) msg;
                  Player_InformTrump(setup.player, (Kind)trump->trump);
                  break;
               }
               case S2C_STARTHAND:
               {
                  S2CStartHand * startHand = (S2CStartHand *) msg;
                  Player_InformStartHand(setup.player, (PlayerPosition)startHand->start);
                  break;
               }
               case S2C_CARDPLAYED:
               {
                  S2CCardPlayed * cardPlayed = (S2CCardPlayed *) msg;
                  Player_InformCardPlayed(setup.player, cardPlayed->id, cardPlayed->kind, cardPlayed->number);
                  break;
               }
               case S2C_ENDOFROUND:
               {
                  S2CEndOfRound * endOfRound = (S2CEndOfRound *) msg;
                  Player_InformEndOfRound(setup.player, endOfRound->score0, endOfRound->score1);
                  break;
               }
               case S2C_REQACK:
               {
                  S2CReqAck * reqAck = (S2CReqAck *) msg;
                  Player_Request4CardsAck(setup.player, (PlayerPosition)reqAck->winner, reqAck->scores0, reqAck->scores1);
                  break;
               }
               case S2C_REQBET:
               {
                  Player_RequestBet(setup.player);
                  break;
               }
               case S2C_REQTRUMP:
               {
                  Player_RequestTrump(setup.player);
                  break;
               }
               case S2C_REQCARD:
               {
                  Player_RequestCard(setup.player);
                  break;
               }
            }
            return msg->size;
         }
      }
      return 0;
   }

   void OnDisconnect(int code)
   {
      RuffGame * game = &((Ruff)setup.master).game;

      if(setup.player)
      {
         Player_InformStopGame(setup.player);
         setup.player->socket = null;
      }

      setup.connected = false;
      setup.player = null;
      setup.EnableButtons();
   }

   void OnConnect()
   {
      setup.connected = true;
      setup.EnableButtons();
   }
}

// SERVER IMPLEMENTATION
class ServerSocket : Socket
{
   Player * player;
   int OnReceive(const byte * buffer, uint count)
   {
      Setup setup = ((ServerService)service).setup;
      RuffGame * game = &((Ruff)setup.master).game;

      if(count >= sizeof(Message))
      {
         Message * msg = (Message *)buffer;
         if(count >= msg->size)
         {
            switch(msg->type)
            {
               case C2S_PLAYERNAME:
               {
                  C2SPlayerName * playerName = (C2SPlayerName *)msg;
                  Server_SetName(game, player, playerName->name);
                  setup.playerNames[player->id].Clear();
                  setup.playerNames[player->id].contents = playerName->name;
                  break;
               }
               case C2S_PLACEBET:
               {
                  C2SPlaceBet * placeBet = (C2SPlaceBet *)msg;
                  Server_PlaceBet(game, player, placeBet->bet);
                  break;
               }
               case C2S_CHOSETRUMP:
               {
                  C2SChoseTrump * trump = (C2SChoseTrump *)msg;
                  Server_ChoseTrump(game, player, (Kind)trump->trump);
                  break;
               }
               case C2S_PLAYCARD:
               {
                  C2SPlayCard * playCard = (C2SPlayCard *)msg;
                  Server_PlayCard(game, player, playCard->card);
                  break;
               }
               //case C2S_ACK4CARDS: { Server_Ack4Cards(game, player); break; }

            }
            return msg->size;
         }
      }
      return 0;
   }

   void OnDisconnect(int code)
   {
      Setup setup = ((ServerService)service).setup;
      RuffGame * game = &((Ruff)setup.master).game;

      player->socket = null;

      Server_StopGame(game);

      setup.EnableButtons();
   }
}

class ServerService : Service
{
   Setup setup;

   void OnAccept()
   {
      RuffGame * game = &((Ruff)setup.master).game;
      Player * player = null;

      PlayerPosition c;
      for(c = 0; c<(PlayerPosition)4; c++)
      {
         player = &game->players[c];
         if(player->type == remotePlayer && !player->socket)
            break;
      }
      // No more room...
      if(player)
      {
         S2CWelcome welcome = { sizeof(S2CWelcome), S2C_WELCOME, (int)c };
         ServerSocket socket { this, player = player };
         player->socket = socket;

         socket.Send(welcome, sizeof(welcome));
         for(c = 0; c<(PlayerPosition)4; c++)
            if(c != player->id)
               Player_InformPlayerInfo(player, c, game->players[c].name);
      }
      setup.EnableButtons();
   }
}

class Setup : Window
{
   tabCycle = true;
   background = activeBorder;
   showInTaskBar = true;
   minClientSize = Size { 520, 230 };
   borderStyle = fixed, hasVertScroll = true, text = "Configuration", anchor = Anchor { horz = -0.1, vert = 0.3 };
   hasClose = true;

   ClientSocket socket { setup = this };
   ServerService service { setup = this, port = RUFF_PORT };
   bool connected;
   bool hosting;
   Player * player;

   // Server Mode
   EditBox playerNames[4];
   DropBox playerTypes[4];

   // Client Mode
   Button connect
   {
      this, text = "Connect",
      position = Point { 290,130 }, size = Size { 100 }, hotKey = altC;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         socket.Connect(ipAddress.contents, RUFF_PORT);
         EnableButtons();
         master.Update(null);
         return true;
      }
   };
   Button disconnect
   {
      this, text = "Disconnect",
      position = Point { 400,130 }, size = Size { 100 }, hotKey = altD;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         socket.Disconnect(0);
         EnableButtons();
         master.Update(null);
         return true;
      }
   };

   EditBox ipAddress
   {
      this, text = "IP Address",
      position = Point { 290,50 }, size = Size { 192 }, hotKey = altI,
      //contents = "localhost"
      contents = "kitana.dyndns.org"
   };
   Label ipLabel
   {
      this, labeledWindow = ipAddress, position = Point { 290, 30 }
   };

   Label connectGroup
   {
      this, isGroupBox = true, text = "Connect to server",
      position = Point { 280,10 }, size = Size { 230,155 }
   };

   bool PlayerNamedChanged(EditBox editBox)
   {
      RuffGame * game = &((Ruff)master).game;
      Player * player = &game->players[editBox.id];
      Server_SetName(game, player, editBox.contents);
      EnableButtons();
      master.Update(null);
      return true;
   }

   bool PlayerTypeSelect(DropBox dropBox, DataRow row, Modifiers mods)
   {
      RuffGame * game = &((Ruff)master).game;
      Player * player = &game->players[dropBox.id];
      int p;

      player->type = (PlayerType)dropBox.GetTag();
      for(p = 0; p<4; p++)
         if(game->players[p].type == remotePlayer)
            break;

      // Stop server if no more remote player...
      if(p == 4 && hosting) stopServer.NotifyClicked(this, stopServer, 0,0, mods);
      EnableButtons();
      master.Update(null);
      return true;
   }

   EditBox playerName
   {
      this, text = "Player Name",
      position = Point { 290,100 }, size = Size { 140 }, hotKey = altN,
      contents = "Richard";

      bool NotifyModified(EditBox editBox)
      {
         if(connected && player)
         {
            // Send the new name...
            Player_SetName(player, playerName.contents);
         }
         EnableButtons();
         master.Update(null);
         return true;
      }
   };
   Label playerNameLabel
   {
      this, labeledWindow = playerName, position = Point { 290, 80 }
   };

   Button startGame
   {
      this, isDefault = true, text = "Start Game",
      position = Point { 290,170 }, size = Size { 100 }, hotKey = altG;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         RuffGame * game = &((Ruff)master).game;

         Server_StartGame(game);
         //master.Activate();

         EnableButtons();
         master.Update(null);
         return true;
      }
   };
   Button stopGame
   {
      this, text = "Stop Game", position = Point { 400,170 }, size = Size { 100 }, hotKey = altG;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         RuffGame * game = &((Ruff)master).game;

         Server_StopGame(game);
         EnableButtons();
         master.Update(null);
         return true;
      }
   };
   Button startServer
   {
      this, text = "Start Server",
      position = Point { 290,200 }, size = Size { 100 }, hotKey = altS;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         service.Start();
         hosting = true;
         EnableButtons();
         master.Update(null);
         return true;
      }
   };

   Button stopServer
   {
      this, text = "Stop Server",
      position = Point { 400,200 }, size = Size { 100 }, hotKey = altS;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         service.Stop();
         hosting = false;
         EnableButtons();
         master.Update(null);
         return true;
      }
   };

   void EnableButtons()
   {
      RuffGame * game = &((Ruff)master).game;
      int c;
      bool readyToStart = true;

      for(c = 0; c<4; c++)
      {
         Player * player = &game->players[c];

         playerNames[c].disabled = connected || (hosting && player->type == remotePlayer);
         playerTypes[c].disabled = connected || game->gameStarted || player->socket;

         if(player->type == remotePlayer && !player->socket && !connected)
            readyToStart = false;
      }

      if(!game->gameStarted)
      {
         stopGame.disabled = true;
         startGame.disabled = !readyToStart || connected;
      }
      else
      {
         stopGame.disabled = connected;
         startGame.disabled = true;
      }

      stopServer.disabled = !hosting;
      disconnect.disabled = !connected && !socket.connected;
      startServer.disabled = hosting || readyToStart;

      if(hosting || connected || game->gameStarted || socket.connected)
      {
         connect.disabled = true;
         ipAddress.disabled = true;
         connectGroup.disabled = true;
      }
      else
      {
         connect.disabled = false;
         ipAddress.disabled = false;
         connectGroup.disabled = false;
      }
      playerName.disabled = hosting;

      // For players disabled labels
      Update(null);
   }

   bool OnCreate()
   {
      RuffGame * game = &((Ruff)master).game;
      int c;

      game->players[0].game = game->players[1].game = game->players[2].game = game->players[3].game = game;
      game->players[0].type = local;
      game->players[1].type = ai;
      game->players[2].type = ai;
      game->players[3].type = ai;
      game->players[0].id = bottom;
      game->players[1].id = left;
      game->players[2].id = top;
      game->players[3].id = right;
      strcpy(game->players[0].name, "You");
      strcpy(game->players[1].name, "Georges");
      strcpy(game->players[2].name, "Bryan");
      strcpy(game->players[3].name, "Arnold");
      game->players[0].ruff = game->players[1].ruff =
      game->players[2].ruff = game->players[3].ruff = (Ruff)master;

      playerNames[0] = EditBox { this, text = "Player 1", NotifyModified = PlayerNamedChanged,
         position = Point { 10,30 }, size = Size { 140 }, id = 0, hotKey = alt1 };

      playerTypes[0] = DropBox { this, position = Point { 160,30 }, id = 0, NotifySelect = PlayerTypeSelect };

      playerNames[1] = EditBox { this, text = "Player 2", NotifyModified = PlayerNamedChanged,
         position = Point { 10,80 }, size = Size { 140 }, id = 1, hotKey = alt2 };
      playerTypes[1] = DropBox { this, position = Point { 160,80 }, id = 1, NotifySelect = PlayerTypeSelect };

      playerNames[2] = EditBox { this, text = "Player 3", NotifyModified = PlayerNamedChanged,
         position = Point { 10,130 }, size = Size { 140 }, id = 2, hotKey = alt3 };
      playerTypes[2] = DropBox { this, position = Point { 160,130 }, id = 2, NotifySelect = PlayerTypeSelect };

      playerNames[3] = EditBox { this, text = "Player 4", NotifyModified = PlayerNamedChanged,
         position = Point { 10,180 }, size = Size { 140 }, id = 3, hotKey = alt4 };
      playerTypes[3] = DropBox { this, position = Point { 160,180 }, id = 3, NotifySelect = PlayerTypeSelect };

      Label { this, position = Point { 10,10 }, labeledWindow = playerNames[0] };
      Label { this, position = Point { 10,60 }, labeledWindow = playerNames[1] };
      Label { this, position = Point { 10,110 }, labeledWindow = playerNames[2] };
      Label { this, position = Point { 10,160 }, labeledWindow = playerNames[3] };

      for(c = 0; c<4; c++)
      {
         DataRow row;

         incref playerNames[c];
         incref playerTypes[c];

         playerTypes[c].AddField(DataField { "char *" });
         row = playerTypes[c].AddRow();
         row.tag = PlayerType::local;
         row.SetData(null, "Local");
         if(!c) playerTypes[c].currentRow = row;

         row = playerTypes[c].AddRow();
         row.tag = PlayerType::ai;
         if(c)
            playerTypes[c].currentRow = row;
         row.SetData(null, "Computer");

         row = playerTypes[c].AddRow();
         row.tag = PlayerType::remotePlayer;
         row.SetData(null, "Remote");

         playerNames[c].contents = game->players[c].name;
      }
      EnableButtons();
      return true;
   }

   void OnDestroy()
   {
      master.Destroy(0);
      service.Stop();
      if(socket.connected)
         socket.Disconnect(0);
   }

   ~Setup()
   {
      int c;
      for(c = 0; c<4; c++)
      {
         delete playerNames[c];
         delete playerTypes[c];
      }
   }
}
