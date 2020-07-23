.PHONY: all objdir cleantarget clean realclean wipeclean distclean

# CORE VARIABLES

MODULE := libpng
VERSION :=
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

# FLAGS

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

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES =

TARGET = $(OBJ)$(LP)png$(OUT)

_OBJECTS = \
	$(OBJ)png.o \
	$(OBJ)pngerror.o \
	$(OBJ)pngget.o \
	$(OBJ)pngmem.o \
	$(OBJ)pngpread.o \
	$(OBJ)pngread.o \
	$(OBJ)pngrio.o \
	$(OBJ)pngrtran.o \
	$(OBJ)pngrutil.o \
	$(OBJ)pngset.o \
	$(OBJ)pngtrans.o \
	$(OBJ)pngwio.o \
	$(OBJ)pngwrite.o \
	$(OBJ)pngwtran.o \
	$(OBJ)pngwutil.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	./png.c \
	./pngerror.c \
	./pngget.c \
	./pngmem.c \
	./pngpread.c \
	./pngread.c \
	./pngrio.c \
	./pngrtran.c \
	./pngrutil.c \
	./pngset.c \
	./pngtrans.c \
	./pngwio.c \
	./pngwrite.c \
	./pngwtran.c \
	./pngwutil.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w \
		 -I. \
		 -I../zlib-1.2.8

CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
	$(if SO_LIB_LINKS,$(if $(VER_MAJ),ln -sf $(LP)$(MODULE)$(OUT) $(OBJ)$(LP)$(MODULE)$(SO)$(VER_MAJ),),)
	$(if SO_LIB_LINKS,$(if $(VER),ln -sf $(LP)$(MODULE)$(OUT) $(OBJ)$(LP)$(MODULE)$(SO),),)

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)png.o: ./png.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./png.c) -o $(call quote_path,$@)

$(OBJ)pngerror.o: ./pngerror.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngerror.c) -o $(call quote_path,$@)

$(OBJ)pngget.o: ./pngget.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngget.c) -o $(call quote_path,$@)

$(OBJ)pngmem.o: ./pngmem.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngmem.c) -o $(call quote_path,$@)

$(OBJ)pngpread.o: ./pngpread.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngpread.c) -o $(call quote_path,$@)

$(OBJ)pngread.o: ./pngread.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngread.c) -o $(call quote_path,$@)

$(OBJ)pngrio.o: ./pngrio.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngrio.c) -o $(call quote_path,$@)

$(OBJ)pngrtran.o: ./pngrtran.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngrtran.c) -o $(call quote_path,$@)

$(OBJ)pngrutil.o: ./pngrutil.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngrutil.c) -o $(call quote_path,$@)

$(OBJ)pngset.o: ./pngset.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngset.c) -o $(call quote_path,$@)

$(OBJ)pngtrans.o: ./pngtrans.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngtrans.c) -o $(call quote_path,$@)

$(OBJ)pngwio.o: ./pngwio.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngwio.c) -o $(call quote_path,$@)

$(OBJ)pngwrite.o: ./pngwrite.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngwrite.c) -o $(call quote_path,$@)

$(OBJ)pngwtran.o: ./pngwtran.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngwtran.c) -o $(call quote_path,$@)

$(OBJ)pngwutil.o: ./pngwutil.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,./pngwutil.c) -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))
	$(if SO_LIB_LINKS,$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(VER_MAJ)),)
	$(if SO_LIB_LINKS,$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)),)

clean: cleantarget
	$(call rm,$(_OBJECTS))

realclean: cleantarget
	$(call rmr,$(OBJ))

wipeclean:
	$(call rmr,obj/)

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
