.PHONY: all bootstrap cleantarget clean realclean distclean libec ecp ecc ecs
ifneq "$(V)" "1"
.SILENT:
endif

CONFIG := release

include ../crossplatform.mk
include ../default.cf

all: ecp ecc ecs

libec:
	@$(call echo,Building 2nd stage libec...)
	cd libec && $(MAKE)

ecp: libec
	@$(call echo,Building 2nd stage ecp...)
	cd ecp && $(MAKE)

ecc: libec
	@$(call echo,Building 2nd stage ecc...)
	cd ecc && $(MAKE)

ecs: libec
	@$(call echo,Building 2nd stage ecs...)
	cd ecs && $(MAKE)

bootstrap:
	@$(call echo,Bootstrapping eC compiling tools...)
	cd bootstrap && $(MAKE)

cleantarget:
	cd bootstrap && $(MAKE) cleantarget
	cd libec && $(MAKE) cleantarget
	cd ecp && $(MAKE) cleantarget
	cd ecc && $(MAKE) cleantarget
	cd ecs && $(MAKE) cleantarget

clean:
	cd bootstrap && $(MAKE) clean
	cd libec && $(MAKE) clean
	cd ecp && $(MAKE) clean
	cd ecc && $(MAKE) clean
	cd ecs && $(MAKE) clean

realclean:
	cd bootstrap && $(MAKE) realclean
	cd libec && $(MAKE) realclean
	cd ecp && $(MAKE) realclean
	cd ecc && $(MAKE) realclean
	cd ecs && $(MAKE) realclean

distclean:
	cd bootstrap && $(MAKE) distclean
	cd libec && $(MAKE) distclean
	cd ecp && $(MAKE) distclean
	cd ecc && $(MAKE) distclean
	cd ecs && $(MAKE) distclean
