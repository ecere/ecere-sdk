.PHONY: objdir clean cleantarget realclean distclean nores

# CONTENT

MODULE := ecere
CONFIG := release
COMPILER := default
TARGET_TYPE = sharedlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = res/

# CROSS-PLATFORM MAGIC

include ../include.mk

ifdef LINUX
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)$(MODULE)$(SO).0.44
SONAME = -Wl,-soname,libecere.so.0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)$(MODULE)$(SO)
SONAME =
endif

OBJECTS = $(OBJECTS1) $(OBJECTS2) $(OBJECTS3) $(OBJECTS4)
OBJECTS1 = \
	$(OBJ)Archive.o \
	$(OBJ)BufferedFile.o \
	$(OBJ)Date.o \
	$(OBJ)DualPipe.o \
	$(OBJ)EARArchive.o \
	$(OBJ)File.o \
	$(OBJ)FileMonitor.o \
	$(OBJ)GlobalAppSettings.o \
	$(OBJ)JSON.o \
	$(OBJ)JSONGlobalSettings.o \
	$(OBJ)memory.o \
	$(OBJ)Mutex.o \
	$(OBJ)Semaphore.o \
	$(OBJ)System.o \
	$(OBJ)TempFile.o \
	$(OBJ)Thread.o \
	$(OBJ)Time.o \
	$(OBJ)unicode.o \
	$(OBJ)units.o \
	$(OBJ)File.c.o \
	$(OBJ)DualPipe.c.o \
	$(OBJ)System.c.o \
	$(OBJ)i18n.o \
	$(OBJ)Cube.o \
	$(OBJ)SkyBox.o \
	$(OBJ)Sphere.o \
	$(OBJ)Object3DSFormat.o \
	$(OBJ)Camera.o \
	$(OBJ)Matrix.o \
	$(OBJ)Mesh.o \
	$(OBJ)Object.o \
	$(OBJ)Plane.o \
	$(OBJ)Quaternion.o \
	$(OBJ)Vector3D.o \
	$(OBJ)BMPFormat.o \
	$(OBJ)GIFFormat.o \
	$(OBJ)JPEGFormat.o \
	$(OBJ)PCXFormat.o \
	$(OBJ)PNGFormat.o \
	$(OBJ)RGBFormat.o \
	$(OBJ)harfbuzz-freetype.o \
	$(OBJ)harfbuzz-unicode-tables.o \
	$(OBJ)harfbuzz-unicode.o \
	$(OBJ)harfbuzz-arabic.o \
	$(OBJ)harfbuzz-buffer.o \
	$(OBJ)harfbuzz-gdef.o \
	$(OBJ)harfbuzz-gpos.o \
	$(OBJ)harfbuzz-gsub.o \
	$(OBJ)harfbuzz-hangul.o
OBJECTS2 = \
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
	$(if $(WINDOWS),$(OBJ)Direct3D8DisplayDriver.o,) \
	$(if $(WINDOWS),$(OBJ)Direct3D9DisplayDriver.o,) \
	$(if $(WINDOWS),$(OBJ)DirectDrawDisplayDriver.o,) \
	$(if $(WINDOWS),$(OBJ)GDIDisplayDriver.o,) \
	$(OBJ)lfbBlit.o \
	$(OBJ)lfbConvert.o \
	$(OBJ)LFBDisplayDriver.o \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesDisplayDriver.o,) \
	$(OBJ)OpenGLDisplayDriver.o \
	$(if $(WINDOWS),$(OBJ)Win32BitmapPrinterDisplayDriver.o,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleDisplayDriver.o,) \
	$(if $(WINDOWS),$(OBJ)Win32PrinterDisplayDriver.o,) \
	$(if $(LINUX),$(OBJ)XDisplayDriver.o,) \
	$(OBJ)Bitmap.o \
	$(OBJ)BitmapResource.o \
	$(OBJ)Color.o \
	$(OBJ)Display.o \
	$(OBJ)DisplaySystem.o \
	$(OBJ)FontResource.o \
	$(OBJ)Resource.o \
	$(OBJ)Surface.o \
	$(OBJ)Button.o \
	$(OBJ)CalendarControl.o \
	$(OBJ)DataBox.o \
	$(OBJ)DropBox.o \
	$(OBJ)EditBox.o \
	$(OBJ)Label.o
OBJECTS3 = \
	$(OBJ)ListBox.o \
	$(OBJ)Menu.o \
	$(OBJ)Picture.o \
	$(OBJ)ProgressBar.o \
	$(OBJ)ScrollBar.o \
	$(OBJ)StatusBar.o \
	$(OBJ)TabControl.o \
	$(OBJ)PaneSplitter.o \
	$(OBJ)Stacker.o \
	$(OBJ)PathBox.o \
	$(OBJ)ColorPicker.o \
	$(OBJ)FileDialog.o \
	$(OBJ)FindDialog.o \
	$(OBJ)GoToDialog.o \
	$(OBJ)MessageBox.o \
	$(OBJ)ReplaceDialog.o \
	$(OBJ)WindowList.o \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesInterface.o,) \
	$(if $(WINDOWS),$(OBJ)Win32Interface.o,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleInterface.o,) \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)XInterface.o,) \
	$(OBJ)TVisionSkin.o \
	$(OBJ)WindowsSkin.o \
	$(OBJ)Anchor.o \
	$(OBJ)ClipBoard.o \
	$(OBJ)Cursor.o \
	$(OBJ)Desktop3D.o \
	$(OBJ)FormDesigner.o \
	$(OBJ)GuiApplication.o \
	$(OBJ)Interface.o \
	$(OBJ)Key.o \
	$(OBJ)Skin.o \
	$(OBJ)Timer.o \
	$(OBJ)typeEdit.o \
	$(OBJ)Window.o \
	$(OBJ)dcom.o \
	$(OBJ)HTTPFile.o \
	$(OBJ)network.o \
	$(OBJ)NetworkClientFile.o \
	$(OBJ)Service.o \
	$(OBJ)Socket.o \
	$(OBJ)Array.o \
	$(OBJ)AVLTree.o \
	$(OBJ)BuiltInContainer.o \
	$(OBJ)Container.o
OBJECTS4 = \
	$(OBJ)CustomAVLTree.o \
	$(OBJ)LinkList.o \
	$(OBJ)List.o \
	$(OBJ)Map.o \
	$(OBJ)BinaryTree.o \
	$(OBJ)BTNode.o \
	$(OBJ)dataTypes.o \
	$(OBJ)instance.o \
	$(OBJ)String.o \
	$(OBJ)OldList.o \
	$(OBJ)instance.c.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = $(COBJECTS1) $(COBJECTS2) $(COBJECTS3)
COBJECTS1 = \
	$(OBJ)Archive.c \
	$(OBJ)BufferedFile.c \
	$(OBJ)Date.c \
	$(OBJ)DualPipe.c \
	$(OBJ)EARArchive.c \
	$(OBJ)File.c \
	$(OBJ)FileMonitor.c \
	$(OBJ)GlobalAppSettings.c \
	$(OBJ)JSON.c \
	$(OBJ)JSONGlobalSettings.c \
	$(OBJ)memory.c \
	$(OBJ)Mutex.c \
	$(OBJ)Semaphore.c \
	$(OBJ)System.c \
	$(OBJ)TempFile.c \
	$(OBJ)Thread.c \
	$(OBJ)Time.c \
	$(OBJ)unicode.c \
	$(OBJ)units.c \
	$(OBJ)i18n.c \
	$(OBJ)Cube.c \
	$(OBJ)SkyBox.c \
	$(OBJ)Sphere.c \
	$(OBJ)Object3DSFormat.c \
	$(OBJ)Camera.c \
	$(OBJ)Matrix.c \
	$(OBJ)Mesh.c \
	$(OBJ)Object.c \
	$(OBJ)Plane.c \
	$(OBJ)Quaternion.c \
	$(OBJ)Vector3D.c \
	$(OBJ)BMPFormat.c \
	$(OBJ)GIFFormat.c \
	$(OBJ)JPEGFormat.c \
	$(OBJ)PCXFormat.c \
	$(OBJ)PNGFormat.c \
	$(OBJ)RGBFormat.c \
	$(if $(WINDOWS),$(OBJ)Direct3D8DisplayDriver.c,) \
	$(if $(WINDOWS),$(OBJ)Direct3D9DisplayDriver.c,) \
	$(if $(WINDOWS),$(OBJ)DirectDrawDisplayDriver.c,) \
	$(if $(WINDOWS),$(OBJ)GDIDisplayDriver.c,) \
	$(OBJ)lfbBlit.c \
	$(OBJ)lfbConvert.c \
	$(OBJ)LFBDisplayDriver.c \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesDisplayDriver.c,)
COBJECTS2 = \
	$(OBJ)OpenGLDisplayDriver.c \
	$(if $(WINDOWS),$(OBJ)Win32BitmapPrinterDisplayDriver.c,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleDisplayDriver.c,) \
	$(if $(WINDOWS),$(OBJ)Win32PrinterDisplayDriver.c,) \
	$(if $(LINUX),$(OBJ)XDisplayDriver.c,) \
	$(OBJ)Bitmap.c \
	$(OBJ)BitmapResource.c \
	$(OBJ)Color.c \
	$(OBJ)Display.c \
	$(OBJ)DisplaySystem.c \
	$(OBJ)FontResource.c \
	$(OBJ)Resource.c \
	$(OBJ)Surface.c \
	$(OBJ)Button.c \
	$(OBJ)CalendarControl.c \
	$(OBJ)DataBox.c \
	$(OBJ)DropBox.c \
	$(OBJ)EditBox.c \
	$(OBJ)Label.c \
	$(OBJ)ListBox.c \
	$(OBJ)Menu.c \
	$(OBJ)Picture.c \
	$(OBJ)ProgressBar.c \
	$(OBJ)ScrollBar.c \
	$(OBJ)StatusBar.c \
	$(OBJ)TabControl.c \
	$(OBJ)PaneSplitter.c \
	$(OBJ)Stacker.c \
	$(OBJ)PathBox.c \
	$(OBJ)ColorPicker.c \
	$(OBJ)FileDialog.c \
	$(OBJ)FindDialog.c \
	$(OBJ)GoToDialog.c \
	$(OBJ)MessageBox.c \
	$(OBJ)ReplaceDialog.c \
	$(OBJ)WindowList.c \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesInterface.c,) \
	$(if $(WINDOWS),$(OBJ)Win32Interface.c,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleInterface.c,) \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)XInterface.c,)
COBJECTS3 = \
	$(OBJ)TVisionSkin.c \
	$(OBJ)WindowsSkin.c \
	$(OBJ)Anchor.c \
	$(OBJ)ClipBoard.c \
	$(OBJ)Cursor.c \
	$(OBJ)Desktop3D.c \
	$(OBJ)FormDesigner.c \
	$(OBJ)GuiApplication.c \
	$(OBJ)Interface.c \
	$(OBJ)Key.c \
	$(OBJ)Skin.c \
	$(OBJ)Timer.c \
	$(OBJ)typeEdit.c \
	$(OBJ)Window.c \
	$(OBJ)dcom.c \
	$(OBJ)HTTPFile.c \
	$(OBJ)network.c \
	$(OBJ)NetworkClientFile.c \
	$(OBJ)Service.c \
	$(OBJ)Socket.c \
	$(OBJ)Array.c \
	$(OBJ)AVLTree.c \
	$(OBJ)BuiltInContainer.c \
	$(OBJ)Container.c \
	$(OBJ)CustomAVLTree.c \
	$(OBJ)LinkList.c \
	$(OBJ)List.c \
	$(OBJ)Map.c \
	$(OBJ)BinaryTree.c \
	$(OBJ)BTNode.c \
	$(OBJ)dataTypes.c \
	$(OBJ)instance.c \
	$(OBJ)String.c \
	$(OBJ)OldList.c

