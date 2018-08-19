ifneq ($(V),1)
.SILENT:
endif
.PHONY: all gen cleangen cleanobj cleantarget clean realclean wipeclean distclean

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

bgen_lib_cd_make = $(if $(wildcard $(word $(1),$(_BGEN_LIBS))/Makefile),+cd $(word $(1),$(_BGEN_LIBS)) && $(_MAKE) $(2),)

_BGEN_OUTS = $(subst ecereCOM,eC,$(_BGEN_LIBS))
_BGEN_LANG = $(subst Python,py,$(subst C++,cpp,$(subst C,c,$(_BGEN_LANGNAME))))
_BGEN_AUTO_ARGS = $(if $(SILENT_IS_ON),-quiet,) -$(_BGEN_LANG) $(_BGEN_LIBS)
