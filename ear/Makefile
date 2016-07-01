ifneq ($(V),1)
.SILENT:
endif
.PHONY: all nores cleantarget clean realclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all:
	@$(call echo,Building self-extract tool...)
	cd extract && $(_MAKE)
	@$(call echo,Building eAR command line tool...)
	cd cmd && $(_MAKE)

nores:
	@$(call echo,Building eAR command line tool...)
	cd cmd && $(_MAKE) nores

cleantarget:
	cd extract && $(_MAKE) cleantarget
	cd cmd && $(_MAKE) cleantarget

clean:
	cd extract && $(_MAKE) clean
	cd cmd && $(_MAKE) clean

realclean:
	cd extract && $(_MAKE) realclean
	cd cmd && $(_MAKE) realclean

distclean:
	cd extract && $(_MAKE) distclean
	cd cmd && $(_MAKE) distclean
