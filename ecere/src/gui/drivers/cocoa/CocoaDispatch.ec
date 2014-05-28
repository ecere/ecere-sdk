namespace gui::drivers;

// Bridges Objective-C callbacks to eC.
import "Window"

default:

void CocoaDispatch_UpdateRootWindow(Window window)
{
    window.Update(null);
}

void CocoaDispatch_ExternalPosition(Window window, int x, int y, int width, int height)
{
    window.ExternalPosition(x, y, width, height);
}

bool CocoaDispatch_OnCreate(Window window)
{
    return window.OnCreate();
}

void CocoaDispatch_OnDestroy(Window window)
{
    return window.OnDestroy();
}

void CocoaDispatch_OnDestroyed(Window window)
{
    return window.OnDestroyed();
}

bool CocoaDispatch_OnClose(Window window, bool parentClosing)
{
    return window.OnClose(parentClosing);
}

bool CocoaDispatch_OnStateChange(Window window, WindowState state, Modifiers mods)
{
    return window.OnStateChange(state, mods);
}

bool CocoaDispatch_OnPostCreate(Window window)
{
    return window.OnPostCreate();
}

bool CocoaDispatch_OnMoving(Window window, int *x, int *y, int w, int h)
{
    return window.OnMoving(x, y, w, h);
}

bool CocoaDispatch_OnResizing(Window window, int *width, int *height)
{
    return window.OnResizing(width, height);
}

void CocoaDispatch_OnResize(Window window, int width, int height)
{
    window.OnResize(width, height);
}

void CocoaDispatch_OnPosition(Window window, int x, int y, int width, int height)
{
    window.OnPosition(x, y, width, height);
}

bool CocoaDispatch_OnLoadGraphics(Window window)
{
    return window.OnLoadGraphics();
}

void CocoaDispatch_OnApplyGraphics(Window window)
{
    window.OnApplyGraphics();
}

void CocoaDispatch_OnUnloadGraphics(Window window)
{
    window.OnUnloadGraphics();
}

void CocoaDispatch_Update(Window window)
{
   window.Update(null);
}

bool CocoaDispatch_OnActivate(Window window, bool active, Window previous, bool *goOnWithActivation, bool direct)
{
    return window.OnActivate(active, previous, goOnWithActivation, direct);
}

void CocoaDispatch_OnActivateClient(Window window, Window client, Window previous)
{
    window.OnActivateClient(client, previous);
}

bool CocoaDispatch_OnKeyDown(Window window, Key key, unichar ch)
{
    return window.OnKeyDown(key, ch);
}

bool CocoaDispatch_OnKeyUp(Window window, Key key, unichar ch)
{
    return window.OnKeyUp(key, ch);
}

bool CocoaDispatch_OnKeyHit(Window window, Key key, unichar ch)
{
    return window.OnKeyHit(key, ch);
}

bool CocoaDispatch_OnSysKeyDown(Window window, Key key, unichar ch)
{
    return window.OnSysKeyDown(key, ch);
}

bool CocoaDispatch_OnSysKeyUp(Window window, Key key, unichar ch)
{
    return window.OnSysKeyUp(key, ch);
}

bool CocoaDispatch_OnSysKeyHit(Window window, Key key, unichar ch)
{
    return window.OnSysKeyHit(key, ch);
}

bool CocoaDispatch_OnMouseOver(Window window, int x, int y, Modifiers mods)
{
    return window.OnMouseOver(x, y, mods);
}

bool CocoaDispatch_OnMouseLeave(Window window, Modifiers mods)
{
    return window.OnMouseLeave(mods);
}

bool CocoaDispatch_OnMouseMove(Window window, int x, int y, Modifiers mods)
{
    return window.OnMouseMove(x, y, mods);
}

bool CocoaDispatch_OnLeftButtonDown(Window window, int x, int y, Modifiers mods)
{
    return window.OnLeftButtonDown(x, y, mods);
}

bool CocoaDispatch_OnLeftButtonUp(Window window, int x, int y, Modifiers mods)
{
    return window.OnLeftButtonUp(x, y, mods);
}

bool CocoaDispatch_OnLeftDoubleClick(Window window, int x, int y, Modifiers mods)
{
    return window.OnLeftDoubleClick(x, y, mods);
}

bool CocoaDispatch_OnRightButtonDown(Window window, int x, int y, Modifiers mods)
{
    return window.OnRightButtonDown(x, y, mods);
}

bool CocoaDispatch_OnRightButtonUp(Window window, int x, int y, Modifiers mods)
{
    return window.OnRightButtonUp(x, y, mods);
}

bool CocoaDispatch_OnRightDoubleClick(Window window, int x, int y, Modifiers mods)
{
    return window.OnRightDoubleClick(x, y, mods);
}

bool CocoaDispatch_OnMiddleButtonDown(Window window, int x, int y, Modifiers mods)
{
    return window.OnMiddleButtonDown(x, y, mods);
}

bool CocoaDispatch_OnMiddleButtonUp(Window window, int x, int y, Modifiers mods)
{
    return window.OnMiddleButtonUp(x, y, mods);
}

bool CocoaDispatch_OnMiddleDoubleClick(Window window, int x, int y, Modifiers mods)
{
    return window.OnMiddleDoubleClick(x, y, mods);
}

void CocoaDispatch_OnMouseCaptureLost(Window window)
{
    window.OnMouseCaptureLost();
}

void CocoaDispatch_OnHScroll(Window window, ScrollBarAction action, int position, Key key)
{
    window.OnHScroll(action, position, key);
}

void CocoaDispatch_OnVScroll(Window window, ScrollBarAction action, int position, Key key)
{
    window.OnVScroll(action, position, key);
}

void CocoaDispatch_OnDrawOverChildren(Window window, Surface surface)
{
    window.OnDrawOverChildren(surface);
}

bool CocoaDispatch_OnFileModified(Window window, FileChange fileChange, const char * param)
{
    return window.OnFileModified(fileChange, param);
}

bool CocoaDispatch_OnSaveFile(Window window, const char *fileName)
{
    return window.OnSaveFile(fileName);
}


