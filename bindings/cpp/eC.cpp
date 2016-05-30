#include "eC.hpp"

CPPClass<Instance> Instance::_class;
CPPClass<Module> Module::_class;
CPPClass<Application> Application::_class;

void eC_cpp_init(Module & module)
{
   if(!Instance::_class.impl)
   {
      REGISTER_CPP_CLASS(Instance, module);
      REGISTER_CPP_CLASS(Module, module);
      REGISTER_CPP_CLASS(Application, module);
   }
}
