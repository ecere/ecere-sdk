import "autoLayout"

AutoLayoutForm form1 { contents = Elemental1 { }, clientSize = { 1024, 768 } };

class Elemental1 : Col
{
   bgColor = ivory;
   font = { "Verdana", 20, true };

   Bar c1 { this, bgColor = gray, maxSize = { 1.0, 100 }, hAlignment = center, vAlignment = right, caption = "Line 1" };
      Element b0 { c1, caption = "<<", fgColor = white, bgColor = navy, selfHAlignment = left, selfVAlignment = left };
      Element b1 { c1, caption = "The", bgColor = red };
      Element b2 { c1, caption = "Quick", bgColor = blue, fgColor = white };
      Element b3 { c1, caption = "Brown" };
      Element b3b { c1, caption = ">>", fgColor = white, bgColor = navy, selfHAlignment = right, selfVAlignment = left };

   Bar r3 { this, bgColor = green, maxSize = { 1.0, 150 }, caption = "Line 2" };
      Element b4 { r3, caption = "Fox.", bgColor = yellow };
      Element b5 { r3, bgColor = aquamarine, maxSize = { .25, 50 } };
      Element b6 { r3, bgColor = tomato, maxSize = { .5, 50 } };
   Bar r4 { this, bgColor = blue, maxSize = { 1.0, 50 }, caption = "Line 3", fgColor = white };
      Element b7 { r4, caption = "Left", bgColor = skyBlue };
      Element b8 { r4, caption = "Address Bar", bgColor = teal, maxSize.w = 1.0 };
      Element b9 { r4, caption = "Right", bgColor = maroon };
}
