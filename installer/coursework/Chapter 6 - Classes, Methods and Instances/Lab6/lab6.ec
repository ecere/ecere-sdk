import "ecere"
#include <stdio.h>

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
   int xp;
   int health, maxHealth;
   int mana, maxMana;
   int dexterity;
   int magic;
   int strength;
   int gold;
   Array<Spell> spells;
   Array<Equipment> equipment;

   void CastSpell(Spell spell, Creature opponent)
   {
      if(mana >= spell.manaCost)
      {
         int r = GetRandom(0, spell.difficulty);
         mana -= spell.manaCost;
         if(magic >= r)
         {
            PrintLn(_class.name, " cast ", spell._class.name, " successfully.");
            spell.Success(this, opponent);
         }
         else if(r > magic * 2)
         {
            PrintLn(_class.name, "'s ", spell._class.name, " backfired.");
            spell.Backfire(this, opponent);
         }
         else
            PrintLn(_class.name, " unsucessfully cast ", spell._class.name, ".");
      }
   }

   void Attack(Creature opponent)
   {
      Weapon weapon = (Weapon)(equipment ? equipment[EquipmentSlot::rightHand] : null);
      int d, r, o;
      if(!weapon) weapon = bareHand;
      o = GetRandom(0, opponent.dexterity);
      d = GetRandom(0, dexterity - weapon.difficulty);
      if(d > o)
      {
         int d = GetRandom(1, strength);
         int where = GetRandom(0, 100);
         int armor = 0;
         int howBad = 0;
         EquipmentSlot slot;
         int damage;
         
         if(where < 60)
         {
            slot = body;
            howBad = 2;
         }
         else if(where < 80)
         {
            slot = head;
            howBad = 3;
         }
         else if(where < 95)
         {
            slot = legs;
            howBad = 1;
         }
         else 
         {
            slot = feet;
            howBad = 1;
         }
         if(opponent.equipment && opponent.equipment[slot])
            armor = ((Armor)opponent.equipment[slot]).decDamage;
         damage = Max(1, (d * weapon.damage - armor) * howBad / 10);
         if(damage > opponent.health) damage = opponent.health;
         opponent.health -= damage;
         PrintLn(_class.name, " did ", damage, " damage to ", opponent._class.name, ".");
      }
      else
         PrintLn(_class.name, " missed.");
   }
}

Weapon bareHand { difficulty = 3, damage = 1 };

enum EquipmentSlot { leftHand, rightHand, head, feet, body, legs, ring, ring2, ring3, ring4 };

class Equipment
{
public:
   /*int modMagic;
   int modHealth;
   int modDexterity;*/
   int value;
   EquipmentSlot slot;
   bool twoHands;

   virtual void Show();
}

class Armor : Equipment
{
public:
   int decDamage;

   void Show()
   {
      Print("Damage -", decDamage);
   }
}

class Weapon : Equipment
{
public:
   int difficulty;
   int damage;

   void Show()
   {
      Print("Difficulty: ", difficulty, ", Damage +", damage);
   }
}

class LightShield : Armor { decDamage = 2; slot = leftHand; value = 20; };
class HeavyShield : Armor { decDamage = 5; slot = leftHand; value = 100; };
class Helmet      : Armor { decDamage = 5; slot = head; value = 60; };
class SteelBoots  : Armor { decDamage = 2; slot = feet; value = 40; };
class LightArmor  : Armor { decDamage = 4; slot = body; value = 40; };
class PlateArmor  : Armor { decDamage = 8; slot = body; value = 150; };
class PlateLeggings : Armor { decDamage = 3; slot = legs; value = 50; };

class Dagger      : Weapon { difficulty = 2, damage = 2, value  = 10, slot = rightHand; };
class LongSword   : Weapon { difficulty = 4, damage = 4, value  = 40, slot = rightHand; };
class BattleSword : Weapon { difficulty = 8, damage = 10, value = 100, slot = rightHand, twoHands = true; };

