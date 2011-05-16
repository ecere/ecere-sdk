import "ruff.ec"

class Trump : Kind
{
   char * OnGetString(char * string, void * fieldData, bool * needClass)
   {
      switch(this)
      {
         case clubs:    strcpy(string, "clubs"); break;
         case diamonds: strcpy(string, "diamonds"); break;
         case hearts:   strcpy(string, "hearts"); break;
         case spades:   strcpy(string, "spades"); break;
         default:       strcpy(string, "None");
      }
      return string;
   }

   void OnDisplay(Surface surface, int x, int y, int width, TrumpDialog trumpDialog, Alignment alignment, DataDisplayFlags flags)
   {
      Bitmap icon = (this != none) ? trumpDialog.icons[this].bitmap : null;
      char name[10];
      int w, h;
      int xStart = icon ? (icon.width + 8) : ((trumpDialog.icons[0].bitmap ? trumpDialog.icons[0].bitmap.width : 0) + 8;
      int len;

      OnGetString(name, trumpDialog, null);
      len = strlen(name);
      
      surface.TextExtent(name, len, &w, &h);
      surface.WriteText(xStart, y, name, len);
 
      // Draw the current row stipple
      if(flags.selected)
      {
         surface.Area(xStart - 3, y, xStart - 3, y + h - 1);
         surface.Area(xStart + w - 1, y, xStart + w + 1, y + h - 1);
      }
      if(flags.current && flags.active)
      {
         surface.LineStipple(0x5555);
         if(flags.selected)
            surface.SetForeground(Color { 255, 255, 128 });
         else
            surface.SetForeground(black);
         surface.Rectangle(xStart - 3, y, xStart + w + 1, y + h - 1);
         surface.LineStipple(0);
      }
 
      if(icon)
      {
         surface.SetForeground(white);
         surface.Blit(icon, x,y,0,0, icon.width, icon.height);
      }
   }
}

class TrumpDialog : Window
{
   background = activeBorder;
   borderStyle = fixed;
   hasClose = true;
   tabCycle = true;
   size = Size { 200, 94 };
   anchor = Anchor { vert = -28 };

   BitmapResource icons[Kind];

   DataField field { "Trump", userData = this };
   Button ok
   {
      this, text = "OK", isDefault = true, anchor = Anchor { top = 40 }, size = Size { 80 }, hotKey = altO;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Kind trump = (Kind)trumpDrop.GetTag(null);
         //Kind trump = trumpDrop.GetData(null);
         Destroy(trump);
         return true;
      }
   };
   DropBox trumpDrop
   {
      this, noHighlight = true, size = Size { 140 }, anchor = Anchor { top = 10 }
   };

   TrumpDialog()
   {
      DataRow row;

      trumpDrop.AddField(field);
      row = trumpDrop.AddRow(); row.tag = Kind::none; row.SetData(null, none);
      row = trumpDrop.AddRow(); row.tag = Kind::clubs; row.SetData(null, clubs);
      row = trumpDrop.AddRow(); row.tag = Kind::diamonds; row.SetData(null, diamonds);
      row = trumpDrop.AddRow(); row.tag = Kind::hearts; row.SetData(null, hearts);
      row = trumpDrop.AddRow(); row.tag = Kind::spades; row.SetData(null, spades);

      AddResource(icons[clubs] = BitmapResource { ":clubs.bmp" });
      AddResource(icons[diamonds] = BitmapResource { ":diamonds.bmp" });
      AddResource(icons[hearts] = BitmapResource { ":hearts.bmp" });
      AddResource(icons[spades] = BitmapResource { ":spades.bmp" });
   }

   bool OnPostCreate()
   {
      RuffGame * game = &((Ruff)master).game;

      trumpDrop.Activate();
      AI_ComputeBet(&game->players[game->turn]);

      trumpDrop.currentRow = trumpDrop.FindRow(game->players[game->turn].trump);
      return true;
   }
}
