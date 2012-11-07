.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := ffi
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
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ffi$(A)

_OBJECTS = \
	$(OBJ)ffi.o \
	$(OBJ)win32.o \
	$(OBJ)prep_cif.o \
	$(OBJ)raw_api.o \
	$(OBJ)types.o \
	$(OBJ)closures.o

OBJECTS = $(_OBJECTS)

SOURCES = $(ECSOURCES) \
	src/x86/ffi.c \
	src/x86/win32.S \
	src/prep_cif.c \
	src/raw_api.c \
	src/types.c \
	src/closures.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

CFLAGS += \
	 $(if $(DEBIAN_PACKAGE),$(CPPFLAGS),) $(if $(DEBUG), -D_DEBUG,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall \
			 -Iinclude \
			 -Ii686-pc-mingw32/include \
			 -Ii686-pc-mingw32





CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS +=
OFLAGS += $(LDFLAGS)
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
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
	$(call rmq,$(_OBJECTS))

realclean: clean
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
