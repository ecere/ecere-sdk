#import <Cocoa/Cocoa.h>

#import "CocoaEcereBridge.h"
#import "EcereView.h"

bool CocoaInitialize()
{
    [[NSAutoreleasePool alloc] init];
    [NSApplication sharedApplication];

    [NSOpenGLContext clearCurrentContext];

    return true;
}


void CocoaTerminate()
{
    [NSApp release];
}

bool CocoaProcessInput(bool processAll)
{
    NSEvent *event = NULL;
    NSDate *date;
    unsigned int eventMask;

    eventMask = (NSAnyEventMask);

    do {
        event = [
            NSApp nextEventMatchingMask:eventMask
            untilDate:nil
            inMode:NSDefaultRunLoopMode
            dequeue:YES];

        [NSApp sendEvent:event];
        if ([event type])
            printf("e%i\n", [event type]);
    } while (event && processAll);

    return true;
}

bool CocoaLock(WindowHandle handle)
{
    EcereView *view = (EcereView*)handle;

    [view lockFocus];

    return true;
}

void CocoaUnlock(WindowHandle handle)
{
    EcereView *view = (EcereView*)handle;

    [view unlockFocus];
}

void CocoaGetCurrentMode(bool * fullScreen, int * resolution, int * colorDepth, int * refreshRate)
{
    *fullScreen = false;
    *resolution = -1;
    *colorDepth = -1;
    *refreshRate = -1;
}

WindowHandle CocoaCreateRootWindow(EcereWindowRef ecereWindow)
{
    NSWindow *window = [[NSWindow alloc]
        initWithContentRect:NSZeroRect
        styleMask:( NSResizableWindowMask | NSClosableWindowMask | NSTitledWindowMask)
        backing:NSBackingStoreBuffered
        defer:NO
        screen:nil];

    EcereView *view = [[EcereView alloc] initWithEcereWindow:ecereWindow];
	[window setContentView:view];

    if (window) {
        [window makeKeyAndOrderFront:window];
    }

    return view;
}

void CocoaDestroyRootWindow(WindowHandle handle)
{
    EcereView *view = (EcereView*)handle;

    [[view window] release];
    [view release];
}

void CocoaSetRootWindowCaption(WindowHandle handle, const char *name)
{
    EcereView *view = (EcereView*)handle;

    NSString *title = [NSString stringWithCString:name];

    [[view window] setTitle:title];

    [title release];
}

void CocoaPositionRootWindow(WindowHandle handle, int x, int y, int w, int h, bool move, bool resize)
{
    EcereView *view = (EcereView*)handle;

    NSRect frame = [[view window] frame];

    if (move) {
        frame.origin.x = x;
        frame.origin.y = y;
    }

    if (resize) {
        frame.size.width = w;
        frame.size.height = h;
    }

    [[view window] setFrame:frame display:YES];
}

void CocoaOffsetWindow(WindowHandle handle, int *x, int *y)
{
}

void CocoaGetMousePosition(int *x, int *y)
{
    NSPoint location;
    location = [NSEvent mouseLocation];

    *x = location.x;
    *y = location.y;
}

void CocoaOpenGLMakeCurrentContext(WindowHandle handle)
{
    EcereView *view = (EcereView*)handle;

    [view makeCurrentContext];
}

void CocoaOpenGLUpdate(WindowHandle handle)
{
    EcereView *view = (EcereView*)handle;

    [view flushOpenGLBuffer];
}



