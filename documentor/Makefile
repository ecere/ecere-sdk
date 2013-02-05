.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := documentor
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

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/documentor$(E)

_ECSOURCES = \
	../extras/html/htmlParser.ec \
	../extras/html/HTMLView.ec \
	../extras/html/lines.ec \
	../extras/html/tables.ec \
	../ide/src/IDESettings.ec \
	../ide/src/OldIDESettings.ec \
	../extras/gui/controls/StringsBox.ec \
	src/Documentor.ec \
	src/SettingsDialog.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/documentor.mo \
	locale/es_ES/LC_MESSAGES/documentor.mo \
	res/documentorIcon.png

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w


ECFLAGS += \
	 -nolinenumbers




CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += $(FORCE_32_BIT) \
	 -L../obj/$(PLATFORM)/bin \
	 -L../obj/$(PLATFORM)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(FORCE_32_BIT) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM) -o $(OBJ)$(MODULE).main.ec

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
	$(EAR) aw$(EARFLAGS) $(TARGET) res/documentorIcon.png ""
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/documentor.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/documentor.mo "locale/es_ES/LC_MESSAGES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../obj/$(PLATFORM)/bin/)

# SYMBOL RULES

$(OBJ)htmlParser.sym: ../extras/html/htmlParser.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/html/htmlParser.ec -o $(OBJ)htmlParser.sym

$(OBJ)HTMLView.sym: ../extras/html/HTMLView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/html/HTMLView.ec -o $(OBJ)HTMLView.sym

$(OBJ)lines.sym: ../extras/html/lines.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/html/lines.ec -o $(OBJ)lines.sym

$(OBJ)tables.sym: ../extras/html/tables.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/html/tables.ec -o $(OBJ)tables.sym

$(OBJ)IDESettings.sym: ../ide/src/IDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.sym

$(OBJ)OldIDESettings.sym: ../ide/src/OldIDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.sym

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.sym

$(OBJ)Documentor.sym: src/Documentor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/Documentor.ec -o $(OBJ)Documentor.sym

$(OBJ)SettingsDialog.sym: src/SettingsDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/SettingsDialog.ec -o $(OBJ)SettingsDialog.sym

# C OBJECT RULES

$(OBJ)htmlParser.c: ../extras/html/htmlParser.ec $(OBJ)htmlParser.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/html/htmlParser.ec -o $(OBJ)htmlParser.c -symbols $(OBJ)

$(OBJ)HTMLView.c: ../extras/html/HTMLView.ec $(OBJ)HTMLView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/html/HTMLView.ec -o $(OBJ)HTMLView.c -symbols $(OBJ)

$(OBJ)lines.c: ../extras/html/lines.ec $(OBJ)lines.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/html/lines.ec -o $(OBJ)lines.c -symbols $(OBJ)

$(OBJ)tables.c: ../extras/html/tables.ec $(OBJ)tables.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/html/tables.ec -o $(OBJ)tables.c -symbols $(OBJ)

$(OBJ)IDESettings.c: ../ide/src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.c -symbols $(OBJ)

$(OBJ)OldIDESettings.c: ../ide/src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.c -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.c -symbols $(OBJ)

$(OBJ)Documentor.c: src/Documentor.ec $(OBJ)Documentor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/Documentor.ec -o $(OBJ)Documentor.c -symbols $(OBJ)

$(OBJ)SettingsDialog.c: src/SettingsDialog.ec $(OBJ)SettingsDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/SettingsDialog.ec -o $(OBJ)SettingsDialog.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)htmlParser.o: $(OBJ)htmlParser.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)htmlParser.c -o $(OBJ)htmlParser.o

$(OBJ)HTMLView.o: $(OBJ)HTMLView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)HTMLView.c -o $(OBJ)HTMLView.o

$(OBJ)lines.o: $(OBJ)lines.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)lines.c -o $(OBJ)lines.o

$(OBJ)tables.o: $(OBJ)tables.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)tables.c -o $(OBJ)tables.o

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)IDESettings.c -o $(OBJ)IDESettings.o

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)OldIDESettings.c -o $(OBJ)OldIDESettings.o

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)StringsBox.c -o $(OBJ)StringsBox.o

$(OBJ)Documentor.o: $(OBJ)Documentor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Documentor.c -o $(OBJ)Documentor.o

$(OBJ)SettingsDialog.o: $(OBJ)SettingsDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)SettingsDialog.c -o $(OBJ)SettingsDialog.o

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
