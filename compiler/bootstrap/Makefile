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
	$(call mkdir,$(OBJ))

ecere:
	@$(call echo,Building ecere...)
	+cd ecere && $(_MAKE)

libec:
	@$(call echo,Building ec...)
	+cd libec && $(_MAKE)

ecp: ecere libec
	@$(call echo,Building ecp...)
	+cd ecp && $(_MAKE)

ecc: ecere libec
	@$(call echo,Building ecc...)
	+cd ecc && $(_MAKE)

ecs: ecere libec
	@$(call echo,Building ecs...)
	+cd ecs && $(_MAKE)

cleantarget:
	$(call rm,$(OBJ)ecp$(E) $(OBJ)ecc$(E) $(OBJ)ecs$(E))
ifdef WINDOWS_TARGET
	$(call rm,$(OBJ)$(LP)ecere$(SO) $(OBJ)$(LP)ec$(SO))
endif

clean: cleantarget
	+cd ecere && $(_MAKE) clean
	+cd libec && $(_MAKE) clean
	+cd ecp && $(_MAKE) clean
	+cd ecc && $(_MAKE) clean
	+cd ecs && $(_MAKE) clean

realclean: cleantarget
	$(call rmr,$(OBJ))
	+cd ecere && $(_MAKE) realclean
	+cd libec && $(_MAKE) realclean
	+cd ecp && $(_MAKE) realclean
	+cd ecc && $(_MAKE) realclean
	+cd ecs && $(_MAKE) realclean

distclean:
	$(MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
