.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := extract
CONFIG := release
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = -mwindows

TARGET = obj/$(CONFIG).$(PLATFORM)/extract$(E)

OBJECTS = \
	$(OBJ)extract.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)extract.c

SYMBOLS = \
	$(OBJ)extract.sym

IMPORTS = \
	$(OBJ)extract.imp

SOURCES = \
	extract.ec

RESOURCES = $(RESOURCES1) $(RESOURCES2)
RESOURCES1 = \
	../../ecere/res/vanilla/ecere/actions/folderNew.png \
	../../ecere/res/vanilla/ecere/actions/goUp.png \
	../../ecere/res/vanilla/ecere/devices/computer.png \
	../../ecere/res/vanilla/ecere/devices/driveHardDisk.png \
	../../ecere/res/vanilla/ecere/devices/driveRemovableMedia.png \
	../../ecere/res/vanilla/ecere/devices/mediaFloppy.png \
	../../ecere/res/vanilla/ecere/devices/mediaOptical.png \
	../../ecere/res/vanilla/ecere/elements/areaClose.png \
	../../ecere/res/vanilla/ecere/elements/areaMaximize.png \
	../../ecere/res/vanilla/ecere/elements/areaMinimize.png \
	../../ecere/res/vanilla/ecere/elements/areaRestore.png \
	../../ecere/res/vanilla/ecere/elements/arrowDown.png \
	../../ecere/res/vanilla/ecere/elements/arrowLeft.png \
	../../ecere/res/vanilla/ecere/elements/arrowRight.png \
	../../ecere/res/vanilla/ecere/elements/arrowUp.png \
	../../ecere/res/vanilla/ecere/elements/optionBoxDisabledSelected.png \
	../../ecere/res/vanilla/ecere/elements/optionBoxDown.png \
	../../ecere/res/vanilla/ecere/elements/optionBoxSelected.png \
	../../ecere/res/vanilla/ecere/elements/optionBoxSelectedDown.png \
	../../ecere/res/vanilla/ecere/elements/optionBoxUp.png \
	../../ecere/res/vanilla/ecere/places/driveRemote.png \
	../../ecere/res/vanilla/ecere/places/folder.png \
	../../ecere/res/vanilla/ecere/places/folderRemote.png \
	../../ecere/res/vanilla/ecere/places/networkServer.png \
	../../ecere/res/vanilla/ecere/places/networkWorkgroup.png \
	../../ecere/res/vanilla/ecere/status/folderOpen.png \
	locale/zh_CN/LC_MESSAGES/extract.mo
RESOURCES2 = \
	locale/es_ES/LC_MESSAGES/extract.mo

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
ECP := $(call psep,../../compiler/bootstrap/obj/bin.$(PLATFORM)/ecp)
ECC := $(call psep,../../compiler/bootstrap/obj/bin.$(PLATFORM)/ecc)
ECS := $(call psep,../../compiler/bootstrap/obj/bin.$(PLATFORM)/ecs)
EAR := $(call psep,../../obj/$(PLATFORM)/bin/ear)

# FLAGS

CFLAGS += -fmessage-length=0 -Os $(FORCE_32_BIT) $(FPIC) -w \
	 -DECERE_STATIC

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS += $(FORCE_32_BIT) \
	 -L../../ecere/obj/vanilla.$(PLATFORM) \
	 -L../../deps/zlib/obj/release.$(PLATFORM)

LIBS = -lecereVanilla -lz $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q --no-progress --no-color

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX_TARGET
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

LIBS += -lmpr -lwinmm -limm32

else
ifdef LINUX_TARGET

OFLAGS += \
	 -L/usr/X11R6/lib

LIBS += -lfontconfig -lfreetype -lXrender -lXext -lncurses -lm -ldl -lpthread -lX11

else
ifdef OSX_TARGET

OFLAGS += \
	 -L/usr/X11R6/lib

LIBS += -lfontconfig -lfreetype -lXrender -lXext -lncurses -lm -ldl -lpthread -lX11

endif
endif
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
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
ifndef WINDOWS_TARGET
ifeq "$(TARGET_TYPE)" "executable"
	@-$(call psep,$(UPX) $(UPXFLAGS) $(TARGET)) || $(call echo,upx not installed; not compressing.)
endif
else
	@-$(call psep,$(UPX) $(UPXFLAGS) $(TARGET)) || $(call echo,upx not installed; not compressing.)
endif
	$(EAR) awq $(TARGET) ../../ecere/res/vanilla/ecere/actions/folderNew.png ../../ecere/res/vanilla/ecere/actions/goUp.png "ecere/actions"
	$(EAR) awq $(TARGET) ../../ecere/res/vanilla/ecere/devices/computer.png ../../ecere/res/vanilla/ecere/devices/driveHardDisk.png ../../ecere/res/vanilla/ecere/devices/driveRemovableMedia.png ../../ecere/res/vanilla/ecere/devices/mediaFloppy.png ../../ecere/res/vanilla/ecere/devices/mediaOptical.png "ecere/devices"
	$(EAR) awq $(TARGET) ../../ecere/res/vanilla/ecere/elements/areaClose.png ../../ecere/res/vanilla/ecere/elements/areaMaximize.png ../../ecere/res/vanilla/ecere/elements/areaMinimize.png ../../ecere/res/vanilla/ecere/elements/areaRestore.png ../../ecere/res/vanilla/ecere/elements/arrowDown.png ../../ecere/res/vanilla/ecere/elements/arrowLeft.png ../../ecere/res/vanilla/ecere/elements/arrowRight.png ../../ecere/res/vanilla/ecere/elements/arrowUp.png ../../ecere/res/vanilla/ecere/elements/optionBoxDisabledSelected.png ../../ecere/res/vanilla/ecere/elements/optionBoxDown.png "ecere/elements"
	$(EAR) awq $(TARGET) ../../ecere/res/vanilla/ecere/elements/optionBoxSelected.png ../../ecere/res/vanilla/ecere/elements/optionBoxSelectedDown.png ../../ecere/res/vanilla/ecere/elements/optionBoxUp.png "ecere/elements"
	$(EAR) awq $(TARGET) ../../ecere/res/vanilla/ecere/places/driveRemote.png ../../ecere/res/vanilla/ecere/places/folder.png ../../ecere/res/vanilla/ecere/places/folderRemote.png ../../ecere/res/vanilla/ecere/places/networkServer.png ../../ecere/res/vanilla/ecere/places/networkWorkgroup.png "ecere/places"
	$(EAR) awq $(TARGET) ../../ecere/res/vanilla/ecere/status/folderOpen.png "ecere/status"
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/extract.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) awq $(TARGET) locale/es_ES/LC_MESSAGES/extract.mo "locale/es_ES/LC_MESSAGES"

# SYMBOL RULES

$(OBJ)extract.sym: extract.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c extract.ec -o $(OBJ)extract.sym

# C OBJECT RULES

$(OBJ)extract.c: extract.ec $(OBJ)extract.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c extract.ec -o $(OBJ)extract.c -symbols $(OBJ)

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
