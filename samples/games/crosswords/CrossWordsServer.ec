import "crossWords"

uint seed;

// FOR COMMUNICATION //////////////////////////////////////////
struct PlayedTile
{
   int x, y;
   Letters letter;
   Letters blankValue;

   void OnSerialize(SerialBuffer buffer)
   {
      buffer.Serialize(x);
      buffer.Serialize(y);
      buffer.Serialize(letter);
      buffer.Serialize(blankValue);
   }

   void OnUnserialize(SerialBuffer buffer)
   {
      buffer.Unserialize(x);
      buffer.Unserialize(y);
      buffer.Unserialize(letter);
      buffer.Unserialize(blankValue);
   }
};

struct PlayedMove
{
   int numTiles;
   PlayedTile tiles[7];
   int player;
   int score;

   void OnSerialize(SerialBuffer buffer)
   {
      int c;
      buffer.Serialize(numTiles);
      for(c = 0; c<7; c++)
         buffer.Serialize(tiles[c]);
      buffer.Serialize(player);
      buffer.Serialize(score);
   }

   void OnUnserialize(SerialBuffer buffer)
   {
      int c;
      buffer.Unserialize(numTiles);
      for(c = 0; c<7; c++)
         buffer.Unserialize(tiles[c]);
      buffer.Unserialize(player);
      buffer.Unserialize(score);
   }
};

struct PlayerList
{
   char players[4][256];
   Languages language;

   void OnSerialize(SerialBuffer buffer)
   {
      buffer.Serialize(language);
      buffer.Serialize((StaticString)players[0]);
      buffer.Serialize((StaticString)players[1]);
      buffer.Serialize((StaticString)players[2]);
      buffer.Serialize((StaticString)players[3]);
   }

   void OnUnserialize(SerialBuffer buffer)
   {
      buffer.Unserialize(language);
      buffer.Unserialize((StaticString)players[0]);
      buffer.Unserialize((StaticString)players[1]);
      buffer.Unserialize((StaticString)players[2]);
      buffer.Unserialize((StaticString)players[3]);
   }
};

//////////////////////////////////////////

class Player
{
   Letters letters[7];
   int numLetters;
   int totalScore;
   char * name;

   int id;
   ServerConnection connection;

   ~Player()
   {
      delete name;
   }
};

static const char * dicos[Languages] = { ":englishWords.txt", ":frenchWords.txt" };

class CrossWordsGame
{
   int lettersAvailable[Letters];
   int numLettersAvailable;
   AVLTree<String> dictionary { };
   int curPlayer;
   Player players[MaxPlayers];
   Languages language;

   property Languages language
   {
      set
      {
         language = value;
         LoadWords(dicos[value]);
      }
   }

   Letters board[15][15];
   Letters blankValues[15][15];
   PlayedMove curMove;
   bool gameStarted;

   ~CrossWordsGame()
   {
      int c;
      dictionary.Free();
      for(c = 0; c<MaxPlayers; c++)
         delete players[c];
   }

   CrossWordsGame()
   {

   }

   void GetTiles(int tilesPlayer, PlayedMove move)
   {
      Player player = players[tilesPlayer];
      move.numTiles = 0;

      while(player.numLetters < 7 && numLettersAvailable)
      {
         Letters letter;
         int r = (Letters)GetRandom(0, numLettersAvailable-1);
         int a = 0;

         for(letter = 0; letter<Letters::empty; letter++)
         {
            a += lettersAvailable[letter];
            if(a > r)
               break;
         }
         numLettersAvailable--;
         lettersAvailable[letter]--;

         player.letters[player.numLetters] = letter;
         player.numLetters++;

         move.tiles[move.numTiles++].letter = letter;
      }
   }