SYMBOLS = $(SYMBOLS1) $(SYMBOLS2) $(SYMBOLS3)
SYMBOLS1 = \
	$(OBJ)Archive.sym \
	$(OBJ)BufferedFile.sym \
	$(OBJ)Date.sym \
	$(OBJ)DualPipe.sym \
	$(OBJ)EARArchive.sym \
	$(OBJ)File.sym \
	$(OBJ)FileMonitor.sym \
	$(OBJ)GlobalAppSettings.sym \
	$(OBJ)JSON.sym \
	$(OBJ)JSONGlobalSettings.sym \
	$(OBJ)memory.sym \
	$(OBJ)Mutex.sym \
	$(OBJ)Semaphore.sym \
	$(OBJ)System.sym \
	$(OBJ)TempFile.sym \
	$(OBJ)Thread.sym \
	$(OBJ)Time.sym \
	$(OBJ)unicode.sym \
	$(OBJ)units.sym \
	$(OBJ)i18n.sym \
	$(OBJ)Cube.sym \
	$(OBJ)SkyBox.sym \
	$(OBJ)Sphere.sym \
	$(OBJ)Object3DSFormat.sym \
	$(OBJ)Camera.sym \
	$(OBJ)Matrix.sym \
	$(OBJ)Mesh.sym \
	$(OBJ)Object.sym \
	$(OBJ)Plane.sym \
	$(OBJ)Quaternion.sym \
	$(OBJ)Vector3D.sym \
	$(OBJ)BMPFormat.sym \
	$(OBJ)GIFFormat.sym \
	$(OBJ)JPEGFormat.sym \
	$(OBJ)PCXFormat.sym \
	$(OBJ)PNGFormat.sym \
	$(OBJ)RGBFormat.sym \
	$(if $(WINDOWS),$(OBJ)Direct3D8DisplayDriver.sym,) \
	$(if $(WINDOWS),$(OBJ)Direct3D9DisplayDriver.sym,) \
	$(if $(WINDOWS),$(OBJ)DirectDrawDisplayDriver.sym,) \
	$(if $(WINDOWS),$(OBJ)GDIDisplayDriver.sym,) \
	$(OBJ)lfbBlit.sym \
	$(OBJ)lfbConvert.sym \
	$(OBJ)LFBDisplayDriver.sym
SYMBOLS2 = \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesDisplayDriver.sym,) \
	$(OBJ)OpenGLDisplayDriver.sym \
	$(if $(WINDOWS),$(OBJ)Win32BitmapPrinterDisplayDriver.sym,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleDisplayDriver.sym,) \
	$(if $(WINDOWS),$(OBJ)Win32PrinterDisplayDriver.sym,) \
	$(if $(LINUX),$(OBJ)XDisplayDriver.sym,) \
	$(OBJ)Bitmap.sym \
	$(OBJ)BitmapResource.sym \
	$(OBJ)Color.sym \
	$(OBJ)Display.sym \
	$(OBJ)DisplaySystem.sym \
	$(OBJ)FontResource.sym \
	$(OBJ)Resource.sym \
	$(OBJ)Surface.sym \
	$(OBJ)Button.sym \
	$(OBJ)CalendarControl.sym \
	$(OBJ)DataBox.sym \
	$(OBJ)DropBox.sym \
	$(OBJ)EditBox.sym \
	$(OBJ)Label.sym \
	$(OBJ)ListBox.sym \
	$(OBJ)Menu.sym \
	$(OBJ)Picture.sym \
	$(OBJ)ProgressBar.sym \
	$(OBJ)ScrollBar.sym \
	$(OBJ)StatusBar.sym \
	$(OBJ)TabControl.sym \
	$(OBJ)PaneSplitter.sym \
	$(OBJ)Stacker.sym \
	$(OBJ)PathBox.sym \
	$(OBJ)ColorPicker.sym \
	$(OBJ)FileDialog.sym \
	$(OBJ)FindDialog.sym \
	$(OBJ)GoToDialog.sym \
	$(OBJ)MessageBox.sym \
	$(OBJ)ReplaceDialog.sym \
	$(OBJ)WindowList.sym
SYMBOLS3 = \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesInterface.sym,) \
	$(if $(WINDOWS),$(OBJ)Win32Interface.sym,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleInterface.sym,) \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)XInterface.sym,) \
	$(OBJ)TVisionSkin.sym \
	$(OBJ)WindowsSkin.sym \
	$(OBJ)Anchor.sym \
	$(OBJ)ClipBoard.sym \
	$(OBJ)Cursor.sym \
	$(OBJ)Desktop3D.sym \
	$(OBJ)FormDesigner.sym \
	$(OBJ)GuiApplication.sym \
	$(OBJ)Interface.sym \
	$(OBJ)Key.sym \
	$(OBJ)Skin.sym \
	$(OBJ)Timer.sym \
	$(OBJ)typeEdit.sym \
	$(OBJ)Window.sym \
	$(OBJ)dcom.sym \
	$(OBJ)HTTPFile.sym \
	$(OBJ)network.sym \
	$(OBJ)NetworkClientFile.sym \
	$(OBJ)Service.sym \
	$(OBJ)Socket.sym \
	$(OBJ)Array.sym \
	$(OBJ)AVLTree.sym \
	$(OBJ)BuiltInContainer.sym \
	$(OBJ)Container.sym \
	$(OBJ)CustomAVLTree.sym \
	$(OBJ)LinkList.sym \
	$(OBJ)List.sym \
	$(OBJ)Map.sym \
	$(OBJ)BinaryTree.sym \
	$(OBJ)BTNode.sym \
	$(OBJ)dataTypes.sym \
	$(OBJ)instance.sym \
	$(OBJ)String.sym \
	$(OBJ)OldList.sym

IMPORTS = $(IMPORTS1) $(IMPORTS2) $(IMPORTS3)
IMPORTS1 = \
	$(OBJ)Archive.imp \
	$(OBJ)BufferedFile.imp \
	$(OBJ)Date.imp \
	$(OBJ)DualPipe.imp \
	$(OBJ)EARArchive.imp \
	$(OBJ)File.imp \
	$(OBJ)FileMonitor.imp \
	$(OBJ)GlobalAppSettings.imp \
	$(OBJ)JSON.imp \
	$(OBJ)JSONGlobalSettings.imp \
	$(OBJ)memory.imp \
	$(OBJ)Mutex.imp \
	$(OBJ)Semaphore.imp \
	$(OBJ)System.imp \
	$(OBJ)TempFile.imp \
	$(OBJ)Thread.imp \
	$(OBJ)Time.imp \
	$(OBJ)unicode.imp \
	$(OBJ)units.imp \
	$(OBJ)i18n.imp \
	$(OBJ)Cube.imp \
	$(OBJ)SkyBox.imp \
	$(OBJ)Sphere.imp \
	$(OBJ)Object3DSFormat.imp \
	$(OBJ)Camera.imp \
	$(OBJ)Matrix.imp \
	$(OBJ)Mesh.imp \
	$(OBJ)Object.imp \
	$(OBJ)Plane.imp \
	$(OBJ)Quaternion.imp \
	$(OBJ)Vector3D.imp \
	$(OBJ)BMPFormat.imp \
	$(OBJ)GIFFormat.imp \
	$(OBJ)JPEGFormat.imp \
	$(OBJ)PCXFormat.imp \
	$(OBJ)PNGFormat.imp \
	$(OBJ)RGBFormat.imp \
	$(if $(WINDOWS),$(OBJ)Direct3D8DisplayDriver.imp,) \
	$(if $(WINDOWS),$(OBJ)Direct3D9DisplayDriver.imp,) \
	$(if $(WINDOWS),$(OBJ)DirectDrawDisplayDriver.imp,) \
	$(if $(WINDOWS),$(OBJ)GDIDisplayDriver.imp,) \
	$(OBJ)lfbBlit.imp \
	$(OBJ)lfbConvert.imp \
	$(OBJ)LFBDisplayDriver.imp
IMPORTS2 = \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesDisplayDriver.imp,) \
	$(OBJ)OpenGLDisplayDriver.imp \
	$(if $(WINDOWS),$(OBJ)Win32BitmapPrinterDisplayDriver.imp,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleDisplayDriver.imp,) \
	$(if $(WINDOWS),$(OBJ)Win32PrinterDisplayDriver.imp,) \
	$(if $(LINUX),$(OBJ)XDisplayDriver.imp,) \
	$(OBJ)Bitmap.imp \
	$(OBJ)BitmapResource.imp \
	$(OBJ)Color.imp \
	$(OBJ)Display.imp \
	$(OBJ)DisplaySystem.imp \
	$(OBJ)FontResource.imp \
	$(OBJ)Resource.imp \
	$(OBJ)Surface.imp \
	$(OBJ)Button.imp \
	$(OBJ)CalendarControl.imp \
	$(OBJ)DataBox.imp \
	$(OBJ)DropBox.imp \
	$(OBJ)EditBox.imp \
	$(OBJ)Label.imp \
	$(OBJ)ListBox.imp \
	$(OBJ)Menu.imp \
	$(OBJ)Picture.imp \
	$(OBJ)ProgressBar.imp \
	$(OBJ)ScrollBar.imp \
	$(OBJ)StatusBar.imp \
	$(OBJ)TabControl.imp \
	$(OBJ)PaneSplitter.imp \
	$(OBJ)Stacker.imp \
	$(OBJ)PathBox.imp \
	$(OBJ)ColorPicker.imp \
	$(OBJ)FileDialog.imp \
	$(OBJ)FindDialog.imp \
	$(OBJ)GoToDialog.imp \
	$(OBJ)MessageBox.imp \
	$(OBJ)ReplaceDialog.imp \
	$(OBJ)WindowList.imp
IMPORTS3 = \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)NCursesInterface.imp,) \
	$(if $(WINDOWS),$(OBJ)Win32Interface.imp,) \
	$(if $(WINDOWS),$(OBJ)Win32ConsoleInterface.imp,) \
	$(if $(or $(LINUX),$(OSX)),$(OBJ)XInterface.imp,) \
	$(OBJ)TVisionSkin.imp \
	$(OBJ)WindowsSkin.imp \
	$(OBJ)Anchor.imp \
	$(OBJ)ClipBoard.imp \
	$(OBJ)Cursor.imp \
	$(OBJ)Desktop3D.imp \
	$(OBJ)FormDesigner.imp \
	$(OBJ)GuiApplication.imp \
	$(OBJ)Interface.imp \
	$(OBJ)Key.imp \
	$(OBJ)Skin.imp \
	$(OBJ)Timer.imp \
	$(OBJ)typeEdit.imp \
	$(OBJ)Window.imp \
	$(OBJ)dcom.imp \
	$(OBJ)HTTPFile.imp \
	$(OBJ)network.imp \
	$(OBJ)NetworkClientFile.imp \
	$(OBJ)Service.imp \
	$(OBJ)Socket.imp \
	$(OBJ)Array.imp \
	$(OBJ)AVLTree.imp \
	$(OBJ)BuiltInContainer.imp \
	$(OBJ)Container.imp \
	$(OBJ)CustomAVLTree.imp \
	$(OBJ)LinkList.imp \
	$(OBJ)List.imp \
	$(OBJ)Map.imp \
	$(OBJ)BinaryTree.imp \
	$(OBJ)BTNode.imp \
	$(OBJ)dataTypes.imp \
	$(OBJ)instance.imp \
	$(OBJ)String.imp \
	$(OBJ)OldList.imp

SOURCES = $(SOURCES1) $(SOURCES2) $(SOURCES3) $(SOURCES4)
SOURCES1 = \
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
	src/sys/File.c \
	src/sys/DualPipe.c \
	src/sys/System.c \
	src/sys/i18n.ec \
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
	src/gfx/drivers/harfbuzz/harfbuzz-indic.c
