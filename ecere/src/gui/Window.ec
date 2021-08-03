namespace gui;

import "Display"

import "Anchor"
import "Key"
import "GuiApplication"
import "Interface"
import "Skin"
import "Timer"
import "Cursor"
import "ClipBoard"

import "Button"
import "ListBox"
import "DropBox"
import "Label"
import "Picture"
import "ScrollBar"
import "Button"
import "Menu"
import "StatusBar"
import "ProgressBar"
import "EditBox"
import "DataBox"
import "ToolTip"

#if defined(__WIN32__)
import "Win32Interface"
#endif

#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
import "Desktop3D"
#endif

#if !defined(ECERE_VANILLA) && !defined(ECERE_NOTRUETYPE) && !defined(__EMSCRIPTEN__)
import "FormDesigner"
#endif

import "FileDialog"
import "MessageBox"
import "WindowList"
import "i18n"

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__)
#define property _property
#define new _new
#define class _class
#define uint _uint

#define Window    X11Window
#define Cursor    X11Cursor
#define Font      X11Font
#define Display   X11Display
#define Time      X11Time
#define KeyCode   X11KeyCode
#define Picture   X11Picture

#include <X11/Xutil.h>

#undef Window
#undef Cursor
#undef Font
#undef Display
#undef Time
#undef KeyCode
#undef Picture

#undef uint
#undef new
#undef property
#undef class

#endif

// Had to define this here for native decorations support, because the menu bar is part of total decoration's size, but not part of the system decorations
#ifdef HIGH_DPI
define skinMenuHeight = 40;
define statusBarHeight = 30;
#else
define skinMenuHeight = 25;
define statusBarHeight = 18;
#endif

default extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown;

public enum DialogResult : int64 { cancel, yes, no, ok };

public class MouseButtons
{
public:
   bool left:1, right:1, middle:1;
};

public struct SizeAnchor
{
   Size size;
   bool isClientW, isClientH;
};

#include <stdarg.h>

#define SNAPDOWN(x, d) \
      if(Abs(x) % (d)) \
      { \
         if(x < 0) x -= ((d) - Abs(x) % (d)); else x -= x % (d); \
      }

#define SNAPUP(x, d) \
      if(Abs(x) % (d)) \
      { \
         if(x > 0) x += ((d) - Abs(x) % (d)); else x += x % (d); \
      }

/*static */define MAX_DIRTY_BACK = 10;

/////////////////////////////////////////////////////////////////////////////
////////// EXTENT MANIPULATION //////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#define ACCESS_ITEM(l, id) \
   id

#define FASTLIST_LOOP(l, v)      \
   for(v = (BoxItem)l.first; v; v = (BoxItem)v.next)

#define FASTLIST_LOOPN(l, v, n) \
   for(v = (BoxItem)l.first, n = (BoxItem)(v ? v.next : null); v; v = (BoxItem)next, n = (BoxItem)(v ? v.next : null))

/*
#define ACCESS_ITEM(l, id) \
      ((FastItem)(((id) == -1) ? null : (((byte *)((l).items)) + (id) * (l).itemSize)))

#define FASTLIST_LOOP(l, v)      \
   for(v = (void *)ACCESS_ITEM((l), (l).first); v; v = (void *)ACCESS_ITEM((l), v.next))

#define FASTLIST_LOOPN(l, v, n) \
   for( v = (void *)ACCESS_ITEM((l), (l).first), \
        n = v ? ((void *)ACCESS_ITEM((l), v.next)): null; \
        v; v = n, n = n ? (void *)ACCESS_ITEM((l), n.next) : null)


private class FastItem : struct
{
   int prev, next;
};

private struct FastList
{
   FastItem items;
   int first, last;
   int free;
   int count, size, itemSize;

   void Clear(void)
   {
      count = 0;
      size = 0;
      items = null;
      first = last = free = -1;
      itemSize = 0;
   }

   void Empty(void)
   {
      FastItem item, next;
      Free();
      // FASTLIST_LOOPN(this, item, next) { Delete(item); };
   }

   FastItem Add(uint itemSize)
   {
      FastItem item;
      if(free == -1 || !size)
      {
         int c;
         int newSize;

         if(size)
         {
            newSize = (size + (size >> 1));
            items = (FastItem)renew items byte[newSize * itemSize];
         }
         else
         {
            newSize = 4;
            this.itemSize = itemSize;
            items = (FastItem)new byte[newSize * itemSize];
         }

         for(c = size; c<newSize-1; c++)
         {
            ACCESS_ITEM(this, c).prev = -1;
            ACCESS_ITEM(this, c).next = c+1;
         }
         ACCESS_ITEM(this, c).prev = -1;
         ACCESS_ITEM(this, c).next = -1;
         free = size;
         size = newSize;
      }
      item = ACCESS_ITEM(this, free);
      item.prev = last;
      if(item.prev != -1)
         ACCESS_ITEM(this, item.prev).next = free;
      if(first == -1)
         first = free;
      last = free;
      free = item.next;
      item.next = -1;
      count++;
      return item;
   }

   void Delete(FastItem item)
   {
      if(item.prev != -1)
         ACCESS_ITEM(this, item.prev).next = item.next;
      if(item.next != -1)
         ACCESS_ITEM(this, item.next).prev = item.prev;

      if(ACCESS_ITEM(this, first) == item)
         first = item.next;
      if(ACCESS_ITEM(this, last) == item)
         last = item.prev;
      count--;

      item.next = free;
      free = ((byte *)item - (byte *)items) / itemSize;
   }

   void Free(void)
   {
      delete items;
      size = 0;
      count = 0;
      free = first = last = -1;
   }
};
*/
private class BoxItem : Item //FastItem
{
   Box box;
};

public /*private */struct Extent : OldList //FastList
{
   void Empty()
   {
      Free(null);
   }

   void AddBox(Box box)
   {
      //BoxItem extentBox = (BoxItem)Add(sizeof(class BoxItem));
      Add(BoxItem { box = box });
   }

   void Copy(Extent source)
   {
      BoxItem extentBox;

      // Clear();
      Empty();
      //FASTLIST_LOOP(source, extentBox)
      for(extentBox = (BoxItem)source.first; extentBox; extentBox = (BoxItem)extentBox.next)
         AddBox(extentBox.box);
   }

   void IntersectBox(Box box)
   {
      // Clip all boxes of extent against inside of the new box
      BoxItem extentBox, next;

      //FASTLIST_LOOPN(this, extentBox, next)   // Macros still mess up the parser!
      for(extentBox = (BoxItem)this.first; extentBox; extentBox = next)
      {
         next = (BoxItem)extentBox.next;
         if(box.left > extentBox.box.left) extentBox.box.left = box.left;
         if(box.top > extentBox.box.top) extentBox.box.top = box.top;
         if(box.right < extentBox.box.right) extentBox.box.right = box.right;
         if(box.bottom < extentBox.box.bottom) extentBox.box.bottom = box.bottom;
         if(extentBox.box.right < extentBox.box.left || extentBox.box.bottom < extentBox.box.top)
            Delete(extentBox);
      }
   }

   void ExcludeBox(Box box, Extent temp)
   {
      BoxItem extentBox;

      temp.Copy(this);
      Empty();

      for(extentBox = (BoxItem)temp.first; extentBox; extentBox = (BoxItem)extentBox.next)
      {
         if(extentBox.box.left < box.right && extentBox.box.right > box.left &&
            extentBox.box.top < box.bottom && extentBox.box.bottom > box.top)
         {
            // Top box
            if(extentBox.box.top < box.top && extentBox.box.bottom >= box.top)
            {
               Box newBox
               {
                  extentBox.box.left, extentBox.box.top,
                  extentBox.box.right, Min(extentBox.box.bottom, box.top -1)
               };
               AddBox(newBox);
            }

            // Bottom box
            if(extentBox.box.bottom > box.bottom && extentBox.box.top <= box.bottom)
            {
               Box newBox
               {
                  extentBox.box.left, Max(extentBox.box.top,box.bottom +1),
                  extentBox.box.right, extentBox.box.bottom
               };
               AddBox(newBox);
            }

            // Middle boxes
            if(extentBox.box.bottom >= box.top && extentBox.box.top <= box.bottom)
            {
               // Left box
               if(extentBox.box.left < box.left && extentBox.box.right >= box.left)
               {
                  Box newBox
                  {
                     extentBox.box.left, Max(extentBox.box.top, box.top),
                     Min(extentBox.box.right, box.left-1), Min(extentBox.box.bottom, box.bottom)
                  };
                  AddBox(newBox);
               }

               // Right box
               if(extentBox.box.right > box.right && extentBox.box.left <= box.right)
               {
                  Box newBox
                  {
                     Max(extentBox.box.left, box.right+1), Max(extentBox.box.top, box.top),
                     extentBox.box.right, Min(extentBox.box.bottom, box.bottom)
                  };
                  AddBox(newBox);
               }
            }
         }
         else
         {
            AddBox(extentBox.box);
         }
      }
      temp.Empty();
   }

   void UnionBox(Box box, Extent temp)
   {
      BoxItem extentBox, next;

      // First pass: check if this box is not already covered by one of the extent's box
      for(extentBox = (BoxItem)this.first; extentBox; extentBox = (BoxItem)extentBox.next)
      {
         if(extentBox.box.left <= box.left && extentBox.box.right >= box.right &&
            extentBox.box.top <= box.top && extentBox.box.bottom >= box.bottom)
         {
            // No change
            return;
         }
      }

      // Second pass: only keep boxes not completely covered in the new box
      for(extentBox = (BoxItem)this.first; extentBox; extentBox = next)
      {
         next = (BoxItem)extentBox.next;
         if(extentBox.box.left >= box.left && extentBox.box.right <= box.right &&
            extentBox.box.top >= box.top && extentBox.box.bottom <= box.bottom)
            Delete(extentBox);
      }

      // Add the exclusion to the extent
      ExcludeBox(box, temp);

      // Add the new box
      if(box.bottom >= box.top && box.right >= box.left)
      {
         // Optimization: if the resulting boxes touch, add them smarter
         for(extentBox = (BoxItem)this.first; extentBox; extentBox = (BoxItem)extentBox.next)
         {
            if(box.top == extentBox.box.top && box.bottom == extentBox.box.bottom)
            {
               if(Abs(box.right - extentBox.box.left) <= 1)
               {
                  extentBox.box.left = box.left;
                  break;
               }
               else if(Abs(box.left - extentBox.box.right) <= 1)
               {
                  extentBox.box.right = box.right;
                  break;
               }
            }
            else if(box.left == extentBox.box.left && box.right == extentBox.box.right)
            {
               if(Abs(box.bottom - extentBox.box.top) <= 1)
               {
                  extentBox.box.top = box.top;
                  break;
               }
               else if(Abs(box.top - extentBox.box.bottom) <= 1)
               {
                  extentBox.box.bottom = box.bottom;
                  break;
               }
            }
         }

         // Else, add it
         if(!extentBox)
            AddBox(box);
      }
   }

   void Union(Extent b, Extent temp)
   {
      BoxItem extentBox;

      for(extentBox = (BoxItem)b.first; extentBox; extentBox = (BoxItem)extentBox.next)
         UnionBox(extentBox.box, temp);
   }

   void Intersection(Extent b, Extent temp, Extent temp2, Extent temp3)
   {
      BoxItem extentBox;
      temp.Copy(this);

      Empty();

      for(extentBox = (BoxItem)b.first; extentBox; extentBox = (BoxItem)extentBox.next)
      {
         temp2.Copy(temp);
         temp2.IntersectBox(extentBox.box);
         Union(temp2, temp3);
         temp2.Empty();
      }
      temp.Empty();
   }

   void Exclusion(Extent b, Extent temp)
   {
      BoxItem extentBox;
      for(extentBox = (BoxItem)b.first; extentBox; extentBox = (BoxItem)extentBox.next)
         ExcludeBox(extentBox.box, temp);
   }

   void Offset(int x, int y)
   {
      BoxItem extentBox;
      for(extentBox = (BoxItem)this.first; extentBox; extentBox = (BoxItem)extentBox.next)
      {
         extentBox.box.left += x;
         extentBox.box.top += y;
         extentBox.box.right += x;
         extentBox.box.bottom += y;
      }
   }
};

private define MINIMIZED_WIDTH = 160;
private define CASCADE_SPACE = 16;

// namespace Windows;

private class ScrollFlags
{
   bool snapX:1, snapY:1, dontHide:1;
};

public class BorderBits { public: bool contour:1, fixed:1, sizable:1, deep:1, bevel:1, thin:1; };

class WindowBits : BorderBits
{
   BorderBits borderBits:6:0;
   bool hidden:1, isActiveClient:1, hasHorzScroll:1, hasVertScroll:1, stayOnTop:1, modal:1, isDefault:1, inactive:1, isRemote:1, drawBehind:1;
   bool interim:1, tabCycle:1, noCycle:1, dontScrollHorz:1, dontScrollVert:1, hasMaximize:1, hasMinimize:1, hasClose:1;
   bool embedded:1, hasMenuBar:1, isDocument:1, showInTaskBar:1, hasStatusBar:1, nonClient:1, clickThrough:1;
};

public enum BorderStyle : BorderBits
{
   none,
   contour      = BorderBits { contour = true },
   fixed        = BorderBits { fixed = true } | contour,
   sizable      = BorderBits { sizable = true } | fixed,
   thin         = BorderBits { fixed = true, thin = true } | contour,
   sizableThin  = BorderBits { sizable = true } | thin,
   deep         = BorderBits { deep = true },
   bevel        = BorderBits { bevel = true },
   sizableDeep  = sizable|deep,
   sizableBevel = sizable|bevel,
   fixedDeep    = fixed|deep,
   fixedBevel   = fixed|bevel,
   deepContour  = deep|contour
};

public enum CreationActivationOption
{
   activate, flash, doNothing
};

public enum WindowState { normal, minimized, maximized };

private class ResPtr : struct
{
   ResPtr prev, next;
   Resource resource;
   void * loaded;
};

private class HotKeySlot : struct
{
   HotKeySlot prev, next;
   Window window;
   Key key;
};

public struct TouchPointerInfo
{
   int id;
   Point point;
   float size, pressure;
};

public enum TouchPointerEvent { move, up, down, pointerUp, pointerDown };

public class Window
{
private:
   class_data const char * icon;
   class_no_expansion
   class_default_property caption;
   // class_initialize GuiApplication::Initialize;
   class_designer FormDesigner;
   class_property const char * icon
   {
      set { class_data(icon) = value; }
      get { return class_data(icon); }
   }

   Window()
   {
      bool switchMode = true;
#if defined(__ANDROID__)
      switchMode = false;
      fullRender = true;
#endif
      if(guiApp)
         guiApp.Initialize(switchMode);

      if(guiApp && guiApp.currentSkin && ((subclass(Window))_class).pureVTbl)
      {
         if(_vTbl == ((subclass(Window))_class).pureVTbl)
         {
            _vTbl = _class._vTbl;
         }
         else if(_vTbl != _class._vTbl)
         {
            int m;
            for(m = 0; m < _class.vTblSize; m++)
            {
               if(_vTbl[m] == ((subclass(Window))_class).pureVTbl[m])
                  _vTbl[m] = _class._vTbl[m];
            }
         }
      }

      //tempExtents[0] = { /*first = -1, last = -1, free = -1*/ };
      //tempExtents[1] = { /*first = -1, last = -1, free = -1*/ };
      //tempExtents[2] = { /*first = -1, last = -1, free = -1*/ };
      //tempExtents[3] = { /*first = -1, last = -1, free = -1*/ };

      setVisible = true;

      // caption = CopyString(class.name);

      children.offset = (byte*)&prev - (byte*)this;
      childrenOrder.circ = true;
      childrenCycle.circ = true;

      maxSize = Size { MAXINT, MAXINT };
      background = white;
      foreground = black;

      //style.isActiveClient = true;
      mergeMenus = true;
      autoCreate = true;
      modifyVirtArea = true;
      manageDisplay = true;
      nativeDecorations = true;

      // scrollFlags = ScrollFlags { snapX = true, snapY = true };
      sbStep.x = sbStep.y = 8;

      if(guiApp)  // dynamic_cast<GuiApplication>(thisModule)
      {
         cursor = guiApp.GetCursor(arrow);
         property::parent = guiApp.desktop;
      }
   }

   ~Window()
   {
      Window child;
      OldLink slave;
      ResPtr ptr;

#if !defined(__EMSCRIPTEN__)
      if(fileMonitor)
      {
         int i, lockCount = guiApp.lockMutex.lockCount;
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__)
         if(xGlobalDisplay)
            XUnlockDisplay(xGlobalDisplay);
#endif

         for(i = 0; i < lockCount; i++)
            guiApp.lockMutex.Release();
         delete fileMonitor;
         for(i = 0; i < lockCount; i++)
            guiApp.lockMutex.Wait();
#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__)
         if(xGlobalDisplay)
            XLockDisplay(xGlobalDisplay);
#endif
      }
#endif

      if(parent)
      {
         stopwatching(parent, font);
         if(parent.activeChild == this)
            parent.activeChild = null;
         if(parent.activeClient == this)
            parent.activeClient = null;
      }

      if(!destroyed)
      {
         // Prevent destructor from being called again...
         incref this;
         incref this;
         DestroyEx(0);
      }

      /////////////////////////////////
      if(master)
      {
         OldLink slave = master.slaves.FindLink(this);
         master.slaves.Delete(slave);
         master = null;
      }

      if(parent)
      {
         if(cycle)
            parent.childrenCycle.Remove(cycle);
         if(order)
            parent.childrenOrder.Remove(order);
         parent.children.Remove(this);
         parent = null;
      }
      delete cycle;
      delete order;
      /////////////////////////////////

      while((ptr = resources.first))
      {
         delete ptr.resource;
         resources.Delete(ptr);
      }

      usedFont = null;
      delete setFont;
      delete systemFont;

      for(child = children.first; child; child = child.next)
      {
         // child.stopwatching(this, font);
         if(child.parent)
            eInstance_StopWatching(this, __ecereProp___ecereNameSpace__ecere__gui__Window_font, child);
         // Don't want property here
         *&child.parent = null;
      }

      while((slave = slaves.first))
      {
         // Don't want property here
         *&((Window)slave.data).master = null;
         slaves.Delete(slave);
      }

      // Because we do a decref in DestroyEx...
      if(!destroyed)
      {
         incref this;
         incref this;
         DestroyEx(0);
      }

      // Why was this commented?
      //if(this != guiApp.desktop)
      {
         delete caption;
         delete fileName;
      }

      delete menu;
      delete statusBar;

#if !defined(__EMSCRIPTEN__)
      delete mutex;
#endif
      delete icon;

      if(((subclass(Window))_class).pureVTbl)
      {
         if(_vTbl == _class._vTbl)
         {
            _vTbl = ((subclass(Window))_class).pureVTbl;
         }
         else
         {
            int m;
            for(m = 0; m < _class.vTblSize; m++)
            {
               if(_vTbl[m] == _class._vTbl[m])
                  _vTbl[m] = ((subclass(Window))_class).pureVTbl[m];
            }
         }
      }
      if(_vTbl == ((subclass(Window))_class).pureVTbl || _vTbl == _class._vTbl)
         _vTbl = null;

      dirtyArea.Free(null);
      renderArea.Free(null);
      overRenderArea.Free(null);
      clipExtent.Free(null);
      scrollExtent.Free(null);
      dirtyBack.Free(null);

      if(tempExtents)
      {
         tempExtents[0].Free(null);
         tempExtents[1].Free(null);
         tempExtents[2].Free(null);
         tempExtents[3].Free(null);
         delete tempExtents;
      }

      delete controller;
   }

//#if !defined(ECERE_VANILLA)
   const char * OnGetString(char * stringOutput, void * fieldData, ObjectNotationType * onType)
   {
      if(this == activeDesigner)
         return "(Desktop)";
      else
      {
         const char * name = property::name;
         return name ? name : "";
      }
   }
//#endif

#if !defined(ECERE_VANILLA) && !defined(ECERE_NOTRUETYPE) && !defined(__EMSCRIPTEN__)
   bool OnGetDataFromString(const char * string)
   {
      FormDesigner designer = (FormDesigner)activeDesigner.classDesigner;
      if(string[0])
      {
         if(!strcmp(string, "this") || !strcmp(string, designer.form.name))
            this = designer.form;
         else if(!strcmpi(string, "(Desktop)"))
            this = activeDesigner;
         else
            return activeDesigner.FindObject(&this, string);
      }
      return true;
   }
