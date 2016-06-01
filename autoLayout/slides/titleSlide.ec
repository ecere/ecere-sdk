import "base"

class TitleSlide : BaseSlide
{
   vAlignment = center;
   Element title { this, font = { "Verdana", 100, bold = true }, caption = "eC", fgColor = textColor };
   Element subTitle { this, font = { "Verdana", 80, italic = true }, caption = "An introduction", fgColor = textColor };
   MBar { this, maxSize.h = 600 };
}
