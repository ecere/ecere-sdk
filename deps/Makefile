.PHONY: freetype jpeg png gif z ffi cleantarget clean realclean distclean
.SILENT:

# CROSS-PLATFORM MAGIC

include ../crossplatform.mk
include ../default.cf

ifdef WINDOWS_TARGET
all: freetype jpeg png gif ffi z
else
ifdef OSX_TARGET
all: jpeg gif
else
all: gif
endif
endif

cleantarget:
	cd freetype-2.3.12 && $(MAKE) cleantarget
	cd libpng-1.6.12 && $(MAKE) cleantarget
	cd zlib-1.2.8 && $(MAKE) cleantarget
	cd jpeg-9a && $(MAKE) cleantarget
	cd libungif-4.1.1 && $(MAKE) cleantarget
	cd libffi-3.0.11 && $(MAKE) cleantarget

clean:
	cd freetype-2.3.12 && $(MAKE) clean
	cd libpng-1.6.12 && $(MAKE) clean
	cd zlib-1.2.8 && $(MAKE) clean
	cd jpeg-9a && $(MAKE) clean
	cd libungif-4.1.1 && $(MAKE) clean
	cd libffi-3.0.11 && $(MAKE) clean

realclean:
	cd freetype-2.3.12 && $(MAKE) realclean
	cd libpng-1.6.12 && $(MAKE) realclean
	cd zlib-1.2.8 && $(MAKE) realclean
	cd jpeg-9a && $(MAKE) realclean
	cd libungif-4.1.1 && $(MAKE) realclean
	cd libffi-3.0.11 && $(MAKE) realclean

distclean:
	cd freetype-2.3.12 && $(MAKE) distclean
	cd libpng-1.6.12 && $(MAKE) distclean
	cd zlib-1.2.8 && $(MAKE) distclean
	cd jpeg-9a && $(MAKE) distclean
	cd libungif-4.1.1 && $(MAKE) distclean
	cd libffi-3.0.11 && $(MAKE) distclean

freetype:
	@$(call echo,Building FreeType...)
	cd freetype-2.3.12 && $(MAKE)
	
jpeg:
	@$(call echo,Building libjpeg...)
	cd jpeg-9a && $(MAKE)

png:
	@$(call echo,Building libpng...)
	cd libpng-1.6.12 && $(MAKE)

gif:
	@$(call echo,Building libungif...)
	cd libungif-4.1.1 && $(MAKE)

z:
	@$(call echo,Building zlib...)
	cd zlib-1.2.8 && $(MAKE)

ffi:
	@$(call echo,Building libffi...)
	cd libffi-3.0.11 && $(MAKE)
