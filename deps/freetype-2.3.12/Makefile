.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := libfreetype
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE
CFLAGS =
LDFLAGS =
endif
PRJ_CFLAGS =
CECFLAGS =
OFLAGS =
LIBS =

ifdef DEBUG
NOSTRIP := y
endif

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)freetype$(A)

_OBJECTS = $(_OBJECTS1) $(_OBJECTS2)
_OBJECTS1 = \
	$(OBJ)afglobal.o \
	$(OBJ)afindic.o \
	$(OBJ)autofit.o \
	$(OBJ)ftapi.o \
	$(OBJ)ftbase.o \
	$(OBJ)ftbbox.o \
	$(OBJ)ftbdf.o \
	$(OBJ)ftbitmap.o \
	$(OBJ)ftdebug.o \
	$(OBJ)ftgasp.o \
	$(OBJ)ftglyph.o \
	$(OBJ)ftgxval.o \
	$(OBJ)ftinit.o \
	$(OBJ)ftlcdfil.o \
	$(OBJ)ftmm.o \
	$(OBJ)ftotval.o \
	$(OBJ)ftpatent.o \
	$(OBJ)ftpfr.o \
	$(OBJ)ftstroke.o \
	$(OBJ)ftsynth.o \
	$(OBJ)ftsystem.o \
	$(OBJ)fttype1.o \
	$(OBJ)ftwinfnt.o \
	$(OBJ)ftxf86.o \
	$(OBJ)bdf.o \
	$(OBJ)ftcache.o \
	$(OBJ)cff.o \
	$(OBJ)type1cid.o \
	$(OBJ)gxvalid.o \
	$(OBJ)ftgzip.o \
	$(OBJ)ftlzw.o \
	$(OBJ)otvalid.o
_OBJECTS2 = \
	$(OBJ)pcf.o \
	$(OBJ)pfr.o \
	$(OBJ)psaux.o \
	$(OBJ)pshinter.o \
	$(OBJ)psnames.o \
	$(OBJ)raster.o \
	$(OBJ)sfnt.o \
	$(OBJ)smooth.o \
	$(OBJ)truetype.o \
	$(OBJ)type1.o \
	$(OBJ)type42.o \
	$(OBJ)winfnt.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	src/autofit/afglobal.c \
	src/autofit/afindic.c \
	src/autofit/autofit.c \
	src/base/ftapi.c \
	src/base/ftbase.c \
	src/base/ftbbox.c \
	src/base/ftbdf.c \
	src/base/ftbitmap.c \
	src/base/ftdebug.c \
	src/base/ftgasp.c \
	src/base/ftglyph.c \
	src/base/ftgxval.c \
	src/base/ftinit.c \
	src/base/ftlcdfil.c \
	src/base/ftmm.c \
	src/base/ftotval.c \
	src/base/ftpatent.c \
	src/base/ftpfr.c \
	src/base/ftstroke.c \
	src/base/ftsynth.c \
	src/base/ftsystem.c \
	src/base/fttype1.c \
	src/base/ftwinfnt.c \
	src/base/ftxf86.c \
	src/bdf/bdf.c \
	src/cache/ftcache.c \
	src/cff/cff.c \
	src/cid/type1cid.c \
	src/gxvalid/gxvalid.c \
	src/gzip/ftgzip.c \
	src/lzw/ftlzw.c \
	src/otvalid/otvalid.c \
	src/pcf/pcf.c \
	src/pfr/pfr.c \
	src/psaux/psaux.c \
	src/pshinter/pshinter.c \
	src/psnames/psnames.c \
	src/raster/raster.c \
	src/sfnt/sfnt.c \
	src/smooth/smooth.c \
	src/truetype/truetype.c \
	src/type1/type1.c \
	src/type42/type42.c \
	src/winfonts/winfnt.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

# Warning: Compiling with -O2 gives 0 font height with MinGW!!
PRJ_CFLAGS += \
	 $(if $(DEBUG),-g) $(FPIC) -w \
			 -DFT2_BUILD_LIBRARY \
			 -DFT_OPTION_AUTOFIT2 \
			 -I../zlib \
			 -Iinclude \
			 -Iinclude/freetype \
			 -Iinclude/freetype/internal





CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)afglobal.o: src/autofit/afglobal.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/autofit/afglobal.c -o $(OBJ)afglobal.o

$(OBJ)afindic.o: src/autofit/afindic.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/autofit/afindic.c -o $(OBJ)afindic.o

$(OBJ)autofit.o: src/autofit/autofit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/autofit/autofit.c -o $(OBJ)autofit.o

$(OBJ)ftapi.o: src/base/ftapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftapi.c -o $(OBJ)ftapi.o

$(OBJ)ftbase.o: src/base/ftbase.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftbase.c -o $(OBJ)ftbase.o

$(OBJ)ftbbox.o: src/base/ftbbox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftbbox.c -o $(OBJ)ftbbox.o

$(OBJ)ftbdf.o: src/base/ftbdf.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftbdf.c -o $(OBJ)ftbdf.o

