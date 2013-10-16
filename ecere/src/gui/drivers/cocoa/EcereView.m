#import <Cocoa/Cocoa.h>
#import "CocoaEcereBridge.h"
#import "EcereView.h"

@implementation EcereView
- (EcereView*)initWithEcereWindow:(EcereWindowRef)ecereWindow;
{
    self = [super initWithFrame:NSZeroRect];

    lockCount = 0;

    if (self != nil)
    {
        NSOpenGLPixelFormatAttribute attributes[] =
        {
            NSOpenGLPFAWindow,
            //NSOpenGLPFAAccelerated,
            NSOpenGLPFADoubleBuffer,
            //NSOpenGLPFAColorSize, 24,
            NSOpenGLPFAAlphaSize, 8,
            NSOpenGLPFADepthSize, 24,
            NSOpenGLPFAMinimumPolicy,
            // select a pixelformat which meets or
            // exceeds these requirements
            0
        };

        _pixelformat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attributes] ;

        if (_pixelformat == nil)
        {
            NSLog( @"No valid OpenGL pixel format" );
            NSLog( @"matching attributes specified" );
            exit(1);
        }

        [self setEcereWindow:ecereWindow];

        _context = [[NSOpenGLContext alloc]
            initWithFormat:_pixelformat shareContext:nil] ;

        if (_context == nil)
        {
            // Failed initialization
            self = nil;
            NSLog( @"No valid OpenGL" ) ;
            exit(1);
        }
        else
        {
            // ensure we are pointing to ourself as the Drawable
            [_context setView:self];
        }
    }

    if (_context == nil) {
        self = nil;
    }

    return self;
}

- (void)Dealloc
{
    [_context release];
}

- (NSOpenGLContext*)openGLContext
{
    return _context;
}

- (void)lockFocus
{
    // ensure we are ready to draw
    lockCount++;

    [_context setView:self];
    [super lockFocus];

    [self makeCurrentContext];

    printf("- (void)lockFocus(%i)\n", lockCount);
}

- (void)unlockFocus
{
    lockCount--;

    [self flushOpenGLBuffer];

    [super unlockFocus];

    printf("- (void)unlockFocus(%i)\n", lockCount);
}

- (void)makeCurrentContext
{
    printf("- (void)makeCurrentContext\n");

    [_context makeCurrentContext];
}

- (void)flushOpenGLBuffer
{
    printf("- (void)flushOpenGLBuffer\n");

    [_context flushBuffer];
}

- (BOOL)isOpaque
{
    return YES;
}

- drawRect:(NSRect)rect
{
    // make us the current OpenGL context
    //[_context makeCurrentContext];
    printf("- drawRect:(NSRect)rect\n");
    CocoaDispatch_Update([self ecereWindow]);
}

- (void)viewDidMoveToWindow
{
    // Register with window for resize and move notification.
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(windowResized:)
        name:NSWindowDidResizeNotification
        object:[self window]];

    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(windowMoved:)
        name:NSWindowDidMoveNotification
        object:[self window]];
}

- (void)windowResized:(NSNotification *)notification
{
    [_context update];

    NSRect rect = [[self window] frame];

    CocoaDispatch_ExternalPosition([self ecereWindow], rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);

    printf("- (void)windowResized:(NSNotification *)notification\n");
}

- (void)windowMoved:(NSNotification *)notification;
{
    [_context update];

    NSRect rect = [[self window] frame];

    CocoaDispatch_ExternalPosition([self ecereWindow], rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);

    printf("- (void)windowMoved:(NSNotification *)notification\n");
}

- (EcereWindowRef)ecereWindow
{
    return _ecereWindow;
}

- setEcereWindow:(EcereWindowRef)ecereWindow
{
    _ecereWindow = ecereWindow;
}

- (void)mouseDown:(NSEvent *)event
{
    NSPoint location = [NSEvent mouseLocation];

    CocoaKeyMod mod;

    CocoaDispatch_OnLeftButtonDown([self ecereWindow], location.x, location.y, mod);
}

- (CocoaColor)foreground
{
    return _foreground;
}

- (void)setForeground:(CocoaColor)color
{
    _foreground = color;
}

- (CocoaColor)background
{
    return _background;
}

- (void)setBackground:(CocoaColor)color
{
    _background = color;
}

@end