#endif

   // --- Window updates system ---

   // Setup a bitmap for Redrawing on client area of Window
   Surface Redraw(Box box)
   {
      Surface surface = null;
      Box mox = box;
      Box clientArea = this.clientArea;

      SetBox(clientArea);

      mox.left   -= clientStart.x;
      mox.top    -= clientStart.y;
      mox.right  -= clientStart.x;
      mox.bottom -= clientStart.y;

      mox.Clip(clientArea);
      // mox.ClipOffset(against, scrolledPos.x, scrolledPos.y);

      if((!guiApp.fullScreenMode || guiApp.desktop.active) && display && mox.right >= mox.left && mox.bottom >= mox.top)
      {
         int x = absPosition.x + clientStart.x;
         int y = absPosition.y + clientStart.y;
         if(rootWindow.nativeDecorations && rootWindow.windowHandle && !is3D)
         {
            x -= rootWindow.clientStart.x;
            y -= rootWindow.clientStart.y - (rootWindow.hasMenuBar ? skinMenuHeight : 0);
         }
         if(!guiApp.fullScreenMode || is3D)
         {
            x -= rootWindow.absPosition.x;
            y -= rootWindow.absPosition.y;

            if(rootWindow.is3D)
            {
               int dx = rootWindow.parent.parent.clientStart.x;
               int dy = rootWindow.parent.parent.clientStart.y;
               if(!rootWindow.parent.nativeDecorations)
               {
                  dx += rootWindow.parent.clientStart.x;
                  dy += rootWindow.parent.clientStart.y;
               }
               x += dx;
               y += dy;

               /*
               mox.left += dx;
               mox.top += dy;
               mox.right += dx;
               mox.bottom += dy;
               */
            }
         }

         surface = display.GetSurface(x, y, mox);
         /*if(surface)
         {
            surface.width = clientSize.w;
            surface.height = clientSize.h;
         }*/
      }
      return surface;
   }

   // Setup a bitmap for Redrawing on full Window
   Surface RedrawFull(Box box)
   {
      Surface surface = null;
      Box mox;
      if(box != null)
         box.Clip(this.box);
      else
         box = &this.box;
      mox = box;

      if((!guiApp.fullScreenMode || guiApp.desktop.active) && display && box.right >= box.left && box.bottom >= box.top)
      {
         int x = absPosition.x;
         int y = absPosition.y;
         if(rootWindow.nativeDecorations && rootWindow.windowHandle && !is3D)
         {
            x -= rootWindow.clientStart.x;
            y -= rootWindow.clientStart.y - (rootWindow.hasMenuBar ? skinMenuHeight : 0);
         }
#if !defined(__EMSCRIPTEN__)
         if(!guiApp.fullScreenMode || is3D)
#endif
         {
            x -= rootWindow.absPosition.x;
            y -= rootWindow.absPosition.y;
            if(rootWindow.is3D)
            {
               int dx = rootWindow.parent.parent.clientStart.x;
               int dy = rootWindow.parent.parent.clientStart.y;
               if(!rootWindow.parent.nativeDecorations)
               {
                  dx += rootWindow.parent.clientStart.x;
                  dy += rootWindow.parent.clientStart.y;
               }
               x += dx;
               y += dy;

               /*
               mox.left += dx;
               mox.top += dy;
               mox.right += dx;
               mox.bottom += dy;
               */
            }
         }

         surface = display.GetSurface(x, y, mox);
         /*if(surface)
         {
            surface.width = size.w;
            surface.height = size.h;
         }*/
      }
      return surface;
   }

   void FigureCaption(char * caption)
   {
      Window activeClient = null;

      caption[0] = '\0';
      if(this.caption)
         strcpy(caption, this.caption);
      if(style.isDocument || fileName)
      {
         if(caption[0]) strcat(caption, " - ");
         if(fileName)
            strcat(caption, fileName);
         else
         {
            char title[256];
            sprintf(title, "Untitled %d", documentID);
            strcat(caption, title);
         }
         if(modifiedDocument)
            strcat(caption, " *");
      }

      if(menuBar)
      {
         for(activeClient = this.activeClient; activeClient && !((BorderBits)activeClient.borderStyle).fixed; activeClient = activeClient.activeClient);
      }
      if(activeClient && activeClient.state == maximized)
      {
         if(activeClient.caption)
         {
            if(caption[0]) strcat(caption, " - ");
            strcat(caption, activeClient.caption);
         }
         if(activeClient.style.isDocument || activeClient.fileName)
         {
            if(caption[0]) strcat(caption, " - ");
            strcat(caption, "[");
            if(activeClient.fileName)
               strcat(caption, activeClient.fileName);
            else
            {
               char title[256];
               sprintf(title, "Untitled %d", activeClient.documentID);
               strcat(caption, title);
            }
            if(activeClient.modifiedDocument)
               strcat(caption, " *");
            strcat(caption, "]");
         }
      }
   }

   // Code for returning dirty from ScrollDisplay:
      /*
      for(d = 0; d<scrollExtent.count; d++)
      {
         Box * box = &scrollExtent.boxes[d];
         if(scroll.x < 0)
         {
            Box update
            {
               box.left, box.top,
               Min(box.right, box.left-scroll.x),box.bottom
            };
            dirtyArea.UnionBox(update);
         }
         else if(scroll.x)
         {
            Box update
            {
               Max(box.left, box.right-scroll.x), box.top,
               box.right, box.bottom
            };
            dirtyArea.UnionBox(update);
         }

         if(scroll.y < 0)
         {
            Box update
            {
               box.left, box.top,
               box.right, Min(box.bottom, box.top-scroll.y),
            };
            dirtyArea.UnionBox(update);
         }
         else if(scroll.y)
         {
            Box update
            {
               box.left, Max(box.top, box.bottom-scroll.y),
               box.right, box.bottom
            };
            dirtyArea.UnionBox(update);
         }
      }
      */

   void UpdateDecorations(void)
   {
      // TODO: *** TEMPORARY HACK ***
      /*
      if(parent)
         parent.Update(null);
      */

      // Top
      Update({ -clientStart.x, -clientStart.y, -clientStart.x + size.w-1, 0 });
      // Bottom
      Update({ -clientStart.x, clientSize.h, -clientStart.x + size.w-1, -clientStart.y + size.h-1 });
      // Left
      Update({ -clientStart.x,0, -1, clientSize.h-1 });
      // Right
      Update({ clientSize.w, 0, -clientStart.x + size.w-1, clientSize.h-1 });
   }

   // Returns w & h for Position
   void ComputeAnchors(Anchor anchor, SizeAnchor sizeAnchor, int *ox, int *oy, int *ow, int *oh)
   {
      Window parent = this.parent ? this.parent : guiApp.desktop;
      int xOffset = 0, yOffset = 0;
      int vpw = parent ? parent.clientSize.w : 0;
      int vph = parent ? parent.clientSize.h : 0;
      int pw = parent ? parent.clientSize.w : 0;
      int ph = parent ? parent.clientSize.h : 0;
      int w = sizeAnchor.size.w, h = sizeAnchor.size.h;
      int x = anchor.left.distance, y = anchor.top.distance;
      float ex = 0, ey = 0;
      MinMaxValue ew = 0, eh = 0;
      int numCascade;
      float cascadeW, cascadeH;
      int numTiling;
      int tilingW, tilingH, tilingSplit, tilingLastH = 0;
      int addX = 0, addY = 0;

      if(parent && rootWindow == this && guiApp && guiApp.interfaceDriver)
      {
         Window masterWindow = this;
         Box box { addX, addY, addX + vpw - 1, addY + vph - 1 };
         if(!visible)
         {
            if(master == guiApp.desktop)
               masterWindow = guiApp.desktop.activeChild;
            else
               masterWindow = master.rootWindow;
            if(!masterWindow) masterWindow = this;
         }
         guiApp.interfaceDriver.GetScreenArea(masterWindow, box);
         if((anchor.left.type == offset && anchor.right.type == offset) || anchor.left.type == none)
         {
            addX = box.left;
            pw = vpw = box.right - box.left + 1;
         }
         if((anchor.top.type == offset && anchor.bottom.type == offset) || anchor.top.type == none)
         {
            addY = box.top;
            ph = vph = box.bottom - box.top + 1;
         }
      }

      if(!parent)
      {
         *ow = w;
         *oh = h;

         *ox = x;
         *oy = y;
         return;
      }

      if(style.nonClient)
      {
         vpw = pw = parent.size.w;
         vph = ph = parent.size.h;
      }
      else if(!style.fixed /*|| style.isDocument*/)
      {
         if(!style.dontScrollHorz && parent.scrollArea.w) vpw = parent.scrollArea.w;
         if(!style.dontScrollVert && parent.scrollArea.h) vph = parent.scrollArea.h;
      }
#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
      if(is3D)
      {
         Desktop3D_FixSize(&pw, &ph);
         Desktop3D_FixSize(&vpw, &vph);
      }
#endif
      if(pw < skinMinSize.w) pw = skinMinSize.w;
      if(ph < skinMinSize.h) ph = skinMinSize.h;
      if(vpw < skinMinSize.w) vpw = skinMinSize.w;
      if(vph < skinMinSize.h) vph = skinMinSize.h;

      // TODO: Must fix what we're snapping
      if(guiApp.textMode)
      {
         if(anchor.left.type)
         {
            SNAPUP(x, textCellW);
         }
         else if(anchor.right.type)
         {
            SNAPDOWN(x, textCellW);
         }

         if(anchor.top.type)
         {
            SNAPUP(y, textCellH);
         }
         else if(anchor.bottom.type)
         {
            SNAPDOWN(y, textCellH);
         }
      }

      // This is required to get proper initial decoration size using native decorations on Windows
#if defined(__WIN32__)
      if(nativeDecorations && windowHandle && guiApp && guiApp.interfaceDriver && !visible)
         guiApp.interfaceDriver.PositionRootWindow(this, x, y, Max(1, size.w), Max(1, size.h), true, true);
#endif
      GetDecorationsSize(&ew, &eh);

      if(anchor.left.type >= cascade && (state == normal /*|| state == Hidden*/))
      {
         // Leave room for non client windows (eventually dockable panels)
         Window win;
         int loX = 0, loY = 0, hiX = pw, hiY = ph;
         for(win = parent.children.first; win; win = win.next)
         {
            if(!win.nonClient && !win.isActiveClient && win.visible)
            {
               Size size = win.size;
               Point pos = win.position;
               int left = pos.x, top = pos.y;
               int right = pos.x + size.w, bottom = pos.y + size.h;
               if(win.size.w > win.size.h)
               {
                  if(bottom < ph / 4)
                     loY = Max(loY, bottom);
                  else if(top > ph - ph / 4)
                     hiY = Min(hiY, top);
               }
               else
               {
                  if(right < pw / 4)
                     loX = Max(loX, right);
                  else if(left > pw - pw / 4)
                     hiX = Min(hiX, left);
               }
            }
         }
         xOffset = loX;
         yOffset = loY;
         pw = hiX - loX;
         ph = hiY - loY;

         if(parent.sbv && !parent.sbv.style.hidden)
            pw += guiApp.currentSkin.VerticalSBW();
         if(parent.sbh && !parent.sbh.style.hidden)
            ph += guiApp.currentSkin.HorizontalSBH();

         if(anchor.left.type == cascade)
         {
            w = (int)(pw * 0.80);
            h = (int)(ph * 0.80);
         }
         else if(anchor.left.type >= vTiled)
         {
            int leftOver;
            int x2, y2;

            numTiling = parent.numPositions - parent.numIcons;
            if(parent.numIcons) ph -= guiApp.textMode ? 16 : 24;
            if(anchor.left.type == vTiled)
            {
               if(numTiling)
               {
                  tilingH = (int)sqrt(numTiling);
                  tilingW = numTiling / tilingH;
               }
               else
                  tilingH = tilingW = 0;
            }
            else
            {
               if(numTiling)
               {
                  tilingW = (int)sqrt(numTiling);
                  tilingH = numTiling / tilingW;
               }
               else
                  tilingH = tilingW = 0;
            }

            leftOver = numTiling - tilingH * tilingW;
            if(leftOver)
            {
               tilingSplit = (tilingW - leftOver) * tilingH;
               tilingLastH = tilingH+1;
            }
            else
               tilingSplit = numTiling;

            if(tilingW && tilingH)
            {
               if(positionID >= tilingSplit)
               {
                  x = xOffset + pw * (tilingSplit / tilingH + (positionID - tilingSplit) / tilingLastH)/tilingW;
                  y = yOffset + ph * ((positionID - tilingSplit) % tilingLastH) / tilingLastH;
                  x2 = xOffset + pw * (tilingSplit/tilingH + (positionID - tilingSplit) / tilingLastH + 1)/tilingW;
                  y2 = yOffset + ph * (((positionID - tilingSplit) % tilingLastH) + 1) / tilingLastH;
               }
               else
               {
                  x = xOffset + pw * (positionID / tilingH) / tilingW;
                  y = yOffset + ph * (positionID % tilingH) / tilingH;
                  x2 = xOffset + pw * (positionID / tilingH + 1) / tilingW;
                  y2 = yOffset + ph * ((positionID % tilingH) + 1) / tilingH;
               }
            }
            else
            {
               // How can this happen? From ec2 parsing test
               x = 0;
               y = 0;
               x2 = 0;
               y2 = 0;
            }
            if(guiApp.textMode)
            {
               SNAPDOWN(x, textCellW);
               SNAPDOWN(y, textCellH);
               SNAPDOWN(x2, textCellW);
               SNAPDOWN(y2, textCellH);
            }
            w = x2 - x;
            h = y2 - y;
         }
      }
      else
      {
         if(sizeAnchor.isClientW) w += ew;
         if(sizeAnchor.isClientH) h += eh;

         if(anchor.left.type == offset)
            x = anchor.left.distance;
         else if(anchor.left.type == relative)
            x = (anchor.left.percent < 0) ? ((int)(vpw * anchor.left.percent - 0.5)) : (int)(vpw * anchor.left.percent + 0.5);
         else if(anchor.right.type == relative)
            // ex = (anchor.right.percent < 0) ? ((int)(vpw * anchor.right.percent + 0)) : ((int)(vpw * anchor.right.percent + 0));
            ex = (anchor.right.percent < 0) ? ((int)(vpw * (1.0-anchor.right.percent) + 0)) : ((int)(vpw * (1.0-anchor.right.percent) + 0));
         else if(anchor.right.type == offset)
            ex = vpw - anchor.right.distance;

         if(anchor.top.type == offset)
            y = anchor.top.distance;
         else if(anchor.top.type == relative)
            y = (anchor.top.percent < 0) ? ((int)(vph * anchor.top.percent - 0.5)) : ((int)(vph * anchor.top.percent + 0.5));
         else if(anchor.bottom.type == relative)
            //ey = (anchor.bottom.percent < 0) ? ((int)(vph * anchor.bottom.percent + 0)) : ((int)(vph * anchor.bottom.percent + 0));
            ey = (anchor.bottom.percent < 0) ? ((int)(vph * (1.0-anchor.bottom.percent) + 0)) : ((int)(vph * (1.0-anchor.bottom.percent) + 0));
         else if(anchor.bottom.type == offset)
            ey = vph - anchor.bottom.distance;

         if(anchor.left.type && anchor.right.type)
         {
            switch(anchor.right.type)
            {
               case relative:
                  ex = pw * (1.0f-anchor.right.percent);
                  w = Max((int)(ex + 0.5) - x, 0);
                  break;
               case offset:
                  ex = vpw - anchor.right.distance;
                  w = Max((int)(ex + 0.5) - x, 0);
                  break;
            }
         }
         if(anchor.top.type && anchor.bottom.type)
         {
            switch(anchor.bottom.type)
            {
               case relative:
                  ey = ph * (1.0f-anchor.bottom.percent);
                  h = Max((int)(ey + 0.5) - y, 0);
                  break;
               case offset:
                  ey = vph - anchor.bottom.distance;
                  h = Max((int)(ey + 0.5) - y, 0);
                  break;
            }
         }
      }

      w -= ew;
      h -= eh;

      if(state == normal /*|| state == Hidden*/)
      {
         bool addSbV = false, addSbH = false;

         if(sizeAnchor.isClientW || (anchor.left.type && anchor.right.type))  w = Max(w, 1); else w = Max(w, 0);
         if(sizeAnchor.isClientH || (anchor.top.type && anchor.bottom.type))  h = Max(h, 1); else h = Max(h, 0);

         w = Max(w, minSize.w);
         h = Max(h, minSize.h);
         w = Min(w, maxSize.w);
         h = Min(h, maxSize.h);

         if((sizeAnchor.isClientW || !w || (anchor.left.type && anchor.right.type)) && reqScrollArea.h > h /*&& w*/ && sbv)
         {
            if(w) w -= guiApp.currentSkin.VerticalSBW();
            addSbV = true;
         }
         if((sizeAnchor.isClientH || !h ||  (anchor.top.type && anchor.bottom.type)) && reqScrollArea.w > w /*&& h*/ && sbh)
         {
            if(h) h -= guiApp.currentSkin.HorizontalSBH();
            addSbH = true;
         }

         if(!OnResizing(&w, &h))
         {
            w = clientSize.w;
            h = clientSize.h;
         }

         if((addSbV)) // || reqScrollArea.h > h) && sbv)
            w += guiApp.currentSkin.VerticalSBW();
         if((addSbH)) // || reqScrollArea.w > w) && sbh)
            h += guiApp.currentSkin.HorizontalSBH();

         w = Max(w, skinMinSize.w);
         h = Max(h, skinMinSize.h);
      }
      else
      {
         w = Max(w, 0);
         h = Max(h, 0);
      }

      w += ew;
      h += eh;

      if(guiApp.textMode)
      {
         SNAPDOWN(w, textCellW);
         SNAPDOWN(h, textCellH);
      }

      if(anchor.left.type == cascade && (state == normal /*|| state == Hidden*/))
      {
         if(parent.numIcons) ph -= guiApp.textMode ? 16 : 24;

         numCascade = Min(
            (pw - w) / CASCADE_SPACE,
            (ph - h) / CASCADE_SPACE);

         if(guiApp.textMode)
         {
               int cascW, cascH;
               numCascade++;
               cascW = (pw - w) / (numCascade-1);
               cascH = (ph - h) / (numCascade-1);
               SNAPDOWN(cascW, textCellW);
               SNAPDOWN(cascH, textCellH);
               cascadeW = (float)cascW;
               cascadeH = (float)cascH;
         }
         else
         {
            numCascade = Max(numCascade, 2);
            cascadeW = (float)(pw - w) / (numCascade-1);
            cascadeH = (float)(ph - h) / (numCascade-1);
         }

         x = (int)((positionID % numCascade) * cascadeW) + xOffset;
         y = (int)((positionID % numCascade) * cascadeH) + yOffset;
      }
      else if(anchor.left.type < vTiled)
      {
         if(!anchor.left.type || anchor.horz.type == middleRelative)
         {
            if(!anchor.right.type)
            {
               if(anchor.horz.type == middleRelative)
                  x = (int)(vpw * (0.5 + anchor.horz.percent) - w / 2);
               else
                  x = vpw / 2 + anchor.horz.distance - w / 2;
            }
            else
               x = (int)(ex - w);
         }

         // case A_EDGE: x = x - w; break;

         if(!anchor.top.type || anchor.vert.type == middleRelative)
         {
            if(!anchor.bottom.type)
            {
               if(anchor.vert.type == middleRelative)
                  y = (int)(vph * (0.5 + anchor.vert.percent) - h / 2);
               else
                  y = vph / 2 + anchor.vert.distance - h / 2;
            }
            else
               y = (int)(ey - h);
         }

         // case A_EDGE: y = y - h; break;
      }

      if((state == normal /*|| state == Hidden*/) && !OnMoving(&x, &y, w, h))
      {
         x = position.x;
         y = position.y;
      }

      if(guiApp.textMode)
      {
         SNAPDOWN(x, textCellW);
         SNAPDOWN(y, textCellH);
      }

      x += addX;
      y += addY;

      *ow = w;
      *oh = h;

      *ox = x;
      *oy = y;

      if(anchored && style.fixed && style.isActiveClient)
         anchored = false;
   }

   // --- Carets ---
   void UpdateCaret(bool forceUpdate, bool erase)
   {
      static Window lastWindow = null;
      static int caretX, caretY, caretSize;

      if(guiApp && guiApp.caretOwner == this)
      {
         int x = caretPos.x - scroll.x;
         int y = caretPos.y - scroll.y;

         if((erase || this.caretSize) &&
            x >= clientArea.left && x <= clientArea.right &&
            y >= clientArea.top  && y <= clientArea.bottom)
         {
            if(!erase)
            {
               guiApp.interfaceDriver.SetCaret(
                  x + absPosition.x + clientStart.x,
                  y + absPosition.y + clientStart.y, this.caretSize);
               guiApp.caretEnabled = true;
            }
            if(erase || lastWindow != this || caretX != x || caretY != y || caretSize != this.caretSize || forceUpdate)
            {
               Box updateBox;

               if(lastWindow != this)
               {
                  updateBox.left = x + 1;
                  updateBox.top = y;
                  updateBox.right = x + 2;
                  updateBox.bottom = y + this.caretSize - 1;
               }
               else
               {
                  updateBox.left = Min(x + 1, caretX + 1);
                  updateBox.top = Min(y, caretY);
                  updateBox.right = Max(x + 2, caretX + 2);
                  updateBox.bottom = Max(y + this.caretSize - 1, caretY + caretSize - 1);
               }

               guiApp.caretOwner.Update(updateBox);

               if(!erase)
               {
                  lastWindow = this;
                  caretX = x;
                  caretY = y;
                  caretSize = this.caretSize;
               }
            }
         }
         else
         {
            guiApp.interfaceDriver.SetCaret(0,0,0);
            guiApp.caretEnabled = false;
            lastWindow = null;
         }
      }
   }

   void SetPosition(int x, int y, int w, int h, bool modifyArea, bool modifyThisArea, bool modifyClientArea)
   {
      Window child;

      // Set position
      scrolledPos.x = position.x = x;
      scrolledPos.y = position.y = y;

      clientSize.w = size.w = w;
      clientSize.h = size.h = h;

      if(parent && !style.nonClient)
      {
         //if(!style.fixed || style.isDocument)
         {
            if(!style.dontScrollHorz) scrolledPos.x -= parent.scroll.x;
            if(!style.dontScrollVert) scrolledPos.y -= parent.scroll.y;
         }
      }

      clientStart.x = clientStart.y = 0;

      SetWindowArea(&clientStart.x, &clientStart.y, &size.w, &size.h, &clientSize.w, &clientSize.h);

      //if(!activeClient || activeClient.state != maximized)
      if(!noAutoScrollArea)
      {
         // Check if scroll area must be modified
         if(guiApp && !guiApp.modeSwitching && (sbv || sbh))
         {
            bool foundChild = false;
            int w = 0, h = 0;
            int cw = clientSize.w;// + ((!sbv || sbv.range > 1) ? guiApp.currentSkin.VerticalSBW() : 0);
            int ch = clientSize.h;// + ((!sbh || sbh.rangw > 1) ? guiApp.currentSkin.HorizontalSBH() : 0);
            for(child = children.first; child; child = child.next)
            {
               if(child.modifyVirtArea && !child.style.hidden && child.created && /*!child.anchored &&*/
                  !child.style.dontScrollHorz && !child.style.dontScrollVert && !child.style.nonClient)
               {
                  if(child.stateAnchor.right.type == none && child.stateAnchor.left.type == offset)
                     w = Max(w, child.position.x + child.size.w);
                  else if(child.stateAnchor.right.type == none && child.stateAnchor.left.type == none)
                     w = Max(w, Max(child.position.x, 0) + child.size.w);
                  if(child.stateAnchor.bottom.type == none && child.stateAnchor.top.type == offset)
                     h = Max(h, child.position.y + child.size.h);
                  else if(child.stateAnchor.bottom.type == none && child.stateAnchor.top.type == none)
                     h = Max(h, Max(child.position.y, 0) + child.size.h);

                  foundChild = true;
               }
            }
            if(foundChild && (w > cw || h > ch))
            {
               //if((w > reqScrollArea.w) || (h > reqScrollArea.w))
               {
                  int stepX = sbStep.x, stepY = sbStep.y;
                  // Needed to make snapped down position match the skin's check of client area
                  // against realvirtual
                  if(guiApp.textMode)
                  {
                     SNAPDOWN(stepX, textCellW);
                     SNAPDOWN(stepY, textCellH);
                     stepX = Max(stepX, textCellW);
                     stepY = Max(stepY, textCellH);
                  }
                  if(scrollFlags.snapX)
                     SNAPUP(w, stepX);
                  if(scrollFlags.snapY)
                     SNAPUP(h, stepY);

                  reqScrollArea.w = w;
                  reqScrollArea.h = h;
               }
            }
            else if(reqScrollArea.w || reqScrollArea.h)
            {
               reqScrollArea.w = 0;
               reqScrollArea.h = 0;
               SetScrollPosition(0,0);
            }
         }
      }

      // Automatic MDI Client Scrolling Area Adjustment
      if(parent && !parent.noAutoScrollArea)
      {
         if(modifyArea && modifyVirtArea /*&& !anchored*/ && (parent.sbv || parent.sbh) &&
            !style.dontScrollHorz && !style.dontScrollVert && !style.nonClient)
         {
            Window parent = this.parent;
            int w = parent.reqScrollArea.w;
            int h = parent.reqScrollArea.h;

            if(stateAnchor.right.type == none && stateAnchor.left.type == offset)
               w = Max(w, position.x + size.w);
            else if(stateAnchor.right.type == none && stateAnchor.left.type == none)
               w = Max(w, Max(position.x, 0) + size.w);
            if(stateAnchor.bottom.type == none && stateAnchor.top.type == offset)
               h = Max(h, position.y + size.h);
            else if(stateAnchor.bottom.type == none && stateAnchor.top.type == none)
               h = Max(h, Max(position.y, 0) + size.h);

            if((w > parent.clientSize.w && w > parent.reqScrollArea.w) ||
               (h > parent.clientSize.h && h > parent.reqScrollArea.h))
            {
               /*bool resize = false;
               int stepX = parent.sbStep.x, stepY = parent.sbStep.y;
               // Needed to make snapped down position match the skin's check of client area
               // against realvirtual
               if(guiApp.textMode)
               {
                  SNAPDOWN(stepX, textCellW);
                  SNAPDOWN(stepY, textCellH);
                  stepX = Max(stepX, textCellW);
                  stepY = Max(stepY, textCellH);
               }
               if(parent.scrollFlags.snapX)
                  SNAPUP(w, stepX);
               if(parent.scrollFlags.snapY)
                  SNAPUP(h, stepY);
               if(parent.reqScrollArea.w != w || parent.reqScrollArea.h != h)
               {
                  parent.reqScrollArea.w = w;
                  parent.reqScrollArea.h = h;*/

                 // parent.UpdateScrollBars(true, true);
                  parent.Position(parent.position.x, parent.position.y, parent.size.w, parent.size.h,
                     false, true, true, true, false, false);
                  return;
               //}
            }
            else
               GetRidOfVirtualArea();
         }
      }
      if(modifyThisArea)
         UpdateScrollBars(modifyThisArea, false);
      else if(guiApp.currentSkin)
      {
         SetWindowArea(
            &clientStart.x, &clientStart.y, &size.w, &size.h, &clientSize.w, &clientSize.h);

         if(sbv && (scrollFlags.dontHide || sbv.range > 1))
            clientSize.w -= guiApp.currentSkin.VerticalSBW();
         if(sbh && (scrollFlags.dontHide || sbh.range > 1))
            clientSize.h -= guiApp.currentSkin.HorizontalSBH();
      }

      scrollArea.w = Max(clientSize.w, reqScrollArea.w);
      scrollArea.h = Max(clientSize.h, reqScrollArea.h);

      absPosition = scrolledPos;
      if(guiApp && guiApp.driver != null && guiApp.interfaceDriver)
         guiApp.interfaceDriver.OffsetWindow(this, &absPosition.x, &absPosition.y);

      if(this != guiApp.desktop && parent)
      {
         absPosition.x += parent.absPosition.x;
         absPosition.y += parent.absPosition.y;
         if(!style.nonClient && this != guiApp.desktop)
         {
            absPosition.x += parent.clientStart.x;
            absPosition.y += parent.clientStart.y;
         }
      }

      box = Box { 0, 0, size.w - 1, size.h - 1 };
      SetBox(box);

      if(against)
      {
         // Clip against parent's client area
         box.ClipOffset(against, scrolledPos.x, scrolledPos.y);
      }
      // Compute client area in this window coordinate system
      clientArea.left = 0;
      clientArea.top = 0;
      clientArea.right = clientSize.w - 1;
      clientArea.bottom = clientSize.h - 1;

      // Clip against parent's client area
      if(against)
         clientArea.ClipOffset(against, scrolledPos.x + clientStart.x, scrolledPos.y + clientStart.y);

      if(is3D)
      {
         //absPosition.x -= parent.clientStart.x;
         //absPosition.y -= parent.clientStart.y;
      }

      // Adjust all children
      for(child = *&children.first; child; child = *&child.next)
         child.SetPosition((&child.position)->x, (&child.position)->y, (&child.size)->w, (&child.size)->h, false, true, true);

      UpdateCaret(false, false);
   }

   void GetRidOfVirtualArea(void)
   {
      if(parent && !parent.destroyed && style.fixed &&
         !style.dontScrollHorz && !style.dontScrollVert && !style.nonClient &&
         parent.reqScrollArea.w && parent.reqScrollArea.h)
      {
         if(!parent.noAutoScrollArea)
         {
            // TODO: Review the logic of all this? Each child is going to reposition the parent?
            /*
            Window child;
            bool found = false;
            for(child = children.first; child; child = child.next)
            {
               if(child.modifyVirtArea && !child.style.dontScrollHorz && !child.style.dontScrollVert && !child.style.nonClient)
               {
                  if(child.position.x + child.size.w > parent.clientSize.w + ((!parent.sbv || parent.sbv.style.hidden) ? 0 : guiApp.currentSkin.VerticalSBW()) ||
                     child.position.y + child.size.h > parent.clientSize.h + ((!parent.sbh || parent.sbh.style.hidden) ? 0 : guiApp.currentSkin.HorizontalSBH()))
                  {
                     found = true;
                     break;
                  }
               }
            }
            if(!found)
            */
            {
               Window parent = this.parent;
               parent.Position(
                  parent.position.x, parent.position.y, parent.size.w, parent.size.h,
                  false, true, true, true, false, false);
               /*
               parent.SetScrollArea(0,0,true);
               parent.SetScrollPosition(0,0);
               */
            }
         }
      }
   }
   public void ExternalPosition(int x, int y, int w, int h)
   {
      Position(x, y, w, h, false, true, true, true, false, false);
   }

   // (w, h): Full window size
   bool Position(int x, int y, int w, int h, bool force, bool processAnchors, bool modifyArea, bool updateScrollBars, bool thisOnly, bool changeRootWindow)
   {
      bool result = false;
      int oldCW = clientSize.w, oldCH = clientSize.h;
      bool clientResized, windowResized, windowMoved;
      Window child;
      //bool realResized = size.w != w || size.h != h;

      // TOCHECK: This wasn't in ecere.dll
      //if(!parent) return true;
      if(destroyed) return false;

      windowMoved = position.x != x || position.y != y || force;

      // windowResized = realResized || force;
      windowResized = size.w != w || size.h != h || force;

      if(rootWindow != this && display && !display.flags.flipping && scrolledPos.x != MININT && this.box.left != MAXINT)
      {
         if(style.nonClient)
         {
            Box box
            {
               scrolledPos.x - parent.clientStart.x + this.box.left, scrolledPos.y - parent.clientStart.y + this.box.top,
               scrolledPos.x - parent.clientStart.x + this.box.right,
               scrolledPos.y - parent.clientStart.y + this.box.bottom
            };
            parent.Update(box);
         }
         else
         {
            Box box { scrolledPos.x + this.box.left, scrolledPos.y + this.box.top, scrolledPos.x + this.box.right, scrolledPos.y + this.box.bottom};
            parent.Update(box);
         }
      }

      SetPosition(x, y, w, h, true, modifyArea, updateScrollBars);

      clientResized = oldCW != clientSize.w || oldCH != clientSize.h || force;
      if(clientResized && this == rootWindow && nativeDecorations && rootWindow.windowHandle)
         windowResized = true;

      if(display && rootWindow != this)
         Update(null);

      if(guiApp && guiApp.windowMoving)
      {
         if(guiApp.windowMoving.style.nonClient)
            guiApp.windowMoving.parent.SetMouseRangeToWindow();
         else
            guiApp.windowMoving.parent.SetMouseRangeToClient();
      }

      if(!positioned)
      {
         positioned = true;
         if(clientResized)
         {
            if(!thisOnly)
            {
               // Buttons bitmap resources crash if we do this while switching mode
               if(!guiApp || !guiApp.modeSwitching)
                  UpdateNonClient();

               // Process Anchored Children
               if(processAnchors)
               {
                  int x,y,w,h;
                  for(child = children.first; child; child = child.next)
                  {
                     if(child.created &&
                     ((child.stateAnchor.left.type != offset ||
                       child.stateAnchor.top.type != offset ||
                       child.stateAnchor.right.type != none ||
                       child.stateAnchor.bottom.type != none) ||
                        child.state == maximized || child.state == minimized))
                     {
                        child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor,
                           &x, &y, &w, &h);
                        // child.Position(x, y, w, h, false, true, true, true, false);
                        // This must be true cuz otherwise we're gonna miss everything since we SetPosition recursively already
                        child.Position(x, y, w, h, true, true, true, true, false, true /*false*/);
                     }
                  }
               }
            }

            // Is this gonna cause other problems? Commented out for the FileDialog end bevel bug
            //if(updateScrollBars)
            if(created)
               OnResize(clientSize.w, clientSize.h);
         }
         if((clientResized || windowMoved) && created)
            OnPosition(position.x, position.y, clientSize.w, clientSize.h);
   /*
         if(guiApp.interimWindow && guiApp.interimWindow.master.rootWindow == this)
         {
            Window master = guiApp.interimWindow.master;
            master.OnPosition(master.position.x, master.position.y, master.clientSize.w, master.clientSize.h);
         }
   */
         if(rootWindow == this && !is3D)
         {
            /*if(style.interim)
            {
               x -= guiApp.desktop.absPosition.x;
               y -= guiApp.desktop.absPosition.y;
            }*/
            //guiApp.Log("Position %s\n", caption);
            if(windowHandle)
            {
               if(windowResized || windowMoved)
                  if(display && !display.flags.memBackBuffer && changeRootWindow)
                     guiApp.interfaceDriver.PositionRootWindow(this, x, y, w, h, windowMoved, windowResized); //realResized);

               if(
#if !defined(__EMSCRIPTEN__)
                  !guiApp.fullScreenMode &&
#endif
                  this != guiApp.desktop && (windowResized || windowMoved) && visible)
                  for(child = parent.children.first; child && child != this; child = child.next)
                     if(child.rootWindow)
                        guiApp.interfaceDriver.UpdateRootWindow(child.rootWindow);
            }

            if(display)
            {
               if(windowMoved || windowResized)
               {
                  display.Lock(true /*false*/);
               }
               if(windowMoved)
                  display.Position(absPosition.x, absPosition.y);
                  //display.Position(absPosition.x + clientStart.x, absPosition.y + clientStart.y);
               if(windowResized)
               {
                  // result = realResized ? display.Resize(size.w, size.h) : true;
                  if(nativeDecorations && rootWindow.windowHandle)
                  {
                     int w = clientSize.w, h = clientSize.h;
                     if(hasMenuBar) h += skinMenuHeight;
                     if(hasStatusBar) h += statusBarHeight;
                     if(sbv && sbv.visible) w += sbv.size.w;
                     if(sbh && sbh.visible) h += sbh.size.h;
                     result = manageDisplay ? display.Resize(w, h) : true;
                  }
                  else
                     result = manageDisplay ? display.Resize(size.w, size.h) : true;
                  resized = true;
                  Update(null);
               }
               else if(clientResized)
                  Update(clientArea);
               // --- Major Slow Down / Fix OpenGL Resizing Main Window Lag

               /*
               if(!guiApp.fullScreenMode && !guiApp.modeSwitching && this == rootWindow)
                  UpdateDisplay();
               */

               if(windowMoved || windowResized)
               {
                  display.Unlock();
               }
            }
            if(guiApp.driver && !guiApp.modeSwitching && changeRootWindow && windowHandle)
            {
               if(windowResized || windowMoved)
                  if(!display || display.flags.memBackBuffer)
                     guiApp.interfaceDriver.PositionRootWindow(this,
                        x, y, w, h, windowMoved, windowResized);
               guiApp.interfaceDriver.UpdateRootWindow(this);
            }
            for(child = children.first; child; child = child.next)
            {
               if(child.is3D && child.created)
               {
                  // Copy Display Content
                  child.display.displaySystem = display.displaySystem;
                  child.display.window = display.window;
                  child.display.current = display.current;
                  child.display.width = display.width;
                  child.display.height = display.height;
                  child.display.driverData = display.driverData;
#if !defined(__EMSCRIPTEN__)
                  child.display.mutex = null;
#endif
               }
            }
         }
         else
            result = true;
         positioned = false;
      }
      return result;
   }

   void UpdateScrollBars(bool flag, bool fullThing)
   {
      int rvw, rvh;
      bool resizeH = false, resizeV = false;
      bool scrolled = false;
      rvw = (activeChild && activeChild.state == maximized) ? 0 : reqScrollArea.w;
      rvh = (activeChild && activeChild.state == maximized) ? 0 : reqScrollArea.h;

      if(destroyed) return;
      if(guiApp.currentSkin)
      {
         MinMaxValue cw = 0, ch = 0;
         bool sbvVisible = false, sbhVisible = false;
         int rangeH = 0, rangeV = 0;
         int positionH = 0, positionV;

         // First get client area with no respect to scroll bars

         if(flag)
         {
            SetWindowArea(
               &clientStart.x, &clientStart.y, &size.w, &size.h, &cw, &ch);

            if(scrollFlags.dontHide)
            {
               if(sbv)
                  cw -= guiApp.currentSkin.VerticalSBW();
               if(sbh)
                  ch -= guiApp.currentSkin.HorizontalSBH();

               // Update the scrollbar visibility
               if(sbh)
               {
                  sbh.seen = cw;
                  sbh.total = rvw;
                  rangeH = sbh.range;
                  sbh.disabled = rangeH <= 1;
                  if(sbh.style.hidden)
                  {
                     resizeH = true;
                  }
               }
               if(sbv)
               {
                  sbv.seen = ch;
                  sbv.total = rvh;
                  rangeV = sbv.range;
                  sbv.disabled = rangeV <= 1;
                  if(sbv.style.hidden)
                  {
                     resizeV = true;
                  }
               }
            }
            else
            {
               int oldHRange = sbh ? sbh.range : 0;
               int oldVRange = sbv ? sbv.range : 0;
               // Then start off with horizontal scrollbar range
               if(sbh)
               {
                  positionH = sbh.thumbPosition;

                  /*
                  sbh.seen = cw;
                  sbh.total = rvw;
                  */
                  SBSetSeen(sbh, cw);
                  SBSetTotal(sbh, rvw);
                  rangeH = sbh.range;
                  if(rangeH > 1)
                     ch -= guiApp.currentSkin.HorizontalSBH();
               }

               // Do the same for vertical scrollbar
               if(sbv)
               {
                  positionV = sbv.thumbPosition;
                  /*
                  sbv.seen = ch;
                  sbv.total = rvh;
                  */
                  SBSetSeen(sbv, ch);
                  SBSetTotal(sbv, rvh);
                  rangeV = sbv.range;
                  if(rangeV > 1)
                  {
                     cw -= guiApp.currentSkin.VerticalSBW();
                     // Maybe we need to set the range on the horizontal scrollbar again
                     if(sbh)
                     {
                        /*
                        sbh.seen = cw;
                        sbh.total = rvw;
                        */
                        SBSetSeen(sbh, cw);
                        SBSetTotal(sbh, rvw);
                        //sbh.Action(setRange, positionH, 0);
                        if(rangeH <= 1 && sbh.range > 1)
                        {
                           ch -= guiApp.currentSkin.HorizontalSBH();
                           /*
                           sbv.seen = ch;
                           sbv.total = rvh;
                           */
                           SBSetSeen(sbv, ch);
                           SBSetTotal(sbv, rvh);
                           rangeV = sbv.range;
                           //sbv.Action(setRange, positionV, 0);
                        }
                        rangeH = sbh.range;
                     }
                  }
                  if(sbh && sbh.range != oldHRange) sbh.Action(setRange, positionH, 0);
                  if(sbv && sbv.range != oldVRange) sbv.Action(setRange, positionV, 0);
               }

               // Update the scrollbar visibility
               if(!scrollFlags.dontHide)
               {
                  if(sbh && ((rangeH <= 1 && !sbh.style.hidden) || (rangeH > 1 && sbh.style.hidden)))
                  {
                     resizeH = true;
                  }
                  if(sbv && ((rangeV <= 1 && !sbv.style.hidden) || (rangeV > 1 && sbv.style.hidden)))
                  {
                     resizeV = true;
                  }
               }
            }

            if(guiApp.currentSkin)
            {
               clientSize.w = cw;
               clientSize.h = ch;
            }

            if(resizeH)
               sbhVisible = sbh.style.hidden ? true : false;
            if(resizeV)
               sbvVisible = sbv.style.hidden ? true : false;

            // Do our resize here
            if(flag && (resizeH || resizeV) && fullThing)
            {
               Position(position.x, position.y, size.w, size.h, false, true, false, false, false, false);

               if(!positioned)
               {
                  positioned = true;
                  OnResize(clientSize.w, clientSize.h);
                  positioned = false;
               }
            }

            if(resizeH && sbh)
               sbh.visible = sbhVisible;
            if(resizeV && sbv)
               sbv.visible = sbvVisible;
         }
         scrollArea.w = Max(clientSize.w, reqScrollArea.w);
         scrollArea.h = Max(clientSize.h, reqScrollArea.h);

         if(sbh)
            sbh.pageStep = clientSize.w;
         if(sbv)
            sbv.pageStep = clientSize.h;

         // Notify doesn't handle setRange anymore... process it here
         if(sbh)
         {
            int positionH = sbh.thumbPosition;
            if(scroll.x != positionH)
            {
               OnHScroll(setRange, positionH, 0);
               scrolled = true;
            }
            if(guiApp.textMode)
               SNAPDOWN(positionH, textCellW);
            scroll.x = positionH;
         }
         else
         {
            int x = scroll.x;
            int range;
            int seen = clientSize.w, total = reqScrollArea.w;
            seen = Max(1,seen);

            if(scrollFlags.snapX)
               SNAPDOWN(seen, sbStep.x);

            if(!total) total = seen;
            range = total - seen + 1;

            range = Max(range, 1);
            if(x < 0) x = 0;
            if(x >= range) x = range - 1;

            if(scrollFlags.snapX)
               SNAPUP(x, sbStep.x);

            if(scroll.x != x)
            {
               OnHScroll(setRange, x, 0);
            }

            if(guiApp.textMode)
            {
               SNAPDOWN(x, textCellW);
            }
            scroll.x = x;
         }
         if(sbv)
         {
            int positionV = sbv.thumbPosition;
            if(scroll.y != positionV)
            {
               OnVScroll(setRange, positionV, 0);
               scrolled = true;
            }
            if(guiApp.textMode)
               SNAPDOWN(positionV, textCellH);
            scroll.y = positionV;
         }
         else
         {
            int y = scroll.y;
            int range;
            int seen = clientSize.h, total = reqScrollArea.h;
            seen = Max(1,seen);

            if(scrollFlags.snapY)
               SNAPDOWN(seen, sbStep.y);

            if(!total) total = seen;
            range = total - seen + 1;
            range = Max(range, 1);
            if(y < 0) y = 0;
            if(y >= range) y = range - 1;

            if(scrollFlags.snapY)
               SNAPUP(y, sbStep.y);

            if(scroll.y != y)
            {
               OnVScroll(setRange, y, 0);
            }

            if(guiApp.textMode)
            {
               SNAPDOWN(y, textCellH);
            }
            scroll.y = y;
         }

         /*
         if(scrolled || (resizeH || resizeV))   // This ensures children anchored to bottom/right gets repositioned correctly
         {
            Window child;
            for(child = children.first; child; child = child.next)
            {
               if(!child.style.nonClient && child.state != maximized && (!child.style.dontScrollHorz || !child.style.dontScrollVert))
               {
                  int x,y,w,h;
                  child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor, &x, &y, &w, &h);
                  child.Position(x, y, w, h, false, true, false, true, false, false);
               }
            }
         }
         */
      }

      // Process Scrollbars

      if(sbh) // && !sbh.style.hidden
      {
         if(!sbh.anchored)
            sbh.Move(clientStart.x, clientStart.y + clientSize.h, clientSize.w,0);
         // Need to set the range again (should improve...) since the scrollbars didn't have
         // the right size when UpdateScrollArea set the range on it
         if(flag)
         {
            sbh.seen = clientSize.w;
            sbh.total = rvw;
         }
      }
      if(sbv) // && !sbv.state.hidden
      {
         if(!sbv.anchored)
            sbv.Move(clientStart.x + clientSize.w, clientStart.y, 0, clientSize.h);
         // Need to set the range again (should improve...) since the scrollbars didn't have
         // the right size when UpdateScrollArea set the range on it
         if(flag)
         {
            sbv.seen = clientSize.h;
            sbv.total = rvh;
         }
      }

      // TESTING THIS LOWER
      if(scrolled || (resizeH || resizeV))   // This ensures children anchored to bottom/right gets repositioned correctly
      {
         Window child;
         for(child = children.first; child; child = child.next)
         {
            if(!child.style.nonClient && child.state != maximized && (!child.style.dontScrollHorz || !child.style.dontScrollVert))
            {
               int x,y,w,h;
               child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor, &x, &y, &w, &h);
               child.Position(x, y, w, h, false, true, false, true, false, false);
            }
         }
      }
   }

   bool MaximizeButtonClicked(Button button, int x, int y, Modifiers mods)
   {
      SetState(maximized, false, mods);
      return false;
   }

   bool RestoreButtonClicked(Button button, int x, int y, Modifiers mods)
   {
      SetState(normal, false, mods);
      return false;
   }

   bool MinimizeButtonClicked(Button button, int x, int y, Modifiers mods)
   {
      SetState(minimized, false, mods);
      parent.CycleChildren(false, true, false, true);
      return false;
   }

   void ScrollBarNotification(ScrollBar control, ScrollBarAction action, int position, Key keyFlags)
   {
      Window child;
      // Scroll bar notifications
      if(action != setRange)
      {
         bool changed = false;

         if(control == sbh)
         {
            if(scroll.x != position)
            {
               OnHScroll(action, position, keyFlags);
               changed = true;
            }
            if(guiApp.textMode)
            {
               SNAPDOWN(position, textCellW);
            }
            scroll.x = position;
         }
         else
         {
            if(scroll.y != position)
            {
               OnVScroll(action, position, keyFlags);
               changed = true;
            }
            if(guiApp.textMode)
            {
               SNAPDOWN(position, textCellH);
            }
            scroll.y = position;
         }
         if(changed)
         {
            bool childMove = false;
            for(child = children.first; child; child = child.next)
            {
               if(!child.style.nonClient && child.state != maximized && (!child.style.dontScrollHorz || !child.style.dontScrollVert))
               {
                  int x,y,w,h;
                  child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor, &x, &y, &w, &h);
                  child.Position(x, y, w, h, false, true, false, true, false, false);
                  childMove = true;
               }
            }
            // Testing this patch out to solve MDI workspace redraw bugs
            // We were already supposed to be updating parent's affected area in Position() but it doesn't seem to be working
            // Scroll offsets to blame?
            if(childMove)
               Update(null);
         }
         UpdateCaret(false, false);
      }
      else
      {
         // Testing this patch out to solve MDI workspace redraw bugs
         for(child = children.first; child; child = child.next)
         {
            if(!child.style.nonClient && child.state != maximized && (!child.style.dontScrollHorz || !child.style.dontScrollVert))
            {
               Update(null);
               break;
            }
         }
      }
   }

   Window GetParentMenuBar()
   {
      Window menuBarParent;
      if(formDesigner) return null;
      for(menuBarParent = this ? parent : null; menuBarParent; menuBarParent = menuBarParent.parent)
      {
         if(menuBarParent.style.hasMenuBar && menuBarParent.menuBar) return menuBarParent.menuBar;
         if(menuBarParent && !menuBarParent.isActiveClient)
            return null;
      }
      return null;
   }

   void CreateSystemChildren(void)
   {
      Window parent = this;
      bool scrollBarChanged = false;
      bool hasClose = false, hasMaxMin = false;
      Point scroll = this.scroll;

      if(state == maximized)
      {
         parent = GetParentMenuBar();
         if(!parent)
            parent = this;
      }

      if(parent)
      {
         if(style.hasClose) hasClose = true;
         if(style.hasMaximize || style.hasMinimize)
         {
            hasClose = true;
            hasMaxMin = true;
         }
      }

      if(sysButtons[2] && (!hasClose || sysButtons[2].parent != parent))
      {
         sysButtons[2].Destroy(0);
         sysButtons[2] = null;
      }
      if(sysButtons[1] && (!hasMaxMin || sysButtons[1].parent != parent))
      {
         sysButtons[1].Destroy(0);
         sysButtons[1] = null;
      }
      if(sysButtons[0] && (!hasMaxMin || sysButtons[0].parent != parent))
      {
         sysButtons[0].Destroy(0);
         sysButtons[0] = null;
      }
      //return;
      if(hasClose && parent)
      {
         if(!sysButtons[2])
         {
            sysButtons[2] =
               Button
               {
                  parent, master = this,
                  inactive = true, nonClient = true, visible = false;

                  bool NotifyClicked(Button button, int x, int y, Modifiers mods)
                  {
                     Destroy(0);
                     return true;
                  }
               };
            if(this.parent == guiApp.desktop)
               sysButtons[2].hotKey = altF4;
            else if(style.isActiveClient)
               sysButtons[2].hotKey = ctrlF4;
            sysButtons[2].Create();
         }

         sysButtons[2].symbol = 'X';
         sysButtons[2].disabled = !style.hasClose;
      }

      if(hasMaxMin && parent)
      {
         //SkinBitmap skin;
         unichar symbol;
         bool (* method)(Window window, Button button, int x, int y, Modifiers mods);
         if(state == maximized)
         {
            //skin = restore;
            method = RestoreButtonClicked;
            symbol = '\x12';
         }
         else
         {
            //skin = maximize;
            method = MaximizeButtonClicked;
            symbol = '\x18';
         }
         if(!sysButtons[1])
         {
            sysButtons[1] =
               Button
               {
                  parent, master = this,
                  hotKey = altEnter, inactive = true, nonClient = true, visible = false
               };
            sysButtons[1].Create();
         }
         sysButtons[1].NotifyClicked = method;

         sysButtons[1].symbol = symbol;
         sysButtons[1].disabled = !style.hasMaximize;
      }

      if(hasMaxMin && parent)
      {
         //SkinBitmap skin;
         unichar symbol;
         bool (* method)(Window window, Button button, int x, int y, Modifiers mods);
         if (state == minimized)
         {
            //skin = restore;
            method = RestoreButtonClicked;
            symbol = '\x12';
         }
         else
         {
            //skin = minimize;
            method = MinimizeButtonClicked;
            symbol = '\x19';
         }
         if(!sysButtons[0])
         {
            sysButtons[0] =
               Button
               {
                  parent, master = this,
                  hotKey = altM, inactive = true, nonClient = true, visible = false
               };
            sysButtons[0].Create();
         }
         sysButtons[0].NotifyClicked = method;

         sysButtons[0].symbol = symbol;
         sysButtons[0].disabled = !style.hasMinimize;
      }

      // Create the scrollbars
      if(style.hasHorzScroll && !sbh)
      {
         sbh =
            ScrollBar
            {
               this,
               direction = horizontal,
               windowOwned = true,
               inactive = true,
               nonClient = true,
               snap = scrollFlags.snapX,
               NotifyScrolling = ScrollBarNotification
            };
         sbh.Create();
         scrollBarChanged = true;
      }
      else if(sbh && !style.hasHorzScroll)
      {
         sbh.Destroy(0);
         sbh = null;
      }

      if(style.hasVertScroll && !sbv)
      {
         sbv =
            ScrollBar
            {
               this,
               direction = vertical,
               windowOwned = true,
               inactive = true,
               nonClient = true,
               snap = scrollFlags.snapY,
               NotifyScrolling = ScrollBarNotification
            };
         sbv.Create();
         scrollBarChanged = true;
      }
      else if(sbv && !style.hasVertScroll)
      {
         sbv.Destroy(0);
         sbv = null;
      }
      if(scrollBarChanged)
      {
         SetScrollLineStep(sbStep.x, sbStep.y);
         UpdateScrollBars(true, true);
      }
      UpdateNonClient();

      if(scrollBarChanged)
      {
         if(sbh) sbh.thumbPosition = scroll.x;
         if(sbv) sbv.thumbPosition = scroll.y;
      }
   }

   void UpdateCaption(void)
   {
      if(rootWindow == this)
      {
         char caption[2048];
         FigureCaption(caption);
         if(guiApp.interfaceDriver)
            guiApp.interfaceDriver.SetRootWindowCaption(this, caption);
      }
      UpdateDecorations();
      if(parent)
      {
         if(parent.activeClient == this) // Added this last check
         {
            if(parent.rootWindow == parent)
            {
               char caption[2048];
               parent.FigureCaption(caption);
               if(guiApp.interfaceDriver)
                  guiApp.interfaceDriver.SetRootWindowCaption(parent, caption);
            }
            else
               parent.UpdateCaption();
         }
         parent.UpdateDecorations();
      }
   }

   void UpdateActiveDocument(Window previous)
   {
      Window activeClient = this.activeClient;
      Window activeChild = this.activeChild;
      if(menuBar)
      {
         UpdateCaption();
         if(!destroyed)
         {
            if(activeClient)
               activeClient.CreateSystemChildren();
            if(previous)
               previous.CreateSystemChildren();
         }
      }

      if(menu)
      {
         MenuItem item;
         //bool disabled;

         if(menu)
            menu.Clean(this);

         // Build window list
         if(activeClient)
         {
            Menu windowMenu = menu.FindMenu("Window");
            if(windowMenu)
            {
               OldLink cycle;
               int id;
               for(id = 0, cycle = activeClient.cycle; cycle && id<10;)
               {
                  Window document = cycle.data;
                  if(!document.style.nonClient && document.style.isActiveClient && document.visible)
                  {
                     char name[2060], caption[2048];
                     document.FigureCaption(caption);
                     sprintf(name, "%d %s", id+1, caption);
                     windowMenu.AddDynamic(MenuItem
                        {
                           copyText = true, text = name, hotKey = Key { k1 + id }, id = id++,
                           NotifySelect = MenuWindowSelectWindow
                        }, this, false);
                  }
                  cycle = cycle.next;
                  if(activeClient.cycle == cycle) break;
               }
            }
         }

         if((!previous && activeClient) || !activeClient)
         {
            /*if(!activeClient)
               disabled = true;
            else
               disabled = false;*/
            item = menu.FindItem(MenuWindowCloseAll, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowNext, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowPrevious, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowCascade, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowTileHorz, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowTileVert, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowArrangeIcons, 0);
            if(item) item.disabled = false;
            item = menu.FindItem(MenuWindowWindows, 0);
            if(item) item.disabled = false;
         }

         item = menu.FindItem(MenuFileClose, 0);
         if(item) item.disabled = !activeClient || !activeClient.style.hasClose;
         item = menu.FindItem(MenuFileSaveAll, 0);
         if(item) item.disabled = numDocuments < 1;

         if(activeClient && activeClient.menu && activeClient.state != minimized)
         {
            if(mergeMenus)
            {
               //activeClient.menu.Clean(activeClient);
               menu.Merge(activeClient.menu, true, activeClient);
            }
         }

         if(activeChild && activeChild != activeClient && activeChild.menu && activeChild.state != minimized)
         {
            if(mergeMenus)
               menu.Merge(activeChild.menu, true, activeChild);
         }
      }
      // This is called again for a child window change, with same active client
      OnActivateClient(activeClient, previous);
      if(!menuBar && !((BorderBits)borderStyle).fixed && parent && parent.activeClient == this)
         parent.UpdateActiveDocument(null);
   }

   void _ShowDecorations(Box box, bool post)
   {
#if defined(__LUMIN__)
      return;
#endif
      if(rootWindow == this && nativeDecorations && !is3D) return;
      if(visible && this != guiApp.desktop)
      {
         Surface surface = RedrawFull(box);
         if(surface)
         {
            char caption[2048];
            FigureCaption(caption);

            if(post)
               ShowDecorations(captionFont.font,
                  surface,
                  caption,
                  active, //parent.activeClient == this
                  guiApp.windowMoving == this);
            else
               PreShowDecorations(captionFont.font,
                  surface,
                  caption,
                  active, //parent.activeClient == this
                  guiApp.windowMoving == this);

            delete surface;
         }
      }
   }

   void UpdateExtent(Box refresh)
   {
      Surface surface = null;

      if(!manageDisplay) { OnRedraw(null);return; }
      _ShowDecorations(refresh, false);

      surface = Redraw(refresh);
      // Opaque background: just fill before EW_REDRAW (clear?)
      if(surface)
      {
         surface.SetBackground(background);
         surface.SetForeground(foreground);
         surface.DrawingChar(' ');
         if(this == rootWindow)
         {
#if !defined(__LUMIN__)
            if(style.drawBehind || background.a)
            {
               int a = background.a;
               // Premultiply alpha for clear color
               surface.SetBackground({ (byte)a, { (byte)(a*background.color.r/255), (byte)(a*background.color.g/255), (byte)(a*background.color.b/255) } });
               surface.Clear(colorBuffer);
               surface.SetBackground(background);
            }
#endif
         }
         else if(background.a)
         {
#ifdef _DEBUG
            /*
            background.color = { (byte)GetRandom(0,255), (byte)GetRandom(0,255), (byte)GetRandom(0,255) };
            surface.SetForeground((background.color.r > 128 || background.color.g > 128) ? black : white);
            */
#endif
            if(display.flags.alpha && background.a < 255 && background)
            {
               surface.Area(0,0,clientSize.w, clientSize.h);
               /*if(style.clearDepthBuffer)
                  surface.Clear(depthBuffer);*/
            }
            else if(/*style.clearDepthBuffer || */background.a)
            {
               int a = background.a;
               // surface.Clear((style.clearDepthBuffer ? depthBuffer : 0) | (background.a ? colorBuffer : 0));
               // Premultiply alpha for clear color
               surface.SetBackground({ (byte)a, { (byte)(a*background.color.r/255), (byte)(a*background.color.g/255), (byte)(a*background.color.b/255) } });
               surface.Clear(colorBuffer);
               surface.SetBackground(background);
            }
         }

         // Default Settings
         surface.TextFont(usedFont.font);
         surface.TextOpacity(false);
         surface.outlineColor = background.color; //black;

         OnRedraw(surface);

         // Draw the caret ...
         if(!disabled && this == guiApp.caretOwner && guiApp.caretEnabled /*&& !guiApp.interimWindow*/ && !guiApp.currentSkin.textMode)
         {
            // surface.SetBackground(0xFFFFFF - background.color);
            surface.SetBackground(~background.color);
            surface.Area(
               caretPos.x - scroll.x + 1, caretPos.y - scroll.y,
               caretPos.x - scroll.x + 2, caretPos.y - scroll.y + caretSize - 1);
         }
         delete surface;
      }
   }

   void DrawOverChildren(Box refresh)
   {
      Surface surface = Redraw(refresh);
      if(surface)
      {
         // Default Settings
         surface.DrawingChar(' ');
         surface.SetBackground(background);
         surface.SetForeground(foreground);

         surface.TextFont(usedFont.font);
         surface.TextOpacity(false);
         surface.outlineColor = background.color; //black;

         OnDrawOverChildren(surface);

         delete surface;

      }
      _ShowDecorations(refresh, true);
   }

   void ComputeClipExtents(void)
   {
      Window child;
      Extent clipExtent { /*first = -1, last = -1, free = -1*/ };

      clipExtent.Copy(this.clipExtent);

      for(child = children.last; child; child = child.prev)
      {
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow)
         {
            bool opaque = child.IsOpaque(); // TODO: acess background directly
            int dx = child.absPosition.x - absPosition.x, dy = child.absPosition.y - absPosition.y;

            child.clipExtent.Copy(clipExtent);
            child.clipExtent.Offset(-dx, -dy);
            child.clipExtent.IntersectBox(child.box);

            child.ComputeClipExtents();

            if(opaque && !child.style.nonClient)
            {
               // Adjust the box for the parent:
               Box box { child.box.left + dx, child.box.top + dy, child.box.right + dx, child.box.bottom + dy };
               clipExtent.ExcludeBox(box, rootWindow.tempExtents[0]);
            }

         }
      }
      // ??? Only do this for overlapped window or if parent has with clip children flag

      // Do this if window has clip children flag on (default false?)
      // this.clipExtent = clipExtent;

      clipExtent.Free(null);
   }

   void ComputeRenderAreaNonOpaque(Extent dirtyExtent, Extent overDirtyExtent, Extent backBufferUpdate)
   {
      Window child;
      int offsetX = absPosition.x - rootWindow.absPosition.x, offsetY = absPosition.y - rootWindow.absPosition.y;
      if(rootWindow.nativeDecorations && rootWindow.windowHandle)
      {
         offsetX -= rootWindow.clientStart.x;
         offsetY -= rootWindow.clientStart.y - (rootWindow.hasMenuBar ? skinMenuHeight : 0);
      }


      for(child = children.last; child; child = child.prev)
      {
         bool opaque = child.IsOpaque();
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow)
         {
            if(!opaque)
            {
               // Adjust renderArea to the root window level
               Extent * renderArea = &rootWindow.tempExtents[3];

               int offsetX = child.absPosition.x - rootWindow.absPosition.x;
               int offsetY = child.absPosition.y - rootWindow.absPosition.y;
               if(child.rootWindow.nativeDecorations && rootWindow.windowHandle)
               {
                  offsetX -= child.rootWindow.clientStart.x;
                  offsetY -= child.rootWindow.clientStart.y - (child.rootWindow.hasMenuBar ? skinMenuHeight : 0);
               }

               /*
               Extent childRenderArea;

               if(backBufferUpdate != null)
               {
                  childRenderArea.Copy(backBufferUpdate);
                  childRenderArea.Offset(-offsetX, -offsetY);
               }
               else
                  childRenderArea.Copy(child.dirtyArea);

               // Add extent forced by transparency to the dirty area, adjusting dirty extent to the window
               renderArea.Copy(dirtyExtent);
               renderArea.Offset(-offsetX, -offsetY);
               childRenderArea.Union(renderArea);
               renderArea.Free();

               // Intersect with the clip extent
               childRenderArea.Intersection(child.clipExtent);
               */

               renderArea->Copy(child.dirtyArea /*childRenderArea*/);

               // This intersection with child clip extent was missing and causing #708 (Installer components list scrolling bug):
               renderArea->Intersection(child.clipExtent, rootWindow.tempExtents[0], rootWindow.tempExtents[1], rootWindow.tempExtents[2]);

               renderArea->Offset(offsetX, offsetY);

               dirtyExtent.Union(renderArea, rootWindow.tempExtents[0]);
               // overDirtyExtent.Union(renderArea);
               renderArea->Empty();
               // childRenderArea.Free();

               //child.ComputeRenderAreaNonOpaque(dirtyExtent, overDirtyExtent, backBufferUpdate);
            }
         }
      }

      for(child = children.last; child; child = child.prev)
      {
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow)
         {
            child.ComputeRenderAreaNonOpaque(dirtyExtent, overDirtyExtent, backBufferUpdate);
         }
      }
   }

   void ComputeRenderArea(Extent dirtyExtent, Extent overDirtyExtent, Extent backBufferUpdate)
   {
      bool opaque = IsOpaque();
      Extent * dirtyExtentWindow = &rootWindow.tempExtents[1];
      Window child;
      int offsetX = absPosition.x - rootWindow.absPosition.x, offsetY = absPosition.y - rootWindow.absPosition.y;
      if(rootWindow.nativeDecorations && rootWindow.windowHandle)
      {
         offsetX -= rootWindow.clientStart.x;
         offsetY -= rootWindow.clientStart.y - (rootWindow.hasMenuBar ? skinMenuHeight : 0);
      }

#if 0
      for(child = children.last; child; child = child.prev)
      {
         //child.ComputeRenderAreaNonOpaque(dirtyExtent, overDirtyExtent, backBufferUpdate);
         /*
         ColorAlpha background = *(ColorAlpha *)&child.background;
         bool opaque = child.IsOpaque();
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow)
         {
            if(!opaque)
            {
               int offsetX = child.absPosition.x - rootWindow.absPosition.x, offsetY = child.absPosition.y - rootWindow.absPosition.y;
               // Adjust renderArea to the root window level
               Extent renderArea;
               renderArea.Copy(child.dirtyArea);
               renderArea.Offset(offsetX, offsetY);
               dirtyExtent.Union(renderArea);
               overDirtyExtent.Union(renderArea);
               renderArea.Free();
            }
         }*/
      }
#endif
      for(child = children.last; child; child = child.prev)
      {
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow)
         {
            child.ComputeRenderArea(dirtyExtent, overDirtyExtent, backBufferUpdate);
         }
      }

      if(backBufferUpdate != null)
      {
         renderArea.Copy(backBufferUpdate);
         renderArea.Offset(-offsetX, -offsetY);

         overRenderArea.Copy(backBufferUpdate);
         overRenderArea.Offset(-offsetX, -offsetY);


      }
      else
      {
         renderArea.Copy(dirtyArea);

         overRenderArea.Copy(dirtyArea);
      }

      // Add extent forced by transparency to the dirty area, adjusting dirty extent to the window
      dirtyExtentWindow->Copy(dirtyExtent);
      dirtyExtentWindow->Offset(-offsetX, -offsetY);
      renderArea.Union(dirtyExtentWindow, rootWindow.tempExtents[0]);
      dirtyExtentWindow->Empty();

      // Intersect with the clip extent
      renderArea.Intersection(clipExtent, rootWindow.tempExtents[0], rootWindow.tempExtents[1], rootWindow.tempExtents[2]);

      /*
      if(renderArea.count > 10)
      {
         BoxItem extentBox;
         printf("\nToo many extents (%d):\n", renderArea.count);

         //extent.UnionBox({ 112, 6, 304, 7 }, rootWindow.tempExtents[0]);
         //extent.UnionBox({ 112, 8, 304, 17 }, rootWindow.tempExtents[0]);
         //printf("Test\n");

         {
            int c;
            for(c = 0; c<10; c++)
            {
               Extent extent { };
               FASTLIST_LOOP(renderArea, extentBox)
               {
                  extent.UnionBox(extentBox.box, rootWindow.tempExtents[0]);
               }
               renderArea.Copy(extent);

               FASTLIST_LOOP(renderArea, extentBox)
               {
      #ifdef _DEBUG
                  printf("(%d, %d) - (%d, %d)\n",
                     extentBox.box.left, extentBox.box.top,
                     extentBox.box.right, extentBox.box.bottom);
      #endif
               }

               printf("\nNow %d\n", renderArea.count);
            }
         }
      }
      */

      // WHY WAS THIS COMMENTED ??

      // Add extent forced by DrawOverChildren to the dirty area, adjusting dirty extent to the window
      dirtyExtentWindow->Copy(overDirtyExtent);
      dirtyExtentWindow->Offset(-offsetX, -offsetY);
      overRenderArea.Union(dirtyExtentWindow, rootWindow.tempExtents[0]);
      dirtyExtentWindow->Empty();

      // Intersect with the clip extent
      overRenderArea.Intersection(clipExtent, rootWindow.tempExtents[0], rootWindow.tempExtents[1], rootWindow.tempExtents[2]);


      if(opaque)
      {
         // Scrolling
         if(scrollExtent.count)
         {
            // Subtract render extent from scrolling extent
            scrollExtent.Exclusion(renderArea, rootWindow.tempExtents[0]);

            if(backBufferUpdate == null)
            {
               Extent * dirty = &rootWindow.tempExtents[3];
               BoxItem scrollBox;

               // Intersect scrolling extent with clip extent
               scrollExtent.Intersection(clipExtent, rootWindow.tempExtents[0], rootWindow.tempExtents[1], rootWindow.tempExtents[2]);

               // offset this scroll to be at the root window level
               scrollExtent.Offset(offsetX, offsetY);
               // Add area that was scrolled to the dirty extents of the back buffer
               rootWindow.dirtyBack.Union(scrollExtent, rootWindow.tempExtents[0]);

               dirty->Empty();

               // Will need scrolledArea.x & scrolledArea.y to support multiple scrolls
               for(scrollBox = (BoxItem)scrollExtent.first; scrollBox; scrollBox = (BoxItem)scrollBox.next)
                  display.Scroll(scrollBox.box, scrolledArea.x, scrolledArea.y, dirty);

               scrolledArea.x = 0;
               scrolledArea.y = 0;

               scrollExtent.Empty();

               // Add the exposed extent to the window render area
               dirty->Offset(-offsetX, -offsetY);
               renderArea.Union(dirty, rootWindow.tempExtents[0]);
               dirty->Empty();
            }
         }

         // Subtract the window's box from the transparency forced extent
         dirtyExtent.ExcludeBox({box.left + offsetX, box.top + offsetY, box.right + offsetX, box.bottom + offsetY }, rootWindow.tempExtents[0]);
      }
      /*else
      {
         Extent renderArea;

         renderArea.Copy(this.renderArea);
         renderArea.Offset(offsetX, offsetY);
         dirtyExtent.Union(renderArea);
         renderArea.Free();
      }*/


      {
         Extent renderArea { };

         renderArea.Copy(overRenderArea);
         renderArea.Offset(offsetX, offsetY);
         overDirtyExtent.Union(renderArea, rootWindow.tempExtents[0]);
         renderArea.Empty();
      }


      if(backBufferUpdate != null)
      {
         // Remove render area from dirty area
         dirtyArea.Exclusion(renderArea, rootWindow.tempExtents[0]);

         dirtyArea.Exclusion(overRenderArea, rootWindow.tempExtents[0]);
      }
      else
         dirtyArea.Empty();

      clipExtent.Empty();
   /*
      // Remove the window render area from the dirty extents of the back buffer
      rootWindow.dirtyBack.Exclusion(renderArea);
   */
   }

   void Render(Extent updateExtent)
   {
      BoxItem extentBox;
      Window child;
      Window rootWindow = this.rootWindow;
      int offsetX = absPosition.x - rootWindow.absPosition.x, offsetY = absPosition.y - rootWindow.absPosition.y;
      if(rootWindow.nativeDecorations && rootWindow.windowHandle)
      {
         offsetX -= rootWindow.clientStart.x;
         offsetY -= rootWindow.clientStart.y - (rootWindow.hasMenuBar ? skinMenuHeight : 0);
      }

      if(rootWindow.fullRender)
      {
         UpdateExtent(box);
         dirtyArea.Empty();
      }
      else
      {
#ifdef _DEBUG
         /*
         background = Color { (byte)GetRandom(0,255), (byte)GetRandom(0,255), (byte)GetRandom(0,255) };
         foreground = (background.color.r > 128 || background.color.g > 128) ? black : white;
         */
#endif

#ifdef _DEBUG
         /*if(renderArea.count)
            printf("\n\nRendering %s (%x):\n------------------------------------------\n", _class.name, this);*/
#endif

         for(extentBox = (BoxItem)renderArea.first; extentBox; extentBox = (BoxItem)extentBox.next)
         {
            Box box = extentBox.box;

#ifdef _DEBUG
               /*printf("(%d, %d) - (%d, %d)\n",
                  extentBox.box.left, extentBox.box.top,
                  extentBox.box.right, extentBox.box.bottom);*/
#endif

            UpdateExtent(box);

            box.left += offsetX;
            box.top += offsetY;
            box.right += offsetX;
            box.bottom += offsetY;

            if(updateExtent != null)
               updateExtent.UnionBox(box, rootWindow.tempExtents[0]);
         }
      }

      for(child = children.first; child; child = child.next)
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow && !child.nonClient)
            child.Render(updateExtent);

      if(rootWindow.fullRender)
         DrawOverChildren(box);
      else
      {
         // TO DO: There's an issue about draw over children...
         // TO DO: Don't wanna go through this if method isn't used
         for(extentBox = (BoxItem)overRenderArea.first; extentBox; extentBox = (BoxItem)extentBox.next)
         //FASTLIST_LOOP(/*renderArea */overRenderArea, extentBox)
         {
            Box box = extentBox.box;

            DrawOverChildren(box);

            box.left += offsetX;
            box.top += offsetY;
            box.right += offsetX;
            box.bottom += offsetY;

            if(updateExtent != null)
               updateExtent.UnionBox(box, rootWindow.tempExtents[0]);
         }
      }
      for(child = children.first; child; child = child.next)
         if(!child.style.hidden && child.created && !child.is3D && child.rootWindow && child.nonClient)
            child.Render(updateExtent);

      renderArea.Empty();
      overRenderArea.Empty();
   }

   public void UpdateDisplay(void)
   {
      if(!manageDisplay) { OnRedraw(null);return; }
      if(rootWindow && this != rootWindow)
         rootWindow.UpdateDisplay();
      else if(display)
      {
         Extent dirtyExtent { /*first = -1, last = -1, free = -1*/ };  // Extent that needs to be forced due to transparency
         Extent overExtent { /*first = -1, last = -1, free = -1*/ };  // Extent that forced for DrawOverChildren
         BoxItem extentBox;

         dirtyExtent.Clear();
         overExtent.Clear();

         clipExtent.AddBox(box);

         display.Lock(true);
         display.StartUpdate();

         if(!rootWindow.fullRender)
         {
            ComputeClipExtents();
            ComputeRenderAreaNonOpaque(dirtyExtent, overExtent, null);
            ComputeRenderArea(dirtyExtent, overExtent, null);
         }
         else
            clipExtent.Free(null);

         dirtyExtent.Free(null);
         overExtent.Free(null);

         if(display.flags.flipping)
         {
            Render(null);
            display.Update(null);
         }
         else
         {
            Extent updateExtent { /*first = -1, last = -1, free = -1*/ }; // Extent that needs to be updated
            updateExtent.Clear();

            Render(updateExtent);
            if(fullRender)
               updateExtent.UnionBox(this.box, tempExtents[0]);

#ifdef _DEBUG
            //printf("\n\nUpdate:\n------------------------------------------\n");
#endif

            //FASTLIST_LOOP(updateExtent, extentBox)
            for(extentBox = (BoxItem)updateExtent.first; extentBox; extentBox = (BoxItem)extentBox.next)
            {
#ifdef _DEBUG
               /*printf("Updating (%d, %d) - (%d, %d)\n",
                  extentBox.box.left, extentBox.box.top,
                  extentBox.box.right, extentBox.box.bottom);*/
#endif

               display.Update(extentBox.box);

            }
            updateExtent.Free(null);
         }

         display.EndUpdate();
         display.Unlock();
         dirtyBack.Empty();

         dirty = false;
         resized = false;
      }
   }

   void UpdateBackDisplay(Box box)
   {
      if(display)
      {
         Extent dirtyExtent;
         Extent overExtent;
         Extent intersection { /*first = -1, last = -1, free = -1*/ };

         //printf("UpdateBackDisplay going through!\n");
         display.StartUpdate();

         if(resized)
         {
            intersection.Copy(dirtyBack);
            intersection.IntersectBox(box);

            dirtyExtent.Clear();
            overExtent.Clear();

            clipExtent.AddBox(box);

            if(!rootWindow.fullRender)
            {
               ComputeClipExtents();
               ComputeRenderArea(dirtyExtent, overExtent, intersection);
            }
            else
               clipExtent.Free(null);

            intersection.Free(null);
            dirtyExtent.Free(null);
            overExtent.Free(null);

            Render(null);
         }

         if(display.flags.flipping)
            display.Update(null);
         else
         {
            rootWindow.display.Update(box);
         }

         display.EndUpdate();

         if(resized)
         {
            dirtyBack.ExcludeBox(box, rootWindow.tempExtents[0]);
            if(dirtyBack.count > MAX_DIRTY_BACK)
            {
               BoxItem extentBox, next;
               BoxItem first = (BoxItem)ACCESS_ITEM(dirtyBack, dirtyBack.first);
               for(extentBox = (BoxItem)dirtyBack.first; extentBox; extentBox = next)
               {
                  next = (BoxItem)extentBox.next;
                  if(extentBox != first)
                  {
                     if(extentBox.box.left < first.box.left)
                        first.box.left = extentBox.box.left;
                     if(extentBox.box.top < first.box.top)
                        first.box.top = extentBox.box.top;
                     if(extentBox.box.right > first.box.right)
                        first.box.right = extentBox.box.right;
                     if(extentBox.box.bottom > first.box.bottom)
                        first.box.bottom = extentBox.box.bottom;
                     dirtyBack.Delete(extentBox);
                  }
               }
            }
            resized = false;
         }
      }
   }

   // --- Window positioning ---
   // --- Window identification ---

   // Returns window at position "Position"
   Window GetAtPosition(int x, int y, bool clickThru, bool acceptDisabled, Window last)
   {
      Window child, result = null;
      Box box = this.box;
      box.left += absPosition.x;
      box.right += absPosition.x;
      box.top += absPosition.y;
      box.bottom += absPosition.y;

      if(!destroyed && visible && (acceptDisabled || !disabled))
      {
         int lx = x - absPosition.x;
         int ly = y - absPosition.y;
         if(IsInside(lx, ly))
         // if(box.IsPointInside(Point{x, y}))
         {
            if(!clickThru || !style.clickThrough) result = (this == last) ? null : this;
            // If the window is disabled, stop looking in children (for acceptDisabled mode)
            if(!disabled)
            {
               bool isD = (last && last != this && last.IsDescendantOf(this)); //  Fix for WSMS (#844)
               Window ancestor = null;
               if(isD)
                  for(ancestor = last; ancestor && ancestor.parent != this; ancestor = ancestor.parent);
               for(child = (isD ? (last != ancestor ? ancestor : ancestor.previous) : children.last); child; child = child.prev)
               {
                  if(child != statusBar && child.rootWindow == rootWindow)
                  {
                     Window childResult = child.GetAtPosition(x, y, clickThru, acceptDisabled, last);
                     if(childResult)
                        return childResult;
                  }
               }
               if(clickThru)
               {
                  for(child = (isD ? (last != ancestor ? ancestor : ancestor.previous) : children.last); child; child = child.prev)
                  {
                     if(child != statusBar && child.rootWindow == rootWindow)
                     {
                        Window childResult = child.GetAtPosition(x, y, false, acceptDisabled, last);
                        if(childResult)
                           return childResult;
                     }
                  }
               }

               if(last && last != this && this.IsDescendantOf(last)) // Fix for installer lockup
                  result = null;
            }
         }
      }
      return result;
   }

   Window FindModal(void)
   {
      Window modalWindow = this, check;
      Window check2 = null;
      for(check = this; check.master; check = check.master)
      {
         if(check.master.modalSlave && check.master.modalSlave.created && check != check.master.modalSlave)
         {
            modalWindow = check.master.modalSlave;
            check = modalWindow;
         }
         // TESTING THIS FOR DROPBOX...
         if(!rootWindow || !rootWindow.style.interim)
         {
            for(check2 = check; check2 /*.activeChild*/; check2 = check2.activeChild)
            {
               if(check2.modalSlave && check2.modalSlave.created)
               {
                  modalWindow = check2.modalSlave;
                  break;
               }
            }
         }
      }

      /*
      if(modalWindow == this)
      {
         for(check = this; check.activeChild; check = check.activeChild)
         {
            if(check.modalSlave)
            {
               modalWindow = check.modalSlave;
               break;
            }
         }
      }
      */
      for(; modalWindow.modalSlave && modalWindow.modalSlave.created; modalWindow = modalWindow.modalSlave);
      return (modalWindow == this || this == guiApp.interimWindow || IsDescendantOf(modalWindow)) ? null : modalWindow;
   }

   void StopMoving(void)
   {
      if(this == guiApp.windowMoving)
      {
         guiApp.windowMoving = null;
         UpdateDecorations();
         SetMouseRange(null);
         if(rootWindow)
         {
            if(rootWindow.active)
               guiApp.interfaceDriver.StopMoving(rootWindow);
         }
         guiApp.windowCaptured.ReleaseCapture();
         guiApp.resizeX = guiApp.resizeY = guiApp.resizeEndX = guiApp.resizeEndY = false;
         guiApp.windowIsResizing = false;
      }
   }

   void SelectMouseCursor(void)
   {
      int x,y;
      Window mouseWindow;
      Window modalWindow;
      Window cursorWindow = null;
      bool rx, ry, rex, rey;

      guiApp.desktop.GetMousePosition(&x, &y);
      mouseWindow = rootWindow ? rootWindow.GetAtPosition(x,y, true, false, null) : null;

      if((guiApp.windowMoving && !guiApp.windowIsResizing) || guiApp.windowScrolling)
         guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[moving]);
      else if(mouseWindow)
      {
         modalWindow = mouseWindow.FindModal();
         x -= mouseWindow.absPosition.x;
         y -= mouseWindow.absPosition.y;
         if(guiApp.windowIsResizing)
         {
            rex = guiApp.resizeEndX;
            rey = guiApp.resizeEndY;
            rx = guiApp.resizeX;
            ry = guiApp.resizeY;
            if((rex && rey) || (rx && ry))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeNWSE]);
            else if((rex && ry) || (rx && rey))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeNESW]);
            else if((ry || rey) && (!rx && !rex))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeNS]);
            else if((rx || rex) && (!ry && !rey))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeWE]);
         }
         else if(!modalWindow && !guiApp.windowCaptured &&
            mouseWindow.IsMouseResizing(x, y, mouseWindow.size.w, mouseWindow.size.h,
               &rx, &ry, &rex, &rey))
         {
            if((rex && rey) || (rx && ry))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeNWSE]);
            else if((rex && ry) || (rx && rey))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeNESW]);
            else if((ry || rey) && (!rx && !rex))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeNS]);
            else if((rx || rex) && (!ry && !rey))
               guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[sizeWE]);
         }
         else if(!guiApp.windowCaptured && !modalWindow && !guiApp.interimWindow)
         {
            if(!mouseWindow.clientArea.IsPointInside({x - mouseWindow.clientStart.x, y - mouseWindow.clientStart.y}) &&
               mouseWindow.rootWindow != mouseWindow)
               cursorWindow = mouseWindow.parent;
            else
               cursorWindow = mouseWindow;
         }
         else if(!guiApp.interimWindow)
            cursorWindow = guiApp.windowCaptured;
         if(cursorWindow)
         {
            for(; !cursorWindow.cursor && !cursorWindow.style.nonClient && cursorWindow.rootWindow != cursorWindow; cursorWindow = cursorWindow.parent);
            guiApp.SetCurrentCursor(mouseWindow, cursorWindow.cursor ? cursorWindow.cursor : guiApp.systemCursors[arrow]);
         }
         else if(modalWindow)
         {
            guiApp.SetCurrentCursor(mouseWindow, guiApp.systemCursors[arrow]);
         }
         else if(guiApp.interimWindow)
         {
            if(guiApp.interimWindow.cursor)
               guiApp.SetCurrentCursor(mouseWindow, guiApp.interimWindow.cursor);
            else
               guiApp.SetCurrentCursor(mouseWindow, mouseWindow.cursor ? mouseWindow.cursor : guiApp.systemCursors[arrow]);
         }
      }
   }

   // --- State based input ---
   bool AcquireInputEx(bool state)
   {
      bool result;
      if(state)
      {
         guiApp.interfaceDriver.GetMousePosition(&guiApp.acquiredMouseX, &guiApp.acquiredMouseY);
         guiApp.interfaceDriver.SetMousePosition(clientSize.w/2 + absPosition.x, clientSize.h/2 + absPosition.y);
      }
      result = guiApp.interfaceDriver.AcquireInput(rootWindow, state);
      if(result)
         guiApp.acquiredWindow = state ? this : null;
      if(state && result)
      {
         SetMouseRangeToClient();
         guiApp.interfaceDriver.SetMouseCursor(guiApp.acquiredWindow, (SystemCursor)-1);
      }
      else
      {
         FreeMouseRange();
         SelectMouseCursor();
      }
      if(!state) guiApp.interfaceDriver.SetMousePosition(guiApp.acquiredMouseX, guiApp.acquiredMouseY);
      return result;
   }

   // --- Window activation ---
   bool PropagateActive(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      bool result = true;
      if(!parent || !parent.style.inactive)
      {
         Window parent = this.parent;

         /*
         if(rootWindow == this)
            Log(active ? "active\n" : "inactive\n");
         */
         if(active && requireRemaximize)
         {
            if(state == maximized)
            {
               property::state = normal;
               property::state = maximized;
            }
            requireRemaximize = false;
         }

         // Testing this here...
         if(!parent || parent == guiApp.desktop || parent.active)
         {
            this.active = active;
         }

         // TESTING THIS HERE
         UpdateDecorations();
         if((result = OnActivate(active, previous, goOnWithActivation, direct) && *goOnWithActivation && master))
            result = NotifyActivate(master, this, active, previous);
         else
         {
            this.active = !active;
         }

         if(result)
         {
            if(!parent || parent == guiApp.desktop || parent.active)
            {
               this.active = active;
               if(acquiredInput)
                  AcquireInputEx(active);
               if(active && isEnabled)
               {
                  if(caretSize)
                  {
                     if(guiApp.caretOwner)
                     {
                        Box extent
                        {
                           guiApp.caretOwner.caretPos.x - guiApp.caretOwner.scroll.x + 1,
                           guiApp.caretOwner.caretPos.y - guiApp.caretOwner.scroll.y + 1,
                           guiApp.caretOwner.caretPos.x - guiApp.caretOwner.scroll.x + 2,
                           guiApp.caretOwner.caretPos.y - guiApp.caretOwner.scroll.y + guiApp.caretOwner.caretSize - 1
                        };
                        guiApp.caretOwner.Update(extent);
                     }

                     if(visible || !guiApp.caretOwner)
                        guiApp.caretOwner = this;
                     UpdateCaret(false, false);
                  }
               }
            }
            else
            {
               this.active = false;
               if(acquiredInput)
                  AcquireInputEx(active);
            }
            if(!active && guiApp.caretOwner == this)
            {
               UpdateCaret(false, true);
               guiApp.caretOwner = null;
               guiApp.interfaceDriver.SetCaret(0,0,0);
               guiApp.caretEnabled = false;
            }

            if(!style.interim)
            {
               if(!active && parent && parent.activeChild && parent.activeChild != this)
                  if(!parent.activeChild.PropagateActive(false, previous, goOnWithActivation, true) || !*goOnWithActivation)
                  {
                     return false;
                  }
            }

            if(!active && menuBar)
            {
               bool goOn;
               menuBar.OnActivate(false, null, &goOn, true);
               menuBar.NotifyActivate(menuBar.master, menuBar, false, null);
            }

            if(activeChild)
            {
               Window aChild = activeChild;
               incref aChild;
               if(!aChild.PropagateActive(active, previous, goOnWithActivation, false) || !*goOnWithActivation)
               {
                  delete aChild;
                  return false;
               }
               delete aChild;
            }
         }
      }
      return result;
   }

   void ConsequentialMouseMove(bool kbMoving)
   {
      if(rootWindow && !noConsequential)
      {
         if(kbMoving || !guiApp.windowMoving)
         {
            Modifiers mods {};
            int x,y;
            if(rootWindow == guiApp.desktop || rootWindow.parent == guiApp.desktop)
            {
               if(guiApp.interfaceDriver)
                  guiApp.interfaceDriver.GetMousePosition(&x, &y);

               if(guiApp.windowMoving || rootWindow.GetAtPosition(x, y, true, false, null))
                  rootWindow.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove, x, y, &mods, true, false);
            }
         }
      }
   }

   bool IsDescendantOf(Window ancestor)
   {
      Window window;
      for(window = this; window && window != ancestor; window = window.parent);
      return window == ancestor;
   }

   bool IsSlaveOf(Window master)
   {
      Window window;
      for(window = this; window && window != master; window = window.master);
      return window == master;
   }

   bool ActivateEx(bool active, bool activateParent, bool moveInactive, bool activateRoot, Window external, Window externalSwap)
   {
      bool result = true;

      if(this && !destroyed /*&& state != Hidden*/)
      {
         Window swap = externalSwap;

         incref this;

         if(parent)
         {
            if(!active)
               StopMoving();
            if(activateParent &&
               (parent.activeChild != this ||
               (guiApp.interimWindow && !IsDescendantOf(guiApp.interimWindow))) &&
               active && _isModal &&
               parent != master && master)
               master.ActivateEx(true, true, false, activateRoot, external, externalSwap);

            if(active)
            {
               if(parent)
               {
                  bool real = parent.activeChild != this;

                  // TEST THIS: New activateParent check here!!! CAUSED MENUS NOT GOING AWAY
                  if(!style.inactive && /*activateParent && */guiApp.interimWindow &&
                     !IsDescendantOf(guiApp.interimWindow) &&
                     !IsSlaveOf(guiApp.interimWindow))
                  {
                     Window interimWindow = guiApp.interimWindow;
                     while(interimWindow && interimWindow != this)
                     {
                        Window master = interimWindow.master;
                        bool goOn = true;
                        guiApp.interimWindow = null;
                        if(guiApp.caretOwner)
                           guiApp.caretOwner.UpdateCaret(false, false);

                        incref interimWindow;
                        if(!interimWindow.PropagateActive(false, this, &goOn, true))
                        {
                           result = false;
                           real = false;
                        }
                        delete interimWindow;
                        interimWindow = (master && master.style.interim) ? master : null;
                     }
                  }
                  if(style.interim)
                  {
                     guiApp.interimWindow = this;
                     /*guiApp.interfaceDriver.SetCaret(0,0,0);
                     guiApp.caretEnabled = false;*/
                     UpdateCaret(false, true);
                  }

                  if(real)
                  {
                     //bool acquireInput = false;
                     bool maximize =
                        parent.activeChild &&
                        parent.activeChild.state == maximized &&
                        parent != guiApp.desktop;

                     if(!style.inactive) // (!style.isRemote || parent.active || parent.style.hidden))
                     {
                        if(!style.interim)
                        {
                           if(!swap && parent)
                              swap = parent.activeChild;
                           if(swap && swap.destroyed) swap = null;
                           if(swap && swap != this)
                           {
                              bool goOn = true;
                              if(!swap.PropagateActive(false, this, &goOn, true))
                                 swap = parent.activeChild;
                              if(!goOn)
                              {
                                 delete this;
                                 return false;
                              }
                           }
                           else
                              swap = null;
                        }

                        if(!parent || parent.activeChild != this || style.interim)
                        {
                           bool goOn = true;
                           result = PropagateActive(true, swap, &goOn, true);
                           if(!result && !goOn)
                           {
                              delete this;
                              return false;
                           }
                           //acquireInput = true;
                        }
                     }

                     if(style.hasMaximize && parent != guiApp.desktop)
                     {
                        if(maximize)
                           SetState(maximized, false, 0);
                        else if(state != maximized)
                        {
                           Window child;
                           for(child = parent.children.first; child; child = child.next)
                           {
                              if(this != child && child.state == maximized)
                                 child.SetState(normal, false, 0);
                           }
                        }
                     }
                  }
                  if(result)
                  {
                     if(!style.inactive && !style.interim /*&& (!style.isRemote || parent.active || parent.style.hidden)*/)
                     {
                        Window previous = parent.activeClient;
                        parent.activeChild = this;
                        if(!style.nonClient /*&& style.isActiveClient*/)
                        {
                           if(!style.hidden)
                           {
                              if(style.isActiveClient)
                                 parent.activeClient = this;
                              // Moved UpdateActiveDocument inside hidden check
                              // To prevent activating previous window while creating a new one
                              // (It was messing up the privateModule in the CodeEditor)
                              parent.UpdateActiveDocument(previous);
                           }
                        }
                     }
                  }

                  //if(!style.isRemote)
                  {
                     if(rootWindow != this)
                     {
                        if(activateParent && parent && !parent.active /*parent != parent.parent.activeChild*/)
                           parent.ActivateEx(true, true, moveInactive, activateRoot, external, externalSwap);
                     }
                     else
#if !defined(__EMSCRIPTEN__)
                     if(!guiApp.fullScreenMode)
#endif
                     {
                        Window modalRoot = FindModal();
                        if(!modalRoot) modalRoot = this;
                        if(!modalRoot.isForegroundWindow)
                        {
                           modalRoot.isForegroundWindow = true;
                           // To check : Why is parent null?
                           if(activateRoot && modalRoot.parent && !modalRoot.parent.display && external != modalRoot)
                           {
                              guiApp.interfaceDriver.ActivateRootWindow(modalRoot);
                           }
                           modalRoot.isForegroundWindow = false;
                        }
                     }
                  }

                  if(result && real && (!style.inactive || moveInactive) && parent)
                  {
                     Window last = parent.children.last;

                     if(!style.stayOnTop)
                        for(; last && last.style.stayOnTop; last = last.prev);

                     parent.children.Move(this, last);

                     // Definitely don't want that:   why not?
                     Update(null);

                     if(order)
                        parent.childrenOrder.Move(order, parent.childrenOrder.last);
                  }
               }
            }
            else
            {
               if(!parent || style.interim || (parent.activeChild == this && !style.inactive))
               {
                  bool goOn = true;
                  if(!style.interim)
                  {
                     if(parent)
                     {
                        parent.activeChild = null;
                        if(!style.nonClient /*&& style.isActiveClient*/)
                        {
                           Window previous = parent.activeClient;
                           if(style.isActiveClient)
                              parent.activeClient = null;
                           parent.UpdateActiveDocument(previous);
                        }
                     }
                  }
                  if(this == guiApp.interimWindow)
                  {
                     guiApp.interimWindow = null;
                     if(guiApp.caretOwner)
                        guiApp.caretOwner.UpdateCaret(false, false);
                  }
                  if(!PropagateActive(false, externalSwap, &goOn, true) || !goOn)
                  {
                     delete this;
                     return false;
                  }
               }
            }
            if(!active || !swap)
               UpdateDecorations();
            if(swap)
               swap.UpdateDecorations();

            if(active && rootWindow != this)
               ConsequentialMouseMove(false);
         }
         delete this;
      }
      return true;
   }

   // --- Input Messages ---
   void ::UpdateMouseMove(int mouseX, int mouseY, bool consequential)
   {
      static bool reEntrancy = false;
      if(reEntrancy) return;

      reEntrancy = true;

      guiApp.cursorUpdate = true;
      if(guiApp.windowScrolling && !consequential)
      {
         guiApp.windowScrolling.SetScrollPosition(
            (guiApp.windowScrolling.sbh) ?
               (guiApp.windowScrollingBefore.x - mouseX + guiApp.windowScrollingStart.x) : 0,
            (guiApp.windowScrolling.sbv) ?
               (guiApp.windowScrollingBefore.y - mouseY + guiApp.windowScrollingStart.y) : 0);
      }
      if(guiApp.windowMoving)
      {
         if(mouseX != guiApp.movingLast.x || mouseY != guiApp.movingLast.y)
         {
            Window window = guiApp.windowMoving;
            int rx, ry;
            int w = window.size.w;
            int h = window.size.h;
            int aw, ah;
            MinMaxValue ew, eh;
            int x, y;

            rx = mouseX - guiApp.windowMovingStart.x;
            ry = mouseY - guiApp.windowMovingStart.y;

            // Size
            window.GetDecorationsSize(&ew, &eh);

            if(guiApp.windowIsResizing)
            {
               x = window.scrolledPos.x;
               y = window.scrolledPos.y;

               if(guiApp.resizeX)
               {
                  aw = Max(guiApp.windowResizingBefore.w - rx,window.skinMinSize.w);
                  rx = guiApp.windowResizingBefore.w - aw;
                  rx = Min(guiApp.windowMovingBefore.x + rx, window.parent.clientSize.w-1) - guiApp.windowMovingBefore.x;
                  w = guiApp.windowResizingBefore.w - rx;
               }
               if(guiApp.resizeY)
               {
                  ah = Max(guiApp.windowResizingBefore.h - ry,window.skinMinSize.h);
                  ry = guiApp.windowResizingBefore.h - ah;
                  ry = Min(guiApp.windowMovingBefore.y + ry, window.parent.clientSize.h-1) - guiApp.windowMovingBefore.y;
                  ry = Max(ry, -guiApp.windowMovingBefore.y);
                  h = guiApp.windowResizingBefore.h - ry;
               }
               if(guiApp.resizeEndX)
               {
                  w = guiApp.windowResizingBefore.w + rx;
                  w = Max(w,1-x);
               }
               if(guiApp.resizeEndY) h = guiApp.windowResizingBefore.h + ry;

               w -= ew;
               h -= eh;

               w = Max(w, 1);
               h = Max(h, 1);

               w = Max(w, window.minSize.w);
               h = Max(h, window.minSize.h);
               w = Min(w, window.maxSize.w);
               h = Min(h, window.maxSize.h);

               if(!window.OnResizing(&w, &h))
               {
                  w = window.clientSize.w;
                  h = window.clientSize.h;
               }

               w = Max(w, window.skinMinSize.w);
               h = Max(h, window.skinMinSize.h);

               w += ew;
               h += eh;

               if(guiApp.textMode)
               {
                  SNAPDOWN(w, textCellW);
                  SNAPDOWN(h, textCellH);
               }

               if(guiApp.resizeX)
               {
                  aw = Max(w,window.skinMinSize.w);
                  rx = guiApp.windowResizingBefore.w - aw;
                  rx = Min(guiApp.windowMovingBefore.x + rx, window.parent.clientSize.w-1) - guiApp.windowMovingBefore.x;
                  w = guiApp.windowResizingBefore.w - rx;
               }
               if(guiApp.resizeY)
               {
                  ah = Max(h,window.skinMinSize.h);
                  ry = guiApp.windowResizingBefore.h - ah;
                  ry = Min(guiApp.windowMovingBefore.y + ry, window.parent.clientSize.h-1) - guiApp.windowMovingBefore.y;
                  ry = Max(ry, -guiApp.windowMovingBefore.y);
                  h = guiApp.windowResizingBefore.h - ry;
               }
            }

            // Position
            if(!guiApp.windowIsResizing || guiApp.resizeX)
               x = guiApp.windowMovingBefore.x + rx;
            if(!guiApp.windowIsResizing || guiApp.resizeY)
               y = guiApp.windowMovingBefore.y + ry;

            if(!guiApp.windowIsResizing)
            {
               // Limit
               if(window.parent == guiApp.desktop && guiApp.virtualScreen.w)
               {
                  x = Min(x, (guiApp.virtualScreen.w + guiApp.virtualScreenPos.x) -1);
                  y = Min(y, (guiApp.virtualScreen.h + guiApp.virtualScreenPos.y) -1);
                  x = Max(x,-(w-1) + guiApp.virtualScreenPos.x);
                  y = Max(y,-(h-1) + guiApp.virtualScreenPos.y);
               }
               else
               {
                  x = Min(x, (window.parent.reqScrollArea.w ? window.parent.reqScrollArea.w : window.parent.clientSize.w) -1);
                  y = Min(y, (window.parent.reqScrollArea.h ? window.parent.reqScrollArea.h : window.parent.clientSize.h) -1);
                  x = Max(x,-(w-1));
                  y = Max(y,-(h-1));
               }
            }

            if(!guiApp.windowIsResizing || (guiApp.resizeX || guiApp.resizeY))
            {
               if(!window.OnMoving(&x, &y, w, h))
               {
                  x = window.scrolledPos.x;
                  y = window.scrolledPos.y;
               }
            }

            if(guiApp.textMode)
            {
               SNAPDOWN(x, textCellW);
               SNAPDOWN(y, textCellH);
            }

            if(!window.style.nonClient)
            {
               if(!window.style.fixed /*|| window.style.isDocument*/)
               {
                  if(!window.style.dontScrollHorz)
                     x += window.parent.scroll.x;
                  if(!window.style.dontScrollVert)
                     y += window.parent.scroll.y;
               }
            }

            // Break the anchors for moveable/resizable windows
            // Will probably cause problem with IDE windows... Will probably need a way to specify if anchors should break
            if(window.style.fixed)
            {
               if(window.state == normal)
               {
                  window.normalAnchor = Anchor { left = x, top = y };
                  window.normalSizeAnchor = SizeAnchor { { w, h } };
                  window.anchored = false;
               }
            }

            window.stateAnchor = Anchor { left = x, top = y };
            window.stateSizeAnchor = SizeAnchor { { w, h } };

            window.Position(x, y, w, h, false, true, guiApp.windowIsResizing, guiApp.windowIsResizing, false, true);
            // TOCHECK: Investigate why the following only redraws the scrollbars
            //window.Position(x, y, w, h, false, true, true, true, false, true);

            guiApp.movingLast.x = mouseX;
            guiApp.movingLast.y = mouseY;
         }
      }
      reEntrancy = false;
   }

   public bool MultiTouchMessage(TouchPointerEvent event, Array<TouchPointerInfo> infos, Modifiers * mods, bool consequential, bool activate)
   {
      bool result = true;
      if((infos && infos.count) || (event == up || event == pointerUp))
      {
         Window w = null;
         while(result && w != this)
         {
            // TODO: How to handle this?
            int x = (infos && infos.count) ? infos[0].point.x : 0;
            int y = (infos && infos.count) ? infos[0].point.y : 0;
            Window msgWindow = GetAtPosition(x,y, false, true, w);
            Window window;
            delete w;
            w = msgWindow;
            if(w) incref w;
            window = (w && !w.disabled) ? w : null;

            if(guiApp.windowCaptured && (guiApp.windowCaptured.rootWindow == this))
            {
               if(!guiApp.windowCaptured.isEnabled)
                  guiApp.windowCaptured.ReleaseCapture();
               else
                  window = guiApp.windowCaptured;
            }

            if(consequential) mods->isSideEffect = true;
            if(!result || (window && window.destroyed)) window = null;

            if(window)
            {
               if(window.OnMultiTouch && !window.disabled)
               {
                  Array<TouchPointerInfo> in = null;
                  if(infos && infos.count)
                  {
                     in = { size = infos.size };
                     memcpy(in.array, infos.array, sizeof(TouchPointerInfo) * infos.size);

                     for(i : in)
                     {
                        i.point.x -= (window.absPosition.x + window.clientStart.x);
                        i.point.y -= (window.absPosition.y + window.clientStart.y);

                        i.point.x = Max(Min(i.point.x, 32767),-32768);
                        i.point.y = Max(Min(i.point.y, 32767),-32768);
                     }
                  }

                  incref window;
                  if(!window.OnMultiTouch(event, in, *mods))
                     result = false;

                  delete in;
                  delete window;
               }
            }
            if(!result || !w || !w.clickThrough)
               break;
         }
         delete w;
      }
      return result;
   }

   public bool MouseMessage(uint method, int x, int y, Modifiers * mods, bool consequential, bool activate)
   {
      bool result = true;
      bool wasMoving = guiApp.windowMoving ? true : false;
      bool wasScrolling = guiApp.windowScrolling ? true : false;
      //bool firstPass = true;
      Window w = null;
      while(result && w != this)
      {
         Window msgWindow = GetAtPosition(x,y, false, true, w);
         Window trueWindow = GetAtPosition(x,y, false, false, w);
         bool windowDragged = false;
         Window window;
         delete w;
         w = msgWindow;
         if(w) incref w;
         window = (w && !w.disabled) ? w : null;

         if(trueWindow) incref trueWindow;

         if(consequential) mods->isSideEffect = true;

         UpdateMouseMove(x, y, consequential);

         if(guiApp.windowCaptured && (guiApp.windowCaptured.rootWindow == this))
         {
            if(!guiApp.windowCaptured.isEnabled)
               guiApp.windowCaptured.ReleaseCapture();
            else
               window = guiApp.windowCaptured;
         }

         if(trueWindow && activate &&
            (method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick))
         {
            if(mods->alt && !mods->ctrl && !mods->shift)
            {
               Window moved = trueWindow;
               for(moved = trueWindow; moved; moved = moved.parent)
                  if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown || ((moved.style.fixed || moved.moveable) && moved.state != maximized))
                     break;
               if(moved)
               {
                  window = moved;
                  windowDragged = true;

                  // Cancel the ALT menu toggling...
                  window.rootWindow.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, 0, 0);
               }
            }
         }

         if(window && activate &&
            (method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick))
         {
            Window modalWindow = window.FindModal();

            /*if(mods->alt && !mods->shift && !mods->ctrl)
            {
               Window moved = window;
               for(moved = window; moved; moved = moved.parent)
                  if(method == OnRightButtonDown || ((moved.style.fixed || moved.moveable) && moved.state != maximized))
                     break;
               if(moved)
               {
                  window = moved;
                  windowDragged = true;

                  // Cancel the ALT menu toggling...
                  window.rootWindow.KeyMessage(OnKeyDown, 0, 0);
               }
            }*/

            if(!windowDragged)
            {
               Window activateWindow = modalWindow ? modalWindow : window;
               if(activateWindow && !activateWindow.isRemote)
               {
                  bool doActivation = true;
                  //bool needToDoActivation = false;
                  Window check = activateWindow;

                  for(check = activateWindow; check && check != guiApp.desktop; check = check.parent)
                  {
                     if(!check.style.inactive)
                     {
                        //needToDoActivation = true;
                        if(check.active)
                           doActivation = false;
                        break;
                     }
                  }
                  /*
                  if(!needToDoActivation)
                     doActivation = false;
                  */

                  if((doActivation && (activateWindow.parent != guiApp.desktop || guiApp.fullScreen)) ||
                     (guiApp.interimWindow && !window.IsDescendantOf(guiApp.interimWindow)))
                  {
                     // Let the OnLeftButtonDown do the activating instead
                     if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick)
                     {
                        window = null;
                        result = true;
                     }
                     else
                     //if(activate)
                     {
                        incref activateWindow;
                        if(!activateWindow.ActivateEx(true, true, false, true, null, null))
                        {
                           delete activateWindow;
                           delete trueWindow;
                           return false;
                        }
                        if(activateWindow._refCount == 1)
                        {
                           delete activateWindow;
                           delete trueWindow;
                           return false;
                        }
                        delete activateWindow;
                        // Trouble with clickThrough, siblings and activation (Fix for nicktick scrolling, siblings/activation endless loops, #844)
                        activate = false;
                     }
                     mods->isActivate = true;
                  }
               }
            }
            if(!modalWindow && window && !window.destroyed)
            {
               if(!guiApp.windowCaptured || windowDragged)
               {
                  if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown)
                  {
                     bool moving = ((window.state != maximized &&
                           window.IsMouseMoving(
                        x - window.absPosition.x, y - window.absPosition.y, window.size.w, window.size.h)))
                        || (guiApp.windowMoving && !guiApp.windowIsResizing);

                     if(!moving && window.IsMouseResizing(
                        x - window.absPosition.x,
                        y - window.absPosition.y,
                        window.size.w, window.size.h,
                        &guiApp.resizeX, &guiApp.resizeY, &guiApp.resizeEndX, &guiApp.resizeEndY))
                     {
                        guiApp.windowIsResizing = true;
                        guiApp.windowResizingBefore.w = window.size.w;
                        guiApp.windowResizingBefore.h = window.size.h;
                     }
                     if(guiApp.windowIsResizing || windowDragged || moving)
                     {
                        window.Capture();
                        guiApp.windowMoving = window;
                        guiApp.windowMovingStart.x = guiApp.movingLast.x = x;
                        guiApp.windowMovingStart.y = guiApp.movingLast.y = y;
                        guiApp.windowMovingBefore.x = window.position.x;//s;
                        guiApp.windowMovingBefore.y = window.position.y;//s;
                        if(guiApp.windowMoving == guiApp.windowMoving.rootWindow)
                           guiApp.interfaceDriver.StartMoving(guiApp.windowMoving.rootWindow, 0,0,false);
                     }
                  }
                  else if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown)
                  {
                     if(window.style.fixed &&
                        (windowDragged ||
                        window.IsMouseMoving(
                           x - window.absPosition.x, y - window.absPosition.y, window.size.w, window.size.h)))
                     {
                        window.ShowSysMenu(x, y);
                        result = false;
                     }
                  }
                  else if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown)
                  {
                     if(window.sbv || window.sbh)
                     {
                        window.Capture();
                        guiApp.windowScrolling = window;
                        guiApp.windowScrollingStart.x = x;
                        guiApp.windowScrollingStart.y = y;
                        guiApp.windowScrollingBefore.x = window.scroll.x;
                        guiApp.windowScrollingBefore.y = window.scroll.y;
                     }
                  }
                  else if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick)
                  {
                     if(window.style.hasMaximize &&
                        window.IsMouseMoving(
                           x - window.absPosition.x, y - window.absPosition.y, window.size.w, window.size.h))
                     {
                        window.SetState(
                           (window.state == maximized) ? normal : maximized, false, *mods);
                        result = false;
                     }
                  }
               }
            }
            else
               window = null;
            if(guiApp.windowMoving)
            {
               if(guiApp.windowMoving.parent)
               {
                  if(guiApp.windowMoving.style.nonClient)
                     guiApp.windowMoving.parent.SetMouseRangeToWindow();
                  else
                     guiApp.windowMoving.parent.SetMouseRangeToClient();
               }
               else
                  FreeMouseRange();
               window.UpdateDecorations();
            }
         }
         else if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp)
         {
            // Log("\n*** LEFT BUTTON UP ***\n");
            if(guiApp.windowMoving)
               guiApp.windowMoving.StopMoving();
         }
         else if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp)
         {
            if(guiApp.windowScrolling)
            {
               Window windowScrolling = guiApp.windowScrolling;
               guiApp.windowScrolling = null;
               windowScrolling.ReleaseCapture();
            }
         }

         if(!result || (window && window.destroyed)) window = null;

         if(window && window.FindModal())
            window = null;

         if(trueWindow && trueWindow.FindModal())
            delete trueWindow;

         /*if(trueWindow)
            incref trueWindow;
         */

         /*
         msgWindow = GetAtPosition(x,y, true, false);
         if(msgWindow)
            msgWindow.SelectMouseCursor();
         */

         if((!trueWindow || !trueWindow.clickThrough) /*firstPass*/ && (guiApp.windowCaptured || trueWindow))
         {
            Window prevWindow = guiApp.prevWindow;
            List<Window> overWindows = guiApp.overWindows;
            Iterator<Window> it { overWindows };

            while(it.Next())
            {
               Window ww = it.data;
               if(trueWindow != ww && !trueWindow.IsDescendantOf(ww))
               {
                  it.pointer = null;
                  result = ww.OnMouseLeave(*mods);
                  if(!result) break;
                  overWindows.TakeOut(ww);
               }
            }

            if(result && guiApp.prevWindow && trueWindow != guiApp.prevWindow)
            {
               guiApp.prevWindow.mouseInside = false;
               guiApp.prevWindow = null;

               if(result)
               {
                  if(trueWindow.IsDescendantOf(prevWindow))
                  {
                     if(!overWindows.Find(prevWindow))
                        overWindows.Add(prevWindow);
                  }
                  // Eventually fix this not to include captured?
                  else if(!prevWindow.OnMouseLeave(*mods))
                     result = false;
               }
            }
            if(result && trueWindow && !trueWindow.destroyed/* && trueWindow == window*/)
            {
               Box box = trueWindow.box;
               box.left += trueWindow.absPosition.x;
               box.right += trueWindow.absPosition.x;
               box.top += trueWindow.absPosition.y;
               box.bottom += trueWindow.absPosition.y;

               if(box.IsPointInside({x, y}) && trueWindow != /*guiApp.*/prevWindow /*!trueWindow.mouseInside*/)
               {
                  int overX = x - (trueWindow.absPosition.x + trueWindow.clientStart.x);
                  int overY = y - (trueWindow.absPosition.y + trueWindow.clientStart.y);

                  overX = Max(Min(overX, 32767),-32768);
                  overY = Max(Min(overY, 32767),-32768);

                  trueWindow.mouseInside = true;
                  if(!trueWindow.OnMouseOver(overX, overY, *mods))
                     result = false;
               }
            }

            if(trueWindow && trueWindow._refCount > 1 && !trueWindow.destroyed)
            {
               for(wi : guiApp.overWindows; wi == trueWindow)
               {
                  wi.OnMouseLeave(0);
                  guiApp.overWindows.TakeOut(wi);
                  break;
               }
               guiApp.prevWindow = trueWindow;
            }
            else
               guiApp.prevWindow = null;
         }
         SelectMouseCursor();

         if(window && ((!guiApp.windowMoving && !wasMoving) ||
            (wasMoving && guiApp.windowMoving && method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp)) && !wasScrolling)
         {
            int clientX = x - (window.absPosition.x + window.clientStart.x);
            int clientY = y - (window.absPosition.y + window.clientStart.y);

            bool (* MouseMethod)(Window instance, int x, int y, Modifiers mods);

            clientX = Max(Min(clientX, 32767),-32768);
            clientY = Max(Min(clientY, 32767),-32768);

            MouseMethod = (void *)window._vTbl[method];

            if(MouseMethod /*&& !consequential*/ && !window.disabled)
            {
               incref window;
               if(!MouseMethod(window, clientX, clientY, *mods))
                  result = false;

#ifdef __ANDROID__
               if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp)
                  window.OnMouseLeave(*mods);
#endif
               delete window;
            }
         }
         delete trueWindow;
         /*
         if(result && w && w.clickThrough && w.parent)
            w = w.parent;
         else
            break;
         */
         if(!result || !w || !w.clickThrough)
            break;
         //firstPass = false;
      }
      delete w;
      return result;
   }

   // --- Mouse cursor management ---

   bool KeyMessage(uint method, Key key, unichar character)
   {
      bool status = true;
      if(!parent)
      {
         if(guiApp.interimWindow)
            this = guiApp.interimWindow;
      }
#ifdef _DEBUG
      if((SmartKey)key != alt && (SmartKey)key != Key::control && method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown && parent && this != parent.menuBar)
         Print("");
#endif

      if(!style.inactive || rootWindow != this)
      {
         bool (*KeyMethod)(Window window, Key key, unichar ch) = (void *)_vTbl[method];
         Window modalWindow = FindModal();
         Window interimMaster = master ? master.rootWindow : null;

         incref this;

         if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
            status = OnSysKeyDown(key, character);
         if(status &&
            (method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown ||
             method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit))
            status = OnSysKeyHit(key, character);
         else if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp)
            status = OnSysKeyUp(key, character);
         if(!status)
         {
            delete this;
            return true;
         }

         // Process Key Message for Internal UI Keyboard actions
         if(status && !destroyed && menuBar && state != minimized)
         {
            // Disable the ALT
            if((SmartKey)key != alt)
               menuBar.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown, 0, 0);
            if(menuBar.focus)
            {
               SmartKey sk = (SmartKey) key;
               if((character && !key.alt && !key.ctrl) || sk == left || sk == right || sk == up || sk == down || sk == home || sk == end || sk == escape || sk == alt)
               {
                  status = menuBar.KeyMessage(method, key, character);
                  status = false;
               }
               else
               {
                  if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
                     menuBar.OnKeyHit(escape, 0);
               }
               if(!menuBar.focus && guiApp.caretOwner)
                  guiApp.caretOwner.UpdateCaret(true, false);
            }
         }
         if(!destroyed && status)
         {
            if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit || method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
            {
               switch(key)
               {
                  case left: case up: case right: case down:
                     if(guiApp.windowMoving == this)
                     {
                        int step = 1; //8;
                        int w = guiApp.windowMoving.size.w;
                        int h = guiApp.windowMoving.size.h;
                        int x = guiApp.windowMoving.scrolledPos.x;
                        int y = guiApp.windowMoving.scrolledPos.y;

                        if(guiApp.textMode)
                        {
                           if(key == down || key == up)
                              step = Max(step, textCellH);
                           else
                              step = Max(step, textCellW);
                        }

                        if(guiApp.windowIsResizing)
                        {
                           switch(key)
                           {
                              case left: w-=step; break;
                              case right: w+=step; break;
                              case up: h-=step;   break;
                              case down: h+=step; break;
                           }
                        }
                        else
                        {
                           switch(key)
                           {
                              case left: x-=step; break;
                              case right: x+=step; break;
                              case up: y-=step;   break;
                              case down: y+=step; break;
                           }
                        }

                        if(guiApp.resizeX) x += w - guiApp.windowMoving.size.w;
                        if(guiApp.resizeY) y += h - guiApp.windowMoving.size.h;

                        if(!guiApp.windowIsResizing || guiApp.resizeX)
                           x = (x - guiApp.windowMovingBefore.x) + guiApp.windowMovingStart.x;
                        else
                           x = (w - guiApp.windowResizingBefore.w) + guiApp.windowMovingStart.x;

                        if(!guiApp.windowIsResizing || guiApp.resizeY)
                           y = (y - guiApp.windowMovingBefore.y) + guiApp.windowMovingStart.y;
                        else
                           y = (h - guiApp.windowResizingBefore.h) + guiApp.windowMovingStart.y;

                        guiApp.interfaceDriver.SetMousePosition(x, y);
                        ConsequentialMouseMove(true);

                        status = false;
                     }
                     break;
                  case escape:
                  case enter:
                  case keyPadEnter:
                     if(guiApp.windowMoving && method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
                     {
                        guiApp.windowMoving.StopMoving();
                        ConsequentialMouseMove(false);

                        status = false;
                     }
                     break;
                  case altSpace:
                     if(style.fixed)
                     {
                        ShowSysMenu(absPosition.x, absPosition.y);
                        status = false;
                     }
                     break;
               }
            }
         }

         if(!destroyed && status && state != minimized)
         {
            // Process all the way down the children
            if(activeChild && !activeChild.disabled)
            {
               status = activeChild.KeyMessage(method, key, character);
            }
            if(status && activeClient && activeChild != activeClient && !activeClient.disabled && (key.alt || key.ctrl) &&
               key.code != left && key.code != right && key.code != up && key.code != down)
            {
               status = activeClient.KeyMessage(method, key, character);
            }

            // Default Control
            if(!destroyed && status && method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
            {
               if((SmartKey)key == enter && !key.alt && !key.ctrl && defaultControl && !defaultControl.disabled && state != minimized)
                  // && defaultControl != activeChild)
               {
                  delete previousActive;
                  previousActive = activeChild;
                  if(previousActive) incref previousActive;

                  ConsequentialMouseMove(false);
                  if((defaultControl.active ||
                     defaultControl.ActivateEx(true, true, false, true, null, null)) && !defaultControl.disabled)
                     defaultControl.KeyMessage(method, defaultKey, character);
                  status = false;
               }
            }
         }

         if(!destroyed && status && (!modalWindow || this == guiApp.desktop))
         {
            if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
            {
               switch(key)
               {
                  case altMinus:
                     if(style.fixed)
                     {
                        ShowSysMenu(absPosition.x, absPosition.y);
                        status = false;
                     }
                     break;
                  //case f5:
                  /*
                  case shiftF5:
                     if(this != guiApp.desktop)
                     {
                        if(!guiApp.windowMoving && !guiApp.windowCaptured)
                        {
                           if(state != maximized && (key.shift ? style.sizeable : style.fixed))
                           {
                              MenuMoveOrSize(key.shift, true);
                              status = false;
                           }
                        }
                        else if(guiApp.windowMoving)
                        {
                           guiApp.windowMoving.StopMoving();
                           ConsequentialMouseMove(false);
                           status = false;
                        }
                     }
                     break;
                  */
               }
            }
            if(!destroyed && status && state != minimized)
            {
               if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit || method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
               {
                  switch(key)
                  {
                     case tab: case shiftTab:
                     {
                        Window cycleParent = this;
                        if(this == guiApp.interimWindow && master && !master.style.interim && !cycleParent.style.tabCycle && master.parent)
                           cycleParent = master.parent;

                        if(!guiApp.windowCaptured && cycleParent.style.tabCycle)
                        {
                           if(cycleParent.CycleChildren(!key.shift, false, false, true))
                           {
                              /*
                              Window child = cycleParent.activeChild;

                              // Scroll the window to include the active control
                              if(cycleParent.sbh && !child.style.dontScrollHorz)
                              {
                                 if(child.scrolledPos.x < 0)
                                    cycleParent.sbh.Action(Position,
                                       cycleParent.scroll.x + child.scrolledPos.x, 0);
                                 else if(child.scrolledPos.x + child.size.w > cycleParent.clientSize.w)
                                    cycleParent.sbh.Action(Position,
                                       cycleParent.scroll.x + child.scrolledPos.x + child.size.w - cycleParent.clientSize.w, 0);
                              }
                              if(cycleParent.sbv && !child.style.dontScrollVert)
                              {
                                 if(child.scrolledPos.y < 0)
                                    cycleParent.sbv.Action(Position,
                                       cycleParent.scroll.y + child.scrolledPos.y, 0);
                                 else if(child.scrolledPos.y + child.size.w > window.clientSize.h)
                                    cycleParent.sbv.Action(Position,
                                       cycleParent.scroll.y + child.scrolledPos.y+child.size.h - cycleParent.clientSize.h, 0);
                              }
                              */
                              cycleParent.ConsequentialMouseMove(false);
                              status = false;
                           }
                        }
                        break;
                     }
                     case f6: case shiftF6:
                        if(!guiApp.windowMoving /*!guiApp.windowCaptured*/)
                        {
                           // NOT NEEDED... guiApp.windowMoving.ReleaseCapture();
                           if(parent == guiApp.desktop)
                              if(guiApp.desktop.CycleChildren(key.shift, true, false, true))
                              {
                                 status = false;
                                 break;
                              }
                           if(style.tabCycle)
                           {
                              delete this;
                              return true;
                           }
                           if(CycleChildren(key.shift, true, false, true))
                           {
                              status = false;
                              break;
                           }
                        }
                        break;
                     /*
                     // mIRC Style Window Shortcuts
                     case alt1: case alt2: case alt3: case alt4: case alt5:
                     case alt6: case alt7: case alt8: case alt9: case alt0:
                     {
                        if(numPositions)
                        {
                           Window document;
                           for(document = children.first; document; document = document.next)
                           {
                              if(document.style.isDocument && document.documentID - 1 == key.code - k1)
                              {
                                 if(document == activeChild)
                                 {
                                    if(document.state == minimized)
                                       document.SetState(normal, false, key);
                                    else
                                    {
                                       document.SetState(minimized, false, key);
                                       CycleChildren(false, true, false);
                                    }
                                 }
                                 else
                                 {
                                    if(activeChild.state == maximized && document.style.hasMaximize)
                                       document.SetState(maximized, false, key);
                                    else if(document.state == minimized)
                                       document.SetState(normal, false, key);
                                    document.Activate();
                                 }
                                 status = false;
                                 break;
                              }
                           }
                        }
                        break;
                     }
                     */
                  }
               }
            }
         }

         if(!destroyed && status)
         {
            if(state == minimized)
            {
               delete this;
               return true;
            }
            if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp)
            {
               if((SmartKey)key == enter && !key.alt && !key.ctrl && defaultControl && previousActive)
               {
                  if(defaultControl.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, key, character))
                     previousActive.ActivateEx(true, false, false, true, null, null);
                  delete previousActive;
                  status = false;
               }
            }
         }

         if(!destroyed && status)
         {
            status = ProcessHotKeys(method, key, character);
         }
         if(!destroyed && status && !modalWindow && state != minimized)
         {
            if(KeyMethod)
               status = KeyMethod(this, key, character);
            if(!destroyed && status && method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown)
               status = OnKeyHit(key, character);
            if(!destroyed && status && (method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown || method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit))
            {
               bool result = false;
               switch(key)
               {
                  case ctrlUp: case ctrlDown:
                     if(sbv && !guiApp.windowScrolling)
                        result = sbv.Action((key == ctrlUp) ? up : down, 0, key);
                     break;
                  case ctrlPageUp: case ctrlPageDown:
                     if(sbh && !guiApp.windowScrolling)
                        result = sbh.Action((key == ctrlPageUp) ? up : down, 0, key);
                     break;
                  default:
                     switch(key.code)
                     {
                        case wheelUp: case wheelDown:
                           if(!key.shift && sbv && !guiApp.windowScrolling)
                           {
                              result = sbv.Action((key == wheelUp) ? wheelUp : wheelDown, 0, key);
                              // Do we want to do a consequential move regardless of result in this case?
                              ConsequentialMouseMove(false);
                           }
                           else if(key.shift && sbh && !guiApp.windowScrolling)
                           {
                              result = sbh.Action((key.code == wheelUp) ? wheelUp : wheelDown, 0, key);
                              // Do we want to do a consequential move regardless of result in this case?
                              ConsequentialMouseMove(false);
                           }
                           break;
                     }
                     break;
               }
               if(result)
               {
                  ConsequentialMouseMove(false);
                  status = false;
               }
            }
         }
         if(status && !destroyed && menuBar && state != minimized)
            status = menuBar.KeyMessage(method, key, character);

         if(style.interim && /*destroyed && */status && interimMaster)
         {
            // Testing this... for Ctrl-O to open dialog when autocompletion listbox is popped...
            status = interimMaster.KeyMessage(method, key, character);
         }
         delete this;
      }
      return status;
   }

   bool ProcessHotKeys(uint method, Key key, unichar character)
   {
      bool status = true;
      HotKeySlot hotKey;

      for(hotKey = hotKeys.first; hotKey; hotKey = hotKey.next)
         if((hotKey.key == key || (method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp && hotKey.key.code == key.code)) &&
            !hotKey.window.disabled && (hotKey.window.style.nonClient || state != minimized))
         {
            Window hotKeyWindow = hotKey.window;
            Window parent = hotKeyWindow.parent;
            Window prevActiveWindow = activeChild;
            // For when sys buttons are placed inside the menu bar
            if(parent && parent._class == class(PopupMenu))
               parent = parent.parent;

            // Don't process non-visible buttons, but make an exception for the Alt-F4 with Native Decorations turned on; This handles alt+enter as well
            if(hotKeyWindow.style.hidden && (!hotKeyWindow.style.nonClient || !parent || !parent.nativeDecorations || (hotKeyWindow != parent.sysButtons[2] && hotKeyWindow != parent.sysButtons[1])))
               continue;

            if(prevActiveWindow) incref prevActiveWindow;
            incref hotKeyWindow;
            if(method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown && !hotKeyWindow.style.nonClient && !hotKeyWindow.inactive)
               if(!hotKeyWindow.ActivateEx(true, true, false, true, null, null))
               {
                  status = false;
                  delete hotKeyWindow;
                  delete prevActiveWindow;
                  break;
               }

            if(hotKeyWindow.style.nonClient && method == __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit)
               method = __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown;
            if(!hotKeyWindow.KeyMessage(method, Key::hotKey, character))
            {
               // *********   WORKING ON THIS   ***********
               if(prevActiveWindow && !guiApp.interimWindow)
                  prevActiveWindow.ActivateEx(true, false, false, false, null, null);
               status = false;
            }
            else if(hotKeyWindow.style.inactive)
               status = hotKeyWindow.KeyMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp, Key::hotKey, character);

            delete prevActiveWindow;
            delete hotKeyWindow;
            // For Key Ups, don't set status to false... (e.g.: Releasing Enter vs AltEnter hot key)
            if(method != __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp)
               status = false;
            break;
         }
      if(status && tabCycle)
      {
         Window child;
         for(child = children.first; child; child = child.next)
         {
            if(child.tabCycle && !child.ProcessHotKeys(method, key, character))
            {
               status = false;
               break;
            }
         }
      }
      return status;
   }


   // --- Windows and graphics initialization / termination ---
   bool SetupRoot(void)
   {
      Window child;

      // Setup relationship with outside world (bb root || !bb)
#if defined(__EMSCRIPTEN__)
      if(this == guiApp.desktop)
#else
      if((!guiApp.fullScreenMode && parent == guiApp.desktop) || this == guiApp.desktop ||
         (_displayDriver && parent.dispDriver && dispDriver != parent.dispDriver))
#endif
      {
         rootWindow = this;
         if(!tempExtents)
            tempExtents = new0 Extent[4];
         against = null;
      }
      else
      {
         /*if(guiApp.fullScreenMode)
            rootWindow = guiApp.desktop;
         else*/
         //rootWindow = parent.created ? parent.rootWindow : null;
         rootWindow = parent.rootWindow;

         if(style.nonClient)
            against = &parent.box;
         else
            against = &parent.clientArea;
      }

      for(child = children.first; child; child = child.next)
         child.SetupRoot();

      return (rootWindow && (rootWindow == this || rootWindow.created)) ? true : false;
   }

   bool Setup(bool positionChildren)
   {
      bool result = false;
      Window child;

#if defined(__EMSCRIPTEN__)
      if(this == guiApp.desktop)
#else
      if((!guiApp.fullScreenMode && parent == guiApp.desktop) || (guiApp.fullScreenMode && (this == guiApp.desktop || (_displayDriver && parent.dispDriver && dispDriver != parent.dispDriver))))
#endif
      {
         subclass(DisplayDriver) dDriver = (dispDriver && !formDesigner) ? dispDriver : GetDisplayDriver(guiApp.defaultDisplayDriver);
         DisplaySystem displaySystem = dDriver ? dDriver.displaySystem : null;

         if(!windowHandle)
            windowHandle = dDriver.printer ? null : guiApp.interfaceDriver.CreateRootWindow(this);

         // This was here, is it really needed?
         //guiApp.interfaceDriver.ActivateRootWindow(this);

         if(!displaySystem)
         {
            displaySystem = DisplaySystem { glCapabilities = glCapabilities };
            incref displaySystem;
            if(!displaySystem.Create(dDriver.name, guiApp.fullScreenMode ? windowHandle : windowHandle /*null*/, guiApp.fullScreenMode))
            {
               delete displaySystem;
            }
         }
         if(displaySystem)
         {
            display = Display { alphaBlend = alphaBlend, useSharedMemory = useSharedMemory, glCapabilities = glCapabilities, windowDriverData = windowData };
            incref display;
            if(display.Create(displaySystem, windowHandle))
               result = true;
            else
            {
#ifdef _DEBUG
               PrintLn("failed to create display!");
#endif
               delete display;
            }
         }
         // Sometimes icon does not show up on Windows XP if we set here...
         // guiApp.interfaceDriver.SetIcon(this, icon);
      }
      else if(this != guiApp.desktop)
      {
         display = rootWindow ? rootWindow.display : null;
         result = true;
      }
      else
         result = true;

      if(guiApp.acquiredWindow && rootWindow == guiApp.acquiredWindow.rootWindow)
         guiApp.interfaceDriver.AcquireInput(guiApp.acquiredWindow.rootWindow, true);

      for(child = children.first; child; child = child.next)
      {
         if(child.created && !child.Setup(false))
            result = false;

         if(guiApp.modeSwitching && guiApp.fullScreen && child.rootWindow == child)
            child.UpdateCaption();
      }
      return result;
   }

   bool SetupDisplay(void)
   {
#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
      if(is3D) return Window3D_SetupDisplay(this); else
#endif
      if(SetupRoot())
         return Setup(true);
      return false;
   }

   class_data void ** pureVTbl;

   bool LoadGraphics(bool creation, bool resetAnchors)
   {
      bool result = false;
      bool success = false;
      Window child;
      WindowState stateBackup = state;

      if(((subclass(Window))_class).pureVTbl)
      {
         if(_vTbl == _class._vTbl)
         {
            _vTbl = ((subclass(Window))_class).pureVTbl;
         }
         else
         {
            int m;
            for(m = 0; m < _class.vTblSize; m++)
            {
               if(_vTbl[m] == _class._vTbl[m])
                  _vTbl[m] = ((subclass(Window))_class).pureVTbl[m];
            }
         }
      }
      if(guiApp.currentSkin && ((subclass(Window))_class).pureVTbl)
      {
         if(_vTbl == ((subclass(Window))_class).pureVTbl)
         {
            _vTbl = _class._vTbl;
         }
         else
         {
            int m;
            for(m = 0; m < _class.vTblSize; m++)
            {
               if(_vTbl[m] == ((subclass(Window))_class).pureVTbl[m])
                  _vTbl[m] = _class._vTbl[m];
            }
         }
      }

      if(
#if !defined(__EMSCRIPTEN__)
      guiApp.fullScreenMode ||
#endif
         this != guiApp.desktop)
      {
         SetWindowMinimum(&skinMinSize.w, &skinMinSize.h);
         if(display)
         {
            ResPtr ptr;
            success = true;

            display.Lock(false);
            if(rootWindow == this)
            {
               // Set Color Palette
               display.SetPalette(palette, true);

               // Load Cursors
               /*
               if(guiApp.fullScreenMode && this == guiApp.desktop)
               {
                  int c;
                  Cursor cursor;

                  for(c=0; c<SystemCursor::enumSize; c++)
                     if(!guiApp.systemCursors[c].bitmap)
                     {
                        guiApp.systemCursors[c].bitmapName = guiApp.currentSkin.CursorsBitmaps(c,
                           &guiApp.systemCursors[c].hotSpotX,&guiApp.systemCursors[c].hotSpotY, &guiApp.systemCursors[c].paletteShades);
                        if(guiApp.systemCursors[c].bitmapName)
                        {
                           guiApp.systemCursors[c].bitmap = eBitmap_LoadT(guiApp.systemCursors[c].bitmapName, null,
                              guiApp.systemCursors[c].paletteShades ? null : guiApp.desktop.display.displaySystem);
                           if(guiApp.systemCursors[c].bitmap)
                              guiApp.systemCursors[c].bitmap.paletteShades = guiApp.systemCursors[c].paletteShades;
                           else
                              success = false;
                        }
                     }
                  for(cursor = guiApp.customCursors.first; cursor; cursor = cursor.next)
                  {
                     cursor.bitmap = eBitmap_LoadT(cursor.bitmapName, null,
                        cursor.paletteShades ? null : guiApp.desktop.display.displaySystem);
                     if(cursor.bitmap)
                        cursor.bitmap.paletteShades = cursor.paletteShades;
                     else
                        success = false;
                  }
                  guiApp.cursorUpdate = true;

                  display.Unlock();
                  ConsequentialMouseMove(false);
                  display.Lock(true);
               }
               */
            }

            // Load Window Graphic Resources

            /*
            if(usedFont == setFont || usedFont == window.systemFont)
               RemoveResource(usedFont);
            */
            if(setFont)
               RemoveResource(setFont); // TESTING setFont instead of usedFont);

            if(systemFont)
               RemoveResource(systemFont);

            if(captionFont)
               RemoveResource(captionFont);

            for(ptr = resources.first; ptr; ptr = ptr.next)
            {
               if(!ptr.loaded)   // This check prevents a leak in case a watcher on 'font' calls AddResource (ListBox FontResource leak)
                  ptr.loaded = display.displaySystem.LoadResource(ptr.resource);
            }
            if(setFont)
               AddResource(setFont);
            if(systemFont)
               AddResource(systemFont);

            usedFont = setFont ? setFont : ((parent && parent.parent) ? parent.usedFont : systemFont);

            firewatchers font;

            /*
            if(!setFont)
            {
               //if(master && master.font)
               if(parent && parent.font)
               {
                  font = FontResource
                  {
                     faceName = parent.font.faceName,
                     size = parent.font.size,
                     bold = parent.font.bold,
                     italic = parent.font.italic,
                     underline = parent.font.underline
                  };
                  //font = parent.font;
                  watch(parent) { font { } };
               }
               else
                  font = guiApp.currentSkin.SystemFont();
               AddResource(font);

               firewatchers font;
            }
            */

            captionFont = guiApp.currentSkin ? guiApp.currentSkin.CaptionFont() : null;
            AddResource(captionFont);

            if(OnLoadGraphics())
            {
               int x,y,w,h;

               display.Unlock();

               //SetScrollLineStep(sbStep.x, sbStep.y);

               if(this != guiApp.desktop)
               {
                  if(resetAnchors)
                  {
                     normalAnchor = anchor;
                     normalSizeAnchor = sizeAnchor;
                  }

                  // Break the anchors for moveable/resizable windows
                  /*
                  if(style.fixed && style.isDocument)
                  {
                     ComputeAnchors(ax, ay, aw, ah, &x, &y, &w, &h);
                     ax = x;
                     ay = y;
                     aw = w;
                     ah = h;
                     anchored = false;
                  }
                  */
                  switch(state)
                  {
                     case maximized:

                        stateAnchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 };
                        stateSizeAnchor = SizeAnchor {};
                        break;

                     case minimized:
                     {
                        int maxIcons = parent.clientSize.w / MINIMIZED_WIDTH;

                        stateAnchor =
                           Anchor
                           {
                              left = (iconID % maxIcons) * MINIMIZED_WIDTH,
                              bottom = (iconID / maxIcons) * (guiApp.textMode ? 16 : 24)
                           };

                        stateSizeAnchor = SizeAnchor { size.w = MINIMIZED_WIDTH };
                        break;
                     }
                     case normal:
                        stateAnchor = normalAnchor;
                        stateSizeAnchor = normalSizeAnchor;
                        break;
                  }
                  position = Point { };
                  ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);

               }
               else
               {
                  x = scrolledPos.x;
                  y = scrolledPos.y;
                  w = size.w;
                  h = size.h;
               }

               if(Position(x, y, w, h, true, false, true, true, true, true))
               {
                  if((this != guiApp.desktop || guiApp.fullScreenMode) && rootWindow == this)
                  {
                     if(!style.hidden)
                        guiApp.interfaceDriver.SetRootWindowState(this, normal, true);
                  }

                  Update(null);

                  result = true;
               }
            }
            else
            {
               result = false;
               display.Unlock();
            }
         }
      }
      else
      {
         success = result = true;
      }

      if(!creation && result)
      {
         // Load menu bar first because sys buttons are on it...
         if(menuBar)
         {
            if(!menuBar.LoadGraphics(false, resetAnchors))
            {
               result = false;
               success = false;
            }
         }
         for(child = children.first; child; child = child.next)
         {
            if(child.created && child != menuBar && !child.LoadGraphics(false, resetAnchors))
            {
               result = false;
               success = false;
            }
         }
         if(!creation)
            CreateSystemChildren();

         OnApplyGraphics();
      }
      if(this == guiApp.desktop && !guiApp.fullScreenMode)
      {
         if(activeChild)
            guiApp.interfaceDriver.ActivateRootWindow(activeChild);
      }
      if(!success)
         LogErrorCode(graphicsLoadingFailed, _class.name);

      // Do this here to avoid problems on Windows
      if(rootWindow == this && parent && stateBackup == maximized)
         property::state = maximized;
      return result;
   }

   void UnloadGraphics(bool destroyWindows)
   {
      Window child;

      // Free children's graphics
      for(child = children.first; child; child = child.next)
         child.UnloadGraphics(destroyWindows);

      if(display)
         display.Lock(false);

      // Free cursors
      if(guiApp.fullScreenMode && this == guiApp.desktop)
      {
         Cursor cursor;
         SystemCursor c;

         for(c=0; c<SystemCursor::enumSize; c++)
            if(guiApp.systemCursors[c].bitmap)
               delete guiApp.systemCursors[c].bitmap;

         for(cursor = guiApp.customCursors.first; cursor; cursor = cursor.next)
            delete cursor.bitmap;

         guiApp.cursorBackground.Free();
      }

      if(display && display.displaySystem)
      {
         ResPtr ptr;

         for(ptr = resources.first; ptr; ptr = ptr.next)
         {
            if(ptr.loaded)
            {
               display.displaySystem.UnloadResource(ptr.resource, ptr.loaded);
               ptr.loaded = null;
            }
         }

         // Free window graphics
         OnUnloadGraphics();

         // Free skin graphics
         if(rootWindow == this)
         {
            DisplaySystem displaySystem = display.displaySystem;
            if(is3D)
            {
               display.driverData = null;
               display.displaySystem = null;
            }
            display.Unlock();
            delete display;
            if(displaySystem && !displaySystem.numDisplays && !is3D)
               delete displaySystem;
         }
         else
         {
            display.Unlock();
            display = null;
         }
      }

      if(guiApp.acquiredWindow && this == guiApp.acquiredWindow.rootWindow)
         guiApp.interfaceDriver.AcquireInput(guiApp.acquiredWindow.rootWindow, false);

      if(this == guiApp.desktop || parent == guiApp.desktop)
      {
         if((guiApp.fullScreenMode || this != guiApp.desktop) && rootWindow == this && windowHandle && destroyWindows)
            guiApp.interfaceDriver.DestroyRootWindow(this);
      }
   }

   // --- Window Hiding ---

   void SetVisibility(bool state)
   {
      bool visible = (style.hidden || !created) ? false : state;
      if(visible != this.visible)
      {
         Window child;

         this.visible = visible;
         for(child = children.first; child; child = child.next)
            child.SetVisibility(visible);
         Update(null);
         ConsequentialMouseMove(false);
         if(parent && !nonClient) parent.OnChildVisibilityToggled(this, visible);
      }
   }

   // --- Windows and graphics initialization / termination ---

   bool DisplayModeChanged(void)
   {
      bool result = false;
      if(!guiApp.fullScreenMode && !guiApp.modeSwitching/* && guiApp.desktop.active*/)
      {
         guiApp.modeSwitching = true;
         UnloadGraphics(false);
         if(SetupDisplay())
            if(LoadGraphics(false, false))
               result = true;
         guiApp.modeSwitching = false;
      }
      return result;
   }

   // --- Window updates system ---

   void UpdateDirty(Box updateBox)
   {
      if(!manageDisplay) { OnRedraw(null);return; }
      if(visible)
      {
         if(display && (!guiApp.fullScreenMode || guiApp.desktop.active) && !guiApp.modeSwitching)
         {
            display.Lock(true);
            if(display.flags.flipping)
            {
               Update(null);
               rootWindow.UpdateDisplay();
            }
            else
               UpdateBackDisplay(updateBox);

            if(guiApp.fullScreenMode)
            {
               guiApp.cursorUpdate = true;
               guiApp.PreserveAndDrawCursor();
            }
            if(guiApp.fullScreenMode)
               guiApp.RestoreCursorBackground();
            display.Unlock();
         }
      }
   }

   // This function is strictly called as a result of system window activation
   bool ExternalActivate(bool active, bool activateRoot, Window window, Window swap)
   {
      bool result = true;
      Window interimMaster = null;
      Window interimWindow = guiApp.interimWindow;
      if(interimWindow && interimWindow.master)
         interimMaster = interimWindow.master.rootWindow;

      if(active && state == minimized && window.parent) // && (!window.nativeDecorations || window.rootWindow != window)
         // SetState(normal, false, 0);
         SetState(lastState, false, 0);

      if(interimMaster && swap == interimMaster && interimMaster.IsSlaveOf(window))
         return false;

      incref this;
      /* WTH is this doing here?
      while(swap && swap.activeChild)
      {
         swap = swap.activeChild;
      }
      */
      // TESTING THIS BEFORE...
      if(interimWindow && this == interimMaster)
      {
         if(active)
         {
            // Window interimSwap = this;
            Window menuBar = this.menuBar;
            if(menuBar && interimWindow.master == menuBar)
            {
               /*
               while(interimSwap && interimSwap.activeChild)
                  interimSwap = interimSwap.activeChild;

               result = interimWindow.ActivateEx(false, false, false, activateRoot, null,
               (menuBar && interimWindow.master == menuBar) ? menuBar : interimSwap);
               */
               result = /*interimWindow.*/ActivateEx(false, false, false, activateRoot, null, menuBar);
               //result = ActivateEx(true, true, false, activateRoot, window, null);
            }
         }
      }
      else
         // Testing & FindModal() here: broke reactivating when a modal dialog is up (didn't root activate dialog)
         result = ActivateEx(active, active, false, activateRoot /*&& FindModal()*/, window, swap);

      if(interimWindow == this && interimMaster && !active)
      {
         while(interimMaster && interimMaster.interim && interimMaster.master)
         {
            // printf("Going up one master %s\n", interimMaster._class.name);
            interimMaster = interimMaster.master.rootWindow;
         }
         // printf("Unactivating interim master %s (%x)\n", interimMaster._class.name, interimMaster);
         interimMaster.ActivateEx(active, active, false, activateRoot, window, swap);
      }
      delete this;
      return result;
   }

   bool DestroyEx(int64 returnCode)
   {
      OldLink slave;
      Timer timer, nextTimer;
      Window child;
      OldLink prevOrder = null;
      Window client = null;

      if(parent) stopwatching(parent, font);

      // if(window.modalSlave) return false;
      if(destroyed || !created)
      {
         if(master)
         {
            /*
            if(destroyed)
            {
               OldLink slave = master.slaves.FindLink(this);
               master.slaves.Delete(slave);
            }
            */
            // TOFIX IMMEDIATELY: COMMENTED THIS OUT... causes problem second time creating file dialog
            //master = null;
         }
         return true;
      }

      this.returnCode = (DialogResult)returnCode;

      AcquireInput(false);

      destroyed = true;
      if(hotKey)
      {
         master.hotKeys.Delete(hotKey);
         hotKey = null;
      }

      if(guiApp.prevWindow == this)
      {
         guiApp.prevWindow = null;
         OnMouseLeave(0);
      }
      else
      {
         for(w : guiApp.overWindows; w == this)
         {
            OnMouseLeave(0);
            guiApp.overWindows.TakeOut(w);
            break;
         }
      }
      if(guiApp.caretOwner == this)
      {
         guiApp.interfaceDriver.SetCaret(0,0,0);
         UpdateCaret(false, true);
         guiApp.caretEnabled = false;
      }

      /*
      if(cycle)
         parent.childrenCycle.Remove(cycle);
      */
      if(order)
      {
         OldLink tmpPrev = order.prev;
         if(tmpPrev && !(((Window)tmpPrev.data).style.hidden) && !(((Window)tmpPrev.data).destroyed) && (((Window)tmpPrev.data).created))
            prevOrder = tmpPrev;
         for(;;)
         {
            client = tmpPrev ? tmpPrev.data : null;
            if(client == this) { client = null; break; }
            if(client && (client.style.hidden || client.destroyed || !client.created))
               tmpPrev = client.order.prev;
            else
            {
               if(client)
                  prevOrder = tmpPrev;
               break;
            }
         }

         // If this window can be an active client, make sure the next window we activate can also be one
         if(!style.nonClient && style.isActiveClient)
         {
            tmpPrev = prevOrder;
            for(;;)
            {
               client = tmpPrev ? tmpPrev.data : null;
               if(client == this) { client = null; break; }
               if(client && (client.style.nonClient || !client.style.isActiveClient || client.style.hidden || client.destroyed || !client.created))
                  tmpPrev = client.order.prev;
               else
               {
                  if(client)
                     prevOrder = tmpPrev;
                  break;
               }
            }
            if(client && client.style.hidden) client = null;
         }
         // parent.childrenOrder.Remove(order);
      }

      if(parent && style.isActiveClient && visible)
      {
         if(state == minimized) parent.numIcons--;
         parent.numPositions--;
      }

      // TESTING THIS HERE!
      created = false;
      visible = false;

      // If no display, don't bother deactivating stuff (causes unneeded problems when trying
      // to create a window inside a rootwindow that's being destroyed)
      // DISABLED THIS BECAUSE OF CREATING WINDOW IN DESKTOP IN WINDOWED MODE

      if(master && !master.destroyed /*&&
         rootWindow && rootWindow.display && !rootWindow.destroyed*/)
      {
         if(master.defaultControl == this)
            master.defaultControl = null;
      }
      if(parent)
         parent.OnChildAddedOrRemoved(this, true);
      if(parent && !parent.destroyed /*&&
         rootWindow && rootWindow.display && !rootWindow.destroyed*/)
      {
         if((parent.activeChild == this /*|| parent.activeClient == this */|| guiApp.interimWindow == this))
         {
            if(order && prevOrder && prevOrder.data != this && active)
            {
               //((Window)prevOrder.data).ActivateEx(true, false, false, false /*true*/, null);

               ((Window)prevOrder.data).ActivateEx(true, false, false, (rootWindow == this) ? true : false, null, null);
               if(parent.activeClient == this)
               {
                  parent.activeClient = null;
                  parent.UpdateActiveDocument(null);
               }
            }
            else
            {
               if(guiApp.interimWindow == this)
               {
                  bool goOn = true;
                  PropagateActive(false, null, &goOn, true);
               }
               else
               {
                  //if(window.parent.activeChild == window)
                     parent.activeChild = null;
                  if(!style.nonClient /*&& style.isActiveClient*/)
                  {
                     Window previous = parent.activeClient;
                     if(style.isActiveClient)
                        parent.activeClient = null;
                     parent.UpdateActiveDocument(previous);
                  }
               }
            }
         }
         else if(parent.activeClient == this)
         {
            parent.activeClient = client;
            parent.UpdateActiveDocument(this);

         }
      }
      if(guiApp.interimWindow == this)
      {
         guiApp.interimWindow = null;
         if(guiApp.caretOwner)
         {
            Window desktop = guiApp.desktop;
            if(desktop.activeChild && desktop.activeChild.menuBar && !desktop.activeChild.menuBar.focus)
               guiApp.caretOwner.UpdateCaret(false, false);
         }
      }

      active = false;
      if(_isModal && master && master.modalSlave == this)
         master.modalSlave = null;

      if(parent)
      {
         if(!guiApp.caretOwner && parent.caretSize)
         {
            guiApp.caretOwner = parent;
            parent.UpdateCaret(false, false);
            parent.Update(null);
         }

         // Why was this commented out?
         GetRidOfVirtualArea();
      }
      /*
      delete cycle;
      delete order;
      */
      dirtyArea.Free(null);
      dirtyBack.Free(null);
      scrollExtent.Free(null);

      /* ATTEMPTING TO MOVE THAT ABOVE
      created = false;
      visible = false;
      */

      /*
      OnDestroy();
      {
         //Window next;
         //for(child = window.children.first; next = child ? child.next : null, child; child = next)
         for(;(child = window.children.first);)
         {
            for(; child && (child.destroyed || !child.created); child = child.next);
            if(child)
               child.DestroyEx(0);
            else
               break;
         }
      }
      */

      UnloadGraphics(true);

      if(previousActive)
         delete previousActive;

      delete menuBar;
      // statusBar = null;
      sbv = sbh = null;

      if(master && !master.destroyed)
      {
         //master.NotifyDestroyed(this, this.returnCode);
         NotifyDestroyed(master, this, this.returnCode);
      }

      for(timer = guiApp.windowTimers.first; timer; timer = nextTimer)
      {
         nextTimer = timer.next;
         if(timer.window == this)
         {
            // WHY WERE WE SETTING THIS TO NULL? NO MORE WINDOW WHEN RECREATING...
            // timer.window = null;
            timer.Stop();
            //delete timer;
         }
      }

      if(this == guiApp.windowMoving)
         StopMoving();

      if(guiApp.windowCaptured == this)
         ReleaseCapture();
         //guiApp.windowCaptured = null;

      if(rootWindow != this && rootWindow)
         rootWindow.ConsequentialMouseMove(false);

      rootWindow = null;

      OnDestroy();

      {
         //Window next;
         //for(child = children.first; next = child ? child.next : null, child; child = next)
         for(;(child = children.first); )
         {
            for(; child && (child.destroyed || !child.created); child = child.next);
            if(child)
               child.DestroyEx(0);
            else
               break;
         }
      }

      // master = null;

      /* // MOVED THIS UP...
      {
         //Window next;
         //for(child = window.children.first; next = child ? child.next : null, child; child = next)
         for(;(child = window.children.first); )
         {
            for(; child && (child.destroyed || !child.created); child = child.next);
            if(child)
               child.DestroyEx(0);
            else
               break;
         }
      }
      */

      while((slave = slaves.first))
      {
         for(; slave && (((Window)slave.data).destroyed || !((Window)slave.data).created); slave = slave.next);
         if(slave)
            ((Window)slave.data).DestroyEx(0);
         else
            break;
      }

      if(guiApp.caretOwner == this)
         guiApp.caretOwner = null;

      sysButtons[0] = null;
      sysButtons[1] = null;
      sysButtons[2] = null;
      activeChild = null;

      if(rootWindow != this)
      {
         Box box { scrolledPos.x, scrolledPos.y, scrolledPos.x + size.w - 1, scrolledPos.y + size.h - 1 };
         if(style.nonClient)
         {
            box.left   -= parent.clientStart.x;
            box.top    -= parent.clientStart.y;
            box.right  -= parent.clientStart.x;
            box.bottom -= parent.clientStart.y;
         }
         if(parent) parent.Update(box);
      }
      /*
      if(master)
      {
         OldLink slave = master.slaves.FindVoid(this);
         master.slaves.Delete(slave);
         master = null;
      }

      if(parent)
      {
         parent.children.Remove(this);
         parent = null;
      }
      */

      //autoCreate = false;
      //created = false;

      OnDestroyed();

      // SHOULD THIS BE HERE? FIXED CRASH WITH GOTO DIALOG
      if(((subclass(Window))_class).pureVTbl)
      {
         if(_vTbl == _class._vTbl)
         {
            _vTbl = ((subclass(Window))_class).pureVTbl;
         }
         else
         {
            int m;
            for(m = 0; m < _class.vTblSize; m++)
            {
               if(_vTbl[m] == _class._vTbl[m])
                  _vTbl[m] = ((subclass(Window))_class).pureVTbl[m];
            }
         }
      }

      delete this;
      return true;
   }

   void SetStateEx(WindowState newState, bool activate)
   {
      int x,y,w,h;
      WindowState prevState = state;

      state = newState;

      if(prevState != newState)
         lastState = prevState;

      if(rootWindow != this || !nativeDecorations || !windowHandle)
      {
         if(style.isActiveClient && !style.hidden && prevState == minimized)
            parent.numIcons--;

         // This block used to be at the end of the function... moved it for flicker problem in X
         // ------------------------------------------------------
         switch(state)
         {
            case normal:
               stateAnchor = normalAnchor;
               stateSizeAnchor = normalSizeAnchor;
               break;
            case maximized:
               stateAnchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 };
               stateSizeAnchor = SizeAnchor {};
               break;
            case minimized:
            {
               if(hasMinimize)
               {
                  int maxIcons = parent.clientSize.w / MINIMIZED_WIDTH;
                  Window child;
                  int size = 256;
                  byte * idBuffer = new0 byte[size];
                  int c;
                  for(child = parent.children.first; child; child = child.next)
                  {
                     if(child != this && child.state == minimized)
                     {
                        if(child.iconID > size - 2)
                        {
                           idBuffer = renew0 idBuffer byte[size*2];
                           memset(idBuffer + size, 0, size);
                           size *= 2;
                        }
                        idBuffer[child.iconID] = (byte)bool::true;
                     }
                  }
                  for(c = 0; c<size; c++)
                     if(!idBuffer[c])
                        break;
                  iconID = c;
                  delete idBuffer;
                  if(style.isActiveClient && !style.hidden)
                     parent.numIcons++;

                  stateAnchor = Anchor { left = (iconID % maxIcons) * MINIMIZED_WIDTH, bottom = (iconID / maxIcons) * (guiApp.textMode ? 16 : 24) };
                  stateSizeAnchor = SizeAnchor { size.w = MINIMIZED_WIDTH };
                  break;
               }
            }
         }
         // TOCHECK: Why was this here?
         //position.x = (tx > 0) ? tx & 0xFFFFF : tx;
         //position.y = (ty > 0) ? ty & 0xFFFFF : ty;
         ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);

         if(state != minimized || hasMinimize)
            Position(x, y, w, h, true, true, true, true, false, true);

         if(!style.inactive && !style.interim && parent && this == parent.activeClient)
            parent.UpdateActiveDocument(null);
      }

      if(state != minimized || hasMinimize)
         CreateSystemChildren();
      // ------------------------------------------------------
   }

   int GetPositionID(Window forChild)
   {
      Window child;
      int size = 256;
      byte * idBuffer = new0 byte[size];
      int c;

      for(child = children.first; child; child = child.next)
      {
         if(child.style.isActiveClient && !child.style.hidden && child != forChild)
         {
            if(child.positionID > size - 2)
            {
               idBuffer = renew0 idBuffer byte[size*2];
               memset(idBuffer + size, 0, size);
               size *= 2;
            }
            idBuffer[child.positionID] = (byte)bool::true;
         }
      }
      for(c = 0; c<size; c++)
         if(!idBuffer[c])
            break;
      delete idBuffer;
      return c;
   }

   // --- Window related graphics ---

   void SetPalette(ColorAlpha * newPalette, bool colorMatch)
   {
      palette = newPalette;
      if(rootWindow.display)
         rootWindow.display.SetPalette(palette, colorMatch);
   }

   public bool AcquireInput(bool acquired)
   {
      bool result = true;
      if((guiApp.acquiredWindow && acquiredInput) != acquired)
      {
         if(active || (!visible && creationActivation == activate))
            result = AcquireInputEx(acquired);
         /*if(!result)
         {
            Print("");
         }*/
         acquiredInput = acquired ? result : !result;
      }
      return result;
   }

   void ListChildren(ListBox listBox)
   {
      Window child;
      char caption[2048];
      for(child = children.first; child; child = child.next)
      {
         if(child.cycle && !child.style.nonClient && child.style.isActiveClient && child.visible)
         {
            DataRow row = listBox.AddRow();
            row.tag = (int64)(intptr)child;
            child.FigureCaption(caption);
            row.SetData(null, caption);
         }
      }
   }

   void UpdateVisual(Box extent)
   {
      if(guiApp.driver != null)
      {
#if !defined(__EMSCRIPTEN__)
         if(guiApp.fullScreenMode && guiApp.desktop.display)
#else
         if(true)
#endif
         {
#if !defined(__EMSCRIPTEN__)
            guiApp.desktop.mutex.Wait();
#endif
            guiApp.desktop.display.Lock(true);

            Update(extent);
            if(guiApp.desktop.active)
            {
               if(guiApp.desktop.dirty || guiApp.cursorUpdate)
               {
                  if(guiApp.desktop.display.flags.flipping)
                     guiApp.desktop.Update(null);
                  guiApp.desktop.UpdateDisplay();
                  guiApp.cursorUpdate = true;
               }
               if(guiApp.cursorUpdate || guiApp.desktop.dirty)
               {
                  guiApp.PreserveAndDrawCursor();
                  // guiApp.desktop.display.ShowScreen();
                  guiApp.cursorUpdate = false;
                  guiApp.desktop.dirty = false;
                  guiApp.RestoreCursorBackground();
               }
            }

            guiApp.desktop.display.Unlock();
#if !defined(__EMSCRIPTEN__)
            guiApp.desktop.mutex.Release();
#endif
         }
         else
         {
            Window rootWindow = this.rootWindow;
#if !defined(__EMSCRIPTEN__)
            rootWindow.mutex.Wait();
#endif
            display.Lock(true);

            Update(extent);
            if(guiApp.waiting)
               guiApp.SignalEvent();
            else
            {
#if !defined(__EMSCRIPTEN__)
               guiApp.waitMutex.Wait();
#endif
               guiApp.interfaceDriver.Lock(rootWindow);
               if(!rootWindow.style.hidden && rootWindow.dirty)
               {
                  if(rootWindow.display)
                  {
                     rootWindow.UpdateDisplay();
                     //rootWindow.display.ShowScreen(null);
                  }
                  rootWindow.dirty = false;
               }
               guiApp.interfaceDriver.Unlock(rootWindow);
#if !defined(__EMSCRIPTEN__)
               guiApp.waitMutex.Release();
#endif
            }
            display.Unlock();
#if !defined(__EMSCRIPTEN__)
            rootWindow.mutex.Release();
#endif
         }
      }
   }

   void UnlockDisplay(void)
   {
      guiApp.interfaceDriver.Unlock(rootWindow);
   }

   void LockDisplay(void)
   {
      guiApp.interfaceDriver.Lock(rootWindow);
   }

   Surface GetSurface(Box box)
   {
      return Redraw((box == null) ? this.box : box);
   }

   public void SetMousePosition(int x, int y)
   {
      guiApp.interfaceDriver.SetMousePosition(x + absPosition.x + clientStart.x, y + absPosition.y + clientStart.y);
   }

   /*
   void IntegrationActivate(bool active)
   {
      if(!guiApp.modeSwitching && !guiApp.fullScreenMode)
      {
         isForegroundWindow = true;
         ActivateEx(active, active, false, false, null, null);
         isForegroundWindow = false;
      }
   }
   */

   Window QueryCapture(void)
   {
      return guiApp.windowCaptured;
   }

   int GetDocumentID(void)
   {
      Window child;
      int size = 256;
      byte * idBuffer = new0 byte[size];
      int c;

      for(child = children.first; child; child = child.next)
      {
         // TO CHECK: Do we want a documentID when we already have a file name?
         if(child.style.isDocument && !child.fileName)
         {
            if(child.documentID-1 > size - 2)
            {
               idBuffer = renew0 idBuffer byte[size*2];
               memset(idBuffer + size, 0, size);
               size *= 2;
            }
            idBuffer[child.documentID-1] = 1;
         }
      }
      for(c = 0; c<size; c++)
         if(!idBuffer[c])
            break;
      numDocuments++;
      delete idBuffer;
      return c + 1;
   }

   void SetInitSize(Size size)
   {
      int x, y, w, h;
      sizeAnchor.size = size;
      normalSizeAnchor = sizeAnchor;

      // Break the anchors for moveable/resizable windows
      if(state == normal /*|| state == Hidden */)   // Hidden is new here ...
      {
         stateAnchor = normalAnchor;
         stateSizeAnchor = normalSizeAnchor;

         ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
         Position(x,y, w, h, true, true, true, true, false, true);
      }
   }

   void MenuMoveOrSize(bool resize, bool setCursorPosition)
   {
      if(this != guiApp.desktop && state != maximized && (resize ? (state != minimized && style.sizable) : (style.fixed || moveable)))
      {
         guiApp.windowIsResizing = resize;
         guiApp.windowMoving = this;
         guiApp.windowMovingStart = guiApp.movingLast = absPosition;
         if(guiApp.windowIsResizing)
         {
            guiApp.windowMovingStart.x += size.w - 1;
            guiApp.windowMovingStart.y += size.h - 1;
         }
         guiApp.windowMovingBefore = scrolledPos;
         guiApp.windowResizingBefore = size;
         guiApp.windowMoving.UpdateDecorations();
         if(guiApp.windowIsResizing)
            guiApp.resizeEndX = guiApp.resizeEndY = true;

         if(setCursorPosition)
            guiApp.interfaceDriver.SetMousePosition(guiApp.windowMovingStart.x, guiApp.windowMovingStart.y);
         else
         {
            int x = 0, y = 0;
            guiApp.interfaceDriver.GetMousePosition(&x, &y);
            guiApp.windowMovingStart.x += x - absPosition.x;
            guiApp.windowMovingStart.y += y - absPosition.y;
         }

         if(guiApp.windowMoving)
         {
            if(guiApp.windowMoving.style.nonClient)
               guiApp.windowMoving.parent.SetMouseRangeToWindow();
            else
               guiApp.windowMoving.parent.SetMouseRangeToClient();
         }

         Capture();

         if(this == rootWindow)
            guiApp.interfaceDriver.StartMoving(rootWindow, guiApp.windowMovingStart.x, guiApp.windowMovingStart.y, true);
      }
   }

   void SetupFileMonitor()
   {
#if !defined(__EMSCRIPTEN__)
      if(!fileMonitor)
      {
         fileMonitor = FileMonitor
         {
            this, FileChange { modified = true };

            bool OnFileNotify(FileChange action, const char * param)
            {
               incref this;
               fileMonitor.StopMonitoring();
               if(OnFileModified(action, param))
                  fileMonitor.StartMonitoring();
               delete this;
               return true;
            }
         };
         incref fileMonitor;
      }
#endif
   }

