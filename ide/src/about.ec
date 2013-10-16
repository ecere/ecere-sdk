#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "licensing"

#if (defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__)
#define X64STRING " (64 bit)"
#else
#define X64STRING " (32 bit)"
#endif

class AboutIDE : Window
{
   borderStyle = sizable;
   hasClose = true;
   minClientSize = { 462, 450 };
   text = $"About the Ecere SDK";
   tabCycle = true;

   EditBox versionCopyright
   {
      this, font = { $"Tahoma", 8.25f, bold = true }, borderStyle = none, background = white, readOnly = true, noCaret = true, multiLine = true, autoSize = true, position = { 13, 128 };
   };

   bool OnPostCreate()
   {
      char * shortVersion = CopyString(REPOSITORY_VERSION);
      char * message;
      char * occ;
      StripQuotes(shortVersion, shortVersion);
      occ = strpbrk(shortVersion, "-+( ");
      if(occ) *occ = '\0';
      message = PrintString(
            "Ecere Software Development Kit (MOD) ", strcmp(shortVersion, "unknown") ? "v" : "", shortVersion, " \"Ryōan-ji\"" X64STRING "\n"
            "Build " REPOSITORY_VERSION "\n"
            "Copyright © 2005-2016 Ecere Corporation\n"
            "Copyright © 1996-2016 Jérôme Jacovella-St-Louis");
      versionCopyright.contents = message;
      delete message;
      delete shortVersion;
      return true;
   }

   Label { this, text = $"Lead Architect and Developer", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 194 } };
   Label { this, text = "Jérôme Jacovella-St-Louis", position = { 250, 194 } };
   Label { this, text = $"Developer (IDE, build system, EDA)", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 214 } };
   Label { this, text = "Réjean Loyer", position = { 250, 214 } };
   Label { this, text = $"With contributions from...", font = { $"Tahoma", 8.25f, bold = true }, position = { 16, 234 } };
   Button licensingBtn
   {
      this, anchor = { left = 40, bottom = 10 }; hotKey = altL; text = $"Software Licenses";
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         LicensesForm { master = this }.Modal();
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
   EditBox credits
   {
      this, borderStyle = none, noCaret = true, readOnly = true, anchor = { left = 16, top = 252, bottom = 38, right = 16 },
      background = { r = 250, g = 252, b = 255 };
      multiLine = true,
      hasVertScroll = true,
      contents =
         "Alexis Naveros\n"
         "   Font Outlines\n"
         "   Modern OpenGL Guidance\n"
         "\n"
         "Local Ottawa eC Users Community\n"
         "  http://www.meetup.com/eC-Programming-Language-Meetup/\n"
         "\n"
         "Darel Rex Finley\n"
         "   Quick sort algorithm\n"
         "\n"
         "Isaac Turner\n"
         "   Safe quick sort wrappers\n"
         "\n"
         "Peng Hai Jie\n"
         "   Testing on FreeBSD\n"
         "\n"
         "Chinese translation Team:\n"
         "   Peng Hai Jie\n"
         "   Ma Yanhong\n"
         "   Li Qi\n"
         "   Mojay Lee\n"
         "   Loonke\n"
         "\n"
         "Ricardo Nabinger Sanchez\n"
         "   Brazilian Portuguese translation\n"
         "   Work on FreeBSD support\n"
         "\n"
         "Juan Sánchez Rangel\n"
         "   Oracle EDA driver\n"
         "   Spanish translation\n"
         "   Finally getting us an IDE toolbar!\n"
         "\n"
         "Wikipedia User:Cquest for Ryoan-ji picture in Sakura season\n"
         "   http://en.wikipedia.org/wiki/File:Kyoto-Ryoan-Ji_MG_4512.jpg\n"
         "\n"
         "Niraj Kulkarni\n"
         "   EditBox fixes\n"
         "   Marathi translation\n"
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
         "   Dutch translation\n"
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
         "Ivan Rubinson\n"
         "   Russian translation\n"
         "   Hebrew translation\n"
         "\n"
         "Vu Tuan Tanh\n"
         "   Vietnamese translation\n"
         "\n"
         "Meggyesházi János\n"
         "   Hungarian translation\n"
         "\n"
         "Necdet Cokyazici\n"
         "   Work on debian packaging and using Ecere in najitool\n"
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
         "   Brazilian portuguese translation\n"
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
         "   Dmitrijs Ledkovs for sponsoring the SDK into Debian/Ubuntu\n"
         "\n"
         "   #launchpad, #ubuntu-packaging,\n"
         "      #ubuntu-motu (tumbleweed, jtaylor, micahg...)\n"
         "      For help with Debian/Ubuntu packaging\n"
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
         "   Linus Torvalds (Git, Linux)"
   };
   /*Label { this, text = "Réjean Loyer, Joey Adams, Max Maton", position = { 124, 176 } };
   */
   //Label { this, text = "Joey Adams", position = { 192, 190 } };
   //Label { this, text = "Max Maton", position = { 192, 204 } };
   Picture picture
   {
      this, size = { 318, 94 }, anchor = { top = 11 }, image = { ":ecere.jpg" };
      cursor = ((GuiApplication)__thisModule).GetCursor(hand);

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         ShellOpen("http://ecere.org/");
         return true;
      }
   };
}