SOURCES2 = \
	src/gfx/drivers/harfbuzz/harfbuzz-khmer.c \
	src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c \
	src/gfx/drivers/harfbuzz/harfbuzz-open.c \
	src/gfx/drivers/harfbuzz/harfbuzz-shaper.c \
	src/gfx/drivers/harfbuzz/harfbuzz-stream.c \
	src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c \
	src/gfx/drivers/harfbuzz/harfbuzz-impl.c \
	src/gfx/drivers/harfbuzz/harfbuzz-thai.c \
	$(if $(WINDOWS),src/gfx/drivers/Direct3D8DisplayDriver.ec,) \
	$(if $(WINDOWS),src/gfx/drivers/Direct3D9DisplayDriver.ec,) \
	$(if $(WINDOWS),src/gfx/drivers/DirectDrawDisplayDriver.ec,) \
	$(if $(WINDOWS),src/gfx/drivers/GDIDisplayDriver.ec,) \
	src/gfx/drivers/lfbBlit.ec \
	src/gfx/drivers/lfbConvert.ec \
	src/gfx/drivers/LFBDisplayDriver.ec \
	$(if $(or $(LINUX),$(OSX)),src/gfx/drivers/NCursesDisplayDriver.ec,) \
	src/gfx/drivers/OpenGLDisplayDriver.ec \
	$(if $(WINDOWS),src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec,) \
	$(if $(WINDOWS),src/gfx/drivers/Win32ConsoleDisplayDriver.ec,) \
	$(if $(WINDOWS),src/gfx/drivers/Win32PrinterDisplayDriver.ec,) \
	$(if $(LINUX),src/gfx/drivers/XDisplayDriver.ec,) \
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
	src/gui/controls/Menu.ec
SOURCES3 = \
	src/gui/controls/Picture.ec \
	src/gui/controls/ProgressBar.ec \
	src/gui/controls/ScrollBar.ec \
	src/gui/controls/StatusBar.ec \
	src/gui/controls/TabControl.ec \
	src/gui/controls/PaneSplitter.ec \
	src/gui/controls/Stacker.ec \
	src/gui/controls/PathBox.ec \
	src/gui/dialogs/ColorPicker.ec \
	src/gui/dialogs/FileDialog.ec \
	src/gui/dialogs/FindDialog.ec \
	src/gui/dialogs/GoToDialog.ec \
	src/gui/dialogs/MessageBox.ec \
	src/gui/dialogs/ReplaceDialog.ec \
	src/gui/dialogs/WindowList.ec \
	$(if $(or $(LINUX),$(OSX)),src/gui/drivers/NCursesInterface.ec,) \
	$(if $(WINDOWS),src/gui/drivers/Win32Interface.ec,) \
	$(if $(WINDOWS),src/gui/drivers/Win32ConsoleInterface.ec,) \
	$(if $(or $(LINUX),$(OSX)),src/gui/drivers/XInterface.ec,) \
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
	src/com/BTNode.ec
SOURCES4 = \
	src/com/dataTypes.ec \
	src/com/instance.ec \
	src/com/String.ec \
	src/com/OldList.ec \
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
	$(RES)cursors/sizeNortWestSouthEast.png \
	$(RES)devices/computer.png \
	$(RES)devices/driveHardDisk.png
RESOURCES2 = \
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
	$(RES)mimeTypes/textHyperTextMarkup.png \
	$(RES)mimeTypes/brokenFile.png \
	$(RES)places/driveRemote.png
RESOURCES3 = \
	$(RES)places/folder.png \
	$(RES)places/folderRemote.png \
	$(RES)places/networkServer.png \
	$(RES)places/networkWorkgroup.png \
	$(RES)places/brokenFolder.png \
	$(RES)status/audioVolumeHigh.png \
	$(RES)status/folderOpen.png \
	$(RES)unicode/derivedGeneralCategoryStripped.txt \
	locale/zh_CN/LC_MESSAGES/ecere.mo


# TOOLCHAIN
export LD_LIBRARY_PATH=../obj/$(PLATFORM)/lib
export DYLD_LIBRARY_PATH=../obj/$(PLATFORM)/lib
ECP := $(call psep,../compiler/bootstrap/obj/bin.$(PLATFORM)/ecp$(E))
ECC := $(call psep,../compiler/bootstrap/obj/bin.$(PLATFORM)/ecc$(E))
ECS := $(call psep,../compiler/bootstrap/obj/bin.$(PLATFORM)/ecs$(E))
EAR := $(call psep,../obj/$(PLATFORM)/bin/ear)

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w \
	 -DBUILDING_ECERE_COM \
	 -Isrc/gfx/drivers/harfbuzz

CECFLAGS =

ECFLAGS = -nolinenumbers -defaultns ecere

OFLAGS = -m32

LIBS = -ljpeg -lpng -lz -lfreetype $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS

CFLAGS += \
	 -isystem ../deps/glext \
	 -I../deps/DirectX-9.0/include \
	 -I../deps/jpeg-6b \
	 -I../deps/libpng-1.4.0 \
	 -I../deps/libungif-4.1.1/lib \
	 -I../deps/zlib \
	 -I../deps/freetype-2.3.12/include

OFLAGS += \
	 -L../deps/zlib/obj/release.$(PLATFORM) \
	 -L../deps/jpeg-6b/obj/release.$(PLATFORM) \
	 -L../deps/libpng-1.4.0/obj/release.$(PLATFORM) \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM) \
	 -L../deps/freetype-2.3.12/obj/release.$(PLATFORM)

LIBS += -ldxguid -lddraw -ldinput -lwinmm -lopengl32 -lws2_32 -lkernel32 -luser32 -lgdi32 -lmpr -ladvapi32 -lshell32 -lwinspool -limm32 -lungif

else
ifdef LINUX

CFLAGS += \
	 -I/usr/include/freetype2 \
	 -I../deps/libungif-4.1.1/lib

OFLAGS += \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM) \
	 -L/usr/X11R6/lib

LIBS += -lncurses -lpthread -lm -ldl -lfontconfig -lungif -lX11 -lXext -lXrender -lGL

else
ifdef OSX

CFLAGS += \
	 -I/usr/include/freetype2 \
	 -I/usr/X11R6/include/freetype2 \
	 -I/usr/X11R6/include \
	 -I../deps/jpeg-6b \
	 -I../deps/libpng-1.4.0 \
	 -I../deps/libungif-4.1.1/lib

OFLAGS += \
	 -L/usr/X11R6/lib \
	 -L../deps/jpeg-6b/obj/release.$(PLATFORM) \
	 -L../deps/libpng-1.4.0/obj/release.$(PLATFORM) \
	 -L../deps/libungif-4.1.1/obj/release.$(PLATFORM)

LIBS += -lcurses -lpthread -lm -ldl -lfontconfig -lungif -lX11 -lXext -lXrender -lGL

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

nores: $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
ifdef WINDOWS
	$(call cpq,$(TARGET),../compiler/bootstrap/obj/bin.$(PLATFORM)/)
endif
	$(call cpq,$(TARGET),../$(SODESTDIR))
ifdef LINUX
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(SONAME) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(EAR) awq $(TARGET) $(RES)actions/editFind.png $(RES)actions/folderNew.png $(RES)actions/goDown.png $(RES)actions/goHome.png $(RES)actions/goNext.png $(RES)actions/goPrevious.png $(RES)actions/goUp.png $(RES)actions/listAdd.png $(RES)actions/listRemove.png $(RES)actions/viewRefresh.png "actions"
	$(EAR) awq $(TARGET) $(RES)actions/windowNew.png "actions"
	$(EAR) awq $(TARGET) $(RES)constructs/class.png $(RES)constructs/data.png $(RES)constructs/dataPrivate.png $(RES)constructs/dataType.png $(RES)constructs/enum.png $(RES)constructs/enumValue.png $(RES)constructs/event.png $(RES)constructs/library.png $(RES)constructs/method.png $(RES)constructs/methodPrivate.png "constructs"
	$(EAR) awq $(TARGET) $(RES)constructs/namespace.png $(RES)constructs/property.png $(RES)constructs/propertyPrivate.png "constructs"
	$(EAR) awq $(TARGET) $(RES)controls/button.png $(RES)controls/calendar.png $(RES)controls/checkBox.png $(RES)controls/dataBox.png $(RES)controls/dropBox.png $(RES)controls/editBox.png $(RES)controls/groupBox.png $(RES)controls/label.png $(RES)controls/listBox.png $(RES)controls/menu.png "controls"
	$(EAR) awq $(TARGET) $(RES)controls/optionBox.png $(RES)controls/progressBar.png $(RES)controls/scrollBarHorizontal.png $(RES)controls/scrollBarVertical.png $(RES)controls/statusBar.png "controls"
	$(EAR) awq $(TARGET) $(RES)cursors/arrow.png $(RES)cursors/cross.png $(RES)cursors/iBeam.png $(RES)cursors/move.png $(RES)cursors/sizeEastWest.png $(RES)cursors/sizeNortEastSouthWest.png $(RES)cursors/sizeNorthSouth.png $(RES)cursors/sizeNortWestSouthEast.png "cursors"
	$(EAR) awq $(TARGET) $(RES)devices/computer.png $(RES)devices/driveHardDisk.png $(RES)devices/driveRemovableMedia.png $(RES)devices/mediaFloppy.png $(RES)devices/mediaOptical.png "devices"
	$(EAR) awq $(TARGET) $(RES)elements/areaClose.png $(RES)elements/areaMaximize.png $(RES)elements/areaMinimize.png $(RES)elements/areaRestore.png $(RES)elements/arrowDown.png $(RES)elements/arrowLeft.png $(RES)elements/arrowRight.png $(RES)elements/arrowUp.png $(RES)elements/checkBoxChecked.png $(RES)elements/checkBoxDisabled.png "elements"
	$(EAR) awq $(TARGET) $(RES)elements/checkBoxDisabledChecked.png $(RES)elements/checkBox.png $(RES)elements/optionBoxDisabled.png $(RES)elements/optionBoxDisabledSelected.png $(RES)elements/optionBoxDown.png $(RES)elements/optionBoxSelectedDown.png $(RES)elements/optionBoxSelectedUp.png $(RES)elements/optionBoxUp.png $(RES)elements/orderAscending.png $(RES)elements/orderCategorized.png "elements"
	$(EAR) awq $(TARGET) $(RES)elements/orderDescending.png "elements"
	$(EAR) awq $(TARGET) $(RES)emblems/unreadable.png "emblems"
	$(EAR) awq $(TARGET) $(RES)mimeTypes/file.png $(RES)mimeTypes/image.png $(RES)mimeTypes/package.png $(RES)mimeTypes/packageOpticalDisc.png $(RES)mimeTypes/packageSoftware.png $(RES)mimeTypes/text.png $(RES)mimeTypes/textCHeader.png $(RES)mimeTypes/textCSource.png $(RES)mimeTypes/textC++Header.png $(RES)mimeTypes/textC++Source.png "mimeTypes"
	$(EAR) awq $(TARGET) $(RES)mimeTypes/textEcereHeader.png $(RES)mimeTypes/textEcereProject.png $(RES)mimeTypes/textEcereSource.png $(RES)mimeTypes/textEcereWorkspace.png $(RES)mimeTypes/textHyperTextMarkup.png $(RES)mimeTypes/brokenFile.png "mimeTypes"
	$(EAR) awq $(TARGET) $(RES)places/driveRemote.png $(RES)places/folder.png $(RES)places/folderRemote.png $(RES)places/networkServer.png $(RES)places/networkWorkgroup.png $(RES)places/brokenFolder.png "places"
	$(EAR) awq $(TARGET) $(RES)status/audioVolumeHigh.png $(RES)status/folderOpen.png "status"
	$(EAR) awq $(TARGET) $(RES)unicode/derivedGeneralCategoryStripped.txt "unicode"
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/ecere.mo "locale/zh_CN/LC_MESSAGES"
	$(call cpq,$(TARGET),../$(SODESTDIR))
ifdef LINUX
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

# SYMBOL RULES

$(OBJ)Archive.sym: src/sys/Archive.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/Archive.ec -o $(OBJ)Archive.sym

$(OBJ)BufferedFile.sym: src/sys/BufferedFile.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/BufferedFile.ec -o $(OBJ)BufferedFile.sym

$(OBJ)Date.sym: src/sys/Date.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/Date.ec -o $(OBJ)Date.sym

$(OBJ)DualPipe.sym: src/sys/DualPipe.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/DualPipe.ec -o $(OBJ)DualPipe.sym

$(OBJ)EARArchive.sym: src/sys/EARArchive.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/EARArchive.ec -o $(OBJ)EARArchive.sym

$(OBJ)File.sym: src/sys/File.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/File.ec -o $(OBJ)File.sym

$(OBJ)FileMonitor.sym: src/sys/FileMonitor.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/FileMonitor.ec -o $(OBJ)FileMonitor.sym

