import "ecere"
import "tiles"

// define NILREM_START = Point { 28, 20 };

define NILREM_START = Point { 108, 20 };

TileMap * theMap;
int vx, vy;
bool inTheShop;

define MAPW = 32;
define MAPH = 20;

define SHOP_POS = Point { 30, 20 };

enum TilesType
{
   grass = 0,
   forest = 1,
   rock = 2,
   water = 3
};

enum ItemType
{
   none = -1,
   lightShield = 0,
   dagger,
   longSword,
   battleSword,
   heavyShield,
   helmet,
   steelBoots,
   lightArmor,
   plateArmor,
   plateLeggings
};

enum EquipmentSlot
{
   head,
   feet,
   body,
   legs,
   leftHand,
   rightHand,
   ring,
   ring2,
   ring3,
   ring4
};

struct ItemStats
{
   const String name;
   int value;
   EquipmentSlot slot;
   bool twoHands;
   int decDamage;
   int difficulty;
   int damage;
};

ItemStats itemStats[ItemType] =
{
   { "Light shield",  20, leftHand, false, 2 },
   { "Dagger",        10, rightHand, false, 0, 2, 2 },
   { "Long sword",    40, rightHand, false, 0, 4, 4 },
   { "Battle sword",  100,rightHand, true,  0, 8, 10 },
   { "Heavy shield",  100, leftHand, false, 5 },
   { "Helmet",         60, head, false, 5 },
   { "Steel boots",    40, feet, false, 2 },
   { "Light armor",    40, body, false, 4 },
   { "Plate armor",   150, body, false, 8 },
   { "Plate leggings", 50, legs, false, 3 }
};

class Spell
{
public:
   int difficulty;
   int damage;
   int manaCost;

   virtual void Backfire(Creature self, Creature opponent)
   {
      self.health -= damage/4;
   }

   virtual void Success(Creature self, Creature opponent)
   {
      if(damage > opponent.health) damage = opponent.health;
      PrintLn(self._class.name, " did ", damage, " damage to ", opponent._class.name, ".");
      opponent.health -= damage;
   }
}


class FireBall : Spell { difficulty = 20, damage = 8; manaCost = 5; };
class Lightning : Spell  { difficulty = 10, damage = 4; manaCost = 3; };
class Healing : Spell
{
   difficulty = 20;
   manaCost = 5;
   void Success(Creature self, Creature opponent)
   {
      self.health += self.maxHealth / 5;
      if(self.health > self.maxHealth) self.health = self.maxHealth;
   }

   void Backfire(Creature self, Creature opponent)
   {
      self.health -= damage/4;
   }
};

class Creature
{
public:
   UnitType type;
   int xp;
   int health, maxHealth;
   int mana, maxMana;
   int dexterity;
   int magic;
   int strength;
   int gold;
   Array<Spell> spells;
   ItemType equipment[EquipmentSlot];

   TileUnit * unit;
}

class Player : Creature
{
   type = player;
public:
   int manaPotions;
   int healthPotions;
   int training;
   spells = { [ FireBall { }, Lightning { }, Healing { } ] };
   Player()
   {
      EquipmentSlot i;
      for(i = 0; i <= EquipmentSlot::ring4; i++)
         equipment[i] = none;
   }
}

class Slug           : Creature { type = slug; xp = 10;  maxHealth = 10;  dexterity = 7; strength = 5; gold = 1; }
class GiantRat       : Creature { type = giantRat; xp = 30;  maxHealth = 20;  dexterity = 9; strength = 8; gold = 3; }
class GiantSpider    : Creature { type = giantSpider; xp = 50;  maxHealth = 30;  dexterity = 20; strength = 10; gold = 4; }
class Bat            : Creature { type = bat; xp = 70;  maxHealth = 10;  dexterity = 40; strength = 5; gold = 6; }
class Goblin         : Creature
{
   type = goblin; xp = 120; maxHealth = 50;  dexterity = 50; strength = 25; gold = 10;
}
class Ghoul          : Creature { type = ghoul; xp = 250; maxHealth = 70;  dexterity = 20; strength = 30; gold = 30; }
class DarkKnight     : Creature
{
   type = darkKnight; xp = 500; maxHealth = 100; dexterity = 50; strength = 50; gold = 50; magic = 30; maxMana = 50;
   spells = { [ FireBall { } ] };

