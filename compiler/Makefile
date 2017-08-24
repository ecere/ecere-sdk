.PHONY: all bootstrap cleantarget clean realclean distclean libec ecp ecc ecs
ifneq ($(V),1)
.SILENT:
endif

CONFIG := release

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all: ecp ecc ecs

libec:
	@$(call echo,Building 2nd stage libec...)
	+cd libec && $(_MAKE)

ecp: libec
	@$(call echo,Building 2nd stage ecp...)
	+cd ecp && $(_MAKE)

ecc: libec
	@$(call echo,Building 2nd stage ecc...)
	+cd ecc && $(_MAKE)

ecs: libec
	@$(call echo,Building 2nd stage ecs...)
	+cd ecs && $(_MAKE)

bootstrap:
	@$(call echo,Bootstrapping eC compiling tools...)
	+cd bootstrap && $(_MAKE)

cleantarget:
	+cd bootstrap && $(_MAKE) cleantarget
	+cd libec && $(_MAKE) cleantarget
	+cd ecp && $(_MAKE) cleantarget
	+cd ecc && $(_MAKE) cleantarget
	+cd ecs && $(_MAKE) cleantarget

clean:
	+cd bootstrap && $(_MAKE) clean
	+cd libec && $(_MAKE) clean
	+cd ecp && $(_MAKE) clean
	+cd ecc && $(_MAKE) clean
	+cd ecs && $(_MAKE) clean

realclean:
	+cd bootstrap && $(_MAKE) realclean
	+cd libec && $(_MAKE) realclean
	+cd ecp && $(_MAKE) realclean
	+cd ecc && $(_MAKE) realclean
	+cd ecs && $(_MAKE) realclean

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