$(OBJ)GlobalAppSettings.sym: src/sys/GlobalAppSettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/GlobalAppSettings.ec -o $(OBJ)GlobalAppSettings.sym

$(OBJ)JSON.sym: src/sys/JSON.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/JSON.ec -o $(OBJ)JSON.sym

$(OBJ)JSONGlobalSettings.sym: src/sys/JSONGlobalSettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/JSONGlobalSettings.ec -o $(OBJ)JSONGlobalSettings.sym

$(OBJ)memory.sym: src/sys/memory.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/memory.ec -o $(OBJ)memory.sym

$(OBJ)Mutex.sym: src/sys/Mutex.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/Mutex.ec -o $(OBJ)Mutex.sym

$(OBJ)Semaphore.sym: src/sys/Semaphore.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/Semaphore.ec -o $(OBJ)Semaphore.sym

$(OBJ)System.sym: src/sys/System.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/System.ec -o $(OBJ)System.sym

$(OBJ)TempFile.sym: src/sys/TempFile.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/TempFile.ec -o $(OBJ)TempFile.sym

$(OBJ)Thread.sym: src/sys/Thread.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/Thread.ec -o $(OBJ)Thread.sym

$(OBJ)Time.sym: src/sys/Time.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/Time.ec -o $(OBJ)Time.sym

$(OBJ)unicode.sym: src/sys/unicode.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/unicode.ec -o $(OBJ)unicode.sym

$(OBJ)units.sym: src/sys/units.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/units.ec -o $(OBJ)units.sym

$(OBJ)i18n.sym: src/sys/i18n.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/sys/i18n.ec -o $(OBJ)i18n.sym

$(OBJ)Cube.sym: src/gfx/3D/meshes/Cube.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/meshes/Cube.ec -o $(OBJ)Cube.sym

$(OBJ)SkyBox.sym: src/gfx/3D/meshes/SkyBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/meshes/SkyBox.ec -o $(OBJ)SkyBox.sym

$(OBJ)Sphere.sym: src/gfx/3D/meshes/Sphere.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/meshes/Sphere.ec -o $(OBJ)Sphere.sym

$(OBJ)Object3DSFormat.sym: src/gfx/3D/models/Object3DSFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/models/Object3DSFormat.ec -o $(OBJ)Object3DSFormat.sym

$(OBJ)Camera.sym: src/gfx/3D/Camera.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Camera.ec -o $(OBJ)Camera.sym

$(OBJ)Matrix.sym: src/gfx/3D/Matrix.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Matrix.ec -o $(OBJ)Matrix.sym

$(OBJ)Mesh.sym: src/gfx/3D/Mesh.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Mesh.ec -o $(OBJ)Mesh.sym

$(OBJ)Object.sym: src/gfx/3D/Object.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Object.ec -o $(OBJ)Object.sym

$(OBJ)Plane.sym: src/gfx/3D/Plane.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Plane.ec -o $(OBJ)Plane.sym

$(OBJ)Quaternion.sym: src/gfx/3D/Quaternion.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Quaternion.ec -o $(OBJ)Quaternion.sym

$(OBJ)Vector3D.sym: src/gfx/3D/Vector3D.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/3D/Vector3D.ec -o $(OBJ)Vector3D.sym

$(OBJ)BMPFormat.sym: src/gfx/bitmaps/BMPFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/bitmaps/BMPFormat.ec -o $(OBJ)BMPFormat.sym

$(OBJ)GIFFormat.sym: src/gfx/bitmaps/GIFFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/bitmaps/GIFFormat.ec -o $(OBJ)GIFFormat.sym

$(OBJ)JPEGFormat.sym: src/gfx/bitmaps/JPEGFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/bitmaps/JPEGFormat.ec -o $(OBJ)JPEGFormat.sym

$(OBJ)PCXFormat.sym: src/gfx/bitmaps/PCXFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/bitmaps/PCXFormat.ec -o $(OBJ)PCXFormat.sym

$(OBJ)PNGFormat.sym: src/gfx/bitmaps/PNGFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/bitmaps/PNGFormat.ec -o $(OBJ)PNGFormat.sym

$(OBJ)RGBFormat.sym: src/gfx/bitmaps/RGBFormat.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/bitmaps/RGBFormat.ec -o $(OBJ)RGBFormat.sym

$(OBJ)Direct3D8DisplayDriver.sym: src/gfx/drivers/Direct3D8DisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/Direct3D8DisplayDriver.ec -o $(OBJ)Direct3D8DisplayDriver.sym

$(OBJ)Direct3D9DisplayDriver.sym: src/gfx/drivers/Direct3D9DisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/Direct3D9DisplayDriver.ec -o $(OBJ)Direct3D9DisplayDriver.sym

$(OBJ)DirectDrawDisplayDriver.sym: src/gfx/drivers/DirectDrawDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/DirectDrawDisplayDriver.ec -o $(OBJ)DirectDrawDisplayDriver.sym

$(OBJ)GDIDisplayDriver.sym: src/gfx/drivers/GDIDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/GDIDisplayDriver.ec -o $(OBJ)GDIDisplayDriver.sym

$(OBJ)lfbBlit.sym: src/gfx/drivers/lfbBlit.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/lfbBlit.ec -o $(OBJ)lfbBlit.sym

$(OBJ)lfbConvert.sym: src/gfx/drivers/lfbConvert.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/lfbConvert.ec -o $(OBJ)lfbConvert.sym

$(OBJ)LFBDisplayDriver.sym: src/gfx/drivers/LFBDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/LFBDisplayDriver.ec -o $(OBJ)LFBDisplayDriver.sym

$(OBJ)NCursesDisplayDriver.sym: src/gfx/drivers/NCursesDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/NCursesDisplayDriver.ec -o $(OBJ)NCursesDisplayDriver.sym

$(OBJ)OpenGLDisplayDriver.sym: src/gfx/drivers/OpenGLDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/OpenGLDisplayDriver.ec -o $(OBJ)OpenGLDisplayDriver.sym

$(OBJ)Win32BitmapPrinterDisplayDriver.sym: src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec -o $(OBJ)Win32BitmapPrinterDisplayDriver.sym

$(OBJ)Win32ConsoleDisplayDriver.sym: src/gfx/drivers/Win32ConsoleDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/Win32ConsoleDisplayDriver.ec -o $(OBJ)Win32ConsoleDisplayDriver.sym

$(OBJ)Win32PrinterDisplayDriver.sym: src/gfx/drivers/Win32PrinterDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/Win32PrinterDisplayDriver.ec -o $(OBJ)Win32PrinterDisplayDriver.sym

$(OBJ)XDisplayDriver.sym: src/gfx/drivers/XDisplayDriver.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/drivers/XDisplayDriver.ec -o $(OBJ)XDisplayDriver.sym

$(OBJ)Bitmap.sym: src/gfx/Bitmap.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/Bitmap.ec -o $(OBJ)Bitmap.sym

$(OBJ)BitmapResource.sym: src/gfx/BitmapResource.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/BitmapResource.ec -o $(OBJ)BitmapResource.sym

$(OBJ)Color.sym: src/gfx/Color.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/Color.ec -o $(OBJ)Color.sym

$(OBJ)Display.sym: src/gfx/Display.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/Display.ec -o $(OBJ)Display.sym

$(OBJ)DisplaySystem.sym: src/gfx/DisplaySystem.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/DisplaySystem.ec -o $(OBJ)DisplaySystem.sym

$(OBJ)FontResource.sym: src/gfx/FontResource.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/FontResource.ec -o $(OBJ)FontResource.sym

$(OBJ)Resource.sym: src/gfx/Resource.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/Resource.ec -o $(OBJ)Resource.sym

$(OBJ)Surface.sym: src/gfx/Surface.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gfx/Surface.ec -o $(OBJ)Surface.sym

$(OBJ)Button.sym: src/gui/controls/Button.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/Button.ec -o $(OBJ)Button.sym

$(OBJ)CalendarControl.sym: src/gui/controls/CalendarControl.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/CalendarControl.ec -o $(OBJ)CalendarControl.sym

$(OBJ)DataBox.sym: src/gui/controls/DataBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/DataBox.ec -o $(OBJ)DataBox.sym

$(OBJ)DropBox.sym: src/gui/controls/DropBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/DropBox.ec -o $(OBJ)DropBox.sym

$(OBJ)EditBox.sym: src/gui/controls/EditBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/EditBox.ec -o $(OBJ)EditBox.sym

$(OBJ)Label.sym: src/gui/controls/Label.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/Label.ec -o $(OBJ)Label.sym

$(OBJ)ListBox.sym: src/gui/controls/ListBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/ListBox.ec -o $(OBJ)ListBox.sym

$(OBJ)Menu.sym: src/gui/controls/Menu.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/Menu.ec -o $(OBJ)Menu.sym

$(OBJ)Picture.sym: src/gui/controls/Picture.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/Picture.ec -o $(OBJ)Picture.sym

$(OBJ)ProgressBar.sym: src/gui/controls/ProgressBar.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/ProgressBar.ec -o $(OBJ)ProgressBar.sym

$(OBJ)ScrollBar.sym: src/gui/controls/ScrollBar.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/ScrollBar.ec -o $(OBJ)ScrollBar.sym

$(OBJ)StatusBar.sym: src/gui/controls/StatusBar.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/StatusBar.ec -o $(OBJ)StatusBar.sym

$(OBJ)TabControl.sym: src/gui/controls/TabControl.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/TabControl.ec -o $(OBJ)TabControl.sym

$(OBJ)PaneSplitter.sym: src/gui/controls/PaneSplitter.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/PaneSplitter.ec -o $(OBJ)PaneSplitter.sym

$(OBJ)Stacker.sym: src/gui/controls/Stacker.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/Stacker.ec -o $(OBJ)Stacker.sym

$(OBJ)PathBox.sym: src/gui/controls/PathBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/PathBox.ec -o $(OBJ)PathBox.sym

$(OBJ)ColorPicker.sym: src/gui/dialogs/ColorPicker.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/ColorPicker.ec -o $(OBJ)ColorPicker.sym

$(OBJ)FileDialog.sym: src/gui/dialogs/FileDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/FileDialog.ec -o $(OBJ)FileDialog.sym

$(OBJ)FindDialog.sym: src/gui/dialogs/FindDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/FindDialog.ec -o $(OBJ)FindDialog.sym

$(OBJ)GoToDialog.sym: src/gui/dialogs/GoToDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/GoToDialog.ec -o $(OBJ)GoToDialog.sym

$(OBJ)MessageBox.sym: src/gui/dialogs/MessageBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/MessageBox.ec -o $(OBJ)MessageBox.sym

$(OBJ)ReplaceDialog.sym: src/gui/dialogs/ReplaceDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/ReplaceDialog.ec -o $(OBJ)ReplaceDialog.sym

$(OBJ)WindowList.sym: src/gui/dialogs/WindowList.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/dialogs/WindowList.ec -o $(OBJ)WindowList.sym

$(OBJ)NCursesInterface.sym: src/gui/drivers/NCursesInterface.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/drivers/NCursesInterface.ec -o $(OBJ)NCursesInterface.sym

$(OBJ)Win32Interface.sym: src/gui/drivers/Win32Interface.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/drivers/Win32Interface.ec -o $(OBJ)Win32Interface.sym

$(OBJ)Win32ConsoleInterface.sym: src/gui/drivers/Win32ConsoleInterface.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/drivers/Win32ConsoleInterface.ec -o $(OBJ)Win32ConsoleInterface.sym

$(OBJ)XInterface.sym: src/gui/drivers/XInterface.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/drivers/XInterface.ec -o $(OBJ)XInterface.sym

$(OBJ)TVisionSkin.sym: src/gui/skins/TVisionSkin.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/skins/TVisionSkin.ec -o $(OBJ)TVisionSkin.sym

$(OBJ)WindowsSkin.sym: src/gui/skins/WindowsSkin.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/skins/WindowsSkin.ec -o $(OBJ)WindowsSkin.sym

$(OBJ)Anchor.sym: src/gui/Anchor.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Anchor.ec -o $(OBJ)Anchor.sym

