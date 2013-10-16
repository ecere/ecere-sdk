import "ecere"

class BallsApp;

#ifndef ECERE_MODULE
BallsApp app;
#else
extern GuiApplication app;
#endif

// Configuration Parameters

#define MULTICOLOR
//#define XMAS
//#define GRAYBACKGROUND

#define SINGLECOLOR     3
define NUMBALLS        = 200;
//#define NUMBALLS        50
#define CAMERAPOSITION  -175
#define ROTATESPEED     0.1f
//#define ROTATESPEED     0.4f
#define CEILING         -80
#define FLOORALT        30
#define LIGHTHEIGHT     200

#define NUMPETALS       7
// #define NUMPETALS       4
#define UPDOWNSPEED     50
#define FACTOR1         85
#define FACTOR2         30
#define BALLHEIGHT      30

//#define FACTOR2         80

struct BallSprite
{
   Bitmap bitmap;
	int x,z;
   int r,yi;
   Angle t;
   float y;
   Vector3D transformed;
};

define NUMCOLORS       = 7;
#define SIZEBALLX       5
#define SIZEBALLY       5

static char ballPattern[SIZEBALLX*SIZEBALLY] =
{
	0 ,1 ,9 ,1 ,0,
	1 ,9 ,9 ,9 ,1,
	9 ,9 ,15,9 ,9,
	1 ,9 ,9 ,9 ,1,
	0 ,1 ,9 ,1 ,0
};

static ColorAlpha palette[256] =
{
   0xFF000000,0xFF000080,0xFF008000,0xFF008080,0xFF800000,0xFF800080,0xFF808000,0xFFC0C0C0,
   0xFF808080,0xFF0000FF,0xFF00FF00,0xFF00FFFF,0xFFFF0000,0xFFFF00FF,0xFFFFFF00,0xFFFFFFFF,
   0xFF000000,0xFF101010,0xFF202020,0xFF303030,0xFF404040,0xFF505050,0xFF606060,0xFF707070,
   0xFF808080,0xFF909090,0xFFA0A0A0,0xFFB0B0B0,0xFFC0C0C0,0xFFD0D0D0,0xFFE0E0E0,0xFFF0F0F0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0xFF343973, 0xFF463971, 0xFF553870, 0xFF5F386F, 0xFF6F3872, 0xFF6F3860, 0,0,
};

static void ScaleCenterBit(Surface surface, int sx,int sy,int sizex,int sizey, Bitmap bitmap)
{
   surface.Stretch(bitmap, sx - sizex/2, sy - sizey/2, 0,0,
      sizex,sizey,bitmap.width, bitmap.height);
}

static void ShowSpriteVector3D(Camera camera, Surface surface, BallSprite sprite)
{
   Vector3D projPos;

   if(camera.Project(sprite.transformed, projPos))
   {
      Vector3D size = { sprite.bitmap.width, sprite.bitmap.height, sprite.transformed.z };
      Point projSize;
      camera.ProjectSize(size, projSize);
      projSize.x = Max(projSize.x, 3);
      projSize.y = Max(projSize.y, 3);
	   ScaleCenterBit(surface, (int)projPos.x,(int)projPos.y,projSize.x,projSize.y,sprite.bitmap);
   }
}

static void ShowShadowVector3D(Camera camera, Surface surface, BallSprite sprite, Bitmap shadow, int floorAlt)
{
   Vector3D position, spritePosition = { sprite.x, sprite.z, -sprite.y + floorAlt };
   Vector3D projPos;

   // First project on the floor
   projPos.x = sprite.x * LIGHTHEIGHT / (LIGHTHEIGHT - (-sprite.y + floorAlt));
   projPos.y = sprite.z * LIGHTHEIGHT / (LIGHTHEIGHT - (-sprite.y + floorAlt));

   spritePosition.x = projPos.x;
   spritePosition.y = floorAlt;
   spritePosition.z = projPos.y;

   camera.TransformPoint(position, spritePosition);

   if(camera.Project(position, projPos))
   {
      Vector3D size = { sprite.bitmap.width, sprite.bitmap.height, position.z };
      Point projSize;
      camera.ProjectSize(size, projSize);
      projSize.x = Max(projSize.x, 3);
      projSize.y = Max(projSize.y, 3);
   	ScaleCenterBit(surface, (int)projPos.x,(int)projPos.y,projSize.x,projSize.y/2,shadow);
   }
}