class Slug           : Creature { xp = 10;  maxHealth = 10;  dexterity = 7; strength = 5; gold = 1; }
class GiantRat       : Creature { xp = 30;  maxHealth = 20;  dexterity = 9; strength = 8; gold = 3; }
class GiantSpider    : Creature { xp = 50;  maxHealth = 30;  dexterity = 20; strength = 10; gold = 4; }
class Bat            : Creature { xp = 70;  maxHealth = 10;  dexterity = 40; strength = 5; gold = 6; }
class Goblin         : Creature
{
   xp = 120; maxHealth = 50;  dexterity = 50; strength = 25; gold = 10;
}
class Ghoul          : Creature { xp = 250; maxHealth = 70;  dexterity = 20; strength = 30; gold = 30; }
class DarkKnight     : Creature
{
   xp = 500; maxHealth = 100; dexterity = 50; strength = 50; gold = 50; magic = 30; maxMana = 50;
   spells = { [ FireBall { } ] };
   equipment = { [ HeavyShield { }, LongSword { }, Helmet { }, SteelBoots { }, PlateArmor { }, PlateLeggings { }, null, null, null, null ] };
};

Array<Class> badGuys { [ class(Slug), class(GiantRat), class(GiantSpider), class(Goblin), class(Bat), class(DarkKnight), class(Ghoul) ] };

class EvilSorcerer   : Creature
{
   xp = 1000; maxHealth = 1000; dexterity = 75; strength = 50; gold = 20000; magic = 50; maxMana = 500;
   equipment = { [ HeavyShield { }, LongSword { }, Helmet { }, SteelBoots { }, PlateArmor { }, PlateLeggings { }, null, null, null, null ] };
   spells = { [ FireBall { }, Lightning { }, Healing { } ] };
}

Array<Equipment> shopInventory
{
   [
      Dagger { },
      LongSword { },
      BattleSword { },

      LightShield { },
      HeavyShield { },
      Helmet { },
      SteelBoots { },
      LightArmor { },
      PlateArmor { },
      PlateLeggings { }
   ]
};

enum GameState { realm, shop, fight, training, sorcerer, end };

class Player : Creature
{
public:
   int manaPotions;
   int healthPotions;
   int training;
   spells = { [ FireBall { }, Lightning { }, Healing { } ] };
   equipment = { [ null, null, null, null, null, null, null, null, null, null ] };
}

Player player { xp = 0, maxHealth = 40, health = 40, mana = 20, maxMana = 20, magic = 10, strength = 10, dexterity = 10, gold = 50, training = 2 };
Creature opponent;

class RPGApp : Application
{
   GameState state;
   char command[1024];

   void PrintStatus()
   {
      PrintLn("");
      switch(state)
      {
         case sorcerer:
         case fight:
            PrintLn("You are fighting a ", opponent._class.name);
            PrintLn(opponent._class.name, "'s Health: ", opponent.health, "/",opponent.maxHealth);
            PrintLn("Your Health: ", player.health, "/", player.maxHealth, ", Mana: ", player.mana, "/",player.maxMana);
            PrintLn("[A]ttack");
            PrintLn("[R]un");
            if(player.healthPotions)
               PrintLn("[H]ealth potion");
            if(player.manaPotions)
               PrintLn("[M]ana potion");
            if(player.spells.count)
            {
               int n = 1;
               PrintLn("Cast a spell:");
               for(s : player.spells)
                  PrintLn("   ", n++, ". ", s._class.name);
            }
            break;
         case shop:
         {
            int n = 1;
            PrintLn("Welcome to the village shop! What could we interest you in?");
            PrintLn("   [H]ealth potions (10)  [M]ana potions (15)  Go [B]ack to the realm");
            PrintLn("   You have ", player.gold, " gold coins");
            for(i : shopInventory)
            {
               Print("   ", n++, ". ", i._class.name, ": ");
               i.Show();
               PrintLn(" (", i.value, ")");
            }
            break;
         }
         case realm:            
            PrintLn("You are wandering in the realm. What would you like to do?");
            PrintLn("[F]ight bad guys   Visit the [S]hop   [R]est     St[a]ts");
            if(player.xp >= 1000)
               PrintLn("Are you ready to rescue the [P]rincess?");
            if(player.training)
               PrintLn("Do you want to [T]rain? You have ", player.training, " training points.");
            break;
         case training:
            PrintLn("You have ", player.training, " training points. What would you like to improve?");
            PrintLn("[H]ealth");
            PrintLn("[M]ana");
            PrintLn("[S]trength");
            PrintLn("[D]exterity");
            PrintLn("Ma[g]ic");
            PrintLn("   Go [B]ack to the realm");
            break;
      }
   }

