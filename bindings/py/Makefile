include ../bgen_setup.mk

_BGEN_LANGNAME := Python
_BGEN_LIBS := ecereCOM ecere EDA
_BGEN_ARGS := -map fren,Log=__e_log,Logf=__e_logf,Sleep=__sleep,Print=printx -c -dir ../c $(_BGEN_AUTO_ARGS)
_BGEN_OUTPUT := $(addsuffix .py,$(addprefix build_,$(_BGEN_OUTS))) $(addsuffix .h,$(addprefix cffi-,$(_BGEN_OUTS))) $(addsuffix .py,$(addprefix py,$(_BGEN_OUTS)))

PYTHON := python
PY_VER := 3

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
