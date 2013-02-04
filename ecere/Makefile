.PHONY: all objdir cleaneceretarget cleantarget clean realclean distclean nores

# CORE VARIABLES

MODULE := ecere
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

_CF_DIR = ../
USE_BOOTSTRAP := defined

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = res/

ifdef LINUX_TARGET
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)$(MODULE)$(SO).0.44
SONAME = -Wl,-soname,libecere.so.0
else
TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)$(MODULE)$(SO)
SONAME =
endif

_ECSOURCES = $(_ECSOURCES1) $(_ECSOURCES2) $(_ECSOURCES3)
_ECSOURCES1 = \
	src/sys/Archive.ec \
	src/sys/BufferedFile.ec \
	src/sys/Date.ec \
	src/sys/DualPipe.ec \
	src/sys/EARArchive.ec \
	src/sys/File.ec \
	src/sys/FileMonitor.ec \
	src/sys/GlobalAppSettings.ec \
	src/sys/JSON.ec \
	src/sys/JSONGlobalSettings.ec \
	src/sys/memory.ec \
	src/sys/Mutex.ec \
	src/sys/Semaphore.ec \
	src/sys/System.ec \
	src/sys/TempFile.ec \
	src/sys/Thread.ec \
	src/sys/Time.ec \
	src/sys/unicode.ec \
	src/sys/units.ec \
	src/sys/i18n.ec \
	src/sys/Condition.ec \
	src/gfx/3D/meshes/Cube.ec \
	src/gfx/3D/meshes/SkyBox.ec \
	src/gfx/3D/meshes/Sphere.ec \
	src/gfx/3D/models/Object3DSFormat.ec \
	src/gfx/3D/Camera.ec \
	src/gfx/3D/Matrix.ec \
	src/gfx/3D/Mesh.ec \
	src/gfx/3D/Object.ec \
	src/gfx/3D/Plane.ec \
	src/gfx/3D/Quaternion.ec \
	src/gfx/3D/Vector3D.ec \
	src/gfx/bitmaps/BMPFormat.ec \
	src/gfx/bitmaps/GIFFormat.ec \
	src/gfx/bitmaps/JPEGFormat.ec \
	src/gfx/bitmaps/PCXFormat.ec \
	src/gfx/bitmaps/PNGFormat.ec \
	src/gfx/bitmaps/RGBFormat.ec \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/Direct3D8DisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/Direct3D9DisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/DirectDrawDisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/GDIDisplayDriver.ec,) \
	src/gfx/drivers/lfbBlit.ec \
	src/gfx/drivers/lfbConvert.ec \
	src/gfx/drivers/LFBDisplayDriver.ec \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),src/gfx/drivers/NCursesDisplayDriver.ec,) \
	src/gfx/drivers/OpenGLDisplayDriver.ec \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec,)
_ECSOURCES2 = \
	$(if $(OSX_TARGET),src/gfx/drivers/CocoaOpenGLDisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/Win32ConsoleDisplayDriver.ec,) \
	$(if $(WINDOWS_TARGET),src/gfx/drivers/Win32PrinterDisplayDriver.ec,) \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),src/gfx/drivers/XDisplayDriver.ec,) \
	src/gfx/Bitmap.ec \
	src/gfx/BitmapResource.ec \
	src/gfx/Color.ec \
	src/gfx/Display.ec \
	src/gfx/DisplaySystem.ec \
	src/gfx/FontResource.ec \
	src/gfx/Resource.ec \
	src/gfx/Surface.ec \
	src/gui/controls/Button.ec \
	src/gui/controls/CalendarControl.ec \
	src/gui/controls/DataBox.ec \
	src/gui/controls/DropBox.ec \
	src/gui/controls/EditBox.ec \
	src/gui/controls/Label.ec \
	src/gui/controls/ListBox.ec \
	src/gui/controls/Menu.ec \
	src/gui/controls/Picture.ec \
	src/gui/controls/ProgressBar.ec \
	src/gui/controls/ScrollBar.ec \
	src/gui/controls/StatusBar.ec \
	src/gui/controls/TabControl.ec \
	src/gui/controls/PaneSplitter.ec \
	src/gui/controls/Stacker.ec \
	src/gui/controls/PathBox.ec \
	src/gui/controls/ToolTip.ec \
	src/gui/controls/SelectorBar.ec \
	src/gui/dialogs/ColorPicker.ec \
	src/gui/dialogs/FileDialog.ec \
	src/gui/dialogs/FindDialog.ec \
	src/gui/dialogs/GoToDialog.ec \
	src/gui/dialogs/MessageBox.ec \
	src/gui/dialogs/ReplaceDialog.ec \
	src/gui/dialogs/WindowList.ec \
	$(if $(OSX_TARGET),src/gui/drivers/cocoa/CocoaDispatch.ec,) \
	$(if $(OSX_TARGET),src/gui/drivers/cocoa/CocoaInterface.ec,)
_ECSOURCES3 = \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),src/gui/drivers/NCursesInterface.ec,) \
	$(if $(WINDOWS_TARGET),src/gui/drivers/Win32Interface.ec,) \
	$(if $(WINDOWS_TARGET),src/gui/drivers/Win32ConsoleInterface.ec,) \
	$(if $(or $(LINUX_TARGET),$(OSX_TARGET)),src/gui/drivers/XInterface.ec,) \
	src/gui/skins/TVisionSkin.ec \
	src/gui/skins/WindowsSkin.ec \
	src/gui/Anchor.ec \
	src/gui/ClipBoard.ec \
	src/gui/Cursor.ec \
	src/gui/Desktop3D.ec \
	src/gui/FormDesigner.ec \
	src/gui/GuiApplication.ec \
	src/gui/Interface.ec \
	src/gui/Key.ec \
	src/gui/Skin.ec \
	src/gui/Timer.ec \
	src/gui/typeEdit.ec \
	src/gui/Window.ec \
	src/net/dcom.ec \
	src/net/HTTPFile.ec \
	src/net/network.ec \
	src/net/NetworkClientFile.ec \
	src/net/Service.ec \
	src/net/Socket.ec \
	src/com/containers/Array.ec \
	src/com/containers/AVLTree.ec \
	src/com/containers/BuiltInContainer.ec \
	src/com/containers/Container.ec \
	src/com/containers/CustomAVLTree.ec \
	src/com/containers/LinkList.ec \
	src/com/containers/List.ec \
	src/com/containers/Map.ec \
	src/com/BinaryTree.ec \
	src/com/BTNode.ec \
	src/com/dataTypes.ec \
	src/com/instance.ec \
	src/com/String.ec \
	src/com/OldList.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))
ECSOURCES1 = $(call shwspace,$(_ECSOURCES1))
ECSOURCES2 = $(call shwspace,$(_ECSOURCES2))
ECSOURCES3 = $(call shwspace,$(_ECSOURCES3))

COBJECTS = $(COBJECTS1) $(COBJECTS2) $(COBJECTS3)
COBJECTS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES1)))))
COBJECTS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES2)))))
COBJECTS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES3)))))

SYMBOLS = $(SYMBOLS1) $(SYMBOLS2) $(SYMBOLS3)
SYMBOLS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES1)))))
SYMBOLS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES2)))))
SYMBOLS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES3)))))

IMPORTS = $(IMPORTS1) $(IMPORTS2) $(IMPORTS3)
IMPORTS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES1)))))
IMPORTS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES2)))))
IMPORTS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES3)))))

ECOBJECTS = $(ECOBJECTS1) $(ECOBJECTS2) $(ECOBJECTS3)
ECOBJECTS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES1)))))
ECOBJECTS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES2)))))
ECOBJECTS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES3)))))

BOWLS = $(BOWLS1) $(BOWLS2) $(BOWLS3)
BOWLS1 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES1)))))
BOWLS2 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES2)))))
BOWLS3 = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES3)))))

_OBJECTS = \
	$(OBJ)File.c.o \
	$(OBJ)DualPipe.c.o \
	$(OBJ)System.c.o \
	$(OBJ)harfbuzz-freetype.o \
	$(OBJ)harfbuzz-unicode-tables.o \
	$(OBJ)harfbuzz-unicode.o \
	$(OBJ)harfbuzz-arabic.o \
	$(OBJ)harfbuzz-buffer.o \
	$(OBJ)harfbuzz-gdef.o \
	$(OBJ)harfbuzz-gpos.o \
	$(OBJ)harfbuzz-gsub.o \
	$(OBJ)harfbuzz-hangul.o \
	$(OBJ)harfbuzz-hebrew.o \
	$(OBJ)harfbuzz-indic.o \
	$(OBJ)harfbuzz-khmer.o \
	$(OBJ)harfbuzz-myanmar.o \
	$(OBJ)harfbuzz-open.o \
	$(OBJ)harfbuzz-shaper.o \
	$(OBJ)harfbuzz-stream.o \
	$(OBJ)harfbuzz-tibetan.o \
	$(OBJ)harfbuzz-impl.o \
	$(OBJ)harfbuzz-thai.o \
	$(if $(OSX_TARGET),$(OBJ)CocoaEcereBridge.o,) \
	$(if $(OSX_TARGET),$(OBJ)EcereView.o,) \
	$(OBJ)instance.c.o

OBJECTS = $(_OBJECTS) $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES) \
	src/sys/File.c \
	src/sys/DualPipe.c \
	src/sys/System.c \
	src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c \
	src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c \
	src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c \
	src/gfx/drivers/harfbuzz/harfbuzz-arabic.c \
	src/gfx/drivers/harfbuzz/harfbuzz-buffer.c \
	src/gfx/drivers/harfbuzz/harfbuzz-gdef.c \
	src/gfx/drivers/harfbuzz/harfbuzz-gpos.c \
	src/gfx/drivers/harfbuzz/harfbuzz-gsub.c \
	src/gfx/drivers/harfbuzz/harfbuzz-hangul.c \
	src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c \
	src/gfx/drivers/harfbuzz/harfbuzz-indic.c \
	src/gfx/drivers/harfbuzz/harfbuzz-khmer.c \
	src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c \
	src/gfx/drivers/harfbuzz/harfbuzz-open.c \
	src/gfx/drivers/harfbuzz/harfbuzz-shaper.c \
	src/gfx/drivers/harfbuzz/harfbuzz-stream.c \
	src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c \
	src/gfx/drivers/harfbuzz/harfbuzz-impl.c \
	src/gfx/drivers/harfbuzz/harfbuzz-thai.c \
	$(if $(OSX_TARGET),src/gui/drivers/cocoa/CocoaEcereBridge.m,) \
	$(if $(OSX_TARGET),src/gui/drivers/cocoa/EcereView.m,) \
	src/com/instance.c