   void NewGame()
   {
      int c;
      int numPlayers = 0;

      for(c = 0; c<MaxPlayers; c++)
         if(players[c])
            numPlayers++;

      if(numPlayers > 0)
      {
         int x,y;
         Letters l;
         PlayerList list { };
         PlayedMove tiles { };

         numLettersAvailable = 0;

         for(l = 0; l<Letters::empty; l++)
         {
            numLettersAvailable += lettersCount[language][l];
            lettersAvailable[l] = lettersCount[language][l];
         }

         seed = (uint)(((uint64)(GetTime() * 1000)) & MAXDWORD);
         //seed = 256131322;
         RandomSeed(seed);
         //Logf("Seeded with %d\n", seed);

         for(y = 0; y<15; y++)
            for(x = 0; x<15; x++)
               board[y][x] = blankValues[y][x] = empty;


         for(c = 0; c<MaxPlayers; c++)
            if(players[c])
            {
               curPlayer = c;
               break;
            }

         gameStarted = true;

         strcpy(list.players[0], crossWordsGame.players[0] ? crossWordsGame.players[0].name : "");
         strcpy(list.players[1], crossWordsGame.players[1] ? crossWordsGame.players[1].name : "");
         strcpy(list.players[2], crossWordsGame.players[2] ? crossWordsGame.players[2].name : "");
         strcpy(list.players[3], crossWordsGame.players[3] ? crossWordsGame.players[3].name : "");
         list.language = crossWordsGame.language;

         for(c = 0; c<MaxPlayers; c++)
            if(players[c])
            {
               crossWordsGame.GetTiles(c, tiles);
               crossWordsGame.players[c].connection.GameStarted(list, tiles);
            }
      }
   }

   void LoadWords(const char * fileName)
   {
      File f = FileOpen(fileName, read);
      if(f)
      {
         dictionary.Free();
         while(!f.Eof())
         {
            char word[100];
            f.GetLine(word, sizeof(word));
            if(word[0])
            {
               String s = CopyString(word);
               if(!dictionary.Add(CopyString(word)))
                  delete s;
            }
         }
         delete f;
      }

      /*{
         IteratorPointer test1, test2;
         test1 = dictionary.Find("gewurztraminer");
         test2 = dictionary.Find("gewurstraminer");
         Print("");
      }*/
   }

   bool CheckWord(Letters newBoard[15][15], Direction direction, int where, int start, int end, int * score)
   {
      char word[16];
      int c, len = 0;
      bool found;
      int wordScore = 0;
      int wordMultiplier = 1;

      for(c = start; c<= end; c++)
      {
         int y = direction ? c : where;
         int x = direction ? where : c;
         Letters letter = newBoard[y][x];
         int multiplier = 1;

         if(board[y][x] == empty)
         {
            if(squareValues[y][x] == doubleLetter) multiplier = 2;
            else if(squareValues[y][x] == tripleLetter) multiplier = 3;
         }

         wordScore += lettersValue[language][letter] * multiplier;

         if(board[y][x] == empty)
         {
            if(squareValues[y][x] == doubleWord) wordMultiplier *= 2;
            else if(squareValues[y][x] == tripleWord) wordMultiplier *= 3;
         }

         if(letter == blank)
            letter = blankValues[y][x];
         word[len++] = (char)(letter + 'a');
      }
      word[len] = 0;
      found = dictionary.Find(word) != null;
      Logf("%s: %s\n", word, found ? "found :)" : "not found :(");

      *score += wordScore * wordMultiplier;
      return found;
   }

