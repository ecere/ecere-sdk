import "base"

class ButtonSlide : BaseSlide
{
   BMBar { this };
   Title title { this, caption = "A Button instance" };

   MBar { this };
   Col t { this, maxSize = { 1550, 1250 }, margin = { 60, 15, 60, 15 } };
      //Header { t, caption = "Features" };
      MBar { t };
      Bullet { t, caption = "Form controls defined as member instances" };
      Bullet { t, caption = "Events defined by overriding methods" };
      BMBar { t };
      SmallHeader { t, caption = "                Syntax:" };
      MBar { t };
      CodeBlock { t, minSize = { 1200, 600 }, caption =
         "Button button1\n"
         "{\n"
         "   this, caption = $\"button1\",\n"
         "   position = { 272, 248 };\n"
         "\n"
         "   bool NotifyClicked(Button button,\n"
         "      int x, int y, Modifiers mods)\n"
         "   {\n"
         "\n"
         "      return true;\n"
         "   }\n"
         "};\n"
      };
}
