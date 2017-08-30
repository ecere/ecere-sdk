ifneq ($(V),1)
.SILENT:
endif
.PHONY: all gen genc c gencpp cpp genpy py cleantarget clean realclean distclean

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

all: c cpp py

gen: genc gencpp genpy

genc:
	+cd c && $(_MAKE) gen

c: genc
	+cd c && $(_MAKE)

gencpp:
	+cd cpp && $(_MAKE) gen

cpp: gencpp
	+cd cpp && $(_MAKE)

genpy:
	+cd py && $(_MAKE) gen

py: genc genpy
	+cd py && $(_MAKE)

cleantarget:
	+cd c && $(_MAKE) cleantarget
	+cd cpp && $(_MAKE) cleantarget
	+cd py && $(_MAKE) cleantarget

clean:
	+cd c && $(_MAKE) clean
	+cd cpp && $(_MAKE) clean
	+cd py && $(_MAKE) clean

realclean:
	+cd c && $(_MAKE) realclean
	+cd cpp && $(_MAKE) realclean
	+cd py && $(_MAKE) realclean

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
