.PHONY: bindir ecere libec ecp ecc ecs clean realclean distclean
.SILENT:

OBJ = obj/bin.$(PLATFORM)/

include ../../include.mk

all: bindir ecere libec ecp ecc ecs
	$(call cpq,ecp/obj/bootstrap.$(PLATFORM)/ecp$(E) ecc/obj/bootstrap.$(PLATFORM)/ecc$(E) ecs/obj/bootstrap.$(PLATFORM)/ecs$(E),$(OBJ))
	@$(call echo,All done!)

bindir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

clean: bindir
	cd ecere && $(MAKE) clean
	cd libec && $(MAKE) clean
	cd ecp && $(MAKE) clean
	cd ecc && $(MAKE) clean
	cd ecs && $(MAKE) clean
	$(call rmq,$(OBJ)ecp$(E) $(OBJ)ecc$(E) $(OBJ)ecs$(E))
ifdef WINDOWS
	$(call rmq,$(OBJ)$(LP)ecere$(SO) $(OBJ)$(LP)ec$(SO))
endif

realclean:
	$(call rmrq,$(OBJ))
	cd ecere && $(MAKE) realclean
	cd libec && $(MAKE) realclean
	cd ecp && $(MAKE) realclean
	cd ecc && $(MAKE) realclean
	cd ecs && $(MAKE) realclean

distclean:
	$(call rmrq,obj/)
	cd ecere && $(MAKE) distclean
	cd libec && $(MAKE) distclean
	cd ecp && $(MAKE) distclean
	cd ecc && $(MAKE) distclean
	cd ecs && $(MAKE) distclean

ecere:
	@$(call echo,Building ecere...)
	cd ecere && $(MAKE)
	
libec:
	@$(call echo,Building ec...)
	cd libec && $(MAKE)

ecp: ecere libec
	@$(call echo,Building ecp...)
	cd ecp && $(MAKE)

ecc: ecere libec
	@$(call echo,Building ecc...)
	cd ecc && $(MAKE)

ecs: ecere libec
	@$(call echo,Building ecs...)
	cd ecs && $(MAKE)
