import "ecere"

enum ToolId { none, newWindow, goBack, goForward, goHome };

class ToolBarDemo : Window
{
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 840, 480 };
   minClientSize = { 600, 300 };
   nativeDecorations = true;

   Stacker stack
   {
      this;
      gap = 0;
      direction = vertical;
      background = activeBorder;
      anchor = { left = 0, top = 0, right = 0, bottom = 0 };
   };

   ToolBar toolBar
   {
      stack, this;
      size = { h = 32 };

      /*bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ToolId id = (ToolId)button.id;
         switch(id)
         {
            case newWindow: break;
            case goBack:    break;
            case goForward: break;
            case goHome:    break;
         }
         return true;
      }*/
   };

   Window s1 { toolBar, size = { w = 8 } };
   ToolButton goBack { toolBar, this, id = ToolId::goBack, toolTip = "Go Back", bitmap = { "<:ecere>actions/goPrevious.png" } };
   Window s2 { toolBar, size = { w = 2 } };
   ToolButton goForward { toolBar, this, id = ToolId::goForward, toolTip = "Go Forward", bitmap = { "<:ecere>actions/goNext.png" } };
   Window s3 { toolBar, size = { w = 12 } };
   ToolButton newWindow { toolBar, this, id = ToolId::newWindow, toolTip = "New Window", bitmap = { "<:ecere>actions/windowNew.png" } };
   Window s4 { toolBar, size = { w = 2 } };
   ToolButton goHome { toolBar, this, id = ToolId::goHome, toolTip = "Go Home", bitmap = { "<:ecere>actions/goHome.png" } };

}

ToolBarDemo tbDemo { };
