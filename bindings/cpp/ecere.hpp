/****************************************************************************
===========================================================================
   Ecere Module
===========================================================================
****************************************************************************/
#if !defined(__ECERE_HPP__)
#define __ECERE_HPP__

#include "eC.hpp"
#include "ecere.h"

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

   inline FontResource(constString faceName, float size = 10, eC_bool bold = false, eC_bool italic = false) : FontResource()
   {
      this->faceName = faceName;
      this->size = size;
      this->bold = bold;
      this->italic = italic;
   }

   #undef PSELF
   #define PSELF SELF(FontResource, bold)

   property(bold,
      set(eC_bool, bold, FontResource_set_bold(self ? self->impl : null, v))
      get(eC_bool, bold, return FontResource_get_bold(self ? self->impl : null))
   );
   property(italic,
      set(eC_bool, italic, FontResource_set_italic(self ? self->impl : null, v))
      get(eC_bool, italic, return FontResource_get_italic(self ? self->impl : null))
   );
   property(faceName,
      set(constString, faceName, FontResource_set_faceName(self ? self->impl : null, v))
      get(constString, faceName, return FontResource_get_faceName(self ? self->impl : null))
   );
   property(size,
      set(float, size, FontResource_set_size(self ? self->impl : null, v))
      get(float, size, return FontResource_get_size(self ? self->impl : null))
   );
};

/****************************************************************************
   ecere::gui Namespace
****************************************************************************/
///////////// Window Class /////////////////////////////////////////////////
#define Window_class_registration(d) \
   REGISTER_METHOD("OnRedraw", onRedraw, Window, d, void, (eC_Window o, eC_Surface s),   o, o, Surface surface(s); return fn(*i, surface), (o, s), ); \
   REGISTER_METHOD("OnCreate", onCreate, Window, d, bool, (eC_Window o),                 o, o, return fn(*i),                        (o),    true);

class Window : public Instance
{
public:
   CONSTRUCT(Window, Instance) { }

   REGISTER() { Window_class_registration(Window); }

   VIRTUAL_METHOD(onCreate, Window, Window, bool, Window &, , ,
      return Window_onCreate(self->impl));
   VIRTUAL_METHOD(onRedraw, Window, Window, void, Window & _ARG, , Surface & surface,
      return Window_onRedraw(self->impl, surface.impl));

   DialogResult modal() { return Window_modal(impl); }

   // TOCHECK: See if we'll need set/get methods in addition to 'properties' for SWIG
   //void set_size(const Size & v) { Window_set_size(impl, &v); }
   //void set_hasClose(eC_bool v)  { Window_set_hasClose(impl, v); }

   #undef   PSELF
   #define  PSELF SELF(Window, parent)

   property(parent,
      set(const Window &, parent, Window_set_parent(self ? self->impl : null, v.impl))
      get(Window &, parent,
         eC_Instance i = Window_get_parent(self ? self->impl : null);
         return *(Window *)_INSTANCE(i, Window::_class.impl))

      _set(const Window *, parent, Window_set_parent(self ? self->impl : null, v ? v->impl : null))
      get(Window *, parent,
         eC_Instance i = Window_get_parent(self ? self->impl : null);
         return i ? (Window *)_INSTANCE(i, Window::_class.impl) : null)

      get(Window, parent, return Window(Window_get_parent(self ? self->impl : null)));
   );
   property(size,
      set(const Size &, size, Window_set_size(self ? self->impl : null, &v))
      get(Size, size, { Size v; Window_get_size(self ? self->impl : null, &v); return v; })
   );
   property(clientSize,
      set(const Size &, clientSize, Window_set_clientSize(self ? self->impl : null, &v))
      get(Size,         clientSize, { Size v; Window_get_clientSize(self ? self->impl : null, &v); return v; })
   );
   property(position,
      set(const Point &, position, Window_set_position(self ? self->impl : null, &v))
      get(Point,         position, { Point v; Window_get_position(self ? self->impl : null, &v); return v; })
   );
   property(hasClose,
      set(eC_bool, hasClose, Window_set_hasClose(self ? self->impl : null, v))
      get(eC_bool, hasClose, return Window_get_hasClose(self ? self->impl : null))
   );
   property(hasMinimize,
      set(eC_bool, hasMinimize, Window_set_hasMinimize(self ? self->impl : null, v))
      get(eC_bool, hasMinimize, return Window_get_hasMinimize(self ? self->impl : null))
   );
   property(hasMaximize,
      set(eC_bool, hasMaximize, Window_set_hasMaximize(self ? self->impl : null, v))
      get(eC_bool, hasMaximize, return Window_get_hasMaximize(self ? self->impl : null))
   );
   property(caption,
      set(constString, caption, Window_set_caption(self ? self->impl : null, v))
      get(constString, caption, return Window_get_caption(self ? self->impl : null))
   );
   property(font,
      set(const FontResource &, font, Window_set_font(self ? self->impl : null, v.impl))
      get(FontResource &, font,
            eC_Instance i = Window_get_font(self ? self->impl : null);
            return *(FontResource *)_INSTANCE(i, FontResource::_class.impl))

      _set(const FontResource *, font, Window_set_font(self ? self->impl : null, v->impl))
      get(FontResource *, font,
            eC_Instance i = Window_get_font(self ? self->impl : null);
            return i ? (FontResource *)_INSTANCE(i, FontResource::_class.impl) : null)

      get(FontResource, font, return FontResource(Window_get_font(self ? self->impl : null)))
   );
   property(borderStyle,
      set(BorderStyle, borderStyle, Window_set_borderStyle(self ? self->impl : null, v))
      get(BorderStyle, borderStyle, return Window_get_borderStyle(self ? self->impl : null))
   );
   property(background,
      set(Color, background, Window_set_background(self ? self->impl : null, v))
      get(Color, background, return Window_get_background(self ? self->impl : null))
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

   #undef PSELF
   #define PSELF SELF(MessageBox, contents)

   property(contents,
      set(constString, contents, MessageBox_set_contents(self ? self->impl : null, v))
      get(constString, contents, return MessageBox_get_contents(self ? self->impl : null))
   );
};

///////////// Button Class /////////////////////////////////////////////////
#define Button_class_registration(d) \
   Window_class_registration(d); \
   REGISTER_METHOD("NotifyClicked", notifyClicked, Button, d, \
      bool, (eC_Window m, eC_Button b, int x, int y, Modifiers mods), \
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

   #undef PSELF
   #define PSELF SELF(ToolButton, Foo)
};

///////////// GuiApplication Class /////////////////////////////////////////////////
class GuiApplication : public Application
{
public:
   APP_CONSTRUCT(GuiApplication, Application)
   {
      Instance_evolve(&impl, GuiApplication::_class.impl);
      _INSTANCE(impl, impl->_class) = this;
      vTbl = _class.vTbl;
   }

   REGISTER() { Application_class_registration(GuiApplication); }
};

#endif
