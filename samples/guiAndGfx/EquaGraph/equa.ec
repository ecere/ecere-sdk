import "ecere"

import "equation"
import "fileUtils"
// import "war2Skin"

define NUMSCROLLBARS   = 27;

ColorAlpha * palette;

Bitmap pointer;
ScrollBar bars[NUMSCROLLBARS];
ScrollBar scrollBar27;
bool needUpdate;
bool fullScreen = false;

#define SCALE_X 20.0
#define SCALE_Y 20.0
#define XTS(x) ( x * SCALE_X * clientSize.w / 640 + clientSize.w/2)
#define YTS(y) (-y * SCALE_Y * clientSize.h / 480 + clientSize.h/2)

struct Range
{
   float low, high, step, except[256], def;
   uint16 numexcept;
   bool sign;
};

define TXTNAME = "equalist.txt";
define PCXNAME = "equagfx.pcx";

static bool splashScreen = true;

struct Model
{
   char name[256];
   char form[256];
   char method[256];
   Range range[27];
   char carMethod[10][256];
   char carName[10][256];
   uint16 count,solutions,caracters;
};

static Model models[256];
Equation equation;
Bitmap back, splash;
uint16 equCount=1, numModels=0, model=0;
byte cBack, cGraph, cCurve;

bool EQUA_LoadModel(const char *filename)
{
   File f = FileOpen(filename, read);
   if(f)
   {
      int i;
      uint16 v,c,p,m;
      char temp[256], str[256];

      File_Find(f,"",true);

      File_GetINT(f,"Equations in txt:",&i); equCount=(uint16)i;
      File_GetINT(f,"B:",&i); cBack=(byte)i;
      File_GetINT(f,"G:",&i); cGraph=(byte)i;
      File_GetINT(f,"C:",&i); cCurve=(byte)i;
      File_GetINT(f,"Models:",&i); numModels=(uint16)i;
      if(numModels>256)numModels=256;

      for(m=0; m<numModels; m++)
      {
         File_GetSTR(f,"Name:",models[m].name,   256, true);
         File_GetSTR(f,"Form:",models[m].form,   256, true);
         File_GetINT(f,"Solutions:",&i); if(i>26) i=26; models[m].solutions=(uint16)i;
         File_GetSTR(f,"Method:",models[m].method, 256, true);
         File_GetINT(f,"Parameters:",&i); models[m].count=(uint16)i;
         for(v=0; v<=models[m].count; v++)
         {
            if(v==models[m].count) v=26;
            File_GetFLT(f,"L:",&models[m].range[v].low);
            File_GetFLT(f,"H:",&models[m].range[v].high);
            File_GetFLT(f,"S:",&models[m].range[v].step);
            File_GetFLT(f,"D:",&models[m].range[v].def);
            File_GetSTR(f,"E:",temp,256, true);
            models[m].range[v].sign=(temp[0]=='ñ');
            models[m].range[v].numexcept=0;
            for(c=0; temp[c];)
            {
               for(p=0; ((temp[c]!='\\')&&temp[c]); p++, c++)
                  str[p]=temp[c];
               str[p]=0; if(temp[c]=='\\')c++;
               models[m].range[v].except[models[m].range[v].numexcept++]=(float)strtod(str, null);
            }
         }
         File_GetINT(f,"Additionals:",&i); models[m].caracters=(uint16)i;
         if(models[m].caracters>10)models[m].caracters=10;
         for(c=0; c<models[m].caracters; c++)
         {
            File_GetSTR(f,"Text:",models[m].carName[c], 256, true);
            File_GetSTR(f,"Method:",models[m].carMethod[c], 256, true);
         }
      }

      delete f;
      return true;
   }
   return false;
}

