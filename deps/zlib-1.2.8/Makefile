.PHONY: all objdir cleantarget clean realclean wipeclean distclean

# CORE VARIABLES

MODULE := libz
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

TARGET = $(OBJ)$(LP)z$(OUT)

_OBJECTS = \
	$(OBJ)adler32.o \
	$(OBJ)compress.o \
	$(OBJ)crc32.o \
	$(OBJ)deflate.o \
	$(OBJ)infback.o \
	$(OBJ)inffast.o \
	$(OBJ)inflate.o \
	$(OBJ)inftrees.o \
	$(OBJ)trees.o \
	$(OBJ)uncompr.o \
	$(OBJ)zutil.o \
	$(OBJ)gzclose.o \
	$(OBJ)gzlib.o \
	$(OBJ)gzread.o \
	$(OBJ)gzwrite.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	adler32.c \
	compress.c \
	crc32.c \
	deflate.c \
	infback.c \
	inffast.c \
	inflate.c \
	inftrees.c \
	trees.c \
	uncompr.c \
	zutil.c \
	gzclose.c \
	gzlib.c \
	gzread.c \
	gzwrite.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w

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
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)adler32.o: adler32.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,adler32.c) -o $(call quote_path,$@)

$(OBJ)compress.o: compress.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,compress.c) -o $(call quote_path,$@)

$(OBJ)crc32.o: crc32.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,crc32.c) -o $(call quote_path,$@)

$(OBJ)deflate.o: deflate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,deflate.c) -o $(call quote_path,$@)

$(OBJ)infback.o: infback.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,infback.c) -o $(call quote_path,$@)

$(OBJ)inffast.o: inffast.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,inffast.c) -o $(call quote_path,$@)

$(OBJ)inflate.o: inflate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,inflate.c) -o $(call quote_path,$@)

$(OBJ)inftrees.o: inftrees.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,inftrees.c) -o $(call quote_path,$@)

$(OBJ)trees.o: trees.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,trees.c) -o $(call quote_path,$@)

$(OBJ)uncompr.o: uncompr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,uncompr.c) -o $(call quote_path,$@)

$(OBJ)zutil.o: zutil.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,zutil.c) -o $(call quote_path,$@)

$(OBJ)gzclose.o: gzclose.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,gzclose.c) -o $(call quote_path,$@)

$(OBJ)gzlib.o: gzlib.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,gzlib.c) -o $(call quote_path,$@)

$(OBJ)gzread.o: gzread.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,gzread.c) -o $(call quote_path,$@)

$(OBJ)gzwrite.o: gzwrite.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,gzwrite.c) -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))

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
