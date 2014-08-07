import "ecere"

define spacing = 20;
define lineWidth = 10;
define mastery = 97;

define noAvailableMove = -100;

enum TTTSquare { _, X, O };

TTTSquare board[3][3];

class TicTacToe : Window
{
   caption = "TicTacToe";
   background = white;
   hasClose = true;
   clientSize = { 400, 400 };

   FontResource tttFont { "Comic Sans MS", 50, bold = true, window = this };

   TTTSquare turn; turn = X;

   TicTacToe()
   {
      RandomSeed((uint)(((uint64)(GetTime() * 1000)) & MAXDWORD));
   }

   TTTSquare FindTicTacToe(TTTSquare state[3][3])
   {
      int i;

      // Diagonal '\'
      if(state[0][0] && state[0][0] == state[1][1] && state[1][1] == state[2][2])
         return state[0][0];
      // Diagonal '/'
      if(state[2][0] && state[2][0] == state[1][1] && state[1][1] == state[0][2])
         return state[2][0];

      for(i = 0; i < 3; i++)
      {
         // Horizontal
         if(state[i][0] && state[i][0] == state[i][1] && state[i][1] == state[i][2])
            return state[i][0];
         // Vertical
         if(state[0][i] && state[0][i] == state[1][i] && state[1][i] == state[2][i])
            return state[0][i];
      }
      return 0;
   }

   float BestMove(TTTSquare t, TTTSquare state[3][3], Point bestMove)
   {
      static int level = 0;
      int x, y;
      float bestRating = noAvailableMove;
      int filled = 0;
      bool couldTicTacToe = false;
      Point badMove; /* A player is likely to see the opponent's tic tac toe in his own tic tac toe spot */
      Point moves[9];
      int numMoves = 0;

      level++;
      for(y = 0; y < 3; y++)
         for(x = 0; x < 3; x++)
            if(state[y][x]) filled++;

      for(y = 0; y < 3; y++)
      {
         for(x = 0; x < 3; x++)
         {
            if(!state[y][x])
            {
               float newRating;
               state[y][x] = t;
               if(FindTicTacToe(state))
                  newRating = 1;
               else
               {
                  Point move;
                  newRating = BestMove((t == X) ? O : X, state, move);
                  if(newRating == noAvailableMove)
                     newRating = 0;
                  newRating = -newRating/2;
                  if(newRating <= -0.25f)
                  {
                     badMove = move;
                     couldTicTacToe = true;
                  }
               }

               state[y][x] = 0;
               if(newRating > bestRating)
               {
                  bestRating = newRating;
                  bestMove = { x, y };
                  numMoves = 1;
                  moves[0] = bestMove;
               }
               else if(level == 1 && newRating == bestRating)
                  moves[numMoves++] = { x, y };
            }
         }
      }
      if(GetRandom(0, 60) > mastery || (filled > 4 && filled < 7 && couldTicTacToe && (bestMove.x != badMove.x || bestMove.y != badMove.y)))
      {
         if(level == 2 && GetRandom(0, 25) > mastery)
            bestRating = -0.5f;
         if(level == 4 && GetRandom(0, 100) > mastery)
            bestRating = -0.125f;
      }
      if(level == 1 && numMoves > 1)
         bestMove = moves[GetRandom(0, numMoves-1)];
      level--;
      return bestRating;
   }

   void MovePlayed()
   {
      TTTSquare result = FindTicTacToe(board);
      if(result)
      {
         MessageBox { caption = "Tic Tac Toe!", contents = (result == X ? "You win!" : "Computer wins!") }.Modal();
         turn = 0;
      }
      else if(turn == X)
      {
         // Computer plays
         Point move { };
         turn = O;
         if(BestMove(turn, board, move) != noAvailableMove)
         {
            board[move.y][move.x] = O;
            MovePlayed();
         }
         else
            turn = 0;
      }
      else
         turn = X;
   }

   void DrawPieces(Surface surface)
   {
      int sw = (clientSize.w - 2*spacing) / 3;
      int sh = (clientSize.h - 2*spacing) / 3;
      int x, y;
      int Xw, Xh, Ow, Oh;

      surface.font = tttFont.font;

      surface.TextExtent("X", 1, &Xw, &Xh);
      surface.TextExtent("O", 1, &Ow, &Oh);

      for(y = 0; y < 3; y++)
      {
         for(x = 0; x < 3; x++)
         {
            TTTSquare p = board[y][x];
            if(p == X)
            {
               surface.foreground = green;
               surface.WriteText(spacing + sw * x + sw / 2 - Xw/2, spacing + sh * y + sh / 2 - Xh/2, "X", 1);
            }
            else if(p == O)
            {
               surface.foreground = red;
               surface.WriteText(spacing + sw * x + sw / 2 - Ow/2, spacing + sh * y + sh / 2 - Oh/2, "O", 1);
            }
         }
      }
   }

   void OnRedraw(Surface surface)
   {
      int sw = (clientSize.w - 2*spacing) / 3;
      int sh = (clientSize.h - 2*spacing) / 3;

      surface.background = blue;

      // Vertical lines
      surface.Area(spacing + sw   - lineWidth / 2, spacing, spacing + sw   + lineWidth / 2-1, clientSize.h - spacing - 1);
      surface.Area(spacing + sw*2 - lineWidth / 2, spacing, spacing + sw*2 + lineWidth / 2-1, clientSize.h - spacing - 1);

      // Horizontal lines
      surface.Area(spacing, spacing + sh   - lineWidth / 2, clientSize.w - spacing - 1, spacing + sh   + lineWidth / 2-1);
      surface.Area(spacing, spacing + sh*2 - lineWidth / 2, clientSize.w - spacing - 1, spacing + sh*2 + lineWidth / 2-1);

      DrawPieces(surface);
   }

   bool OnLeftButtonDown(int mx, int my, Modifiers mods)
   {
      if(turn == X && mx >= spacing && mx < clientSize.w - spacing && my >= spacing && my < clientSize.h - spacing)
      {
         int sw = (clientSize.w - 2*spacing) / 3;
         int sh = (clientSize.h - 2*spacing) / 3;
         mx -= spacing;
         my -= spacing;
         if((mx < sw   - lineWidth / 2 || mx > sw   + lineWidth / 2) && /* 1st vertical line */
            (mx < sw*2 - lineWidth / 2 || mx > sw*2 + lineWidth / 2) && /* 2nd vertical line */
            (my < sh   - lineWidth / 2 || my > sh   + lineWidth / 2) && /* 1st horizontal line */
            (my < sh*2 - lineWidth / 2 || my > sh*2 + lineWidth / 2))   /* 2nd horizontal line */
         {
            int x = mx / sw;
            int y = my / sh;
            if(!board[y][x])
            {
               board[y][x] = X;
               Update(null);
               MovePlayed();
            }
         }
      }
      return true;
   }

   Button btnReset
   {
      this, font = { "Arial", 12 }, caption = "Reset", position = { 8, 8 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         memset(board, 0, sizeof(board));
         turn = X;
         Update(null);
         return true;
      }
   };
}

TicTacToe mainForm {};
