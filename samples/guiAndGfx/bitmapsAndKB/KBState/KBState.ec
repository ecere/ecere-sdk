import "ecere"

BitmapResource peasantGfx { ":peasant.png" };
BitmapResource dragonGfx { ":dragon.png" };
BitmapResource mageGfx { ":mage.png" };
BitmapResource archerGfx { ":archer.png" };
BitmapResource castleGfx { ":castle.png" };

Array<BitmapResource> gfxResources { [ peasantGfx, dragonGfx, mageGfx, archerGfx, castleGfx ] };

class WorldObject
{
   bool selectable;
   BitmapResource res;

   void Render(Surface surface)
   {
      Bitmap bmp = res ? res.bitmap : null;
      if(bmp)
      {
         surface.Blit(bmp, x, y, 0,0, bmp.width, bmp.height);
         if(this == selected)
         {
            surface.foreground = lime;
            surface.Rectangle(x-1, y-1, x + bmp.width, y + bmp.height);
            surface.foreground = white;
            surface.Rectangle(x-2, y-2, x + bmp.width+1, y + bmp.height+1);
         }
      }
   }

public:
   int x, y;
}

class Peasant : WorldObject { res = peasantGfx; selectable = true; }
class Dragon : WorldObject { res = dragonGfx; }
class Mage : WorldObject { res = mageGfx; selectable = true; }
class Archer : WorldObject { res = archerGfx; selectable = true; }
class Castle : WorldObject { res = castleGfx; }

Array<WorldObject> objects
{ [
   Castle { 180, 150 },
   Mage { 50, 50 },
   Archer { 150, 250 },
   Peasant { 380, 290 },
   Peasant { 120, 150 },
   Dragon { 320, 50 }
] };

WorldObject selected;

class MainWindow : Window
{
   text = "State based keyboard input";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };

   bool OnCreate()
   {
      selected = objects[1];
      return true;
   }

   bool OnLoadGraphics()
   {
      for(r : gfxResources)
         AddResource(r);
      return true;
   }

   void OnUnloadGraphics()
   {
      for(r : gfxResources)
         RemoveResource(r);
   }

   void OnDestroy()
   {
      objects.Free();
   }

   void OnRedraw(Surface surface)
   {
      for(o : objects)
         o.Render(surface);
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(selected)
      {
         switch(key)
         {
            case tab:
            {
               Iterator<WorldObject> it { objects };
               it.Find(selected);
               do
               {
                  if(!it.Next())
                     it.Next();
                  selected = it.data;
               } while(!selected.selectable);
               Update(null);
               break;
            }
         }
         Update(null);
      }
      return true;
   }
}

define moveSpeed = 100.0; // 100 pixels per seconds

class SampleApp : GuiApplication
{
   timerResolution = 60;
   bool Cycle(bool idle)
   {
      bool moved = false;
      static Time lastTime;
      Time time = GetTime(), diffTime = time - lastTime;
      if(diffTime >= 1 / moveSpeed)
      {
         if(selected)
         {
            if(GetKeyState(left))  { selected.x -= diffTime * 100 - 0.5; moved = true; }
            if(GetKeyState(right)) { selected.x += diffTime * 100;       moved = true; }
            if(GetKeyState(up))    { selected.y -= diffTime * 100 - 0.5; moved = true; }
            if(GetKeyState(down))  { selected.y += diffTime * 100;       moved = true; }
            if(moved)
               mainWindow.Update(null);
         }
         lastTime = time;
      }
      return !moved;
   }
}

MainWindow mainWindow {};
