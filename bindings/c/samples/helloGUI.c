#define MODULE_NAME  "HelloForm"
// #define __CONSOLE_APP__

#include "ecere.h"

static Class * class_HelloForm;

struct HelloForm { Label label; };

typedef Instance HelloForm;

static bool HelloForm_constructor(HelloForm this)
{
   struct HelloForm * self = IPTR(this, HelloForm);
   Window_set_caption(this, $("My First Ecere/C Bindings App"));
   Window_set_borderStyle(this, sizable);
   Window_set_size(this, &(Size){ 380, 190 });
   Window_set_hasClose(this, true);

   FontResource font = newi(class_FontResource);
   FontResource_set_faceName(font, "Arial");
   FontResource_set_size(font, 30);

   /*char tmp[256];
   String s = Instance_onGetString(0, font, tmp, null, null);
   PrintLn(class_String, s, null);  // Need to terminate with a null!*/

   self->label = newi(class_Label);
   Window_set_parent(self->label, this);
   Window_set_position(self->label, &(Point){ 10, 10 });
   Window_set_font(self->label, font);
   Window_set_caption(self->label, $("Hello, Bindings!!"));
   return true;
}

static void HelloForm_destructor(HelloForm this)
{
   struct HelloForm * self = IPTR(this, HelloForm);
   deletei(self->label);
}

GUIAPP_INTRO
{
   class_HelloForm = registerClass(app, HelloForm, Window);
   HelloForm hello = newi(class_HelloForm);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
