#define MODULE_NAME  "button"

#include "ecere.h"

static eC_Class * class_HelloWindow;

struct class_members_HelloWindow { eC_Button button; };

typedef eC_Instance eC_HelloWindow;

static void HelloWindow_onRedraw(eC_HelloWindow this, eC_Surface surface)
{
   // Surface_writeTextf(surface, 100, 100, I18N("Testing stuff!"));
   Surface_writeTextf(surface, 100, 100, "%d + %d = %d", 2, 3, 2+3);
}

static eC_bool HelloWindow_button_notifyClicked(eC_HelloWindow this, eC_Button button, int x, int y, eC_Modifiers mods)
{
   eC_MessageBox msgBox = newi(MessageBox);
   double i = 3.14159265;
   char tmp[256];
   const char * s = _onGetString(class_double, &i, tmp, null, null);
   eC_printLn(class_String, "Hello! -- ", class_String, s, null);
   Window_set_caption(msgBox, $("Hello!"));
   MessageBox_set_contents(msgBox, $("C Bindings!"));
   Window_modal(msgBox);
   return true;
}

static eC_bool HelloWindow_constructor(eC_HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   Window_set_caption(this, $("My Second Ecere/C Bindings App"));
   Window_set_borderStyle(this, BorderStyle_sizable);
   Window_set_clientSize(this, &(eC_Size){ 640, 480 });
   Window_set_hasClose(this, true);
   Window_set_hasMaximize(this, true);
   Window_set_hasMinimize(this, true);
   Window_set_background(this, SystemColor_formColor);

   self->button = newi(Button);
   Window_set_parent(self->button, this);
   Window_set_position(self->button, &(eC_Point){ 200, 200 });
   Window_set_caption(self->button, $("Yay!!"));
   Instance_setMethod(self->button, "NotifyClicked", HelloWindow_button_notifyClicked);
   return true;
}

static void HelloWindow_destructor(eC_HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   deletei(self->button);
}

GUIAPP_INTRO
{
   class_HelloWindow = registerClass(app, HelloWindow, Window);
   addMethod(class_HelloWindow, "OnRedraw", HelloWindow_onRedraw);

   eC_HelloWindow hello = newi(HelloWindow);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
