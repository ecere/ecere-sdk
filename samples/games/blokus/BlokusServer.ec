import "blokus"

// FOR COMMUNICATION //////////////////////////////////////////
public struct GameInfo
{
   char players[MaxPlayers][256];
   int numPlayers;
   PlayerColor firstColor;

   void OnSerialize(SerialBuffer buffer)
   {
      buffer.Serialize((StaticString)players[0]);
      buffer.Serialize((StaticString)players[1]);
      buffer.Serialize((StaticString)players[2]);
      buffer.Serialize((StaticString)players[3]);
      buffer.Serialize(numPlayers);
      buffer.Serialize(firstColor);
   }

   void OnUnserialize(SerialBuffer buffer)
   {
      buffer.Unserialize((StaticString)players[0]);
      buffer.Unserialize((StaticString)players[1]);
      buffer.Unserialize((StaticString)players[2]);
      buffer.Unserialize((StaticString)players[3]);
      buffer.Unserialize(numPlayers);
      buffer.Unserialize(firstColor);
   }
};

class Player
{
   ServerConnection connection;
   int id;
   char * name;
   PlayerColor firstColor;

   ~Player()
   {
      delete name;
   }
};

Player serverPlayers[MaxPlayers];
static bool gameStarted;

static BlokusGameState gameState;

void StartGame()
{
   int c;

   gameState.numPlayers = 0;
   for(c = 0; c<MaxPlayers; c++)
      if(serverPlayers[c])
         gameState.numPlayers++;

   if(gameState.numPlayers > 0)
   {
      GameInfo gameInfo { };

      gameState.NewGame();
      gameStarted = true;

      strcpy(gameInfo.players[0], serverPlayers[0] ? serverPlayers[0].name : "");
      strcpy(gameInfo.players[1], serverPlayers[1] ? serverPlayers[1].name : "");
      strcpy(gameInfo.players[2], serverPlayers[2] ? serverPlayers[2].name : "");
      strcpy(gameInfo.players[3], serverPlayers[3] ? serverPlayers[3].name : "");

      gameInfo.numPlayers = gameState.numPlayers;

      for(c = 0; c<MaxPlayers; c++)
         if(serverPlayers[c])
         {
            serverPlayers[c].firstColor = (PlayerColor)c;
            gameInfo.firstColor = serverPlayers[c].firstColor;
            serverPlayers[c].connection.GameStarted(gameInfo);
         }
   }
}

void KickEveryoneOut()
{
   int c;
   for(c = 0; c<MaxPlayers; c++)
   {
      if(serverPlayers[c])
      {
         DCOMServerObject object = (DCOMServerObject)serverPlayers[c].connection._vTbl[-1];
         object.serverSocket.Disconnect(0);
         delete serverPlayers[c];
      }
   }
}

void EndGame()
{
   if(gameStarted)
   {
      int c;
      for(c = 0; c<MaxPlayers; c++)
      {
         if(serverPlayers[c])
            serverPlayers[c].connection.GameEnded();
      }
      gameStarted = false;
   }
}

//////////////////////////////////////////
remote class ServerConnection
{
public:
   // Remote Functions
   Player player;

   ~ServerConnection()
   {
      if(player)
      {
         delete serverPlayers[player.id];
         delete player;
         EndGame();
      }
   }

   int Join()
   {
      int result = -1;
      if(!gameStarted)
      {
         int c;
         for(c = 0; c<MaxPlayers; c++)
         {
            if(!serverPlayers[c])
               break;
         }
         if(c < MaxPlayers)
         {
            player = serverPlayers[c] = Player { id = c };
            player.connection = this;
            incref player;
            incref serverPlayers[c];
            result = c;
         }
      }
      return result;
   }

   bool SetName(const String name)
   {
      if(player)
      {
         player.name = CopyString(name);
         if(!blokus.scoreFields[player.id])
         {
            blokus.scoreFields[player.id] = DataField { dataType = class(int), header = name, width = 40 };
            blokus.scores.AddField(blokus.scoreFields[player.id]);
         }
         blokus.scoreFields[player.id].header = name;
      }
      return true;
   }

   bool PlayPiece(int piece, int direction, bool flip, int bx, int by)
   {
      if(player &&
         (gameState.numPlayers == 1 || gameState.colorTurn == player.firstColor ||
         (gameState.numPlayers == 2 && gameState.colorTurn == player.firstColor + 2) ||
         (gameState.numPlayers == 3 && gameState.colorTurn == green && gameState.rotatingColor == player.firstColor)))
      {
         if(gameState.ValidMove(piece, direction, flip, bx, by))
         {
            int c;
            PlayerColor moveColor = gameState.colorTurn;

            gameState.PlayMove(piece, direction, flip, bx, by);
            for(c = 0; c<MaxPlayers; c++)
               if(serverPlayers[c])
                  serverPlayers[c].connection.MovePlayed(moveColor, piece, direction, flip, bx, by);
            return true;
         }
      }
      return false;
   }

   bool Pass()
   {
      if(player &&
         (gameState.numPlayers == 1 || gameState.colorTurn == player.firstColor ||
         (gameState.numPlayers == 2 && gameState.colorTurn == player.firstColor + 2) ||
         (gameState.numPlayers == 3 && gameState.colorTurn == green && gameState.rotatingColor == player.firstColor)))
      {
         int c;
         PlayerColor moveColor = gameState.colorTurn;

         // TODO: Check if we can pass any time?
         gameState.Pass();

         for(c = 0; c<MaxPlayers; c++)
            if(serverPlayers[c])
               serverPlayers[c].connection.Passed(moveColor);
         return true;
      }
      return false;
   }

   virtual void MovePlayed(PlayerColor player, int pieceType, int direction, bool flip, int x, int y);
   virtual void Passed(PlayerColor player);
   virtual void GameStarted(GameInfo gameInfo);
   virtual void GameEnded();
}
