import "ecere"

class ChildWindow : Window
{
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   isActiveClient = true;
   text = "Child Window";
   anchor = { { cascade } };
   // Once the parent is set, unlock the cascade anchor
   watch(parent) { size = size; position = position; };
}

class MainWindow : Window
{
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true, hasMinimize = true, hasClose = true;
   hasHorzScroll = true;
   hasVertScroll = true;
   hasMenuBar = true;
   drawBehind = true;
   text = "MainForm", clientSize = { 640, 480 };

   Menu fileMenu { menu, text = "File", hotKey = f };
      MenuItem newItem
      {
         fileMenu, text = "New Window", n, ctrlN;

         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            ChildWindow { this }.Create();
            return true;
         }
      };
      MenuItem fileCloseItem { fileMenu, "Close", c, ctrlF4, NotifySelect = MenuFileClose };
      MenuDivider { fileMenu };
      MenuItem exitItem { fileMenu, "Exit", x, altF4, NotifySelect = MenuFileExit };

   Menu windowMenu { menu, "Window", w };
      MenuItem { windowMenu, "Close All", l, NotifySelect = MenuWindowCloseAll };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, "Next", n, f6, NotifySelect = MenuWindowNext };
      MenuItem { windowMenu, "Previous", p, shiftF6, NotifySelect = MenuWindowPrevious };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, "Cascade", c, NotifySelect = MenuWindowCascade };
      MenuItem { windowMenu, "Tile Horizontally", h, NotifySelect = MenuWindowTileHorz };
      MenuItem { windowMenu, "Tile Vertically", v, NotifySelect = MenuWindowTileVert };
      MenuItem { windowMenu, "Arrange Icons", a, NotifySelect = MenuWindowArrangeIcons };
      MenuDivider { windowMenu };
      MenuItem { windowMenu, "Windows...", w, NotifySelect = MenuWindowWindows };
}

MainWindow parent { };
