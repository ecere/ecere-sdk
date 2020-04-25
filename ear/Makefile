ifneq ($(V),1)
.SILENT:
endif

.PHONY: all nores cleantarget clean realclean wipeclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

.NOTPARALLEL: $(NOT_PARALLEL_TARGETS)

all:
	@$(call echo,Building self-extract tool...)
	+cd extract && $(_MAKE)
	@$(call echo,Building eAR command line tool...)
	+cd cmd && $(_MAKE)

nores:
	@$(call echo,Building eAR command line tool...)
	+cd cmd && $(_MAKE) nores

cleantarget:
	+cd extract && $(_MAKE) cleantarget
	+cd cmd && $(_MAKE) cleantarget

clean:
	+cd extract && $(_MAKE) clean
	+cd cmd && $(_MAKE) clean

realclean:
	+cd extract && $(_MAKE) realclean
	+cd cmd && $(_MAKE) realclean

wipeclean:
	+cd extract && $(_MAKE) wipeclean
	+cd cmd && $(_MAKE) wipeclean

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