$(OBJ)ClipBoard.sym: src/gui/ClipBoard.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/ClipBoard.ec -o $(OBJ)ClipBoard.sym

$(OBJ)Cursor.sym: src/gui/Cursor.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Cursor.ec -o $(OBJ)Cursor.sym

$(OBJ)Desktop3D.sym: src/gui/Desktop3D.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Desktop3D.ec -o $(OBJ)Desktop3D.sym

$(OBJ)FormDesigner.sym: src/gui/FormDesigner.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/FormDesigner.ec -o $(OBJ)FormDesigner.sym

$(OBJ)GuiApplication.sym: src/gui/GuiApplication.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/GuiApplication.ec -o $(OBJ)GuiApplication.sym

$(OBJ)Interface.sym: src/gui/Interface.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Interface.ec -o $(OBJ)Interface.sym

$(OBJ)Key.sym: src/gui/Key.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Key.ec -o $(OBJ)Key.sym

$(OBJ)Skin.sym: src/gui/Skin.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Skin.ec -o $(OBJ)Skin.sym

$(OBJ)Timer.sym: src/gui/Timer.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Timer.ec -o $(OBJ)Timer.sym

$(OBJ)typeEdit.sym: src/gui/typeEdit.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/typeEdit.ec -o $(OBJ)typeEdit.sym

$(OBJ)Window.sym: src/gui/Window.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/Window.ec -o $(OBJ)Window.sym

$(OBJ)dcom.sym: src/net/dcom.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/net/dcom.ec -o $(OBJ)dcom.sym

$(OBJ)HTTPFile.sym: src/net/HTTPFile.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/net/HTTPFile.ec -o $(OBJ)HTTPFile.sym

$(OBJ)network.sym: src/net/network.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/net/network.ec -o $(OBJ)network.sym

$(OBJ)NetworkClientFile.sym: src/net/NetworkClientFile.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/net/NetworkClientFile.ec -o $(OBJ)NetworkClientFile.sym

$(OBJ)Service.sym: src/net/Service.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/net/Service.ec -o $(OBJ)Service.sym

$(OBJ)Socket.sym: src/net/Socket.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/net/Socket.ec -o $(OBJ)Socket.sym

$(OBJ)Array.sym: src/com/containers/Array.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/Array.ec -o $(OBJ)Array.sym

$(OBJ)AVLTree.sym: src/com/containers/AVLTree.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/AVLTree.ec -o $(OBJ)AVLTree.sym

$(OBJ)BuiltInContainer.sym: src/com/containers/BuiltInContainer.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/BuiltInContainer.ec -o $(OBJ)BuiltInContainer.sym

$(OBJ)Container.sym: src/com/containers/Container.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/Container.ec -o $(OBJ)Container.sym

$(OBJ)CustomAVLTree.sym: src/com/containers/CustomAVLTree.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/CustomAVLTree.ec -o $(OBJ)CustomAVLTree.sym

$(OBJ)LinkList.sym: src/com/containers/LinkList.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/LinkList.ec -o $(OBJ)LinkList.sym

$(OBJ)List.sym: src/com/containers/List.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/List.ec -o $(OBJ)List.sym

$(OBJ)Map.sym: src/com/containers/Map.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/containers/Map.ec -o $(OBJ)Map.sym

$(OBJ)BinaryTree.sym: src/com/BinaryTree.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/BinaryTree.ec -o $(OBJ)BinaryTree.sym

$(OBJ)BTNode.sym: src/com/BTNode.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/BTNode.ec -o $(OBJ)BTNode.sym

$(OBJ)dataTypes.sym: src/com/dataTypes.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/dataTypes.ec -o $(OBJ)dataTypes.sym

$(OBJ)instance.sym: src/com/instance.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/instance.ec -o $(OBJ)instance.sym

$(OBJ)String.sym: src/com/String.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/String.ec -o $(OBJ)String.sym

$(OBJ)OldList.sym: src/com/OldList.ec
	$(ECP) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/com/OldList.ec -o $(OBJ)OldList.sym

# C OBJECT RULES

$(OBJ)Archive.c: src/sys/Archive.ec $(OBJ)Archive.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/Archive.ec -o $(OBJ)Archive.c -symbols $(OBJ)

$(OBJ)BufferedFile.c: src/sys/BufferedFile.ec $(OBJ)BufferedFile.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/BufferedFile.ec -o $(OBJ)BufferedFile.c -symbols $(OBJ)

$(OBJ)Date.c: src/sys/Date.ec $(OBJ)Date.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/Date.ec -o $(OBJ)Date.c -symbols $(OBJ)

$(OBJ)DualPipe.c: src/sys/DualPipe.ec $(OBJ)DualPipe.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/DualPipe.ec -o $(OBJ)DualPipe.c -symbols $(OBJ)

$(OBJ)EARArchive.c: src/sys/EARArchive.ec $(OBJ)EARArchive.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/EARArchive.ec -o $(OBJ)EARArchive.c -symbols $(OBJ)

$(OBJ)File.c: src/sys/File.ec $(OBJ)File.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/File.ec -o $(OBJ)File.c -symbols $(OBJ)

$(OBJ)FileMonitor.c: src/sys/FileMonitor.ec $(OBJ)FileMonitor.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/FileMonitor.ec -o $(OBJ)FileMonitor.c -symbols $(OBJ)

$(OBJ)GlobalAppSettings.c: src/sys/GlobalAppSettings.ec $(OBJ)GlobalAppSettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/GlobalAppSettings.ec -o $(OBJ)GlobalAppSettings.c -symbols $(OBJ)

$(OBJ)JSON.c: src/sys/JSON.ec $(OBJ)JSON.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/JSON.ec -o $(OBJ)JSON.c -symbols $(OBJ)

$(OBJ)JSONGlobalSettings.c: src/sys/JSONGlobalSettings.ec $(OBJ)JSONGlobalSettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/JSONGlobalSettings.ec -o $(OBJ)JSONGlobalSettings.c -symbols $(OBJ)

$(OBJ)memory.c: src/sys/memory.ec $(OBJ)memory.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/memory.ec -o $(OBJ)memory.c -symbols $(OBJ)

$(OBJ)Mutex.c: src/sys/Mutex.ec $(OBJ)Mutex.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/Mutex.ec -o $(OBJ)Mutex.c -symbols $(OBJ)

$(OBJ)Semaphore.c: src/sys/Semaphore.ec $(OBJ)Semaphore.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/Semaphore.ec -o $(OBJ)Semaphore.c -symbols $(OBJ)

$(OBJ)System.c: src/sys/System.ec $(OBJ)System.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/System.ec -o $(OBJ)System.c -symbols $(OBJ)

$(OBJ)TempFile.c: src/sys/TempFile.ec $(OBJ)TempFile.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/TempFile.ec -o $(OBJ)TempFile.c -symbols $(OBJ)

$(OBJ)Thread.c: src/sys/Thread.ec $(OBJ)Thread.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/Thread.ec -o $(OBJ)Thread.c -symbols $(OBJ)

$(OBJ)Time.c: src/sys/Time.ec $(OBJ)Time.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/Time.ec -o $(OBJ)Time.c -symbols $(OBJ)

$(OBJ)unicode.c: src/sys/unicode.ec $(OBJ)unicode.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/unicode.ec -o $(OBJ)unicode.c -symbols $(OBJ)

$(OBJ)units.c: src/sys/units.ec $(OBJ)units.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/units.ec -o $(OBJ)units.c -symbols $(OBJ)

$(OBJ)i18n.c: src/sys/i18n.ec $(OBJ)i18n.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/sys/i18n.ec -o $(OBJ)i18n.c -symbols $(OBJ)

$(OBJ)Cube.c: src/gfx/3D/meshes/Cube.ec $(OBJ)Cube.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/meshes/Cube.ec -o $(OBJ)Cube.c -symbols $(OBJ)

$(OBJ)SkyBox.c: src/gfx/3D/meshes/SkyBox.ec $(OBJ)SkyBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/meshes/SkyBox.ec -o $(OBJ)SkyBox.c -symbols $(OBJ)

$(OBJ)Sphere.c: src/gfx/3D/meshes/Sphere.ec $(OBJ)Sphere.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/meshes/Sphere.ec -o $(OBJ)Sphere.c -symbols $(OBJ)

$(OBJ)Object3DSFormat.c: src/gfx/3D/models/Object3DSFormat.ec $(OBJ)Object3DSFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/models/Object3DSFormat.ec -o $(OBJ)Object3DSFormat.c -symbols $(OBJ)

$(OBJ)Camera.c: src/gfx/3D/Camera.ec $(OBJ)Camera.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Camera.ec -o $(OBJ)Camera.c -symbols $(OBJ)

$(OBJ)Matrix.c: src/gfx/3D/Matrix.ec $(OBJ)Matrix.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Matrix.ec -o $(OBJ)Matrix.c -symbols $(OBJ)

$(OBJ)Mesh.c: src/gfx/3D/Mesh.ec $(OBJ)Mesh.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Mesh.ec -o $(OBJ)Mesh.c -symbols $(OBJ)

$(OBJ)Object.c: src/gfx/3D/Object.ec $(OBJ)Object.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Object.ec -o $(OBJ)Object.c -symbols $(OBJ)

$(OBJ)Plane.c: src/gfx/3D/Plane.ec $(OBJ)Plane.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Plane.ec -o $(OBJ)Plane.c -symbols $(OBJ)

$(OBJ)Quaternion.c: src/gfx/3D/Quaternion.ec $(OBJ)Quaternion.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Quaternion.ec -o $(OBJ)Quaternion.c -symbols $(OBJ)

$(OBJ)Vector3D.c: src/gfx/3D/Vector3D.ec $(OBJ)Vector3D.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/3D/Vector3D.ec -o $(OBJ)Vector3D.c -symbols $(OBJ)

$(OBJ)BMPFormat.c: src/gfx/bitmaps/BMPFormat.ec $(OBJ)BMPFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/BMPFormat.ec -o $(OBJ)BMPFormat.c -symbols $(OBJ)

$(OBJ)GIFFormat.c: src/gfx/bitmaps/GIFFormat.ec $(OBJ)GIFFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/GIFFormat.ec -o $(OBJ)GIFFormat.c -symbols $(OBJ)

$(OBJ)JPEGFormat.c: src/gfx/bitmaps/JPEGFormat.ec $(OBJ)JPEGFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/JPEGFormat.ec -o $(OBJ)JPEGFormat.c -symbols $(OBJ)

$(OBJ)PCXFormat.c: src/gfx/bitmaps/PCXFormat.ec $(OBJ)PCXFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/PCXFormat.ec -o $(OBJ)PCXFormat.c -symbols $(OBJ)

$(OBJ)PNGFormat.c: src/gfx/bitmaps/PNGFormat.ec $(OBJ)PNGFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/PNGFormat.ec -o $(OBJ)PNGFormat.c -symbols $(OBJ)

$(OBJ)RGBFormat.c: src/gfx/bitmaps/RGBFormat.ec $(OBJ)RGBFormat.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/bitmaps/RGBFormat.ec -o $(OBJ)RGBFormat.c -symbols $(OBJ)

$(OBJ)Direct3D8DisplayDriver.c: src/gfx/drivers/Direct3D8DisplayDriver.ec $(OBJ)Direct3D8DisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Direct3D8DisplayDriver.ec -o $(OBJ)Direct3D8DisplayDriver.c -symbols $(OBJ)

$(OBJ)Direct3D9DisplayDriver.c: src/gfx/drivers/Direct3D9DisplayDriver.ec $(OBJ)Direct3D9DisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Direct3D9DisplayDriver.ec -o $(OBJ)Direct3D9DisplayDriver.c -symbols $(OBJ)

$(OBJ)DirectDrawDisplayDriver.c: src/gfx/drivers/DirectDrawDisplayDriver.ec $(OBJ)DirectDrawDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/DirectDrawDisplayDriver.ec -o $(OBJ)DirectDrawDisplayDriver.c -symbols $(OBJ)

$(OBJ)GDIDisplayDriver.c: src/gfx/drivers/GDIDisplayDriver.ec $(OBJ)GDIDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/GDIDisplayDriver.ec -o $(OBJ)GDIDisplayDriver.c -symbols $(OBJ)