RESOURCES = $(RESOURCES1) $(RESOURCES2) $(RESOURCES3)
RESOURCES1 = \
	$(RES)actions/editFind.png \
	$(RES)actions/folderNew.png \
	$(RES)actions/goDown.png \
	$(RES)actions/goHome.png \
	$(RES)actions/goNext.png \
	$(RES)actions/goPrevious.png \
	$(RES)actions/goUp.png \
	$(RES)actions/listAdd.png \
	$(RES)actions/listRemove.png \
	$(RES)actions/viewRefresh.png \
	$(RES)actions/windowNew.png \
	$(RES)actions/clean.png \
	$(RES)actions/docSave.png \
	$(RES)actions/docNew.png \
	$(RES)constructs/class.png \
	$(RES)constructs/data.png \
	$(RES)constructs/dataPrivate.png \
	$(RES)constructs/dataType.png \
	$(RES)constructs/enum.png \
	$(RES)constructs/enumValue.png \
	$(RES)constructs/event.png \
	$(RES)constructs/library.png \
	$(RES)constructs/method.png \
	$(RES)constructs/methodPrivate.png \
	$(RES)constructs/namespace.png \
	$(RES)constructs/property.png \
	$(RES)constructs/propertyPrivate.png \
	$(RES)controls/button.png \
	$(RES)controls/calendar.png \
	$(RES)controls/checkBox.png \
	$(RES)controls/dataBox.png \
	$(RES)controls/dropBox.png \
	$(RES)controls/editBox.png \
	$(RES)controls/groupBox.png \
	$(RES)controls/label.png \
	$(RES)controls/listBox.png \
	$(RES)controls/menu.png \
	$(RES)controls/optionBox.png \
	$(RES)controls/progressBar.png \
	$(RES)controls/scrollBarHorizontal.png \
	$(RES)controls/scrollBarVertical.png \
	$(RES)controls/statusBar.png \
	$(RES)cursors/arrow.png \
	$(RES)cursors/cross.png \
	$(RES)cursors/iBeam.png \
	$(RES)cursors/move.png \
	$(RES)cursors/sizeEastWest.png \
	$(RES)cursors/sizeNortEastSouthWest.png \
	$(RES)cursors/sizeNorthSouth.png \
	$(RES)cursors/sizeNortWestSouthEast.png
RESOURCES2 = \
	$(RES)devices/computer.png \
	$(RES)devices/driveHardDisk.png \
	$(RES)devices/driveRemovableMedia.png \
	$(RES)devices/mediaFloppy.png \
	$(RES)devices/mediaOptical.png \
	$(RES)elements/areaClose.png \
	$(RES)elements/areaMaximize.png \
	$(RES)elements/areaMinimize.png \
	$(RES)elements/areaRestore.png \
	$(RES)elements/arrowDown.png \
	$(RES)elements/arrowLeft.png \
	$(RES)elements/arrowRight.png \
	$(RES)elements/arrowUp.png \
	$(RES)elements/checkBoxChecked.png \
	$(RES)elements/checkBoxDisabled.png \
	$(RES)elements/checkBoxDisabledChecked.png \
	$(RES)elements/checkBox.png \
	$(RES)elements/optionBoxDisabled.png \
	$(RES)elements/optionBoxDisabledSelected.png \
	$(RES)elements/optionBoxDown.png \
	$(RES)elements/optionBoxSelectedDown.png \
	$(RES)elements/optionBoxSelectedUp.png \
	$(RES)elements/optionBoxUp.png \
	$(RES)elements/orderAscending.png \
	$(RES)elements/orderCategorized.png \
	$(RES)elements/orderDescending.png \
	$(RES)emblems/unreadable.png \
	$(RES)mimeTypes/file.png \
	$(RES)mimeTypes/image.png \
	$(RES)mimeTypes/package.png \
	$(RES)mimeTypes/packageOpticalDisc.png \
	$(RES)mimeTypes/packageSoftware.png \
	$(RES)mimeTypes/text.png \
	$(RES)mimeTypes/textCHeader.png \
	$(RES)mimeTypes/textCSource.png \
	$(RES)mimeTypes/textC++Header.png \
	$(RES)mimeTypes/textC++Source.png \
	$(RES)mimeTypes/textEcereHeader.png \
	$(RES)mimeTypes/textEcereProject.png \
	$(RES)mimeTypes/textEcereSource.png \
	$(RES)mimeTypes/textEcereWorkspace.png \
	$(RES)mimeTypes/textHyperTextMarkup.png
RESOURCES3 = \
	$(RES)mimeTypes/brokenFile.png \
	$(RES)places/driveRemote.png \
	$(RES)places/folder.png \
	$(RES)places/folderRemote.png \
	$(RES)places/networkServer.png \
	$(RES)places/networkWorkgroup.png \
	$(RES)places/brokenFolder.png \
	$(RES)status/audioVolumeHigh.png \
	$(RES)status/folderOpen.png \
	$(RES)unicode/derivedGeneralCategoryStripped.txt \
	locale/zh_CN/LC_MESSAGES/ecere.mo \
	locale/es_ES/LC_MESSAGES/ecere.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,jpeg) \
	$(call _L,png) \
	$(call _L,z) \
	$(call _L,freetype)
endif

# Careful to keep ../deps/glext as -isystem instead of generated -I
PRJ_CFLAGS += \
	 $(if $(WINDOWS_TARGET), \
			 -isystem ../deps/glext \
			 -I../deps/DirectX-9.0/include \
			 -I../deps/jpeg-6b \
			 -I../deps/libpng-1.4.0 \
			 -I../deps/libungif-4.1.1/lib \
			 -I../deps/zlib \
			 -I../deps/freetype-2.3.12/include,) \
	 $(if $(LINUX_TARGET), \
			 -I/usr/include/freetype2 \
			 -I../deps/libungif-4.1.1/lib,) \
	 $(if $(OSX_TARGET), \
			 -I/usr/include/freetype2 \
			 -I$(SYSROOT)/usr/X11/include/freetype2 \
			 -I$(SYSROOT)/usr/X11/include \
			 -I/usr/X11R6/include/freetype2 \
			 -I/usr/X11R6/include \
			 -I../deps/jpeg-6b \
			 -I../deps/libpng-1.4.0 \
			 -I../deps/libungif-4.1.1/lib,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w \
			 -DBUILDING_ECERE_COM \
			 -Isrc/gfx/drivers/harfbuzz \
			 -I/usr/X11R6/include \
			 -I/usr/X11R6/include/freetype2 $(FVISIBILITY)

CUSTOM1_PRJ_CFLAGS = \
			 -DECERE_COM_MODULE \
	 $(PRJ_CFLAGS)


ECFLAGS += \
	 -nolinenumbers -defaultns ecere


# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../deps/zlib/obj/release.$(PLATFORM) \
	 -L../deps/jpeg-6b/obj/release.$(PLATFORM) \
	 -L../deps/libpng-1.4.0/obj/release.$(PLATFORM) \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM) \
	 -L../deps/freetype-2.3.12/obj/release.$(PLATFORM)
LIBS += \
	$(call _L,dxguid) \
	$(call _L,ddraw) \
	$(call _L,dinput) \
	$(call _L,winmm) \
	$(call _L,opengl32) \
	$(call _L,ws2_32) \
	$(call _L,kernel32) \
	$(call _L,user32) \
	$(call _L,gdi32) \
	$(call _L,mpr) \
	$(call _L,advapi32) \
	$(call _L,shell32) \
	$(call _L,winspool) \
	$(call _L,imm32) \
	$(call _L,ungif)
endif

else
ifdef LINUX_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM) \
	 -L/usr/X11R6/lib
LIBS += \
	$(call _L,ncurses) \
	$(call _L,pthread) \
	$(call _L,m) \
	$(call _L,dl) \
	$(call _L,fontconfig) \
	$(call _L,ungif) \
	$(call _L,X11) \
	$(call _L,Xext) \
	$(call _L,Xrender) \
	$(call _L,GL)
endif

else
ifdef OSX_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L$(SYSROOT)/usr/X11/lib \
	 -L/usr/X11R6/lib \
	 -L../deps/jpeg-6b/obj/release.$(PLATFORM) \
	 -L../deps/libpng-1.4.0/obj/release.$(PLATFORM) \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM)
LIBS += \
	$(call _L,curses) \
	$(call _L,pthread) \
	$(call _L,m) \
	$(call _L,dl) \
	$(call _L,fontconfig) \
	$(call _L,ungif) \
	$(call _L,X11) \
	$(call _L,Xext) \
	$(call _L,Xrender) \
	$(call _L,GL)
endif

endif
endif
endif



CECFLAGS += -cpp $(_CPP)

OFLAGS += $(FORCE_32_BIT)

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

nores: $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
ifdef WINDOWS_TARGET
	$(call cpq,$(TARGET),../compiler/bootstrap/obj/bin.$(PLATFORM)/)
