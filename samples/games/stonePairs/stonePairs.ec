import "game"

define scale = (float)clientSize.h / boardBmp.bitmap.height;
define upperLeftX = 334;
define upperLeftY = 147;
define spaceX = (676 - upperLeftX);
define spaceY = (485 - upperLeftY);
define whiteDrawer = 145;
define blackDrawer = 1885;
define topDrawer = 126;
define stoneOverlap = 0.75;

class MainWindow : Window
{
   GameConnection player1 { };
   GameConnection player2 { };

   text = "Stone Pairs";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 1019, 824 };

   hasMenuBar = true;

   BitmapResource boardBmp { ":board.jpg", window = this };
   BitmapResource arrowBmp { ":arrow.png", alphaBlend = true, window = this };
   BitmapResource removeBmp { ":remove.png", alphaBlend = true, window = this };
   BitmapResource smileBmp { ":smile.png", alphaBlend = true, window = this };
   Array<BitmapResource> stoneBmps
   { [
      null,
      BitmapResource { ":black.png", alphaBlend = true, window = this },
      BitmapResource { ":white.png", alphaBlend = true, window = this },
      BitmapResource { ":blackGray.png", alphaBlend = true, window = this },
      BitmapResource { ":whiteGray.png", alphaBlend = true, window = this }
   ] };

   menu = { };
   Menu fileMenu { menu, "File", f };
   MenuItem newGame
   {
      fileMenu, "New Game", n, ctrlN;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         player1.NewGame();
         Update(null);
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuItem exit { fileMenu, "Exit", x, altF4, NotifySelect = MenuFileExit };

   bool OnCreate()
   {
      player1.Join();
      player2.Join();

      player1.NewGame();
   }

   void DrawBitmap(Surface surface, BitmapResource res, int x, int y, float s)
   {
      Bitmap board = boardBmp.bitmap;
      Bitmap bmp = res.bitmap;
      int bw = (int)(board.width * scale;
      int bh = clientSize.h;
      int bx = (clientSize.w - bw) / 2;
      int by = (clientSize.h - bh) / 2;

      surface.Filter(res.bitmap,
         bx + (int)(x * scale), by + (int)(y * scale), 0,0,
         (int)(s*bmp.width * scale), (int)(s*bmp.height * scale),
         bmp.width, bmp.height);
   }

   void DrawWin(Surface surface, Point p1, Point p2)
   {
      int c;
      for(c = 0; c < 13; c++)
      {
         int x = (int)(upperLeftX + (p1.x+0.5)*spaceX + (p2.x - p1.x)/3 * c * spaceX / 4 - (smileBmp.bitmap.width*3)/2);
         int y = (int)(upperLeftY + (p1.y+0.5)*spaceY + (p2.y - p1.y)/3 * c * spaceY / 4 - (smileBmp.bitmap.height*3)/2);
         DrawBitmap(surface, smileBmp, x, y, 3);
      }
   }

   void DrawStone(Surface surface, Point where, Stone color)
   {
      Bitmap stone = stoneBmps[color].bitmap;
      float x = upperLeftX + (where.x + .5f) * spaceX - stone.width / 2;
      float y = upperLeftY + (where.y + .5f) * spaceY - stone.height / 2;
      DrawBitmap(surface, stoneBmps[color], (int)x, (int)y, 1);
   }

   void OnRedraw(Surface surface)
   {
      Bitmap board = boardBmp.bitmap;
      Bitmap remove = removeBmp.bitmap;
      Bitmap wStone = stoneBmps[Stone::white].bitmap;

      int x, y;
      Stone c;
      bool draw = false;

      // Draw the board
      DrawBitmap(surface, boardBmp, 0,0, 1);

      // Draw the stones in the drawers
      for(c = black; c <= white; c++)
      {
         Bitmap stone = stoneBmps[c].bitmap;
         int bx = (clientSize.w - board.width * scale)/2;
         int drawerX = (c == black) ? blackDrawer : whiteDrawer;
         int r;

         for(r = 0; r < game.numStones[c]; r++)
            DrawBitmap(surface, stoneBmps[c],
               drawerX - stone.width/2, topDrawer + (int)(r*wStone.height*stoneOverlap), 1);
      }

      if(!game.takeOut)
      {
         draw = true;
         for(y = 0; draw && y < 4; y++)
         {
            for(x = 0; draw && x < 4; x++)
            {
               if(!game.stones[y][x])
                  draw = false;
            }
         }
      }

      // Draw the stones
      for(y = 0; y < 4; y++)
      {
         for(x = 0; x < 4; x++)
         {
            Stone stone = game.stones[y][x];
            if(stone)
            {
               if(game.winner || draw) stone += 2;
               DrawStone(surface, { x, y }, stone);
            }
         }
      }

      if(game.winner)
      {
         // Display winning stones only in color
         int i;
         for(i = 0; i < 4; i++)
         {
            int j;

            for(j = 0; j < 4; j++)
               if(game.stones[i][j] != game.winner)
                  break;
            if(j == 4)
               for(j = 0; j < 4; j++)
                  DrawStone(surface, { j, i }, game.winner);

            for(j = 0; j < 4; j++)
               if(game.stones[j][i] != game.winner)
                  break;
            if(j == 4)
               for(j = 0; j < 4; j++)
                  DrawStone(surface, { i, j }, game.winner);
         }
         for(i = 0; i < 4; i++)
            if(game.stones[i][i] != game.winner)
               break;
         if(i == 4)
            for(i = 0; i < 4; i++)
               DrawStone(surface, { i, i }, game.winner);

         for(i = 0; i < 4; i++)
            if(game.stones[3-i][i] != game.winner)
               break;
         if(i == 4)
            for(i = 0; i < 4; i++)
               DrawStone(surface, { i, 3-i }, game.winner);
      }

      // Inform the player he can remove a stone
      if(game.takeOut)
         DrawBitmap(surface, removeBmp, board.width/2 - removeBmp.bitmap.width*3/2, 30, 4);

      if(!game.winner && !draw)
      {
         // Display the current turn
         DrawBitmap(surface, arrowBmp,
            ((game.turn == white) ? whiteDrawer : blackDrawer) - arrowBmp.bitmap.width*4/2, 30, 4);
      }
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      int w = (int)(boardBmp.bitmap.width * scale);
      int bx = (clientSize.w - w) / 2;
      int by = (clientSize.h - clientSize.h) / 2;
      x = (int)((x - bx) / scale);
      y = (int)((y - by) / scale);
      if(x > upperLeftX && y > upperLeftY)
      {
         int sx = (x - upperLeftX) / spaceX;
         int sy = (y - upperLeftY) / spaceY;
         if(sx < 4 && sy < 4)
         {
            GameConnection player = (player1.color == game.turn) ? player1 : player2;
            if(player.Click(sx, sy))
               Update(null);
         }
      }
      return true;
   }
}

MainWindow mainWindow {};