   DarkKnight()
   {
      equipment[head] = helmet;
      equipment[feet] = steelBoots;
      equipment[body] = plateArmor;
      equipment[legs] = plateLeggings;
      equipment[leftHand] = heavyShield;
      equipment[rightHand] = longSword;
   }
};

Array<Class> badGuys { [
   class(Slug), class(GiantRat), class(GiantSpider), class(Goblin), class(Bat), class(DarkKnight), class(Ghoul)
]};

class EvilSorcerer   : Creature
{
   type = evilSorcerer; xp = 1000; maxHealth = 1000; dexterity = 75; strength = 50; gold = 20000; magic = 50; maxMana = 500;
   spells = { [ FireBall { }, Lightning { }, Healing { } ] };

   EvilSorcerer()
   {
      equipment[head] = helmet;
      equipment[feet] = steelBoots;
      equipment[body] = plateArmor;
      equipment[legs] = plateLeggings;
      equipment[leftHand] = heavyShield;
      equipment[rightHand] = longSword;
   }
}

Player player
{
   xp = 0, maxHealth = 40, health = 40, mana = 20,
   maxMana = 20, magic = 20, strength = 10, dexterity = 10, gold = 1000,
   training = 2
};

enum UnitType
{
   none,

   // Creatures
   player,
   slug,
   giantRat,
   giantSpider,
   goblin,
   bat,
   darkKnight,
   ghoul,
   evilSorcerer,

   // Buildings
   hut,
   shop
};


const String unitSpritesFiles[UnitType] =
{
   "",

   // Creatures
   "Nilrem.png",
   "slug.png",
   "giantRat.png",
   "giantSpider.png",
   "goblin.png",
   "bat.png",
   "darkKnight.png",
   "ghoul.png",
   "evilSorcerer.png",

   // Buildings
   "hut.png",
   "shop.png"
};

const Point unitSpritesSize[UnitType] =
{
   { 0, 0 },

   // Creatures
   { 1, 1 },
   { 1, 1 },
   { 1, 1 },
   { 1, 1 },
   { 1, 1 },
   { 1, 1 },
   { 1, 1 },
   { 1, 1 },

   // Buildings
   { 2, 2 },
   { 3, 3 }
};

Sprite unitSprites[UnitType];

struct UnitPlacement
{
   UnitType type;
   Point pos;
};

Array<UnitPlacement> unitPlacements
{ [
   { shop, SHOP_POS },
   { hut, { 10, 10 } },
   { hut, { 3, 15 } },
   { hut, { 5, 7 } },
   { hut, { 8, 19 } },
   { hut, { 18, 18 } },
   { hut, { 17, 17 } } //,
   //{ giantRat, { 120, 22 } }
] };

Array<Creature> creatures { };

define SHOP_ITEMS_POS = Point { 24, 240 };
define SHOP_ITEMS_SPACING = Point { 48, 48 };

class StatsUI : Window
{
   background = black;

   void OnRedraw(Surface surface)
   {
      surface.background = red;
      surface.Area(10, 10, 10 + player.health * 260 / player.maxHealth, 20);
      surface.foreground = white;
      surface.Rectangle(10, 10, 270, 20);
      surface.WriteTextf(10, 24, "Health: %d / %d",
         player.health, player.maxHealth);

      surface.background = blue;
      surface.Area(10, 50, 10 + player.mana * 260 / player.maxMana, 60);
      surface.foreground = white;
      surface.Rectangle(10, 50, 270, 60);
      surface.WriteTextf(10, 64, "Mana: %d / %d",
         player.mana, player.maxMana);

      surface.foreground = gold;
      surface.WriteTextf(10, 90, "Gold coins: %d", player.gold);
   }
}

