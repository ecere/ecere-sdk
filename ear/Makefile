ifneq ($(V),1)
.SILENT:
endif
.PHONY: all nores cleantarget clean realclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all:
	@$(call echo,Building self-extract tool...)
	cd extract && $(MAKE)
	@$(call echo,Building eAR command line tool...)
	cd cmd && $(MAKE)

nores:
	@$(call echo,Building eAR command line tool...)
	cd cmd && $(MAKE) nores

cleantarget:
	cd extract && $(MAKE) cleantarget
	cd cmd && $(MAKE) cleantarget

clean:
	cd extract && $(MAKE) clean
	cd cmd && $(MAKE) clean

realclean:
	cd extract && $(MAKE) realclean
	cd cmd && $(MAKE) realclean

distclean:
	$(MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
