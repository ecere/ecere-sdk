.PHONY: all objdir cleantarget clean realclean distclean openssl_debug

# CORE VARIABLES

MODULE := EDASQLiteCipher
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = sharedlib

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

_CF_DIR = ../../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

ifdef LINUX_TARGET
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLiteCipher$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDASQLiteCipher$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLiteCipher$(SO)
SONAME =
endif

_ECSOURCES = \
	EDASQLiteCipher.ec \
	../sqlite/EDASQLite.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

_OBJECTS = \
	$(OBJ)sqlite3.o

OBJECTS = $(_OBJECTS) $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES) \
	sqlite3.c

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/EDASQLiteCipher.mo \
	locale/es_ES/EDASQLiteCipher.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere) \
	$(call _L,ffi)
endif

PRJ_CFLAGS += \
	 $(if $(WINDOWS_TARGET), \
			 -I$(OPENSSL_INCLUDE_DIR) \
			 -I../../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w \
			 -DSQLITE_HAS_CODEC

CUSTOM1_PRJ_CFLAGS = \
	 $(if $(WINDOWS_TARGET), \
			 -I$(OPENSSL_INCLUDE_DIR) \
			 -I../../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2) $(FORCE_32_BIT) $(FPIC) -w \
			 -DSQLITE_HAS_CODEC


ECFLAGS += \
	 -nolinenumbers


# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L$(OPENSSL_LIB_DIR) \
	 -L../../../deps/libffi-3.0.11/obj/release.$(PLATFORM)
LIBS += \
	$(call _L,libeay32)
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
	$(call _L,crypto)
endif

else
ifdef OSX_TARGET

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,pthread) \
	$(call _L,dl) \
	$(call _L,crypto)
endif

endif
endif
endif



CECFLAGS += -cpp $(_CPP)

OFLAGS += $(FORCE_32_BIT)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../../../obj/$(PLATFORM)/bin \
	 -L../../../obj/$(PLATFORM)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(OBJ)$(MODULE).main.ec

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
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/EDASQLiteCipher.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es_ES/EDASQLiteCipher.mo "locale/es_ES/LC_MESSAGES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../../../$(SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

# SYMBOL RULES

$(OBJ)EDASQLiteCipher.sym: EDASQLiteCipher.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c EDASQLiteCipher.ec -o $(OBJ)EDASQLiteCipher.sym

$(OBJ)EDASQLite.sym: ../sqlite/EDASQLite.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../sqlite/EDASQLite.ec -o $(OBJ)EDASQLite.sym

# C OBJECT RULES

$(OBJ)EDASQLiteCipher.c: EDASQLiteCipher.ec $(OBJ)EDASQLiteCipher.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c EDASQLiteCipher.ec -o $(OBJ)EDASQLiteCipher.c -symbols $(OBJ)

$(OBJ)EDASQLite.c: ../sqlite/EDASQLite.ec $(OBJ)EDASQLite.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../sqlite/EDASQLite.ec -o $(OBJ)EDASQLite.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)sqlite3.o: sqlite3.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c sqlite3.c -o $(OBJ)sqlite3.o

$(OBJ)EDASQLiteCipher.o: $(OBJ)EDASQLiteCipher.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EDASQLiteCipher.c -o $(OBJ)EDASQLiteCipher.o

$(OBJ)EDASQLite.o: $(OBJ)EDASQLite.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EDASQLite.c -o $(OBJ)EDASQLite.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

openssl_debug:
	@$(call echo,OPENSSL_CONF $(OPENSSL_CONF))
	@$(call echo,_OPENSSL_CONF $(_OPENSSL_CONF))
	@$(call echo,OPENSSL_INCLUDE_DIR $(OPENSSL_INCLUDE_DIR))
	@$(call echo,OPENSSL_BIN_DIR $(OPENSSL_BIN_DIR))
	@$(call echo,OPENSSL_LIB_DIR $(OPENSSL_LIB_DIR))

cleantarget: objdir
	$(call rmq,$(TARGET))

clean: cleantarget
	$(call rmq,$(_OBJECTS))
	$(call rmq,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rmq,$(ECOBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(BOWLS))
	$(call rmq,$(IMPORTS))
	$(call rmq,$(SYMBOLS))

realclean: cleantarget
	$(call rmrq,$(OBJ))

distclean: cleantarget
	$(call rmrq,obj/)
