ifneq ($(V),1)
.SILENT:
endif

ifndef DISABLE_EDA_SQLITE
  EDASQLite := defined
endif

ifndef DISABLE_EDA_SQLITE
  EDAdBASE := defined
endif

.PHONY: all cleantarget clean realclean wipeclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

.NOTPARALLEL: $(NOT_PARALLEL_TARGETS)

all:
	@$(call echo,Building Ecere Data Access layer...)
	+cd libeda && $(_MAKE)
ifdef EDAdBASE
	@$(call echo,Building EDAdBASE driver...)
	+cd drivers && cd dbase && $(_MAKE)
endif
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
ifdef EDAdBASE
	+cd drivers && cd dbase && $(_MAKE) cleantarget
endif
ifdef EDASQLite
	+cd drivers && cd sqlite && $(_MAKE) cleantarget
endif
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) cleantarget
endif

clean:
	+cd libeda && $(_MAKE) clean
ifdef EDAdBASE
	+cd drivers && cd dbase && $(_MAKE) clean
endif
ifdef EDASQLite
	+cd drivers && cd sqlite && $(_MAKE) clean
endif
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) clean
endif

realclean:
	+cd libeda && $(_MAKE) realclean
ifdef EDAdBASE
	+cd drivers && cd dbase && $(_MAKE) realclean
endif
ifdef EDASQLite
	+cd drivers && cd sqlite && $(_MAKE) realclean
endif
ifdef EDASQLiteCipher
	+cd drivers && cd sqliteCipher && $(_MAKE) realclean
endif

wipeclean:
	+cd libeda && $(_MAKE) wipeclean
	+cd drivers && cd dbase && $(_MAKE) wipeclean
	+cd drivers && cd sqlite && $(_MAKE) wipeclean
	+cd drivers && cd sqliteCipher && $(_MAKE) wipeclean

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
