.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := epj2make
CONFIG := release
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = -mconsole

TARGET = obj/$(CONFIG).$(PLATFORM)/epj2make$(E)

OBJECTS = \
	$(OBJ)Project.o \
	$(OBJ)ProjectConfig.o \
	$(OBJ)ProjectNode.o \
	$(OBJ)IDESettings.o \
	$(OBJ)OldIDESettings.o \
	$(OBJ)StringsBox.o \
	$(OBJ)epj2make.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)Project.c \
	$(OBJ)ProjectConfig.c \
	$(OBJ)ProjectNode.c \
	$(OBJ)IDESettings.c \
	$(OBJ)OldIDESettings.c \
	$(OBJ)StringsBox.c \
	$(OBJ)epj2make.c

SYMBOLS = \
	$(OBJ)Project.sym \
	$(OBJ)ProjectConfig.sym \
	$(OBJ)ProjectNode.sym \
	$(OBJ)IDESettings.sym \
	$(OBJ)OldIDESettings.sym \
	$(OBJ)StringsBox.sym \
	$(OBJ)epj2make.sym

IMPORTS = \
	$(OBJ)Project.imp \
	$(OBJ)ProjectConfig.imp \
	$(OBJ)ProjectNode.imp \
	$(OBJ)IDESettings.imp \
	$(OBJ)OldIDESettings.imp \
	$(OBJ)StringsBox.imp \
	$(OBJ)epj2make.imp

SOURCES = \
	../ide/src/project/Project.ec \
	../ide/src/project/ProjectConfig.ec \
	../ide/src/project/ProjectNode.ec \
	../ide/src/IDESettings.ec \
	../ide/src/OldIDESettings.ec \
	../extras/gui/controls/StringsBox.ec \
	epj2make.ec

RESOURCES = ../include.mk

# CROSS-PLATFORM MAGIC

include ../include.mk

# TOOLCHAIN
export LD_LIBRARY_PATH = ../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../obj/$(PLATFORM)/lib/
ECP := $(call psep,../obj/$(PLATFORM)/bin/ecp)
ECC := $(call psep,../obj/$(PLATFORM)/bin/ecc)
ECS := $(call psep,../obj/$(PLATFORM)/bin/ecs)
EAR := $(call psep,../obj/$(PLATFORM)/bin/ear)

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w \
	 -DMAKEFILE_GENERATOR

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS = -m32 \
	 -L../obj/$(PLATFORM)/bin \
	 -L../obj/$(PLATFORM)/lib

LIBS = -lecere $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef LINUX

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
	$(EAR) awq $(TARGET) ../include.mk ""
	$(call cpq,$(TARGET),../obj/$(PLATFORM)/bin/)

# SYMBOL RULES

$(OBJ)Project.sym: ../ide/src/project/Project.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/project/Project.ec -o $(OBJ)Project.sym

$(OBJ)ProjectConfig.sym: ../ide/src/project/ProjectConfig.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.sym

$(OBJ)ProjectNode.sym: ../ide/src/project/ProjectNode.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/project/ProjectNode.ec -o $(OBJ)ProjectNode.sym

$(OBJ)IDESettings.sym: ../ide/src/IDESettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.sym

$(OBJ)OldIDESettings.sym: ../ide/src/OldIDESettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.sym

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.sym

$(OBJ)epj2make.sym: epj2make.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c epj2make.ec -o $(OBJ)epj2make.sym

# C OBJECT RULES

$(OBJ)Project.c: ../ide/src/project/Project.ec $(OBJ)Project.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/project/Project.ec -o $(OBJ)Project.c -symbols $(OBJ)

$(OBJ)ProjectConfig.c: ../ide/src/project/ProjectConfig.ec $(OBJ)ProjectConfig.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.c -symbols $(OBJ)

$(OBJ)ProjectNode.c: ../ide/src/project/ProjectNode.ec $(OBJ)ProjectNode.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/project/ProjectNode.ec -o $(OBJ)ProjectNode.c -symbols $(OBJ)

$(OBJ)IDESettings.c: ../ide/src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.c -symbols $(OBJ)

$(OBJ)OldIDESettings.c: ../ide/src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.c -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.c -symbols $(OBJ)

$(OBJ)epj2make.c: epj2make.ec $(OBJ)epj2make.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c epj2make.ec -o $(OBJ)epj2make.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)Project.o: $(OBJ)Project.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Project.c -o $(OBJ)Project.o

$(OBJ)ProjectConfig.o: $(OBJ)ProjectConfig.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectConfig.c -o $(OBJ)ProjectConfig.o

$(OBJ)ProjectNode.o: $(OBJ)ProjectNode.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectNode.c -o $(OBJ)ProjectNode.o

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)IDESettings.c -o $(OBJ)IDESettings.o

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)OldIDESettings.c -o $(OBJ)OldIDESettings.o

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)StringsBox.c -o $(OBJ)StringsBox.o

$(OBJ)epj2make.o: $(OBJ)epj2make.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)epj2make.c -o $(OBJ)epj2make.o

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