$(OBJ)lfbBlit.c: src/gfx/drivers/lfbBlit.ec $(OBJ)lfbBlit.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/lfbBlit.ec -o $(OBJ)lfbBlit.c -symbols $(OBJ)

$(OBJ)lfbConvert.c: src/gfx/drivers/lfbConvert.ec $(OBJ)lfbConvert.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/lfbConvert.ec -o $(OBJ)lfbConvert.c -symbols $(OBJ)

$(OBJ)LFBDisplayDriver.c: src/gfx/drivers/LFBDisplayDriver.ec $(OBJ)LFBDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/LFBDisplayDriver.ec -o $(OBJ)LFBDisplayDriver.c -symbols $(OBJ)

$(OBJ)NCursesDisplayDriver.c: src/gfx/drivers/NCursesDisplayDriver.ec $(OBJ)NCursesDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/NCursesDisplayDriver.ec -o $(OBJ)NCursesDisplayDriver.c -symbols $(OBJ)

$(OBJ)OpenGLDisplayDriver.c: src/gfx/drivers/OpenGLDisplayDriver.ec $(OBJ)OpenGLDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/OpenGLDisplayDriver.ec -o $(OBJ)OpenGLDisplayDriver.c -symbols $(OBJ)

$(OBJ)Win32BitmapPrinterDisplayDriver.c: src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec $(OBJ)Win32BitmapPrinterDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Win32BitmapPrinterDisplayDriver.ec -o $(OBJ)Win32BitmapPrinterDisplayDriver.c -symbols $(OBJ)

$(OBJ)Win32ConsoleDisplayDriver.c: src/gfx/drivers/Win32ConsoleDisplayDriver.ec $(OBJ)Win32ConsoleDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Win32ConsoleDisplayDriver.ec -o $(OBJ)Win32ConsoleDisplayDriver.c -symbols $(OBJ)

$(OBJ)Win32PrinterDisplayDriver.c: src/gfx/drivers/Win32PrinterDisplayDriver.ec $(OBJ)Win32PrinterDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/Win32PrinterDisplayDriver.ec -o $(OBJ)Win32PrinterDisplayDriver.c -symbols $(OBJ)

$(OBJ)XDisplayDriver.c: src/gfx/drivers/XDisplayDriver.ec $(OBJ)XDisplayDriver.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/drivers/XDisplayDriver.ec -o $(OBJ)XDisplayDriver.c -symbols $(OBJ)

$(OBJ)Bitmap.c: src/gfx/Bitmap.ec $(OBJ)Bitmap.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/Bitmap.ec -o $(OBJ)Bitmap.c -symbols $(OBJ)

$(OBJ)BitmapResource.c: src/gfx/BitmapResource.ec $(OBJ)BitmapResource.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/BitmapResource.ec -o $(OBJ)BitmapResource.c -symbols $(OBJ)

$(OBJ)Color.c: src/gfx/Color.ec $(OBJ)Color.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/Color.ec -o $(OBJ)Color.c -symbols $(OBJ)

$(OBJ)Display.c: src/gfx/Display.ec $(OBJ)Display.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/Display.ec -o $(OBJ)Display.c -symbols $(OBJ)

$(OBJ)DisplaySystem.c: src/gfx/DisplaySystem.ec $(OBJ)DisplaySystem.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/DisplaySystem.ec -o $(OBJ)DisplaySystem.c -symbols $(OBJ)

$(OBJ)FontResource.c: src/gfx/FontResource.ec $(OBJ)FontResource.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/FontResource.ec -o $(OBJ)FontResource.c -symbols $(OBJ)

$(OBJ)Resource.c: src/gfx/Resource.ec $(OBJ)Resource.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/Resource.ec -o $(OBJ)Resource.c -symbols $(OBJ)

$(OBJ)Surface.c: src/gfx/Surface.ec $(OBJ)Surface.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gfx/Surface.ec -o $(OBJ)Surface.c -symbols $(OBJ)

$(OBJ)Button.c: src/gui/controls/Button.ec $(OBJ)Button.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/Button.ec -o $(OBJ)Button.c -symbols $(OBJ)

$(OBJ)CalendarControl.c: src/gui/controls/CalendarControl.ec $(OBJ)CalendarControl.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/CalendarControl.ec -o $(OBJ)CalendarControl.c -symbols $(OBJ)

$(OBJ)DataBox.c: src/gui/controls/DataBox.ec $(OBJ)DataBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/DataBox.ec -o $(OBJ)DataBox.c -symbols $(OBJ)

$(OBJ)DropBox.c: src/gui/controls/DropBox.ec $(OBJ)DropBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/DropBox.ec -o $(OBJ)DropBox.c -symbols $(OBJ)

$(OBJ)EditBox.c: src/gui/controls/EditBox.ec $(OBJ)EditBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/EditBox.ec -o $(OBJ)EditBox.c -symbols $(OBJ)

$(OBJ)Label.c: src/gui/controls/Label.ec $(OBJ)Label.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/Label.ec -o $(OBJ)Label.c -symbols $(OBJ)

$(OBJ)ListBox.c: src/gui/controls/ListBox.ec $(OBJ)ListBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/ListBox.ec -o $(OBJ)ListBox.c -symbols $(OBJ)

$(OBJ)Menu.c: src/gui/controls/Menu.ec $(OBJ)Menu.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/Menu.ec -o $(OBJ)Menu.c -symbols $(OBJ)

$(OBJ)Picture.c: src/gui/controls/Picture.ec $(OBJ)Picture.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/Picture.ec -o $(OBJ)Picture.c -symbols $(OBJ)

$(OBJ)ProgressBar.c: src/gui/controls/ProgressBar.ec $(OBJ)ProgressBar.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/ProgressBar.ec -o $(OBJ)ProgressBar.c -symbols $(OBJ)

$(OBJ)ScrollBar.c: src/gui/controls/ScrollBar.ec $(OBJ)ScrollBar.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/ScrollBar.ec -o $(OBJ)ScrollBar.c -symbols $(OBJ)

$(OBJ)StatusBar.c: src/gui/controls/StatusBar.ec $(OBJ)StatusBar.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/StatusBar.ec -o $(OBJ)StatusBar.c -symbols $(OBJ)

$(OBJ)TabControl.c: src/gui/controls/TabControl.ec $(OBJ)TabControl.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/TabControl.ec -o $(OBJ)TabControl.c -symbols $(OBJ)

$(OBJ)PaneSplitter.c: src/gui/controls/PaneSplitter.ec $(OBJ)PaneSplitter.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/PaneSplitter.ec -o $(OBJ)PaneSplitter.c -symbols $(OBJ)

$(OBJ)Stacker.c: src/gui/controls/Stacker.ec $(OBJ)Stacker.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/Stacker.ec -o $(OBJ)Stacker.c -symbols $(OBJ)

$(OBJ)PathBox.c: src/gui/controls/PathBox.ec $(OBJ)PathBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/PathBox.ec -o $(OBJ)PathBox.c -symbols $(OBJ)

$(OBJ)ColorPicker.c: src/gui/dialogs/ColorPicker.ec $(OBJ)ColorPicker.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/ColorPicker.ec -o $(OBJ)ColorPicker.c -symbols $(OBJ)

$(OBJ)FileDialog.c: src/gui/dialogs/FileDialog.ec $(OBJ)FileDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/FileDialog.ec -o $(OBJ)FileDialog.c -symbols $(OBJ)

$(OBJ)FindDialog.c: src/gui/dialogs/FindDialog.ec $(OBJ)FindDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/FindDialog.ec -o $(OBJ)FindDialog.c -symbols $(OBJ)

$(OBJ)GoToDialog.c: src/gui/dialogs/GoToDialog.ec $(OBJ)GoToDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/GoToDialog.ec -o $(OBJ)GoToDialog.c -symbols $(OBJ)

$(OBJ)MessageBox.c: src/gui/dialogs/MessageBox.ec $(OBJ)MessageBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/MessageBox.ec -o $(OBJ)MessageBox.c -symbols $(OBJ)

$(OBJ)ReplaceDialog.c: src/gui/dialogs/ReplaceDialog.ec $(OBJ)ReplaceDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/ReplaceDialog.ec -o $(OBJ)ReplaceDialog.c -symbols $(OBJ)

$(OBJ)WindowList.c: src/gui/dialogs/WindowList.ec $(OBJ)WindowList.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/dialogs/WindowList.ec -o $(OBJ)WindowList.c -symbols $(OBJ)

$(OBJ)NCursesInterface.c: src/gui/drivers/NCursesInterface.ec $(OBJ)NCursesInterface.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/drivers/NCursesInterface.ec -o $(OBJ)NCursesInterface.c -symbols $(OBJ)

$(OBJ)Win32Interface.c: src/gui/drivers/Win32Interface.ec $(OBJ)Win32Interface.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/drivers/Win32Interface.ec -o $(OBJ)Win32Interface.c -symbols $(OBJ)

$(OBJ)Win32ConsoleInterface.c: src/gui/drivers/Win32ConsoleInterface.ec $(OBJ)Win32ConsoleInterface.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/drivers/Win32ConsoleInterface.ec -o $(OBJ)Win32ConsoleInterface.c -symbols $(OBJ)

$(OBJ)XInterface.c: src/gui/drivers/XInterface.ec $(OBJ)XInterface.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/drivers/XInterface.ec -o $(OBJ)XInterface.c -symbols $(OBJ)

$(OBJ)TVisionSkin.c: src/gui/skins/TVisionSkin.ec $(OBJ)TVisionSkin.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/skins/TVisionSkin.ec -o $(OBJ)TVisionSkin.c -symbols $(OBJ)

$(OBJ)WindowsSkin.c: src/gui/skins/WindowsSkin.ec $(OBJ)WindowsSkin.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/skins/WindowsSkin.ec -o $(OBJ)WindowsSkin.c -symbols $(OBJ)

$(OBJ)Anchor.c: src/gui/Anchor.ec $(OBJ)Anchor.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Anchor.ec -o $(OBJ)Anchor.c -symbols $(OBJ)

$(OBJ)ClipBoard.c: src/gui/ClipBoard.ec $(OBJ)ClipBoard.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/ClipBoard.ec -o $(OBJ)ClipBoard.c -symbols $(OBJ)

$(OBJ)Cursor.c: src/gui/Cursor.ec $(OBJ)Cursor.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Cursor.ec -o $(OBJ)Cursor.c -symbols $(OBJ)

$(OBJ)Desktop3D.c: src/gui/Desktop3D.ec $(OBJ)Desktop3D.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Desktop3D.ec -o $(OBJ)Desktop3D.c -symbols $(OBJ)

$(OBJ)FormDesigner.c: src/gui/FormDesigner.ec $(OBJ)FormDesigner.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/FormDesigner.ec -o $(OBJ)FormDesigner.c -symbols $(OBJ)

$(OBJ)GuiApplication.c: src/gui/GuiApplication.ec $(OBJ)GuiApplication.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/GuiApplication.ec -o $(OBJ)GuiApplication.c -symbols $(OBJ)

$(OBJ)Interface.c: src/gui/Interface.ec $(OBJ)Interface.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Interface.ec -o $(OBJ)Interface.c -symbols $(OBJ)

$(OBJ)Key.c: src/gui/Key.ec $(OBJ)Key.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Key.ec -o $(OBJ)Key.c -symbols $(OBJ)

$(OBJ)Skin.c: src/gui/Skin.ec $(OBJ)Skin.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Skin.ec -o $(OBJ)Skin.c -symbols $(OBJ)

$(OBJ)Timer.c: src/gui/Timer.ec $(OBJ)Timer.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Timer.ec -o $(OBJ)Timer.c -symbols $(OBJ)

$(OBJ)typeEdit.c: src/gui/typeEdit.ec $(OBJ)typeEdit.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/typeEdit.ec -o $(OBJ)typeEdit.c -symbols $(OBJ)

$(OBJ)Window.c: src/gui/Window.ec $(OBJ)Window.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/Window.ec -o $(OBJ)Window.c -symbols $(OBJ)

