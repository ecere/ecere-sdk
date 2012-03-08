#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "licensing"

class AboutIDE : Window
{
   borderStyle = sizable;
   hasClose = true;
   clientSize = { 440, 440 };
   text = $"About the Ecere SDK";
   tabCycle = true;

   Label { this, text = "Ecere Software Development Kit   v0.44 \"Ryōan-ji\"", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 128 } };
   Label { this, text = "Copyright © 2005-2012 Ecere Corporation",         font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 144 } };
   Label { this, text = "Copyright © 1996-2012 Jérôme Jacovella-St-Louis", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 160 } };
   Label { this, text = $"Lead Architect and Developer", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 188 } };
   Label { this, text = "Jérôme Jacovella-St-Louis", position = { 192, 188 } };
   Label { this, text = $"With contributions from...", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 208 } };
   Button licensingBtn
   {
      this, anchor = { left = 40, bottom = 10 }; hotKey = l; text = "Software Licenses";
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         LicensesForm { master = this }.Modal();
         return true;
      }
   };
   EditBox credits
   {
      this, borderStyle = none, noCaret = true, readOnly = true, anchor = { left = 16, top = 236, bottom = 48, right = 16 },
      background = { r = 250, g = 252, b = 255 };
      multiLine = true,
      hasVertScroll = true,
      contents = 
         "Réjean Loyer\n"
         "   Most of the additional programming on the IDE\n"
         "   Initial EDA design\n"
         "\n"
         "Juan Sánchez\n"
         "   Oracle EDA driver\n"
         "   Spanish translation\n"
         "   Finally getting us an IDE toolbar!\n"
         "\n"
         "Jean-François Bilodeau\n"
         "   Initial Cocoa driver code\n"
         "\n"
         "Ryan Prior\n"
         "   Initial development of the eC testing suite\n"
         "   Ideas for an auto-layout GUI\n"
         "   Work on debian packaging\n"
         "\n"
         "Joey Adams\n"
         "   The bootstrapping system idea\n"
         "   X driver improvements\n"
         "   PPC Support\n"
         "\n"
         "Max Maton\n"
         "   Code Editor improvements\n"
         "\n"
         "Ricardo Nabinger Sanchez\n"
         "   Work on FreeBSD support\n"
         "\n"
         "Li Qi\n"
         "   Internationalization, many good samples on the forums\n"
         "\n"
         "Gaetan Loyer\n"
         "   Our logo and 3D art (e.g. chess set)\n"
         "\n"
         "Walter Charles Griffin\n"
         "   Documentation, our mascott Ollie the Sea Otter\n"
         "\n"
         "Necdet Cokyazici\n"
         "   Work on debian packaging and using Ecere in najitool\n"
         "\n"
         "Chinese translation Team:\n"
         "   Ma Yanhong\n"
         "   Li Qi\n"
         "   Mojay Lee\n"
         "   Loonke\n"
         "\n"
         "Making the Forums alive and forcing me to write good info:\n"
         "   D. Bane\n"
         "   Sam Hu\n"
         "\n"
         "Chris Goffinet and JF (_Demo_)\n"
         "   Our work on the Dreamix Project drove us to\n"
         "   develop eC and the Acovel Media Player\n"
         "\n"
         "Herbert Elwood Gilliland III\n"
         "   Presentation art engine and OpenAL bindings\n"
         "   Lots of feedback on the SDK\n"
         "\n"
         "Zou Yuan Jia\n"
         "   Bringing Ecere to China\n"
         "\n"
         "Bart van der Werf\n"
         "   Insightful discussions, testing Ecere Blokus!\n"
         "\n"
         "Luis Felipe Righi Flores\n"
         "   Brazilian portuguese translation (under way)\n"
         "\n"
         "Special Thanks\n"
         "\n"
         "   Our ecere.com hosts, past and present\n"
         "\n"
         "   Sanyaade Adekoya\n"
         "\n"
         "   ##programming on FreeNode\n"
         "\n"
         "   All the guys on #ecere for moral support\n"
         "\n"
         "   #launchpad, #ubuntu-packaging, #ubuntu-motu (tumbleweed, jtaylor...)\n"
         "     For help to finally resolve these PPA issues!\n"
         "\n"
         "   freebyte.com\n"
         "\n"
         "   devmaster.net\n"
         "\n"
         "   GitHub\n"
         "\n"
         "   The Software Developer's Journal\n"
         "\n"
         "Very Special Thanks\n"
         "\n"
         "   Dennis M. Ritchie (C)\n"
         "\n"
         "   Richard M. Stallman (Bison, GCC)\n"
         "\n"
         "   Linus Torvalds (Git, Linux)\n"
   };
   /*Label { this, text = "Réjean Loyer, Joey Adams, Max Maton", position = { 124, 176 } };
   */
   //Label { this, text = "Joey Adams", position = { 192, 190 } };
   //Label { this, text = "Max Maton", position = { 192, 204 } };
   Picture picture
   {
      this, size = { 318, 94 }, position = { 64, 11 }, image = { ":ecere.jpg" };
      cursor = ((GuiApplication)__thisModule).GetCursor(hand);

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         ShellOpen("http://www.ecere.com/");
         return true;
      }
   };
   Button button 
   {
      this, text = $"OK", isDefault = true, size = { 80, 20 }, anchor = { right = 13, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return true;
      }
   };
}
