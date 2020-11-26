#define MODULE_NAME  "gui"

#include "ecere.h"

static eC_Class * class_HelloWindow;

struct class_members_HelloWindow { eC_Label label; };

typedef eC_Instance eC_HelloWindow;

static eC_bool HelloWindow_constructor(eC_HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   Window_set_caption(this, $("My First Ecere/C Bindings App"));
   Window_set_borderStyle(this, BorderStyle_sizable);
   Window_set_size(this, &(eC_Size){ 380, 190 });
   Window_set_hasClose(this, true);

   eC_FontResource font = newi(FontResource);
   FontResource_set_faceName(font, "Arial");
   FontResource_set_size(font, 30);

   /*char tmp[256];
   String s = Instance_onGetString(0, font, tmp, null, null);
   PrintLn(class_String, s, null);  // Need to terminate with a null!*/

   self->label = newi(Label);
   Window_set_parent(self->label, this);
   Window_set_position(self->label, &(eC_Point){ 10, 10 });
   Window_set_font(self->label, font);
   Window_set_caption(self->label, $("Hello, Bindings!!"));
   return true;
}

static void HelloWindow_destructor(eC_HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   deletei(self->label);
}

GUIAPP_INTRO
{
   class_HelloWindow = registerClass(app, HelloWindow, Window);
   eC_HelloWindow hello = newi(HelloWindow);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