static void RotateSprite(BallSprite sprite, Degrees amount)
{
	if((sprite.t+=amount * ROTATESPEED)>=2*Pi)sprite.t-=2*Pi;

	sprite.r = (int)(1+sin(NUMPETALS*(sprite.t))*FACTOR1);
	sprite.x = (int)(sprite.r*cos(sprite.t));
	sprite.y = (float)(sprite.r*sin(sprite.t) - BALLHEIGHT);
   sprite.r = (int)((1+cos(NUMPETALS*(sprite.t))*sprite.t * FACTOR2));
   sprite.z = (int)(sprite.r*cos(sprite.t));

/*
   sprite.z = (int)(FACTOR2*cos(sprite.t));
   sprite.x = (int)(FACTOR2*sin(sprite.t));

	sprite.y += sprite.yi * amount;
   sprite.y = Min(Max(sprite.y, CEILING), FLOORALT);
   if(Sgn(sprite.yi) == 1)
   {
      if(sprite.y >= FLOORALT) sprite.yi *= -1;
   }
   else
   {
      if(sprite.y <= CEILING) sprite.yi *= -1;
   }
*/
}

class Balls : Window
{
   borderStyle = sizable, hasMaximize = true, hasMinimize = true, hasClose = true,
   text = "Balls", clientSize = Size { 640, 480 };

   bool timerStarted;
   Timer timer
   {
      this, 0;

      bool DelayExpired()
      {
         int c;
         Seconds time = GetTime();
         Seconds diffTime = time - lastTime;

      	for (c=0; c<NUMBALLS; c++)
      		RotateSprite(sprites[c], Radians { (double)diffTime });

         lastTime = time;
         Update(null);
         return false;
      }
   };
   Seconds lastTime;

   Bitmap shadow {};
   Camera camera { type = attached, position.z = CAMERAPOSITION };
   Bitmap ballBitmaps[NUMCOLORS];
   BallSprite sprites[NUMBALLS];
   bool moving;
   Point startPosition;
   Euler startAngle;

   bool OnCreate()
   {
      int c;

      // Sprites
   	for(c=0; c<NUMBALLS; c++)
   	{
   		sprites[c].y = -30;
   		sprites[c].r = 90;
   		sprites[c].yi = UPDOWNSPEED;
   		sprites[c].t = (float)(c * ((2*Pi) / NUMBALLS));
   	}

      timer.Start();
      timerStarted = true;
      lastTime = GetTime();

      display.SetPalette(palette, true);
      return true;
   }

   void OnPosition(int x, int y, int width, int height)
   {
      camera.Setup(width, height, null);
      camera.Update();
   }

   bool OnLoadGraphics()
   {
      int c, p;

   	//Shadow
      shadow.Allocate(null, SIZEBALLX,SIZEBALLY,SIZEBALLX, pixelFormat8, false);
      shadow.palette = palette;
      shadow.transparent = true;
   	for(p=0; p<SIZEBALLY * SIZEBALLX; p++)
         shadow.picture[p] = ballPattern[p] ? 16 : 0;
      shadow.MakeDD(displaySystem);

      //Color Balls
   	for(c=0; c<NUMCOLORS; c++)
    	{
         ballBitmaps[c] = Bitmap {};
         ballBitmaps[c].Allocate(null, SIZEBALLX,SIZEBALLY,SIZEBALLX, pixelFormat8, false);
         ballBitmaps[c].palette = palette;
         ballBitmaps[c].transparent = true;
         for(p=0; p<SIZEBALLY*SIZEBALLX; p++)
   		{
   			switch(ballPattern[p])
   			{
   				case 0: ballBitmaps[c].picture[p]=0; break;
   				case 1: ballBitmaps[c].picture[p]=(byte)c; break;
   				case 9: ballBitmaps[c].picture[p]=(byte)(c+8); break;
   				case 15:ballBitmaps[c].picture[p]=15; break;
   			}
   		}
         ballBitmaps[c].MakeDD(displaySystem);
   	}

   	for(c=0; c<NUMBALLS; c++)
   	{
   #if defined(XMAS)
   		switch(c%3)
   		{
   			case 0: sprites[c].bitmap = ballBitmaps[2]; break;
   			case 1: sprites[c].bitmap = ballBitmaps[4]; break;
   			case 2: sprites[c].bitmap = ballBitmaps[0]; break;
   			default:sprites[c].bitmap = ballBitmaps[6];
   		}
   #elif defined(MULTICOLOR)
   		switch(c%NUMCOLORS)
   		{
   			case 0: sprites[c].bitmap = ballBitmaps[0]; break;
   			case 1: sprites[c].bitmap = ballBitmaps[1]; break;
   			case 2: sprites[c].bitmap = ballBitmaps[2]; break;
   			case 3: sprites[c].bitmap = ballBitmaps[3]; break;
            case 4: sprites[c].bitmap = ballBitmaps[4]; break;
            case 5: sprites[c].bitmap = ballBitmaps[5]; break;
   			default:sprites[c].bitmap = ballBitmaps[6];
   		}
   #else
         sprites[c].bitmap = ballBitmaps[SINGLECOLOR];
   #endif
      }
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;
      for(c = 0; c<NUMCOLORS; c++)
         delete ballBitmaps[c];
      shadow.Free();
   }

