include ../bgen_setup.mk

_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_LANGNAME := Python
_BGEN_ARGS := -python $(addprefix -lib$(space),$(_BGEN_LIBS)) -quiet -all -map fren Log=__e_log Logf=__e_logf Sleep=__sleep print=_print .
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
	_pyeC.so \
	_pyecere.c \
	_pyecere.so \
	_pyEDA.c \
	_pyEDA.so
_BINDINGS_TMP_DIRS := __pycache__ obj

all: $(_BGEN_OUTPUT)
	@$(call echo,Building Python 3 Bindings for ecereCOM...)
	python3 build_eC.py
	@$(call echo,Building Python 3 Bindings for ecere...)
	python3 build_ecere.py
	@$(call echo,Building Python 3 Bindings for EDA...)
	python3 build_EDA.py

include ../bgen_targets.mk
