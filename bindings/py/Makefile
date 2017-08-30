include ../bgen_setup.mk

_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_LANGNAME := Python
_BGEN_ARGS := -py $(addprefix -lib$(space),$(_BGEN_LIBS)) -quiet -all -map fren Log=__log Logf=__logf Sleep=__sleep .
_BGEN_OUTPUT := \
	build_eC.py \
	cffi-eC.h \
	pyeC.py \
	build_ecere.py \
	cffi-ecere.h \
	pyecere.py \
	build_EDA.py \
	cffi-EDA.h \
	pyEDA.py
_BINDINGS_OBJECTS := \
	_pyeC.c \
	_pyeC.pyd \
	_pyecere.c \
	_pyecere.pyd \
	_pyEDA.c \
	_pyEDA.pyd
_BINDINGS_TMP_DIRS := __pycache__ obj

all: $(_BGEN_OUTPUT)
	@$(call echo,Building Python Bindings for ecereCOM...)
	py build_eC.py
	@$(call echo,Building Python Bindings for ecere...)
	py build_ecere.py
	@$(call echo,Building Python Bindings for EDA...)
	py build_EDA.py

include ../bgen_targets.mk
