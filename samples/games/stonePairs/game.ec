import "ecere"

enum Stone { none, black, white };

int symbols[4][4] =
{
   { 0, 1, 2, 3 },
   { 4, 5, 6, 1 },
   { 6, 7, 5, 4 },
   { 2, 3, 0, 7 }
};

class StonePairsGame
{
   int movesLeft;
   movesLeft = 1;
   Stone turn;
   bool takeOut;
   Stone winner;
   int numStones[Stone];
   Stone stones[4][4];
   turn = white;
   int numPlayers;

   void NewGame()
   {
      numStones[black] = 12;
      numStones[white] = 12;
      memset(stones, 0, sizeof(stones));
      turn = white;
      movesLeft = 1;
      winner = none;
      takeOut = false;
   }

   bool ProcessMove(int sx, int sy)
   {
      bool played = false;
      if(takeOut)
      {
         Stone opponent = (turn == white) ? black : white;
         if(stones[sy][sx] == opponent)
         {
            numStones[opponent]++;
            stones[sy][sx] = none;
            takeOut = false;
            played = true;

         }
      }
      else if(movesLeft && !stones[sy][sx])
      {
         int y, i;
         int symbol = symbols[sy][sx];
         if(numStones[turn] > 0)
            numStones[turn]--;

         for(y = 0; y < 4; y++)
         {
            int x;
            for(x = 0; x < 4; x++)
               if((y != sy || x != sx) && symbols[y][x] == symbol)
               {
                  if(stones[y][x] == turn)
                     takeOut = true;
                  break;
               }
         }

         stones[sy][sx] = turn;

         // Check for win
         for(i = 0; i < 4; i++)
         {
            int j;
            for(j = 0; j < 4; j++)
               if(stones[i][j] != turn)
                  break;
            if(j == 4)
               winner = turn;

            for(j = 0; j < 4; j++)
               if(stones[j][i] != turn)
                  break;
            if(j == 4)
               winner = turn;
         }
         for(i = 0; i < 4; i++)
            if(stones[i][i] != turn)
               break;
         if(i == 4)
            winner = turn;

         for(i = 0; i < 4; i++)
            if(stones[3-i][i] != turn)
               break;
         if(i == 4)
            winner = turn;

         played = true;
      }
      if(played)
      {
         if(!takeOut && !--movesLeft && !winner)
         {
            turn = (turn == black) ? white : black;
            movesLeft = 2;
         }
      }
      return played;
   }
}

StonePairsGame game { };

class GameConnection
{
   Stone color;

public:
   Stone Join()
   {
      if(game.numPlayers < 2)
      {
         color = game.numPlayers ? black : white;
         game.numPlayers++;
      }
      return color;
   }

   void NewGame()
   {
      game.NewGame();
   }

   bool Click(int x, int y)
   {
      if(game.turn == color)
         return game.ProcessMove(x, y);
      return false;
   }
}
