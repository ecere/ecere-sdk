import "autoLayout"

class Elemental2 : Col
{
   font = { "Verdana", 20, true };
   bgColor = skyBlue;

   Bar r1 { this };
      Col c1 { r1, maxSize.w = 0.25, bgColor = blue };
      Col c2 { r1, maxSize.w = 0.5, bgColor = red };
      Col c3 { r1, maxSize.w = 0.25, bgColor = blue };

   Bar r { this, bgColor = beige, minSize.h = 10, maxSize.h = 10 };

   Bar r2 { this };
      Col d1 { r2, maxSize.w = 0.25, bgColor = blue };
      Col d11 { r2, maxSize.w = 0.5, caption = "Hello", bgColor = green };
      Col d2 { r2, maxSize.w = 0.5, bgColor = red };
      Col d3 { r2, maxSize.w = 0.25, bgColor = blue };
      Col d4 { r2, maxSize.w = 0.25, bgColor = green };

   Bar rr { this, bgColor = beige, minSize.h = 10, maxSize.h = 10 };

   Bar r3 { this };
      Col { r3, minSize.w = 30, maxSize.w = 0,  bgColor = blue };
      Col { r3, maxSize.w = 1.0, caption = "Hello", bgColor = green };
      Col { r3, minSize.w = 30, maxSize.w = 0, bgColor = red };
}
