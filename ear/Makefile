ifneq "$(V)" "1"
.SILENT:
endif
.PHONY: all nores cleantarget clean realclean distclean

# CROSS-PLATFORM MAGIC

include ../crossplatform.mk
include ../default.cf

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
	cd extract && $(MAKE) distclean
	cd cmd && $(MAKE) distclean
