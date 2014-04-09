namespace gui;

import "Display"

static Window virtualDesktop;
static bool virtualDesktopDirty;

static void * (* Setup3DWindow)(Window window, int w, int h);
static void (* Update3DWindow)(Window window, Box box);

static void Window3D_SetupRoot(Window window)
{
   Window child;

   // Setup relationship with outside world (bb root || !bb)
   if(window.parent == virtualDesktop)
   {
      window.rootWindow = window;
      window.against = null;
      if(!window.tempExtents)
         window.tempExtents = new0 Extent[4];
   }
   else
   {
      window.rootWindow = window.parent.rootWindow;

      if(window.style.nonClient)
         window.against = &window.parent.box;
      else
         window.against = &window.parent.clientArea;
   }

   for(child = window.children.first; child; child = child.next)
      Window3D_SetupRoot(child);
}

static bool Window3D_Setup(Window window, bool positionChildren)
{
   bool result = false;
   Window child;

   if(window.parent == virtualDesktop)
   {
      window.display = Display { };
      if(window.display)
      {
         int x,y,w,h;

         // Copy Display Content
         window.display.displaySystem = virtualDesktop.display.displaySystem;
         window.display.window = virtualDesktop.display.window;
         window.display.width = virtualDesktop.display.width;
         window.display.height = virtualDesktop.display.height;
         window.display.driverData = virtualDesktop.display.driverData;
         window.display.current = virtualDesktop.display.current;

         window.display.mutex = null;
         window.ComputeAnchors(window.stateAnchor, window.stateSizeAnchor, &x,&y,&w,&h);
         virtualDesktop.display.Lock(false);
         window.windowHandle = Setup3DWindow(window, w, h);
         virtualDesktop.display.Unlock();
         result = true;
      }
   }
   else
   {
      window.display = window.rootWindow.display;
      result = true;
   }
   for(child = window.children.first; child; child = child.next)
   {
      if(!Window3D_Setup(child, false))
         result = false;
   }
   return result;
}

bool Window3D_SetupDisplay(Window window)
{
   Window3D_SetupRoot(window);
   return Window3D_Setup(window, true);
}

static Window fullScreenWindow;

void Desktop3D_FixSize(int * w, int * h)
{
   if(!fullScreenWindow)
   {
      *w = 853;
      *h = 480;
   }
   else
   {
      *w = virtualDesktop.clientSize.w;
      *h = virtualDesktop.clientSize.h;
   }
}

public bool Desktop3DFullScreen(Window window)
{
   int x, y, w, h;
   if(window)
   {
      fullScreenWindow = window;
      window.SetState(maximized, 0, 0);
      window.ComputeAnchors(window.stateAnchor, window.stateSizeAnchor, &x, &y, &w, &h);
      window.Position(x,y, w, h, true, true, true, true, false, false);
      window.Update(null);
   }
   else if(fullScreenWindow)
   {
      Window window = fullScreenWindow;
      if(fullScreenWindow)
         fullScreenWindow.dirty = true;
      fullScreenWindow = null;
      window.SetState(maximized, 0, 0);
      window.ComputeAnchors(window.stateAnchor, window.stateSizeAnchor, &x, &y, &w, &h);
      window.Position(x,y, w, h, true, true, true, true, false, false);
      window.Update(null);
   }
   return true;
}


#define ACCESS_ITEM(l, id) \
   id

#define FASTLIST_LOOP(l, v)      \
   for(v = (BoxItem)l.first; v; v = (BoxItem)v.next)

#define FASTLIST_LOOPN(l, v, n) \
   for(v = (BoxItem)l.first, n = (BoxItem)(v ? v.next : null); v; v = (BoxItem)next)

/*
#define ACCESS_ITEM(l, id) \
      ((FastItem)(((id) == -1) ? null : (((byte *)((l).items)) + (id) * (l).itemSize)))

#define FASTLIST_LOOP(l, v)      \
   for(v = (void *)ACCESS_ITEM((l), (l).first); v; v = (void *)ACCESS_ITEM((l), v.next))
*/

