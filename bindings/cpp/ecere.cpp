#include "ecere.hpp"

TCPPClass<GuiApplication> GuiApplication::_class;
TCPPClass<Surface> Surface::_class;
TCPPClass<FontResource> FontResource::_class;
TCPPClass<Window> Window::_class;
TCPPClass<Button> Button::_class;
TCPPClass<Label> Label::_class;
TCPPClass<MessageBox> MessageBox::_class;

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
