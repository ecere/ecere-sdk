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

#if 0
class Elemental : Col
{
   Bar r1
   {
      Element b0 { caption = "<<" };
      Bar s1 { };
      Element b1 { caption = "The" };
      Element b2 { caption = "Quick" };
      Element b3 { caption = "Brown" };
      Bar s2 { };
   };
   Bar r2
   {
      Element b4 { caption = "Fox." };
      Element b5 { };
      Element b6 { };
   };
   Bar r3
   {
      Element b7 { caption = "Left" };
      Element b8 { caption = "Address Bar" };
      Element b9 { caption = "Right" };
   };
}

{ [
   { "class == Elemental", bgColor = ivory },
   { "id == Elemental::r1", bgColor = gray, maxSize = { 100%, 100 } },
   { "id == Elemental::b0", fgColor = white, bgColor = navy },
   { "id == Elemental::b1", bgColor = red },
   { "id == Elemental::b2", bgColor = blue, fgColor = white },

   { "id == Elemental::r2", bgColor = lightGray, maxSize = { 100%, 150 } },
   { "id == Elemental::b4", bgColor = yellow },
   { "id == Elemental::b5", bgColor = aquamarine, maxSize = { 25%, 50 } },
   { "id == Elemental::b6", bgColor = tomato, maxSize = { 50%, 50 } },

   { "id == Elemental::r3", bgColor = lightGray, maxSize = { 100%, 0 } },
   { "id == Elemental::b7", bgColor = skyBlue },
   { "id == Elemental::b8", bgColor = teal, maxSize.w = 100% },
   { "id == Elemental::b9", bgColor = maroon }
] };
#endif // 0
