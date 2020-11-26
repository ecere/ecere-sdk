#define MODULE_NAME  "gui"

#include "ecere.h"

static Class * class_HelloWindow;

struct class_members_HelloWindow { Label label; };

typedef Instance HelloWindow;

static bool HelloWindow_constructor(HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   Window_set_caption(this, $("My First Ecere/C Bindings App"));
   Window_set_borderStyle(this, BorderStyle_sizable);
   Window_set_size(this, &(Size){ 380, 190 });
   Window_set_hasClose(this, true);

   FontResource font = newi(FontResource);
   FontResource_set_faceName(font, "Arial");
   FontResource_set_size(font, 30);

   /*char tmp[256];
   String s = Instance_onGetString(0, font, tmp, null, null);
   printLn(class_String, s, null);*/

   self->label = newi(Label);
   Window_set_parent(self->label, this);
   Window_set_position(self->label, &(Point){ 10, 10 });
   Window_set_font(self->label, font);
   Window_set_caption(self->label, $("Hello, Bindings!!"));
   return true;
}

static void HelloWindow_destructor(HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   deletei(self->label);
}

GUIAPP_INTRO
{
   class_HelloWindow = registerClass(app, HelloWindow, Window);
   HelloWindow hello = newi(HelloWindow);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
