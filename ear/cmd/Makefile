.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ear
CONFIG := release
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = -mconsole

TARGET = obj/$(CONFIG).$(PLATFORM)/ear$(E)

OBJECTS = $(OBJ)ear.o $(OBJ)$(MODULE).main$(O)

COBJECTS = $(OBJ)ear.c

SYMBOLS = $(OBJ)ear.sym

IMPORTS = $(OBJ)ear.imp

SOURCES = ear.ec

RESOURCES = ../extract/obj/release.$(PLATFORM)/extract$(E)

# CROSS-PLATFORM MAGIC

include ../../include.mk

# TOOLCHAIN
export LD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
CPP := cpp
CC := gcc
ECP := $(call psep,../../compiler/bootstrap/obj/bin.$(PLATFORM)/ecp)
ECC := $(call psep,../../compiler/bootstrap/obj/bin.$(PLATFORM)/ecc)
ECS := $(call psep,../../compiler/bootstrap/obj/bin.$(PLATFORM)/ecs)
EAR := $(call psep,../../obj/$(PLATFORM)/bin/ear)
LD := gcc
AR := ar
STRIP := strip
UPX := upx

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS = -m32 \
	 -L../../obj/$(PLATFORM)/bin \
	 -L../../obj/$(PLATFORM)/lib

LIBS = -lecere $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
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

nores: $(SOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(call cpq,$(TARGET),../../obj/$(PLATFORM)/bin/)

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(EAR) awq $(TARGET) ../extract/obj/release.$(PLATFORM)/extract$(E) ""
	$(call cpq,$(TARGET),../../obj/$(PLATFORM)/bin)

# SYMBOL RULES

$(OBJ)ear.sym: ear.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ear.ec -o $(OBJ)ear.sym

# C OBJECT RULES

$(OBJ)ear.c: ear.ec $(OBJ)ear.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ear.ec -o $(OBJ)ear.c -symbols $(OBJ)

# IMPLICIT OBJECT RULE

$(OBJ)%$(O) : $(OBJ)%.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $< -o $@

# OBJECT RULES

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

cleantarget: objdir
	$(call rmq,$(TARGET))

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
