import "Window"

define defaultToolSize = 6;

public class PaneSplitter : Window
{
   bool sliding;
   int startPos, startX;
   background = formColor, borderStyle = bevel;
   anchor = { top = -2, bottom = -2 }, stayOnTop = true, inactive = true;
   size = { w = defaultToolSize };
   cursor = ((GuiApplication)__thisModule.application).GetCursor(sizeWE);

   Window leftPane, rightPane;
   double scaleSplit;
   int split;
   bool scale;
   ScrollDirection orientation;
   int toolSize, toolGap;

   orientation = (ScrollDirection)-1;
   toolSize = defaultToolSize;
   toolGap = 2;

   void OnResize(int width, int height)
   {
      if(leftPane || rightPane)
      {
         if(orientation == (ScrollDirection)-1) orientation = vertical;
         if(scale)
            property::scaleSplit = scaleSplit;
         else
            property::split = split;
       }
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      sliding = true;
      if(orientation == vertical)
      {
         startPos = x + absPosition.x;
         startX = position.x;
      }
      else
      {
         startPos = y + absPosition.y;
         startX = position.y;
      }
      Capture();

      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      parent.cursor = null;
      return true;
   }
   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      parent.cursor = cursor;
      if(sliding)
      {
         bool oldScale = scale;
         scale = false;
         if(orientation == vertical)
         {
            x += absPosition.x;
            x -= startPos;
            x += startX;
            x = Max(x, leftPane ? leftPane.minClientSize.w : 20);
            x = Min(x, parent.clientSize.w - (rightPane ? rightPane.minClientSize.w : 20) - toolGap - toolSize);

            property::split = x;

            scaleSplit = (double) x / (double) parent.clientSize.w;
         }
         else
         {
            y += absPosition.y;
            y -= startPos;
            y += startX;
            y = Max(y, leftPane ? leftPane.minClientSize.h : 20);
            y = Min(y, parent.clientSize.h - (rightPane ? rightPane.minClientSize.h : 20) - toolGap - toolSize);

            property::split = y;

            scaleSplit = (double) y / (double)parent.clientSize.h;
         }
         scale = oldScale;
         NotifyResized(master, this);
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(sliding)
      {
         ReleaseCapture();
         parent.cursor = null;
         sliding = false;
         NotifyResized(master, this);
      }
      return true;
   }

public:
   property int toolSize
   {
      set { toolSize = value; } get { return toolSize; }
   }
   property int toolGap
   {
      set { toolGap = value; } get { return toolGap; }
   }
   property Window leftPane
   {
      set { leftPane = value; property::split = split; } get { return leftPane; }
   }
   property Window rightPane
   {
      set { rightPane = value; property::split = split; } get { return rightPane; }
   }
   property Window topPane
   {
      set { leftPane = value; property::split = split; } get { return leftPane; }
   }
   property Window bottomPane
   {
      set { rightPane = value; property::split = split; } get { return rightPane; }
   }
   property double scaleSplit
   {
      set
      {
         scaleSplit = value;
         property::split = (int)(((orientation == vertical) ? parent.clientSize.w : parent.clientSize.h) * (value) + 0.5);
         scale = true;
      }
      get { return scaleSplit; }
   }
   property ScrollDirection orientation
   {
      set
      {
         orientation = value;
         if(orientation == vertical)
         {
            size = { w = toolSize };
            anchor = { top = -2, bottom = -2 };
            cursor = ((GuiApplication)__thisModule.application).GetCursor(sizeWE);
         }
         else
         {
            position = { 0, 0 };
            size = { h = toolSize };
            anchor = { left = -2, right = -2 };
            cursor = ((GuiApplication)__thisModule.application).GetCursor(sizeNS);
         }
      }
      get { return orientation; }
   }
   property int split
   {
      set
      {
         split = value;
         if(orientation == vertical)
         {
            int w = size.w;
            int pw = parent.clientSize.w;
            int x = value;
            x = Max(x, leftPane ? leftPane.minClientSize.w : 20);
            x = Min(x, parent.clientSize.w - (rightPane ? rightPane.minClientSize.w : 20) - toolGap - toolSize);

            if(leftPane) leftPane.anchor.right = pw - x + toolGap;
            if(rightPane) rightPane.anchor.left = x + w + toolGap;
            anchor.left = x;

            scale = false;
         }
         else if(orientation == horizontal)
         {
            int h = size.h;
            int ph = parent.clientSize.h;
            int y = value;
            y = Max(y, leftPane ? leftPane.minClientSize.h : 20);
            y = Min(y, parent.clientSize.h - (rightPane ? rightPane.minClientSize.h : 20) - toolGap - toolSize);

            if(leftPane)  leftPane.anchor.bottom = ph - y + toolGap;
            if(rightPane) rightPane.anchor.top = y + h + toolGap;
            anchor.top = y;

            scale = false;
         }
      }
      get { return split; }
   }

   virtual bool Window::NotifyResized(PaneSplitter splitter);
}