   bool VerifyMove(Letters newBoard[15][15], int * score)
   {
      int x, y;
      int c;
      int numLetters = 0;
      Direction direction = horizontal;

      //int wordX;
      //int wordY;
      int firstX = MAXINT, lastX = MININT;
      int firstY = MAXINT, lastY = MININT;
      int first, last, where;
      int wordStart, wordEnd;
      bool anchored = false;

      *score = 0;

      for(y = 0; y<15; y++)
      {
         for(x = 0; x<15; x++)
         {
            if(board[y][x] == empty && newBoard[y][x] != empty)
            {
               //wordX = x;
               //wordY = y;
               if(x < firstX) firstX = x;
               if(y < firstY) firstY = y;
               if(x > lastX) lastX = x;
               if(y > lastY) lastY = y;
               numLetters++;
            }
         }
      }
      if(!numLetters) return false;
      if(lastY - firstY > 0)
      {
         if(lastX - firstX > 1) return false;
         direction = vertical;
      }
      else if(lastX - firstX == 0)
      {
         if(((firstY > 0 && newBoard[firstY-1][firstX] != empty) ||
            (firstY < 14 && newBoard[firstY+1][firstX] != empty)) &&
            ((firstX == 0 || newBoard[firstY][firstX-1] == empty) &&
            (firstX == 14 || newBoard[firstY][firstX+1] == empty)))
            direction = vertical;
      }

      first = direction ? firstY : firstX;
      last = direction ? lastY : lastX;

      where = direction ? firstX : firstY;

      for(c = first; c <= last; c++)
      {
         Letters letter = direction ? newBoard[c][where] : newBoard[where][c];
         if(letter == empty) return false;
      }

      for(c = first; c>=0; c--)
      {
         Letters letter = direction ? newBoard[c][where] : newBoard[where][c];
         if(letter == empty) break;
         wordStart = c;
         if(c != first)
            anchored = true;
      }
      for(c = last; c<15; c++)
      {
         Letters letter = direction ? newBoard[c][where] : newBoard[where][c];
         if(letter == empty) break;
         wordEnd = c;
         if(c != last)
            anchored = true;
      }
      if(!CheckWord(newBoard, direction, where, wordStart, wordEnd, score))
         return false;

      for(c = first; c <= last; c++)
      {
         if((direction ? board[c][where] : board[where][c]) == empty)
         {
            int wordStart, wordEnd;
            int a;

            for(a = where; a>=0; a--)
            {
               Letters letter = direction ? newBoard[c][a] : newBoard[a][c];
               if(letter == empty) break;
               wordStart = a;
               if(a != where)
                  anchored = true;
            }
            for(a = where; a<15; a++)
            {
               Letters letter = direction ? newBoard[c][a] : newBoard[a][c];
               if(letter == empty) break;
               wordEnd = a;
               if(a != where)
                  anchored = true;
            }
            if(wordEnd > wordStart)
               if(!CheckWord(newBoard, direction^1, c, wordStart, wordEnd, score))
                  return false;
         }
         else
            anchored = true;
      }
      if(newBoard[7][7] != empty && board[7][7] == empty) anchored = true;
      if(!anchored) return false;
      if(numLetters == 7) *score += 50;
      return true;
   }

   void EndGame()
   {
      if(gameStarted)
      {
         int c;
         for(c = 0; c<MaxPlayers; c++)
         {
            delete crossWordsGame.players[c];
         }
         gameStarted = false;
      }
   }
}

CrossWordsGame crossWordsGame;

