import "ecere"

BitmapResource knightGfx { ":knight.png" };
BitmapResource dragonGfx { ":dragon.png" };
BitmapResource mageGfx { ":mage.png" };
BitmapResource archerGfx { ":archer.png" };
BitmapResource castleGfx { ":castle.png" };

Array<BitmapResource> gfxResources { [ knightGfx, dragonGfx, mageGfx, archerGfx, castleGfx ] };

class WorldObject
{
   BitmapResource res;

   void Render(Surface surface)
   {
      Bitmap bmp = res ? res.bitmap : null;
      if(bmp)
         surface.Blit(bmp, x, y, 0,0, bmp.width, bmp.height);
   }

public:
   int x, y;
}

class Knight : WorldObject { res = knightGfx; }
class Dragon : WorldObject { res = dragonGfx; }
class Mage : WorldObject { res = mageGfx; }
class Archer : WorldObject { res = archerGfx; }
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

class MainWindow : Window
{
   caption = $"A World of Objects";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };

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
}

MainWindow mainWindow {};