public:
   // normal Methods
   bool Create()
   {
      bool result = false;

      if(created)
         result = true;
      else if(guiApp && guiApp.driver != null)
      {
         OldLink slaveHolder;
         Window last;
         bool visible = !style.hidden;

         if(style.embedded)
         {
            systemParent = parent;
            parent = guiApp.desktop;
         }
         last = parent ? parent.children.last : null;

         if((parent && parent != guiApp.desktop && !parent.created) ||
            (master && master != guiApp.desktop && !master.created))
            return false;

         if(parent)
            stopwatching(parent, font);

         if(!parent)
            property::parent = guiApp.desktop;
         if(!master) master = parent;

         if(_isModal && master.modalSlave)
            property::master = master.modalSlave;
            //return false;

         if(parent)
            parent.children.Remove(this);
         if(master)
         {
            for(slaveHolder = master.slaves.first; slaveHolder; slaveHolder = slaveHolder.next)
               if(slaveHolder.data == this)
               {
                  master.slaves.Delete(slaveHolder);
                  break;
               }
         }

#if !defined(__EMSCRIPTEN__)
         if(parent == guiApp.desktop && !mutex)
            mutex = Mutex {};
#endif

         if(style.isDocument)
         {
            if(parent)
               parent.numDocuments--;
            documentID = parent.GetDocumentID();
         }

         if(!style.stayOnTop)
            for(; last && last.style.stayOnTop; last = last.prev);

         parent.children.Insert((last == this) ? null : last, this);
         //parent.children.Add(this);

         if(!dispDriver)
            dispDriver = parent.dispDriver;
         destroyed = false;
         if(_isModal)
            master.modalSlave = this;

         box = Box { MAXINT, MAXINT, MININT, MININT }; //-MAXINT, -MAXINT };

         incref this;
         incref this;

         master.slaves.Add(slaveHolder = OldLink { data = this });
         if(slaveHolder)
         {
            if(setHotKey)
            {
               master.hotKeys.Add(hotKey = HotKeySlot { key = setHotKey, window = this });
            }
            if(style.isDefault && !master.defaultControl)
               master.defaultControl = this;

            stateAnchor = normalAnchor = anchor;
            stateSizeAnchor = normalSizeAnchor = sizeAnchor;

            // TOCHECK: Why is this here?
            //position.x = (ax > 0) ? ax & 0xFFFFF : ax;
            //position.y = (ay > 0) ? ay & 0xFFFFF : ay;

            this.visible = false;
            style.hidden = true;

            //created = true;
            // autoCreate = true;
            wasCreated = true;
            if(SetupDisplay())
            {
               created = true;
               if(OnCreate())
               {
                  /*
                  if(parent == guiApp.desktop)
                     Log("LoadGraphics %s\n", caption);
                  */
                  if(LoadGraphics(true, false))
                  {
                     if(!setFont)
                     {
                        watch(parent)
                        {
                           font
                           {
                              usedFont = setFont ? setFont : (parent.parent ? parent.usedFont : systemFont);
                              firewatchers font;
                              Update(null);
                           }
                        };
                     }

                     if(style.hasMenuBar /*&& menu*/)
                     {
                        if(!menuBar && created)
                        {
                           menuBar =
                              PopupMenu
                              {
                                 this,
                                 menu = menu, isMenuBar = true, anchor = Anchor { top = 23, left = 1, right = 1 },
                                 interim = false, inactive = true, nonClient = true, size.h = 24
                              };
                           incref menuBar;
                        }
                        menuBar.Create();
                     }

                     if(statusBar)
                        statusBar.Create();

                     // Create the system buttons
                     CreateSystemChildren();

                     UpdateActiveDocument(null);

                     if(style.isDocument)
                     {
                        if(menu)
                        {
                           MenuItem item = menu.FindItem(MenuFileSave, 0);
                           if(item) item.disabled = !modifiedDocument && fileName;
                        }
                     }

                     /*
                     if(parent == guiApp.desktop)
                        Log("Preemptive SetState %s\n", caption);
                     */

                     // Preemptive Set State to ensure proper anchoring
                     SetStateEx(state, false);
                     /*
                     style.hidden = true;
                     visible = false;
                     */

                     {
                        Window child, next;
                        for(child = children.first; child; child = next)
                        {
                           next = child.next;
                           if(!child.created && (child.autoCreate || child.wasCreated))
                              child.Create();
                        }
                     }

                     {
                        OldLink link, next;
                        for(link = slaves.first; link; link = next)
                        {
                           Window slave = link.data;
                           next = link.next;
                           if(!slave.created && (slave.autoCreate || slave.wasCreated))
                           {
                              if(slave.Create())
                                 // Things might have happened that invalidated 'next'...
                                 // Start over the search for slaves to create.
                                 // (Added this to fix crash with Stacker & Toolbar)
                                 next = slaves.first;
                           }
                        }
                     }

                     if(OnPostCreate())
                        OnApplyGraphics();

                     /*
                     if(parent == guiApp.desktop)
                        Log("Real SetState %s\n", caption);
                     */

                     if(isActiveClient && visible)
                     {
                        parent.numPositions--;
                        if(state == minimized) parent.numIcons--;
                     }

                     parent.OnChildAddedOrRemoved(this, false);

                     if(rootWindow == this && visible)   // So that X11 windows don't show as 'unknown'
                        UpdateCaption();
                     // Real set state & activate for proper display & activation
                     property::visible = visible;
                     //  SetState(state & 0x00000003, true, 0);
                     guiApp.interfaceDriver.SetIcon(this, icon);

                     if(visible)
                     {
                        UpdateCaption();
                        /*if(rootWindow == this)
                           guiApp.interfaceDriver.ActivateRootWindow(this);
                        else*/
                        if(creationActivation == activate && guiApp.desktop.active)
                           ActivateEx(true, false, true, true, null, null);
                        else if(creationActivation == activate || creationActivation == flash)
                        {
                           MakeActive();
                           if(this == rootWindow)
                              Flash();
                        }
                     }

                     if(!destroyed && !noConsequential)
                        rootWindow.ConsequentialMouseMove(false);

                     result = true;
                  }
               }
            }
         }
         /*
         if(!result)
         {
            Destroy(0);
            guiApp.LogErrorCode(IERR_WINDOW_CREATION_FAILED, caption);
         }
         */

         if(!result)
         {
            // Testing this here... Otherwise a failed LoadGraphics stalls the application
            created = false;
            //style.hidden = true; // !visible;
            style.hidden = !visible;
            if(master.modalSlave == this)
               master.modalSlave = null;
         }
         delete this;
      }
      return result;
   }

   void WriteCaption(Surface surface, int x, int y)
   {
      if(caption)
         Interface::WriteKeyedTextDisabled(surface, x,y, caption, hotKey ? hotKey.key : 0, !isEnabled);
   }

   void Update(const Box region)
   {
      if(this)
      {
         Window rootWindow;

         rootWindow = this.rootWindow;

         // rootWindow.mutex.Wait();
         if(!destroyed && visible && display)
         {
            Window child;
            Box realBox;

            // Testing this to avoid repetitve full update to take time...
            if(rootWindow.fullRender)
            {
               rootWindow.dirty = true;
               return;
            }
            if(dirtyArea.count == 1)
            {
               BoxItem item = (BoxItem)ACCESS_ITEM(dirtyArea, dirtyArea.first);
               if(item.box.left <= box.left &&
                  item.box.top <= box.top &&
                  item.box.right >= box.right &&
                  item.box.bottom >= box.bottom)
               {
                  rootWindow.dirty = true;
                  return;
               }
            }

            if(display.flags.flipping && !rootWindow.dirty)
            {
               if(this == rootWindow)
                  region = null;
               else
               {
                  rootWindow.Update(null);
                  return;
               }
            }

            rootWindow.dirty = true;

            if(region != null)
            {
               realBox = region;
               realBox.left += clientStart.x;
               realBox.top += clientStart.y;
               realBox.right += clientStart.x;
               realBox.bottom += clientStart.y;
               realBox.Clip(box);
            }
            else
               realBox = box;

            if(realBox.right >= realBox.left &&
               realBox.bottom >= realBox.top)
            {
               // if(!rootWindow.fullRender)
                  dirtyArea.UnionBox(realBox, rootWindow.tempExtents[0]);

               for(child = children.first; child; child = child.next)
               {
                  if(!child.is3D)
                  {
                     Box box = realBox;
                     box.left -= child.absPosition.x - absPosition.x;
                     box.top -= child.absPosition.y - absPosition.y;
                     box.right -= child.absPosition.x - absPosition.x;
                     box.bottom -= child.absPosition.y - absPosition.y;
                     if(box.right >= child.box.left && box.left <= child.box.right &&
                        box.bottom >= child.box.top && box.top <= child.box.bottom)
                     {
                        box.left -= child.clientStart.x;
                        box.top -= child.clientStart.y;
                        box.right -= child.clientStart.x;
                        box.bottom -= child.clientStart.y;
                        child.Update(box);
                     }
                  }
               }

               realBox.left += absPosition.x - rootWindow.absPosition.x;
               realBox.top += absPosition.y - rootWindow.absPosition.y;
               realBox.right += absPosition.x - rootWindow.absPosition.x;
               realBox.bottom += absPosition.y - rootWindow.absPosition.y;
               rootWindow.dirtyBack.UnionBox(realBox, rootWindow.tempExtents[0]);
            }
         }
         else if(this == guiApp.desktop)
         {
            Window window;
            for(window = children.first; window; window = window.next)
            {
               if(!window.is3D)
               {
                  if(region != null)
                  {
                     Box childBox = region;

                     childBox.left    -= window.absPosition.x - guiApp.desktop.absPosition.x;
                     childBox.top     -= window.absPosition.y - guiApp.desktop.absPosition.y;
                     childBox.right   -= window.absPosition.x - guiApp.desktop.absPosition.x;
                     childBox.bottom  -= window.absPosition.y - guiApp.desktop.absPosition.y;

                     window.Update(childBox);
                  }
                  else
                     window.Update(null);
               }
            }
         }

         // rootWindow.mutex.Release();
      }
   }

   bool Capture(void)
   {
      bool result = true;
      if(guiApp.windowCaptured != this)
      {
         if(guiApp.windowCaptured)
            result = false;
         else
         {
            //Logf("Captured %s (%s)\n", caption, class.name);
            guiApp.interfaceDriver.SetMouseCapture(rootWindow);
            guiApp.windowCaptured = this;
         }
      }
      return result;
   }

   bool Destroy(int64 code)
   {
      //if(created)
      if(this)
      {
         if(!destroyed && !CloseConfirmation(false)) return false;
         incref this;
         if(DestroyEx(code))
         {
            // TOCHECK: Should autoCreate be set to false here?
            autoCreate = false;
            wasCreated = false;
            delete this;
            return true;
         }
         delete this;
      }
      return false;
   }

   void Move(int x, int y, int w, int h)
   {
      normalAnchor = Anchor { left = x, top = y };
      normalSizeAnchor = SizeAnchor { size = { w, h } };

      if(state == normal /*|| state == Hidden */)   // Hidden is new here ...
      {
         if(destroyed) return;

         stateAnchor = normalAnchor;
         stateSizeAnchor = normalSizeAnchor;

         ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
         Position(x,y, w, h, true, true, true, true, false, true);
      }
   }

   DialogResult Modal(void)
   {
      isModal = true;
      if(Create())
         return DoModal();

      // FIXES MEMORY LEAK IF Create() FAILED
      incref this;
      delete this;
      return 0;
   }

   void SetScrollArea(int width, int height, bool snapToStep)
   {
      if(snapToStep)
      {
         int stepX = sbStep.x, stepY = sbStep.y;
         // Needed to make snapped down position match the skin's check of client area
         // against realvirtual
         if(guiApp.textMode)
         {
            SNAPDOWN(stepX, textCellW);
            SNAPDOWN(stepY, textCellH);
            stepX = Max(stepX, textCellW);
            stepY = Max(stepY, textCellH);
         }
         if(scrollFlags.snapX)
            SNAPUP(width, stepX);
         if(scrollFlags.snapY)
            SNAPUP(height, stepY);
      }

      reqScrollArea.w = width;
      reqScrollArea.h = height;
      noAutoScrollArea = (width > 0 || height > 0);

      UpdateScrollBars(true, true);
   }

   void SetScrollPosition(int x, int y)
   {
      if(sbh)
         sbh.Action(setPosition, x, 0);
      else
      {
         int range;
         int seen = clientSize.w, total = reqScrollArea.w;
         seen = Max(1,seen);
         if(scrollFlags.snapX)
            SNAPDOWN(seen, sbStep.x);

         if(!total) total = seen;
         range = total - seen + 1;
         range = Max(range, 1);
         if(x < 0) x = 0;
         if(x >= range) x = range - 1;

         if(scrollFlags.snapX)
            SNAPUP(x, sbStep.x);

         if(scroll.x != x)
            OnHScroll(setPosition, x, 0);

         if(guiApp.textMode)
         {
            SNAPDOWN(x, textCellW);
         }
         scroll.x = x;
      }

      if(sbv)
         sbv.Action(setPosition, y, 0);
      else
      {
         int range;
         int seen = clientSize.h, total = reqScrollArea.h;
         seen = Max(1,seen);

         if(scrollFlags.snapY)
            SNAPDOWN(seen, sbStep.y);

         if(!total) total = seen;
         range = total - seen + 1;
         range = Max(range, 1);
         if(y < 0) y = 0;
         if(y >= range) y = range - 1;

         if(scrollFlags.snapY)
            SNAPUP(y, sbStep.y);

         if(scroll.y != y)
            OnVScroll(setPosition, y, 0);
         if(guiApp.textMode)
         {
            SNAPDOWN(y, textCellH);
         }
         scroll.y = y;
      }
      if(!sbh || !sbv)
         UpdateCaret(false, false);
   }

   void SetScrollLineStep(int stepX, int stepY)
   {
      sbStep.x = stepX;
      sbStep.y = stepY;
      if(guiApp.textMode)
      {
         SNAPDOWN(stepX, textCellW);
         SNAPDOWN(stepY, textCellH);
         stepX = Max(stepX, textCellW);
         stepY = Max(stepY, textCellH);
      }
      if(sbh)
         sbh.lineStep = stepX;
      if(sbv)
         sbv.lineStep = stepY;
   }

   void SetState(WindowState newState, bool activate, Modifiers mods)
   {
      if(created)
      {
         if(state == newState || OnStateChange(newState, mods))
         {
            //WindowState prevState = state;

            StopMoving();

            // This used to be at the end of the brackets... moved for X, testing...
            // This has the effect of activating the window through the system...
            if(rootWindow == this)
               guiApp.interfaceDriver.SetRootWindowState(this, newState, !style.hidden);

            SetStateEx(newState, activate);

            if(rootWindow == this && !rootWindow.nativeDecorations)
            {
               int x = position.x, y = position.y;
               /*if(style.interim)
               {
                  x -= guiApp.desktop.absPosition.x;
                  y -= guiApp.desktop.absPosition.y;
               }*/
               guiApp.interfaceDriver.PositionRootWindow(this, x, y, size.w, size.h, true, true);
            }

            //state = newState;
            //state = prevState;

            if(state != maximized && style.hasMaximize)
            {
               Window child;
               for(child = parent.children.first; child; child = child.next)
               {
                  if(child != this && child.state == maximized)
                     child.SetStateEx(normal, false);
               }
            }

            if(!style.nonClient && (sbv || sbh) && this != parent.sbv && this != parent.sbh)
               parent.UpdateScrollBars(true, true);

            /*
            // Do we really need this stuff here?
            // Shouldn't the Activate stuff take care of it?
            if(parent.rootWindow == parent && style)
            {
               char caption[2048];
               parent.FigureCaption(caption);
               guiApp.interfaceDriver.SetRootWindowCaption(parent, caption);
               parent.UpdateDecorations();
            }
            */

            rootWindow.ConsequentialMouseMove(false);
         }
      }
      else
         state = newState;
   }

   BitmapResource GetIcon(SkinBitmap iconID)
   {
      return guiApp.currentSkin.GetBitmap(iconID);
   }

   void SetMouseRange(Box range)
   {
      if(range || guiApp.fullScreenMode)
      {
         Box clip;
         if(range != null)
         {
            clip.left   = range.left + absPosition.x + clientStart.x;
            clip.top    = range.top + absPosition.y + clientStart.y;
            clip.right  = range.right + absPosition.x + clientStart.x;
            clip.bottom = range.bottom + absPosition.y + clientStart.y;
         }
         else
         {
            clip.left   = guiApp.desktop.box.left;
            clip.top    = guiApp.desktop.box.top;
            clip.right  = guiApp.desktop.box.right;
            clip.bottom = guiApp.desktop.box.bottom;
         }
         guiApp.interfaceDriver.SetMouseRange(rootWindow, clip);
      }
      else
         guiApp.interfaceDriver.SetMouseRange(rootWindow, null);
   }

   void SetMouseRangeToClient(void)
   {
      if(guiApp.fullScreenMode || this != guiApp.desktop)
      {
         Box box {0, 0, clientSize.w - 1, clientSize.h - 1 };
         box.Clip(clientArea);
         SetMouseRange(box);
      }
      else
         SetMouseRange(null);
   }

   void SetMouseRangeToWindow(void)
   {
      Box box { -clientStart.x, -clientStart.y, size.w-1, size.h-1 };
      if(this == guiApp.desktop)
         SetMouseRangeToClient();
      else
         SetMouseRange(box);
   }

   // x, y: Desktop Coordinates
   void ShowSysMenu(int x, int y)
   {
      Menu menu { };
      PopupMenu windowMenu { master = this, interim = true, position = { x + 1 - guiApp.desktop.position.x, y + 1 - guiApp.desktop.position.y }, menu = menu };
      MenuItem
      {
         menu, $"Restore", r, NotifySelect = MenuWindowRestore,
         disabled = (!style.hasMaximize && !style.hasMinimize) || state == normal, bitmap = guiApp.currentSkin.GetBitmap(restore)
      };
      MenuItem
      {
         menu, $"Move", m, NotifySelect = MenuWindowMove,
         disabled = !style.fixed || state == maximized
      };
      MenuItem
      {
         menu, $"Size", s, NotifySelect = MenuWindowSize,
         disabled = !style.sizable || state != normal
      };
      MenuItem
      {
         menu, $"Minimize", n, NotifySelect = MenuWindowMinimize,
         disabled = !style.hasMinimize || state == minimized, bitmap = guiApp.currentSkin.GetBitmap(minimize)
      };
      MenuItem
      {
         menu, $"Maximize", KeyCode::x, NotifySelect = MenuWindowMaximize,
         disabled = !style.hasMaximize || state == maximized, bitmap = guiApp.currentSkin.GetBitmap(maximize)
      };
      MenuItem
      {
         menu, $"Stay On Top", t, NotifySelect = MenuWindowStayOnTop,
         disabled = !style.fixed, checkable = true, checked = style.stayOnTop
      };
      MenuDivider { menu };
      MenuItem
      {
         menu, $"Close", c, (parent == guiApp.desktop) ? altF4 : ( style.isActiveClient ? ctrlF4 : 0), NotifySelect = MenuWindowClose,
         bold = true, disabled = !style.hasClose, bitmap = guiApp.currentSkin.GetBitmap(close)
      };
      windowMenu.Create();
   }

   void Activate(void)
   {
      ActivateEx(true, true, true, true, null, null);
   }

   void MakeActive(void)
   {
      ActivateEx(true, false, true, false, null, null);
   }

   void SoftActivate(void)
   {
      if(guiApp.desktop.active)
         Activate();
      else if(!active)
      {
         MakeActive();
         if(this == rootWindow)
            Flash();
      }
   }

   void Deactivate(void)
   {
      ActivateEx(false, true, true, true, null, null);
   }

   void Flash(void)
   {
      guiApp.interfaceDriver.FlashRootWindow(rootWindow);
   }

   bool CycleChildren(bool backward, bool clientOnly, bool tabCycleOnly, bool cycleParents)
   {
      bool result = false;
      if(activeChild && activeChild.cycle)
      {
         Window modalWindow, child = activeChild;
         if(!clientOnly /*&& parent.tabCycle*/)
         {
            Window next = child;
            while(true)
            {
               if(next.cycle == (backward ? childrenCycle.first : childrenCycle.last))
               {
                  if(cycleParents)
                  {
                     if(parent && parent.CycleChildren(backward, false, true, true))
                        return true;
                     break;
                  }
                  else
                     return false;
               }
               if(backward)
                  next = next.cycle.prev.data;
               else
                  next = next.cycle.next.data;
               if(!next.disabled && !next.inactive /*isRemote*/ && next.created && !next.nonClient && (!clientOnly || next.style.isActiveClient) && !next.style.hidden && next.FindModal() != activeChild)
                  break;
            }
         }
         /*
         if(!clientOnly && child.cycle == (backward ? childrenCycle.first : childrenCycle.last) &&
            parent.tabCycle && parent.CycleChildren(backward, false, false))
            return true;
         */

         if(tabCycleOnly && !tabCycle) return false;

         while(child)
         {
            Window parentActiveChild = child.parent.activeChild;
            if(!parentActiveChild) parentActiveChild = child;
            while(true)
            {
               if(backward)
                  child = child.cycle.prev.data;
               else
                  child = child.cycle.next.data;
               if(child == parentActiveChild)
                  return result;
               else if(!child.disabled && child.created && (!clientOnly || child.style.isActiveClient) && !child.style.hidden && child.FindModal() != activeChild)
                  break;
            }
            modalWindow = child.FindModal();
            if(!modalWindow)
            {
               // Scroll the window to include the active control
               if(sbh && !child.style.dontScrollHorz)
               {
                  if(child.scrolledPos.x < 0)
                     sbh.Action(setPosition, scroll.x + child.scrolledPos.x, 0);
                  else if(child.scrolledPos.x + child.size.w > clientSize.w)
                     sbh.Action(setPosition, scroll.x + child.scrolledPos.x + child.size.w - clientSize.w, 0);
               }
               if(sbv && !child.style.dontScrollVert)
               {
                  if(child.scrolledPos.y < 0)
                     sbv.Action(setPosition, scroll.y + child.scrolledPos.y, 0);
                  else if(child.scrolledPos.y + child.size.h > clientSize.h)
                     sbv.Action(setPosition, scroll.y + child.scrolledPos.y + child.size.h - clientSize.h, 0);
               }
            }
            result = true;
            child = modalWindow ? modalWindow : child;
            child.ActivateEx(true, true, true, true, null, null);
            if(child.tabCycle && child.childrenCycle.first)
               child = ((OldLink)(backward ? child.childrenCycle.first : child.childrenCycle.last)).data;
            else
               break;
         }
      }
      else
         return false;

      ConsequentialMouseMove(false);
      return result;
   }

   void AddResource(Resource resource)
   {
      if(resource)
      {
         ResPtr ptr { resource = resource };
         resources.Add(ptr);
         incref resource;

         // Load Graphics here if window is created already
         if(/*created && */display)
         {
            display.Lock(false);
            if(!ptr.loaded)   // This check prevents a leak in case a watcher on 'font' calls AddResource (ListBox FontResource leak)
               ptr.loaded = display.displaySystem.LoadResource(resource);
            display.Unlock();
         }
         /*
         // Temporary hack to load font right away for listbox in dropbox ...
         else if(master && master.display)
         {
            master.display.Lock(false);
            master.display.displaySystem.LoadResource(resource);
            master.display.Unlock();
         }
         */
      }
   }

   void RemoveResource(Resource resource)
   {
      if(resource)
      {
         ResPtr ptr;
         for(ptr = resources.first; ptr; ptr = ptr.next)
         {
            if(ptr.resource == resource)
               break;
         }

         if(ptr)
         {
            // Unload Graphics here if window is created already
            if(/*created && */display)
            {
               if(ptr.loaded)
               {
                  display.Lock(false);
                  display.displaySystem.UnloadResource(resource, ptr.loaded);
                  display.Unlock();
                  ptr.loaded = null;
               }
            }
            delete resource;
            resources.Delete(ptr);
         }
      }
   }

   void SetCaret(int x, int y, int size)
   {
      if(!destroyed)
      {
         caretPos.x = x;
         caretPos.y = y;
         caretSize = size;
         if(active && !style.interim && isEnabled)
         {
            if(visible || !guiApp.caretOwner)
               guiApp.caretOwner = size ? this : null;
            if(size)
               UpdateCaret(false, false);
            else
            {
               guiApp.interfaceDriver.SetCaret(0,0,0);
               UpdateCaret(false, true);
               guiApp.caretEnabled = false;
            }
         }
         else if(style.inactive && active)
         {
            guiApp.interfaceDriver.SetCaret(0,0,0);
            UpdateCaret(false, true);
            guiApp.caretEnabled = false;
         }
      }
   }

   void Scroll(int x, int y)
   {
      bool opaque = !style.drawBehind || background.a;
      if(opaque && display && display.flags.scrolling)
      {
         Box box = clientArea;
         box.left += clientStart.x;
         box.top += clientStart.y;
         box.right += clientStart.x;
         box.bottom += clientStart.y;

         //scrollExtent.Free(null);
         scrollExtent.AddBox(box);
         scrolledArea.x += x;
         scrolledArea.y += y;

         //scrollExtent.Free();
         //scrollExtent.AddBox(clientArea);
         //scrollExtent.Offset(clientStart.x, clientStart.y);
         //scrolledArea.x = x;
         //scrolledArea.y = y;
      }
      else
         Update(clientArea);

      if(rootWindow)
         rootWindow.dirty = true;
   }

   void ReleaseCapture()
   {
      if(guiApp && guiApp.windowCaptured && guiApp.windowCaptured == this)
      {
         Window oldCaptured = guiApp.windowCaptured;
         guiApp.windowCaptured = null;
         guiApp.prevWindow = null;
         incref oldCaptured;

         //guiApp.Log("Released Capture\n");

         guiApp.interfaceDriver.SetMouseCapture(null);

         //oldCaptured.OnMouseCaptureLost();

         if(oldCaptured)
            oldCaptured.ConsequentialMouseMove(false);
         delete oldCaptured;
      }
   }

   private void _SetCaption(const char * format, va_list args)
   {
      if(this)
      {
         delete caption;
         if(format)
         {
            char caption[MAX_F_STRING];
            vsnprintf(caption, sizeof(caption), format, args);
            caption[sizeof(caption)-1] = 0;

            this.caption = CopyString(caption);
         }
         if(created)
            UpdateCaption();

         firewatchers caption;
      }
   }

   /*deprecated*/ void SetText(const char * format, ...)
   {
      va_list args;
      va_start(args, format);
      _SetCaption(format, args);
      va_end(args);
   }

   void SetCaption(const char * format, ...)
   {
      va_list args;
      va_start(args, format);
      _SetCaption(format, args);
      va_end(args);
   }

   bool Grab(Bitmap bitmap, Box box, bool decorations)
   {
      bool result = false;
      if(display || this == guiApp.desktop)
      {
         Box clip = {MININT, MININT, MAXINT, MAXINT};

         if(box != null)
            clip = box;

         if(!decorations)
            clip.Clip(clientArea);
         else
            clip.Clip(this.box);

         if(rootWindow != this)
         {
            clip.left   += absPosition.y;
            clip.top    += absPosition.y;
            clip.right  += absPosition.x;
            clip.bottom += absPosition.y;
         }

         if(!nativeDecorations)
         {
            clip.left += decorations ? 0 : clientStart.x;
            clip.top += decorations ? 0 : clientStart.y;
            clip.right += decorations ? 0 : clientStart.x;
            clip.bottom += decorations ? 0 : clientStart.y;
         }

         if(decorations && this == guiApp.desktop)
            clip = { 0, 0, guiApp.virtualScreen.w, guiApp.virtualScreen.h };

         if(display && display.flags.flipping)
         {
            rootWindow.Update(null);
            rootWindow.UpdateDisplay();
         }

         if(!display)
         {
            Window window { };
            window.Create();
            result = window.display.displaySystem.driver.GrabScreen(null, bitmap, clip.left, clip.top,
               clip.right - clip.left + 1, clip.bottom - clip.top + 1);
            delete window;
         }
         else
            result = display.Grab(bitmap, clip.left, clip.top,
               clip.right - clip.left + 1, clip.bottom - clip.top + 1);

         if(bitmap.pixelFormat != pixelFormat888 && bitmap.pixelFormat != pixelFormat8)
         {
            if(!bitmap.Convert(null, pixelFormat888, null))
               result = false;
         }
      }
      return result;
   }

   void GetMousePosition(int * x, int * y)
   {
      int mouseX = 0, mouseY = 0;
      if(!guiApp.acquiredWindow && (guiApp.desktop.active || !guiApp.fullScreenMode))
      {
         if(guiApp.driver)
            guiApp.interfaceDriver.GetMousePosition(&mouseX, &mouseY);
         if(this != guiApp.desktop)
         {
            mouseX -= absPosition.x + clientStart.x;
            mouseY -= absPosition.y + clientStart.y;
         }
      }
      if(x) *x = mouseX;
      if(y) *y = mouseY;
   }

   DialogResult DoModal()
   {
      DialogResult returnCode = 0;
      int terminated = terminateX;
      isModal = true;
      incref this;
      while(!destroyed && guiApp.driver != null)
      {
         if(terminateX != terminated)
         {
            terminated = terminateX;
            guiApp.desktop.Destroy(0);
            if(guiApp.desktop.created)
            {
               terminated = 0;
               //printf("Resetting terminate X to 0\n");
               terminateX = 0;
            }
            break;
         }

         guiApp.UpdateDisplay();
         if(!guiApp.ProcessInput(false))
         {
            guiApp.Cycle(true);
            guiApp.Wait();
         }
         else
            guiApp.Cycle(false);
      }
      returnCode = this.returnCode;
      delete this;
      return returnCode;
   }

   void DoModalStart()
   {
      isModal = true;
      incref this;
   }

   bool DoModalLoop()
   {
      return !destroyed && guiApp.driver != null && terminateX < 2;
   }

   DialogResult DoModalEnd()
   {
      DialogResult returnCode = this.returnCode;
      delete this;
      return returnCode;
   }

   // --- Window manipulation ---
   /*bool GetDisabled()
   {
      bool disabled = this.disabled;
      Window window;
      for(window = this; (window = window.master); )
      {
         if(window.disabled)
         {
            disabled = true;
            break;
         }
      }
      return disabled;
   }*/

   // --- Mouse Manipulation ---
   void GetNCMousePosition(int * x, int * y)
   {
      GetMousePosition(x, y);
      if(x) *x += clientStart.x;
      if(y) *y += clientStart.y;
   }

   // --- Carets manipulation ---
   void GetCaretPosition(Point caretPos)
   {
      caretPos = this.caretPos;
   }

   int GetCaretSize(void)
   {
      return caretSize;
   }

   bool ButtonCloseDialog(Button button, int x, int y, Modifiers mods)
   {
      Destroy(button.id);
      return true;
   }

   bool CloseConfirmation(bool parentClosing)
   {
      bool result = true;
      OldLink slave;
      Window child;

      if(closing)
         return false;
      if(terminateX > 1 || destroyed)
         return true;

      closing = true;

      if(!OnClose(parentClosing))
         result = false;

      // If you want to skip this, simply set modifiedDocument to false in OnClose
      if(result && (/*fileName || */style.isDocument) && modifiedDocument)
      {
         DialogResult dialogRes;
         char message[1024];
         if(fileName)
            sprintf(message, $"Save changes to %s?", fileName);
         else
            sprintf(message, $"Save changes to Untitled %d?", documentID);

         dialogRes = MessageBox { master = master, type = yesNoCancel, text = parent.caption ? parent.caption : rootWindow.caption, contents = message }.Modal();

         if(dialogRes == yes)
         {
            // TOFIX: Precomp error if brackets are taken out
            result = (DialogResult)MenuFileSave(null, 0) != cancel;
         }
         else if(dialogRes == cancel)
            result = false;
      }

      if(result)
      {
         for(slave = slaves.first; slave; slave = slave.next)
         {
            Window w = slave.data;
            if(w.parent != this && !w.IsDescendantOf(this) && !w.CloseConfirmation(true))
            {
               result = false;
               break;
            }
         }
      }

      // Confirm closure of active clients first (We use OnClose() to hide instead of destroy in the IDE)
      if(result)
      {
         for(child = children.first; child; child = child.next)
            if(child.isActiveClient && !child.CloseConfirmation(true))
            {
               result = false;
               break;
            }
      }
      if(result)
      {
         for(child = children.first; child; child = child.next)
            if(!child.isActiveClient && !child.CloseConfirmation(true))
            {
               result = false;
               break;
            }
      }
      closing = false;
      return result;
   }

   // Static methods... move them somewhere else?
   void ::RestoreCaret()
   {
      if(guiApp.caretOwner)
         guiApp.caretOwner.UpdateCaret(false, false);
   }

   void ::FreeMouseRange()
   {
      guiApp.interfaceDriver.SetMouseRange(null, null);
   }

   // Menu Methods
   bool MenuFileClose(MenuItem selection, Modifiers mods)
   {
      Window document = activeChild;
      if(document)
         document.Destroy(0);
      return true;
   }

   bool MenuFileExit(MenuItem selection, Modifiers mods)
   {
      Destroy(0);
      return true;
   }

   bool MenuFileSave(MenuItem selection, Modifiers mods)
   {
      SetupFileMonitor();
      if(fileName)
      {
#if !defined(__EMSCRIPTEN__)
         fileMonitor.fileName = null;
#endif
         saving = true;

         if(OnSaveFile(fileName))
         {
            //if(OnFileModified != Window::OnFileModified)
            {
               saving = false;
#if !defined(__EMSCRIPTEN__)
               fileMonitor.fileName = fileName;
#endif
            }
            return true;
         }
         else
         {
            MessageBox dialog { master = master, type = yesNoCancel, text = $"Error writing file", contents = $"Save as a different file?" };
            DialogResult answer = dialog.Modal();
            saving = false;
            if(answer != yes) return (bool)answer;
         }
      }
      return MenuFileSaveAs(selection, mods);
   }

   bool MenuFileSaveAs(MenuItem selection, Modifiers mods)
   {
      DialogResult result = (DialogResult)bool::true;
      FileDialog fileDialog = saveDialog;

      SetupFileMonitor();

      if(!fileDialog)
         fileDialog = FileDialog {};
      if(fileDialog)
      {
         incref fileDialog;
         if(fileName)
            fileDialog.filePath = fileName;
         else
         {
            char filePath[MAX_FILENAME];
            sprintf(filePath, "Untitled %d", documentID);
            fileDialog.filePath = filePath;
         }
#if !defined(__EMSCRIPTEN__)
         fileMonitor.fileName = null;
#endif

         fileDialog.type = save;
         fileDialog.text = $"Save As";

         while(true)
         {
            fileDialog.master = master.parent ? master : this;
            if(fileDialog.Modal() == ok)
            {
               const char * filePath = fileDialog.filePath;
               saving = true;
               if(OnSaveFile(filePath))
               {
                  saving = false;
                  property::fileName = filePath;
                  NotifySaved(master, this, filePath);
                  break;
               }
               else
               {
                  MessageBox dialog { master = master.parent ? master : this, type = yesNoCancel, text = $"Error writing file", contents = $"Save as a different file?" };
                  DialogResult answer = dialog.Modal();
                  saving = false;
                  if(answer != yes)
                  {
                     result = answer;
                     break;
                  }
               }
            }
            else
            {
               result = cancel;
               break;
            }
         }
#if !defined(__EMSCRIPTEN__)
         //if(OnFileModified != Window::OnFileModified && fileName)
         {
            if(fileName)
               fileMonitor.fileName = fileName;
         }
#endif
         delete fileDialog;
      }
      return (bool)result; // Actually returning result from Yes/NoCancel message box
   }

   bool MenuFileSaveAll(MenuItem selection, Modifiers mods)
   {
      Window document = activeChild;
      Window next;
      for(document = children.first; document; document = next)
      {
         next = document.next;
         if(document.style.isDocument || document.fileName)
            document.MenuFileSave(selection, mods);
      }
      return true;
   }

   bool MenuWindowArrangeIcons(MenuItem selection, Modifiers mods)
   {
      Window document;

      for(document = children.first; document; document = document.next)
         //if(document.style.isDocument && document.state == minimized)
         if(document.style.isActiveClient && document.state == minimized)
            document.SetState(minimized, false, mods);
      return true;
   }

   bool MenuWindowCascade(MenuItem selection, Modifiers mods)
   {
      Window document = activeChild;
      if(document)
      {
         Window firstDocument = null;
         Window child;
         OldLink cycle = document.cycle.prev;
         int id = 0;
         while(true)
         {
            child = cycle.data;
            if(child.style.isActiveClient && !child.style.hidden)
            {
               Window last;

               firstDocument = child;
               if(child.state == minimized)
                  child.SetState(minimized, false, mods);
               else
               {
                  child.positionID = id++;
                  child.SetState(normal, false, mods);
                  child.anchor.left.type = cascade;
                  {
                     int x, y, w, h;
                     child.normalSizeAnchor = *&child.sizeAnchor;
                     child.normalAnchor = child.anchor;

                     // Break the anchors for moveable/resizable windows
                     if(child.style.fixed)
                     {
                        child.ComputeAnchors(child.anchor, *&child.sizeAnchor, &x, &y, &w, &h);

                        (*&child.normalAnchor).left = x;
                        (*&child.normalAnchor).top = y;
                        (*&child.normalAnchor).right.type = none;
                        (*&child.normalAnchor).bottom.type = none;
                        (*&child.normalSizeAnchor).isClientW = false;
                        (*&child.normalSizeAnchor).isClientH = false;
                        (*&child.normalSizeAnchor).size.w = w;
                        (*&child.normalSizeAnchor).size.h = h;
                        child.anchored = false;
                     }

                     if(child.state == normal /*|| child.state == Hidden */)   // Hidden is new here ...
                     {
                        child.stateAnchor = child.normalAnchor;
                        child.stateSizeAnchor = child.normalSizeAnchor;

                        child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor, &x, &y, &w, &h);
                        child.Position(x, y, w, h, true, true, true, true, false, false);
                     }
                  }
               }

               last = children.last;
               if(!child.style.stayOnTop)
                  for(; last && last.style.stayOnTop; last = last.prev);
               children.Move(child, last);
               childrenOrder.Move(child.order, childrenOrder.last);
            }
            if(cycle == document.cycle) break;
            cycle = cycle.prev;
         }
         if(firstDocument)
            firstDocument.Activate();
      }
      return true;
   }

   bool MenuWindowClose(MenuItem selection, Modifiers mods)
   {
      if(style.hasClose)
         Destroy(0);
      return true;
   }

   // Close all closes all active clients, not all documents
   bool MenuWindowCloseAll(MenuItem selection, Modifiers mods)
   {
      Window next, document;

      for(document = children.first; document; document = next)
      {
         for(next = document.next; next && !next.style.isActiveClient; next = next.next);
         if(document.style.isActiveClient)
            if(!document.Destroy(0) && !document.style.hidden)
               return false;
      }
      return true;
   }

   bool MenuWindowMaximize(MenuItem selection, Modifiers mods)
   {
      if(style.hasMaximize && state != maximized)
         SetState(maximized, 0, 0);
      return true;
   }

   bool MenuWindowMinimize(MenuItem selection, Modifiers mods)
   {
      if(style.hasMinimize && state != minimized)
      {
         SetState(minimized, 0, 0);
         parent.CycleChildren(false, true, false, true);
      }
      return true;
   }

   bool MenuWindowMove(MenuItem selection, Modifiers mods)
   {
      MenuMoveOrSize(false, selection ? true : false);
      return true;
   }

   bool MenuWindowNext(MenuItem selection, Modifiers mods)
   {
      CycleChildren(false, true, false, true);
      return true;
   }

   bool MenuWindowPrevious(MenuItem selection, Modifiers mods)
   {
      CycleChildren(true, true, false, true);
      return true;
   }

   bool MenuWindowSize(MenuItem selection, Modifiers mods)
   {
      MenuMoveOrSize(true, true);
      return true;
   }

   bool MenuWindowRestore(MenuItem selection, Modifiers mods)
   {
      if(state != normal)
         SetState(normal, 0, 0);
      return true;
   }

   bool MenuWindowSelectWindow(MenuItem selection, Modifiers mods)
   {
      Window document;
      int64 id = selection.id;
      OldLink cycle = activeClient.cycle;
      int c = 0;
      //for(c = 0, cycle = activeChild.cycle; c<id; cycle = cycle.next, c++);
      while(true)
      {
         Window sibling = cycle.data;
         if(sibling.style.isActiveClient && sibling.visible && !sibling.style.nonClient)
         {
            if(c == id)
               break;
            c++;
         }
         cycle = cycle.next;
      }
      document = cycle.data;
      document.Activate();

      //if(activeChild.state == maximized)
      //  document.SetState(maximized, false, mods);
      //else if(document.state == minimized)
      //   document.SetState(normal, false, mods);
      return true;
   }

   bool MenuWindowStayOnTop(MenuItem selection, Modifiers mods)
   {
      stayOnTop = !style.stayOnTop;
      return true;
   }

   bool MenuWindowTileHorz(MenuItem selection, Modifiers mods)
   {
      Window document = activeChild;
      if(document)
      {
         Window firstDocument = null;
         OldLink cycle = document.cycle;
         int id = 0;
         while(true)
         {
            Window child = cycle.data;
            if(child.style.isActiveClient && !child.style.hidden)
            {
               if(!firstDocument) firstDocument = child;
               if(child.state == minimized)
                  child.SetState(minimized, false, mods);
               else
               {
                  child.positionID = id++;
                  child.SetState(normal, false, mods);
                  child.ActivateEx(true, false, false, false, null, null);   // To move active clients on top of other windows

                  child.anchor.left.type = hTiled;
                  {
                     int x, y, w, h;
                     child.normalSizeAnchor = *&child.sizeAnchor;
                     child.normalAnchor = child.anchor;

                     // Break the anchors for moveable/resizable windows
                     if(child.style.fixed)
                     {
                        child.ComputeAnchors(child.anchor, *&child.sizeAnchor, &x, &y, &w, &h);

                        (*&child.normalAnchor).left = x;
                        (*&child.normalAnchor).top = y;
                        (*&child.normalAnchor).right.type = none;
                        (*&child.normalAnchor).bottom.type = none;
                        (*&child.normalSizeAnchor).isClientW = false;
                        (*&child.normalSizeAnchor).isClientH = false;
                        (*&child.normalSizeAnchor).size.w = w;
                        (*&child.normalSizeAnchor).size.h = h;
                        child.anchored = false;
                     }

                     if(child.state == normal /*|| child.state == Hidden */)   // Hidden is new here ...
                     {
                        child.stateAnchor = child.normalAnchor;
                        child.stateSizeAnchor = child.normalSizeAnchor;

                        child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor, &x, &y, &w, &h);
                        child.Position(x,y, w, h, true, true, true, true, false, true);
                     }
                  }
               }
            }
            if((cycle = cycle.next) == document.cycle) break;
         }
         if(firstDocument)
            firstDocument.Activate();
      }
      return true;
   }

   bool MenuWindowTileVert(MenuItem selection, Modifiers mods)
   {
      Window document = activeChild;
      if(document)
      {
         Window firstDocument = null;
         Window child;
         OldLink cycle = document.cycle;
         int id = 0;
         while(true)
         {
            child = cycle.data;
            //if(child.style.isDocument)
            if(child.style.isActiveClient && !child.style.hidden)
            {
               if(!firstDocument) firstDocument = child;
               if(child.state == minimized)
                  child.SetState(minimized, false, mods);
               else
               {
                  child.positionID = id++;
                  child.SetState(normal, false, mods);
                  child.ActivateEx(true, false, false, false, null, null);   // To move active clients on top of other windows

                  child.anchor.left.type = vTiled;
                  {
                     int x, y, w, h;
                     child.normalSizeAnchor = *&child.sizeAnchor;
                     child.normalAnchor = child.anchor;

                     // Break the anchors for moveable/resizable windows
                     if(child.style.fixed)
                     {
                        child.ComputeAnchors(child.anchor, *&child.sizeAnchor, &x, &y, &w, &h);

                        (*&child.normalAnchor).left = x;
                        (*&child.normalAnchor).top = y;
                        (*&child.normalAnchor).right.type = none;
                        (*&child.normalAnchor).bottom.type = none;
                        (*&child.normalSizeAnchor).isClientW = false;
                        (*&child.normalSizeAnchor).isClientH = false;
                        (*&child.normalSizeAnchor).size.w = w;
                        (*&child.normalSizeAnchor).size.h = h;
                        child.anchored = false;
                     }

                     if(child.state == normal /*|| child.state == Hidden */)   // Hidden is new here ...
                     {
                        child.stateAnchor = child.normalAnchor;
                        child.stateSizeAnchor = child.normalSizeAnchor;

                        child.ComputeAnchors(child.stateAnchor, child.stateSizeAnchor, &x, &y, &w, &h);
                        child.Position(x,y, w, h, true, true, true, true, false, true);
                     }
                  }
               }
            }
            if((cycle = cycle.next) == document.cycle) break;
         }
         if(firstDocument)
            firstDocument.Activate();
      }
      return true;
   }

   bool MenuWindowWindows(MenuItem selection, Modifiers mods)
   {
      WindowList
      {
         master = this; isModal = true;

         void NotifyDestroyed(Window window, DialogResult result)
         {
            Window document = (Window)(intptr)result;
            if(document)
            {
               if(activeChild.state == maximized)
                  document.SetState(maximized, false, 0);
               else if(document.state == minimized)
                  document.SetState(normal, false, 0);
               document.Activate();
            }
         }
      }.Create();
      return true;
   }

   // Virtual Methods
   virtual bool OnCreate(void);
   virtual void OnDestroy(void);
   virtual void OnDestroyed(void);
   virtual bool OnClose(bool parentClosing);
   virtual bool OnStateChange(WindowState state, Modifiers mods);
   virtual bool OnPostCreate(void);
   virtual bool OnMoving(int *x, int *y, int w, int h);
   virtual bool OnResizing(int *width, int *height);
   virtual void OnResize(int width, int height);
   virtual void OnPosition(int x, int y, int width, int height);
   virtual bool OnLoadGraphics(void);
   virtual void OnApplyGraphics(void);
   virtual void OnUnloadGraphics(void);
   virtual void OnRedraw(Surface surface);
   virtual bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct);
   virtual void OnActivateClient(Window client, Window previous);
   virtual bool OnKeyDown(Key key, unichar ch);
   virtual bool OnKeyUp(Key key, unichar ch);
   virtual bool OnKeyHit(Key key, unichar ch);
   virtual bool OnSysKeyDown(Key key, unichar ch);
   virtual bool OnSysKeyUp(Key key, unichar ch);
   virtual bool OnSysKeyHit(Key key, unichar ch);
   virtual bool OnMouseOver(int x, int y, Modifiers mods);
   virtual bool OnMouseLeave(Modifiers mods);
   virtual bool OnMouseMove(int x, int y, Modifiers mods);
   virtual bool OnLeftButtonDown(int x, int y, Modifiers mods);
   virtual bool OnLeftButtonUp(int x, int y, Modifiers mods);
   virtual bool OnLeftDoubleClick(int x, int y, Modifiers mods);
   virtual bool OnRightButtonDown(int x, int y, Modifiers mods);
   virtual bool OnRightButtonUp(int x, int y, Modifiers mods);
   virtual bool OnRightDoubleClick(int x, int y, Modifiers mods);
   virtual bool OnMiddleButtonDown(int x, int y, Modifiers mods);
   virtual bool OnMiddleButtonUp(int x, int y, Modifiers mods);
   virtual bool OnMiddleDoubleClick(int x, int y, Modifiers mods);
   virtual bool OnMultiTouch(TouchPointerEvent event, Array<TouchPointerInfo> infos, Modifiers mods);
   virtual void OnMouseCaptureLost(void);
   virtual void OnHScroll(ScrollBarAction action, int position, Key key);
   virtual void OnVScroll(ScrollBarAction action, int position, Key key);
   virtual void OnDrawOverChildren(Surface surface);
   virtual bool OnFileModified(FileChange fileChange, const char * param);
   virtual bool OnSaveFile(const char * fileName);

   // Virtual Methods -- Children management (To support Stacker, for lack of built-in auto-layout)
   // Note: A 'client' would refer to isActiveClient, rather than
   // being confined to the 'client area' (nonClient == false)
   virtual void OnChildAddedOrRemoved(Window child, bool removed);
   virtual void OnChildVisibilityToggled(Window child, bool visible);
   virtual void OnChildResized(Window child, int x, int y, int w, int h);

   // Skins Virtual Functions
   virtual void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h) { *w = 0, *h = 0; }
   virtual void SetWindowMinimum(MinMaxValue * mw, MinMaxValue * mh) { *mw = 0, *mh = 0; }
   virtual void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      *x = 0, *y = 0;
      *cw = *w;
      *ch = *h;
   }
   virtual void ShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving);
   virtual void PreShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving);
   virtual bool IsMouseMoving(int x, int y, int w, int h)
   {
      return false;
   }
   virtual bool IsMouseResizing(int x, int y, int w, int h, bool *resizeX, bool *resizeY, bool *resizeEndX, bool *resizeEndY)
   {
      return false;
   }
   virtual void UpdateNonClient();
   virtual void SetBox(Box box);    // This is used in the MySkin skin
   virtual bool IsInside(int x, int y)
   {
      return box.IsPointInside({x, y});
   }
   virtual bool IsOpaque()
   {
      return (!style.drawBehind || background.a == 255);
   }

   // Notifications
   virtual bool Window::NotifyActivate(Window window, bool active, Window previous);
   virtual void Window::NotifyDestroyed(Window window, DialogResult result);
   virtual void Window::NotifySaved(Window window, const char * filePath);

   // Public Methods

   // Properties
   property Window parent
   {
      property_category $"Layout"
      set
      {
         if(value || guiApp.desktop)
         {
            Window last;
            Window oldParent = parent;
            Anchor anchor = this.anchor;

            if(value && value.IsDescendantOf(this)) return;
            if(value && value == this)
               return;
            if(!value) value = guiApp.desktop;

            if(value == oldParent) return;

            if(!master || (master == this.parent && master == guiApp.desktop))
               property::master = value;

            if(parent)
            {
               parent.children.Remove(this);

               parent.Update(
               {
                  box.left - absPosition.x + parent.absPosition.x + style.nonClient * parent.clientStart.x,
                  box.top - absPosition.y + parent.absPosition.y + style.nonClient * parent.clientStart.y,
                  box.right - absPosition.x + parent.absPosition.x + style.nonClient * parent.clientStart.x,
                  box.bottom - absPosition.y + parent.absPosition.y + style.nonClient * parent.clientStart.y
               });
            }

            last = value.children.last;

            if(style.isDocument)
            {
               if(parent)
                  parent.numDocuments--;
               documentID = value.GetDocumentID();
            }

            if(style.isActiveClient && !style.hidden)
            {
               if(parent && parent != guiApp.desktop && !(style.hidden))
               {
                  if(state == minimized) parent.numIcons--;
                  parent.numPositions--;
               }
            }

            if(!style.stayOnTop)
               for(; last && last.style.stayOnTop; last = last.prev);

            value.children.Insert(last, this);

            // *** NEW HERE: ***
            if(cycle)
               parent.childrenCycle.Delete(cycle);
            if(order)
               parent.childrenOrder.Delete(order);
            cycle = null;
            order = null;
            // *** TODO: Added this here to solve crash on setting parent to null before destroying/destructing ***
            //           Should something else be done?
            if(parent && parent.activeChild == this)
               parent.activeChild = null;
            if(parent && parent.activeClient == this)
               parent.activeClient = null;

            //if(created)
            {
               if(created)
               {
                  int x = position.x, y = position.y, w = size.w, h = size.h;

                  int vpw, vph;

                  x += parent.absPosition.x - value.absPosition.x + parent.clientStart.x - value.clientStart.x;
                  y += parent.absPosition.y - value.absPosition.y + parent.clientStart.y - value.clientStart.y;

                  vpw = value.clientSize.w;
                  vph = value.clientSize.h;
                  if(style.nonClient)
                  {
                     vpw = value.size.w;
                     vph = value.size.h;
                  }
                  else if(style.fixed)
                  {
                     if(!style.dontScrollHorz && value.scrollArea.w) vpw = value.scrollArea.w;
                     if(!style.dontScrollVert && value.scrollArea.h) vph = value.scrollArea.h;
                  }

                  anchor = this.anchor;

                  if(anchor.left.type == offset)            anchor.left.distance = x;
                  else if(anchor.left.type == relative)     anchor.left.percent = (float)x / vpw;
                  if(anchor.top.type == offset)             anchor.top.distance = y;
                  else if(anchor.top.type == relative)      anchor.top.percent = (float)y / vph;
                  if(anchor.right.type == offset)           anchor.right.distance = vpw - (x + w);
                  //else if(anchor.right.type == relative)  anchor.right.percent = 1.0-(float) (vpw - (x + w)) / vpw;
                  else if(anchor.right.type == relative)    anchor.right.percent = (float) (vpw - (x + w)) / vpw;
                  if(anchor.bottom.type == offset)          anchor.bottom.distance = vph - (y + h);
                  //else if(anchor.bottom.type == relative) anchor.bottom.percent = 1.0-(float) (vph - (y + h)) / vph;
                  else if(anchor.bottom.type == relative)   anchor.bottom.percent = (float) (vph - (y + h)) / vph;

                  if(!anchor.left.type && !anchor.right.type)
                  {
                     anchor.horz.distance = (x + w / 2) - (vpw / 2);
                     //anchor.horz.type = anchor.horz.distance ? AnchorValueOffset : 0;
                  }
                  else if(anchor.horz.type == middleRelative) anchor.horz.percent = (float) ((x + w / 2) - (vpw / 2)) / vpw;
                  if(!anchor.top.type && !anchor.bottom.type)
                  {
                     anchor.vert.distance = (y + h / 2) - (vph / 2);
                     //anchor.vert.type = anchor.vert.distance ? AnchorValueOffset : 0;
                  }
                  else if(anchor.vert.type == middleRelative) anchor.vert.percent = (float)((y + h / 2) - (vph / 2)) / vph;
               }
               parent = value;
               parent.OnChildAddedOrRemoved(this, false);

               // *** NEW HERE ***
               if(!style.inactive)
               {
                  if(!style.noCycle)
                     parent.childrenCycle.Insert(
                        // Note: changed to 'null' to fix broken tab cycling in WSMS custom reports
                        //(parent.activeChild && parent.activeChild.cycle) ? parent.activeChild.cycle.prev : null,
                        null,
                        cycle = OldLink { data = this });
                  parent.childrenOrder.Insert(
                     (parent.activeChild && parent.activeChild.order) ? parent.activeChild.order.prev : parent.childrenOrder.last,
                     order = OldLink { data = this });
               }

               if(!style.hidden && style.isActiveClient)
               {
                  positionID = parent.GetPositionID(this);
                  parent.numPositions++;
                  if(state == minimized) parent.numIcons--;
               }

               // *** FONT INHERITANCE ***
               if(!setFont && oldParent)
                  stopwatching(oldParent, font);

               if(systemFont)
               {
                  RemoveResource(systemFont);
                  delete systemFont;
               }
               // TESTING WITH WATCHERS:
               usedFont = setFont ? setFont : (parent.parent ? parent.usedFont : systemFont);
               // usedFont = setFont ? setFont : (systemFont);

               if(!usedFont)
               {
                  if(guiApp.currentSkin)
                  {
                     systemFont = guiApp.currentSkin.SystemFont();
                     incref systemFont;
                  }
                  usedFont = systemFont;
                  AddResource(systemFont);
               }

               if(!setFont)
                  watch(value)
                  {
                     font
                     {
                        usedFont = setFont ? setFont : (parent.parent ? parent.usedFont : systemFont);
                        firewatchers font;
                        Update(null);
                     }
                  };

               firewatchers font;


               if(value.rootWindow && value.rootWindow.display && rootWindow && created)
               {
                  bool reloadGraphics = (oldParent.rootWindow == oldParent && value.rootWindow) || (!value.rootWindow && rootWindow == this) ||
                        (value.rootWindow.display && value.rootWindow.display.displaySystem != rootWindow.display.displaySystem);

                  if(reloadGraphics)
                     UnloadGraphics(false);
                  SetupDisplay();
                  if(reloadGraphics)
                     LoadGraphics(false, false);

                  /*
                  if(value.rootWindow != rootWindow)
                     DisplayModeChanged();
                  else
                  */
               }
               scrolledPos.x = MININT; // Prevent parent update
               {
                  bool anchored = this.anchored;
                  property::anchor = anchor;
                  this.anchored = anchored;
               }
               /*
               {
                  int x, y, w, h;
                  if(guiApp.currentSkin)
                     guiApp.currentSkin.SetWindowMinimum(this, &skinMinSize.w, &skinMinSize.h);

                  ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
                  Position(x, y, w, h, true, true, true, true, false, true);
               }
               */

            }
            // else parent = value;
            if(oldParent)
               oldParent.OnChildAddedOrRemoved(this, true);
         }
      }
      get { return parent; }
   };

   property Window master
   {
      property_category $"Behavior"
      set
      {
         //if(this == value) return;
         if(value && value.IsSlaveOf(this)) return;

         if(master != value)
         {
            if(master)
            {
               OldLink slaveHolder;
               for(slaveHolder = master.slaves.first; slaveHolder; slaveHolder = slaveHolder.next)
                  if(slaveHolder.data == this)
                  {
                     master.slaves.Delete(slaveHolder);
                     break;
                  }
            }

            if(value)
            {
               value.slaves.Add(OldLink { data = this });

               if(hotKey)
               {
                  if(master)
                     master.hotKeys.Remove(hotKey);
                  value.hotKeys.Add(hotKey);
                  hotKey = null;
               }
               if(master && master.defaultControl == this)
                  master.defaultControl = null;

               if(style.isDefault && !value.defaultControl)
                  value.defaultControl = this;
            }
         }
         master = value;
      }
      get { return master ? master : parent; }
   };

   property const char * caption
   {
      property_category $"Appearance"
      watchable
      set
      {
         delete caption;
         if(value)
         {
            caption = new char[strlen(value)+1];
            if(caption)
               strcpy(caption, value);
         }
         if(created)
            UpdateCaption();
      }
      get { return caption; }
   };

   property Key hotKey
   {
      property_category $"Behavior"
      set
      {
         setHotKey = value;
         if(created)
         {
            if(value)
            {
               if(!hotKey)
                  master.hotKeys.Add(hotKey = HotKeySlot { });
               if(hotKey)
               {
                  hotKey.key = value;
                  hotKey.window = this;
               }
            }
            else if(hotKey)
            {
               master.hotKeys.Delete(hotKey);
               hotKey = null;
            }
         }
      }
      get { return hotKey ? hotKey.key : 0; }
   };

   property Color background
   {
      property_category $"Appearance"
      set
      {
         background.color = value;
         firewatchers;
         if(created)
         {
            Update(null);
            if(this == rootWindow)
               guiApp.interfaceDriver.SetRootWindowColor(this);
         }
      }
      get { return background.color; }
   };

   property Percentage opacity
   {
      property_category $"Appearance"
      set
      {
         background.a = (byte)Min(Max((int)(value * 255), 0), 255);
         drawBehind = (background.a == 255) ? false : true;
      }
      get { return background.a / 255.0f; }
   };

   property Color foreground
   {
      property_category $"Appearance"
      set
      {
         foreground = value;
         firewatchers;
         if(created)
            Update(null);
      }
      get { return foreground; }
   };

   property BorderStyle borderStyle
   {
      property_category $"Appearance"
      set
      {
         if(!((BorderBits)value).fixed)
         {
            style.hasClose = false;
            style.hasMaximize = false;
            style.hasMinimize = false;
            nativeDecorations = false;
         }
         style.borderBits = value;
         if(created)
         {
            int x, y, w, h;
            SetWindowMinimum(&skinMinSize.w, &skinMinSize.h);

            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x, y, w, h, true, true, true, true, false, true);
            CreateSystemChildren();
         }
      }
      get { return (BorderStyle)style.borderBits; }
   };

   property Size minClientSize
   {
      property_category $"Layout"
      set { minSize = value; }
      get { value = minSize; }
   };

   property Size maxClientSize
   {
      property_category $"Layout"
      set { maxSize = value; }
      get { value = maxSize; }
   };

   property bool hasMaximize
   {
      property_category $"Window Style"
      set
      {
         style.hasMaximize = value;
         if(value) { style.fixed = true; style.contour = true; }
         if(created)
         {
            int x, y, w, h;
            SetWindowMinimum(&skinMinSize.w, &skinMinSize.h);

            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x, y, w, h, true, true, true, true, false, true);

            CreateSystemChildren();
         }
      }
      get { return style.hasMaximize; }
   };

   property bool hasMinimize
   {
      property_category $"Window Style"
      set
      {
         style.hasMinimize = value;
         if(value) { style.fixed = true; style.contour = true; }
         if(created)
         {
            int x, y, w, h;
            SetWindowMinimum(&skinMinSize.w, &skinMinSize.h);

            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x, y, w, h, true, true, true, true, false, true);

            CreateSystemChildren();
         }
      }
      get { return style.hasMinimize;  }
   };

   property bool hasClose
   {
      property_category $"Window Style"
      set
      {
         style.hasClose = value;
         if(value) { style.fixed = true; style.contour = true; }
         if(created)
         {
            int x, y, w, h;
            SetWindowMinimum(&skinMinSize.w, &skinMinSize.h);
            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x, y, w, h, true, true, true, true, false, true);
            CreateSystemChildren();
         }
      }
      get { return style.hasClose; }
   };

   property bool nonClient
   {
      property_category $"Layout"
      set
      {
         style.nonClient = value;
         if(value)
            style.stayOnTop = true;
      }
      get { return style.nonClient; }
   };

   property bool inactive
   {
      property_category $"Behavior"
      set
      {
         if(value)
         {
            // *** NEW HERE: ***
            if(!style.inactive)
            {
               if(cycle)
                  parent.childrenCycle.Delete(cycle);
               if(order)
                  parent.childrenOrder.Delete(order);
               cycle = null;
               order = null;
            }

            if(created)
            {
               active = false; // true;
               if(parent.activeChild == this)
                  parent.activeChild = null;
               if(parent.activeClient == this)
                  parent.activeClient = null;
            }
         }
         else
         {
            if(style.inactive)
            {
               if(!style.noCycle)
               {
                  parent.childrenCycle.Insert(
                     // Note: changed to 'null' to fix broken tab cycling in WSMS custom reports
                     //(parent.activeChild && parent.activeChild.cycle) ? parent.activeChild.cycle.prev : null,
                     null,
                     cycle = OldLink { data = this });
               }
               parent.childrenOrder.Insert(
                  (parent.activeChild && parent.activeChild.order) ? parent.activeChild.order.prev : parent.childrenOrder.last,
                  order = OldLink { data = this });
            }
         }
         style.inactive = value;
      }
      get { return style.inactive; }
   };

   property bool clickThrough
   {
      property_category $"Behavior"
      set { style.clickThrough = value; }
      get { return style.clickThrough; }
   };

   property bool isRemote
   {
      property_category $"Behavior"
      set { style.isRemote = value; }
      get { return style.isRemote; }
   };

   property bool noCycle
   {
      property_category $"Behavior"
      set { style.noCycle = value; }
      get { return style.noCycle; }
   };

   property bool isModal
   {
      property_category $"Behavior"
      set { style.modal = value; }
      get { return style.modal; }
   };

   property bool interim
   {
      property_category $"Behavior"
      set { style.interim = value; }
      get { return style.interim; }
   };

   property bool tabCycle
   {
      property_category $"Behavior"
      set { style.tabCycle = value; }
      get { return style.tabCycle; }
   };

   property bool isDefault
   {
      property_category $"Behavior"
      set
      {
         if(master)
         {
            if(value)
            {
               /*Window sibling;
               for(sibling = parent.children.first; sibling; sibling = sibling.next)
                  if(sibling != this && sibling.style.isDefault)
                     sibling.style.isDefault = false;*/
               if(master.defaultControl)
                  master.defaultControl.style.isDefault = false;
               master.defaultControl = this;
            }
            else if(master.defaultControl == this)
               master.defaultControl = null;

            // Update(null);
         }
         style.isDefault = value;
         if(created)
            Position(position.x, position.y, size.w, size.h, true, true, true,true,true, true);
      }
      get { return style.isDefault; }
   };

   property bool drawBehind
   {
      property_category $"Window Style"
      set { style.drawBehind = value; }
      get { return style.drawBehind; }
   };

   property bool hasMenuBar
   {
      property_category $"Window Style"
      set
      {
         style.hasMenuBar = value;
         if(value)
         {
            if(!menu)
            {
               menu = Menu { };
               incref menu;
            }
            if(created && !menuBar)
            {
               menuBar =
                  PopupMenu
                  {
                     this, menu = menu,
                     isMenuBar = true,
                     anchor = Anchor { top = 23, left = 1, right = 1 },
                     size.h = 24,
                     inactive = true, nonClient = true
                  };
               incref menuBar;
            }
            if(created && !menuBar.created)
            {
               menuBar.Create();
               Position(position.x, position.y, size.w, size.h, false, true, true, true, false, false);
            }
         }
         else if(created && menuBar)
         {
            menuBar.Destroy(0);
            Position(position.x, position.y, size.w, size.h, false, true, true, true, false, false);
         }
      }
      get { return style.hasMenuBar; }
   };

   property bool hasStatusBar
   {
      property_category $"Window Style"
      set
      {
         if(value)
         {
            if(!statusBar)
            {
               statusBar = StatusBar { this };
               incref statusBar;
            }
            if(created)
            {
               statusBar.Create();
               Position(position.x, position.y, size.w, size.h, false, true, true, true, false, false);
            }
         }
         else if(statusBar)
         {
            statusBar.Destroy(0);
            Position(position.x, position.y, size.w, size.h, false, true, true, true, false, false);
         }
         style.hasStatusBar = value;
      }
      get { return style.hasStatusBar; }
   };
   property bool stayOnTop
   {
      property_category $"Window Style"
      set
      {
         if(value)
         {
            if(created && !style.stayOnTop)
            {
               if(rootWindow == this)
                  guiApp.interfaceDriver.OrderRootWindow(this, true);
               else if(parent.children.last != this)
               {
                  parent.children.Move(this, parent.children.last);
                  Update(null);
               }
            }
            style.stayOnTop = true;
         }
         else
         {
            if(created && style.stayOnTop)
            {
               if(rootWindow == this)
                  guiApp.interfaceDriver.OrderRootWindow(this, false);
               else
               {
                  Window last;
                  if(order)
                  {
                     OldLink order;
                     for(order = (this.order == parent.childrenOrder.first) ? null : this.order.prev;
                         order && ((Window)order.data).style.stayOnTop;
                         order = (order == parent.childrenOrder.first) ? null : order.prev);
                      last = order ? order.data : null;
                  }
                  else
                  {
                     for(last = parent.children.last;
                         last && last.style.stayOnTop;
                         last = last.prev);
                  }

                  parent.children.Move(this, last);
                  Update(null);
               }
            }
            style.stayOnTop = false;
         }
      }
      get { return style.stayOnTop; }
   };

   property Menu menu
   {
      property_category $"Window Style"
      set
      {
         delete menu;
         if(value)
         {
            menu = value;
            incref menu;
         }

         if(menuBar && !value)
         {
            menuBar.Destroy(0);
            delete menuBar;
         }
         if(created)
         {
            if(!menuBar && style.hasMenuBar && value)
            {
               menuBar = PopupMenu
                         {
                            this, menu = value, isMenuBar = true,
                            anchor = Anchor { left = 1, top = 23, right = 1 }, size.h = 24,
                            inactive = true, nonClient = true
                         };
               incref menuBar;
               menuBar.Create();
            }
            UpdateActiveDocument(null);
         }
      }
      get { return menu; }
   };

   property FontResource font
   {
      property_category $"Appearance"
      watchable
      isset { return setFont ? true : false; }
      set
      {
         if(this)
         {
            if(value && !setFont) { stopwatching(parent, font); }
            else if(!value && setFont)
            {
               watch(parent)
               {
                  font
                  {
                     usedFont = setFont ? setFont : (parent.parent ? parent.usedFont : systemFont);
                     firewatchers font;
                     Update(null);
                  }
               };
            }

            if(setFont)
            {
               RemoveResource(setFont);
               delete setFont;
            }
            if(systemFont)
            {
               RemoveResource(systemFont);
               delete systemFont;
            }
            setFont = value;
            if(setFont)
            {
               incref setFont;
               AddResource(setFont);
            }

            usedFont = setFont ? setFont : ((parent && parent.parent) ? parent.usedFont : systemFont);
            if(!usedFont)
            {
               systemFont = guiApp.currentSkin.SystemFont();
               incref systemFont;
               usedFont = systemFont;
               AddResource(systemFont);
            }

            firewatchers;

            Update(null);
         }
      }
      get { return usedFont; }
   };

   property SizeAnchor sizeAnchor
   {
      property_category $"Layout"
      isset
      {
         return ((anchor.left.type == none || anchor.left.type == middleRelative || anchor.right.type == none) ||
                (anchor.top.type == none || anchor.top.type == middleRelative || anchor.bottom.type == none)) &&
            sizeAnchor.isClientW != sizeAnchor.isClientH;
      }
      set
      {
         int x, y, w, h;
         sizeAnchor = value;

         normalSizeAnchor = sizeAnchor;

         if(state == normal /*|| state == Hidden */)   // Hidden is new here ...
         {
            stateAnchor = normalAnchor;
            stateSizeAnchor = normalSizeAnchor;

            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x,y, w, h, true, true, true, true, false, true);
         }
      }
      get
      {
         value =
         {
            { sizeAnchor.isClientW ? clientSize.w : size.w, sizeAnchor.isClientH ? clientSize.h : size.h },
            sizeAnchor.isClientW,
            sizeAnchor.isClientH
         };
      }
   };

   property Size size
   {
      property_category $"Layout"
      isset
      {
         return ((anchor.left.type == none || anchor.left.type == middleRelative || anchor.right.type == none) ||
                (anchor.top.type == none || anchor.top.type == middleRelative || anchor.bottom.type == none)) &&
            !sizeAnchor.isClientW && !sizeAnchor.isClientH && sizeAnchor.size.w && sizeAnchor.size.h;
      }
      set
      {
         int x, y, w, h;

         sizeAnchor.isClientW = false;
         sizeAnchor.isClientH = false;
         sizeAnchor.size = value;

         normalSizeAnchor = sizeAnchor;

         if(state == normal /*|| state == Hidden*/)   // Hidden is new here ...
         {
            stateAnchor = normalAnchor;
            stateSizeAnchor = normalSizeAnchor;

            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x, y, w, h, true, true, true, true, false, true);
            if(parent && parent.created && !nonClient) parent.OnChildResized(this, x, y, w, h);
         }
      }
      get { value = size; }
   };

   property Size clientSize
   {
      property_category $"Layout"
      isset
      {
         return ((anchor.left.type == none || anchor.left.type == middleRelative || anchor.right.type == none) ||
                (anchor.top.type == none || anchor.top.type == middleRelative || anchor.bottom.type == none)) &&
            sizeAnchor.isClientW && sizeAnchor.isClientH && sizeAnchor.size.w && sizeAnchor.size.h;
      }
      set
      {
         int x, y, w, h;
         sizeAnchor.isClientW = true;
         sizeAnchor.isClientH = true;
         sizeAnchor.size = value;

         normalSizeAnchor = sizeAnchor;

         if(state == normal /*|| state == Hidden */)   // Hidden is new here ...
         {
            stateAnchor = normalAnchor;
            stateSizeAnchor = normalSizeAnchor;

            ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
            Position(x,y, w, h, true, true, true, true, false, true);
            if(parent && parent.created && !nonClient) parent.OnChildResized(this, x, y, w, h);
         }
      }
      get { value = this ? clientSize : { 0, 0 }; }
   };

   property Size initSize { get { value = sizeAnchor.size; } };

   property Anchor anchor
   {
      property_category $"Layout"
      isset { return (anchor.left.type != offset || anchor.top.type != offset || anchor.right.type || anchor.bottom.type); }

      set
      {
         if(value != null)
         {
            if(anchor.left.type && anchor.right.type && (!value.left.type || !value.right.type))
            {
               normalSizeAnchor.isClientW = sizeAnchor.isClientW = false;
               normalSizeAnchor.size.w = sizeAnchor.size.w = size.w;
            }
            if(anchor.top.type && anchor.bottom.type && (!value.top.type || !value.bottom.type))
            {
               normalSizeAnchor.isClientH = sizeAnchor.isClientH = false;
               normalSizeAnchor.size.h = sizeAnchor.size.h = size.h;
            }
            anchor = value;

            if(anchor.right.type && (anchor.horz.type == middleRelative || !anchor.left.type))
            {
               anchor.left.distance = 0;
               anchor.horz.type = 0;
            }
            if(anchor.bottom.type && (anchor.vert.type == middleRelative || !anchor.top.type))
            {
               anchor.top.distance = 0;
               anchor.vert.type = 0;
            }

            anchored = true;

            //if(created)
            {
               int x, y, w, h;

               normalAnchor = anchor;

               // Break the anchors for moveable/resizable windows
               /*if(style.fixed ) //&& value.left.type == cascade)
               {
                  ComputeAnchors(anchor, sizeAnchor, &x, &y, &w, &h);

                  this.anchor = normalAnchor = Anchor { left = x, top = y };
                  normalSizeAnchor = SizeAnchor { { w, h } };
                  anchored = false;
               }*/
               if(state == normal /*|| state == Hidden */)   // Hidden is new here ...
               {
                  stateAnchor = normalAnchor;
                  stateSizeAnchor = normalSizeAnchor;

                  ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
                  Position(x, y, w, h, true, true, true, true, false, true);
               }
            }
         }
         else
         {
            anchored = false;
         }
      }
      get { value = this ? anchor : Anchor { }; }
   };

   property Point position
   {
      property_category $"Layout"
      set
      {
         if(value == null) return;

         anchor.left = value.x;
         anchor.top  = value.y;
         anchor.right.type = none;
         anchor.bottom.type = none;
         //if(created)
         {
            int x, y, w, h;

            normalAnchor = anchor;

            // Break the anchors for moveable/resizable windows
            /*
            if(style.fixed)
            {
               ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);

               normalAnchor.left = x;
               normalAnchor.top = y;
               normalAnchor.right.type = none;
               normalAnchor.bottom.type = none;
               normalSizeAnchor.size.width = w;
               normalSizeAnchor.size.height = h;
               anchored = false;
            }
            */
            if(state == normal /*|| state == Hidden */)   // Hidden is new here ...
            {
               stateAnchor = normalAnchor;
               stateSizeAnchor = normalSizeAnchor;

               ComputeAnchors(stateAnchor, stateSizeAnchor, &x, &y, &w, &h);
               Position(x,y, w, h, true, true, true, true, false, true);
            }
         }
      }
      get { value = position; }
   };

   property bool disabled
   {
      property_category $"Behavior"
      set
      {
         if(this && disabled != value)
         {
            disabled = value;
            if(created)
               Update(null);
         }
      }
      get { return (bool)disabled; }
   };

   property bool isEnabled
   {
      get
      {
         Window parent;
         for(parent = this; parent; parent = parent.parent)
            if(parent.disabled)
               return false;
         return true;
      }
   };

   property WindowState state
   {
      property_category $"Behavior"
      set { SetState(value, false, 0); }
      get { return this ? state : 0; }
   };

   property bool visible
   {
      property_category $"Behavior"
      set
      {
         if(this && !value && !style.hidden && parent)
         {
            bool wasActiveChild = parent.activeChild == this;
            Window client = null;

            style.hidden = true;
            if(style.isActiveClient)
            {
               parent.numPositions--;
               if(state == minimized) parent.numIcons--;
            }

            if(created)
            {
               OldLink prevOrder = null;

               if(rootWindow == this)
                  guiApp.interfaceDriver.SetRootWindowState(this, state, false);
               else
               {
                  Box box { scrolledPos.x, scrolledPos.y, scrolledPos.x + size.w - 1, scrolledPos.y + size.h - 1 };
                  if(style.nonClient)
                  {
                     box.left   -= parent.clientStart.x;
                     box.top    -= parent.clientStart.y;
                     box.right  -= parent.clientStart.x;
                     box.bottom -= parent.clientStart.y;
                  }
                  parent.Update(box);
               }
               if(_isModal && master && master.modalSlave == this)
                  master.modalSlave = null;

               if(order)
               {
                  OldLink tmpPrev = order.prev;
                  client = tmpPrev ? tmpPrev.data : null;
                  if(client && !client.style.hidden && !client.destroyed && client.created)
                     prevOrder = tmpPrev;
                  for(;;)
                  {
                     client = tmpPrev ? tmpPrev.data : null;
                     if(client == this) { client = null; break; }
                     if(client && ((client.style.hidden) || client.destroyed || !client.created))
                     {
                        tmpPrev = client.order.prev;
                     }
                     else
                     {
                        if(client)
                           prevOrder = tmpPrev;
                        break;
                     }
                  }

                  // If this window can be an active client, make sure the next window we activate can also be one
                  if(!style.nonClient && style.isActiveClient)
                  {
                     tmpPrev = prevOrder;
                     for(;;)
                     {
                        client = tmpPrev ? tmpPrev.data : null;
                        if(client == this) { client = null; break; }
                        if(client && (client.style.nonClient || !client.style.isActiveClient || client.style.hidden || client.destroyed || !client.created))
                        {
                           tmpPrev = client.order.prev;
                        }
                        else
                        {
                           if(client)
                              prevOrder = tmpPrev;
                           break;
                        }
                     }
                     if(client && client.style.hidden) client = null;
                  }
               }

               if((wasActiveChild /*parent.activeChild == this*/ || guiApp.interimWindow == this) && true /*activate*/)
               {
                  if(order && prevOrder && prevOrder.data != this)
                     ((Window)prevOrder.data).ActivateEx(true, false, false, true, null, null);
                  else
                     ActivateEx(false, false, false, true, null, null);

                  // TESTING THIS HERE FOR HIDING ACTIVE CLIENT
                  if(parent.activeClient == this)
                  {
                     parent.activeClient = null;
                     parent.UpdateActiveDocument(null);
                  }
               }
               else if(parent.activeClient == this)
               {
                  parent.activeClient = client;
                  parent.UpdateActiveDocument(this);
               }

               // *** Not doing this anymore ***
              /*
               if(cycle)
                  parent.childrenCycle.Delete(cycle);
               if(order)
                  parent.childrenOrder.Delete(order);
               cycle = null;
               order = null;
               */

               SetVisibility(!parent.style.hidden && (style.hidden ? false : true));
            }

            firewatchers;
         }
         else if(this && value && style.hidden)
         {
            style.hidden = false;
            if(created)
            {
               SetVisibility(!parent.style.hidden && (style.hidden ? false : true));
               if(rootWindow == this)
                  guiApp.interfaceDriver.SetRootWindowState(this, state, true);

               if(_isModal && master)
                  master.modalSlave = this;

               if(style.isActiveClient)
               {
                  positionID = parent.GetPositionID(this);
                  parent.numPositions++;
                  if(state == minimized) parent.numIcons++;
               }

               // *** NOT DOING THIS ANYMORE ***
               /*
               if(!(style.inactive))
               {
                  if(!(style.noCycle))
                  {
                     cycle = parent.childrenCycle.AddAfter(
                        (parent.activeChild && parent.activeChild.cycle) ?
                           parent.activeChild.cycle.prev : null, sizeof(OldLink));
                     cycle.data = this;
                  }
                  order = parent.childrenOrder.AddAfter(
                     (parent.activeChild && parent.activeChild.order) ? parent.activeChild.order.prev : parent.childrenOrder.last,
                     sizeof(OldLink));
                  order.data = this;
               }
               */

               /*
               if(true || !parent.activeChild)
                  ActivateEx(true, false, true, true, null, null);
               */
               if(creationActivation == activate && guiApp.desktop.active)
                  ActivateEx(true, false, true, true, null, null);
               else if((creationActivation == activate || creationActivation == flash) && !object)
               {
                  MakeActive();
                  if(this == rootWindow)
                     Flash();
               }

               //SetVisibility(!parent.style.hidden && (style.hidden ? false : true));
               Update(null);

               // rootWindow.
               ConsequentialMouseMove(false);
            }

            firewatchers;
         }
         else if(this)
            style.hidden = !value;
      }

      get { return (style.hidden || !setVisible) ? false : true; }
   };

   property bool isDocument
   {
      property_category $"Document"
      set { style.isDocument = value; if(value) SetupFileMonitor(); }
      get { return style.isDocument; }
   };

   property bool mergeMenus
   {
      property_category $"Window Style"
      set { mergeMenus = value; }
      get { return (bool)mergeMenus; }
   };

   property bool hasHorzScroll
   {
      property_category $"Window Style"
      set
      {
         if(value)
         {
            if(!style.hasHorzScroll && created)
            {
               CreateSystemChildren();
               Position(position.x, position.y, size.w, size.h, false, true, false, false, false, true);
            }
         }
         else if(style.hasHorzScroll)
         {
            sbh.Destroy(0);
            sbh = null;
            Position(position.x, position.y, size.w, size.h, false, true, false, false, false, true);
         }
         style.hasHorzScroll = value;
      }

      get { return style.hasHorzScroll; }
   };

   property bool hasVertScroll
   {
      property_category $"Window Style"
      set
      {
         if(value)
         {
            if(!style.hasVertScroll && created)
            {
               style.hasVertScroll = true;
               CreateSystemChildren();
               Position(position.x, position.y, size.w, size.h, false, true, false, false, false, true);
            }
         }
         else if(style.hasVertScroll)
         {
            sbv.Destroy(0);
            sbv = null;
            Position(position.x, position.y, size.w, size.h, false, true, false, false, false, true);
         }
         style.hasVertScroll = value;
      }
      get { return style.hasVertScroll; }
   };

   property bool dontHideScroll
   {
      property_category $"Behavior"
      set
      {
         scrollFlags.dontHide = value;
         if(value)
         {
            //UpdateScrollBars(true, true);
            Position(position.x, position.y, size.w, size.h, false, true, true, true, true, true);
         }
         else
         {
            // UpdateScrollBars(true, true);
            Position(position.x, position.y, size.w, size.h, false, true, true, true, true, true);
         }
      }
      get { return scrollFlags.dontHide; }
   };

   property bool dontScrollVert
   {
      property_category $"Behavior"
      set { style.dontScrollVert = value; }
      get { return style.dontScrollVert; }
   };
   property bool dontScrollHorz
   {
      property_category $"Behavior"
      set { style.dontScrollHorz = value; }
      get { return style.dontScrollHorz; }
   };

   property bool snapVertScroll
   {
      property_category $"Behavior"
      set
      {
         scrollFlags.snapY = value;
         if(sbv) sbv.snap = value;
      }
      get { return scrollFlags.snapY; }
   };
   property bool snapHorzScroll
   {
       property_category $"Behavior"
      set
      {
         scrollFlags.snapX = value;
         if(sbh) sbh.snap = value;
      }
      get { return scrollFlags.snapX; }
   };

   property Point scroll
   {
      property_category $"Behavior"
      set { if(this) SetScrollPosition(value.x, value.y); }
      get { value = scroll; }
   };

   property bool modifyVirtualArea
   {
      property_category $"Behavior"
      set { modifyVirtArea = value; }
      get { return (bool)modifyVirtArea; }
   };

   property bool dontAutoScrollArea
   {
      property_category $"Behavior"
      // Activating a child control out of view will automatically scroll to make it in view
      set { noAutoScrollArea = value; }
      get { return (bool)noAutoScrollArea; }
   };

   property const char * fileName
   {
      property_category $"Document"
      set
      {
         SetupFileMonitor();

         if(menu && ((!fileName && value) || (fileName && !value)))
         {
            MenuItem item = menu.FindItem(MenuFileSave, 0);
            if(item) item.disabled = !modifiedDocument && value;
         }

         delete fileName;

         if(value && value[0])
            fileName = CopyString(value);

         if(parent && this == parent.activeClient)
            parent.UpdateActiveDocument(null);
         else
            UpdateCaption();

         // if(style.isDocument)
#if !defined(__EMSCRIPTEN__)
         if(!saving)
            fileMonitor.fileName = value;
#endif
      }
      get { return fileName; }
   };

   property int64 id
   {
      property_category $"Data"
      set { id = value; }
      get { return id; }
   };

   property bool modifiedDocument
   {
      property_category $"Document"
      set
      {
         if(style.isDocument || fileName)
         {
            if(menu)
            {
               MenuItem item = menu.FindItem(MenuFileSave, 0);
               if(item) item.disabled = !value && fileName;
            }
         }

         if(modifiedDocument != value)
         {
            modifiedDocument = value;
            if(style.isDocument || fileName)
               UpdateCaption();
         }
      }
      get { return (bool)modifiedDocument; }
   };

   property bool showInTaskBar
   {
      property_category $"Window Style"
      set
      {
         style.showInTaskBar = value;
#if defined(__WIN32__) && !defined(__UWP__)
         Win32UpdateStyle(this);
#endif
      }
      get { return style.showInTaskBar; }
   };
   property FileDialog saveDialog { set { saveDialog = value; } };
   property bool isActiveClient
   {
      property_category $"Behavior"
      set
      {
         if(parent && style.isActiveClient != value && !style.hidden)
         {
            if(value)
            {
               if(state == minimized) parent.numIcons++;
               parent.numPositions++;
            }
            else
            {
               if(state == minimized) parent.numIcons--;
               parent.numPositions--;
            }
         }
         style.isActiveClient = value;
      }
      get { return style.isActiveClient; }
   };

   property Cursor cursor
   {
      property_category $"Appearance"
      set
      {
         cursor = value;
         SelectMouseCursor();
      }
      get { return cursor; }
   };

