include ../bgen_setup.mk

ifndef PYTHON
  ifdef WINDOWS_HOST
    PYTHON := python
  else
    PYTHON := python3
  endif
endif
_PY_VER := $(shell $(PYTHON) --version $(nullerror))
ifeq ($(_PY_VER),)
  PY_NA := $(PYTHON)NotAvailable
else
  PY_VER := $(firstword $(subst .,$(space),$(subst Python,,$(_PY_VER))))
  PYSO := $(shell $(PYTHON) -c "from distutils.sysconfig import get_config_var; print(get_config_var('EXT_SUFFIX'))" $(nullerror))
endif

_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_LANGNAME := Python
_BGEN_ARGS := -python $(addprefix -lib$(space),$(_BGEN_LIBS)) -quiet -all -map fren Log=__e_log Logf=__e_logf Sleep=__sleep Print=_print .
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
	_pyeC$(PYSO) \
	_pyecere.c \
	_pyecere$(PYSO) \
	_pyEDA.c \
	_pyEDA$(PYSO)
_BINDINGS_TMP_DIRS := __pycache__ obj

all: $(_BGEN_OUTPUT)
ifdef PY_NA
	$(error Using $(PYTHON) failed. Please set PYTHON to point to a valid python program name or location)
else
	@$(call echo,Building Python $(PY_VER) Bindings for ecereCOM...)
	$(PYTHON) build_eC.py
	@$(call echo,Building Python $(PY_VER) Bindings for ecere...)
	$(PYTHON) build_ecere.py
	@$(call echo,Building Python $(PY_VER) Bindings for EDA...)
	$(PYTHON) build_EDA.py
endif

include ../bgen_targets.mk