public bool Desktop3DUpdateDisplay()
{
   Window window;

   if(!virtualDesktop || !virtualDesktop.rootWindow.display) return false;

   for(window = guiApp.desktop.children.first; window; window = window.next)
   {
      if(window == virtualDesktop)
      {
         Window window;

         //virtualDesktop.mutex.Wait();
         virtualDesktop.display.Lock(true);

         if(fullScreenWindow)
         {
            if(virtualDesktop.dirty || virtualDesktop.rootWindow.dirty)
               fullScreenWindow.dirty = true;
            for(window = virtualDesktop.children.first; window; window = window.next)
               if(!window.is3D && window.dirty)
                  fullScreenWindow.dirty = true;

            if(fullScreenWindow.dirty)
            {
               Extent dirtyExtent;  // Extent that needs to be forced due to transparency
               Extent overExtent;  // Extent that needs to be forced by drawoverchildren
               dirtyExtent.Clear();
               overExtent.Clear();
               fullScreenWindow.clipExtent.AddBox(fullScreenWindow.box);
               fullScreenWindow.ComputeClipExtents();
               fullScreenWindow.ComputeRenderArea(dirtyExtent, overExtent, null);
               dirtyExtent.Free(null);
               overExtent.Free(null);

               // Logf("Rendering fullscreen window, state = %d\n", fullScreenWindow.state);

               fullScreenWindow.Render(null);
               fullScreenWindow.dirtyBack.Free(null);

               fullScreenWindow.dirty = false;
               // virtualDesktop.dirty = true;
               virtualDesktop.display.Update(null);
            }
         }
         else
         {
            for(window = virtualDesktop.children.first; window; window = window.next)
            {
               if(window.is3D)
               {
                  if(window.visible && window.dirty)
                  {
                     if(window.display && window.rootWindow)
                     {
                        Extent dirtyExtent;  // Extent that needs to be forced due to transparency
                        Extent overExtent;  // Extent that needs to be forced due to drawoverchildren
                        BoxItem extentBox;

                        dirtyExtent.Clear();
                        overExtent.Clear();
                        window.clipExtent.AddBox(window.box);
                        window.ComputeClipExtents();
                        window.ComputeRenderArea(dirtyExtent, overExtent, null);
                        dirtyExtent.Free(null);
                        overExtent.Free(null);
                        {
                           Extent updateExtent; // Extent that needs to be updated
                           updateExtent.Clear();

                           window.Render(updateExtent);

                           FASTLIST_LOOP(updateExtent, extentBox)
                              Update3DWindow(window, extentBox.box);

                           updateExtent.Free(null);
                        }
                        window.dirtyBack.Free(null);
                     }
                     window.dirty = false;
                     //virtualDesktop.dirty = true;
                     virtualDesktopDirty = true;
                  }
               }
            }
         }

         // Comment out fullScreen check here and dirty = true up there for ITV update
         if(/*!fullScreenWindow && */(virtualDesktopDirty || virtualDesktop.rootWindow.dirty))
         {
            if(virtualDesktopDirty)
               virtualDesktop.Update(null);
            virtualDesktop.UpdateDisplay();
            virtualDesktopDirty = false;
         }

         virtualDesktop.display.Unlock();

         //virtualDesktop.mutex.Release();
      }
      else if(!fullScreenWindow)
      {
         //window.mutex.Wait();
         if(window.visible && window.dirty)
         {
            guiApp.interfaceDriver.Lock(window);
            if(window.display)
            {
               window.display.Lock(true);
               window.UpdateDisplay();
               window.display.Unlock();
            }
            window.dirty = false;
            guiApp.interfaceDriver.Unlock(window);
            /*
            usleep(1000000);*/
         }
         //window.mutex.Release();
      }
   }
   return true;
}

static Window clippedWindow;
static Box clipBox;

static void (*_DriverSetMouseRange)(Window window, Box box);

static void _SetMouseRange(Window window, Box box)
{
   if(!window.rootWindow.is3D)
   {
#ifdef __WIN32__
      _DriverSetMouseRange(window, box);
#endif
   }
   else
   {
      if(box != null)
      {
         clippedWindow = window.rootWindow;
         clipBox = box;
         virtualDesktop.SetMouseRangeToClient();
      }
      else
      {
         clippedWindow = null;
         _DriverSetMouseRange(null, null);
      }
   }
}

public void Desktop3DInitialize(Window window,
                                            void * (* setup)(Window window, int w, int h),
                                            void (* update)(Window window, Box box))
{
   if(guiApp.interfaceDriver.SetMouseRange != _SetMouseRange)
      _DriverSetMouseRange = guiApp.interfaceDriver.SetMouseRange;
   guiApp.interfaceDriver.SetMouseRange = _SetMouseRange;
   virtualDesktop = window;
   Setup3DWindow = setup;
   Update3DWindow = update;
}

public void * Desktop3DGetWindowHandle(Window window)
{
   return window ? window.windowHandle : null;
}

public void Desktop3DGetClipBox(Box box)
{
   box = clipBox;
}

public Window Desktop3DGetClippedWindow()
{
   return clippedWindow;
}

public void Desktop3DSetDesktopDirty()
{
   virtualDesktopDirty = true;
}

public bool Desktop3DMouseMessage(Window window, uint method, int x, int y, Modifiers * mods, bool consequential, bool activate)
{
   return window.MouseMessage(method, x,y, mods, consequential, activate);
}

public bool Desktop3DTitleBarClicked(Window clickedWindow, int x, int y)
{
   Window windowAt = /*virtualDesktop*/ clickedWindow.GetAtPosition(x, y, true, true, null);
   if(windowAt == clickedWindow)
      if(guiApp.currentSkin.IsMouseMoving(clickedWindow,
               x - clickedWindow.absPosition.x, y - clickedWindow.absPosition.y, clickedWindow.size.w, clickedWindow.size.h))
      {
         return true;
      }
   return false;
}