//#if !defined(ECERE_VANILLA)
   property const char * name
   {
      property_category $"Design"
      get
      {
         return (this && object) ? object.name : null;
      }
      set
      {
         if(activeDesigner)
            activeDesigner.RenameObject(object, value);
      }
   };
//#endif
   property const char * displayDriver
   {
      property_category $"Behavior"
      set
      {
         dispDriver = GetDisplayDriver(value);
         //DisplayModeChanged();
      }
      get
      {
         return dispDriver ? dispDriver.name : null;
      }
   }

   // RUNTIME PROPERTIES
   property bool autoCreate { set { autoCreate = value; } get { return (bool)autoCreate; } };
   property Size scrollArea
   {
      property_category $"Behavior"
      set
      {
         if(value != null)
            SetScrollArea(value.w, value.h, false);
         else
            SetScrollArea(0,0, true);
      }
      get { value = scrollArea; }
      isset
      {
         return scrollArea.w > clientSize.w || scrollArea.h > clientSize.h;
      }
   };
   property bool is3D
   {
      property_category $"Layout"
      set { if(this) is3D = value; }
      get { return (bool)is3D; }
   };

   // Runtime Only Properties (No Set, can display the displayable ones depending on the type?)

   // Will be merged with font later
   property Font fontObject { get { return usedFont ? usedFont.font : null; } };
   property Point clientStart { get { value = clientStart; } };
   property Point absPosition { get { value = absPosition; } };
   property Anchor normalAnchor { get { value = normalAnchor; } };
   property SizeAnchor normalSizeAnchor { get { value = normalSizeAnchor; } };
   property bool active { get { return (bool)active; } };
   property bool created { get { return (bool)created; } };
   property bool destroyed { get { return (bool)destroyed; } };
   property Window firstSlave { get { return slaves.first ? ((OldLink)slaves.first).data : null; } };
   property Window firstChild { get { return children.first; } };
   property Window lastChild { get { return children.last; } };
   property Window activeClient { get { return activeClient; } };
   property Window activeChild { get { return activeChild; } };
   property Display display  { get { return display ? display : ((parent && parent.rootWindow) ? parent.rootWindow.display : null); } };
   property DisplaySystem displaySystem { get { return display ? display.displaySystem : null; } };
   property ScrollBar horzScroll { get { return sbh; } };
   property ScrollBar vertScroll { get { return sbv; } };
   property StatusBar statusBar { get { return statusBar; } };
   property Window rootWindow { get { return rootWindow; } };
   property bool closing { get { return (bool)closing; } set { closing = value; } };
   property int documentID { get { return documentID; } };
   property Window previous { get { return prev; } }
   property Window next { get { return next; } }
   // NOTE: This property is really slow and should not be used in iteration, iteration should be done with link
   property Window nextSlave { get { OldLink link = master ? master.slaves.FindLink(this) : null; return (link && link.next) ? link.next.data : null; } }
   property PopupMenu menuBar { get { return menuBar; } }
   property ScrollBar sbv { get { return sbv; } }
   property ScrollBar sbh { get { return sbh; } }
   property bool fullRender { set { fullRender = value; } get { return (bool)fullRender; } }
   property void * systemHandle { get { return windowHandle; } }
   property Button minimizeButton { get { return sysButtons[0]; } };
   property Button maximizeButton { get { return sysButtons[1]; } };
   property Button closeButton { get { return sysButtons[2]; } };
   property BitmapResource icon
   {
      get { return icon; }
      set
      {
         icon = value;
         if(icon) incref icon;
         if(created)
            guiApp.interfaceDriver.SetIcon(this, value);
      }
   };
   property bool moveable { get { return (bool)moveable; } set { moveable = value; } };
   property bool alphaBlend { get { return (bool)alphaBlend; } set { alphaBlend = value; if(value) nativeDecorations = false; /* Native Decorations are not supported with alphaBlend */ } };
   property bool useSharedMemory { get { return (bool)useSharedMemory; } set { useSharedMemory = value; } };
   property GLCapabilities glCapabilities
   {
      get { return glCapabilities; }
      set
      {
         bool reload = display != null &&
            (glCapabilities.nonPow2Textures != value.nonPow2Textures ||
             glCapabilities.intAndDouble != value.intAndDouble ||
             glCapabilities.vertexBuffer != value.vertexBuffer ||
             glCapabilities.compatible != value.compatible ||
             glCapabilities.legacyFormats != value.legacyFormats ||
             glCapabilities.debug != value.debug ||
             glCapabilities.vertexPointer != value.vertexPointer ||
             glCapabilities.quads != value.quads);
         guiApp.modeSwitching = true;
         if(reload)
            UnloadGraphics(false);

         glCapabilities = value;

         if(reload)
         {
            if(SetupDisplay())
               LoadGraphics(false, false);
         }
         else if(display)
            display.glCapabilities = value;
         guiApp.modeSwitching = false;
      }
   };
   property CreationActivationOption creationActivation { get { return creationActivation; } set { creationActivation = value; } };
   property bool nativeDecorations
   {
      get { return (bool)nativeDecorations; }
      set { nativeDecorations = value; }
#if !defined(ECERE_VANILLA) && !defined(ECERE_NOTRUETYPE) && !defined(__EMSCRIPTEN__)
      isset
      {
         //return (nativeDecorations && (rootWindow == this || (formDesigner && activeDesigner && ((FormDesigner)activeDesigner.classDesigner).form && parent == ((FormDesigner)activeDesigner.classDesigner).form.parent))) != style.fixed;
         bool result = false;
         if(nativeDecorations)
         {
            if(rootWindow == this)
               result = true;
            else
            {
               if(formDesigner && activeDesigner)
               {
                  FormDesigner cd = (FormDesigner)activeDesigner.classDesigner;
                  Window form = cd ? cd.form : null;
                  if(form && parent == form.parent)
                     result = true;
               }
            }
         }
         return result != style.fixed;
      }
#endif
   };
   property bool manageDisplay { get { return (bool)manageDisplay; } set { manageDisplay = value; } };

   property const char * text
   {
      property_category $"Deprecated"
      watchable
      set { property::caption = value; }
      get { return property::caption; }
   }
