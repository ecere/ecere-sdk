#include <stdint.h>

typedef uint32_t CocoaColor;

@interface EcereView : NSView
{
@private
    // Reference to the Ecere Window class via pointer. Used for callbacks.
    EcereWindowRef _ecereWindow;
    
    // Foreground and background draw color.
    CocoaColor _foreground;
    CocoaColor _background;
    
    int lockCount;
    
    NSOpenGLContext *_context;
    NSOpenGLPixelFormat *_pixelformat;
}
- (EcereView*)initWithEcereWindow:(EcereWindowRef)ecereWindow;
- (NSOpenGLContext*)openGLContext;
- (void)lockFOcus;
- (void)makeCurrentContext;
- (void)flushOpenGLBuffer;
- (EcereWindowRef)ecereWindow;
- (void)setEcereWindow:(EcereWindowRef)ecereWindow;
- (CocoaColor)foreground;
- (void)setForeground:(CocoaColor)color;
- (CocoaColor)background;
- (void)setBackground:(CocoaColor)color;
@end


