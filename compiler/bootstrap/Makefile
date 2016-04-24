.PHONY: bindir ecere libec ecp ecc ecs cleantarget clean realclean distclean
ifneq ($(V),1)
.SILENT:
endif

OBJ = obj/bin.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all: bindir ecere libec ecp ecc ecs
	$(call cp,ecp/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecp$(E) ecc/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(E) ecs/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(E),$(OBJ))
	@$(call echo,All done!)

bindir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

cleantarget: bindir
	$(call rm,$(OBJ)ecp$(E) $(OBJ)ecc$(E) $(OBJ)ecs$(E))
ifdef WINDOWS_TARGET
	$(call rm,$(OBJ)$(LP)ecere$(SO) $(OBJ)$(LP)ec$(SO))
endif

clean: cleantarget
	cd ecere && $(MAKE) clean
	cd libec && $(MAKE) clean
	cd ecp && $(MAKE) clean
	cd ecc && $(MAKE) clean
	cd ecs && $(MAKE) clean

realclean: cleantarget
	$(call rmr,$(OBJ))
	cd ecere && $(MAKE) realclean
	cd libec && $(MAKE) realclean
	cd ecp && $(MAKE) realclean
	cd ecc && $(MAKE) realclean
	cd ecs && $(MAKE) realclean

distclean: cleantarget
	$(call rmr,obj/)
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