endif
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../$(HOST_SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif

$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(SONAME) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)actions/editFind.png $(RES)actions/folderNew.png $(RES)actions/goDown.png $(RES)actions/goHome.png $(RES)actions/goNext.png $(RES)actions/goPrevious.png $(RES)actions/goUp.png $(RES)actions/listAdd.png $(RES)actions/listRemove.png $(RES)actions/viewRefresh.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)actions/windowNew.png $(RES)actions/clean.png $(RES)actions/docSave.png $(RES)actions/docNew.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)constructs/class.png $(RES)constructs/data.png $(RES)constructs/dataPrivate.png $(RES)constructs/dataType.png $(RES)constructs/enum.png $(RES)constructs/enumValue.png $(RES)constructs/event.png $(RES)constructs/library.png $(RES)constructs/method.png $(RES)constructs/methodPrivate.png "constructs"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)constructs/namespace.png $(RES)constructs/property.png $(RES)constructs/propertyPrivate.png "constructs"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)controls/button.png $(RES)controls/calendar.png $(RES)controls/checkBox.png $(RES)controls/dataBox.png $(RES)controls/dropBox.png $(RES)controls/editBox.png $(RES)controls/groupBox.png $(RES)controls/label.png $(RES)controls/listBox.png $(RES)controls/menu.png "controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)controls/optionBox.png $(RES)controls/progressBar.png $(RES)controls/scrollBarHorizontal.png $(RES)controls/scrollBarVertical.png $(RES)controls/statusBar.png "controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)cursors/arrow.png $(RES)cursors/cross.png $(RES)cursors/iBeam.png $(RES)cursors/move.png $(RES)cursors/sizeEastWest.png $(RES)cursors/sizeNortEastSouthWest.png $(RES)cursors/sizeNorthSouth.png $(RES)cursors/sizeNortWestSouthEast.png "cursors"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)devices/computer.png $(RES)devices/driveHardDisk.png $(RES)devices/driveRemovableMedia.png $(RES)devices/mediaFloppy.png $(RES)devices/mediaOptical.png "devices"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)elements/areaClose.png $(RES)elements/areaMaximize.png $(RES)elements/areaMinimize.png $(RES)elements/areaRestore.png $(RES)elements/arrowDown.png $(RES)elements/arrowLeft.png $(RES)elements/arrowRight.png $(RES)elements/arrowUp.png $(RES)elements/checkBoxChecked.png $(RES)elements/checkBoxDisabled.png "elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)elements/checkBoxDisabledChecked.png $(RES)elements/checkBox.png $(RES)elements/optionBoxDisabled.png $(RES)elements/optionBoxDisabledSelected.png $(RES)elements/optionBoxDown.png $(RES)elements/optionBoxSelectedDown.png $(RES)elements/optionBoxSelectedUp.png $(RES)elements/optionBoxUp.png $(RES)elements/orderAscending.png $(RES)elements/orderCategorized.png "elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)elements/orderDescending.png "elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)emblems/unreadable.png "emblems"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)mimeTypes/file.png $(RES)mimeTypes/image.png $(RES)mimeTypes/package.png $(RES)mimeTypes/packageOpticalDisc.png $(RES)mimeTypes/packageSoftware.png $(RES)mimeTypes/text.png $(RES)mimeTypes/textCHeader.png $(RES)mimeTypes/textCSource.png $(RES)mimeTypes/textC++Header.png $(RES)mimeTypes/textC++Source.png "mimeTypes"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)mimeTypes/textEcereHeader.png $(RES)mimeTypes/textEcereProject.png $(RES)mimeTypes/textEcereSource.png $(RES)mimeTypes/textEcereWorkspace.png $(RES)mimeTypes/textHyperTextMarkup.png $(RES)mimeTypes/brokenFile.png "mimeTypes"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)places/driveRemote.png $(RES)places/folder.png $(RES)places/folderRemote.png $(RES)places/networkServer.png $(RES)places/networkWorkgroup.png $(RES)places/brokenFolder.png "places"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)status/audioVolumeHigh.png $(RES)status/folderOpen.png "status"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)unicode/derivedGeneralCategoryStripped.txt "unicode"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/ecere.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/ecere.mo "locale/es_ES/LC_MESSAGES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../$(SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

# SYMBOL RULES

$(OBJ)Archive.sym: src/sys/Archive.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/Archive.ec -o $(OBJ)Archive.sym

$(OBJ)BufferedFile.sym: src/sys/BufferedFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/BufferedFile.ec -o $(OBJ)BufferedFile.sym

$(OBJ)Date.sym: src/sys/Date.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/Date.ec -o $(OBJ)Date.sym

$(OBJ)DualPipe.sym: src/sys/DualPipe.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/DualPipe.ec -o $(OBJ)DualPipe.sym

$(OBJ)EARArchive.sym: src/sys/EARArchive.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/EARArchive.ec -o $(OBJ)EARArchive.sym

$(OBJ)File.sym: src/sys/File.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/File.ec -o $(OBJ)File.sym

$(OBJ)FileMonitor.sym: src/sys/FileMonitor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/FileMonitor.ec -o $(OBJ)FileMonitor.sym

$(OBJ)GlobalAppSettings.sym: src/sys/GlobalAppSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/GlobalAppSettings.ec -o $(OBJ)GlobalAppSettings.sym

$(OBJ)JSON.sym: src/sys/JSON.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/JSON.ec -o $(OBJ)JSON.sym

$(OBJ)JSONGlobalSettings.sym: src/sys/JSONGlobalSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/JSONGlobalSettings.ec -o $(OBJ)JSONGlobalSettings.sym

$(OBJ)memory.sym: src/sys/memory.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/memory.ec -o $(OBJ)memory.sym

$(OBJ)Mutex.sym: src/sys/Mutex.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/sys/Mutex.ec -o $(OBJ)Mutex.sym

$(OBJ)Semaphore.sym: src/sys/Semaphore.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/Semaphore.ec -o $(OBJ)Semaphore.sym

$(OBJ)System.sym: src/sys/System.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/System.ec -o $(OBJ)System.sym

$(OBJ)TempFile.sym: src/sys/TempFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/TempFile.ec -o $(OBJ)TempFile.sym

$(OBJ)Thread.sym: src/sys/Thread.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/Thread.ec -o $(OBJ)Thread.sym

$(OBJ)Time.sym: src/sys/Time.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/Time.ec -o $(OBJ)Time.sym

$(OBJ)unicode.sym: src/sys/unicode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/unicode.ec -o $(OBJ)unicode.sym

$(OBJ)units.sym: src/sys/units.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/units.ec -o $(OBJ)units.sym

$(OBJ)i18n.sym: src/sys/i18n.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/sys/i18n.ec -o $(OBJ)i18n.sym

$(OBJ)Condition.sym: src/sys/Condition.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/sys/Condition.ec -o $(OBJ)Condition.sym

$(OBJ)Cube.sym: src/gfx/3D/meshes/Cube.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/meshes/Cube.ec -o $(OBJ)Cube.sym

$(OBJ)SkyBox.sym: src/gfx/3D/meshes/SkyBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/meshes/SkyBox.ec -o $(OBJ)SkyBox.sym

$(OBJ)Sphere.sym: src/gfx/3D/meshes/Sphere.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/meshes/Sphere.ec -o $(OBJ)Sphere.sym

$(OBJ)Object3DSFormat.sym: src/gfx/3D/models/Object3DSFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/models/Object3DSFormat.ec -o $(OBJ)Object3DSFormat.sym

$(OBJ)Camera.sym: src/gfx/3D/Camera.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Camera.ec -o $(OBJ)Camera.sym

$(OBJ)Matrix.sym: src/gfx/3D/Matrix.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Matrix.ec -o $(OBJ)Matrix.sym

$(OBJ)Mesh.sym: src/gfx/3D/Mesh.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Mesh.ec -o $(OBJ)Mesh.sym

$(OBJ)Object.sym: src/gfx/3D/Object.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Object.ec -o $(OBJ)Object.sym

$(OBJ)Plane.sym: src/gfx/3D/Plane.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Plane.ec -o $(OBJ)Plane.sym

$(OBJ)Quaternion.sym: src/gfx/3D/Quaternion.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Quaternion.ec -o $(OBJ)Quaternion.sym

$(OBJ)Vector3D.sym: src/gfx/3D/Vector3D.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/3D/Vector3D.ec -o $(OBJ)Vector3D.sym

$(OBJ)BMPFormat.sym: src/gfx/bitmaps/BMPFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/bitmaps/BMPFormat.ec -o $(OBJ)BMPFormat.sym

$(OBJ)GIFFormat.sym: src/gfx/bitmaps/GIFFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/bitmaps/GIFFormat.ec -o $(OBJ)GIFFormat.sym

$(OBJ)JPEGFormat.sym: src/gfx/bitmaps/JPEGFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/bitmaps/JPEGFormat.ec -o $(OBJ)JPEGFormat.sym

$(OBJ)PCXFormat.sym: src/gfx/bitmaps/PCXFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/bitmaps/PCXFormat.ec -o $(OBJ)PCXFormat.sym

$(OBJ)PNGFormat.sym: src/gfx/bitmaps/PNGFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/bitmaps/PNGFormat.ec -o $(OBJ)PNGFormat.sym

$(OBJ)RGBFormat.sym: src/gfx/bitmaps/RGBFormat.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/bitmaps/RGBFormat.ec -o $(OBJ)RGBFormat.sym

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Direct3D8DisplayDriver.sym: src/gfx/drivers/Direct3D8DisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/Direct3D8DisplayDriver.ec -o $(OBJ)Direct3D8DisplayDriver.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Direct3D9DisplayDriver.sym: src/gfx/drivers/Direct3D9DisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/Direct3D9DisplayDriver.ec -o $(OBJ)Direct3D9DisplayDriver.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)DirectDrawDisplayDriver.sym: src/gfx/drivers/DirectDrawDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/DirectDrawDisplayDriver.ec -o $(OBJ)DirectDrawDisplayDriver.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)GDIDisplayDriver.sym: src/gfx/drivers/GDIDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/GDIDisplayDriver.ec -o $(OBJ)GDIDisplayDriver.sym
endif

$(OBJ)lfbBlit.sym: src/gfx/drivers/lfbBlit.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/lfbBlit.ec -o $(OBJ)lfbBlit.sym

$(OBJ)lfbConvert.sym: src/gfx/drivers/lfbConvert.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/lfbConvert.ec -o $(OBJ)lfbConvert.sym

$(OBJ)LFBDisplayDriver.sym: src/gfx/drivers/LFBDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/LFBDisplayDriver.ec -o $(OBJ)LFBDisplayDriver.sym

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)NCursesDisplayDriver.sym: src/gfx/drivers/NCursesDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/NCursesDisplayDriver.ec -o $(OBJ)NCursesDisplayDriver.sym
endif

$(OBJ)OpenGLDisplayDriver.sym: src/gfx/drivers/OpenGLDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/OpenGLDisplayDriver.ec -o $(OBJ)OpenGLDisplayDriver.sym

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32BitmapPrinterDisplayDriver.sym: src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec -o $(OBJ)Win32BitmapPrinterDisplayDriver.sym
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaOpenGLDisplayDriver.sym: src/gfx/drivers/CocoaOpenGLDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/CocoaOpenGLDisplayDriver.ec -o $(OBJ)CocoaOpenGLDisplayDriver.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32ConsoleDisplayDriver.sym: src/gfx/drivers/Win32ConsoleDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/Win32ConsoleDisplayDriver.ec -o $(OBJ)Win32ConsoleDisplayDriver.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32PrinterDisplayDriver.sym: src/gfx/drivers/Win32PrinterDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/Win32PrinterDisplayDriver.ec -o $(OBJ)Win32PrinterDisplayDriver.sym
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)XDisplayDriver.sym: src/gfx/drivers/XDisplayDriver.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/XDisplayDriver.ec -o $(OBJ)XDisplayDriver.sym
endif

$(OBJ)Bitmap.sym: src/gfx/Bitmap.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/Bitmap.ec -o $(OBJ)Bitmap.sym

$(OBJ)BitmapResource.sym: src/gfx/BitmapResource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/BitmapResource.ec -o $(OBJ)BitmapResource.sym

$(OBJ)Color.sym: src/gfx/Color.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/Color.ec -o $(OBJ)Color.sym

$(OBJ)Display.sym: src/gfx/Display.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/Display.ec -o $(OBJ)Display.sym

$(OBJ)DisplaySystem.sym: src/gfx/DisplaySystem.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/DisplaySystem.ec -o $(OBJ)DisplaySystem.sym

$(OBJ)FontResource.sym: src/gfx/FontResource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/FontResource.ec -o $(OBJ)FontResource.sym

$(OBJ)Resource.sym: src/gfx/Resource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/Resource.ec -o $(OBJ)Resource.sym

$(OBJ)Surface.sym: src/gfx/Surface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gfx/Surface.ec -o $(OBJ)Surface.sym

$(OBJ)Button.sym: src/gui/controls/Button.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/Button.ec -o $(OBJ)Button.sym

$(OBJ)CalendarControl.sym: src/gui/controls/CalendarControl.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/CalendarControl.ec -o $(OBJ)CalendarControl.sym

$(OBJ)DataBox.sym: src/gui/controls/DataBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/DataBox.ec -o $(OBJ)DataBox.sym

