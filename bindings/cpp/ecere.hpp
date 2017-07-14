/****************************************************************************
===========================================================================
   Ecere Module
===========================================================================
****************************************************************************/
#if !defined(__ECERE_HPP__)
#define __ECERE_HPP__

#include "eC.hpp"
#include "ecere.h"


typedef C(Modifiers) Modifiers;
typedef C(DataDisplayFlags) DataDisplayFlags;
typedef C(Alignment) Alignment;

/****************************************************************************
   ecere::gfx Namespace
****************************************************************************/
///////////// Surface Class /////////////////////////////////////////////////
class Surface : public Instance
{
public:
   CONSTRUCT(Surface, Instance) { }

   inline void writeTextf(int x, int y, const char * format, ...)
   {
      Surface_writeTextf(impl, x, y, format);   // var args are a pain to pass...
   }
};

///////////// FontResource Class /////////////////////////////////////////////////
class FontResource : public Instance
{
public:
   CONSTRUCT(FontResource, Instance) { }

   REGISTER(); // { Instance_class_registration(FontResource); }

   inline FontResource(constString faceName, float size = 10, C(bool) bold = false, C(bool) italic = false) : FontResource()
   {
      this->faceName = faceName;
      this->size = size;
      this->bold = bold;
      this->italic = italic;
   }

   property(bold,
      set(C(bool), bold, FontResource, FontResource_set_bold(self ? self->impl : null, v))
      get(C(bool), bold, FontResource, return FontResource_get_bold(self ? self->impl : null))
   );
   property(italic,
      set(C(bool), italic, FontResource, FontResource_set_italic(self ? self->impl : null, v))
      get(C(bool), italic, FontResource, return FontResource_get_italic(self ? self->impl : null))
   );
   property(faceName,
      set(constString, faceName, FontResource, FontResource_set_faceName(self ? self->impl : null, v))
      get(constString, faceName, FontResource, return FontResource_get_faceName(self ? self->impl : null))
   );
   property(size,
      set(float, size, FontResource, FontResource_set_size(self ? self->impl : null, v))
      get(float, size, FontResource, return FontResource_get_size(self ? self->impl : null))
   );
};

/****************************************************************************
   ecere::gui Namespace
****************************************************************************/
///////////// Window Class /////////////////////////////////////////////////
#define Window_class_registration(d) \
   REGISTER_METHOD("OnRedraw", onRedraw, Window, d, void, (C(Window) o, C(Surface) s),   o, o, Surface surface(s); return fn(*i, surface), (o, s), ); \
   REGISTER_METHOD("OnCreate", onCreate, Window, d, bool, (C(Window) o),                 o, o, return fn(*i),                        (o),    true);

class Window : public Instance
{
public:
   CONSTRUCT(Window, Instance) { }

   REGISTER() { Window_class_registration(Window); }

   VIRTUAL_METHOD(onCreate, Window, Window, bool, Window &, , ,
      return Window_onCreate(self->impl));
   VIRTUAL_METHOD(onRedraw, Window, Window, void, Window & _ARG, , Surface & surface,
      return Window_onRedraw(self->impl, surface.impl));

   C(DialogResult) modal() { return Window_modal(impl); }

   // TOCHECK: See if we'll need set/get methods in addition to 'properties' for SWIG
   //void set_size(const Size & v) { Window_set_size(impl, &v); }
   //void set_hasClose(C(bool) v)  { Window_set_hasClose(impl, v); }

