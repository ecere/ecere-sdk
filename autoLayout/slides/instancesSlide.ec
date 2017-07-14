import "base"

class InstancesSlide : BaseSlide
{
   BMBar { this };
   Title title { this, caption = "Instances" };

   MBar { this };
   //Col t { this, maxSize = { 1450, 1150 }, margin = { 115, 15, 115, 15 } };
   Col t { this, maxSize = { 1550, 1250 }, margin = { 60, 15, 60, 15 } };
      //Header { t, caption = "Features" };
      BMBar { t };
      Bullet { t, caption = "Multiple objects can be instantiated from same class" };
      Bullet { t, caption = "Value of members can be modified from defaults" };
      Bullet { t, caption = "Virtual methods can be overridden" };
      BMBar { t };
      SmallHeader { t, caption = "                Syntax:" };
      MBar { t };
      CodeBlock { t, minSize = { 920, 320 }, caption =
         "// Named Instance (declaration)\n"
         "MyClass object { member = value };\n"
         "\n"
         "// Anonymous Instance (expression)\n"
         "MyClass { member = value };"
      };
}
