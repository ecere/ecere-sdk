.SILENT:
.PHONY: all nores clean realclean distclean

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

clean:
	cd extract && $(MAKE) clean
	cd cmd && $(MAKE) clean

realclean:
	cd extract && $(MAKE) realclean
	cd cmd && $(MAKE) realclean

distclean:
	cd extract && $(MAKE) distclean
	cd cmd && $(MAKE) distclean
