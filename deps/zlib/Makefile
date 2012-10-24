.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := libz
CONFIG := release
COMPILER := default
TARGET_TYPE = staticlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)z$(A)

OBJECTS = \
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

COBJECTS =

SYMBOLS =

IMPORTS =

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

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# CROSS-PLATFORM MAGIC

include ../../crossplatform.mk
include ../../include.mk

# FLAGS

CFLAGS += -fmessage-length=0 -O2 -ffast-math $(FORCE_32_BIT) $(FPIC) -w

LIBS = $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX_TARGET
OFLAGS += -Wl,--no-undefined
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
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
