.PHONY: all objdir cleantarget clean realclean wipeclean distclean

# CORE VARIABLES

MODULE := EDASQLite
VERSION := 0.44
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = sharedlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE

_CPPFLAGS := $(CPPFLAGS)
override CPPFLAGS = $(_CPPFLAGS)

_CFLAGS := $(CFLAGS)
override CFLAGS = $(_CFLAGS)

_CXXFLAGS := $(CXXFLAGS)
override CXXFLAGS = $(_CXXFLAGS)

_LDFLAGS := $(LDFLAGS)
override LDFLAGS = $(_LDFLAGS)

_OWFLAGS := $(OWFLAGS)
override OWFLAGS = $(_OWFLAGS)

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

_CF_DIR = ../../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES =

TARGET = $(OBJ)$(LP)EDASQLite$(OUT)

_ECSOURCES = \
	EDASQLite.ec \
	sqliteDB.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

_COBJECTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES))))
_SYMBOLS = $(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES))))
_IMPORTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES))))
_ECOBJECTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES))))
_BOWLS = $(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES))))

COBJECTS = $(call shwspace,$(_COBJECTS))
SYMBOLS = $(call shwspace,$(_SYMBOLS))
IMPORTS = $(call shwspace,$(_IMPORTS))
ECOBJECTS = $(call shwspace,$(_ECOBJECTS))
BOWLS = $(call shwspace,$(_BOWLS))

_OBJECTS = \
	$(if $(LINUX_TARGET),,$(OBJ)sqlite3$(O))

OBJECTS = $(_OBJECTS) $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES) \
	$(if $(LINUX_TARGET),,sqlite3.c)

RESOURCES = \
	locale/es.mo \
	locale/he.mo \
	locale/pt_BR.mo \
	locale/ru.mo \
	locale/zh_CN.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere) \
	$(call _L,ffi)
endif

PRJ_CFLAGS += \
	 $(if $(WINDOWS_TARGET), \
		 -I../../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) \
		 -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\"" \
		 -DSQLITE_DEFAULT_LOCKING_MODE=1 \
		 -DSQLITE_ENABLE_RTREE=1 \
		 -DSQLITE_OMIT_AUTHORIZATION

CUSTOM1_PRJ_CFLAGS = \
	 $(if $(WINDOWS_TARGET), \
		 -I../../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2) $(FPIC) \
		 -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\"" \
		 -DSQLITE_DEFAULT_LOCKING_MODE=1 \
		 -DSQLITE_ENABLE_RTREE=1 \
		 -DSQLITE_OMIT_AUTHORIZATION

ECFLAGS += -module $(MODULE)
ECFLAGS += \
	 -nolinenumbers

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../../../deps/libffi-3.0.11/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)
LIBS += \
	$(call _L,gnurx-0)
endif

else
ifdef LINUX_TARGET

# To fix libffi build problem on Oneiric/amd64
CFLAGS += \
	 -I/usr/include/i686-linux-gnu

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
OFLAGS += \
	 -L../../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin \
	 -L../../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es.mo locale/he.mo locale/pt_BR.mo locale/ru.mo locale/zh_CN.mo "locale"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cp,$(TARGET),../../../$(SODESTDIR))
	$(if SO_LIB_LINKS,$(if $(VER_MAJ),ln -sf $(LP)$(MODULE)$(OUT) ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO)$(VER_MAJ),),)
	$(if SO_LIB_LINKS,$(if $(VER),ln -sf $(LP)$(MODULE)$(OUT) ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO),),)
	$(if SO_LIB_LINKS,$(if $(VER_MAJ),ln -sf $(LP)$(MODULE)$(OUT) $(OBJ)$(LP)$(MODULE)$(SO)$(VER_MAJ),),)
	$(if SO_LIB_LINKS,$(if $(VER),ln -sf $(LP)$(MODULE)$(OUT) $(OBJ)$(LP)$(MODULE)$(SO),),)

# SYMBOL RULES

$(OBJ)EDASQLite.sym: EDASQLite.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c EDASQLite.ec -o $(OBJ)EDASQLite.sym

$(OBJ)sqliteDB.sym: sqliteDB.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c sqliteDB.ec -o $(OBJ)sqliteDB.sym

# C OBJECT RULES

$(OBJ)EDASQLite.c: EDASQLite.ec $(OBJ)EDASQLite.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c EDASQLite.ec -o $(OBJ)EDASQLite.c -symbols $(OBJ)

$(OBJ)sqliteDB.c: sqliteDB.ec $(OBJ)sqliteDB.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c sqliteDB.ec -o $(OBJ)sqliteDB.c -symbols $(OBJ)

# OBJECT RULES

ifneq ($(or $(WINDOWS_TARGET),$(OSX_TARGET)),)
$(OBJ)sqlite3$(O): sqlite3.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c sqlite3.c -o $(OBJ)sqlite3$(O)
endif

$(OBJ)EDASQLite$(O): $(OBJ)EDASQLite.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EDASQLite.c -o $(OBJ)EDASQLite$(O)

$(OBJ)sqliteDB$(O): $(OBJ)sqliteDB.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)sqliteDB.c -o $(OBJ)sqliteDB$(O)

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main$(O) $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rm,$(TARGET))
	$(if SO_LIB_LINKS,$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(VER_MAJ)),)
	$(if SO_LIB_LINKS,$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)),)

clean: cleantarget
	$(call rm,$(_OBJECTS))
	$(call rm,$(_ECOBJECTS))
	$(call rm,$(_COBJECTS))
	$(call rm,$(_BOWLS))
	$(call rm,$(_IMPORTS))
	$(call rm,$(_SYMBOLS))

realclean: cleantarget
	$(call rmr,$(OBJ))

wipeclean:
	$(call rmr,obj/)

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
