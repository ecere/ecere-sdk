.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ffi
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

_CF_DIR = $(CF_DIR)

ifndef DEBUG
OPTIMIZE := -O2 -ffast-math
else
OPTIMIZE := -g
NOSTRIP := y
endif
TARGET_TYPE = staticlib

ifeq "$(TARGET_TYPE)" "executable"
CONSOLE = -mwindows
endif

# FLAGS

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# INCLUDES

include ../../crossplatform.mk
include ../../include.mk

# VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

ifdef DEBUG
CFLAGS += -D_DEBUG
endif

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ffi$(A)

OBJECTS = \
	$(OBJ)ffi.o \
	$(OBJ)win32.o \
	$(OBJ)prep_cif.o \
	$(OBJ)raw_api.o \
	$(OBJ)types.o \
	$(OBJ)closures.o

_ECSOURCES =

ECSOURCES = $(call shwspace,$(_ECSOURCES))




SOURCES = $(ECSOURCES) \
	src/x86/ffi.c \
	src/x86/win32.S \
	src/prep_cif.c \
	src/raw_api.c \
	src/types.c \
	src/closures.c

RESOURCES =

LIBS = $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

CFLAGS += -fmessage-length=0 $(OPTIMIZE) $(FPIC) -Wall \
	 -Iinclude \
	 -Ii686-pc-mingw32/include \
	 -Ii686-pc-mingw32

CECFLAGS =

ECFLAGS =

ifneq "$(TARGET_TYPE)" "staticlib"
OFLAGS +=
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifneq "$(TARGET_TYPE)" "staticlib"
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)ffi.o: src/x86/ffi.c
	$(CC) $(CFLAGS) -c src/x86/ffi.c -o $(OBJ)ffi.o

$(OBJ)win32.o: src/x86/win32.S
	$(CC) $(CFLAGS) -c src/x86/win32.S -o $(OBJ)win32.o

$(OBJ)prep_cif.o: src/prep_cif.c
	$(CC) $(CFLAGS) -c src/prep_cif.c -o $(OBJ)prep_cif.o

$(OBJ)raw_api.o: src/raw_api.c
	$(CC) $(CFLAGS) -c src/raw_api.c -o $(OBJ)raw_api.o

$(OBJ)types.o: src/types.c
	$(CC) $(CFLAGS) -c src/types.c -o $(OBJ)types.o

$(OBJ)closures.o: src/closures.c
	$(CC) $(CFLAGS) -c src/closures.c -o $(OBJ)closures.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean: clean
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
