namespace gui::drivers;

import "instance"
import "CocoaOpenGLDisplayDriver"

default:

private:

import "Interface"
#include "CocoaEcereBridge.h"

class CocoaInterface : Interface
{
    class_property(name) = "Cocoa";

    // --- User Interface System ---
    bool Initialize()
    {
        bool result;

        printf("Initialize %s:%i\n", __FILE__, __LINE__);
        result = CocoaInitialize();

        return result;
    }

    void Terminate()
    {
        printf("Terminate %s:%i\n", __FILE__, __LINE__);
        CocoaTerminate();
    }

    bool ProcessInput(bool processAll)
    {
        bool result;

        //printf("ProcessInput %s:%i\n", __FILE__, __LINE__);
        result = CocoaProcessInput(processAll);

        return result;
    }

    void Wait()
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void Lock(Window window)
    {
        // TODO:
        printf("Lock %s:%i\n", __FILE__, __LINE__);
    }

    void Unlock(Window window)
    {
        // TODO:
        printf("Unlock %s:%i\n", __FILE__, __LINE__);
    }

    const char **GraphicsDrivers(int *numDrivers)
    {
        static const char *graphicsDrivers[] = { "CocoaOpenGL" };
        *numDrivers = sizeof(graphicsDrivers) / sizeof(char *);

        return (char **)graphicsDrivers;
    }

    void GetCurrentMode(bool * fullScreen, int * resolution, int * colorDepth, int * refreshRate)
    {
        printf("GetCurrentMode %s:%i\n", __FILE__, __LINE__);
        CocoaGetCurrentMode(fullScreen, resolution, colorDepth, refreshRate);
    }

    void EnsureFullScreen(bool *fullScreen)
    {
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
        *fullScreen = false;
    }

    bool ScreenMode(bool fullScreen, int resolution, int colorDepth, int refreshRate, bool * textMode)
    {
        printf("STUB! %s:%i\n", __FILE__, __LINE__);

        *textMode = false;
        return true;
    }

    // --- Window Creation ---
    void * CreateRootWindow(Window window)
    {
        // TODO:
        printf("CreateRootWindow %s:%i\n", __FILE__, __LINE__);
        window.windowHandle = CocoaCreateRootWindow(window);

        return window.windowHandle;
    }

    void DestroyRootWindow(Window window)
    {
        printf("DestroyRootWindow %s:%i\n", __FILE__, __LINE__);
        CocoaDestroyRootWindow(window.windowHandle);
    }

    // -- Window manipulation ---

    void SetRootWindowCaption(Window window, const char * name)
    {
        printf("SetRootWindowCaption %s:%i\n", __FILE__, __LINE__);
        CocoaSetRootWindowCaption(window.windowHandle, name);
    }

    void PositionRootWindow(Window window, int x, int y, int w, int h, bool move, bool resize)
    {
        printf("PositionRootWindow %s:%i\n", __FILE__, __LINE__);
        CocoaPositionRootWindow(window.windowHandle, x, y, w, h, move, resize);
    }

    void OrderRootWindow(Window window, bool topMost)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void SetRootWindowColor(Window window)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void OffsetWindow(Window window, int *x, int *y)
    {
        //printf("OffsetWindow %s:%i\n", __FILE__, __LINE__);
        CocoaOffsetWindow(window.windowHandle, x, y);
    }

    void UpdateRootWindow(Window window)
    {
        // TODO:
        printf("UpdateRootWindow! %s:%i\n", __FILE__, __LINE__);
        CocoaDispatch_UpdateRootWindow(window);
    }

    void SetRootWindowState(Window window, WindowState state, bool visible)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void FlashRootWindow(Window window)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void ActivateRootWindow(Window window)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    // --- Mouse-based window movement ---

    void StartMoving(Window window, int x, int y, bool fromKeyBoard)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void StopMoving(Window window)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    // -- Mouse manipulation ---

    void GetMousePosition(int *x, int *y)
    {
        CocoaGetMousePosition(x, y);
        //printf("GetMousePosition(%i,%i) %s:%i\n", *x, *y, __FILE__, __LINE__);
    }

    void SetMousePosition(int x, int y)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void SetMouseRange(Window window, Box box)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void SetMouseCapture(Window window)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    // -- Mouse cursor ---

    void SetMouseCursor(Window window, int cursor)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    // --- Caret ---

    void SetCaret(int x, int y, int size)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void ClearClipboard()
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    bool AllocateClipboard(ClipBoard clipBoard, uint size)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    bool SaveClipboard(ClipBoard clipBoard)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    bool LoadClipboard(ClipBoard clipBoard)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void UnloadClipboard(ClipBoard clipBoard)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    // --- State based input ---

    bool AcquireInput(Window window, bool state)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
        return false;
    }

    bool GetMouseState(MouseButtons * buttons, int * x, int * y)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    bool GetJoystickState(int device, Joystick joystick)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    bool GetKeyState(Key key)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    void SetTimerResolution(uint hertz)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);
    }

    bool SetIcon(Window window, BitmapResource resource)
    {
        // TODO:
        printf("STUB! %s:%i\n", __FILE__, __LINE__);

        return true;
    }
}


