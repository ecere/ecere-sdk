import "base"

class FormSlide : BaseSlide
{
   BMBar { this };
   Title title { this, caption = "A Form class" };

   MBar { this };
   Col t { this, maxSize = { 1550, 1250 }, margin = { 60, 15, 60, 15 } };
      //Header { t, caption = "Features" };
      MBar { t };
      Bullet { t, caption = "The Ecere library provides a cross-platform GUI toolkit." };
      Bullet { t, caption = "All controls and form derive from the Window class." };
      Bullet { t, caption = "Let's define a Form class inheriting from Window:" };
      BMBar { t };
      SmallHeader { t, caption = "                Syntax:" };
      MBar { t };
      CodeBlock { t, minSize = { 900, 600 }, caption =
         "import \"ecere\"\n"
         "class Form : Window\n"
         "{\n"
         "   caption = $\"My Form\";\n"
         "   background = formColor;\n"
         "   borderStyle = sizable;\n"
         "   hasMaximize = true;\n"
         "   hasMinimize = true;\n"
         "   hasClose = true;\n"
         "   clientSize = { 640, 480 };\n"
         "}\n"
         "Form form { };\n"
      };
}
