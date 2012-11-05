.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := EDASQLite
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = sharedlib

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

_CF_DIR = ../../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)include.mk

# CUSTOM TOOLCHAIN / COMPILER CONFIG

export LD_LIBRARY_PATH = ../../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../../obj/$(PLATFORM)/lib/
ECP := $(call psep,../../../obj/$(PLATFORM)/bin/ecp)
ECC := $(call psep,../../../obj/$(PLATFORM)/bin/ecc)$(if $(CROSS_TARGET), -t $(TARGET_PLATFORM),)
ECS := $(call psep,../../../obj/$(PLATFORM)/bin/ecs)$(if $(CROSS_TARGET), -t $(TARGET_PLATFORM),)
EAR := $(call psep,../../../obj/$(PLATFORM)/bin/ear)

# END OF CUSTOM TOOLCHAIN / COMPILER CONFIG

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

ifdef LINUX_TARGET
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLite$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDASQLite$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLite$(SO)
SONAME =
endif

_ECSOURCES = \
	EDASQLite.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

_OBJECTS = \
	$(if $(LINUX_TARGET),,$(OBJ)sqlite3.o)

OBJECTS = $(_OBJECTS) $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES) \
	$(if $(LINUX_TARGET),,sqlite3.c)

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/EDASQLite.mo \
	locale/es_ES/LC_MESSAGES/EDASQLite.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere) \
	$(call _L,ffi)
endif

CFLAGS += \
	 $(if $(DEBIAN_PACKAGE),$(CPPFLAGS),) $(if $(DEBUG), -D_DEBUG,) \
	 $(if $(WINDOWS_TARGET), \
			 -I../../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w

CUSTOM1_CFLAGS = \
	 $(if $(DEBIAN_PACKAGE),$(CPPFLAGS),) $(if $(DEBUG), -D_DEBUG,) \
	 $(if $(WINDOWS_TARGET), \
			 -I../../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2) $(FORCE_32_BIT) $(FPIC) -w


ECFLAGS += \
	 -nolinenumbers


# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../../../deps/libffi-3.0.11/obj/release.$(PLATFORM)
endif

else
ifdef LINUX_TARGET

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,pthread) \
	$(call _L,dl) \
	$(call _L,sqlite3)
endif

else
ifdef OSX_TARGET

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,pthread) \
	$(call _L,dl)
endif

endif
endif
endif



CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += $(FORCE_32_BIT) \
	 -L../../../obj/$(PLATFORM)/bin \
	 -L../../../obj/$(PLATFORM)/lib
OFLAGS += $(LDFLAGS)
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) $(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/EDASQLite.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) $(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/EDASQLite.mo "locale/es_ES/LC_MESSAGES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../../../$(SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

# SYMBOL RULES

$(OBJ)EDASQLite.sym: EDASQLite.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c EDASQLite.ec -o $(OBJ)EDASQLite.sym

# C OBJECT RULES

$(OBJ)EDASQLite.c: EDASQLite.ec $(OBJ)EDASQLite.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c EDASQLite.ec -o $(OBJ)EDASQLite.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)sqlite3.o: sqlite3.c
	$(CC) $(CUSTOM1_CFLAGS) -c sqlite3.c -o $(OBJ)sqlite3.o

$(OBJ)EDASQLite.o: $(OBJ)EDASQLite.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)EDASQLite.c -o $(OBJ)EDASQLite.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

clean: objdir
	$(call rmq,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(_OBJECTS))
	$(call rmq,$(ECOBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(BOWLS))
	$(call rmq,$(IMPORTS))
	$(call rmq,$(SYMBOLS))

realclean: clean
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