bool shopInventory[ItemType] =
{
   true, true, true, true, true,
   true, true, true, true, true
};

class ShopUI : Window
{
   ItemType selectedItem;
   selectedItem = none;

   background = black;
   Picture backPic
   {
      this,
      image = { "shop-inside.png" };
      anchor = { top = 0 };
      clickThrough = true;
   };
   Button btnBuy
   {
      backPic,
      master = this,
      disabled = true;
      position = { 220, 470 };
      caption = "Buy item";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ItemStats eq = itemStats[selectedItem];
         EquipmentSlot slot = eq.slot;
         int tradeIn;
         ItemType tradeIn1 = none, tradeIn2 = none;
         if(slot == ring)
            while(player.equipment[slot] != none && slot < ring4)
               slot++;

         if(slot == rightHand && eq.twoHands)
         {
            if(player.equipment[EquipmentSlot::leftHand] != none)
               tradeIn1 = player.equipment[EquipmentSlot::leftHand];
            if(player.equipment[EquipmentSlot::rightHand] != none)
               tradeIn2 = player.equipment[EquipmentSlot::rightHand];
         }
         else if((slot == leftHand || slot == rightHand) && player.equipment[EquipmentSlot::rightHand] != none &&
            itemStats[player.equipment[EquipmentSlot::rightHand]].twoHands)
         {
            if(player.equipment[EquipmentSlot::rightHand] != none)
               tradeIn1 = player.equipment[EquipmentSlot::rightHand];
         }
         else if(player.equipment[slot] != none)
            tradeIn1 = player.equipment[slot];

         tradeIn = ((tradeIn1 != none ? itemStats[tradeIn1].value : 0) + (tradeIn2 != none ? itemStats[tradeIn2].value : 0)) / 2;
         if(player.gold + tradeIn < eq.value)
            MessageBox { contents =
               "Y'aint got enough money! Watcha gonna do now huh? Run away like a coward? Come back when you have what you promised us!"
            }.Modal();
         else
         {
            char message[1024] = "";
            if(tradeIn1 != none && tradeIn2 != none)
               strcatf(message,
                  "You will need to trade in your %s and %s, for %d .",
                     itemStats[tradeIn1].name, itemStats[tradeIn2].name, tradeIn);
            else if(tradeIn1 != none)
               strcatf(message,
                  "You will need to trade in your %s, for %d. ", itemStats[tradeIn1].name, tradeIn);

            strcatf(message, "Are you sure you want to buy this %s for %d?", eq.name, eq.value);
            if(MessageBox { type = yesNo, contents = message }.Modal() == yes)
            {
               if(tradeIn1 != none) shopInventory[tradeIn1] = true;
               if(tradeIn2 != none) shopInventory[tradeIn2] = true;

               if(eq.twoHands || (tradeIn1 != none && itemStats[tradeIn1].twoHands))
               {
                  player.equipment[leftHand] = none;
                  player.equipment[rightHand] = none;
               }

               player.equipment[slot] = selectedItem;
               player.gold += tradeIn - eq.value;

               shopInventory[selectedItem] = false;
               selectedItem = none;
            }
         }
         return true;
      }
   };

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(x >= SHOP_ITEMS_POS.x && x < SHOP_ITEMS_POS.x + 5 * SHOP_ITEMS_SPACING.x &&
         y >= SHOP_ITEMS_POS.y && y < SHOP_ITEMS_POS.y + 2 * SHOP_ITEMS_SPACING.y)
      {
         int ix = (x - SHOP_ITEMS_POS.x) / SHOP_ITEMS_SPACING.x;
         int iy = (y - SHOP_ITEMS_POS.y) / SHOP_ITEMS_SPACING.y;
         selectedItem = (ItemType)(iy * 5 + ix);
         if(!shopInventory[selectedItem])
            selectedItem = none;
         btnBuy.disabled = selectedItem == none;
         Update(null);
      }
      return true;
   }

   void OnDrawOverChildren(Surface surface)
   {
      ItemType i;
      for(i = 0; i < 10; i++)
      {
         if(shopInventory[i])
         {
            surface.Blit(shopItemsBitmap,
               SHOP_ITEMS_POS.x + (i%5) * SHOP_ITEMS_SPACING.x,
               SHOP_ITEMS_POS.y + (i/5) * SHOP_ITEMS_SPACING.y,
               0, i * 32, 32, 32);
         }
      }
      if(selectedItem != none)
      {
         int ix = selectedItem % 5;
         int iy = selectedItem / 5;
         ItemStats * stats = &itemStats[selectedItem];

         surface.foreground = lime;
         surface.Rectangle(
            SHOP_ITEMS_POS.x + ix * SHOP_ITEMS_SPACING.x - 8,
            SHOP_ITEMS_POS.y + iy * SHOP_ITEMS_SPACING.y - 8,
            SHOP_ITEMS_POS.x + (ix+1) * SHOP_ITEMS_SPACING.x - 8,
            SHOP_ITEMS_POS.y + (iy+1) * SHOP_ITEMS_SPACING.y - 8);

         surface.foreground = white;
         surface.CenterTextf(140, 360, stats->name);
         surface.foreground = gold;
         surface.CenterTextf(140, 400, "%d gold coins", stats->value);
         surface.foreground = whiteSmoke;
         surface.WriteTextf(80, 420, "Damage: %d",
            stats->damage ? stats->damage : -stats->decDamage);
         if(stats->difficulty)
            surface.WriteTextf(80, 440, "Difficulty: %d", stats->difficulty);
      }
   }
}

