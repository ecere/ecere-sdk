public import "ecere"

TextScrollerDemo demo {};

class TextScrollerDemo : Window
{
   text = "Text Scroller Demo";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 576, 432 };
   TextScroller scroller
   {
      this, anchor = { 10, 10, 10, 10 };
      contents = "Could not load ./textScroller.ec";
   };

   TextScrollerDemo()
   {
      File f = FileOpen("textScroller.ec", read);
      if(f)
      {
         uint size = f.GetSize();
         String s = new char[size+1];
         f.Read(s, 1, size);
         scroller.contents = s;
         delete s;
         delete f;
      }
   }
}

public class TextScroller : Window
{
   borderStyle = deepContour;
   font = { "Consolas", 12 };
   background = black;
   foreground = lime;

   hasHorzScroll = true;
   hasVertScroll = true;

   int maxW, lh;
   int linesCount;
   String contents;
   String linesText;
   char * lines[1024];

   ~TextScroller()
   {
      delete linesText;
      delete contents;
   }

   property const String contents
   {
      set
      {
         delete contents;
         contents = CopyString(value);
         delete linesText;
         linesText = CopyString(contents);
         // Lazy lines splitting: it will unfortunately ignore empty lines...
         linesCount = TokenizeWith(linesText, sizeof(lines), lines, "\n", false);
         OnLoadGraphics();
      }
      get { return contents; }
   };

   bool OnLoadGraphics()
   {
      int c;
      maxW = 0;
      display.FontExtent(fontObject, " ", 1, null, &lh);
      for(c = 0; c < linesCount; c++)
      {
         int w;
         display.FontExtent(fontObject, lines[c], strlen(lines[c]), &w, null);
         if(w > maxW) maxW = w;
      }
      SetScrollLineStep(1, Max(1, lh));
      snapVertScroll = true ;//lh; // Snap to line height vertically
      //snapHorzScroll = 1;
      scrollArea = { maxW, lh * (linesCount-1) };
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int c;
      int x = -scroll.x, y = -scroll.y;
      int ch = clientSize.h;
      for(c = 0; c < linesCount; c++, y += lh)
      {
         if(y > -lh && y < ch)
            surface.WriteText(x, y, lines[c], strlen(lines[c]));
      }
   }

   // *** Brute force implementation ***
   // Could be optimized by using display.Scroll(), and only updating
   // the new portion of the screen
   // (See sdk/ecere/src/gui/controls/EditBox.ec for example)
   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   void OnHScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }
}