$(OBJ)DropBox.sym: src/gui/controls/DropBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/DropBox.ec -o $(OBJ)DropBox.sym

$(OBJ)EditBox.sym: src/gui/controls/EditBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/EditBox.ec -o $(OBJ)EditBox.sym

$(OBJ)Label.sym: src/gui/controls/Label.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/Label.ec -o $(OBJ)Label.sym

$(OBJ)ListBox.sym: src/gui/controls/ListBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/ListBox.ec -o $(OBJ)ListBox.sym

$(OBJ)Menu.sym: src/gui/controls/Menu.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/Menu.ec -o $(OBJ)Menu.sym

$(OBJ)Picture.sym: src/gui/controls/Picture.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/Picture.ec -o $(OBJ)Picture.sym

$(OBJ)ProgressBar.sym: src/gui/controls/ProgressBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/ProgressBar.ec -o $(OBJ)ProgressBar.sym

$(OBJ)ScrollBar.sym: src/gui/controls/ScrollBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/ScrollBar.ec -o $(OBJ)ScrollBar.sym

$(OBJ)StatusBar.sym: src/gui/controls/StatusBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/StatusBar.ec -o $(OBJ)StatusBar.sym

$(OBJ)TabControl.sym: src/gui/controls/TabControl.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/TabControl.ec -o $(OBJ)TabControl.sym

$(OBJ)PaneSplitter.sym: src/gui/controls/PaneSplitter.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/PaneSplitter.ec -o $(OBJ)PaneSplitter.sym

$(OBJ)Stacker.sym: src/gui/controls/Stacker.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/Stacker.ec -o $(OBJ)Stacker.sym

$(OBJ)PathBox.sym: src/gui/controls/PathBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/PathBox.ec -o $(OBJ)PathBox.sym

$(OBJ)ToolTip.sym: src/gui/controls/ToolTip.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/ToolTip.ec -o $(OBJ)ToolTip.sym

$(OBJ)SelectorBar.sym: src/gui/controls/SelectorBar.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/SelectorBar.ec -o $(OBJ)SelectorBar.sym

$(OBJ)ColorPicker.sym: src/gui/dialogs/ColorPicker.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/ColorPicker.ec -o $(OBJ)ColorPicker.sym

$(OBJ)FileDialog.sym: src/gui/dialogs/FileDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/FileDialog.ec -o $(OBJ)FileDialog.sym

$(OBJ)FindDialog.sym: src/gui/dialogs/FindDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/FindDialog.ec -o $(OBJ)FindDialog.sym

$(OBJ)GoToDialog.sym: src/gui/dialogs/GoToDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/GoToDialog.ec -o $(OBJ)GoToDialog.sym

$(OBJ)MessageBox.sym: src/gui/dialogs/MessageBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/MessageBox.ec -o $(OBJ)MessageBox.sym

$(OBJ)ReplaceDialog.sym: src/gui/dialogs/ReplaceDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/ReplaceDialog.ec -o $(OBJ)ReplaceDialog.sym

$(OBJ)WindowList.sym: src/gui/dialogs/WindowList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/dialogs/WindowList.ec -o $(OBJ)WindowList.sym

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaDispatch.sym: src/gui/drivers/cocoa/CocoaDispatch.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/cocoa/CocoaDispatch.ec -o $(OBJ)CocoaDispatch.sym
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaInterface.sym: src/gui/drivers/cocoa/CocoaInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/cocoa/CocoaInterface.ec -o $(OBJ)CocoaInterface.sym
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)NCursesInterface.sym: src/gui/drivers/NCursesInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/NCursesInterface.ec -o $(OBJ)NCursesInterface.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32Interface.sym: src/gui/drivers/Win32Interface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/Win32Interface.ec -o $(OBJ)Win32Interface.sym
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32ConsoleInterface.sym: src/gui/drivers/Win32ConsoleInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/Win32ConsoleInterface.ec -o $(OBJ)Win32ConsoleInterface.sym
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)XInterface.sym: src/gui/drivers/XInterface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/XInterface.ec -o $(OBJ)XInterface.sym
endif

$(OBJ)TVisionSkin.sym: src/gui/skins/TVisionSkin.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/skins/TVisionSkin.ec -o $(OBJ)TVisionSkin.sym

$(OBJ)WindowsSkin.sym: src/gui/skins/WindowsSkin.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/skins/WindowsSkin.ec -o $(OBJ)WindowsSkin.sym

$(OBJ)Anchor.sym: src/gui/Anchor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Anchor.ec -o $(OBJ)Anchor.sym

$(OBJ)ClipBoard.sym: src/gui/ClipBoard.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/ClipBoard.ec -o $(OBJ)ClipBoard.sym

$(OBJ)Cursor.sym: src/gui/Cursor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Cursor.ec -o $(OBJ)Cursor.sym

$(OBJ)Desktop3D.sym: src/gui/Desktop3D.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Desktop3D.ec -o $(OBJ)Desktop3D.sym

$(OBJ)FormDesigner.sym: src/gui/FormDesigner.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/FormDesigner.ec -o $(OBJ)FormDesigner.sym

$(OBJ)GuiApplication.sym: src/gui/GuiApplication.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/GuiApplication.ec -o $(OBJ)GuiApplication.sym

$(OBJ)Interface.sym: src/gui/Interface.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Interface.ec -o $(OBJ)Interface.sym

$(OBJ)Key.sym: src/gui/Key.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Key.ec -o $(OBJ)Key.sym

$(OBJ)Skin.sym: src/gui/Skin.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Skin.ec -o $(OBJ)Skin.sym

$(OBJ)Timer.sym: src/gui/Timer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Timer.ec -o $(OBJ)Timer.sym

$(OBJ)typeEdit.sym: src/gui/typeEdit.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/typeEdit.ec -o $(OBJ)typeEdit.sym

$(OBJ)Window.sym: src/gui/Window.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/Window.ec -o $(OBJ)Window.sym

$(OBJ)dcom.sym: src/net/dcom.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/net/dcom.ec -o $(OBJ)dcom.sym

$(OBJ)HTTPFile.sym: src/net/HTTPFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/net/HTTPFile.ec -o $(OBJ)HTTPFile.sym

$(OBJ)network.sym: src/net/network.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/net/network.ec -o $(OBJ)network.sym

$(OBJ)NetworkClientFile.sym: src/net/NetworkClientFile.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/net/NetworkClientFile.ec -o $(OBJ)NetworkClientFile.sym

$(OBJ)Service.sym: src/net/Service.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/net/Service.ec -o $(OBJ)Service.sym

$(OBJ)Socket.sym: src/net/Socket.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/net/Socket.ec -o $(OBJ)Socket.sym

$(OBJ)Array.sym: src/com/containers/Array.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/Array.ec -o $(OBJ)Array.sym

$(OBJ)AVLTree.sym: src/com/containers/AVLTree.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/AVLTree.ec -o $(OBJ)AVLTree.sym

$(OBJ)BuiltInContainer.sym: src/com/containers/BuiltInContainer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/BuiltInContainer.ec -o $(OBJ)BuiltInContainer.sym

$(OBJ)Container.sym: src/com/containers/Container.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/Container.ec -o $(OBJ)Container.sym

$(OBJ)CustomAVLTree.sym: src/com/containers/CustomAVLTree.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/CustomAVLTree.ec -o $(OBJ)CustomAVLTree.sym

$(OBJ)LinkList.sym: src/com/containers/LinkList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/LinkList.ec -o $(OBJ)LinkList.sym

$(OBJ)List.sym: src/com/containers/List.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/List.ec -o $(OBJ)List.sym

$(OBJ)Map.sym: src/com/containers/Map.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/containers/Map.ec -o $(OBJ)Map.sym

$(OBJ)BinaryTree.sym: src/com/BinaryTree.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/BinaryTree.ec -o $(OBJ)BinaryTree.sym

$(OBJ)BTNode.sym: src/com/BTNode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/BTNode.ec -o $(OBJ)BTNode.sym

$(OBJ)dataTypes.sym: src/com/dataTypes.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/dataTypes.ec -o $(OBJ)dataTypes.sym

$(OBJ)instance.sym: src/com/instance.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/instance.ec -o $(OBJ)instance.sym

$(OBJ)String.sym: src/com/String.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/String.ec -o $(OBJ)String.sym

$(OBJ)OldList.sym: src/com/OldList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/OldList.ec -o $(OBJ)OldList.sym

# C OBJECT RULES

$(OBJ)Archive.c: src/sys/Archive.ec $(OBJ)Archive.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Archive.ec -o $(OBJ)Archive.c -symbols $(OBJ)

$(OBJ)BufferedFile.c: src/sys/BufferedFile.ec $(OBJ)BufferedFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/BufferedFile.ec -o $(OBJ)BufferedFile.c -symbols $(OBJ)

$(OBJ)Date.c: src/sys/Date.ec $(OBJ)Date.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Date.ec -o $(OBJ)Date.c -symbols $(OBJ)

$(OBJ)DualPipe.c: src/sys/DualPipe.ec $(OBJ)DualPipe.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/DualPipe.ec -o $(OBJ)DualPipe.c -symbols $(OBJ)

$(OBJ)EARArchive.c: src/sys/EARArchive.ec $(OBJ)EARArchive.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/EARArchive.ec -o $(OBJ)EARArchive.c -symbols $(OBJ)

$(OBJ)File.c: src/sys/File.ec $(OBJ)File.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/File.ec -o $(OBJ)File.c -symbols $(OBJ)

$(OBJ)FileMonitor.c: src/sys/FileMonitor.ec $(OBJ)FileMonitor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/FileMonitor.ec -o $(OBJ)FileMonitor.c -symbols $(OBJ)

$(OBJ)GlobalAppSettings.c: src/sys/GlobalAppSettings.ec $(OBJ)GlobalAppSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/GlobalAppSettings.ec -o $(OBJ)GlobalAppSettings.c -symbols $(OBJ)

$(OBJ)JSON.c: src/sys/JSON.ec $(OBJ)JSON.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/JSON.ec -o $(OBJ)JSON.c -symbols $(OBJ)

$(OBJ)JSONGlobalSettings.c: src/sys/JSONGlobalSettings.ec $(OBJ)JSONGlobalSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/JSONGlobalSettings.ec -o $(OBJ)JSONGlobalSettings.c -symbols $(OBJ)

$(OBJ)memory.c: src/sys/memory.ec $(OBJ)memory.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/memory.ec -o $(OBJ)memory.c -symbols $(OBJ)

$(OBJ)Mutex.c: src/sys/Mutex.ec $(OBJ)Mutex.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Mutex.ec -o $(OBJ)Mutex.c -symbols $(OBJ)

$(OBJ)Semaphore.c: src/sys/Semaphore.ec $(OBJ)Semaphore.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Semaphore.ec -o $(OBJ)Semaphore.c -symbols $(OBJ)

$(OBJ)System.c: src/sys/System.ec $(OBJ)System.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/System.ec -o $(OBJ)System.c -symbols $(OBJ)