Bitmap shopItemsBitmap { };

class App : GuiApplication
{
   driver = "OpenGL";
   timerResolution = 60;

   bool wasInForest;
   Time lastSpawnTime;

   Creature findOpponent()
   {
      Creature opponent;
      while(true)
      {
         int c = GetRandom(0, badGuys.count-1);
         opponent = eInstance_New(badGuys[c]);
         if(opponent.xp < 40 || opponent.xp <= player.xp)
            break;
         delete opponent;
      }
      opponent.health = opponent.maxHealth;
      opponent.mana = opponent.maxMana;
      // state = fight;
      return opponent;
   }

   bool Cycle(bool idle)
   {
      Time time = GetTime();

      player.unit->tick++;
      UnitUpdate(theMap, player.unit);
      mainWindow.Update(null);

      if(vx < 1024 - MAPW && player.unit->pos.x > vx + MAPW*3/4)
         vx++;
      else if(vx > 0 && player.unit->pos.x < vx + MAPW/4)
         vx--;

      if(vy < 1024 - MAPH && player.unit->pos.y > vy + MAPH*3/4)
         vy++;
      else if(vy > 0 && player.unit->pos.y < vy + MAPH/4)
         vy--;

      if(theMap->frames[player.unit->pos.y * theMap->dim[1].x + player.unit->pos.x] == TilesType::forest)
      {
         Time timeSinceLastSpawn = time - lastSpawnTime;
         if(wasInForest && GetRandom(1, (int)(timeSinceLastSpawn * 20)) > 95)
         {
            // Create the character unit
            int rx = GetRandom(0, 2)-1, ry = GetRandom(0, 2)-1;
            int px = player.unit->pos.x + rx;
            int py = player.unit->pos.y + ry;

            if((rx || ry) && px >= 0 && py >= 0 && px < theMap->dim[1].x && py < theMap->dim[1].y &&
               !theMap->spaces[1][theMap->dim[0].x * py + px] &&
               theMap->frames[py * theMap->dim[1].x + px] == 1)
            {
               int unitsAround = 0;
               int x, y;
               for(y = py - 2; y < py + 2; y++)
                  for(x = px - 2; x < px + 2; x++)
                  {
                     if(x >= 0 && y >= 0 && x < theMap->dim[1].x && y < theMap->dim[1].y &&
                       theMap->spaces[1][theMap->dim[0].x * y + x])
                       unitsAround++;
                  }
               if(unitsAround < 6)
               {
                  TileUnit * unit = UnitCreate(theMap, 1, px, py, null);
                  Creature creature = findOpponent();

                  unit->direction = rx == -1 ? (ry == 1 ? NorthEast : ry == 0 ? East : SouthEast) :
                                    rx ==  0 ? (ry == 1 ? North : South) :
                                               (ry == 1 ? NorthWest : ry == 0 ? West : SouthWest);
                  unit->w = 1;
                  unit->h = 1;
                  unit->sprite = unitSprites[creature.type];
                  UnitPlace(theMap, unit);
                  creatures.Add(creature);

                  lastSpawnTime = time;
               }
            }
         }
         wasInForest = true;
      }

      if(player.unit->pos.x >= SHOP_POS.x && player.unit->pos.x <= SHOP_POS.x + 2 &&
         player.unit->pos.y >= SHOP_POS.y && player.unit->pos.y <= SHOP_POS.y + 2)
      {
         if(!inTheShop)
         {
            mainWindow.shopUI.visible = true;
            inTheShop = true;
         }
      }
      else
      {
         mainWindow.shopUI.visible = false;
         inTheShop = false;
      }
      return true;
   }
}

