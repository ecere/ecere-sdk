.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := ecp
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = executable

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

CONSOLE = -mconsole

# INCLUDES

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)include.mk

# CUSTOM TOOLCHAIN / COMPILER CONFIG

export LD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
ECP := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecp)
ECC := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecc)
ECS := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecs)
EAR := $(call psep,../../obj/$(PLATFORM)/bin/ear)

# END OF CUSTOM TOOLCHAIN / COMPILER CONFIG

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/ecp$(E)

_ECSOURCES = \
	ecp.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/ecp.mo \
	locale/es_ES/LC_MESSAGES/ecp.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

CFLAGS += \
	 $(if $(DEBIAN_PACKAGE),$(CPPFLAGS),) $(if $(DEBUG), -D_DEBUG,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w


ECFLAGS += \
	 -nolinenumbers




CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += $(FORCE_32_BIT) \
	 -L../../obj/$(PLATFORM)/bin \
	 -L../../obj/$(PLATFORM)/lib
OFLAGS += $(LDFLAGS)
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) -console $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) $(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/ecp.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) $(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/ecp.mo "locale/es_ES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../../obj/$(PLATFORM)/bin/)

# SYMBOL RULES

$(OBJ)ecp.sym: ecp.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ecp.ec -o $(OBJ)ecp.sym

# C OBJECT RULES

$(OBJ)ecp.c: ecp.ec $(OBJ)ecp.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ecp.ec -o $(OBJ)ecp.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)ecp.o: $(OBJ)ecp.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ecp.c -o $(OBJ)ecp.o

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
