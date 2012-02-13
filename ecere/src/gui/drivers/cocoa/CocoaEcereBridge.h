#if !defined(_COCOAINTERFACE_H)
#define _COCOAINTERFACE_H
// CocoaInterface.ec <--> CocoaInterfaceImpl.m bridge.

typedef struct CocoaKeyMod
{
    bool shift:1;
    bool ctrl:1;
    bool alt:1;
    bool cmd:1;
    bool left:1;
    bool middle:1;
    bool right:1;
    bool isActivate:1;
    bool isSideEffect:1;
    bool closingDropDown:1;
} CocoaKeyMod;

typedef void *EcereWindowRef;
typedef void *WindowHandle;

// CocoaInterface
bool CocoaInitialize();
void CocoaTerminate();
bool CocoaProcessInput(bool processAll);
bool CocoaLock(WindowHandle handle);
void CocoaUnlock(WindowHandle handle);
void CocoaGetCurrentMode(bool * fullScreen, int * resolution, int * colorDepth, int * refreshRate);
WindowHandle CocoaCreateRootWindow(EcereWindowRef window);
void CocoaDestroyRootWindow(WindowHandle handle);
void CocoaSetRootWindowCaption(WindowHandle window, char *name);
void CocoaPositionRootWindow(WindowHandle handle, int x, int y, int w, int h, bool move, bool resize);
void CocoaOffsetWindow(WindowHandle window, int *x, int *y);
void CocoaGetMousePosition(int *x, int *y);

// CocoaOpenGLDisplay
void CocoaOpenGLMakeCurrentContext(WindowHandle handle);
void CocoaOpenGLUpdate(WindowHandle handle);

// Dispatch
void CocoaDispatch_UpdateRootWindow(EcereWindowRef ref);
void CocoaDispatch_ExternalPosition(EcereWindowRef ref, int x, int y, int width, int height);

bool CocoaDispatch_OnCreate(EcereWindowRef window);
void CocoaDispatch_OnDestroy(EcereWindowRef window);
void CocoaDispatch_OnDestroyed(EcereWindowRef window);
bool CocoaDispatch_OnClose(EcereWindowRef window, bool parentClosing);
//bool CocoaDispatch_OnStateChange(EcereWindowRef window, WindowState state, Modifiers mods);
bool CocoaDispatch_OnPostCreate(EcereWindowRef window);
bool CocoaDispatch_OnMoving(EcereWindowRef window, int *x, int *y, int w, int h);
bool CocoaDispatch_OnResizing(EcereWindowRef window, int *width, int *height);
void CocoaDispatch_OnResize(EcereWindowRef window, int width, int height);
void CocoaDispatch_OnPosition(EcereWindowRef window, int x, int y, int width, int height);
bool CocoaDispatch_OnLoadGraphics(EcereWindowRef window);
void CocoaDispatch_OnApplyGraphics(EcereWindowRef window);
void CocoaDispatch_OnUnloadGraphics(EcereWindowRef window);
void CocoaDispatch_Update(EcereWindowRef window);
bool CocoaDispatch_OnActivate(EcereWindowRef window, bool active, EcereWindowRef previous, bool *goOnWithActivation, bool direct);
void CocoaDispatch_OnActivateClient(EcereWindowRef window, EcereWindowRef client, EcereWindowRef previous);
//bool CocoaDispatch_OnKeyDown(EcereWindowRef window, Key key, unichar ch);
//bool CocoaDispatch_OnKeyUp(EcereWindowRef window, Key key, unichar ch);
//bool CocoaDispatch_OnKeyHit(EcereWindowRef window, Key key, unichar ch);
//bool CocoaDispatch_OnSysKeyDown(EcereWindowRef window, Key key, unichar ch);
//bool CocoaDispatch_OnSysKeyUp(EcereWindowRef window, Key key, unichar ch);
//bool CocoaDispatch_OnSysKeyHit(EcereWindowRef window, Key key, unichar ch);
//bool CocoaDispatch_OnMouseOver(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnMouseLeave(EcereWindowRef window, Modifiers mods);
//bool CocoaDispatch_OnMouseMove(EcereWindowRef window, int x, int y, Modifiers mods);
bool CocoaDispatch_OnLeftButtonDown(EcereWindowRef window, int x, int y, CocoaKeyMod mods);
//bool CocoaDispatch_OnLeftButtonUp(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnLeftDoubleClick(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnRightButtonDown(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnRightButtonUp(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnRightDoubleClick(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnMiddleButtonDown(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnMiddleButtonUp(EcereWindowRef window, int x, int y, Modifiers mods);
//bool CocoaDispatch_OnMiddleDoubleClick(EcereWindowRef window, int x, int y, Modifiers mods);
void CocoaDispatch_OnMouseCaptureLost(EcereWindowRef window);
//void CocoaDispatch_OnHScroll(EcereWindowRef window, ScrollBarAction action, int position, Key key);
//void CocoaDispatch_OnVScroll(EcereWindowRef window, ScrollBarAction action, int position, Key key);
//void CocoaDispatch_OnDrawOverChildren(EcereWindowRef window, Surface surface);
//bool CocoaDispatch_OnFileModified(EcereWindowRef window, FileChange fileChange, char * param);
bool CocoaDispatch_OnSaveFile(EcereWindowRef window, char *fileName);

#endif // !defined(_COCOAINTERFACE_H)