$(OBJ)dcom.c: src/net/dcom.ec $(OBJ)dcom.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/net/dcom.ec -o $(OBJ)dcom.c -symbols $(OBJ)

$(OBJ)HTTPFile.c: src/net/HTTPFile.ec $(OBJ)HTTPFile.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/net/HTTPFile.ec -o $(OBJ)HTTPFile.c -symbols $(OBJ)

$(OBJ)network.c: src/net/network.ec $(OBJ)network.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/net/network.ec -o $(OBJ)network.c -symbols $(OBJ)

$(OBJ)NetworkClientFile.c: src/net/NetworkClientFile.ec $(OBJ)NetworkClientFile.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/net/NetworkClientFile.ec -o $(OBJ)NetworkClientFile.c -symbols $(OBJ)

$(OBJ)Service.c: src/net/Service.ec $(OBJ)Service.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/net/Service.ec -o $(OBJ)Service.c -symbols $(OBJ)

$(OBJ)Socket.c: src/net/Socket.ec $(OBJ)Socket.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/net/Socket.ec -o $(OBJ)Socket.c -symbols $(OBJ)

$(OBJ)Array.c: src/com/containers/Array.ec $(OBJ)Array.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/Array.ec -o $(OBJ)Array.c -symbols $(OBJ)

$(OBJ)AVLTree.c: src/com/containers/AVLTree.ec $(OBJ)AVLTree.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/AVLTree.ec -o $(OBJ)AVLTree.c -symbols $(OBJ)

$(OBJ)BuiltInContainer.c: src/com/containers/BuiltInContainer.ec $(OBJ)BuiltInContainer.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/BuiltInContainer.ec -o $(OBJ)BuiltInContainer.c -symbols $(OBJ)

$(OBJ)Container.c: src/com/containers/Container.ec $(OBJ)Container.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/Container.ec -o $(OBJ)Container.c -symbols $(OBJ)

$(OBJ)CustomAVLTree.c: src/com/containers/CustomAVLTree.ec $(OBJ)CustomAVLTree.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/CustomAVLTree.ec -o $(OBJ)CustomAVLTree.c -symbols $(OBJ)

$(OBJ)LinkList.c: src/com/containers/LinkList.ec $(OBJ)LinkList.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/LinkList.ec -o $(OBJ)LinkList.c -symbols $(OBJ)

$(OBJ)List.c: src/com/containers/List.ec $(OBJ)List.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/List.ec -o $(OBJ)List.c -symbols $(OBJ)

$(OBJ)Map.c: src/com/containers/Map.ec $(OBJ)Map.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/containers/Map.ec -o $(OBJ)Map.c -symbols $(OBJ)

$(OBJ)BinaryTree.c: src/com/BinaryTree.ec $(OBJ)BinaryTree.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/BinaryTree.ec -o $(OBJ)BinaryTree.c -symbols $(OBJ)

$(OBJ)BTNode.c: src/com/BTNode.ec $(OBJ)BTNode.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/BTNode.ec -o $(OBJ)BTNode.c -symbols $(OBJ)

$(OBJ)dataTypes.c: src/com/dataTypes.ec $(OBJ)dataTypes.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/dataTypes.ec -o $(OBJ)dataTypes.c -symbols $(OBJ)

$(OBJ)instance.c: src/com/instance.ec $(OBJ)instance.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/instance.ec -o $(OBJ)instance.c -symbols $(OBJ)

$(OBJ)String.c: src/com/String.ec $(OBJ)String.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/String.ec -o $(OBJ)String.c -symbols $(OBJ)

$(OBJ)OldList.c: src/com/OldList.ec $(OBJ)OldList.sym | $(SYMBOLS)
	$(ECC) -DECERE_COM_MODULE $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/com/OldList.ec -o $(OBJ)OldList.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)Archive.o: $(OBJ)Archive.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Archive.c -o $(OBJ)Archive.o

$(OBJ)BufferedFile.o: $(OBJ)BufferedFile.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BufferedFile.c -o $(OBJ)BufferedFile.o

$(OBJ)Date.o: $(OBJ)Date.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Date.c -o $(OBJ)Date.o

$(OBJ)DualPipe.o: $(OBJ)DualPipe.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)DualPipe.c -o $(OBJ)DualPipe.o

$(OBJ)EARArchive.o: $(OBJ)EARArchive.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)EARArchive.c -o $(OBJ)EARArchive.o

$(OBJ)File.o: $(OBJ)File.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)File.c -o $(OBJ)File.o

$(OBJ)FileMonitor.o: $(OBJ)FileMonitor.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FileMonitor.c -o $(OBJ)FileMonitor.o

$(OBJ)GlobalAppSettings.o: $(OBJ)GlobalAppSettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GlobalAppSettings.c -o $(OBJ)GlobalAppSettings.o

$(OBJ)JSON.o: $(OBJ)JSON.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)JSON.c -o $(OBJ)JSON.o

$(OBJ)JSONGlobalSettings.o: $(OBJ)JSONGlobalSettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)JSONGlobalSettings.c -o $(OBJ)JSONGlobalSettings.o

$(OBJ)memory.o: $(OBJ)memory.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)memory.c -o $(OBJ)memory.o

$(OBJ)Mutex.o: $(OBJ)Mutex.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Mutex.c -o $(OBJ)Mutex.o

$(OBJ)Semaphore.o: $(OBJ)Semaphore.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Semaphore.c -o $(OBJ)Semaphore.o

$(OBJ)System.o: $(OBJ)System.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)System.c -o $(OBJ)System.o

$(OBJ)TempFile.o: $(OBJ)TempFile.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)TempFile.c -o $(OBJ)TempFile.o

$(OBJ)Thread.o: $(OBJ)Thread.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Thread.c -o $(OBJ)Thread.o

$(OBJ)Time.o: $(OBJ)Time.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Time.c -o $(OBJ)Time.o

$(OBJ)unicode.o: $(OBJ)unicode.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)unicode.c -o $(OBJ)unicode.o

$(OBJ)units.o: $(OBJ)units.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)units.c -o $(OBJ)units.o

$(OBJ)File.c.o: src/sys/File.c
	$(CC) $(CFLAGS) -c src/sys/File.c -o $(OBJ)File.c.o

$(OBJ)DualPipe.c.o: src/sys/DualPipe.c
	$(CC) $(CFLAGS) -c src/sys/DualPipe.c -o $(OBJ)DualPipe.c.o

$(OBJ)System.c.o: src/sys/System.c
	$(CC) $(CFLAGS) -c src/sys/System.c -o $(OBJ)System.c.o

$(OBJ)i18n.o: $(OBJ)i18n.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)i18n.c -o $(OBJ)i18n.o

$(OBJ)Cube.o: $(OBJ)Cube.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Cube.c -o $(OBJ)Cube.o

$(OBJ)SkyBox.o: $(OBJ)SkyBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)SkyBox.c -o $(OBJ)SkyBox.o

$(OBJ)Sphere.o: $(OBJ)Sphere.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Sphere.c -o $(OBJ)Sphere.o

$(OBJ)Object3DSFormat.o: $(OBJ)Object3DSFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Object3DSFormat.c -o $(OBJ)Object3DSFormat.o

$(OBJ)Camera.o: $(OBJ)Camera.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Camera.c -o $(OBJ)Camera.o

$(OBJ)Matrix.o: $(OBJ)Matrix.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Matrix.c -o $(OBJ)Matrix.o

$(OBJ)Mesh.o: $(OBJ)Mesh.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Mesh.c -o $(OBJ)Mesh.o

$(OBJ)Object.o: $(OBJ)Object.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Object.c -o $(OBJ)Object.o

$(OBJ)Plane.o: $(OBJ)Plane.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Plane.c -o $(OBJ)Plane.o

$(OBJ)Quaternion.o: $(OBJ)Quaternion.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Quaternion.c -o $(OBJ)Quaternion.o

$(OBJ)Vector3D.o: $(OBJ)Vector3D.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Vector3D.c -o $(OBJ)Vector3D.o

$(OBJ)BMPFormat.o: $(OBJ)BMPFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BMPFormat.c -o $(OBJ)BMPFormat.o

$(OBJ)GIFFormat.o: $(OBJ)GIFFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GIFFormat.c -o $(OBJ)GIFFormat.o

$(OBJ)JPEGFormat.o: $(OBJ)JPEGFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)JPEGFormat.c -o $(OBJ)JPEGFormat.o

$(OBJ)PCXFormat.o: $(OBJ)PCXFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)PCXFormat.c -o $(OBJ)PCXFormat.o

$(OBJ)PNGFormat.o: $(OBJ)PNGFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)PNGFormat.c -o $(OBJ)PNGFormat.o

$(OBJ)RGBFormat.o: $(OBJ)RGBFormat.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)RGBFormat.c -o $(OBJ)RGBFormat.o

$(OBJ)harfbuzz-freetype.o: src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/unicode/harfbuzz-freetype.c -o $(OBJ)harfbuzz-freetype.o

$(OBJ)harfbuzz-unicode-tables.o: src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode-tables.c -o $(OBJ)harfbuzz-unicode-tables.o

$(OBJ)harfbuzz-unicode.o: src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/unicode/harfbuzz-unicode.c -o $(OBJ)harfbuzz-unicode.o

$(OBJ)harfbuzz-arabic.o: src/gfx/drivers/harfbuzz/harfbuzz-arabic.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-arabic.c -o $(OBJ)harfbuzz-arabic.o

$(OBJ)harfbuzz-buffer.o: src/gfx/drivers/harfbuzz/harfbuzz-buffer.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-buffer.c -o $(OBJ)harfbuzz-buffer.o

$(OBJ)harfbuzz-gdef.o: src/gfx/drivers/harfbuzz/harfbuzz-gdef.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-gdef.c -o $(OBJ)harfbuzz-gdef.o

$(OBJ)harfbuzz-gpos.o: src/gfx/drivers/harfbuzz/harfbuzz-gpos.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-gpos.c -o $(OBJ)harfbuzz-gpos.o

$(OBJ)harfbuzz-gsub.o: src/gfx/drivers/harfbuzz/harfbuzz-gsub.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-gsub.c -o $(OBJ)harfbuzz-gsub.o

$(OBJ)harfbuzz-hangul.o: src/gfx/drivers/harfbuzz/harfbuzz-hangul.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-hangul.c -o $(OBJ)harfbuzz-hangul.o

$(OBJ)harfbuzz-hebrew.o: src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-hebrew.c -o $(OBJ)harfbuzz-hebrew.o

$(OBJ)harfbuzz-indic.o: src/gfx/drivers/harfbuzz/harfbuzz-indic.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-indic.c -o $(OBJ)harfbuzz-indic.o

$(OBJ)harfbuzz-khmer.o: src/gfx/drivers/harfbuzz/harfbuzz-khmer.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-khmer.c -o $(OBJ)harfbuzz-khmer.o

$(OBJ)harfbuzz-myanmar.o: src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-myanmar.c -o $(OBJ)harfbuzz-myanmar.o

$(OBJ)harfbuzz-open.o: src/gfx/drivers/harfbuzz/harfbuzz-open.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-open.c -o $(OBJ)harfbuzz-open.o

$(OBJ)harfbuzz-shaper.o: src/gfx/drivers/harfbuzz/harfbuzz-shaper.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-shaper.c -o $(OBJ)harfbuzz-shaper.o

$(OBJ)harfbuzz-stream.o: src/gfx/drivers/harfbuzz/harfbuzz-stream.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-stream.c -o $(OBJ)harfbuzz-stream.o

$(OBJ)harfbuzz-tibetan.o: src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-tibetan.c -o $(OBJ)harfbuzz-tibetan.o

$(OBJ)harfbuzz-impl.o: src/gfx/drivers/harfbuzz/harfbuzz-impl.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-impl.c -o $(OBJ)harfbuzz-impl.o

$(OBJ)harfbuzz-thai.o: src/gfx/drivers/harfbuzz/harfbuzz-thai.c
	$(CC) $(CFLAGS) -c src/gfx/drivers/harfbuzz/harfbuzz-thai.c -o $(OBJ)harfbuzz-thai.o

$(OBJ)Direct3D8DisplayDriver.o: $(OBJ)Direct3D8DisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Direct3D8DisplayDriver.c -o $(OBJ)Direct3D8DisplayDriver.o