$(OBJ)TempFile.c: src/sys/TempFile.ec $(OBJ)TempFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/TempFile.ec -o $(OBJ)TempFile.c -symbols $(OBJ)

$(OBJ)Thread.c: src/sys/Thread.ec $(OBJ)Thread.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Thread.ec -o $(OBJ)Thread.c -symbols $(OBJ)

$(OBJ)Time.c: src/sys/Time.ec $(OBJ)Time.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Time.ec -o $(OBJ)Time.c -symbols $(OBJ)

$(OBJ)unicode.c: src/sys/unicode.ec $(OBJ)unicode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/unicode.ec -o $(OBJ)unicode.c -symbols $(OBJ)

$(OBJ)units.c: src/sys/units.ec $(OBJ)units.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/units.ec -o $(OBJ)units.c -symbols $(OBJ)

$(OBJ)i18n.c: src/sys/i18n.ec $(OBJ)i18n.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/i18n.ec -o $(OBJ)i18n.c -symbols $(OBJ)

$(OBJ)Condition.c: src/sys/Condition.ec $(OBJ)Condition.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/sys/Condition.ec -o $(OBJ)Condition.c -symbols $(OBJ)

$(OBJ)Cube.c: src/gfx/3D/meshes/Cube.ec $(OBJ)Cube.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/meshes/Cube.ec -o $(OBJ)Cube.c -symbols $(OBJ)

$(OBJ)SkyBox.c: src/gfx/3D/meshes/SkyBox.ec $(OBJ)SkyBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/meshes/SkyBox.ec -o $(OBJ)SkyBox.c -symbols $(OBJ)

$(OBJ)Sphere.c: src/gfx/3D/meshes/Sphere.ec $(OBJ)Sphere.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/meshes/Sphere.ec -o $(OBJ)Sphere.c -symbols $(OBJ)

$(OBJ)Object3DSFormat.c: src/gfx/3D/models/Object3DSFormat.ec $(OBJ)Object3DSFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/models/Object3DSFormat.ec -o $(OBJ)Object3DSFormat.c -symbols $(OBJ)

$(OBJ)Camera.c: src/gfx/3D/Camera.ec $(OBJ)Camera.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Camera.ec -o $(OBJ)Camera.c -symbols $(OBJ)

$(OBJ)Matrix.c: src/gfx/3D/Matrix.ec $(OBJ)Matrix.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Matrix.ec -o $(OBJ)Matrix.c -symbols $(OBJ)

$(OBJ)Mesh.c: src/gfx/3D/Mesh.ec $(OBJ)Mesh.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Mesh.ec -o $(OBJ)Mesh.c -symbols $(OBJ)

$(OBJ)Object.c: src/gfx/3D/Object.ec $(OBJ)Object.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Object.ec -o $(OBJ)Object.c -symbols $(OBJ)

$(OBJ)Plane.c: src/gfx/3D/Plane.ec $(OBJ)Plane.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Plane.ec -o $(OBJ)Plane.c -symbols $(OBJ)

$(OBJ)Quaternion.c: src/gfx/3D/Quaternion.ec $(OBJ)Quaternion.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Quaternion.ec -o $(OBJ)Quaternion.c -symbols $(OBJ)

$(OBJ)Vector3D.c: src/gfx/3D/Vector3D.ec $(OBJ)Vector3D.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Vector3D.ec -o $(OBJ)Vector3D.c -symbols $(OBJ)

$(OBJ)BMPFormat.c: src/gfx/bitmaps/BMPFormat.ec $(OBJ)BMPFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/BMPFormat.ec -o $(OBJ)BMPFormat.c -symbols $(OBJ)

$(OBJ)GIFFormat.c: src/gfx/bitmaps/GIFFormat.ec $(OBJ)GIFFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/GIFFormat.ec -o $(OBJ)GIFFormat.c -symbols $(OBJ)

$(OBJ)JPEGFormat.c: src/gfx/bitmaps/JPEGFormat.ec $(OBJ)JPEGFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/JPEGFormat.ec -o $(OBJ)JPEGFormat.c -symbols $(OBJ)

$(OBJ)PCXFormat.c: src/gfx/bitmaps/PCXFormat.ec $(OBJ)PCXFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/PCXFormat.ec -o $(OBJ)PCXFormat.c -symbols $(OBJ)

$(OBJ)PNGFormat.c: src/gfx/bitmaps/PNGFormat.ec $(OBJ)PNGFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/PNGFormat.ec -o $(OBJ)PNGFormat.c -symbols $(OBJ)

$(OBJ)RGBFormat.c: src/gfx/bitmaps/RGBFormat.ec $(OBJ)RGBFormat.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/RGBFormat.ec -o $(OBJ)RGBFormat.c -symbols $(OBJ)

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Direct3D8DisplayDriver.c: src/gfx/drivers/Direct3D8DisplayDriver.ec $(OBJ)Direct3D8DisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Direct3D8DisplayDriver.ec -o $(OBJ)Direct3D8DisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Direct3D9DisplayDriver.c: src/gfx/drivers/Direct3D9DisplayDriver.ec $(OBJ)Direct3D9DisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Direct3D9DisplayDriver.ec -o $(OBJ)Direct3D9DisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)DirectDrawDisplayDriver.c: src/gfx/drivers/DirectDrawDisplayDriver.ec $(OBJ)DirectDrawDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/DirectDrawDisplayDriver.ec -o $(OBJ)DirectDrawDisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)GDIDisplayDriver.c: src/gfx/drivers/GDIDisplayDriver.ec $(OBJ)GDIDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/GDIDisplayDriver.ec -o $(OBJ)GDIDisplayDriver.c -symbols $(OBJ)
endif

$(OBJ)lfbBlit.c: src/gfx/drivers/lfbBlit.ec $(OBJ)lfbBlit.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/lfbBlit.ec -o $(OBJ)lfbBlit.c -symbols $(OBJ)

$(OBJ)lfbConvert.c: src/gfx/drivers/lfbConvert.ec $(OBJ)lfbConvert.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/lfbConvert.ec -o $(OBJ)lfbConvert.c -symbols $(OBJ)

$(OBJ)LFBDisplayDriver.c: src/gfx/drivers/LFBDisplayDriver.ec $(OBJ)LFBDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/LFBDisplayDriver.ec -o $(OBJ)LFBDisplayDriver.c -symbols $(OBJ)

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)NCursesDisplayDriver.c: src/gfx/drivers/NCursesDisplayDriver.ec $(OBJ)NCursesDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/NCursesDisplayDriver.ec -o $(OBJ)NCursesDisplayDriver.c -symbols $(OBJ)
endif

$(OBJ)OpenGLDisplayDriver.c: src/gfx/drivers/OpenGLDisplayDriver.ec $(OBJ)OpenGLDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/OpenGLDisplayDriver.ec -o $(OBJ)OpenGLDisplayDriver.c -symbols $(OBJ)

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32BitmapPrinterDisplayDriver.c: src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec $(OBJ)Win32BitmapPrinterDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec -o $(OBJ)Win32BitmapPrinterDisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaOpenGLDisplayDriver.c: src/gfx/drivers/CocoaOpenGLDisplayDriver.ec $(OBJ)CocoaOpenGLDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/CocoaOpenGLDisplayDriver.ec -o $(OBJ)CocoaOpenGLDisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32ConsoleDisplayDriver.c: src/gfx/drivers/Win32ConsoleDisplayDriver.ec $(OBJ)Win32ConsoleDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Win32ConsoleDisplayDriver.ec -o $(OBJ)Win32ConsoleDisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32PrinterDisplayDriver.c: src/gfx/drivers/Win32PrinterDisplayDriver.ec $(OBJ)Win32PrinterDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Win32PrinterDisplayDriver.ec -o $(OBJ)Win32PrinterDisplayDriver.c -symbols $(OBJ)
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)XDisplayDriver.c: src/gfx/drivers/XDisplayDriver.ec $(OBJ)XDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/XDisplayDriver.ec -o $(OBJ)XDisplayDriver.c -symbols $(OBJ)
endif

$(OBJ)Bitmap.c: src/gfx/Bitmap.ec $(OBJ)Bitmap.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/Bitmap.ec -o $(OBJ)Bitmap.c -symbols $(OBJ)

$(OBJ)BitmapResource.c: src/gfx/BitmapResource.ec $(OBJ)BitmapResource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/BitmapResource.ec -o $(OBJ)BitmapResource.c -symbols $(OBJ)

$(OBJ)Color.c: src/gfx/Color.ec $(OBJ)Color.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/Color.ec -o $(OBJ)Color.c -symbols $(OBJ)

$(OBJ)Display.c: src/gfx/Display.ec $(OBJ)Display.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/Display.ec -o $(OBJ)Display.c -symbols $(OBJ)

$(OBJ)DisplaySystem.c: src/gfx/DisplaySystem.ec $(OBJ)DisplaySystem.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/DisplaySystem.ec -o $(OBJ)DisplaySystem.c -symbols $(OBJ)

$(OBJ)FontResource.c: src/gfx/FontResource.ec $(OBJ)FontResource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/FontResource.ec -o $(OBJ)FontResource.c -symbols $(OBJ)

$(OBJ)Resource.c: src/gfx/Resource.ec $(OBJ)Resource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/Resource.ec -o $(OBJ)Resource.c -symbols $(OBJ)

$(OBJ)Surface.c: src/gfx/Surface.ec $(OBJ)Surface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gfx/Surface.ec -o $(OBJ)Surface.c -symbols $(OBJ)

$(OBJ)Button.c: src/gui/controls/Button.ec $(OBJ)Button.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/Button.ec -o $(OBJ)Button.c -symbols $(OBJ)

$(OBJ)CalendarControl.c: src/gui/controls/CalendarControl.ec $(OBJ)CalendarControl.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/CalendarControl.ec -o $(OBJ)CalendarControl.c -symbols $(OBJ)

$(OBJ)DataBox.c: src/gui/controls/DataBox.ec $(OBJ)DataBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/DataBox.ec -o $(OBJ)DataBox.c -symbols $(OBJ)

$(OBJ)DropBox.c: src/gui/controls/DropBox.ec $(OBJ)DropBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/DropBox.ec -o $(OBJ)DropBox.c -symbols $(OBJ)

$(OBJ)EditBox.c: src/gui/controls/EditBox.ec $(OBJ)EditBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/EditBox.ec -o $(OBJ)EditBox.c -symbols $(OBJ)

$(OBJ)Label.c: src/gui/controls/Label.ec $(OBJ)Label.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/Label.ec -o $(OBJ)Label.c -symbols $(OBJ)

$(OBJ)ListBox.c: src/gui/controls/ListBox.ec $(OBJ)ListBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/ListBox.ec -o $(OBJ)ListBox.c -symbols $(OBJ)

$(OBJ)Menu.c: src/gui/controls/Menu.ec $(OBJ)Menu.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/Menu.ec -o $(OBJ)Menu.c -symbols $(OBJ)