class MainMap : Window
{
   void OnRedraw(Surface surface)
   {
      //int w = clientSize.w;
      //int h = clientSize.h;

      surface.background = skyBlue;

      surface.Clear(colorBuffer);
      MapRedraw(theMap, surface, vx, vy, MAPW, MAPH);

      //surface.background = green;

      //surface.Area(100, 100, 200, 200);

      //surface.WriteTextf(10, 10, "Welcome to TilesRPG!");
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      UnitMove(theMap, player.unit, { vx + x / 32, vy + y / 32 });
      return true;
   }
}

static const String chInventoryItems[] =
{
   "ch-LightShield.png",
   "ch-Dagger.png",
   "ch-LongSword.png",
   "ch-battleSword.png",
   "ch-HeavyShield.png",
   "ch-Helmet.png",
   "ch-SteelBoots.png",
   "ch-LightArmor.png",
   "ch-PlateArmor.png",
   "ch-Leggings.png"
};

class CharacterUI : Window
{
   ItemType selectedItem;
   selectedItem = none;
   Bitmap bmpItems[10];

   background = black;
   Picture backPic
   {
      this,
      image = { "character.png" };
      anchor = { top = 0 };
      clickThrough = true;
   };

   bool OnLoadGraphics()
   {
      ItemType i;
      for(i = ItemType::lightShield; i <= ItemType::plateLeggings; i++)
      {
         bmpItems[i] = { alphaBlend = true };
         bmpItems[i].Load(chInventoryItems[i], null, displaySystem);
      }
      return true;
   }

   void OnDrawOverChildren(Surface surface)
   {
      EquipmentSlot i;
      for(i = 0; i <= EquipmentSlot::ring4; i++)
      {
         ItemType type = player.equipment[i];
         if(type != none)
         {
            Bitmap bmp = bmpItems[type];
            if(bmp)
               surface.Blit(bmp, 0, 0, 0, 0, bmp.width, bmp.height);
         }
      }
   }
}

class TilesRPGWindow : Window
{
   caption = $"TilesRPG";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   // clientSize = { 892, 323 };
   clientSize = { 1370, 700 };
   //position = {  };
   //state = maximized;   //displayDriver = "OpenGL";

   MainMap mainMap
   {
      this,
      clientSize = { MAPW * 32, MAPH * 32 };
      position = { 24, 24 };
      borderStyle = bevel;
   };

   CharacterUI characterUI
   {
      this,
      clientSize = { 280, 500 };
      anchor = { top = 0, right = 5 };
   };

