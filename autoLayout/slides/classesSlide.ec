import "base"

class ClassesSlide : BaseSlide
{
   BMBar { this };
   Title title { this, caption = "Classes" };

   MBar { this };
   //Col t { this, maxSize = { 1450, 1150 }, margin = { 115, 15, 115, 15 } };
   Col t { this, maxSize = { 1550, 1250 }, margin = { 60, 15, 60, 15 } };
      //Header { t, caption = "Features" };
      BMBar { t };
      Bullet { t, caption = "Define a 'class' of objects for reusability" };
      Bullet { t, caption = "Inheritance to define specialized classes" };
      Bullet { t, caption = "Can contain methods, properties and data members" };
      BMBar { t };
      SmallHeader { t, caption = "                Syntax:" };
      MBar { t };
      CodeBlock { t, minSize = { 900, 550 }, caption =
         "class MyClass : MyBaseClass\n"
         "{\n"
         "   SomeType member1;\n"
         "\n"
         "   member1 = someDefaultValue;\n"
         "\n"
         "   void someMethod()\n"
         "   {\n"
         "   }\n"
         "}";
      };
}