void EQUA_Valid(uint16 v, short dir)
{
   uint16 e;
   Range *range;
   bool valid=false;

   range=&models[model].range[v];
   if(equation.var[v]<range->low) equation.var[v]=range->low;
   if(equation.var[v]>range->high) equation.var[v]=range->high;
   while(!valid)
   {
      valid=true;
      for(e=0; e<range->numexcept; e++)
         if(equation.var[v]==range->except[e])
         {
            valid=false;
            if(dir>0)
            {
               if(equation.var[v]<range->high)equation.var[v]+=range->step;
               else if(equation.var[v]>range->low)equation.var[v]-=range->step;
               if(equation.var[v]==range->high) dir*=-1;
            }
            else
            {
               if(equation.var[v]>range->low)equation.var[v]-=range->step;
               else if(equation.var[v]<range->high)equation.var[v]+=range->step;
               if(equation.var[v]==range->low) dir*=-1;
            }
            bars[v].Action(setPosition, (int)((equation.var[v]-range->low)/range->step), 0);
         }
   }
}

void EQUA_SetEquation(bool rand)
{
   uint16 v;
   Range *range;
   float delta;
   int num;

   for(v=0; v<=models[model].count; v++)
   {
      if(v==models[model].count)
         v=26;
      range=&models[model].range[v];
      delta=range->high-range->low;
      num=(int)(delta/range->step+1);
      bars[v].range = num; //1,num;
      if(rand)
         equation.var[v]=GetRandom(0, num-1)*range->step+range->low;
      else
         equation.var[v]=range->def;
      EQUA_Valid(v, 1);
      bars[v].Action(setPosition, (int)((equation.var[v]-range->low)/range->step), 0);
   }
   needUpdate = true;
}

void EQUA_TextEquation(bool color, char *temp)
{
   uint16 t,c,v;
   char ch, temp2[256];

   for(t=0, c=0; models[model].form[c]; c++)
   {
      ch=models[model].form[c];
      if((ch>='A')&&(ch<='Z'))
      {
         if(color)temp[t++]='\004';
         if(models[model].range[ch-'A'].sign)
         {
            if(equation.var[ch-'A']<0)
               sprintf(temp2,"-");
            else if(equation.var[ch-'A']>0)
               temp2[0]=0;
            else
               sprintf(temp2,"0");
         }
         else
            sprintf(temp2,"%0.2f",equation.var[ch-'A']);
         for(v=0; temp2[v]; v++)
            temp[t++]=temp2[v];
         if(color)temp[t++]='\001';

      }
      else
         temp[t++]=ch;
   }
   temp[t]=0;
}

DisplaySystem lfbDS { };

class EquaGraph : Window
{
   caption = $"EquaGraph 1.01";
   tabCycle = true;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   // borderStyle = sizable;
   clientSize = { 640, 480 };

   FontResource bigFont { "Arial", size = 15, window = this };
   FontResource mediumFont { "Arial", size = 11, window = this };

   FontResource lfbVeryBigFont { "Arial", size = 20 };
   FontResource lfbMediumFont { "Arial", size = 11 };
   FontResource lfbSmallFont { "Arial", size = 6};

   foreground = white;

   EquaGraph()
   {
      int c;

      lfbDS.Create("LFB", null, false);

      lfbDS.LoadResource(lfbVeryBigFont);
      lfbDS.LoadResource(lfbMediumFont);
      lfbDS.LoadResource(lfbSmallFont);

      // Constants Scrollbars
      for(c=0; c<NUMSCROLLBARS; c++)
      {
         bars[c] = ScrollBar
         {
            this, direction = horizontal, size = { 211, 0 }, id = c;
            creationActivation = doNothing; // TOCHECK: Shouldn't this be default for controls?
            // 26: Pointer Scrollbar
            anchor = c == 26 ? { left = 0, bottom = 100 } : { left = (float)((c%3)*0.33), top = (float)(0.2 + (c/3)*0.09) };

            void NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key)
            {
               int var = (int)scrollBar.id;
               Range *range = &models[model].range[var];
               equation.var[var] = position * range->step + range->low;
               if(action == up || action == pageUp)
                  EQUA_Valid((uint16)var, -1);
               else
                  EQUA_Valid((uint16)var, 1);

               needUpdate = true;
               Update(null);
            }
         };
         incref bars[c];
      }

