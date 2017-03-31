#define MODULE_NAME  "button"

#include "ecere.h"

static Class * CO(HelloWindow);

struct CM(HelloWindow) { Button button; };

typedef Instance HelloWindow;

static void HelloWindow_onRedraw(HelloWindow this, Surface surface)
{
   // Surface_writeTextf(surface, 100, 100, I18N("Testing stuff!"));
   Surface_writeTextf(surface, 100, 100, "%d + %d = %d", 2, 3, 2+3);
}

static bool HelloWindow_button_notifyClicked(HelloWindow this, Button button, int x, int y, Modifiers mods)
{
   MessageBox msgBox = newi(MessageBox);
   double i = 3.14159265;
   char tmp[256];
   const char * s = _onGetString(CO(double), &i, tmp, null, null);
   printLn(CO(String), "Hello! -- ", CO(String), s, null); // Need to terminate with a null!
   Window_set_caption(msgBox, $("Hello!"));
   MessageBox_set_contents(msgBox, $("C Bindings!"));
   Window_modal(msgBox);
   return true;
}

static bool HelloWindow_constructor(HelloWindow this)
{
   struct CM(HelloWindow) * self = IPTR(this, HelloWindow);
   Window_set_caption(this, $("My Second Ecere/C Bindings App"));
   Window_set_borderStyle(this, BorderStyle_sizable);
   Window_set_clientSize(this, &(Size){ 640, 480 });
   Window_set_hasClose(this, true);
   Window_set_hasMaximize(this, true);
   Window_set_hasMinimize(this, true);
   Window_set_background(this, SystemColor_formColor);

   self->button = newi(Button);
   Window_set_parent(self->button, this);
   Window_set_position(self->button, &(Point){ 200, 200 });
   Window_set_caption(self->button, $("Yay!!"));
   Instance_setMethod(self->button, "NotifyClicked", HelloWindow_button_notifyClicked);
   return true;
}

static void HelloWindow_destructor(HelloWindow this)
{
   struct CM(HelloWindow) * self = IPTR(this, HelloWindow);
   deletei(self->button);
}

GUIAPP_INTRO
{
   CO(HelloWindow) = registerClass(app, HelloWindow, Window);
   addMethod(CO(HelloWindow), "OnRedraw", HelloWindow_onRedraw);

   HelloWindow hello = newi(HelloWindow);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
