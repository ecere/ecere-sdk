.PHONY: all objdir cleantarget clean realclean distclean

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

SOURCES = \
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

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w





CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS +=
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
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c adler32.c -o $(OBJ)adler32.o

$(OBJ)compress.o: compress.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c compress.c -o $(OBJ)compress.o

$(OBJ)crc32.o: crc32.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c crc32.c -o $(OBJ)crc32.o

$(OBJ)deflate.o: deflate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c deflate.c -o $(OBJ)deflate.o

$(OBJ)gzio.o: gzio.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c gzio.c -o $(OBJ)gzio.o

$(OBJ)infback.o: infback.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c infback.c -o $(OBJ)infback.o

$(OBJ)inffast.o: inffast.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c inffast.c -o $(OBJ)inffast.o

$(OBJ)inflate.o: inflate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c inflate.c -o $(OBJ)inflate.o

$(OBJ)inftrees.o: inftrees.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c inftrees.c -o $(OBJ)inftrees.o

$(OBJ)trees.o: trees.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c trees.c -o $(OBJ)trees.o

$(OBJ)uncompr.o: uncompr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c uncompr.c -o $(OBJ)uncompr.o

$(OBJ)zutil.o: zutil.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c zutil.c -o $(OBJ)zutil.o

cleantarget: objdir
	$(call rmq,$(TARGET))

clean: cleantarget
	$(call rmq,$(_OBJECTS))

realclean: cleantarget
	$(call rmrq,$(OBJ))

distclean: cleantarget
	$(call rmrq,obj/)
