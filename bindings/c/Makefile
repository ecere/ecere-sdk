include ../bgen_setup.mk

_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_LANGNAME := C
_BGEN_ARGS := -c $(addprefix -lib$(space),$(_BGEN_LIBS)) -quiet -all -map fren Log=__log Logf=__logf Sleep=__sleep .
_BGEN_OUTPUT := \
	eC.c \
	eC.h \
	ecere.c \
	ecere.h \
	EDA.c \
	EDA.h

all: $(_BGEN_OUTPUT)
	@$(call echo,Building C Bindings for ecereCOM...)
	+cd ecereCOM && $(_MAKE)
	@$(call echo,Building C Bindings for ecere...)
	+cd ecere && $(_MAKE)
	@$(call echo,Building C Bindings for EDA...)
	+cd EDA && $(_MAKE)

include ../bgen_targets.mk
