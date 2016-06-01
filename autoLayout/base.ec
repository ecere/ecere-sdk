import "autoLayout"

class Title : Element { maxSize = { 1430, 0 }, font = { "Verdana", 60, bold = true }, fgColor = textColor; };
class CCol  : Col { hAlignment = center, vAlignment = center; };
class BMBar : Bar { maxSize.h = 60; };
class MBar  : Bar { maxSize.h = 30; };
define textColor = 0xFF2F3A3E;
class Header : Element { font = { "Verdana", 50, bold = true }; fgColor = textColor; }
class SmallHeader : Element { font = { "Verdana", 30, bold = true }; fgColor = textColor; }
class Bullet : Element
{
   fgColor = textColor;
   property const String caption
   {
      set { text.caption = value; }
      get { return text.caption; }
   }
   Element bullet { this, caption = "▪ ", fgColor = 0xFF104A4A; };
   Col text { this, fgColor = textColor; };
}

class BaseSlide : CCol
{
   bitmap = { "graphics/bg1.png" };
   bitmapTint = { 41, white };
   bgColor = 0x59C6D2E3;
   font = { "Verdana", 32 };
}

class CodeBlock : CCol
{
   selfHAlignment = center, selfVAlignment = center;
   vAlignment = center;
   maxSize = { };
   //bgColor = { 180, 0x094B55 };
   bgColor = { 220, black };
   font = { "Consolas", 30 };

   // Since we don't have padding yet
   CCol text { this, fgColor = lime /*white*/; maxSize = { 1.0, 1.0 }; /*margin = { 20, 20, 20, 20 }*/ };
   property const String caption
   {
      set { text.caption = value; }
      get { return text.caption; }
   }
}
