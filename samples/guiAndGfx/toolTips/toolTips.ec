import "ecere"

class ToolTipsDemo : Window
{
   text = "Tool Tips Demo";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   nativeDecorations = true;
   tabCycle = true;
   hasClose = true;
   font = { "Arial", 14 };
   size = { 400, 300 };

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape) Destroy(0);
      return true;
   }

   Button button1
   {
      this, text = "Simple Tooltip", position = { 88, 104 };
      toolTip = "This button does this.\nPlease click it!";
   };
   Button button2
   {
      this, text = "Custom Tooltip", position = { 192, 168 }
   };
   ToolTip tt
   {
      button2, tip = "You can change fonts and colors!";
      alphaBlend = true, opacity = 0.75;
      font = { "Comic Sans MS", 12 };
      background = lightSkyBlue, foreground = darkSlateBlue;      
   };
}

ToolTipsDemo demo {};
