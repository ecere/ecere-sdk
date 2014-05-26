import "chess.ec"

struct MoveStack
{
   ChessMove * moves;
   int size, count;
};

define MAXDEPTH = 4;
// define MAXDEPTH = 6;
define MAXDEPTH_PASS2 = 50;

static MoveStack moveStack[MAXDEPTH_PASS2];

void AddMoveToList(MoveStack stack, ChessState state, PieceType type, Player player,
                   int x1, int y1, int x2, int y2)
{
   if(IsMoveValid(x1,y1,x2,y2, state, null, true))
   {
      ChessMove * move;

      if(stack.count + 1 > stack.size)
      {
         stack.size += 10000;
         stack.moves = renew stack.moves ChessMove[stack.size];
      }

      move = &stack.moves[stack.count++];

      move->player = player;
      move->type = type;
      move->x1 = x1;
      move->y1 = y1;
      move->x2 = x2;
      move->y2 = y2;
      // For now queen only...
      move->promotion = Queen;
   }
}

void GeneratePieceMoveList(ChessState state, int x, int y, MoveStack stack)
{
   Piece content = state.board[y][x];
   Player player = content.player;
   PieceType type = content.type;
   int x2,y2;

   switch(type)
   {
      case Pawn:
      {
         int direction = (player == White) ? 1 : -1;

         AddMoveToList(stack, state, type, player, x,y,x,y+direction);

         if((player == White && y == 1) ||
            (player == Black && y == 6))
            AddMoveToList(stack, state, type, player, x,y,x,y+direction*2);

         // Capturing Move (Including en passant)
         if(x > 0)
            AddMoveToList(stack, state, type, player, x,y,x-1,y+direction);
         if(x < 7)
            AddMoveToList(stack, state, type, player, x,y,x+1,y+direction);
         break;
      }
      case Knight:
         AddMoveToList(stack, state, type, player, x,y, x+1,y+2);
         AddMoveToList(stack, state, type, player, x,y, x+2,y+1);
         AddMoveToList(stack, state, type, player, x,y, x+2,y-1);
         AddMoveToList(stack, state, type, player, x,y, x+1,y-2);
         AddMoveToList(stack, state, type, player, x,y, x-1,y-2);
         AddMoveToList(stack, state, type, player, x,y, x-2,y-1);
         AddMoveToList(stack, state, type, player, x,y, x-2,y+1);
         AddMoveToList(stack, state, type, player, x,y, x-1,y+2);
         break;
      case Bishop:
      {
         for(x2 = 0; x2<8; x2++)
         {
            if(x2 != x)
            {
               y2 = y + Abs(x2 - x);
               if(y2 < 8)
                  AddMoveToList(stack, state, type, player, x,y,x2,y2);
               y2 = y - Abs(x2 - x);
               if(y2 >= 0)
                  AddMoveToList(stack, state, type, player, x,y,x2,y2);
            }
         }
         break;
      }
      case Rook:
         for(x2 = 0; x2<8; x2++)
         {
            if(x2 != x)
            {
               AddMoveToList(stack, state, type, player, x,y,x2,y);
            }
         }
         for(y2 = 0; y2<8; y2++)
         {
            if(y2 != y)
            {
               AddMoveToList(stack, state, type, player, x,y,x,y2);
            }
         }
         break;
      case Queen:
         for(x2 = 0; x2<8; x2++)
         {
            if(x2 != x)
            {
               y2 = y + Abs(x2 - x);
               if(y2 < 8)
                  AddMoveToList(stack, state, type, player, x,y,x2,y2);
               y2 = y - Abs(x2 - x);
               if(y2 >= 0)
                  AddMoveToList(stack, state, type, player, x,y,x2,y2);
            }
         }
         for(x2 = 0; x2<8; x2++)
         {
            if(x2 != x)
            {
               AddMoveToList(stack, state, type, player, x,y,x2,y);
            }
         }
         for(y2 = 0; y2<8; y2++)
         {
            if(y2 != y)
            {
               AddMoveToList(stack, state, type, player, x,y,x,y2);
            }
         }
         break;
      case King:
         AddMoveToList(stack, state, type, player, x,y, x,y+1);
         AddMoveToList(stack, state, type, player, x,y, x+1,y+1);
         AddMoveToList(stack, state, type, player, x,y, x+1,y);
         AddMoveToList(stack, state, type, player, x,y, x+1,y-1);
         AddMoveToList(stack, state, type, player, x,y, x,y-1);
         AddMoveToList(stack, state, type, player, x,y, x-1,y-1);
         AddMoveToList(stack, state, type, player, x,y, x-1,y);
         AddMoveToList(stack, state, type, player, x,y, x-1,y+1);

         // Castle
         AddMoveToList(stack, state, type, player, x,y, x-2,y);
         AddMoveToList(stack, state, type, player, x,y, x+2,y);
         break;
   }
}

void GenerateMoveList(ChessState state, MoveStack stack)
{
   int x,y;

   stack.count = 0;
   for(x = 0; x<8; x++)
      for(y = 0; y<8; y++)
      {
         Piece content = state.board[y][x];
         if(content && content.player == state.turn)
            GeneratePieceMoveList(state, x,y, stack);
      }
}

int EvaluateMaterial(Piece board[8][8], Player turn)
{
   int x,y;
   int materialMe = 0, materialOpp = 0;

   for(y = 0; y<8; y++)
      for(x = 0; x<8; x++)
      {
         Piece content = board[y][x];
         if(content != Piece {})
         {
            Player player = content.player;
            PieceType piece = content.type;

            if(player == turn)
               materialMe += materialValues[piece];
            else
               materialOpp += materialValues[piece];
         }
      }
   return materialMe - materialOpp;
}

