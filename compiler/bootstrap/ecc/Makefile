.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := ecc
CONFIG := bootstrap
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = executable

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

CONSOLE = -mconsole

# INCLUDES

_CF_DIR = ../../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(E)

OBJECTS = \
	$(OBJ)ecc.o \
	$(OBJ)$(MODULE).main$(O)

SOURCES = \
	bootstrap/ecc.c \
	bootstrap/ecc.main.c

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecereBootstrap) \
	$(call _L,ecBootstrap)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w \
			 -DECERE_STATIC


ECFLAGS += \
	 -nolinenumbers


# PLATFORM-SPECIFIC OPTIONS

ifdef LINUX_TARGET

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,m) \
	$(call _L,dl)
endif

endif



CECFLAGS += -cpp $(_CPP)

OFLAGS += $(FORCE_32_BIT)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../ecere/obj/bootstrap.$(PLATFORM) \
	 -L../libec/obj/bootstrap.$(PLATFORM)
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif

# OBJECT RULES

$(OBJ)ecc.o: bootstrap/ecc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/ecc.c -o $(OBJ)ecc.o

$(OBJ)ecc.main.o: bootstrap/ecc.main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/ecc.main.c -o $(OBJ)ecc.main.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean: objdir
	$(call rmrq,$(OBJ))

distclean: objdir
	$(call rmrq,obj/)
