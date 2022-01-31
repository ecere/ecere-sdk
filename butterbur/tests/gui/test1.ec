import "AutoLayoutForm"

AutoLayoutForm form1 { contents = Elemental1 { }, clientSize = { 1024, 768 } };

class Elemental1 : Col
{
   bgColor = ivory;
   font = { "Verdana", 20, true };

   Bar c1 { parent = this, bgColor = gray, maxSize = { 1.0, 100 }, alignment = { center, bottom }, caption = "Line 1" };
      Element b0 { parent = c1, caption = "<<", fgColor = white, bgColor = navy, selfAlignment = { left, top } };
      Element b1 { parent = c1, caption = "The", bgColor = red };
      Element b2 { parent = c1, caption = "Quick", bgColor = blue, fgColor = white };
      Element b3 { parent = c1, caption = "Brown" };
      Element b3b { parent = c1, caption = ">>", fgColor = white, bgColor = navy, selfAlignment = { right, top } };
   Bar r3 { parent = this, bgColor = green, maxSize = { 1.0, 150 }/*, caption = "Line 2"*/ };
      Element b4 { parent = r3, caption = "Fox.", bgColor = yellow };
      Element b5 { parent = r3, bgColor = aquamarine, maxSize = { .25, 50 } };
      Element b6 { parent = r3, bgColor = tomato, maxSize = { .5, 50 } };
   Bar r4 { parent = this, bgColor = blue, maxSize = { 1.0, 50 }, /*caption = "Line 3", */fgColor = white };
      Element b7 { parent = r4, caption = "Left", bgColor = skyBlue };
      Element b8 { parent = r4, caption = "Address Bar", bgColor = teal, maxSize.w = 1.0 };
      Element b9 { parent = r4, caption = "Right", bgColor = maroon };
}