   void OnRedraw(Surface surface)
   {
      int c, z;
      float minZ, maxZ;
      // Background
      float layers[] = { 0, 0.5f, 0.51f, 0.525f, 0.55f, 0.65f, 0.8f, 1.0f };
      ColorAlpha colors[] =
      {
         palette[16],
   #ifdef GRAYBACKGROUND
         palette[17],palette[18],palette[19], palette[20],palette[21],palette[22]
   #else
         palette[128],palette[129],palette[130], palette[131],palette[132],palette[133]
   #endif
      };
      for(c = 0; c<sizeof(layers)/sizeof(int) - 1; c++)
      {
         int start = (int)(clientSize.h * layers[c]);
         int end   = (int)(clientSize.h * layers[c+1]);
         surface.SetBackground(colors[c]);
         surface.Area(0,start, clientSize.w-1, end - 1);
      }

      camera.Update();

      // Shadows
      for(c=0; c<NUMBALLS; c++)
   		ShowShadowVector3D(camera, surface, sprites[c],shadow, FLOORALT);

      // Balls
      minZ = MAXFLOAT; maxZ = -MAXFLOAT;
      for(c=0; c<NUMBALLS; c++)
      {
         Vector3D spritePosition = { sprites[c].x, sprites[c].y, sprites[c].z };
         camera.TransformPoint(sprites[c].transformed, spritePosition);
         if(sprites[c].transformed.z < minZ) minZ = (float)sprites[c].transformed.z;
         if(sprites[c].transformed.z > maxZ) maxZ = (float)sprites[c].transformed.z;
      }

      for(z=(int)maxZ; z>=(int)minZ; z--)
         for(c=0; c<NUMBALLS; c++)
         {
            if((int)sprites[c].transformed.z == z)
               ShowSpriteVector3D(camera, surface, sprites[c]);
         }
   }

#ifndef ECERE_MODULE
   bool OnStateChange(WindowState state, Modifiers mods)
   {
      if(state == maximized && (Key)mods == hotKey)
      {
         app.fullScreen = true;
         app.resolution = res320x200;
         app.pixelFormat = pixelFormat8;
         borderStyle = none;
         anchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 };
      }
      return true;
   }
#endif
   bool OnKeyDown(Key key, unichar character)
   {
      switch(key)
      {
#ifndef ECERE_MODULE
         case altEnter:
            app.fullScreen = false;
            hasClose = true;
            hasMinimize = true;
            hasMaximize = true;
            borderStyle = sizable;
            state = normal;
            clientSize = Size { 640,480 };
            break;
#endif
         case escape:
            Destroy(0);
            break;
         case space:
            if(timerStarted)
            {
               timer.Stop();
               timerStarted = false;
            }
            else
            {
               timer.Start();
               timerStarted = true;
               lastTime = GetTime();
            }
            break;
         default:
            return true;
      }
      return false;
   }


   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startAngle = camera.orientation;
         Capture();
         moving = true;
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {

      if(moving)
      {
         //((Euler)camera.orientation).pitch = startAngle.pitch + (y - startPosition.y);
         ((Euler)camera.orientation).yaw = startAngle.yaw + (x - startPosition.x);
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((SmartKey)key)
      {
         case wheelDown: case minus: camera.position.z /= 0.9f; break;
         case wheelUp:   case equal: camera.position.z *= 0.9f; break;
      }
      return true;
   }
}
#ifndef ECERE_MODULE

class BallsApp : GuiApplication
{
   Balls balls {};
   timerResolution = 60;

   bool Init()
   {
      app = this;
      return true;
   }
}
#endif