$(OBJ)Picture.c: src/gui/controls/Picture.ec $(OBJ)Picture.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/Picture.ec -o $(OBJ)Picture.c -symbols $(OBJ)

$(OBJ)ProgressBar.c: src/gui/controls/ProgressBar.ec $(OBJ)ProgressBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/ProgressBar.ec -o $(OBJ)ProgressBar.c -symbols $(OBJ)

$(OBJ)ScrollBar.c: src/gui/controls/ScrollBar.ec $(OBJ)ScrollBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/ScrollBar.ec -o $(OBJ)ScrollBar.c -symbols $(OBJ)

$(OBJ)StatusBar.c: src/gui/controls/StatusBar.ec $(OBJ)StatusBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/StatusBar.ec -o $(OBJ)StatusBar.c -symbols $(OBJ)

$(OBJ)TabControl.c: src/gui/controls/TabControl.ec $(OBJ)TabControl.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/TabControl.ec -o $(OBJ)TabControl.c -symbols $(OBJ)

$(OBJ)PaneSplitter.c: src/gui/controls/PaneSplitter.ec $(OBJ)PaneSplitter.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/PaneSplitter.ec -o $(OBJ)PaneSplitter.c -symbols $(OBJ)

$(OBJ)Stacker.c: src/gui/controls/Stacker.ec $(OBJ)Stacker.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/Stacker.ec -o $(OBJ)Stacker.c -symbols $(OBJ)

$(OBJ)PathBox.c: src/gui/controls/PathBox.ec $(OBJ)PathBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/PathBox.ec -o $(OBJ)PathBox.c -symbols $(OBJ)

$(OBJ)ToolTip.c: src/gui/controls/ToolTip.ec $(OBJ)ToolTip.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/ToolTip.ec -o $(OBJ)ToolTip.c -symbols $(OBJ)

$(OBJ)SelectorBar.c: src/gui/controls/SelectorBar.ec $(OBJ)SelectorBar.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/SelectorBar.ec -o $(OBJ)SelectorBar.c -symbols $(OBJ)

$(OBJ)ColorPicker.c: src/gui/dialogs/ColorPicker.ec $(OBJ)ColorPicker.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/ColorPicker.ec -o $(OBJ)ColorPicker.c -symbols $(OBJ)

$(OBJ)FileDialog.c: src/gui/dialogs/FileDialog.ec $(OBJ)FileDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/FileDialog.ec -o $(OBJ)FileDialog.c -symbols $(OBJ)

$(OBJ)FindDialog.c: src/gui/dialogs/FindDialog.ec $(OBJ)FindDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/FindDialog.ec -o $(OBJ)FindDialog.c -symbols $(OBJ)

$(OBJ)GoToDialog.c: src/gui/dialogs/GoToDialog.ec $(OBJ)GoToDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/GoToDialog.ec -o $(OBJ)GoToDialog.c -symbols $(OBJ)

$(OBJ)MessageBox.c: src/gui/dialogs/MessageBox.ec $(OBJ)MessageBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/MessageBox.ec -o $(OBJ)MessageBox.c -symbols $(OBJ)

$(OBJ)ReplaceDialog.c: src/gui/dialogs/ReplaceDialog.ec $(OBJ)ReplaceDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/ReplaceDialog.ec -o $(OBJ)ReplaceDialog.c -symbols $(OBJ)

$(OBJ)WindowList.c: src/gui/dialogs/WindowList.ec $(OBJ)WindowList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/WindowList.ec -o $(OBJ)WindowList.c -symbols $(OBJ)

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaDispatch.c: src/gui/drivers/cocoa/CocoaDispatch.ec $(OBJ)CocoaDispatch.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/drivers/cocoa/CocoaDispatch.ec -o $(OBJ)CocoaDispatch.c -symbols $(OBJ)
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaInterface.c: src/gui/drivers/cocoa/CocoaInterface.ec $(OBJ)CocoaInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/drivers/cocoa/CocoaInterface.ec -o $(OBJ)CocoaInterface.c -symbols $(OBJ)
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)NCursesInterface.c: src/gui/drivers/NCursesInterface.ec $(OBJ)NCursesInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/drivers/NCursesInterface.ec -o $(OBJ)NCursesInterface.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32Interface.c: src/gui/drivers/Win32Interface.ec $(OBJ)Win32Interface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/drivers/Win32Interface.ec -o $(OBJ)Win32Interface.c -symbols $(OBJ)
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32ConsoleInterface.c: src/gui/drivers/Win32ConsoleInterface.ec $(OBJ)Win32ConsoleInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/drivers/Win32ConsoleInterface.ec -o $(OBJ)Win32ConsoleInterface.c -symbols $(OBJ)
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)XInterface.c: src/gui/drivers/XInterface.ec $(OBJ)XInterface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/drivers/XInterface.ec -o $(OBJ)XInterface.c -symbols $(OBJ)
endif

$(OBJ)TVisionSkin.c: src/gui/skins/TVisionSkin.ec $(OBJ)TVisionSkin.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/skins/TVisionSkin.ec -o $(OBJ)TVisionSkin.c -symbols $(OBJ)

$(OBJ)WindowsSkin.c: src/gui/skins/WindowsSkin.ec $(OBJ)WindowsSkin.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/skins/WindowsSkin.ec -o $(OBJ)WindowsSkin.c -symbols $(OBJ)

$(OBJ)Anchor.c: src/gui/Anchor.ec $(OBJ)Anchor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Anchor.ec -o $(OBJ)Anchor.c -symbols $(OBJ)

$(OBJ)ClipBoard.c: src/gui/ClipBoard.ec $(OBJ)ClipBoard.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/ClipBoard.ec -o $(OBJ)ClipBoard.c -symbols $(OBJ)

$(OBJ)Cursor.c: src/gui/Cursor.ec $(OBJ)Cursor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Cursor.ec -o $(OBJ)Cursor.c -symbols $(OBJ)

$(OBJ)Desktop3D.c: src/gui/Desktop3D.ec $(OBJ)Desktop3D.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Desktop3D.ec -o $(OBJ)Desktop3D.c -symbols $(OBJ)

$(OBJ)FormDesigner.c: src/gui/FormDesigner.ec $(OBJ)FormDesigner.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/FormDesigner.ec -o $(OBJ)FormDesigner.c -symbols $(OBJ)

$(OBJ)GuiApplication.c: src/gui/GuiApplication.ec $(OBJ)GuiApplication.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/GuiApplication.ec -o $(OBJ)GuiApplication.c -symbols $(OBJ)

$(OBJ)Interface.c: src/gui/Interface.ec $(OBJ)Interface.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Interface.ec -o $(OBJ)Interface.c -symbols $(OBJ)

$(OBJ)Key.c: src/gui/Key.ec $(OBJ)Key.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Key.ec -o $(OBJ)Key.c -symbols $(OBJ)

$(OBJ)Skin.c: src/gui/Skin.ec $(OBJ)Skin.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Skin.ec -o $(OBJ)Skin.c -symbols $(OBJ)

$(OBJ)Timer.c: src/gui/Timer.ec $(OBJ)Timer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Timer.ec -o $(OBJ)Timer.c -symbols $(OBJ)

$(OBJ)typeEdit.c: src/gui/typeEdit.ec $(OBJ)typeEdit.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/typeEdit.ec -o $(OBJ)typeEdit.c -symbols $(OBJ)

$(OBJ)Window.c: src/gui/Window.ec $(OBJ)Window.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/Window.ec -o $(OBJ)Window.c -symbols $(OBJ)

$(OBJ)dcom.c: src/net/dcom.ec $(OBJ)dcom.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/net/dcom.ec -o $(OBJ)dcom.c -symbols $(OBJ)

$(OBJ)HTTPFile.c: src/net/HTTPFile.ec $(OBJ)HTTPFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/net/HTTPFile.ec -o $(OBJ)HTTPFile.c -symbols $(OBJ)

$(OBJ)network.c: src/net/network.ec $(OBJ)network.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/net/network.ec -o $(OBJ)network.c -symbols $(OBJ)

$(OBJ)NetworkClientFile.c: src/net/NetworkClientFile.ec $(OBJ)NetworkClientFile.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/net/NetworkClientFile.ec -o $(OBJ)NetworkClientFile.c -symbols $(OBJ)

$(OBJ)Service.c: src/net/Service.ec $(OBJ)Service.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/net/Service.ec -o $(OBJ)Service.c -symbols $(OBJ)

$(OBJ)Socket.c: src/net/Socket.ec $(OBJ)Socket.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/net/Socket.ec -o $(OBJ)Socket.c -symbols $(OBJ)

$(OBJ)Array.c: src/com/containers/Array.ec $(OBJ)Array.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/Array.ec -o $(OBJ)Array.c -symbols $(OBJ)

$(OBJ)AVLTree.c: src/com/containers/AVLTree.ec $(OBJ)AVLTree.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/AVLTree.ec -o $(OBJ)AVLTree.c -symbols $(OBJ)

$(OBJ)BuiltInContainer.c: src/com/containers/BuiltInContainer.ec $(OBJ)BuiltInContainer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/BuiltInContainer.ec -o $(OBJ)BuiltInContainer.c -symbols $(OBJ)

$(OBJ)Container.c: src/com/containers/Container.ec $(OBJ)Container.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/Container.ec -o $(OBJ)Container.c -symbols $(OBJ)

$(OBJ)CustomAVLTree.c: src/com/containers/CustomAVLTree.ec $(OBJ)CustomAVLTree.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/CustomAVLTree.ec -o $(OBJ)CustomAVLTree.c -symbols $(OBJ)

$(OBJ)LinkList.c: src/com/containers/LinkList.ec $(OBJ)LinkList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/LinkList.ec -o $(OBJ)LinkList.c -symbols $(OBJ)

$(OBJ)List.c: src/com/containers/List.ec $(OBJ)List.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/List.ec -o $(OBJ)List.c -symbols $(OBJ)

$(OBJ)Map.c: src/com/containers/Map.ec $(OBJ)Map.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/containers/Map.ec -o $(OBJ)Map.c -symbols $(OBJ)

$(OBJ)BinaryTree.c: src/com/BinaryTree.ec $(OBJ)BinaryTree.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/BinaryTree.ec -o $(OBJ)BinaryTree.c -symbols $(OBJ)

$(OBJ)BTNode.c: src/com/BTNode.ec $(OBJ)BTNode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/BTNode.ec -o $(OBJ)BTNode.c -symbols $(OBJ)

$(OBJ)dataTypes.c: src/com/dataTypes.ec $(OBJ)dataTypes.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/dataTypes.ec -o $(OBJ)dataTypes.c -symbols $(OBJ)

$(OBJ)instance.c: src/com/instance.ec $(OBJ)instance.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/instance.ec -o $(OBJ)instance.c -symbols $(OBJ)

$(OBJ)String.c: src/com/String.ec $(OBJ)String.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/String.ec -o $(OBJ)String.c -symbols $(OBJ)

