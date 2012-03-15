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

   ToolBar toolBar   { stack, this };
   Window workSpace { stack, this, anchor = { 0, 0, 0, 0 }, background = gray };

   Window s1 { toolBar, size = { w = 8 } };
   ToolButton goBack
   {
      toolBar, this, id = ToolId::goBack, toolTip = "Go Back", bitmap = { "<:ecere>actions/goPrevious.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         workSpace.CycleChildren(false, true, false, false);
         return true;
      }
   };
   Window s2 { toolBar, size = { w = 2 } };
   ToolButton goForward
   {
      toolBar, this, id = ToolId::goForward, toolTip = "Go Forward", bitmap = { "<:ecere>actions/goNext.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         workSpace.CycleChildren(true, true, false, false);
         return true;
      }
   };
   Window s3 { toolBar, size = { w = 12 } };
   ToolButton newWindow
   {
      toolBar, this, id = ToolId::newWindow, toolTip = "New Window", bitmap = { "<:ecere>actions/windowNew.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Window { isActiveClient = true, parent = workSpace, workSpace, hasClose = true, isDocument = true, clientSize = { 320, 200 }, anchor = { { cascade } } }.Create();
         return true;
      }
   };
   Window s4 { toolBar, size = { w = 2 } };
   ToolButton goHome
   {
      toolBar, this, id = ToolId::goHome, toolTip = "Go Home", bitmap = { "<:ecere>actions/goHome.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         // Go home!
         return true;
      }
   };
}

ToolBarDemo tbDemo { };
