include ../bgen_setup.mk

_BGEN_LANGNAME := C
_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_ARGS := $(_BGEN_AUTO_ARGS) -all -map fren,Log=__e_log,Logf=__e_logf,Sleep=__sleep,Print=printx
_BGEN_OUTPUT := $(addsuffix .h,$(_BGEN_OUTS)) $(addsuffix .c,$(_BGEN_OUTS))

all: $(_BGEN_OUTPUT)
	@$(call echo,Building C Bindings for ecereCOM...)
	+cd ecereCOM && $(_MAKE)
	@$(call echo,Building C Bindings for ecere...)
	+cd ecere && $(_MAKE)
	@$(call echo,Building C Bindings for EDA...)
	+cd EDA && $(_MAKE)

include ../bgen_targets.mk
