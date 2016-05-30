#define MODULE_NAME  "HelloForm"
// #define __CONSOLE_APP__

#include "ecere.h"

static Class * class_HelloForm2;

struct HelloForm2 { Button button; };

typedef Instance HelloForm2;

static void HelloForm2_onRedraw(HelloForm2 this, Surface surface)
{
   // Surface_writeTextf(surface, 100, 100, I18N("Testing stuff!"));
   Surface_writeTextf(surface, 100, 100, "%d + %d = %d", 2, 3, 2+3);
}

static bool HelloForm2_button_notifyClicked(HelloForm2 this, Button button, int x, int y, Modifiers mods)
{
   MessageBox msgBox = newi(class_MessageBox);
   double i = 3.14159265;
   char tmp[256];
   constString s = onGetString(class_double, &i, tmp, null, null);

   PrintLn(class_String, "Hello! -- ", class_String, s, null); // Need to terminate with a null!
   Window_set_caption(msgBox, $("Hello!"));
   MessageBox_set_contents(msgBox, $("C Bindings!"));
   Window_modal(msgBox);
   return true;
}

static bool HelloForm2_constructor(HelloForm2 this)
{
   struct HelloForm2 * self = IPTR(this, HelloForm2);
   Window_set_caption(this, $("My Second Ecere/C Bindings App"));
   Window_set_borderStyle(this, sizable);
   Window_set_clientSize(this, &(Size){ 640, 480 });
   Window_set_hasClose(this, true);
   Window_set_hasMaximize(this, true);
   Window_set_hasMinimize(this, true);
   Window_set_background(this, formColor);

   self->button = newi(class_Button);
   Window_set_parent(self->button, this);
   Window_set_position(self->button, &(Point){ 200, 200 });
   Window_set_caption(self->button, $("Yay!!"));
   Instance_setMethod(self->button, "NotifyClicked", HelloForm2_button_notifyClicked);
   return true;
}

static void HelloForm2_destructor(HelloForm2 this)
{
   struct HelloForm2 * self = IPTR(this, HelloForm2);
   deletei(self->button);
}

GUIAPP_INTRO
{
   class_HelloForm2 = registerClass(app, HelloForm2, Window);
   addMethod(class_HelloForm2, "OnRedraw", HelloForm2_onRedraw);

   HelloForm2 hello = newi(class_HelloForm2);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
