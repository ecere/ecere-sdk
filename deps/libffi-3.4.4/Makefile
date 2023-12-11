.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := ffi
VERSION :=
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

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES =

TARGET_NAME := ffi

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)$(TARGET_NAME)$(OUT)

_OBJECTS = \
	$(OBJ)win64$(O) \
	$(OBJ)prep_cif$(O) \
	$(OBJ)raw_api$(O) \
	$(OBJ)types$(O) \
	$(OBJ)closures$(O) \
	$(OBJ)ffi$(O) \
	$(if $(WINDOWS_TARGET),,$(OBJ)ffi64$(O)) \
	$(if $(LINUX_TARGET),,$(OBJ)ffiw64$(O)) \
	$(OBJ)sysv$(O)

OBJECTS = $(_OBJECTS)

SOURCES = \
	src/x86/win64.S \
	src/prep_cif.c \
	src/raw_api.c \
	src/types.c \
	src/closures.c \
	src/x86/ffi.c \
	$(if $(WINDOWS_TARGET),,src/x86/ffi64.c) \
	$(if $(LINUX_TARGET),,src/x86/ffiw64.c) \
	src/x86/sysv.S

RESOURCES =

ifdef USE_RESOURCES_EAR
RESOURCES_EAR =
else
RESOURCES_EAR = $(RESOURCES)
endif

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(WINDOWS_TARGET), \
			 -Ii686-w64-mingw32/include \
			 -Ii686-w64-mingw32,) \
	 $(if $(LINUX_TARGET), \
			 -Ix86_64-pc-linux-gnu \
			 -Ix86_64-pc-linux-gnu/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\"" \
			 -Iinclude

ECFLAGS += -module $(MODULE)
# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

endif

CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES_EAR) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(LD) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
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
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
endif
endif
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)win64$(O): src/x86/win64.S
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/x86/win64.S) -o $(call quote_path,$@)

$(OBJ)prep_cif$(O): src/prep_cif.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/prep_cif.c) -o $(call quote_path,$@)

$(OBJ)raw_api$(O): src/raw_api.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/raw_api.c) -o $(call quote_path,$@)

$(OBJ)types$(O): src/types.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/types.c) -o $(call quote_path,$@)

$(OBJ)closures$(O): src/closures.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/closures.c) -o $(call quote_path,$@)

$(OBJ)ffi$(O): src/x86/ffi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/x86/ffi.c) -o $(call quote_path,$@)

ifneq ($(or $(LINUX_TARGET),$(OSX_TARGET)),)
$(OBJ)ffi64$(O): src/x86/ffi64.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/x86/ffi64.c) -o $(call quote_path,$@)
endif

ifneq ($(or $(WINDOWS_TARGET),$(OSX_TARGET)),)
$(OBJ)ffiw64$(O): src/x86/ffiw64.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/x86/ffiw64.c) -o $(call quote_path,$@)
endif

$(OBJ)sysv$(O): src/x86/sysv.S
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/x86/sysv.S) -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)))
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO))
endif
endif
endif

clean: cleantarget
	$(call rm,$(_OBJECTS))

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean: cleantarget
	$(call rmr,obj/)
	$(call rmr,.configs/)
	$(call rm,*.ews)
	$(call rm,*.Makefile)
