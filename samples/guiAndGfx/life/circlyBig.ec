import "ecere"

define seed = 23456789;
define popInit = 61255;
define width = 1920/2;
define height = 1080/2;
define cellWidth = 2;
define cellHeight = 2;

Array<byte> _grid { size = width * height };
Array<byte> newState { size = width * height };
Array<byte> _hue { size = width * height };
Array<byte> newHue { size = width * height };

class GameOfLife : Window
{
   caption = $"Conway's Game of Life";
   //background = 0xDDC0A7; //lightBlue;
   background = black; //lightBlue;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { width * cellWidth, height * cellHeight };

   Timer tickTimer
   {
      delay = 0.0 /*1 /*0.01*/, started = false /*true*/, userData = this;

      bool DelayExpired()
      {
         byte * grid = _grid.array;
         byte * hue = _hue.array;
         int y, x, ix = 0;
         int state = GetRandom(1, 10);
         for(y = 0; y < height; y++)
         {
            for(x = 0; x < width; x++, ix++)
            {
               int n = 0, nCount = 0;
               int alive;
               int h = 0;

               if(x > 0       && y > 0        && grid[ix - width - 1] > 5) n++;
               if(               y > 0        && grid[ix - width    ] > 5) n++;
               if(x < width-1 && y > 0        && grid[ix - width + 1] > 5) n++;
               if(x > 0                       && grid[ix         - 1] > 5) n++;
               if(x < width - 1               && grid[ix         + 1] > 5) n++;
               if(x > 0       && y < height-1 && grid[ix + width - 1] > 5) n++;
               if(               y < height-1 && grid[ix + width    ] > 5) n++;
               if(x < width-1 && y < height-1 && grid[ix + width + 1] > 5) n++;


               if(x > 0       && y > 0       ) nCount += grid[ix - width - 1];
               if(               y > 0       ) nCount += grid[ix - width    ];
               if(x < width-1 && y > 0       ) nCount += grid[ix - width + 1];
               if(x > 0                      ) nCount += grid[ix         - 1];
               if(x < width - 1              ) nCount += grid[ix         + 1];
               if(x > 0       && y < height-1) nCount += grid[ix + width - 1];
               if(               y < height-1) nCount += grid[ix + width    ];
               if(x < width-1 && y < height-1) nCount += grid[ix + width + 1];

               if(x > 0       && y > 0        && grid[ix - width - 1] > 5) h += hue[ix - width - 1];
               if(               y > 0        && grid[ix - width    ] > 5) h += hue[ix - width    ];
               if(x < width-1 && y > 0        && grid[ix - width + 1] > 5) h += hue[ix - width + 1];
               if(x > 0                       && grid[ix         - 1] > 5) h += hue[ix         - 1];
               if(x < width - 1               && grid[ix         + 1] > 5) h += hue[ix         + 1];
               if(x > 0       && y < height-1 && grid[ix + width - 1] > 5) h += hue[ix + width - 1];
               if(               y < height-1 && grid[ix + width    ] > 5) h += hue[ix + width    ];
               if(x < width-1 && y < height-1 && grid[ix + width + 1] > 5) h += hue[ix + width + 1];

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
                     alive = grid[ix];
                     /*
                     if(alive > 1)
                     {
                         //alive = 0; //nCount != 6; //0; // Death
                         //alive = nCount < 4;
                         // alive = nCount < 5 ? (alive + 5) : 0;

                          alive = (nCount >= 200 || nCount <= 400) ? (alive + 5) : 1;
                         if(alive > 255) alive = 1;
                        //alive = nCount != 7; //0; // Death
                        //alive = nCount != 6; //0; // Death
                     }
                     else
                        //alive = nCount == 2; // Birth
                        //alive = nCount > 1 ? 5 : 0; // Birth
                        alive = nCount >= 250 && nCount < 350 ? 5 : alive; // Birth
                     */

                     if(alive)
                     {
                        alive = alive + 3;//(hue[ix] ) / 20;
                        //alive = alive + (hue[ix] - 128) / 20;
                        //alive = alive + (hue[ix] - 32) / 80;
                        //alive = alive + (64 + 128 - hue[ix]) / 80;
                        //if(alive > 255 || nCount > 450 || alive < 0)

                        //if(nCount < 150) //120)
                        if(nCount < 250 || nCount > 1600)
                        {
                           alive = 0;
                           h = (hue[ix] + 128) % 255;
                           //h = 128;
                           //h = 0;
                        }
                        //else if(alive > 255 || alive < 0)
                        else if(alive > 255)
                        {
                           alive = 0; //255;
                           //h = (hue[ix] + 32) % 255;
                           h = hue[ix];
                        }
                        else if(alive < 0)
                        {
                           alive = 0;
                           //h = 64;
                           //h = 0;
                           h = hue[ix];
                           //h = (hue[ix] + 32) % 255;
                        }
                        else
                           h = hue[ix];
                        /*else
                           h++;*/
                     }
                     else
                     {
                        // alive = nCount > 200 && nCount < 300 ? (nCount % 255) : 0;
                        //alive = nCount > 200 && nCount < 300 ? (nCount % 255) / 4 : 0;
                        //alive = nCount > 200 && nCount < 250 ? (nCount % 255) / 4 : 0;
                        //alive = nCount > 230 && nCount < 250 ? (nCount % 255) / 4 : 0;
                        alive = nCount > 150 && nCount < 350 ? (nCount % 255) / 32 : 0;
                        //alive = nCount > 220 && nCount < 280 ? (nCount % 255) / 4 : 0;
                        //alive = nCount > 200 && nCount < 300 ? hue[ix] * nCount / 300 : 0;
                        //alive = nCount > h - 160 && nCount < h + 150 ? nCount % 255 : 0;
                        if(alive)
                        {
                           //h = (h + hue[ix]) / (n + 1);
                           h /= n;
                        }
                        else
                           h = hue[ix];
                     }
                     break;
               }

               newState[ix] = (byte)alive;
               newHue[ix] = (byte)h;
            }
         }
         memcpy(grid, newState.array, width * height);
         memcpy(hue, newHue.array, width * height);
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
            byte v = _grid[ix];
            if(v) // && v < 200)
            {
               int sy = y * cellHeight;
               int sx = x * cellWidth;
               //surface.background = Color { r = v + 35, g = v + 55, b = v };
               //surface.background = ColorHSV { h = (255-_hue[ix]) * 360.0 / 255, s = 100, v = v/2.0 };
               surface.background = ColorHSV { h = (_hue[ix]) * 360.0 / 255, s = 100, v = v/2.0 };
               surface.Area(sx, sy, sx + cellWidth-1, sy + cellHeight-1);
            }
         }
      }
   }

   bool OnCreate()
   {
      int i, x, y;

      RandomSeed(seed);

      for(x = 0; x < width; x++)
         for(y = 0; y < height; y++)
         {
            _hue[y * width + x] = (byte)GetRandom(0, 255);

         }

      for(i = 0; i < popInit; i++)
      {
         int x = GetRandom(50, width-1-50);
         int y = GetRandom(50, height-1-50);

         _grid[y * width + x] = (byte)GetRandom(0, 255);
      }

/*
      grid[150 * width + 150] = 100;
      grid[150 * width + 151] = 100;
      grid[151 * width + 150] = 100;
      grid[151 * width + 151] = 100;
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