   void GetCommand()
   {
      gets(command);
      strlwr(command);
   }
   bool AreYouSure()
   {
      char input[1024];
      gets(input);
      strlwr(command);
      return input[0] == 'y';
   }

   void OpponentAttacks()
   {
      if(opponent.health > 0 && player.health > 0)
      {
         if(opponent.spells && opponent.spells.count && opponent.mana > opponent.maxMana / 5)
         {
            if(GetRandom(0,1) == 1)
            {
               int s = GetRandom(0, opponent.spells.count-1);
               if(opponent.mana >= opponent.spells[s].manaCost)
                  opponent.CastSpell(opponent.spells[s], player);
               else
                  opponent.Attack(player);
            }
            else
               opponent.Attack(player);
         }
         else
            opponent.Attack(player);
      }
      if(player.health <= 0)
      {
         PrintLn("You died :(");
         state = end;
      }
      else if(opponent.health <= 0)
      {
         int trainingPointsBefore = player.xp / 50;
         PrintLn("Congratulations! You won the fight. You gained ", opponent.xp/10, " xp points and ", opponent.gold, " gold.");
         player.gold += opponent.gold;
         player.xp += opponent.xp / 10;
         player.training += player.xp / 50 - trainingPointsBefore;
         delete opponent;
         if(state == sorcerer)
            PrintLn("You saved the princess!! The end.");
         state = realm;
      }
   }

   void FindOpponent()
   {
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
      state = fight;
   }