$(OBJ)OldList.c: src/com/OldList.ec $(OBJ)OldList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c src/com/OldList.ec -o $(OBJ)OldList.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)Archive.o: $(OBJ)Archive.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Archive.c -o $(OBJ)Archive.o

$(OBJ)BufferedFile.o: $(OBJ)BufferedFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BufferedFile.c -o $(OBJ)BufferedFile.o

$(OBJ)Date.o: $(OBJ)Date.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Date.c -o $(OBJ)Date.o

$(OBJ)DualPipe.o: $(OBJ)DualPipe.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DualPipe.c -o $(OBJ)DualPipe.o

$(OBJ)EARArchive.o: $(OBJ)EARArchive.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EARArchive.c -o $(OBJ)EARArchive.o

$(OBJ)File.o: $(OBJ)File.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)File.c -o $(OBJ)File.o

$(OBJ)FileMonitor.o: $(OBJ)FileMonitor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FileMonitor.c -o $(OBJ)FileMonitor.o

$(OBJ)GlobalAppSettings.o: $(OBJ)GlobalAppSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GlobalAppSettings.c -o $(OBJ)GlobalAppSettings.o

$(OBJ)JSON.o: $(OBJ)JSON.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)JSON.c -o $(OBJ)JSON.o

$(OBJ)JSONGlobalSettings.o: $(OBJ)JSONGlobalSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)JSONGlobalSettings.c -o $(OBJ)JSONGlobalSettings.o

$(OBJ)memory.o: $(OBJ)memory.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)memory.c -o $(OBJ)memory.o

$(OBJ)Mutex.o: $(OBJ)Mutex.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Mutex.c -o $(OBJ)Mutex.o

$(OBJ)Semaphore.o: $(OBJ)Semaphore.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Semaphore.c -o $(OBJ)Semaphore.o

$(OBJ)System.o: $(OBJ)System.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)System.c -o $(OBJ)System.o

$(OBJ)TempFile.o: $(OBJ)TempFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)TempFile.c -o $(OBJ)TempFile.o

$(OBJ)Thread.o: $(OBJ)Thread.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Thread.c -o $(OBJ)Thread.o

$(OBJ)Time.o: $(OBJ)Time.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Time.c -o $(OBJ)Time.o

$(OBJ)unicode.o: $(OBJ)unicode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)unicode.c -o $(OBJ)unicode.o

$(OBJ)units.o: $(OBJ)units.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)units.c -o $(OBJ)units.o

$(OBJ)File.c.o: src/sys/File.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/sys/File.c -o $(OBJ)File.c.o

$(OBJ)DualPipe.c.o: src/sys/DualPipe.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/sys/DualPipe.c -o $(OBJ)DualPipe.c.o

$(OBJ)System.c.o: src/sys/System.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/sys/System.c -o $(OBJ)System.c.o

$(OBJ)i18n.o: $(OBJ)i18n.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)i18n.c -o $(OBJ)i18n.o

$(OBJ)Condition.o: $(OBJ)Condition.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Condition.c -o $(OBJ)Condition.o

$(OBJ)Cube.o: $(OBJ)Cube.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Cube.c -o $(OBJ)Cube.o

$(OBJ)SkyBox.o: $(OBJ)SkyBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)SkyBox.c -o $(OBJ)SkyBox.o

$(OBJ)Sphere.o: $(OBJ)Sphere.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Sphere.c -o $(OBJ)Sphere.o

$(OBJ)Object3DSFormat.o: $(OBJ)Object3DSFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Object3DSFormat.c -o $(OBJ)Object3DSFormat.o

$(OBJ)Camera.o: $(OBJ)Camera.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Camera.c -o $(OBJ)Camera.o

$(OBJ)Matrix.o: $(OBJ)Matrix.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Matrix.c -o $(OBJ)Matrix.o

$(OBJ)Mesh.o: $(OBJ)Mesh.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Mesh.c -o $(OBJ)Mesh.o

$(OBJ)Object.o: $(OBJ)Object.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Object.c -o $(OBJ)Object.o

$(OBJ)Plane.o: $(OBJ)Plane.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Plane.c -o $(OBJ)Plane.o

$(OBJ)Quaternion.o: $(OBJ)Quaternion.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Quaternion.c -o $(OBJ)Quaternion.o

$(OBJ)Vector3D.o: $(OBJ)Vector3D.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Vector3D.c -o $(OBJ)Vector3D.o

$(OBJ)BMPFormat.o: $(OBJ)BMPFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BMPFormat.c -o $(OBJ)BMPFormat.o

$(OBJ)GIFFormat.o: $(OBJ)GIFFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GIFFormat.c -o $(OBJ)GIFFormat.o

$(OBJ)JPEGFormat.o: $(OBJ)JPEGFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)JPEGFormat.c -o $(OBJ)JPEGFormat.o

$(OBJ)PCXFormat.o: $(OBJ)PCXFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)PCXFormat.c -o $(OBJ)PCXFormat.o

$(OBJ)PNGFormat.o: $(OBJ)PNGFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)PNGFormat.c -o $(OBJ)PNGFormat.o

$(OBJ)RGBFormat.o: $(OBJ)RGBFormat.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)RGBFormat.c -o $(OBJ)RGBFormat.o

$(OBJ)harfbuzz-freetype.o: src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c -o $(OBJ)harfbuzz-freetype.o

$(OBJ)harfbuzz-unicode-tables.o: src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c -o $(OBJ)harfbuzz-unicode-tables.o

$(OBJ)harfbuzz-unicode.o: src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c -o $(OBJ)harfbuzz-unicode.o

$(OBJ)harfbuzz-arabic.o: src/gfx/drivers/harfbuzz/harfbuzz-arabic.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-arabic.c -o $(OBJ)harfbuzz-arabic.o

$(OBJ)harfbuzz-buffer.o: src/gfx/drivers/harfbuzz/harfbuzz-buffer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-buffer.c -o $(OBJ)harfbuzz-buffer.o

$(OBJ)harfbuzz-gdef.o: src/gfx/drivers/harfbuzz/harfbuzz-gdef.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-gdef.c -o $(OBJ)harfbuzz-gdef.o

$(OBJ)harfbuzz-gpos.o: src/gfx/drivers/harfbuzz/harfbuzz-gpos.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-gpos.c -o $(OBJ)harfbuzz-gpos.o

$(OBJ)harfbuzz-gsub.o: src/gfx/drivers/harfbuzz/harfbuzz-gsub.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-gsub.c -o $(OBJ)harfbuzz-gsub.o

$(OBJ)harfbuzz-hangul.o: src/gfx/drivers/harfbuzz/harfbuzz-hangul.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-hangul.c -o $(OBJ)harfbuzz-hangul.o

$(OBJ)harfbuzz-hebrew.o: src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c -o $(OBJ)harfbuzz-hebrew.o

$(OBJ)harfbuzz-indic.o: src/gfx/drivers/harfbuzz/harfbuzz-indic.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-indic.c -o $(OBJ)harfbuzz-indic.o

$(OBJ)harfbuzz-khmer.o: src/gfx/drivers/harfbuzz/harfbuzz-khmer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-khmer.c -o $(OBJ)harfbuzz-khmer.o

$(OBJ)harfbuzz-myanmar.o: src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c -o $(OBJ)harfbuzz-myanmar.o

$(OBJ)harfbuzz-open.o: src/gfx/drivers/harfbuzz/harfbuzz-open.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-open.c -o $(OBJ)harfbuzz-open.o

$(OBJ)harfbuzz-shaper.o: src/gfx/drivers/harfbuzz/harfbuzz-shaper.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-shaper.c -o $(OBJ)harfbuzz-shaper.o

$(OBJ)harfbuzz-stream.o: src/gfx/drivers/harfbuzz/harfbuzz-stream.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-stream.c -o $(OBJ)harfbuzz-stream.o

$(OBJ)harfbuzz-tibetan.o: src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c -o $(OBJ)harfbuzz-tibetan.o

$(OBJ)harfbuzz-impl.o: src/gfx/drivers/harfbuzz/harfbuzz-impl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-impl.c -o $(OBJ)harfbuzz-impl.o

$(OBJ)harfbuzz-thai.o: src/gfx/drivers/harfbuzz/harfbuzz-thai.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-thai.c -o $(OBJ)harfbuzz-thai.o

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Direct3D8DisplayDriver.o: $(OBJ)Direct3D8DisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Direct3D8DisplayDriver.c -o $(OBJ)Direct3D8DisplayDriver.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Direct3D9DisplayDriver.o: $(OBJ)Direct3D9DisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Direct3D9DisplayDriver.c -o $(OBJ)Direct3D9DisplayDriver.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)DirectDrawDisplayDriver.o: $(OBJ)DirectDrawDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DirectDrawDisplayDriver.c -o $(OBJ)DirectDrawDisplayDriver.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)GDIDisplayDriver.o: $(OBJ)GDIDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GDIDisplayDriver.c -o $(OBJ)GDIDisplayDriver.o
endif

$(OBJ)lfbBlit.o: $(OBJ)lfbBlit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)lfbBlit.c -o $(OBJ)lfbBlit.o

$(OBJ)lfbConvert.o: $(OBJ)lfbConvert.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)lfbConvert.c -o $(OBJ)lfbConvert.o

$(OBJ)LFBDisplayDriver.o: $(OBJ)LFBDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)LFBDisplayDriver.c -o $(OBJ)LFBDisplayDriver.o

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)NCursesDisplayDriver.o: $(OBJ)NCursesDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)NCursesDisplayDriver.c -o $(OBJ)NCursesDisplayDriver.o
endif

$(OBJ)OpenGLDisplayDriver.o: $(OBJ)OpenGLDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)OpenGLDisplayDriver.c -o $(OBJ)OpenGLDisplayDriver.o

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32BitmapPrinterDisplayDriver.o: $(OBJ)Win32BitmapPrinterDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32BitmapPrinterDisplayDriver.c -o $(OBJ)Win32BitmapPrinterDisplayDriver.o
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaOpenGLDisplayDriver.o: $(OBJ)CocoaOpenGLDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CocoaOpenGLDisplayDriver.c -o $(OBJ)CocoaOpenGLDisplayDriver.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32ConsoleDisplayDriver.o: $(OBJ)Win32ConsoleDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32ConsoleDisplayDriver.c -o $(OBJ)Win32ConsoleDisplayDriver.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32PrinterDisplayDriver.o: $(OBJ)Win32PrinterDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32PrinterDisplayDriver.c -o $(OBJ)Win32PrinterDisplayDriver.o
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)XDisplayDriver.o: $(OBJ)XDisplayDriver.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)XDisplayDriver.c -o $(OBJ)XDisplayDriver.o
endif

$(OBJ)Bitmap.o: $(OBJ)Bitmap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Bitmap.c -o $(OBJ)Bitmap.o

$(OBJ)BitmapResource.o: $(OBJ)BitmapResource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BitmapResource.c -o $(OBJ)BitmapResource.o

$(OBJ)Color.o: $(OBJ)Color.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Color.c -o $(OBJ)Color.o

