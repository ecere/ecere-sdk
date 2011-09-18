.PHONY: freetype jpeg png gif z clean realclean distclean
.SILENT:

# CROSS-PLATFORM MAGIC

include ../include.mk

ifdef WINDOWS
all: freetype jpeg png gif z
else
ifdef OSX
all: jpeg png gif
else
all: gif
endif
endif

clean:
	cd freetype-2.3.12 && $(MAKE) clean
	cd libpng-1.4.0 && $(MAKE) clean
	cd zlib && $(MAKE) clean
	cd jpeg-6b && $(MAKE) clean
	cd libungif-4.1.1 && $(MAKE) clean

realclean:
	cd freetype-2.3.12 && $(MAKE) realclean
	cd libpng-1.4.0 && $(MAKE) realclean
	cd zlib && $(MAKE) realclean
	cd jpeg-6b && $(MAKE) realclean
	cd libungif-4.1.1 && $(MAKE) realclean

distclean:
	cd freetype-2.3.12 && $(MAKE) distclean
	cd libpng-1.4.0 && $(MAKE) distclean
	cd zlib && $(MAKE) distclean
	cd jpeg-6b && $(MAKE) distclean
	cd libungif-4.1.1 && $(MAKE) distclean

freetype:
	@$(call echo,Building FreeType...)
	cd freetype-2.3.12 && $(MAKE)
	
jpeg:
	@$(call echo,Building libjpeg...)
	cd jpeg-6b && $(MAKE)

png:
	@$(call echo,Building libpng...)
	cd libpng-1.4.0 && $(MAKE)

gif:
	@$(call echo,Building libungif...)
	cd libungif-4.1.1 && $(MAKE)

z:
	@$(call echo,Building zlib...)
	cd zlib && $(MAKE)