private:
   // Data
   //char * yo;
   Window prev, next;
   WindowBits style;       // Window Style
   char * caption;            // Name / Caption
   Window parent;    // Parent window
   OldList children;          // List of children in Z order
   Window activeChild;     // Child window having focus
   Window activeClient;
   Window previousActive;  // Child active prior to activating the default child
   Window master;          // Window owning and receiving notifications concerning this window
   OldList slaves;            // List of windows belonging to this window
   Display display;        // Display this window is drawn into

   Point position;         // Position in parent window client area
   Point absPosition;      // Absolute position
   Point clientStart;      // Client area position from (0,0) in this window
   Size size;              // Size
   Size clientSize;        // Client area size
   Size scrollArea;        // Virtual Scroll area size
   Size reqScrollArea;     // Requested virtual area size
   Point scroll;           // Virtual area scrolling position
   ScrollBar sbh, sbv;        // Scrollbar window handles
   Cursor cursor;        // Mouse cursor used for this window
   WindowState state;
   PopupMenu menuBar;
   StatusBar statusBar;
   Button sysButtons[3];
   char * fileName;
   Box clientArea;         // Client Area box clipped to parent
   Key setHotKey;
   HotKeySlot hotKey;        // HotKey for this window
   int numDocuments;
   int numPositions;
   Menu menu;
   ScrollFlags scrollFlags;// Window Scrollbar Flags
   int64 id;                 // Control ID
   int documentID;
   ColorAlpha background;  // Background color used to draw the window area
   Color foreground;
   subclass(DisplayDriver) dispDriver;   // Display driver name for this window
   OldList childrenCycle;     // Cycling order
   OldLink cycle;             // Element of parent's cycling order
   OldList childrenOrder;     // Circular Z-Order
   OldLink order;             // Element of parent's circular Z-Order
   Window modalSlave;      // Slave window blocking this window's interaction

   Window rootWindow;      // Topmost system managed window
   void * windowHandle;    // System window handle

   DialogResult returnCode;// Return code for modal windows

   Point sbStep;           // Scrollbar line scrolling steps

   Anchor stateAnchor;
   SizeAnchor stateSizeAnchor;

   Anchor normalAnchor;
   SizeAnchor normalSizeAnchor;

   Size skinMinSize;       // Minimal window size based on style
   Point scrolledPos;      // Scrolled position
   Box box;                // Window box clipped to parent
   Box * against;          // What to clip the box to

   Extent dirtyArea { /*first = -1, last = -1, free = -1*/ };       // Area marked for update by Update
   Extent renderArea { /*first = -1, last = -1, free = -1*/ };      // Temporary extent: Area that is going to be rendered
   Extent overRenderArea { /*first = -1, last = -1, free = -1*/ };  // Temporary extent: Area that is going to be rendered over children
   Extent clipExtent { /*first = -1, last = -1, free = -1*/ };      // Temporary extent against which to clip render area
   Extent scrollExtent { /*first = -1, last = -1, free = -1*/ };    // Area to scroll
   Point scrolledArea;     // Distance to scroll area by
   Extent dirtyBack { /*first = -1, last = -1, free = -1*/ };       // Only used by root window

   OldList hotKeys;           // List of the hotkeys of all children
   Window defaultControl;  // Default child control
   Size minSize;
   Size maxSize;

   ColorAlpha * palette;   // Color palette used for this window

   int caretSize;          // Size of caret, non zero if a caret is present
   Point caretPos;         // Caret position

   void * systemParent;    // Parent System Window for embedded windows

   int iconID;
   int numIcons;
   int positionID;

