.PHONY: freetype jpeg png gif z curl ffi cleantarget clean realclean distclean
.SILENT:

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

ifdef WINDOWS_TARGET
all: freetype jpeg png gif ffi z curl
else
ifdef OSX_TARGET
all: jpeg gif
else
all: gif
endif
endif

freetype:
	@$(call echo,Building FreeType...)
	+cd freetype-2.3.12 && $(_MAKE)
	
jpeg:
	@$(call echo,Building libjpeg...)
	+cd jpeg-9a && $(_MAKE)

png:
	@$(call echo,Building libpng...)
	+cd libpng-1.6.12 && $(_MAKE)

gif:
	@$(call echo,Building libungif...)
	+cd libungif-4.1.1 && $(_MAKE)

z:
	@$(call echo,Building zlib...)
	+cd zlib-1.2.8 && $(_MAKE)

curl:
	@$(call echo,Building libcurl...)
	+cd curl-7.51.0 && $(_MAKE)

ffi:
	@$(call echo,Building libffi...)
	+cd libffi-3.0.11 && $(_MAKE)

cleantarget:
	+cd freetype-2.3.12 && $(_MAKE) cleantarget
	+cd libpng-1.6.12 && $(_MAKE) cleantarget
	+cd zlib-1.2.8 && $(_MAKE) cleantarget
	+cd jpeg-9a && $(_MAKE) cleantarget
	+cd libungif-4.1.1 && $(_MAKE) cleantarget
	+cd curl-7.51.0 && $(_MAKE) cleantarget
	+cd libffi-3.0.11 && $(_MAKE) cleantarget

clean:
	+cd freetype-2.3.12 && $(_MAKE) clean
	+cd libpng-1.6.12 && $(_MAKE) clean
	+cd zlib-1.2.8 && $(_MAKE) clean
	+cd jpeg-9a && $(_MAKE) clean
	+cd libungif-4.1.1 && $(_MAKE) clean
	+cd curl-7.51.0 && $(_MAKE) clean
	+cd libffi-3.0.11 && $(_MAKE) clean

realclean:
	+cd freetype-2.3.12 && $(_MAKE) realclean
	+cd libpng-1.6.12 && $(_MAKE) realclean
	+cd zlib-1.2.8 && $(_MAKE) realclean
	+cd jpeg-9a && $(_MAKE) realclean
	+cd libungif-4.1.1 && $(_MAKE) realclean
	+cd curl-7.51.0 && $(_MAKE) realclean
	+cd libffi-3.0.11 && $(_MAKE) realclean

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
