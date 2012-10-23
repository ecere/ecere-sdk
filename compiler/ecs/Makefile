.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ecs
CONFIG := release
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = -mconsole

TARGET = obj/$(CONFIG).$(PLATFORM)/ecs$(E)

OBJECTS = \
	$(OBJ)ecs.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)ecs.c

SYMBOLS = \
	$(OBJ)ecs.sym

IMPORTS = \
	$(OBJ)ecs.imp

SOURCES = \
	ecs.ec

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/ecs.mo \
	locale/es_ES/LC_MESSAGES/ecs.mo

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# CROSS-PLATFORM MAGIC

include ../../crossplatform.mk
include ../../include.mk

# TOOLCHAIN

export LD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
ECP := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecp)
ECC := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecc)
ECS := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecs)
EAR := $(call psep,../../obj/$(PLATFORM)/bin/ear)

# FLAGS

CFLAGS += -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS += -m32 \
	 -L../../obj/$(PLATFORM)/bin \
	 -L../../obj/$(PLATFORM)/lib

LIBS = -lecere $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX_TARGET
OFLAGS += -Wl,--no-undefined
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
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/ecs.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) awq $(TARGET) locale/es_ES/LC_MESSAGES/ecs.mo "locale/es_ES/LC_MESSAGES"
	$(call cpq,$(TARGET),../../obj/$(PLATFORM)/bin/)

# SYMBOL RULES

$(OBJ)ecs.sym: ecs.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ecs.ec -o $(OBJ)ecs.sym

# C OBJECT RULES

$(OBJ)ecs.c: ecs.ec $(OBJ)ecs.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ecs.ec -o $(OBJ)ecs.c -symbols $(OBJ)

# IMPLICIT OBJECT RULE

$(OBJ)%$(O) : $(OBJ)%.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $< -o $@

# OBJECT RULES

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

clean: objdir
	$(call rmq,$(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(IMPORTS))
	$(call rmq,$(SYMBOLS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
