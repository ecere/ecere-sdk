import "ecere"

BitmapResource knightGfx { ":knight.png" };
BitmapResource dragonGfx { ":dragon.png" };
BitmapResource mageGfx { ":mage.png" };
BitmapResource archerGfx { ":archer.png" };
BitmapResource castleGfx { ":castle.png" };

Array<BitmapResource> gfxResources { [ knightGfx, dragonGfx, mageGfx, archerGfx, castleGfx ] };

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

class Knight : WorldObject { res = knightGfx; selectable = true; }
class Dragon : WorldObject { res = dragonGfx; }
class Mage : WorldObject { res = mageGfx; selectable = true; }
class Archer : WorldObject { res = archerGfx; selectable = true; }
class Castle : WorldObject { res = castleGfx; }

Array<WorldObject> objects
{ [
   Castle { 180, 150 },
   Mage { 50, 50 },
   Archer { 150, 250 },
   Knight { 380, 290 },
   Knight { 120, 150 },
   Dragon { 320, 50 }
] };

WorldObject selected;

class WorldObjectController : WindowController<WorldObject>
{
   bool OnKeyHit(WorldObjectController controller, Key key, unichar ch)
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
            controller.controlled = selected;
            break;
         }
         case left: x -= 5; break;
         case right: x += 5; break;
         case up: y -= 5; break;
         case down: y += 5; break;
      }
      controller.window.Update(null);
      return true;
   }
}

class MainWindow : Window
{
   text = "Keyboard Input Using Controllers";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };

   controller = WorldObjectController { this };

   bool OnCreate()
   {
      selected = objects[1];
      ((WorldObjectController)controller).controlled = selected;
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
      controller = null;
      objects.Free();
   }

   void OnRedraw(Surface surface)
   {
      for(o : objects)
         o.Render(surface);
   }
}

MainWindow mainWindow {};
