import "ecere"

define seed = 1234569;
define popInit = 420000;
define width = 1920/cellWidth;//100;
define height = 1080/cellHeight;//100;
define cellWidth = 2;
define cellHeight = 2;

Array<byte> grid { size = width * height };
Array<byte> newState { size = width * height };

class GameOfLife : Window
{
   caption = $"Conway's Game of Life";
   background = lightBlue;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { width * cellWidth, height * cellHeight };

   Timer tickTimer
   {
      delay = 0 /*.05*/, started = true, userData = this;

      bool DelayExpired()
      {
         int y, x, ix = 0;
         for(y = 0; y < height; y++)
         {
            for(x = 0; x < width; x++, ix++)
            {
               int nCount = 0;
               byte alive;
               if(x > 0       && y > 0        && grid[ix - width - 1]) nCount++;
               if(               y > 0        && grid[ix - width    ]) nCount++;
               if(x < width-1 && y > 0        && grid[ix - width + 1]) nCount++;
               if(x > 0                       && grid[ix         - 1]) nCount++;
               if(x < width - 1               && grid[ix         + 1]) nCount++;
               if(x > 0       && y < height-1 && grid[ix + width - 1]) nCount++;
               if(               y < height-1 && grid[ix + width    ]) nCount++;
               if(x < width-1 && y < height-1 && grid[ix + width + 1]) nCount++;

               // Original
               if(grid[ix])
                  alive = nCount >= 2 && nCount <= 3; // Death
               else
                  alive = nCount == 3; // Birth

               // Day & Night
               /*if(grid[ix])
                  alive = nCount == 3 || nCount == 4 || nCount == 6 || nCount == 7 || nCount == 8; // Death
               else
                  alive = nCount == 3 || nCount == 6 || nCount == 7 || nCount == 8; // Birth*/

               newState[ix] = alive;
            }
         }
         memcpy(grid.array, newState.array, width * height);
         Update(null);
         return true;
      }
   };

   void OnRedraw(Surface surface)
   {
      int x, y;
      int ix = 0;

      surface.background = navy;
      for(y = 0; y < height; y++)
      {
         for(x = 0; x < width; x++, ix++)
         {
            if(grid[ix])
            {
               int sy = y * cellHeight;
               int sx = x * cellWidth;
               surface.Area(sx, sy, sx + cellWidth-1, sy + cellHeight-1);
            }
         }
      }
   }

   bool OnCreate()
   {
      int i;

      RandomSeed(seed);

      for(i = 0; i < popInit; i++)
      {
         int x = GetRandom(0, width-1);
         int y = GetRandom(0, height-1);

         grid[y * width + x] = 1;
      }
      return true;
   }
}

GameOfLife life { };
