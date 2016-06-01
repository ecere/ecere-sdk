import "autoLayout"

import "titleSlide"
import "languageSlide"
import "classesSlide"
import "instancesSlide"
import "formSlide"
import "buttonSlide"
import "gnosisSlide"

Array<Class> slides
{ [
   class(TitleSlide),
   class(LanguageSlide),
   class(ClassesSlide),
   class(InstancesSlide),
   class(FormSlide),
   class(ButtonSlide),
   class(GNOSISSlide)
] };

class SlideForm : AutoLayoutForm
{
   int slideNum;
   caption = "Butterbur Slides";

   SlideForm()
   {
      subclass(Element) c = slides.count ? (subclass(Element))slides[slideNum] : null;
      if(c)
         contents = eInstance_New(c);
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      int num = slideNum;
      switch(key)
      {
         case home:     num = 0; break;
         case end:      if(slides.count) num = slides.count-1; break;
         case pageUp:   if(num > 0) num--; break;
         case pageDown: if(num < slides.count-1) num++; break;
         case p:        printSlides(caption); break;
      }
      if(slideNum != num)
      {
         delete contents;
         slideNum = num;
         contents = eInstance_New(slides[num]);
         OnLoadGraphics();
         OnResize(clientSize.w, clientSize.h);
      }
      return true;
   }
}

SlideForm slideForm { clientSize = { 1600, 1200 } };

class SlidePrinter : Window
{
   fullRender = true;
   size = { 1600, 1200 };
   displayDriver = "Win32Printer";
}

Bitmap outputSlide(Class sc)
{
   Element c = eInstance_New(sc);
   Bitmap bmp { };
   AutoLayoutForm form1 { contents = c, clientSize = { 1600, 1200 } };
   bmp.Allocate(null, 1600, 1200, 0, pixelFormat888, false);
   form1.Create();
   form1.display.Lock(true);
   form1.Grab(bmp, null, false);
   form1.display.Unlock();
   form1.Destroy(0);
   delete c;
   bmp.Save("test.png", null, null);
   return bmp;
}

void printSlides(const String title)
{
   int i = 0;
   SlidePrinter printer { size = { 1600, 1200 } };
   SetPrintingDocumentName(title);

   printer.Create();
   for(s : slides)
   {
      Bitmap bmp = outputSlide(s);
      Picture pic { printer, anchor = { 0, 0, 0, 0 }, bitmapImage = bmp };
      if(i++) printer.display.NextPage();
      pic.Create();
      pic.UpdateDisplay();
      pic.Destroy(0);
      delete bmp;
   }
   printer.Destroy(0);
}
