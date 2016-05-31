#include "eC.hpp"

TCPPClass<Instance> Instance::_class;
TCPPClass<Module> Module::_class;
TCPPClass<Application> Application::_class;
TCPPClass<IOChannel> IOChannel::_class;

void eC_cpp_init(Module & module)
{
   if(!Instance::_class.impl)
   {
      REGISTER_CPP_CLASS(Instance, module);
      REGISTER_CPP_CLASS(Module, module);
      REGISTER_CPP_CLASS(Application, module);
   }
}
