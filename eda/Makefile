ifneq ($(V),1)
.SILENT:
endif
.PHONY: all cmd cleantarget clean realclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all:
	@$(call echo,Building Ecere Data Access layer...)
	cd libeda && $(MAKE)
	@$(call echo,Building EDASQLite driver...)
	cd drivers && cd sqlite && $(MAKE)
ifdef EDASQLiteCipher
	@$(call echo,Building EDASQLiteCipher driver...)
	cd drivers && cd sqliteCipher && $(MAKE)
endif

cleantarget:
	cd libeda && $(MAKE) cleantarget
	cd drivers && cd sqlite && $(MAKE) cleantarget
ifdef EDASQLiteCipher
	cd drivers && cd sqliteCipher && $(MAKE) cleantarget
endif

clean:
	cd libeda && $(MAKE) clean
	cd drivers && cd sqlite && $(MAKE) clean
ifdef EDASQLiteCipher
	cd drivers && cd sqliteCipher && $(MAKE) clean
endif

realclean:
	cd libeda && $(MAKE) realclean
	cd drivers && cd sqlite && $(MAKE) realclean
ifdef EDASQLiteCipher
	cd drivers && cd sqliteCipher && $(MAKE) realclean
endif

distclean:
	$(MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
