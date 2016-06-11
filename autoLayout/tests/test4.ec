import "autoLayout"

class Elemental4 : Col
{
   font = { "Verdana", 20, true };
   bgColor = ivory;

   Bar header { this, bgColor = blue };
   Bar middle { this, bgColor = white };
      Col col1 { middle, bgColor = lime };
         Element e1 { col1, caption = "Foo", bgColor = gray, selfHAlignment = center, selfVAlignment = center };
      Col col2 { middle, bgColor = skyBlue };
         Element e2 { col2, caption = "Bar", bgColor = lightGray, selfHAlignment = center, selfVAlignment = center };
      Col col3 { middle, bgColor = tomato };
         Element e3 { col3, caption = "Third", bgColor = lightGray, selfHAlignment = center, selfVAlignment = center };
   Bar footer { this, bgColor = red };
}