$(OBJ)Display.o: $(OBJ)Display.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Display.c -o $(OBJ)Display.o

$(OBJ)DisplaySystem.o: $(OBJ)DisplaySystem.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DisplaySystem.c -o $(OBJ)DisplaySystem.o

$(OBJ)FontResource.o: $(OBJ)FontResource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FontResource.c -o $(OBJ)FontResource.o

$(OBJ)Resource.o: $(OBJ)Resource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Resource.c -o $(OBJ)Resource.o

$(OBJ)Surface.o: $(OBJ)Surface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Surface.c -o $(OBJ)Surface.o

$(OBJ)Button.o: $(OBJ)Button.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Button.c -o $(OBJ)Button.o

$(OBJ)CalendarControl.o: $(OBJ)CalendarControl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CalendarControl.c -o $(OBJ)CalendarControl.o

$(OBJ)DataBox.o: $(OBJ)DataBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DataBox.c -o $(OBJ)DataBox.o

$(OBJ)DropBox.o: $(OBJ)DropBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DropBox.c -o $(OBJ)DropBox.o

$(OBJ)EditBox.o: $(OBJ)EditBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EditBox.c -o $(OBJ)EditBox.o

$(OBJ)Label.o: $(OBJ)Label.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Label.c -o $(OBJ)Label.o

$(OBJ)ListBox.o: $(OBJ)ListBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ListBox.c -o $(OBJ)ListBox.o

$(OBJ)Menu.o: $(OBJ)Menu.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Menu.c -o $(OBJ)Menu.o

$(OBJ)Picture.o: $(OBJ)Picture.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Picture.c -o $(OBJ)Picture.o

$(OBJ)ProgressBar.o: $(OBJ)ProgressBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProgressBar.c -o $(OBJ)ProgressBar.o

$(OBJ)ScrollBar.o: $(OBJ)ScrollBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ScrollBar.c -o $(OBJ)ScrollBar.o

$(OBJ)StatusBar.o: $(OBJ)StatusBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)StatusBar.c -o $(OBJ)StatusBar.o

$(OBJ)TabControl.o: $(OBJ)TabControl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)TabControl.c -o $(OBJ)TabControl.o

$(OBJ)PaneSplitter.o: $(OBJ)PaneSplitter.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)PaneSplitter.c -o $(OBJ)PaneSplitter.o

$(OBJ)Stacker.o: $(OBJ)Stacker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Stacker.c -o $(OBJ)Stacker.o

$(OBJ)PathBox.o: $(OBJ)PathBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)PathBox.c -o $(OBJ)PathBox.o

$(OBJ)ToolTip.o: $(OBJ)ToolTip.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ToolTip.c -o $(OBJ)ToolTip.o

$(OBJ)SelectorBar.o: $(OBJ)SelectorBar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)SelectorBar.c -o $(OBJ)SelectorBar.o

$(OBJ)ColorPicker.o: $(OBJ)ColorPicker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ColorPicker.c -o $(OBJ)ColorPicker.o

$(OBJ)FileDialog.o: $(OBJ)FileDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FileDialog.c -o $(OBJ)FileDialog.o

$(OBJ)FindDialog.o: $(OBJ)FindDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FindDialog.c -o $(OBJ)FindDialog.o

$(OBJ)GoToDialog.o: $(OBJ)GoToDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GoToDialog.c -o $(OBJ)GoToDialog.o

$(OBJ)MessageBox.o: $(OBJ)MessageBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)MessageBox.c -o $(OBJ)MessageBox.o

$(OBJ)ReplaceDialog.o: $(OBJ)ReplaceDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ReplaceDialog.c -o $(OBJ)ReplaceDialog.o

$(OBJ)WindowList.o: $(OBJ)WindowList.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)WindowList.c -o $(OBJ)WindowList.o

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaDispatch.o: $(OBJ)CocoaDispatch.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CocoaDispatch.c -o $(OBJ)CocoaDispatch.o
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaEcereBridge.o: src/gui/drivers/cocoa/CocoaEcereBridge.m
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/cocoa/CocoaEcereBridge.m -o $(OBJ)CocoaEcereBridge.o
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)CocoaInterface.o: $(OBJ)CocoaInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CocoaInterface.c -o $(OBJ)CocoaInterface.o
endif

ifneq "$(OSX_TARGET)" ""
$(OBJ)EcereView.o: src/gui/drivers/cocoa/EcereView.m
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c src/gui/drivers/cocoa/EcereView.m -o $(OBJ)EcereView.o
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)NCursesInterface.o: $(OBJ)NCursesInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)NCursesInterface.c -o $(OBJ)NCursesInterface.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32Interface.o: $(OBJ)Win32Interface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32Interface.c -o $(OBJ)Win32Interface.o
endif

ifneq "$(WINDOWS_TARGET)" ""
$(OBJ)Win32ConsoleInterface.o: $(OBJ)Win32ConsoleInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32ConsoleInterface.c -o $(OBJ)Win32ConsoleInterface.o
endif

ifneq "$(or $(LINUX_TARGET),$(OSX_TARGET))" ""
$(OBJ)XInterface.o: $(OBJ)XInterface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)XInterface.c -o $(OBJ)XInterface.o
endif

$(OBJ)TVisionSkin.o: $(OBJ)TVisionSkin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)TVisionSkin.c -o $(OBJ)TVisionSkin.o

$(OBJ)WindowsSkin.o: $(OBJ)WindowsSkin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)WindowsSkin.c -o $(OBJ)WindowsSkin.o

$(OBJ)Anchor.o: $(OBJ)Anchor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Anchor.c -o $(OBJ)Anchor.o

$(OBJ)ClipBoard.o: $(OBJ)ClipBoard.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ClipBoard.c -o $(OBJ)ClipBoard.o

$(OBJ)Cursor.o: $(OBJ)Cursor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Cursor.c -o $(OBJ)Cursor.o

$(OBJ)Desktop3D.o: $(OBJ)Desktop3D.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Desktop3D.c -o $(OBJ)Desktop3D.o

$(OBJ)FormDesigner.o: $(OBJ)FormDesigner.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FormDesigner.c -o $(OBJ)FormDesigner.o

$(OBJ)GuiApplication.o: $(OBJ)GuiApplication.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GuiApplication.c -o $(OBJ)GuiApplication.o

$(OBJ)Interface.o: $(OBJ)Interface.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Interface.c -o $(OBJ)Interface.o

$(OBJ)Key.o: $(OBJ)Key.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Key.c -o $(OBJ)Key.o

$(OBJ)Skin.o: $(OBJ)Skin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Skin.c -o $(OBJ)Skin.o

$(OBJ)Timer.o: $(OBJ)Timer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Timer.c -o $(OBJ)Timer.o

$(OBJ)typeEdit.o: $(OBJ)typeEdit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)typeEdit.c -o $(OBJ)typeEdit.o

$(OBJ)Window.o: $(OBJ)Window.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Window.c -o $(OBJ)Window.o

$(OBJ)dcom.o: $(OBJ)dcom.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)dcom.c -o $(OBJ)dcom.o

$(OBJ)HTTPFile.o: $(OBJ)HTTPFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)HTTPFile.c -o $(OBJ)HTTPFile.o

$(OBJ)network.o: $(OBJ)network.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)network.c -o $(OBJ)network.o

$(OBJ)NetworkClientFile.o: $(OBJ)NetworkClientFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)NetworkClientFile.c -o $(OBJ)NetworkClientFile.o

$(OBJ)Service.o: $(OBJ)Service.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Service.c -o $(OBJ)Service.o

$(OBJ)Socket.o: $(OBJ)Socket.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Socket.c -o $(OBJ)Socket.o

$(OBJ)Array.o: $(OBJ)Array.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Array.c -o $(OBJ)Array.o

$(OBJ)AVLTree.o: $(OBJ)AVLTree.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)AVLTree.c -o $(OBJ)AVLTree.o

$(OBJ)BuiltInContainer.o: $(OBJ)BuiltInContainer.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BuiltInContainer.c -o $(OBJ)BuiltInContainer.o

$(OBJ)Container.o: $(OBJ)Container.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Container.c -o $(OBJ)Container.o

$(OBJ)CustomAVLTree.o: $(OBJ)CustomAVLTree.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CustomAVLTree.c -o $(OBJ)CustomAVLTree.o

$(OBJ)LinkList.o: $(OBJ)LinkList.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)LinkList.c -o $(OBJ)LinkList.o

$(OBJ)List.o: $(OBJ)List.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)List.c -o $(OBJ)List.o

$(OBJ)Map.o: $(OBJ)Map.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Map.c -o $(OBJ)Map.o

$(OBJ)BinaryTree.o: $(OBJ)BinaryTree.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BinaryTree.c -o $(OBJ)BinaryTree.o

$(OBJ)BTNode.o: $(OBJ)BTNode.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BTNode.c -o $(OBJ)BTNode.o

$(OBJ)dataTypes.o: $(OBJ)dataTypes.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)dataTypes.c -o $(OBJ)dataTypes.o

$(OBJ)instance.o: $(OBJ)instance.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)instance.c -o $(OBJ)instance.o

$(OBJ)String.o: $(OBJ)String.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)String.c -o $(OBJ)String.o

$(OBJ)OldList.o: $(OBJ)OldList.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)OldList.c -o $(OBJ)OldList.o

$(OBJ)instance.c.o: src/com/instance.c
	$(CC) $(CFLAGS) $(CUSTOM1_PRJ_CFLAGS) -c src/com/instance.c -o $(OBJ)instance.c.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

cleaneceretarget: objdir
	$(call rmq,$(TARGET))

cleantarget: objdir
	$(call rmq,$(TARGET))
	$(MAKE) -f Makefile.ecereCOM cleantarget
	$(MAKE) -f Makefile.vanilla cleantarget

clean: cleantarget
	$(call rmq,$(_OBJECTS))
	$(call rmq,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rmq,$(ECOBJECTS1))
	$(call rmq,$(ECOBJECTS2))
	$(call rmq,$(ECOBJECTS3))
	$(call rmq,$(COBJECTS1))
	$(call rmq,$(COBJECTS2))
	$(call rmq,$(COBJECTS3))
	$(call rmq,$(BOWLS1))
	$(call rmq,$(BOWLS2))
	$(call rmq,$(BOWLS3))
	$(call rmq,$(IMPORTS1))
	$(call rmq,$(IMPORTS2))
	$(call rmq,$(IMPORTS3))
	$(call rmq,$(SYMBOLS1))
	$(call rmq,$(SYMBOLS2))
	$(call rmq,$(SYMBOLS3))
	$(MAKE) -f Makefile.ecereCOM clean
	$(MAKE) -f Makefile.vanilla clean

realclean: cleantarget
	$(call rmrq,$(OBJ))
	$(MAKE) -f Makefile.ecereCOM realclean
	$(MAKE) -f Makefile.vanilla realclean

distclean: cleantarget
	$(call rmrq,obj/)
