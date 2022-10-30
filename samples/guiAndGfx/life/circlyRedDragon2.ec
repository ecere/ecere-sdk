import "ecere"

define seed = 23456789;
define popInit = 41255;
define width = 1920/2;
define height = 1080/2;
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
         //int state = GetRandom(1, 10);
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
                  int a, b;

                  //if(hue[ix] < 40 || hue[ix] > 200)
                  if(hue[ix] > 40 && hue[ix] < 200)
                  {
                     a = 240;
                     //b = 1350;
                     //b = 1350;
                     b = 1350;
                  }
                  else
                  {
                     //a = 40;

                     //b = 240;

                     a = 39;
                     b = 241;

                     //a = 41;

                     //b = 239;
                  }
                  alive = alive + 2;
                  //if(nCount < 249 || nCount > 2000)
                  //if(nCount < 230 || nCount > 1500)
                  //if(nCount < 70 || nCount > 550)
                  //if(nCount < 170 || nCount > 650)
                  //if(nCount < 170 || nCount > 550)
                  //if(nCount < 145 || nCount > 450)
                  //if(nCount > 270 && nCount < 450)
                  //if(nCount < 140 || nCount > 450)
                  if(nCount < a || nCount > b)
                  {
                     alive = 0;
                     //alive /= 12;
                     //alive -= 3;
                     if(alive < 0) alive = 0;
                     h = (hue[ix] + 128) % 255;
                     //h = 128;
                     //h = 0;
                     //h = hue[ix];
                  }
                  //else if(alive > 255 || alive < 0)
                  /*else if(alive > 255)
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
                  }*/
                  else
                  {
                     h = hue[ix];
                  }
                  /*else
                     h++;*/
               }
               else
               {
                  //alive = nCount > 200 && nCount < 300 ? (nCount % 255) : 0;
                  //alive = nCount > 500 && nCount < 600 ? (nCount % 255) : 0;
                  //alive = nCount > 500 && nCount < 550 ? (nCount % 255)/1.5 : 0;
                  //alive = nCount > 500 && nCount < 550 ? (nCount % 255)/1.2 : 0;
                  //alive = nCount > 420 && nCount < 490 ? (nCount % 255)/1.2 : 0;
                  //alive = nCount > 200 && nCount < 300 ? (nCount % 255) / 16 : 0;
                  //alive = nCount > 300 && nCount < 400 ? (nCount % 255) / 2 : 0;
                  //alive = nCount > 400 && nCount < 600 ? (nCount % 255) / 6 : 0;
                  //alive = nCount > 350 && nCount < 650 ? (nCount % 255) / 3 : 0;
                  //alive = nCount > 200 && nCount < 250 ? (nCount % 255) / 4 : 0;
                  //alive = nCount > 150 && nCount < 350 ? (nCount % 255) / 4 : 0;
                  //alive = nCount > 230 && nCount < 250 ? (nCount % 255) / 4 : 0;
                  alive = nCount > 190 && nCount < 280 ? (nCount % 255) / 6 : 0;
                  //alive = nCount > 150 && nCount < 350 ? (nCount % 255) / 32 : 0;
                  //alive = nCount > 220 && nCount < 280 ? (nCount % 255) / 4 : 0;
                  //alive = nCount > 200 && nCount < 300 ? hue[ix] * nCount / 300 : 0;
                  h = hue[ix];
                  //alive = nCount > h - 20 && nCount < h + 90 ? (nCount % 255)/4  : 0;
                  //alive = nCount/2 > h - 20 && nCount/3 < h + 90 ? (nCount % 255)/8  : 0;
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

                     /*if(hueSum.y < 0.0001 && hueSum.x < 0.0001)
                        h = hue[ix];
                     else*/
                        h = (int)(((Degrees)atan2(hueSum.y / (n + 1), hueSum.x / (n + 1))) * 255 / 360);

                     //h = h / (2*n) + hue[ix]/2; //) / (n + 1);
                     //h /= n;
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
            if(v) // && v < 200)
            {
               int sy = y * cellHeight;
               int sx = x * cellWidth;
               //surface.background = Color { r = v + 35, g = v + 55, b = v };
               //surface.background = ColorHSV { h = (255-_hue[ix]) * 360.0 / 255, s = 100, v = v/2.0 };
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
