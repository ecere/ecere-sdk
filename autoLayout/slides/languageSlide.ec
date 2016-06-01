import "base"

class LanguageSlide : BaseSlide
{
   BMBar { this };
   Title title { this, caption = "The eC Language" };

   MBar { this };
   //Col t { this, maxSize = { 1450, 1150 }, margin = { 115, 15, 115, 15 } };
   Col t { this, maxSize = { 1550, 1250 }, margin = { 60, 15, 60, 15 } };
      //Header { t, caption = "Features" };
      BMBar { t };
      Bullet { t, caption = "C Superset" };
      Bullet { t, caption = "C Compatible" };
      Bullet { t, caption = "Native" };
      Bullet { t, caption = "Object-Oriented" };
      Bullet { t, caption = "Properties" };
      Bullet { t, caption = "Modules" };
      Bullet { t, caption = "Reflection" };
      Bullet { t, caption = "Dynamic Imports" };
}
