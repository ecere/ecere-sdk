#include "ecere.h"

Class * class_Surface;

Method * method_Surface_writeTextf;

void (* Surface_writeTextf)(Surface s, int x, int y, const char * format, ...);

Class * class_BitmapResource;

Property * property_BitmapResource_fileName;

void (* BitmapResource_set_fileName)(BitmapResource f, constString v);
constString (* BitmapResource_get_fileName)(BitmapResource f);

Class * class_FontResource;

Property * property_FontResource_faceName;
Property * property_FontResource_size;
Property * property_FontResource_bold;
Property * property_FontResource_italic;
Property * property_FontResource_outlineSize;
Property * property_FontResource_outlineFade;

void (* FontResource_set_faceName)(FontResource f, constString v);
constString (* FontResource_get_faceName)(FontResource f);

void (* FontResource_set_size)(FontResource f, float v);
float (* FontResource_get_size)(FontResource f);

void (* FontResource_set_outlineSize)(FontResource f, float v);
float (* FontResource_get_outlineSize)(FontResource f);

void (* FontResource_set_outlineFade)(FontResource f, float v);
float (* FontResource_get_outlineFade)(FontResource f);

void (* FontResource_set_bold)(FontResource f, bool v);
bool (* FontResource_get_bold)(FontResource f);

void (* FontResource_set_italic)(FontResource f, bool v);
bool (* FontResource_get_italic)(FontResource f);

Class * class_Window;

int Window_onCreate_vTblID;
int Window_onRedraw_vTblID;

Property * property_Window_caption;
Property * property_Window_size;
Property * property_Window_clientSize;
Property * property_Window_hasClose;
Property * property_Window_hasMinimize;
Property * property_Window_hasMaximize;
Property * property_Window_borderStyle;
Property * property_Window_background;
Property * property_Window_foreground;
Property * property_Window_parent;
Property * property_Window_position;
Property * property_Window_anchor;
Property * property_Window_font;
Property * property_Window_displayDriver;

Method * method_Window_modal;
Method * method_Window_create;

Method * method_Window_onCreate;
Method * method_Window_onRedraw;

void (* Window_set_borderStyle)(Window w, BorderStyle v);
BorderStyle (* Window_get_borderStyle)(Window w);

void (* Window_set_size)(Window w, const Size * v);
void (* Window_get_size)(Window w, Size * v);

void (* Window_set_clientSize)(Window w, const Size * v);
void (* Window_get_clientSize)(Window w, Size * v);

void (* Window_set_hasClose)(Window w, bool v);
bool (* Window_get_hasClose)(Window w);

void (* Window_set_hasMaximize)(Window w, bool v);
bool (* Window_get_hasMaximize)(Window w);

void (* Window_set_hasMinimize)(Window w, bool v);
bool (* Window_get_hasMinimize)(Window w);

void (* Window_set_parent)(Window w, Window v);
Window (* Window_get_parent)(Window w);

void (* Window_set_background)(Window w, Color v);
Color (* Window_get_background)(Window w);

void (* Window_set_foreground)(Window w, Color v);
Color (* Window_get_foreground)(Window w);

void (* Window_set_position)(Window w, const Point * v);
void (* Window_get_position)(Window w, Point * v);

void (* Window_set_anchor)(Window w, const Anchor * v);
void (* Window_get_anchor)(Window w, Anchor * v);

void (* Window_set_font)(Window w, Instance v);
FontResource (* Window_get_font)(Window w);

void (* Window_set_caption)(Window w, constString v);
constString (* Window_get_caption)(Window w);

void (* Window_set_displayDriver)(Window w, constString v);
constString (* Window_get_displayDriver)(Window w);

DialogResult (* Window_modal)(Window);

bool (* Window_create)(Window);

Class * class_Button;

Method * method_Button_notifyClicked;

int Button_notifyClicked_vTblID;

Class * class_ToolButton;

Class * class_Label;

Class * class_Picture;

Property * property_Picture_image;

void (* Picture_set_image)(Picture p, BitmapResource v);
constString (* Picture_get_image)(Picture p);

Class * class_GuiApplication;

Class * class_MessageBox;

Property * property_MessageBox_contents;

void (* MessageBox_set_contents)(MessageBox m, constString v);
constString (* MessageBox_get_contents)(MessageBox m);

