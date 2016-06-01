import "autoLayout"

AutoLayoutForm form1 { contents = Elemental3 { }, clientSize = { 1024, 768 } };

class Elemental3 : Col
{
   bgColor = skyBlue;
   Bar r2 { this, bgColor = blue };
   // Bar r { this, bgColor = beige, minSize.h = 10, maxSize.h = 10 };
   Bar r { this, bgColor = beige, minSize.h = 10, maxSize.h = 10 };
   Bar r3 { this, bgColor = green };
}