#if !defined(__EMSCRIPTEN__)
   Mutex mutex;
#endif
   WindowState lastState;

#if !defined(__EMSCRIPTEN__)
   FileMonitor fileMonitor;
#endif

   FontResource setFont, systemFont;
   FontResource usedFont;
   FontResource captionFont;
   OldList resources;
   FileDialog saveDialog;
   Anchor anchor;
   SizeAnchor sizeAnchor;

   // FormDesigner data
   ObjectInfo object;
   Window control;
   Extent * tempExtents; //[4];
   BitmapResource icon;
   void * windowData;
   CreationActivationOption creationActivation;
   GLCapabilities glCapabilities;
   glCapabilities = { true, true, true, true, true, true, true, true, true /*false*/, true, true, true, true, true, true, true, true, true, ms16 };
   struct
   {
      bool active:1;            // true if window and ancestors are active
      bool acquiredInput:1;     // true if the window is processing state based input
      bool modifiedDocument:1;
      bool disabled:1;          // true if window cannot interact
      bool isForegroundWindow:1;// true while a root window is being activated
      bool visible:1;           // Visibility flag
      bool destroyed:1;         // true if window is being destroyed
      bool anchored:1;          // true if this window is repositioned when the parent resizes
      bool dirty:1;             // Flag set to true if any descendant must be redrawn
      bool mouseInside:1;
      bool positioned:1;
      bool created:1;
      bool is3D:1;
      bool mergeMenus:1;
      bool modifyVirtArea:1;
      bool noAutoScrollArea:1;
      bool closing:1;
      bool autoCreate:1;
      bool setVisible:1;      // FOR FORM DESIGNER
      bool wasCreated:1;
      bool fullRender:1;
      bool moveable:1;
      bool alphaBlend:1;
      bool composing:1;
      bool useSharedMemory:1;
      bool resized:1;
      bool saving:1;
      bool nativeDecorations:1;
      bool manageDisplay:1;
      bool formDesigner:1; // True if we this is running in the form editor
      bool requireRemaximize:1;
      bool noConsequential:1;
   };

   // Checks used internally for them not to take effect in FormDesigner
   property bool _isModal        { get { return !formDesigner ? style.modal : false; } }
   property subclass(DisplayDriver) _displayDriver  { get { return !formDesigner ? dispDriver : null; } }

   WindowController controller;

   public property WindowController controller
   {
      get { return controller; }
      set
      {
         if(controller)
            controller.setWindow(null);
         delete controller;
         controller = value;
         if(controller)
         {
            incref controller;
            controller.setWindow(this);
         }
      }
   }

   public property bool noConsequential
   {
      set { noConsequential = value; }
      get { return noConsequential; }
   }
};

