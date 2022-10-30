import "ecere"

define seed = 123456789;
define popInit = 4*41255;
define width = 1920/2;
define height = 1280/2;
define cellWidth = 2;
define cellHeight = 2;

Array<byte> _grid { size = width * height };
Array<byte> newState { size = width * height };
Array<byte> _hue { size = width * height };
Array<byte> newHue { size = width * height };

void addHue(Pointf p, byte h)
{
   Degrees a = Degrees { h * 360 / 255.0 };
   p.x += cos(a);
   p.y += sin(a);
}

class GameOfLife : Window
{
   caption = $"Conway's Game of Life";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { width * cellWidth, height * cellHeight };

   Timer tickTimer
   {
      delay = 0.0, started = false /*true*/, userData = this;

      bool DelayExpired()
      {
         byte * grid = _grid.array;
         byte * hue = _hue.array;
         int y, x, ix = 0;
         for(y = 0; y < height; y++)
         {
            for(x = 0; x < width; x++, ix++)
            {
               int n = 0, nCount = 0;
               int alive;
               int h = 0;
               Pointf hueSum { };

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

               alive = grid[ix];
               if(alive)
               {
                  alive = alive + 1;
                  if(nCount > 270 && nCount < 450)
                  {
                     alive = 0;
                     h = (hue[ix] + 128) % 255;
                  }
                  else
                     h = hue[ix];
               }
               else
               {
                  alive = nCount > 500 && nCount < 550 ? (nCount % 255)/1.5 : 0;
                  h = hue[ix];
                  if(alive)
                  {
                     if(x > 0       && y > 0        && grid[ix - width - 1] > 5) addHue(hueSum, hue[ix - width - 1]);
                     if(               y > 0        && grid[ix - width    ] > 5) addHue(hueSum, hue[ix - width    ]);
                     if(x < width-1 && y > 0        && grid[ix - width + 1] > 5) addHue(hueSum, hue[ix - width + 1]);
                     if(x > 0                       && grid[ix         - 1] > 5) addHue(hueSum, hue[ix         - 1]);
                     if(x < width - 1               && grid[ix         + 1] > 5) addHue(hueSum, hue[ix         + 1]);
                     if(x > 0       && y < height-1 && grid[ix + width - 1] > 5) addHue(hueSum, hue[ix + width - 1]);
                     if(               y < height-1 && grid[ix + width    ] > 5) addHue(hueSum, hue[ix + width    ]);
                     if(x < width-1 && y < height-1 && grid[ix + width + 1] > 5) addHue(hueSum, hue[ix + width + 1]);
                     addHue(hueSum, hue[ix]);
                     h = (int)(((Degrees)atan2(hueSum.y / (n + 1), hueSum.x / (n + 1))) * 255 / 360);
                  }
                  else
                     h = hue[ix];
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
            if(v)
            {
               int sy = y * cellHeight;
               int sx = x * cellWidth;
               surface.background = ColorHSV { h = (_hue[ix]) * 360.0 / 255, s = 100, v = v/2.0f };
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
            _hue[y * width + x] = (byte)GetRandom(0, 255);

      for(i = 0; i < popInit; i++)
      {
         int x = GetRandom(50, width-1-50);
         int y = GetRandom(50, height-1-50);

         _grid[y * width + x] = (byte)GetRandom(0, 255);
      }

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