Module ecere_init(Module fromModule)
{
   Module module = Module_load(fromModule, "ecere", publicAccess);
   if(module)
   {
      // Set up all the class_*, property, method, function pointers ...
      class_Surface = eC_findClass(module, "Surface");
      if(class_Surface)
      {
         method_Surface_writeTextf = Class_findMethod(class_Surface, "WriteTextf", module);
         if(method_Surface_writeTextf)
            Surface_writeTextf = (void *)method_Surface_writeTextf->function;
      }

      class_FontResource = eC_findClass(module, "FontResource");
      if(class_FontResource)
      {
         property_FontResource_faceName = Class_findProperty(class_FontResource, "faceName", module);
         if(property_FontResource_faceName)
         {
            FontResource_set_faceName = (void *)property_FontResource_faceName->Set;
            FontResource_get_faceName = (void *)property_FontResource_faceName->Get;
         }

         property_FontResource_size = Class_findProperty(class_FontResource, "size", module);
         if(property_FontResource_size)
         {
            FontResource_set_size = (void *)property_FontResource_size->Set;
            FontResource_get_size = (void *)property_FontResource_size->Get;
         }

         property_FontResource_bold = Class_findProperty(class_FontResource, "bold", module);
         if(property_FontResource_bold)
         {
            FontResource_set_bold = (void *)property_FontResource_bold->Set;
            FontResource_get_bold = (void *)property_FontResource_bold->Get;
         }

         property_FontResource_italic = Class_findProperty(class_FontResource, "italic", module);
         if(property_FontResource_italic)
         {
            FontResource_set_italic = (void *)property_FontResource_italic->Set;
            FontResource_get_italic = (void *)property_FontResource_italic->Get;
         }

         property_FontResource_outlineSize = Class_findProperty(class_FontResource, "outlineSize", module);
         if(property_FontResource_outlineSize)
         {
            FontResource_set_outlineSize = (void *)property_FontResource_outlineSize->Set;
            FontResource_get_outlineSize = (void *)property_FontResource_outlineSize->Get;
         }

         property_FontResource_outlineFade = Class_findProperty(class_FontResource, "outlineFade", module);
         if(property_FontResource_outlineFade)
         {
            FontResource_set_outlineFade = (void *)property_FontResource_outlineFade->Set;
            FontResource_get_outlineFade = (void *)property_FontResource_outlineFade->Get;
         }
      }

      class_BitmapResource = eC_findClass(module, "BitmapResource");
      if(class_BitmapResource)
      {
         property_BitmapResource_fileName = Class_findProperty(class_BitmapResource, "fileName", module);
         if(property_BitmapResource_fileName)
         {
            BitmapResource_set_fileName = (void *)property_BitmapResource_fileName->Set;
            BitmapResource_get_fileName = (void *)property_BitmapResource_fileName->Get;
         }
      }

      class_Window = eC_findClass(module, "Window");
      if(class_Window)
      {
         method_Window_modal = Class_findMethod(class_Window, "Modal", module);
         if(method_Window_modal)
            Window_modal = (void *)method_Window_modal->function;

         method_Window_create = Class_findMethod(class_Window, "Create", module);
         if(method_Window_create)
            Window_create = (void *)method_Window_create->function;

         method_Window_onCreate = Class_findMethod(class_Window, "OnCreate", module);
         if(method_Window_onCreate)
            Window_onCreate_vTblID = method_Window_onCreate->vid;
         method_Window_onRedraw = Class_findMethod(class_Window, "OnRedraw", module);
         if(method_Window_onRedraw)
            Window_onRedraw_vTblID = method_Window_onRedraw->vid;

         property_Window_displayDriver = Class_findProperty(class_Window, "displayDriver", module);
         if(property_Window_displayDriver)
         {
            Window_set_displayDriver = (void *)property_Window_displayDriver->Set;
            Window_get_displayDriver = (void *)property_Window_displayDriver->Get;
         }

         property_Window_caption = Class_findProperty(class_Window, "caption", module);
         if(property_Window_caption)
         {
            Window_set_caption = (void *)property_Window_caption->Set;
            Window_get_caption = (void *)property_Window_caption->Get;
         }

         property_Window_size = Class_findProperty(class_Window, "size", module);
         if(property_Window_size)
         {
            Window_set_size = (void *)property_Window_size->Set;
            Window_get_size = (void *)property_Window_size->Get;
         }

         property_Window_clientSize = Class_findProperty(class_Window, "clientSize", module);
         if(property_Window_clientSize)
         {
            Window_set_clientSize = (void *)property_Window_clientSize->Set;
            Window_get_clientSize = (void *)property_Window_clientSize->Get;
         }

         property_Window_borderStyle = Class_findProperty(class_Window, "borderStyle", module);
         if(property_Window_borderStyle)
         {
            Window_set_borderStyle = (void *)property_Window_borderStyle->Set;
            Window_get_borderStyle = (void *)property_Window_borderStyle->Get;
         }

         property_Window_background = Class_findProperty(class_Window, "background", module);
         if(property_Window_background)
         {
            Window_set_background = (void *)property_Window_background->Set;
            Window_get_background = (void *)property_Window_background->Get;
         }

         property_Window_foreground = Class_findProperty(class_Window, "foreground", module);
         if(property_Window_foreground)
         {
            Window_set_foreground = (void *)property_Window_foreground->Set;
            Window_get_foreground = (void *)property_Window_foreground->Get;
         }

         property_Window_hasClose = Class_findProperty(class_Window, "hasClose", module);
         if(property_Window_hasClose)
         {
            Window_set_hasClose = (void *)property_Window_hasClose->Set;
            Window_get_hasClose = (void *)property_Window_hasClose->Get;
         }

         property_Window_hasMinimize = Class_findProperty(class_Window, "hasMinimize", module);
         if(property_Window_hasMinimize)
         {
            Window_set_hasMinimize = (void *)property_Window_hasMinimize->Set;
            Window_get_hasMinimize = (void *)property_Window_hasMinimize->Get;
         }

         property_Window_hasMaximize = Class_findProperty(class_Window, "hasMaximize", module);
         if(property_Window_hasMaximize)
         {
            Window_set_hasMaximize = (void *)property_Window_hasMaximize->Set;
            Window_get_hasMaximize = (void *)property_Window_hasMaximize->Get;
         }

         property_Window_parent = Class_findProperty(class_Window, "parent", module);
         if(property_Window_parent)
         {
            Window_set_parent = (void *)property_Window_parent->Set;
            Window_get_parent = (void *)property_Window_parent->Get;
         }

         property_Window_position = Class_findProperty(class_Window, "position", module);
         if(property_Window_position)
         {
            Window_set_position = (void *)property_Window_position->Set;
            Window_get_position = (void *)property_Window_position->Get;
         }

         property_Window_anchor = Class_findProperty(class_Window, "anchor", module);
         if(property_Window_anchor)
         {
            Window_set_anchor = (void *)property_Window_anchor->Set;
            Window_get_anchor = (void *)property_Window_anchor->Get;
         }

         property_Window_font = Class_findProperty(class_Window, "font", module);
         if(property_Window_font)
         {
            Window_set_font = (void *)property_Window_font->Set;
            Window_get_font = (void *)property_Window_font->Get;
         }
      }

      class_Label = eC_findClass(module, "Label");

      class_Button = eC_findClass(module, "Button");
      if(class_Button)
      {
         method_Button_notifyClicked = Class_findMethod(class_Button, "NotifyClicked", module);
         if(method_Button_notifyClicked)
            Button_notifyClicked_vTblID = method_Button_notifyClicked->vid;
      }

      class_Picture = eC_findClass(module, "Picture");
      if(class_Picture)
      {
         property_Picture_image = Class_findProperty(class_Picture, "image", module);
         if(property_Picture_image)
         {
            Picture_set_image = (void *)property_Picture_image->Set;
            Picture_get_image = (void *)property_Picture_image->Get;
         }
      }

      class_MessageBox = eC_findClass(module, "MessageBox");
      if(class_MessageBox)
      {
         property_MessageBox_contents = Class_findProperty(class_MessageBox, "contents", module);
         if(property_MessageBox_contents)
         {
            MessageBox_set_contents = (void *)property_MessageBox_contents->Set;
            MessageBox_get_contents = (void *)property_MessageBox_contents->Get;
         }
      }

      class_GuiApplication = eC_findClass(module, "GuiApplication");
   }
   return module;
}