$(OBJ)ftbitmap.o: src/base/ftbitmap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftbitmap.c -o $(OBJ)ftbitmap.o

$(OBJ)ftdebug.o: src/base/ftdebug.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftdebug.c -o $(OBJ)ftdebug.o

$(OBJ)ftgasp.o: src/base/ftgasp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftgasp.c -o $(OBJ)ftgasp.o

$(OBJ)ftglyph.o: src/base/ftglyph.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftglyph.c -o $(OBJ)ftglyph.o

$(OBJ)ftgxval.o: src/base/ftgxval.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftgxval.c -o $(OBJ)ftgxval.o

$(OBJ)ftinit.o: src/base/ftinit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftinit.c -o $(OBJ)ftinit.o

$(OBJ)ftlcdfil.o: src/base/ftlcdfil.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftlcdfil.c -o $(OBJ)ftlcdfil.o

$(OBJ)ftmm.o: src/base/ftmm.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftmm.c -o $(OBJ)ftmm.o

$(OBJ)ftotval.o: src/base/ftotval.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftotval.c -o $(OBJ)ftotval.o

$(OBJ)ftpatent.o: src/base/ftpatent.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftpatent.c -o $(OBJ)ftpatent.o

$(OBJ)ftpfr.o: src/base/ftpfr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftpfr.c -o $(OBJ)ftpfr.o

$(OBJ)ftstroke.o: src/base/ftstroke.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftstroke.c -o $(OBJ)ftstroke.o

$(OBJ)ftsynth.o: src/base/ftsynth.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftsynth.c -o $(OBJ)ftsynth.o

$(OBJ)ftsystem.o: src/base/ftsystem.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftsystem.c -o $(OBJ)ftsystem.o

$(OBJ)fttype1.o: src/base/fttype1.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/fttype1.c -o $(OBJ)fttype1.o

$(OBJ)ftwinfnt.o: src/base/ftwinfnt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftwinfnt.c -o $(OBJ)ftwinfnt.o

$(OBJ)ftxf86.o: src/base/ftxf86.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/base/ftxf86.c -o $(OBJ)ftxf86.o

$(OBJ)bdf.o: src/bdf/bdf.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/bdf/bdf.c -o $(OBJ)bdf.o

$(OBJ)ftcache.o: src/cache/ftcache.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/cache/ftcache.c -o $(OBJ)ftcache.o

$(OBJ)cff.o: src/cff/cff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/cff/cff.c -o $(OBJ)cff.o

$(OBJ)type1cid.o: src/cid/type1cid.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/cid/type1cid.c -o $(OBJ)type1cid.o

$(OBJ)gxvalid.o: src/gxvalid/gxvalid.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gxvalid/gxvalid.c -o $(OBJ)gxvalid.o

$(OBJ)ftgzip.o: src/gzip/ftgzip.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gzip/ftgzip.c -o $(OBJ)ftgzip.o

$(OBJ)ftlzw.o: src/lzw/ftlzw.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/lzw/ftlzw.c -o $(OBJ)ftlzw.o

$(OBJ)otvalid.o: src/otvalid/otvalid.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/otvalid/otvalid.c -o $(OBJ)otvalid.o

$(OBJ)pcf.o: src/pcf/pcf.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/pcf/pcf.c -o $(OBJ)pcf.o

$(OBJ)pfr.o: src/pfr/pfr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/pfr/pfr.c -o $(OBJ)pfr.o

$(OBJ)psaux.o: src/psaux/psaux.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/psaux/psaux.c -o $(OBJ)psaux.o

$(OBJ)pshinter.o: src/pshinter/pshinter.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/pshinter/pshinter.c -o $(OBJ)pshinter.o

$(OBJ)psnames.o: src/psnames/psnames.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/psnames/psnames.c -o $(OBJ)psnames.o

$(OBJ)raster.o: src/raster/raster.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/raster/raster.c -o $(OBJ)raster.o

$(OBJ)sfnt.o: src/sfnt/sfnt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/sfnt/sfnt.c -o $(OBJ)sfnt.o

$(OBJ)smooth.o: src/smooth/smooth.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/smooth/smooth.c -o $(OBJ)smooth.o

$(OBJ)truetype.o: src/truetype/truetype.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/truetype/truetype.c -o $(OBJ)truetype.o

$(OBJ)type1.o: src/type1/type1.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/type1/type1.c -o $(OBJ)type1.o

$(OBJ)type42.o: src/type42/type42.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/type42/type42.c -o $(OBJ)type42.o

$(OBJ)winfnt.o: src/winfonts/winfnt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/winfonts/winfnt.c -o $(OBJ)winfnt.o

cleantarget: objdir
	$(call rmq,$(TARGET))

clean: cleantarget
	$(call rmq,$(_OBJECTS1))
	$(call rmq,$(_OBJECTS2))

realclean: cleantarget
	$(call rmrq,$(OBJ))

distclean: cleantarget
	$(call rmrq,obj/)