   void ProcessCommand()
   {
      if(command[0] == 'q')
      {
         PrintLn("Are you sure you want to quit?");
         if(AreYouSure())
            state = end;
      }
      switch(state)
      {
         case shop:
            switch(command[0])
            {
               case 'b': state = realm; break;
               case 'm': case 'h':
               {
                  int price = (command[0] == 'm') ? 15 : 10;
                  if(player.gold < price)
                     PrintLn("You do not have enough gold!");
                  else
                  {
                     (command[0] == 'm') ? player.manaPotions++ : player.healthPotions++;
                     player.gold -= price;
                  }
                  break;
               }
               default:
               {
                  int item = atoi(command);
                  if(item && item <= shopInventory.count)
                  {
                     Equipment eq = shopInventory[item-1];
                     EquipmentSlot slot = eq.slot;
                     int tradeIn;
                     Equipment tradeIn1 = null, tradeIn2 = null;
                     if(slot == ring)
                        while(player.equipment[slot] && slot < ring4)
                           slot++;
                     
                     if(slot == rightHand && eq.twoHands)
                     {
                        if(player.equipment[EquipmentSlot::leftHand])
                           tradeIn1 = player.equipment[EquipmentSlot::leftHand];
                        if(player.equipment[EquipmentSlot::rightHand])
                           tradeIn2 = player.equipment[EquipmentSlot::rightHand];
                     }
                     else if((slot == leftHand || slot == rightHand) && player.equipment[EquipmentSlot::rightHand] && player.equipment[EquipmentSlot::rightHand].twoHands)
                     {
                        if(player.equipment[EquipmentSlot::rightHand])
                           tradeIn1 = player.equipment[EquipmentSlot::rightHand];
                     }
                     else if(player.equipment[slot])
                        tradeIn1 = player.equipment[slot];
                      
                     tradeIn = ((tradeIn1 ? tradeIn1.value : 0) + (tradeIn2 ? tradeIn2.value : 0)) / 2;
                     if(player.gold + tradeIn < eq.value)
                        PrintLn("You do not have enough gold!");
                     else
                     {
                        if(player.equipment[slot])
                           PrintLn("You will need to trade in your ", player.equipment[slot]._class.name, ", for ", tradeIn, ".");

                        PrintLn("Are you sure you want to buy this ", eq._class.name, " for ", eq.value, "?");
                        if(AreYouSure())
                        {
                           if(tradeIn1) shopInventory.Add(tradeIn1);
                           if(tradeIn2) shopInventory.Add(tradeIn2);
                           player.equipment[slot] = eq;
                           player.gold += tradeIn - eq.value;

                           shopInventory.Remove(shopInventory.Find(eq));

                           //shopInventory.TakeOut(eq);
                        }
                     }
                  }
               }
            }
            break;
         case fight:
         case sorcerer:
         {
            bool fightBack = false;
            switch(command[0])
            {
               case 0:
               case 'a':
                  player.Attack(opponent);
                  fightBack = true;
                  break;
               case 'm':
                  if(player.manaPotions)
                  {
                     player.manaPotions--;
                     player.mana += player.maxMana / 5;
                     if(player.mana > player.maxMana) player.mana = player.maxMana;
                  }
                  break;
               case 'h':
                  if(player.healthPotions)
                  {
                     player.healthPotions--;
                     player.health += player.maxHealth / 5;
                     if(player.health > player.maxHealth) player.health = player.maxHealth;
                  }
                  break;
               case 'r':
                  OpponentAttacks();
                  if(player.health > 0)
                     state = realm;
                  break;
               default:
               {
                  int item = atoi(command);
                  if(item && item <= player.spells.count)
                  {
                     if(player.mana >= player.spells[item-1].manaCost)
                     {
                        player.CastSpell(player.spells[item-1], opponent);
                        fightBack = true;
                     }
                     else
                        PrintLn("Not enough mana to cast that spell.");
                  }
               }
            }
            if(fightBack)
               OpponentAttacks();
            break;
         }
         case realm:
            switch(command[0])
            {
               case 'a':
               {
                  EquipmentSlot c;
                  PrintLn("\nYour statistics:");
                  PrintLn("XP: ", player.xp);
                  PrintLn("Health: ", player.health, "/", player.maxHealth);
                  PrintLn("Mana:   ", player.mana, "/", player.maxMana);
                  PrintLn("Strength: ", player.strength, ", Dexterity: ", player.dexterity, ", Magic: ", player.magic);
                  PrintLn("Gold: ", player.gold);
                  PrintLn("Equipment:");
                  for(c = leftHand; c <= ring4; c++)
                  {
                     Equipment eq = player.equipment[c];
                     if(eq)
                     {
                        Print(c, ": ", eq._class.name, ": ");
                        eq.Show();
                        PrintLn("");
                     }
                  }
                  if(player.manaPotions)
                     PrintLn(player.manaPotions, " mana potions");
                  if(player.healthPotions)
                     PrintLn(player.healthPotions, " health potions");
                  if(player.training)
                     PrintLn(player.training, " training points");
                  break;
               }
               case 's': state = shop; break;
               case 'b': state = realm; break;
               case 'f': FindOpponent(); break;
               case 't': state = training; break;
               case 'p':
                  if(player.xp > 1000)
                  {
                     opponent = EvilSorcerer { };
                     state = sorcerer;
                  }
                  break;
               case 0:
               case 'r':
                  if(GetRandom(0, 3) == 0)
                  {
                     PrintLn("Your rest was interrupted!");
                     FindOpponent();
                     OpponentAttacks();
                  }
                  else
                  {
                     player.health += player.maxHealth / 5;
                     if(player.health > player.maxHealth) player.health = player.maxHealth;
                     player.mana += player.maxMana / 5;
                     if(player.mana > player.maxMana) player.mana = player.maxMana;
                  }
                  break;
            }
            break;
         case training:
         {
            bool valid = true;
            switch(command[0])
            {
               case 'h': player.health += player.maxHealth / 5; player.maxHealth += player.maxHealth / 5; break;
               case 'm': player.mana += player.maxMana / 5; player.maxMana += player.maxMana / 5; break;
               case 's': player.strength += player.strength / 5; break;
               case 'd': player.dexterity += player.dexterity / 5; break;
               case 'g': player.magic += player.magic / 5; break;
               case 'b': state = realm;
               default: valid = false;
            }
            if(valid)
            {
               player.training--;
               if(!player.training)
                  state = realm;
            }
            break;
         }
      }
   }

   void Main()
   {
      RandomSeed((uint)(GetTime()*1000));
      PrintLn("Welcome to this great minimalist RPG!");
      PrintLn("You will need to save the princess from an Evil Sorcerer.");
      PrintLn("But first you should wander the realm to fight the sorcerer's minions, ");
      PrintLn("gaining experience and equipment in the process. You will need to reach");
      PrintLn("at least 1000 experience points to search for the sorcerer's hideout.");
      PrintLn("At any time you can [Q]uit.");
      while(state != end)      
      {
         PrintStatus();
         GetCommand();
         ProcessCommand();
      }
      system("pause");
   }
}