      // Equation Selector
      scrollBar27 = ScrollBar
      {
         this, direction = horizontal, anchor = { top = 0 }, size = { 211, 0 };
         range = numModels; // 1, numModels

         void NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key)
         {
            if(model != position)
            {
               int c;

               model = (uint16)position;
               EQUA_SetEquation(false);
               for(c=0; c<NUMSCROLLBARS-1; c++)
                  bars[c].visible = (c < models[model].count);
               Update(null);
            }
         }
      };

      for(c=0; c<NUMSCROLLBARS-1; c++)
         bars[c].visible = (c < models[model].count);

      EQUA_SetEquation(false);
   }

   Button btnRandom
   {
      this, caption = $"Random", anchor = { right = 80, top = 0 }, size = { 80, 20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         EQUA_SetEquation(true);
         Update(null);
         return true;
      }
   };
   Button btnSaveList
   {
      this, caption = $"Save List", anchor = { right = 0, top = 0 }, size = { 80,20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         File f = FileOpen(TXTNAME, write);
         if(f)
         {
            int c;
            for(c=0; c<equCount; c++)
            {
               char temp[256];
               EQUA_SetEquation(true);
               EQUA_TextEquation(0, temp);
               f.Printf("%d) %s\r\n", c+1, temp);
            }
            delete f;
         }
         return true;
      }
   };
   Button btnSaveGFX
   {
      this, caption = $"Save GFX", anchor = { right = 80, top = 20 }, size = { 80,20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         renderGraphic();
         back.Save(PCXNAME, null, null);
         return true;
      }
   };
   Button btnExit
   {
      this, caption = $"Exit", anchor = { right = 0, top = 20 }, size = { 80, 20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return true;
      }
   };

   void renderGraphic()
   {
      Surface surface = back.GetSurface(0,0, null);
      if(surface)
      {
         char temp[256];
         int c;
         float y;

         surface.Clear(colorBuffer);
         equation.graph(surface, models[model].method, models[model].solutions, SCALE_X, SCALE_Y, cGraph, cCurve, palette);
         EQUA_TextEquation(false /* this was color keying: true*/, temp);

         // surface.font = War2Skin_GetFont(window, 2);
         surface.font = lfbMediumFont.font;
         surface.WriteText(50, 30, temp, strlen(temp));

         //Display caracteristics
         for(c=0; c<models[model].caracters; c++)
         {
            if(equation.solve(models[model].carMethod[c],0,equation.var[26],&y)==solutionFound)
               surface.WriteTextf(350, c*20+280, "%s%0.2f",models[model].carName[c], y);
            else
               surface.WriteTextf(350, c*20+280, "%s undefined",models[model].carName[c]);
         }
         surface.font = lfbVeryBigFont.font;
         surface.WriteTextf(400,430, "EQUAGraph 1.01");    // War2Skin_GetFont(window, 1)
         surface.font = lfbSmallFont.font;
         surface.WriteTextf(400,470, "by Jerome St-Louis (1998)");  // War2Skin_GetFont(window, 4)

         delete surface;
      }
   }

   bool OnCreate()
   {
      disabled = true;
      //Set Palette
      palette = LoadPalette("<:war2skin>2.rgb", null);
      if(!palette)
         palette = GetDefaultPalette();
      // display.SetPalette(palette, true);
      return true;
   }

   bool OnStateChange(WindowState state, Modifiers mods)
   {
      if(state == maximized && (Key)mods == hotKey) // TOCHECK:
      {
         fullScreen = true;
         app.SwitchMode(true, null, res640x480, pixelFormat8, 0, null, true);
         // SetStyle(_class.style);
         clientSize = { 640, 480 };
         anchor = { };
         return false;
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      Surface surface;

      if(splashScreen)
      {
         splash = { };
         if(!splash.Load(":equa.pcx", null, null))
            delete splash;
      }

      // To run on Linux...
      back = { };
      back.Allocate(null, 640,480, 0, pixelFormat888, true);

      // To run on 8 bit
      // back.AllocateDD(displaySystem, 640, 480);

      if(back && back.palette)
         memcpy(back.palette, palette, 256 * sizeof(ColorAlpha));

      //Create Cursors
      pointer = Bitmap { };
      if(!pointer.LoadT("<:war2skin>312.pcx", null, displaySystem))
         delete pointer;
      surface = back.GetSurface(0,0, null);
      if(surface)
      {
         if(splash)
            surface.Blit(splash, 0, 0, 0,0, splash.width, splash.height);

         // surface.font = War2Skin_GetFont(window, 1);
         surface.font = lfbVeryBigFont.font;
         surface.foreground = white;
         surface.WriteTextf(400,430, "EQUAGraph 1.01");
         // surface.font = War2Skin_GetFont(window, 4);
         surface.font = lfbSmallFont.font;
         surface.WriteTextf(400,470, "by Jerome St-Louis (1998)");
         delete surface;
      }
      delete splash;

      needUpdate = true;
      return true;
   }

   void OnUnloadGraphics()
   {
      pointer.Free();
      back.Free();
   }

   void OnDrawOverChildren(Surface surface)
   {
      if(splashScreen)
      {
         //Display
         // surface.Stretch(back, 0,0, 0,0, window.cw, window.ch, back.width, back.height);
         surface.Blit(back, 0,0, 0,0, back.width,back.height);
      }
   }

   void OnRedraw(Surface surface)
   {
      if(needUpdate && !splashScreen)
      {
         renderGraphic();
         needUpdate = false;
      }

      if(!splashScreen)
      {
         int c;
         float x,y;

         //Display
         // surface.Stretch(back, 0,0, 0,0, window.cw, window.ch, back.width, back.height);
         surface.Blit(back, 0,0, 0,0, back.width,back.height);

         //Show model name
         // surface.font = War2Skin_GetFont(window, 3);
         surface.font = bigFont.font;
         surface.WriteText(10,10, models[model].name, strlen(models[model].name));

         //Show parameters names and values
         // surface.font = War2Skin_GetFont(window, 2);
         surface.font = mediumFont.font;
         for(c=0; c<models[model].count; c++)
            surface.WriteTextf((c%3)*0.33*clientSize.w,(0.20+(c/3)*0.09)*clientSize.h + 20, "%c = %0.2f",c+'A',equation.var[c]);

         //Display x & y values
         x=equation.var[26];
         surface.WriteTextf(0,clientSize.h - 80, "x = %0.2f",x);
         for(c=0; c<models[model].solutions; c++)
         {
            if(equation.solve(models[model].method, (uint16)c, x, &y)==solutionFound)
            {
               surface.WriteTextf(100,clientSize.h - 80 + c*20, "y = %0.2f",y);
               if(pointer)
                  surface.Blit(pointer, XTS(x)-8, YTS(y)-8, 0,0, pointer.width, pointer.height);
            }
            else
               surface.WriteTextf(100,clientSize.h - 80 + c*20, "y = undefined");
         }
      }
   }

   bool OnSysKeyDown(Key key, unichar ch)
   {
      if(splashScreen)
      {
         disabled = false;
         splashScreen = false;
         Update(null);
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape)
      {
         Destroy(0);
         return false;
      }
      if(key == altEnter)
      {
         fullScreen ^= true;
         hasClose = true, hasMinimize = true, hasMaximize = true;
         // borderStyle = sizable;
         app.SwitchMode(false, null, 0, 0, 0, null, true);
         clientSize = { 640, 480 };
         anchor = { };
      }
      return true;
   }
}

class App : GuiApplication
{
   App()
   {
      //Load equations model
      EQUA_LoadModel(":equa.equ");
      RandomSeed((uint)(GetTime() * 1000));
   }
}

EquaGraph equaGraph { };

define app = (App)__thisModule.application;
