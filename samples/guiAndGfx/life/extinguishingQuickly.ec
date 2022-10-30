import "ecere"

define seed = 12345;
define popInit = 2135*34;
define width = 1920 / cellWidth; //2*300;
define height = 1080 / cellHeight; //2*300;
define cellWidth = 2;
define cellHeight = 2;

Array<byte> grid { size = width * height };
Array<byte> newState { size = width * height };

class GameOfLife : Window
{
   caption = $"Conway's Game of Life";
   background = 0xDDC0A7; //lightBlue;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { width * cellWidth, height * cellHeight };

   Timer tickTimer
   {
      delay = 0.05 /*1 /*0.01*/, started = false /*true*/, userData = this;

      bool DelayExpired()
      {
         int y, x, ix = 0;
         int state = GetRandom(1, 10);
         for(y = 0; y < height; y++)
         {
            for(x = 0; x < width; x++, ix++)
            {
               int nCount = 0;
               int alive;
               /*
               if(x > 0       && y > 0        && grid[ix - width - 1] > 5) nCount++;
               if(               y > 0        && grid[ix - width    ] > 5) nCount++;
               if(x < width-1 && y > 0        && grid[ix - width + 1] > 5) nCount++;
               if(x > 0                       && grid[ix         - 1] > 5) nCount++;
               if(x < width - 1               && grid[ix         + 1] > 5) nCount++;
               if(x > 0       && y < height-1 && grid[ix + width - 1] > 5) nCount++;
               if(               y < height-1 && grid[ix + width    ] > 5) nCount++;
               if(x < width-1 && y < height-1 && grid[ix + width + 1] > 5) nCount++;
               */

               if(x > 0       && y > 0       ) nCount += grid[ix - width - 1];
               if(               y > 0       ) nCount += grid[ix - width    ];
               if(x < width-1 && y > 0       ) nCount += grid[ix - width + 1];
               if(x > 0                      ) nCount += grid[ix         - 1];
               if(x < width - 1              ) nCount += grid[ix         + 1];
               if(x > 0       && y < height-1) nCount += grid[ix + width - 1];
               if(               y < height-1) nCount += grid[ix + width    ];
               if(x < width-1 && y < height-1) nCount += grid[ix + width + 1];

               switch(state)
               {
                  /*case 1:
                  case 4:
                  case 5:
                  case 7:
                  case 8:
                  case 9:
                      // Classic
                     if(grid[ix])
                        alive = nCount >= 2 && nCount <= 3; // Death
                     else
                        alive = nCount == 3; // Birth
                        break;
                  case 10:
                  case 6:
                  case 2:
                     // Highlife
                     if(grid[ix])
                        alive = nCount >= 2 && nCount <= 3; // Death
                     else
                        alive = nCount == 3 || nCount == 6; // Birth
                      break;
                  case 3:*/
                  default:
                     // Seeds

                     if(grid[ix])
                        alive = nCount >= 2 && nCount <= 3; // Death
                     else
                        alive = nCount == 3 || nCount == 6; // Birth
/*
                     alive = grid[ix];

                     if(alive > 1)
                     {
                         //alive = 0; //nCount != 6; //0; // Death
                         //alive = nCount < 4;
                         // alive = nCount < 5 ? (alive + 5) : 0;

                          //alive = (nCount >= 200 || nCount <= 400) ? (alive + 5) : 1;
                         //if(alive > 255) alive = 1;
                       ///alive = nCount != 7; //0; // Death
                        alive = nCount != 6; //0; // Death
                     }
                     else
                        //alive = nCount == 2; // Birth
                        alive = nCount > 1 ? 5 : 0; // Birth
                        //alive = nCount >= 250 && nCount < 350 ? 5 : alive; // Birth

                     /*
                     if(alive)
                     {
                         alive = (nCount >= 200 || nCount <= 400) ? (alive + 5) : 1;
                         if(alive > 255) alive = 1;
                         //alive = alive + 5;
                         //if(alive > 255) alive = 0;

                     }
                     else
                        alive = nCount >= 250 && nCount < 350 ? 5 : alive; // Birth
                        //alive = nCount > 200 && nCount < 400 ? nCount % 255 : 0;
                        */
                     break;
               }

               newState[ix] = (byte)alive;
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
            byte v = grid[ix];
            if(v && v < 200)
            {
               int sy = y * cellHeight;
               int sx = x * cellWidth;
               surface.background = Color { r = v + 35, g = v + 55, b = v };
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

         grid[y * width + x] = (byte)GetRandom(0, 255);
      }
/*
      grid[(height/2) * width + (width/2)] = 100;
      grid[(height/2) * width + (width/2+1)] = 100;
      grid[(height/2+1) * width + (width/2)] = 100;
      grid[(height/2+1) * width + (width/2+1)] = 100;
*/
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == space)
         tickTimer.started ^= true;
      return true;
   }
}

GameOfLife life {};
