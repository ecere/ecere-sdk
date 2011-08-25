.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := documentor
CONFIG := release
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = -mwindows

TARGET = obj/$(CONFIG).$(PLATFORM)/documentor$(E)

OBJECTS = $(OBJ)htmlParser.o $(OBJ)HTMLView.o $(OBJ)lines.o $(OBJ)tables.o \
	$(OBJ)IDESettings.o $(OBJ)OldIDESettings.o $(OBJ)StringsBox.o $(OBJ)Documentor.o \
	$(OBJ)SettingsDialog.o $(OBJ)$(MODULE).main$(O)

COBJECTS = $(OBJ)htmlParser.c $(OBJ)HTMLView.c $(OBJ)lines.c $(OBJ)tables.c \
	$(OBJ)IDESettings.c $(OBJ)OldIDESettings.c $(OBJ)StringsBox.c $(OBJ)Documentor.c \
	$(OBJ)SettingsDialog.c

SYMBOLS = $(OBJ)htmlParser.sym $(OBJ)HTMLView.sym $(OBJ)lines.sym $(OBJ)tables.sym \
	$(OBJ)IDESettings.sym $(OBJ)OldIDESettings.sym $(OBJ)StringsBox.sym $(OBJ)Documentor.sym \
	$(OBJ)SettingsDialog.sym

IMPORTS = $(OBJ)htmlParser.imp $(OBJ)HTMLView.imp $(OBJ)lines.imp $(OBJ)tables.imp \
	$(OBJ)IDESettings.imp $(OBJ)OldIDESettings.imp $(OBJ)StringsBox.imp $(OBJ)Documentor.imp \
	$(OBJ)SettingsDialog.imp

SOURCES = ../extras/html/htmlParser.ec ../extras/html/HTMLView.ec \
	../extras/html/lines.ec ../extras/html/tables.ec ../ide/src/IDESettings.ec \
	../ide/src/OldIDESettings.ec ../extras/gui/controls/StringsBox.ec src/Documentor.ec src/SettingsDialog.ec

RESOURCES =

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

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w

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
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(call cpq,$(TARGET),../obj/$(PLATFORM)/bin/)

# SYMBOL RULES

$(OBJ)htmlParser.sym: ../extras/html/htmlParser.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/html/htmlParser.ec -o $(OBJ)htmlParser.sym

$(OBJ)HTMLView.sym: ../extras/html/HTMLView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/html/HTMLView.ec -o $(OBJ)HTMLView.sym

$(OBJ)lines.sym: ../extras/html/lines.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/html/lines.ec -o $(OBJ)lines.sym

$(OBJ)tables.sym: ../extras/html/tables.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/html/tables.ec -o $(OBJ)tables.sym

$(OBJ)IDESettings.sym: ../ide/src/IDESettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.sym

$(OBJ)OldIDESettings.sym: ../ide/src/OldIDESettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.sym

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.sym

$(OBJ)Documentor.sym: src/Documentor.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/Documentor.ec -o $(OBJ)Documentor.sym

$(OBJ)SettingsDialog.sym: src/SettingsDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/SettingsDialog.ec -o $(OBJ)SettingsDialog.sym

# C OBJECT RULES

$(OBJ)htmlParser.c: ../extras/html/htmlParser.ec $(OBJ)htmlParser.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/html/htmlParser.ec -o $(OBJ)htmlParser.c -symbols $(OBJ)

$(OBJ)HTMLView.c: ../extras/html/HTMLView.ec $(OBJ)HTMLView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/html/HTMLView.ec -o $(OBJ)HTMLView.c -symbols $(OBJ)

$(OBJ)lines.c: ../extras/html/lines.ec $(OBJ)lines.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/html/lines.ec -o $(OBJ)lines.c -symbols $(OBJ)

$(OBJ)tables.c: ../extras/html/tables.ec $(OBJ)tables.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/html/tables.ec -o $(OBJ)tables.c -symbols $(OBJ)

$(OBJ)IDESettings.c: ../ide/src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/IDESettings.ec -o $(OBJ)IDESettings.c -symbols $(OBJ)

$(OBJ)OldIDESettings.c: ../ide/src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../ide/src/OldIDESettings.ec -o $(OBJ)OldIDESettings.c -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.c -symbols $(OBJ)

$(OBJ)Documentor.c: src/Documentor.ec $(OBJ)Documentor.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/Documentor.ec -o $(OBJ)Documentor.c -symbols $(OBJ)

$(OBJ)SettingsDialog.c: src/SettingsDialog.ec $(OBJ)SettingsDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/SettingsDialog.ec -o $(OBJ)SettingsDialog.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)htmlParser.o: $(OBJ)htmlParser.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)htmlParser.c -o $(OBJ)htmlParser.o

$(OBJ)HTMLView.o: $(OBJ)HTMLView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)HTMLView.c -o $(OBJ)HTMLView.o

$(OBJ)lines.o: $(OBJ)lines.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)lines.c -o $(OBJ)lines.o

$(OBJ)tables.o: $(OBJ)tables.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)tables.c -o $(OBJ)tables.o

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)IDESettings.c -o $(OBJ)IDESettings.o

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)OldIDESettings.c -o $(OBJ)OldIDESettings.o

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)StringsBox.c -o $(OBJ)StringsBox.o

$(OBJ)Documentor.o: $(OBJ)Documentor.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Documentor.c -o $(OBJ)Documentor.o

$(OBJ)SettingsDialog.o: $(OBJ)SettingsDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)SettingsDialog.c -o $(OBJ)SettingsDialog.o

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
