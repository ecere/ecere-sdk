include ../bgen_setup.mk

_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_LANGNAME := C++
_BGEN_ARGS := -cpp $(addprefix -lib$(space),$(_BGEN_LIBS)) -quiet -all -map fren Log=__e_log Logf=__e_logf Sleep=__sleep Print=_print .
_BGEN_OUTPUT := \
	eC.cpp \
	eC.hpp \
	ecere.cpp \
	ecere.hpp \
	EDA.cpp \
	EDA.hpp

all: #$(_BGEN_OUTPUT)
	@$(call echo,TODO: Building C++ Bindings for ecereCOM...)
	@$(call echo,TODO: Building C++ Bindings for ecere...)
	@$(call echo,TODO: Building C++ Bindings for EDA...)

include ../bgen_targets.mk
