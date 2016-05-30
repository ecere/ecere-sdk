#include "ecere.hpp"

CPPClass<GuiApplication> GuiApplication::_class;
CPPClass<Surface> Surface::_class;
CPPClass<FontResource> FontResource::_class;
CPPClass<Window> Window::_class;
CPPClass<Button> Button::_class;
CPPClass<Label> Label::_class;
CPPClass<MessageBox> MessageBox::_class;

void ecere_cpp_init(Module & module)
{
   if(!GuiApplication::_class.impl)
   {
      REGISTER_CPP_CLASS(Surface, module);
      REGISTER_CPP_CLASS(FontResource, module);
      REGISTER_CPP_CLASS(GuiApplication, module);
      REGISTER_CPP_CLASS(Window, module);
      REGISTER_CPP_CLASS(Button, module);
      REGISTER_CPP_CLASS(Label, module);
      REGISTER_CPP_CLASS(MessageBox, module);
   }
}