$(OBJ)Direct3D9DisplayDriver.o: $(OBJ)Direct3D9DisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Direct3D9DisplayDriver.c -o $(OBJ)Direct3D9DisplayDriver.o

$(OBJ)DirectDrawDisplayDriver.o: $(OBJ)DirectDrawDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)DirectDrawDisplayDriver.c -o $(OBJ)DirectDrawDisplayDriver.o

$(OBJ)GDIDisplayDriver.o: $(OBJ)GDIDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GDIDisplayDriver.c -o $(OBJ)GDIDisplayDriver.o

$(OBJ)lfbBlit.o: $(OBJ)lfbBlit.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)lfbBlit.c -o $(OBJ)lfbBlit.o

$(OBJ)lfbConvert.o: $(OBJ)lfbConvert.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)lfbConvert.c -o $(OBJ)lfbConvert.o

$(OBJ)LFBDisplayDriver.o: $(OBJ)LFBDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)LFBDisplayDriver.c -o $(OBJ)LFBDisplayDriver.o

$(OBJ)NCursesDisplayDriver.o: $(OBJ)NCursesDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)NCursesDisplayDriver.c -o $(OBJ)NCursesDisplayDriver.o

$(OBJ)OpenGLDisplayDriver.o: $(OBJ)OpenGLDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)OpenGLDisplayDriver.c -o $(OBJ)OpenGLDisplayDriver.o

$(OBJ)Win32BitmapPrinterDisplayDriver.o: $(OBJ)Win32BitmapPrinterDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32BitmapPrinterDisplayDriver.c -o $(OBJ)Win32BitmapPrinterDisplayDriver.o

$(OBJ)Win32ConsoleDisplayDriver.o: $(OBJ)Win32ConsoleDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32ConsoleDisplayDriver.c -o $(OBJ)Win32ConsoleDisplayDriver.o

$(OBJ)Win32PrinterDisplayDriver.o: $(OBJ)Win32PrinterDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32PrinterDisplayDriver.c -o $(OBJ)Win32PrinterDisplayDriver.o

$(OBJ)XDisplayDriver.o: $(OBJ)XDisplayDriver.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)XDisplayDriver.c -o $(OBJ)XDisplayDriver.o

$(OBJ)Bitmap.o: $(OBJ)Bitmap.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Bitmap.c -o $(OBJ)Bitmap.o

$(OBJ)BitmapResource.o: $(OBJ)BitmapResource.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BitmapResource.c -o $(OBJ)BitmapResource.o

$(OBJ)Color.o: $(OBJ)Color.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Color.c -o $(OBJ)Color.o

$(OBJ)Display.o: $(OBJ)Display.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Display.c -o $(OBJ)Display.o

$(OBJ)DisplaySystem.o: $(OBJ)DisplaySystem.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)DisplaySystem.c -o $(OBJ)DisplaySystem.o

$(OBJ)FontResource.o: $(OBJ)FontResource.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FontResource.c -o $(OBJ)FontResource.o

$(OBJ)Resource.o: $(OBJ)Resource.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Resource.c -o $(OBJ)Resource.o

$(OBJ)Surface.o: $(OBJ)Surface.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Surface.c -o $(OBJ)Surface.o

$(OBJ)Button.o: $(OBJ)Button.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Button.c -o $(OBJ)Button.o

$(OBJ)CalendarControl.o: $(OBJ)CalendarControl.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)CalendarControl.c -o $(OBJ)CalendarControl.o

$(OBJ)DataBox.o: $(OBJ)DataBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)DataBox.c -o $(OBJ)DataBox.o

$(OBJ)DropBox.o: $(OBJ)DropBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)DropBox.c -o $(OBJ)DropBox.o

$(OBJ)EditBox.o: $(OBJ)EditBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)EditBox.c -o $(OBJ)EditBox.o

$(OBJ)Label.o: $(OBJ)Label.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Label.c -o $(OBJ)Label.o

$(OBJ)ListBox.o: $(OBJ)ListBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ListBox.c -o $(OBJ)ListBox.o

$(OBJ)Menu.o: $(OBJ)Menu.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Menu.c -o $(OBJ)Menu.o

$(OBJ)Picture.o: $(OBJ)Picture.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Picture.c -o $(OBJ)Picture.o

$(OBJ)ProgressBar.o: $(OBJ)ProgressBar.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProgressBar.c -o $(OBJ)ProgressBar.o

$(OBJ)ScrollBar.o: $(OBJ)ScrollBar.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ScrollBar.c -o $(OBJ)ScrollBar.o

$(OBJ)StatusBar.o: $(OBJ)StatusBar.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)StatusBar.c -o $(OBJ)StatusBar.o

$(OBJ)TabControl.o: $(OBJ)TabControl.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)TabControl.c -o $(OBJ)TabControl.o

$(OBJ)PaneSplitter.o: $(OBJ)PaneSplitter.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)PaneSplitter.c -o $(OBJ)PaneSplitter.o

$(OBJ)Stacker.o: $(OBJ)Stacker.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Stacker.c -o $(OBJ)Stacker.o

$(OBJ)PathBox.o: $(OBJ)PathBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)PathBox.c -o $(OBJ)PathBox.o

$(OBJ)ColorPicker.o: $(OBJ)ColorPicker.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ColorPicker.c -o $(OBJ)ColorPicker.o

$(OBJ)FileDialog.o: $(OBJ)FileDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FileDialog.c -o $(OBJ)FileDialog.o

$(OBJ)FindDialog.o: $(OBJ)FindDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FindDialog.c -o $(OBJ)FindDialog.o

$(OBJ)GoToDialog.o: $(OBJ)GoToDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GoToDialog.c -o $(OBJ)GoToDialog.o

$(OBJ)MessageBox.o: $(OBJ)MessageBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)MessageBox.c -o $(OBJ)MessageBox.o

$(OBJ)ReplaceDialog.o: $(OBJ)ReplaceDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ReplaceDialog.c -o $(OBJ)ReplaceDialog.o

$(OBJ)WindowList.o: $(OBJ)WindowList.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)WindowList.c -o $(OBJ)WindowList.o

$(OBJ)NCursesInterface.o: $(OBJ)NCursesInterface.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)NCursesInterface.c -o $(OBJ)NCursesInterface.o

$(OBJ)Win32Interface.o: $(OBJ)Win32Interface.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32Interface.c -o $(OBJ)Win32Interface.o

$(OBJ)Win32ConsoleInterface.o: $(OBJ)Win32ConsoleInterface.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Win32ConsoleInterface.c -o $(OBJ)Win32ConsoleInterface.o

$(OBJ)XInterface.o: $(OBJ)XInterface.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)XInterface.c -o $(OBJ)XInterface.o

$(OBJ)TVisionSkin.o: $(OBJ)TVisionSkin.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)TVisionSkin.c -o $(OBJ)TVisionSkin.o

$(OBJ)WindowsSkin.o: $(OBJ)WindowsSkin.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)WindowsSkin.c -o $(OBJ)WindowsSkin.o

$(OBJ)Anchor.o: $(OBJ)Anchor.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Anchor.c -o $(OBJ)Anchor.o

$(OBJ)ClipBoard.o: $(OBJ)ClipBoard.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ClipBoard.c -o $(OBJ)ClipBoard.o

$(OBJ)Cursor.o: $(OBJ)Cursor.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Cursor.c -o $(OBJ)Cursor.o

$(OBJ)Desktop3D.o: $(OBJ)Desktop3D.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Desktop3D.c -o $(OBJ)Desktop3D.o

$(OBJ)FormDesigner.o: $(OBJ)FormDesigner.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FormDesigner.c -o $(OBJ)FormDesigner.o

$(OBJ)GuiApplication.o: $(OBJ)GuiApplication.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GuiApplication.c -o $(OBJ)GuiApplication.o

$(OBJ)Interface.o: $(OBJ)Interface.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Interface.c -o $(OBJ)Interface.o

$(OBJ)Key.o: $(OBJ)Key.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Key.c -o $(OBJ)Key.o

$(OBJ)Skin.o: $(OBJ)Skin.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Skin.c -o $(OBJ)Skin.o

$(OBJ)Timer.o: $(OBJ)Timer.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Timer.c -o $(OBJ)Timer.o

$(OBJ)typeEdit.o: $(OBJ)typeEdit.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)typeEdit.c -o $(OBJ)typeEdit.o

$(OBJ)Window.o: $(OBJ)Window.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Window.c -o $(OBJ)Window.o

$(OBJ)dcom.o: $(OBJ)dcom.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)dcom.c -o $(OBJ)dcom.o

$(OBJ)HTTPFile.o: $(OBJ)HTTPFile.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)HTTPFile.c -o $(OBJ)HTTPFile.o

$(OBJ)network.o: $(OBJ)network.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)network.c -o $(OBJ)network.o

$(OBJ)NetworkClientFile.o: $(OBJ)NetworkClientFile.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)NetworkClientFile.c -o $(OBJ)NetworkClientFile.o

$(OBJ)Service.o: $(OBJ)Service.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Service.c -o $(OBJ)Service.o

$(OBJ)Socket.o: $(OBJ)Socket.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Socket.c -o $(OBJ)Socket.o

$(OBJ)Array.o: $(OBJ)Array.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Array.c -o $(OBJ)Array.o

$(OBJ)AVLTree.o: $(OBJ)AVLTree.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)AVLTree.c -o $(OBJ)AVLTree.o

$(OBJ)BuiltInContainer.o: $(OBJ)BuiltInContainer.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BuiltInContainer.c -o $(OBJ)BuiltInContainer.o

$(OBJ)Container.o: $(OBJ)Container.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Container.c -o $(OBJ)Container.o

$(OBJ)CustomAVLTree.o: $(OBJ)CustomAVLTree.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)CustomAVLTree.c -o $(OBJ)CustomAVLTree.o

$(OBJ)LinkList.o: $(OBJ)LinkList.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)LinkList.c -o $(OBJ)LinkList.o

$(OBJ)List.o: $(OBJ)List.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)List.c -o $(OBJ)List.o

$(OBJ)Map.o: $(OBJ)Map.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Map.c -o $(OBJ)Map.o

$(OBJ)BinaryTree.o: $(OBJ)BinaryTree.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BinaryTree.c -o $(OBJ)BinaryTree.o

$(OBJ)BTNode.o: $(OBJ)BTNode.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BTNode.c -o $(OBJ)BTNode.o

$(OBJ)dataTypes.o: $(OBJ)dataTypes.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)dataTypes.c -o $(OBJ)dataTypes.o

$(OBJ)instance.o: $(OBJ)instance.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)instance.c -o $(OBJ)instance.o

$(OBJ)String.o: $(OBJ)String.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)String.c -o $(OBJ)String.o

$(OBJ)OldList.o: $(OBJ)OldList.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) $(FVISIBILITY) -c $(OBJ)OldList.c -o $(OBJ)OldList.o

$(OBJ)instance.c.o: src/com/instance.c
	$(CC) -DECERE_COM_MODULE $(CFLAGS) -c src/com/instance.c -o $(OBJ)instance.c.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

cleantarget: objdir
	$(call rmq,$(TARGET))

clean: objdir
	$(call rmq,$(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(OBJECTS1))
	$(call rmq,$(OBJECTS2))
	$(call rmq,$(OBJECTS3))
	$(call rmq,$(OBJECTS4))
	$(call rmq,$(COBJECTS1))
	$(call rmq,$(COBJECTS2))
	$(call rmq,$(COBJECTS3))
	$(call rmq,$(IMPORTS1))
	$(call rmq,$(IMPORTS2))
	$(call rmq,$(IMPORTS3))
	$(call rmq,$(SYMBOLS1))
	$(call rmq,$(SYMBOLS2))
	$(call rmq,$(SYMBOLS3))
	$(MAKE) -f Makefile.ecereCOM clean
	$(MAKE) -f Makefile.vanilla clean

realclean:
	$(call rmrq,$(OBJ))
	$(MAKE) -f Makefile.ecereCOM realclean
	$(MAKE) -f Makefile.vanilla realclean

distclean:
	$(call rmrq,obj/)