public class CommonControl : Window
{
   // creationActivation = doNothing;

   ToolTip toolTip;
   public property const String toolTip
   {
      property_category $"Appearance"
      set
      {
         if(created) CommonControl::OnDestroy();
         delete toolTip;
         toolTip = value ? ToolTip { tip = value; } : null;
         if(toolTip) incref toolTip;
         if(created) CommonControl::OnCreate();
      }
      get { return toolTip ? toolTip.tip : null; }
   }

   void OnDestroy()
   {
      if(toolTip)
         // (Very) Ugly work around for the fact that the parent watcher
         // won't fire when it's already been disconnected...
         eInstance_FireSelfWatchers(toolTip,
            __ecereProp___ecereNameSpace__ecere__gui__Window_parent);
   }

   bool OnCreate()
   {
      if(toolTip)
         toolTip.parent = this;
      return true;
   }
   ~CommonControl()
   {
      delete toolTip;
   }
};

public class Percentage : float
{
   const char * OnGetString(char * string, float * fieldData, ObjectNotationType * onType)
   {
      int c;
      int last = 0;
      sprintf(string, "%.2f", this);
      c = strlen(string)-1;
      for( ; c >= 0; c--)
      {
         if(string[c] != '0')
            last = Max(last, c);
         if(string[c] == '.')
         {
            if(last == c)
               string[c] = 0;
            else
               string[last+1] = 0;
            break;
         }
      }
      return string;
   }
};

