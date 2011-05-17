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
   text = "Moving objects around with the keyboard";
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

   void OnDestroy()
   {
      objects.Free();
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
            case left: selected.x -= 5; break;
            case right: selected.x += 5; break;
            case up: selected.y -= 5; break;
            case down: selected.y += 5; break;
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
               break;
            }
         }
         Update(null);
      }
      return true;
   }
}

MainWindow mainWindow {};
