import "ecere"

// Because we set MyToolBar's master to ToolBarDemo, the 'this' of NotifyClicked events is the ToolBarDemo class
class MyToolBar : ToolBar
{
   Window s1 { this, size = { w = 8 } };
   ToolButton goBack
   {
      this, toolTip = "Go Back", bitmap = { "<:ecere>actions/goPrevious.png" };

      bool ToolBarDemo::NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         workSpace.CycleChildren(false, true, false, false);
         return true;
      }
   };
   Window s2 { this, size = { w = 2 } };
   ToolButton goForward
   {
      this, toolTip = "Go Forward", bitmap = { "<:ecere>actions/goNext.png" };

      bool ToolBarDemo::NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         workSpace.CycleChildren(true, true, false, false);
         return true;
      }
   };
   Window s3 { this, size = { w = 12 } };
   ToolButton newWindow
   {
      this, toolTip = "New Window", bitmap = { "<:ecere>actions/windowNew.png" };

      bool ToolBarDemo::NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Window
         {
            isActiveClient = true, parent = workSpace,
            hasClose = true, isDocument = true,
            clientSize = { 320, 200 }, anchor = { { cascade } }
         }.Create();
         return true;
      }
   };
   Window s4 { this, size = { w = 2 } };
   ToolButton goHome
   {
      this, toolTip = "Go Home", bitmap = { "<:ecere>actions/goHome.png" };

      bool ToolBarDemo::NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         // Go home!
         return true;
      }
   };
}

class ToolBarDemo : Window
{
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 840, 450 };

   Stacker stack { parent = this, gap = 0, direction = vertical, anchor = { 0, 0, 0, 0 } };
   MyToolBar toolBar { parent = stack, master = this };
   Window workSpace { parent = stack, master = this, anchor = { 0, 0, 0, 0 }, background = gray };
}

ToolBarDemo tbDemo { };
