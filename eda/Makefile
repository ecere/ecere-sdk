ifneq ($(V),1)
.SILENT:
endif

ifndef DISABLE_EDA_SQLITE
  EDASQLite := defined
endif

.PHONY: all cleantarget clean realclean wipeclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all:
	@$(call echo,Building Ecere Data Access layer...)
	+cd libeda && $(_MAKE)
ifdef EDASQLite
	@$(call echo,Building EDASQLite driver...)
	+cd drivers && cd sqlite && $(_MAKE)
endif
ifdef EDASQLiteCipher
	@$(call echo,Building EDASQLiteCipher driver...)
	+cd drivers && cd sqliteCipher && $(_MAKE)
endif

cleantarget:
	+cd libeda && $(_MAKE) cleantarget
ifdef EDASQLite
	+cd drivers && cd sqlite && $(_MAKE) cleantarget
endif
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) cleantarget
endif

clean:
	+cd libeda && $(_MAKE) clean
ifdef EDASQLite
	+cd drivers && cd sqlite && $(_MAKE) clean
endif
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) clean
endif

realclean:
	+cd libeda && $(_MAKE) realclean
ifdef EDASQLite
	+cd drivers && cd sqlite && $(_MAKE) realclean
endif
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) realclean
endif

wipeclean:
	+cd libeda && $(_MAKE) wipeclean
	+cd drivers && cd sqlite && $(_MAKE) wipeclean
	+cd drivers && cd sqliteCipher && $(_MAKE) wipeclean

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