remote class ServerConnection
{
public:
   // Remote Functions
   Player player;

   ~ServerConnection()
   {
      if(player)
      {
         //crossWordsGame.players[player.id] = null;
         delete crossWordsGame.players[player.id];
         delete player;
         crossWordsGame.EndGame();
      }
   }

   int Join()
   {
      int result = -1;
      if(!crossWordsGame.gameStarted)
      {
         int c;
         for(c = 0; c<MaxPlayers; c++)
         {
            if(!crossWordsGame.players[c])
               break;
         }
         if(c < MaxPlayers)
         {
            player = crossWordsGame.players[c] = Player { id = c };
            player.connection = this;
            incref player;
            incref crossWordsGame.players[c];
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
         if(!crossWords.scoreFields[player.id])
         {
            crossWords.scoreFields[player.id] = DataField { dataType = class(int), header = name, width = 40 };
            //incref crossWords.scoreFields[player.id];
            crossWords.scores.AddField(crossWords.scoreFields[player.id]);
         }
         crossWords.scoreFields[player.id].header = name;
      }
      return true;
   }

   bool PlayTiles(PlayedMove move)
   {
      if(player && crossWordsGame.players[crossWordsGame.curPlayer] == player)
      {
         Letters newBoard[15][15];
         int c;
         int score;

         memcpy(newBoard, crossWordsGame.board, 15*15*sizeof(Letters));
         for(c = 0; c<move.numTiles; c++)
         {
            if(newBoard[move.tiles[c].y][move.tiles[c].x] == empty)
            {
               newBoard[move.tiles[c].y][move.tiles[c].x] = move.tiles[c].letter;
               crossWordsGame.blankValues[move.tiles[c].y][move.tiles[c].x] = move.tiles[c].blankValue;
            }
            else
               return false;
         }
         if(crossWordsGame.VerifyMove(newBoard, &score))
         {
            for(c = 0; c<move.numTiles; c++)
            {
               int d;
               bool found = false;
               for(d = 0; d<player.numLetters; d++)
                  if(player.letters[d] == move.tiles[c].letter)
                  {
                     memmove(player.letters + d, player.letters + d + 1, sizeof(int) * (player.numLetters - d - 1));
                     player.numLetters--;
                     found = true;
                     break;
                  }
               if(!found)
               {
                  Logf("Letter not found!\n");
                  return false;
               }
            }

            player.totalScore += score;
            memcpy(crossWordsGame.board, newBoard, 15*15*sizeof(Letters));

            crossWordsGame.curMove = move;
            crossWordsGame.curMove.player = crossWordsGame.curPlayer;
            crossWordsGame.curMove.score = score;

            // Return Tiles
            crossWordsGame.GetTiles(crossWordsGame.curPlayer, move);

            for(c = 0; c<MaxPlayers; c++)
               if(crossWordsGame.players[c])
                  crossWordsGame.players[c].connection.MovePlayed(crossWordsGame.curMove);

            do { if(++crossWordsGame.curPlayer == MaxPlayers) crossWordsGame.curPlayer = 0; } while(!crossWordsGame.players[crossWordsGame.curPlayer]);
            return true;
         }
      }
      return false;
   }

   bool DiscardTiles(PlayedMove move)
   {
      if(player && crossWordsGame.numLettersAvailable >= move.numTiles && crossWordsGame.players[crossWordsGame.curPlayer] == player)
      {
         int c;
         PlayedMove newTiles { };

         for(c = 0; c<move.numTiles; c++)
         {
            int d;
            for(d = 0; d<player.numLetters; d++)
               if(player.letters[d] == move.tiles[c].letter)
               {
                  memmove(player.letters + d, player.letters + d + 1, sizeof(int) * (player.numLetters - d - 1));
                  player.numLetters--;
                  break;
               }
         }

         crossWordsGame.GetTiles(crossWordsGame.curPlayer, newTiles);

         for(c = 0; c<move.numTiles; c++)
         {
            crossWordsGame.lettersAvailable[move.tiles[c].letter]++;
            crossWordsGame.numLettersAvailable++;
         }

         crossWordsGame.curMove = { }; // TODO: Add informing other players of number of exchanged letters when passing...
         crossWordsGame.curMove.player = crossWordsGame.curPlayer;

         move = newTiles;

         for(c = 0; c<MaxPlayers; c++)
            if(crossWordsGame.players[c])
               crossWordsGame.players[c].connection.MovePlayed(crossWordsGame.curMove);

         do { if(++crossWordsGame.curPlayer == MaxPlayers) crossWordsGame.curPlayer = 0; } while(!crossWordsGame.players[crossWordsGame.curPlayer]);

         return true;
      }
      return false;
   }

   virtual void MovePlayed(PlayedMove move);
   virtual void GameStarted(PlayerList list, PlayedMove tiles);
}