   property(parent,
      set(const Window &, parent, Window, Window_set_parent(self ? self->impl : null, v.impl))
      get(Window &, parent, Window,
         C(Instance) i = Window_get_parent(self ? self->impl : null);
         return *(Window *)_INSTANCE(i, Window::_class.impl))

      _set(const Window *, parent, Window, Window_set_parent(self ? self->impl : null, v ? v->impl : null))
      get(Window *, parent, Window,
         C(Instance) i = Window_get_parent(self ? self->impl : null);
         return i ? (Window *)_INSTANCE(i, Window::_class.impl) : null)

      get(Window, parent, Window, return Window(Window_get_parent(self ? self->impl : null)));
   );
   property(size,
      set(const C(Size) &, size, Window, Window_set_size(self ? self->impl : null, &v))
      get(C(Size), size, Window, { C(Size) v; Window_get_size(self ? self->impl : null, &v); return v; })
   );
   property(clientSize,
      set(const C(Size) &, clientSize, Window, Window_set_clientSize(self ? self->impl : null, &v))
      get(C(Size),         clientSize, Window, { C(Size) v; Window_get_clientSize(self ? self->impl : null, &v); return v; })
   );
   property(position,
      set(const C(Point) &, position, Window, Window_set_position(self ? self->impl : null, &v))
      get(C(Point),         position, Window, { C(Point) v; Window_get_position(self ? self->impl : null, &v); return v; })
   );
   property(hasClose,
      set(C(bool), hasClose, Window, Window_set_hasClose(self ? self->impl : null, v))
      get(C(bool), hasClose, Window, return Window_get_hasClose(self ? self->impl : null))
   );
   property(hasMinimize,
      set(C(bool), hasMinimize, Window, Window_set_hasMinimize(self ? self->impl : null, v))
      get(C(bool), hasMinimize, Window, return Window_get_hasMinimize(self ? self->impl : null))
   );
   property(hasMaximize,
      set(C(bool), hasMaximize, Window, Window_set_hasMaximize(self ? self->impl : null, v))
      get(C(bool), hasMaximize, Window, return Window_get_hasMaximize(self ? self->impl : null))
   );
   property(caption,
      set(constString, caption, Window, Window_set_caption(self ? self->impl : null, v))
      get(constString, caption, Window, return Window_get_caption(self ? self->impl : null))
   );
   property(displayDriver,
      set(constString, displayDriver, Window, Window_set_displayDriver(self ? self->impl : null, v))
      get(constString, displayDriver, Window, return Window_get_displayDriver(self ? self->impl : null))
   );
   property(font,
      set(const FontResource &, font, Window, Window_set_font(self ? self->impl : null, v.impl))
      get(FontResource &, font, Window,
            C(Instance) i = Window_get_font(self ? self->impl : null);
            return *(FontResource *)_INSTANCE(i, FontResource::_class.impl))

      _set(const FontResource *, font,Window,  Window_set_font(self ? self->impl : null, v->impl))
      get(FontResource *, font, Window,
            C(Instance) i = Window_get_font(self ? self->impl : null);
            return i ? (FontResource *)_INSTANCE(i, FontResource::_class.impl) : null)

      get(FontResource, font, Window, return FontResource(Window_get_font(self ? self->impl : null)))
   );
   property(borderStyle,
      set(C(BorderStyle), borderStyle, Window, Window_set_borderStyle(self ? self->impl : null, v))
      get(C(BorderStyle), borderStyle, Window, return Window_get_borderStyle(self ? self->impl : null))
   );
   property(background,
      set(C(Color), background, Window, Window_set_background(self ? self->impl : null, v))
      get(C(Color), background, Window, return Window_get_background(self ? self->impl : null))
   );
};

///////////// Label Class /////////////////////////////////////////////////
class Label : public Window
{
public:
   CONSTRUCT(Label, Window) { }

   REGISTER() { Window_class_registration(Label); }
};

///////////// MessageBox Class /////////////////////////////////////////////////
class MessageBox : public Window
{
public:
   CONSTRUCT(MessageBox, Window) { }

   MessageBox(constString contents, constString caption = ""/*,  MessageBoxType type = ok*/) : MessageBox()
   {
      this->contents = contents;
      this->caption = caption;
   }
   REGISTER() { Window_class_registration(MessageBox); }

   property(contents,
      _set(constString, contents, MessageBox, MessageBox_set_contents(self ? self->impl : null, v))
      //get(constString, contents, MessageBox, return MessageBox_get_contents(self ? self->impl : null))
   );
};

///////////// Button Class /////////////////////////////////////////////////
#define Button_class_registration(d) \
   Window_class_registration(d); \
   REGISTER_METHOD("NotifyClicked", notifyClicked, Button, d, \
      bool, (C(Window) m, C(Button) b, int x, int y, Modifiers mods), \
      b, b, return fn(*(Window *)INSTANCEL(m, m->_class), *(Button *)INSTANCEL(b, b->_class), x, y, mods), \
      (m, b, x, y, mods), true);

class Button : public Window
{
public:
   CONSTRUCT(Button, Window) { }

   REGISTER() { Button_class_registration(Button); }

   VIRTUAL_METHOD(notifyClicked, Button, Button, bool, Window & _ARG, Window & window _ARG, Button & button _ARG int x _ARG int y _ARG Modifiers mods,
      return Button_notifyClicked(self->impl, window.impl, button.impl, x, y, mods));
};

///////////// ToolButton Class /////////////////////////////////////////////////////
class ToolButton : public Button
{
public:
   CONSTRUCT(ToolButton, Button) { }
   REGISTER() { Button_class_registration(ToolButton); }
};

///////////// GuiApplication Class /////////////////////////////////////////////////
#define GuiApplication_class_registration(d) \
   Application_class_registration(d); \
   REGISTER_METHOD("Cycle", cycle, GuiApplication, d, \
      bool, (C(GuiApplication) a, C(bool) idle), a, a, return fn(*i, idle), (a, idle), true);

class GuiApplication : public Application
{
public:
   APP_CONSTRUCT(GuiApplication, Application) { EVOLVE_APP(GuiApplication, *this); }
   REGISTER() { GuiApplication_class_registration(GuiApplication); }
   VIRTUAL_METHOD(cycle, GuiApplication, GuiApplication, bool, GuiApplication & _ARG, , bool idle,
      return GuiApplication_cycle(self->impl, idle));
};

#endif
