.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ungif
CONFIG := release
COMPILER := default
TARGET_TYPE = staticlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)ungif$(A)

OBJECTS = $(OBJ)dgif_lib.o $(OBJ)gif_err.o $(OBJ)gifalloc.o

COBJECTS =

SYMBOLS =

IMPORTS =

SOURCES = lib/dgif_lib.c lib/gif_err.c lib/gifalloc.c

RESOURCES =

# CROSS-PLATFORM MAGIC

include ../../include.mk

# TOOLCHAIN

CPP := cpp
CC := gcc
LD := gcc
AR := ar
STRIP := strip
UPX := upx

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w

LIBS = $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
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

$(OBJ)dgif_lib.o: lib/dgif_lib.c
	$(CC) $(CFLAGS) -c lib/dgif_lib.c -o $(OBJ)dgif_lib.o

$(OBJ)gif_err.o: lib/gif_err.c
	$(CC) $(CFLAGS) -c lib/gif_err.c -o $(OBJ)gif_err.o

$(OBJ)gifalloc.o: lib/gifalloc.c
	$(CC) $(CFLAGS) -c lib/gifalloc.c -o $(OBJ)gifalloc.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
