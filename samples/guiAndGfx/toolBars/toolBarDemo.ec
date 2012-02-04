import "IconBag"
import "ToolBar"

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

   IconBag<ToolId> iconBag
   {
      window = this;
      alphaBlend = true;
      iconNames =
      [
         "<:ecere>emblems/unreadable.png",
         "<:ecere>actions/windowNew.png",      /* newWindow */
         "<:ecere>actions/goPrevious.png",     /* goBack */
         "<:ecere>actions/goNext.png",         /* goForward */
         "<:ecere>actions/goHome.png"          /* goHome */
      ];
   };

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
      iconBag = iconBag;
      size = { h = 32 };

      void NotifyToolClick(ToolButton button)
      {
         ToolId id = (ToolId)button.id;
         switch(id)
         {
            case newWindow: break;
            case goBack:    break;
            case goForward: break;
            case goHome:    break;
         }
      }
   };

   Window s1 { toolBar, size = { w = 8 } };
   ToolButton goBack { toolBar, this, id = ToolId::goBack, toolTip = "Go Back" };
   Window s2 { toolBar, size = { w = 2 } };
   ToolButton goForward { toolBar, this, id = ToolId::goForward, toolTip = "Go Forward" };
   Window s3 { toolBar, size = { w = 12 } };
   ToolButton newWindow { toolBar, this, id = ToolId::newWindow, toolTip = "New Window" };
   Window s4 { toolBar, size = { w = 2 } };
   ToolButton goHome { toolBar, this, id = ToolId::goHome, toolTip = "Go Home" };

   bool OnLoadGraphics()
   {
      iconBag.Load();
      return true;
   }

   void OnUnloadGraphics()
   {
      iconBag.Unload();
   }
}

ToolBarDemo tbDemo { };
