.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := libz
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE
CFLAGS =
endif
CECFLAGS =
OFLAGS =
LDFLAGS =
LIBS =

ifdef DEBUG
NOSTRIP := y
endif

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)include.mk

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)z$(A)

_OBJECTS = \
	$(OBJ)adler32.o \
	$(OBJ)compress.o \
	$(OBJ)crc32.o \
	$(OBJ)deflate.o \
	$(OBJ)gzio.o \
	$(OBJ)infback.o \
	$(OBJ)inffast.o \
	$(OBJ)inflate.o \
	$(OBJ)inftrees.o \
	$(OBJ)trees.o \
	$(OBJ)uncompr.o \
	$(OBJ)zutil.o

OBJECTS = $(_OBJECTS)

SOURCES = $(ECSOURCES) \
	adler32.c \
	compress.c \
	crc32.c \
	deflate.c \
	gzio.c \
	infback.c \
	inffast.c \
	inflate.c \
	inftrees.c \
	trees.c \
	uncompr.c \
	zutil.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

CFLAGS += \
	 $(if $(DEBIAN_PACKAGE),$(CPPFLAGS),) $(if $(DEBUG), -D_DEBUG,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w





CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS +=
OFLAGS += $(LDFLAGS)
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)adler32.o: adler32.c
	$(CC) $(CFLAGS) -c adler32.c -o $(OBJ)adler32.o

$(OBJ)compress.o: compress.c
	$(CC) $(CFLAGS) -c compress.c -o $(OBJ)compress.o

$(OBJ)crc32.o: crc32.c
	$(CC) $(CFLAGS) -c crc32.c -o $(OBJ)crc32.o

$(OBJ)deflate.o: deflate.c
	$(CC) $(CFLAGS) -c deflate.c -o $(OBJ)deflate.o

$(OBJ)gzio.o: gzio.c
	$(CC) $(CFLAGS) -c gzio.c -o $(OBJ)gzio.o

$(OBJ)infback.o: infback.c
	$(CC) $(CFLAGS) -c infback.c -o $(OBJ)infback.o

$(OBJ)inffast.o: inffast.c
	$(CC) $(CFLAGS) -c inffast.c -o $(OBJ)inffast.o

$(OBJ)inflate.o: inflate.c
	$(CC) $(CFLAGS) -c inflate.c -o $(OBJ)inflate.o

$(OBJ)inftrees.o: inftrees.c
	$(CC) $(CFLAGS) -c inftrees.c -o $(OBJ)inftrees.o

$(OBJ)trees.o: trees.c
	$(CC) $(CFLAGS) -c trees.c -o $(OBJ)trees.o

$(OBJ)uncompr.o: uncompr.c
	$(CC) $(CFLAGS) -c uncompr.c -o $(OBJ)uncompr.o

$(OBJ)zutil.o: zutil.c
	$(CC) $(CFLAGS) -c zutil.c -o $(OBJ)zutil.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(_OBJECTS))

realclean: clean
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
