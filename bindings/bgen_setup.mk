ifneq ($(V),1)
.SILENT:
endif
.PHONY: all cleantarget clean realclean distclean

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

_BGL1 = $(if $(wildcard $(word 1,$(_BGEN_LIBS))/Makefile),$(word 1,$(_BGEN_LIBS)),)
_BGL2 = $(if $(wildcard $(word 2,$(_BGEN_LIBS))/Makefile),$(word 2,$(_BGEN_LIBS)),)
_BGL3 = $(if $(wildcard $(word 3,$(_BGEN_LIBS))/Makefile),$(word 3,$(_BGEN_LIBS)),)
_BGL4 = $(if $(wildcard $(word 4,$(_BGEN_LIBS))/Makefile),$(word 4,$(_BGEN_LIBS)),)