public void ApplySkin(Class c, const char * name, void ** vTbl)
{
   char className[1024];
   Class sc;
   OldLink d;
   int m;

   subclass(Window) wc = (subclass(Window))c;
   subclass(Window) base = (subclass(Window))c.base;

   sprintf(className, "%sSkin_%s", name, c.name);
   wc.pureVTbl = c._vTbl;
   c._vTbl = new void *[c.vTblSize];
   memcpy(c._vTbl, wc.pureVTbl, c.vTblSize * sizeof(void *));
   sc = eSystem_FindClass(c.module.application, className);

   if(vTbl)
   {
      for(m = 0; m < c.base.vTblSize; m++)
      {
         if(c._vTbl[m] == base.pureVTbl[m])
            c._vTbl[m] = vTbl[m];
      }
   }
   if(sc)
   {
      for(m = 0; m < c.vTblSize; m++)
      {
         if(sc._vTbl[m] != wc.pureVTbl[m])
            c._vTbl[m] = sc._vTbl[m];
      }
   }

   for(d = c.derivatives.first; d; d = d.next)
   {
      ApplySkin(d.data, name, c._vTbl);
   }
}

public void UnapplySkin(Class c)
{
   subclass(Window) wc = (subclass(Window))c;
   OldLink d;

   if(wc.pureVTbl && c._vTbl != wc.pureVTbl)
   {
      delete c._vTbl;
      c._vTbl = wc.pureVTbl;
      wc.pureVTbl = null;
   }

   for(d = c.derivatives.first; d; d = d.next)
   {
      UnapplySkin(d.data);
   }
}
/*
void CheckFontIntegrity(Window window)
{
   Window c;
   if(window)
   {
      if(window.usedFont && window.usedFont.font == 0xecececec)
      {
         FontResource uf = window.usedFont;
         char * className = window._class.name;
         char * text = window.text;
         Print("");
      }
      for(c = window.firstChild; c; c = c.next)
         CheckFontIntegrity(c);
   }
}*/

public class ControllableWindow : Window
{
   /*WindowController controller;
   public property WindowController controller { get { return controller; } set { delete controller; controller = value; incref controller; } }
   ~ControllableWindow() { delete controller; }*/
}

class WindowControllerInterface : ControllableWindow
{
   bool OnKeyDown(Key key, unichar ch)
   {
      bool result = controller.OnKeyDown ? ((bool(*)(Window, WindowController, Key, unichar))(void *)controller.OnKeyDown)((Window)controller.controlled, controller, key, ch) : true;
      if(result)
      {
         bool (* onKeyDown)(Window, Key, unichar) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyDown];
         if(onKeyDown)
            result = onKeyDown(controller.window, key, ch);
      }
      return result;
   }

   bool OnKeyUp(Key key, unichar ch)
   {
      bool result = controller.OnKeyUp ? ((bool(*)(Window, WindowController, Key, unichar))(void *)controller.OnKeyUp)((Window)controller.controlled, controller, key, ch) : true;
      if(result)
      {
         bool (* onKeyUp)(Window, Key, unichar) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyUp];
         if(onKeyUp)
            result = onKeyUp(controller.window, key, ch);
      }
      return result;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      bool result = controller.OnKeyHit ? ((bool(*)(Window, WindowController, Key, unichar))(void *)controller.OnKeyHit)((Window)controller.controlled, controller, key, ch) : true;
      if(result)
      {
         bool (* onKeyHit)(Window, Key, unichar) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnKeyHit];
         if(onKeyHit)
            result = onKeyHit(controller.window, key, ch);
      }
      return result;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      bool result = controller.OnMouseMove ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnMouseMove)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onMouseMove)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMouseMove];
         if(onMouseMove)
            result = onMouseMove(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      bool result = controller.OnLeftButtonDown ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnLeftButtonDown)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onLeftButtonDown)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonDown];
         if(onLeftButtonDown)
            result = onLeftButtonDown(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      bool result = controller.OnLeftButtonUp ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnLeftButtonUp)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onLeftButtonUp)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp];
         if(onLeftButtonUp)
            result = onLeftButtonUp(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      bool result = controller.OnLeftDoubleClick ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnLeftDoubleClick)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onLeftDoubleClick)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftDoubleClick];
         if(onLeftDoubleClick)
            result = onLeftDoubleClick(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      bool result = controller.OnRightButtonDown ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnRightButtonDown)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onRightButtonDown)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonDown];
         if(onRightButtonDown)
            result = onRightButtonDown(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      bool result = controller.OnRightButtonUp ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnRightButtonUp)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onRightButtonUp)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightButtonUp];
         if(onRightButtonUp)
            result = onRightButtonUp(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnRightDoubleClick(int x, int y, Modifiers mods)
   {
      bool result = controller.OnRightDoubleClick ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnRightDoubleClick)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onRightDoubleClick)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRightDoubleClick];
         if(onRightDoubleClick)
            result = onRightDoubleClick(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnMiddleButtonDown(int x, int y, Modifiers mods)
   {
      bool result = controller.OnMiddleButtonDown ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnMiddleButtonDown)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onMiddleButtonDown)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonDown];
         if(onMiddleButtonDown)
            result = onMiddleButtonDown(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnMiddleButtonUp(int x, int y, Modifiers mods)
   {
      bool result = controller.OnMiddleButtonUp ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnMiddleButtonUp)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onMiddleButtonUp)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleButtonUp];
         if(onMiddleButtonUp)
            result = onMiddleButtonUp(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnMiddleDoubleClick(int x, int y, Modifiers mods)
   {
      bool result = controller.OnMiddleDoubleClick ? ((bool(*)(Window, WindowController, int, int, Modifiers))(void *)controller.OnMiddleDoubleClick)((Window)controller.controlled, controller, x, y, mods) : true;
      if(result)
      {
         bool(* onMiddleDoubleClick)(Window, int, int, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMiddleDoubleClick];
         if(onMiddleDoubleClick)
            onMiddleDoubleClick(controller.window, x, y, mods);
      }
      return result;
   }

   bool OnMultiTouch(TouchPointerEvent event, Array<TouchPointerInfo> infos, Modifiers mods)
   {
      bool result = controller.OnMultiTouch ? ((bool(*)(Window, WindowController, TouchPointerEvent event, Array<TouchPointerInfo> infos, Modifiers))(void *)controller.OnMultiTouch)((Window)controller.controlled, controller, event, infos, mods) : true;
      if(result)
      {
         bool(* onMultiTouch)(Window, TouchPointerEvent, Array<TouchPointerInfo>, Modifiers) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnMultiTouch];
         if(onMultiTouch)
            onMultiTouch(controller.window, event, infos, mods);
      }
      return result;
   }

   void OnResize(int width, int height)
   {
      if(controller.OnResize)
         ((void(*)(Window, WindowController, int, int))(void *)controller.OnResize)((Window)controller.controlled, controller, width, height);
      {
         void(* onResize)(Window, int, int) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnResize];
         if(onResize)
            onResize(controller.window, width, height);
      }
   }

   void OnRedraw(Surface surface)
   {
      if(controller.OnRedraw)
         ((void(*)(Window, WindowController, Surface))(void *)controller.OnRedraw)((Window)controller.controlled, controller, surface);
      {
         void(* onRedraw)(Window, Surface) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw];
         if(onRedraw)
            onRedraw(controller.window, surface);
      }
   }

   bool OnCreate()
   {
      bool result = controller.OnCreate ? ((bool(*)(Window, WindowController))(void *)controller.OnCreate)((Window)controller.controlled, controller) : true;
      if(result)
      {
         bool(* onCreate)(Window) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnCreate];
         if(onCreate)
            result = onCreate(controller.window);
      }
      return result;
   }

   bool OnLoadGraphics()
   {
      bool result = controller.OnLoadGraphics ? ((bool(*)(Window, WindowController))(void *)controller.OnLoadGraphics)((Window)controller.controlled, controller) : true;
      if(result)
      {
         bool(* onLoadGraphics)(Window) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLoadGraphics];
         if(onLoadGraphics)
            result = onLoadGraphics(controller.window);
      }
      return result;
   }

   void OnUnloadGraphics()
   {
      if(controller.OnUnloadGraphics)
         ((void(*)(Window, WindowController))(void *)controller.OnUnloadGraphics)((Window)controller.controlled, controller);
      {
         void(* onUnloadGraphics)(Window) = (void *)controller.windowVTbl[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnUnloadGraphics];
         if(onUnloadGraphics)
            onUnloadGraphics(controller.window);
      }
   }
}

public class WindowController<class V>
{
   void setWindow(Window value)
   {
      uint size = class(Window).vTblSize;
      if(value)
      {
         delete windowVTbl;
         windowVTbl = new void *[size];
         memcpy(windowVTbl, value._vTbl, size * sizeof(void *));
         if(value._vTbl == value._class._vTbl)
         {
            value._vTbl = new void *[value._class.vTblSize];
            memcpy(value._vTbl + size, value._class._vTbl + size, (value._class.vTblSize - size) * sizeof(void *));
         }
         {
            int c;
            for(c = 0; c < size; c++)
            {
               void * function = class(WindowControllerInterface)._vTbl[c];
               if(function && function != DefaultFunction)
                  value._vTbl[c] = function;
               else
                  value._vTbl[c] = windowVTbl[c];
            }
         }
      }
      else if(window)
      {
         memcpy(window._vTbl, windowVTbl, class(Window).vTblSize * sizeof(void *));
         delete windowVTbl;
      }
      window = value;
   }
public:
   property Window window
   {
      get { return window; }
   }
   property V controlled
   {
      set { controlled = value; }
      get { return controlled; }
   }
   // TODO: Add OnStateChange so we can implement SavedConfigWindow as a WindowController instead
   virtual bool V::OnKeyDown(WindowController controller, Key key, unichar ch);
   virtual bool V::OnKeyUp(WindowController controller, Key key, unichar ch);
   virtual bool V::OnKeyHit(WindowController controller, Key key, unichar ch);
   virtual bool V::OnMouseMove(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnLeftButtonDown(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnLeftButtonUp(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnLeftDoubleClick(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnRightButtonDown(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnRightButtonUp(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnRightDoubleClick(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnMiddleButtonDown(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnMiddleButtonUp(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnMiddleDoubleClick(WindowController controller, int x, int y, Modifiers mods);
   virtual bool V::OnMultiTouch(WindowController controller, TouchPointerEvent event, Array<TouchPointerInfo> infos, Modifiers mods);
   virtual void V::OnResize(WindowController controller, int width, int height);
   virtual void V::OnRedraw(WindowController controller, Surface surface);
   virtual bool V::OnCreate(WindowController controller);
   virtual bool V::OnLoadGraphics(WindowController controller);
   virtual void V::OnUnloadGraphics(WindowController controller);

private:
   public int (** windowVTbl)();
   V controlled;
   Window window;

   ~WindowController()
   {
      delete windowVTbl;
   }
}
