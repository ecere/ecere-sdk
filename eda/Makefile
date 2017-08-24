ifneq ($(V),1)
.SILENT:
endif
.PHONY: all cleantarget clean realclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all:
	@$(call echo,Building Ecere Data Access layer...)
	+cd libeda && $(_MAKE)
	@$(call echo,Building EDASQLite driver...)
	+cd drivers && cd sqlite && $(_MAKE)
ifdef EDASQLiteCipher
	@$(call echo,Building EDASQLiteCipher driver...)
	+cd drivers && cd sqliteCipher && $(_MAKE)
endif

cleantarget:
	+cd libeda && $(_MAKE) cleantarget
	+cd drivers && cd sqlite && $(_MAKE) cleantarget
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) cleantarget
endif

clean:
	+cd libeda && $(_MAKE) clean
	+cd drivers && cd sqlite && $(_MAKE) clean
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) clean
endif

realclean:
	+cd libeda && $(_MAKE) realclean
	+cd drivers && cd sqlite && $(_MAKE) realclean
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) realclean
endif

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