   ShopUI shopUI
   {
      this,
      visible = false;
      caption = "The Shop";
      clientSize = { 280, 500 };
      anchor = { top = 0, right = 5 };
   };

   StatsUI stasUI
   {
      this,
      clientSize = { 280 };
      anchor = { top = 500, right = 5, bottom = 0 };
   };

   TilesRPGWindow()
   {
      File f = FileOpen("map1.map", read);
      if(f)
      {
         int y = 0;
         char mapLine[1030];
         int i;

         theMap = MapCreate(3, 1024, 1024, 32, 32, 4);
         for(i = 0; i < 3; i++)
         {
            theMap->dim[0] = { 1024, 1024 };
            theMap->spaces[i] = new0 TileUnit * [1024 * 1024];
            theMap->moves[i] = new0 byte[1024 * 1024];
         }
         theMap->dim[1] = { 1024, 1024 };
         theMap->dim[2] = { 1024, 1024 };
         while(true)
         {
            if(f.GetLine(mapLine, sizeof(mapLine)) && y < theMap->maxDim.y)
            {
               int x;

               for(x = 0; x < theMap->maxDim.x; x++)
               {
                  char ch = mapLine[x];
                  if(ch >= '0' && ch <= '9')
                     theMap->frames[y * theMap->maxDim.x + x ] =
                        (uint16)(ch - '0');
                  else
                     break;
               }
               y++;
            }
            else
               break;
         }
         delete f;

         for(y = 0; y < 1024; y++)
         {
            int x;

            for(x = 0; x < 1024; x++)
            {
               uint16 frame = theMap->frames[y * 1024 + x];
               theMap->moves[1][y * 1024 + x] = frame < 2;
            }
         }
      }

      // Initialize the creatures and buildings sprites
      {
         UnitType u;
         for(u = player; u <= shop; u++)
            unitSprites[u] = { };
      }

      // Create the character unit
      player.unit = UnitCreate(theMap, 1, NILREM_START.x, NILREM_START.y, null);
      player.unit->direction = South;
      player.unit->w = 1;
      player.unit->h = 1;
      player.unit->sprite = unitSprites[player];
      UnitPlace(theMap, player.unit);

      // Place the buildings units
      for(u : unitPlacements)
      {
         UnitPlacement p = u;
         UnitType t = p.type;
         Point pos = p.pos;
         TileUnit * unit = UnitCreate(theMap, 0, pos.x, pos.y, null);
         if(t != shop)
            unit->covering[1] = 1;
         unit->direction = North;
         unit->w = unitSpritesSize[t].x;
         unit->h = unitSpritesSize[t].y;
         unit->sprite = unitSprites[t];
         UnitPlace(theMap, unit);
      }
   }

   bool OnLoadGraphics()
   {
      bool result = false;
      int i;
      Bitmap mapTiles { };
      if(mapTiles.Load("mapTiles.png", null, null))
      {
         mapTiles.Convert(null, pixelFormat888, null);

         for(i = 0; i < theMap->numTiles; i++)
         {
            theMap->tileImage[i] = { };
            theMap->tileImage[i].Allocate(null, theMap->tileW, theMap->tileH, 0, pixelFormat888, false);
            theMap->tileImage[i].Grab(mapTiles, 0, i * theMap->tileH);
            theMap->tileImage[i].MakeDD(displaySystem);
         }
         result = true;
      }
      delete mapTiles;

      // Load the creatures and buildings sprites
      {
         UnitType u;
         for(u = player; u <= shop; u++)
            unitSprites[u].Load(unitSpritesFiles[u], null, true, false, null, displaySystem);
      }

      shopItemsBitmap.LoadT("items.png", null, displaySystem);
      return result;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case right:
            player.unit->direction = East;
            break;
         case left:
            player.unit->direction = West;
            break;
         case up:
            player.unit->direction = North;
            break;
         case down:
            player.unit->direction = South;
            break;
      }
      Update(null);
      return true;
   }
}

TilesRPGWindow mainWindow {};