int EvaluatePosition(ChessState state, Player turn)
{
   int position = 0;

   // To help the mate...
   if(state.materialValue[White] < 7)
   {
      if((state.kings[White].x >= 3 && state.kings[White].x <= 4) &&
         (state.kings[White].y >= 3 && state.kings[White].y <= 4))
      {
         position -= 3;
      }
      else if((state.kings[White].x >= 2 && state.kings[White].x <= 5) &&
              (state.kings[White].y >= 2 && state.kings[White].y <= 5))
      {
         position -= 2;
      }
      else if((state.kings[White].x >= 1 && state.kings[White].x <= 6) &&
              (state.kings[White].y >= 1 && state.kings[White].y <= 6))
      {
         position -= 1;
      }
   }

   // Castle
   if(state.castled[White]) position -= 15;
   if(state.castled[Black]) position += 15;
   return position;
}

static int CompareGreater(const ChessMove a, const ChessMove b)
{
   if(a.rating > b.rating) return 1;
   else if(a.rating < b.rating) return -1;
   else
   {
      if(a.count < b.count) return 1;
      else if(a.count > b.count) return -1;
      else
         return 0;
   }
}

static int CompareSmaller(const ChessMove a, const ChessMove b)
{
   if(a.rating < b.rating) return 1;
   else if(a.rating > b.rating) return -1;
   else
   {
      if(a.count > b.count) return 1;
      else if(a.count < b.count) return -1;
      else
         return 0;
   }
}

bool FindMove(ChessState startState, int depth, int *maxDepth, ChessMove bestMove, int startRating, int * returnedRating,
              int startCount, int * returnedCount, bool * abort)
{
   Player player = startState.turn;
   MoveStack * stack = &moveStack[depth];
   int bestRating = (player == Black) ? MININT : 200000;
   int c;
   int bestCount = MAXINT;
   int maxShots = stack->count;

   // Stop AI
   if(*abort) return false;

   GenerateMoveList(startState, stack);
   if(!stack->count && !Check(startState, player, startState.kings[player].x, startState.kings[player].y))
      bestRating = 0;

   if(!stack->count)
      bestCount = startCount;

   maxShots = stack->count;
   for(c = 0; c<maxShots; c++)
   {
      ChessMove * move = &stack->moves[c];
      int newRating, newCount = MAXINT;
      int delta = 0;
      ChessState state = startState;

      StateMakeMove(&state, move->x1, move->y1, move->x2, move->y2, move->promotion, false, &delta);
      if(player == White)
         delta *= -1;

      if(Abs(delta) < 1000 && (depth+1 < *maxDepth))
      {
         FindMove(&state, depth+1, maxDepth, null, startRating + delta, &newRating, startCount+1, &newCount, abort);
      }
      else
      {
         int position;
         position = EvaluatePosition(&state, player);
         newRating = startRating + delta + position;

         if((player == Black) ? (newRating > bestRating) : (newRating < bestRating))
            newCount = startCount+1;
      }

      move->rating = newRating;
      move->count = newCount;

      if((player == Black) ? (newRating >= bestRating) : (newRating <= bestRating))
      {
         bestRating = newRating;
         if(move->count < bestCount)
            bestCount = move->count;
      }
   }
   stack->count = maxShots;

   // Pass 2
   if(bestMove && stack->count)
   {
      int numGoodMoves;
      if(player == Black)
         qsort(stack->moves, stack->count, sizeof(ChessMove), CompareSmaller);
      else
         qsort(stack->moves, stack->count, sizeof(ChessMove), CompareGreater);

      for(numGoodMoves = 0; numGoodMoves<stack->count; numGoodMoves++)
      {
         if(stack->moves[numGoodMoves].rating != bestRating)
            break;
         if(stack->moves[numGoodMoves].count != bestCount)
            break;
      }

      c = GetRandom(0, numGoodMoves-1);
      bestMove = stack->moves[c];
   }
   if(returnedRating)
      *returnedRating = bestRating;
   if(returnedCount)
      *returnedCount = bestCount;
   Sleep(0);

   return stack->count > 0;
}

class AIThread : Thread
{
   Chess chess;
   bool aiMoveResult;
   bool abortAI;
   ChessMove aiMove;

   Timer aiTimer
   {
      this, 0.1;

      bool DelayExpired()
      {
         if(aiMoveResult)
         {
            Wait();
            chess.MakeMove(aiMove.x1, aiMove.y1, aiMove.x2, aiMove.y2, aiMove.promotion);
            aiMoveResult = false;
            aiTimer.Stop();
         }
         return true;
      }
   };

   void Play()
   {
      abortAI = false;
      app.UpdateDisplay();
      Create();
      aiTimer.Start();
   }

   void Abort()
   {
      abortAI = true;
      Wait();
      aiTimer.Stop();
      aiMoveResult = false;
   }

   ChessState * chessState;

   uint Main()
   {
      ChessState * chessState = chess.chessState;
      int startRating = EvaluateMaterial(chessState->board, chessState->turn);
      int depth = MAXDEPTH;

      RandomSeed((int)(GetTime() * 1000));
      aiMoveResult = FindMove(chessState, 0, &depth, &aiMove, startRating, null, 0, null, &abortAI);

      return 0;
   }

public:
   property Chess chess { set { chess = value; } }
   property ChessState * chessState { set { chessState = value; } }
}
