#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class AboutIDE : Window
{
   //nativeDecorations = true;
   text = "About the Ecere SDK";
   borderStyle = fixed;
   size = { 440, 240 };

   Label { this, text = "Ecere Software Development Kit   0.44pre-2010-09-05", font = { "Tahoma", 8.25f, bold = true }, position = { 16, 112 } };
   Label { this, text = "Copyright (c) 1996-2010 Ecere Corporation", font = { "Tahoma", 8.25f, bold = true }, position = { 16, 128 } };
   Label { this, text = "Design & Implementation", font = { "Tahoma", 8.25f, bold = true }, position = { 16, 152 } };
   Label { this, text = "Jérôme Jacovella-St-Louis", position = { 192, 152 } };
   Label { this, text = "Contributors", font = { "Tahoma", 8.25f, bold = true }, position = { 16, 176 } };
   Label { this, text = "Réjean Loyer, Joey Adams, Max Maton", position = { 124, 176 } };
   //Label { this, text = "Joey Adams", position = { 192, 190 } };
   //Label { this, text = "Max Maton", position = { 192, 204 } };

   Picture picture { this, size = { 318, 94 }, anchor = { left = 64, vert = -52 }, image = { ":ecere.jpg", transparent = true } };
   Button button 
   {
      this, text = "OK", isDefault = true, size = { 80, 20 }, anchor = { horz = 167, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return true;
      }
   };
}
