.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := epj2make
CONFIG := release
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

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/epj2make$(E)

_ECSOURCES = \
	../ide/src/project/Project.ec \
	../ide/src/project/ProjectConfig.ec \
	../ide/src/project/ProjectNode.ec \
	../ide/src/IDESettings.ec \
	../ide/src/OldIDESettings.ec \
	../extras/gui/controls/StringsBox.ec \
	../extras/types/DynamicString.ec \
	epj2make.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/epj2make.mo \
	locale/es_ES/LC_MESSAGES/epj2make.mo \
	../crossplatform.mk

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w \
			 -DMAKEFILE_GENERATOR


ECFLAGS += \
	 -nolinenumbers


# PLATFORM-SPECIFIC OPTIONS

ifdef LINUX_TARGET

endif



CECFLAGS += -cpp $(_CPP)

OFLAGS += $(FORCE_32_BIT)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../obj/$(PLATFORM)/bin \
	 -L../obj/$(PLATFORM)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) -console $(FORCE_32_BIT) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) ../crossplatform.mk ""
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/epj2make.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/epj2make.mo "locale/es_ES/LC_MESSAGES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../obj/$(PLATFORM)/bin/)

# SYMBOL RULES

$(OBJ)Project.sym: ../ide/src/project/Project.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/project/Project.ec -o $(OBJ)Project.sym

$(OBJ)ProjectConfig.sym: ../ide/src/project/ProjectConfig.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.sym

$(OBJ)ProjectNode.sym: ../ide/src/project/ProjectNode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/project/ProjectNode.ec -o $(OBJ)ProjectNode.sym

$(OBJ)IDESettings.sym: ../ide/src/IDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.sym

$(OBJ)OldIDESettings.sym: ../ide/src/OldIDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.sym

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.sym

$(OBJ)DynamicString.sym: ../extras/types/DynamicString.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/types/DynamicString.ec -o $(OBJ)DynamicString.sym

$(OBJ)epj2make.sym: epj2make.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c epj2make.ec -o $(OBJ)epj2make.sym

# C OBJECT RULES

$(OBJ)Project.c: ../ide/src/project/Project.ec $(OBJ)Project.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/project/Project.ec -o $(OBJ)Project.c -symbols $(OBJ)

$(OBJ)ProjectConfig.c: ../ide/src/project/ProjectConfig.ec $(OBJ)ProjectConfig.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.c -symbols $(OBJ)

$(OBJ)ProjectNode.c: ../ide/src/project/ProjectNode.ec $(OBJ)ProjectNode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/project/ProjectNode.ec -o $(OBJ)ProjectNode.c -symbols $(OBJ)

$(OBJ)IDESettings.c: ../ide/src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.c -symbols $(OBJ)

$(OBJ)OldIDESettings.c: ../ide/src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.c -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.c -symbols $(OBJ)

$(OBJ)DynamicString.c: ../extras/types/DynamicString.ec $(OBJ)DynamicString.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/types/DynamicString.ec -o $(OBJ)DynamicString.c -symbols $(OBJ)

$(OBJ)epj2make.c: epj2make.ec $(OBJ)epj2make.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c epj2make.ec -o $(OBJ)epj2make.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)Project.o: $(OBJ)Project.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Project.c -o $(OBJ)Project.o

$(OBJ)ProjectConfig.o: $(OBJ)ProjectConfig.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectConfig.c -o $(OBJ)ProjectConfig.o

$(OBJ)ProjectNode.o: $(OBJ)ProjectNode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectNode.c -o $(OBJ)ProjectNode.o

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)IDESettings.c -o $(OBJ)IDESettings.o

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)OldIDESettings.c -o $(OBJ)OldIDESettings.o

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)StringsBox.c -o $(OBJ)StringsBox.o

$(OBJ)DynamicString.o: $(OBJ)DynamicString.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DynamicString.c -o $(OBJ)DynamicString.o

$(OBJ)epj2make.o: $(OBJ)epj2make.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)epj2make.c -o $(OBJ)epj2make.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

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
