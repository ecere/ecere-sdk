#define MODULE_NAME  "module"

#include "ecere.h"

static eC_Class * class_HelloWindow;

struct class_members_HelloWindow { eC_Label label; eC_Button button; };

typedef eC_Instance eC_HelloWindow;

static eC_bool HelloWindow_button_notifyClicked(eC_HelloWindow this, eC_Button button, int x, int y, eC_Modifiers mods)
{
   eC_MessageBox msgBox = newi(MessageBox);
   double i = 3.14159265;
   char tmp[256];
   //constString s = _onGetString(class_double, &i, tmp, null, null);
   const char * s = _onGetString(class_double, &i, tmp, null, null);

   eC_printLn(class_String, "Hello! -- ", class_String, s, null);
   Window_set_caption(msgBox, $("Hello!"));
   MessageBox_set_contents(msgBox, $("C Bindings!"));
   Window_modal(msgBox);

   // Recursive call to test Button_notifyClicked():
   Button_notifyClicked(button, this, button, x, y, mods);
   return true;
}

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
   eC_String s = Instance_onGetString(0, font, tmp, null, null);
   printLn(class_String, s, null);*/

   self->label = newi(Label);
   Window_set_parent(self->label, this);
   Window_set_position(self->label, &(eC_Point){ 10, 10 });
   Window_set_font(self->label, font);
   Window_set_caption(self->label, $("Hello, Bindings!!"));

   self->button = newi(Button);
   Window_set_parent(self->button, this);
   Window_set_position(self->button, &(eC_Point){ 10, 70 });
   Window_set_font(self->button, font);
   Window_set_caption(self->button, $("Push!! (recursive)"));
   Instance_setMethod(self->button, "NotifyClicked", HelloWindow_button_notifyClicked);
   return true;
}

static void HelloWindow_destructor(eC_HelloWindow this)
{
   struct class_members_HelloWindow * self = IPTR(this, HelloWindow);
   deletei(self->label);
}

MODULE_LOAD
{
   eC_init(module, true, false, 0, null);
   ecere_init(module);
   loadTranslatedStrings(null, MODULE_NAME);
   class_HelloWindow = registerClass(module, HelloWindow, Window);
   return true;
}

MODULE_UNLOAD
{
   unloadTranslatedStrings(MODULE_NAME);
   return true;
}
